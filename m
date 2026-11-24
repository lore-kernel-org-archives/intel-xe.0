Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20440606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eKOmCtXl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D319E10F5C0;
	Tue, 24 Nov 2026 13:48:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472F310E880;
 Tue, 24 Nov 2026 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795528109; x=1827064109;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bJz3iVqWp2Ns6pO0iDKSsh4sqEvaG2QRFkA9KBxOEjg=;
 b=eKOmCtXl1CgS6eDGahJUVEbuBXX7nhZAv4pvI/auShioPhBaNn/npFDP
 QKukegjbe2p8oqzxSzHRNIPe2b0DFuGGIJNLYni1wtgU/a2sKwWE7rO5k
 OzJstN/kS2e8SBSc98q4I/PEKewPSZqKSQCa2vHJb9TEeJAj/LLxm/isw
 tthGl4/VyFbrsjoh7n/2BXaGsC2YuwDHuGdNZzotVGxk75HVSUwLTendK
 8fIWL3EqK8mUObeKOh6ew4kyKnzlSuuUjH76jXaJgI9zuJ3HxPlRebC7E
 BgRhIiMEgiqhaVzzqtU7p+7T8E4d9RH3sa3cwCeU+m6ofN/0Xe4wKtH2M w==;
X-CSE-ConnectionGUID: saXqv+qHR2yiIpca2o8Yew==
X-CSE-MsgGUID: w0MADCFURx29RFOqUjQ9ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4280991"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4280991"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:48:28 -0800
X-CSE-ConnectionGUID: elgcoOdUQWeYj3E7agvoIw==
X-CSE-MsgGUID: DOGiopIbQLKp4terfCD4Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11549465"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:48:27 -0800
Date: Tue, 24 Nov 2026 14:48:19 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/compat: remove leftover
 intel_uncore_arm_unclaimed_mmio_detection()
Message-ID: <paa4pkftdmgke2oqxa44gcjt5n4iowy4keqlmzws6yduu5g6dq@grxks4zi65zt>
References: <20261124133804.1509493-1-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261124133804.1509493-1-jani.nikula@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 03:38:04PM GMT, Jani Nikula wrote:
> When the unclaimed MMIO detection was moved to display, an xe compat
> inline functionw was left behind. Remove it.

nit: *function

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> index 238addc1e5fc..707f7ad0378d 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> @@ -63,10 +63,4 @@ static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
>  	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>  }
>  
> -static inline bool
> -intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
> -{
> -	return false;
> -}
> -
>  #endif /* __INTEL_UNCORE_H__ */
> -- 
> 2.47.3
> 
