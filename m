Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4733C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1F810E7D2;
	Thu, 24 Sep 2026 11:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Thyn+NCn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7977C10E6E1;
 Thu, 24 Sep 2026 11:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790249137; x=1821785137;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=O6HZdosrQTOF5lqcMLrwQDRupfKSEH8wI+trQTPPV1E=;
 b=Thyn+NCnegeQqMj46iK+kVZN3u8UGF/EWC+qlSYRXpHKg1rZe8ihcVwf
 6ffn+PseWWIFaj4+Fot+yXSpLXceOUTapk/CTikSNXckC5UtqK0ikrECJ
 QzFB6ZTE3nLVcSaJ4f9ZsFzZFbMkmQ0+fIktWq6xlQP1m/jewaFScAbFD
 1+Ng/ieN6tu/bIH43MuwSCpjjfykuQM41SKJp8HHA47fxCm493o40D+fI
 DH6SbyPXmvP4BBdMNy0UZwsO43/TONSttNnTmsquXsGgwrBWGoRInWhVu
 b2XP7/Ziu2ycgReFrpez+udvqSOme7ug1U8sxQOQBYGeVBsiHIYeB1fyF g==;
X-CSE-ConnectionGUID: owSaiOLCQ5+Tf1nap+vyHw==
X-CSE-MsgGUID: cKaswu3FSuaaCtPA1tnWSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90057149"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90057149"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:25:37 -0700
X-CSE-ConnectionGUID: W3Jna5a4S+qX7/0+kb1R+A==
X-CSE-MsgGUID: 3+qoV1nTSdG+x7cz84ExNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="273204164"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.192])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 04:25:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Austin Hu <austin.hu@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 vinod.govindapillai@intel.com, huchao426@gmail.com
Subject: Re: [PATCH v3 0/3] drm/i915/fbc: Dirty rectangle bounding and CFB
In-Reply-To: <20260923172803.1011636-1-austin.hu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260812215350.3753102-1-austin.hu@intel.com>
 <20260923172803.1011636-1-austin.hu@intel.com>
Date: Thu, 24 Sep 2026 14:25:30 +0300
Message-ID: <4c41153d0be6d50515eceaf25618ec82643c65c2@intel.com>
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

On Wed, 23 Sep 2026, Austin Hu <austin.hu@intel.com> wrote:
> This series updates Intel FBC dirty rectangle handling and refactors plane
> update checks:

Please base your work on drm-tip and send new versions of the series as
standalone threads instead of in-reply-to previous versions.

BR,
Jani.


>
> 1. Moves intel_fbc_can_flip_nuke() higher up in intel_fbc.c to avoid a
>    forward declaration in subsequent FBC checks. (No functional change)
> 2. Clamps FBC dirty rectangle bounds to valid surface limits [y_offset,
>    y_end] and adds logging for out-of-bounds coordinates, including
>    handling for 180-degree plane rotation.
> 3. Tracks plane state attribute changes during atomic commits. When FBC
>    Dirty Rectangle mode is active, partial updates only apply to surface
>    address changes (PLANE_SURF). Modifications to any other plane state
>    parameters require fetching full-plane pixel data from memory to
>    re-compress and update the entire CFB in stolen memory. Once fully
>    re-compressed, subsequent atomic commits can resume selective dirty
>    rectangle updates.
>
> v2 -> v3 changes:
>   - Split function reordering into a separate standalone commit (v3 1/3) to
>     avoid mixing movement and functional changes, per maintainer feedback.
>   - Rebased onto latest drm-tip.
>
> v1 -> v2 changes:
>   - Reused intel_fbc_can_flip_nuke() for plane update state checks as
>     suggested.
>   - Added plane Y-coordinate plane view checking (color_plane[0].y)
>     alongside X.
>
> Austin Hu (2):
>   drm/i915/display/fbc: Move intel_fbc_can_flip_nuke() higher up
>   drm/i915/fbc: nuke CFB if Plane setting (except for surf addr) changes
>
> Charlton Lin (1):
>   drm/i915/fbc: fbc_dirty_rect restrictions and logging
>
>  drivers/gpu/drm/i915/display/intel_fbc.c | 192 +++++++++++++++++------
>  1 file changed, 141 insertions(+), 51 deletions(-)

-- 
Jani Nikula, Intel
