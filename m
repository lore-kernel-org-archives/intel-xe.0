Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4CBC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 09:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0139E10E4D9;
	Tue,  9 Jul 2024 09:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbV+2rKp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2962410E4D9
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720517581; x=1752053581;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=zbHTfLO2sjMYBuLDfPgv1knzAjKHSOz1AIjj6JYLUFY=;
 b=YbV+2rKp9/JXJ4dS5wvcfqKJ6ntsiMup9hGqdQ7yXpePK/tjS5kXvB+R
 so5/1RRAqZDnOBye3KsrTY7CwYgXTaxO3cMROUcMSKivLa26yiJCcXF6q
 4AUq7WOHb7SeTkt1chDlW1UfZgSH7gg7dR12uEkxathqZtJQewGqX2YmS
 Gu5vUDdqkWQotjBQtr2VZ1WdvJklKZfC+oA5AQUWPjGr2S3xhEpr1vQ0O
 ryo8aL6LTRkOdunGesnj37ttDhg+s4sNKMNprDsPTNGH614dcRfhcwYBH
 iHMusGhcF7cJX+FRm5lfoWzliMdU2CnhVo1/I+5jOiFSMR7XoMdTd7/JL Q==;
X-CSE-ConnectionGUID: 30l5ILCXQQaMMpjZeM2QPw==
X-CSE-MsgGUID: Nu6J0tnvQaS/xHyiXHZgNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17862663"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="17862663"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 02:33:00 -0700
X-CSE-ConnectionGUID: FCB2C8t7TzeHeK7gpTwsZw==
X-CSE-MsgGUID: pzZ+cMRZT/uJCUbFKxROsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="47726020"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.109]) ([10.245.244.109])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 02:32:59 -0700
Message-ID: <f3d3d575-a608-4fbf-8668-8390d83d059d@linux.intel.com>
Date: Tue, 9 Jul 2024 11:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
To: Animesh Manna <animesh.manna@intel.com>, intel-xe@lists.freedesktop.org
References: <20240708055630.4058818-1-animesh.manna@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240708055630.4058818-1-animesh.manna@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hello,

I've been trying out this patch, but I'm still seeing corruption on my laptop with DSB enabled.
I'd recommend not merging until it is fixed. :)

Cheers,
~Maarten

Den 2024-07-08 kl. 07:56, skrev Animesh Manna:
> This reverts commit c27f010aa1884276ee5dae72034d84987060c769.
> 
> After fix from [1] dsb timeout issue is not reproducible on local testing
> with xe driver. Checking CI result to confirm and not for review.
> 
> [1] https://patchwork.freedesktop.org/series/130783/
> 
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index 2ab3765f6c06..e9c4835a2c30 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -463,10 +463,6 @@ struct intel_dsb *intel_dsb_prepare(struct intel_atomic_state *state,
>  	if (!i915->display.params.enable_dsb)
>  		return NULL;
>  
> -	/* TODO: DSB is broken in Xe KMD, so disabling it until fixed */
> -	if (!IS_ENABLED(I915))
> -		return NULL;
> -
>  	dsb = kzalloc(sizeof(*dsb), GFP_KERNEL);
>  	if (!dsb)
>  		goto out;
