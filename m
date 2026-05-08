Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977C9CD3436
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 10:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524BE10E30D;
	Fri,  8 May 2026 10:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8JfC5jz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2530910E30D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778235296; x=1809771296;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aoY1TdgDviYbSek98vYByltpZSlzesCu4spKbYkE5xo=;
 b=W8JfC5jzAwJuSJQv24myAG0hk51OkYU9wzRQWt8rCPEFdv0t5B6m6y+z
 abej1KP6OXdAvUljscXW/OxFl9KiFSdOnQuVnlDPQRFRT+TVVrXvYaQnk
 WH8gCsks67GROz7G7AVeaqkBRZYHhY6EMW0TkCQ+0fz8d4C4a3ztuHLz1
 ItjwMKp+KP/YNUCGtQGXBSin7b8n0s9y7bBFUihBtz96ZJ3P1aR1AYim6
 AwBQWin3p/NlsPYOoCpolrpaKHI/CBdWWLYkSW9nupr8SUMWqkM0ChbWz
 Ewav5I53D1So2Ig+QZZ+pc6Cx5lMxj4MU26T3N+RdXeqczPfakaP1PujL A==;
X-CSE-ConnectionGUID: 37zw06aqRGiP12G64T3qXA==
X-CSE-MsgGUID: tNZ3TJPdRfexj5fFTUb8ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79054953"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="79054953"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 03:14:56 -0700
X-CSE-ConnectionGUID: D7nLkHEtQOWOURl8yYXd0A==
X-CSE-MsgGUID: +RCBPfUpRKuY950NXWzo/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="230333381"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.63])
 ([10.245.244.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 03:14:54 -0700
Message-ID: <8254f11d-8758-43a8-8847-770918739733@intel.com>
Date: Fri, 8 May 2026 11:14:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V7 09/10] drm/xe/configfs: Add vram bad page
 reservation policy
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
References: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
 <20260416074958.3722666-21-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260416074958.3722666-21-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 16/04/2026 08:49, Tejas Upadhyay wrote:
> The interface enables setting the policy for how bad pages are
> handled in VRAM. This is crucial for maintaining system
> stability in scenarios where VRAM degradation occurs.
> 
> By default policy will be "reserve", which can be changed to
> "logging" only.

Might be good give the motivation/why somewhere? At at glance, it's not 
obvious why we would want logging only.

For example, you set reserve=false, and then probe the device. Would 
that not skip offlining the known bad pages even for the nice case 
during probe? Or does this only impact the "runtime" offlining once we 
make it past probe? But if that is the case then that should be 
documented clearly, I think.

> 
> v3:
> - All FW communication moved under RAS
> v2:
> - Add CRI check and rebase
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_configfs.c     | 64 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_configfs.h     |  2 +
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 10 +++++
>   3 files changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 32102600a148..e07a6a74896b 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -61,7 +61,8 @@
>    *	    ├── survivability_mode
>    *	    ├── gt_types_allowed
>    *	    ├── engines_allowed
> - *	    └── enable_psmi
> + *          ├── enable_psmi
> + *          └── bad_page_reservation


>    *
>    * After configuring the attributes as per next section, the device can be
>    * probed with::
> @@ -159,6 +160,16 @@
>    *
>    * This attribute can only be set before binding to the device.
>    *
> + * Bad pages reservation:
> + * ---------------------
> + *
> + * Disable vram bad pages reservation, instead just report it in dmesg.
> + *  Example to disable it::
> + *
> + *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/bad_page_reservation
> + *
> + * This attribute can only be set before binding to the device.
> + *
>    * Context restore BB
>    * ------------------
>    *
> @@ -262,6 +273,7 @@ struct xe_config_group_device {
>   		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>   		bool survivability_mode;
>   		bool enable_psmi;
> +		bool bad_page_reservation;
>   		struct {
>   			unsigned int max_vfs;
>   			bool admin_only_pf;
> @@ -281,6 +293,7 @@ static const struct xe_config_device device_defaults = {
>   	.engines_allowed = U64_MAX,
>   	.survivability_mode = false,
>   	.enable_psmi = false,
> +	.bad_page_reservation = true,
>   	.sriov = {
>   		.max_vfs = XE_DEFAULT_MAX_VFS,
>   		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> @@ -575,6 +588,32 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
>   	return len;
>   }
>   
> +static ssize_t bad_page_reservation_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->bad_page_reservation);
> +}
> +
> +static ssize_t bad_page_reservation_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.bad_page_reservation = val;
> +
> +	return len;
> +}
> +
>   static bool wa_bb_read_advance(bool dereference, char **p,
>   			       const char *append, size_t len,
>   			       size_t *max_size)
> @@ -813,6 +852,7 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
>   CONFIGFS_ATTR(, ctx_restore_mid_bb);
>   CONFIGFS_ATTR(, ctx_restore_post_bb);
>   CONFIGFS_ATTR(, enable_psmi);
> +CONFIGFS_ATTR(, bad_page_reservation);
>   CONFIGFS_ATTR(, engines_allowed);
>   CONFIGFS_ATTR(, gt_types_allowed);
>   CONFIGFS_ATTR(, survivability_mode);
> @@ -821,6 +861,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>   	&attr_ctx_restore_mid_bb,
>   	&attr_ctx_restore_post_bb,
>   	&attr_enable_psmi,
> +	&attr_bad_page_reservation,
>   	&attr_engines_allowed,
>   	&attr_gt_types_allowed,
>   	&attr_survivability_mode,
> @@ -1098,6 +1139,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>   	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>   	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>   	PRI_CUSTOM_ATTR("%d", enable_psmi);
> +	PRI_CUSTOM_ATTR("%d", bad_page_reservation);
>   	PRI_CUSTOM_ATTR("%d", survivability_mode);
>   	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>   
> @@ -1225,6 +1267,26 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>   	return ret;
>   }
>   
> +/**
> + * xe_configfs_get_bad_page_reservation - get configfs bad_page_reservation setting
> + * @pdev: pci device
> + *
> + * Return: bad_page_reservation setting in configfs
> + */
> +bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return device_defaults.bad_page_reservation;
> +
> +	ret = dev->config.bad_page_reservation;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
>    * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 07d62bf0c152..c107d84b2c62 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -23,6 +23,7 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>   bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>   bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> +bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev);
>   u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   				       enum xe_engine_class class,
>   				       const u32 **cs);
> @@ -42,6 +43,7 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
>   static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
>   static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>   static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> +static inline bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev) { return true; }
>   static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   						     enum xe_engine_class class,
>   						     const u32 **cs) { return 0; }
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index fcf32360f240..7f58e7e8c3e1 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -12,6 +12,7 @@
>   #include <drm/ttm/ttm_range_manager.h>
>   
>   #include "xe_bo.h"
> +#include "xe_configfs.h"
>   #include "xe_device.h"
>   #include "xe_exec_queue.h"
>   #include "xe_lrc.h"
> @@ -731,6 +732,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
>   	struct xe_ttm_vram_mgr *vram_mgr;
>   	struct xe_vram_region *vr;
>   	struct gpu_buddy *mm;
> +	bool policy;
>   	int ret;
>   
>   	vr = xe_ttm_vram_addr_to_region(xe, addr);
> @@ -745,6 +747,14 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
>   
>   	/* TODO: Check if we already processed faulted address, and if yes return -EEXIST */
>   
> +	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(xe->drm.dev));
> +	if (!policy) {
> +		drm_err(&xe->drm, "0x%lx is reported as corrupted address by HW\n",
> +			addr);
> +		/* Let RAS report to FW to drop addr from SRAM queue */
> +		return -EOPNOTSUPP;
> +	}
> +
>   	/* Reserve page at address */
>   	ret = xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
>   	return ret;

