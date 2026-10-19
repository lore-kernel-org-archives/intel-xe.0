Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E795606DA41
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XNSzoeoj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED32210E9D4;
	Mon, 19 Oct 2026 15:21:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7744810EE67
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 15:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792423295; x=1823959295;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SV980ijrp62yoy/gdlpfRPXjVw6msfzuNiLIzoDyvqk=;
 b=XNSzoeoj+hz2Wlj6zHKqQhZmvopQgXmKFNFBs52EqGEwoXn79eZUUo2g
 XO+5dC5o0hUTSQLQDM51hQOdQ6mMZBsT7r1K40QCnzD8zrsH1Ey0PWtJj
 fgn4AYoCkdl7kyofZ0Rktg4RCrGLwlwHY9vWjoiVlZQlPzVOSvkmQxg4m
 4S4L0bh0SUuBfafPTH8XPb+a5wT3xmWjPJLK6F/UNeeYdqas8GhKZ3lKD
 Bg1dZ0rEhTi+GhpdQASIYL6NwtiqOyZaqiJlD/rHVj3OOrsIoal+9Qzso
 M+T01PNaonfywTDxPvIqPvW/LjQBCFIQ2rxsaIB7CTzkHWqQIJPg1OZYt g==;
X-CSE-ConnectionGUID: Il3pmBkKTsuNSx/H95hEKA==
X-CSE-MsgGUID: K7L8136CS06QPjvLnRBGnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="975936"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="975936"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:21:35 -0700
X-CSE-ConnectionGUID: X5R2uYVwSLmlcdacsBqcBg==
X-CSE-MsgGUID: Y4Z7iVEWQbWDSTqNOTO/YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2450652"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:21:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, kernel test robot
 <lkp@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
In-Reply-To: <20261016193254.3042071-2-rodrigo.vivi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261016191838.GH578251@mdroper-desk1>
 <20261016193254.3042071-2-rodrigo.vivi@intel.com>
Date: Mon, 19 Oct 2026 18:21:29 +0300
Message-ID: <9411b525240f8b79c2d828a887d1679518374689@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> When xe is built-in but configfs is a module, xe_configfs.o is not
> linked into xe, while IS_ENABLED(CONFIG_CONFIGFS_FS) in xe_configfs.h
> still exposes the real declarations, leading to undefined references.
>
> Use IS_REACHABLE() so this case falls back to the stubs, the same as
> CONFIGFS_FS=n.

I think using IS_REACHABLE() is almost always a mistake. It's a hack to
avoid link errors when something in a module needs something that is
built-in. It's a combo that should be handled at Kconfig level, not at
build level.

BR,
Jani.


>
> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610160935.Qk4ZxBxY-lkp@intel.com/
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Assisted-by: LLM
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 10a00d6bbf8f..327b648944ff 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -14,7 +14,7 @@
>  
>  struct pci_dev;
>  
> -#if IS_ENABLED(CONFIG_CONFIGFS_FS)
> +#if IS_REACHABLE(CONFIG_CONFIGFS_FS)
>  int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);

-- 
Jani Nikula, Intel
