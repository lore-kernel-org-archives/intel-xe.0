Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E475EC9833F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 11:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BCC10E0A6;
	Mon, 28 Sep 2026 11:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrSS8CJY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0051210E0A6
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 11:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790595426; x=1822131426;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A5U/W+sDMR8S4WvEEcD5xg78jc7ENZxt4mb9/zKKX3U=;
 b=nrSS8CJY7IA1UzUpce4YwWe0nHN3Z09SjpfprVI4tn9a8uZx5lVBexyu
 PDcVsL//BHMBtIdukyfWdcTs5XG585jPpO0iPokR1Tx3DPso+Skl1Vm6A
 WoNksT0EA74yUDZfJ+9MG0tkykCBFVMPDLLkO8UpobYtQ29vbhURZVaFB
 IbUntslIZ+/PrHQiigGWHUtLj+yKJckCQ+t2SFnJDcHx2KWR0XlpcmnVL
 lmqXIwQc8h/vpJkSvD3p7YSl2pQwfrFQtSlv9KCTXJ4xqscIiAhxu544l
 Kyv9w+Qi4qw6CMYk2uZlRh8JZg319ZJXib1oScltI5SeK7EX6QjqDA1km A==;
X-CSE-ConnectionGUID: WkxMA04rQhGzkX5/eg8Ruw==
X-CSE-MsgGUID: ReZ3MPAGR7Cf3twqPShAOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90196047"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="90196047"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 04:37:06 -0700
X-CSE-ConnectionGUID: OGzy/mRpSVC1/YrXK4MeFw==
X-CSE-MsgGUID: AApu5AufTwCvALxjMogcyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="278229112"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.80])
 ([10.245.244.80])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 04:37:04 -0700
Message-ID: <10d8cd48-ff49-4303-a4b0-26afdad76241@intel.com>
Date: Mon, 28 Sep 2026 12:37:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/shrinker: hold a stable RPM ref across scan
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260925115521.1018940-3-matthew.auld@intel.com>
 <20260925115521.1018940-4-matthew.auld@intel.com>
 <20260926165621.31254-1-kmehltretter@gmail.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260926165621.31254-1-kmehltretter@gmail.com>
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

On 26/09/2026 17:56, Karl Mehltretter wrote:
> On Fri, Sep 25, 2026 at 11:55:23AM +0000, Matthew Auld wrote:
>> @@ -102,7 +84,7 @@ static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
>>   
>>   		if (mem_type != XE_PL_SYSTEM && !rpm &&
>>   		    xe_device_is_l2_flush_optimized(xe)) {
>> -			if (!__xe_shrinker_runtime_pm_get(shrinker))
>> +			if (!xe_pm_runtime_get_if_active(xe))
>>   				break;
>>   			rpm = true;
>>   		}
> 
> Could this skip TT reclaim with CONFIG_PM=n on integrated graphics
> version 35 or newer?
> 
> The !CONFIG_PM stub of pm_runtime_get_if_active() returns -EINVAL, so
> xe_pm_runtime_get_if_active() always returns false here. Taking the
> outer synchronous reference cannot change that stub's result.
> 
> Previously, kswapd could take the synchronous fallback in
> __xe_shrinker_runtime_pm_get() when D3cold was unavailable and continue
> into the TT manager (e.g. with CONFIG_ACPI=n).

Interesting. If this is true then I think this is a widespread issue and 
driver was already busted here, since various places use if_active() and 
if_in_use(). In fact just below this call if we trigger xe_bo_shrink(), 
we have the same pattern, I think. If that returns "false" it will skip 
the operation there also.

Assuming CONFIG_PM=n is valid, then maybe something like:

  bool xe_pm_runtime_get_if_active(struct xe_device *xe)
  {
+       if (!IS_ENABLED(CONFIG_PM))
+               return true;
+
         return pm_runtime_get_if_active(xe->drm.dev) > 0;
  }

And then same thing for if_in_use().

> 
> Sashiko dismissed the skipped-TT concern assuming the outer resume
> makes the active check succeed. Might that dismissal have overlooked
> CONFIG_PM=n?
> https://sashiko.dev/#/patchset/80538
> 
> Thanks,
> Karl

