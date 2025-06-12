Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14135C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 10:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E4310E177;
	Thu, 12 Jun 2025 10:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mb3rId41";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D120D10E177
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OxBP9UjRn8EyI133m2b6kQrDVutAlJ/ERuq3sQ/eaVQ=; b=mb3rId41r4InRspeT9s+eahEoh
 e0tLzx8X0PMKrpTFkq5dpkAXaJ7Jq59eu581SdRkUZq8QvpOHGQxpMYv7CMl98AQ6CjL10KSQxiVW
 +7jiUD7gZvED7x0qet4qR0hsfvI9xA9zKuwyvhP9jGChhs7VFuyelh9X/qmJ6Ag185t9ORy7fKnRp
 quMs3FMce6XXvFNpvgmQTZZ2ypo7DNr6n1rrDduQhxlw1r4Voa7XL3ahl7SNKUCSn0dzKnaDui9oT
 NCxF9sur8wgoMmPFsAqFNf3gH2V5o7T7F/SCzA2gA3gigRHb6tyb+MHFpSnB+jvb+Wj+9cF41rW1P
 ukjBS5Qg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPeuq-002aCC-TP; Thu, 12 Jun 2025 12:12:12 +0200
Message-ID: <77c38d86-2e77-4858-876d-5c09000c62e6@igalia.com>
Date: Thu, 12 Jun 2025 11:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/lrc: Prepare WA BB setup for more users
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
 <20250604-wa-bb-fix-v1-2-0dfc5dafcef0@intel.com>
 <49b2fe81-24dd-474a-8030-ee692919a68d@igalia.com>
 <km7hclspp5nxwnbrwal2r3bbrep3qw5casj2xsuvb2lsggeulv@m2noyiptlctl>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <km7hclspp5nxwnbrwal2r3bbrep3qw5casj2xsuvb2lsggeulv@m2noyiptlctl>
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


On 11/06/2025 21:18, Lucas De Marchi wrote:
> On Mon, Jun 09, 2025 at 01:01:49PM +0100, Tvrtko Ursulin wrote:
>>
>> On 04/06/2025 16:03, Lucas De Marchi wrote:
>>> The post context restore (WA BB) is a mechanism in HW that may be used
>>> for things other than the utilization setup. Create a new function
>>> called setup_wa_bb() that wraps any function writing useful commands in
>>> the buffer.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_lrc.c | 69 +++++++++++++++++++++++++++++++++++ 
>>> +---------
>>>  1 file changed, 55 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>> index bf7c3981897de..529c6a972a55b 100644
>>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>>> @@ -914,9 +914,8 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>>  }
>>>  /*
>>> - * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating 
>>> active
>>> - * context run ticks.
>>> - * @lrc: Pointer to the lrc.
>>> + * wa_bb_setup_utilization() - Write commands to wa bb to assist
>>> + * in calculating active context run ticks.
>>>   *
>>>   * Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run 
>>> ticks of the
>>>   * context, but only gets updated when the context switches out. In 
>>> order to
>>> @@ -941,18 +940,13 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>>   * store it in the PPHSWP.
>>>   */
>>>  #define CONTEXT_ACTIVE 1ULL
>>> -static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>>> +static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct 
>>> xe_hw_engine *hwe,
>>> +                       u32 *batch, size_t max_len)
>>>  {
>>> -    u32 *cmd, *buf = NULL;
>>> +    u32 *cmd = batch;
>>> -    if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>>> -        buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
>>> -        if (!buf)
>>> -            return -ENOMEM;
>>> -        cmd = buf;
>>> -    } else {
>>> -        cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>>> -    }
>>> +    if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
>>> +        return -ENOSPC;
>>
>> Hand counted check is a little bit error prone or could go out of sync 
>> but I have no better suggestions apart to maybe removing it altogether 
>> and relying on the main warning in setup_wa_bb() catching all errors 
>> during patch development?
> 
> humn ... but the main warning relies on each individual function to
> report the count. I don't think it's a good option to overflow the array
> and then later warn about the overflow.

Main point was that if the hand counted value was under counted, in 
theory the post assert can also be too late. So in theory, should the 
total emitted ever go past the PAGE_SIZE buffer, hand counted plus post 
assert is also not 100%.

> Here it was easy to just give a max. In other places where the size is
> more dynamic (coming from configfs) I use the 2 steps approach: first
> count the number of entries needed and second write them to the output.

Okay that works.

If that ended up too complicated, another option could be for each emit 
function to emit to a separate common scratch buffer, whose writen part 
is then copied over into the final buffer by the function which iterates 
the emit function array.

But never mind, it is probably over complicating things.

Regards,

Tvrtko

>>
>>>      *cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | 
>>> MI_SRM_ADD_CS_OFFSET;
>>>      *cmd++ = ENGINE_ID(0).addr;
>>> @@ -971,6 +965,49 @@ static int xe_lrc_setup_utilization(struct 
>>> xe_lrc *lrc)
>>>          *cmd++ = upper_32_bits(CONTEXT_ACTIVE);
>>>      }
>>> +    return cmd - batch;
>>> +}
>>> +
>>> +struct wa_bb_setup {
>>> +    ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>> +             u32 *batch, size_t max_size);
>>> +};
>>> +
>>> +static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>> +{
>>> +    const size_t max_size = lrc->bb_per_ctx_bo->size;
>>> +    static const struct wa_bb_setup funcs[] = {
>>> +        { .setup = wa_bb_setup_utilization },
>>> +    };
>>> +    ssize_t remain;
>>> +    u32 *cmd, *buf = NULL;
>>> +
>>> +    if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>>> +        buf = kmalloc(max_size, GFP_KERNEL);
>>> +        if (!buf)
>>> +            return -ENOMEM;
>>> +        cmd = buf;
>>> +    } else {
>>> +        cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>>> +    }
>>> +
>>> +    remain = max_size / sizeof(*cmd);
>>> +
>>> +    for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
>>> +        ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
>>> +
>>> +        remain -= len;
>>> +
>>> +        /*
>>> +         * There should always be at least 1 additional dword for
>>> +         * the end marker
>>> +         */
>>> +        if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < 1))
>>> +            goto fail;
>>> +
>>> +        cmd += len;
>>> +    }
>>> +
>>>      *cmd++ = MI_BATCH_BUFFER_END;
>>>      if (buf) {
>>> @@ -983,6 +1020,10 @@ static int xe_lrc_setup_utilization(struct 
>>> xe_lrc *lrc)
>>>                   xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>>>      return 0;
>>> +
>>> +fail:
>>> +    kfree(buf);
>>> +    return -ENOSPC;
>>>  }
>>>  #define PVC_CTX_ASID        (0x2e + 1)
>>> @@ -1139,7 +1180,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, 
>>> struct xe_hw_engine *hwe,
>>>      map = __xe_lrc_start_seqno_map(lrc);
>>>      xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 
>>> 1);
>>> -    err = xe_lrc_setup_utilization(lrc);
>>> +    err = setup_wa_bb(lrc, hwe);
>>>      if (err)
>>>          goto err_lrc_finish;
>>>
>>
>> LGTM, I did not spot any mistakes and I can easily rebase mine on top 
>> of this. And follow the same pattern for indirect context.
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> thanks
> Lucas De Marchi
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>

