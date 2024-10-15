Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F5CD21699
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 12:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B107910E581;
	Tue, 15 Oct 2024 12:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MydvXE5y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B2310E581
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728996496; x=1760532496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PGjWsjiq8g3nxHROPiSMdd9crv6fMMvPIN/f/Pwepmg=;
 b=MydvXE5yL6nxJVQWFlyIvaTSwMeJm6V9VebFoFt4EkYSwADp30NP6wJE
 0m/1arC/02+Z0VvwJm0d7g04qhllaMOYbAC+n4cqccZcND9NGvGcqsTgN
 yjV/gS/slOFADfp/d4jGlBMd5vxZa1Ls95waIB6q1S/rXrVk2upk9oGMq
 xL46N0WYEs7dOqOC+MkWzQTdwBYRdQyMOrLp33+a5EsNE9uDQsSQzC9Zi
 dnFYe4l38Fg48iRorTM3+g5w2KOCg2VjMAfbdMiIz+81s7qm8+brHqdEm
 DShCzb6H0QTO6JryH36n24AvW00JoyIk+WU+BYUOau3vCeNKdGLlYd6uQ g==;
X-CSE-ConnectionGUID: ImVBqmdjSaehbeto6Ff8cQ==
X-CSE-MsgGUID: VeFyyG1rSL2SDyP535zoTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27831173"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="27831173"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 05:48:15 -0700
X-CSE-ConnectionGUID: 5ilPLwFtRGGb5mjxzvL8og==
X-CSE-MsgGUID: 9ym3j8KFRaOwynD8HKxPjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="78332551"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.245.74])
 ([10.245.245.74])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 05:48:11 -0700
Message-ID: <2c1943fd-3a21-44da-a771-162f3ff160f2@linux.intel.com>
Date: Tue, 15 Oct 2024 14:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/ufence: Warn if mmget_not_zero() fails
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20241015090546.3082719-1-nirmoy.das@intel.com>
 <20241015090546.3082719-3-nirmoy.das@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241015090546.3082719-3-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Please change this to a XE_IOCTL_DBG, don't use XE_WARN_ON as it can potentially be triggered on process exit.

Den 2024-10-15 kl. 11:05, skrev Nirmoy Das:
> This shouldn't happen but seen this while debugging ufence timeout
> issue time to time so log it to isolate this particular case.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 2e72c06fd40d..22f72df36ab2 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -83,6 +83,8 @@ static void user_fence_worker(struct work_struct *w)
>  			XE_WARN_ON("Copy to user failed");
>  		kthread_unuse_mm(ufence->mm);
>  		mmput(ufence->mm);
> +	} else {
> +		XE_WARN_ON("mmget_not_zero() failed");
>  	}
>  
>  	wake_up_all(&ufence->xe->ufence_wq);

