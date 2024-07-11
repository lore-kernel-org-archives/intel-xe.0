Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89301C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AE710EB8E;
	Thu, 11 Jul 2024 20:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bA3qtP9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA2A10EB8E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 20:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720729271; x=1752265271;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Nlve4KKLFmiSS0oz51NC8qNKXkpqZ97hAfOayb4Lxxo=;
 b=bA3qtP9VTKY+4iSs7Z42o4ilUi3lvGDcYYCTddiXQp7tsENpajZgLy8t
 87TIHcPNcKuUk2Q6w+mYl3x6Gdzy5CMrbAiIT2Lon1RjDg0ZXp5QClrtC
 07hgr6bD5Qr3j/w58jNKGW3uXXjjO535y43xPrgoFKXoUCpLUZC51GuAu
 AEDd1YaIbflILgnPMn7G9k6CkLgNuBRM7UWTbuRK213I1D3ppLmzOLaGv
 GRviCSRiabsJYixMIwSQd8EoSnvOKYu+jOecTu0MvbVGnu29ALUzgLOm7
 eBx70jUEmZImkB9HalkOE8kYiN/88VKzb4OUUwIXo59HClQuGxJdl2qV9 A==;
X-CSE-ConnectionGUID: AIdE+rPdQfS3j1mCg0aCwA==
X-CSE-MsgGUID: MccQFV0QTia8OTT7RWGSjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17761674"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="17761674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:21:10 -0700
X-CSE-ConnectionGUID: NOcnY9TxSyuM5NrJQB/Z3A==
X-CSE-MsgGUID: Ka78Sy9MS4mfJmjoSIbsJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48420901"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2024 13:21:09 -0700
Received: from [10.246.49.75] (mwajdecz-MOBL.ger.corp.intel.com [10.246.49.75])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4B5FF2879A;
 Thu, 11 Jul 2024 21:21:08 +0100 (IST)
Message-ID: <cba1695f-d537-47d7-aa7e-20c112c83846@intel.com>
Date: Thu, 11 Jul 2024 22:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/pf: Limit fair VF LMEM provisioning
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240711192320.1198-1-michal.wajdeczko@intel.com>
 <20240711192320.1198-2-michal.wajdeczko@intel.com>
 <CH0PR11MB54440F4C13371762AF17DAB1E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB54440F4C13371762AF17DAB1E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 11.07.2024 22:02, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Thursday, July 11, 2024 12:23 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH 1/2] drm/xe/pf: Limit fair VF LMEM provisioning
>>
>> Due to the current design of the BO and VRAM manager, any object
>> with XE_BO_FLAG_PINNED flag, which the PF driver uses during VF
>> LMEM provisionining, is created with the TTM_PL_FLAG_CONTIGUOUS
>> flag, which may cause VRAM fragmentation that prevents subsequent
>> allocations of larger objects, like fair VF LMEM provisioning.
>>
>> To avoid such failures, round down fair VF LMEM provisioning size
>> to next power of two size, to compensate what xe_ttm_vram_mgr is
>> doing to achieve contiguous allocations.
>>
>> Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index db6c213da847..4699b7836001 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -1543,6 +1543,7 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
>>  	u64 fair;
>>  
>>  	fair = div_u64(available, num_vfs);
>> +	fair = rounddown_pow_of_two(fair);	/* XXX: ttm_vram_mgr & drm_buddy limitation */
>>  	fair = ALIGN_DOWN(fair, alignment);
> 
> If the alignment is also a power of two, then ALIGN_DOWN here probably
> isn't necessary.  But I won't block on it because I'm probably just
> misunderstanding something.

true, it's redundant, but I didn't want to remove it since this new
rounddown_pow_of_two() is (I hope) temporary and I don't want to
accidentally miss mandatory HW requirement

> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt

thanks!

> 
>>  #ifdef MAX_FAIR_LMEM
>>  	fair = min_t(u64, MAX_FAIR_LMEM, fair);
>> -- 
>> 2.43.0
>>
>>
