Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E38C71130
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 17:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2E98825B;
	Mon,  7 Jul 2025 17:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHiLapT3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F8A8825B
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 17:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751909795; x=1783445795;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UjGhQfsu6bz3ObTXEA7SbmZob4rwKHYPNthb1EBpp6s=;
 b=EHiLapT3KdXTApOpxmh8tDyst5fMP34mUMnKSxE+uERrSvl5c+tf/SYl
 dzfrghWXF14JslD9qD5JHnPAwwqf1+7ZdInR9g3yJWSbSThhUeMb3rv/r
 +NL9bhxal9Hyy++/8YozogOpqte3roNdjD/ze3EO6TFYUmtYHFy5WP3zi
 neRRSvLeNBQAqIJgygEyXGqFvyGEfbQrlsvBnC4S0lW4ubbLGD8CLopkS
 9IUxSpNEl7vQb/K9Bb7Kx6DQPuo+BiE6gLwLkM3r+9+ceNGk+1fWk2rBj
 QR5lXBSNvtJxi5UEspH96YqVzyoVktlHC0nkH9PhXbZLBtnU5OtBM+i2C w==;
X-CSE-ConnectionGUID: NnASBzYkSSOA/1InQgYcug==
X-CSE-MsgGUID: p/1zA5ijTrSZOKuS6bDciQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54110692"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="54110692"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 10:36:34 -0700
X-CSE-ConnectionGUID: iNs4zyrJSbyB/88v8rpyEw==
X-CSE-MsgGUID: gWp7z20PQkmcKPZtyNYOOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="159817638"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 07 Jul 2025 10:36:32 -0700
Received: from [10.245.96.176] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.176])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 717DE32CB0;
 Mon,  7 Jul 2025 18:36:30 +0100 (IST)
Message-ID: <3a784641-2436-4ead-88e2-88ef33fd39ac@intel.com>
Date: Mon, 7 Jul 2025 19:36:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>
Cc: "Summers, Stuart" <stuart.summers@intel.com>
References: <20250703213845.2259302-1-zhanjun.dong@intel.com>
 <CH0PR11MB54443606D202241399E6692EE54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB54443606D202241399E6692EE54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 07.07.2025 15:56, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Dong, Zhanjun <zhanjun.dong@intel.com> 
> Sent: Thursday, July 3, 2025 2:39 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Dong, Zhanjun <zhanjun.dong@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Subject: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware initialization error.
>>
>> Disable GuC communication on Xe micro controller hardware initialization
>> error.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
>>
>> ---
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>
>> Change list:
>> v8: Fix kernel-doc style
>>     Add error handling in vf_guc_min_load_for_hwconfig
>> v7: Add kernel-doc for xe_guc_disable_communication
>>     Unset submission_state.enabled as well
>> v6: Skip disable ct on xe_guc_enable_communication error
>> v5: Set wedge is excessive action, revert back to disable ct
>> v4: Fix typo and add new line
>> v3: v2 CI re-run
>> v2: Remove unnecessary jump to err-out
>>     Drop disable ct, switch to set wedge
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 20 ++++++++++++++++++--
>>  drivers/gpu/drm/xe/xe_guc.h |  1 +
>>  drivers/gpu/drm/xe/xe_uc.c  | 19 ++++++++++++++-----
>>  3 files changed, 33 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 8573957facae..6643a2cb898b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1219,13 +1219,17 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>>  
>>  	ret = xe_gt_sriov_vf_connect(gt);
>>  	if (ret)
>> -		return ret;
>> +		goto err_out;
>>  
>>  	ret = xe_gt_sriov_vf_query_runtime(gt);
>>  	if (ret)
>> -		return ret;
>> +		goto err_out;
>>  
>>  	return 0;
>> +
>> +err_out:
>> +	xe_guc_disable_communication(guc);
>> +	return ret;
>>  }
>>  
>>  /**
>> @@ -1337,6 +1341,18 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>>  	return 0;
>>  }
>>  
>> +/**
>> + * xe_guc_disable_communication() - Disable GuC communication
>> + * @guc: The GuC object
>> + *
>> + * This function will disable the GuC communication.
>> + */
>> +void xe_guc_disable_communication(struct xe_guc *guc)
>> +{
>> +	guc->submission_state.enabled = false;
>> +	xe_guc_ct_disable(&guc->ct);
> 
> Didn't this used to just be a wrapper for xe_guc_ct_disable?
> 
> ... Well, I suppose needing to set the submission state enabled to false
> would also be a rather important step, so it's probably good that was added.

hmm, while it might be a required step for shutdown, putting it here
looks like a random choice, it's unbalanced what "enable_communication"
did and also looks like a violation of the layering, as guc_submit code
has its own files and we shouldn't touch internals from the outside

+ @Matt

> 
> Everything else is LGTM, so
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
>> +}
>> +
>>  int xe_guc_suspend(struct xe_guc *guc)
>>  {
>>  	struct xe_gt *gt = guc_to_gt(guc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index 22cf019a11bf..20823b821f7d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -34,6 +34,7 @@ int xe_guc_reset(struct xe_guc *guc);
>>  int xe_guc_upload(struct xe_guc *guc);
>>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>  int xe_guc_enable_communication(struct xe_guc *guc);
>> +void xe_guc_disable_communication(struct xe_guc *guc);
>>  int xe_guc_opt_in_features_enable(struct xe_guc *guc);
>>  int xe_guc_suspend(struct xe_guc *guc);
>>  void xe_guc_notify(struct xe_guc *guc);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 6431ba3a2c53..1012fe84b379 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -13,6 +13,7 @@
>>  #include "xe_gt_printk.h"
>>  #include "xe_gt_sriov_vf.h"
>>  #include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>>  #include "xe_guc_pc.h"
>>  #include "xe_guc_engine_activity.h"
>>  #include "xe_huc.h"
>> @@ -158,7 +159,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>  
>>  	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>>  	if (err)
>> -		return err;
>> +		goto err_out;
>>  
>>  	uc->guc.submission_state.enabled = true;
>>  
>> @@ -168,9 +169,13 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>  
>>  	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>  	if (err)
>> -		return err;
>> +		goto err_out;
>>  
>>  	return 0;
>> +
>> +err_out:
>> +	xe_guc_disable_communication(&uc->guc);
>> +	return err;
>>  }
>>  
>>  /*
>> @@ -202,15 +207,15 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>  
>>  	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>  	if (ret)
>> -		return ret;
>> +		goto err_out;
>>  
>>  	ret = xe_guc_post_load_init(&uc->guc);
>>  	if (ret)
>> -		return ret;
>> +		goto err_out;
>>  
>>  	ret = xe_guc_pc_start(&uc->guc.pc);
>>  	if (ret)
>> -		return ret;
>> +		goto err_out;
>>  
>>  	xe_guc_engine_activity_enable_stats(&uc->guc);
>>  
>> @@ -222,6 +227,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>  	xe_gsc_load_start(&uc->gsc);
>>  
>>  	return 0;
>> +
>> +err_out:
>> +	xe_guc_disable_communication(&uc->guc);
>> +	return ret;
>>  }
>>  
>>  int xe_uc_reset_prepare(struct xe_uc *uc)
>> -- 
>> 2.34.1
>>
>>

