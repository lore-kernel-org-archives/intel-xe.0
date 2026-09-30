Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA77CA5FB1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 07:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C98589A94;
	Wed, 30 Sep 2026 07:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AelJLdps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F15810E115
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 07:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790753198; x=1822289198;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YeUer1aGcBmsWRpz0RjEUkeak4DZUpY8PMWVRmpj0b8=;
 b=AelJLdps4gfJAEkyDy6A82C3wmchbWL5QTSanfEwpocW+AL6Pd0keqDJ
 IGZN8pRhNPRnjqJdU1WmJLRIAQ+evkEwqz0QsW0mewhQSMKSyYEt2vVwj
 Pw8Bu0tJr6N0Rd7emEzH/dqZP3JQZ0PkMINVioKZFj2QeDRQf5JKl26JD
 X7qI0W2hDhqNpxz/gBvHc6MAIP2kiOyOS1NppitYGwOOfzy1QqsIjStxh
 q3Hc+cUAxc2jrSy1RIIZxAEt+l0qyQnqrV5WCKC37Mmu5pxIvVDRiMIbC
 FE4j+ghZBajG77ei0Sk8qOGLKkqhCcnQjG4IKk6PASc7c5xTXomBkBbqr w==;
X-CSE-ConnectionGUID: veED0Uh4THqDK8mCYLEryg==
X-CSE-MsgGUID: qsisPiXdQ8ufXSKkcxyQtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="94363108"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="94363108"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 00:26:38 -0700
X-CSE-ConnectionGUID: gKE4b6UXRyGoeN9xGl7PGA==
X-CSE-MsgGUID: JloUkPZMRH63h4sINI0D3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="273391350"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 00:26:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 michal.wajdeczko@intel.com
Subject: Re: [PATCH v3] drm/xe/cri: Expose device UID through sysfs
In-Reply-To: <20260929171823.3811737-2-badal.nilawar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260929171823.3811737-2-badal.nilawar@intel.com>
Date: Wed, 30 Sep 2026 10:26:32 +0300
Message-ID: <4bda9ba4395d2578abf71eb44ddd5a49d261208c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 29 Sep 2026, Badal Nilawar <badal.nilawar@intel.com> wrote:
> Expose a read-only sysfs attribute, device_uid, that reports the
> GPU SoC's unique identifier.

The commit message does not answer the question *why*.

BR,
Jani.

>
> Bspec: 53048, 53049
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2:
>   - add has flag instead of platform check to determin uid support (Anshuman)
>   - Fix the DOC: section (Michal)
>   - %s/_uuid/uid (Joonas)
> v3:
>   - Restrict device_uid to admin users (Sashiko/Joonas)
>   - Address review comments (Michal)
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
>  drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
>  drivers/gpu/drm/xe/xe_device.c                |  9 +++++
>  drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h          |  5 +++
>  drivers/gpu/drm/xe/xe_pci.c                   |  2 ++
>  drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
>  7 files changed, 65 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> new file mode 100644
> index 000000000000..4dc4afc3961d
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/pci/drivers/xe/.../device_uid
> +Date:		October 2026
> +KernelVersion:	7.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		RO. Unique 64-bit identifier of the GPU SoC device, exposed as
> +		hexadecimal value.
> +
> +		This sysfs file is present only on supported Intel Xe platforms.
> +		Accessible only to users with administrative privileges.
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index ef4746b7b5d3..437485b5a0af 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -30,6 +30,8 @@
>  #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
>  #define   TILE_COUNT				REG_GENMASK(15, 8)
>  
> +#define CRI_DEVICE_UID				XE_REG(0x102008)
> +
>  #define GGC					XE_REG(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
>  #define   GGMS_MASK				REG_GENMASK(7, 6)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 44975e7823be..e1979bbcf7bc 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -672,6 +672,7 @@ static void vf_update_device_info(struct xe_device *xe)
>  	xe->info.skip_guc_pc = 1;
>  	xe->info.skip_pcode = 1;
>  	xe->info.has_drm_ras = false;
> +	xe->info.has_device_uid = false;
>  }
>  
>  static int xe_device_vram_alloc(struct xe_device *xe)
> @@ -872,6 +873,12 @@ static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
>  }
>  #endif
>  
> +static void xe_uid_probe(struct xe_device *xe)
> +{
> +	if (xe->info.has_device_uid)
> +		xe->device_uid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UID);
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -879,6 +886,8 @@ int xe_device_probe(struct xe_device *xe)
>  	int err;
>  	u8 id;
>  
> +	xe_uid_probe(xe);
> +
>  	xe_pat_init_early(xe);
>  
>  	err = xe_sriov_init(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index a73e0e957cb0..18783a286a83 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -8,6 +8,7 @@
>  #include <linux/pci.h>
>  #include <linux/sysfs.h>
>  
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_device_sysfs.h"
>  #include "xe_mmio.h"
> @@ -264,6 +265,35 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
>  	.attrs = auto_link_downgrade_attrs,
>  };
>  
> +/**
> + * DOC: Device Unique ID
> + *
> + * On supported platforms, Xe driver exposes a unique 64-bit GPU SOC
> + * device identifier through the 'device_uid' sysfs entry.
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-gpu for the ABI
> + * specification.
> + */
> +
> +static ssize_t
> +device_uid_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	return sysfs_emit(buf, "0x%016llx\n", xe->device_uid);
> +}
> +static DEVICE_ATTR_ADMIN_RO(device_uid);
> +
> +static struct attribute *device_uid_attrs[] = {
> +	&dev_attr_device_uid.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group device_uid_attr_group = {
> +	.attrs = device_uid_attrs,
> +};
> +
>  int xe_device_sysfs_init(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
> @@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  			return ret;
>  	}
>  
> +	if (xe->info.has_device_uid) {
> +		ret = devm_device_add_group(dev, &device_uid_attr_group);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index cd9ed8ff2940..41f703a87916 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -179,6 +179,8 @@ struct xe_device {
>  		u8 has_cached_pt:1;
>  		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
>  		u8 has_device_atomics_on_smem:1;
> +		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
> +		u8 has_device_uid:1;
>  		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
>  		u8 has_drm_ras:1;
>  		/** @info.has_fan_control: Device supports fan control */
> @@ -265,6 +267,9 @@ struct xe_device {
>  		bool oob_initialized;
>  	} wa_active;
>  
> +	/** @device_uid: unique 64-bit GPU SOC identifier */
> +	u64 device_uid;
> +
>  	/** @survivability: survivability information for device */
>  	struct xe_survivability survivability;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 28f37e034e02..032a08fe41e6 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -472,6 +472,7 @@ static const struct xe_device_desc cri_desc = {
>  	PLATFORM(CRESCENTISLAND),
>  	.dma_mask_size = 52,
>  	.has_display = false,
> +	.has_device_uid = true,
>  	.has_drm_ras = true,
>  	.has_flat_ccs = false,
>  	.has_gsc_nvm = 1,
> @@ -793,6 +794,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_cached_pt = desc->has_cached_pt;
> +	xe->info.has_device_uid = desc->has_device_uid;
>  	xe->info.has_drm_ras = desc->has_drm_ras;
>  	xe->info.has_fan_control = desc->has_fan_control;
>  	/* runtime fusing may force flat_ccs to disabled later */
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 71068cdb3558..448bbe5ba1d7 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -40,6 +40,7 @@ struct xe_device_desc {
>  
>  	u8 has_cached_pt:1;
>  	u8 has_display:1;
> +	u8 has_device_uid:1;
>  	u8 has_drm_ras:1;
>  	u8 has_fan_control:1;
>  	u8 has_flat_ccs:1;

-- 
Jani Nikula, Intel
