Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E10FF513B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 20:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9073610E4C5;
	Tue,  7 Apr 2026 20:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSK25y5Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A9F10E4C5;
 Tue,  7 Apr 2026 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775594367; x=1807130367;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LMEnFMSnRjxOctB7FGv9dA8LUER8RnUXwMnTcWrBbo0=;
 b=DSK25y5Q84RV6ymhs+R5J/o8kDo5t2Nbq+KTnGScYb8t67P3jkdy0OS6
 N5ZcRcSELZVGQJZ8xCKI6t8jPlLJwom2xvvA9x0qwk84ctA1un0JF9Q48
 WioGwoWQRyiCOlXAqZiZ8vjodkWmeDYJA9bEmvYiXFeJivOXnzfpFNwX5
 POfdmGGV0YdxQdu99EDuMYEb+1ngfs8y1bYZZoL7OFFpLbfNEgN/O/XUc
 5oHQCLhNp64thuAFLPpEQFgqexx7lr8XEHAZPyEowC1JSdBW4Jllrb28c
 XPoq9WcNWQ0y3eHC3cfkLDrkQXrFQD1pgHiqpTGoTN/D/0AyOycneuAIO w==;
X-CSE-ConnectionGUID: W8m7Tn17QwO4FSCbZD1cqQ==
X-CSE-MsgGUID: XEG7xQDrSWiKQ0HXmDCIEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87642236"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="87642236"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 13:39:27 -0700
X-CSE-ConnectionGUID: +3VMZh2lRdSKhVnPGoXEMg==
X-CSE-MsgGUID: 4Pa264oHR7SigCDPUAKdtg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 13:39:25 -0700
Date: Tue, 7 Apr 2026 23:39:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/i915/mchbar: move intel_mchbar_regs.h under
 include/drm/intel
Message-ID: <adVrejqcKCvIZSnj@intel.com>
References: <cover.1775559414.git.jani.nikula@intel.com>
 <581eef80fb77b4ab78ca040e60b2a29c844a5232.1775559414.git.jani.nikula@intel.com>
 <adUsb9ODzDKO6jBA@intel.com>
 <62ecb5604db457e1023ec58c5656239c46816417@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62ecb5604db457e1023ec58c5656239c46816417@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Apr 07, 2026 at 10:39:05PM +0300, Jani Nikula wrote:
> On Tue, 07 Apr 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Tue, Apr 07, 2026 at 01:57:41PM +0300, Jani Nikula wrote:
> >>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c               | 2 +-
> >>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c                 | 2 +-
> >>  drivers/gpu/drm/i915/gvt/handlers.c                         | 4 ++--
> >>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c                 | 2 +-
> >
> > Those four don't seem to need the header anymore.
> 
> The last one does need it after all. Sent v2 with the cleanup patches.

Ah, gvt. I probably wasn't even building that when I checked this :P

-- 
Ville Syrjälä
Intel
