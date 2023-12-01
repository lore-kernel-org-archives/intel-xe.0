Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDFFC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 14:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BD210E108;
	Fri,  1 Dec 2023 14:28:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C21A10E108
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701440904; x=1732976904;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7AByQ06r1Cao4D6MnnMMBQb1RzYwSU5RGgb+HzWP9CY=;
 b=XqAKJrOLqAwVYlS+RU7znrkHNaURFeNX67Bll1lko5MgASdgN8vsk5pT
 z5eapLT3xGDNKo72p0GaMXoDmcbbYKvhYiySU98xqiEyY6jGECTEpByKo
 u9HUUJa2+MfAK51KDS8FnfF8iIQFL9/01Cv51VissOiqhHgStdkO7R6ae
 QT0kJwQQqEICYHDUEID+MoODo9ajyEbN1rtknIcq6x4OpGaOxh/dQG2DB
 i7WS5O1czyNrIcw1De5DtwhVz+D0vJFGzfyHZ1AviWDQTndgyBpaUjklK
 o49RmD1yjDcAYYWZK8z45jg9CuWkf5BHrv8FIwdskl2OF0Og1fb597d4L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="424660591"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="424660591"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 06:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="860573580"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="860573580"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2023 06:28:17 -0800
Received: from [10.249.142.37] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.142.37])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 631563B583;
 Fri,  1 Dec 2023 14:28:16 +0000 (GMT)
Message-ID: <493d1a6f-35b4-4670-a65e-771bc7237fdb@intel.com>
Date: Fri, 1 Dec 2023 15:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
 <20231129214509.1174116-10-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231129214509.1174116-10-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [CI 10/14] drm/xe/device: Introduce
 xe_device_probe_early
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 29.11.2023 22:45, Michał Winiarski wrote:
> SR-IOV VF doesn't have access to MMIO registers used to determine
> graphics/media ID. It can however communicate with GuC.
> Introduce xe_device_probe_early, which initializes enough HW to use
> MMIO GuC communication.
> This will allow both VF and PF/native driver to have unified probe
> ordering.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_device.h |  5 +++++
>  drivers/gpu/drm/xe/xe_mmio.c   | 16 ++++++++++------
>  drivers/gpu/drm/xe/xe_mmio.h   |  1 +
>  drivers/gpu/drm/xe/xe_pci.c    | 26 +++++++++++++++++++++-----
>  5 files changed, 55 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5e1f73c8c77ad..f4be4b13a506e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -375,6 +375,24 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return err;
>  }
>  
> +/*
> + * Initialize MMIO resources that don't require any knowledge about tile count.
> + */
> +int xe_device_probe_early(struct xe_device *xe)
> +{
> +	int err;
> +
> +	err = xe_mmio_init(xe);
> +	if (err)
> +		return err;
> +
> +	err = xe_mmio_root_tile_init(xe);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -393,10 +411,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	err = xe_mmio_init(xe);
> -	if (err)
> -		return err;
> -
>  	xe_mmio_probe_tiles(xe);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 54694f98c91a2..3da83b2332063 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>  
>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent);
> +int xe_device_probe_early(struct xe_device *xe);
>  int xe_device_probe(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
>  void xe_device_shutdown(struct xe_device *xe);
> @@ -123,6 +124,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
>  		for_each_if((tile__) = &(xe__)->tiles[(id__)])
>  
> +#define for_each_remote_tile(tile__, xe__, id__) \
> +	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
> +		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> +
>  /*
>   * FIXME: This only works for now since multi-tile and standalone media
>   * happen to be mutually exclusive.  Future platforms may change this...
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index d1b59021c9712..6148c9da4f64e 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -15,10 +15,12 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
> +#include "xe_tile.h"
>  
>  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>  #define TILE_COUNT		REG_GENMASK(15, 8)
> @@ -376,10 +378,8 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
>  
>  int xe_mmio_init(struct xe_device *xe)
>  {
> -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	const int mmio_bar = 0;
> -	int err;
>  
>  	/*
>  	 * Map the entire BAR.
> @@ -393,12 +393,16 @@ int xe_mmio_init(struct xe_device *xe)
>  		return -EIO;
>  	}
>  
> -	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> -	if (err)
> -		return err;
> +	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> +}
> +
> +int xe_mmio_root_tile_init(struct xe_device *xe)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	int err;
>  
>  	/* Setup first tile; other tiles (if present) will be setup later. */
> -	root_tile->mmio.size = xe->mmio.size;
> +	root_tile->mmio.size = SZ_16M;
>  	root_tile->mmio.regs = xe->mmio.regs;
>  
>  	err = xe_verify_lmem_ready(xe);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index c054c27f6925d..98de5c13c89ba 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -21,6 +21,7 @@ struct xe_device;
>  #define LMEM_BAR		2
>  
>  int xe_mmio_init(struct xe_device *xe);
> +int xe_mmio_root_tile_init(struct xe_device *xe);
>  void xe_mmio_probe_tiles(struct xe_device *xe);
>  
>  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d9a3b20179cc2..889f60fa2e7cf 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -540,10 +540,12 @@ static void handle_gmdid(struct xe_device *xe,
>   * Initialize device info content that only depends on static driver_data passed to the driver at
>   * probe time from PCI ID table.
>   */
> -static void xe_info_init_early(struct xe_device *xe,
> -			       const struct xe_device_desc *desc,
> -			       const struct xe_subplatform_desc *subplatform_desc)
> +static int xe_info_init_early(struct xe_device *xe,
> +			      const struct xe_device_desc *desc,
> +			      const struct xe_subplatform_desc *subplatform_desc)
>  {
> +	int err;
> +
>  	xe->info.platform = desc->platform;
>  	xe->info.subplatform = subplatform_desc ?
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> @@ -558,6 +560,12 @@ static void xe_info_init_early(struct xe_device *xe,
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				  xe_modparam.enable_display &&
>  				  desc->has_display;
> +
> +	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
> +	if (err)
> +		return err;

why this is inside xe_info_init_early() ?
can we call it separately, as xe_info_init_early() suggests that "info"
will touched, while xe_tile_init_early() does much more

as a bonus you will avoid changing signature of xe_info_init_early()
from void to int

> +
> +	return 0;
>  }
>  
>  /*
> @@ -626,13 +634,15 @@ static int xe_info_init(struct xe_device *xe,
>  	 */
>  	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
>  
> -	for_each_tile(tile, xe, id) {
> +	for_each_remote_tile(tile, xe, id) {
>  		int err;
>  
>  		err = xe_tile_init_early(tile, xe, id);
>  		if (err)
>  			return err;
> +	}
>  
> +	for_each_tile(tile, xe, id) {
>  		gt = tile->primary_gt;
>  		gt->info.id = xe->info.gt_count++;
>  		gt->info.type = XE_GT_TYPE_MAIN;
> @@ -726,10 +736,16 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	pci_set_master(pdev);
>  
> -	xe_info_init_early(xe, desc, subplatform_desc);
> +	err = xe_info_init_early(xe, desc, subplatform_desc);
> +	if (err)
> +		return err;
>  
>  	xe_sriov_probe_early(xe, desc->has_sriov);
>  
> +	err = xe_device_probe_early(xe);
> +	if (err)
> +		return err;
> +
>  	err = xe_info_init(xe, desc, subplatform_desc);
>  	if (err)
>  		return err;
