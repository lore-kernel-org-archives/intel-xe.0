Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7254FFB519A
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 05:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1216710E222;
	Tue,  7 Apr 2026 05:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERWLudMh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5159C10E222
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 05:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775541577; x=1807077577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BhykX7xbH6RfHpqqvH5+Bw2UrZ+f8IvDJdSkComYtsY=;
 b=ERWLudMhYDbc6XCDoGmAsX5anBvWGTU2pQ6kZ5BSJIEij3/xPxtkfVBw
 6rGSCPfVbR5NIlNZZUe+JMdp7KziryOL3xoKR5AaT8GJiO+yI7NS7ljrR
 6M3+ftKDN3mvVUMNG3VJJCgF5QNhZihIaSbSeb/BFDZaxO/HPB8B1W34B
 4ONYAZ180ZyXJXuLDje1k/4iuOnh+k/Mk+oXAL6UJad6NYZnwwlfX1rET
 //n1V3deHekv8ag79o/NOlIloxIG7U4m+WofB1uQSk3Gi9KeArFuP/0i9
 DYl84PmjwAnrn3A4ZVPhh5sNOO6/8mYj4ot3hgyX+konCrha6m8r7hMaK w==;
X-CSE-ConnectionGUID: 9Hq1HhYkRHustxOv2vGunA==
X-CSE-MsgGUID: 5DkKuCTbRM2SC8WbautY5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87121225"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87121225"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:59:37 -0700
X-CSE-ConnectionGUID: VZ9h+M94SuKNF6LF7s4X+w==
X-CSE-MsgGUID: r/wKtxFhT5WuY9/niJK+LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="232951422"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:59:35 -0700
Date: Tue, 7 Apr 2026 07:59:32 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v3 06/10] drm/xe/xe_ras: Add structures and commands for
 Uncorrectable Core Compute Errors
Message-ID: <adSdRJc64v0ufcki@black.igk.intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-18-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402070131.1603828-18-riana.tauro@intel.com>
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

On Thu, Apr 02, 2026 at 12:31:37PM +0530, Riana Tauro wrote:
> Add the sysctrl commands and response structures for Uncorrectable
> Core Compute errors.

...

> +static const char * const xe_ras_severities[] = {
> +	[XE_RAS_SEVERITY_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_SEVERITY_CORRECTABLE]		= "Correctable",
> +	[XE_RAS_SEVERITY_UNCORRECTABLE]		= "Uncorrectable",
> +	[XE_RAS_SEVERITY_INFORMATIONAL]		= "Informational",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEVERITY_MAX);
> +
> +static const char * const xe_ras_components[] = {
> +	[XE_RAS_COMPONENT_NOT_SUPPORTED]	= "Not Supported",
> +	[XE_RAS_COMPONENT_DEVICE_MEMORY]	= "Device Memory",
> +	[XE_RAS_COMPONENT_CORE_COMPUTE]		= "Core Compute",
> +	[XE_RAS_COMPONENT_RESERVED]		= "Reserved",
> +	[XE_RAS_COMPONENT_PCIE]			= "PCIe",
> +	[XE_RAS_COMPONENT_FABRIC]		= "Fabric",
> +	[XE_RAS_COMPONENT_SOC_INTERNAL]		= "SoC Internal",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMPONENT_MAX);
> +
> +static inline const char *severity_to_str(struct xe_device *xe, u32 severity)
> +{
> +	xe_assert(xe, severity < XE_RAS_SEVERITY_MAX);
> +
> +	return severity < XE_RAS_SEVERITY_MAX ? xe_ras_severities[severity] : "Unknown";

Rethinking about this, since we already have NOT_SUPPORTED member, can we
reuse it for "Unknown"?

static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
{
	if (sev >= XE_RAS_SEV_MAX)
		sev = XE_RAS_SEV_NOT_SUPPORTED;

	xe_assert(xe, severity != XE_RAS_SEV_NOT_SUPPORTED);
	return xe_ras_severities[sev];
}

Or you can choose to drop xe_assert() entirely if it makes more sense.

> +}
> +
> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> +{
> +	xe_assert(xe, comp < XE_RAS_COMPONENT_MAX);
> +
> +	return comp < XE_RAS_COMPONENT_MAX ? xe_ras_components[comp] : "Unknown";

Ditto.

Raag

> +}
