Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90B5CAC59A
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 10:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7476310E982;
	Fri, 19 Sep 2025 10:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/VxqLRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3E610E982
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758276825; x=1789812825;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MoZ2JOIG0+PzxI3DwkeMR3iB3ZWEVxq9IYz72Df50g4=;
 b=V/VxqLRzAKOmpyfpYiFseuxcb45MJ6RK0ZV+3SwIrhfOAFItPNVS1cZ1
 GWzABucwvvap3Cd8nJOo0etg8xqBinx9u8nPFpJzgzlWM0bkUzGmIKGwA
 ynswXVtTsVzhPFn2aSjxTt2/d4hBk858+B5s50TMAw1LiGf8s+bSa9fdp
 bbyOF2xG3zu1kUeV+NOKgspfKI6dW6brHyx/s5dRxrstf5bp6BtTSFIyf
 6NPcxEon/MKTTn1Qkda5pskDMsWCV61UiwVB2o0ez/O94nW4vRfW8sB3S
 TnCfZrf+OkO+rOzYBSsfAk7+22KTVfSTuHlCnUbc2iu/SZVttbveMIHkd Q==;
X-CSE-ConnectionGUID: cEvits4LQ+SMyjP5/vrIhQ==
X-CSE-MsgGUID: ke9N++CDQIq+1nUnLLQtMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="72050585"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="72050585"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 03:13:44 -0700
X-CSE-ConnectionGUID: wOEFjn5tTGK4SAM3tkA2MQ==
X-CSE-MsgGUID: 80ZYIrhKSt6T+LiZ1TnKjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="175855625"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.133])
 ([10.245.245.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 03:13:43 -0700
Message-ID: <52a01a86-f03e-4ab5-835f-f88067e449da@intel.com>
Date: Fri, 19 Sep 2025 11:13:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/pm: Hold the validation lock around evicting
 user-space bos for suspend
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20250918142848.21807-1-thomas.hellstrom@linux.intel.com>
 <20250918142848.21807-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250918142848.21807-2-thomas.hellstrom@linux.intel.com>
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

On 18/09/2025 15:28, Thomas Hellström wrote:
> During pm notifier eviction we may still race with validations.
> Ensure those are blocked out during eviction to ensure we have
> access to as much system memory as possible.
> 
> During the suspend operation itself, we run single-threaded so that
> shouldn't be a problem.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pm.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 211935590e21..b1c536b39034 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -320,9 +320,15 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
>   	switch (action) {
>   	case PM_HIBERNATION_PREPARE:
>   	case PM_SUSPEND_PREPARE:
> +	{
> +		struct xe_validation_ctx ctx;
> +
>   		reinit_completion(&xe->pm_block);
>   		xe_pm_runtime_get(xe);
> +		(void)xe_validation_ctx_init(&ctx, &xe->val, NULL,
> +					     (struct xe_val_flags) {.exclusive = true});
>   		err = xe_bo_evict_all_user(xe);
> +		xe_validation_ctx_fini(&ctx);
>   		if (err)
>   			drm_dbg(&xe->drm, "Notifier evict user failed (%d)\n", err);
>   
> @@ -335,6 +341,7 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
>   		 * allocations.
>   		 */
>   		break;
> +	}
>   	case PM_POST_HIBERNATION:
>   	case PM_POST_SUSPEND:
>   		complete_all(&xe->pm_block);

