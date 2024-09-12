Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5752EED601
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 13:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAAA10EB7E;
	Thu, 12 Sep 2024 13:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZ1w21QM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEB910EB7E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726147822; x=1757683822;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6iGpPYB6CxEk701fm26DZuRUpdSXTmQ77y2XA6Eenbw=;
 b=HZ1w21QMJ3YhnbEk5PZal68D7u/BjLtlyetbZ2enlPXBFpi6yks+4kQq
 bl5mb3tJZBzknTP/3hENVCGcFq3WrY2nCADvhRs37cxDj7YhltfBAs0W5
 NTyKuIdJJAfa318h24AELigevDHE5DUm1HUu3Zbq2uMZ2+JhCrZRT1NwF
 urLrb05oiOvv3B8UqIM8aCrcZibUp1nFtEo63yZNKPo7zLOaMgpxfDOsJ
 cFkvTN+3SML7ek0HyaM9YOUF4pj6O1nT1i3mvNo1qpOqPYOtsx0l13xte
 6oP5ySzZ3w46Swp2zZ5BV0Udlik01ZH1WBH5xGxuGqsU31UtBQYkiFOew Q==;
X-CSE-ConnectionGUID: GjujwHRkTeiNXo5DwrmeLQ==
X-CSE-MsgGUID: tMPvI6LWQnqu0R6ufg4lnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24822726"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24822726"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:30:22 -0700
X-CSE-ConnectionGUID: fyG4ZNyrTVi0ae6rd+vSHQ==
X-CSE-MsgGUID: 8op4jvDUTQqxVDvf8vvpaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67329697"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:30:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 04/43] drm/xe: Move GSI offset adjustment fields into
 'struct xe_mmio'
In-Reply-To: <ZuCJy_MIJKlxB-X6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-49-matthew.d.roper@intel.com>
 <ZuCJy_MIJKlxB-X6@intel.com>
Date: Thu, 12 Sep 2024 16:30:09 +0300
Message-ID: <87jzfhf19a.fsf@intel.com>
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

On Tue, 10 Sep 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Fri, Sep 06, 2024 at 05:07:53PM -0700, Matt Roper wrote:
>> By moving the GSI adjustment fields into 'struct xe_mmio' we can replace
>> the GT's MMIO substructure with another instance of xe_mmio.  At the
>> moment this means MMIO operations wind up pulling information from two
>> different places (the tile's xe_mmio for the iomap and the GT's xe_mmio
>> for the adjustment), but we'll address that in future patches.
>> 
>> The type headers change a bit with this change, meaning that various
>> files should be including xe_device_types.h instead of (or in addition
>> to) xe_gt_types.h.
>> 
>> v2:
>>  - Fix pre-existing kerneldoc typo while moving the fields (Lucas)
>> 
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_assert.h       |  2 +-
>>  drivers/gpu/drm/xe/xe_device.h       |  1 +
>>  drivers/gpu/drm/xe/xe_device_types.h |  7 ++++++-
>>  drivers/gpu/drm/xe/xe_gt_freq.c      |  2 +-
>>  drivers/gpu/drm/xe/xe_gt_printk.h    |  2 +-
>>  drivers/gpu/drm/xe/xe_gt_types.h     | 11 ++---------
>>  6 files changed, 12 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
>> index e22bbf57fca7..04d6b95c6d87 100644
>> --- a/drivers/gpu/drm/xe/xe_assert.h
>> +++ b/drivers/gpu/drm/xe/xe_assert.h
>> @@ -10,7 +10,7 @@
>>  
>>  #include <drm/drm_print.h>
>>  
>> -#include "xe_device_types.h"
>> +#include "xe_gt_types.h"
>>  #include "xe_step.h"
>>  
>>  /**
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index ec726dcd5f99..ca8d8ef6342b 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -9,6 +9,7 @@
>>  #include <drm/drm_util.h>
>>  
>>  #include "xe_device_types.h"
>> +#include "xe_gt_types.h"
>>  
>>  static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>>  {
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index ecf95801743d..85ef36c5d040 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -14,7 +14,6 @@
>>  
>>  #include "xe_devcoredump_types.h"
>>  #include "xe_heci_gsc.h"
>> -#include "xe_gt_types.h"
>>  #include "xe_lmtt_types.h"
>>  #include "xe_memirq_types.h"
>>  #include "xe_oa.h"
>> @@ -127,6 +126,12 @@ struct xe_mmio {
>>  	 * non-register regions such as the GGTT PTEs.
>>  	 */
>>  	size_t regs_size;
>> +
>> +	/** adj_limit: adjust MMIO address if address is below this value */
>
>            ^
> missing '@' in here.
>
> hard to spot even after seeing CI failure:
>
> drivers/gpu/drm/xe/xe_device_types.h:147: warning: Function parameter or struct member 'adj_limit' not described in 'xe_mmio

i915 does kernel-doc checking during build for both .h and .c when
CONFIG_DRM_I915_WERROR=y. It has reduced these issues a lot.

See the i915 Makefile.

BR,
Jani.


>
>> +	u32 adj_limit;
>> +
>> +	/** @adj_offset: offset to add to MMIO address when adjusting */
>> +	u32 adj_offset;
>>  };
>>  
>>  /**
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index 68a5778b4319..552435951f11 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -11,9 +11,9 @@
>>  #include <drm/drm_managed.h>
>>  #include <drm/drm_print.h>
>>  
>> -#include "xe_device_types.h"
>>  #include "xe_gt_sysfs.h"
>>  #include "xe_gt_throttle.h"
>> +#include "xe_gt_types.h"
>>  #include "xe_guc_pc.h"
>>  #include "xe_pm.h"
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
>> index d6228baaff1e..5dc71394372d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>> @@ -8,7 +8,7 @@
>>  
>>  #include <drm/drm_print.h>
>>  
>> -#include "xe_device_types.h"
>> +#include "xe_gt_types.h"
>>  
>>  #define xe_gt_printk(_gt, _level, _fmt, ...) \
>>  	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index dd6bbef0bbcd..a287b98ee70b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -6,6 +6,7 @@
>>  #ifndef _XE_GT_TYPES_H_
>>  #define _XE_GT_TYPES_H_
>>  
>> +#include "xe_device_types.h"
>>  #include "xe_force_wake_types.h"
>>  #include "xe_gt_idle_types.h"
>>  #include "xe_gt_sriov_pf_types.h"
>> @@ -147,15 +148,7 @@ struct xe_gt {
>>  	 * register space, but have their own copy of GSI registers at a
>>  	 * specific offset.
>>  	 */
>> -	struct {
>> -		/**
>> -		 * @mmio.adj_limit: adjust MMIO address if address is below this
>> -		 * value
>> -		 */
>> -		u32 adj_limit;
>> -		/** @mmio.adj_offset: offect to add to MMIO address when adjusting */
>> -		u32 adj_offset;
>> -	} mmio;
>> +	struct xe_mmio mmio;
>>  
>>  	/**
>>  	 * @pm: power management info for GT.  The driver uses the GT's
>> -- 
>> 2.45.2
>> 

-- 
Jani Nikula, Intel
