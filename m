Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DDFC77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 17:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6664310E642;
	Fri,  5 May 2023 17:05:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E78410E642
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 17:05:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0093E612A8;
 Fri,  5 May 2023 17:05:27 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 3DE6CC4339B;
 Fri,  5 May 2023 17:05:21 +0000 (UTC)
Date: Fri, 5 May 2023 13:05:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFU3TuMVemulBQrX@rdvivi-mobl4>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-4-lucas.demarchi@intel.com>
 <8fdb51d8-0626-0d03-2080-b978f25cfa3b@intel.com>
 <srdmqn6iwo43zl2m556sqfjqi3dexy3n7hvkitzada2mfurq43@mbeffvffzo36>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <srdmqn6iwo43zl2m556sqfjqi3dexy3n7hvkitzada2mfurq43@mbeffvffzo36>
Subject: Re: [Intel-xe] [PATCH 3/7] drm/xe: Use media base for GMD_ID access
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 01, 2023 at 08:07:28AM -0700, Lucas De Marchi wrote:
> On Sun, Apr 30, 2023 at 07:47:38PM +0200, Michal Wajdeczko wrote:
> > 
> > 
> > On 29.04.2023 08:23, Lucas De Marchi wrote:
> > > Instead of adding a hardcoded base, define GMD_ID() with a base
> > > argument and use it in all places.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 +++-
> > >  drivers/gpu/drm/xe/xe_pci.c          | 9 +++++----
> > >  2 files changed, 8 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index 4d87f1fe010d..da7b6d2c7e01 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -8,6 +8,8 @@
> > > 
> > >  #include "regs/xe_reg_defs.h"
> > > 
> > > +#define MTL_MEDIA_GT_BASE			0x380000
> > 
> > maybe for completeness (and to avoid using anonymous 0 offset in other
> > places) we should define also:
> > 
> > #define GRAPHICS_GT_BASE			0x0
> 
> there are very vew places in the driver that would care about the base.
> Today the base is automatically applied for anything using xe_mmio_,
> just like we have it automatically applied in intel_uncore for i915.
> So, we really don't want to change each register to receive base as
> param.

I'm with Michal here. I had the same thought when reviewing and just read
his comment afterwards. Although it is rarely used it would be good
to avoid later confusion.

> 
> > 
> > > +
> > >  /* RPM unit config (Gen8+) */
> > >  #define RPM_CONFIG0					XE_REG(0xd00)
> > >  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
> > > @@ -21,7 +23,7 @@
> > >  #define FORCEWAKE_ACK_MEDIA_VEBOX(n)		XE_REG(0xd70 + (n) * 4)
> > >  #define FORCEWAKE_ACK_RENDER			XE_REG(0xd84)
> > > 
> > > -#define GMD_ID					XE_REG(0xd8c)
> > > +#define GMD_ID(base)				XE_REG((base) + 0xd8c)
> > 
> > this register is not the only one that's has it's counterpart at this
> > 0x38000 MEDIA offset, and other registers we are treating in automatic
> > way, without the need to explicitly pass the 'base', so I'm not sure we
> > should change that here
> 
> becaues in the other cases the base is applied by xe_mmio
> 
> > 
> > >  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> > >  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> > >  #define   GMD_ID_STEP				REG_GENMASK(5, 0)
> > 
> > btw, is there a plan to s/REG_GENMASK/XE_REG_GENMASK or something ?
> 
> no. My plan is to eventually submit a patch to have
> GENMASK_U32 and use it throughout the driver

good idea!

> 
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 35dcb8781f2a..8687e51cb0a4 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -276,7 +276,7 @@ static const struct xe_gt_desc xelpmp_gts[] = {
> > >  		.type = XE_GT_TYPE_MEDIA,
> > >  		.vram_id = 0,
> > >  		.mmio_adj_limit = 0x40000,
> > > -		.mmio_adj_offset = 0x380000,
> > > +		.mmio_adj_offset = MTL_MEDIA_GT_BASE,
> > >  	},
> > >  };
> > > 
> > > @@ -391,8 +391,9 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
> > >  	return NULL;
> > >  }
> > > 
> > > -static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
> > > +static u32 peek_gmdid(struct xe_device *xe, struct xe_reg gmdid_reg)
> > 
> > better to keep u32 but defined as new 'base' for the GMD_ID:
> > 
> > peek_gmdid(xe, GRAPHICS_GT_BASE)
> > peek_gmdid(xe, MTL_MEDIA_GT_BASE)
> > 
> > then since we parse the value according to the GMDID definition we will
> > prevent passing wrong register offset and always refer to the right
> > GMD_ID address inside the function:
> > 
> > static u32 peek_gmdid(struct xe_device *xe, u32 base)
> > {
> > 	xe_reg gmdid = XE_REG(GMD_ID.addr + base);
> 
> we try to minimize those calculations outside the header.
> I don't see a benefit of passing the base here over passing the register
> to be used.
> 
> Lucas De Marchi
> 
> > ...
> > 	WARN_ON(base != GRAPHICS_GT_BASE && base != MTL_MEDIA_GT_BASE);
> > ...
> >  	map = pci_iomap_range(pdev, 0, gmdid.addr, sizeof(u32));
> > ...
> > 	REG_FIELD_GET(GMD_ID_ARCH_MASK, value)
> > 
> > 
> > Michal
> > 
> > >  {
> > > +	u32 gmdid_offset = gmdid_reg.reg;
> > >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > >  	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
> > >  	u32 ver;
> > > @@ -441,7 +442,7 @@ static void handle_gmdid(struct xe_device *xe,
> > >  {
> > >  	u32 ver;
> > > 
> > > -	ver = peek_gmdid(xe, GMD_ID.reg);
> > > +	ver = peek_gmdid(xe, GMD_ID(0));
> > >  	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
> > >  		if (ver == graphics_ip_map[i].ver) {
> > >  			xe->info.graphics_verx100 = ver;
> > > @@ -456,7 +457,7 @@ static void handle_gmdid(struct xe_device *xe,
> > >  			ver / 100, ver % 100);
> > >  	}
> > > 
> > > -	ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
> > > +	ver = peek_gmdid(xe, GMD_ID(MTL_MEDIA_GT_BASE));
> > >  	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
> > >  		if (ver == media_ip_map[i].ver) {
> > >  			xe->info.media_verx100 = ver;
