Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97628C9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 08:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A49010E8E9;
	Mon, 28 Sep 2026 08:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJH693Fj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ED010E8E9;
 Mon, 28 Sep 2026 08:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790585196; x=1822121196;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vaJ/i3noAlCKxsAhv0ROhiWbqVXkZjMHCvpyUMaAAUc=;
 b=MJH693FjU2zKLEXY22C4AlpuFZ5nGv6cznR+rulkR7gTCr/ICEFlNoqg
 MPWREpInfhaL9V1bwKl0E9hlcaYyMSuxWZiILHYIJj0zHhaF8I5M0ML0r
 Tyk/sPpkyF9XA8C9f9OmaEyJ6FTVNMwgvMlDYEY2wsZ9mu0hCiWWOwRiu
 Ol3gAfB8yLPB41RoCIsLxa80Z+MSdPTFkOPiFqkEGJhEOu/bAtDzanpIY
 QpeuUQtfzj20VYD304+T4XOwZTEDVb8klgGgd6HAMiq009oxc3H/22NCu
 ykh+PhRJpi6A05pZuys6iUaGkT/nEyHRmkbHw0BmeYWxwmqRVtu+1/Wc8 w==;
X-CSE-ConnectionGUID: XaptIhuhTu+PrIdiQBu3jA==
X-CSE-MsgGUID: V41/CF+2SmSO+Qtsr1ub1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90405859"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="90405859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:46:35 -0700
X-CSE-ConnectionGUID: tW0e3K60TIqcrEX81IJGfg==
X-CSE-MsgGUID: otymZdA8RyymSQlswxmt9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="301273682"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.54])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:46:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "xizheTang2005@163.com" <xizheTang2005@163.com>,
 intel-gfx@lists.freedesktop.org, Ville Syrjala
 <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 1/3] drm/i915/vrr: Use vrr.in_range to determine if we
 need the AS SDP
In-Reply-To: <RxSA9gIRRBSaKwxlF7t96Q@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
 <RxSA9gIRRBSaKwxlF7t96Q@163.com>
Date: Mon, 28 Sep 2026 11:46:32 +0300
Message-ID: <a902dd489a317d5c0d07e0703ec905caee0ed89b@intel.com>
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

On Sat, 26 Sep 2026, "xizheTang2005@163.com" <xizheTang2005@163.com> wrote:
> I tested this series against #9252 (applied by semantics on Fedora
> 7.2.7-200.fc44 xe; the distro tree did not take a clean git-am).

The problem with that is, we don't really know what you've actually
tested. You've adapted the patches on top of a distro kernel, with a
number of stable backports, so we don't know if the result is meaningful
or not.

It would be intestesting to see drm-tip before/after this series.


BR,
Jani.



>
> Machine: Lenovo ThinkBook 14 G8+ IPH (21VG), Panther Lake
> 8086:b080, eDP.
>
> The boot / resume full modeset still shows vertical corruption.
> With Adaptive Sync = Always, a lid s2idle resume is sometimes
> clean and sometimes leaves a persistent streak (same policy,
> repeated resumes). With Never or Automatic the streak appears
> and then recovers on its own. Userspace fastsets on an
> already-lit panel do not show it.
>
> intel_dp_needs_as_sdp() now returns crtc_state->vrr.in_range.
> That flag is set from intel_vrr_is_in_range():
>
>   intel_vrr_is_capable(connector) &&
>   vrefresh >= monitor_range.min_vfreq &&
>   vrefresh <= monitor_range.max_vfreq
>
> It does not look at uapi.vrr_enabled / crtc_state->vrr.enable.
> This panel's EDID range descriptor is 30-120 Hz, so both 60 Hz
> and 120 Hz stay in_range while userspace has VRR off. The VRR
> TG is still programmed (fixed_rr, flipline set).
>
> drm.debug=0xe intel_crtc_state_dump:
>
> 1) Adaptive Sync Never, userspace modeset 3072x1920@60:
>
>    vrr: no, fixed rr: yes, vmin: 2016, vmax: 2016, flipline: 2016,
>         pipeline full: 0, guardband: 91 vsync start: 90, vsync end: 84
>    DP SDP: Adaptive-Sync, revision 2, length 9
>    operation mode: 1 (AVT_FIXED_VTOTAL)
>    requested mode: "3072x1920": 60 390950 ... 2016
>
> 2) Same, Never, 3072x1920@120: identical vrr/flipline/AS SDP lines,
>    requested mode 120 781886.
>
> 3) Never, s2idle resume (lid), 3072x1920@120: same dump, full
>    [modeset] on pipe A. Not an in_range readout mismatch on resume.
>
> 4) Always, s2idle resume (lid), 3072x1920@120, full [modeset]:
>
>    vrr: yes, fixed rr: no, vmin: 2016, vmax: 8064, flipline: 2016
>    DP SDP: Adaptive-Sync, revision 2, length 9
>    operation mode: 0 (AVT_DYNAMIC_VTOTAL)
>    this captured resume was corrupt and stayed that way;
>    later Always resumes on the same setup were sometimes clean
>
> https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9252
> https://patchwork.freedesktop.org/series/174831/
>
> Thanks,
> Xizhe Tang
>
>
>
>

-- 
Jani Nikula, Intel
