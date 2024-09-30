Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7E4CDD1D5
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 20:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B74B10E076;
	Mon, 30 Sep 2024 20:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gAVupjKK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215FD10E076
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 20:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727727352; x=1759263352;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=VQp4ajxviLhttzHF+tNE9Olj8fzgdvumqX7JYxwLpVw=;
 b=gAVupjKKq+dUKFEV5he28tzo0irqmyih8ifjsBnWvSPltTKI/CQ3Prrs
 nujspxawMjCWjZU+OKZY/fZzdQBOqEg89qBnqW0v9yf56viwlCbSGO7jB
 7rCejlaI0wokV/1zf0dHUH+WAP3YcDGmfp1jxYSjxP2qWcNq+jLEXOZ/o
 ILjQ0JAAvdxhCeZ7sT7iZXKBoqWzevEMn7K4MdFtVNn5rkPxKfw9mxpAO
 fbSUXv11WS9DhXCg0Ij+g/LZk9v7U/TnKOJwU/nZIFgs9On6Ai0ov54Qc
 G+YbLV6danLB95XrrsCfJ3lQgC+HAqXqx0pr85Hv0NkzTnnlrTbHEJevR w==;
X-CSE-ConnectionGUID: /ZsBe7zRQWqE8g5O4G6GYQ==
X-CSE-MsgGUID: 6ffUuudVQPGt4y+8UGTg/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26720167"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26720167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 13:15:52 -0700
X-CSE-ConnectionGUID: UrsJyrWSRfaMT9kD+8+e/A==
X-CSE-MsgGUID: vLXTQ2+tS+OjagQwfzGFzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="77803309"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 30 Sep 2024 13:15:50 -0700
Received: from [10.246.27.12] (mwajdecz-MOBL.ger.corp.intel.com [10.246.27.12])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BB7852878C;
 Mon, 30 Sep 2024 21:15:48 +0100 (IST)
Message-ID: <b598cd52-fbbe-46cd-ae81-47519f5db77d@intel.com>
Date: Mon, 30 Sep 2024 22:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/25] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-5-himal.prasad.ghimiray@intel.com>
 <2cd313aa-264a-4e33-88e4-7b1093c1df36@intel.com>
Content-Language: en-US
In-Reply-To: <2cd313aa-264a-4e33-88e4-7b1093c1df36@intel.com>
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



On 30.09.2024 22:13, Michal Wajdeczko wrote:
> 
> 
> On 30.09.2024 07:31, Himal Prasad Ghimiray wrote:
>> Instead of calling xe_force_wake_put on all domains that were input to
>> xe_force_wake_get, call _put only on the domains whose reference counts
>> were successfully incremented by the _get call. Since the return value
>> of _get can be a mask that does not match any specific value in the enum
>> xe_force_wake_domains, change the input parameter of _put to unsigned int.
> 
> at this point in the series xe_force_wake_get() still returns errno

oops, scratch that, somehow missed patch 03/25

> 
> maybe rephrase this to something like:
> 
> "Prepare xe_force_wake_put() to accept force_wake reference with
> refcounted domains"
> 
> and also maybe it is a good time to change this function to void (or
> maybe even do it before this path?
> 
>>
>> v3
>> - Move WARN to this patch (Badal)
>> - use xe_gt_WARN instead of XE_WARN (Michal)
>> - Stop using xe_force_wake_domains for non enum values.
>> - Remove kernel-doc from this patch (Badal)
>>
>> -v5
>> - Fix global awake_domain
>>
>> -v6
>> - put all initialized domains in case of FORCEWAKE_ALL.
>> - Modify ret variable name (Michal)
>> - Modify input var name (Michal)
>> - Modify commit message and warn (Badal)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> 
> probably this applies to some earlier #rev, so please mark it as such
> 
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_force_wake.c | 28 +++++++++++++++++++++-------
>>  drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>>  2 files changed, 22 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 7f358e42c5d4..372ea43b0d06 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -211,26 +211,40 @@ unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>  }
>>  
>>  int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      enum xe_force_wake_domains domains)
>> +		      unsigned int fw_ref)
>>  {
>>  	struct xe_gt *gt = fw->gt;
>>  	struct xe_force_wake_domain *domain;
>> -	enum xe_force_wake_domains tmp, sleep = 0;
>> +	unsigned int tmp, sleep = 0;
>>  	unsigned long flags;
>> -	int ret = 0;
>> +	int ack_fail = 0;
>> +
>> +	/*
>> +	 * Avoid unnecessary lock and unlock when the function is called
>> +	 * in error path of individual domains.
>> +	 */
>> +	if (!fw_ref)
>> +		return 0;
>> +
>> +	if (fw_ref == XE_FORCEWAKE_ALL)
>> +		fw_ref = fw->initialized_domains;
>>  
>>  	spin_lock_irqsave(&fw->lock, flags);
>> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>> +	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
>>  		if (!--domain->ref) {
>>  			sleep |= BIT(domain->id);
>>  			domain_sleep(gt, domain);
>>  		}
>>  	}
>>  	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>> -		ret |= domain_sleep_wait(gt, domain);
>> +		if (domain_sleep_wait(gt, domain) == 0)
>> +			fw->awake_domains &= ~BIT(domain->id);
>> +		else
>> +			ack_fail |= BIT(domain->id);
>>  	}
>> -	fw->awake_domains &= ~sleep;
>>  	spin_unlock_irqrestore(&fw->lock, flags);
>>  
>> -	return ret;
>> +	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
>> +		   str_plural(hweight_long(ack_fail)), ack_fail);
>> +	return ack_fail;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index eb638128952d..b5a75544d86a 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>  unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>  			       enum xe_force_wake_domains domains);
>>  int xe_force_wake_put(struct xe_force_wake *fw,
>> -		      enum xe_force_wake_domains domains);
>> +		      unsigned int fw_ref);
>>  
>>  static inline int
>>  xe_force_wake_ref(struct xe_force_wake *fw,
> 

