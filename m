Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C1AD41C31
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 10:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A6110E6C7;
	Wed, 13 Nov 2024 10:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejN3vrnI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB3810E6C7
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 10:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731494315; x=1763030315;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9InPAZ7ZEE5QzclMGXadVr602DxqKAFdX3igDXMCGT4=;
 b=ejN3vrnIT8SwqIx5rXaQ9HKl2TBAhSJNpI/koVAuNLQ1ElmZEGIoaYot
 2Xmu+wloSxSdumBJz+zNWw9Au8QPET+vH3d2vKJP3rQDFvGPUmK4J+WsZ
 yqVY4q+cWIj9rb7w0UhF/wGaGh1jJKpwQ5avqnMgXUNyNgvhtL7wR7OvQ
 o/tZH8NBEfB+P6Vz97OEQ9IbYlYdQGfh35VmBUWruKFbpy7JjDbK11hiD
 uqxDp0zDU7T0QaVo297Fvv1D4vSrSeXItLGlDs2t0/q8u8MRhW+rWlhaR
 QghoabxB6IwpG8429AQ7n5EHbY0VTVZndTnoUB3/R/qF64EtctfxNjOmW Q==;
X-CSE-ConnectionGUID: eKnYzruyRseTDrMDPbpbkA==
X-CSE-MsgGUID: Vlhj1XQ8RomN+5IgTElsmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30773937"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="30773937"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 02:38:35 -0800
X-CSE-ConnectionGUID: 1L/hGWH/Q8iJ6d9UmTPmFg==
X-CSE-MsgGUID: nQFtzCJFSwGSyC0lqQgu5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="88252228"
Received: from smile.fi.intel.com ([10.237.72.154])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 02:38:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tBAla-0000000EJ6l-2R5u; Wed, 13 Nov 2024 12:38:30 +0200
Date: Wed, 13 Nov 2024 12:38:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
Message-ID: <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> Updates for PMT to support user offsets from the sysfs API.
> 
> Addressed review comments for the Xe driver udpates.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

If you have wish and time, there are problems with the drivers of different
severities (from "fine as is" to "good to be fixed, but okay as is") I have
noticed so far:
- it uses s*printf() instead of sysfs_emit*()
- it most likely never tested the corner cases. e.g.,

	if (disc_res->start >= pci_resource_start(pci_dev, i) &&
	    (disc_res->start <= pci_resource_end(pci_dev, i))) {

  what is this supposed to mean? Probably someone wanted resource_contains() or
  alike to be called here.
- slightly above the above piece the for-loop

	for (i = 0; i < 6; i++)

  which probably want to use PCI_STD_RESOURCE_END)

-- 
With Best Regards,
Andy Shevchenko


