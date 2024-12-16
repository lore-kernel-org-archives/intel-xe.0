Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11762E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 15:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92E710E023;
	Mon, 16 Dec 2024 15:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfvBkrdE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957B610E023;
 Mon, 16 Dec 2024 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734362624; x=1765898624;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OfsZ07IeiUimle05JaQIseIxGjbRthkIQKTaP1d7/gU=;
 b=gfvBkrdEoK6i6CAPPwQLLBf0REWRZrqZfwTdM23bc69ZsiPqB3DMQCCy
 1KIDEpcVAmWglTGx8+cNDn/ai1Pwb1gFRnbGK9WSwT40SGlTW2ec+tf/j
 RAuO5sBlcOr7l3nmL84t8fz397580JebiG1eDSz8x9QoG01SzeVgiD/yn
 4w1/Qu9Yd+o04W6GKtMe/K8jZRzVccmVwFZV3IRcQm47M6eID583hg7XH
 4lPXxZ0tC1H+e/58cZeoRSgVU5AEg5HZOMuf2Lv/pK97ttT1sFb6PW62k
 U550k71KKPuSmmaic7EoNJw0t1Xf+TVxx1mX312xxg/2L7LGGL++CS6dy Q==;
X-CSE-ConnectionGUID: zF05aYieT4iXwv87JYi+FA==
X-CSE-MsgGUID: BkJQYK6fRXykDtiocii/aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34662359"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34662359"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 07:23:43 -0800
X-CSE-ConnectionGUID: GFLNi2AwTlaaDl3BhQJBKg==
X-CSE-MsgGUID: FXrMTm48TtKyzSIVPG6o+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="97460615"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.245])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 07:23:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>
Subject: Re: [PATCH v3 0/5] drm/i915/dp: convert to struct intel_display
In-Reply-To: <cover.1734083244.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1734083244.git.jani.nikula@intel.com>
Date: Mon, 16 Dec 2024 17:23:36 +0200
Message-ID: <87a5cvslc7.fsf@intel.com>
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

On Fri, 13 Dec 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Rebase of [1].

Thanks for the review, pushed to din.

BR,
Jani.



>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/r/cover.1733827537.git.jani.nikula@intel.com
>
>
> Jani Nikula (5):
>   drm/i915/dp: s/intel_encoder/encoder/
>   drm/i915/dp: s/intel_connector/connector/
>   drm/i915/dp: convert to struct intel_display
>   drm/i915/dp: convert interfaces to struct intel_display
>   drm/i915/dp: finish link training conversion to struct intel_display
>
>  drivers/gpu/drm/i915/display/intel_display.c  |   6 +-
>  .../drm/i915/display/intel_display_driver.c   |   9 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       | 922 +++++++++---------
>  drivers/gpu/drm/i915/display/intel_dp.h       |  20 +-
>  .../drm/i915/display/intel_dp_link_training.c |  14 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  12 +-
>  drivers/gpu/drm/i915/display/intel_psr.c      |   2 +-
>  drivers/gpu/drm/i915/i915_driver.c            |   2 +-
>  drivers/gpu/drm/xe/display/xe_display.c       |   2 +-
>  9 files changed, 499 insertions(+), 490 deletions(-)

-- 
Jani Nikula, Intel
