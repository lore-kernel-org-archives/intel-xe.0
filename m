Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D14EF8FFC
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 16:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864A410EA5F;
	Wed,  4 Mar 2026 16:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgjqhFeS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5240B10EA5F
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 16:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772641976; x=1804177976;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Gc0fSx2CMVebzJfPLLBmUN9kIgBzRZNI6h7nZ7A+wDE=;
 b=GgjqhFeSjGZuYdmOOCTdGXmgUEuSKPw6zex1Y0ZGAsPDyAIfMd+nqChQ
 HOFD3fSY0MJEqN+W5XbOZ5S45aHTA75xeR/DmNZhauTni7fvOYJ8wTsg/
 eY3LpjAqwTz4/mlQblOY+N9GHD/79lwaHaqdMX/Fh5QXbqAk/lZQR0Mmu
 H5bp7uX/jDSyNLsemMgIOpkPnQMTqGyiBi4i91wzsuzZxFoMEBka3co2x
 f/t9PEBcz35UZNo1CS6zzEoBKqAQJnA/wxTeZYSydcLgj5qaY5onkq/JZ
 GTbnecEC5/3n06NRmuxfUD6obSJL+OAhHRwrAS3XwJlcA59yvv+Y94JMt A==;
X-CSE-ConnectionGUID: asLJ68SNRimjxs68Rs9r2Q==
X-CSE-MsgGUID: gkMir9BLSrCN94IuY8XOCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77579708"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77579708"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:32:56 -0800
X-CSE-ConnectionGUID: 5xQXKqY9QE6EBhtUnGWUjg==
X-CSE-MsgGUID: OwtXXFjETWGNdbv4m2isag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="222895102"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:32:53 -0800
Date: Wed, 4 Mar 2026 17:32:50 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v2 07/11] drm/xe/xe_ras: Add structures and commands for
 Uncorrectable Core Compute Errors
Message-ID: <aahesvXwzXJZbOSF@black.igk.intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-20-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302102155.4074630-20-riana.tauro@intel.com>
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

On Mon, Mar 02, 2026 at 03:52:02PM +0530, Riana Tauro wrote:
> Add the sysctrl commands and response structures for Uncorrectable
> Core Compute errors.

...

> +static inline const char *severity_to_str(struct xe_device *xe, u32 severity)
> +{
> +	if (severity >= XE_RAS_SEVERITY_MAX)
> +		return "Unknown Severity";
> +
> +	return xe_ras_severities[severity];

Rather,

	return sev < XE_RAS_SEV_MAX ? xe_ras_severities[sev] : "Unknown";

and since this should ideally never happen, I'd also add a

	xe_assert(xe, sev < XE_RAS_SEV_MAX);
> +}
> +
> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> +{
> +	if (comp >= XE_RAS_COMPONENT_MAX)
> +		return "Unknown Component";
> +
> +	return xe_ras_components[comp];

Ditto.

Raag

> +}
