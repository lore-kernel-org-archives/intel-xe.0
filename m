Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D5AC83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 09:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC9C10E6AF;
	Wed,  2 Jul 2025 09:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ko5SKK3T";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A923710E6AF
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/5F3EpLQHUWsnSh7SGN6EDNRAaFg1Zq+MHgrXt+CfSM=; b=Ko5SKK3TAbSTolCR0KvuLaBMbe
 yurXIQKLgWlVVzart0gRF/kAtjx3P8XR1QQRhr0zZg0oRoF7OeL/9XqKdpZmg4W1xErQReXS7hBTg
 SqD3uJVu9aJWShu2qWRLS4DW9yzqzD07bic5tLiyV7BeTPYSbqQHX5jpABldgtp0lV9wID7y/9Szq
 HIcKrZ137ZEuh9atbesJbKozNomh64MhxahxPvZO93KPvWkF10rzmXD/7YMeOmz1ogRQF4n2MiX82
 uq2qoJzboI0rVkOn4ucYJMWaX6fFPJzCrT8aPjH8wiBKJtJBm8MLbDDXXQkQbWqhiqhWY1Bz3NlMx
 JHdv/HgQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uWu5n-00BOVp-Aw; Wed, 02 Jul 2025 11:49:27 +0200
Message-ID: <1b87eb6e-6a37-4a61-9e0b-158ca27c3969@igalia.com>
Date: Wed, 2 Jul 2025 10:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] drm/xe: Generalize wa bb emission code
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250630122244.7949-1-tvrtko.ursulin@igalia.com>
 <20250630122244.7949-3-tvrtko.ursulin@igalia.com>
 <y774muxwsly4v76txbtqrixk5zxse7dj3b77qi3ge2vypmrgv6@ljviakys45th>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <y774muxwsly4v76txbtqrixk5zxse7dj3b77qi3ge2vypmrgv6@ljviakys45th>
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


On 02/07/2025 06:13, Lucas De Marchi wrote:
> On Mon, Jun 30, 2025 at 01:22:38PM +0100, Tvrtko Ursulin wrote:
>> Generalize the wa bb emission by splitting it into three phases - setup,
>> emit and finish, and extract setup and finish steps into helpers.
>>
>> This will enable using the same infrastructure for emitting the indirect
>> context workarounds.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_lrc.c | 77 +++++++++++++++++++++++++------------
>> 1 file changed, 53 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index d2ad8fe737eb..c07fe23e5e73 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -972,32 +972,37 @@ static ssize_t wa_bb_setup_utilization(struct 
>> xe_lrc *lrc, struct xe_hw_engine *
>>     return cmd - batch;
>> }
>>
>> -struct wa_bb_setup {
>> +struct wa_bo_setup {
>>     ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>              u32 *batch, size_t max_size);
>> };
>>
>> -static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>> +static u32 *
>> +setup_wa_bo(struct xe_lrc *lrc,
>> +        struct xe_hw_engine *hwe,
>> +        const size_t max_size,
>> +        unsigned int offset,
>> +        const struct wa_bo_setup *funcs,
>> +        unsigned int num_funcs,
>> +        u32 **free)
>> {
>> -    const size_t max_size = LRC_WA_BB_SIZE;
>> -    static const struct wa_bb_setup funcs[] = {
>> -        { .setup = wa_bb_setup_utilization },
>> -    };
>> +    u32 *cmd, *buf = NULL;
>>     ssize_t remain;
>> -    u32 *cmd, *buf = NULL;
>>
>>     if (lrc->bo->vmap.is_iomem) {
>>         buf = kmalloc(max_size, GFP_KERNEL);
>>         if (!buf)
>> -            return -ENOMEM;
>> +            return ERR_PTR(-ENOMEM);
>>         cmd = buf;
>> +        *free = buf;
>>     } else {
>> -        cmd = lrc->bo->vmap.vaddr + __xe_lrc_wa_bb_offset(lrc);
>> +        cmd = lrc->bo->vmap.vaddr + offset;
>> +        *free = NULL;
>>     }
>>
>>     remain = max_size / sizeof(*cmd);
>>
>> -    for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
>> +    for (size_t i = 0; i < num_funcs; i++) {
>>         ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
>>
>>         remain -= len;
>> @@ -1012,23 +1017,47 @@ static int setup_wa_bb(struct xe_lrc *lrc, 
>> struct xe_hw_engine *hwe)
>>         cmd += len;
>>     }
>>
>> -    *cmd++ = MI_BATCH_BUFFER_END;
>> -
>> -    if (buf) {
>> -        xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
>> -                 __xe_lrc_wa_bb_offset(lrc), buf,
>> -                 (cmd - buf) * sizeof(*cmd));
>> -        kfree(buf);
>> -    }
>> -
>> -    xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, 
>> xe_bo_ggtt_addr(lrc->bo) +
>> -                 __xe_lrc_wa_bb_offset(lrc) + 1);
>> -
>> -    return 0;
>> +    return cmd;
>>
>> fail:
>>     kfree(buf);
>> -    return -ENOSPC;
>> +    return ERR_PTR(-ENOSPC);
>> +}
>> +
>> +static void finish_wa_bo(struct xe_lrc *lrc,
>> +             unsigned int offset,
>> +             u32 *cmd,
>> +             u32 *free)
>> +{
>> +    if (!free)
>> +        return;
>> +
>> +    xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap, offset, free,
>> +             (cmd - free) * sizeof(*cmd));
>> +    kfree(free);
>> +}
>> +
>> +static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>> +{
>> +    static const struct wa_bo_setup funcs[] = {
>> +        { .setup = wa_bb_setup_utilization },
>> +    };
>> +    unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
>> +    u32 *cmd, *buf = NULL;
>> +
>> +    cmd = setup_wa_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
>> +              ARRAY_SIZE(funcs), &buf);
> 
> I'm not seeing much advantage in this generalization when then you need
> to extend it with the free pointer (which is then also used for offset),
> and number of written words etc. I understand what you did with 
> setup_wa_bo and setup_wa_bb, but they are soo similar it looks like a
> typo.
> 
> Can we keep the wa_bb and indirect_ctx separate and eventually merge
> them  through helpers rather than making the wa_bb stuff fit the needs
> of indirect ctx? In other words, go straight to patch 6.

Hm I don't exactly follow the critique. Apart from the bb vs bo in the 
naming, but that can be easily improved.

Purpose of the generalisation is that there is one copy of the much of 
the code and vfuncs which emit stuff can be shared and used for either 
wa_bb or indirect ctx. In a way setup_wa_bo() and finish_wa_bo() are 
helpers. Helpers for anyone who wants to emit a series of commads to 
some BO+offset.

Apart from avoiding duplication the ability to share is super 
interesting for workarounds which need to use different mechanism 
depending on the engine. For example the CTX_TIMESTAMP wa, which Matt 
found BSpec calls to be emitted from the indirect ctx for RCS and as 
wa_bb for the rest.

If we look at the end result (trimmed a bit for the purpose of comparison):

static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
{
	static const struct wa_bo_setup funcs[] = {
		{ .setup = setup_timestamp_wa },
		{ .setup = setup_invalidate_state_cache_wa },
		{ .setup = setup_utilization_wa },
	};
	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
	unsigned int written = 0;
	u32 *cmd, *buf = NULL;

	cmd = setup_wa_bo(lrc, hwe, LRC_WA_BB_SIZE, 1, offset, funcs,
			  ARRAY_SIZE(funcs), &buf, &written);
	if (IS_ERR(cmd))
		return PTR_ERR(cmd);

	*cmd++ = MI_BATCH_BUFFER_END;
	written++;

	finish_wa_bo(lrc, offset, written, buf);

	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
			     xe_bo_ggtt_addr(lrc->bo) + offset + 1);

	return 0;
}

static int
setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
{
	static struct wa_bo_setup rcs_funcs[] = {
		{ .setup = setup_timestamp_wa },
		{ .setup = setup_invalidate_auxccs_wa },
	};
	unsigned int offset, written = 0;
	u32 *cmd, *buf = NULL;

	offset = __xe_lrc_indirect_ctx_offset(lrc);

	cmd = setup_wa_bo(lrc, hwe, LRC_INDIRECT_CTX_SIZE, 15, offset, rcs_funcs,
			  ARRAY_SIZE(rcs_funcs), &buf, &written);
	if (IS_ERR(cmd))
		return PTR_ERR(cmd);

	/* Align to 64B cacheline. */
	while ((unsigned long)cmd & 0x3f) {
		*cmd++ = MI_NOOP;
		written++;
	}

	finish_wa_bo(lrc, offset, written, buf);

	xe_lrc_write_ctx_reg(lrc,
			     CTX_CS_INDIRECT_CTX,
			     (xe_bo_ggtt_addr(lrc->bo) + offset) |
			     /* Size in CLs. */
			     (written * sizeof(u32) / 64));
	xe_lrc_write_ctx_reg(lrc,
			     CTX_CS_INDIRECT_CTX_OFFSET,
			     XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6);

	return 0;
}

I thought something like this was what you wanted from the earlier 
discussion, when I waited for you to land "drm/xe/lrc: Prepare WA BB 
setup for more users" and then rebased this on top of it.

But if it still does not look clean to you I can rewrite it with code 
duplication if that is what you definitely want, no problem.

Regards,

Tvrtko

>> +    if (IS_ERR(cmd))
>> +        return PTR_ERR(cmd);
>> +
>> +    *cmd++ = MI_BATCH_BUFFER_END;
>> +
>> +    finish_wa_bo(lrc, offset, cmd, buf);
>> +
>> +    xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>> +                 xe_bo_ggtt_addr(lrc->bo) + offset + 1);
>> +
>> +    return 0;
>> }
>>
>> #define PVC_CTX_ASID        (0x2e + 1)
>> -- 
>> 2.48.0
>>

