Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533C3C6FD18
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 12:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0072710E136;
	Fri, 31 Mar 2023 12:01:55 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FC210E136
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 12:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680264112; x=1711800112;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=a2eARFjPuPDugU/g6iSbtp5mQa3IbYgvOn46nOUQWrk=;
 b=Xl35AJTiQkdKwpG/oKS4+gEyE5T3tbma/09pNavvjRJz17DoiyMLF0/Q
 L/5mUpaCFldbweHKjF1kQIy2gw4PYcfQAQ4DIVDEMrmH5rtTLCsnjrYk1
 T2rB4Z89PDRZJEROamg4QMUB+vKFxeZASrYjQSC2zTusAE5fOfQbO/WjM
 zCg1GBmzJ49lcamMQ8qhDucQcB6cE0OPXdBdvXQh9d1sgc6NWjZMdhVxg
 nvX6n3OHrSksV7qLuDnEoMBF5nfyeDD7JrjcXT6/hHD3cV9Lk5FX9VgHX
 JBwRTytGTdjleC9nW//I0lFOAqqZ5LZLoEhbCSL4++sJts52QT6UuowJw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427713467"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="427713467"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 05:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="685111140"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="685111140"
Received: from bawinitt-mobl2.amr.corp.intel.com (HELO [10.251.209.55])
 ([10.251.209.55])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 05:01:31 -0700
Message-ID: <7b069b9f-8208-77fc-1872-b49e7a8c2cca@linux.intel.com>
Date: Fri, 31 Mar 2023 14:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
 <20230331102419.521392-6-maarten.lankhorst@linux.intel.com>
 <874jq12lar.fsf@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <874jq12lar.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 2023-03-31 13:49, Jani Nikula wrote:
> On Fri, 31 Mar 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
>> Instead of making a copy that is hard to keep up to date, build the
>> source directly.
>>
>> Add a rule for soc_* files, and use those to build i915.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/soc/intel_dram.c         |  30 +-
>>   drivers/gpu/drm/xe/Makefile                   |   8 +-
>>   .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +-
>>   .../soc}/intel_dram.h                         |   1 -
>>   .../soc}/intel_pch.h                          |   0
>>   drivers/gpu/drm/xe/display/ext/intel_dram.c   | 495 ------------------
>>   drivers/gpu/drm/xe/display/ext/intel_pch.c    | 157 ------
>>   drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
>>   drivers/gpu/drm/xe/xe_display.c               |   2 +-
>>   9 files changed, 28 insertions(+), 669 deletions(-)
>>   rename drivers/gpu/drm/xe/{display/ext => compat-i915-headers/soc}/intel_dram.h (80%)
>>   rename drivers/gpu/drm/xe/{display/ext => compat-i915-headers/soc}/intel_pch.h (100%)
>>   delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.c
>>   delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.c
>>
>> diff --git a/drivers/gpu/drm/i915/soc/intel_dram.c b/drivers/gpu/drm/i915/soc/intel_dram.c
>> index 9649051ed8ed..13fe18a9372f 100644
>> --- a/drivers/gpu/drm/i915/soc/intel_dram.c
>> +++ b/drivers/gpu/drm/i915/soc/intel_dram.c
>> @@ -9,8 +9,12 @@
>>   #include "i915_reg.h"
>>   #include "intel_dram.h"
>>   #include "intel_mchbar_regs.h"
>> -#include "intel_pcode.h"
>> +#ifdef I915
>>   #include "vlv_sideband.h"
>> +#include "display/intel_de.h"
>> +#else
>> +#include "xe_de.h"
>> +#endif
>>   
>>   struct dram_dimm_info {
>>   	u16 size;
>> @@ -43,6 +47,8 @@ static const char *intel_dram_type_str(enum intel_dram_type type)
>>   
>>   #undef DRAM_TYPE_STR
>>   
>> +#ifdef I915
>> +
>>   static void pnv_detect_mem_freq(struct drm_i915_private *dev_priv)
>>   {
>>   	u32 tmp;
>> @@ -191,6 +197,9 @@ static void detect_mem_freq(struct drm_i915_private *i915)
>>   	if (i915->mem_freq)
>>   		drm_dbg(&i915->drm, "DDR speed: %d MHz\n", i915->mem_freq);
>>   }
>> +#else
>> +#define detect_mem_freq(i915) do { } while (0)
>> +#endif
>>   
>>   static int intel_dimm_num_devices(const struct dram_dimm_info *dimm)
>>   {
>> @@ -339,14 +348,12 @@ skl_dram_get_channels_info(struct drm_i915_private *i915)
>>   	u32 val;
>>   	int ret;
>>   
>> -	val = intel_uncore_read(&i915->uncore,
>> -				SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
>> +	val = intel_de_read(i915, SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
> This isn't great, because those aren't DE registers. So this won't fly
> upstream.

Could we do this for xe instead?

#define intel_uncore_read(ignore, reg) xe_mmio_read32(i915, reg) ?

