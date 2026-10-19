Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AEBCCF2DE
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 14:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E564E10ED82;
	Mon, 19 Oct 2026 14:16:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFAF10ED82
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 14:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792419358; x=1823955358;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ZNqjL0XzlK0Mld75mwDtFMimqmHxaNACjzosTLqcuGY=;
 b=Y86QT03G6JI6z2wAcXZ0tHpGunWGZwAP8INvH1RhVeduLEyQudOo9GhT
 EG4cN2OCwjbuSwMAi19tw3nvHki3ENQvfvDT/mnYo0Y0oO8lhU951QbNM
 /lDn16nkDtewHqFYuX7hx+x8/ixyaFmm/fONrM/jgvps1eognl3PIVD9v
 VAgy2mCAWG8FuEfNYMMNZR+YmLFZyb4QSAdnh8UStSKZdcKK4w3Ruleig
 ddiwAbDcrJg6PmXI2K3wsd2kclVmDJZavoztuIzv4GvPqwWDFyU0/YW5o
 3QrD0Rsw2y8fD65paHEDhn9a4Q+OEM2Oua0BW4pLf2cFqQkIZUuppe1MU g==;
X-CSE-ConnectionGUID: 1W1AinzXSp6Xcxv3AN2Jzg==
X-CSE-MsgGUID: 66ZZNaSxR1u42kU/DaQ/GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="970813"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="970813"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 07:15:58 -0700
X-CSE-ConnectionGUID: bwjBk+uNT4aOsUweSINAtg==
X-CSE-MsgGUID: JNhRvLVXRoK29/QrQJgqww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2881827"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.47])
 ([10.245.244.47])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 07:15:56 -0700
Message-ID: <02b86ebb170398c1720dcb849024a89fd3dc9ad4.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Add a minimum age gate to the shrinker
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Mon, 19 Oct 2026 16:15:54 +0200
In-Reply-To: <20261015231733.624746-1-matthew.brost@intel.com>
References: <20261015231733.624746-1-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
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

On Thu, 2026-10-15 at 16:17 -0700, Matthew Brost wrote:
> Backing up a BO costs a GPU blit plus a page copy, and if the BO is
> part
> of an active working set it is faulted straight back in on the next
> exec.
> Evicting a BO that was used moments ago is therefore almost always a
> loss, yet the shrinker currently has no notion of recency beyond LRU
> order.
>=20
> Timestamp BOs on their last use: on a successful move into TT in
> xe_bo_move(), and on the exec LRU bump in xe_vm_bump_lru(). Private
> BOs
> are bulk moved with their VM, so stamp the VM there and take the
> later
> of the BO and VM stamps for user BOs private to a VM. External
> objects
> are stamped individually.

Perhaps it makes sense to bump LRU on move into TT (I also recall some
implementations bumped LRU on CPU faults). Then we could timestamp on
LRU bump only. To me they indicate the same thing.

>=20
> Add a per-device shrinker_min_age_ms sysfs attribute, defaulting to
> CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS (0, disabled). While set, the
> shrinker
> won't back up BOs younger than the delay:
>=20
> - xe_shrinker_count() snoops the first shrinkable BO on each TT-
> backed
> =C2=A0 LRU using the trylocked reserved walker, as the tt may be torn dow=
n
> =C2=A0 while the BO is still on the LRU. If all are young it reports only
> =C2=A0 purgeable pages.
> - The backup walk stops at the first young BO, as the LRU is roughly
> age
> =C2=A0 ordered, and serves as a backstop for the count sample.
>=20
> The gate is hard and applies at every reclaim priority. A working set
> kept younger than the delay is never backed up and can lead to OOM.
> This
> is deliberate: some users prefer risking OOM over thrashing a hot
> working
> set, which is also why it is off by default.
>=20
> Purgeable objects are never gated, nor are BOs in XE_PL_SYSTEM: those
> are
> not GPU mapped, so not part of a working set, and are stamped again
> when
> moved back to TT for use.

What about an OOM notifier and thoughts about future per-cgroup
shrinking WRT this?

Perhaps add some timings to the commit message?


>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/Kconfig.profile=C2=A0=C2=A0 |=C2=A0 14 +++
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 42 ++++++++
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 7 ++
> =C2=A0drivers/gpu/drm/xe/xe_device_sysfs.c |=C2=A0 48 +++++++++
> =C2=A0drivers/gpu/drm/xe/xe_shrinker.c=C2=A0=C2=A0=C2=A0=C2=A0 | 145
> +++++++++++++++++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_shrinker.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 3 +
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 7 ++
> =C2=A09 files changed, 266 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> b/drivers/gpu/drm/xe/Kconfig.profile
> index e07517d120e0..0e68ad4f06a4 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -74,3 +74,17 @@ config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> =C2=A0	=C2=A0 to apply to applicable user. For elevated user, all above
> MIN
> =C2=A0	=C2=A0 and MAX values will apply when this configuration is
> enable to
> =C2=A0	=C2=A0 apply limitation. By default limitation is applied.
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
> index 12e523c61c1f..914a9949e6e1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1313,9 +1313,51 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		xe_tt_unmap_sg(xe, ttm_bo->ttm);
> =C2=A0	}
> =C2=A0
> +	if (!ret && ttm_bo->resource && ttm_bo->resource->mem_type
> =3D=3D XE_PL_TT)
> +		WRITE_ONCE(bo->lru_stamp, jiffies);
> +
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
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
> index 77b3a02e9b8e..927642adfc21 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -623,6 +623,8 @@ struct xe_bo_shrink_flags {
> =C2=A0	u32 writeback : 1;
> =C2=A0};
> =C2=A0
> +bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned
> long min_age);
> +
> =C2=A0long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct
> ttm_buffer_object *bo,
> =C2=A0		=C2=A0 const struct xe_bo_shrink_flags flags,
> =C2=A0		=C2=A0 unsigned long *scanned);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> b/drivers/gpu/drm/xe/xe_bo_types.h
> index 8ec4a01a0092..a5f0435df718 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -43,6 +43,13 @@ struct xe_bo {
> =C2=A0	u32 flags;
> =C2=A0	/** @vm: VM this BO is attached to, for extobj this will be
> NULL */
> =C2=A0	struct xe_vm *vm;
> +	/**
> +	 * @lru_stamp: jiffies at the last move into TT or, for
> external
> +	 * objects, the last exec LRU bump. Private BOs are
> additionally
> +	 * covered by &xe_vm.lru_stamp. Consulted by the shrinker's
> minimum
> +	 * age gate. Accessed with READ_ONCE()/WRITE_ONCE().
> +	 */
> +	unsigned long lru_stamp;
> =C2=A0	/**
> =C2=A0	 * @q: Queue this BO is attached to, mostly for LRC BO, NULL
> otherwise.
> =C2=A0	 * Protected by the BO dma_resv: readers must hold it across
> both the
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 18783a286a83..799397755f57 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -15,6 +15,7 @@
> =C2=A0#include "xe_pcode_api.h"
> =C2=A0#include "xe_pcode.h"
> =C2=A0#include "xe_pm.h"
> +#include "xe_shrinker.h"
> =C2=A0
> =C2=A0/**
> =C2=A0 * DOC: Xe device sysfs
> @@ -31,6 +32,12 @@
> =C2=A0 *
> =C2=A0 * lb_voltage_regulator_version - Voltage regulator version
> provisioned by late
> =C2=A0 * binding. Exposed only if supported by the device.
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
> @@ -75,6 +82,43 @@ static const struct attribute_group
> vram_attr_group =3D {
> =C2=A0	.attrs =3D vram_attrs,
> =C2=A0};
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
> +static struct attribute *shrinker_attrs[] =3D {
> +	&dev_attr_shrinker_min_age_ms.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group shrinker_attr_group =3D {
> +	.attrs =3D shrinker_attrs,
> +};
> +
> =C2=A0static ssize_t
> =C2=A0lb_fan_control_version_show(struct device *dev, struct
> device_attribute *attr, char *buf)
> =C2=A0{
> @@ -299,6 +343,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
> =C2=A0	struct device *dev =3D xe->drm.dev;
> =C2=A0	int ret;
> =C2=A0
> +	ret =3D devm_device_add_group(dev, &shrinker_attr_group);
> +	if (ret)
> +		return ret;
> +
> =C2=A0	if (xe->d3cold.capable) {
> =C2=A0		ret =3D devm_device_add_group(dev, &vram_attr_group);
> =C2=A0		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> b/drivers/gpu/drm/xe/xe_shrinker.c
> index deb4378c1ec1..f0bc026bd642 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -22,6 +22,8 @@
> =C2=A0 * @purgeable_pages: Number of pages that are currently purgeable.
> =C2=A0 * @shrink: Pointer to the mm shrinker.
> =C2=A0 * @pm_worker: Worker to wake up the device if required.
> + * @min_age_ms: Minimum BO age before backup, in ms. 0 disables.
> Defaults to
> + * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, overridable through sysfs.
> =C2=A0 */
> =C2=A0struct xe_shrinker {
> =C2=A0	struct xe_device *xe;
> @@ -30,6 +32,7 @@ struct xe_shrinker {
> =C2=A0	long purgeable_pages;
> =C2=A0	struct shrinker *shrink;
> =C2=A0	struct work_struct pm_worker;
> +	unsigned int min_age_ms;
> =C2=A0};
> =C2=A0
> =C2=A0static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
> @@ -80,6 +83,7 @@ static void xe_shrinker_runtime_pm_put(struct
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
> @@ -112,6 +116,16 @@ static int __xe_shrinker_walk(struct xe_shrinker
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
> =C2=A0			if (lret < 0) {
> =C2=A0				ret =3D lret;
> @@ -141,42 +155,128 @@ static int __xe_shrinker_walk(struct
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
> + * A BO's age is taken from the last time it moved into TT
> (xe_bo_move()) or,
> + * at exec time, was bumped on the LRU (xe_vm_bump_lru()). For BOs
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

XE_PL_SYSTEMs are never young?

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
> +
> +			break;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> =C2=A0static unsigned long
> =C2=A0xe_shrinker_count(struct shrinker *shrink, struct shrink_control
> *sc)
> =C2=A0{
> =C2=A0	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
> -	unsigned long num_pages;
> +	unsigned long num_pages, min_age;
> =C2=A0	bool can_backup =3D !!(sc->gfp_mask & __GFP_FS);
> =C2=A0
> +	min_age =3D can_backup ? xe_shrinker_min_age(shrinker) : 0;
> +	if (min_age && xe_shrinker_lru_young(shrinker, min_age))
> +		can_backup =3D false;
> +
> =C2=A0	num_pages =3D ttm_backup_bytes_avail() >> PAGE_SHIFT;

Also here, perhaps reorder since on a system with num_pages =3D=3D 0, the
bo age doesn't matter.


/Thomas

> =C2=A0	read_lock(&shrinker->lock);
> =C2=A0
> @@ -245,7 +345,7 @@ static unsigned long xe_shrinker_scan(struct
> shrinker *shrink, struct shrink_con
> =C2=A0	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker, false,
> nr_to_scan, can_backup);
> =C2=A0
> =C2=A0	if (purgeable && nr_scanned < nr_to_scan)
> -		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> +		xe_shrinker_walk(shrinker, &ctx, shrink_flags, 0,
> =C2=A0				 nr_to_scan, &nr_scanned, &freed);
> =C2=A0
> =C2=A0	sc->nr_scanned =3D nr_scanned;
> @@ -259,6 +359,7 @@ static unsigned long xe_shrinker_scan(struct
> shrinker *shrink, struct shrink_con
> =C2=A0	shrink_flags.purge =3D false;
> =C2=A0
> =C2=A0	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> +			 xe_shrinker_min_age(shrinker),
> =C2=A0			 nr_to_scan, &nr_scanned, &freed);
> =C2=A0
> =C2=A0	sc->nr_scanned =3D nr_scanned;
> @@ -288,6 +389,29 @@ static void xe_shrinker_fini(struct drm_device
> *drm, void *arg)
> =C2=A0	kfree(shrinker);
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
> @@ -309,6 +433,7 @@ int xe_shrinker_create(struct xe_device *xe)
> =C2=A0
> =C2=A0	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
> =C2=A0	shrinker->xe =3D xe;
> +	shrinker->min_age_ms =3D CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS;
> =C2=A0	rwlock_init(&shrinker->lock);
> =C2=A0	shrinker->shrink->count_objects =3D xe_shrinker_count;
> =C2=A0	shrinker->shrink->scan_objects =3D xe_shrinker_scan;
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.h
> b/drivers/gpu/drm/xe/xe_shrinker.h
> index 5132ae5192e1..a3b8b7dada09 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.h
> +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> @@ -13,4 +13,7 @@ void xe_shrinker_mod_pages(struct xe_shrinker
> *shrinker, long shrinkable, long p
> =C2=A0
> =C2=A0int xe_shrinker_create(struct xe_device *xe);
> =C2=A0
> +unsigned int xe_shrinker_min_age_ms(struct xe_shrinker *shrinker);
> +void xe_shrinker_set_min_age_ms(struct xe_shrinker *shrinker,
> unsigned int ms);
> +
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 095f762bbb6f..b569c1ababa3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -426,15 +426,22 @@ int xe_vm_validate_rebind(struct xe_vm *vm,
> struct drm_exec *exec,
> =C2=A0void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
> =C2=A0{
> =C2=A0	spinlock_t *lru_lock =3D &vm->xe->ttm.lru_lock;
> +	unsigned long now =3D jiffies;
> =C2=A0	struct drm_gem_object *obj;
> =C2=A0
> +	WRITE_ONCE(vm->lru_stamp, now);
> +
> =C2=A0	spin_lock(lru_lock);
> =C2=A0	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> =C2=A0	drm_exec_for_each_locked_object(exec, obj) {
> +		struct xe_bo *bo;
> +
> =C2=A0		if (!drm_gpuvm_is_extobj(&vm->gpuvm, obj))
> =C2=A0			continue;
> =C2=A0
> -		ttm_bo_move_to_lru_tail(&gem_to_xe_bo(obj)->ttm);
> +		bo =3D gem_to_xe_bo(obj);
> +		WRITE_ONCE(bo->lru_stamp, now);
> +		ttm_bo_move_to_lru_tail(&bo->ttm);
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
