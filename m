Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14CFC2BD05
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 10:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733D810E113;
	Mon, 24 Jun 2024 10:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/CWAi6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3662910E113
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 10:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719224660; x=1750760660;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IVhwT59ndtIP5V6LNQKw/5tXadtXw8+5o4Vi2G7mNJ4=;
 b=e/CWAi6pG7HjXezPEw+7uz91Qf6LeIEy8CI563TrUyoBYpTvtXCUgAr8
 STXDvnWQsxjfGQp/S8DhWEUMnJkqTcobVGkLh9eJXP2rBkfHBEjC0DY8Y
 veePys+TSIx6aM0TqoZaVczRq0SDXfRbRaHr/9zMtlOw/YWYL7+TLQ+11
 0wcT6LNKTuw6OwgDsv18xkhhlj04B/whAy4jZmpbxn8ggqr9GiWPjmb5b
 Zq3i6FfxF4B500Xg+cBte7mZu1p6xgvZqjYCFntUjDtp99JgyRK9xlAUZ
 UkI1fQySbVeq2NKRsbeeMLLTPMaKtIaFbo3evnZ57S/uJ8zn7BskMiMxX w==;
X-CSE-ConnectionGUID: Xk1ZkyB0SRKI01Jl1WkxpQ==
X-CSE-MsgGUID: l5k602/sTs2bIs4MGoJwKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="19960188"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="19960188"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 03:24:20 -0700
X-CSE-ConnectionGUID: TPodJtcKRSOCtO6FzthjUA==
X-CSE-MsgGUID: 9IlW3LQCQL6JSLDe6ML2wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43324074"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 03:24:17 -0700
Message-ID: <0b01375a-cd13-454f-bac8-f42d5e19cb22@linux.intel.com>
Date: Mon, 24 Jun 2024 15:57:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] drm/xe/pmu: Enable PMU interface
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 krishnaiah.bommu@intel.com, tvrtko.ursulin@igalia.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <878qz8u1on.wl-ashutosh.dixit@intel.com>
 <af6df0d8-bafa-4fd5-a747-ff9e3092c3c6@intel.com>
 <875xubtu61.wl-ashutosh.dixit@intel.com> <ZnR/uGMcxOETqhsm@orsosgc001>
 <25d256e1-ce8f-41f4-b010-ca28b5eef557@linux.intel.com>
 <ZnXHNCQcKimE06ar@orsosgc001>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <ZnXHNCQcKimE06ar@orsosgc001>
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


On 22/06/24 00:02, Umesh Nerlige Ramappa wrote:
> On Fri, Jun 21, 2024 at 09:59:11AM +0530, Aravind Iddamsetty wrote:
>>
>> On 21/06/24 00:45, Umesh Nerlige Ramappa wrote:
>>> On Fri, Jun 14, 2024 at 08:34:30AM -0700, Dixit, Ashutosh wrote:
>>>> On Thu, 13 Jun 2024 22:50:39 -0700, Riana Tauro wrote:
>>>>>
>>>>> Hi Ashutosh
>>>>>
>>>>> On 6/14/2024 12:09 AM, Dixit, Ashutosh wrote:
>>>>> > On Thu, 13 Jun 2024 03:04:09 -0700, Riana Tauro wrote:
>>>>> >>
>>>>> >
>>>>> > Hi Riana,
>>>>> >
>>>>> >> There are a set of engine group busyness counters provided by HW which are
>>>>> >> perfect fit to be exposed via PMU perf events.
>>>>> >>
>>>>> >> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
>>>>> >>
>>>>> >> events can be listed using:
>>>>> >> perf list
>>>>> >>    xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>>>> >>    xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>>>> >>    xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>>>> >>    xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>>>> >
>>>>> > PMU patches merged previously were dropped in 90a8b23f9b85 ("drm/xe/pmu:
>>>>> > Remove PMU from Xe till uapi is finalized") because PMU uapi was expected
>>>>> > to change. Why are we re-posting these old patches again now, without
>>>>> > including the planned uapi changes?
>>>>>
>>>>> The uapi changes were dropped and there are no other upcoming changes for
>>>>> Group busyness. So re-posted the old series.
>>>>
>>>> What happened to VF busyness (which is why I thought the uapi was going to
>>>> change)?
>>>
>>> There are no plans to support group busyness from a VF, so we are just exporting group busyness to maintain parity with i915 for Native/PF behavior. The only change would be to expose the counters in ticks rather than ns. I still have to look at this series to see if that's happening.
>>
>> how will the counter ticks be used to get the busyness in time
>
> There will be no concept of "busyness in time units". User would just take 2 samples and calculate busyness as a percentage. The counters will be unitless. More info on equation here:
> https://spec.oneapi.io/level-zero/1.9.3/sysman/api.html#_CPPv418zes_engine_stats_t
>
> Percent utilization is calculated by taking two snapshots (s1, s2) and using the equation:
>
> util = (s2.activeTime - s1.activeTime) / (s2.timestamp - s1.timestamp)
>
> Note that zesEngineGetActivity is used to get single as well as group engine busyness from the KMD.
>
> For single engine busyness, KMD will get the information from GuC and that would be a pair of counters - ActiveTicks and TotalActiveTicks corresponding to activeTime and timestamp in the above equation.
>
> For group engine busyness, we should follow the same semantics.

does that mean that the counter itself doesn't have any relevance i mean it doesn't present any outcome to the user and rather one should use some formula to get a usable metric.

so from PMU interface point of view can we expose such a interface, my question because most of the interfaces I found in PMU are directly usable by user.

Thanks,
Aravind.
>
> Regards,
> Umesh
>
>>
>> Regards,
>> Aravind.
>>>
>>> Regards,
>>> Umesh
>>>>
>>>>>
>>>>> Thanks,
>>>>> Riana
>>>>> >
>>>>> > Thanks.
>>>>> > --
>>>>> > Ashutosh
