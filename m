Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A4AC83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 07:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8EC10E043;
	Wed,  9 Jul 2025 07:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sZro8grJ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8790810E043
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cqpDgxK+oJUK8U+Mjh3fn7n7K6lN/KQHzXv/1OYOM8k=; b=sZro8grJopomW1n5e4g0SKWsfs
 E6tGmdow2LS2D4XRHLZntWoym63t9HzSPdF/QZEFJU0eNrL+/vWhMTlNo8vt2/en+5GXvdq0zulLA
 PFcwt7ghcO8y60CS1Wq1BMd3QjZVg/XUDmqlKDVFsbREqnxXxpkZjK8wTV1NbOSeupWTLcVwRwb94
 ylFAHTqNzQ6fWBavnKVmgpYUPYSZolHWXo5D0izfHatRCCG27ygkxLpRl9LfeFB1V41lrUIx882Nm
 c4I5i/05q6r8xUa72ikosOpCYSD8gZAFY1z8V8L/QBEwkqRAa6RRugkV92HyU3L1r/nqiVfjqRpJP
 ikd/jh8w==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZPZD-00EMpp-Mb; Wed, 09 Jul 2025 09:50:11 +0200
Message-ID: <fbcfa852-52b7-4379-b1fe-8970dae86bb3@igalia.com>
Date: Wed, 9 Jul 2025 08:50:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/7] drm/xe: Allow specifying number of extra dwords at
 the end of wa bb emission
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
 <20250703082059.61597-5-tvrtko.ursulin@igalia.com>
 <n6f2fvsjh6rjlniapfjzyumhxhcwpk2ybaanw7vm3tabw4zciy@4yrhtybyesm5>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <n6f2fvsjh6rjlniapfjzyumhxhcwpk2ybaanw7vm3tabw4zciy@4yrhtybyesm5>
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
> On Thu, Jul 03, 2025 at 09:20:56AM +0100, Tvrtko Ursulin wrote:
>> Indirect context setup will need more than one.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_lrc.c | 8 ++++----
>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 7f8911a10cc9..e278c12a41f9 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -982,6 +982,7 @@ static u32 *
>> setup_bo(struct xe_lrc *lrc,
>>      struct xe_hw_engine *hwe,
>>      const size_t max_size,
>> +     unsigned int reserve_dw,
>>      unsigned int offset,
>>      const struct bo_setup *funcs,
>>      unsigned int num_funcs,
> 
> one by one these arguments make sense. Together they are pretty hard to
> add a call to this function. We will probably need to change this to
> keep the state separate or something like that.

Yes it is not the prettiest. From what we talked before I understood you 
are okay to leave the conversion to a struct state for later, but if you 
want I can try something straight away.

Regards,

Tvrtko

>> @@ -1010,10 +1011,9 @@ setup_bo(struct xe_lrc *lrc,
>>         remain -= len;
>>
>>         /*
>> -         * There should always be at least 1 additional dword for
>> -         * the end marker
>> +         * Caller has asked for at least reserve_dw to remain unused.
>>          */
>> -        if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < 1))
>> +        if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < reserve_dw))
>>             goto fail;
>>
>>         cmd += len;
>> @@ -1049,7 +1049,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, 
>> struct xe_hw_engine *hwe)
>>     unsigned int written = 0;
>>     u32 *cmd, *buf = NULL;
>>
>> -    cmd = setup_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
>> +    cmd = setup_bo(lrc, hwe, LRC_WA_BB_SIZE, 1, offset, funcs,
>>                ARRAY_SIZE(funcs), &buf, &written);
>>     if (IS_ERR(cmd))
>>         return PTR_ERR(cmd);
>> -- 
>> 2.48.0
>>

