Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8EDCA100C
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 07:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538D510E11A;
	Wed,  3 Sep 2025 07:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Rvz8z4gX";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6778010E11A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 07:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FGIYckPG13eeoEW5mgiiYj0tb5+nzQbcT1unHKEtnZE=; b=Rvz8z4gXoewLmvtxj4ymvT/I3v
 QWi96bHWb9GxV5idV4nfks0bnum9r1jGI5qjmWNqCtMZP/RJWzo4jKNO7cS2Ma+n+ZYSIEbVeGpm2
 /ni6SgKwWetr/YdET/r+2khFFjOil4smHdoE2abV5KtjKFAMAHCuG0yfz/ykSx0BFjAcYYe60Dqm7
 HKCeFXS8tmRWkX9kKx35xnSKTpxJ1bxTB01Bzdf3+//Idl8Xy/XuxLmkQO1IOlrdi9qMyfnkmFiJh
 oVKPxQx1mAnOTiYJNLNyTg22DOutfoUgelmErDOY2pS4HKQe5aa+vueCbfcLjKHHc8F32cW+XKzWE
 yc8sVYGQ==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1utiGP-00658x-7u; Wed, 03 Sep 2025 09:50:41 +0200
Message-ID: <d5be250c-3cc6-42c0-b430-cc286b23da52@igalia.com>
Date: Wed, 3 Sep 2025 08:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 02/13] drm/xe/xelp: Quiesce memory traffic before
 invalidating auxccs
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250821141458.72876-1-tvrtko.ursulin@igalia.com>
 <20250821141458.72876-3-tvrtko.ursulin@igalia.com>
 <aK8YmLNQ_Uu3uzyn@intel.com>
 <52e66d66-c479-40f1-872d-7f6b26912544@igalia.com>
 <aLcqVyZEKXlSqHwF@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aLcqVyZEKXlSqHwF@intel.com>
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


On 02/09/2025 18:33, Rodrigo Vivi wrote:
> On Mon, Sep 01, 2025 at 11:37:33AM +0100, Tvrtko Ursulin wrote:
>>
>> On 27/08/2025 15:39, Rodrigo Vivi wrote:
>>> On Thu, Aug 21, 2025 at 03:14:44PM +0100, Tvrtko Ursulin wrote:
>>>> According to i915 before invalidating auxccs we must quiesce the memory
>>>> traffic by an extra flush.
>>>
>>> Perhaps we should be more specific about what commits exactly are mentioning this?
>>>
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_ring_ops.c       | 7 ++++++-
>>>>    drivers/gpu/drm/xe/xe_ring_ops_types.h | 2 +-
>>>>    2 files changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> index 761740d7769f..f56506ebbeca 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> @@ -358,10 +358,15 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>>>    	struct xe_gt *gt = job->q->gt;
>>>>    	struct xe_device *xe = gt_to_xe(gt);
>>>>    	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>>>> +	const bool aux_ccs = has_aux_ccs(xe);
>>>>    	u32 mask_flags = 0;
>>>>    	i = emit_copy_timestamp(lrc, dw, i);
>>>> +	/* hsdes: 1809175790 */
>>>
>>> in i915 I just see a mention to this HSD which is the
>>> 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
>>>
>>> but that is not about emitting the flush, but about fixing the aux
>>> table invalidation itself. And that is in sync what written on this
>>> HSD, but I don't believe this patch is about that.
>>>
>>> So, although this patch itself kind of makes sense, I believe it
>>> deserves a better message.
>>
>> My logic was this:
>>
>> d0d829e56674c (Daniele Ceraolo Spurio 2020-12-09 23:36:18 +0000 244) int
>> gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>> d0d829e56674c (Daniele Ceraolo Spurio 2020-12-09 23:36:18 +0000 245) {
>> 803efd297e315 (Daniele Ceraolo Spurio 2022-03-01 15:15:40 -0800 246) struct
>> intel_engine_cs *engine = rq->engine;
>> 803efd297e315 (Daniele Ceraolo Spurio 2022-03-01 15:15:40 -0800 247)
>> ad8ebf12217e4 (Jonathan Cavitt        2023-07-25 02:19:46 +0200 248)    /*
>> ad8ebf12217e4 (Jonathan Cavitt        2023-07-25 02:19:46 +0200 249) * On
>> Aux CCS platforms the invalidation of the Aux
>> ad8ebf12217e4 (Jonathan Cavitt        2023-07-25 02:19:46 +0200 250) * table
>> requires quiescing memory traffic beforehand
>> ad8ebf12217e4 (Jonathan Cavitt        2023-07-25 02:19:46 +0200 251)     */
>> ad8ebf12217e4 (Jonathan Cavitt        2023-07-25 02:19:46 +0200 252) if
>> (mode & EMIT_FLUSH || gen12_needs_ccs_aux_inv(engine)) {
>>
>> So commit ad8ebf12217e4 added the flush before invalidate:
>>
>> commit ad8ebf12217e451cd19804b1c3e97ad56491c74a
>> Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Date:   Tue Jul 25 02:19:46 2023 +0200
>>
>>      drm/i915/gt: Ensure memory quiesced before invalidation
>>
>>      All memory traffic must be quiesced before requesting
>>      an aux invalidation on platforms that use Aux CCS.
>>
>>      Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all
>> engines")
>>      Requires: a2a4aa0eef3b ("drm/i915: Add the gen12_needs_ccs_aux_inv
>> helper")
>>      Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>      Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>      Cc: <stable@vger.kernel.org> # v5.8+
>>      Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>>      Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>      Link: https://patchwork.freedesktop.org/patch/msgid/20230725001950.1014671-4-andi.shyti@linux.intel.com
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> index 46744f966077..58b448708e75 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> @@ -214,7 +214,11 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32
>> mode)
>>   {
>>          struct intel_engine_cs *engine = rq->engine;
>>
>> -       if (mode & EMIT_FLUSH) {
>> +       /*
>> +        * On Aux CCS platforms the invalidation of the Aux
>> +        * table requires quiescing memory traffic beforehand
>> +        */
>> +       if (mode & EMIT_FLUSH || gen12_needs_ccs_aux_inv(engine)) {
>>
>> And ad8ebf12217e4 referenced 972282c4cf24 as the commit it was fixing, while
>> 972282c4cf24 is the one which references hsdes#1809175790. So I decided to
>> tag this patch with it as a transitive property.
>>
>> If I remove the HSD reference, replace it with a comment as the one in i915,
>> and put the above commit chain reasoning to the commit message will that be
>> good enough?
> 
> Yeap, I believe it makes more sense.

Done - I've adjusted it locally but was thinking to not send an updated 
series out just yet. In case there will be more review comments for 
other patches.

Regards,

Tvrtko

>>>> +	if (aux_ccs)
>>>> +		i = emit_render_cache_flush(job, dw, i);
>>>> +
>>>>    	dw[i++] = preparser_disable(true);
>>>>    	if (lacks_render)
>>>>    		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
>>>> @@ -372,7 +377,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>>>    	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
>>>>    	/* hsdes: 1809175790 */
>>>> -	if (has_aux_ccs(xe))
>>>> +	if (aux_ccs)
>>>>    		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
>>>>    	dw[i++] = preparser_disable(false);
>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
>>>> index d7e3e150a9a5..477dc7defd72 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
>>>> @@ -8,7 +8,7 @@
>>>>    struct xe_sched_job;
>>>> -#define MAX_JOB_SIZE_DW 58
>>>> +#define MAX_JOB_SIZE_DW 70
>>>>    #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
>>>>    /**
>>>> -- 
>>>> 2.48.0
>>>>
>>

