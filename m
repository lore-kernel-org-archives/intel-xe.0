Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928AAC282D1
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 16:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF1C10E074;
	Mon,  3 Mar 2025 16:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jCSx7F7g";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B40710E074
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZUUysojtgfsyI40cJeBRgaPE011J6Kxyod4oBhIqGS0=; b=jCSx7F7gDJ7bHscPL+B4JR1RzD
 FKkB2vUdzy5B+4Uv9e3fmFTXnAq9f7r4OARGOhd0kDcGbqib1Sujk2IlHe4XouxRJ4wBgEfmXBykd
 1byuYrNoaxrf2aYmsWXN/s+opnGam3d0GjmpEgsGUgAj0vE094r+hiNynuum7a9iD3W/iKkBOYlYK
 YLShGoYgyc6V1jGgSsU+utLZvlToq0+6+mTUA4yM8jlS531mfokXg1zT4nT2BKOL5EAv3Vks/u95r
 r40QRv4KxsAp8dVzw3sDs0tgW8HmATGr6+TXPL/DpkqAMLb5FbvfktZtc4IoAXNu8bV/xXwLXen4e
 rMZkq78A==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tp8eS-003L81-H3; Mon, 03 Mar 2025 17:28:26 +0100
Message-ID: <77d5bdaf-aec1-4f26-8fb9-9e32a716d263@igalia.com>
Date: Mon, 3 Mar 2025 16:28:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/xelp: L3 recommended hashing mask
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
 <20250227101304.46660-5-tvrtko.ursulin@igalia.com>
 <20250227212110.GS4460@mdroper-desk1.amr.corp.intel.com>
 <ieloss43p2xdjidty3kszv3gcwsygnchmjt63xi46urx55t7kt@bqc7juwqgdab>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <ieloss43p2xdjidty3kszv3gcwsygnchmjt63xi46urx55t7kt@bqc7juwqgdab>
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


On 01/03/2025 05:48, Lucas De Marchi wrote:
> On Thu, Feb 27, 2025 at 01:21:10PM -0800, Matt Roper wrote:
>> On Thu, Feb 27, 2025 at 10:13:03AM +0000, Tvrtko Ursulin wrote:
>>> According to the i915 codebase xe missed to set the recommended
>>> performance tuning for L3 hashing which is applicable to all legacy XeLP
>>> platforms. Lets add it.
>>>
>>> v2:
>>>  * Rename prefixes to XELP_.
>>>  * Tweak version end point.
>>>
>>> v3:
>>>  * Add bspec tag.
>>>  * Tweak version range.
>>>
>>> v4:
>>>  * Move from LRC to engine tunings list.
>>>
>>> Bspec: 31870
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> References: c46c5fb725be ("drm/i915/gen12: Apply recommended L3 
>>> hashing mask")
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 ++++-
>>>  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/ 
>>> xe/regs/xe_gt_regs.h
>>> index 282afd22b68b..da833a147c0c 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -365,10 +365,13 @@
>>>  #define FORCEWAKE_MEDIA_VEBOX(n)        XE_REG(0xa560 + (n) * 4)
>>>  #define FORCEWAKE_GSC                XE_REG(0xa618)
>>>
>>> +/* L3 Cache Control */
>>
>> Did you mean to move this comment?  This was originally intended to
>> refer to the "l3cc" MOCS values in the LNCFMOCS registers that people
>> may remember from older platforms on i915.  Even though 0xb004 is also
>> doing L3-related stuff, it's not providing the specific l3cc values the
>> comment here was originally written for.
>>
>> I'd be inclined to just drop the comment completely at this point; I'm
>> not sure it's really providing any useful insight to anyone.
>>
>> Anyway, the actual tuning looks correct, so aside from the comment,
>>
>>        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> I dropped that comment and applied everything to drm-xe-next.

Thanks!

Regards,

Tvrtko

>>
>>
>> Matt
>>
>>> +#define XELP_GARBCNTL                XE_REG(0xb004)
>>> +#define   XELP_BUS_HASH_CTL_BIT_EXC        REG_BIT(7)
>>> +
>>>  #define XEHPC_LNCFMISCCFGREG0            XE_REG_MCR(0xb01c, 
>>> XE_REG_OPTION_MASKED)
>>>  #define   XEHPC_OVRLSCCC            REG_BIT(0)
>>>
>>> -/* L3 Cache Control */
>>>  #define LNCFCMOCS_REG_COUNT            32
>>>  #define XELP_LNCFCMOCS(i)            XE_REG(0xb020 + (i) * 4)
>>>  #define XEHP_LNCFCMOCS(i)            XE_REG_MCR(0xb020 + (i) * 4)
>>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/ 
>>> xe_tuning.c
>>> index 3c78f3d71559..551c2f308e1c 100644
>>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>>> @@ -88,6 +88,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>>  };
>>>
>>>  static const struct xe_rtp_entry_sr engine_tunings[] = {
>>> +    { XE_RTP_NAME("Tuning: L3 Hashing Mask"),
>>> +      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
>>> +               FUNC(xe_rtp_match_first_render_or_compute)),
>>> +      XE_RTP_ACTIONS(CLR(XELP_GARBCNTL, XELP_BUS_HASH_CTL_BIT_EXC))
>>> +    },
>>>      { XE_RTP_NAME("Tuning: Set Indirect State Override"),
>>>        XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
>>>                 ENGINE_CLASS(RENDER)),
>>> -- 
>>> 2.48.0
>>>
>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation

