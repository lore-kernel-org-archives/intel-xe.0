Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92FFFD8764
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 12:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B3F10E421;
	Tue, 17 Mar 2026 12:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8TvKNIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C5F10E358;
 Tue, 17 Mar 2026 12:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773752272; x=1805288272;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uOzYqbdbAJu0tOMlDCrhxjP4AgwY5qmOzxD9Y/9WH1Q=;
 b=T8TvKNIngWAfAEN4z/lxonZleEAab5A/TiouNzW52KBrZE8GHWTXz+Eo
 nZi8yJPurrbP9xVSIaYpXWSSuaTb7tpMjT/cgyMYepQiNqoy6K2doSJ5D
 umKz48oyHrarzd47V1YllEBe8VqxIPOuj5QWGp1fN5lBNsTfHWJnUXBSN
 scq6pVp4PhbAWZaP6FErDHeCByaS2Z6tO5R16nzl5mhyRtEt4QBmhffdj
 LtqzGWbTiq3GJfZ56ksPFSFU5bERuD7oPSmiiuHmBkd9WkGeJDFgmyeuK
 djjej1/wf8PpTdzkQF/mZgRg295C4nyPSoekGiVgknd+sifVvzJflM/je A==;
X-CSE-ConnectionGUID: 1C6w5dvuSLGXbzPWkDjn/w==
X-CSE-MsgGUID: ur2rVd7ETymp3QyUCsl+ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78387705"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78387705"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 05:57:51 -0700
X-CSE-ConnectionGUID: xt8DwQ3xSPGihfYH/zqtww==
X-CSE-MsgGUID: JOTLCgL9T7aniNbty+rZrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222213083"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 05:57:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/4] drm/i915/display: don't access display PCH
 registers in non-display code
In-Reply-To: <20260317104119.1690065-1-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260317104119.1690065-1-luciano.coelho@intel.com>
Date: Tue, 17 Mar 2026 14:57:46 +0200
Message-ID: <e03a21ce5826fb71e17132ec2810bf17162d5777@intel.com>
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

On Tue, 17 Mar 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> Hi,
>
> This change moves the display PCH register accesses from the i915 code
> to the display code.  I created a small "framework" to do this, which
> relies on the PCH_TYPE to figure out which initialization needs to be
> done.
>
> The callpoints are still on very specific points in the generic
> clock-gating initialization, but there's no way around this without
> overcomplicating things.
>
> I have another, more direct and less "generic" way implemented,
> without the mini-framework, but I think the current approach is
> cleaner.

I think this is forward progress.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Please review.
>
> Cheers,
> Luca.
>
>
> Luca Coelho (4):
>   drm/i915/display: move clock-gating init for IBX to display
>   drm/i915: move CPT clock gating init into intel_pch
>   drm/i915: move LPT clock gating init into intel_pch
>   drm/i915: move CNP clock gating init into intel_pch
>
>  drivers/gpu/drm/i915/display/intel_pch.c  | 93 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_pch.h  |  1 +
>  drivers/gpu/drm/i915/intel_clock_gating.c | 86 ++-------------------
>  3 files changed, 101 insertions(+), 79 deletions(-)

-- 
Jani Nikula, Intel
