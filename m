Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A266078871
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wwf0zWjP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5359910EE81;
	Mon, 19 Oct 2026 15:46:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF4310EEB0;
 Mon, 19 Oct 2026 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792424808; x=1823960808;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kizCdlWLTM823RBwUCGcFkX6qyawvDErxX3dbJVpz70=;
 b=Wwf0zWjPTrQsmSTcqGjWp87/L6I37n+F3xAFh/08s0BZ1STF9Tjzx5fs
 4YlStTDqVab3n8f4mAIcuQc8gBIgliddXnqkv2jiIJIbQ3ZZLUBx4o1eP
 O2cl8ELMP/NlnnllWOBmZAC6DcXcVujZT5wjVWKPerb8Cc7b5VrNGegBC
 EVXcJDKodgT9d+sHH05B3pi6iZIKwi0AaTyUKO1ot2pUKEZM2jjNg2ZgU
 iTkrKFmlvDNoXbSCWkfEUVqsaWTrGV/WM+FjspuOBgDzidz66JvUeaLaz
 SlKRN2RtQPMy/OYfOkL4f4tjhIq7vzzCFLncDDQspsX4NI8CKM/rs7e1b g==;
X-CSE-ConnectionGUID: MZWaBBxrSzKBAXCB6WkKKA==
X-CSE-MsgGUID: AytRnCd+Sl+fa8QiZM7kGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1011261"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1011261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:46:38 -0700
X-CSE-ConnectionGUID: BGjngoLPSAud5usxVUcQPg==
X-CSE-MsgGUID: VoDjGTbnRdqgJ88AG8VLRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2621698"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:46:36 -0700
Date: Mon, 19 Oct 2026 17:46:30 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Document which platforms have VT-d
Message-ID: <dxvaflq4p35o67s6yhlt4xuudputvop2b3l5pe2br4agoqfieg@vflgawv7dqep>
References: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
 <20261019130014.8851-4-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019130014.8851-4-ville.syrjala@linux.intel.com>
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

On Mon, Oct 19, 2026 at 04:00:14PM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Document which platforms may or may not have VT-d support.
> Avoids having to trawl all the CPU/chipset docs yet again.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał 

> ---
>  drivers/gpu/drm/i915/display/intel_display_utils.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_utils.c b/drivers/gpu/drm/i915/display/intel_display_utils.c
> index 04d010f7c23e..53de5b90239d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_utils.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_utils.c
> @@ -22,6 +22,12 @@ bool intel_display_run_as_guest(struct intel_display *display)
>  #endif
>  }
>  
> +/*
> + * Notes on VT-d support:
> + * - Q35,Q45,GM45,GS45 are the only GMCHs that support VT-d
> + * - VLV and CHV do not support VT-d
> + * - ILK+ VT-d support varies based on CPU SKU
> + */
>  bool intel_display_vtd_active(struct intel_display *display)
>  {
>  	if (device_iommu_mapped(display->drm->dev))
> -- 
> 2.55.0
> 
