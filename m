Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9662CEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 13:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D9210E4DF;
	Thu, 15 Jun 2023 13:04:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEE810E4DF
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 13:04:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B05CE60C8F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 13:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2076EC433C0
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 13:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686834286;
 bh=qA3HxDXjQtNgEc/60avs6p6wqT1s5eNNJAgqQrUSPUg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DNHZ0NnPGei+eLCnVNc9ErarLj0F8bq1oKV/qT3MDDceJ95Ttzx+lqUrnfvQKYi2B
 L6/piWpJqn+CIKEI4SdqlNi2MocnDgcJlL6/cM6bRwSIyvcmkd54TLz9B3G/SH4vIW
 EFgBtlJfo3u429aTe0fMfKGaMZkc+l7Z5C5Ohp5DAGjckeDA03zd7FttBobLsbTJH8
 MNnIC+nGU0dfrzgrGmKZVLVWumhA9B0nyt4JvD/iZAEEnxNfkVwenWoM1Y8r2yPenT
 GiDPhsVeWlHtxHzJL6KjZNDJYr7/fhzUkiGu4Jzfz24xQRpXAiTdiPw/vI6MjYhId1
 xvevgzlmtwwTw==
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-bb2ffa1e235so1640036276.0
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 06:04:46 -0700 (PDT)
X-Gm-Message-State: AC+VfDy9x6bZbvecVz6zEcXZ+sv0OraN1XsEAlqXcrg6UqUz3AjG2mp0
 6S5HvP6WsqgwV4eN4o2xQCcqUZxJVTYPZ5hdado=
X-Google-Smtp-Source: ACHHUZ6noVtBXLDF65wbJ5VGBIj5vDFJNTu8L1sioYzzrqFExPeJzeNyKp4If+lMTCuR5+soaSVRL1VCKqhs6FGQdz8=
X-Received: by 2002:a25:d0d2:0:b0:bc6:c22f:581a with SMTP id
 h201-20020a25d0d2000000b00bc6c22f581amr4592618ybg.38.1686834285150; Thu, 15
 Jun 2023 06:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230602142501.6-1-francois.dugast@intel.com>
 <20230602142501.6-2-francois.dugast@intel.com>
 <qcsuilqdccvku4qoa36a5m3mhdr75akwpba77oisjk6e4kvkrm@6u5tr3dfmf5v>
 <ZIdIfdiClQ60fZSI@fdugast-desk.home>
 <20230615000105.GU5433@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230615000105.GU5433@mdroper-desk1.amr.corp.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 15 Jun 2023 16:04:18 +0300
X-Gmail-Original-Message-ID: <CAFCwf10Td52xyKN9U903-GzS8V_T6sJ8t9ppLiXCNLzHGHzLEQ@mail.gmail.com>
Message-ID: <CAFCwf10Td52xyKN9U903-GzS8V_T6sJ8t9ppLiXCNLzHGHzLEQ@mail.gmail.com>
To: Matt Roper <matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe: Introduce function pointers
 for MMIO functions
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
Cc: ofir1.bitton@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, ohadshar@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 3:01=E2=80=AFAM Matt Roper <matthew.d.roper@intel.c=
om> wrote:
>
> On Mon, Jun 12, 2023 at 06:31:57PM +0200, Francois Dugast wrote:
> > On Thu, Jun 08, 2023 at 10:35:29AM -0700, Lucas De Marchi wrote:
> > > On Fri, Jun 02, 2023 at 02:25:01PM +0000, Francois Dugast wrote:
> > > > A local structure of function pointers is used as a minimal hardwar=
e
> > > > abstraction layer to prepare for platform independent MMIO calls.
> > > >
> > > > Cc: Oded Gabbay <ogabbay@kernel.org>
> > > > Cc: Ofir Bitton <ofir1.bitton@intel.com>
> > > > Cc: Ohad Sharabi <ohadshar@intel.com>
> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_device_types.h |  3 ++
> > > > drivers/gpu/drm/xe/xe_mmio.c         | 81 +++++++++++++++++++++++++=
+++
> > > > drivers/gpu/drm/xe/xe_mmio.h         | 35 ++++++------
> > > > 3 files changed, 99 insertions(+), 20 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm=
/xe/xe_device_types.h
> > > > index 17b6b1cc5adb..3f8fd0d8129b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -378,6 +378,9 @@ struct xe_device {
> > > >   /** @d3cold_allowed: Indicates if d3cold is a valid device state =
*/
> > > >   bool d3cold_allowed;
> > > >
> > > > + /** @mmio_funcs: function pointers for MMIO related functions */
> > > > + const struct xe_mmio_funcs *mmio_funcs;
> > > > +
> > > >   /* private: */
> > > >
> > > > #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_m=
mio.c
> > > > index 475b14fe4356..f3d08676a77a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > @@ -25,6 +25,62 @@
> > > >
> > > > #define BAR_SIZE_SHIFT 20
> > > >
> > > > +static void xe_mmio_write32_device(struct xe_gt *gt,
> > > > +                            struct xe_reg reg, u32 val);
> > > > +static u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg r=
eg);
> > > > +static void xe_mmio_write64_device(struct xe_gt *gt,
> > > > +                            struct xe_reg reg, u64 val);
> > > > +static u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg r=
eg);
> > > > +
> > > > +static const struct xe_mmio_funcs xe_mmio_funcs_device =3D {
> > > > + .write32 =3D xe_mmio_write32_device,
> > > > + .read32 =3D xe_mmio_read32_device,
> > > > + .write64 =3D xe_mmio_write64_device,
> > > > + .read64 =3D xe_mmio_read64_device,
> > > > +};
> > > > +
> > > > +static inline void xe_mmio_write32_device(struct xe_gt *gt,
> > > > +                            struct xe_reg reg, u32 val)
> > > > +{
> > > > + struct xe_tile *tile =3D gt_to_tile(gt);
> > > > +
> > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > +         reg.addr +=3D gt->mmio.adj_offset;
> > > > +
> > > > + writel(val, tile->mmio.regs + reg.addr);
> > > > +}
> > > > +
> > > > +static inline u32 xe_mmio_read32_device(struct xe_gt *gt, struct x=
e_reg reg)
> > > > +{
> > > > + struct xe_tile *tile =3D gt_to_tile(gt);
> > > > +
> > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > +         reg.addr +=3D gt->mmio.adj_offset;
> > > > +
> > > > + return readl(tile->mmio.regs + reg.addr);
> > > > +}
> > > > +
> > > > +static inline void xe_mmio_write64_device(struct xe_gt *gt,
> > > > +                            struct xe_reg reg, u64 val)
> > > > +{
> > > > + struct xe_tile *tile =3D gt_to_tile(gt);
> > > > +
> > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > +         reg.addr +=3D gt->mmio.adj_offset;
> > > > +
> > > > + writeq(val, tile->mmio.regs + reg.addr);
> > > > +}
> > > > +
> > > > +static inline u64 xe_mmio_read64_device(struct xe_gt *gt, struct x=
e_reg reg)
> > > > +{
> > > > + struct xe_tile *tile =3D gt_to_tile(gt);
> > > > +
> > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > +         reg.addr +=3D gt->mmio.adj_offset;
> > > > +
> > > > + return readq(tile->mmio.regs + reg.addr);
> > > > +}
> > > > +
> > > > static int xe_set_dma_info(struct xe_device *xe)
> > > > {
> > > >   unsigned int mask_size =3D xe->info.dma_mask_size;
> > > > @@ -377,6 +433,29 @@ static void mmio_fini(struct drm_device *drm, =
void *arg)
> > > >           iounmap(xe->mem.vram.mapping);
> > > > }
> > > >
> > > > +static void xe_mmio_set_funcs(struct xe_device *xe)
> > > > +{
> > > > + /* For now all platforms use the set of MMIO functions for a
> > > > +  * physical device.
> > > > +  */
> > >
> > >
> > > what is "device" in this context? that seems confusing as we always e=
ver
> > > just support reading/writing to a real device (physical here may also
> > > add to the confusion when thinking about SR-IOV and VFs).
> > > We shouldn't add abstractions that are then never used and all platfo=
rms
> > > end up using the same. Unless it's a preparation for a follow up seri=
es
> > > adding the different handling.
> >
> > For now "device" is meant as "in opposition to simulator" but I agree
> > we can find a better name. Existing platforms all use the same
> > implementation but this is preparation for platforms that require a
> > different implementation.
>
> I agree with Lucas that this doesn't really seem to be a good candidate
> for a vtable; every platform uses exactly the same logic and I can't
> really envision how/why this would need to change for future platforms
> either, so this seems to just be adding unnecessary complexity.
> Registers being accessed at some offset into a PCI BAR isn't likely to
> change going forward.  On future platforms it's more likely that we'd
> need changes to the part of the code that maps the MMIO BAR rather than
> the code that reads/writes an offset into a mapping that's already been
> setup.
I agree with that for every *real hardware* platform the
implementation will probably be the same.
But for simulator/emulation, there is a different implementation.
And even if we don't upstream that different implementation, doing
this abstraction will help us upstream the rest of the driver as we
minimize the differences between upstream and downstream.
And helping us upstream the driver is a good enough reason imo to add
this abstraction.


Oded
>
> >
> > >
> > > +Matt as there is still (at least) one refactor planned in this area,
> > > since gt is not always the proper target for the MMIOs. He was saying=
 in
> > > his earlier series about having a mmio_view or such to abstract the
> > > offset and other differences between each IO range. Not sure if this
> > > series would go the rigth direction, maybe we need to think in both
> > > cases together.
> >
> > Matt, would this series block the refactor mentioned by Lucas?
> >
> > In general, are there objections to introducing functions pointers for
> > MMIO functions (extended to all of them, as suggested by Ohad)?
>
> It probably makes more sense to do vtable conversion on other parts of
> the driver where we already have different implementations per platform
> and where we already know that design makes sense.  We can always come
> back and do this to the MMIO functions later once there are actually
> multiple implementations, but it doesn't seem to serve any purpose right
> now.
>
>
> Matt
>
> >
> > Thanks,
> > Francois
> >
> > >
> > >
> > > Lucas De Marchi
> > >
> > > > + switch (xe->info.platform) {
> > > > + case XE_TIGERLAKE:
> > > > + case XE_ROCKETLAKE:
> > > > + case XE_ALDERLAKE_S:
> > > > + case XE_ALDERLAKE_P:
> > > > + case XE_ALDERLAKE_N:
> > > > + case XE_DG1:
> > > > + case XE_DG2:
> > > > + case XE_PVC:
> > > > + case XE_METEORLAKE:
> > > > +         xe->mmio_funcs =3D &xe_mmio_funcs_device;
> > > > +         break;
> > > > + default:
> > > > +         DRM_ERROR("Unsupported platform\n");
> > > > +         break;
> > > > + }
> > > > +}
> > > > +
> > > > int xe_mmio_init(struct xe_device *xe)
> > > > {
> > > >   struct xe_tile *root_tile =3D xe_device_get_root_tile(xe);
> > > > @@ -384,6 +463,8 @@ int xe_mmio_init(struct xe_device *xe)
> > > >   const int mmio_bar =3D 0;
> > > >   int err;
> > > >
> > > > + xe_mmio_set_funcs(xe);
> > > > +
> > > >   /*
> > > >    * Map the first 16MB of th BAR, which includes the registers (0-=
4MB),
> > > >    * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single til=
e.
> > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_m=
mio.h
> > > > index 3c547d78afba..80ce9de7aac4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > > > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > > > @@ -19,6 +19,13 @@ struct xe_device;
> > > >
> > > > #define GEN12_LMEM_BAR            2
> > > >
> > > > +struct xe_mmio_funcs {
> > > > + u32 (*read32)(struct xe_gt *gt, struct xe_reg reg);
> > > > + u64 (*read64)(struct xe_gt *gt, struct xe_reg reg);
> > > > + void (*write32)(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > > > + void (*write64)(struct xe_gt *gt, struct xe_reg reg, u64 val);
> > > > +};
> > > > +
> > > > int xe_mmio_init(struct xe_device *xe);
> > > >
> > > > static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > > > @@ -34,22 +41,16 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt=
, struct xe_reg reg)
> > > > static inline void xe_mmio_write32(struct xe_gt *gt,
> > > >                              struct xe_reg reg, u32 val)
> > > > {
> > > > - struct xe_tile *tile =3D gt_to_tile(gt);
> > > > -
> > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > -         reg.addr +=3D gt->mmio.adj_offset;
> > > > + struct xe_device *xe =3D gt_to_xe(gt);
> > > >
> > > > - writel(val, tile->mmio.regs + reg.addr);
> > > > + xe->mmio_funcs->write32(gt, reg, val);
> > > > }
> > > >
> > > > static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg re=
g)
> > > > {
> > > > - struct xe_tile *tile =3D gt_to_tile(gt);
> > > > -
> > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > -         reg.addr +=3D gt->mmio.adj_offset;
> > > > + struct xe_device *xe =3D gt_to_xe(gt);
> > > >
> > > > - return readl(tile->mmio.regs + reg.addr);
> > > > + return xe->mmio_funcs->read32(gt, reg);
> > > > }
> > > >
> > > > static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg=
, u32 clr,
> > > > @@ -67,22 +68,16 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *g=
t, struct xe_reg reg, u32 clr,
> > > > static inline void xe_mmio_write64(struct xe_gt *gt,
> > > >                              struct xe_reg reg, u64 val)
> > > > {
> > > > - struct xe_tile *tile =3D gt_to_tile(gt);
> > > > -
> > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > -         reg.addr +=3D gt->mmio.adj_offset;
> > > > + struct xe_device *xe =3D gt_to_xe(gt);
> > > >
> > > > - writeq(val, tile->mmio.regs + reg.addr);
> > > > + xe->mmio_funcs->write64(gt, reg, val);
> > > > }
> > > >
> > > > static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg re=
g)
> > > > {
> > > > - struct xe_tile *tile =3D gt_to_tile(gt);
> > > > -
> > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > -         reg.addr +=3D gt->mmio.adj_offset;
> > > > + struct xe_device *xe =3D gt_to_xe(gt);
> > > >
> > > > - return readq(tile->mmio.regs + reg.addr);
> > > > + return xe->mmio_funcs->read64(gt, reg);
> > > > }
> > > >
> > > > static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
> > > > --
> > > > 2.34.1
> > > >
>
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
