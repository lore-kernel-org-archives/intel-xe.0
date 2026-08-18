Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA50BC5DF70
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 07:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC8110E187;
	Tue, 18 Aug 2026 07:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTlwSnDu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C938110E187
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 07:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787039960; x=1818575960;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IlPITqwPUdxJo1BWA+Izp80mY3TX9C7fioWoyD6pC3s=;
 b=JTlwSnDuy3Ra4du2YIo+Y78NO7CSvMhBrCSxkFrIXs3TGryvB8EtGe5D
 V+t3hV0GgxItVPTQxaZaYm/s8P4JNqrjdCwhU0O3kGHsqpkrw+WR1N1KZ
 QyBCUuIc0y71pBcGXZNM+I0ozAiLBWt0ZfDu3kAnl6RiaqxrSUDJrGrH7
 Klhf880wSYM2YPLzN50PG4DORAWl0bRIIAdBg9v6NhYBNho2heop26/uo
 CNpV/OxVLJYpVmogEa1S0INrooUMIqFOfMRjmCq+elmQZ1gMvkcWFwzrq
 /UMvCfAli45epFYgLS/Uki11raUV7+Wthk+otozoi+aUgY0zH0PpdcsKl g==;
X-CSE-ConnectionGUID: i61Dw41WSiObh1dx8v06dg==
X-CSE-MsgGUID: 0K9vPI3qTLi7UUKM6Ve5TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="110310208"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="110310208"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 00:59:20 -0700
X-CSE-ConnectionGUID: hZoAwKsnR/e4zO6e3Erx4Q==
X-CSE-MsgGUID: hfTM6CzOTUCbBDVXkdE+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263426936"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 00:59:19 -0700
Date: Tue, 18 Aug 2026 09:59:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 riana.tauro@intel.com
Subject: Re: [PATCH] drm/xe/xe_drm_ras: Enable CONFIG_DRM_RAS
Message-ID: <aoQQ05RgZxVOeY_U@black.igk.intel.com>
References: <20260818075454.1508724-2-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818075454.1508724-2-balasubramani.vivekanandan@intel.com>
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

On Tue, Aug 18, 2026 at 01:24:55PM +0530, Balasubramani Vivekanandan wrote:
> Xe RAS functionality needs DRM RAS support. Enable it.
> 
> Fixes: b40db12b542f5 ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4d7dcaff2b915..6c584f918edf2 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -42,6 +42,7 @@ config DRM_XE
>  	select DRM_GPUSVM if !UML
>  	select DRM_GPUVM
>  	select DRM_SCHED
> +	select DRM_RAS

Nack, this was an internal workaround. It's upto the user to decide.

Raag

>  	select MMU_NOTIFIER
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS
> -- 
> 2.43.0
> 
