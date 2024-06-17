Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81BAC2BA15
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 15:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669D510E42C;
	Mon, 17 Jun 2024 15:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjaumDbp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E50210E41F
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718637142; x=1750173142;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QVEpF4QsnaDDA3x4fJ+sdT2DQYkt2JU/vWNtOXHR6IA=;
 b=bjaumDbpwIWV5nApkoAUekgDyQxwwOlhXIfRNhtLGr6Y0ELgf/HF58wC
 9jFEkdzqiQLbo8GunCuNDomR5Q9JbejAjjTDFEesqtbYpoNT8z48/KaAJ
 bEryjaXrBvadZquLZsip0WcvCEYxH3bAs+O7EnfPLLxssN0tF0TgAIFLw
 tvoCkPqM9v2HDdNIP/66Vi2615exHfYVjfYr3OpGQESpSq+mAC0dqt/r0
 0LSFgrW4K2I+or02mP4tbSKgIrtNqLMHI+kQpkHNoVH7ZgB9PW4OaiRZ+
 Y7zt/8+bEZqq+bw6oMXQSaVrFxDfWVjrCQygKVSDQyVvLcbs0y+dBIsJ+ A==;
X-CSE-ConnectionGUID: lns0Igc8SGmrAVsOOfsxHQ==
X-CSE-MsgGUID: aXECPrBNTISq3ibvJbRG8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26883765"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="26883765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 08:12:22 -0700
X-CSE-ConnectionGUID: s4wyj+bNT0atuS9mJvTIUA==
X-CSE-MsgGUID: U2vGyIrWRoKq0G8ExhomeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41322449"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 17 Jun 2024 08:12:20 -0700
Received: from [10.245.119.62] (unknown [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D3C73333F7;
 Mon, 17 Jun 2024 16:12:18 +0100 (IST)
Message-ID: <743a2e43-22d9-4ebd-bd93-5abf30b0918d@intel.com>
Date: Mon, 17 Jun 2024 17:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/kunit: Update RTP test to check VF rules
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240614214821.2252-1-michal.wajdeczko@intel.com>
 <20240614214821.2252-3-michal.wajdeczko@intel.com>
 <ia5y6be2re3cu3ulht6exduszz6fsn2ana42kxbkxhjxrccf4m@z7ud43xwjdlh>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ia5y6be2re3cu3ulht6exduszz6fsn2ana42kxbkxhjxrccf4m@z7ud43xwjdlh>
Content-Type: text/plain; charset=UTF-8
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



On 17.06.2024 16:48, Lucas De Marchi wrote:
> On Fri, Jun 14, 2024 at 11:48:21PM GMT, Michal Wajdeczko wrote:
>> Add basic test cases that will verify VF_READY and VF_ONLY rules.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/tests/xe_rtp_test.c | 118 ++++++++++++++++++++++++-
>> 1 file changed, 117 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> index 06759d754783..0d8731e13217 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> @@ -232,6 +232,109 @@ static const struct rtp_test_case cases[] = {
>>             {}
>>         },
>>     },
>> +    {
>> +        .name = "vf-ready",
>> +        .expected_reg = REGULAR_REG1,
>> +        .expected_set_bits = REG_BIT(0),
>> +        .expected_clr_bits = REG_BIT(0),
>> +        .expected_count = 1,
>> +        /* VF-ready does not impact native/PF */
> 
> this contradicts the above expected*bits

hmm, but why ?

by design the VF_READY is a markup that should have no impact for any
rules that are executed on the native/PF so in this test case bits shall
be as specified by the action, which is REG_BIT(0)

did I missed something ?

> 
>> +        .entries = (const struct xe_rtp_entry_sr[]) {
>> +            { XE_RTP_NAME("basic-1"),
>> +              XE_RTP_RULES(FUNC(match_yes), VF_READY),
> 
> I was wondering if "VF_READY" wouldn't be more a case for entry->flags
> rather than entry->rules. 

I just followed IS_INTEGRATED/IS_DISCRETE as I could easily understand
what they do

> Do you have a concrete case for that?

not yet

as per 1/2 commit message, I don't know any RTP action that should be
applied on the VF right now, but since we are starting our VF adventure
and RTP is used at different stages, I would expect that in the future
some tweaks could be required to performed also by the VF itself,

thus decided to prepare framework for that, where all currently defined
actions are not applicable for VFs, but any of them could be easily
enabled, if mandated by the spec

