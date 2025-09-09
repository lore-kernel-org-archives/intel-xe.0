Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15623CAC587
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 10:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF2810E6A9;
	Tue,  9 Sep 2025 10:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPErgJev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861A510E6A3
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757412680; x=1788948680;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/4pmJPIEawfn5yIZoxBt/LouSyyJoIiQcYdn7657yvo=;
 b=hPErgJev4lQUOm9yyYANHE9fDyy7vAIBx3q3J25uHwenxVJ2GMlFieAz
 CHlBkouoZhlKVVXVYiGFpZDOwft+t9IM0BeqHbQEjYUfmM5EZ7FOPjMKE
 8Kbr30FGDe9ql5RSxe2CTpIPyqzyNm8AEinbuzdpZ56lnDTjhSNDl8iSj
 6cCRSavsVGjWB5dorQf43mOjz5F1PmgmU1SX81euOvJVYtXV3noBh71BT
 V6DHv7oawy5A5ekvVYW3kY4S6VoZIT0ic2OqoYg3w4ryR4BSf5vjAzYwA
 Nh39IKvroJb0Y9S+V6N8T0sa4VJCE9F8pGhDnU+wJAGF/Uxb10Ykc8cUH g==;
X-CSE-ConnectionGUID: GI1PiCnaRpGrVAH5x8/P1Q==
X-CSE-MsgGUID: 1W9e/IlUTCi6UrXJWlXzJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59763488"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59763488"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 03:11:20 -0700
X-CSE-ConnectionGUID: Ny9vnWiVRTeve0Fz39wWSw==
X-CSE-MsgGUID: 8ecyisK1RsuFatCo9OgxQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177343396"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by orviesa004.jf.intel.com with SMTP; 09 Sep 2025 03:11:17 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 09 Sep 2025 13:11:16 +0300
Date: Tue, 9 Sep 2025 13:11:16 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Enable bus mastering
Message-ID: <aL_9RGTUQoljhf8Z@kuha.fi.intel.com>
References: <20250908055320.2549722-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908055320.2549722-1-raag.jadav@intel.com>
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

On Mon, Sep 08, 2025 at 11:23:20AM +0530, Raag Jadav wrote:
> Enable bus mastering for I2C controller to support device initiated
> in-band transactions.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 044dda517b7c..48dfcb41fa08 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -259,7 +259,7 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
>  		return;
>  
>  	if (d3cold)
> -		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
> +		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
>  
>  	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D0);
>  	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> -- 
> 2.34.1

-- 
heikki
