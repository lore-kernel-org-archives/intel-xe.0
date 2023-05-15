Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67895C77B7D
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 14:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1BD10E216;
	Mon, 15 May 2023 14:43:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D0810E216
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 14:43:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D52C61E92;
 Mon, 15 May 2023 14:43:23 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 48C66C4339E;
 Mon, 15 May 2023 14:43:21 +0000 (UTC)
Date: Mon, 15 May 2023 10:43:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZGJFB8V/jf87eqzq@rdvivi-mobl4>
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
 <20230512180313.1765011-6-rodrigo.vivi@intel.com>
 <kogwn7anb5kflqjizp3ncaop7z3dcklcbfnyhina2ylqzcidb7@ccqvfvavu4rq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kogwn7anb5kflqjizp3ncaop7z3dcklcbfnyhina2ylqzcidb7@ccqvfvavu4rq>
Subject: Re: [Intel-xe] [PATCH 5/7] fixup! drm/xe: Cleanup page-related
 defines
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 06:15:27AM -0700, Lucas De Marchi wrote:
> On Fri, May 12, 2023 at 02:03:11PM -0400, Rodrigo Vivi wrote:
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/i915/display/intel_fbdev.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> > index d89edd98e5d7..6362c4ce15b6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> > +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> > @@ -179,7 +179,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
> > 				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
> > #else
> > 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
> > -				    DIV_ROUND_UP(sizes->surface_bpp, 8), GEN8_PAGE_SIZE);
> > +				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
> 
> Same issue as in patch 3: it fixes it now, but it will be broken on
> rebase. If display is above b3b102692dcd ("drm/xe: Cleanup page-related defines")m
> this change here should not exist...

Yeap, I wondered about that... but ideally when that happens we fix the patches
in place again, otherwise we cannot run automated git rebase -x make
while we don't move display up... :(

> 
> Lucas De Marchi
> 
> > #endif
> > 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
> > 							  sizes->surface_depth);
> > @@ -363,7 +363,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
> > 		else
> > 			info->fix.smem_start =
> > 				pci_resource_start(pdev, 2) +
> > -				xe_bo_addr(obj, 0, GEN8_PAGE_SIZE, &lmem);
> > +				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
> > 
> > 		info->fix.smem_len = obj->ttm.base.size;
> > 	} else {
> > -- 
> > 2.39.2
> > 
