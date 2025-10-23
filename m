Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED20CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 07:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8549410E8C7;
	Thu, 23 Oct 2025 07:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Fru7Z3uu";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C60310E8C7
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QmQ/xoJ8qyo9/k54yx4bj9dUBW435TOfv66LrNit6xM=; b=Fru7Z3uu7kZRNfawWDT5A+kCII
 Z+UNwhI1x1l4a3l7L9Uros+RhRjR3SE6z0xO2oDSD65uJkdvI1/D/0j2Jvi5M8r7Krfspl47H0FnQ
 oXmnB+kWBgD8A2sITgWv+sgpR0FK2q5LKblnn3l4IK9MFfEiVA0BAP8pEr5R8VOU8Rg9c1M62wxUv
 pIrw6kdgs2GBXbe3yzSe7SRbmdJ7vFX0HYRM3wdevCEqrPflewoX/4OHQAhE79e1OdsAWz4d1hRa6
 q88vOBlVKZdTL1xYReu72zzta3shlpJXeZhuukXZknQoIzAo66PtTi8rqE1jYUnYPU3C1QiLj5FSM
 AcRyMOYA==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vBqAr-00DW9Z-HF; Thu, 23 Oct 2025 09:55:53 +0200
Message-ID: <df97244b-66ba-4ae1-ba81-1018352b7e54@igalia.com>
Date: Thu, 23 Oct 2025 08:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 05/12] drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs
 platforms
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
 <20251020075831.32818-6-tvrtko.ursulin@igalia.com>
 <20251022231331.GY5409@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20251022231331.GY5409@mdroper-desk1.amr.corp.intel.com>
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


On 23/10/2025 00:13, Matt Roper wrote:
> On Mon, Oct 20, 2025 at 08:58:23AM +0100, Tvrtko Ursulin wrote:
>> Emit MI_FLUSH_DW_CCS when invalidating on auxccs platforms.
> 
> This is another one that doesn't apply to all platforms.  The
> MI_FLUSH_DW_CCS flag only exists from DG2 onward (and does not exist on
> PVC either).  So MTL/ARL are again the only platforms that this should
> actually apply to.
> 
> The bspec doesn't document any other meaning for this bit on the older
> gen12 platforms, so maybe it's safe to just set it anyway?

Don't ask a person with not access to the docs. :)

Essentially you are saying b70df82b4287 ("drm/i915/gt: Enable the 
CCS_FLUSH bit in the pipe control and in the CS") was wrong to set 
MI_FLUSH_DW_CCS, correct? This one is at least not as suspect as the 
invalidation register story, given the other part of this commit is 
adding a >= 12.70 check, so I can easily fix it.

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ring_ops.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>> index 87e467972070..d226d3228199 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -272,6 +272,8 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
>>   			      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
>>   			      class == XE_ENGINE_CLASS_VIDEO_ENHANCE);
>>   	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
>> +	const u32 flags = aux_ccs && class == XE_ENGINE_CLASS_COPY ?
>> +			  MI_FLUSH_DW_CCS : 0;
>>   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>>   
>>   	*head = lrc->ring.tail;
>> @@ -281,9 +283,8 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
>>   	if (invalidate_tlb) {
>>   		dw[i++] = preparser_disable(true);
>>   		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
>> -					seqno,
>> -					MI_INVALIDATE_TLB,
>> -					dw, i);
>> +					seqno, MI_INVALIDATE_TLB | flags, dw,
>> +					i);
>>   		/* hsdes: 1809175790 */
>>   		if (aux_ccs) {
>>   			struct xe_reg reg;
>> -- 
>> 2.48.0
>>
> 

