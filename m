Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6ACC83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 07:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D7E10E043;
	Wed,  9 Jul 2025 07:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KPaSKw3a";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB26210E043
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 07:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pe+Kev3qB6PF6YiajdBxJZRj4dgj7WHYRCnh5P3VPnM=; b=KPaSKw3aD782/D2yMBhWaIyFtc
 ZxizADa0obfD4aHsHH8dW3rz4pvxpmrpCrw9A6m5CWV2+meKEOrJxQVfHGHH/dd3hXQAAm/Vqklsr
 tAavc7SHVMX+82OExRGNfPfJbIb5UsF3ZmKBzY8h3WXtF4VbRxIyVRax6yD+yc6RiZFWKoRcf43Sa
 FlWv6msN0+MKwMMWXyGffW0aYFQGaIkPC2jTX7LnQ05BPnfEGPbPzF+F8ZdIJSIUdk0riRJtdHc3I
 Wx0NRJgD41EGyXmQkhZq7SQEE/FZMLpvkSd8JapZBEhHVreAfMK9iVoU/JxEJSGYpTTbYarC4LCst
 GriQOUzg==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZPXy-00EMnO-Sz; Wed, 09 Jul 2025 09:48:54 +0200
Message-ID: <b462e838-55e5-4578-8b40-77f74c13d6ed@igalia.com>
Date: Wed, 9 Jul 2025 08:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] drm/xe: Return number of written dwords from
 workaround batch buffer emission
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
 <20250703082059.61597-4-tvrtko.ursulin@igalia.com>
 <gmq72whamose6gbfnbb7j4wlcjueg4sf3jyby4xbtxhvsakinm@66ts3yntuvzf>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <gmq72whamose6gbfnbb7j4wlcjueg4sf3jyby4xbtxhvsakinm@66ts3yntuvzf>
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


On 08/07/2025 23:11, Lucas De Marchi wrote:
> On Thu, Jul 03, 2025 at 09:20:55AM +0100, Tvrtko Ursulin wrote:
>> Indirect context setup will need to get to the number of written dwords.
>> Lets add it as an output parameter so it can be accessed from the caller
>> regardless of whether code is writing directly or via an shadow buffer.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_lrc.c | 16 +++++++++++-----
>> 1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index edd8751b164a..7f8911a10cc9 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -985,7 +985,8 @@ setup_bo(struct xe_lrc *lrc,
>>      unsigned int offset,
>>      const struct bo_setup *funcs,
>>      unsigned int num_funcs,
>> -     u32 **free)
>> +     u32 **free,
>> +     unsigned int *written)
>> {
>>     u32 *cmd, *buf = NULL;
>>     ssize_t remain;
>> @@ -1016,6 +1017,8 @@ setup_bo(struct xe_lrc *lrc,
>>             goto fail;
>>
>>         cmd += len;
>> +        if (written)
>> +            *written += len;
>>     }
>>
>>     return cmd;
>> @@ -1026,13 +1029,14 @@ setup_bo(struct xe_lrc *lrc,
>> }
>>
>> static void
>> -finish_bo(struct xe_lrc *lrc, unsigned int offset, u32 *cmd, u32 *free)
>> +finish_bo(struct xe_lrc *lrc, unsigned int offset, unsigned int written,
>> +      u32 *free)
>> {
>>     if (!free)
>>         return;
>>
>>     xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap, offset, free,
>> -             (cmd - free) * sizeof(*cmd));
>> +             written * sizeof(u32));
>>     kfree(free);
>> }
>>
>> @@ -1042,16 +1046,18 @@ static int setup_wa_bb(struct xe_lrc *lrc, 
>> struct xe_hw_engine *hwe)
>>         { .setup = setup_utilization_wa },
>>     };
>>     unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
>> +    unsigned int written = 0;
>>     u32 *cmd, *buf = NULL;
>>
>>     cmd = setup_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
>> -               ARRAY_SIZE(funcs), &buf);
>> +               ARRAY_SIZE(funcs), &buf, &written);
>>     if (IS_ERR(cmd))
>>         return PTR_ERR(cmd);
>>
>>     *cmd++ = MI_BATCH_BUFFER_END;
>> +    written++;
>>
>> -    finish_bo(lrc, offset, cmd, buf);
>> +    finish_bo(lrc, offset, written, buf);
> 
> we should still have cmd in this call, right? But in the next patch the
> cmd should be gone as it's then unused.

No, it is already unused in this patch. Explicitly counting dwords 
written replaced the "end - start" pointer arithmetic.

Regards,

Tvrtko

> 
> Lucas De Marchi
> 
>>
>>     xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>>                  xe_bo_ggtt_addr(lrc->bo) + offset + 1);
>> -- 
>> 2.48.0
>>

