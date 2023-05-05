Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AD4C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 20:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E9910E674;
	Fri,  5 May 2023 20:41:02 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DF510E674
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 20:40:59 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so18349742e87.1
 for <intel-xe@lists.freedesktop.org>; Fri, 05 May 2023 13:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683319258; x=1685911258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhQKMYotRC8/O9cO/7H187WKWz/9R5BHtHHPvSR8xaI=;
 b=czVzHeuu91Gcvkoq1a0AFz5LQ0OuRFZ5aXWB7pnTTxUaPT7hT4GjumwRTZ55PW5zQU
 UYVfi7tC8JL/axJgRjwuDK+vlV8R6kQOPQ/2DE2iNRlbOgbCOz0HbX0tyfqZTp5dbHh5
 MZkVJJxpywnxhU4FI1DDJZBjCIUePPFsxhQhVHI+dRJ1amKiYHDgsgC3Kj8E+05Kh3OF
 adNAnTWIKKI4jqyHurBRFqV7UhPzV4VGAOOC93FpO/TjpXwykVDOdm4h3GJWtOVFPOEV
 iliCXJu3kNJLtpv1maoARLFoUeBFFdjQh1gpFQBoXjZFDAMHUSpzdtkHXYcqz7n7WO+a
 KhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683319258; x=1685911258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhQKMYotRC8/O9cO/7H187WKWz/9R5BHtHHPvSR8xaI=;
 b=Z6SBgUjj5SpoYwPAIxUISPQfkWqYkn0PIbKhI8w5DKfhFCzTwxFoX9yDezdH9zd6MM
 94j88BgVvFBLoxV5IM2R+7ahKuKRRWl5hBSiDeNNMVolYnNUbd6ZExs5AvVcUCiuW+sw
 2UByAc8KRteN7TI6BT9y7QyJkl0ti1mOfhEHor09P6xpIVAMklAbmpx0XXSM7tvMocyO
 vP6YTEL7gfbwap/5ZGBg4g5pcoFuOtJCxS1ZOAEPQY0swmCY0dpZ+ZPSIi9YnUzRXkOu
 YRPYof+zZ+hcnRA4dP1O8t7YbqzwwD+s8ElCaUrX1ShfvmVH828dGxruA3fNDX9L6z22
 kv0g==
X-Gm-Message-State: AC+VfDx404hGZPffQ+SwjlI9bqqXWZFDtNuh+Ljj2PsukRMbel9/551d
 xjssMdmtxRdipQlsJ5YlSEmHrGIbbV5NY+Meh3hXlO85Myg=
X-Google-Smtp-Source: ACHHUZ4LrAvwWUag9LknJArsyUe3lijJJrJ9zg88Dlr6efVoLcM6P9k+R77rLWNKwqGeWo6LGfqrlKtixYoh2OxdUCo=
X-Received: by 2002:ac2:554a:0:b0:4f0:13e3:a291 with SMTP id
 l10-20020ac2554a000000b004f013e3a291mr781841lfk.28.1683319257430; Fri, 05 May
 2023 13:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230504205250.3898282-1-michael.j.ruhl@intel.com>
 <20230504205250.3898282-3-michael.j.ruhl@intel.com>
 <fa8a800c-2db5-f87d-dae8-879c580c831b@intel.com>
 <DM5PR11MB1324261720D85804F7D28FAEC1729@DM5PR11MB1324.namprd11.prod.outlook.com>
In-Reply-To: <DM5PR11MB1324261720D85804F7D28FAEC1729@DM5PR11MB1324.namprd11.prod.outlook.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 5 May 2023 21:40:29 +0100
Message-ID: <CAM0jSHNw3Q7g5VkpC2Xf1f0WRr8tfGqhFm5DTC04dqssX4SsgQ@mail.gmail.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Simplify rebar sizing
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
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 5 May 2023 at 20:59, Ruhl, Michael J <michael.j.ruhl@intel.com> wro=
te:
>
> >-----Original Message-----
> >From: Auld, Matthew <matthew.auld@intel.com>
> >Sent: Friday, May 5, 2023 6:36 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-
> >xe@lists.freedesktop.org
> >Cc: Brost, Matthew <matthew.brost@intel.com>; Kershner, David
> ><david.kershner@intel.com>; Ghimiray, Himal Prasad
> ><himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
> ><tejas.upadhyay@intel.com>
> >Subject: Re: [PATCH 2/4] drm/xe: Simplify rebar sizing
> >
> >On 04/05/2023 21:52, Michael J. Ruhl wrote:
> >> "Right sizing" the PCI BAR is not necessary.  If rebar is needed
> >> size to the maximum available.
> >>
> >> Preserve the force_vram_bar_size sizing.
> >>
> >> Update associated code for consistency.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>   drivers/gpu/drm/xe/xe_device_types.h |  14 +--
> >>   drivers/gpu/drm/xe/xe_migrate.c      |   2 +-
> >>   drivers/gpu/drm/xe/xe_mmio.c         | 139 +++++++++++++++----------=
--
> >>   3 files changed, 88 insertions(+), 67 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> >b/drivers/gpu/drm/xe/xe_device_types.h
> >> index 1cb404e48aaa..2eeb10e97381 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -193,15 +193,15 @@ struct xe_device {
> >>                      /**
> >>                       * @io_size: IO size of VRAM.
> >>                       *
> >> -                     * This represents how much of VRAM we can access
> >via
> >> -                     * the CPU through the VRAM BAR. This can be smal=
ler
> >> -                     * than @size, in which case only part of VRAM is=
 CPU
> >> -                     * accessible (typically the first 256M). This
> >> -                     * configuration is known as small-bar.
> >> +                     * This represents how much of VRAM the CPU can
> >access
> >> +                     * via the VRAM BAR.
> >> +                     * On systems that do not support large BAR IO sp=
ace,
> >> +                     * this can be smaller than the actual memory siz=
e, in
> >> +                     * which case only part of VRAM is CPU accessible
> >> +                     * (typically the first 256M).  This configuratio=
n is
> >> +                     * known as small-bar.
> >>                       */
> >>                      resource_size_t io_size;
> >> -                    /** @size: Total size of VRAM */
> >> -                    resource_size_t size;
> >>                      /** @mapping: pointer to VRAM mappable space */
> >>                      void *__iomem mapping;
> >>              } vram;
> >> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> >b/drivers/gpu/drm/xe/xe_migrate.c
> >> index f40f47ccb76f..a1d507db0098 100644
> >> --- a/drivers/gpu/drm/xe/xe_migrate.c
> >> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> >> @@ -270,7 +270,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt,
> >struct xe_migrate *m,
> >>               * Use 1GB pages, it shouldn't matter the physical amount=
 of
> >>               * vram is less, when we don't access it.
> >>               */
> >> -            for (pos =3D 0; pos < xe->mem.vram.size; pos +=3D SZ_1G, =
ofs +=3D
> >8)
> >> +            for (pos =3D 0; pos < xe->mem.vram.io_size; pos +=3D SZ_1=
G, ofs
> >+=3D 8)
> >
> >Can we somehow keep this as the total amount of GPU addressable VRAM?
> >Just realised with small-bar this would need to be changed again.
> >Otherwise I think looks good.
>
> Matt,
>
> For this patch (because of the min() usage, this is the total amount of a=
ddressable
> VRAM (.size was eliminated).  So I think that this is doing what you want=
.
>
> However, for the next patch, this value will expand to the total IO space=
 for all tiles.

With small-bar we will eventually (once that code lands) end up with
256M io_size, but then the VRAM size will be say 16G. And here we want
to map the whole 16G.

>
> This code will "map" the whole space, gaps included (stolen, GTT space et=
c).
>
> So if we need to map only the available VRAM for both tiles, we would nee=
d
> to probably do this on a GT level up to the GSMBASE "size" with something=
 like this:
>
>         for_each_gt() {
>                 for pos =3D gt->vram.base; pos < gt->vram.io_size + gt->v=
ram.base;
>                  ...
>         }
>
> Does this make sense?

Yeah, the gaps are fine I think, even the stolen portion since we
never actually touch it, so it's fine to map it.  We could maybe just
keep the xe->mem.vram.size which just gets the total_size from patch
2.

>
> I am not clear on what this mapping is for.  Can you explain a bit?

I think it's just the usual trick to 1:1 map all of VRAM to matching
addresses in some special ppGTT. Like say we have VRAM
phys_addr=3D0x100000 we would then also have gtt_addr=3D0x100000, which
maps the same VRAM address in the PTE. We do that for all VRAM and for
every tile, and since we use 1G GTT entries we can do that very
cheaply. The idea is that we can now access any part of VRAM using the
GPU, and can trivially get the GTT address, without needing to worry
about dynamically allocating and binding any page-tables on the fly,
which is useful when clearing, copying/evicting, writing page-tables
etc. Also since the addresses we touch here must belong to an object,
we can be sure they never touch anything out of bounds, like stolen
etc, which is important since we map all of VRAM, and not just the
usable portion.


>
> Thoughts?
>
> m
>
>
> >
> >>                      xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> >>      }
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> >b/drivers/gpu/drm/xe/xe_mmio.c
> >> index bc6835d67352..8ec044473886 100644
> >> --- a/drivers/gpu/drm/xe/xe_mmio.c
> >> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> >> @@ -1,8 +1,10 @@
> >>   // SPDX-License-Identifier: MIT
> >>   /*
> >> - * Copyright =C2=A9 2021 Intel Corporation
> >> + * Copyright =C2=A9 2021-2023 Intel Corporation
> >>    */
> >>
> >> +#include <linux/minmax.h>
> >> +
> >>   #include "xe_mmio.h"
> >>
> >>   #include <drm/drm_managed.h>
> >> @@ -20,6 +22,8 @@
> >>   #define XEHP_MTCFG_ADDR            XE_REG(0x101800)
> >>   #define TILE_COUNT         REG_GENMASK(15, 8)
> >>
> >> +#define BAR_SIZE_SHIFT 20
> >> +
> >>   static int xe_set_dma_info(struct xe_device *xe)
> >>   {
> >>      unsigned int mask_size =3D xe->info.dma_mask_size;
> >> @@ -60,50 +64,65 @@ _resize_bar(struct xe_device *xe, int resno,
> >resource_size_t size)
> >>      if (ret) {
> >>              drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe).
> >Consider enabling 'Resizable BAR' support in your BIOS\n",
> >>                       resno, 1 << bar_size, ERR_PTR(ret));
> >> -            return -1;
> >> +            return ret;
> >>      }
> >>
> >>      drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 <<
> >bar_size);
> >> -    return 1;
> >> +    return ret;
> >>   }
> >>
> >> -static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t
> >vram_size)
> >> +/*
> >> + * if force_vram_bar_size is set, attempt to set to the requested siz=
e
> >> + * else set to maximum possible size
> >> + */
> >> +static int xe_resize_vram_bar(struct xe_device *xe)
> >>   {
> >> +    u64 force_vram_bar_size =3D xe_force_vram_bar_size;
> >>      struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> >>      struct pci_bus *root =3D pdev->bus;
> >> -    struct resource *root_res;
> >> -    resource_size_t rebar_size;
> >>      resource_size_t current_size;
> >> +    resource_size_t rebar_size;
> >> +    struct resource *root_res;
> >> +    u32 bar_size_mask;
> >>      u32 pci_cmd;
> >>      int i;
> >>      int ret;
> >> -    u64 force_vram_bar_size =3D xe_force_vram_bar_size;
> >>
> >> -    current_size =3D roundup_pow_of_two(pci_resource_len(pdev,
> >GEN12_LMEM_BAR));
> >> +    /* gather some relevant info */
> >> +    current_size =3D pci_resource_len(pdev, GEN12_LMEM_BAR);
> >> +    bar_size_mask =3D pci_rebar_get_possible_sizes(pdev,
> >GEN12_LMEM_BAR);
> >>
> >> +    if (!bar_size_mask)
> >> +            return 0;
> >> +
> >> +    /* set to a specific size? */
> >>      if (force_vram_bar_size) {
> >> -            u32 bar_sizes;
> >> +            u32 bar_size_bit;
> >>
> >>              rebar_size =3D force_vram_bar_size * (resource_size_t)SZ_=
1M;
> >> -            bar_sizes =3D pci_rebar_get_possible_sizes(pdev,
> >GEN12_LMEM_BAR);
> >>
> >> -            if (rebar_size =3D=3D current_size)
> >> -                    return 0;
> >> +            bar_size_bit =3D bar_size_mask &
> >BIT(pci_rebar_bytes_to_size(rebar_size));
> >>
> >> -            if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size)=
)) ||
> >> -                rebar_size >=3D roundup_pow_of_two(vram_size)) {
> >> -                    rebar_size =3D vram_size;
> >> +            if (!bar_size_bit) {
> >>                      drm_info(&xe->drm,
> >> -                             "Given bar size is not within supported =
size,
> >setting it to default: %lluMiB\n",
> >> -                             (u64)vram_size >> 20);
> >> +                             "Requested size: 0x%llx is not supported=
 by
> >rebar sizes: 0x%x. Leaving default: 0x%llx\n",
> >> +                             (u64)rebar_size >> 2, bar_size_mask,
> >(u64)current_size >> 20);
> >> +                    return 0;
> >>              }
> >> +
> >> +            rebar_size =3D 1ULL << (bar_size_bit + BAR_SIZE_SHIFT);
> >> +
> >> +            if (rebar_size =3D=3D current_size)
> >> +                    return 0;
> >>      } else {
> >> -            rebar_size =3D current_size;
> >> +            rebar_size =3D 1ULL << (__fls(bar_size_mask) +
> >BAR_SIZE_SHIFT);
> >>
> >> -            if (rebar_size !=3D roundup_pow_of_two(vram_size))
> >> -                    rebar_size =3D vram_size;
> >> -            else
> >> +            /* only resize if larger than current */
> >> +            if (rebar_size <=3D current_size) {
> >> +                    drm_info(&xe->drm, "Rebar size: 0x%llx vs. actual
> >size: 0x%llx\n",
> >> +                             rebar_size, current_size);
> >>                      return 0;
> >> +            }
> >>      }
> >>
> >>      drm_info(&xe->drm, "Resizing bar from %lluMiB -> %lluMiB\n",
> >> @@ -147,6 +166,31 @@ static bool xe_pci_resource_valid(struct pci_dev
> >*pdev, int bar)
> >>      return true;
> >>   }
> >>
> >> +static int xe_determine_lmem_bar_size(struct xe_device *xe)
> >> +{
> >> +    struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> >> +    int err;
> >> +
> >> +    if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
> >> +            drm_err(&xe->drm, "pci resource is not valid\n");
> >> +            return -ENXIO;
> >> +    }
> >> +
> >> +    err =3D xe_resize_vram_bar(xe);
> >> +    if (err)
> >> +            return err;
> >> +
> >> +    xe->mem.vram.io_start =3D pci_resource_start(pdev,
> >GEN12_LMEM_BAR);
> >> +    xe->mem.vram.io_size =3D pci_resource_len(pdev,
> >GEN12_LMEM_BAR);
> >> +    if (!xe->mem.vram.io_size)
> >> +            return -EIO;
> >> +
> >> +    /* set up a map to the total memory area. */
> >> +    xe->mem.vram.mapping =3D ioremap_wc(xe->mem.vram.io_start, xe-
> >>mem.vram.io_size);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   /**
> >>    * xe_mmio_tile_vram_size - Collect vram size and off set informatio=
n
> >>    * @gt: tile to get info for
> >> @@ -202,59 +246,36 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt, u64
> >*vram_size, u64 *tile_size, u64
> >>
> >>   int xe_mmio_probe_vram(struct xe_device *xe)
> >>   {
> >> -    struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> >>      struct xe_gt *gt;
> >> -    u64 original_size;
> >>      u64 tile_offset;
> >>      u64 tile_size;
> >>      u64 vram_size;
> >>      int err;
> >>      u8 id;
> >>
> >> -    if (!IS_DGFX(xe)) {
> >> -            xe->mem.vram.mapping =3D 0;
> >> -            xe->mem.vram.size =3D 0;
> >> -            xe->mem.vram.io_start =3D 0;
> >> -            xe->mem.vram.io_size =3D 0;
> >> -
> >> -            for_each_gt(gt, xe, id) {
> >> -                    gt->mem.vram.mapping =3D 0;
> >> -                    gt->mem.vram.size =3D 0;
> >> -                    gt->mem.vram.io_start =3D 0;
> >> -                    gt->mem.vram.io_size =3D 0;
> >> -            }
> >> +    if (!IS_DGFX(xe))
> >>              return 0;
> >> -    }
> >> -
> >> -    if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
> >> -            drm_err(&xe->drm, "pci resource is not valid\n");
> >> -            return -ENXIO;
> >> -    }
> >>
> >> +    /* Get the size of the gt0 vram for later accessibility compariso=
n */
> >>      gt =3D xe_device_get_gt(xe, 0);
> >> -    original_size =3D pci_resource_len(pdev, GEN12_LMEM_BAR);
> >> -
> >>      err =3D xe_mmio_tile_vram_size(gt, &vram_size, &tile_size,
> >&tile_offset);
> >>      if (err)
> >>              return err;
> >>
> >> -    xe_resize_vram_bar(xe, vram_size);
> >> -    xe->mem.vram.io_start =3D pci_resource_start(pdev,
> >GEN12_LMEM_BAR);
> >> -    xe->mem.vram.io_size =3D min(vram_size,
> >> -                               pci_resource_len(pdev,
> >GEN12_LMEM_BAR));
> >> -    xe->mem.vram.size =3D xe->mem.vram.io_size;
> >> -
> >> -    if (!xe->mem.vram.size)
> >> -            return -EIO;
> >> +    err =3D xe_determine_lmem_bar_size(xe);
> >> +    if (err)
> >> +            return err;
> >>
> >> -    if (vram_size > xe->mem.vram.io_size)
> >> -            drm_warn(&xe->drm, "Restricting VRAM size to PCI resource
> >size (%lluMiB->%lluMiB)\n",
> >> -                     (u64)vram_size >> 20, (u64)xe->mem.vram.io_size =
>>
> >20);
> >> +    /* small bar issues will only cover gt0 sizes */
> >> +    if (xe->mem.vram.io_size < vram_size)
> >> +            drm_warn(&xe->drm, "Restricting VRAM size to PCI resource
> >size (0x%llx->0x%llx)\n",
> >> +                     vram_size, (u64)xe->mem.vram.io_size);
> >>
> >> -    xe->mem.vram.mapping =3D ioremap_wc(xe->mem.vram.io_start, xe-
> >>mem.vram.io_size);
> >> -    xe->mem.vram.size =3D min_t(u64, xe->mem.vram.size, vram_size);
> >> +    /* Limit size to available memory to account for the current memo=
ry
> >algorithm */
> >> +    xe->mem.vram.io_size =3D min_t(u64, xe->mem.vram.io_size,
> >vram_size);
> >>
> >> -    drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe-
> >>mem.vram.io_start, &xe->mem.vram.size);
> >> +    drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe-
> >>mem.vram.io_start,
> >> +             &xe->mem.vram.io_size);
> >>
> >>      /* FIXME: Assuming equally partitioned VRAM, incorrect */
> >>      if (xe->info.tile_count > 1) {
> >> @@ -267,7 +288,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> >>
> >>              XE_BUG_ON(!adj_tile_count);
> >>
> >> -            size =3D xe->mem.vram.size / adj_tile_count;
> >> +            size =3D xe->mem.vram.io_size / adj_tile_count;
> >>              io_start =3D xe->mem.vram.io_start;
> >>              io_size =3D xe->mem.vram.io_size;
> >>
> >> @@ -300,7 +321,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> >>                               &gt->mem.vram.size);
> >>              }
> >>      } else {
> >> -            gt->mem.vram.size =3D xe->mem.vram.size;
> >> +            gt->mem.vram.size =3D xe->mem.vram.io_size;
> >>              gt->mem.vram.io_start =3D xe->mem.vram.io_start;
> >>              gt->mem.vram.io_size =3D xe->mem.vram.io_size;
> >>              gt->mem.vram.mapping =3D xe->mem.vram.mapping;
