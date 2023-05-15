Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA464C77B7D
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 21:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7B710E27E;
	Mon, 15 May 2023 21:09:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB6110E27E
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 21:09:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A0F8A60BCB;
 Mon, 15 May 2023 21:09:52 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 4F209C433D2;
 Mon, 15 May 2023 21:09:50 +0000 (UTC)
Date: Mon, 15 May 2023 17:09:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZGKfm0E9fdSiu9AO@rdvivi-mobl4>
References: <20230515151548.13-1-francois.dugast@intel.com>
 <42fhof5tw3wujmyf6lt7k6met56n4u24mh7eh2g5cgfan6o3js@7covwvvx33un>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42fhof5tw3wujmyf6lt7k6met56n4u24mh7eh2g5cgfan6o3js@7covwvvx33un>
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: Dugast@freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 08:32:23AM -0700, Lucas De Marchi wrote:
> On Mon, May 15, 2023 at 03:15:48PM +0000, Francois Dugast wrote:
> > From: "Dugast, Francois" <francois.dugast@intel.com>
> > 
> > The driver contains code under GPL v2 license and code under MIT license.
> 
> that is the wrong reason for dual license
> 
> > 
> > Link: https://www.kernel.org/doc/html/latest/process/license-rules.html
> > Cc: Oded Gabbay <ogabbay@kernel.org>
> > Signed-off-by: Dugast, Francois <francois.dugast@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_module.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index 6860586ce7f8..ae37c229a0b7 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -79,4 +79,4 @@ module_exit(xe_exit);
> > MODULE_AUTHOR("Intel Corporation");
> > 
> > MODULE_DESCRIPTION(DRIVER_DESC);
> > -MODULE_LICENSE("GPL and additional rights");
> > +MODULE_LICENSE("Dual MIT/GPL");
> 
> The module itself is GPL, like i915:
> 
> $ git grep MODULE_LICENSE -- drivers/gpu/drm/i915/
> drivers/gpu/drm/i915/gvt/kvmgt.c:MODULE_LICENSE("GPL and additional rights");
> drivers/gpu/drm/i915/i915_module.c:MODULE_LICENSE("GPL and additional rights");
> 
> GPL can include source files licensed as MIT, but the final license of
> the module is still GPL, not dual license. Same thing as from the link
> you provided...
> 
> 	The license described in the COPYING file applies to the kernel
> 	source as a whole, though individual source files can have a
> 	different license which is required to be compatible with the
> 	GPL-2.0
> 
> ... but applied to the module rather than the whole kernel.
> 
> The inverse is not true. You can't license the whole (module) as MIT
> since it also contains GPL-licensed files. We could if all the files were
> dual-licensed, which is not the case. Since several parts of xe is based
> on i915, it'd be a very grey area and license tracking nightmare.
> 
> With that, the disclaimer IANAL applies.

Yeap, but according "Documentation/process/license-rules.rst"
they are absolutely the same.

"GPL and additional rights"
or
"Dual MIT/GPL"

with the ask to not use the first one on new code but prefer the
second one.

So,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Lucas De Marchi
> 
> > -- 
> > 2.34.1
> > 
