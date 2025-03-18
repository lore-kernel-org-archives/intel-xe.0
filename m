Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A3AC282EC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 15:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3598210E14C;
	Tue, 18 Mar 2025 15:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdCCsXcm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624A510E14C
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Mar 2025 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742313063; x=1773849063;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XCFnh+V3bkdIhl2kwu6KpDiYNox75e6YEXv//QPSYfQ=;
 b=QdCCsXcmWZeSsL2fgoDBSd5G5MTUoEGk9ML6dgM+59PVeIFUGhtttDvc
 zaGqcJbQMrgaAZO4ceLngp6A7WzZvOI6FdtlablRTKw25v/X2KaV5N6n4
 HV5lEQ5oulhZ3FxzHlJVGM+QfEUy4erLZMW5jET5M6/CQh+3kZ1agFCRn
 SG4vqKs0J2kQ3Xqeea4gd+XL4Uj19HpajhmVL2S5O/oFbmxgxDFbhfU7Q
 XFGTvkxebaWefeL8jleS/qmmHfhfIxBzIF5Nbf+Lb6N8X6eMalCghH77z
 wFDi/AF+w48ZNcM19mvqis6UGJOMmgt5k4tHkx8LXhT6+NaHRzXlT0Pay Q==;
X-CSE-ConnectionGUID: s1Z8R86nQgSOdPj/eMBNFg==
X-CSE-MsgGUID: TUjXsbaGTJ6tzyMmMg7qjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="47110905"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="47110905"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 08:51:02 -0700
X-CSE-ConnectionGUID: 8YukOn2GQuaS2SCj/eHGIg==
X-CSE-MsgGUID: X58VyMjSSLW5qWEUHo95OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="122789025"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 08:51:01 -0700
Date: Tue, 18 Mar 2025 17:50:57 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe <intel-xe@lists.freedesktop.org>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 0/3] drm/xe: Fix survivability
Message-ID: <Z9mWYboCcw2jgWq8@black.fi.intel.com>
References: <20250313-fix-survivability-v4-0-5e90efdede99@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-fix-survivability-v4-0-5e90efdede99@intel.com>
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

On Thu, Mar 13, 2025 at 01:40:58PM -0700, Lucas De Marchi wrote:
> It turns out commit d40f275d96e8 ("drm/xe: Move survivability entirely
> to xe_pci") did a bad job moving things to xe_pci. The fix provided by
> Riana in 20250306055407.511405-1-riana.tauro@intel.com fixes it
> partially, but injecting a failure in xe_pcode_probe_early still causes
> the kernel to give warnings/errors.
> 
> Correct the course and better split what is done in xe_pci vs xe_device.
> This time, also add a patch to test we can handle errors in
> xe_pcode_probe_early() and other early probe functions.
> 
> Entering survivability mode was tested with an additional one line to
> change the return of xe_survivability_mode_requested(). If we want to
> inject error, we'd need to change it's return type, but there's also
> another patch series to force it via configs, so this doesn't seem very
> important right now.

Not sure how much it helps our case, but still leaving it here in case
it turns out to be useful.

https://lore.kernel.org/r/0-v5-642aa0c94070+4447f-fwctl_jgg@nvidia.com

Raag
