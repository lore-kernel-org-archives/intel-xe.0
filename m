Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815D9C27C53
	for <intel-xe@archiver.kernel.org>; Sat, 22 Jun 2024 09:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9BB10E034;
	Sat, 22 Jun 2024 09:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DT4XevI+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591F010E034
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Jun 2024 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719048891; x=1750584891;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1VXFzZA8jPJHc4+wZ6i6/LcVzUDSpm8nZ4gtE6FVt4I=;
 b=DT4XevI+siNl4Rh1XFX/u6xk8Jq9w/3VVff79Pd2QmeOxPx37DekM5xl
 Efvg9hcoUQeket5LmobaCd3Sr3RvXxcG06I1xtrtR+YwZ9Y+WQ+o84kgj
 iQOF9SYVTXoofQqYiMerVnEXgwVqSMZ1S8V2xAM1IJoC7qIBfrWcFKNnZ
 GsNKS+K+XLmd168iNYMvFC1wOSZF1ZC2HLb0kCLq0N/S778O0PPbbT7p3
 n1Sm906uYoSJQQdeVoxheMqo32h+fUctDZ54er2CFD/d/ndOCEnl2UQBx
 3tCmBUMVkQowMpzb/AejumjAt+bPIB2kYTnQ74vmuDEeYugO4CFbrmsZ3 w==;
X-CSE-ConnectionGUID: nJtTSCRXSoOlpg8PPEDXuQ==
X-CSE-MsgGUID: kfxemIKITJ2IHt0lOHmOVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="26673217"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; d="scan'208";a="26673217"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2024 02:34:50 -0700
X-CSE-ConnectionGUID: aaM/FF5gTnWj7pOYVqqU6w==
X-CSE-MsgGUID: Nd0nQsW7Q/6/ETk3YasGqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; d="scan'208";a="42686457"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 22 Jun 2024 02:34:48 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E776212595;
 Sat, 22 Jun 2024 10:34:46 +0100 (IST)
Message-ID: <18cd3da8-60d7-453b-8fcf-4105cdae7665@intel.com>
Date: Sat, 22 Jun 2024 11:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Skip attempt to start GuC PC if VF
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240621170002.993-1-michal.wajdeczko@intel.com>
 <96af4bbc-255e-47e2-b038-8c0d4bc21320@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <96af4bbc-255e-47e2-b038-8c0d4bc21320@intel.com>
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



On 22.06.2024 00:44, Belgaumkar, Vinay wrote:
> 
> On 6/21/2024 10:00 AM, Michal Wajdeczko wrote:
>> We have already marked the GuC PC feature as not applicable for
>> VF devices, but we missed the fact that there may be still some
>> privileged activities performed by this component, who does much
>> more than its name suggests.
>>
>> Explicitly skip xe_guc_pc_start() if running as a VF driver and
>> use a GT oriented message to report any error.
> 
> We may need to skip in the xe_guc_stop function as well..
> 
> void xe_guc_stop_prepare(struct xe_guc *guc)
> {
>         XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
> }

hmm, in xe_guc_pc_stop() we defer to gtidle if skip_guc_pc flag is set,
where we already have a VF guard, so it should be harmless, but yeah,
maybe for the completeness we should skip that call here too

Thanks

> 
> Thanks,
> 
> Vinay.
> 
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 172b65a50e31..79931466e479 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1125,10 +1125,13 @@ void xe_guc_stop(struct xe_guc *guc)
>>     int xe_guc_start(struct xe_guc *guc)
>>   {
>> -    int ret;
>> +    if (!IS_SRIOV_VF(guc_to_xe(guc))) {
>> +        int err;
>>   -    ret = xe_guc_pc_start(&guc->pc);
>> -    XE_WARN_ON(ret);
>> +        err = xe_guc_pc_start(&guc->pc);
>> +        xe_gt_WARN(guc_to_gt(guc), err, "Failed to start GuC PC: %pe\n",
>> +               ERR_PTR(err));
>> +    }
>>         return xe_guc_submit_start(guc);
>>   }
