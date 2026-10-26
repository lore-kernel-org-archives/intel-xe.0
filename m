Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCE8606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EXL71/FZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B43189119;
	Mon, 26 Oct 2026 11:31:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F28610E1DC
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793014292; x=1824550292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MpOzEqJoObv7mmO852IRr4DpvL20cWqN4SmT1vYPHUE=;
 b=EXL71/FZFsBxz2Kb50SkYnT75LJ4QAz2GQTmJcFgbhibrIQcpMWbDHrf
 tq7+smakSd3aU9SNV9F1L0wHePFxJrPNFDum/fwNQdU206IVZtSHiDYni
 rExyygTPtUIpzogJ0CgnJf6f8sqtOMGQWnDAp9Hm2nyrgX4E5XEMSIprr
 3OrQecx/k/0mjzXZ4U0iFefZ6pM4lhdvF2k7MfyvLS2GddsFhi8ul48SM
 lICsNZRoBdK/6klD8zA1gZ++QaOZCh4nHkvoswkdQ+euddhrCNb9t3zeJ
 KUDlAsB+YPXg5zgYHYD8wa8xhT1qrSew5U1oF1DZnlYQVfHBIj8cnTfhT w==;
X-CSE-ConnectionGUID: 29O0VgFZQTiyA33BjyPB0A==
X-CSE-MsgGUID: 5zvx4q8QQ36VqFBydA9mog==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1562478"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1562478"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:31:26 -0700
X-CSE-ConnectionGUID: fMXZDpYvQweAE8+00u2Nbw==
X-CSE-MsgGUID: MmUXZO8kQNGQAzOsZirwdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4387266"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:31:24 -0700
Date: Mon, 26 Oct 2026 12:31:21 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v5 05/13] drm/xe/cper: Log CPER records for aggregate
 counter retrieval
Message-ID: <at86CdrzHff_GxX5@black.igk.intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-20-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023043422.681260-20-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 10:04:27AM +0530, Badal Nilawar wrote:
> Log CPER records for aggregate counter retrieval from userspace when
> cper_on_query sysfs is enabled.

...

> +static enum xe_sigid ras_comp_to_hw_sigid(u8 component)

Group these with other 'component' switcheroos, preferably above
ras_status_to_errno().

> +{
> +	switch (component) {
> +	case XE_RAS_COMP_DEVICE_MEMORY:
> +		return XE_SIGID_DEVICE_MEMORY;
> +	case XE_RAS_COMP_CORE_COMPUTE:
> +		return XE_SIGID_CORE_COMPUTE;
> +	case XE_RAS_COMP_PCIE:
> +		return XE_SIGID_PCIE;
> +	case XE_RAS_COMP_FABRIC:
> +		return XE_SIGID_FABRIC;
> +	case XE_RAS_COMP_SOC_INTERNAL:
> +		return XE_SIGID_SOC_INTERNAL;
> +	default:
> +		return XE_SIGID_HW;
> +	}
> +}
> +
> +static u8 ras_sev_to_cper_sev(u8 ras_sev)

Ditto, move this above drm_to_xe_ras_component() with other 'severity'
switcheroos. Also use 'severity' as parameter name.

> +{
> +	switch (ras_sev) {
> +	case XE_RAS_SEV_CORRECTABLE:
> +		return CPER_SEV_CORRECTED;
> +	case XE_RAS_SEV_UNCORRECTABLE:
> +		return CPER_SEV_RECOVERABLE;
> +	case XE_RAS_SEV_INFORMATIONAL:
> +		return CPER_SEV_INFORMATIONAL;
> +	default:
> +		return CPER_SEV_RECOVERABLE;
> +	}
> +}

...

> @@ -1248,5 +1285,9 @@ int xe_ras_init(struct xe_device *xe)
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
>  
> +	ret = xe_cper_sysfs_init(xe);
> +	if (ret)
> +		xe_err(xe, "Failed to create cper_on_query sysfs, err=%d\n", ret);

This function is int now, so let's not hide bugs and return the error.

Raag

> +
>  	return devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
>  }
> -- 
> 2.54.0
> 
