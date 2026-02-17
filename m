Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11A1E909A9
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 14:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CFF10E25E;
	Tue, 17 Feb 2026 14:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqvbCCZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46BB10E25E
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771336967; x=1802872967;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4uloPzQJ6kpfYnH2kChtxJJnK9VBr5j4Gt323roPN2U=;
 b=gqvbCCZIKOc0GNKGy9I5ZPzkCa7hIjC8VucBP/+YpATaDHCt8lv2/u6u
 DRDzGh0IOXwk4DQJ4r3lDvl9O6HFakcmiA+I1n62CbdzGTNvYT/DrDv0w
 x3E3sDxZpiAiEWhXXRZe50x5FPgnAs4F6FRKkbypJkj+EdlNiJBB1CnF0
 6n7pKilcnamIqjASP/nslvnAqo0tPXBryJfjhDyEPk5Q2ayofJmlV+PiL
 zmm5OG/kWI6SZWASXFQFEJs2q+vkb7n/U/nV/rnj5LOLu96wYS319cuCD
 O6+ZGCcg65DUD/NuSmukNwOkIkdtgjn11BaOazUJgY/sDQtQl837Ubwde Q==;
X-CSE-ConnectionGUID: QdcuENHOQ+K3wWV1Hmpdaw==
X-CSE-MsgGUID: je2OA028TBuB89L2M9RTPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83505224"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="83505224"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 06:02:47 -0800
X-CSE-ConnectionGUID: 75SyIdePRGKhaV/owTB/rg==
X-CSE-MsgGUID: mYj9KiYMSFOVK7155uMF7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="218020508"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 06:02:44 -0800
Date: Tue, 17 Feb 2026 15:02:41 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH 7/8] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
Message-ID: <aZR1ARo309W6gMxX@black.igk.intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-17-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122100613.3631582-17-riana.tauro@intel.com>
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

On Thu, Jan 22, 2026 at 03:36:19PM +0530, Riana Tauro wrote:
> Uncorrectable Core-Compute errors are classified into Global and Local
> errors.
> 
> Global error is an error that affects the entire device requiring a
> reset. This type of error is not isolated. When an AER is reported and
> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
> 
> A Local error is confined to a specific component or context like a
> engine. These errors can be contained and recovered by resetting
> only the affected part without distrupting the rest of the device.
> 
> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
> generated and GuC is notified of the error. The KMD then sets
> the context as non-runnable and initiates an engine reset.
> (TODO: GuC <->KMD communication for the error).
> Since the error is contained and recovered, PCI error handling
> callback returns PCI_ERS_RESULT_RECOVERED.

...

> +/**
> + * xe_ras_process_errors - Process and contain hardware errors
> + * @xe: xe device instance
> + *
> + * Get error details from system controller and return recovery
> + * method. Called only from PCI error handling.
> + *
> + * Returns: PCI_ERS_RESULT_RECOVERED if recovered or if no recovery needed,
> + * PCI_ERS_RESULT_NEED_RESET otherwise.

PCI error codes are unrelated to xe_ras. IMO let's use standard error
codes here and translate them to PCI ones in the callbacks.

Raag

> + */
