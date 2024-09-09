Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3377FCE7AB0
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 07:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C721110E144;
	Mon,  9 Sep 2024 07:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbTJOMg+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F9510E144
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725867303; x=1757403303;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lRrjaoS95uNYC1VXmM09sMJEVPaDuh1gJNUdFdWDpDg=;
 b=gbTJOMg+neiMLoGew2cLm3ABBkblD9eoUrxN29JWWc6LSA16W/ZilhNP
 xyxRPDFlwOqQ1ROykwRy6miIazz1lbmKzM8SNwGLfejhvH5GOxH/aXxU8
 P/1R+TQQvg+pHOZKXs2+j6psrsDD69CuVhOvziEg+PY5PwJfda+QJOOId
 kgvFc540XHNGvTdvKdJfeFQq6g7zt6+KBgAjy2PajWjEYsTXk0+Udj6Dm
 tOmqU6SDfE/hnUzobMcjvx1OSTSIa+hEMTl5dB9Fz9g7FBcn66D9TAysY
 4c8dconRoNDZmfC5k2DXfvUeOo9+Yylxfq5zJz1LEJpJorxkjv3Y0Ltke Q==;
X-CSE-ConnectionGUID: oy0hM1yHSfKm0pYNJWDbbg==
X-CSE-MsgGUID: 2Ec9bs8OSim2Z4Jaw0wZZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24701712"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="24701712"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:35:03 -0700
X-CSE-ConnectionGUID: JePaVfZ1R/GyKvt/Upp6Kw==
X-CSE-MsgGUID: 9L8tcRtyTMuoZJtfMVf1YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="66209301"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.245.41])
 ([10.245.245.41])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:35:01 -0700
Message-ID: <502881320c1f9f769e9462938c0dd6f69d658792.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Add a xe_bo subtest for shrinking / swapping
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Date: Mon, 09 Sep 2024 09:34:59 +0200
In-Reply-To: <71709bab-5f6d-40d8-9604-3c00041d3f76@intel.com>
References: <20240905131617.8521-1-thomas.hellstrom@linux.intel.com>
 <71709bab-5f6d-40d8-9604-3c00041d3f76@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi, Matthew, Thanks for reviewing.

On Fri, 2024-09-06 at 16:59 +0100, Matthew Auld wrote:
> On 05/09/2024 14:16, Thomas Hellstr=C3=B6m wrote:
> > Add a subtest that tries to allocate twice the amount of
> > buffer object memory available, write data to it and then read
> > all the data back verifying data integrity.
> > In order to be able to do this on systems that
> > have no or not enough swap-space available, allocate some memory
> > as purgeable, and introduce a function to purge such memory from
> > the TTM swap_notify path.
> >=20
> > this test is intended to add test coverage to the current
> > bo swap path and upcoming shrinking path.
> >=20
> > The test has previously been part of the xe bo shrinker series.
> >=20
> > v2:
> > - Skip test if the execution time is expected to be too long.
> > - Minor code cleanups.
> >=20
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/tests/xe_bo.c | 237
> > +++++++++++++++++++++++++++++++
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 32 ++++-
> > =C2=A0 2 files changed, 268 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
> > b/drivers/gpu/drm/xe/tests/xe_bo.c
> > index 8dac069483e8..d82b7748dd9e 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > @@ -6,6 +6,12 @@
> > =C2=A0 #include <kunit/test.h>
> > =C2=A0 #include <kunit/visibility.h>
> > =C2=A0=20
> > +#include <linux/iosys-map.h>
> > +#include <linux/random.h>
> > +#include <linux/swap.h>
> > +
> > +#include <uapi/linux/sysinfo.h>
> > +
> > =C2=A0 #include "tests/xe_kunit_helpers.h"
> > =C2=A0 #include "tests/xe_pci_test.h"
> > =C2=A0 #include "tests/xe_test.h"
> > @@ -358,9 +364,240 @@ static void xe_bo_evict_kunit(struct kunit
> > *test)
> > =C2=A0=C2=A0	evict_test_run_device(xe);
> > =C2=A0 }
> > =C2=A0=20
> > +struct xe_bo_link {
> > +	struct list_head link;
> > +	struct xe_bo *bo;
> > +	u32 val;
> > +};
> > +
> > +#define XE_BO_SHRINK_SIZE ((unsigned long)SZ_64M)
> > +
> > +static int shrink_test_fill_random(struct xe_bo *bo, struct
> > rnd_state *state,
> > +				=C2=A0=C2=A0 struct xe_bo_link *link)
> > +{
> > +	struct iosys_map map;
> > +	int ret =3D ttm_bo_vmap(&bo->ttm, &map);
> > +	size_t __maybe_unused i;
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (i =3D 0; i < bo->ttm.base.size; i +=3D sizeof(u32)) {
> > +		u32 val =3D prandom_u32_state(state);
> > +
> > +		iosys_map_wr(&map, i, u32, val);
> > +		if (i =3D=3D 0)
> > +			link->val =3D val;
> > +	}
> > +
> > +	ttm_bo_vunmap(&bo->ttm, &map);
> > +	return 0;
> > +}
> > +
> > +static bool shrink_test_verify(struct kunit *test, struct xe_bo
> > *bo,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int bo_nr, struct
> > rnd_state *state,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bo_link *link)
> > +{
> > +	struct iosys_map map;
> > +	int ret =3D ttm_bo_vmap(&bo->ttm, &map);
> > +	size_t i;
> > +	bool failed =3D false;
> > +
> > +	if (ret) {
> > +		KUNIT_FAIL(test, "Error mapping bo %u for content
> > check.\n", bo_nr);
> > +		return true;
> > +	}
> > +
> > +	for (i =3D 0; i < bo->ttm.base.size; i +=3D sizeof(u32)) {
> > +		u32 val =3D prandom_u32_state(state);
> > +
> > +		if (iosys_map_rd(&map, i, u32) !=3D val) {
> > +			KUNIT_FAIL(test, "Content not preserved,
> > bo %u offset 0x%016llx",
> > +				=C2=A0=C2=A0 bo_nr, (unsigned long long)i);
> > +			kunit_info(test, "Failed value is 0x%08x,
> > recorded 0x%08x\n",
> > +				=C2=A0=C2=A0 (unsigned
> > int)iosys_map_rd(&map, i, u32), val);
> > +			if (i =3D=3D 0 && val !=3D link->val)
> > +				kunit_info(test, "Looks like PRNG
> > is out of sync.\n");
> > +			failed =3D true;
> > +			break;
> > +		}
> > +	}
> > +
> > +	ttm_bo_vunmap(&bo->ttm, &map);
> > +
> > +	return failed;
> > +}
> > +
> > +/*
> > + * Try to create system bos corresponding to twice the amount
> > + * of available system memory to test shrinker functionality.
> > + * If no swap space is available to accommodate the
> > + * memory overcommit, mark bos purgeable.
> > + */
> > +static int shrink_test_run_device(struct xe_device *xe)
> > +{
> > +	struct kunit *test =3D kunit_get_current_test();
> > +	LIST_HEAD(bos);
> > +	struct xe_bo_link *link, *next;
> > +	struct sysinfo si;
> > +	size_t ram, ram_and_swap, purgeable, alloced, to_alloc,
> > limit;
> > +	unsigned int interrupted =3D 0, successful =3D 0, count =3D 0;
> > +	struct rnd_state prng;
> > +	u64 rand_seed;
> > +	bool failed =3D false;
> > +
> > +	rand_seed =3D get_random_u64();
> > +	prandom_seed_state(&prng, rand_seed);
>=20
> We could maybe print the seed, if we don't already, just in case it's
> useful to repro something?
>=20
> Anyway,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks. I'll update and merge once CI is clean.

/Thomas


>=20
> > +
> > +	/* Skip if execution time is expected to be too long. */
> > +
> > +	limit =3D SZ_32G;
> > +	/* IGFX with flat CCS needs to copy when swapping /
> > shrinking */
> > +	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
> > +		limit =3D SZ_16G;
> > +
> > +	si_meminfo(&si);
> > +	ram =3D (size_t)si.freeram * si.mem_unit;
> > +	if (ram > limit) {
> > +		kunit_skip(test, "Too long expected execution
> > time.\n");
> > +		return 0;
> > +	}
> > +	to_alloc =3D ram * 2;
> > +
> > +	ram_and_swap =3D ram + get_nr_swap_pages() * PAGE_SIZE;
> > +	if (to_alloc > ram_and_swap)
> > +		purgeable =3D to_alloc - ram_and_swap;
> > +	purgeable +=3D purgeable / 5;
> > +
> > +	kunit_info(test, "Free ram is %lu bytes. Will allocate
> > twice of that.\n",
> > +		=C2=A0=C2=A0 (unsigned long)ram);
> > +	for (alloced =3D 0; alloced < to_alloc; alloced +=3D
> > XE_BO_SHRINK_SIZE) {
> > +		struct xe_bo *bo;
> > +		unsigned int mem_type;
> > +		struct xe_ttm_tt *xe_tt;
> > +
> > +		link =3D kzalloc(sizeof(*link), GFP_KERNEL);
> > +		if (!link) {
> > +			KUNIT_FAIL(test, "Unexpected link
> > allocation failure\n");
> > +			failed =3D true;
> > +			break;
> > +		}
> > +
> > +		INIT_LIST_HEAD(&link->link);
> > +
> > +		/* We can create bos using WC caching here. But it
> > is slower. */
> > +		bo =3D xe_bo_create_user(xe, NULL, NULL,
> > XE_BO_SHRINK_SIZE,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_XE_GEM_CPU_CACHING_WB,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM);
> > +		if (IS_ERR(bo)) {
> > +			if (bo !=3D ERR_PTR(-ENOMEM) && bo !=3D
> > ERR_PTR(-ENOSPC) &&
> > +			=C2=A0=C2=A0=C2=A0 bo !=3D ERR_PTR(-EINTR) && bo !=3D
> > ERR_PTR(-ERESTARTSYS))
> > +				KUNIT_FAIL(test, "Error creating
> > bo: %pe\n", bo);
> > +			kfree(link);
> > +			failed =3D true;
> > +			break;
> > +		}
> > +		xe_bo_lock(bo, false);
> > +		xe_tt =3D container_of(bo->ttm.ttm, typeof(*xe_tt),
> > ttm);
> > +
> > +		/*
> > +		 * Allocate purgeable bos first, because if we do
> > it the
> > +		 * other way around, they may not be subject to
> > swapping...
> > +		 */
> > +		if (alloced < purgeable) {
> > +			xe_tt->purgeable =3D true;
> > +			bo->ttm.priority =3D 0;
> > +		} else {
> > +			int ret =3D shrink_test_fill_random(bo,
> > &prng, link);
> > +
> > +			if (ret) {
> > +				xe_bo_unlock(bo);
> > +				xe_bo_put(bo);
> > +				KUNIT_FAIL(test, "Error filling bo
> > with random data: %pe\n",
> > +					=C2=A0=C2=A0 ERR_PTR(ret));
> > +				kfree(link);
> > +				failed =3D true;
> > +				break;
> > +			}
> > +		}
> > +
> > +		mem_type =3D bo->ttm.resource->mem_type;
> > +		xe_bo_unlock(bo);
> > +		link->bo =3D bo;
> > +		list_add_tail(&link->link, &bos);
> > +
> > +		if (mem_type !=3D XE_PL_TT) {
> > +			KUNIT_FAIL(test, "Bo in incorrect memory
> > type: %u\n",
> > +				=C2=A0=C2=A0 bo->ttm.resource->mem_type);
> > +			failed =3D true;
> > +		}
> > +		cond_resched();
> > +		if (signal_pending(current))
> > +			break;
> > +	}
> > +
> > +	/*
> > +	 * Read back and destroy bos. Reset the pseudo-random seed
> > to get an
> > +	 * identical pseudo-random number sequence for readback.
> > +	 */
> > +	prandom_seed_state(&prng, rand_seed);
> > +	list_for_each_entry_safe(link, next, &bos, link) {
> > +		static struct ttm_operation_ctx ctx =3D
> > {.interruptible =3D true};
> > +		struct xe_bo *bo =3D link->bo;
> > +		struct xe_ttm_tt *xe_tt;
> > +		int ret;
> > +
> > +		count++;
> > +		if (!signal_pending(current) && !failed) {
> > +			bool purgeable, intr =3D false;
> > +
> > +			xe_bo_lock(bo, NULL);
> > +
> > +			/* xe_tt->purgeable is cleared on
> > validate. */
> > +			xe_tt =3D container_of(bo->ttm.ttm,
> > typeof(*xe_tt), ttm);
> > +			purgeable =3D xe_tt->purgeable;
> > +			do {
> > +				ret =3D ttm_bo_validate(&bo->ttm,
> > &tt_placement, &ctx);
> > +				if (ret =3D=3D -EINTR)
> > +					intr =3D true;
> > +			} while (ret =3D=3D -EINTR &&
> > !signal_pending(current));
> > +
> > +			if (!ret && !purgeable)
> > +				failed =3D shrink_test_verify(test,
> > bo, count, &prng, link);
> > +
> > +			xe_bo_unlock(bo);
> > +			if (ret) {
> > +				KUNIT_FAIL(test, "Validation
> > failed: %pe\n",
> > +					=C2=A0=C2=A0 ERR_PTR(ret));
> > +				failed =3D true;
> > +			} else if (intr) {
> > +				interrupted++;
> > +			} else {
> > +				successful++;
> > +			}
> > +		}
> > +		xe_bo_put(link->bo);
> > +		list_del(&link->link);
> > +		kfree(link);
> > +	}
> > +	kunit_info(test, "Readbacks interrupted: %u successful:
> > %u\n",
> > +		=C2=A0=C2=A0 interrupted, successful);
> > +
> > +	return 0;
> > +}
> > +
> > +static void xe_bo_shrink_kunit(struct kunit *test)
> > +{
> > +	struct xe_device *xe =3D test->priv;
> > +
> > +	shrink_test_run_device(xe);
> > +}
> > +
> > =C2=A0 static struct kunit_case xe_bo_tests[] =3D {
> > =C2=A0=C2=A0	KUNIT_CASE_PARAM(xe_ccs_migrate_kunit,
> > xe_pci_live_device_gen_param),
> > =C2=A0=C2=A0	KUNIT_CASE_PARAM(xe_bo_evict_kunit,
> > xe_pci_live_device_gen_param),
> > +	KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit,
> > xe_pci_live_device_gen_param,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {.speed =3D KUNIT_SPEED_SLOW}),
> > =C2=A0=C2=A0	{}
> > =C2=A0 };
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 06911e9a3bf5..a065ba8fda83 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -283,6 +283,8 @@ struct xe_ttm_tt {
> > =C2=A0=C2=A0	struct device *dev;
> > =C2=A0=C2=A0	struct sg_table sgt;
> > =C2=A0=C2=A0	struct sg_table *sg;
> > +	/** @purgeable: Whether the content of the pages of @ttm
> > is purgeable. */
> > +	bool purgeable;
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 static int xe_tt_map_sg(struct ttm_tt *tt)
> > @@ -761,7 +763,7 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> > =C2=A0=C2=A0	if (xe_rpm_reclaim_safe(xe)) {
> > =C2=A0=C2=A0		/*
> > =C2=A0=C2=A0		 * We might be called through swapout in the
> > validation path of
> > -		 * another TTM device, so unconditionally acquire
> > rpm here.
> > +		 * another TTM device, so acquire rpm here.
> > =C2=A0=C2=A0		 */
> > =C2=A0=C2=A0		xe_pm_runtime_get(xe);
> > =C2=A0=C2=A0	} else {
> > @@ -1082,6 +1084,33 @@ static void
> > xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
> > =C2=A0=C2=A0	}
> > =C2=A0 }
> > =C2=A0=20
> > +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,
> > struct ttm_operation_ctx *ctx)
> > +{
> > +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> > +
> > +	if (ttm_bo->ttm) {
> > +		struct ttm_placement place =3D {};
> > +		int ret =3D ttm_bo_validate(ttm_bo, &place, ctx);
> > +
> > +		drm_WARN_ON(&xe->drm, ret);
> > +	}
> > +}
> > +
> > +static void xe_ttm_bo_swap_notify(struct ttm_buffer_object
> > *ttm_bo)
> > +{
> > +	struct ttm_operation_ctx ctx =3D {
> > +		.interruptible =3D false
> > +	};
> > +
> > +	if (ttm_bo->ttm) {
> > +		struct xe_ttm_tt *xe_tt =3D
> > +			container_of(ttm_bo->ttm, struct
> > xe_ttm_tt, ttm);
> > +
> > +		if (xe_tt->purgeable)
> > +			xe_ttm_bo_purge(ttm_bo, &ctx);
> > +	}
> > +}
> > +
> > =C2=A0 const struct ttm_device_funcs xe_ttm_funcs =3D {
> > =C2=A0=C2=A0	.ttm_tt_create =3D xe_ttm_tt_create,
> > =C2=A0=C2=A0	.ttm_tt_populate =3D xe_ttm_tt_populate,
> > @@ -1094,6 +1123,7 @@ const struct ttm_device_funcs xe_ttm_funcs =3D
> > {
> > =C2=A0=C2=A0	.release_notify =3D xe_ttm_bo_release_notify,
> > =C2=A0=C2=A0	.eviction_valuable =3D ttm_bo_eviction_valuable,
> > =C2=A0=C2=A0	.delete_mem_notify =3D xe_ttm_bo_delete_mem_notify,
> > +	.swap_notify =3D xe_ttm_bo_swap_notify,
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)

