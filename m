Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D762C48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 16:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFB510E18B;
	Mon,  4 Mar 2024 16:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYE/ExIp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9473410E18B
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 16:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709570936; x=1741106936;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=XGxB92FH0MdWp2EWxKwjpNVvrw03MO1hUbczHRMXlvU=;
 b=KYE/ExIpw052Crpdn5ZEJgUgyuOHkgDfuh7VbAjRTmTCNpK436B+zTDL
 /U+qwDBDzk9CLRBYxING1qtBkWv4dHyLKAtDcGQwLniwLKO3HRfwJb7b/
 2vS7Z5XwouBpcB1rKpCoItrtnxJjWJI6T0GgOmBJI8ypPn0Bvqr2cbpO8
 NdvnePYCuGkpw1FFk3uLq6BPM/4LkJbiqBjy7URuqeuaT+5KuO9780dim
 7dZRqafWC17APdiloEllNW/RQQzmOkcsnBP9YZgWnQkJx1d55TJOOeTGv
 5eIhvfd7NB7uEnaPTjnkNB6L2Oyp6VeiMBdbbeHW2YSLCUJyTM8TMvMHw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3936534"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3936534"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:48:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9482291"
Received: from mshirdel-mobl.ger.corp.intel.com (HELO [10.252.23.228])
 ([10.252.23.228])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:48:55 -0800
Message-ID: <275c17ef-3f72-48a8-8006-d6a564ef8f4c@intel.com>
Date: Mon, 4 Mar 2024 16:48:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Convert xe_pm_runtime_{get, put} to void and
 protect from recursion
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240301180526.643505-1-rodrigo.vivi@intel.com>
 <20240301180526.643505-3-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240301180526.643505-3-rodrigo.vivi@intel.com>
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

On 01/03/2024 18:05, Rodrigo Vivi wrote:
> With mem_access going away and pm_runtime getting called instead,
> we need to protect these against recursions.
> 
> The put is asynchronous so there's no need to block it. However, for a
> proper balance, we need to ensure that the references are taken and
> restored regardless of the flow. So, let's convert them all to void and
> use some direct linux/pm_runtime functions.
> 
> v2: Rebased and update commit message (Matt).
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Sorry missed this, r-b still applies to v2.

> ---
>   drivers/gpu/drm/xe/xe_pm.c | 25 ++++++++++++++-----------
>   drivers/gpu/drm/xe/xe_pm.h |  4 ++--
>   2 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 3e13a666fcc7..9fbb6f6c598a 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -408,26 +408,29 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   /**
>    * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
>    * @xe: xe device instance
> - *
> - * Returns: Any number greater than or equal to 0 for success, negative error
> - * code otherwise.
>    */
> -int xe_pm_runtime_get(struct xe_device *xe)
> +void xe_pm_runtime_get(struct xe_device *xe)
>   {
> -	return pm_runtime_get_sync(xe->drm.dev);
> +	pm_runtime_get_noresume(xe->drm.dev);
> +
> +	if (xe_pm_read_callback_task(xe) == current)
> +		return;
> +
> +	pm_runtime_resume(xe->drm.dev);
>   }
>   
>   /**
>    * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
>    * @xe: xe device instance
> - *
> - * Returns: Any number greater than or equal to 0 for success, negative error
> - * code otherwise.
>    */
> -int xe_pm_runtime_put(struct xe_device *xe)
> +void xe_pm_runtime_put(struct xe_device *xe)
>   {
> -	pm_runtime_mark_last_busy(xe->drm.dev);
> -	return pm_runtime_put(xe->drm.dev);
> +	if (xe_pm_read_callback_task(xe) == current) {
> +		pm_runtime_put_noidle(xe->drm.dev);
> +	} else {
> +		pm_runtime_mark_last_busy(xe->drm.dev);
> +		pm_runtime_put(xe->drm.dev);
> +	}
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 29c20099a3f9..0cb38ca244fe 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -26,9 +26,9 @@ void xe_pm_runtime_fini(struct xe_device *xe);
>   bool xe_pm_runtime_suspended(struct xe_device *xe);
>   int xe_pm_runtime_suspend(struct xe_device *xe);
>   int xe_pm_runtime_resume(struct xe_device *xe);
> -int xe_pm_runtime_get(struct xe_device *xe);
> +void xe_pm_runtime_get(struct xe_device *xe);
>   int xe_pm_runtime_get_ioctl(struct xe_device *xe);
> -int xe_pm_runtime_put(struct xe_device *xe);
> +void xe_pm_runtime_put(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>   bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
>   bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
