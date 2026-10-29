Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9A6606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YsKwkknd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A07112237;
	Thu, 29 Oct 2026 11:59:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B64112251
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793275177; x=1824811177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J9WGQByLZ6va4YIRbOhxDLWMaBK5KRkXl1Xcfh72xT0=;
 b=YsKwkkndaBdREI3W8SgsilF7o14fD118gsSxRsShTmYNAZN07MCGfCPK
 VAyhwDkp6nLp046hnTVlFShx/qi6GjGWAGLl8SJIl8FoRPYnhANS6CAK2
 23MeZwrai54Fmroe0mxUu66EZd3GhKtNBX42oQ6wtlP0wmtB1MeNwy0Yk
 OIB9yqQdeoxpNsG1HoChs6n8cIUz30LRRg6LcFLMk4s99IN5jIpzloK8c
 kphDuSAjeBtMw4h9LhkX4Xz4rk6jsiQ/94APsIOJicXcLBupXVjicPPYD
 ysFv9JPY6Htcmaf92dS45AgCAQxWWS7RgGydB6qe2RZBH/SjB4RUpT0dU g==;
X-CSE-ConnectionGUID: hP6KCPo3Rf26oyH4ePc9fw==
X-CSE-MsgGUID: GdTrypb8TyyyUabOdHzHSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2004839"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2004839"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:59:37 -0700
X-CSE-ConnectionGUID: PUI10VkkRBOvQyHuh7TPgg==
X-CSE-MsgGUID: sq+gIJUeQOSC8+llfbm1fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5135086"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:59:34 -0700
Date: Thu, 29 Oct 2026 12:59:31 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v8 09/10] drm/xe/xe_ras: Report soc internal errors using
 SIGID
Message-ID: <auM1I4v9lK0GnwnK@black.igk.intel.com>
References: <20261029113653.1860286-12-badal.nilawar@intel.com>
 <20261029113653.1860286-21-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029113653.1860286-21-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 05:07:03PM +0530, Badal Nilawar wrote:
> Use xe_log_* helpers to report soc internal errors.
> 
> Example:
> 	xe 0000:03:00.0: [drm] *ERROR* SIGID=205 FATAL
> (020600700000000000000000) [Hardware Error]: SOC_INTERNAL:
> PUNIT error detected: 0x00000002
> 
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
