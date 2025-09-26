Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63537CAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 11:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F0010E06B;
	Fri, 26 Sep 2025 11:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezRlpB+t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FC410E06B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758886347; x=1790422347;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+lzUmXPhHpjyc25divC65yF/nRtucvcyG8u3n2yQzLU=;
 b=ezRlpB+tOVPzD0j//8W/3bw3ROtVnePt7pt8EL1xQAwC6tmTJ6te1jDf
 Bs+cpxyWQrpKXDwyhHot47p3GtBExwEDCzOYw7nIbVHxfAiFbgDBFallt
 GjaSzCgIdY9b6puYA81wdWC20iukDcAN25l4HokcgOfIvdIoTvpAcSh9S
 bSc6cDpv6/E88YZkZhDvwpWxDsll3vLCZDpO4H/fmuWfnTAhHTzZS+6to
 oFJd+gqfmoTWGjkYsAzyU3bIfQ3bx0qsRkoyL60siEnNt1lPqVV11B3P8
 vqIT6Z+EZS3FsGIKTzAQmcyfZT/LL1/A2n9CAUcsEOi1TZwFXjkW9yidU g==;
X-CSE-ConnectionGUID: zlAiinhISIGYi8eNZH4Hvw==
X-CSE-MsgGUID: 4Ms5zVe/QKy4SY7hqokI3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="64849400"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="64849400"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:32:27 -0700
X-CSE-ConnectionGUID: ysChruJTSlCl793WiQpffA==
X-CSE-MsgGUID: 6xkkVxBvQxarVZstel01iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="201284824"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.10])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:32:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: Re: [PATCH v4 8/9] drm/xe: Handle xe_work_period destruction
In-Reply-To: <20250926104521.1815428-9-aakash.deep.sarkar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
 <20250926104521.1815428-9-aakash.deep.sarkar@intel.com>
Date: Fri, 26 Sep 2025 14:32:20 +0300
Message-ID: <410b1c3689f9d95a27a3826e4efabc2b23faa112@intel.com>
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

On Fri, 26 Sep 2025, Aakash Deep Sarkar <aakash.deep.sarkar@intel.com> wrote:
> This adds the xe_work_period destruction procedure.
> We iterate over all entries in the xe::work_period::users
> xarray and cancel any pending delayed work. Then destroy
> the xarray itself.
>
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c34da72e5c9a..e270f57a9750 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -419,6 +419,8 @@ static struct drm_driver driver = {
>  static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_user *user = NULL;
> +	unsigned long i;
>  
>  	xe_bo_dev_fini(&xe->bo_device);
>  
> @@ -434,6 +436,15 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  	if (xe->destroy_wq)
>  		destroy_workqueue(xe->destroy_wq);
>  
> +
> +	mutex_lock(&xe->work_period.lock);
> +	xa_for_each(&xe->work_period.users, i, user) {
> +		if (cancel_delayed_work_sync(&user->delay_work))
> +			xe_user_put(user);
> +	}
> +	xa_destroy(&xe->work_period.users);
> +	mutex_unlock(&xe->work_period.lock);

These are all user details, why are they in xe_device_destroy()? Add a
new function that does this for you, and hide all the details away.

BR,
Jani.

> +
>  	ttm_device_fini(&xe->ttm);
>  }

-- 
Jani Nikula, Intel
