Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E80C19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 09:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE19010EC22;
	Fri, 28 Feb 2025 09:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="B77RVLqy";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A2E10EC22
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iec719+Dz3ZhAQEY8Rnpkt/nUhVu7+aaw62jTNpuXo4=; b=B77RVLqy6Uj/4Ncrje7H+SD6JZ
 Ugh3nk7D3s029/yTYMW9dNv97OF/Wt+DNNTUL4LUQfw/WR90Y+6W+0CoLC3geJlvJ7xLJZfsyBQe1
 8FFfgbE2MUW83OYoDbZT3iQpAG+sOlcXPA7eGYGtZTzB5tNeQCwmp+C8OLDyqlN8u4wEZ9+8O6025
 w7IPtek6wB10Zg2+oSbuIAJQ78wKCJ54uk5m36dWPpP1aiPNhQiWfoNwg0nH1PcGX2jlwQfgFQXLF
 epHADxYSZlN4tW1eCW84G8A3elPRYKWbWsza9/O4GDfdou+/RU/X/PDbWbbbN6Ov1y5zJoOE2dFRg
 Kzsp/uWA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tnwLb-001xQ8-0J; Fri, 28 Feb 2025 10:08:00 +0100
Message-ID: <52d73954-b170-4a44-9bf7-fc5ee8751fa8@igalia.com>
Date: Fri, 28 Feb 2025 09:08:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] drm/xe: Fix ring flush invalidation
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-3-tvrtko.ursulin@igalia.com>
 <20250227234622.GL5109@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250227234622.GL5109@mdroper-desk1.amr.corp.intel.com>
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


On 27/02/2025 23:46, Matt Roper wrote:
> On Fri, Feb 21, 2025 at 10:17:21AM +0000, Tvrtko Ursulin wrote:
>> Emit_flush_invalidate() is incorrectly marking the write to LRC_PPHWSP as
>> a GGTT write and also writing an atypical ~0 dword as the payload. Fix it.
> 
> Technically the write is a GGTT write (the PPHWSP is allocated as part
> of the LRC, and the LRC is mapped to the GGTT).  But the important thing
> here is that bit 21 (MI_FLUSH_DW_STORE_INDEX) redefines the meaning of
> the PPGTT vs GGTT bit to instead mean "index into pphwsp" vs "index into
> ghwsp."  And based on the name of the offset we use
> (LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR) it sounds like the pphwsp was
> indeed intended here, so dropping the 'use GTT' flag is in line with
> that.
> 
> I don't think the actual destination (ghwsp vs pphwsp) or the value (~0
> or 0) actually has any functional impact since there doesn't seem to be
> anything watching and waiting for those writes to show up in memory.  We
> just have to use the OP_STOREDW flag because the TLB invalidate flag
> mandates that it also be present.
> 
> But your patch makes things more consistent, so
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks! And yes, my commit message was quite bad. If xe was using csb 
from the ghwsp maybe that would be trashing them (I briefly looked at 
the offsets but got confused by what Tigerlake PRM versus the code was 
claiming), but it isn't even in execlists mode.

Btw, do you know if Alderlake PRMs will be made public? They are not on 
https://www.intel.com/content/www/us/en/docs/graphics-for-linux/developer-reference/1-0/overview.html 
at least. Is there a different home for them nowadays?

Regards,

Tvrtko

>>
>> While at it drop the unused flags argument.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ring_ops.c | 15 ++++++---------
>>   1 file changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>> index 0c230ee53bba..a2d1fb8f0adf 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -111,16 +111,13 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
>>   	return i;
>>   }
>>   
>> -static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
>> +static int emit_flush_invalidate(u32 *dw, int i)
>>   {
>> -	dw[i] = MI_FLUSH_DW;
>> -	dw[i] |= flag;
>> -	dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
>> -		MI_FLUSH_DW_STORE_INDEX;
>> -
>> -	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
>> +	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>> +		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
>> +	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
>> +	dw[i++] = 0;
>>   	dw[i++] = 0;
>> -	dw[i++] = ~0U;
>>   
>>   	return i;
>>   }
>> @@ -409,7 +406,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>>   	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
>>   		/* XXX: Do we need this? Leaving for now. */
>>   		dw[i++] = preparser_disable(true);
>> -		i = emit_flush_invalidate(0, dw, i);
>> +		i = emit_flush_invalidate(dw, i);
>>   		dw[i++] = preparser_disable(false);
>>   	}
>>   
>> -- 
>> 2.48.0
>>
> 

