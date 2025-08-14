Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B98CA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 07:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B2E10E814;
	Thu, 14 Aug 2025 07:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agKxrYTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B52910E210
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755157804; x=1786693804;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=m8NF0eipNTeYL8PQ9XOxbKqZDjCHzD0oFpQWZ7YHPd4=;
 b=agKxrYTPVVp3eUVpSYEjGKc6qUzChLn9XuAQH4KAPxgO2/pniPkWLCJp
 stnubCUVBMBVU1xBT2t1qi1jEGcEgzfJeeFQKDcYHqFqv33jrzi+hunYm
 nHK+0Mf5udeNjVMDRZhSPwR0/eiAI28UPy6OpwDgDbEpUxQ76XTo050Y1
 hoZkxvUl6PzMERuxVm9U6ojkW/5Ix8raME3TZKHaygg9fPptxe+8g7TdE
 RWSOm7x58wYyjim/+q0E6r2w1+KJyBkNmPLfVA9Woz3UWAjkb9Bdd+oZk
 B0zCapDGZUJNhK8yatUviG558PSh+GLjCPFfD5apnTU4QEG+YnIA/OIAH A==;
X-CSE-ConnectionGUID: X8dVVGwPRjOn34JjyvZAQw==
X-CSE-MsgGUID: 07S1nDs6RymedX2daJFB0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57183260"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57183260"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 00:50:03 -0700
X-CSE-ConnectionGUID: 57aXTJp2TTGhJJPwaTyI4g==
X-CSE-MsgGUID: rCnayNAeQC2MRmuLKzzKkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="170905210"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.149])
 ([10.245.244.149])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 00:50:01 -0700
Message-ID: <0a49981498b54d10aabbe9995975f88616c8810b.camel@linux.intel.com>
Subject: Re: [PATCH 04/15] drm/xe: Pass down drm_exec context to validation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Thu, 14 Aug 2025 09:49:59 +0200
In-Reply-To: <aJzAhDRi9W+iKl0b@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-5-thomas.hellstrom@linux.intel.com>
 <aJzAhDRi9W+iKl0b@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/markdown; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 2025-08-13 at 09:42 -0700, Matthew Brost wrote:

> On Wed, Aug 13, 2025 at 12:51:10PM +0200, Thomas Hellstr=C3=B6m wrote:
>=20
> > We want all validation (potential backing store allocation) to be part
> > of a drm_exec transaction. Therefore add a drm_exec pointer argument
> > to xe_bo_validate() and ___xe_bo_create_locked(). Upcoming patches
> > will deal with making all (or nearly all) calls to these functions
> > part of a drm_exec transaction. In the meantime, define special values
> > of the drm_exec pointer:
> >=20
>=20
>=20
> Would the eventual idea be pass the exec further down to TTM?


Yes. The original series did this, and required multiple changes both to dr=
m_exec and to TTM. Christian had some other ideas, though although the fina=
l goal was the same. So it's a task for us and AMD to agree on something he=
re. The TTM object refcount removal series from Christian is a step on the =
way there.


> =C2=A0
>=20
> > XE_VALIDATION_UNIMPLEMENTED: Implementation of the drm_exec transaction
> > has not been done yet.
> > XE_VALIDATION_UNSUPPORTED: Some Middle-layers (dma-buf) doesn't allow
> > the drm_exec context to be passed down to map_attachment where
> > validation takes place.
>=20
>=20
> What is the expected longterm implictation of paths that are
> UNIMPLEMENTED and UNSUPPORTED?


IMO Unimplemented should not be allowed moving forward other than for debug=
ging. UNIMPLEMENTED requires a new dma-buf mapping interface with an exec a=
rgument. I don't think all peers will support that, though and those won't =
participate fully in the scheme.



>=20
> > XE_VALIDATION_OPT_OUT: May be used only for kunit tests where exhaustiv=
e
> > eviction isn't crucial and the ROI of converting those is very
> > small.
> >=20
> > For XE_VALIDATION_UNIMPLEMENTED and XE_VALIDATION_OPT_OUT there is also
> > a lockdep check that a drm_exec transaction can indeed start at the
> > location where the macro is expanded. This is to encourage
> > developers to take this into consideration early in the code
> > development process.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <[thomas.hellstrom@linux.intel.com=
](mailto:thomas.hellstrom@linux.intel.com)>
> > ---
> > =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
> > =C2=A0.../compat-i915-headers/gem/i915_gem_stolen.h |=C2=A0=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/xe/display/xe_fb_pin.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> > =C2=A0drivers/gpu/drm/xe/tests/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 +--
> > =C2=A0drivers/gpu/drm/xe/tests/xe_dma_buf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +-
> > =C2=A0drivers/gpu/drm/xe/tests/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 45 +++---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 129 +++++++++++++++---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 20 +--
> > =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 ++-
> > =C2=A0drivers/gpu/drm/xe/xe_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/xe/xe_ggtt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
15 +-
> > =C2=A0drivers/gpu/drm/xe/xe_ggtt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 5 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 4 +-
> > =C2=A0drivers/gpu/drm/xe/xe_validation.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 49 +++++++
> > =C2=A0drivers/gpu/drm/xe/xe_validation.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 69 ++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 26 +++-
> > =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 33 ++++-
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 32 +++--
> > =C2=A020 files changed, 401 insertions(+), 105 deletions(-)
> > =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_validation.c
> > =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_validation.h
> >=20
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 8e0c3412a757..8ee7d275128d 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -127,6 +127,7 @@ xe-y +=3D xe_bb.o \
> > =C2=A0	xe_tuning.o \
> > =C2=A0	xe_uc.o \
> > =C2=A0	xe_uc_fw.o \
> > +	xe_validation.o \
> > =C2=A0	xe_vm.o \
> > =C2=A0	xe_vram.o \
> > =C2=A0	xe_vram_freq.o \
> > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen=
.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> > index 41d39d67817a..1ce1e9da975b 100644
> > --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> > +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> > @@ -8,6 +8,7 @@
> > =C2=A0
> > =C2=A0#include "xe_ttm_stolen_mgr.h"
> > =C2=A0#include "xe_res_cursor.h"
> > +#include "xe_validation.h"
> > =C2=A0
> > =C2=A0struct xe_bo;
> > =C2=A0
> > @@ -20,6 +21,7 @@ static inline int i915_gem_stolen_insert_node_in_rang=
e(struct xe_device *xe,
> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 size, u32 align,
> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 start, u32 end)
> > =C2=A0{
> > +	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0	struct xe_bo *bo;
> > =C2=A0	int err;
> > =C2=A0	u32 flags =3D XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
> > @@ -34,13 +36,13 @@ static inline int i915_gem_stolen_insert_node_in_ra=
nge(struct xe_device *xe,
> > =C2=A0
> > =C2=A0	bo =3D xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe)=
,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, size, start, end,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel, flags, 0)=
;
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel, flags, 0,=
 exec);
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		err =3D PTR_ERR(bo);
> > =C2=A0		bo =3D NULL;
> > =C2=A0		return err;
> > =C2=A0	}
> > -	err =3D xe_bo_pin(bo);
> > +	err =3D xe_bo_pin(bo, exec);
> > =C2=A0	xe_bo_unlock_vm_held(bo);
> > =C2=A0
> > =C2=A0	if (err) {
> > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/x=
e/display/xe_fb_pin.c
> > index f1f8b5ab53ef..4b0748e6fdd6 100644
> > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > @@ -281,6 +281,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struc=
t intel_framebuffer *fb,
> > =C2=A0	struct i915_vma *vma =3D kzalloc(sizeof(*vma), GFP_KERNEL);
> > =C2=A0	struct drm_gem_object *obj =3D intel_fb_bo(&fb->base);
> > =C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > +	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	if (!vma)
> > @@ -313,9 +314,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struc=
t intel_framebuffer *fb,
> > =C2=A0		goto err;
> > =C2=A0
> > =C2=A0	if (IS_DGFX(xe))
> > -		ret =3D xe_bo_migrate(bo, XE_PL_VRAM0);
> > +		ret =3D xe_bo_migrate(bo, XE_PL_VRAM0, exec);
> > =C2=A0	else
> > -		ret =3D xe_bo_validate(bo, NULL, true);
> > +		ret =3D xe_bo_validate(bo, NULL, true, exec);
> > =C2=A0	if (!ret)
> > =C2=A0		ttm_bo_pin(&bo->ttm);
> > =C2=A0	ttm_bo_unreserve(&bo->ttm);
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/test=
s/xe_bo.c
> > index bb469096d072..06ceba6c3c25 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > @@ -23,7 +23,7 @@
> > =C2=A0
> > =C2=A0static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *b=
o,
> > =C2=A0			=C2=A0=C2=A0=C2=A0 bool clear, u64 get_val, u64 assign_val,
> > -			=C2=A0=C2=A0=C2=A0 struct kunit *test)
> > +			=C2=A0=C2=A0=C2=A0 struct kunit *test, struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct dma_fence *fence;
> > =C2=A0	struct ttm_tt *ttm;
> > @@ -35,7 +35,7 @@ static int ccs_test_migrate(struct xe_tile *tile, str=
uct xe_bo *bo,
> > =C2=A0	u32 offset;
> > =C2=A0
> > =C2=A0	/* Move bo to VRAM if not already there. */
> > -	ret =3D xe_bo_validate(bo, NULL, false);
> > +	ret =3D xe_bo_validate(bo, NULL, false, exec);
> > =C2=A0	if (ret) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to validate bo.\n");
> > =C2=A0		return ret;
> > @@ -60,7 +60,7 @@ static int ccs_test_migrate(struct xe_tile *tile, str=
uct xe_bo *bo,
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	/* Evict to system. CCS data should be copied. */
> > -	ret =3D xe_bo_evict(bo);
> > +	ret =3D xe_bo_evict(bo, exec);
> > =C2=A0	if (ret) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to evict bo.\n");
> > =C2=A0		return ret;
> > @@ -132,6 +132,7 @@ static void ccs_test_run_tile(struct xe_device *xe,=
 struct xe_tile *tile,
> > =C2=A0
> > =C2=A0	/* TODO: Sanity check */
> > =C2=A0	unsigned int bo_flags =3D XE_BO_FLAG_VRAM_IF_DGFX(tile);
> > +	struct drm_exec *exec =3D XE_VALIDATION_OPT_OUT;
> > =C2=A0
> > =C2=A0	if (IS_DGFX(xe))
> > =C2=A0		kunit_info(test, "Testing vram id %u\n", tile->id);
> > @@ -149,18 +150,18 @@ static void ccs_test_run_tile(struct xe_device *x=
e, struct xe_tile *tile,
> > =C2=A0
> > =C2=A0	kunit_info(test, "Verifying that CCS data is cleared on creation=
.\n");
> > =C2=A0	ret =3D ccs_test_migrate(tile, bo, false, 0ULL, 0xdeadbeefdeadbe=
efULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test);
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test, exec);
> > =C2=A0	if (ret)
> > =C2=A0		goto out_unlock;
> > =C2=A0
> > =C2=A0	kunit_info(test, "Verifying that CCS data survives migration.\n"=
);
> > =C2=A0	ret =3D ccs_test_migrate(tile, bo, false, 0xdeadbeefdeadbeefULL,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xdeadbeefdeadbeefULL, test);
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xdeadbeefdeadbeefULL, test, e=
xec);
> > =C2=A0	if (ret)
> > =C2=A0		goto out_unlock;
> > =C2=A0
> > =C2=A0	kunit_info(test, "Verifying that CCS data can be properly cleare=
d.\n");
> > -	ret =3D ccs_test_migrate(tile, bo, true, 0ULL, 0ULL, test);
> > +	ret =3D ccs_test_migrate(tile, bo, true, 0ULL, 0ULL, test, exec);
> > =C2=A0
> > =C2=A0out_unlock:
> > =C2=A0	xe_bo_unlock(bo);
> > @@ -210,6 +211,7 @@ static int evict_test_run_tile(struct xe_device *xe=
, struct xe_tile *tile, struc
> > =C2=A0	struct xe_bo *bo, *external;
> > =C2=A0	unsigned int bo_flags =3D XE_BO_FLAG_VRAM_IF_DGFX(tile);
> > =C2=A0	struct xe_vm *vm =3D xe_migrate_get_vm(xe_device_get_root_tile(x=
e)->migrate);
> > +	struct drm_exec *exec =3D XE_VALIDATION_OPT_OUT;
> > =C2=A0	struct xe_gt *__gt;
> > =C2=A0	int err, i, id;
> > =C2=A0
> > @@ -236,7 +238,7 @@ static int evict_test_run_tile(struct xe_device *xe=
, struct xe_tile *tile, struc
> > =C2=A0		}
> > =C2=A0
> > =C2=A0		xe_bo_lock(external, false);
> > -		err =3D xe_bo_pin_external(external);
> > +		err =3D xe_bo_pin_external(external, exec);
> > =C2=A0		xe_bo_unlock(external);
> > =C2=A0		if (err) {
> > =C2=A0			KUNIT_FAIL(test, "external bo pin err=3D%pe\n",
> > @@ -294,7 +296,7 @@ static int evict_test_run_tile(struct xe_device *xe=
, struct xe_tile *tile, struc
> > =C2=A0		if (i) {
> > =C2=A0			down_read(&vm->lock);
> > =C2=A0			xe_vm_lock(vm, false);
> > -			err =3D xe_bo_validate(bo, bo->vm, false);
> > +			err =3D xe_bo_validate(bo, bo->vm, false, exec);
> > =C2=A0			xe_vm_unlock(vm);
> > =C2=A0			up_read(&vm->lock);
> > =C2=A0			if (err) {
> > @@ -303,7 +305,7 @@ static int evict_test_run_tile(struct xe_device *xe=
, struct xe_tile *tile, struc
> > =C2=A0				goto cleanup_all;
> > =C2=A0			}
> > =C2=A0			xe_bo_lock(external, false);
> > -			err =3D xe_bo_validate(external, NULL, false);
> > +			err =3D xe_bo_validate(external, NULL, false, exec);
> > =C2=A0			xe_bo_unlock(external);
> > =C2=A0			if (err) {
> > =C2=A0				KUNIT_FAIL(test, "external bo valid err=3D%pe\n",
> > diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe=
/tests/xe_dma_buf.c
> > index cde9530bef8c..965dd3280468 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > @@ -27,7 +27,8 @@ static bool is_dynamic(struct dma_buf_test_params *pa=
rams)
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void check_residency(struct kunit *test, struct xe_bo *exp=
orted,
> > -			=C2=A0=C2=A0=C2=A0 struct xe_bo *imported, struct dma_buf *dmabuf)
> > +			=C2=A0=C2=A0=C2=A0 struct xe_bo *imported, struct dma_buf *dmabuf,
> > +			=C2=A0=C2=A0=C2=A0 struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct dma_buf_test_params *params =3D to_dma_buf_test_params(te=
st->priv);
> > =C2=A0	u32 mem_type;
> > @@ -62,7 +63,7 @@ static void check_residency(struct kunit *test, struc=
t xe_bo *exported,
> > =C2=A0	 * importer is on a different device. If they're on the same dev=
ice,
> > =C2=A0	 * the exporter and the importer should be the same bo.
> > =C2=A0	 */
> > -	ret =3D xe_bo_evict(exported);
> > +	ret =3D xe_bo_evict(exported, exec);
> > =C2=A0	if (ret) {
> > =C2=A0		if (ret !=3D -EINTR && ret !=3D -ERESTARTSYS)
> > =C2=A0			KUNIT_FAIL(test, "Evicting exporter failed with err=3D%d.\n",
> > @@ -77,7 +78,7 @@ static void check_residency(struct kunit *test, struc=
t xe_bo *exported,
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	/* Re-validate the importer. This should move also exporter in. =
*/
> > -	ret =3D xe_bo_validate(imported, NULL, false);
> > +	ret =3D xe_bo_validate(imported, NULL, false, exec);
> > =C2=A0	if (ret) {
> > =C2=A0		if (ret !=3D -EINTR && ret !=3D -ERESTARTSYS)
> > =C2=A0			KUNIT_FAIL(test, "Validating importer failed with err=3D%d.\n"=
,
> > @@ -150,11 +151,12 @@ static void xe_test_dmabuf_import_same_driver(str=
uct xe_device *xe)
> > =C2=A0			KUNIT_FAIL(test,
> > =C2=A0				=C2=A0=C2=A0 "xe_gem_prime_import() succeeded when it shouldn=
't have\n");
> > =C2=A0		} else {
> > +			struct drm_exec *exec =3D XE_VALIDATION_OPT_OUT;
> > =C2=A0			int err;
> > =C2=A0
> > =C2=A0			/* Is everything where we expect it to be? */
> > =C2=A0			xe_bo_lock(import_bo, false);
> > -			err =3D xe_bo_validate(import_bo, NULL, false);
> > +			err =3D xe_bo_validate(import_bo, NULL, false, exec);
> > =C2=A0
> > =C2=A0			/* Pinning in VRAM is not allowed. */
> > =C2=A0			if (!is_dynamic(params) &&
> > @@ -167,7 +169,7 @@ static void xe_test_dmabuf_import_same_driver(struc=
t xe_device *xe)
> > =C2=A0						=C2=A0 err =3D=3D -ERESTARTSYS);
> > =C2=A0
> > =C2=A0			if (!err)
> > -				check_residency(test, bo, import_bo, dmabuf);
> > +				check_residency(test, bo, import_bo, dmabuf, exec);
> > =C2=A0			xe_bo_unlock(import_bo);
> > =C2=A0		}
> > =C2=A0		drm_gem_object_put(import);
> > diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe=
/tests/xe_migrate.c
> > index edd1e701aa1c..dfb445d09759 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > @@ -70,7 +70,7 @@ static int run_sanity_job(struct xe_migrate *m, struc=
t xe_device *xe,
> > =C2=A0		} } while (0)
> > =C2=A0
> > =C2=A0static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct kunit *test, u32 region)
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct kunit *test, u32 region, struc=
t drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D tile_to_xe(m->tile);
> > =C2=A0	u64 retval, expected =3D 0;
> > @@ -84,14 +84,15 @@ static void test_copy(struct xe_migrate *m, struct =
xe_bo *bo,
> > =C2=A0						=C2=A0=C2=A0 ttm_bo_type_kernel,
> > =C2=A0						=C2=A0=C2=A0 region |
> > =C2=A0						=C2=A0=C2=A0 XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > -						=C2=A0=C2=A0 XE_BO_FLAG_PINNED);
> > +						=C2=A0=C2=A0 XE_BO_FLAG_PINNED,
> > +						=C2=A0=C2=A0 exec);
> > =C2=A0	if (IS_ERR(remote)) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %pe\n",
> > =C2=A0			=C2=A0=C2=A0 str, remote);
> > =C2=A0		return;
> > =C2=A0	}
> > =C2=A0
> > -	err =3D xe_bo_validate(remote, NULL, false);
> > +	err =3D xe_bo_validate(remote, NULL, false, exec);
> > =C2=A0	if (err) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to validate system bo for %s: %i\n",
> > =C2=A0			=C2=A0=C2=A0 str, err);
> > @@ -161,13 +162,13 @@ static void test_copy(struct xe_migrate *m, struc=
t xe_bo *bo,
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void test_copy_sysmem(struct xe_migrate *m, struct xe_bo *=
bo,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 struct kunit *test)
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_exec *exec, struct kunit *test)
> > =C2=A0{
> > -	test_copy(m, bo, test, XE_BO_FLAG_SYSTEM);
> > +	test_copy(m, bo, test, XE_BO_FLAG_SYSTEM, exec);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo=
,
> > -			=C2=A0=C2=A0 struct kunit *test)
> > +			=C2=A0=C2=A0 struct drm_exec *exec, struct kunit *test)
> > =C2=A0{
> > =C2=A0	u32 region;
> > =C2=A0
> > @@ -178,10 +179,11 @@ static void test_copy_vram(struct xe_migrate *m, =
struct xe_bo *bo,
> > =C2=A0		region =3D XE_BO_FLAG_VRAM1;
> > =C2=A0	else
> > =C2=A0		region =3D XE_BO_FLAG_VRAM0;
> > -	test_copy(m, bo, test, region);
> > +	test_copy(m, bo, test, region, exec);
> > =C2=A0}
> > =C2=A0
> > -static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit =
*test)
> > +static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit =
*test,
> > +				=C2=A0=C2=A0 struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct xe_tile *tile =3D m->tile;
> > =C2=A0	struct xe_device *xe =3D tile_to_xe(tile);
> > @@ -290,10 +292,10 @@ static void xe_migrate_sanity_test(struct xe_migr=
ate *m, struct kunit *test)
> > =C2=A0	check(retval, expected, "Command clear small last value", test);
> > =C2=A0
> > =C2=A0	kunit_info(test, "Copying small buffer object to system\n");
> > -	test_copy_sysmem(m, tiny, test);
> > +	test_copy_sysmem(m, tiny, exec, test);
> > =C2=A0	if (xe->info.tile_count > 1) {
> > =C2=A0		kunit_info(test, "Copying small buffer object to other vram\n")=
;
> > -		test_copy_vram(m, tiny, test);
> > +		test_copy_vram(m, tiny, exec, test);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	/* Clear a big bo */
> > @@ -312,10 +314,10 @@ static void xe_migrate_sanity_test(struct xe_migr=
ate *m, struct kunit *test)
> > =C2=A0	check(retval, expected, "Command clear big last value", test);
> > =C2=A0
> > =C2=A0	kunit_info(test, "Copying big buffer object to system\n");
> > -	test_copy_sysmem(m, big, test);
> > +	test_copy_sysmem(m, big, exec, test);
> > =C2=A0	if (xe->info.tile_count > 1) {
> > =C2=A0		kunit_info(test, "Copying big buffer object to other vram\n");
> > -		test_copy_vram(m, big, test);
> > +		test_copy_vram(m, big, exec, test);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0out:
> > @@ -343,10 +345,11 @@ static int migrate_test_run_device(struct xe_devi=
ce *xe)
> > =C2=A0
> > =C2=A0	for_each_tile(tile, xe, id) {
> > =C2=A0		struct xe_migrate *m =3D tile->migrate;
> > +		struct drm_exec *exec =3D XE_VALIDATION_OPT_OUT;
> > =C2=A0
> > =C2=A0		kunit_info(test, "Testing tile id %d.\n", id);
> > =C2=A0		xe_vm_lock(m->q->vm, false);
> > -		xe_migrate_sanity_test(m, test);
> > +		xe_migrate_sanity_test(m, test, exec);
> > =C2=A0		xe_vm_unlock(m->q->vm);
> > =C2=A0	}
> > =C2=A0
> > @@ -490,7 +493,7 @@ static struct dma_fence *blt_copy(struct xe_tile *t=
ile,
> > =C2=A0
> > =C2=A0static void test_migrate(struct xe_device *xe, struct xe_tile *ti=
le,
> > =C2=A0			 struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct xe_bo *cc=
s_bo,
> > -			 struct kunit *test)
> > +			 struct drm_exec *exec, struct kunit *test)
> > =C2=A0{
> > =C2=A0	struct dma_fence *fence;
> > =C2=A0	u64 expected, retval;
> > @@ -509,7 +512,7 @@ static void test_migrate(struct xe_device *xe, stru=
ct xe_tile *tile,
> > =C2=A0	dma_fence_put(fence);
> > =C2=A0
> > =C2=A0	kunit_info(test, "Evict vram buffer object\n");
> > -	ret =3D xe_bo_evict(vram_bo);
> > +	ret =3D xe_bo_evict(vram_bo, exec);
> > =C2=A0	if (ret) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to evict bo.\n");
> > =C2=A0		return;
> > @@ -538,7 +541,7 @@ static void test_migrate(struct xe_device *xe, stru=
ct xe_tile *tile,
> > =C2=A0	dma_fence_put(fence);
> > =C2=A0
> > =C2=A0	kunit_info(test, "Restore vram buffer object\n");
> > -	ret =3D xe_bo_validate(vram_bo, NULL, false);
> > +	ret =3D xe_bo_validate(vram_bo, NULL, false, exec);
> > =C2=A0	if (ret) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
> > =C2=A0		return;
> > @@ -636,6 +639,7 @@ static void validate_ccs_test_run_tile(struct xe_de=
vice *xe, struct xe_tile *til
> > =C2=A0{
> > =C2=A0	struct xe_bo *sys_bo, *vram_bo =3D NULL, *ccs_bo =3D NULL;
> > =C2=A0	unsigned int bo_flags =3D XE_BO_FLAG_VRAM_IF_DGFX(tile);
> > +	struct drm_exec *exec;
> > =C2=A0	long ret;
> > =C2=A0
> > =C2=A0	sys_bo =3D xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> > @@ -650,8 +654,9 @@ static void validate_ccs_test_run_tile(struct xe_de=
vice *xe, struct xe_tile *til
> > =C2=A0		return;
> > =C2=A0	}
> > =C2=A0
> > +	exec =3D XE_VALIDATION_OPT_OUT;
> > =C2=A0	xe_bo_lock(sys_bo, false);
> > -	ret =3D xe_bo_validate(sys_bo, NULL, false);
> > +	ret =3D xe_bo_validate(sys_bo, NULL, false, exec);
> > =C2=A0	if (ret) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret=
);
> > =C2=A0		goto free_sysbo;
> > @@ -676,7 +681,7 @@ static void validate_ccs_test_run_tile(struct xe_de=
vice *xe, struct xe_tile *til
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	xe_bo_lock(ccs_bo, false);
> > -	ret =3D xe_bo_validate(ccs_bo, NULL, false);
> > +	ret =3D xe_bo_validate(ccs_bo, NULL, false, exec);
> > =C2=A0	if (ret) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret=
);
> > =C2=A0		goto free_ccsbo;
> > @@ -700,7 +705,7 @@ static void validate_ccs_test_run_tile(struct xe_de=
vice *xe, struct xe_tile *til
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	xe_bo_lock(vram_bo, false);
> > -	ret =3D xe_bo_validate(vram_bo, NULL, false);
> > +	ret =3D xe_bo_validate(vram_bo, NULL, false, exec);
> > =C2=A0	if (ret) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
> > =C2=A0		goto free_vrambo;
> > @@ -713,7 +718,7 @@ static void validate_ccs_test_run_tile(struct xe_de=
vice *xe, struct xe_tile *til
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	test_clear(xe, tile, sys_bo, vram_bo, test);
> > -	test_migrate(xe, tile, sys_bo, vram_bo, ccs_bo, test);
> > +	test_migrate(xe, tile, sys_bo, vram_bo, ccs_bo, exec, test);
> > =C2=A0	xe_bo_unlock(vram_bo);
> > =C2=A0
> > =C2=A0	xe_bo_lock(vram_bo, false);
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 11eaf3b06766..e71addf51ed0 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1139,6 +1139,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, =
struct ttm_buffer_object *bo,
> > =C2=A0int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
> > +	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0	struct xe_bo *backup;
> > =C2=A0	int ret =3D 0;
> > =C2=A0
> > @@ -1163,7 +1164,7 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *b=
o)
> > =C2=A0	backup =3D ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.r=
esv, NULL, xe_bo_size(bo),
> > =C2=A0					DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> > =C2=A0					XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > -					XE_BO_FLAG_PINNED);
> > +					XE_BO_FLAG_PINNED, exec);
> > =C2=A0	if (IS_ERR(backup)) {
> > =C2=A0		ret =3D PTR_ERR(backup);
> > =C2=A0		goto out_unlock_bo;
> > @@ -1214,6 +1215,7 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo =
*bo)
> > =C2=A0int xe_bo_evict_pinned(struct xe_bo *bo)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
> > +	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0	struct xe_bo *backup =3D bo->backup_obj;
> > =C2=A0	bool backup_created =3D false;
> > =C2=A0	bool unmap =3D false;
> > @@ -1242,7 +1244,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> > =C2=A0						NULL, xe_bo_size(bo),
> > =C2=A0						DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> > =C2=A0						XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > -						XE_BO_FLAG_PINNED);
> > +						XE_BO_FLAG_PINNED, exec);
> > =C2=A0		if (IS_ERR(backup)) {
> > =C2=A0			ret =3D PTR_ERR(backup);
> > =C2=A0			goto out_unlock_bo;
> > @@ -1718,12 +1720,14 @@ static vm_fault_t xe_gem_fault(struct vm_fault =
*vmf)
> > =C2=A0	struct xe_device *xe =3D to_xe_device(ddev);
> > =C2=A0	struct xe_bo *bo =3D ttm_to_xe_bo(tbo);
> > =C2=A0	bool needs_rpm =3D bo->flags & XE_BO_FLAG_VRAM_MASK;
> > +	struct drm_exec *exec;
> > =C2=A0	vm_fault_t ret;
> > =C2=A0	int idx;
> > =C2=A0
> > =C2=A0	if (needs_rpm)
> > =C2=A0		xe_pm_runtime_get(xe);
> > =C2=A0
> > +	exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0	ret =3D ttm_bo_vm_reserve(tbo, vmf);
> > =C2=A0	if (ret)
> > =C2=A0		goto out;
> > @@ -1731,6 +1735,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *v=
mf)
> > =C2=A0	if (drm_dev_enter(ddev, &idx)) {
> > =C2=A0		trace_xe_bo_cpu_fault(bo);
> > =C2=A0
> > +		xe_validation_assert_exec(xe, exec, &tbo->base);
> > =C2=A0		ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TTM_BO_VM_NUM_PREFAULT)=
;
> > =C2=A0		drm_dev_exit(idx);
> > @@ -1850,11 +1855,32 @@ void xe_bo_free(struct xe_bo *bo)
> > =C2=A0	kfree(bo);
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * ___xe_bo_create_locked() - Initialize or create an xe_bo.
> > + * @xe: The xe device.
> > + * @bo: An already allocated buffer object or NULL
> > + * if the function should allocate a new one.
> > + * @tile: The tile to select for migration of this bo, and the tile us=
ed for
> > + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos=
.
> > + * @resv: Pointer to a locked shared reservation object to use fo this=
 bo,
> > + * or NULL for the xe_bo to use its own.
> > + * @bulk: The bulk move to use for LRU bumping, or NULL for external b=
os.
> > + * @size: The storage size to use for the bo.
> > + * @cpu_caching: The cpu caching used for system memory backing store.
> > + * @type: The TTM buffer object type.
> > + * @flags: XE_BO_FLAG_ flags.
> > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > + *
> > + * Initialize or create an xe buffer object. On failure, any allocated=
 buffer
> > + * object passed in @bo will have been unreferenced.
> > + *
> > + * Return: The buffer object on success. Negative error pointer on fai=
lure.
> > + */
> > =C2=A0struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct=
 xe_bo *bo,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, struct dma_res=
v *resv,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_lru_bulk_move *bulk, size=
_t size,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 u16 cpu_caching, enum ttm_bo_type ty=
pe,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 u32 flags)
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 flags, struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct ttm_operation_ctx ctx =3D {
> > =C2=A0		.interruptible =3D true,
> > @@ -1923,6 +1949,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_de=
vice *xe, struct xe_bo *bo,
> > =C2=A0		ctx.resv =3D resv;
> > =C2=A0	}
> > =C2=A0
> > +	xe_validation_assert_exec(xe, exec, &bo->ttm.base);
> > =C2=A0	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
> > =C2=A0		err =3D __xe_bo_placement_for_flags(xe, bo, bo->flags);
> > =C2=A0		if (WARN_ON(err)) {
> > @@ -2024,7 +2051,7 @@ __xe_bo_create_locked(struct xe_device *xe,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, struct xe_=
vm *vm,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t size, u64 start, u64 end,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 cpu_caching, enum ttm_bo_typ=
e type, u32 flags,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 alignment)
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 alignment, struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct xe_bo *bo =3D NULL;
> > =C2=A0	int err;
> > @@ -2049,7 +2076,7 @@ __xe_bo_create_locked(struct xe_device *xe,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 vm && !xe_vm_in_fault_mode(vm) &&
> > =C2=A0				=C2=A0=C2=A0=C2=A0 flags & XE_BO_FLAG_USER ?
> > =C2=A0				=C2=A0=C2=A0=C2=A0 &vm->lru_bulk_move : NULL, size,
> > -				=C2=A0=C2=A0=C2=A0 cpu_caching, type, flags);
> > +				=C2=A0=C2=A0=C2=A0 cpu_caching, type, flags, exec);
> > =C2=A0	if (IS_ERR(bo))
> > =C2=A0		return bo;
> > =C2=A0
> > @@ -2083,9 +2110,10 @@ __xe_bo_create_locked(struct xe_device *xe,
> > =C2=A0
> > =C2=A0			if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
> > =C2=A0				err =3D xe_ggtt_insert_bo_at(t->mem.ggtt, bo,
> > -							=C2=A0=C2=A0 start + xe_bo_size(bo), U64_MAX);
> > +							=C2=A0=C2=A0 start + xe_bo_size(bo), U64_MAX,
> > +							=C2=A0=C2=A0 exec);
> > =C2=A0			} else {
> > -				err =3D xe_ggtt_insert_bo(t->mem.ggtt, bo);
> > +				err =3D xe_ggtt_insert_bo(t->mem.ggtt, bo, exec);
> > =C2=A0			}
> > =C2=A0			if (err)
> > =C2=A0				goto err_unlock_put_bo;
> > @@ -2102,22 +2130,59 @@ __xe_bo_create_locked(struct xe_device *xe,
> > =C2=A0	return ERR_PTR(err);
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_bo_create_locked_range() - Create a BO with range- and alignment=
 options
> > + * @xe: The xe device.
> > + * @tile: The tile to select for migration of this bo, and the tile us=
ed for
> > + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos=
.
> > + * @vm: The local vm or NULL for external objects.
> > + * @size: The storage size to use for the bo.
> > + * @start: Start of fixed VRAM range or 0.
> > + * @end: End of fixed VRAM range or ~0ULL.
> > + * @type: The TTM buffer object type.
> > + * @flags: XE_BO_FLAG_ flags.
> > + * @alignment: For GGTT buffer objects, the minimum GGTT alignment.
> > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > + *
> > + * Create an Xe BO with range- and alignment options. If @start and @e=
nd indicate
> > + * a fixed VRAM range, this must be a ttm_bo_type_kernel bo with VRAM =
placement
> > + * only. The @alignment parameter can be used for GGTT alignment.
> > + *
> > + * Return: The buffer object on success. Negative error pointer on fai=
lure.
> > + */
> > =C2=A0struct xe_bo *
> > =C2=A0xe_bo_create_locked_range(struct xe_device *xe,
> > =C2=A0			=C2=A0 struct xe_tile *tile, struct xe_vm *vm,
> > =C2=A0			=C2=A0 size_t size, u64 start, u64 end,
> > -			=C2=A0 enum ttm_bo_type type, u32 flags, u64 alignment)
> > +			=C2=A0 enum ttm_bo_type type, u32 flags, u64 alignment,
> > +			=C2=A0 struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	return __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, =
type,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 flags, alignment);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 flags, alignment, exec);
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_bo_create_locked() - Create a BO
> > + * @xe: The xe device.
> > + * @tile: The tile to select for migration of this bo, and the tile us=
ed for
> > + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos=
.
> > + * @vm: The local vm or NULL for external objects.
> > + * @size: The storage size to use for the bo.
> > + * @type: The TTM buffer object type.
> > + * @flags: XE_BO_FLAG_ flags.
> > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > + *
> > + * Create a locked xe BO with no range- nor alignment restrictions.
> > + *
> > + * Return: The buffer object on success. Negative error pointer on fai=
lure.
> > + */
> > =C2=A0struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe=
_tile *tile,
> > =C2=A0				=C2=A0 struct xe_vm *vm, size_t size,
> > -				=C2=A0 enum ttm_bo_type type, u32 flags)
> > +				=C2=A0 enum ttm_bo_type type, u32 flags,
> > +				=C2=A0 struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, ty=
pe,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 flags, 0);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 flags, 0, exec);
> > =C2=A0}
> > =C2=A0
> > =C2=A0struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_t=
ile *tile,
> > @@ -2125,9 +2190,10 @@ struct xe_bo *xe_bo_create_user(struct xe_device=
 *xe, struct xe_tile *tile,
> > =C2=A0				u16 cpu_caching,
> > =C2=A0				u32 flags)
> > =C2=A0{
> > +	struct drm_exec *exec =3D vm ? xe_vm_validation_exec(vm) : XE_VALIDAT=
ION_UNIMPLEMENTED;
> > =C2=A0	struct xe_bo *bo =3D __xe_bo_create_locked(xe, tile, vm, size, 0=
, ~0ULL,
> > =C2=A0						 cpu_caching, ttm_bo_type_device,
> > -						 flags | XE_BO_FLAG_USER, 0);
> > +						 flags | XE_BO_FLAG_USER, 0, exec);
> > =C2=A0	if (!IS_ERR(bo))
> > =C2=A0		xe_bo_unlock_vm_held(bo);
> > =C2=A0
> > @@ -2138,7 +2204,8 @@ struct xe_bo *xe_bo_create(struct xe_device *xe, =
struct xe_tile *tile,
> > =C2=A0			=C2=A0=C2=A0 struct xe_vm *vm, size_t size,
> > =C2=A0			=C2=A0=C2=A0 enum ttm_bo_type type, u32 flags)
> > =C2=A0{
> > -	struct xe_bo *bo =3D xe_bo_create_locked(xe, tile, vm, size, type, fl=
ags);
> > +	struct drm_exec *exec =3D vm ? xe_vm_validation_exec(vm) : XE_VALIDAT=
ION_UNIMPLEMENTED;
> > +	struct xe_bo *bo =3D xe_bo_create_locked(xe, tile, vm, size, type, fl=
ags, exec);
> > =C2=A0
> > =C2=A0	if (!IS_ERR(bo))
> > =C2=A0		xe_bo_unlock_vm_held(bo);
> > @@ -2166,6 +2233,7 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(str=
uct xe_device *xe,
> > =C2=A0	int err;
> > =C2=A0	u64 start =3D offset =3D=3D ~0ull ? 0 : offset;
> > =C2=A0	u64 end =3D offset =3D=3D ~0ull ? offset : start + size;
> > +	struct drm_exec *exec =3D vm ? xe_vm_validation_exec(vm) : XE_VALIDAT=
ION_UNIMPLEMENTED;
> > =C2=A0
> > =C2=A0	if (flags & XE_BO_FLAG_STOLEN &&
> > =C2=A0	=C2=A0=C2=A0=C2=A0 xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> > @@ -2173,11 +2241,11 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(s=
truct xe_device *xe,
> > =C2=A0
> > =C2=A0	bo =3D xe_bo_create_locked_range(xe, tile, vm, size, start, end,=
 type,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags | XE_BO_FLAG_NEEDS=
_CPU_ACCESS | XE_BO_FLAG_PINNED,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alignment);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alignment, exec);
> > =C2=A0	if (IS_ERR(bo))
> > =C2=A0		return bo;
> > =C2=A0
> > -	err =3D xe_bo_pin(bo);
> > +	err =3D xe_bo_pin(bo, exec);
> > =C2=A0	if (err)
> > =C2=A0		goto err_put;
> > =C2=A0
> > @@ -2299,6 +2367,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resour=
ce *res)
> > =C2=A0/**
> > =C2=A0 * xe_bo_pin_external - pin an external BO
> > =C2=A0 * @bo: buffer object to be pinned
> > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > =C2=A0 *
> > =C2=A0 * Pin an external (not tied to a VM, can be exported via dma-buf=
 / prime FD)
> > =C2=A0 * BO. Unique call compared to xe_bo_pin as this function has it =
own set of
> > @@ -2306,7 +2375,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resour=
ce *res)
> > =C2=A0 *
> > =C2=A0 * Returns 0 for success, negative error code otherwise.
> > =C2=A0 */
> > -int xe_bo_pin_external(struct xe_bo *bo)
> > +int xe_bo_pin_external(struct xe_bo *bo, struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> > =C2=A0	int err;
> > @@ -2315,7 +2384,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
> > =C2=A0	xe_assert(xe, xe_bo_is_user(bo));
> > =C2=A0
> > =C2=A0	if (!xe_bo_is_pinned(bo)) {
> > -		err =3D xe_bo_validate(bo, NULL, false);
> > +		err =3D xe_bo_validate(bo, NULL, false, exec);
> > =C2=A0		if (err)
> > =C2=A0			return err;
> > =C2=A0
> > @@ -2337,7 +2406,17 @@ int xe_bo_pin_external(struct xe_bo *bo)
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > -int xe_bo_pin(struct xe_bo *bo)
> > +/**
> > + * xe_bo_pin() - Pin a kernel bo after potentially migrating it
> > + * @bo: The kernel bo to pin.
> > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > + *
> > + * Attempts to migrate a bo to @bo->placement. If that succeeds,
> > + * pins the bo.
> > + *
> > + * Return: %0 on success, negative error code on migration failure.
> > + */
> > +int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct ttm_place *place =3D &bo->placements[0];
> > =C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> > @@ -2359,7 +2438,7 @@ int xe_bo_pin(struct xe_bo *bo)
> > =C2=A0	/* We only expect at most 1 pin */
> > =C2=A0	xe_assert(xe, !xe_bo_is_pinned(bo));
> > =C2=A0
> > -	err =3D xe_bo_validate(bo, NULL, false);
> > +	err =3D xe_bo_validate(bo, NULL, false, exec);
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > @@ -2452,6 +2531,7 @@ void xe_bo_unpin(struct xe_bo *bo)
> > =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL. Used together with @allow_=
res_evict.
> > =C2=A0 * @allow_res_evict: Whether it's allowed to evict bos sharing @v=
m's
> > =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reservation object.
> > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > =C2=A0 *
> > =C2=A0 * Make sure the bo is in allowed placement, migrating it if nece=
ssary. If
> > =C2=A0 * needed, other bos will be evicted. If bos selected for evictio=
n shares
> > @@ -2461,7 +2541,8 @@ void xe_bo_unpin(struct xe_bo *bo)
> > =C2=A0 * Return: 0 on success, negative error code on failure. May retu=
rn
> > =C2=A0 * -EINTR or -ERESTARTSYS if internal waits are interrupted by a =
signal.
> > =C2=A0 */
> > -int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_=
evict)
> > +int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_=
evict,
> > +		=C2=A0=C2=A0 struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct ttm_operation_ctx ctx =3D {
> > =C2=A0		.interruptible =3D true,
> > @@ -2480,6 +2561,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm=
 *vm, bool allow_res_evict)
> > =C2=A0
> > =C2=A0	xe_vm_set_validating(vm, allow_res_evict);
> > =C2=A0	trace_xe_bo_validate(bo);
> > +	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
> > =C2=A0	ret =3D ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> > =C2=A0	xe_vm_clear_validating(vm, allow_res_evict);
> > =C2=A0
> > @@ -2917,6 +2999,7 @@ static void xe_place_from_ttm_type(u32 mem_type, =
struct ttm_place *place)
> > =C2=A0 * xe_bo_migrate - Migrate an object to the desired region id
> > =C2=A0 * @bo: The buffer object to migrate.
> > =C2=A0 * @mem_type: The TTM region type to migrate to.
> > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > =C2=A0 *
> > =C2=A0 * Attempt to migrate the buffer object to the desired memory reg=
ion. The
> > =C2=A0 * buffer object may not be pinned, and must be locked.
> > @@ -2928,7 +3011,7 @@ static void xe_place_from_ttm_type(u32 mem_type, =
struct ttm_place *place)
> > =C2=A0 * Return: 0 on success. Negative error code on failure. In parti=
cular may
> > =C2=A0 * return -EINTR or -ERESTARTSYS if signal pending.
> > =C2=A0 */
> > -int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
> > +int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exe=
c)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D ttm_to_xe_device(bo->ttm.bdev);
> > =C2=A0	struct ttm_operation_ctx ctx =3D {
> > @@ -2966,19 +3049,21 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_typ=
e)
> > =C2=A0		add_vram(xe, bo, &requested, bo->flags, mem_type, &c);
> > =C2=A0	}
> > =C2=A0
> > +	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
> > =C2=A0	return ttm_bo_validate(&bo->ttm, &placement, &ctx);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * xe_bo_evict - Evict an object to evict placement
> > =C2=A0 * @bo: The buffer object to migrate.
> > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > =C2=A0 *
> > =C2=A0 * On successful completion, the object memory will be moved to e=
vict
> > =C2=A0 * placement. This function blocks until the object has been full=
y moved.
> > =C2=A0 *
> > =C2=A0 * Return: 0 on success. Negative error code on failure.
> > =C2=A0 */
> > -int xe_bo_evict(struct xe_bo *bo)
> > +int xe_bo_evict(struct xe_bo *bo, struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct ttm_operation_ctx ctx =3D {
> > =C2=A0		.interruptible =3D false,
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 8cce413b5235..b1b6cb622d71 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -10,6 +10,7 @@
> > =C2=A0
> > =C2=A0#include "xe_bo_types.h"
> > =C2=A0#include "xe_macros.h"
> > +#include "xe_validation.h"
> > =C2=A0#include "xe_vm_types.h"
> > =C2=A0#include "xe_vm.h"
> > =C2=A0#include "xe_vram_types.h"
> > @@ -92,15 +93,17 @@ struct xe_bo *___xe_bo_create_locked(struct xe_devi=
ce *xe, struct xe_bo *bo,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, struct dma_res=
v *resv,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_lru_bulk_move *bulk, size=
_t size,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 u16 cpu_caching, enum ttm_bo_type ty=
pe,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 u32 flags);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 flags, struct drm_exec *exec);
> > =C2=A0struct xe_bo *
> > =C2=A0xe_bo_create_locked_range(struct xe_device *xe,
> > =C2=A0			=C2=A0 struct xe_tile *tile, struct xe_vm *vm,
> > =C2=A0			=C2=A0 size_t size, u64 start, u64 end,
> > -			=C2=A0 enum ttm_bo_type type, u32 flags, u64 alignment);
> > +			=C2=A0 enum ttm_bo_type type, u32 flags, u64 alignment,
> > +			=C2=A0 struct drm_exec *exec);
> > =C2=A0struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe=
_tile *tile,
> > =C2=A0				=C2=A0 struct xe_vm *vm, size_t size,
> > -				=C2=A0 enum ttm_bo_type type, u32 flags);
> > +				=C2=A0 enum ttm_bo_type type, u32 flags,
> > +				=C2=A0 struct drm_exec *exec);
> > =C2=A0struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *=
tile,
> > =C2=A0			=C2=A0=C2=A0 struct xe_vm *vm, size_t size,
> > =C2=A0			=C2=A0=C2=A0 enum ttm_bo_type type, u32 flags);
> > @@ -200,11 +203,12 @@ static inline void xe_bo_unlock_vm_held(struct xe=
_bo *bo)
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > -int xe_bo_pin_external(struct xe_bo *bo);
> > -int xe_bo_pin(struct xe_bo *bo);
> > +int xe_bo_pin_external(struct xe_bo *bo, struct drm_exec *exec);
> > +int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec);
> > =C2=A0void xe_bo_unpin_external(struct xe_bo *bo);
> > =C2=A0void xe_bo_unpin(struct xe_bo *bo);
> > -int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_=
evict);
> > +int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_=
evict,
> > +		=C2=A0=C2=A0 struct drm_exec *exec);
> > =C2=A0
> > =C2=A0static inline bool xe_bo_is_pinned(struct xe_bo *bo)
> > =C2=A0{
> > @@ -285,8 +289,8 @@ uint64_t vram_region_gpu_offset(struct ttm_resource=
 *res);
> > =C2=A0
> > =C2=A0bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
> > =C2=A0
> > -int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
> > -int xe_bo_evict(struct xe_bo *bo);
> > +int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exe=
c);
> > +int xe_bo_evict(struct xe_bo *bo, struct drm_exec *exec);
> > =C2=A0
> > =C2=A0int xe_bo_evict_pinned(struct xe_bo *bo);
> > =C2=A0int xe_bo_notifier_prepare_pinned(struct xe_bo *bo);
> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dm=
a_buf.c
> > index 346f857f3837..78a827d4e726 100644
> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > @@ -51,6 +51,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *=
attach)
> > =C2=A0	struct drm_gem_object *obj =3D attach->dmabuf->priv;
> > =C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > =C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> > +	struct drm_exec *exec =3D XE_VALIDATION_UNSUPPORTED;
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	/*
> > @@ -63,7 +64,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *=
attach)
> > =C2=A0		return -EINVAL;
> > =C2=A0	}
> > =C2=A0
> > -	ret =3D xe_bo_migrate(bo, XE_PL_TT);
> > +	ret =3D xe_bo_migrate(bo, XE_PL_TT, exec);
> > =C2=A0	if (ret) {
> > =C2=A0		if (ret !=3D -EINTR && ret !=3D -ERESTARTSYS)
> > =C2=A0			drm_dbg(&xe->drm,
> > @@ -72,7 +73,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *=
attach)
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > -	ret =3D xe_bo_pin_external(bo);
> > +	ret =3D xe_bo_pin_external(bo, exec);
> > =C2=A0	xe_assert(xe, !ret);
> > =C2=A0
> > =C2=A0	return 0;
> > @@ -92,6 +93,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf=
_attachment *attach,
> > =C2=A0	struct dma_buf *dma_buf =3D attach->dmabuf;
> > =C2=A0	struct drm_gem_object *obj =3D dma_buf->priv;
> > =C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > +	struct drm_exec *exec =3D XE_VALIDATION_UNSUPPORTED;
> > =C2=A0	struct sg_table *sgt;
> > =C2=A0	int r =3D 0;
> > =C2=A0
> > @@ -100,9 +102,9 @@ static struct sg_table *xe_dma_buf_map(struct dma_b=
uf_attachment *attach,
> > =C2=A0
> > =C2=A0	if (!xe_bo_is_pinned(bo)) {
> > =C2=A0		if (!attach->peer2peer)
> > -			r =3D xe_bo_migrate(bo, XE_PL_TT);
> > +			r =3D xe_bo_migrate(bo, XE_PL_TT, exec);
> > =C2=A0		else
> > -			r =3D xe_bo_validate(bo, NULL, false);
> > +			r =3D xe_bo_validate(bo, NULL, false, exec);
> > =C2=A0		if (r)
> > =C2=A0			return ERR_PTR(r);
> > =C2=A0	}
> > @@ -161,13 +163,14 @@ static int xe_dma_buf_begin_cpu_access(struct dma=
_buf *dma_buf,
> > =C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > =C2=A0	bool reads =3D=C2=A0 (direction =3D=3D DMA_BIDIRECTIONAL ||
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 direction =3D=3D DMA_FROM_=
DEVICE);
> > +	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0
> > =C2=A0	if (!reads)
> > =C2=A0		return 0;
> > =C2=A0
> > =C2=A0	/* Can we do interruptible lock here? */
> > =C2=A0	xe_bo_lock(bo, false);
> > -	(void)xe_bo_migrate(bo, XE_PL_TT);
> > +	(void)xe_bo_migrate(bo, XE_PL_TT, exec);
> > =C2=A0	xe_bo_unlock(bo);
> > =C2=A0
> > =C2=A0	return 0;
> > @@ -208,13 +211,14 @@ xe_dma_buf_init_obj(struct drm_device *dev, struc=
t xe_bo *storage,
> > =C2=A0{
> > =C2=A0	struct dma_resv *resv =3D dma_buf->resv;
> > =C2=A0	struct xe_device *xe =3D to_xe_device(dev);
> > +	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0	struct xe_bo *bo;
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	dma_resv_lock(resv, NULL);
> > =C2=A0	bo =3D ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma=
_buf->size,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 0, /* Will require 1way or 2way for vm_bin=
d */
> > -				=C2=A0=C2=A0=C2=A0 ttm_bo_type_sg, XE_BO_FLAG_SYSTEM);
> > +				=C2=A0=C2=A0=C2=A0 ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, exec);
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		ret =3D PTR_ERR(bo);
> > =C2=A0		goto error;
> > @@ -232,8 +236,9 @@ static void xe_dma_buf_move_notify(struct dma_buf_a=
ttachment *attach)
> > =C2=A0{
> > =C2=A0	struct drm_gem_object *obj =3D attach->importer_priv;
> > =C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > +	struct drm_exec *exec =3D XE_VALIDATION_UNSUPPORTED;
> > =C2=A0
> > -	XE_WARN_ON(xe_bo_evict(bo));
> > +	XE_WARN_ON(xe_bo_evict(bo, exec));
> > =C2=A0}
> > =C2=A0
> > =C2=A0static const struct dma_buf_attach_ops xe_dma_buf_attach_ops =3D =
{
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.=
c
> > index 44364c042ad7..0bcb4fb9a10e 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -97,9 +97,13 @@
> > =C2=A0static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
> > =C2=A0{
> > =C2=A0	struct xe_vm *vm =3D container_of(vm_exec->vm, struct xe_vm, gpu=
vm);
> > +	int ret;
> > =C2=A0
> > =C2=A0	/* The fence slot added here is intended for the exec sched job.=
 */
> > -	return xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
> > +	xe_vm_set_validation_exec(vm, &vm_exec->exec);
> > +	ret =3D xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
> > +	xe_vm_set_validation_exec(vm, NULL);
> > +	return ret;
> > =C2=A0}
> > =C2=A0
> > =C2=A0int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_=
file *file)
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.=
c
> > index e03222f5ac5a..a47c0131956b 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -731,7 +731,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, =
struct xe_bo *bo)
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe=
_bo *bo,
> > -				=C2=A0 u64 start, u64 end)
> > +				=C2=A0 u64 start, u64 end, struct drm_exec *exec)
> > =C2=A0{
> > =C2=A0	u64 alignment =3D bo->min_align > 0 ? bo->min_align : XE_PAGE_SI=
ZE;
> > =C2=A0	u8 tile_id =3D ggtt->tile->id;
> > @@ -746,7 +746,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *g=
gtt, struct xe_bo *bo,
> > =C2=A0		return 0;
> > =C2=A0	}
> > =C2=A0
> > -	err =3D xe_bo_validate(bo, NULL, false);
> > +	err =3D xe_bo_validate(bo, NULL, false, exec);
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > @@ -788,25 +788,28 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt =
*ggtt, struct xe_bo *bo,
> > =C2=A0 * @bo: the &xe_bo to be inserted
> > =C2=A0 * @start: address where it will be inserted
> > =C2=A0 * @end: end of the range where it will be inserted
> > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > =C2=A0 *
> > =C2=A0 * Return: 0 on success or a negative error code on failure.
> > =C2=A0 */
> > =C2=A0int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > -			 u64 start, u64 end)
> > +			 u64 start, u64 end, struct drm_exec *exec)
> > =C2=A0{
> > -	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
> > +	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end, exec);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * xe_ggtt_insert_bo - Insert BO into GGTT
> > =C2=A0 * @ggtt: the &xe_ggtt where bo will be inserted
> > =C2=A0 * @bo: the &xe_bo to be inserted
> > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > =C2=A0 *
> > =C2=A0 * Return: 0 on success or a negative error code on failure.
> > =C2=A0 */
> > -int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> > +int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_exec *exec)
> > =C2=A0{
> > -	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
> > +	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX, exec);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.=
h
> > index fbe1e397d05d..75fc7a1efea7 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> > @@ -10,6 +10,7 @@
> > =C2=A0
> > =C2=A0struct drm_printer;
> > =C2=A0struct xe_tile;
> > +struct drm_exec;
> > =C2=A0
> > =C2=A0struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
> > =C2=A0int xe_ggtt_init_early(struct xe_ggtt *ggtt);
> > @@ -31,9 +32,9 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node=
 *node);
> > =C2=A0void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *no=
de,
> > =C2=A0		=C2=A0=C2=A0=C2=A0 struct xe_bo *bo, u16 pat_index);
> > =C2=A0void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *=
bo);
> > -int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> > +int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct d=
rm_exec *exec);
> > =C2=A0int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > -			 u64 start, u64 end);
> > +			 u64 start, u64 end, struct drm_exec *exec);
> > =C2=A0void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> > =C2=A0u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64=
 *spare);
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/=
xe_gt_pagefault.c
> > index ab43dec52776..2c7f10cc423f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -94,12 +94,12 @@ static int xe_pf_begin(struct drm_exec *exec, struc=
t xe_vma *vma,
> > =C2=A0		}
> > =C2=A0
> > =C2=A0		/* Migrate to VRAM, move should invalidate the VMA first */
> > -		err =3D xe_bo_migrate(bo, vram->placement);
> > +		err =3D xe_bo_migrate(bo, vram->placement, exec);
> > =C2=A0		if (err)
> > =C2=A0			return err;
> > =C2=A0	} else if (bo) {
> > =C2=A0		/* Create backing store if needed */
> > -		err =3D xe_bo_validate(bo, vm, true);
> > +		err =3D xe_bo_validate(bo, vm, true, exec);
> > =C2=A0		if (err)
> > =C2=A0			return err;
> > =C2=A0	}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/d=
rm/xe/xe_gt_sriov_pf_config.c
> > index c8f0320d032f..906011671b60 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -1452,6 +1452,7 @@ static bool pf_release_vf_config_lmem(struct xe_g=
t *gt, struct xe_gt_sriov_confi
> > =C2=A0static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vf=
id, u64 size)
> > =C2=A0{
> > =C2=A0	struct xe_gt_sriov_config *config =3D pf_pick_vf_config(gt, vfid=
);
> > +	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> > =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> > =C2=A0	struct xe_bo *bo;
> > @@ -1484,11 +1485,12 @@ static int pf_provision_vf_lmem(struct xe_gt *g=
t, unsigned int vfid, u64 size)
> > =C2=A0				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > =C2=A0				 XE_BO_FLAG_NEEDS_2M |
> > =C2=A0				 XE_BO_FLAG_PINNED |
> > -				 XE_BO_FLAG_PINNED_LATE_RESTORE);
> > +				 XE_BO_FLAG_PINNED_LATE_RESTORE,
> > +				 exec);
> > =C2=A0	if (IS_ERR(bo))
> > =C2=A0		return PTR_ERR(bo);
> > =C2=A0
> > -	err =3D xe_bo_pin(bo);
> > +	err =3D xe_bo_pin(bo, exec);
> > =C2=A0	xe_bo_unlock(bo);
> > =C2=A0	if (unlikely(err)) {
> > =C2=A0		xe_bo_put(bo);
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index e35c6d4def20..39e3aa6df25a 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -700,6 +700,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pa=
gemap *dpagemap,
> > =C2=A0	struct device *dev =3D xe->drm.dev;
> > =C2=A0	struct drm_buddy_block *block;
> > =C2=A0	struct list_head *blocks;
> > +	struct drm_exec *exec;
> > =C2=A0	struct xe_bo *bo;
> > =C2=A0	ktime_t time_end =3D 0;
> > =C2=A0	int err, idx;
> > @@ -708,12 +709,13 @@ static int xe_drm_pagemap_populate_mm(struct drm_=
pagemap *dpagemap,
> > =C2=A0		return -ENODEV;
> > =C2=A0
> > =C2=A0	xe_pm_runtime_get(xe);
> > +	exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0
> > =C2=A0 retry:
> > =C2=A0	bo =3D xe_bo_create_locked(vr->xe, NULL, NULL, end - start,
> > =C2=A0				 ttm_bo_type_device,
> > =C2=A0				 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
> > -				 XE_BO_FLAG_CPU_ADDR_MIRROR);
> > +				 XE_BO_FLAG_CPU_ADDR_MIRROR, exec);
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		err =3D PTR_ERR(bo);
> > =C2=A0		if (xe_vm_validate_should_retry(NULL, err, &time_end))
> > diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe=
_validation.c
> > new file mode 100644
> > index 000000000000..cc0684d24e02
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_validation.c
> > @@ -0,0 +1,49 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =C2=A9 2024 Intel Corporation
> > + */
> > +#include "xe_bo.h"
> > +#include <drm/drm_exec.h>
> > +#include <drm/drm_gem.h>
> > +
> > +#include "xe_assert.h"
> > +#include "xe_validation.h"
> > +
> > +#ifdef CONFIG_DRM_XE_DEBUG
> > +/**
> > + * xe_validation_assert_exec() - Assert that the drm_exec pointer is s=
uitable
> > + * for validation.
> > + * @xe: Pointer to the xe device.
> > + * @exec: The drm_exec pointer to check.
> > + * @obj: Pointer to the object subject to validation.
> > + *
> > + * NULL exec pointers are not allowed.
> > + * For XE_VALIDATION_UNIMPLEMENTED, no checking.
> > + * For XE_VLIDATION_OPT_OUT, check that the caller is a kunit test
> > + * For XE_VALIDATION_UNSUPPORTED, check that the object subject to
> > + * validation is a dma-buf, for which support for ww locking is
> > + * not in place in the dma-buf layer.
> > + */
> > +void xe_validation_assert_exec(const struct xe_device *xe,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_exec *exec,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gem_object *o=
bj)
> > +{
> > +	xe_assert(xe, exec);
> > +	if (IS_ERR(exec)) {
> > +		switch (PTR_ERR(exec)) {
> > +		case __XE_VAL_UNIMPLEMENTED:
> > +			break;
> > +		case __XE_VAL_UNSUPPORTED:
> > +			xe_assert(xe, !!obj->dma_buf);
> > +			break;
> > +#if IS_ENABLED(CONFIG_KUNIT)
> > +		case __XE_VAL_OPT_OUT:
> > +			xe_assert(xe, current->kunit_test);
> > +			break;
> > +#endif
> > +		default:
> > +			xe_assert(xe, false);
> > +		}
> > +	}
> > +}
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe=
_validation.h
> > new file mode 100644
> > index 000000000000..db50feacad7a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_validation.h
> > @@ -0,0 +1,69 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright =C2=A9 2024 Intel Corporation
> > + */
> > +#ifndef _XE_VALIDATION_H_
> > +#define _XE_VALIDATION_H_
> > +
> > +#include <linux/dma-resv.h>
> > +#include <linux/types.h>
> > +
> > +struct drm_exec;
> > +struct drm_gem_object;
> > +struct xe_device;
> > +
> > +#ifdef CONFIG_PROVE_LOCKING
> > +/**
> > + * xe_validation_lockdep() - Assert that a drm_exec locking transactio=
n can
> > + * be initialized at this point.
> > + */
> > +static inline void xe_validation_lockdep(void)
> > +{
> > +	struct ww_acquire_ctx ticket;
> > +
> > +	ww_acquire_init(&ticket, &reservation_ww_class);
> > +	ww_acquire_fini(&ticket);
> > +}
> > +#else
> > +static inline void xe_validation_lockdep(void)
> > +{
> > +}
> > +#endif
> > +
> > +/*
> > + * Various values of the drm_exec pointer where we've not (yet)
> > + * implemented full ww locking.
> > + *
> > + * XE_VALIDATION_UNIMPLEMENTED means implementation is pending.
> > + * A lockdep check is made to assure that a drm_exec locking
> > + * transaction can actually take place where the macro is
> > + * used. If this asserts, the exec pointer needs to be assigned
> > + * higher up in the callchain and passed down.
> > + *
> > + * XE_VALIDATION_UNSUPPORTED is for dma-buf code only where
> > + * the dma-buf layer doesn't support WW locking.
> > + *
> > + * XE_VALIDATION_OPT_OUT is for simplification of kunit tests where
> > + * exhaustive eviction isn't necessary.
> > + */
> > +#define __XE_VAL_UNIMPLEMENTED -EINVAL
> > +#define XE_VALIDATION_UNIMPLEMENTED (xe_validation_lockdep(),		\
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 (struct drm_exec *)ERR_PTR(__XE_VAL_UNIMP=
LEMENTED))
> > +
> > +#define __XE_VAL_UNSUPPORTED -EOPNOTSUPP
> > +#define XE_VALIDATION_UNSUPPORTED ((struct drm_exec *)ERR_PTR(__XE_VAL=
_UNSUPPORTED))
> > +
> > +#define __XE_VAL_OPT_OUT -ENOMEM
> > +#define XE_VALIDATION_OPT_OUT (xe_validation_lockdep(), \
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (struct drm_exec *)ERR_PTR(__X=
E_VAL_OPT_OUT))
> > +#ifdef CONFIG_DRM_XE_DEBUG
> > +void xe_validation_assert_exec(const struct xe_device *xe, const struc=
t drm_exec *exec,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gem_object *o=
bj);
> > +#else
> > +#define xe_validation_assert_exec(_xe, _exec, _obj)	\
> > +	do {						\
> > +		(void)_xe; (void)_exec; (void)_obj;	\
> > +	} while (0)
> > +#endif
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 12e661960244..600aaadb4bee 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -393,7 +393,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *v=
m_bo, struct drm_exec *exec)
> > =C2=A0		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->rebind_list);
> > =C2=A0
> > -	ret =3D xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
> > +	ret =3D xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false, exec);
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > @@ -451,6 +451,7 @@ static int xe_preempt_work_begin(struct drm_exec *e=
xec, struct xe_vm *vm,
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > +	xe_vm_set_validation_exec(vm, exec);
> > =C2=A0	if (xe_vm_is_idle(vm)) {
> > =C2=A0		vm->preempt.rebind_deactivated =3D true;
> > =C2=A0		*done =3D true;
> > @@ -516,6 +517,7 @@ static void preempt_rebind_work_func(struct work_st=
ruct *w)
> > =C2=A0		err =3D xe_preempt_work_begin(&exec, vm, &done);
> > =C2=A0		drm_exec_retry_on_contention(&exec);
> > =C2=A0		if (err || done) {
> > +			xe_vm_set_validation_exec(vm, NULL);
> > =C2=A0			drm_exec_fini(&exec);
> > =C2=A0			if (err && xe_vm_validate_should_retry(&exec, err, &end))
> > =C2=A0				err =3D -EAGAIN;
> > @@ -565,6 +567,7 @@ static void preempt_rebind_work_func(struct work_st=
ruct *w)
> > =C2=A0	up_read(&vm->userptr.notifier_lock);
> > =C2=A0
> > =C2=A0out_unlock:
> > +	xe_vm_set_validation_exec(vm, NULL);
> > =C2=A0	drm_exec_fini(&exec);
> > =C2=A0out_unlock_outer:
> > =C2=A0	if (err =3D=3D -EAGAIN) {
> > @@ -1375,6 +1378,8 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct =
xe_vma *vma)
> > =C2=A0	err =3D drm_exec_lock_obj(exec, xe_vm_obj(vm));
> > =C2=A0	if (!err && bo && !bo->vm)
> > =C2=A0		err =3D drm_exec_lock_obj(exec, &bo->ttm.base);
> > +	if (!err)
> > +		xe_vm_set_validation_exec(vm, exec);
>=20
>=20
> Do you have imbalance here? I see this function called in xe_pf_begin
> and xe_vma_destroy_unlocked but I don't see
> xe_vm_set_validation_exec(vm, NULL) called.
>=20
>=20
> > =C2=A0
> > =C2=A0	return err;
> > =C2=A0}
> > @@ -2889,7 +2894,7 @@ static int vma_lock_and_validate(struct drm_exec =
*exec, struct xe_vma *vma,
> > =C2=A0			err =3D drm_exec_lock_obj(exec, &bo->ttm.base);
> > =C2=A0		if (!err && validate)
> > =C2=A0			err =3D xe_bo_validate(bo, vm,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0 !xe_vm_in_preempt_fence_mode(vm));
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 !xe_vm_in_preempt_fence_mode(vm), exec);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	return err;
> > @@ -3012,7 +3017,8 @@ static int op_lock_and_prep(struct drm_exec *exec=
, struct xe_vm *vm,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 false);
> > =C2=A0		if (!err && !xe_vma_has_no_bo(vma))
> > =C2=A0			err =3D xe_bo_migrate(xe_vma_bo(vma),
> > -					=C2=A0=C2=A0=C2=A0 region_to_mem_type[region]);
> > +					=C2=A0=C2=A0=C2=A0 region_to_mem_type[region],
> > +					=C2=A0=C2=A0=C2=A0 exec);
> > =C2=A0		break;
> > =C2=A0	}
> > =C2=A0	default:
> > @@ -3052,6 +3058,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct=
 drm_exec *exec,
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > +	xe_vm_set_validation_exec(vm, exec);
> > =C2=A0	list_for_each_entry(op, &vops->list, link) {
> > =C2=A0		err =3D op_lock_and_prep(exec, vm, op);
> > =C2=A0		if (err)
> > @@ -3850,10 +3857,18 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct x=
e_vm *vm, struct xe_bo *bo,
> > =C2=A0 */
> > =C2=A0int xe_vm_lock(struct xe_vm *vm, bool intr)
> > =C2=A0{
> > +	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > +	int ret;
> > +
> > =C2=A0	if (intr)
> > -		return dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> > +		ret =3D dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> > +	else
> > +		ret =3D dma_resv_lock(xe_vm_resv(vm), NULL);
> > +
> > +	if (!ret)
> > +		xe_vm_set_validation_exec(vm, exec);
> > =C2=A0
> > -	return dma_resv_lock(xe_vm_resv(vm), NULL);
> > +	return ret;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > @@ -3864,6 +3879,7 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
> > =C2=A0 */
> > =C2=A0void xe_vm_unlock(struct xe_vm *vm)
> > =C2=A0{
> > +	xe_vm_set_validation_exec(vm, NULL);
> > =C2=A0	dma_resv_unlock(xe_vm_resv(vm));
> > =C2=A0}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 2ecb417c19a2..4ba26eed7e96 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -321,7 +321,7 @@ static inline void xe_vm_set_validating(struct xe_v=
m *vm, bool allow_res_evict)
> > =C2=A0	if (vm && !allow_res_evict) {
> > =C2=A0		xe_vm_assert_held(vm);
> > =C2=A0		/* Pairs with READ_ONCE in xe_vm_is_validating() */
> > -		WRITE_ONCE(vm->validating, current);
> > +		WRITE_ONCE(vm->validation.validating, current);
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > @@ -339,7 +339,7 @@ static inline void xe_vm_clear_validating(struct xe=
_vm *vm, bool allow_res_evict
> > =C2=A0{
> > =C2=A0	if (vm && !allow_res_evict) {
> > =C2=A0		/* Pairs with READ_ONCE in xe_vm_is_validating() */
> > -		WRITE_ONCE(vm->validating, NULL);
> > +		WRITE_ONCE(vm->validation.validating, NULL);
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > @@ -357,13 +357,40 @@ static inline void xe_vm_clear_validating(struct =
xe_vm *vm, bool allow_res_evict
> > =C2=A0static inline bool xe_vm_is_validating(struct xe_vm *vm)
> > =C2=A0{
> > =C2=A0	/* Pairs with WRITE_ONCE in xe_vm_is_validating() */
> > -	if (READ_ONCE(vm->validating) =3D=3D current) {
> > +	if (READ_ONCE(vm->validation.validating) =3D=3D current) {
> > =C2=A0		xe_vm_assert_held(vm);
> > =C2=A0		return true;
> > =C2=A0	}
> > =C2=A0	return false;
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_vm_set_validation_exec() - Accessor to set the drm_exec object
> > + * @vm: The vm we want to register a drm_exec object with.
> > + * @exec: The exec object we want to register.
> > + *
> > + * Set the drm_exec object used to lock the vm's resv.
> > + */
> > +static inline void xe_vm_set_validation_exec(struct xe_vm *vm, struct =
drm_exec *exec)
> > +{
> > +	xe_vm_assert_held(vm);
> > +	vm->validation._exec =3D exec;
> > +}
> > +
> > +/**
> > + * xe_vm_set_validation_exec() - Accessor to read the drm_exec object
> > + * @vm: The vm we want to register a drm_exec object with.
> > + *
> > + * Return: The drm_exec object used to lock the vm's resv. The value
> > + * is a valid pointer, %NULL, or one of the special values defined in
> > + * xe_validation.h.
> > + */
> > +static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
> > +{
> > +	xe_vm_assert_held(vm);
> > +	return vm->validation._exec;
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * xe_vm_has_valid_gpu_mapping() - Advisory helper to check if VM=
A or SVM range has
> > =C2=A0 * a valid GPU mapping
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_v=
m_types.h
> > index 8a07feef503b..2f88808e36bb 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -312,19 +312,35 @@ struct xe_vm {
> > =C2=A0		bool capture_once;
> > =C2=A0	} error_capture;
> > =C2=A0
> > +	/**
> > +	 * @validation: Validation data only valid with the vm resv held.
> > +	 * Note: This is really task state of the task holding the vm resv,
> > +	 * and moving forward we should
> > +	 * come up with a better way of passing this down the call-
> > +	 * chain.
>=20
>=20
> I've already mentioned this, attaching the _exec xe_vma_ops might be
> good option as xe_vma_ops has lifetime of only existing for the bind
> (i.e., it is stack variable) so you'd only need to set it (i.e., no
> clear required).
>=20
> I think patch largely makes sense.
>=20
> Matt=20
>=20
>=20
> > +	 */
> > +	struct {
> > +		/**
> > +		 * @validation.validating: The task that is currently making bos res=
ident.
> > +		 * for this vm.
> > +		 * Protected by the VM's resv for writing. Opportunistic reading can=
 be done
> > +		 * using READ_ONCE. Note: This is a workaround for the
> > +		 * TTM eviction_valuable() callback not being passed a struct
> > +		 * ttm_operation_context(). Future work might want to address this.
> > +		 */
> > +		struct task_struct *validating;
> > +		/**
> > +		 *=C2=A0 @validation.exec The drm_exec context used when locking the=
 vm resv.
> > +		 *=C2=A0 Protected by the vm's resv.
> > +		 */
> > +		struct drm_exec *_exec;
> > +	} validation;
> > +
> > =C2=A0	/**
> > =C2=A0	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
> > =C2=A0	 * protected by the vm resv.
> > =C2=A0	 */
> > =C2=A0	u64 tlb_flush_seqno;
> > -	/**
> > -	 * @validating: The task that is currently making bos resident for th=
is vm.
> > -	 * Protected by the VM's resv for writing. Opportunistic reading can =
be done
> > -	 * using READ_ONCE. Note: This is a workaround for the
> > -	 * TTM eviction_valuable() callback not being passed a struct
> > -	 * ttm_operation_context(). Future work might want to address this.
> > -	 */
> > -	struct task_struct *validating;
> > =C2=A0	/** @batch_invalidate_tlb: Always invalidate TLB before batch st=
art */
> > =C2=A0	bool batch_invalidate_tlb;
> > =C2=A0	/** @xef: XE file handle for tracking this VM's drm client */
> > --=20
> > 2.50.1
> >=20
>



