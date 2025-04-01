Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20739C36014
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 08:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B8010E51A;
	Tue,  1 Apr 2025 08:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="p9sFqSsk";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364AD10E518
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iibmluSK2sgbSEvPpPfolCotFuacs1ey+Ikz4OVcT4Y=; b=p9sFqSskXJl2ujbTIiygUOWaR9
 qlwexzYHHfPXXFJLENGVzfYZqxzJrx17LGAwu3w17ynRxMJn+F5YwTTo29M6hhlGaa03B/j+1jdvu
 u0wgw/XUGqvxdA4ZJrDdGZ+en9wVKzbCoLlp2aDu6/hQE173xYNSdqr9SYE3k8+O0MZmDYAz6X4dM
 B26qT8WUSmkvLrHbetNTzcwufdGUQiY6k9xr06JI604t1oYN0HZ0UmtrFK3pTjDjbc0ZNnlZ3IpOe
 qZrEEqW1hMO4jUhrhpTASuSnecPVzynyZDf13eQs0dAlijfIA7f1I4NcXK8AoA4eTONNy9Wyoe7mA
 G9DAw+zA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tzXGV-009ZlL-S6; Tue, 01 Apr 2025 10:46:35 +0200
Message-ID: <c81f601a-1797-4dc0-9208-b1454afa7690@igalia.com>
Date: Tue, 1 Apr 2025 09:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm/xe/xelpg: Move Wa_14016712196 to the
 invalidate path
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250328163537.58942-1-tvrtko.ursulin@igalia.com>
 <20250328163537.58942-2-tvrtko.ursulin@igalia.com>
 <Z-rk8xcPursz8lUu@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <Z-rk8xcPursz8lUu@intel.com>
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


On 31/03/2025 19:54, Rodrigo Vivi wrote:
> On Fri, Mar 28, 2025 at 04:35:28PM +0000, Tvrtko Ursulin wrote:
>> According to i915 Wa_14016712196 needs to be emmited before a
>> pipe control which contains a post sync operation.
>>
>> Therefore move it from flush (no post sync) to invalidate (post sync).
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: 8c5fe7d88bc1 ("drm/xe: Add Wa_16021333562 and Wa_14016712196")
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Aradhya Bhatia <aradhya.bhatia@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> Please double check.
> 
> It looks like both options are possible.
> 
> We either insert a PIPE_CONTROL with "**Depth Flush** " post any state that
>     will send an implicit depth flush and prior to any PIPE_CONTROL. This
>     PIPE_CONTROL is not required if 3DPRIMITIVE, 3DMESH or PIPE_CONTROL that
>     doesn't require end of the pipe drain is programmed prior to a PIPE_CONTROL
>     that requires end of the pipe drain and hits this issue.
> 
> or
> 
> We insert a this pipe_control prior to PIPE_CONTROL which will hit the issue.  For
>     timestamp, this could be a replicated pipe_control as it will write the
>     correct value the 2nd time.  For post sync with write immediate, SW would have
>     to allocate a dummy address.
> 
> So, is changing the order really helping your case or needed for your case?

No, I don't have access to Meteorlake so I was just comparing all the 
differences between i915 and xe in this area. Given Juha-Pekka reported 
the previous version of this series did not work there. I suspect that 
problem was I simply miscounted MAX_JOB_SIZE_DW. That should be fixed in 
this v4. So yeah, if you say this patch is wrong or not needed I will 
drop it.

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/xe/xe_ring_ops.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>> index 917fc16de866..88591b7a7715 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -134,8 +134,9 @@ emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset,
>>   	return i;
>>   }
>>   
>> -static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>> -				int i)
>> +static int
>> +emit_pipe_invalidate(struct xe_gt *gt, u32 mask_flags, bool invalidate_tlb,
>> +		     u32 *dw, int i)
>>   {
>>   	u32 flags = PIPE_CONTROL_CS_STALL |
>>   		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
>> @@ -152,6 +153,10 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>>   
>>   	flags &= ~mask_flags;
>>   
>> +	if (XE_WA(gt, 14016712196))
>> +		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>> +				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>> +
>>   	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>>   }
>>   
>> @@ -173,10 +178,6 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>>   	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>>   	u32 flags;
>>   
>> -	if (XE_WA(gt, 14016712196))
>> -		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>> -				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>> -
>>   	flags = (PIPE_CONTROL_CS_STALL |
>>   		 PIPE_CONTROL_TILE_CACHE_FLUSH |
>>   		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
>> @@ -361,7 +362,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>   		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
>>   
>>   	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
>> -	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
>> +	i = emit_pipe_invalidate(gt, mask_flags, job->ring_ops_flush_tlb, dw,
>> +				 i);
>>   
>>   	/* hsdes: 1809175790 */
>>   	if (has_aux_ccs(xe))
>> -- 
>> 2.48.0
>>

