Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B931C678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 15:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5B010E0C8;
	Thu,  2 Mar 2023 15:02:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE48110E0C8
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677769360; x=1709305360;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YY8cWDIMbPLEUmvxcakvST3QTwx1sKAZEknG0SIZHW4=;
 b=cj7+SUUiOgU6Fe1s7KC1dDEsB/H1IY02eHsg2rrW63iu58UbOMG5Ihwp
 yqAKlBW4HeyF5rhir2MZi9Cwbx/iQT4SRQ2BQWeqmRpDwCoLb9BprZY3S
 KjQQz4egTzHtpd6Bmw7ie80R1i23qOOvATl8gBxdYn2oFvdbqQZOQTR0i
 V0PUmC6UgdDNjwUTfZndWo3RiCqSPLy6RKP8fPkWlhUpcx4zB4BPaVoMa
 iI7FUGrwu3wz34nOkcaSAVJhW/W8/GM4hkaTasKSEfz1zkILs/zmGhcnM
 4QT/T+U5Rd7ff6x0hsyg60pkyJKtaPzeJOZSbs8eKxKpjPTwUFIqeiWKp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336257397"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="336257397"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="674984338"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="674984338"
Received: from martamon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.129])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:44:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <87y1ofusbs.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230302013411.3262608-1-lucas.demarchi@intel.com>
 <20230302013411.3262608-6-lucas.demarchi@intel.com>
 <87y1ofusbs.fsf@intel.com>
Date: Thu, 02 Mar 2023 16:44:01 +0200
Message-ID: <87v8jjusb2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 5/7] drm/xe/display: Move device info
 initialization to display
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, maarten.lankhorst@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 02 Mar 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 01 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Instead of initializing the display info together with the platform in
>> xe_pci.c, let the display part initialize it. The small disadvantage is
>> that the description struct is not automatically mapped from the PCI ID,
>> but just doing a switch on the platform, that should already be set
>> during display initialization should be ok.
>
> Have we already given up on the idea that device info would be a pointer
> to rodata?
>
> The thing that was always problematic for i915 was that it was all too
> convenient to go fiddle with the device info runtime, based on some
> arbitrary needs.
>
> ---
>
> That said, there's really no requirement that the struct pci_device_id
> driver_data members in MODULE_DEVICE_TABLE() need to be pointers to some
> device info structures, at all. The initialization of device info could
> be done in completely different ways if we dropped that notion. The
> current macro "inheritance" in both i915 and xe is absolutely horrible.
>
> Anyway, going to block the patch, just checking on the direction here.

Sheesh, *NOT* going to. Sorry.


>
>
> BR,
> Jani.
>
>
>
>
>
>
>
>
>>
>> This allows to encapsulate the display details inside the display
>> compilation units.
>>
>> Also use __diag_push() / __diag_pop() like in xe_step to handle the few
>> places where -Woverride-init should be disabled.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile     |   3 -
>>  drivers/gpu/drm/xe/xe_display.c | 114 ++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_display.h |  15 ++---
>>  drivers/gpu/drm/xe/xe_pci.c     |  90 ++-----------------------
>>  4 files changed, 128 insertions(+), 94 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 18257cd7227d..d1d255df74a1 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -24,9 +24,6 @@ subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
>>  subdir-ccflags-y += $(call cc-disable-warning, frame-address)
>>  subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
>>  
>> -# Fine grained warnings disable
>> -CFLAGS_xe_pci.o = $(call cc-disable-warning, override-init)
>> -
>>  subdir-ccflags-y += -I$(srctree)/$(src)
>>  
>>  # Please keep these build lists sorted!
>> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>> index 34bdb2d60938..76e4fb6bd67c 100644
>> --- a/drivers/gpu/drm/xe/xe_display.c
>> +++ b/drivers/gpu/drm/xe/xe_display.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/fb.h>
>>  
>>  #include <drm/drm_aperture.h>
>> +#include <drm/drm_drv.h>
>>  #include <drm/drm_managed.h>
>>  #include <drm/xe_drm.h>
>>  
>> @@ -383,4 +384,117 @@ void xe_display_pm_resume(struct xe_device *xe)
>>  	intel_power_domains_enable(xe);
>>  }
>>  
>> +/* Display info initialization */
>> +__diag_push();
>> +__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>> +
>> +#define __DISPLAY_DEFAULTS \
>> +	.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) |			\
>> +		     BIT(PIPE_C) | BIT(PIPE_D),				\
>> +	.cpu_transcoder_mask =						\
>> +	BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |				\
>> +	BIT(TRANSCODER_C) | BIT(TRANSCODER_D) |				\
>> +	BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1),			\
>> +	.pipe_offsets = {						\
>> +		[TRANSCODER_A] = PIPE_A_OFFSET,				\
>> +		[TRANSCODER_B] = PIPE_B_OFFSET,				\
>> +		[TRANSCODER_C] = PIPE_C_OFFSET,				\
>> +		[TRANSCODER_D] = PIPE_D_OFFSET,				\
>> +		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET,			\
>> +		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET,			\
>> +	},								\
>> +	.trans_offsets = {						\
>> +		[TRANSCODER_A] = TRANSCODER_A_OFFSET,			\
>> +		[TRANSCODER_B] = TRANSCODER_B_OFFSET,			\
>> +		[TRANSCODER_C] = TRANSCODER_C_OFFSET,			\
>> +		[TRANSCODER_D] = TRANSCODER_D_OFFSET,			\
>> +		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET,		\
>> +		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET,		\
>> +	}
>> +
>> +#define GEN12_DISPLAY \
>> +	__DISPLAY_DEFAULTS,						\
>> +	.ver = 12,							\
>> +	.abox_mask = GENMASK(2, 1),					\
>> +	.has_dmc = 1,							\
>> +	.has_dp_mst = 1,						\
>> +	.has_dsb = 0, /* FIXME: LUT load is broken with huge DSB */	\
>> +	.dbuf.size = 2048,						\
>> +	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2),			\
>> +	.has_dsc = 1,							\
>> +	.fbc_mask = BIT(INTEL_FBC_A),					\
>> +	.has_fpga_dbg = 1,						\
>> +	.has_hdcp = 1,							\
>> +	.has_ipc = 1,							\
>> +	.has_psr = 1,							\
>> +	.has_psr_hw_tracking = 1,					\
>> +	.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }
>> +
>> +#define GEN13_DISPLAY							\
>> +	__DISPLAY_DEFAULTS,						\
>> +	.ver = 13,							\
>> +	.abox_mask = GENMASK(1, 0),					\
>> +	.color = {							\
>> +		.degamma_lut_size = 128, .gamma_lut_size = 1024,	\
>> +		.degamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING |	\
>> +		DRM_COLOR_LUT_EQUAL_CHANNELS,				\
>> +	},								\
>> +	.dbuf.size = 4096,						\
>> +	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2) | BIT(DBUF_S3) |	\
>> +	BIT(DBUF_S4),							\
>> +	.has_dmc = 1,							\
>> +	.has_dp_mst = 1,						\
>> +	.has_dsb = 1,							\
>> +	.has_dsc = 1,							\
>> +	.fbc_mask = BIT(INTEL_FBC_A),					\
>> +	.has_fpga_dbg = 1,						\
>> +	.has_hdcp = 1,							\
>> +	.has_ipc = 1,							\
>> +	.has_psr = 1
>> +
>> +void xe_display_info_init(struct xe_device *xe)
>> +{
>> +	if (!xe->info.enable_display)
>> +		return;
>> +
>> +	switch (xe->info.platform) {
>> +	case XE_TIGERLAKE:
>> +	case XE_DG1:
>> +		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
>> +		break;
>> +	case XE_ALDERLAKE_S:
>> +	case XE_ALDERLAKE_P:
>> +		xe->info.display = (struct xe_device_display_info) {
>> +			GEN12_DISPLAY,
>> +			.has_hti = 1,
>> +			.has_psr_hw_tracking = 0,
>> +		};
>> +		break;
>> +	case XE_DG2:
>> +		xe->info.display = (struct xe_device_display_info) {
>> +			GEN13_DISPLAY,
>> +			.cpu_transcoder_mask =
>> +				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>> +				BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
>> +		};
>> +		break;
>> +	case XE_METEORLAKE:
>> +		xe->info.display = (struct xe_device_display_info) {
>> +			GEN13_DISPLAY,
>> +			.ver = 14,
>> +			.has_cdclk_crawl = 1,
>> +			.has_cdclk_squash = 1,
>> +		};
>> +		break;
>> +	default:
>> +		/*
>> +		 * If platform doesn't have display, enable_display should
>> +		 * had been forced to false already at this point
>> +		 */
>> +		drm_WARN_ON(&xe->drm, 1);
>> +	}
>> +}
>> +
>> +__diag_pop();
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
>> index cb5298ceed3b..d1af8e3a5c0f 100644
>> --- a/drivers/gpu/drm/xe/xe_display.h
>> +++ b/drivers/gpu/drm/xe/xe_display.h
>> @@ -6,16 +6,18 @@
>>  #ifndef _XE_DISPLAY_H_
>>  #define _XE_DISPLAY_H_
>>  
>> -#include <drm/drm_drv.h>
>> -
>>  #include "xe_device.h"
>>  
>> +struct drm_driver;
>> +
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>  
>>  int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver);
>>  
>>  int xe_display_create(struct xe_device *xe);
>>  
>> +void xe_display_info_init(struct xe_device *xe);
>> +
>>  int xe_display_init_nommio(struct xe_device *xe);
>>  void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
>>  
>> @@ -51,6 +53,8 @@ xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver) { r
>>  static inline int
>>  xe_display_create(struct xe_device *xe) { return 0; }
>>  
>> +static inline void xe_display_info_init(struct xe_device *xe) { }
>> +
>>  static inline int
>>  xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; };
>>  
>> @@ -58,12 +62,7 @@ static inline int
>>  xe_display_init_nommio(struct xe_device *xe) { return 0; };
>>  static inline void xe_display_fini_nommio(struct drm_device *dev, void *dummy) {};
>>  
>> -static inline int xe_display_init_noirq(struct xe_device *xe)
>> -{
>> -	if (xe->info.display.pipe_mask != 0)
>> -		drm_warn(&xe->drm, "CONFIG_DRM_XE_DISPLAY is unset, but device is display capable\n");
>> -	return 0;
>> -}
>> +static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
>>  
>>  static inline void
>>  xe_display_fini_noirq(struct drm_device *dev, void *dummy) {};
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 11dc0de66101..c4d9fd2e7b2b 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -16,6 +16,7 @@
>>  
>>  #include "regs/xe_regs.h"
>>  #include "xe_device.h"
>> +#include "xe_display.h"
>>  #include "xe_drv.h"
>>  #include "xe_macros.h"
>>  #include "xe_module.h"
>> @@ -62,8 +63,6 @@ struct xe_device_desc {
>>  	DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
>>  #undef DEFINE_FLAG
>>  
>> -	struct xe_device_display_info display;
>> -
>>  	u8 vram_flags;
>>  	u8 max_tiles;
>>  	u8 vm_max_level;
>> @@ -75,79 +74,15 @@ struct xe_device_desc {
>>  	bool has_asid;
>>  };
>>  
>> +__diag_push();
>> +__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>> +
>>  #define PLATFORM(x)		\
>>  	.platform = (x),	\
>>  	.platform_name = #x
>>  
>>  #define NOP(x)	x
>>  
>> -#define __DISPLAY_DEFAULTS \
>> -		.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D), \
>> -		.cpu_transcoder_mask = \
>> -			BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
>> -			BIT(TRANSCODER_C) | BIT(TRANSCODER_D) | \
>> -			BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1), \
>> -		.pipe_offsets = { \
>> -			[TRANSCODER_A] = PIPE_A_OFFSET, \
>> -			[TRANSCODER_B] = PIPE_B_OFFSET, \
>> -			[TRANSCODER_C] = PIPE_C_OFFSET, \
>> -			[TRANSCODER_D] = PIPE_D_OFFSET, \
>> -			[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET, \
>> -			[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET, \
>> -		}, \
>> -		.trans_offsets = { \
>> -			[TRANSCODER_A] = TRANSCODER_A_OFFSET, \
>> -			[TRANSCODER_B] = TRANSCODER_B_OFFSET, \
>> -			[TRANSCODER_C] = TRANSCODER_C_OFFSET, \
>> -			[TRANSCODER_D] = TRANSCODER_D_OFFSET, \
>> -			[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET, \
>> -			[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET, \
>> -		}, \
>> -
>> -#define GEN12_DISPLAY \
>> -	.display = (struct xe_device_display_info){ \
>> -		__DISPLAY_DEFAULTS \
>> -		.ver = 12, \
>> -		.abox_mask = GENMASK(2, 1), \
>> -		.has_dmc = 1, \
>> -		.has_dp_mst = 1, \
>> -		.has_dsb = 0, /* FIXME: LUT load is broken with huge DSB */ \
>> -		.dbuf.size = 2048, \
>> -		.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2), \
>> -		.has_dsc = 1, \
>> -		.fbc_mask = BIT(INTEL_FBC_A), \
>> -		.has_fpga_dbg = 1, \
>> -		.has_hdcp = 1, \
>> -		.has_ipc = 1, \
>> -		.has_psr = 1, \
>> -		.has_psr_hw_tracking = 1, \
>> -		.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }, \
>> -	}
>> -
>> -#define GEN13_DISPLAY \
>> -	.display = (struct xe_device_display_info){ \
>> -		__DISPLAY_DEFAULTS \
>> -		.ver = 13,							\
>> -		.abox_mask = GENMASK(1, 0),					\
>> -		.color = {							\
>> -			.degamma_lut_size = 128, .gamma_lut_size = 1024,	\
>> -			.degamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING |	\
>> -				     DRM_COLOR_LUT_EQUAL_CHANNELS,		\
>> -		},								\
>> -		.dbuf.size = 4096,						\
>> -		.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2) | BIT(DBUF_S3) |	\
>> -				   BIT(DBUF_S4),				\
>> -		.has_dmc = 1,							\
>> -		.has_dp_mst = 1,						\
>> -		.has_dsb = 1,							\
>> -		.has_dsc = 1,							\
>> -		.fbc_mask = BIT(INTEL_FBC_A),					\
>> -		.has_fpga_dbg = 1,						\
>> -		.has_hdcp = 1,							\
>> -		.has_ipc = 1,							\
>> -		.has_psr = 1,							\
>> -	}
>> -
>>  /* Keep in gen based order, and chronological order within a gen */
>>  #define GEN12_FEATURES \
>>  	.require_force_probe = true, \
>> @@ -160,20 +95,15 @@ struct xe_device_desc {
>>  
>>  static const struct xe_device_desc tgl_desc = {
>>  	GEN12_FEATURES,
>> -	GEN12_DISPLAY,
>>  	PLATFORM(XE_TIGERLAKE),
>>  	.platform_engine_mask =
>>  		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>>  		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
>>  		BIT(XE_HW_ENGINE_VCS2),
>> -	GEN12_DISPLAY,
>>  };
>>  
>>  static const struct xe_device_desc adl_s_desc = {
>>  	GEN12_FEATURES,
>> -	GEN12_DISPLAY,
>> -	.display.has_hti = 1,
>> -	.display.has_psr_hw_tracking = 0,
>>  	PLATFORM(XE_ALDERLAKE_S),
>>  	.platform_engine_mask =
>>  		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>> @@ -195,7 +125,6 @@ static const struct xe_device_desc adl_p_desc = {
>>  
>>  static const struct xe_device_desc dg1_desc = {
>>  	GEN12_FEATURES,
>> -	GEN12_DISPLAY,
>>  	DGFX_FEATURES,
>>  	.graphics_rel = 10,
>>  	PLATFORM(XE_DG1),
>> @@ -256,9 +185,6 @@ static const struct xe_device_desc dg2_desc = {
>>  	XE_HPM_FEATURES,
>>  
>>  	DG2_FEATURES,
>> -	GEN13_DISPLAY,
>> -	.display.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>> -				       BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
>>  };
>>  
>>  #define PVC_ENGINES \
>> @@ -334,13 +260,10 @@ static const struct xe_device_desc mtl_desc = {
>>  	PLATFORM(XE_METEORLAKE),
>>  	.extra_gts = xelpmp_gts,
>>  	.platform_engine_mask = MTL_MAIN_ENGINES,
>> -	GEN13_DISPLAY,
>> -	.display.ver = 14,
>> -	.display.has_cdclk_crawl = 1,
>> -	.display.has_cdclk_squash = 1,
>>  };
>>  
>>  #undef PLATFORM
>> +__diag_pop();
>>  
>>  #define INTEL_VGA_DEVICE(id, info) {			\
>>  	PCI_DEVICE(PCI_VENDOR_ID_INTEL, id),		\
>> @@ -489,7 +412,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	xe->info.has_asid = desc->has_asid;
>>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>>  	xe->info.has_4tile = desc->has_4tile;
>> -	xe->info.display = desc->display;
>>  	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
>>  
>>  	spd = subplatform_get(xe, desc);
>> @@ -519,6 +441,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  		}
>>  	}
>>  
>> +	xe_display_info_init(xe);
>> +
>>  	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx100:%d media100:%d dma_m_s:%d tc:%d",
>>  		desc->platform_name, spd ? spd->name : "",
>>  		xe->info.devid, xe->info.revid,

-- 
Jani Nikula, Intel Open Source Graphics Center
