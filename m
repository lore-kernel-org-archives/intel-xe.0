Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3226DCAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 05:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C493A10E435;
	Fri, 12 Sep 2025 05:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkTLkV4L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E238A10E435
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 05:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757654324; x=1789190324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WC+BIqyA9fXrYJfeuMsPhJ1/uudyZF8FTWAOcdPFqeA=;
 b=mkTLkV4LneLgajlRUzGWmCeGZQxQ6IH3YaM/ktYj492ryKgSQUu35qXT
 3N71WTKJy7pjc76VN0vcZSGoOzOa3wjSZVz7AK4VgACoei4wMVT0F5NSR
 UiEVw++db6iG6sjYyQ6WLatg+yx/2fE3yNPGpVdvRbAHptjaIsrbpGAqX
 wv2Gqh4/fOyDSn0s4zawjQPhtFRxQG2XBnyUKMtejMblSwaBhJGn7I1jo
 UYTp7+Xc2FCgSIc9f6MP5zjK2esveXCfJfILNrYTcCePvkw3V21rsAGt2
 MlRJu7FTGmuicxEehuq2HerdFGNXLD7ALi/zDM7/iqwKHJr1XWOG1//4Z Q==;
X-CSE-ConnectionGUID: I+OfWC4IRJChjbbyXvF6jA==
X-CSE-MsgGUID: 4mqh3P2vT3GAHkr+OnuYmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59226255"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="59226255"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 22:18:43 -0700
X-CSE-ConnectionGUID: j73paZtBRtuc1eEp034nbA==
X-CSE-MsgGUID: 8Om6u/g/QneLQ30oGEM04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="178191887"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 22:18:41 -0700
Date: Fri, 12 Sep 2025 07:18:37 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v4 4/6] drm/xe/configfs: Allow to select by class only
Message-ID: <aMOtLe6FIwy0X_JQ@black.igk.intel.com>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
 <20250911-wa-bb-cmds-v4-4-c8f7e48f7eae@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-wa-bb-cmds-v4-4-c8f7e48f7eae@intel.com>
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

On Thu, Sep 11, 2025 at 12:36:28PM -0700, Lucas De Marchi wrote:
> For a future configfs attribute, it's desirable to select by engine mask
> only as the instance doesn't make sense.
> 
> Rename the function lookup_engine_mask() to lookup_engine_info() and
> make it return the entry. This allows parse_engine() to still return an
> item if the caller wants to allow parsing a class-only string like
> "rcs", "bcs", "ccs", etc.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2:
> - Rename function to lookup_engine_info() and return the entry
>   directly instead of the index (Raag Jadav)
> - Add named initializer for new entry for consistency (Raag Jadav)
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 50 ++++++++++++++++++++++++++++------------
>  1 file changed, 35 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 8db7a2af11011..45fdb6cf26b5d 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -152,6 +152,7 @@ static void set_device_defaults(struct xe_config_device *config)
>  struct engine_info {
>  	const char *cls;
>  	u64 mask;
> +	enum xe_engine_class engine_class;
>  };
>  
>  /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
> @@ -159,12 +160,12 @@ struct engine_info {
>  #define MAX_ENGINE_INSTANCE_CHARS 2
>  
>  static const struct engine_info engine_info[] = {
> -	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
> -	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
> -	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
> -	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
> -	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
> -	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
> +	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
> +	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK, .engine_class = XE_ENGINE_CLASS_COPY },
> +	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },
> +	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },

Hmm, so now checkpatch doesn't feel so good about this.
I usually try to shorten the variable/macro names instead of wrapping,
but I guess a few more lines in an already huge driver wouldn't be much
noticeable ;)

Raag

> +	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK, .engine_class = XE_ENGINE_CLASS_COMPUTE },
> +	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
>  };
