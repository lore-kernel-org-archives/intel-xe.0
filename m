Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2877CC88E75
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 04:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5A910F172;
	Fri, 18 Sep 2026 04:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqe7z2Gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315CC10F172
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 04:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789705923; x=1821241923;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=yKNkaVuQuiN15twj6pssjee3zsIqo8JqPh4gcIg6rbg=;
 b=bqe7z2GpFgmkShtupe2qAP5ECjO9RrZXdjwZtpczbq4gKzhpPYKNmMfq
 nKNzcblQHqKuYlaHCi7oRFI9Q6sl3aFrg2oEk6JouQFM7GmJjGzoDlY7r
 zqdmOLvuH/fFJiNWAxjY7lXx2vR81Bds3OyZGbZyvP02ckiQsp9noIE2F
 pIkctRnRxHn/fUj1MCkhSATgacj4zGzdsoWNCbfU7MjF2SF+ag8yJpo+A
 +o77vb+KzBdStTrmtBjyO89xXJIX2PW4fpKRdeEIQ72ZwK/nEdMFm++Gd
 vDFaRWzYbBX8Gu08AUsm58EM/8/CQUuZtUmDUu9naLp5UUdrLvKcaPNbk A==;
X-CSE-ConnectionGUID: nvP+f0Y4Sh6NjEGPfm6SgQ==
X-CSE-MsgGUID: F+gm6G/oQlK1XORxEfedQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100848662"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100848662"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 21:32:03 -0700
X-CSE-ConnectionGUID: Z+zrooR1TpiMdcObTeAfQQ==
X-CSE-MsgGUID: ntBsj5hsQD6nTCbFSgeZHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="279426278"
Received: from unknown (HELO [10.66.117.203]) ([10.66.117.203])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 21:32:01 -0700
Message-ID: <a4fe2692-700d-4a88-ba1d-6806e6ea4b12@Intel.com>
Date: Fri, 18 Sep 2026 10:01:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] drm/xe/pat: Return error from
 xe_pat_init_early() on unknown platform
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-9-dnyaneshwar.bhadane@intel.com>
 <0425ad1e-6ed9-4fa0-a768-c5d0871b1bb8@intel.com>
Content-Language: en-US
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Organization: intel
In-Reply-To: <0425ad1e-6ed9-4fa0-a768-c5d0871b1bb8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 09-Sep-26 12:07 AM, Michal Wajdeczko wrote:
> 
> 
> On 9/8/2026 12:45 PM, Dnyaneshwar Bhadane wrote:
>> xe_pat_init_early() currently only logs an error when the platform's
>> graphics version doesn't match any known PAT table, but continues
>> probing with an uninitialized pat.ops. This can lead to a NULL
>> pointer dereference later when pat.ops is used.
>>
>> Change xe_pat_init_early() to return an int and propagate -ENODATA
>> to xe_device_probe() so the driver fails to load cleanly instead of
>> continuing in a broken state.
>>
> 
> Fixes: ??
Hi, For the missing pat we should not process the further as we need 
proper IP specific xe->pat.ops assigned before moving from this 
function. so early exit from the driver probe would limit the pat->ops 
null pointer in xe_pat_init access.?
> 
>> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c |  4 +++-
>>   drivers/gpu/drm/xe/xe_pat.c    | 14 +++++---------
>>   drivers/gpu/drm/xe/xe_pat.h    |  2 +-
>>   3 files changed, 9 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 8583b2e9ecf4..b7f78d45dee1 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -960,7 +960,9 @@ int xe_device_probe(struct xe_device *xe)
>>   	int err;
>>   	u8 id;
>>   
>> -	xe_pat_init_early(xe);
>> +	err = xe_pat_init_early(xe);
>> +	if (err)
>> +		return err;
>>   
>>   	err = xe_sriov_init(xe);
>>   	if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index a5fe1beec652..8af92e3c4c17 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -590,7 +590,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>>   	.entry_dump = xe3p_xpc_pat_entry_dump,
>>   };
>>   
> 
> now it's time to add kernel-doc
Yes, I will add this in document.>> -void xe_pat_init_early(struct 
xe_device *xe)
>> +int xe_pat_init_early(struct xe_device *xe)
>>   {
>>   	xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
>>   	xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
>> @@ -678,22 +678,18 @@ void xe_pat_init_early(struct xe_device *xe)
>>   		xe->pat.idx[XE_CACHE_WT] = 2;
>>   		xe->pat.idx[XE_CACHE_WB] = 0;
>>   	} else {
>> -		/*
>> -		 * Going forward we expect to need new PAT settings for most
>> -		 * new platforms; failure to provide a new table can easily
>> -		 * lead to subtle, hard-to-debug problems.  If none of the
>> -		 * conditions above match the platform we're running on we'll
>> -		 * raise an error rather than trying to silently inherit the
>> -		 * most recent platform's behavior.
>> -		 */
> 
> can't we leave this comment as-is?
Noted. Thank you Michal

Dnyaneshwar, >
>>   		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
>>   			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>> +		return -ENODATA;
>> +
>>   	}
>>   
>> +	xe_assert(xe, xe->pat.ops);
>>   	xe_assert(xe, xe->pat.ops->dump);
>>   	xe_assert(xe, xe->pat.ops->program_graphics);
>>   	xe_assert(xe, MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
>>   	xe_assert(xe, GRAPHICS_VER(xe) < 20 || xe->pat.ops->entry_dump);
>> +	return 0;
>>   }
>>   
>>   void xe_pat_init(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index 7060f66e1d63..66e335fb3b0c 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -43,7 +43,7 @@ struct xe_pat_table_entry {
>>    * xe_pat_init_early - SW initialization, setting up data based on device
>>    * @xe: xe device
>>    */
>> -void xe_pat_init_early(struct xe_device *xe);
>> +int xe_pat_init_early(struct xe_device *xe);
>>   
>>   /**
>>    * xe_pat_init - Program HW PAT table
> 

