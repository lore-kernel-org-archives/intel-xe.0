Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346EFC88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 12:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D688410EEB0;
	Thu, 17 Sep 2026 12:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ch/sueME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E12E10EEB0;
 Thu, 17 Sep 2026 12:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789649192; x=1821185192;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qOOhgVVoPkRxMPW8XJPQBswAwBSN0D789OQcJOTa+Y4=;
 b=ch/sueMEoU8e7Lde5yLUE9Wsj++ClWCJLknsgATLz5ebbooHAJo3mBf6
 3nywm7eOrpbvzQK+/qVd+qzjwdJzDOiirUj/wtC4ukx3rzUOwRfy2eL33
 SeLc2bJR6ZE3WDceQ8kX9lfFEQvaj7iLaj/LmhbTkNlJEzU+ftR9duWxV
 W7aiW52c2Ka6ZnR8KF6aIagqwW0IFBIiRKx0cPc8Scb2ADSSmzIFKCZxI
 lVind/gCYHQAA/qq7twalWqMvHD7GEaQFm9MGvXLtoE0WK+WJM/N+yVgG
 PMl9eKamdC1x3g+wm+0i2uHfz429kEFC74gwLSNHaotYppM7TYkcZXfLN A==;
X-CSE-ConnectionGUID: +/Lp9h7yRlu0MgWLfSPXjA==
X-CSE-MsgGUID: ly6EsdWdQZeitvPxBZPEPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90198648"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90198648"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 05:46:32 -0700
X-CSE-ConnectionGUID: ejZc73hdSxWhw9uUO1IKVg==
X-CSE-MsgGUID: JR/6Qbe+TSGShUuQJC0InA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269492794"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 05:46:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com, Suraj
 Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 0/4] drm/i915/display: stop using the configurable fence
 timeout, cleanups
In-Reply-To: <cover.1789069102.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1789069102.git.jani.nikula@intel.com>
Date: Thu, 17 Sep 2026 15:46:27 +0300
Message-ID: <2a6bcbed728a686b31da650614e395144901b630@intel.com>
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

On Thu, 10 Sep 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> This is a combination and rebase and rehash of a number of patches from
> before, and I've lost count. So no series version number...
>
> Patch 1 is the same as [1], but it should work now that we do full wedge
> on display reset.
>
> Patches 2-4 are from [2] and [3].
>
> Fingers crossed.

Thanks for the reviews, pushed to din.

BR,
Jani.

>
>
> [1] https://lore.kernel.org/r/20251113155332.789554-1-jani.nikula@intel.com
> [2] https://lore.kernel.org/r/cover.1787148235.git.jani.nikula@intel.com
> [3] https://lore.kernel.org/r/cover.1787833879.git.jani.nikula@intel.com
>
> Jani Nikula (4):
>   drm/i915/display: stop using the configurable fence timeout
>   drm/i915/display: use struct intel_atomic_state *state variable naming
>   drm/i915/display: reduce indent in intel_atomic_commit_fence_wait()
>   drm/i915/display: debug log about fence wait errors
>
>  drivers/gpu/drm/i915/display/intel_display.c  | 23 +++++++++++--------
>  .../drm/xe/compat-i915-headers/i915_config.h  | 16 -------------
>  2 files changed, 13 insertions(+), 26 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h

-- 
Jani Nikula, Intel
