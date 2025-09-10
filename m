Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C144CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 09:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6341610E357;
	Wed, 10 Sep 2025 09:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWGZtdnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B4110E357
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757496721; x=1789032721;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vfedOJmeejobq5MkWZE0L49Xr3XRrUUhAqfcdIFoX4g=;
 b=mWGZtdnTfn+73/v5pqJR8jxMNbb+UE90ip9yWDDdMS/OpRSwUR9pKnUM
 UWzvCbUDAew83ZFCJgwTpgEjURF7tRIbY9ZnACW962aO8fy/RO1YDwaZ+
 EmVL0u8zWzQSu+hUFp4IyNVdM3bcJolLm2iToNdhU8JEQprOCwwGBV3u9
 aLvgNf9wg2FK9mLS8SDBrqXXscm2vKfJFI6BDFo2KePtuDgI4brgFbCBy
 atiBfr2p6ikjO0Ervac+3X/WusqK4GdDfWWmfXK+D9o9MB6dBOan6nrPv
 zyW9DhBvdgALnpMvUQGdfATZAvEJmjURnzEabbfkmRz/HfAWOqeyQx7wV Q==;
X-CSE-ConnectionGUID: o7whLqL3QBef+3zBREvjhQ==
X-CSE-MsgGUID: ogNLnLBrSTK82IDlcgTFNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59656683"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="59656683"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:32:01 -0700
X-CSE-ConnectionGUID: KTuYOkc/Qd2ritTVyog2bw==
X-CSE-MsgGUID: i4Lf7HbUReaY8qH6me87LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="172908295"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:31:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Ville =?utf-8?B?U3lyasOk?=
 =?utf-8?B?bMOk?= <ville.syrjala@linux.intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v2 2/4] drm/xe/guc_pc: Use poll_timeout_us() for waiting
In-Reply-To: <20250909-xe-iopoll-v2-2-4c7ae9726e8e@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250909-xe-iopoll-v2-0-4c7ae9726e8e@intel.com>
 <20250909-xe-iopoll-v2-2-4c7ae9726e8e@intel.com>
Date: Wed, 10 Sep 2025 12:31:54 +0300
Message-ID: <28316ec5e023c7bd7196ece4dce6e467b1829e1e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 09 Sep 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Convert wait_for_pc_state() and wait_for_act_freq_limit() to
> poll_timeout_us(). This brings 2 changes in behavior: Drop the
> exponential wait and fix a potential much longer sleep.
>
> usleep_range() will wait anywhere between `wait` and `wait << 1`, so
> it's not correct to assume `slept += wait`.  This code is not really
> accurate. Pairing this with the exponential wait increase, it could be
> waiting much longer than intended.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: Simplify functions by removing helper variables and changing break
>     condition on poll_timeout_us() call (Maarten)
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 36 ++++++------------------------------
>  1 file changed, 6 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 88557e86d6371..31b291bc77543 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/cleanup.h>
>  #include <linux/delay.h>
> +#include <linux/iopoll.h>
>  #include <linux/jiffies.h>
>  #include <linux/ktime.h>
>  #include <linux/wait_bit.h>
> @@ -128,23 +129,10 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
>  			     enum slpc_global_state state,
>  			     int timeout_ms)
>  {
> -	int timeout_us = 1000 * timeout_ms;
> -	int slept, wait = 10;
> -
>  	xe_device_assert_mem_access(pc_to_xe(pc));
>  
> -	for (slept = 0; slept < timeout_us;) {
> -		if (slpc_shared_data_read(pc, header.global_state) == state)
> -			return 0;
> -
> -		usleep_range(wait, wait << 1);
> -		slept += wait;
> -		wait <<= 1;
> -		if (slept + wait > timeout_us)
> -			wait = timeout_us - slept;
> -	}
> -
> -	return -ETIMEDOUT;
> +	return poll_timeout_us({}, slpc_shared_data_read(pc, header.global_state) == state,
> +			       20, timeout_ms * USEC_PER_MSEC, false);

Not a fan of using {} here. I think it would be more clear if you did
something like s/state/target_state/ on the param, and then:

	return poll_timeout_us(state = slpc_shared_data_read(pc, header.global_state),
	                       state == target_state,
			       20, timeout_ms * USEC_PER_MSEC, false);

I think this is *much* more obvious than {}.

>  }
>  
>  static int wait_for_flush_complete(struct xe_guc_pc *pc)
> @@ -161,22 +149,10 @@ static int wait_for_flush_complete(struct xe_guc_pc *pc)
>  
>  static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
>  {
> -	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
> -	int slept, wait = 10;
> -
> -	for (slept = 0; slept < timeout_us;) {
> -		if (xe_guc_pc_get_act_freq(pc) <= freq)
> -			return 0;
> -
> -		usleep_range(wait, wait << 1);
> -		slept += wait;
> -		wait <<= 1;
> -		if (slept + wait > timeout_us)
> -			wait = timeout_us - slept;
> -	}
> -
> -	return -ETIMEDOUT;
> +	return poll_timeout_us({}, xe_guc_pc_get_act_freq(pc) <= freq,
> +			       20, SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC, false);

Ditto.

>  }
> +
>  static int pc_action_reset(struct xe_guc_pc *pc)
>  {
>  	struct xe_guc_ct *ct = pc_to_ct(pc);

-- 
Jani Nikula, Intel
