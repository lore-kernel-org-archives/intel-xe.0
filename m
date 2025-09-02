Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B5CCA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 10:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C0D10E653;
	Tue,  2 Sep 2025 10:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMY4DfLQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA0610E653
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 10:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756809158; x=1788345158;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xHgaSh2A4yEv4NX/+7lLbbxdcZbq+h7IkvUfY2N9/WE=;
 b=bMY4DfLQemGrLhapysHYRTJ9Qx7wG9eOljY2SmtqYKJpGq7CqFIy+TE8
 E8MHxgeNbFqlktLriPrCEhu96Gq4dlwA/mAFfo2+o8yZSBOnoFiy6rbLl
 vIY0IsHoC1vjHtBxjQqpucEOFxxj0bVtE16qOLO1CWRsj5FQK7AdgvHmU
 c0W4rV8rwm/mQaoO0SY9pDuxvHAB7kJoYxEwT7tzZ9zycM45Iyz0+poGb
 1q8RWmwPoO4FIkxx0BQirQLqe83At36RGPvduGyecr50eEaLDHROgLaeo
 Sfu8wko3x3uGZ5xmnN5dy7zn76uwlsryoPa8pH4PpnxexpqUNarVLHi0C A==;
X-CSE-ConnectionGUID: emqDsHikSp2qar6UbOMz5A==
X-CSE-MsgGUID: W9Kb6mYJSCaEdaJOJYrjgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59026438"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59026438"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:32:37 -0700
X-CSE-ConnectionGUID: dgrQJMdnQkGqG0FBFn4MeQ==
X-CSE-MsgGUID: ynApx5lgSW+TGzzlSL3/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171402132"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.245.71])
 ([10.245.245.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:32:35 -0700
Message-ID: <f16b5123-ed53-45b3-ac13-656ad839e87f@intel.com>
Date: Tue, 2 Sep 2025 11:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Allow the pm notifier to continue on
 failure
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250901083829.27341-1-thomas.hellstrom@linux.intel.com>
 <20250901083829.27341-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250901083829.27341-3-thomas.hellstrom@linux.intel.com>
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

On 01/09/2025 09:38, Thomas Hellström wrote:
> Its actions are opportunistic anyway and will be completed
> on device suspend.

If it fails here, it will likely also fail in the real suspend part 
which is more hostile/restrictive environment, so maybe failing early is 
better? Not completely sure though.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> 
> Marking as a fix to simplify backporting of the fix
> that follows in the series.
> 
> v2:
> - Keep the runtime pm reference over suspend / hibernate and
>    document why. (Matt Auld, Rodrigo Vivi):
> 
> Fixes: c6a4d46ec1d7 ("drm/xe: evict user memory in PM notifier")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.16+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a2e85030b7f4..bee9aacd82e7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -308,17 +308,17 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
>   	case PM_SUSPEND_PREPARE:
>   		xe_pm_runtime_get(xe);
>   		err = xe_bo_evict_all_user(xe);
> -		if (err) {
> +		if (err)
>   			drm_dbg(&xe->drm, "Notifier evict user failed (%d)\n", err);
> -			xe_pm_runtime_put(xe);
> -			break;
> -		}
>   
>   		err = xe_bo_notifier_prepare_all_pinned(xe);
> -		if (err) {
> +		if (err)
>   			drm_dbg(&xe->drm, "Notifier prepare pin failed (%d)\n", err);
> -			xe_pm_runtime_put(xe);
> -		}
> +		/*
> +		 * Keep the runtime pm reference until post hibernation / post suspend to
> +		 * avoid a runtime suspend interfering with evicted objects or backup
> +		 * allocations.
> +		 */
>   		break;
>   	case PM_POST_HIBERNATION:
>   	case PM_POST_SUSPEND:
> @@ -327,9 +327,6 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
>   		break;
>   	}
>   
> -	if (err)
> -		return NOTIFY_BAD;
> -
>   	return NOTIFY_DONE;
>   }
>   

