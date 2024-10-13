Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B996CF2576
	for <intel-xe@archiver.kernel.org>; Sun, 13 Oct 2024 12:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DABE10E180;
	Sun, 13 Oct 2024 12:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhmgtMGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8D210E180
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Oct 2024 12:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728823596; x=1760359596;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FxXKOjFuV400Dtnr+kQZlip7sTGhe2w+L8R7A0c4gHc=;
 b=mhmgtMGsDaUHQ/LP0KNo0cSZCngn63p7onc83YtyJgGxTr3XrT8xRefm
 W6IambED8Mt7uvcPNSqcLhqP5jEjFgzR/5TkyOq/xy9QDc1UC1ChWMRed
 IMBFyTAdv8EpegHTrjq9LmUaH6h0jU8iLTcm23RAOGV7Z9jC4gK2P/HpT
 UUkKrRjLLcLpZCI7+4wdwRO2krpEV+tkDY/if+wWPTVN/lEP9MLzDy1Zu
 W3iWlB89gGrlGbvYjCkhKauXgukVl/qhhC5soC3Ab9/zV9em6eugd+T/w
 nuhOuMRZchi9Oi8DnXi37KiKgzoF9irNq6jNY8lgq9AJuqZbH8V8ast+s g==;
X-CSE-ConnectionGUID: Qa9AvTlLTL+BhV1PYYy8xw==
X-CSE-MsgGUID: o6NNjfYyQB2TCDmsIx37sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="38811157"
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; d="scan'208";a="38811157"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 05:46:35 -0700
X-CSE-ConnectionGUID: +RhWqTjrT36u970P31d/wQ==
X-CSE-MsgGUID: S8gT/gjWSnOWvVvnjeXwWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; d="scan'208";a="76952255"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 13 Oct 2024 05:46:34 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id AF05D28763;
 Sun, 13 Oct 2024 13:46:32 +0100 (IST)
Message-ID: <a4dd5112-1bbe-41e5-aee7-52addfc7d9c1@intel.com>
Date: Sun, 13 Oct 2024 14:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Log unreliable MMIO reads during forcewake
To: Matthew Brost <matthew.brost@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, Alex Zuo <alex.zuo@intel.com>
References: <20241012033445.1090373-1-shuicheng.lin@intel.com>
 <ZwoEbQAQolLNLbeq@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZwoEbQAQolLNLbeq@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 12.10.2024 07:09, Matthew Brost wrote:
> On Sat, Oct 12, 2024 at 03:34:45AM +0000, Shuicheng Lin wrote:
>> In some cases, when the driver attempts to read an MMIO register,
>> the hardware may return 0xFFFFFFFF. The current force wake path
>> code treats this as a valid response, as it only checks the BIT.
>> However, 0xFFFFFFFF should be considered an invalid value, indicating
>> a potential issue. To address this, we should add a log entry to
>> highlight this condition.
>>
>> Suggested-by: Alex Zuo <alex.zuo@intel.com>
>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_force_wake.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index a64c14757c84..46f36d05293a 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -114,6 +114,10 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>>  	ret = xe_mmio_wait32(&gt->mmio, domain->reg_ack, domain->val, wake ? domain->val : 0,
>>  			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
>>  			     &value, true);
>> +	if (value == ~0)
>> +		xe_gt_notice(gt,
>> +			     "Force wake domain %d: %s. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
>> +			     domain->id, str_wake_sleep(wake));
> 
> Set the ret value (-EIO) to kick the error to upper layers?

note that in upcoming series [1] there will be no error code returned

[1] https://patchwork.freedesktop.org/series/137982/#rev9

> 
>>  	if (ret)
> 
> Then...
> 
> if (ret)
> 	...
> else if (value == ~0)
> 	...
> 	ret = -EIO;
> 
> Matt
> 
>>  		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
>>  			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
>> -- 
>> 2.25.1
>>

