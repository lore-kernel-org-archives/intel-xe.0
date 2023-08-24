Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B5AC6FA8F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 14:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEED10E561;
	Thu, 24 Aug 2023 14:38:06 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F79F10E561
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 14:38:05 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe27849e6aso10530603e87.1
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692887883; x=1693492683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vtd7PrzpjWiLDOkGBnFL15AvdDQ8pIkVaT8WczhVGsk=;
 b=Sna07KFE94j5hDvQMuZrA1ZEiZv4n96TOaVPfM9vpCABFA5AQeMwfxQdveX9IbfLlo
 GDml4zePa7A0WbozbXap1giXIkTLbElJcV7R35UHXI2viVktmD3zRx66kyF56rwUH7GR
 LXBieCpwbtDlS4LO2MO0qdp9omA2CIPZFhQ/O4AT4zdTRKInxfFMTBcFmJa2CBQziX/P
 84WIzDOWkwuG7gE44W78asgUJtv7LR4vv/1hCOnomw57NFnQQbSfN9mhpCZYkpS+4xGR
 anmYfty5Opznz3Wr0hcv1Oatxr8AVI0feGKtc7s5/aWKaWfOOKE0hlzHXI155fCdcbfr
 HlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887883; x=1693492683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vtd7PrzpjWiLDOkGBnFL15AvdDQ8pIkVaT8WczhVGsk=;
 b=NiQ6o6C89lgTHxsCU47WkOqxoTIeS5/vVto3nH80hDXbHk1VODlHpWb6Pqlv672xVU
 PxJaZY6lTDk1v0diGv+ASasG2YCjBuNqybJIak03ffj72QdpszA6uWDCHhsOv7hj3z7J
 1+jZtv2g5jlFigKXAp3MgIm7qe0bEdG/1TvCUG+ezv2mlyye4h2Ws6Gwebc2NFIDDW7+
 dHUnp72uCzuxSu2d7A05ziaBIbfEShpdl+gMlE0WyCqumy/2pN+B93xTI/IcfDTbsGj9
 hHNSznuVRiQXlTjSZnPm69DbAYWJ4rVgYgIEJPbxW3xMfUMM1uW2LU97Bkk8hQkCZVcg
 RAXg==
X-Gm-Message-State: AOJu0YxDVt3Ofr/+5Iz8MEHh1rTVFr5MqoLxfQpPtuLwaRlaL/dlIjux
 +GOhiPOtL9dHnvyVGt+PGk/P3ij3Woul3T20yWzwDAZDTNaAUg==
X-Google-Smtp-Source: AGHT+IEdCN4y0BNek8fbm5M+BmAqEZlj3vinOABo4WkYGv+pPISacrninkxtCE8xuWgX65dV1pMH1dWOqch2yO+WQmk=
X-Received: by 2002:a05:6512:2097:b0:500:99a9:bc40 with SMTP id
 t23-20020a056512209700b0050099a9bc40mr3307403lfr.69.1692887882930; Thu, 24
 Aug 2023 07:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230821144504.236122-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20230821144504.236122-1-ravi.kumar.vodapalli@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 24 Aug 2023 15:37:35 +0100
Message-ID: <CAM0jSHPpezh52jzkON3H1_MGfP-Q152Jb5p-vBBJThdtEdWpdQ@mail.gmail.com>
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add support for PAT encoding in PTE
 and PDE
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

I started adding the vm_bind + pat_index stuff on top of this. Just
some comments below.

On Mon, 21 Aug 2023 at 15:43, Ravi Kumar Vodapalli
<ravi.kumar.vodapalli@intel.com> wrote:
>
> Different platforms has different PAT encoding in PTE and PDE format
> of PPGTT and GGTT, add correct PAT encoding for
> pre-Xe2 platforms (XELP, XEHPC, XELPG).
>
> Bspec: 45101, 71582
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  3 ++
>  drivers/gpu/drm/xe/xe_device_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_ggtt.c         | 28 ++++++++++++++---
>  drivers/gpu/drm/xe/xe_ggtt_types.h   |  7 +++++
>  drivers/gpu/drm/xe/xe_pat.c          | 38 +++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pat.h          | 22 +++++++++++++
>  drivers/gpu/drm/xe/xe_pt.c           | 31 +++++++-----------
>  drivers/gpu/drm/xe/xe_pt_types.h     |  4 ++-
>  drivers/gpu/drm/xe/xe_vm.c           | 47 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_types.h     |  7 +++++
>  10 files changed, 163 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 766df07de979..e952bb2d021c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -25,6 +25,7 @@
>  #include "xe_irq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_query.h"
> @@ -292,6 +293,8 @@ int xe_device_probe(struct xe_device *xe)
>                         goto err_irq_shutdown;
>         }
>
> +       xe_pte_pat_init(xe);
> +
>         err =3D xe_mmio_probe_vram(xe);
>         if (err)
>                 goto err_irq_shutdown;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 303447c093c5..fda435ae5ef0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -355,6 +355,9 @@ struct xe_device {
>                 struct mutex lock;
>         } d3cold;
>
> +       struct {
> +               const u32 *pte_pat_table;
> +       } pat_table;
>         /**
>          * @pm_callback_task: Track the active task that is running in ei=
ther
>          * the runtime_suspend or runtime_resume callbacks.
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 3ce2dce844b9..209fa053d9fb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -18,6 +18,7 @@
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> +#include "xe_pat.h"
>  #include "xe_wopcm.h"
>
>  /* FIXME: Common file, preferably auto-gen */
> @@ -30,6 +31,7 @@
>  u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>  {
>         struct xe_device *xe =3D xe_bo_device(bo);
> +       struct xe_ggtt *ggtt =3D (bo->tile)->mem.ggtt;

Why the extra brackets?

>         u64 pte;
>
>         pte =3D xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> @@ -38,11 +40,8 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset=
)
>         if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>                 pte |=3D XE_GGTT_PTE_DM;
>
> -       /* FIXME: vfunc + pass in caching rules */
> -       if (xe->info.platform =3D=3D XE_METEORLAKE) {
> -               pte |=3D MTL_GGTT_PTE_PAT0;
> -               pte |=3D MTL_GGTT_PTE_PAT1;
> -       }
> +       if ((ggtt->pat_encode).pte_encode)

Ditto here. Also in a bunch of places below.

> +               pte =3D (ggtt->pat_encode).pte_encode(xe, pte, XE_CACHE_W=
B_1_WAY);
>
>         return pte;
>  }
> @@ -102,6 +101,22 @@ static void primelockdep(struct xe_ggtt *ggtt)
>         fs_reclaim_release(GFP_KERNEL);
>  }
>
> +static u64 xelpg_ggtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
> +                                               enum xe_cache_level cache=
)
> +{
> +       u32 pat_index =3D xe_pat_get_index(xe, cache);
> +
> +       pte_pat &=3D ~(XELPG_GGTT_PTE_PAT_MASK);
> +
> +       if (pat_index & BIT(0))
> +               pte_pat |=3D BIT(52);
> +
> +       if (pat_index & BIT(1))
> +               pte_pat |=3D BIT(53);
> +
> +       return pte_pat;
> +}
> +
>  int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
>  {
>         struct xe_device *xe =3D tile_to_xe(ggtt->tile);
> @@ -120,6 +135,9 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
>         if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>                 ggtt->flags |=3D XE_GGTT_FLAGS_64K;
>
> +       if (GRAPHICS_VERx100(xe) >=3D 1270)
> +               (ggtt->pat_encode).pte_encode =3D xelpg_ggtt_pte_encode_p=
at;
> +
>         /*
>          * 8B per entry, each points to a 4KB page.
>          *
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_g=
gtt_types.h
> index d34b3e733945..7e55fac1a8a9 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -7,9 +7,11 @@
>  #define _XE_GGTT_TYPES_H_
>
>  #include <drm/drm_mm.h>
> +#include "xe_pt_types.h"
>
>  struct xe_bo;
>  struct xe_gt;
> +extern struct xe_device *xe;

What is this for? I think we just need something like:

struct xe_device;

>
>  struct xe_ggtt {
>         struct xe_tile *tile;
> @@ -26,6 +28,11 @@ struct xe_ggtt {
>         u64 __iomem *gsm;
>
>         struct drm_mm mm;
> +
> +       struct {
> +               u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
> +                                               enum xe_cache_level cache=
);
> +       } pat_encode;
>  };
>
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index b56a65779d26..a468655db956 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -3,12 +3,13 @@
>   * Copyright =C2=A9 2023 Intel Corporation
>   */
>
> -#include "xe_pat.h"
>
>  #include "regs/xe_reg_defs.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_mmio.h"
> +#include "xe_pat.h"
> +#include "xe_pt_types.h"
>
>  #define _PAT_INDEX(index)                      _PICK_EVEN_2RANGES(index,=
 8, \
>                                                                    0x4800=
, 0x4804, \
> @@ -62,6 +63,31 @@ static const u32 mtl_pat_table[] =3D {
>         [4] =3D MTL_PAT_0_WB | MTL_3_COH_2W,
>  };
>
> +static const u32 xelp_pte_pat_table[XE_CACHE_LAST] =3D {
> +       [XE_CACHE_NONE] =3D XELP_PAT_UNCACHE,
> +       [XE_CACHE_WT] =3D XELP_PAT_WT_CACHE,
> +       [XE_CACHE_WB] =3D XELP_PAT_WB_CACHE,
> +};
> +
> +static const u32 xehpc_pte_pat_table[XE_CACHE_LAST] =3D {
> +       [XE_CACHE_NONE] =3D XEHPC_PAT_CLOS0_UNCACHE,
> +       [XE_CACHE_WT] =3D XEHPC_PAT_CLOS0_WT_CACHE,
> +       [XE_CACHE_WB] =3D XEHPC_PAT_CLOS0_WB_CACHE,
> +};
> +
> +static const u32 xelpg_pte_pat_table[XE_CACHE_LAST] =3D {
> +       [XE_CACHE_NONE] =3D XELPG_PAT_UNCACHE,
> +       [XE_CACHE_WT] =3D XELPG_PAT_WT_CACHE,
> +       [XE_CACHE_WB] =3D XELPG_PAT_WB_CACHE,
> +       [XE_CACHE_WB_1_WAY] =3D XELPG_PAT_WB_CACHE_1_WAY,

Wondering if we need XE_CACHE_WB_1_WAY for every platform, or just
make XE_CACHE_WB the equivalent of 1-way or something? There might be
some more kernel internal spots where we want to use XE_CACHE_WB_1_WAY
across various platforms.

> +};
> +
> +unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level =
cache)
> +{
> +       WARN_ON(cache >=3D XE_CACHE_LAST);

What happens with XE_CACHE_WB_1_WAY on non-xelpg?

> +       return (xe->pat_table).pte_pat_table[cache];
> +}
> +>  static void program_pat(struct xe_gt *gt, const u32 table[], int n_en=
tries)
>  {
>         for (int i =3D 0; i < n_entries; i++) {
> @@ -111,3 +137,13 @@ void xe_pat_init(struct xe_gt *gt)
>                         GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>         }
>  }
> +
> +void xe_pte_pat_init(struct xe_device *xe)
> +{
> +       if (GRAPHICS_VERx100(xe) >=3D 1270)
> +               (xe->pat_table).pte_pat_table =3D xelpg_pte_pat_table;
> +       else if (GRAPHICS_VERx100(xe) >=3D 1260)
> +               (xe->pat_table).pte_pat_table =3D xehpc_pte_pat_table;
> +       else
> +               (xe->pat_table).pte_pat_table =3D xelp_pte_pat_table;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 659de4008131..54022f591621 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -6,8 +6,30 @@
>  #ifndef _XE_PAT_H_
>  #define _XE_PAT_H_
>
> +#include "xe_pt_types.h"
> +
> +#define XELP_PTE_PAT_MASK              (BIT_ULL(7) | BIT_ULL(4) | BIT_UL=
L(3))
> +#define XELP_PDE_PAT_MASK              (BIT_ULL(12) | BIT_ULL(4) | BIT_U=
LL(3))
> +#define XELPG_GGTT_PTE_PAT_MASK                (BIT_ULL(53) | BIT_ULL(52=
))
> +
> +#define XELP_PAT_WB_CACHE              0
> +#define XELP_PAT_WT_CACHE              2
> +#define XELP_PAT_UNCACHE               3
> +
> +#define XEHPC_PAT_CLOS0_UNCACHE        0
> +#define XEHPC_PAT_CLOS0_WT_CACHE       2
> +#define XEHPC_PAT_CLOS0_WB_CACHE       3
> +
> +#define XELPG_PAT_WB_CACHE             0
> +#define XELPG_PAT_WT_CACHE             1
> +#define XELPG_PAT_UNCACHE              2
> +#define XELPG_PAT_WB_CACHE_1_WAY       3
> +
>  struct xe_gt;
> +extern struct xe_device *xe;

DItto with the extern.

>
>  void xe_pat_init(struct xe_gt *gt);
> +void xe_pte_pat_init(struct xe_device *xe);
> +unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level =
cache);
>
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5709518e314b..64713f400d94 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -58,19 +58,18 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt=
_dir, unsigned int index)
>   * Return: An encoded page directory entry. No errors.
>   */
>  u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> -                 const enum xe_cache_level level)
> +                 const enum xe_cache_level cache)
>  {
>         u64 pde;
> +       struct xe_vm *vm =3D bo->vm;
> +       struct xe_device *xe =3D vm->xe;
> +
>
>         pde =3D xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>         pde |=3D XE_PAGE_PRESENT | XE_PAGE_RW;
>
> -       /* FIXME: I don't think the PPAT handling is correct for MTL */
> -
> -       if (level !=3D XE_CACHE_NONE)
> -               pde |=3D PPAT_CACHED_PDE;
> -       else
> -               pde |=3D PPAT_UNCACHED;
> +       if ((vm->pat_encode).pde_encode)
> +               pde =3D (vm->pat_encode).pde_encode(xe, pde, cache);
>
>         return pde;
>  }
> @@ -78,6 +77,9 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>                         struct xe_vma *vma, u32 pt_level)
>  {
> +       struct xe_vm *vm =3D xe_vma_vm(vma);
> +       struct xe_device *xe =3D vm->xe;
> +
>         pte |=3D XE_PAGE_PRESENT | XE_PAGE_RW;
>
>         if (unlikely(vma && xe_vma_read_only(vma)))
> @@ -86,19 +88,8 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level c=
ache,
>         if (unlikely(vma && xe_vma_is_null(vma)))
>                 pte |=3D XE_PTE_NULL;
>
> -       /* FIXME: I don't think the PPAT handling is correct for MTL */
> -
> -       switch (cache) {
> -       case XE_CACHE_NONE:
> -               pte |=3D PPAT_UNCACHED;
> -               break;
> -       case XE_CACHE_WT:
> -               pte |=3D PPAT_DISPLAY_ELLC;
> -               break;
> -       default:
> -               pte |=3D PPAT_CACHED;
> -               break;
> -       }
> +       if ((vm->pat_encode).pte_encode)
> +               pte =3D (vm->pat_encode).pte_encode(xe, pte, cache);
>
>         if (pt_level =3D=3D 1)
>                 pte |=3D XE_PDE_PS_2M;
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_=
types.h
> index 2ed64c0a4485..075040b8a2d4 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -9,9 +9,11 @@
>  #include "xe_pt_walk.h"
>
>  enum xe_cache_level {
> -       XE_CACHE_NONE,
> +       XE_CACHE_NONE =3D 0,
>         XE_CACHE_WT,
>         XE_CACHE_WB,
> +       XE_CACHE_WB_1_WAY,
> +       XE_CACHE_LAST,
>  };
>
>  #define XE_VM_MAX_LEVEL 4
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2e99f865d7ec..3f8675e9a62c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_pagefault.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
> +#include "xe_pat.h"
>  #include "xe_pm.h"
>  #include "xe_preempt_fence.h"
>  #include "xe_pt.h"
> @@ -1192,6 +1193,44 @@ static struct drm_gpuva_fn_ops gpuva_ops =3D {
>  static void xe_vma_op_work_func(struct work_struct *w);
>  static void vm_destroy_work_func(struct work_struct *w);
>
> +static u64 xelp_ppgtt_pde_encode_pat(struct xe_device *xe, u64 pde_pat,
> +                                               enum xe_cache_level cache=
)
> +{
> +       u32 pat_index =3D xe_pat_get_index(xe, cache);
> +
> +       pde_pat &=3D ~(XELP_PDE_PAT_MASK);
> +
> +       if (pat_index & BIT(0))
> +               pde_pat |=3D BIT(3);
> +
> +       if (pat_index & BIT(1))
> +               pde_pat |=3D BIT(4);
> +
> +       if (pat_index & BIT(2))
> +               pde_pat |=3D BIT(12);
> +
> +       return pde_pat;
> +}
> +
> +static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
> +                                               enum xe_cache_level cache=
)
> +{
> +       u32 pat_index =3D xe_pat_get_index(xe, cache);
> +
> +       pte_pat &=3D ~(XELP_PTE_PAT_MASK);
> +
> +       if (pat_index & BIT(0))
> +               pte_pat |=3D BIT(3);
> +
> +       if (pat_index & BIT(1))
> +               pte_pat |=3D BIT(4);
> +
> +       if (pat_index & BIT(2))
> +               pte_pat |=3D BIT(7);
> +
> +       return pte_pat;
> +}
> +
>  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  {
>         struct xe_vm *vm;
> @@ -1249,6 +1288,14 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u=
32 flags)
>         if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>                 vm->flags |=3D XE_VM_FLAG_64K;
>
> +       if (GRAPHICS_VERx100(xe) >=3D 1200) {
> +               /* __xelp_pte_encode applies to xelp, xehpc and xelpg pla=
tform*/
> +               (vm->pat_encode).pte_encode =3D xelp_ppgtt_pte_encode_pat=
;
> +
> +               /* __xelp_pde_encode applies to xelp, xehpc and xelpg pla=
tform*/
> +               (vm->pat_encode).pde_encode =3D xelp_ppgtt_pde_encode_pat=
;
> +       }
> +
>         for_each_tile(tile, xe, id) {
>                 if (flags & XE_VM_FLAG_MIGRATION &&
>                     tile->id !=3D XE_VM_FLAG_TILE_ID(flags))
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_=
types.h
> index 3681a5ff588b..83a1f87b6537 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -336,6 +336,13 @@ struct xe_vm {
>
>         /** @batch_invalidate_tlb: Always invalidate TLB before batch sta=
rt */
>         bool batch_invalidate_tlb;
> +
> +       struct {
> +               u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
> +                                               enum xe_cache_level cache=
);
> +               u64 (*pde_encode)(struct xe_device *xe, u64 pde_pat,
> +                                               enum xe_cache_level cache=
);
> +       } pat_encode;
>  };
>
>  /** struct xe_vma_op_map - VMA map operation */
> --
> 2.25.1
>
