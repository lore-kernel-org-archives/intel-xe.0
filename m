Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7923C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 08:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DA210E076;
	Tue, 15 Apr 2025 08:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuHTVFBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FCB10E076
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 08:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744706671; x=1776242671;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vL7jK3Kg3PtNLKIXEbV8qvFNdEEEujVld+MfVuLX3ME=;
 b=IuHTVFBRAmJ/F1CgFbVhgd9QbmyUEMIwNcWWq4O7verWtp2U4hDmjWPK
 vI8pnqsFNqGIIph0CFmshH1r9OxnNC4K3f1cxfM7IOnkPBmwmmloj59DV
 s3Ja7aHV/sMIXgMiSu1eMJbNiSq0BhTI1P6wEQ/DB/8jxsXrJZFdZlqWn
 Has/gD94ktBb6/drNwxSz40HZK4dbCbEtVKuTnvtbZYCFw+I/YIb7HjGd
 Z8jMkSjCsPnvvUsKje0qK/RwxCyv5LatBgxfr6unkX2pYkwxEqayR8KPs
 pQ5tpi9uniFy0Y1zVzC8CXo8rCBZNUG9m6F/+B9C2HNrsG0byrdjNXJCE A==;
X-CSE-ConnectionGUID: mNlp7ewxSJC4kfsJIatPzQ==
X-CSE-MsgGUID: fnIvhAWPQOa+1mvlwfqtLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="63745029"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="63745029"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:44:31 -0700
X-CSE-ConnectionGUID: ZodGrNgpQlCzD2X9swXENg==
X-CSE-MsgGUID: wk3X824/RaiVLuw9SknNYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135125801"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2025 01:44:30 -0700
Received: from [10.245.83.107] (unknown [10.245.83.107])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 93DA533BE4;
 Tue, 15 Apr 2025 09:44:28 +0100 (IST)
Message-ID: <2bac77f9-7b87-46a1-b4d5-27038ce17863@intel.com>
Date: Tue, 15 Apr 2025 10:44:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Fix out-of-bound while enabling engine
 activity stats
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250414202347.1909-1-michal.wajdeczko@intel.com>
 <51c2caef-23e7-4c1b-8365-6e0ff7e3d5b6@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <51c2caef-23e7-4c1b-8365-6e0ff7e3d5b6@intel.com>
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



On 15.04.2025 09:29, Riana Tauro wrote:
> Hi Michal
> 
> On 4/15/2025 1:53 AM, Michal Wajdeczko wrote:
>> In the PF mode we allocate array of struct engine_activity_group
>> that holds activity data split for the PF and all potential VFs.
>> But while preparing data for use by VFs we ended with bad index.
>>
>>   [ ] BUG: KASAN: slab-out-of-bounds in
>> xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
>>   [ ] Call Trace:
>>   [ ]  <TASK>
>>   [ ]  dump_stack_lvl+0x91/0xf0
>>   [ ]  print_report+0xd1/0x680
>>   [ ]  ? __virt_addr_valid+0x23a/0x440
>>   [ ]  ? kasan_addr_to_slab+0xd/0xb0
>>   [ ]  kasan_report+0xe7/0x130
>>   [ ]  ? xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
>>   [ ]  ? xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
>>   [ ]  __asan_report_store8_noabort+0x17/0x30
>>   [ ]  xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]
>>   [ ]  pf_engine_activity_stats+0x1b6/0x7f0 [xe]
>>   [ ]  ? kobject_put+0x5f/0x470
>>   [ ]  xe_pci_sriov_configure+0x28c9/0x3270 [xe]
>>   [ ]  ? __pfx_dev_attr_store+0x10/0x10
>>   [ ]  ? kstrtoull+0x3b/0x70
>>   [ ]  ? __pfx___lock_acquire+0x10/0x10
>>   [ ]  ? kstrtou16+0x65/0xf0
>>   [ ]  sriov_numvfs_store+0x20c/0x400
>>   [ ]  ? __pfx_sriov_numvfs_store+0x10/0x10
>>   [ ]  ? __pfx__copy_from_iter+0x10/0x10
>>   [ ]  ? __pfx_dev_attr_store+0x10/0x10
>>   [ ]  dev_attr_store+0x3b/0x80
>>   [ ]  ? sysfs_file_ops+0x135/0x190
>>
>> Fixes: 2de3f38fbf89 ("drm/xe: Add support for per-function engine
>> activity")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/
>> gpu/drm/xe/xe_guc_engine_activity.c
>> index b96fea78df8b..0fb48f8f05d8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -304,6 +304,8 @@ static void engine_activity_set_cpu_ts(struct
>> xe_guc *guc, unsigned int index)
>>       struct engine_activity_group *eag = &engine_activity->eag[index];
>>       int i, j;
>>   +    xe_gt_assert(guc_to_gt(guc), index < engine_activity-
>> >num_activity_group);
> This would happen only when num_vfs is greater than total_vfs since
> num_activity_group is total_vfs+1. enable_vfs has that check

true in general

but in this function you can't guarantee that the caller will be doing
such check or it doesn't make any mistake (like it was already done)
while passing the index

OTOH this assert just make sure that passed index fits the eag[] array

> +
>>       for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>>           for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>>               eag->engine[i][j].last_cpu_ts = ktime_get();
>> @@ -374,8 +376,9 @@ static int
>> engine_activity_enable_function_stats(struct xe_guc *guc, int num_vfs
>>           return ret;
>>       }
>>   -    for (i = 0; i < engine_activity->num_functions; i++)
>> -        engine_activity_set_cpu_ts(guc, i + 1);
>> +    /* skip PF as it was already setup */
>> +    for (i = 1; i < engine_activity->num_functions; i++)
>> +        engine_activity_set_cpu_ts(guc, i);
> sorry, missed this when removing global.
> Thanks for fixing this. Assert seems unnecessary

I would keep it as it was nicely firing without this fix
and it will be compiled-out on non-debug build, so no harm

> 
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

thanks

>
>>       return 0;
>>   }

