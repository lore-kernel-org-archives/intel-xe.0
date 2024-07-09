Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94208C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 10:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BB410E4EB;
	Tue,  9 Jul 2024 10:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMj8+8OG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25F510E4EB
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720520603; x=1752056603;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=aCWpSoM3i/F+Oe1C0xOk+tOBpbchD1o6lWmx5dso78Q=;
 b=OMj8+8OGEbcZq85utOKGFuMXOi2/nfzvlNSeO5Si0vkpfoclh1F6ZGZD
 TrdHCU6z97XToZEAr9AUE86F8Zv7qZM1DPoM6ahROr5D5JwEWkD37S4ZZ
 KSwYQfYVOTHb7wqCDL1iktezvs9eWOddWWzQ9oPzE+Npr+pG/NIrSLb31
 If0DjipyTdtKHBW/S6F7nEvZDmaSFwlxRgVTNrcBx5GPEGyJNcmDFltTg
 +OGEy1A9O+FB1HVw8feijZizgfC7wyLgAI5adVB6qSdDeYfoyNmVXlJLw
 0Z+V+ADe1Hiqp7GmkxPAT/Wciw9PLoU/zCM6pQYPJzFYjRSvUFiaSXpdC A==;
X-CSE-ConnectionGUID: lLy6Ce0YQXqZ+TZYQg4Z2w==
X-CSE-MsgGUID: OKaW9UqZReGOKA8Lh20e/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="40279475"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="40279475"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 03:23:23 -0700
X-CSE-ConnectionGUID: wYEXQspuQt+2Lo4YAP0b/g==
X-CSE-MsgGUID: Lb5e9cA6TLCfQ93/GLrmAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="48248480"
Received: from unknown (HELO [10.245.244.94]) ([10.245.244.94])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 03:23:21 -0700
Message-ID: <7fe8022e-6d86-4cdf-88a3-b19febfb1006@intel.com>
Date: Tue, 9 Jul 2024 11:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Animesh Manna <animesh.manna@intel.com>, intel-xe@lists.freedesktop.org
References: <20240708055630.4058818-1-animesh.manna@intel.com>
 <f3d3d575-a608-4fbf-8668-8390d83d059d@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <f3d3d575-a608-4fbf-8668-8390d83d059d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 09/07/2024 10:33, Maarten Lankhorst wrote:
> Hello,
> 
> I've been trying out this patch, but I'm still seeing corruption on my laptop with DSB enabled.
> I'd recommend not merging until it is fixed. :)

Just wondering, is it correct to use cpu:wb for the dsb buffer? Does the 
dsb stuff not suffer from "display is not coherent with gpu/cpu caches"? 
In i915 it looks to be cpu:wc.

> 
> Cheers,
> ~Maarten
> 
> Den 2024-07-08 kl. 07:56, skrev Animesh Manna:
>> This reverts commit c27f010aa1884276ee5dae72034d84987060c769.
>>
>> After fix from [1] dsb timeout issue is not reproducible on local testing
>> with xe driver. Checking CI result to confirm and not for review.
>>
>> [1] https://patchwork.freedesktop.org/series/130783/
>>
>> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dsb.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
>> index 2ab3765f6c06..e9c4835a2c30 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
>> @@ -463,10 +463,6 @@ struct intel_dsb *intel_dsb_prepare(struct intel_atomic_state *state,
>>   	if (!i915->display.params.enable_dsb)
>>   		return NULL;
>>   
>> -	/* TODO: DSB is broken in Xe KMD, so disabling it until fixed */
>> -	if (!IS_ENABLED(I915))
>> -		return NULL;
>> -
>>   	dsb = kzalloc(sizeof(*dsb), GFP_KERNEL);
>>   	if (!dsb)
>>   		goto out;
