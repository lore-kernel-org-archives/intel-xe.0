Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00518CD8CBD
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 17:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2A310E85B;
	Thu,  5 Sep 2024 17:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld4BUITJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E1910E85B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725557691; x=1757093691;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=K1yxd8TWzF2ycBm8Gpg4WtQaUySsYYNt+qkLNXgGsao=;
 b=Ld4BUITJ1Y1KSGcRAkUhGWMR6+fjnsyxWooORbvh8LmfunVJp/AqK5xo
 7vly77y81agfOuMjjBo7Nu1fEUUeAxzGQv+wyIQUHQHIGI6ikEDmAy80V
 vZjOB5jGDiXi4+korAwhtCBjs17c+GfW7ocOM3x4ZtnHHQKojAEhIhbcp
 jmK9+bYAzo4eytOIpEXCW5MAwyHbzouITPaX42fx2SGCOEZ4r9WlrocYo
 lZKUydIhX+2xljF4e5J4R3cGVCyosKo6cncD6L2HpI672evB986UoHOmO
 Lxc73boRgNP+qPXXh0g0ZIV/6C9WUpuqQoK0B3yG6BNcwy21k32fXgmgV Q==;
X-CSE-ConnectionGUID: ZWwS5jtnQbWogBzZ3LgsHw==
X-CSE-MsgGUID: j084NYe7SHOAqePCZwkLGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24440303"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="24440303"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 10:34:50 -0700
X-CSE-ConnectionGUID: uNPYC1zKS5ChM4BVTZfNKg==
X-CSE-MsgGUID: z2sHhifeT1Khk5IZZBK9DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="70485821"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.216])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 10:34:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 0/4] drm/xe: Implement device shutdown to make kexec work.
In-Reply-To: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
Date: Thu, 05 Sep 2024 20:34:45 +0300
Message-ID: <87frqeovgq.fsf@intel.com>
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

On Thu, 05 Sep 2024, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> Testcase:
> kexec --reuse-cmdline --initrd=initrd.img -f vmlinuz
>
> Because we don't shut down xe correctly, we cannot reload xe afterwards.
> Implement device shutdown by performing a FLR, then we can load the device
> cleanly again afterwards.

Maybe a silly question, but what's FLR?

BR,
Jani.


>
> Some cleanups come first, those can be merged without the rest.
>
> Maarten Lankhorst (4):
>   drm/xe: Fix missing conversion to xe_display_pm_runtime_resume
>   drm/xe: Remove runtime argument from display s/r functions
>   drm/xe: Wire up device shutdown handler
>   CI-only: Test if FLR is disabled?
>
>  drivers/gpu/drm/xe/display/xe_display.c | 90 ++++++++++++++++++++-----
>  drivers/gpu/drm/xe/display/xe_display.h | 12 ++--
>  drivers/gpu/drm/xe/xe_device.c          | 43 ++++++++++--
>  drivers/gpu/drm/xe/xe_gt.c              |  7 ++
>  drivers/gpu/drm/xe/xe_gt.h              |  1 +
>  drivers/gpu/drm/xe/xe_pm.c              |  8 +--
>  6 files changed, 129 insertions(+), 32 deletions(-)

-- 
Jani Nikula, Intel
