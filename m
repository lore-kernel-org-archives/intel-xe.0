Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B455BC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 17:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895D810E153;
	Tue, 28 Nov 2023 17:01:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9708B10E153
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 17:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701190867; x=1732726867;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UL8ZVGsOdytqFCHbff6lvt0j4VZDIkjIQrfhNrJ6/Ac=;
 b=bmRhRBDNsT1dV7IttAYJ4LG6O2Ng3ComdPObZUr9zUBYKx0XiQWDF1IL
 FsvTeTHkVNKmUSXufO8RMIbCw6aX4Txz2bzoy5QKbYZ+Zgyrf9ekcsMjY
 9TQLf3MinrIb0i93mk4Bej6S3WiEW2ke5q878qZ44EcKLOo1NtvCxcH5j
 9FNDO3R2qtGcnwzExUuKt0RKywg5S0s9/ebeWS1ufnipm9QkCnc/BnXWz
 DNmFaQDq1rwo+Sv3DtTY4ezxrRX97leiAoo/fr7wV7oXDhNkqGMtbEIou
 Alksiglbxvs8qjupkvHH6rua+06v4y+LLPeUmGIrRJsyH/WZYdO/Ee56p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383352458"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="383352458"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:00:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="886465398"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="886465398"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2023 09:00:43 -0800
Received: from [10.249.140.124] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.140.124])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4507534973;
 Tue, 28 Nov 2023 17:00:41 +0000 (GMT)
Message-ID: <80cd47a5-f157-4847-8242-df842c2e2aec@intel.com>
Date: Tue, 28 Nov 2023 18:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
 <20231128151333.4068550-3-tejas.upadhyay@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231128151333.4068550-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M
 via sysfs
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



On 28.11.2023 16:13, Tejas Upadhyay wrote:
> On ATS-M CSC firmware calculated unique device id(uid) can be
> read from defined registers. Only ATS-M has this way of reading
> uid. Also ATS-M customer require this solution to locate and name
> their devices effectively.
> 
> Consumer of csc uid is level0 sysman and end users using sysman.

is this generic UID or UID only specific to CSC firmware ?
if former then maybe just name it as "uid" or "uuid" ?

> 
> This patch exports uid to the userspace via sysfs.

as this defines uabi, shouldn't this series go over dri-devel ?

+ @Rodrigo

> For example, uid can be read by:
> cat /sys/class/drm/cardX/device/csc_uid

as this is more Xe driver extension then maybe

/sys/bus/pci/drivers/xe/<BDF>/uuid

> 
> V2(Michal):
>   - Make separate patch for csc uid capability
>   - Use %#llx for 0x
>   - Dump error value when sysfs creation fails
>   - Have consistency in csc uid name
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
>  drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  4 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index ec9372aa739f..3599c7b38b61 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -71,6 +71,9 @@
>  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
>  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
>  
> +#define DEVUID_LWORD				XE_REG(0x102008)
> +#define DEVUID_HWORD				XE_REG(0x10200C)

Bspec uses different names .. and LWORD/HWORD look strange
but since it's for SW use then maybe at least (assuming ATSM is XEHP):

#define XEHP_DEVUID_LDW				XE_REG(0x102008)
#define XEHP_DEVUID_UDW				XE_REG(0x10200C)

> +
>  #define GGC					XE_REG(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
>  #define   GGMS_MASK				REG_GENMASK(7, 6)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d60379d844d2..b54635d512d6 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -355,6 +355,15 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
>  		xe_gt_sanitize(gt);
>  }
>  
> +static void xe_read_csc_uid(struct xe_device *xe)
> +{
> +	if (xe->info.has_csc_uid) {
> +		struct xe_gt *mmio = xe_root_mmio_gt(xe);
> +
> +		xe->info.csc_uid  = xe_mmio_read64_2x32(mmio, DEVUID_LWORD);
> +	}
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -379,6 +388,8 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	xe_read_csc_uid(xe);
> +
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 99113a5a2b84..4fbf0275d3bf 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>  
>  static DEVICE_ATTR_RW(vram_d3cold_threshold);
>  
> +static ssize_t csc_uid_show(struct device *dev,
> +			    struct device_attribute *attr,
> +			    char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	return sysfs_emit(buf, "%#llx\n", xe->info.csc_uid);

if there are no plans to use this value in driver then maybe just read
it here as it was already suggested by Lucas

> +}
> +
> +static DEVICE_ATTR_RO(csc_uid);
> +
>  static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_device *xe = arg;
>  
>  	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_csc_uid.attr);

it's sad that we don't have proper groups defines and need to add each
attribute separately (but that's not your fault)

>  }
>  
>  void xe_device_sysfs_init(struct xe_device *xe)
> @@ -83,6 +96,14 @@ void xe_device_sysfs_init(struct xe_device *xe)
>  		return;
>  	}
>  
> +	if (xe->info.has_csc_uid) {
> +		ret = sysfs_create_file(&dev->kobj, &dev_attr_csc_uid.attr);
> +		if (ret) {
> +			drm_warn(&xe->drm, "UID sysfs setup failed err=%pe\n", ERR_PTR(ret));
> +			return;

if you exit here, you will leak dev_attr_vram_d3cold_threshold

> +		}
> +	}
> +
>  	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
>  	if (ret)
>  		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 268a40639ec5..e88b64cb0eca 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -239,6 +239,8 @@ struct xe_device {
>  		u8 vm_max_level;
>  		/** @va_bits: Maximum bits of a virtual address */
>  		u8 va_bits;
> +		/** @csc_uid: device uid calculated by CSC FW, used for generating uuid */
> +		u64 csc_uid;
>  
>  		/** @is_dgfx: is discrete device */
>  		u8 is_dgfx:1;
