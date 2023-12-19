Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F08CC46CCD
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 10:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B98410E46F;
	Tue, 19 Dec 2023 10:53:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D41910E46F
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 10:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702983220; x=1734519220;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/w4ItXMNKcezYesM9G0r6Fq9HpMx4gOZFwgi/W8m0l0=;
 b=X795dXHxsamFQTAekEqTOmBYQjSwtR8v8aelhZo8DRqUo9ImkeBfT3fL
 VHZEn52Y31I6P68r4ccu/zTF4KB7AgaJUNyyRdPHgv33+ONipEAFnmxQO
 p+7OvxotEQOQCXZX37j572EtWtKoSRURZEykJijz3NhFscZQQT871NxFZ
 R24GdqwdD6uzglCv6gKCF5cVPXSVEGb+AFGFPbSwpqxMzwobRomP3t9zF
 afoOmZbgfbGyjbJiIOyM8L4H7SNYL9FnWXv86NBMr9ZBhHVc1i8ZTxudP
 bU/Ff7wd2XuZCHSaDQNyEcJXp/ui7frNVn04Wbe4MBmXy8wgf6+ICrylZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2734893"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2734893"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 02:53:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="841841610"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="841841610"
Received: from alexeyze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.118])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 02:53:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/xe: Add base balance sysfs attributes
In-Reply-To: <20231219100711.645011-2-sujaritha.sundaresan@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
 <20231219100711.645011-2-sujaritha.sundaresan@intel.com>
Date: Tue, 19 Dec 2023 12:53:33 +0200
Message-ID: <87plz2tqdu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 19 Dec 2023, Sujaritha Sundaresan <sujaritha.sundaresan@intel.com> =
wrote:
> Add sysfs attributes for base balance in gt.
>
> device/tile#gt#/freq0/balance
> 			|- base_freq_factor
> 			|- base_freq_factor.scale
> 			|- base_rp0_freq
> 			|- base_rpn_freq
>
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile              |   1 +
>  drivers/gpu/drm/xe/xe_gt_balance_sysfs.c | 181 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_balance_sysfs.h |  17 +++
>  drivers/gpu/drm/xe/xe_gt_freq.c          |   3 +
>  drivers/gpu/drm/xe/xe_pcode_api.h        |   5 +
>  5 files changed, 207 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_balance_sysfs.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 53bd2a8ba1ae..64bfd3d6eab4 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y +=3D xe_bb.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
> +	xe_gt_balance_sysfs.o \

See the comment in the Makefile.

# Please keep these build lists sorted!

>  	xe_gt_throttle_sysfs.o \
>  	xe_gt_tlb_invalidation.o \
>  	xe_gt_topology.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c b/drivers/gpu/drm/x=
e/xe_gt_balance_sysfs.c
> new file mode 100644
> index 000000000000..054b90ca128d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <regs/xe_reg_defs.h>

<> is for "system" headers in the top level include directory. Not for
local headers with relative paths.

> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_balance_sysfs.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
> +#include "xe_mmio.h"

Please keep include lists sorted.

> +
> +/**
> + * DOC: Xe GT Balance
> + *
> + * Provides sysfs entries for balance frequency in GT
> + *
> + * device/tile#/gt#/freq0/balance/base_freq_factor - Base frequency fact=
or
> + * device/tile#/gt#/freq0/balance/base_freq_factor.scale - Base frequenc=
y factor scale
> + * device/tile#/gt#/freq0/balance/base_rp0_freq - Base Render Performanc=
e 0 level frequency
> + * device/tile#//gt#/freq0/balance/base_rpn_freq - Base Render Performan=
ce N level frequency
> + */
> +
> +#define GT_FREQUENCY_MULTIPLIER	50
> +
> +#define U8_8_VAL_MASK           0xffff
> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
> +
> +static struct xe_gt *
> +dev_to_gt(struct device *dev)
> +{
> +	return kobj_to_gt(dev->kobj.parent);
> +}
> +
> +static ssize_t freq_factor_scale_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buff)

Just buf is customary everywhere, not buff.

> +{
> +	return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
> +}
> +
> +static ssize_t base_freq_factor_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buff)
> +{
> +	struct xe_gt *gt =3D dev_to_gt(dev);
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_QOS_MULTIPLIER_GET)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_DOMAIN_CHIPLET)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
> +
> +	err =3D xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	val &=3D U8_8_VAL_MASK;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +
> +static ssize_t base_freq_factor_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buff, size_t count)
> +{
> +	struct xe_gt *gt =3D dev_to_gt(dev);
> +	u32 val, mbox;
> +	int err;
> +
> +	err =3D kstrtou32(buff, 0, &val);
> +	if (err)
> +		return err;
> +
> +	if (val > U8_8_VAL_MASK)
> +		return -EINVAL;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_QOS_MULTIPLIER_SET)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_DOMAIN_CHIPLET)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
> +
> +	err =3D xe_pcode_write(gt, mbox, val);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(base_freq_factor);
> +static struct device_attribute dev_attr_base_freq_factor_scale =3D
> +	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
> +
> +static ssize_t base_rp0_freq_show(struct device *dev, struct device_attr=
ibute *attr,
> +				  char *buff)
> +{
> +	struct xe_gt *gt =3D dev_to_gt(dev);
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
> +
> +	err =3D xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *=3D GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(base_rp0_freq);
> +
> +static ssize_t base_rpn_freq_show(struct device *dev, struct device_attr=
ibute *attr,
> +				  char *buff)
> +{
> +	struct xe_gt *gt =3D dev_to_gt(dev);
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
> +
> +	err =3D xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *=3D GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(base_rpn_freq);
> +
> +static struct attribute *balance_attrs[] =3D {
> +	&dev_attr_base_freq_factor.attr,
> +	&dev_attr_base_freq_factor_scale.attr,
> +	&dev_attr_base_rp0_freq.attr,
> +	&dev_attr_base_rpn_freq.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group balance_group_attrs =3D {
> +	.name =3D "balance",
> +	.attrs =3D balance_attrs,
> +};
> +
> +static void gt_balance_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_gt *gt =3D arg;
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
> +	if (xe->info.platform =3D=3D XE_PVC)
> +		sysfs_remove_group(gt->freq, &balance_group_attrs);
> +}
> +
> +void xe_gt_balance_sysfs_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +	int err;
> +
> +	if (xe->info.platform =3D=3D XE_PVC) {
> +		err =3D sysfs_create_group(gt->freq, &balance_group_attrs);
> +		if (err) {
> +			drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", er=
r);
> +			return;
> +		}
> +	}
> +
> +	err =3D drmm_add_action_or_reset(&xe->drm, gt_balance_sysfs_fini, gt);
> +	if (err) {
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +		sysfs_remove_group(gt->freq, &balance_group_attrs);
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_balance_sysfs.h b/drivers/gpu/drm/x=
e/xe_gt_balance_sysfs.h
> new file mode 100644
> index 000000000000..39cec5223cf3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_BALANCE_SYSFS_H_
> +#define _XE_GT_BALANCE_SYSFS_H_
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +
> +void xe_gt_balance_sysfs_init(struct xe_gt *gt);
> +
> +#endif /* _XE_GT_BALANCE_SYSFS_H_ */
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_f=
req.c
> index 08eabcafe7bc..5b0e4fc402ec 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -13,6 +13,7 @@
>=20=20
>  #include "xe_device_types.h"
>  #include "xe_gt_sysfs.h"
> +#include "xe_gt_balance_sysfs.h"
>  #include "xe_gt_throttle_sysfs.h"
>  #include "xe_guc_pc.h"
>=20=20
> @@ -215,5 +216,7 @@ void xe_gt_freq_init(struct xe_gt *gt)
>  		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
>  			 kobject_name(gt->freq), err);
>=20=20
> +	xe_gt_balance_sysfs_init(gt);
> +
>  	xe_gt_throttle_sysfs_init(gt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pc=
ode_api.h
> index 4076a4e9daf3..87213b52df4a 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -49,6 +49,11 @@
>  /* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>  /* PCODE_FREQUENCY_CONFIG param2 */
>  #define     PCODE_MBOX_DOMAIN_HBM		0x2
> +#define     PCODE_MBOX_DOMAIN_CHIPLET		0x6
> +#define     PCODE_MBOX_DOMAIN_BASE		0x8
> +#define   PCODE_QOS_MULTIPLIER_SET		0x67
> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
> +#define   PCODE_QOS_MULTIPLIER_GET		0x66
>=20=20
>  struct pcode_err_decode {
>  	int errno;

--=20
Jani Nikula, Intel
