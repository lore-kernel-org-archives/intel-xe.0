Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0B0D68BDC
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 23:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7611410E1E1;
	Fri, 15 Nov 2024 23:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDcQ2y8G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D6910E1E1
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 23:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731714577; x=1763250577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZP8NweOjvfAWINE9u/CInaRFeYzLaBFj4eDOCBab1LI=;
 b=aDcQ2y8GkiJTFbEsjT2mFFTJFmPKuB4zfkkapFQ6CMhMqJhpWsG4BV3z
 vAXuurndDkteUxcWzjd0B70sLAUHiowo8pHvnFkmGNIt0F/RmyDcTwIIe
 KtOrN+tiPLuoBAyAb1uiKpuFUgzuMJv6maCtdS7mYKBg2AuTw41nhyN6n
 vpih6tmW4sXrlk8M6qXyIzhzyQKZCEz5e4kk5AegpzlpiHNmTSzVhucH/
 JkPYHYi5wjdZijFRUxOq6SRaNDDL1cvhqXkskL/uWEHwRzS8sYg7avN0P
 XXzgudZSKXrVnAN6hrZbuH0OAasvEHTaTeULtsKTptfgQzNtNWNvUZ/lN A==;
X-CSE-ConnectionGUID: t5tol+3oSRmMVHpZGG5EKw==
X-CSE-MsgGUID: Lhlq47pbSMuy/g5lVhrX8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31125603"
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="31125603"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 15:49:36 -0800
X-CSE-ConnectionGUID: obU7IY6LQgGuXa/NXinahg==
X-CSE-MsgGUID: Fj7hG/MrRIKSYlKo/AugDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="119639676"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.165])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 15:49:36 -0800
Date: Fri, 15 Nov 2024 17:49:25 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Split xe_gt_stat.h
Message-ID: <k2t2gjroww5mzo6lkcgc4vo5bmtd4fwknuggjx45cebxv6j6rm@cq2y7rvknevw>
References: <20241114152148.572447-1-lucas.demarchi@intel.com>
 <20241114152148.572447-5-lucas.demarchi@intel.com>
 <ZzY17YU-YLGxh_Ia@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzY17YU-YLGxh_Ia@intel.com>
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

On Thu, Nov 14, 2024 at 12:39:57PM -0500, Rodrigo Vivi wrote:
>On Thu, Nov 14, 2024 at 07:21:48AM -0800, Lucas De Marchi wrote:
>> Follow what's done for the other headers, with the types split into a
>> separate header that can be included by other *_types.h headers.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_stats.h       |  8 ++------
>>  drivers/gpu/drm/xe/xe_gt_stats_types.h | 15 +++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_types.h       |  2 +-
>>  3 files changed, 18 insertions(+), 7 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_stats_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
>> index 91d944f6c4e43..38325ef536176 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_stats.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
>> @@ -6,15 +6,11 @@
>>  #ifndef _XE_GT_STATS_H_
>>  #define _XE_GT_STATS_H_
>>
>> +#include "xe_gt_stats_types.h"
>> +
>>  struct xe_gt;
>>  struct drm_printer;
>>
>> -enum xe_gt_stats_id {
>> -	XE_GT_STATS_ID_TLB_INVAL,
>> -	/* must be the last entry */
>> -	__XE_GT_STATS_NUM_IDS,
>
>would deserve a doc while moving it here?

it wouldn't show up in the html output unless we also linked it
somewhere in the Documentation/  side. I prefer to do that on top.

>anyway,
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

thanks
Lucas De Marchi

>
>> -};
>> -
>>  #ifdef CONFIG_DEBUG_FS
>>  int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
>>  void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
>> new file mode 100644
>> index 0000000000000..2fc055e39f273
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_STATS_TYPES_H_
>> +#define _XE_GT_STATS_TYPES_H_
>> +
>> +enum xe_gt_stats_id {
>> +	XE_GT_STATS_ID_TLB_INVAL,
>> +	/* must be the last entry */
>> +	__XE_GT_STATS_NUM_IDS,
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 20901c01ba29a..6e66bf0e8b3f7 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -11,7 +11,7 @@
>>  #include "xe_gt_idle_types.h"
>>  #include "xe_gt_sriov_pf_types.h"
>>  #include "xe_gt_sriov_vf_types.h"
>> -#include "xe_gt_stats.h"
>> +#include "xe_gt_stats_types.h"
>>  #include "xe_hw_engine_types.h"
>>  #include "xe_hw_fence_types.h"
>>  #include "xe_oa_types.h"
>> --
>> 2.47.0
>>
