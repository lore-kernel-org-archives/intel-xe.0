Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7923C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 09:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9453510E900;
	Thu, 30 Jan 2025 09:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IrgY9yk0";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BD910E900
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 09:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5FKazBtC6grl5ip928N1rNX2SCJlAt67OaNQYdUBzBM=; b=IrgY9yk0RHi8vBDM9FwaeiNfUI
 iGQTuSf+de4+jcw9G41tthQGo3ZumBcZJSryJp3m8EKIrJk3i+xyYWpwCWbe8b5vVyIl/cSVhvmBj
 d+6cFjtfg7j6TAc7ZC3dFB3IrAsAMzCMKPZoFLj5Kyj9+PiIGO3n5qzHeAEAkYQuzH3K1TV47+1s+
 TNqZsAmYhafSQB+vlJn3vj8hDEw5liJOG0Re7ZlBA5iB6k4Q2PJ9vvbG0Q9DhSGCSYnXcHQvQWcFz
 zedTr5Yqs4Izh5vpmXidWDF87+czxQET/xv2dzifnS0wK+pXNTTJZg0L3M2afQ+cnrcVDURl5Z8TG
 SZ+BiJmw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tdQjQ-000y0y-H0; Thu, 30 Jan 2025 10:21:10 +0100
Message-ID: <28080856-7424-4ce0-99a9-2e683ecfb564@igalia.com>
Date: Thu, 30 Jan 2025 09:21:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe/gen12: Add Wa_1604555607
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
 <20250129155627.93827-3-tvrtko.ursulin@igalia.com>
 <o7lfhuxhj3yllz2aytlh4ljfyz4233by6dihardi4hjjjg6vpw@rdim3m54gzr7>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <o7lfhuxhj3yllz2aytlh4ljfyz4233by6dihardi4hjjjg6vpw@rdim3m54gzr7>
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


On 29/01/2025 18:12, Lucas De Marchi wrote:
> On Wed, Jan 29, 2025 at 03:56:24PM +0000, Tvrtko Ursulin wrote:
>> According to the i915 code base, apart from setting the GS timer, all
>> Gen12 platforms should also set the TDS timer. Make it so.
> 
> I have a faint memory of that actually being wrong and got removed
> in cedbc0b75790 ("drm/xe: Fix duplicated setting for register 0x6604")
> while fixing another bug.

Hm cedbc0b75790 does not really explain why it removed Wa_1604555607. It 
wasn't simply a duplicate setting as that commit explains, but the same 
register with different bits set (which is also not visible from the log 
pasted in the commit.)

I think a definitive answer is needed to whether the TDS part is 
applicable to Gen12 or not. If not we need to remove it from i915 as well.

But again, the comment added in 2b5298b0aa09 suggests someone got the 
information from somewhere that TDS tuning is needed even on platforms 
which don't explicitly list that WA.

Regards,

Tvrtko

> The TDS remains for DG2:
> 
>          { XE_RTP_NAME("Tuning: TDS gang timer"),
>            XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>            /* read verification is ignored as in i915 - need to check 
> enabling */
>            XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(XEHP_FF_MODE2,
>                                                  FF_MODE2_TDS_TIMER_MASK,
>                                                  FF_MODE2_TDS_TIMER_128))
>          },
> 
> Lucas De Marchi
> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> References: 2b5298b0aa09 ("drm/i915/gen12: Add recommended hardware 
>> tuning value")
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>> This needs checking by someone with access to the proper docs and proper
>> workaround database.
>> ---
>> drivers/gpu/drm/xe/xe_tuning.c | 8 +++++---
>> 1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c 
>> b/drivers/gpu/drm/xe/xe_tuning.c
>> index d449de0fb6ec..9e7ec36dbd47 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -97,12 +97,14 @@ static const struct xe_rtp_entry_sr 
>> engine_tunings[] = {
>> };
>>
>> static const struct xe_rtp_entry_sr lrc_tunings[] = {
>> -    { XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
>> +    { XE_RTP_NAME("Tuning: ganged timers, also known as 16011163337 
>> and 1604555607"),
>>       XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), 
>> ENGINE_CLASS(RENDER)),
>>       /* read verification is ignored due to 1608008084. */
>>       XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
>> -                        FF_MODE2_GS_TIMER_MASK,
>> -                        FF_MODE2_GS_TIMER_224))
>> +                        FF_MODE2_GS_TIMER_MASK |
>> +                        FF_MODE2_TDS_TIMER_MASK,
>> +                        FF_MODE2_GS_TIMER_224 |
>> +                        FF_MODE2_TDS_TIMER_128))
> 
> this got removed in commit cedbc0b75790 ("drm/xe: Fix duplicated setting
> for register 0x6604")
> 
> 
>>     },
>>
>>     /* DG2 */
>> -- 
>> 2.48.0
>>
