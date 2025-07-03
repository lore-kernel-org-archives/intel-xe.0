Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73E4C83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 04:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586BA10E0A8;
	Thu,  3 Jul 2025 04:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGd37zAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7B810E0A8
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 04:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751516302; x=1783052302;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fbTRCcGflYx/PlaSFkt8NXwfu73ZUmZruH170IqEVCg=;
 b=EGd37zAdT+Ad6SVVzxgZZ9UTEwhVFiA1aUXy9NbdlXjYKybCF2Qu3dO9
 mTyP0b8NpA9kK5gxATXEGA9FRS+hLTSmJ9JiwJc7y+LRF1k5fYMJ2os+Z
 RLc93Pzc9D40y1d5wDs/LTUwluXEAL+K7fbMEZyN7G6uhns4PQyGcitgB
 1NWARFHdlJGoqtgZD+mShS4/gFjI3BYjWHeCaoTdvZuxSp6CnXDSyyv3p
 Xbb0nAKVQqCnjsVdNz6BOnnvL6WTNU12WeTBAoc8d1SWgWH0b7/fxtX0X
 z7pytn6QOFE2z7uDi1TTuQxXuw9rVmvtzjjOpuXjQZoCt2f5XMcmIdKUU Q==;
X-CSE-ConnectionGUID: 489QMuqbTVqaxiMR5htC4Q==
X-CSE-MsgGUID: xAE25U7kTK2EhmZn0SW2Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57637329"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="57637329"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 21:18:22 -0700
X-CSE-ConnectionGUID: tei7apw7Qt6fj+KLXnB7mQ==
X-CSE-MsgGUID: 5VH0TQobRE+1Kfdge/hkvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154394883"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 21:18:19 -0700
Date: Thu, 3 Jul 2025 07:18:15 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH v3 2/7] drm/xe: Set GT as wedged before sending wedged
 uevent
Message-ID: <aGYEh4xOlqnB1AoY@black.fi.intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-3-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702141118.3564242-3-riana.tauro@intel.com>
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

On Wed, Jul 02, 2025 at 07:41:12PM +0530, Riana Tauro wrote:
> Userspace should be notified after setting the device as wedged.
> Re-order function calls to set gt wedged before sending uevent.
> 
> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0b73cb72bad1..4a38486dccc8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1123,8 +1123,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   * xe_device_declare_wedged - Declare device wedged
>   * @xe: xe device instance
>   *
> - * This is a final state that can only be cleared with a module
> + * This is a final state that can only be cleared with the recovery method
> + * specified in the drm wedged uevent. The default recovery method is
>   * re-probe (unbind + bind).
> + *
>   * In this state every IOCTL will be blocked so the GT cannot be used.
>   * In general it will be called upon any critical error such as gt reset
>   * failure or guc loading failure. Userspace will be notified of this state
> @@ -1151,6 +1153,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		return;
>  	}
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);

This is changing GuC CT state and can race with ioctls, so I think
the sequence should be

 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
		...
	}

	for_each_gt(gt, xe, id)
		xe_gt_declare_wedged(gt);

	if (xe_device_wedged())
		drm_dev_wedged_event();

Raag
