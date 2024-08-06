Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC87C49EA1
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 21:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1226210E0AE;
	Tue,  6 Aug 2024 21:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOqBCbuZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD9710E0AE
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 21:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722980754; x=1754516754;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tj2ZC5GGygPN62959JtfSrp1Ipd4lzE710UYdQhmbP4=;
 b=kOqBCbuZLJ27G+T5Whjogd/mmJ/L/TYxecqTUeVade7BCnzNK2ZeUZnw
 JST6UVYxYMgltJHNRnKtb0lmnW7QtVW0nTbgaCxAGqjMCD0tdg8HB6HQ0
 o4v3jjB+sjGAPR/X1Y0ILpsJvGglMg+9nSC5Xbej20JjbtcTyFX2/lyuE
 NeRKxTm6YZiJGyzZsZTk1uRyV6KrwsyQXMe/D/gdq92JUiX4RhLBT7SLF
 mGZ1i62GxXwe7cHnIP7gOltEPiDnR2u8oyqiXSSeawOFy+kSQE6FxMMvO
 m9rbIqyP40PTTNwI7BhCLAKF69QfWWpM72eI/mwpxMJkrjCE74gK42NQI Q==;
X-CSE-ConnectionGUID: zfiYHMwGS7GKQkybmyOX8w==
X-CSE-MsgGUID: nJXt8raJQCqqElclq42b3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="38480417"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="38480417"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 14:45:53 -0700
X-CSE-ConnectionGUID: eN4pvwBER0+rnTsHx1ZXXw==
X-CSE-MsgGUID: Tw6z6tvjTXGxHo+B4NK5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="87583725"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 06 Aug 2024 14:45:51 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 84EE02FC5F;
 Tue,  6 Aug 2024 22:45:50 +0100 (IST)
Message-ID: <67783dc0-6e81-4e6b-923b-5012c212176d@intel.com>
Date: Tue, 6 Aug 2024 23:45:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240806194510.13044-1-nirmoy.das@intel.com>
 <2a369a01-a793-424f-8e14-7776462f213b@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <2a369a01-a793-424f-8e14-7776462f213b@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 06.08.2024 22:08, Nirmoy Das wrote:
> Looks like send this bit prematurely:
> 
> On 8/6/2024 9:45 PM, Nirmoy Das wrote:
>> Add skeleton APIs for recording and printing various stats over
>> debugfs. This currently only added counter types stats which is backed
>> by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
>> on production system.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++++++
>>   drivers/gpu/drm/xe/Makefile        |  2 ++
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 ++++
>>   drivers/gpu/drm/xe/xe_gt_stats.c   | 30 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_stats.h   | 31 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_types.h   |  7 +++++++
>>   6 files changed, 85 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug
>> b/drivers/gpu/drm/xe/Kconfig.debug
>> index bc177368af6c..4db6d707c1af 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
>>          Recomended for driver developers only.
>>        If in doubt, say "N".
>> +
>> +config DRM_XE_STATS
>> +    bool "Enable XE statistics"
>> +    default n
>> +    help
>> +      Choose this option to enable support for collecting and
>> +      displaying XE statistics as debugfs.
>> +
>> +      Recommended for driver developers only.
>> +
>> +      If in doubt, say "N".
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1ff9602a52f6..b0bbb248f644 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
>>       xe_pci_sriov.o \
>>       xe_sriov_pf.o
>>   +xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
>> +
>>   # include helpers for tests even when XE is built-in
>>   ifdef CONFIG_DRM_XE_KUNIT_TEST
>>   xe-y += tests/xe_kunit_helpers.o
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 5e7fd937917a..3765c04919dc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -17,6 +17,7 @@
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_sriov_pf_debugfs.h"
>>   #include "xe_gt_sriov_vf_debugfs.h"
>> +#include "xe_gt_stats.h"
>>   #include "xe_gt_topology.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_lrc.h"
>> @@ -286,6 +287,9 @@ static const struct drm_info_list debugfs_list[] = {
>>       {"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data =
>> bcs_default_lrc},
>>       {"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data =
>> vcs_default_lrc},
>>       {"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data =
>> vecs_default_lrc},
>> +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>> +    {"stats", .show = xe_gt_debugfs_simple_show, .data =
>> xe_gt_stats_print_info},
>> +#endif
>>   };
>>     void xe_gt_debugfs_register(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c
>> b/drivers/gpu/drm/xe/xe_gt_stats.c
>> new file mode 100644
>> index 000000000000..cc69d748e8f6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>> @@ -0,0 +1,30 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <linux/atomic.h>
>> +
>> +#include "xe_gt.h"
>> +#include "xe_gt_stats.h"
>> +
>> +#ifdef CONFIG_DRM_XE_STATS

doc is also missing here

>> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats id,
>> int incr)
>> +{

what if id = STATS_NUM ?

>> +    atomic_add(incr, &gt->stats.counters[id]);
>> +}
>> +
>> +static const char *const stat_description[] = {
>> +};
>> +

and here

>> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +    enum xe_gt_counter_stats id;
>> +
>> +    for (id = 0; id < XE_GT_COUNTER_STATS_NUM; ++id)
>> +        drm_printf(p, "%s: %d\n", stat_description[id],
>> +               atomic_read(&gt->stats.counters[id]));
>> +
>> +    return 0;
>> +}
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h
>> b/drivers/gpu/drm/xe/xe_gt_stats.h
>> new file mode 100644
>> index 000000000000..e83155ab1fdb
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_STATS_H_
>> +#define _XE_GT_STATS_H_
>> +
>> +#include <drm/drm_print.h>
>> +
>> +struct xe_gt;
>> +//struct drm_printer;
> 
> Forgot to remove this.

actually this forward decl should stay (instead of the full #include above)

> 
> 
>> +
>> +enum xe_gt_counter_stats {

nit: this file is "xe_gt_stats" so type name should follow it:

	enum xe_gt_stats_id {

same with enumerator names:

	XE_GT_STATS_ID_TLB_INVAL,

>> +    XE_GT_COUNTER_STATS_NUM,

hmm, if you really want to count stat ids using this last enumerator
then make sure that functions that accepts such enum will not accept
this NUM as index and maybe name it slightly differently than regular IDs:

	__XE_GT_STATS_NUM_IDS,


>> +};
>> +
>> +#ifdef CONFIG_DRM_XE_STATS
>> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
>> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats
>> stat, int incr);
>> +#else
>> +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +}
>> +
>> +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_counter_stats
>> stat, int incr)
>> +{
>> +}
>> +
>> +#endif /* CONFIG_DRM_XE_STATS */
>> +#endif /* _XE_GT_STATS_H_ */

IIRC we don't use comments on closing guards

>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 631928258d71..0ded57b56628 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt_idle_types.h"
>>   #include "xe_gt_sriov_pf_types.h"
>>   #include "xe_gt_sriov_vf_types.h"
>> +#include "xe_gt_stats.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_oa.h"
>> @@ -133,6 +134,12 @@ struct xe_gt {
>>           u8 has_indirect_ring_state:1;
>>       } info;
>>   +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>> +    struct {
>> +        atomic_t counters[XE_GT_COUNTER_STATS_NUM];
>> +    } stats;
>> +#endif
> 
> I forgot to  add doc here. I will wait for reviews and resend with docs.
> 
> 
> Regards,
> 
> Nirmoy
> 
>> +
>>       /**
>>        * @mmio: mmio info for GT.  All GTs within a tile share the same
>>        * register space, but have their own copy of GSI registers at a
