Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39B1606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 19:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dvrqlky8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB8A10E215;
	Tue, 20 Oct 2026 19:09:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB4A10E215
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 19:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792523369; x=1824059369;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=iPsnyw3bghekFATGv6I33emlHXqrNy+W8lsG0r5rtCA=;
 b=Dvrqlky8q8KdOInBCvW9S/+3+DbFif5oBGVL4YKZDIx+8vnqiZ59CCRx
 9iFk1Tk8b350zb/wk5PFvg0DV0NKysdWDoKZooDiP0VbPsA8xfZQx5xVN
 OTv7ndF3yubq9GbckAT2sysX9IR09RcKEOLloib0xz0QqJDsFPg47F4kP
 sTpVoLxRFY1BWEN9Xs0KqTW9wHo6cuuDd08CKxFas3iUXs4VboiJn0KOL
 lfNeVjikM1VkHX/82ssTidCud495XVeFWv5duVnXMDiQekdRziFA9KZfY
 SYlTtrGEPEHdnz+Cew5IlT+XrnA2fQuUTbgHKB57fnZp8cL0+ygSeSDue g==;
X-CSE-ConnectionGUID: gQph2T++RSOLwA/HJ+gaMQ==
X-CSE-MsgGUID: NSJKymUdTCy2m+k6udz0Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1131947"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131947"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:09:28 -0700
X-CSE-ConnectionGUID: 89YATgqySE6ei5yPmaJB6A==
X-CSE-MsgGUID: j6ac0GEuQVGiQyHzFXsCUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2797968"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.117])
 ([10.245.244.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:09:27 -0700
Message-ID: <6be5c54ab5b754f208e94213d5b03fe012b79e60.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Add a minimum age gate to the shrinker
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 20 Oct 2026 21:09:24 +0200
In-Reply-To: <20261020175045.843524-1-matthew.brost@intel.com>
References: <20261020175045.843524-1-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-10-20 at 10:50 -0700, Matthew Brost wrote:
> Backing up a BO costs a GPU blit plus a page copy, and if the BO is
> part
> of an active working set it is faulted straight back in on the next
> exec.
> Evicting a BO that was used moments ago is therefore almost always a
> loss, yet the shrinker has no notion of recency beyond LRU order.
>=20
> Timestamp BOs on their last LRU bump: on a successful move into TT in
> xe_bo_move(), which now also bumps the LRU, and on the exec bump in
> xe_vm_bump_lru(). Private BOs are bulk moved with their VM, so stamp
> the
> VM there and take the later of the BO and VM stamps.
>=20
> Add a per-device shrinker_min_age_ms sysfs attribute, defaulting to
> CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS (0, disabled). While set, the
> shrinker
> won't back up BOs younger than the delay: xe_shrinker_count() snoops
> the
> first shrinkable BO on each TT-backed LRU and reports nothing if all
> are
> young, and the backup walk stops at the first young BO as a backstop.
>=20
> The gate is hard and applies at every reclaim priority, so a working
> set
> kept younger than the delay is never backed up and can lead to OOM.
> This
> is deliberate, and why it is off by default. Purgeable objects are
> never
> gated, nor are BOs in XE_PL_SYSTEM: those are not GPU mapped, hence
> not
> part of a working set.
>=20
> Assisted-by: LLM
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>=20
> ---
>=20
> v2:
> =C2=A0- Trim commit message (Thomas)
> =C2=A0- Add LRU move helper which sets lru_timestamp (Thomas)
> =C2=A0- Use LRU move helper in xe_bo_move (Thomas)
> =C2=A0- Only do too young walk if num_pages !=3D 0 (Thomas)
> ---
> =C2=A0drivers/gpu/drm/xe/Kconfig.profile=C2=A0=C2=A0 |=C2=A0 15 +++
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 71 +++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> =C2=A0drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 8 ++
> =C2=A0drivers/gpu/drm/xe/xe_device_sysfs.c |=C2=A0 35 +++++++
> =C2=A0drivers/gpu/drm/xe/xe_shrinker.c=C2=A0=C2=A0=C2=A0=C2=A0 | 149
> +++++++++++++++++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_shrinker.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 3 +
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 7 ++
> =C2=A09 files changed, 285 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> b/drivers/gpu/drm/xe/Kconfig.profile
> index 23045ed2aa94..dd3985e502b8 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -74,6 +74,7 @@ config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> =C2=A0	=C2=A0 to apply to applicable user. For elevated user, all above
> MIN
> =C2=A0	=C2=A0 and MAX values will apply when this configuration is
> enable to
> =C2=A0	=C2=A0 apply limitation. By default limitation is applied.
> +
> =C2=A0config DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS
> =C2=A0	int "Default seeks value of the non-purgeable bo shrinker"
> =C2=A0	default 8
> @@ -86,3 +87,17 @@ config DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS
> =C2=A0	=C2=A0 reclaim pressure on non-purgeable buffer objects, which
> need
> =C2=A0	=C2=A0 GPU idling and writeback to be reclaimed, in favour of
> purgeable
> =C2=A0	=C2=A0 ones and other kernel caches.
> +
> +config DRM_XE_SHRINKER_MIN_AGE_MS
> +	int "Default minimum BO age before shrinker backup (ms)"
> +	default 0
> +	range 0 1000000
> +	help
> +	=C2=A0 Default for the per-device shrinker_min_age_ms sysfs
> attribute. The
> +	=C2=A0 shrinker won't back up a BO that was moved into TT, or
> bumped on the
> +	=C2=A0 LRU by an exec, less than this many milliseconds ago. BOs
> already
> +	=C2=A0 evicted to system memory are not part of a working set and
> are
> +	=C2=A0 never protected. This applies at every reclaim priority: a
> working
> +	=C2=A0 set kept younger than this is never backed up and can
> cause OOM.
> +	=C2=A0 Only set if that risk is preferred over thrashing a hot
> working
> +	=C2=A0 set. 0 disables.
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 1b74331b15ec..59a42c3282f7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1313,9 +1313,80 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		xe_tt_unmap_sg(xe, ttm_bo->ttm);
> =C2=A0	}
> =C2=A0
> +	if (!ret && ttm_bo->resource && ttm_bo->resource->mem_type
> =3D=3D XE_PL_TT)
> +		xe_bo_bump_lru(bo);
> +
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_bo_bump_lru_locked() - Bump a BO on the LRU and stamp its last
> use
> + * @bo: The buffer object, reserved by the caller.
> + *
> + * Move @bo to the tail of its LRU, or of its bulk move if it
> belongs to one,
> + * and record the time for the shrinker's minimum age gate. The
> caller must
> + * hold the device LRU lock.
> + */
> +void xe_bo_bump_lru_locked(struct xe_bo *bo)
> +{
> +	WRITE_ONCE(bo->lru_stamp, jiffies);
> +	ttm_bo_move_to_lru_tail(&bo->ttm);
> +}
> +
> +/**
> + * xe_bo_bump_lru() - Bump a BO on the LRU and stamp its last use
> + * @bo: The buffer object, reserved by the caller.
> + *
> + * Like xe_bo_bump_lru_locked(), but takes the device LRU lock.
> + */
> +void xe_bo_bump_lru(struct xe_bo *bo)
> +{
> +	spinlock_t *lru_lock =3D &xe_bo_device(bo)->ttm.lru_lock;
> +
> +	spin_lock(lru_lock);
> +	xe_bo_bump_lru_locked(bo);
> +	spin_unlock(lru_lock);
> +}
> +
> +/**
> + * xe_bo_shrink_too_young() - Whether a BO was used too recently to
> shrink
> + * @bo: The TTM buffer object, reserved by the caller.
> + * @min_age: Minimum age in jiffies. 0 disables the check.
> + *
> + * The age is taken from the later of the BO's own &xe_bo.lru_stamp
> and, for
> + * user BOs private to a VM, the VM's &xe_vm.lru_stamp. Purgeable
> and non-xe
> + * BOs are never considered young since dropping them is cheap.
> Neither are
> + * BOs in XE_PL_SYSTEM: they are not GPU mapped, hence not part of a
> working
> + * set, and must be moved back to TT, refreshing the stamp, before
> use.
> + *
> + * Return: true if @bo was touched less than @min_age jiffies ago.
> + */
> +bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned
> long min_age)
> +{
> +	struct xe_ttm_tt *xe_tt;
> +	struct xe_bo *xe_bo;
> +	unsigned long stamp;
> +
> +	if (!min_age || !bo->ttm || !xe_bo_is_xe_bo(bo) ||
> +	=C2=A0=C2=A0=C2=A0 bo->resource->mem_type =3D=3D XE_PL_SYSTEM)
> +		return false;
> +
> +	xe_tt =3D container_of(bo->ttm, struct xe_ttm_tt, ttm);
> +	if (xe_tt->purgeable)
> +		return false;
> +
> +	xe_bo =3D ttm_to_xe_bo(bo);
> +	stamp =3D READ_ONCE(xe_bo->lru_stamp);
> +	if (xe_bo->vm && xe_bo_is_user(xe_bo)) {
> +		unsigned long vm_stamp =3D READ_ONCE(xe_bo->vm-
> >lru_stamp);
> +
> +		if (!stamp || time_after(vm_stamp, stamp))
> +			stamp =3D vm_stamp;
> +	}
> +
> +	return stamp && time_before(jiffies, stamp + min_age);
> +}
> +
> =C2=A0static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_buffer_object *b=
o,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *scanned)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 77b3a02e9b8e..ac54545f158d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -623,6 +623,11 @@ struct xe_bo_shrink_flags {
> =C2=A0	u32 writeback : 1;
> =C2=A0};
> =C2=A0
> +void xe_bo_bump_lru_locked(struct xe_bo *bo);
> +void xe_bo_bump_lru(struct xe_bo *bo);
> +
> +bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned
> long min_age);
> +
> =C2=A0long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct
> ttm_buffer_object *bo,
> =C2=A0		=C2=A0 const struct xe_bo_shrink_flags flags,
> =C2=A0		=C2=A0 unsigned long *scanned);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> b/drivers/gpu/drm/xe/xe_bo_types.h
> index 8ec4a01a0092..12064540e55b 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -43,6 +43,14 @@ struct xe_bo {
> =C2=A0	u32 flags;
> =C2=A0	/** @vm: VM this BO is attached to, for extobj this will be
> NULL */
> =C2=A0	struct xe_vm *vm;
> +	/**
> +	 * @lru_stamp: jiffies at the last LRU bump, done on a move
> into TT
> +	 * and, for external objects, at exec time. Private BOs are
> +	 * additionally covered by &xe_vm.lru_stamp. Consulted by
> the
> +	 * shrinker's minimum age gate. Accessed with
> +	 * READ_ONCE()/WRITE_ONCE().
> +	 */
> +	unsigned long lru_stamp;
> =C2=A0	/**
> =C2=A0	 * @q: Queue this BO is attached to, mostly for LRC BO, NULL
> otherwise.
> =C2=A0	 * Protected by the BO dma_resv: readers must hold it across
> both the
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index ff5d25dd867c..26b1f71ed522 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -38,6 +38,12 @@
> =C2=A0 * reclaimed by the shrinker. Higher values reduce reclaim pressure
> on
> =C2=A0 * non-purgeable buffer objects. Valid values are 1 to 64. Defaults
> to
> =C2=A0 * CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS.
> + *
> + * shrinker_min_age_ms - Report/change the minimum time, in ms,
> since a BO was
> + * last moved to TT or bumped on the LRU by an exec before the
> shrinker may
> + * back it up. BOs evicted to system memory are never protected.
> Defaults to
> + * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, 0 disables. This applies at
> every
> + * reclaim priority, so a non-zero value can lead to OOM.
> =C2=A0 */
> =C2=A0
> =C2=A0static ssize_t
> @@ -331,8 +337,37 @@ shrinker_non_purgeable_seeks_store(struct device
> *dev,
> =C2=A0
> =C2=A0static DEVICE_ATTR_RW(shrinker_non_purgeable_seeks);
> =C2=A0
> +static ssize_t
> +shrinker_min_age_ms_show(struct device *dev, struct device_attribute
> *attr,
> +			 char *buf)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
> +
> +	return sysfs_emit(buf, "%u\n", xe_shrinker_min_age_ms(xe-
> >mem.shrinker));
> +}
> +
> +static ssize_t
> +shrinker_min_age_ms_store(struct device *dev, struct
> device_attribute *attr,
> +			=C2=A0 const char *buff, size_t count)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
> +	unsigned int ms;
> +	int ret;
> +
> +	ret =3D kstrtouint(buff, 0, &ms);
> +	if (ret)
> +		return ret;
> +
> +	xe_shrinker_set_min_age_ms(xe->mem.shrinker, ms);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(shrinker_min_age_ms);
> +
> =C2=A0static struct attribute *shrinker_attrs[] =3D {
> =C2=A0	&dev_attr_shrinker_non_purgeable_seeks.attr,
> +	&dev_attr_shrinker_min_age_ms.attr,
> =C2=A0	NULL
> =C2=A0};
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> b/drivers/gpu/drm/xe/xe_shrinker.c
> index 772dab9b3ed7..8e863ee5a96e 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -39,6 +39,8 @@
> =C2=A0 * @shrink: Pointer to the mm shrinker handling non-purgeable
> (shrinkable) objects.
> =C2=A0 * @purge_shrink: Pointer to the mm shrinker handling purgeable
> objects.
> =C2=A0 * @pm_worker: Worker to wake up the device if required.
> + * @min_age_ms: Minimum BO age before backup, in ms. 0 disables.
> Defaults to
> + * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, overridable through sysfs.
> =C2=A0 */
> =C2=A0struct xe_shrinker {
> =C2=A0	struct xe_device *xe;
> @@ -50,6 +52,7 @@ struct xe_shrinker {
> =C2=A0	struct shrinker *shrink;
> =C2=A0	struct shrinker *purge_shrink;
> =C2=A0	struct work_struct pm_worker;
> +	unsigned int min_age_ms;
> =C2=A0};
> =C2=A0
> =C2=A0static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
> @@ -104,6 +107,7 @@ static void xe_shrinker_runtime_pm_put(struct
> xe_shrinker *shrinker, bool runtim
> =C2=A0static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags f=
lags,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long min_age, bool *young,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned l=
ong
> *scanned,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *freed)
> =C2=A0{
> @@ -136,6 +140,16 @@ static int __xe_shrinker_walk(struct xe_shrinker
> *shrinker,
> =C2=A0			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
> =C2=A0				continue;
> =C2=A0
> +			/*
> +			 * The LRU is roughly age ordered, so
> everything past
> +			 * the first young BO is most likely young
> too. Stop
> +			 * here.
> +			 */
> +			if (xe_bo_shrink_too_young(ttm_bo, min_age))
> {
> +				*young =3D true;
> +				goto out;
> +			}
> +
> =C2=A0			lret =3D xe_bo_shrink(ctx, ttm_bo, flags,
> scanned);
> =C2=A0			/* Like the TTM LRU walk, skip bos we can't
> shrink now. */
> =C2=A0			if (lret =3D=3D -EBUSY)
> @@ -168,35 +182,117 @@ static int __xe_shrinker_walk(struct
> xe_shrinker *shrinker,
> =C2=A0static int xe_shrinker_walk(struct xe_shrinker *shrinker,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0 const struct xe_bo_shrink_flags flags,
> +			=C2=A0=C2=A0=C2=A0 unsigned long min_age,
> =C2=A0			=C2=A0=C2=A0=C2=A0 unsigned long to_scan, unsigned long
> *scanned,
> =C2=A0			=C2=A0=C2=A0=C2=A0 unsigned long *freed)
> =C2=A0{
> =C2=A0	bool no_wait_gpu =3D true;
> =C2=A0	struct xe_bo_shrink_flags save_flags =3D flags;
> +	bool young =3D false;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	swap(no_wait_gpu, ctx->no_wait_gpu);
> =C2=A0	save_flags.writeback =3D false;
> -	ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan,
> scanned,
> -				 freed);
> +	ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags, min_age,
> &young,
> +				 to_scan, scanned, freed);
> =C2=A0	swap(no_wait_gpu, ctx->no_wait_gpu);
> -	if (ret || *scanned >=3D to_scan)
> +	if (ret || young || *scanned >=3D to_scan)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	if (!ctx->no_wait_gpu) {
> -		ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags,
> to_scan, scanned,
> -					 freed);
> -		if (ret || *scanned >=3D to_scan)
> +		ret =3D __xe_shrinker_walk(shrinker, ctx, save_flags,
> min_age,
> +					 &young, to_scan, scanned,
> freed);
> +		if (ret || young || *scanned >=3D to_scan)
> =C2=A0			return ret;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (flags.writeback)
> -		ret =3D __xe_shrinker_walk(shrinker, ctx, flags,
> to_scan, scanned,
> -					 freed);
> +		ret =3D __xe_shrinker_walk(shrinker, ctx, flags,
> min_age, &young,
> +					 to_scan, scanned, freed);
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +/**
> + * DOC: Shrinker minimum age
> + *
> + * The per-device shrinker_min_age_ms sysfs attribute, defaulting to
> + * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, protects recently used BOs
> from backup.
> + * A BO's age is taken from the last time it was bumped on the LRU:
> a move
> + * into TT (xe_bo_move()) or an exec (xe_vm_bump_lru()). For BOs
> private to
> + * a VM the VM-wide stamp is used, matching the LRU bulk move. BOs
> in
> + * XE_PL_SYSTEM are never young: they are not GPU mapped, so not
> part of a
> + * working set, and will be stamped again when moved back to TT for
> use.
> + *
> + * xe_shrinker_count() snoops the first shrinkable BO on each TT-
> backed LRU.
> + * If all of them are young, it doesn't report shrinkable pages, so
> vmscan
> + * only asks for purgeable ones. A shrinkable BO in XE_PL_SYSTEM
> therefore
> + * always lets count report. The backup walk in xe_shrinker_scan()
> stops
> + * at the first young BO, since the LRU is roughly age ordered, as a
> backstop
> + * since the count snoop is only a sample. Purgeable BOs are never
> gated.
> + *
> + * The gate is hard and applies at every reclaim priority. A working
> set kept
> + * younger than the delay is never backed up, which can lead to OOM.
> This is
> + * intended for users who prefer that risk over thrashing a hot
> working set,
> + * hence it is disabled by default.
> + */
> +static unsigned long xe_shrinker_min_age(struct xe_shrinker
> *shrinker)
> +{
> +	unsigned int ms =3D READ_ONCE(shrinker->min_age_ms);
> +
> +	return ms ? msecs_to_jiffies(ms) : 0;
> +}
> +
> +/* Max shrink-unsuitable BOs to skip per LRU before giving up the
> snoop. */
> +#define XE_SHRINKER_SNOOP_MAX	16
> +
> +/*
> + * Whether the first shrinkable BO on every TT-backed LRU is younger
> than
> + * @min_age. BOs are trylocked through the reserved LRU walker since
> their
> + * tt may be torn down while still on the LRU. Contended BOs are
> skipped by
> + * the walker. If no verdict can be reached within the snoop budget,
> report
> + * not young and leave it to the scan side check.
> + */
> +static bool xe_shrinker_lru_young(struct xe_shrinker *shrinker,
> +				=C2=A0 unsigned long min_age)
> +{
> +	struct ttm_operation_ctx ctx =3D {
> +		.interruptible =3D false,
> +		.no_wait_gpu =3D false,
> +	};
> +	struct xe_device *xe =3D shrinker->xe;
> +	unsigned int mem_type;
> +
> +	for (mem_type =3D XE_PL_SYSTEM; mem_type <=3D XE_PL_TT;
> ++mem_type) {
> +		struct ttm_resource_manager *man =3D
> ttm_manager_type(&xe->ttm, mem_type);
> +		struct ttm_bo_lru_cursor curs;
> +		struct ttm_buffer_object *ttm_bo;
> +		struct ttm_lru_walk_arg arg =3D {
> +			.ctx =3D &ctx,
> +			.trylock_only =3D true,
> +		};
> +		unsigned int budget =3D XE_SHRINKER_SNOOP_MAX;
> +
> +		if (!man || !man->use_tt)
> +			continue;
> +
> +		ttm_bo_lru_for_each_reserved_guarded(&curs, man,
> &arg, ttm_bo) {
> +			if (!ttm_bo_shrink_suitable(ttm_bo, &ctx)) {
> +				if (!--budget)
> +					return false;
> +				continue;
> +			}
> +
> +			if (!xe_bo_shrink_too_young(ttm_bo,
> min_age))
> +				return false;

If it's a SYSTEM bo it's never too young, right?
In either case
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


Thanks,
Thomas


> +
> +			break;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> =C2=A0static unsigned long
> =C2=A0xe_shrinker_count_purgeable(struct shrinker *shrink, struct
> shrink_control *sc)
> =C2=A0{
> @@ -236,7 +332,7 @@ static unsigned long
> =C2=A0xe_shrinker_count(struct shrinker *shrink, struct shrink_control
> *sc)
> =C2=A0{
> =C2=A0	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
> -	unsigned long num_pages;
> +	unsigned long num_pages, min_age;
> =C2=A0	bool can_backup =3D !!(sc->gfp_mask & __GFP_FS);
> =C2=A0
> =C2=A0	if (!can_backup)
> @@ -260,6 +356,10 @@ xe_shrinker_count(struct shrinker *shrink,
> struct shrink_control *sc)
> =C2=A0
> =C2=A0	write_unlock(&shrinker->lock);
> =C2=A0
> +	min_age =3D xe_shrinker_min_age(shrinker);
> +	if (num_pages && min_age && xe_shrinker_lru_young(shrinker,
> min_age))
> +		return SHRINK_EMPTY;
> +
> =C2=A0	return num_pages ? num_pages : SHRINK_EMPTY;
> =C2=A0}
> =C2=A0
> @@ -294,7 +394,8 @@ static unsigned long
> xe_shrinker_scan_purgeable(struct shrinker *shrink,
> =C2=A0		.purge =3D true,
> =C2=A0	};
> =C2=A0
> -	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan,
> &nr_scanned, &freed);
> +	xe_shrinker_walk(shrinker, &ctx, shrink_flags, 0,
> nr_to_scan, &nr_scanned,
> +			 &freed);
> =C2=A0
> =C2=A0	sc->nr_scanned =3D nr_scanned;
> =C2=A0
> @@ -319,7 +420,9 @@ static unsigned long xe_shrinker_scan(struct
> shrinker *shrink, struct shrink_con
> =C2=A0	/* Might need runtime PM to access backed-up or CCS-
> compressed data. */
> =C2=A0	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker);
> =C2=A0
> -	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan,
> &nr_scanned, &freed);
> +	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> +			 xe_shrinker_min_age(shrinker), nr_to_scan,
> &nr_scanned,
> +			 &freed);
> =C2=A0
> =C2=A0	sc->nr_scanned =3D nr_scanned;
> =C2=A0	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
> @@ -384,6 +487,29 @@ int xe_shrinker_set_non_purgeable_seeks(struct
> xe_shrinker *shrinker,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_shrinker_min_age_ms() - Get the shrinker minimum BO age
> + * @shrinker: Pointer to the struct xe_shrinker.
> + *
> + * Return: Minimum age, in ms, a BO must reach before it may be
> backed up.
> + */
> +unsigned int xe_shrinker_min_age_ms(struct xe_shrinker *shrinker)
> +{
> +	return READ_ONCE(shrinker->min_age_ms);
> +}
> +
> +/**
> + * xe_shrinker_set_min_age_ms() - Set the shrinker minimum BO age
> + * @shrinker: Pointer to the struct xe_shrinker.
> + * @ms: Minimum age, in ms. 0 disables the gate.
> + *
> + * See DOC: Shrinker minimum age. A non-zero value can lead to OOM.
> + */
> +void xe_shrinker_set_min_age_ms(struct xe_shrinker *shrinker,
> unsigned int ms)
> +{
> +	WRITE_ONCE(shrinker->min_age_ms, ms);
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_shrinker_create() - Create an xe per-device shrinker
> =C2=A0 * @xe: Pointer to the xe device.
> @@ -412,6 +538,7 @@ int xe_shrinker_create(struct xe_device *xe)
> =C2=A0
> =C2=A0	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
> =C2=A0	shrinker->xe =3D xe;
> +	shrinker->min_age_ms =3D CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS;
> =C2=A0	rwlock_init(&shrinker->lock);
> =C2=A0
> =C2=A0	shrinker->purge_shrink->count_objects =3D
> xe_shrinker_count_purgeable;
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.h
> b/drivers/gpu/drm/xe/xe_shrinker.h
> index 4b3c73689619..586d7772bd58 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.h
> +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> @@ -18,4 +18,7 @@ int xe_shrinker_non_purgeable_seeks(struct
> xe_shrinker *shrinker);
> =C2=A0int xe_shrinker_set_non_purgeable_seeks(struct xe_shrinker
> *shrinker,
> =C2=A0					unsigned int seeks);
> =C2=A0
> +unsigned int xe_shrinker_min_age_ms(struct xe_shrinker *shrinker);
> +void xe_shrinker_set_min_age_ms(struct xe_shrinker *shrinker,
> unsigned int ms);
> +
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d6294d53dee6..0679aed1f51a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -456,13 +456,15 @@ void xe_vm_bump_lru(struct xe_vm *vm, struct
> drm_exec *exec)
> =C2=A0	spinlock_t *lru_lock =3D &vm->xe->ttm.lru_lock;
> =C2=A0	struct drm_gem_object *obj;
> =C2=A0
> +	WRITE_ONCE(vm->lru_stamp, jiffies);
> +
> =C2=A0	spin_lock(lru_lock);
> =C2=A0	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> =C2=A0	drm_exec_for_each_locked_object(exec, obj) {
> =C2=A0		if (!drm_gpuvm_is_extobj(&vm->gpuvm, obj))
> =C2=A0			continue;
> =C2=A0
> -		ttm_bo_move_to_lru_tail(&gem_to_xe_bo(obj)->ttm);
> +		xe_bo_bump_lru_locked(gem_to_xe_bo(obj));
> =C2=A0		cond_resched_lock(lru_lock);
> =C2=A0	}
> =C2=A0	spin_unlock(lru_lock);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index fb9305124679..a6dc7233b336 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -267,6 +267,13 @@ struct xe_vm {
> =C2=A0	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
> =C2=A0	struct ttm_lru_bulk_move lru_bulk_move;
> =C2=A0
> +	/**
> +	 * @lru_stamp: jiffies at the last xe_vm_bump_lru(). Covers
> the
> +	 * VM's private BOs for the shrinker's minimum age gate.
> +	 * Accessed with READ_ONCE()/WRITE_ONCE().
> +	 */
> +	unsigned long lru_stamp;
> +
> =C2=A0	u64 size;
> =C2=A0
> =C2=A0	struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
