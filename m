Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60721C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F90310EB27;
	Tue,  8 Sep 2026 10:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOtBC/h0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E6410EB27
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788863417; x=1820399417;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q8vpD/6LwkdE2OVZkIvL/egtg7LxoE0ASGVwAKLp7yY=;
 b=NOtBC/h0ZGGP++DkzbCsoCiTmXpty1j9m+FTERQ/DMG10tZ5//4ZpJzQ
 vY6VfL9mlhAIG/olKtkX2Arx0p5lzPxxNIIV1KWh+Ex2dd38VmStTTeQy
 jM+Sb9ifDn/GrhcyexBpeEYBR0in52/Eq/l1NkQDtyLfUr6bwbkPEAFvz
 UD+Pn3e81pGYk0V3KH+V96dW4f8+FD2LZKALGb3J8s+p2qv7P0kFCkS/p
 mXiORNz+wLj5Ll0WDnPbItxoy0A8RrfeX32QkNeCwK6x8uvHJYVpCm6RF
 6J9PaygzWqoYbs9ZE3my/YRDKTApBAyBvjSE16kVAAEUvNGERtdn7Z9Ng w==;
X-CSE-ConnectionGUID: yw3uHllxTlyVJvp6DwvB/A==
X-CSE-MsgGUID: fbnvf/uaSRyVBgshyu3yzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76821355"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="76821355"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:30:16 -0700
X-CSE-ConnectionGUID: XvrxfD5xSD22H9PoFyteAA==
X-CSE-MsgGUID: t0lL7RmKR0yLThpClQy7Qg==
X-ExtLoop1: 1
Received: from unknown (HELO [10.66.117.203]) ([10.66.117.203])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:30:15 -0700
Message-ID: <a5288243-d260-4b01-bea9-35a96a6f76b5@Intel.com>
Date: Tue, 8 Sep 2026 16:00:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/xe/reg_sr: Report save-restore errors using
 structured xe_log API
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-8-dnyaneshwar.bhadane@intel.com>
 <fa2e96f7-1190-4018-a62e-d717269f01ed@intel.com>
Content-Language: en-US
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Organization: intel
In-Reply-To: <fa2e96f7-1190-4018-a62e-d717269f01ed@intel.com>
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



On 26-Aug-26 6:03 PM, Mallesh, Koujalagi wrote:
> 
> On 20-08-2026 12:44 am, Dnyaneshwar Bhadane wrote:
>> Replace xe_gt_notice() and xe_gt_err() calls with xe_log_info() and
>> xe_log_err() using the REGS component tag for register save-restore
>> operations:
>>
>>    - MCR register mismatch corrections
>>    - Failed to add register to save-restore list
>>    - Force-wake timeout during SR apply
>>
>> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_reg_sr.c | 22 +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index e328f5072557..c3ea0acd91b6 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -21,6 +21,7 @@
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_types.h"
>>   #include "xe_hw_engine_types.h"
>> +#include "xe_log.h"
>>   #include "xe_lrc.h"
>>   #include "xe_mmio.h"
>>   #include "xe_rtp_types.h" @@ -87,15 +88,15 @@ static struct xe_reg sanitize_mcr(struct 
>> xe_reg_sr *sr, if (is_mcr && !reg.mcr) { reg.mcr = 1; - xe_gt_notice(gt, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
>> -			     reg.addr);
>> +		xe_log_info(gt, REGS, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
>> +			    reg.addr);
>>   		reg_sr_inc_error(sr);
>>   	}
>>   
>>   	if (!is_mcr && reg.mcr) {
>>   		reg.mcr = 0;
>> -		xe_gt_notice(gt, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
>> -			     reg.addr);
>> +		xe_log_info(gt, REGS, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
>> +			    reg.addr);
>>   		reg_sr_inc_error(sr);
>>   	}
>>   
>> @@ -143,12 +144,11 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>>   fail_free:
>>   	kfree(pentry);
>>   fail:
>> -	xe_gt_err(gt,
>> -		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
>> -		  idx, e->clr_bits, e->set_bits,
>> -		  str_yes_no(e->reg.masked),
>> -		  str_yes_no(e->reg.mcr),
>> -		  ret);
>> +	xe_log_err(gt, REGS, ret,
> hmm, if Memory allocation failed, REGS TAG is right one?
since failure seen during the xe_reg_sr_add() most nearest failure would 
be the REGS ?.
>> +		   "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s)\n",
>> +		   idx, e->clr_bits, e->set_bits,
>> +		   str_yes_no(e->reg.masked),
>> +		   str_yes_no(e->reg.mcr));
>>   	reg_sr_inc_error(sr);
>>   
>>   	return ret;
>> @@ -219,7 +219,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>>   
>>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
>> -		xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
>> +		xe_log_err(gt, REGS, -ETIMEDOUT, "Failed to apply, err=-ETIMEDOUT\n");
> 
> drop "err=-ETIMEDOUT "
> 
Yes, Dropping this error log part. > Thanks,
> 
> -/Mallesh
> 
>>   		return;
>>   	}
>>   

