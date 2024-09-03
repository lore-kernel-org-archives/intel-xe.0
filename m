Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4970CD3420
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853C110E53E;
	Tue,  3 Sep 2024 12:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4xlUopU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B96710E53E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725365311; x=1756901311;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WppOB8HdeOF8lvxIs7hkYt1zZx9IbfHz+4OzqJKwK3o=;
 b=L4xlUopUf601+l40q8VeBQzao76RtIbC50387+xifbZUMTySWA5n4yn2
 2s9XF/WptXORaTMQWv0U62fWJg7/nsbdx4kwQoGe97JyL0oHQSzy72jbo
 dgaEYvBeR2OlwI2Z8y01dUVtumFVUS5SMSPmKvt6D+GXVHxbiRDDEA3bU
 K1351b303SPd1X730A0H2lCnVHura8YKo1789ngGcxc6u1Mr87D4Ffuhj
 x90olztlTgonznJ4Ym+33d9i7zmDq1CjVzKDmrlZvJXv0GT0U6nmuvW8t
 aHVk8ltImKHG9tkYxk5fmVHqOV8wiKgcG5dbDqJBWTFflx8Rb/AuAKM3L A==;
X-CSE-ConnectionGUID: TdCfQuL/QjS37Cf1daZQoA==
X-CSE-MsgGUID: BA8Ld5PkQTem+EwjYMizpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23526637"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="23526637"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 05:08:31 -0700
X-CSE-ConnectionGUID: C1QoKTseSWWQfLagtbx9zA==
X-CSE-MsgGUID: HrNEzSYOT0uguLrdXRHDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="102314077"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 05:08:30 -0700
Date: Tue, 3 Sep 2024 14:08:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules
 for i915/Xe Driver
Message-ID: <20240903120826.lint4c3v7gk2s2zd@kamilkon-DESK.igk.intel.com>
References: <20240902141041.18467-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240902141041.18467-1-krishnaiah.bommu@intel.com>
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

Hi Bommu,
On 2024-09-02 at 19:40:41 +0530, Bommu Krishnaiah wrote:
> This update addresses the unload/reload sequence of MEI modules in relation to
> the i915/Xe graphics driver. On platforms where the MEI hardware is integrated
> with the graphics device (e.g., DG2/BMG), the MEI modules depend on the i915/Xe
> driver. Conversely, on newer platforms like CLS, where the MEI hardware is
> separate, this dependency does not exist.
> 
> The changes introduced ensure that MEI modules are unloaded and reloaded in the
> correct order based on platform-specific dependencies. This is achieved by adding
> a MODULE_SOFTDEP directive to the i915 and Xe module code.
> 
> These changes enhance the robustness of MEI module handling across different hardware
> platforms, ensuring that the i915/Xe driver can be cleanly unloaded and reloaded
> without issues.
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_module.c | 2 ++

imho as you touch i915 driver you should also Cc to intel-gfx@lists.freedesktop.org

Regards,
Kamil

>  drivers/gpu/drm/xe/xe_module.c     | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
> index 65acd7bf75d0..2ad079ad35db 100644
> --- a/drivers/gpu/drm/i915/i915_module.c
> +++ b/drivers/gpu/drm/i915/i915_module.c
> @@ -75,6 +75,8 @@ static const struct {
>  };
>  static int init_progress;
>  
> +MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");
> +
>  static int __init i915_init(void)
>  {
>  	int err, i;
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index bfc3deebdaa2..5633ea1841b7 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -127,6 +127,8 @@ static void xe_call_exit_func(unsigned int i)
>  	init_funcs[i].exit();
>  }
>  
> +MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");
> +
>  static int __init xe_init(void)
>  {
>  	int err, i;
> -- 
> 2.25.1
> 
