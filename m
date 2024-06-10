Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D05C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 16:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFD610E18B;
	Mon, 10 Jun 2024 16:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D94Yln8E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0FC10E18B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037916; x=1749573916;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1a+hgZ6ZAdM1l5Eao1XyrvKVWQnpnSMtZttDtwVLPxk=;
 b=D94Yln8EL4cc9FGe5O2L1dG+K8IoXBgoxoNzQWyVvmHPqme3lVPovSHf
 DyZ2k9Dw2rhUjY3BnpoN4emX9Jst3CAsy77ym6PO+pl0G3fZjQPXAzq8Y
 0q/+VeSDISL2xUGHKWgTvs/oF0A+9nfLnFD7cAJ3JBipeUdiSbv2ZlPy0
 IEkxz4g5vHXy7tvjv5Q8lzS8d8Gnl3XiSU7nTk/+ZMcQmC7WyUmhMOiFS
 6WntymuupGA6P79ozkdB3Tp1mdVfNZ6vVEBa8kwwt9DeWUFeZE3pap9zU
 /nKk49AqTNVfgb/D5AyyG08zHysSwj1xPclM6IuCwy4ABIL6syQRbHZqt A==;
X-CSE-ConnectionGUID: Lf2owp64Th2ByqbRkSZRGg==
X-CSE-MsgGUID: VKp65LkqR2mRM4RoLf/jHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25284176"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25284176"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:45:16 -0700
X-CSE-ConnectionGUID: 839XKj7vTnSgzIp/ADJyfg==
X-CSE-MsgGUID: a8HAMRapR0m28RTyvgFH6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="38964625"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 10 Jun 2024 09:45:15 -0700
Received: from [10.246.1.253] (unknown [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 83801312DA;
 Mon, 10 Jun 2024 17:45:13 +0100 (IST)
Message-ID: <1ec633a8-4a2f-435f-9159-4c8d48c1d931@intel.com>
Date: Mon, 10 Jun 2024 18:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] drm/xe: Improve unexpected state error messages
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-7-matthew.brost@intel.com>
 <CH0PR11MB5444A8A9DDE4BC86ECFE91A9E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444A8A9DDE4BC86ECFE91A9E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 10.06.2024 18:36, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Monday, June 10, 2024 7:18 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH v5 06/10] drm/xe: Improve unexpected state error messages
>>
>> Include G2H handler name when an unexpected error state messages.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Having a separation for these two error messages is a good idea.
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
>> ---
>>  drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 4464ba337d12..766ff8e48dde 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1632,8 +1632,8 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  
>>  	if (unlikely(!exec_queue_pending_enable(q) &&
>>  		     !exec_queue_pending_disable(q))) {
>> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
>> -			atomic_read(&q->guc->state));
>> +		drm_err(&xe->drm, "SCHED_DONE: Unexpected engine state 0x%04x, guc_id=%d",
>> +			atomic_read(&q->guc->state), q->guc->id);

but please at least use xe_gt_err()

other option would be to use xe_gt_err_printer() and dump engine state
in more friendly/detailed way

>>  		return -EPROTO;
>>  	}
>>  
>> @@ -1671,8 +1671,8 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  
>>  	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
>>  	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
>> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
>> -			atomic_read(&q->guc->state));
>> +		drm_err(&xe->drm, "DEREGISTER_DONE: Unexpected engine state 0x%04x, guc_id=%d",
>> +			atomic_read(&q->guc->state), q->guc->id);

ditto

>>  		return -EPROTO;
>>  	}
>>  
>> -- 
>> 2.34.1
>>
>>
