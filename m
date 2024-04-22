Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EA5C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 20:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DF9112D37;
	Mon, 22 Apr 2024 20:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZCqOvEn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2F2112D37
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 20:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713816352; x=1745352352;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=39e1BnWqH/yscjU3ypHeoD7QLJW4eK9UfG+g4KWEyFc=;
 b=XZCqOvEnX/T6R0+fQeWiHHBVd6UDoO40xcWFMPZ4bLVVj9GOEfIzJ007
 tXlWaPSSOgmxy9JVKZpJhCQ2JznL6bcYmBTAe0cZhKHqEwbLDv6/b1iM/
 EPRVwRTGroD9aVn1gCUwIScFHXUB/7/ei3tBqAzxo7l2rO6i5lwkptFbQ
 LopNTohvqTVmXBSJdO6HtoWigH+pCtyBWMw1Ci2OydLwn90aFKOKO9m5/
 Z8qZkT1ZFcScgTDmB1IOW2Xz8omnxaWiSocKLTxl+D1HZZ/g7llS+5Pjo
 a5F3Jjtvfw6pvllu7APl7aKHcHR7300HFYCE/fibv1ii2cuN4KgXzaIAE g==;
X-CSE-ConnectionGUID: uZKC0InLRcaehcwRL4Q0hw==
X-CSE-MsgGUID: 2tHUY6SlROGxgYsscpejNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="34773767"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="34773767"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 13:05:51 -0700
X-CSE-ConnectionGUID: TK/gYzNWT+iws3at0xgN+w==
X-CSE-MsgGUID: 3krqbg3SRuOYUv0AbLuxyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24181545"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 22 Apr 2024 13:05:50 -0700
Received: from [10.252.63.74] (mwajdecz-MOBL.ger.corp.intel.com [10.252.63.74])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9EC3F2FC47;
 Mon, 22 Apr 2024 21:05:45 +0100 (IST)
Message-ID: <3a6d8ca5-eb83-4c62-87cc-80bce1d04a4d@intel.com>
Date: Mon, 22 Apr 2024 22:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pf: Expose SR-IOV policy settings over debugfs
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240418203442.226-1-michal.wajdeczko@intel.com>
 <20240418203442.226-4-michal.wajdeczko@intel.com>
 <Zia83fbRFA7XrXFh@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Zia83fbRFA7XrXFh@intel.com>
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



On 22.04.2024 21:39, Rodrigo Vivi wrote:
> On Thu, Apr 18, 2024 at 10:34:42PM +0200, Michal Wajdeczko wrote:
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
>> +										\
>> +static int POLICY##_set(void *data, u64 val)					\
>> +{										\
>> +	struct xe_gt *gt = extract_gt(data);					\
>> +	struct xe_device *xe = gt_to_xe(gt);					\
>> +	int err;								\
>> +										\
>> +	xe_pm_runtime_get(xe);							\
>> +	err = xe_gt_sriov_pf_policy_set_##POLICY(gt, val);			\
>> +	xe_pm_runtime_put(xe);							\
> 
> I like that this takes care of the runtime_pm in a 'global' way without duplication...
> 
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
> 
> ... but, is there any other way we could accomplish this without this style
> that hides function... I hate when I have to understand anything in i915-guc
> code because you cannot navigate or grep for the functions that are declared
> with magic macros like this.

but such template macros are quite widely used (at least for sysfs)

$ cgrep ssize_t.*\\#.*show.*\\\\ | wc -l
189

and IMO it's better to have one template than replicate very similar
code N times with just one line difference

besides this are static functions, no need to grep anywhere else

> 
> but this is my only complain and no big suggestions. I would like to hear
> from the xe maintainers here.
> 
> for the debugfs entries and rpm handling and everything I like that.
> 
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
>>
