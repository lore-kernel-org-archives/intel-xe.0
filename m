Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BF4C54731
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 15:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C617610E088;
	Tue, 27 Aug 2024 15:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mP6dsNzx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA9E10E088
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724770983; x=1756306983;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=jY/2zCiydueUFajC0QG2G5tyaqKtEjhWWjvwGhvAP5s=;
 b=mP6dsNzxfJbMm7tc0IzD/7kg/YE6prIbPv1ysX9qQVNUh3+voYmyX67M
 1E2n3myOKy9kEMuXIv+sJ57NWTL+i9Em5i48skLcw2pj73krnlgA5rQrD
 iUjsuzX6ZuJ3nw/9wSxeOU9BPkUah7sfroOgVTh+6VTfZwT8nNEdIKAct
 nTQtOBuE5Lci6sQ8SNtMvALtLRmzQhlCD0C/0ODI1I6SdxxF+jVIWwaTr
 abmQsDpdK9TROXFP5d0sH85AmNLTLD58YFdK+MWrptgYpnzIUYvVahmqs
 B4V4v8f2tI/Gd1LGot/A2Rd0VBtAPf3K7U1VF1iagb1Xk5B9Iv6y5aQRc w==;
X-CSE-ConnectionGUID: fnyIv/KeTBmqhV7abD368A==
X-CSE-MsgGUID: vaViGoUiT0q47T1ybsclqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40726973"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="40726973"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 08:02:49 -0700
X-CSE-ConnectionGUID: Ewadl9AmRAiLxYzSW58paQ==
X-CSE-MsgGUID: ZBiNfPeYRbyJjDndxpW2Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62891907"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.93])
 ([10.245.244.93])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 08:02:47 -0700
Message-ID: <ca1b62f5-f09a-44ac-8592-a9881c73e164@linux.intel.com>
Date: Tue, 27 Aug 2024 17:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
To: Matthew Auld <matthew.auld@intel.com>,
 Animesh Manna <animesh.manna@intel.com>, intel-xe@lists.freedesktop.org
References: <20240708055630.4058818-1-animesh.manna@intel.com>
 <f3d3d575-a608-4fbf-8668-8390d83d059d@linux.intel.com>
 <7fe8022e-6d86-4cdf-88a3-b19febfb1006@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <7fe8022e-6d86-4cdf-88a3-b19febfb1006@intel.com>
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

Hey,

Den 2024-07-09 kl. 12:23, skrev Matthew Auld:
> On 09/07/2024 10:33, Maarten Lankhorst wrote:
>> Hello,
>>
>> I've been trying out this patch, but I'm still seeing corruption on my laptop with DSB enabled.
>> I'd recommend not merging until it is fixed. :)
> 
> Just wondering, is it correct to use cpu:wb for the dsb buffer? Does the dsb stuff not suffer from "display is not coherent with gpu/cpu caches"? In i915 it looks to be cpu:wc.

My guess is that could be it. Our kernel mappings are cached by default.

Perhaps I'll look at the DPT code too, it could suffer from the same issue.

Will test a bit more tomorrow :)

~Maarten

>> Cheers,
>> ~Maarten
>>
>> Den 2024-07-08 kl. 07:56, skrev Animesh Manna:
>>> This reverts commit c27f010aa1884276ee5dae72034d84987060c769.
>>>
>>> After fix from [1] dsb timeout issue is not reproducible on local testing
>>> with xe driver. Checking CI result to confirm and not for review.
>>>
>>> [1] https://patchwork.freedesktop.org/series/130783/
>>>
>>> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/display/intel_dsb.c | 4 ----
>>>   1 file changed, 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
>>> index 2ab3765f6c06..e9c4835a2c30 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
>>> @@ -463,10 +463,6 @@ struct intel_dsb *intel_dsb_prepare(struct intel_atomic_state *state,
>>>       if (!i915->display.params.enable_dsb)
>>>           return NULL;
>>>   -    /* TODO: DSB is broken in Xe KMD, so disabling it until fixed */
>>> -    if (!IS_ENABLED(I915))
>>> -        return NULL;
>>> -
>>>       dsb = kzalloc(sizeof(*dsb), GFP_KERNEL);
>>>       if (!dsb)
>>>           goto out;

