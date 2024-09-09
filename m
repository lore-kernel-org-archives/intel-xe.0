Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6142ECE57A
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 12:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBF710E3F3;
	Mon,  9 Sep 2024 12:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8jvJbj2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C92010E3F3
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 12:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725883329; x=1757419329;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HIfA8B5NTAZOI+rachNgth4TBW8zCiLBYtI+BCrMb8A=;
 b=X8jvJbj2UwlfbA7YaIjyexX7Jn/r1sRDGRGhB0R5njDy29phtsINVehi
 lIlD60mdc2AEZcQpcrkzADdKtSqh4bk32HOq2aIsRS4o+RxfnnrcN1yUI
 uSlhWvTPhffnJVt+BhcQojNYFWo17Jv5Pjp8cALuJ2YO04c8UGykVi8EC
 YVc0ZGyEze+0yfHeDs/ZmWIZah125JHI2h5LoFhtifFi7/1PwY3pntp8Z
 E+amsUkhg10r9bvMsNpH20uLmo70cgcpsh1n1B4Xan6HyQc7px6zd3Nqo
 fJGdrTOdZUn12Fu7h4LV3Ug00aFNVQivHsnxULpSAccBZeAd+tYappvFq A==;
X-CSE-ConnectionGUID: 0pYFgzWVQ3avVc4bRUeOmA==
X-CSE-MsgGUID: lVKQuR29Qmqkg58kovHZcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="42052866"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="42052866"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 05:02:09 -0700
X-CSE-ConnectionGUID: VbR8ANsSSG6o+bLs/I9SSQ==
X-CSE-MsgGUID: neBWUz0KQQ+z6KObLfw7vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="70761620"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.176])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 05:02:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v5 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
In-Reply-To: <20240906071126.28078-3-riana.tauro@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240906071126.28078-1-riana.tauro@intel.com>
 <20240906071126.28078-3-riana.tauro@intel.com>
Date: Mon, 09 Sep 2024 15:02:03 +0300
Message-ID: <874j6pm3wk.fsf@intel.com>
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

On Fri, 06 Sep 2024, Riana Tauro <riana.tauro@intel.com> wrote:
> @@ -288,6 +300,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>  	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>  	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
> +	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
>  	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
>  	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
>  	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 3924f9f3d0a5..85a35ed153a3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>  	return gt_to_xe(gt);
>  }
>  
> +static inline const char *str_up_down(bool v)
> +{
> +	return v ? "up" : "down";
> +}

Please don't add functions with names that are obviously going to have
name collisions with core kernel headers. This now conflicts in
linux-next [1]. Please rename until we can merge the real str_up_down()
from upstream to drm-xe-next.

Also, please don't use static inline in .c files. Just let the compiler
do its thing.

BR,
Jani.


[1] https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au


-- 
Jani Nikula, Intel
