Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E49C77B75
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 11:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF6F10E2E0;
	Mon, 22 May 2023 11:39:37 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737F710E2E0
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 11:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684755575; x=1716291575;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DUCiMefm/rkc5Jr6mnCjaooq1cmlQB+FqiYZaV+8clc=;
 b=OlIBPiTIxA0YpSP4P6EIUbQ/18wQy+uzrbECUhcmHGuxVEVZOykNnZ0D
 QyyM7UetNPfY/cW2U6iFNgkx5wG0ALMm6G69aaTrdRlugvU9moAfcTamM
 l8EqWTx89bdr1dwDJo6ZJK6kb+Gqqx4mqdpo7PLsAzggWMXmybW2MZQG4
 rFqToV/dU2KucXq20DITHXveShJjT4JhgIkrMY8PUXFtPkTttZ5w3q0Hl
 pnLOlHidDr1DNWPX8ZlIaWJQEnroIuZdrjasL1Nmvh8AEn6U2xvGDIy4P
 I86CivC+91oEsQveotfOiqvTXBU/AQHnAEEVTZIjTQq3Guhl0qOKYxCwl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="332506999"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="332506999"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="734256932"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="734256932"
Received: from amigon-mobl.ger.corp.intel.com (HELO [10.249.128.230])
 ([10.249.128.230])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:39:33 -0700
Message-ID: <bd8edff9-9892-d118-f1c8-2e88ca27c375@intel.com>
Date: Mon, 22 May 2023 12:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-GB
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>, intel-xe@lists.freedesktop.org
References: <20230522110133.25968-1-matthew.auld@intel.com>
 <90a44499-610f-1efc-9154-855bd22aed73@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <90a44499-610f-1efc-9154-855bd22aed73@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix kernel-doc issues
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 22/05/2023 12:07, Das, Nirmoy wrote:
> 
> On 5/22/2023 1:01 PM, Matthew Auld wrote:
>> drivers/gpu/drm/xe/xe_guc_submit_types.h:47: warning: cannot understand
>> function prototype: 'struct guc_submit_parallel_scratch '
>>
>> drivers/gpu/drm/xe/xe_devcoredump_types.h:38: warning: Function
>> parameter or member 'ct' not described in 'xe_devcoredump_snapshot'
>>
>> CI doesn't appear to be running BAT anymore, assuming this is caused by
>> the CI.Hooks now failing due to above warnings.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Thanks. Looks like CI is now reporting BAT results again with this.

>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 +-
>>   drivers/gpu/drm/xe/xe_guc_submit_types.h  | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h 
>> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> index 350b905d1797..c0d711eb6ab3 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> @@ -27,7 +27,7 @@ struct xe_devcoredump_snapshot {
>>       ktime_t boot_time;
>>       /* GuC snapshots */
>> -    /** @ct_snapshot: GuC CT snapshot */
>> +    /** @ct: GuC CT snapshot */
>>       struct xe_guc_ct_snapshot *ct;
>>       /** @ge: Guc Engine snapshot */
>>       struct xe_guc_submit_engine_snapshot *ge;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_submit_types.h
>> index 88e855dae056..6765b2c6eab1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
>> @@ -41,7 +41,7 @@ struct sync_semaphore {
>>   };
>>   /**
>> - * Struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
>> + * struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
>>    */
>>   struct guc_submit_parallel_scratch {
>>       /** @wq_desc: Guc scheduler workqueue descriptor */
