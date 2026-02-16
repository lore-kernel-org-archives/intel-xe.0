Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFF0E7BD86
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 10:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BACF10E219;
	Mon, 16 Feb 2026 10:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rd8y6/YU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195CF10E24B;
 Mon, 16 Feb 2026 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771237278; x=1802773278;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qmCg4zmZtyWQiLXok/FOfcLhGo9Ml5Ine3BAMc1vxcA=;
 b=Rd8y6/YUixFWvh9GdTkgp+VRZXA2yfaBNJZzkYlaF1chMGMZTmCx1rtv
 B3lTlvn7XRfTG7PPzamtnagp+m/qzB0m1g9UQCdS0y0WGT7FuIwNJZqi5
 lD7OWgiLg96KNqP9elx1H75YcBpIjLxBg30by0KGMjvDEOXr+vrFHD78z
 8dKOIqiJ2ukKoA5cmk/LvhY0/FgYyivOW9Ot6p2Ic1Sd+F5XxUqnBr1lh
 obxSHzxkhtJe0WMmj2eGCsqlyxTbuIm+VNtyQrrMk8NBhHqBYI1a2WSDn
 PAX0haZkEfUqoxg0RMZV0fk5SM0PrwmY1J4WtU++kcXAiGJlq56du6Jzj A==;
X-CSE-ConnectionGUID: sUfwT0ZkSUONpKbhoGRBlg==
X-CSE-MsgGUID: McGkuLLJQVS6QPhW7fGVEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="59882678"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="59882678"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:21:17 -0800
X-CSE-ConnectionGUID: gBfvx92CS+SspGT3vfJiLw==
X-CSE-MsgGUID: 1JWp9oAIQ96IULRutGdbgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212119458"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:21:14 -0800
Date: Mon, 16 Feb 2026 11:21:11 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v6 5/5] drm/xe/xe_hw_error: Add support for PVC SoC errors
Message-ID: <aZLvl7tinj9h-h-B@black.igk.intel.com>
References: <20260216064726.2542819-7-riana.tauro@intel.com>
 <20260216064726.2542819-12-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216064726.2542819-12-riana.tauro@intel.com>
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

On Mon, Feb 16, 2026 at 12:17:31PM +0530, Riana Tauro wrote:
> Report the SoC nonfatal/fatal hardware error and update the counters.

...

> +	/*
> +	 * Read the master global IEH error register, if BIT(1) is set then process
> +	 * the slave IEH first. If BIT(0) in global error register is set then process
> +	 * the corresponding local error registers.
> +	 */
> +	master_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(master, hw_err));
> +	if (master_global_errstat & SOC_SLAVE_IEH)
> +		soc_slave_ieh_handler(tile, hw_err, error_id);
> +
> +	if (master_global_errstat & SOC_IEH0_LOCAL_ERR_STATUS) {
> +		const char * const *reg_info = (hw_err == HARDWARE_ERROR_FATAL) ?
> +						pvc_master_local_fatal_err_reg :
> +						pvc_master_local_nonfatal_err_reg;

Nit: Ditto, with something like PVC_MASTER_LOCAL_REG_INFO() you won't
need a local pointer.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> +		master_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(master, hw_err));
> +
> +		for_each_set_bit(regbit, &master_local_errstat, XE_RAS_REG_SIZE)
> +			log_soc_error(tile, reg_info, severity, regbit, error_id);
> +
> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(master, hw_err), master_local_errstat);
> +	}
> +
> +	for_each_set_bit(regbit, &master_global_errstat, XE_RAS_REG_SIZE)
> +		log_soc_error(tile, pvc_master_global_err_reg, severity, regbit, error_id);
> +
> +	xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(master, hw_err), master_global_errstat);
> +
> +unmask_gsysevtctl:
> +	for (i = 0; i < XE_SOC_NUM_IEH; i++)
> +		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(master, slave, i),
> +				(HARDWARE_ERROR_MAX << 1) + 1);
> +}
