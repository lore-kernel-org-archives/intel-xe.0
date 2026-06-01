Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D097CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 21:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A231510E9A2;
	Mon,  1 Jun 2026 21:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnKUxs7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3469C10E99F;
 Mon,  1 Jun 2026 21:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780347606; x=1811883606;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=j9Q2O+ZS0Ov95S/7T9xkmrO6RqCI6hWURl3h7w4Z1wE=;
 b=jnKUxs7ixCxlIPyy7jn8PLXJJay9fNfRFHrdgP45GshHFKnI4gUii0Ot
 2ILva6EOkjUsgSaNUdsyIcwBvSbiodh2a1/V9w0mRf7gw8IVWgIOkoj9H
 tzu8rNW+r2bgow1NAIlmrnxVyPBPjJPk0e8v8Q9BehgLbZFrQJWIrThPT
 yAu6Y8N1nms6xwXE2vAsZcKwKoYacr2yG2ZI5+kRWJmpyeolUyKbSWfQ3
 RvCwH32rLU+OBIj7VnQv4IExC0HE3HWZX7Z8VB/7WqwuSZnWVSf2ct4KA
 42at1TSN5VQj3DVaaG+/RmMFNMu3kAx+lkwCl/iYHpfMw94CixlFQYxy8 Q==;
X-CSE-ConnectionGUID: evH5CSjAR0GdUAeA5DO9XQ==
X-CSE-MsgGUID: 9oWmm6NpT4Os2E3nDC8TMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68654062"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="68654062"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 14:00:06 -0700
X-CSE-ConnectionGUID: x+mhUtfTRFmUVGu+wU4ZGg==
X-CSE-MsgGUID: tbTCZE9pRga/rmmy4qPukQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267335693"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.121])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 14:00:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, ville.syrjala@linux.intel.com
Subject: Re: [CI 0/5] drm/{i915,xe}: display (runtime)
 suspend/resume/shutdown unification, part 1
In-Reply-To: <cover.1780310011.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1780310011.git.jani.nikula@intel.com>
Date: Tue, 02 Jun 2026 00:00:01 +0300
Message-ID: <314af3a17ba49bbdeebdb254e163d6288186d3ff@intel.com>
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

On Mon, 01 Jun 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> This is the first part of [1] for CI and merging.

Pushed, thanks for the patches and review.

> BR,
> Jani.
>
> [1] https://lore.kernel.org/r/cover.1780051905.git.jani.nikula@intel.com
>
> Imre Deak (2):
>   drm/i915: Keep display IRQs enabled for encoder suspend/shutdown
>   drm/i915/xe: Enable HPD polling later during system resume
>
> Jani Nikula (3):
>   drm/i915: add flush_workqueue(display->wq.cleanup) on shutdown
>   drm/xe/display: remove intel_display_flush_cleanup_work() calls on
>     suspend/shutdown
>   drm/xe/display: drop duplicate intel_dp_mst_suspend() call
>
>  drivers/gpu/drm/i915/i915_driver.c      | 15 +++++++++++++--
>  drivers/gpu/drm/xe/display/xe_display.c |  6 +-----
>  2 files changed, 14 insertions(+), 7 deletions(-)

-- 
Jani Nikula, Intel
