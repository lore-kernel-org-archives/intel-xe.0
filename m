Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67762C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 11:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C81B10E0E4;
	Tue,  9 Jan 2024 11:26:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C515A10E0E4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 11:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704799585; x=1736335585;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=m1T/WekzuG58FnBnj41AIovWk2iQQDrBY2zfw3hSei4=;
 b=IJa/afyey5yxeTmSEIBkw09vuvUNGFwlluArEszNyefBGl2yo+CtdDd+
 R93RFZLtWswGh+RjA65oj1RcGJ3eDqP7hauhtmK3SvpKZNfCuu7JhD35P
 6IiCTlbLBcdfi9kvk015pmCUtSS5Kh3iN2PfezhqGKGW3xu/GMP3E/USe
 1kIyNTb0LxUoXkhE9nxkX0jIUgc3rxFMdgJHqF90q4pNeGNJPLQFJ87A6
 0DCPoqJvzAuiUMGFMyVEcOWbM5fohAlJ2NV/AqUWKUQYRiqYbb+bYLF93
 YydIez3YtcQE1QWD+/YnHzqmD0pQsVFYb45qvuAOnt1Ko6fjz3cnlCgdo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="16760555"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="16760555"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:26:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="815939643"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="815939643"
Received: from tpsarve-mobl.ger.corp.intel.com (HELO [10.252.17.61])
 ([10.252.17.61])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:26:24 -0800
Message-ID: <8df5a487-54a1-48a7-90db-8520d591a583@intel.com>
Date: Tue, 9 Jan 2024 11:26:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/20] drm/xe: Sort some xe_pm_runtime related functions
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-11-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231228021232.2366249-11-rodrigo.vivi@intel.com>
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

On 28/12/2023 02:12, Rodrigo Vivi wrote:
> No functional change. Just organizing the file a bit better
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 42 +++++++++++++++++++-------------------
>   drivers/gpu/drm/xe/xe_pm.h |  4 ++--
>   2 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f599707413f18..3594e707606ce 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -387,6 +387,23 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	return err;
>   }
>   
> +/**
> + * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
> + * @xe: xe device instance
> + *
> + * Returns: True if device is awake and the the reference was taken, false otherwise.
> + */
> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
> +{
> +	if (xe_pm_read_callback_task(xe) == current) {
> +		/* The device is awake, grab the ref and move on */
> +                pm_runtime_get_noresume(xe->drm.dev);
> +		return true;
> +	}
> +
> +        return pm_runtime_resume_and_get(xe->drm.dev) >= 0;

Nit: Formatting looks off here.

> +}
> +
>   /**
>    * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
>    * @xe: xe device instance
> @@ -401,16 +418,6 @@ void xe_pm_runtime_get(struct xe_device *xe)
>   	pm_runtime_resume(xe->drm.dev);
>   }
>   
> -/**
> - * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
> - * @xe: xe device instance
> - */
> -void xe_pm_runtime_put(struct xe_device *xe)
> -{
> -	pm_runtime_mark_last_busy(xe->drm.dev);
> -	pm_runtime_put(xe->drm.dev);
> -}
> -
>   /**
>    * xe_pm_runtime_get_sync - Get a runtime_pm reference and resume synchronously
>    * @xe: xe device instance
> @@ -456,20 +463,13 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
>   }
>   
>   /**
> - * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
> + * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
>    * @xe: xe device instance
> - *
> - * Returns: True if device is awake and the the reference was taken, false otherwise.
>    */
> -bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
> +void xe_pm_runtime_put(struct xe_device *xe)
>   {
> -	if (xe_pm_read_callback_task(xe) == current) {
> -		/* The device is awake, grab the ref and move on */
> -                pm_runtime_get_noresume(xe->drm.dev);
> -		return true;
> -	}
> -
> -        return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
> +	pm_runtime_mark_last_busy(xe->drm.dev);
> +	pm_runtime_put(xe->drm.dev);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index d0e6011a80688..fc82a1466453b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -25,12 +25,12 @@ void xe_pm_runtime_fini(struct xe_device *xe);
>   bool xe_pm_runtime_suspended(struct xe_device *xe);
>   int xe_pm_runtime_suspend(struct xe_device *xe);
>   int xe_pm_runtime_resume(struct xe_device *xe);
> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>   void xe_pm_runtime_get(struct xe_device *xe);
>   int xe_pm_runtime_get_sync(struct xe_device *xe);
> -void xe_pm_runtime_put(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>   bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
> -bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
> +void xe_pm_runtime_put(struct xe_device *xe);
>   void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>   void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
