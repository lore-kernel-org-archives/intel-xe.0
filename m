Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780E2C761A6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 08:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B20E10E421;
	Mon,  3 Apr 2023 08:12:34 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52EF10E429
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680509551; x=1712045551;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=F5FWMIYReeHDTBHRooZC71HH/unIOyvuyiDZDHp5bts=;
 b=PlH6BbKUtn9p46nLvZXrOsXZvQCGbrtgystJBQBWidc9RXyj7S/4RUvF
 gwbwpO6XKWuoGKPohZTpogAWcUG93hu0e7mkfEI2eN8w4BNF04rDPDuz+
 9J2fZZm0r4RxfNvxc/T+G0Lje+r2eqe3EZb1OH/EJWWfrdqyO8adyMwhu
 7Yhi2LMd+QqpLW/2RAzWSp9WattWJaUdE6GSIe0GBXtMzwGc1SuMXuAb0
 7dl/RJCsvrsDCAlaeowsyU/EmTFRIozHROPUKMHmxs6cjkK6Z2tXPBm5d
 6uelIb28KAxvvAIJyJg+xDXNqhM0zh/dMZVkbw6Vm8pycbnOfqgMM6YHC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="343533251"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="343533251"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 01:12:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="931927900"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="931927900"
Received: from nproshun-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.42.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 01:12:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <7b069b9f-8208-77fc-1872-b49e7a8c2cca@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
 <20230331102419.521392-6-maarten.lankhorst@linux.intel.com>
 <874jq12lar.fsf@intel.com>
 <7b069b9f-8208-77fc-1872-b49e7a8c2cca@linux.intel.com>
Date: Mon, 03 Apr 2023 11:12:27 +0300
Message-ID: <87ttxx1j10.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe: Build soc files directly
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

On Fri, 31 Mar 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> On 2023-03-31 13:49, Jani Nikula wrote:
>> On Fri, 31 Mar 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
>>> Instead of making a copy that is hard to keep up to date, build the
>>> source directly.
>>>
>>> Add a rule for soc_* files, and use those to build i915.
>>>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/soc/intel_dram.c         |  30 +-
>>>   drivers/gpu/drm/xe/Makefile                   |   8 +-
>>>   .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +-
>>>   .../soc}/intel_dram.h                         |   1 -
>>>   .../soc}/intel_pch.h                          |   0
>>>   drivers/gpu/drm/xe/display/ext/intel_dram.c   | 495 ------------------
>>>   drivers/gpu/drm/xe/display/ext/intel_pch.c    | 157 ------
>>>   drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
>>>   drivers/gpu/drm/xe/xe_display.c               |   2 +-
>>>   9 files changed, 28 insertions(+), 669 deletions(-)
>>>   rename drivers/gpu/drm/xe/{display/ext => compat-i915-headers/soc}/intel_dram.h (80%)
>>>   rename drivers/gpu/drm/xe/{display/ext => compat-i915-headers/soc}/intel_pch.h (100%)
>>>   delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.c
>>>   delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.c
>>>
>>> diff --git a/drivers/gpu/drm/i915/soc/intel_dram.c b/drivers/gpu/drm/i915/soc/intel_dram.c
>>> index 9649051ed8ed..13fe18a9372f 100644
>>> --- a/drivers/gpu/drm/i915/soc/intel_dram.c
>>> +++ b/drivers/gpu/drm/i915/soc/intel_dram.c
>>> @@ -9,8 +9,12 @@
>>>   #include "i915_reg.h"
>>>   #include "intel_dram.h"
>>>   #include "intel_mchbar_regs.h"
>>> -#include "intel_pcode.h"
>>> +#ifdef I915
>>>   #include "vlv_sideband.h"
>>> +#include "display/intel_de.h"
>>> +#else
>>> +#include "xe_de.h"
>>> +#endif
>>>   
>>>   struct dram_dimm_info {
>>>   	u16 size;
>>> @@ -43,6 +47,8 @@ static const char *intel_dram_type_str(enum intel_dram_type type)
>>>   
>>>   #undef DRAM_TYPE_STR
>>>   
>>> +#ifdef I915
>>> +
>>>   static void pnv_detect_mem_freq(struct drm_i915_private *dev_priv)
>>>   {
>>>   	u32 tmp;
>>> @@ -191,6 +197,9 @@ static void detect_mem_freq(struct drm_i915_private *i915)
>>>   	if (i915->mem_freq)
>>>   		drm_dbg(&i915->drm, "DDR speed: %d MHz\n", i915->mem_freq);
>>>   }
>>> +#else
>>> +#define detect_mem_freq(i915) do { } while (0)
>>> +#endif
>>>   
>>>   static int intel_dimm_num_devices(const struct dram_dimm_info *dimm)
>>>   {
>>> @@ -339,14 +348,12 @@ skl_dram_get_channels_info(struct drm_i915_private *i915)
>>>   	u32 val;
>>>   	int ret;
>>>   
>>> -	val = intel_uncore_read(&i915->uncore,
>>> -				SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
>>> +	val = intel_de_read(i915, SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
>> This isn't great, because those aren't DE registers. So this won't fly
>> upstream.
>
> Could we do this for xe instead?
>
> #define intel_uncore_read(ignore, reg) xe_mmio_read32(i915, reg) ?

The obvious downside is that it relies on the implict variable i915,
which could also be named something else, and it has taken a long, long
time trying to fix those in i915.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
