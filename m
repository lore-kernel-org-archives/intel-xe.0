Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B062C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 17:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DB610EB57;
	Mon, 22 Apr 2024 17:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzwJzlVI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FEA10EB57
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713806673; x=1745342673;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PqpA+HzYLNm31UMN8LiBLK8nVGPthLb8cDMShWwbr7E=;
 b=SzwJzlVID/tUx0Khg/Nxk/m9mpNtoIRf8RR2xyGgx1rmw4+6W/nMBJRB
 cheKvm+FLIHqMaWSruCMftkReWTduWudrICMsGgMfmrgIZJ3ib92xcOkE
 Wcoz/D7nq7YVOf7+RPFMAnJXIGoa3Z+aRR8pjm8cqldkGF9vTZqcUzIM0
 EqcEWmScQ2bRTISAn8M+PmSjV4Y1R/VcweESc7WSjrRkx3otdFbVt2kBz
 N8/lD4Ou5vOgTO00OXxrg1rPJEYamsjwDbYKMrpt9hmUuQoI8CNHvNa/1
 GfDRXu1m48pbCamoZZYmKBhwjMjhsEiSa7opRRctqDKspkBjG/XZnK+Ba Q==;
X-CSE-ConnectionGUID: aJA6ABNOQV6P2FlJPcr1fQ==
X-CSE-MsgGUID: 8Y8AyP4kRX2R4kbedyHDqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="12297332"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="12297332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 10:24:32 -0700
X-CSE-ConnectionGUID: jQvbw2iHQ4CFowjqHvoMsw==
X-CSE-MsgGUID: GPsTyZQNRUmqlbZirLCf8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24141003"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 22 Apr 2024 10:24:31 -0700
Received: from [10.252.63.74] (mwajdecz-MOBL.ger.corp.intel.com [10.252.63.74])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2BD182877B;
 Mon, 22 Apr 2024 18:24:25 +0100 (IST)
Message-ID: <92380b51-2c09-4000-aad2-f1a463c16ee0@intel.com>
Date: Mon, 22 Apr 2024 19:24:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pf: Expose SR-IOV policy settings over debugfs
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240418203442.226-1-michal.wajdeczko@intel.com>
 <20240418203442.226-4-michal.wajdeczko@intel.com>
 <20240422170219.6jbgcvfjcfvt5tlw@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240422170219.6jbgcvfjcfvt5tlw@intel.com>
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



On 22.04.2024 19:02, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-18 22:34:42 +0200]:
>> We already have functions to configure SR-IOV policies.
>> Allow to tweak those policy settings over debugfs.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 50 +++++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index 8909bb950a8b..3a83af7aa039 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -17,6 +17,7 @@
>>  #include "xe_gt_sriov_pf_control.h"
>>  #include "xe_gt_sriov_pf_debugfs.h"
>>  #include "xe_gt_sriov_pf_helpers.h"
>> +#include "xe_gt_sriov_pf_policy.h"
>>  #include "xe_pm.h"
>>  
>>  /*
>> @@ -76,6 +77,54 @@ static const struct drm_info_list pf_info[] = {
>>  	},
>>  };
>>  
>> +/*
>> + *      /sys/kernel/debug/dri/0/
>> + *      ├── gt0
>> + *      │   ├── pf
>> + *      │   │   ├── reset_engine
>> + *      │   │   ├── sample_period
>> + *      │   │   ├── sched_if_idle
>> + */
>> +
>> +#define DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(POLICY, TYPE, FORMAT)		\
>> +			
> The same as I wrote in e earlier patch, only here also TYPE seems unnecessary.
> What's the point of creating a macro with parameters you don't use?
> \

as explained earlier, FORMAT parameter allows flexibility as provided by
DEFINE_DEBUGFS_ATTRIBUTE

for TYPE, I clearly missed to add code to reject out of range input
values, will try to fix in v2

>> +static int POLICY##_set(void *data, u64 val)					\
>> +{										\
>> +	struct xe_gt *gt = extract_gt(data);					\
>> +	struct xe_device *xe = gt_to_xe(gt);					\
>> +	int err;								\
>> +										\
>> +	xe_pm_runtime_get(xe);							\
>> +	err = xe_gt_sriov_pf_policy_set_##POLICY(gt, val);			\
>> +	xe_pm_runtime_put(xe);							\
>> +										\
>> +	return err;								\
>> +}										\
>> +										\
>> +static int POLICY##_get(void *data, u64 *val)					\
>> +{										\
>> +	struct xe_gt *gt = extract_gt(data);					\
>> +										\
>> +	*val = xe_gt_sriov_pf_policy_get_##POLICY(gt);				\
>> +	return 0;								\
>> +}										\
>> +										\
>> +DEFINE_DEBUGFS_ATTRIBUTE(POLICY##_fops, POLICY##_get, POLICY##_set, FORMAT)
>> +
>> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(reset_engine, bool, "%llu\n");
>> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sched_if_idle, bool, "%llu\n");
>> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sample_period, u32, "%llu\n");
>> +
>> +static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>> +{
>> +	xe_gt_assert(gt, gt == extract_gt(parent));
>> +	xe_gt_assert(gt, PFID == extract_vfid(parent));
>> +
>> +	debugfs_create_file_unsafe("reset_engine", 0644, parent, parent, &reset_engine_fops);
>> +	debugfs_create_file_unsafe("sched_if_idle", 0644, parent, parent, &sched_if_idle_fops);
>> +	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
>> +}
>> +
>>  /*
>>   *      /sys/kernel/debug/dri/0/
>>   *      ├── gt0
>> @@ -261,6 +310,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>>  	pfdentry->d_inode->i_private = gt;
>>  
>>  	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
>> +	pf_add_policy_attrs(gt, pfdentry);
>>  	pf_add_config_attrs(gt, pfdentry, PFID);
>>  
>>  	for (n = 1; n <= totalvfs; n++) {
>> -- 
>> 2.43.0
> 
> One comment above. 
> Overall the functionality is ok:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Thanks,

> 
>>
> 
