Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D44C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 12:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9602310E58F;
	Tue, 21 Jan 2025 12:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VehAbT1L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8660F10E58F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 12:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737461463; x=1768997463;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wsMLTtGT70IJJ2iQsMNUHjZTgp+WB9HM/jAanqWQmy8=;
 b=VehAbT1LYdOGHXSAvL0UX/MMANycEjugCc/AiXzGBMkm9ZubT7A3oWoq
 i4laKUUlupFEj1S5FcZUZa5t1QtAnr/MY+D0n7VTj3cp+uZTaSFpg0Q50
 3oKENNVB1V300pNUNJMGafjPd2Qt+HFHpB15uaR89G1cjBSs3Zj8iffKD
 4ix98aaQdv5uFSe3gtdPot+Gb+OPuH6sMycUGNN2uKEjtSucIkcg0zS83
 JBMo2rNS6B/3cGN4LGJDLpwYlulWdHdQNPN8J5e8GUYJklKBeVOJqc149
 xv3q5Gv+2KL65KGm76t8gTQ4452SXmJj/Ki1WiNUoWRlkSqbuLasMU8GH g==;
X-CSE-ConnectionGUID: c3GH5mJxRiu5WiW/SLeUFQ==
X-CSE-MsgGUID: LaJKjaoZTO6SxB4qWxFmYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48863683"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="48863683"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 04:11:03 -0800
X-CSE-ConnectionGUID: enaza7j7TxyE1uJNE4dllQ==
X-CSE-MsgGUID: oGfI1+ajQwi2zchhJ6F3Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="137622943"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.186])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 04:11:02 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 00/11] GuC changes for flicker-free boot.
In-Reply-To: <20241210083111.230484-1-dev@lankhorst.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241210083111.230484-1-dev@lankhorst.se>
Date: Tue, 21 Jan 2025 14:10:58 +0200
Message-ID: <87ikq8pdt9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 10 Dec 2024, Maarten Lankhorst <dev@lankhorst.se> wrote:
> Ignore the first 5 patches in this series, it's sent as a separate series.
> https://patchwork.freedesktop.org/series/142241/

For them I've replied in [1] that they need more explanations in the
commit messages.

BR,
Jani.


[1] https://lore.kernel.org/r/871pyh16pa.fsf@intel.com


> I would like review on patch 6-10 instead, those are the changes related
> to the GuC init sequence.
>
> Instead of all the separate steps, the init sequence is simplified and made
> more uniform. We create a xe_guc_init_noalloc that performs all early
> initialisation required to make VF work. We also initialise the MCR instance 0
> registers for VRAM readout, later on we enable the other MCR registers.
>
> Maarten Lankhorst (11):
>   drm/xe/display: Add intel_plane_initial_vblank_wait
>   drm/xe: Remove double pageflip
>   drm/xe: Move suballocator init to after display init
>   drm/xe: Defer irq init until after xe_display_init_noaccel
>   drm/xe/display: Use a single early init call for display
>   drm/xe: Defer memirq init until needed
>   drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
>   drm/xe: Simplify GuC early initialisation
>   drm/xe: Make it possible to read instance0 MCR registers after
>     xe_gt_mcr_init_early
>   drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
>   drm/xe: Do not attempt to bootstrap VF in execlists mode
>
>  drivers/gpu/drm/i915/display/intel_display.c  |  6 +-
>  .../drm/i915/display/intel_plane_initial.c    |  7 +-
>  .../drm/i915/display/intel_plane_initial.h    |  2 +
>  drivers/gpu/drm/xe/display/xe_display.c       | 73 +++++--------------
>  drivers/gpu/drm/xe/display/xe_display.h       |  8 +-
>  drivers/gpu/drm/xe/display/xe_plane_initial.c | 29 +++++---
>  drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  |  2 +-
>  drivers/gpu/drm/xe/xe_device.c                | 50 +++----------
>  drivers/gpu/drm/xe/xe_gt.c                    | 73 ++++++++++---------
>  drivers/gpu/drm/xe/xe_gt.h                    |  1 -
>  drivers/gpu/drm/xe/xe_gt_mcr.c                | 47 +++++++-----
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  4 +-
>  drivers/gpu/drm/xe/xe_gt_types.h              |  2 +
>  drivers/gpu/drm/xe/xe_guc.c                   | 56 ++++++++------
>  drivers/gpu/drm/xe/xe_guc.h                   |  1 +
>  drivers/gpu/drm/xe/xe_guc_ct.c                | 28 ++++---
>  drivers/gpu/drm/xe/xe_guc_ct.h                |  1 +
>  drivers/gpu/drm/xe/xe_guc_relay.c             |  6 +-
>  drivers/gpu/drm/xe/xe_guc_relay.h             |  2 +-
>  drivers/gpu/drm/xe/xe_huc.h                   |  1 +
>  drivers/gpu/drm/xe/xe_tile.c                  | 19 ++++-
>  drivers/gpu/drm/xe/xe_tile.h                  |  1 +
>  drivers/gpu/drm/xe/xe_uc.c                    | 21 ++++++
>  drivers/gpu/drm/xe/xe_uc.h                    |  1 +
>  24 files changed, 231 insertions(+), 210 deletions(-)

-- 
Jani Nikula, Intel
