Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D6FC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 19:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8271910F548;
	Thu,  2 May 2024 19:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXgGz2s3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F5310F548
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 19:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714679466; x=1746215466;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UW2hxwChbkQS37DqDwgZpcjZnPV49XixqnGz0KROTis=;
 b=UXgGz2s3Wdv4b9PYY45oa5TqSqmSa3E+ngStwAhLHcU8sRI+UxwwfCBp
 v97N2KlPIOsrhCi0b2Ijg0b91GmBF/pKxxqL6jgd7UimiMInjS69uusT2
 OEdbkKtnEYv1oatf7+eUb+b1eCkNaglKqse62Ov/ZDimBxZQh+eU0qBos
 9X0JQ9ZZXHE58LByleZz3wKpSODAkJUoi+7azOkJkIqTyT1QHjkaNfJkl
 DybB2B5V885x0uM+pW0kfwmhwr0BkAcIAUpduZPhNsR7wLq9v9vbkrp7o
 zhPnyGmVQM/rWNbgOiAFQfW22jGcTeZ1dtTN/uzA0FSH1H+4YsPhHiUIj Q==;
X-CSE-ConnectionGUID: g3GfT/W/QPG0KfRMqWK11Q==
X-CSE-MsgGUID: 6X7FPwaaSSqAi0KY4xoJ/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="28002826"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="28002826"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 12:51:05 -0700
X-CSE-ConnectionGUID: 0aTa8v6tSE69aaHxHr8D7w==
X-CSE-MsgGUID: tDO2PcjFQFelbNQtSd0/Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31842435"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 02 May 2024 12:51:03 -0700
Received: from [10.246.17.255] (unknown [10.246.17.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5C39832EBA;
 Thu,  2 May 2024 20:50:59 +0100 (IST)
Message-ID: <b8db3b73-beee-443f-b3cd-f2e1ddfe3775@intel.com>
Date: Thu, 2 May 2024 21:50:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Define generic helpers for manipulating macro
 arguments
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240501223221.2395-1-michal.wajdeczko@intel.com>
 <ZjM_vNXn9JmlzOkc@smile.fi.intel.com>
 <6d79251d-574e-44f5-9aa5-6f5bc948da0e@intel.com>
 <tk6kfeniwc3jl3vyuw3ntrwbyyss2sjdeuy6hojzri636mfadn@enhnebj6k34f>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <tk6kfeniwc3jl3vyuw3ntrwbyyss2sjdeuy6hojzri636mfadn@enhnebj6k34f>
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



On 02.05.2024 19:38, Lucas De Marchi wrote:
> On Thu, May 02, 2024 at 11:24:36AM GMT, Michal Wajdeczko wrote:
>>
>>
>> On 02.05.2024 09:24, Andy Shevchenko wrote:
>>> On Thu, May 02, 2024 at 12:32:19AM +0200, Michal Wajdeczko wrote:
>>>> Michal Wajdeczko (2):
>>>>   args.h: add more helpers for manipulating macro arguments
>>>>   drm/xe/rtp: Prefer helper macros from args.h
>>>>
>>>>  drivers/gpu/drm/xe/xe_rtp.h         |   4 +-
>>>>  drivers/gpu/drm/xe/xe_rtp_helpers.h |  26 +++----
>>>>  include/linux/args.h                | 103 ++++++++++++++++++++++++++++
>>>>  3 files changed, 115 insertions(+), 18 deletions(-)
>>>
>>> It's good in general to have the code being deduplicated, but the above
>>> statistics is a bit scary.
>>
>> The statistics here might be little blurred due to added documentation.
>> Without documentation this would look a little better:
>>
>> drivers/gpu/drm/xe/xe_rtp.h         |  4 ++--
>> drivers/gpu/drm/xe/xe_rtp_helpers.h | 26 ++++++++++----------------
>> include/linux/args.h                | 26 ++++++++++++++++++++++++++
>> 3 files changed, 38 insertions(+), 18 deletions(-)
>>
>>> Do we have more users where we indeed make code much
>>> nicer?
>>
>> A new user (still inside Xe driver) for these macro is on it's way, but
>> before that I wanted to start with a preparation step and promote any
>> generic helpers to the outside of the Xe driver, as it was pointed in
>> similar case with other helper macro [1]
>>
>> [1] https://patchwork.freedesktop.org/patch/578134/?series=129854&rev=1
>>
>>> If not, let's keep these where it belongs to for now.
>>>
>>
>> If this proposal didn't get any traction, which won't surprise me based
>> on outcome of [2], then at least I would have some ground for creating a
>> local xe_args.h or use xe_macros.h as a location for common args macros.
>>
>> [2]
>> https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/
> 
> I share the same concern as Andy. When I saw this series I was a bit
> more concerned because there are plans to change the rtp part in xe,
> moving it partially to code generation rather than using CPP.
> 
> However looking at the changes you are moving here, they are more about
> the simpler macros. And it's nice to have more documentation and make
> them less magical.
> 
> We need to be careful that some of the macros are not generic and were
> purposely built. Example:  _XE_COUNT_ARGS() and COUNT_ARGS() are not the
> same thing and return a different value for 0 args for example. I think

it wasn't that obvious as the macro name didn't suggest any special case
(btw, maybe it should be named as _XE_NUM_ARGS_OR_EMPTY to make it clear
it is not as simple as COUNT_ARGS)

> we don't rely on that anymore, but we should really pass this through
> CI. It should generate 100% the same code, so checking the .o matches
> after this change would be good.

yeah, this special case didn't show up during compilation, so I've
replaced it with generic COUNT_ARGS as custom variant is not needed

CI didn't found anything new and just double checked that following

  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
  CC [M]  drivers/gpu/drm/xe/xe_wa.o

are the same before and after applying these changes

> 
> As per xe_args.h vs args.h: I think we can take the intermediate step
> doing a cleanup + documentation by moving to xe_args.h and later try
> to promote xe_args.h to args.h.

will post v2 shortly with macros defined in xe_args.h

Michal

> 
> thanks
> Lucas De Marchi
