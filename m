Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D35C76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 10:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDF910E171;
	Mon,  3 Apr 2023 10:29:11 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C89E10E171
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680517749; x=1712053749;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=gzM4qSDKS5mvp7p48AY3zt6zF70r7fNiQCWknO6nrZ0=;
 b=PZDwl287gXgD0BtTOTHjORd4TQDprhO1Couj9jxHRXhmM6s74S4vs7FK
 aVQOHuZdc1yA7p7zjDxtUWp6uAS6iKHMZUjaPwyFEf2S1ZM7+IedVKLYc
 X4OhhnZrW4U75krJTvjuLX/OVCqwmGcqLQblQn7PJvgVG8QkqpMYU3coi
 OnHNEQofkmyeIZSzDZuuhl8fyG6U+YTFPchJGXEvkAlwWj7aKrq8alkQx
 caSYMoGPnO3o55cAhm1mnkjB/Zxn+xGbPwNAij43BvC6ejisTusyTOOEk
 PpphI+bRA1/545DBmCKLjoF7P4pcc3EmmYGrHSF/XQllEglB64nQUOUnF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="428148114"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
 d="scan'208,217";a="428148114"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 03:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="718500523"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
 d="scan'208,217";a="718500523"
Received: from trswain-mobl1.ger.corp.intel.com (HELO [10.252.53.59])
 ([10.252.53.59])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 03:28:59 -0700
Content-Type: multipart/alternative;
 boundary="------------sLSkZaOt0Po2we8Xiynq1BuB"
Message-ID: <15a62cae-d672-6f54-c4fe-36a3e222fd8d@linux.intel.com>
Date: Mon, 3 Apr 2023 12:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
 <20230331102419.521392-6-maarten.lankhorst@linux.intel.com>
 <874jq12lar.fsf@intel.com>
 <7b069b9f-8208-77fc-1872-b49e7a8c2cca@linux.intel.com>
 <87ttxx1j10.fsf@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87ttxx1j10.fsf@intel.com>
Subject: [Intel-xe] [PATCH v2 5/6] drm/xe: Build soc files directly
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

This is a multi-part message in MIME format.
--------------sLSkZaOt0Po2we8Xiynq1BuB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023-04-03 10:12, Jani Nikula wrote:
> On Fri, 31 Mar 2023, Maarten Lankhorst<maarten.lankhorst@linux.intel.com>  wrote:
>> On 2023-03-31 13:49, Jani Nikula wrote:
>>> On Fri, 31 Mar 2023, Maarten Lankhorst<maarten.lankhorst@linux.intel.com>  wrote:
>>>> Instead of making a copy that is hard to keep up to date, build the
>>>> source directly.
>>>>
>>>> Add a rule for soc_* files, and use those to build i915.
>>>>
>>>> Signed-off-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/soc/intel_dram.c         |  30 +-
>>>>    drivers/gpu/drm/xe/Makefile                   |   8 +-
>>>>    .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +-
>>>>    .../soc}/intel_dram.h                         |   1 -
>>>>    .../soc}/intel_pch.h                          |   0
>>>>    drivers/gpu/drm/xe/display/ext/intel_dram.c   | 495 ------------------
>>>>    drivers/gpu/drm/xe/display/ext/intel_pch.c    | 157 ------
>>>>    drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
>>>>    drivers/gpu/drm/xe/xe_display.c               |   2 +-
>>>>    9 files changed, 28 insertions(+), 669 deletions(-)
>>>>    rename drivers/gpu/drm/xe/{display/ext => compat-i915-headers/soc}/intel_dram.h (80%)
>>>>    rename drivers/gpu/drm/xe/{display/ext => compat-i915-headers/soc}/intel_pch.h (100%)
>>>>    delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.c
>>>>    delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.c
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/soc/intel_dram.c b/drivers/gpu/drm/i915/soc/intel_dram.c
>>>> index 9649051ed8ed..13fe18a9372f 100644
>>>> --- a/drivers/gpu/drm/i915/soc/intel_dram.c
>>>> +++ b/drivers/gpu/drm/i915/soc/intel_dram.c
>>>> @@ -9,8 +9,12 @@
>>>>    #include "i915_reg.h"
>>>>    #include "intel_dram.h"
>>>>    #include "intel_mchbar_regs.h"
>>>> -#include "intel_pcode.h"
>>>> +#ifdef I915
>>>>    #include "vlv_sideband.h"
>>>> +#include "display/intel_de.h"
>>>> +#else
>>>> +#include "xe_de.h"
>>>> +#endif
>>>>    
>>>>    struct dram_dimm_info {
>>>>    	u16 size;
>>>> @@ -43,6 +47,8 @@ static const char *intel_dram_type_str(enum intel_dram_type type)
>>>>    
>>>>    #undef DRAM_TYPE_STR
>>>>    
>>>> +#ifdef I915
>>>> +
>>>>    static void pnv_detect_mem_freq(struct drm_i915_private *dev_priv)
>>>>    {
>>>>    	u32 tmp;
>>>> @@ -191,6 +197,9 @@ static void detect_mem_freq(struct drm_i915_private *i915)
>>>>    	if (i915->mem_freq)
>>>>    		drm_dbg(&i915->drm, "DDR speed: %d MHz\n", i915->mem_freq);
>>>>    }
>>>> +#else
>>>> +#define detect_mem_freq(i915) do { } while (0)
>>>> +#endif
>>>>    
>>>>    static int intel_dimm_num_devices(const struct dram_dimm_info *dimm)
>>>>    {
>>>> @@ -339,14 +348,12 @@ skl_dram_get_channels_info(struct drm_i915_private *i915)
>>>>    	u32 val;
>>>>    	int ret;
>>>>    
>>>> -	val = intel_uncore_read(&i915->uncore,
>>>> -				SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
>>>> +	val = intel_de_read(i915, SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
>>> This isn't great, because those aren't DE registers. So this won't fly
>>> upstream.
>> Could we do this for xe instead?
>>
>> #define intel_uncore_read(ignore, reg) xe_mmio_read32(i915, reg) ?
> The obvious downside is that it relies on the implict variable i915,
> which could also be named something else, and it has taken a long, long
> time trying to fix those in i915.
>
> BR,
> Jani.

Well, here goes...

Everything can be solved by adding another layer of indirection. O:)

--->8--------

Instead of making a copy that is hard to keep up to date, build the
source directly.

Add a rule for soc_* files, and use those to build i915.

Changes since v1:
- Add a intel_dram_read/intel_dram_pcode_read at the top of the file.

Signed-off-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
---
  drivers/gpu/drm/i915/soc/intel_dram.c         |  51 +-
  drivers/gpu/drm/xe/Makefile                   |   8 +-
  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +-
  .../soc}/intel_dram.h                         |   1 -
  .../soc}/intel_pch.h                          |   0
  drivers/gpu/drm/xe/display/ext/intel_dram.c   | 495 ------------------
  drivers/gpu/drm/xe/display/ext/intel_pch.c    | 157 ------
  drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
  drivers/gpu/drm/xe/xe_display.c               |   2 +-
  9 files changed, 50 insertions(+), 668 deletions(-)
  rename drivers/gpu/drm/xe/{display/ext => compat-i915-headers/soc}/intel_dram.h (80%)
  rename drivers/gpu/drm/xe/{display/ext => compat-i915-headers/soc}/intel_pch.h (100%)
  delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.c
  delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.c

diff --git a/drivers/gpu/drm/i915/soc/intel_dram.c b/drivers/gpu/drm/i915/soc/intel_dram.c
index 9649051ed8ed..5b2979bd8f09 100644
--- a/drivers/gpu/drm/i915/soc/intel_dram.c
+++ b/drivers/gpu/drm/i915/soc/intel_dram.c
@@ -9,8 +9,35 @@
  #include "i915_reg.h"
  #include "intel_dram.h"
  #include "intel_mchbar_regs.h"
+#ifdef I915
  #include "intel_pcode.h"
  #include "vlv_sideband.h"
+#else
+#include "xe_pcode.h"
+#include "xe_mmio.h"
+#include "xe_gt.h"
+#endif
+
+static inline u32 intel_dram_read(struct drm_i915_private *i915,
+				  const i915_reg_t reg)
+{
+#ifdef I915
+	return intel_uncore_read(&i915->uncore, reg);
+#else
+	return xe_mmio_read32(to_gt(i915), reg.reg);
+#endif
+}
+
+static inline u32 intel_dram_pcode_read(struct drm_i915_private *i915,
+					u32 mbox, u32 *val)
+{
+#ifdef I915
+	return snb_pcode_read(&i915->uncore, mbox, val, NULL);
+#else
+	return xe_pcode_read(to_gt(i915), mbox, val, NULL);
+#endif
+}
+
  
  struct dram_dimm_info {
  	u16 size;
@@ -43,6 +70,8 @@ static const char *intel_dram_type_str(enum intel_dram_type type)
  
  #undef DRAM_TYPE_STR
  
+#ifdef I915
+
  static void pnv_detect_mem_freq(struct drm_i915_private *dev_priv)
  {
  	u32 tmp;
@@ -191,6 +220,9 @@ static void detect_mem_freq(struct drm_i915_private *i915)
  	if (i915->mem_freq)
  		drm_dbg(&i915->drm, "DDR speed: %d MHz\n", i915->mem_freq);
  }
+#else
+#define detect_mem_freq(i915) do { } while (0)
+#endif
  
  static int intel_dimm_num_devices(const struct dram_dimm_info *dimm)
  {
@@ -339,14 +371,12 @@ skl_dram_get_channels_info(struct drm_i915_private *i915)
  	u32 val;
  	int ret;
  
-	val = intel_uncore_read(&i915->uncore,
-				SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
+	val = intel_dram_read(i915, SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
  	ret = skl_dram_get_channel_info(i915, &ch0, 0, val);
  	if (ret == 0)
  		dram_info->num_channels++;
  
-	val = intel_uncore_read(&i915->uncore,
-				SKL_MAD_DIMM_CH1_0_0_0_MCHBAR_MCMAIN);
+	val = intel_dram_read(i915, SKL_MAD_DIMM_CH1_0_0_0_MCHBAR_MCMAIN);
  	ret = skl_dram_get_channel_info(i915, &ch1, 1, val);
  	if (ret == 0)
  		dram_info->num_channels++;
@@ -376,8 +406,7 @@ skl_get_dram_type(struct drm_i915_private *i915)
  {
  	u32 val;
  
-	val = intel_uncore_read(&i915->uncore,
-				SKL_MAD_INTER_CHANNEL_0_0_0_MCHBAR_MCMAIN);
+	val = intel_dram_read(i915, SKL_MAD_INTER_CHANNEL_0_0_0_MCHBAR_MCMAIN);
  
  	switch (val & SKL_DRAM_DDR_TYPE_MASK) {
  	case SKL_DRAM_DDR_TYPE_DDR3:
@@ -503,7 +532,7 @@ static int bxt_get_dram_info(struct drm_i915_private *i915)
  		struct dram_dimm_info dimm;
  		enum intel_dram_type type;
  
-		val = intel_uncore_read(&i915->uncore, BXT_D_CR_DRP0_DUNIT(i));
+		val = intel_dram_read(i915, BXT_D_CR_DRP0_DUNIT(i));
  		if (val == 0xFFFFFFFF)
  			continue;
  
@@ -543,8 +572,8 @@ static int icl_pcode_read_mem_global_info(struct drm_i915_private *dev_priv)
  	u32 val = 0;
  	int ret;
  
-	ret = snb_pcode_read(&dev_priv->uncore, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
-			     ICL_PCODE_MEM_SS_READ_GLOBAL_INFO, &val, NULL);
+	ret = intel_dram_pcode_read(dev_priv, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
+				    ICL_PCODE_MEM_SS_READ_GLOBAL_INFO, &val);
  	if (ret)
  		return ret;
  
@@ -618,7 +647,7 @@ static int gen12_get_dram_info(struct drm_i915_private *i915)
  
  static int xelpdp_get_dram_info(struct drm_i915_private *i915)
  {
-	u32 val = intel_uncore_read(&i915->uncore, MTL_MEM_SS_INFO_GLOBAL);
+	u32 val = intel_dram_read(i915, MTL_MEM_SS_INFO_GLOBAL);
  	struct dram_info *dram_info = &i915->dram_info;
  
  	switch (REG_FIELD_GET(MTL_DDR_TYPE_MASK, val)) {
@@ -687,6 +716,7 @@ void intel_dram_detect(struct drm_i915_private *i915)
  		    str_yes_no(dram_info->wm_lv_0_adjust_needed));
  }
  
+#ifdef I915
  static u32 gen9_edram_size_mb(struct drm_i915_private *i915, u32 cap)
  {
  	static const u8 ways[8] = { 4, 8, 12, 16, 16, 16, 16, 16 };
@@ -722,3 +752,4 @@ void intel_dram_edram_detect(struct drm_i915_private *i915)
  
  	drm_info(&i915->drm, "Found %uMB of eDRAM\n", i915->edram_size_mb);
  }
+#endif
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 669c7b6f552c..3ebef784445e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -124,6 +124,10 @@ $(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.c FORC
  	$(call cmd,force_checksrc)
  	$(call if_changed_rule,cc_o_c)
  
+$(obj)/display/soc_%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
+	$(call cmd,force_checksrc)
+	$(call if_changed_rule,cc_o_c)
+
  # Display..
  xe-$(CONFIG_DRM_XE_DISPLAY) += \
  	xe_display.o \
@@ -204,8 +208,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
  	display/ext/i915_irq.o \
  	display/ext/i9xx_wm.o \
  	display/ext/intel_device_info.o \
-	display/ext/intel_dram.o \
-	display/ext/intel_pch.o \
+	display/soc_intel_dram.o \
+	display/soc_intel_pch.o \
  	display/ext/intel_pm.o
  
  ifeq ($(CONFIG_ACPI),y)
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 92dfbb8b3ca4..fa8c53e91bce 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -15,7 +15,7 @@
  #include "xe_pm.h"
  #include "xe_step.h"
  #include "i915_reg_defs.h"
-#include "intel_pch.h"
+#include "soc/intel_pch.h"
  #include "i915_utils.h"
  #include <linux/pm_runtime.h>
  
diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
similarity index 80%
rename from drivers/gpu/drm/xe/display/ext/intel_dram.h
rename to drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
index 4ba13c13162c..7ed5b6e1f805 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_dram.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
@@ -8,7 +8,6 @@
  
  struct drm_i915_private;
  
-void intel_dram_edram_detect(struct drm_i915_private *i915);
  void intel_dram_detect(struct drm_i915_private *i915);
  
  #endif /* __INTEL_DRAM_H__ */
diff --git a/drivers/gpu/drm/xe/display/ext/intel_pch.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/ext/intel_pch.h
rename to drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.c b/drivers/gpu/drm/xe/display/ext/intel_dram.c
deleted file mode 100644
index a2df0c502c34..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_dram.c
+++ /dev/null
@@ -1,495 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2020 Intel Corporation
- */
-
-#include <linux/string_helpers.h>
-
-#include "i915_drv.h"
-#include "i915_reg.h"
-#include "intel_de.h"
-#include "intel_dram.h"
-#include "intel_mchbar_regs.h"
-
-struct dram_dimm_info {
-	u16 size;
-	u8 width, ranks;
-};
-
-struct dram_channel_info {
-	struct dram_dimm_info dimm_l, dimm_s;
-	u8 ranks;
-	bool is_16gb_dimm;
-};
-
-#define DRAM_TYPE_STR(type) [INTEL_DRAM_ ## type] = #type
-
-static const char *intel_dram_type_str(enum intel_dram_type type)
-{
-	static const char * const str[] = {
-		DRAM_TYPE_STR(UNKNOWN),
-		DRAM_TYPE_STR(DDR3),
-		DRAM_TYPE_STR(DDR4),
-		DRAM_TYPE_STR(LPDDR3),
-		DRAM_TYPE_STR(LPDDR4),
-	};
-
-	if (type >= ARRAY_SIZE(str))
-		type = INTEL_DRAM_UNKNOWN;
-
-	return str[type];
-}
-
-#undef DRAM_TYPE_STR
-
-static int intel_dimm_num_devices(const struct dram_dimm_info *dimm)
-{
-	return dimm->ranks * 64 / (dimm->width ?: 1);
-}
-
-/* Returns total Gb for the whole DIMM */
-static int skl_get_dimm_size(u16 val)
-{
-	return (val & SKL_DRAM_SIZE_MASK) * 8;
-}
-
-static int skl_get_dimm_width(u16 val)
-{
-	if (skl_get_dimm_size(val) == 0)
-		return 0;
-
-	switch (val & SKL_DRAM_WIDTH_MASK) {
-	case SKL_DRAM_WIDTH_X8:
-	case SKL_DRAM_WIDTH_X16:
-	case SKL_DRAM_WIDTH_X32:
-		val = (val & SKL_DRAM_WIDTH_MASK) >> SKL_DRAM_WIDTH_SHIFT;
-		return 8 << val;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static int skl_get_dimm_ranks(u16 val)
-{
-	if (skl_get_dimm_size(val) == 0)
-		return 0;
-
-	val = (val & SKL_DRAM_RANK_MASK) >> SKL_DRAM_RANK_SHIFT;
-
-	return val + 1;
-}
-
-/* Returns total Gb for the whole DIMM */
-static int icl_get_dimm_size(u16 val)
-{
-	return (val & ICL_DRAM_SIZE_MASK) * 8 / 2;
-}
-
-static int icl_get_dimm_width(u16 val)
-{
-	if (icl_get_dimm_size(val) == 0)
-		return 0;
-
-	switch (val & ICL_DRAM_WIDTH_MASK) {
-	case ICL_DRAM_WIDTH_X8:
-	case ICL_DRAM_WIDTH_X16:
-	case ICL_DRAM_WIDTH_X32:
-		val = (val & ICL_DRAM_WIDTH_MASK) >> ICL_DRAM_WIDTH_SHIFT;
-		return 8 << val;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static int icl_get_dimm_ranks(u16 val)
-{
-	if (icl_get_dimm_size(val) == 0)
-		return 0;
-
-	val = (val & ICL_DRAM_RANK_MASK) >> ICL_DRAM_RANK_SHIFT;
-
-	return val + 1;
-}
-
-static bool
-skl_is_16gb_dimm(const struct dram_dimm_info *dimm)
-{
-	/* Convert total Gb to Gb per DRAM device */
-	return dimm->size / (intel_dimm_num_devices(dimm) ?: 1) == 16;
-}
-
-static void
-skl_dram_get_dimm_info(struct drm_i915_private *i915,
-		       struct dram_dimm_info *dimm,
-		       int channel, char dimm_name, u16 val)
-{
-	if (GRAPHICS_VER(i915) >= 11) {
-		dimm->size = icl_get_dimm_size(val);
-		dimm->width = icl_get_dimm_width(val);
-		dimm->ranks = icl_get_dimm_ranks(val);
-	} else {
-		dimm->size = skl_get_dimm_size(val);
-		dimm->width = skl_get_dimm_width(val);
-		dimm->ranks = skl_get_dimm_ranks(val);
-	}
-
-	drm_dbg_kms(&i915->drm,
-		    "CH%u DIMM %c size: %u Gb, width: X%u, ranks: %u, 16Gb DIMMs: %s\n",
-		    channel, dimm_name, dimm->size, dimm->width, dimm->ranks,
-		    str_yes_no(skl_is_16gb_dimm(dimm)));
-}
-
-static int
-skl_dram_get_channel_info(struct drm_i915_private *i915,
-			  struct dram_channel_info *ch,
-			  int channel, u32 val)
-{
-	skl_dram_get_dimm_info(i915, &ch->dimm_l,
-			       channel, 'L', val & 0xffff);
-	skl_dram_get_dimm_info(i915, &ch->dimm_s,
-			       channel, 'S', val >> 16);
-
-	if (ch->dimm_l.size == 0 && ch->dimm_s.size == 0) {
-		drm_dbg_kms(&i915->drm, "CH%u not populated\n", channel);
-		return -EINVAL;
-	}
-
-	if (ch->dimm_l.ranks == 2 || ch->dimm_s.ranks == 2)
-		ch->ranks = 2;
-	else if (ch->dimm_l.ranks == 1 && ch->dimm_s.ranks == 1)
-		ch->ranks = 2;
-	else
-		ch->ranks = 1;
-
-	ch->is_16gb_dimm = skl_is_16gb_dimm(&ch->dimm_l) ||
-		skl_is_16gb_dimm(&ch->dimm_s);
-
-	drm_dbg_kms(&i915->drm, "CH%u ranks: %u, 16Gb DIMMs: %s\n",
-		    channel, ch->ranks, str_yes_no(ch->is_16gb_dimm));
-
-	return 0;
-}
-
-static bool
-intel_is_dram_symmetric(const struct dram_channel_info *ch0,
-			const struct dram_channel_info *ch1)
-{
-	return !memcmp(ch0, ch1, sizeof(*ch0)) &&
-		(ch0->dimm_s.size == 0 ||
-		 !memcmp(&ch0->dimm_l, &ch0->dimm_s, sizeof(ch0->dimm_l)));
-}
-
-static int
-skl_dram_get_channels_info(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &i915->dram_info;
-	struct dram_channel_info ch0 = {}, ch1 = {};
-	u32 val;
-	int ret;
-
-	val = intel_de_read(i915, SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
-	ret = skl_dram_get_channel_info(i915, &ch0, 0, val);
-	if (ret == 0)
-		dram_info->num_channels++;
-
-	val = intel_de_read(i915, SKL_MAD_DIMM_CH1_0_0_0_MCHBAR_MCMAIN);
-	ret = skl_dram_get_channel_info(i915, &ch1, 1, val);
-	if (ret == 0)
-		dram_info->num_channels++;
-
-	if (dram_info->num_channels == 0) {
-		drm_info(&i915->drm, "Number of memory channels is zero\n");
-		return -EINVAL;
-	}
-
-	if (ch0.ranks == 0 && ch1.ranks == 0) {
-		drm_info(&i915->drm, "couldn't get memory rank information\n");
-		return -EINVAL;
-	}
-
-	dram_info->wm_lv_0_adjust_needed = ch0.is_16gb_dimm || ch1.is_16gb_dimm;
-
-	dram_info->symmetric_memory = intel_is_dram_symmetric(&ch0, &ch1);
-
-	drm_dbg_kms(&i915->drm, "Memory configuration is symmetric? %s\n",
-		    str_yes_no(dram_info->symmetric_memory));
-
-	return 0;
-}
-
-static enum intel_dram_type
-skl_get_dram_type(struct drm_i915_private *i915)
-{
-	u32 val;
-
-	val = intel_de_read(i915, SKL_MAD_INTER_CHANNEL_0_0_0_MCHBAR_MCMAIN);
-
-	switch (val & SKL_DRAM_DDR_TYPE_MASK) {
-	case SKL_DRAM_DDR_TYPE_DDR3:
-		return INTEL_DRAM_DDR3;
-	case SKL_DRAM_DDR_TYPE_DDR4:
-		return INTEL_DRAM_DDR4;
-	case SKL_DRAM_DDR_TYPE_LPDDR3:
-		return INTEL_DRAM_LPDDR3;
-	case SKL_DRAM_DDR_TYPE_LPDDR4:
-		return INTEL_DRAM_LPDDR4;
-	default:
-		MISSING_CASE(val);
-		return INTEL_DRAM_UNKNOWN;
-	}
-}
-
-static int
-skl_get_dram_info(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &i915->dram_info;
-	int ret;
-
-	dram_info->type = skl_get_dram_type(i915);
-	drm_dbg_kms(&i915->drm, "DRAM type: %s\n",
-		    intel_dram_type_str(dram_info->type));
-
-	ret = skl_dram_get_channels_info(i915);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/* Returns Gb per DRAM device */
-static int bxt_get_dimm_size(u32 val)
-{
-	switch (val & BXT_DRAM_SIZE_MASK) {
-	case BXT_DRAM_SIZE_4GBIT:
-		return 4;
-	case BXT_DRAM_SIZE_6GBIT:
-		return 6;
-	case BXT_DRAM_SIZE_8GBIT:
-		return 8;
-	case BXT_DRAM_SIZE_12GBIT:
-		return 12;
-	case BXT_DRAM_SIZE_16GBIT:
-		return 16;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static int bxt_get_dimm_width(u32 val)
-{
-	if (!bxt_get_dimm_size(val))
-		return 0;
-
-	val = (val & BXT_DRAM_WIDTH_MASK) >> BXT_DRAM_WIDTH_SHIFT;
-
-	return 8 << val;
-}
-
-static int bxt_get_dimm_ranks(u32 val)
-{
-	if (!bxt_get_dimm_size(val))
-		return 0;
-
-	switch (val & BXT_DRAM_RANK_MASK) {
-	case BXT_DRAM_RANK_SINGLE:
-		return 1;
-	case BXT_DRAM_RANK_DUAL:
-		return 2;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static enum intel_dram_type bxt_get_dimm_type(u32 val)
-{
-	if (!bxt_get_dimm_size(val))
-		return INTEL_DRAM_UNKNOWN;
-
-	switch (val & BXT_DRAM_TYPE_MASK) {
-	case BXT_DRAM_TYPE_DDR3:
-		return INTEL_DRAM_DDR3;
-	case BXT_DRAM_TYPE_LPDDR3:
-		return INTEL_DRAM_LPDDR3;
-	case BXT_DRAM_TYPE_DDR4:
-		return INTEL_DRAM_DDR4;
-	case BXT_DRAM_TYPE_LPDDR4:
-		return INTEL_DRAM_LPDDR4;
-	default:
-		MISSING_CASE(val);
-		return INTEL_DRAM_UNKNOWN;
-	}
-}
-
-static void bxt_get_dimm_info(struct dram_dimm_info *dimm, u32 val)
-{
-	dimm->width = bxt_get_dimm_width(val);
-	dimm->ranks = bxt_get_dimm_ranks(val);
-
-	/*
-	 * Size in register is Gb per DRAM device. Convert to total
-	 * Gb to match the way we report this for non-LP platforms.
-	 */
-	dimm->size = bxt_get_dimm_size(val) * intel_dimm_num_devices(dimm);
-}
-
-static int bxt_get_dram_info(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &i915->dram_info;
-	u32 val;
-	u8 valid_ranks = 0;
-	int i;
-
-	/*
-	 * Now read each DUNIT8/9/10/11 to check the rank of each dimms.
-	 */
-	for (i = BXT_D_CR_DRP0_DUNIT_START; i <= BXT_D_CR_DRP0_DUNIT_END; i++) {
-		struct dram_dimm_info dimm;
-		enum intel_dram_type type;
-
-		val = intel_de_read(i915, BXT_D_CR_DRP0_DUNIT(i));
-		if (val == 0xFFFFFFFF)
-			continue;
-
-		dram_info->num_channels++;
-
-		bxt_get_dimm_info(&dimm, val);
-		type = bxt_get_dimm_type(val);
-
-		drm_WARN_ON(&i915->drm, type != INTEL_DRAM_UNKNOWN &&
-			    dram_info->type != INTEL_DRAM_UNKNOWN &&
-			    dram_info->type != type);
-
-		drm_dbg_kms(&i915->drm,
-			    "CH%u DIMM size: %u Gb, width: X%u, ranks: %u, type: %s\n",
-			    i - BXT_D_CR_DRP0_DUNIT_START,
-			    dimm.size, dimm.width, dimm.ranks,
-			    intel_dram_type_str(type));
-
-		if (valid_ranks == 0)
-			valid_ranks = dimm.ranks;
-
-		if (type != INTEL_DRAM_UNKNOWN)
-			dram_info->type = type;
-	}
-
-	if (dram_info->type == INTEL_DRAM_UNKNOWN || valid_ranks == 0) {
-		drm_info(&i915->drm, "couldn't get memory information\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int icl_pcode_read_mem_global_info(struct drm_i915_private *dev_priv)
-{
-	struct dram_info *dram_info = &dev_priv->dram_info;
-	u32 val = 0;
-	int ret;
-
-	ret = intel_de_pcode_read(dev_priv, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
-			     ICL_PCODE_MEM_SS_READ_GLOBAL_INFO, &val, NULL);
-	if (ret)
-		return ret;
-
-	if (GRAPHICS_VER(dev_priv) >= 12) {
-		switch (val & 0xf) {
-		case 0:
-			dram_info->type = INTEL_DRAM_DDR4;
-			break;
-		case 1:
-			dram_info->type = INTEL_DRAM_DDR5;
-			break;
-		case 2:
-			dram_info->type = INTEL_DRAM_LPDDR5;
-			break;
-		case 3:
-			dram_info->type = INTEL_DRAM_LPDDR4;
-			break;
-		case 4:
-			dram_info->type = INTEL_DRAM_DDR3;
-			break;
-		case 5:
-			dram_info->type = INTEL_DRAM_LPDDR3;
-			break;
-		default:
-			MISSING_CASE(val & 0xf);
-			return -EINVAL;
-		}
-	} else {
-		switch (val & 0xf) {
-		case 0:
-			dram_info->type = INTEL_DRAM_DDR4;
-			break;
-		case 1:
-			dram_info->type = INTEL_DRAM_DDR3;
-			break;
-		case 2:
-			dram_info->type = INTEL_DRAM_LPDDR3;
-			break;
-		case 3:
-			dram_info->type = INTEL_DRAM_LPDDR4;
-			break;
-		default:
-			MISSING_CASE(val & 0xf);
-			return -EINVAL;
-		}
-	}
-
-	dram_info->num_channels = (val & 0xf0) >> 4;
-	dram_info->num_qgv_points = (val & 0xf00) >> 8;
-	dram_info->num_psf_gv_points = (val & 0x3000) >> 12;
-
-	return 0;
-}
-
-static int gen11_get_dram_info(struct drm_i915_private *i915)
-{
-	int ret = skl_get_dram_info(i915);
-
-	if (ret)
-		return ret;
-
-	return icl_pcode_read_mem_global_info(i915);
-}
-
-static int gen12_get_dram_info(struct drm_i915_private *i915)
-{
-	i915->dram_info.wm_lv_0_adjust_needed = false;
-
-	return icl_pcode_read_mem_global_info(i915);
-}
-
-void intel_dram_detect(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &i915->dram_info;
-	int ret;
-
-	if (GRAPHICS_VER(i915) < 9 || IS_DG2(i915) || !HAS_DISPLAY(i915))
-		return;
-
-	/*
-	 * Assume level 0 watermark latency adjustment is needed until proven
-	 * otherwise, this w/a is not needed by bxt/glk.
-	 */
-	dram_info->wm_lv_0_adjust_needed = !IS_GEN9_LP(i915);
-
-	if (GRAPHICS_VER(i915) >= 12)
-		ret = gen12_get_dram_info(i915);
-	else if (GRAPHICS_VER(i915) >= 11)
-		ret = gen11_get_dram_info(i915);
-	else if (IS_GEN9_LP(i915))
-		ret = bxt_get_dram_info(i915);
-	else
-		ret = skl_get_dram_info(i915);
-	if (ret)
-		return;
-
-	drm_dbg_kms(&i915->drm, "DRAM channels: %u\n", dram_info->num_channels);
-
-	drm_dbg_kms(&i915->drm, "Watermark level 0 adjustment needed: %s\n",
-		    str_yes_no(dram_info->wm_lv_0_adjust_needed));
-}
diff --git a/drivers/gpu/drm/xe/display/ext/intel_pch.c b/drivers/gpu/drm/xe/display/ext/intel_pch.c
deleted file mode 100644
index dc2b15b5c4be..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_pch.c
+++ /dev/null
@@ -1,157 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright 2019 Intel Corporation.
- */
-
-#include "i915_drv.h"
-#include "i915_utils.h"
-#include "intel_pch.h"
-
-/* Map PCH device id to PCH type, or PCH_NONE if unknown. */
-static enum intel_pch
-intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
-{
-	switch (id) {
-	case INTEL_PCH_MCC_DEVICE_ID_TYPE:
-		drm_dbg_kms(&dev_priv->drm, "Found Mule Creek Canyon PCH\n");
-		drm_WARN_ON(&dev_priv->drm, !IS_JSL_EHL(dev_priv));
-		/* MCC is TGP compatible */
-		return PCH_TGP;
-	case INTEL_PCH_TGP_DEVICE_ID_TYPE:
-	case INTEL_PCH_TGP2_DEVICE_ID_TYPE:
-		drm_dbg_kms(&dev_priv->drm, "Found Tiger Lake LP PCH\n");
-		drm_WARN_ON(&dev_priv->drm, !IS_TIGERLAKE(dev_priv) &&
-			    !IS_ROCKETLAKE(dev_priv) &&
-			    !IS_GEN9_BC(dev_priv));
-		return PCH_TGP;
-	case INTEL_PCH_ADP_DEVICE_ID_TYPE:
-	case INTEL_PCH_ADP2_DEVICE_ID_TYPE:
-	case INTEL_PCH_ADP3_DEVICE_ID_TYPE:
-	case INTEL_PCH_ADP4_DEVICE_ID_TYPE:
-		drm_dbg_kms(&dev_priv->drm, "Found Alder Lake PCH\n");
-		drm_WARN_ON(&dev_priv->drm, !IS_ALDERLAKE_S(dev_priv) &&
-			    !IS_ALDERLAKE_P(dev_priv));
-		return PCH_ADP;
-	case INTEL_PCH_MTP_DEVICE_ID_TYPE:
-	case INTEL_PCH_MTP2_DEVICE_ID_TYPE:
-		drm_dbg_kms(&dev_priv->drm, "Found Meteor Lake PCH\n");
-		drm_WARN_ON(&dev_priv->drm, !IS_METEORLAKE(dev_priv));
-		return PCH_MTP;
-	default:
-		return PCH_NONE;
-	}
-}
-
-static bool intel_is_virt_pch(unsigned short id,
-			      unsigned short svendor, unsigned short sdevice)
-{
-	return (id == INTEL_PCH_P2X_DEVICE_ID_TYPE ||
-		id == INTEL_PCH_P3X_DEVICE_ID_TYPE ||
-		(id == INTEL_PCH_QEMU_DEVICE_ID_TYPE &&
-		 svendor == PCI_SUBVENDOR_ID_REDHAT_QUMRANET &&
-		 sdevice == PCI_SUBDEVICE_ID_QEMU));
-}
-
-static void
-intel_virt_detect_pch(const struct drm_i915_private *dev_priv,
-		      unsigned short *pch_id, enum intel_pch *pch_type)
-{
-	unsigned short id = 0;
-
-	/*
-	 * In a virtualized passthrough environment we can be in a
-	 * setup where the ISA bridge is not able to be passed through.
-	 * In this case, a south bridge can be emulated and we have to
-	 * make an educated guess as to which PCH is really there.
-	 */
-
-	if (IS_METEORLAKE(dev_priv))
-		id = INTEL_PCH_MTP_DEVICE_ID_TYPE;
-	else if (IS_ALDERLAKE_S(dev_priv) || IS_ALDERLAKE_P(dev_priv))
-		id = INTEL_PCH_ADP_DEVICE_ID_TYPE;
-	else if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv))
-		id = INTEL_PCH_TGP_DEVICE_ID_TYPE;
-	else BUG_ON(1);
-
-	if (id)
-		drm_dbg_kms(&dev_priv->drm, "Assuming PCH ID %04x\n", id);
-	else
-		drm_dbg_kms(&dev_priv->drm, "Assuming no PCH\n");
-
-	*pch_type = intel_pch_type(dev_priv, id);
-
-	/* Sanity check virtual PCH id */
-	if (drm_WARN_ON(&dev_priv->drm,
-			id && *pch_type == PCH_NONE))
-		id = 0;
-
-	*pch_id = id;
-}
-
-void intel_detect_pch(struct drm_i915_private *dev_priv)
-{
-	struct pci_dev *pch = NULL;
-	unsigned short id;
-	enum intel_pch pch_type;
-
-	/* DG1 has south engine display on the same PCI device */
-	if (IS_DG1(dev_priv)) {
-		dev_priv->pch_type = PCH_DG1;
-		return;
-	} else if (IS_DG2(dev_priv)) {
-		dev_priv->pch_type = PCH_DG2;
-		return;
-	}
-
-	/*
-	 * The reason to probe ISA bridge instead of Dev31:Fun0 is to
-	 * make graphics device passthrough work easy for VMM, that only
-	 * need to expose ISA bridge to let driver know the real hardware
-	 * underneath. This is a requirement from virtualization team.
-	 *
-	 * In some virtualized environments (e.g. XEN), there is irrelevant
-	 * ISA bridge in the system. To work reliably, we should scan trhough
-	 * all the ISA bridge devices and check for the first match, instead
-	 * of only checking the first one.
-	 */
-	while ((pch = pci_get_class(PCI_CLASS_BRIDGE_ISA << 8, pch))) {
-		if (pch->vendor != PCI_VENDOR_ID_INTEL)
-			continue;
-
-		id = pch->device & INTEL_PCH_DEVICE_ID_MASK;
-
-		pch_type = intel_pch_type(dev_priv, id);
-		if (pch_type != PCH_NONE) {
-			dev_priv->pch_type = pch_type;
-			dev_priv->pch_id = id;
-			break;
-		} else if (intel_is_virt_pch(id, pch->subsystem_vendor,
-					     pch->subsystem_device)) {
-			intel_virt_detect_pch(dev_priv, &id, &pch_type);
-			dev_priv->pch_type = pch_type;
-			dev_priv->pch_id = id;
-			break;
-		}
-	}
-
-	/*
-	 * Use PCH_NOP (PCH but no South Display) for PCH platforms without
-	 * display.
-	 */
-	if (pch && !HAS_DISPLAY(dev_priv)) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "Display disabled, reverting to NOP PCH\n");
-		dev_priv->pch_type = PCH_NOP;
-		dev_priv->pch_id = 0;
-	} else if (!pch) {
-		if (i915_run_as_guest() && HAS_DISPLAY(dev_priv)) {
-			intel_virt_detect_pch(dev_priv, &id, &pch_type);
-			dev_priv->pch_type = pch_type;
-			dev_priv->pch_id = id;
-		} else {
-			drm_dbg_kms(&dev_priv->drm, "No PCH found.\n");
-		}
-	}
-
-	pci_dev_put(pch);
-}
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 88f863edc41c..54de3229553b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -18,7 +18,7 @@
  
  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
  #include "ext/intel_device_info.h"
-#include "ext/intel_pch.h"
+#include "soc/intel_pch.h"
  #include "intel_display_core.h"
  #endif
  
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 64e65b29d8de..35dee29da832 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -16,8 +16,8 @@
  #include <drm/xe_drm.h>
  
  #include "ext/i915_irq.h"
-#include "ext/intel_dram.h"
  #include "ext/intel_pm.h"
+#include "soc/intel_dram.h"
  #include "intel_acpi.h"
  #include "intel_audio.h"
  #include "intel_bw.h"
-- 
2.34.1


--------------sLSkZaOt0Po2we8Xiynq1BuB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-04-03 10:12, Jani Nikula wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87ttxx1j10.fsf@intel.com">
      <pre class="moz-quote-pre" wrap="">On Fri, 31 Mar 2023, Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 2023-03-31 13:49, Jani Nikula wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, 31 Mar 2023, Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Instead of making a copy that is hard to keep up to date, build the
source directly.

Add a rule for soc_* files, and use those to build i915.

Signed-off-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
---
  drivers/gpu/drm/i915/soc/intel_dram.c         |  30 +-
  drivers/gpu/drm/xe/Makefile                   |   8 +-
  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +-
  .../soc}/intel_dram.h                         |   1 -
  .../soc}/intel_pch.h                          |   0
  drivers/gpu/drm/xe/display/ext/intel_dram.c   | 495 ------------------
  drivers/gpu/drm/xe/display/ext/intel_pch.c    | 157 ------
  drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
  drivers/gpu/drm/xe/xe_display.c               |   2 +-
  9 files changed, 28 insertions(+), 669 deletions(-)
  rename drivers/gpu/drm/xe/{display/ext =&gt; compat-i915-headers/soc}/intel_dram.h (80%)
  rename drivers/gpu/drm/xe/{display/ext =&gt; compat-i915-headers/soc}/intel_pch.h (100%)
  delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.c
  delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.c

diff --git a/drivers/gpu/drm/i915/soc/intel_dram.c b/drivers/gpu/drm/i915/soc/intel_dram.c
index 9649051ed8ed..13fe18a9372f 100644
--- a/drivers/gpu/drm/i915/soc/intel_dram.c
+++ b/drivers/gpu/drm/i915/soc/intel_dram.c
@@ -9,8 +9,12 @@
  #include "i915_reg.h"
  #include "intel_dram.h"
  #include "intel_mchbar_regs.h"
-#include "intel_pcode.h"
+#ifdef I915
  #include "vlv_sideband.h"
+#include "display/intel_de.h"
+#else
+#include "xe_de.h"
+#endif
  
  struct dram_dimm_info {
  	u16 size;
@@ -43,6 +47,8 @@ static const char *intel_dram_type_str(enum intel_dram_type type)
  
  #undef DRAM_TYPE_STR
  
+#ifdef I915
+
  static void pnv_detect_mem_freq(struct drm_i915_private *dev_priv)
  {
  	u32 tmp;
@@ -191,6 +197,9 @@ static void detect_mem_freq(struct drm_i915_private *i915)
  	if (i915-&gt;mem_freq)
  		drm_dbg(&amp;i915-&gt;drm, "DDR speed: %d MHz\n", i915-&gt;mem_freq);
  }
+#else
+#define detect_mem_freq(i915) do { } while (0)
+#endif
  
  static int intel_dimm_num_devices(const struct dram_dimm_info *dimm)
  {
@@ -339,14 +348,12 @@ skl_dram_get_channels_info(struct drm_i915_private *i915)
  	u32 val;
  	int ret;
  
-	val = intel_uncore_read(&amp;i915-&gt;uncore,
-				SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
+	val = intel_de_read(i915, SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">This isn't great, because those aren't DE registers. So this won't fly
upstream.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Could we do this for xe instead?

#define intel_uncore_read(ignore, reg) xe_mmio_read32(i915, reg) ?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The obvious downside is that it relies on the implict variable i915,
which could also be named something else, and it has taken a long, long
time trying to fix those in i915.

BR,
Jani.
</pre>
    </blockquote>
    <p>Well, here goes...</p>
    <p>Everything can be solved by adding another layer of indirection.
      O:)<br>
    </p>
    <pre>---&gt;8--------

Instead of making a copy that is hard to keep up to date, build the
source directly.

Add a rule for soc_* files, and use those to build i915.

Changes since v1:
- Add a intel_dram_read/intel_dram_pcode_read at the top of the file.

Signed-off-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
---
 drivers/gpu/drm/i915/soc/intel_dram.c         |  51 +-
 drivers/gpu/drm/xe/Makefile                   |   8 +-
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +-
 .../soc}/intel_dram.h                         |   1 -
 .../soc}/intel_pch.h                          |   0
 drivers/gpu/drm/xe/display/ext/intel_dram.c   | 495 ------------------
 drivers/gpu/drm/xe/display/ext/intel_pch.c    | 157 ------
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_display.c               |   2 +-
 9 files changed, 50 insertions(+), 668 deletions(-)
 rename drivers/gpu/drm/xe/{display/ext =&gt; compat-i915-headers/soc}/intel_dram.h (80%)
 rename drivers/gpu/drm/xe/{display/ext =&gt; compat-i915-headers/soc}/intel_pch.h (100%)
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.c

diff --git a/drivers/gpu/drm/i915/soc/intel_dram.c b/drivers/gpu/drm/i915/soc/intel_dram.c
index 9649051ed8ed..5b2979bd8f09 100644
--- a/drivers/gpu/drm/i915/soc/intel_dram.c
+++ b/drivers/gpu/drm/i915/soc/intel_dram.c
@@ -9,8 +9,35 @@
 #include "i915_reg.h"
 #include "intel_dram.h"
 #include "intel_mchbar_regs.h"
+#ifdef I915
 #include "intel_pcode.h"
 #include "vlv_sideband.h"
+#else
+#include "xe_pcode.h"
+#include "xe_mmio.h"
+#include "xe_gt.h"
+#endif
+
+static inline u32 intel_dram_read(struct drm_i915_private *i915,
+				  const i915_reg_t reg)
+{
+#ifdef I915
+	return intel_uncore_read(&amp;i915-&gt;uncore, reg);
+#else
+	return xe_mmio_read32(to_gt(i915), reg.reg);
+#endif
+}
+
+static inline u32 intel_dram_pcode_read(struct drm_i915_private *i915,
+					u32 mbox, u32 *val)
+{
+#ifdef I915
+	return snb_pcode_read(&amp;i915-&gt;uncore, mbox, val, NULL);
+#else
+	return xe_pcode_read(to_gt(i915), mbox, val, NULL);
+#endif
+}
+
 
 struct dram_dimm_info {
 	u16 size;
@@ -43,6 +70,8 @@ static const char *intel_dram_type_str(enum intel_dram_type type)
 
 #undef DRAM_TYPE_STR
 
+#ifdef I915
+
 static void pnv_detect_mem_freq(struct drm_i915_private *dev_priv)
 {
 	u32 tmp;
@@ -191,6 +220,9 @@ static void detect_mem_freq(struct drm_i915_private *i915)
 	if (i915-&gt;mem_freq)
 		drm_dbg(&amp;i915-&gt;drm, "DDR speed: %d MHz\n", i915-&gt;mem_freq);
 }
+#else
+#define detect_mem_freq(i915) do { } while (0)
+#endif
 
 static int intel_dimm_num_devices(const struct dram_dimm_info *dimm)
 {
@@ -339,14 +371,12 @@ skl_dram_get_channels_info(struct drm_i915_private *i915)
 	u32 val;
 	int ret;
 
-	val = intel_uncore_read(&amp;i915-&gt;uncore,
-				SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
+	val = intel_dram_read(i915, SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
 	ret = skl_dram_get_channel_info(i915, &amp;ch0, 0, val);
 	if (ret == 0)
 		dram_info-&gt;num_channels++;
 
-	val = intel_uncore_read(&amp;i915-&gt;uncore,
-				SKL_MAD_DIMM_CH1_0_0_0_MCHBAR_MCMAIN);
+	val = intel_dram_read(i915, SKL_MAD_DIMM_CH1_0_0_0_MCHBAR_MCMAIN);
 	ret = skl_dram_get_channel_info(i915, &amp;ch1, 1, val);
 	if (ret == 0)
 		dram_info-&gt;num_channels++;
@@ -376,8 +406,7 @@ skl_get_dram_type(struct drm_i915_private *i915)
 {
 	u32 val;
 
-	val = intel_uncore_read(&amp;i915-&gt;uncore,
-				SKL_MAD_INTER_CHANNEL_0_0_0_MCHBAR_MCMAIN);
+	val = intel_dram_read(i915, SKL_MAD_INTER_CHANNEL_0_0_0_MCHBAR_MCMAIN);
 
 	switch (val &amp; SKL_DRAM_DDR_TYPE_MASK) {
 	case SKL_DRAM_DDR_TYPE_DDR3:
@@ -503,7 +532,7 @@ static int bxt_get_dram_info(struct drm_i915_private *i915)
 		struct dram_dimm_info dimm;
 		enum intel_dram_type type;
 
-		val = intel_uncore_read(&amp;i915-&gt;uncore, BXT_D_CR_DRP0_DUNIT(i));
+		val = intel_dram_read(i915, BXT_D_CR_DRP0_DUNIT(i));
 		if (val == 0xFFFFFFFF)
 			continue;
 
@@ -543,8 +572,8 @@ static int icl_pcode_read_mem_global_info(struct drm_i915_private *dev_priv)
 	u32 val = 0;
 	int ret;
 
-	ret = snb_pcode_read(&amp;dev_priv-&gt;uncore, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
-			     ICL_PCODE_MEM_SS_READ_GLOBAL_INFO, &amp;val, NULL);
+	ret = intel_dram_pcode_read(dev_priv, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
+				    ICL_PCODE_MEM_SS_READ_GLOBAL_INFO, &amp;val);
 	if (ret)
 		return ret;
 
@@ -618,7 +647,7 @@ static int gen12_get_dram_info(struct drm_i915_private *i915)
 
 static int xelpdp_get_dram_info(struct drm_i915_private *i915)
 {
-	u32 val = intel_uncore_read(&amp;i915-&gt;uncore, MTL_MEM_SS_INFO_GLOBAL);
+	u32 val = intel_dram_read(i915, MTL_MEM_SS_INFO_GLOBAL);
 	struct dram_info *dram_info = &amp;i915-&gt;dram_info;
 
 	switch (REG_FIELD_GET(MTL_DDR_TYPE_MASK, val)) {
@@ -687,6 +716,7 @@ void intel_dram_detect(struct drm_i915_private *i915)
 		    str_yes_no(dram_info-&gt;wm_lv_0_adjust_needed));
 }
 
+#ifdef I915
 static u32 gen9_edram_size_mb(struct drm_i915_private *i915, u32 cap)
 {
 	static const u8 ways[8] = { 4, 8, 12, 16, 16, 16, 16, 16 };
@@ -722,3 +752,4 @@ void intel_dram_edram_detect(struct drm_i915_private *i915)
 
 	drm_info(&amp;i915-&gt;drm, "Found %uMB of eDRAM\n", i915-&gt;edram_size_mb);
 }
+#endif
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 669c7b6f552c..3ebef784445e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -124,6 +124,10 @@ $(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.c FORC
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
+$(obj)/display/soc_%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
+	$(call cmd,force_checksrc)
+	$(call if_changed_rule,cc_o_c)
+
 # Display..
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	xe_display.o \
@@ -204,8 +208,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/ext/i915_irq.o \
 	display/ext/i9xx_wm.o \
 	display/ext/intel_device_info.o \
-	display/ext/intel_dram.o \
-	display/ext/intel_pch.o \
+	display/soc_intel_dram.o \
+	display/soc_intel_pch.o \
 	display/ext/intel_pm.o
 
 ifeq ($(CONFIG_ACPI),y)
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 92dfbb8b3ca4..fa8c53e91bce 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -15,7 +15,7 @@
 #include "xe_pm.h"
 #include "xe_step.h"
 #include "i915_reg_defs.h"
-#include "intel_pch.h"
+#include "soc/intel_pch.h"
 #include "i915_utils.h"
 #include &lt;linux/pm_runtime.h&gt;
 
diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
similarity index 80%
rename from drivers/gpu/drm/xe/display/ext/intel_dram.h
rename to drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
index 4ba13c13162c..7ed5b6e1f805 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_dram.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
@@ -8,7 +8,6 @@
 
 struct drm_i915_private;
 
-void intel_dram_edram_detect(struct drm_i915_private *i915);
 void intel_dram_detect(struct drm_i915_private *i915);
 
 #endif /* __INTEL_DRAM_H__ */
diff --git a/drivers/gpu/drm/xe/display/ext/intel_pch.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
similarity index 100%
rename from drivers/gpu/drm/xe/display/ext/intel_pch.h
rename to drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.c b/drivers/gpu/drm/xe/display/ext/intel_dram.c
deleted file mode 100644
index a2df0c502c34..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_dram.c
+++ /dev/null
@@ -1,495 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2020 Intel Corporation
- */
-
-#include &lt;linux/string_helpers.h&gt;
-
-#include "i915_drv.h"
-#include "i915_reg.h"
-#include "intel_de.h"
-#include "intel_dram.h"
-#include "intel_mchbar_regs.h"
-
-struct dram_dimm_info {
-	u16 size;
-	u8 width, ranks;
-};
-
-struct dram_channel_info {
-	struct dram_dimm_info dimm_l, dimm_s;
-	u8 ranks;
-	bool is_16gb_dimm;
-};
-
-#define DRAM_TYPE_STR(type) [INTEL_DRAM_ ## type] = #type
-
-static const char *intel_dram_type_str(enum intel_dram_type type)
-{
-	static const char * const str[] = {
-		DRAM_TYPE_STR(UNKNOWN),
-		DRAM_TYPE_STR(DDR3),
-		DRAM_TYPE_STR(DDR4),
-		DRAM_TYPE_STR(LPDDR3),
-		DRAM_TYPE_STR(LPDDR4),
-	};
-
-	if (type &gt;= ARRAY_SIZE(str))
-		type = INTEL_DRAM_UNKNOWN;
-
-	return str[type];
-}
-
-#undef DRAM_TYPE_STR
-
-static int intel_dimm_num_devices(const struct dram_dimm_info *dimm)
-{
-	return dimm-&gt;ranks * 64 / (dimm-&gt;width ?: 1);
-}
-
-/* Returns total Gb for the whole DIMM */
-static int skl_get_dimm_size(u16 val)
-{
-	return (val &amp; SKL_DRAM_SIZE_MASK) * 8;
-}
-
-static int skl_get_dimm_width(u16 val)
-{
-	if (skl_get_dimm_size(val) == 0)
-		return 0;
-
-	switch (val &amp; SKL_DRAM_WIDTH_MASK) {
-	case SKL_DRAM_WIDTH_X8:
-	case SKL_DRAM_WIDTH_X16:
-	case SKL_DRAM_WIDTH_X32:
-		val = (val &amp; SKL_DRAM_WIDTH_MASK) &gt;&gt; SKL_DRAM_WIDTH_SHIFT;
-		return 8 &lt;&lt; val;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static int skl_get_dimm_ranks(u16 val)
-{
-	if (skl_get_dimm_size(val) == 0)
-		return 0;
-
-	val = (val &amp; SKL_DRAM_RANK_MASK) &gt;&gt; SKL_DRAM_RANK_SHIFT;
-
-	return val + 1;
-}
-
-/* Returns total Gb for the whole DIMM */
-static int icl_get_dimm_size(u16 val)
-{
-	return (val &amp; ICL_DRAM_SIZE_MASK) * 8 / 2;
-}
-
-static int icl_get_dimm_width(u16 val)
-{
-	if (icl_get_dimm_size(val) == 0)
-		return 0;
-
-	switch (val &amp; ICL_DRAM_WIDTH_MASK) {
-	case ICL_DRAM_WIDTH_X8:
-	case ICL_DRAM_WIDTH_X16:
-	case ICL_DRAM_WIDTH_X32:
-		val = (val &amp; ICL_DRAM_WIDTH_MASK) &gt;&gt; ICL_DRAM_WIDTH_SHIFT;
-		return 8 &lt;&lt; val;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static int icl_get_dimm_ranks(u16 val)
-{
-	if (icl_get_dimm_size(val) == 0)
-		return 0;
-
-	val = (val &amp; ICL_DRAM_RANK_MASK) &gt;&gt; ICL_DRAM_RANK_SHIFT;
-
-	return val + 1;
-}
-
-static bool
-skl_is_16gb_dimm(const struct dram_dimm_info *dimm)
-{
-	/* Convert total Gb to Gb per DRAM device */
-	return dimm-&gt;size / (intel_dimm_num_devices(dimm) ?: 1) == 16;
-}
-
-static void
-skl_dram_get_dimm_info(struct drm_i915_private *i915,
-		       struct dram_dimm_info *dimm,
-		       int channel, char dimm_name, u16 val)
-{
-	if (GRAPHICS_VER(i915) &gt;= 11) {
-		dimm-&gt;size = icl_get_dimm_size(val);
-		dimm-&gt;width = icl_get_dimm_width(val);
-		dimm-&gt;ranks = icl_get_dimm_ranks(val);
-	} else {
-		dimm-&gt;size = skl_get_dimm_size(val);
-		dimm-&gt;width = skl_get_dimm_width(val);
-		dimm-&gt;ranks = skl_get_dimm_ranks(val);
-	}
-
-	drm_dbg_kms(&amp;i915-&gt;drm,
-		    "CH%u DIMM %c size: %u Gb, width: X%u, ranks: %u, 16Gb DIMMs: %s\n",
-		    channel, dimm_name, dimm-&gt;size, dimm-&gt;width, dimm-&gt;ranks,
-		    str_yes_no(skl_is_16gb_dimm(dimm)));
-}
-
-static int
-skl_dram_get_channel_info(struct drm_i915_private *i915,
-			  struct dram_channel_info *ch,
-			  int channel, u32 val)
-{
-	skl_dram_get_dimm_info(i915, &amp;ch-&gt;dimm_l,
-			       channel, 'L', val &amp; 0xffff);
-	skl_dram_get_dimm_info(i915, &amp;ch-&gt;dimm_s,
-			       channel, 'S', val &gt;&gt; 16);
-
-	if (ch-&gt;dimm_l.size == 0 &amp;&amp; ch-&gt;dimm_s.size == 0) {
-		drm_dbg_kms(&amp;i915-&gt;drm, "CH%u not populated\n", channel);
-		return -EINVAL;
-	}
-
-	if (ch-&gt;dimm_l.ranks == 2 || ch-&gt;dimm_s.ranks == 2)
-		ch-&gt;ranks = 2;
-	else if (ch-&gt;dimm_l.ranks == 1 &amp;&amp; ch-&gt;dimm_s.ranks == 1)
-		ch-&gt;ranks = 2;
-	else
-		ch-&gt;ranks = 1;
-
-	ch-&gt;is_16gb_dimm = skl_is_16gb_dimm(&amp;ch-&gt;dimm_l) ||
-		skl_is_16gb_dimm(&amp;ch-&gt;dimm_s);
-
-	drm_dbg_kms(&amp;i915-&gt;drm, "CH%u ranks: %u, 16Gb DIMMs: %s\n",
-		    channel, ch-&gt;ranks, str_yes_no(ch-&gt;is_16gb_dimm));
-
-	return 0;
-}
-
-static bool
-intel_is_dram_symmetric(const struct dram_channel_info *ch0,
-			const struct dram_channel_info *ch1)
-{
-	return !memcmp(ch0, ch1, sizeof(*ch0)) &amp;&amp;
-		(ch0-&gt;dimm_s.size == 0 ||
-		 !memcmp(&amp;ch0-&gt;dimm_l, &amp;ch0-&gt;dimm_s, sizeof(ch0-&gt;dimm_l)));
-}
-
-static int
-skl_dram_get_channels_info(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &amp;i915-&gt;dram_info;
-	struct dram_channel_info ch0 = {}, ch1 = {};
-	u32 val;
-	int ret;
-
-	val = intel_de_read(i915, SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
-	ret = skl_dram_get_channel_info(i915, &amp;ch0, 0, val);
-	if (ret == 0)
-		dram_info-&gt;num_channels++;
-
-	val = intel_de_read(i915, SKL_MAD_DIMM_CH1_0_0_0_MCHBAR_MCMAIN);
-	ret = skl_dram_get_channel_info(i915, &amp;ch1, 1, val);
-	if (ret == 0)
-		dram_info-&gt;num_channels++;
-
-	if (dram_info-&gt;num_channels == 0) {
-		drm_info(&amp;i915-&gt;drm, "Number of memory channels is zero\n");
-		return -EINVAL;
-	}
-
-	if (ch0.ranks == 0 &amp;&amp; ch1.ranks == 0) {
-		drm_info(&amp;i915-&gt;drm, "couldn't get memory rank information\n");
-		return -EINVAL;
-	}
-
-	dram_info-&gt;wm_lv_0_adjust_needed = ch0.is_16gb_dimm || ch1.is_16gb_dimm;
-
-	dram_info-&gt;symmetric_memory = intel_is_dram_symmetric(&amp;ch0, &amp;ch1);
-
-	drm_dbg_kms(&amp;i915-&gt;drm, "Memory configuration is symmetric? %s\n",
-		    str_yes_no(dram_info-&gt;symmetric_memory));
-
-	return 0;
-}
-
-static enum intel_dram_type
-skl_get_dram_type(struct drm_i915_private *i915)
-{
-	u32 val;
-
-	val = intel_de_read(i915, SKL_MAD_INTER_CHANNEL_0_0_0_MCHBAR_MCMAIN);
-
-	switch (val &amp; SKL_DRAM_DDR_TYPE_MASK) {
-	case SKL_DRAM_DDR_TYPE_DDR3:
-		return INTEL_DRAM_DDR3;
-	case SKL_DRAM_DDR_TYPE_DDR4:
-		return INTEL_DRAM_DDR4;
-	case SKL_DRAM_DDR_TYPE_LPDDR3:
-		return INTEL_DRAM_LPDDR3;
-	case SKL_DRAM_DDR_TYPE_LPDDR4:
-		return INTEL_DRAM_LPDDR4;
-	default:
-		MISSING_CASE(val);
-		return INTEL_DRAM_UNKNOWN;
-	}
-}
-
-static int
-skl_get_dram_info(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &amp;i915-&gt;dram_info;
-	int ret;
-
-	dram_info-&gt;type = skl_get_dram_type(i915);
-	drm_dbg_kms(&amp;i915-&gt;drm, "DRAM type: %s\n",
-		    intel_dram_type_str(dram_info-&gt;type));
-
-	ret = skl_dram_get_channels_info(i915);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/* Returns Gb per DRAM device */
-static int bxt_get_dimm_size(u32 val)
-{
-	switch (val &amp; BXT_DRAM_SIZE_MASK) {
-	case BXT_DRAM_SIZE_4GBIT:
-		return 4;
-	case BXT_DRAM_SIZE_6GBIT:
-		return 6;
-	case BXT_DRAM_SIZE_8GBIT:
-		return 8;
-	case BXT_DRAM_SIZE_12GBIT:
-		return 12;
-	case BXT_DRAM_SIZE_16GBIT:
-		return 16;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static int bxt_get_dimm_width(u32 val)
-{
-	if (!bxt_get_dimm_size(val))
-		return 0;
-
-	val = (val &amp; BXT_DRAM_WIDTH_MASK) &gt;&gt; BXT_DRAM_WIDTH_SHIFT;
-
-	return 8 &lt;&lt; val;
-}
-
-static int bxt_get_dimm_ranks(u32 val)
-{
-	if (!bxt_get_dimm_size(val))
-		return 0;
-
-	switch (val &amp; BXT_DRAM_RANK_MASK) {
-	case BXT_DRAM_RANK_SINGLE:
-		return 1;
-	case BXT_DRAM_RANK_DUAL:
-		return 2;
-	default:
-		MISSING_CASE(val);
-		return 0;
-	}
-}
-
-static enum intel_dram_type bxt_get_dimm_type(u32 val)
-{
-	if (!bxt_get_dimm_size(val))
-		return INTEL_DRAM_UNKNOWN;
-
-	switch (val &amp; BXT_DRAM_TYPE_MASK) {
-	case BXT_DRAM_TYPE_DDR3:
-		return INTEL_DRAM_DDR3;
-	case BXT_DRAM_TYPE_LPDDR3:
-		return INTEL_DRAM_LPDDR3;
-	case BXT_DRAM_TYPE_DDR4:
-		return INTEL_DRAM_DDR4;
-	case BXT_DRAM_TYPE_LPDDR4:
-		return INTEL_DRAM_LPDDR4;
-	default:
-		MISSING_CASE(val);
-		return INTEL_DRAM_UNKNOWN;
-	}
-}
-
-static void bxt_get_dimm_info(struct dram_dimm_info *dimm, u32 val)
-{
-	dimm-&gt;width = bxt_get_dimm_width(val);
-	dimm-&gt;ranks = bxt_get_dimm_ranks(val);
-
-	/*
-	 * Size in register is Gb per DRAM device. Convert to total
-	 * Gb to match the way we report this for non-LP platforms.
-	 */
-	dimm-&gt;size = bxt_get_dimm_size(val) * intel_dimm_num_devices(dimm);
-}
-
-static int bxt_get_dram_info(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &amp;i915-&gt;dram_info;
-	u32 val;
-	u8 valid_ranks = 0;
-	int i;
-
-	/*
-	 * Now read each DUNIT8/9/10/11 to check the rank of each dimms.
-	 */
-	for (i = BXT_D_CR_DRP0_DUNIT_START; i &lt;= BXT_D_CR_DRP0_DUNIT_END; i++) {
-		struct dram_dimm_info dimm;
-		enum intel_dram_type type;
-
-		val = intel_de_read(i915, BXT_D_CR_DRP0_DUNIT(i));
-		if (val == 0xFFFFFFFF)
-			continue;
-
-		dram_info-&gt;num_channels++;
-
-		bxt_get_dimm_info(&amp;dimm, val);
-		type = bxt_get_dimm_type(val);
-
-		drm_WARN_ON(&amp;i915-&gt;drm, type != INTEL_DRAM_UNKNOWN &amp;&amp;
-			    dram_info-&gt;type != INTEL_DRAM_UNKNOWN &amp;&amp;
-			    dram_info-&gt;type != type);
-
-		drm_dbg_kms(&amp;i915-&gt;drm,
-			    "CH%u DIMM size: %u Gb, width: X%u, ranks: %u, type: %s\n",
-			    i - BXT_D_CR_DRP0_DUNIT_START,
-			    dimm.size, dimm.width, dimm.ranks,
-			    intel_dram_type_str(type));
-
-		if (valid_ranks == 0)
-			valid_ranks = dimm.ranks;
-
-		if (type != INTEL_DRAM_UNKNOWN)
-			dram_info-&gt;type = type;
-	}
-
-	if (dram_info-&gt;type == INTEL_DRAM_UNKNOWN || valid_ranks == 0) {
-		drm_info(&amp;i915-&gt;drm, "couldn't get memory information\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int icl_pcode_read_mem_global_info(struct drm_i915_private *dev_priv)
-{
-	struct dram_info *dram_info = &amp;dev_priv-&gt;dram_info;
-	u32 val = 0;
-	int ret;
-
-	ret = intel_de_pcode_read(dev_priv, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
-			     ICL_PCODE_MEM_SS_READ_GLOBAL_INFO, &amp;val, NULL);
-	if (ret)
-		return ret;
-
-	if (GRAPHICS_VER(dev_priv) &gt;= 12) {
-		switch (val &amp; 0xf) {
-		case 0:
-			dram_info-&gt;type = INTEL_DRAM_DDR4;
-			break;
-		case 1:
-			dram_info-&gt;type = INTEL_DRAM_DDR5;
-			break;
-		case 2:
-			dram_info-&gt;type = INTEL_DRAM_LPDDR5;
-			break;
-		case 3:
-			dram_info-&gt;type = INTEL_DRAM_LPDDR4;
-			break;
-		case 4:
-			dram_info-&gt;type = INTEL_DRAM_DDR3;
-			break;
-		case 5:
-			dram_info-&gt;type = INTEL_DRAM_LPDDR3;
-			break;
-		default:
-			MISSING_CASE(val &amp; 0xf);
-			return -EINVAL;
-		}
-	} else {
-		switch (val &amp; 0xf) {
-		case 0:
-			dram_info-&gt;type = INTEL_DRAM_DDR4;
-			break;
-		case 1:
-			dram_info-&gt;type = INTEL_DRAM_DDR3;
-			break;
-		case 2:
-			dram_info-&gt;type = INTEL_DRAM_LPDDR3;
-			break;
-		case 3:
-			dram_info-&gt;type = INTEL_DRAM_LPDDR4;
-			break;
-		default:
-			MISSING_CASE(val &amp; 0xf);
-			return -EINVAL;
-		}
-	}
-
-	dram_info-&gt;num_channels = (val &amp; 0xf0) &gt;&gt; 4;
-	dram_info-&gt;num_qgv_points = (val &amp; 0xf00) &gt;&gt; 8;
-	dram_info-&gt;num_psf_gv_points = (val &amp; 0x3000) &gt;&gt; 12;
-
-	return 0;
-}
-
-static int gen11_get_dram_info(struct drm_i915_private *i915)
-{
-	int ret = skl_get_dram_info(i915);
-
-	if (ret)
-		return ret;
-
-	return icl_pcode_read_mem_global_info(i915);
-}
-
-static int gen12_get_dram_info(struct drm_i915_private *i915)
-{
-	i915-&gt;dram_info.wm_lv_0_adjust_needed = false;
-
-	return icl_pcode_read_mem_global_info(i915);
-}
-
-void intel_dram_detect(struct drm_i915_private *i915)
-{
-	struct dram_info *dram_info = &amp;i915-&gt;dram_info;
-	int ret;
-
-	if (GRAPHICS_VER(i915) &lt; 9 || IS_DG2(i915) || !HAS_DISPLAY(i915))
-		return;
-
-	/*
-	 * Assume level 0 watermark latency adjustment is needed until proven
-	 * otherwise, this w/a is not needed by bxt/glk.
-	 */
-	dram_info-&gt;wm_lv_0_adjust_needed = !IS_GEN9_LP(i915);
-
-	if (GRAPHICS_VER(i915) &gt;= 12)
-		ret = gen12_get_dram_info(i915);
-	else if (GRAPHICS_VER(i915) &gt;= 11)
-		ret = gen11_get_dram_info(i915);
-	else if (IS_GEN9_LP(i915))
-		ret = bxt_get_dram_info(i915);
-	else
-		ret = skl_get_dram_info(i915);
-	if (ret)
-		return;
-
-	drm_dbg_kms(&amp;i915-&gt;drm, "DRAM channels: %u\n", dram_info-&gt;num_channels);
-
-	drm_dbg_kms(&amp;i915-&gt;drm, "Watermark level 0 adjustment needed: %s\n",
-		    str_yes_no(dram_info-&gt;wm_lv_0_adjust_needed));
-}
diff --git a/drivers/gpu/drm/xe/display/ext/intel_pch.c b/drivers/gpu/drm/xe/display/ext/intel_pch.c
deleted file mode 100644
index dc2b15b5c4be..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_pch.c
+++ /dev/null
@@ -1,157 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright 2019 Intel Corporation.
- */
-
-#include "i915_drv.h"
-#include "i915_utils.h"
-#include "intel_pch.h"
-
-/* Map PCH device id to PCH type, or PCH_NONE if unknown. */
-static enum intel_pch
-intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
-{
-	switch (id) {
-	case INTEL_PCH_MCC_DEVICE_ID_TYPE:
-		drm_dbg_kms(&amp;dev_priv-&gt;drm, "Found Mule Creek Canyon PCH\n");
-		drm_WARN_ON(&amp;dev_priv-&gt;drm, !IS_JSL_EHL(dev_priv));
-		/* MCC is TGP compatible */
-		return PCH_TGP;
-	case INTEL_PCH_TGP_DEVICE_ID_TYPE:
-	case INTEL_PCH_TGP2_DEVICE_ID_TYPE:
-		drm_dbg_kms(&amp;dev_priv-&gt;drm, "Found Tiger Lake LP PCH\n");
-		drm_WARN_ON(&amp;dev_priv-&gt;drm, !IS_TIGERLAKE(dev_priv) &amp;&amp;
-			    !IS_ROCKETLAKE(dev_priv) &amp;&amp;
-			    !IS_GEN9_BC(dev_priv));
-		return PCH_TGP;
-	case INTEL_PCH_ADP_DEVICE_ID_TYPE:
-	case INTEL_PCH_ADP2_DEVICE_ID_TYPE:
-	case INTEL_PCH_ADP3_DEVICE_ID_TYPE:
-	case INTEL_PCH_ADP4_DEVICE_ID_TYPE:
-		drm_dbg_kms(&amp;dev_priv-&gt;drm, "Found Alder Lake PCH\n");
-		drm_WARN_ON(&amp;dev_priv-&gt;drm, !IS_ALDERLAKE_S(dev_priv) &amp;&amp;
-			    !IS_ALDERLAKE_P(dev_priv));
-		return PCH_ADP;
-	case INTEL_PCH_MTP_DEVICE_ID_TYPE:
-	case INTEL_PCH_MTP2_DEVICE_ID_TYPE:
-		drm_dbg_kms(&amp;dev_priv-&gt;drm, "Found Meteor Lake PCH\n");
-		drm_WARN_ON(&amp;dev_priv-&gt;drm, !IS_METEORLAKE(dev_priv));
-		return PCH_MTP;
-	default:
-		return PCH_NONE;
-	}
-}
-
-static bool intel_is_virt_pch(unsigned short id,
-			      unsigned short svendor, unsigned short sdevice)
-{
-	return (id == INTEL_PCH_P2X_DEVICE_ID_TYPE ||
-		id == INTEL_PCH_P3X_DEVICE_ID_TYPE ||
-		(id == INTEL_PCH_QEMU_DEVICE_ID_TYPE &amp;&amp;
-		 svendor == PCI_SUBVENDOR_ID_REDHAT_QUMRANET &amp;&amp;
-		 sdevice == PCI_SUBDEVICE_ID_QEMU));
-}
-
-static void
-intel_virt_detect_pch(const struct drm_i915_private *dev_priv,
-		      unsigned short *pch_id, enum intel_pch *pch_type)
-{
-	unsigned short id = 0;
-
-	/*
-	 * In a virtualized passthrough environment we can be in a
-	 * setup where the ISA bridge is not able to be passed through.
-	 * In this case, a south bridge can be emulated and we have to
-	 * make an educated guess as to which PCH is really there.
-	 */
-
-	if (IS_METEORLAKE(dev_priv))
-		id = INTEL_PCH_MTP_DEVICE_ID_TYPE;
-	else if (IS_ALDERLAKE_S(dev_priv) || IS_ALDERLAKE_P(dev_priv))
-		id = INTEL_PCH_ADP_DEVICE_ID_TYPE;
-	else if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv))
-		id = INTEL_PCH_TGP_DEVICE_ID_TYPE;
-	else BUG_ON(1);
-
-	if (id)
-		drm_dbg_kms(&amp;dev_priv-&gt;drm, "Assuming PCH ID %04x\n", id);
-	else
-		drm_dbg_kms(&amp;dev_priv-&gt;drm, "Assuming no PCH\n");
-
-	*pch_type = intel_pch_type(dev_priv, id);
-
-	/* Sanity check virtual PCH id */
-	if (drm_WARN_ON(&amp;dev_priv-&gt;drm,
-			id &amp;&amp; *pch_type == PCH_NONE))
-		id = 0;
-
-	*pch_id = id;
-}
-
-void intel_detect_pch(struct drm_i915_private *dev_priv)
-{
-	struct pci_dev *pch = NULL;
-	unsigned short id;
-	enum intel_pch pch_type;
-
-	/* DG1 has south engine display on the same PCI device */
-	if (IS_DG1(dev_priv)) {
-		dev_priv-&gt;pch_type = PCH_DG1;
-		return;
-	} else if (IS_DG2(dev_priv)) {
-		dev_priv-&gt;pch_type = PCH_DG2;
-		return;
-	}
-
-	/*
-	 * The reason to probe ISA bridge instead of Dev31:Fun0 is to
-	 * make graphics device passthrough work easy for VMM, that only
-	 * need to expose ISA bridge to let driver know the real hardware
-	 * underneath. This is a requirement from virtualization team.
-	 *
-	 * In some virtualized environments (e.g. XEN), there is irrelevant
-	 * ISA bridge in the system. To work reliably, we should scan trhough
-	 * all the ISA bridge devices and check for the first match, instead
-	 * of only checking the first one.
-	 */
-	while ((pch = pci_get_class(PCI_CLASS_BRIDGE_ISA &lt;&lt; 8, pch))) {
-		if (pch-&gt;vendor != PCI_VENDOR_ID_INTEL)
-			continue;
-
-		id = pch-&gt;device &amp; INTEL_PCH_DEVICE_ID_MASK;
-
-		pch_type = intel_pch_type(dev_priv, id);
-		if (pch_type != PCH_NONE) {
-			dev_priv-&gt;pch_type = pch_type;
-			dev_priv-&gt;pch_id = id;
-			break;
-		} else if (intel_is_virt_pch(id, pch-&gt;subsystem_vendor,
-					     pch-&gt;subsystem_device)) {
-			intel_virt_detect_pch(dev_priv, &amp;id, &amp;pch_type);
-			dev_priv-&gt;pch_type = pch_type;
-			dev_priv-&gt;pch_id = id;
-			break;
-		}
-	}
-
-	/*
-	 * Use PCH_NOP (PCH but no South Display) for PCH platforms without
-	 * display.
-	 */
-	if (pch &amp;&amp; !HAS_DISPLAY(dev_priv)) {
-		drm_dbg_kms(&amp;dev_priv-&gt;drm,
-			    "Display disabled, reverting to NOP PCH\n");
-		dev_priv-&gt;pch_type = PCH_NOP;
-		dev_priv-&gt;pch_id = 0;
-	} else if (!pch) {
-		if (i915_run_as_guest() &amp;&amp; HAS_DISPLAY(dev_priv)) {
-			intel_virt_detect_pch(dev_priv, &amp;id, &amp;pch_type);
-			dev_priv-&gt;pch_type = pch_type;
-			dev_priv-&gt;pch_id = id;
-		} else {
-			drm_dbg_kms(&amp;dev_priv-&gt;drm, "No PCH found.\n");
-		}
-	}
-
-	pci_dev_put(pch);
-}
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 88f863edc41c..54de3229553b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -18,7 +18,7 @@
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include "ext/intel_device_info.h"
-#include "ext/intel_pch.h"
+#include "soc/intel_pch.h"
 #include "intel_display_core.h"
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 64e65b29d8de..35dee29da832 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -16,8 +16,8 @@
 #include &lt;drm/xe_drm.h&gt;
 
 #include "ext/i915_irq.h"
-#include "ext/intel_dram.h"
 #include "ext/intel_pm.h"
+#include "soc/intel_dram.h"
 #include "intel_acpi.h"
 #include "intel_audio.h"
 #include "intel_bw.h"
-- 
2.34.1


</pre>
  </body>
</html>

--------------sLSkZaOt0Po2we8Xiynq1BuB--
