Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82136CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 15:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4552510E1A5;
	Fri, 29 Aug 2025 15:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdgtTtjP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2614110E1A5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756482607; x=1788018607;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AN7n9r9LvyRhkVkFlAkH1p+pk6zmTQ4jn1Wa4t7Mf7Y=;
 b=IdgtTtjPhVlZWVjI3SiEHncDRv3zAoCKW9dKYvB0YHZZRw2hsVH7xWcD
 1dMt2WA1u9k096lXp6qeGen/wERAGGKbvTqxhBBav/LJRWbfrhMd3K0gD
 +/+Tc1uwvREqlOc1m5/vt/4+iKFu4rE4k82WH9XzAEYkss/6DoCRh0zHB
 abLUKZyVWGDrK44TCsNJZq/9UcxypOjPLrFbabaKBUpRWh0bs+eARZOmU
 Db3I1gOyKmAPwqnCWMohD81UL+a5H1zkPy2TlHM/ZLKmVRFfqCLgO1oHp
 /btmhT2+ldBMA6Xn4uwbh0ZmTOn9d6dT0RgAtNAlb9KGlskrjQSFUjhGw Q==;
X-CSE-ConnectionGUID: L8n1yC+2RaWOG9/4vAKGuA==
X-CSE-MsgGUID: P79rvgHcTvKABQ4OHaTSww==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58696542"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58696542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 08:50:06 -0700
X-CSE-ConnectionGUID: +tQBJvUdSimuqHWT58v/LQ==
X-CSE-MsgGUID: kneycvrHS5eA97W+iMs53Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169983788"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.240])
 ([10.245.245.240])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 08:50:05 -0700
Message-ID: <45929eb2-bd6d-46d3-86a1-fe4f233d3c70@intel.com>
Date: Fri, 29 Aug 2025 16:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Allow the pm notifier to continue on failure
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250829113350.40959-1-thomas.hellstrom@linux.intel.com>
 <20250829113350.40959-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250829113350.40959-3-thomas.hellstrom@linux.intel.com>
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

On 29/08/2025 12:33, Thomas Hellström wrote:
> Its actions are opportunistic anyway and will be completed
> on device suspend.
> 
> Also restrict the scope of the pm runtime reference to
> the notifier callback itself to make it easier to
> follow.
> 
> Marking as a fix to simplify backporting of the fix
> that follows in the series.
> 
> Fixes: c6a4d46ec1d7 ("drm/xe: evict user memory in PM notifier")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.16+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a2e85030b7f4..b57b46ad9f7c 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -308,28 +308,22 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
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
> +		xe_pm_runtime_put(xe);

IIRC I was worried that this ends up triggering runtime suspend at some 
later point and then something wakes it up again before the actual 
forced suspend triggers, which looks like it would undo all the 
prepare_all_pinned() work, so I opted for keeping it held over the 
entire sequence. Is that not a concern here?

>   		break;
>   	case PM_POST_HIBERNATION:
>   	case PM_POST_SUSPEND:
> +		xe_pm_runtime_get(xe);
>   		xe_bo_notifier_unprepare_all_pinned(xe);
>   		xe_pm_runtime_put(xe);
>   		break;
>   	}
>   
> -	if (err)
> -		return NOTIFY_BAD;
> -
>   	return NOTIFY_DONE;
>   }
>   

