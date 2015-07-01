/* Copyright (C) 2015 Gregory Hull <greg.hull@gmail.com> */

/*    This file is part of Sundown-guile, */

/*    Sundown-guile is free software; you can redistribute it and/or modify */
/*    it under the terms of the GNU Lesser General Public License as */
/*    published by the Free Software Foundation; either version 2.1 of */
/*    the License, or (at your option) any later version. */

/*    Sundown-guile is distributed in the hope that it will be useful, */
/*    but WITHOUT ANY WARRANTY; without even the implied warranty of */
/*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the */
/*    GNU Lesser General Public License for more details. */

/*    You should have received a copy of the GNU Lesser General Public */
/*    License along with this program; if not, see <http://www.gnu.org/licenses/> */

#include "markdown.h"
#include "html.h"
#include "buffer.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libguile.h>

#define UNIT 1024

SCM markdown_wrapper(SCM x)
{
  
  struct buf *ib, *ob;
  SCM ret;

  struct sd_callbacks callbacks;
  struct html_renderopt options;
  struct sd_markdown *markdown;

  ib = bufnew(UNIT);
  bufputs(ib, (scm_to_utf8_stringn(x,NULL)));

  /* performing markdown parsing */
  ob = bufnew(UNIT);

  sdhtml_renderer(&callbacks, &options, 0);
  markdown = sd_markdown_new(0, 16, &callbacks, &options);

  sd_markdown_render(ob, ib->data, ib->size, markdown);
  sd_markdown_free(markdown);

  ret = scm_from_utf8_stringn((char *)ob->data, ob->size);
  
  bufrelease(ib);
  bufrelease(ob);

  return ret;
}
  
void init_markdown()
{
  scm_c_define_gsubr ("markdown", 1, 0, 0, markdown_wrapper);
}
