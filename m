Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBDBC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 16:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1656989C28;
	Mon,  5 Aug 2024 16:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nt7DvAYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3338689C28
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722877156; x=1754413156;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8QPV4dMbPm5bDkqRjGVMcjhA05L+mo6vD0TGw/HxD3w=;
 b=nt7DvAYqoatiUUi1UuxKTVDwWz0VVi5c/muIsUndKiAP+PNryrHx4ld5
 dxZtROjcwB/QM/wntCUV0P3cG7ctadDZ/7B4pUKC/lxpCLsB9GbQRoyal
 SlwIgTeoCwwKHeyWj9m3L1NcvtLnePIbJstJ/f8DiZtz352icWf+MafF4
 ccEWAztlNDbHnZSxXcd2gRC538RuKMHx5evvTG8u9WppjSJuKvgrGDGu0
 zTkZtBnym3Go0VhhFy7iM7F1dQa7BoVeX8bx5qLBFiPqLXKgljXkJVAZG
 AOyWEQB/TuV9oeT9aVWoEWUJ0g7nIW58JsOr3N9p/jANub5Trgy2DT2yH Q==;
X-CSE-ConnectionGUID: Gurf8iwtQaqBraw3MdXyiQ==
X-CSE-MsgGUID: hvaG7fEFSEGs+8GWtqyROQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="38360356"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="38360356"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 09:59:16 -0700
X-CSE-ConnectionGUID: j//eWD/yRciBCVzEYRiY3Q==
X-CSE-MsgGUID: 9ixdQsGWRpWm3oXoEgOaIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="56170722"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 09:59:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 0/2] drm/xe/display suspend/resume fixes.
In-Reply-To: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
Date: Mon, 05 Aug 2024 19:59:00 +0300
Message-ID: <87plqm6h4b.fsf@intel.com>
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

On Mon, 05 Aug 2024, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> Some bugs I found when comparing suspend/resume sequence itself,
> and fix ordering of display suspend/resume itself compared to rest of s/r.

We should really be moving all (most) of this under i915/display/ from
i915 and xe cores...


BR,
Jani.

>
> Maarten Lankhorst (2):
>   drm/xe/display: Match i915 driver suspend/resume sequences better
>   drm/xe/display: Make display suspend/resume work on discrete
>
>  drivers/gpu/drm/xe/display/xe_display.c | 35 ++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_pm.c              | 11 ++++----
>  2 files changed, 37 insertions(+), 9 deletions(-)

-- 
Jani Nikula, Intel
