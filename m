Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C872C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 09:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF2F10E1B2;
	Tue, 30 Jun 2026 09:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVmg4EGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5F010E1B2
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782813434; x=1814349434;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n8PPDEKun6H3fY+hk/bKMnvdqRltN0zq5HzAJ1DReDI=;
 b=FVmg4EGg+t20kh7IW2D7f+grVVwL8xjpYHCbzA6Z71I+DmCNBVKinKz2
 GiCGYf5tpcJLOphNhjHHAeput2OTdcrHW5cE+uAoNOSmRQn72WsmgEzXu
 TTimnWBS3+ITd+CnhIY5jThoj8qtZpyarKxhHT7xHE8DUYqPf4MXQu9BX
 UJ5GwqftbwdqyCxxOI1gdOyNDxPpbwwz0b/NT11Q61NMoT/TGIxmCxzM7
 GhrNm0sFEvaGch03DOm2EybnmXYn/zBCL2YdcmDdPa+ADYyK/TPs5TTAq
 hzMiZilMM2ue/2lbniM/Vo/OsrgRrb9M8Vp568pqZWObXsYQQcUh9rVWB w==;
X-CSE-ConnectionGUID: yslhrhs6RHOvyyvPgzcrTg==
X-CSE-MsgGUID: EdqZku3QThuO80DnSGGovA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94174606"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="94174606"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 02:57:13 -0700
X-CSE-ConnectionGUID: Yeh9j/lvRX2OYlXxfXH+HA==
X-CSE-MsgGUID: dLU0AfPIRNW4c+KsxNmKfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="251167431"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP; 30 Jun 2026 02:57:12 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id A26ED95; Tue, 30 Jun 2026 11:57:11 +0200 (CEST)
Date: Tue, 30 Jun 2026 12:57:10 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Drop manual VF check
Message-ID: <akOS9lXJjQhCSJGN@kuha>
References: <20260630091800.403926-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630091800.403926-1-raag.jadav@intel.com>
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

On Tue, Jun 30, 2026 at 02:48:00PM +0530, Raag Jadav wrote:
> Clear has_i2c flag inside vf_update_device_info() instead of manually
> checking for VF instance.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 1 +
>  drivers/gpu/drm/xe/xe_i2c.c    | 3 ---
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index e8b6afb29ab6..cfd4983be411 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -745,6 +745,7 @@ static void vf_update_device_info(struct xe_device *xe)
>  	xe->info.probe_display = 0;
>  	xe->info.has_heci_cscfi = 0;
>  	xe->info.has_heci_gscfi = 0;
> +	xe->info.has_i2c = 0;
>  	xe->info.has_late_bind = 0;
>  	xe->info.skip_guc_pc = 1;
>  	xe->info.skip_pcode = 1;
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 706783863d07..bd956776b10b 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -334,9 +334,6 @@ int xe_i2c_probe(struct xe_device *xe)
>  	if (!xe->info.has_i2c)
>  		return 0;
>  
> -	if (IS_SRIOV_VF(xe))
> -		return 0;
> -
>  	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
>  	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
>  		return 0;
> -- 
> 2.43.0

-- 
heikki
