Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1153DC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 19:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F25311A7E9;
	Thu, 25 Apr 2024 19:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPg9gNrk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1531113885
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 19:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714072546; x=1745608546;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VcSlwAoE0ZCP7rMPWeULB9WimgATlkvxqJT4tgeUFUM=;
 b=OPg9gNrkvitPHyrdEv46vxgDKwzfOo1/25dZb5N+ssKd6WFBUChSMeqc
 tn2msQv27NcnLqzjr/LYQY8hU0mWG3bnk//onLolBwTTvzLf7em3rvlCW
 EL5ZV/fXANXHamMd3eRn6VgnLFFp/JnRAuFrRAwaWZPPzTwsanRoNXc/S
 6vY9HuPeczB56ipfohQy+mhU9VrGyAJaIJuGYvKUPf02NPz5vUVQ7uPZR
 EPgrxykp5FP+cb1Sh6xIX3gC3zxd/CN8nLyBDDSSL12ZeTKAIhvlJKcoK
 Gt/RB+S8cr/OSrCoDxDsrJbfkzX0OEE0m/91aNGOrwgbp/jr4SpGfBzam A==;
X-CSE-ConnectionGUID: iULo3wCITe+Vlr7dv4WdtQ==
X-CSE-MsgGUID: 3IU2kQakSFKaxc54xyGBzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9652482"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9652482"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 12:15:46 -0700
X-CSE-ConnectionGUID: irGpqP2hTMKZe1YDxbV6kA==
X-CSE-MsgGUID: Xb6rblQpSt2MqLylYv5a4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25592578"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 25 Apr 2024 12:15:45 -0700
Received: from [10.252.47.83] (mutica-mobl2.ger.corp.intel.com [10.252.47.83])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C9B8928793;
 Thu, 25 Apr 2024 20:15:43 +0100 (IST)
Message-ID: <63adbb9b-ee0e-4a60-866f-135ee59f97dd@intel.com>
Date: Thu, 25 Apr 2024 21:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add engine name to the engine reset and cat-err
 log
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240425121856.4500-1-nirmoy.das@intel.com>
 <ZiqW68FPS+vJ8TtR@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZiqW68FPS+vJ8TtR@DUT025-TGLU.fm.intel.com>
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



On 25.04.2024 19:46, Matthew Brost wrote:
> On Thu, Apr 25, 2024 at 02:18:56PM +0200, Nirmoy Das wrote:
>> Add engine name to the engine reset and cat error log
>> which should be useful while debugging.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index c7d38469fb46..245e29d095c0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1655,7 +1655,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  	if (unlikely(!q))
>>  		return -EPROTO;
>>  
>> -	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
>> +	drm_info(&xe->drm, "Engine reset: name=%s, guc_id=%d", q->hwe->name, guc_id);
> 
> I don't think q->hwe->name name is useful as it might not actually be
> exec queue is running. I'd drop that, and replace with string indicating
> the hardware engine class. 

and maybe it's also a good time to switch into GT-oriented logs:

-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);

	xe_gt_info(gt, "Engine reset....

> 
>>  
>>  	/* FIXME: Do error capture, most likely async */
>>  
>> @@ -1690,7 +1690,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>  	if (unlikely(!q))
>>  		return -EPROTO;
>>  
>> -	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
>> +	drm_dbg(&xe->drm, "Engine memory cat error: name=%s, guc_id=%d",
>> +		q->hwe->name, guc_id);
> 
> Same here.
> 
> Matt
> 
>>  	trace_xe_exec_queue_memory_cat_error(q);
>>  
>>  	/* Treat the same as engine reset */
>> -- 
>> 2.42.0
>>
