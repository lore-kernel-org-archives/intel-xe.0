Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85187606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K0Whnw2S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C51210E6B8;
	Wed, 28 Oct 2026 17:05:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515AB10E6B8
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793207139; x=1824743139;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k+gp/NzsevutfF5SXz2jcuZf1iiqOIrpf3xS2IFMZJM=;
 b=K0Whnw2STLGzXxRiZTDL3Y1xwpwOTUtu9sEAdDkRbzxCC3w/1tR5ofsW
 bsWFGfBqCFNpKSMY3/gtuVj6YIKfmYirCTgtB578Jc1JgkfSexXfPKZC7
 WRtEr2VbX/UJ6KZvpwscy2+GXhGYNGZGHN7MT2fl6UGDCllk8lj3Na10g
 +So2vTAuL1H6A93bEKWv/2D/jLNYojW0QnWyPiW9cewHREMAz7kXgkOWk
 GLiwkvAuSx4felVG+I5ndzg+XWdm9HDkhRNdllcAo+anpppv/S9mbgmgl
 633/7izArYnl8CfRSAuASnSPmSx1R0fYgUDUyNJCfw7XDztIldSDf9KRV A==;
X-CSE-ConnectionGUID: nMmt3+cmRZeApRsApqiVyQ==
X-CSE-MsgGUID: iPcOzQLIRpeDN9M0P3q/9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1966746"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1966746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:05:39 -0700
X-CSE-ConnectionGUID: gD4nsI5hSMShrsULzL5wLw==
X-CSE-MsgGUID: uvyyJ4KYThSn/KYQ3krnZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5027206"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:05:35 -0700
Date: Wed, 28 Oct 2026 18:05:33 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v6 05/10] drm/xe/cper: Log CPER records for aggregate
 counter retrieval
Message-ID: <auIrXSWHyxE2K_M6@black.igk.intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
 <20261028095723.734387-17-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028095723.734387-17-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 03:27:29PM +0530, Badal Nilawar wrote:
> Log CPER records for aggregate counter retrieval from userspace when
> cper_on_query sysfs is enabled.

...

> +void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +			  const struct xe_ras_error_class *counter,
> +			  const struct xe_ras_get_counter_response *response)

[1] This is good.

>  {
>  	struct xe_cper_intel_hdr ihdr = {};
>  
> +	xe_assert(xe, is_hw_sigid(sigid));
> +
>  	cper_init_intel_hdr(xe, counter, response->timestamp,
>  			    sigid, response->value, &ihdr);
>  	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
> @@ -217,7 +231,7 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>  		return;
>  	}
>  
> -	cper_emit_counter(xe, cper_sev, sigid, counter, &response);
> +	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
>  }

...

> +void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +			  const struct xe_ras_error_class *error_class,
> +			  const struct xe_ras_get_counter_response *resp);

Please make the parameter naming consistent with above[1].

> +int xe_cper_sysfs_init(struct xe_device *xe);
>  #else
>  static inline void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>  				u32 component, u32 location, const void *data, size_t len,
>  				struct va_format *vaf) {}
> +static inline void xe_cper_emit_counter(struct xe_device *xe, int cper_sev,
> +					enum xe_sigid sigid,
> +					const struct xe_ras_error_class *error_class,
> +					const struct xe_ras_get_counter_response *resp) {}

Ditto.

And with that

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> +static inline int xe_cper_sysfs_init(struct xe_device *xe) { return 0; }
>  #endif
