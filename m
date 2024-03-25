Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E49C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 09:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD7C10E445;
	Mon, 25 Mar 2024 09:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIGLNG8A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C9810E445
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 09:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711359867; x=1742895867;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bjqBgQN0BmOxMeyCmSPC6o3/ODT3dMLZVkEjMcZHFEA=;
 b=mIGLNG8Ae77qaYSgwzXZdpwsvKGNPqspEasQj2v1Qq7BWzBKToaKQGMs
 y7uv8tNBaHLY9rW9IWrjhbeEoV42rz8fSKQznPkbH68PWqtuDKxSgyIy8
 JYMILl/bvlQbEYrbTsEiVTmbVWy/07hYj8rqwYPrUDhgKckJ/rJBbUNoL
 fKtBXsIBbkw+iQ+7Yg0JblB53lA6DdxPVFGayzGIJdA9gjf7uVUh6pnZR
 R3OgCOt6xe1qctanAT3kkG1wg8HrL53BYnOjFCuGlXDWnCMffCVysABUk
 4fKxdj+UL/FFBWEr7zQkrTWnP8Qlhis1CD40xk55vp5kFE2oFAMrKzKks g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10122061"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="10122061"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="38673512"
Received: from idirlea-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.171])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:44:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH] drm/xe: Fix static analysis tool reported errors
In-Reply-To: <20240325080550.3217836-1-karthik.poosa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240325080550.3217836-1-karthik.poosa@intel.com>
Date: Mon, 25 Mar 2024 11:44:21 +0200
Message-ID: <87h6guk5my.fsf@intel.com>
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


The subject should describe the change, not the tool.

We're not interested in the tool, we're interested in the change, and
why it's being made. And the reason why is also not the tool, but the
actual reason the NULL check should be done.

BR,
Jani.


On Mon, 25 Mar 2024, Karthik Poosa <karthik.poosa@intel.com> wrote:
> Add a NULL pointer check.
>
> v2: Release resources before returning error. (Riana)
>
> v3: Update commit message. (Badal)
>
> v4: Change drm_err to XE_WARN_ON. (Anshuman)
>
> v5: Fix XE_WARN_ON check. (Riana)
>
> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index cc650a92c2fc..f6837bd6f9a3 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	 * really lost power. Detecting primary Gt power is sufficient.
>  	 */
>  	gt = xe_device_get_gt(xe, 0);
> +	if (XE_WARN_ON(!gt)) {
> +		err = -ENXIO;
> +		goto out;
> +	}
> +
>  	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>  
>  	if (xe->d3cold.allowed && xe->d3cold.power_lost) {

-- 
Jani Nikula, Intel
