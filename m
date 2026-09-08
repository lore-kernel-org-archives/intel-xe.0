Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED599C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6D710EB20;
	Tue,  8 Sep 2026 10:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaZ7jpok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E263F10EB20
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788863178; x=1820399178;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xi/d+VQ6YAQqa8u5dq3oUljbhYWPw9kqpq53gj8Wq+I=;
 b=GaZ7jpoknNOjuxuESD1VEteU0BCZLcFOaheV6z5528JIPsyAjgLG0kyT
 0MJfvLjguHBzqFifxQCntiOcQFtnTGWx9lUa4hF4hXpy8OYCp8z8UdYH1
 uaLr+F+wxW81YrKkDWz/tDU06Iey5amHw9G+TKeVdrYf8//Mx8eDXLGD1
 KknBxIPqkO83NRqZK7NPC4xkQPfdqJe89+TtugTSJS/QHFhkx6Zsqp3oV
 U//sIcuR0tPI9OhpCfY+wACw5ISuTN7iraqUP7L3+g3iSS43RWY81IfxW
 ckYsn6fNM3K9rCPztZbXk43RQdQoE8s0sS4M3XGbmVZ+pSiYZLPaSgJVE A==;
X-CSE-ConnectionGUID: yCXj2SwNS5KzNMt+XAzMfg==
X-CSE-MsgGUID: wUWpM+J4Qh++eTChj2WRNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99592539"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="99592539"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:26:17 -0700
X-CSE-ConnectionGUID: lUo3yNcGT0GyYHweYs/BfQ==
X-CSE-MsgGUID: cB4CP7pVRcOC134fp/v2lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="272887359"
Received: from unknown (HELO [10.66.117.203]) ([10.66.117.203])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:26:16 -0700
Message-ID: <2d78b3c1-1b80-44f1-a19b-f91733b60f9e@Intel.com>
Date: Tue, 8 Sep 2026 15:56:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-12-dnyaneshwar.bhadane@intel.com>
 <f5ee9db3-824d-4d94-84d2-8dce7b45a689@intel.com>
Content-Language: en-US
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Organization: intel
In-Reply-To: <f5ee9db3-824d-4d94-84d2-8dce7b45a689@intel.com>
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



On 26-Aug-26 3:59 PM, Mallesh, Koujalagi wrote:
> 
> On 20-08-2026 12:44 am, Dnyaneshwar Bhadane wrote:
>> Replace xe_tile_sriov_err() with xe_log_err() using the LMTT component
>> tag for LMTT and MERT invalidation failures, preserving the SR-IOV
>> prefix in the log message.
>>
>> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_lmtt.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
>> index 0c726eda9390..a9feeacbae55 100644
>> --- a/drivers/gpu/drm/xe/xe_lmtt.c
>> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_bo.h"
>>   #include "xe_tlb_inval.h"
>>   #include "xe_lmtt.h"
>> +#include "xe_log.h"
>>   #include "xe_map.h"
>>   #include "xe_mert.h"
>>   #include "xe_mmio.h"
>> @@ -302,14 +303,16 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>>   
>>   	err = lmtt_invalidate_hw(lmtt);
>>   	if (err)
>> -		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
>> -				  ERR_PTR(err));
>> +		xe_log_err(tile, LMTT, -EIO,  "%s invalidation failed (%pe)",
> Use err as errno.
I will update this for sure thank you Mallesh. >> +			 
xe_sriov_printk_prefix(xe),
>> +			   ERR_PTR(err));
> nit: drop ERR_PTR(err.
>>   
>>   	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
>>   		err = xe_mert_invalidate_lmtt(xe);
>>   		if (err)
>> -			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
>> -					  ERR_PTR(err));
>> +			xe_log_err(tile, LMTT, -EIO,  "%s MERT invalidation failed (%pe)",
>> +				   xe_sriov_printk_prefix(xe),
>> +				   ERR_PTR(err));
> ditto
>>   	}
>>   }
>>   

