Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B18CE6BF1F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 15:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBFF10E4EB;
	Fri, 30 Jan 2026 15:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epvsSdVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A5E10E02F;
 Fri, 30 Jan 2026 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769786650; x=1801322650;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GVG6h9UxiVPKBf7FR7ftcFkKeNjwmjse+rf2+9R2Trc=;
 b=epvsSdVufYwbmJN4TCJsrUROJuNf4s/mHHzN+gQLT3kLcsn+akVS4A7g
 m01AApomN675Djl8wwXAz9P+v/BAB1oR5oMqrW7yRaEYstSnr9V0fXto9
 VN5qxPmdzKGeChoWhqcakHiXQDQLlGhhWIFwWwOTS0pm8XnM+WWqA6wWT
 EFRZqWS2bpLvKcD/q6R3P5MnYnaRQm4rRoqc+mSy18RluPixz7iOvLJus
 Cxqlzu+yrVPVOiw0DR0EqhYWONgnMlg1vFWvH+7dKAUeAfbLQxqzPcMg8
 QwXg25ZHe7ZWm4mPm7MmJ/8VtAlUp72bRS84TybKFvgMvUIolWRIikQGf w==;
X-CSE-ConnectionGUID: b2GjFm5rTCW0v51xbzHrXw==
X-CSE-MsgGUID: 40FxSB9sRtCd/YcHEWW1Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="73639636"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="73639636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:24:10 -0800
X-CSE-ConnectionGUID: JaEgrHpMQ0a376xVz/g1xg==
X-CSE-MsgGUID: wJaL/d4gQkaQ6f9nQ3t9UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="207996639"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:24:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH 6/6] drm/gma500: use drm_crtc_vblank_crtc()
In-Reply-To: <5aec1964-072c-4335-8f37-35e6efb4910e@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1762513240.git.jani.nikula@intel.com>
 <27b2c6772c68120d0d5ec28477db0d993743e955.1762513240.git.jani.nikula@intel.com>
 <CAMeQTsaU7nS9K=UkQW73L6TS6PBLw26s_-jiOchEyT7dcfz-7Q@mail.gmail.com>
 <5aec1964-072c-4335-8f37-35e6efb4910e@suse.de>
Date: Fri, 30 Jan 2026 17:24:04 +0200
Message-ID: <ee3b272aeab7dd88d2285e9234c75f8c14d8ddad@intel.com>
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

On Fri, 30 Jan 2026, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> This patch breaks the driver with a NULL-ptr oops on startup. This is 
> because the IRQ initialization in gma_irq_install() now uses CRTCs that 
> are only allocated later in psb_modeset_init(). Stack trace is below.
>
> There's a nearby comment about preserving the order of the operations, 
> so I don't dare touching it. But reverting commit d930ffa5d6e8 
> ("drm/gma500: use drm_crtc_vblank_crtc()") resolves the issue.

Thanks for the report. Since we're at -rc7 and there's going to be -rc8,
I think the only reasonable approach at this time is to revert [1].

BR,
Jani.


[1] https://lore.kernel.org/r/20260130151319.31264-1-jani.nikula@intel.com



-- 
Jani Nikula, Intel
