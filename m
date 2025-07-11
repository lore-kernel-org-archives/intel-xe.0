Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF86C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 15:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B82910E297;
	Fri, 11 Jul 2025 15:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aMzOcwk2";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0394C10E297
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2mg2TFh8SoludyzYl9vXQqPusv/krDDjBPUUQYVIlMc=; b=aMzOcwk2IL1lRnzRrlcjNu1Aau
 VVs+6+kZ5HCJ/La/8uGbyBgW120YKREfJY156hVWUbVRpc7z5xKG8+QYnHTIuFf+5OD3GfIzkwWhD
 51L3eXi3q8fC7QbzSOEcYJew9i/xt4C/UGLAupg5XXUX3OwG/iHrMH1FdfOnchgpOnD0UVEsgyHtX
 X6WDVMcE8j9KrM20wr1e7UBTgL+refIoWX3XnM6ST6bBDyT+QCzcAKkwRcsSlY8ywF3CMdswzwsNL
 zY4vPIo0lpx7Wc03Gj1o5CazozZkhcruq9yTOiXPEt0qTvJkEJDvWmbH0/kBKZ3QIfVpvy8O08jHq
 KJAmlxFg==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uaFTv-00FQEg-5w; Fri, 11 Jul 2025 17:16:11 +0200
Message-ID: <fc3d5b00-c105-4d4b-b36a-7ed6039f87d5@igalia.com>
Date: Fri, 11 Jul 2025 16:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] drm/xe: Track number of written dwords from
 workaround batch buffer emission
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250709105455.93902-1-tvrtko.ursulin@igalia.com>
 <20250709105455.93902-5-tvrtko.ursulin@igalia.com>
 <45fyfjrhyhikfn6rcnjva24ontgvvev6xsxgjjidit7z72ix5s@xixbs7r3slzk>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <45fyfjrhyhikfn6rcnjva24ontgvvev6xsxgjjidit7z72ix5s@xixbs7r3slzk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 11/07/2025 04:32, Lucas De Marchi wrote:
> On Wed, Jul 09, 2025 at 11:54:51AM +0100, Tvrtko Ursulin wrote:
>> Indirect context setup will need to get to the number of written dwords.
>> Lets add it as an output parameter so it can be accessed from the finish
>> helper regardless of whether code is writing directly or via an shadow
>> buffer.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_lrc.c | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 5d5b76f16829..229cfde91799 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -991,6 +991,7 @@ struct bo_setup_state {
>>     /* State: */
>>     u32            *buffer;
>>     u32            *ptr;
>> +    unsigned int        written;
> 
> nit: since everywhere we use "len" for the number of dwords, it would
> probably make more sense here. As well as s/buffer/bounce/ in the
> previous patch... but not critical.

I opted to leave both as is since to me current names read a bit more 
obvious. Especially written. Bounce makes sense but I wanted to make it 
bounce_buffer to look less weird, but then it was long, so left it all.

> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks!

Regards,

Tvrtko

> 
> Lucas De Marchi
> 
> 
>> };
>>
>> static int setup_bo(struct bo_setup_state *state)
>> @@ -1023,6 +1024,7 @@ static int setup_bo(struct bo_setup_state *state)
>>             goto fail;
>>
>>         state->ptr += len;
>> +        state->written += len;
>>     }
>>
>>     return 0;
>> @@ -1039,7 +1041,7 @@ static void finish_bo(struct bo_setup_state *state)
>>
>>     xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
>>              state->offset, state->buffer,
>> -             (state->ptr - state->buffer) * sizeof(u32));
>> +             state->written * sizeof(u32));
>>     kfree(state->buffer);
>> }
>>
>> @@ -1063,6 +1065,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, 
>> struct xe_hw_engine *hwe)
>>         return ret;
>>
>>     *state.ptr++ = MI_BATCH_BUFFER_END;
>> +    state.written++;
>>
>>     finish_bo(&state);
>>
>> -- 
>> 2.48.0
>>

