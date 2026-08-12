Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F64C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 10:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C4110EF4A;
	Wed, 12 Aug 2026 10:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcjDp+dv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3BF10EF3A;
 Wed, 12 Aug 2026 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786529828; x=1818065828;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=InrfhhEL7BrHbchHF1zJ0iNFY4EMBN9hYzCUFQMWSAo=;
 b=TcjDp+dvRGlNBp0vzIL+BtmVz5+vUgwvC51RbaDGkFyzJNUTvjbDdTp5
 SgE3+FdyUTZ1nv5wEv0dSQYmdXWNHOqTdEpAV4k+QQstgfA254I1qOUCS
 Iv6YJhytsNqGW40KGr53bgM95WnXC5WqeiZeZpO9FsphvgbNun0SPMe3M
 Xcv/cEsdBdTUwqY3B7NjderNs+f8meojQmFhZl0H6s8kWciNGd1fImey4
 EtrrDutMm0H9TIYlr3eEcjZ3pJIwsCCFEEDjKjaxxArCJS9+1qu3O/zPX
 ftEpPdyA20swvRCt72dh19GdwiJXCauNM1OJHAvJ+R53cMZuWF6hJiPgl A==;
X-CSE-ConnectionGUID: QD/QZ3CpRdut6kFWYwioFw==
X-CSE-MsgGUID: 26wH5UeITwO6xr0Pi2OByQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="89603586"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="89603586"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:17:07 -0700
X-CSE-ConnectionGUID: ESlw8ZmnSmGsV0oxuKdywQ==
X-CSE-MsgGUID: yvwxW0Q5TjSYqekxDOsEeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="261851542"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:17:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
 disable
In-Reply-To: <20260812094547.1808459-1-nemesa.garg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260812094547.1808459-1-nemesa.garg@intel.com>
Date: Wed, 12 Aug 2026 13:17:02 +0300
Message-ID: <0958cc7e77d3c1bc717aa88bf8d74bf04c498822@intel.com>
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

On Wed, 12 Aug 2026, Nemesa Garg <nemesa.garg@intel.com> wrote:
> icl_plane_disable_sel_fetch_arm() wrote SEL_FETCH_PLANE_CTL = 0 only when
> crtc_state->enable_psr2_sel_fetch was set.  If a plane was disabled after
> selective fetch had been turned off, the guard fired early and left the
> register's enable bit set in hardware.

Why doesn't the selective fetch disable change the bit?

> The bit is harmless until selective fetch is re-enabled.  When it is, the
> hardware resumes fetching for the now-disabled plane and keeps its old DDB
> range reserved.
>
> Fixes: b1f5279b5981 ("drm/i915/psr: Move plane sel fetch configuration into plane source files")
> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8739

Missing space after :.

> Assisted-by: GitHub-Copilot:claude-opus-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 07a683293352..afc1df1b84a4 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -885,7 +885,13 @@ static void icl_plane_disable_sel_fetch_arm(struct intel_dsb *dsb,
>  	struct intel_display *display = to_intel_display(plane);
>  	enum pipe pipe = plane->pipe;
>  
> -	if (!crtc_state->enable_psr2_sel_fetch)
> +	/*
> +	 * Clear this whenever the hardware has selective fetch, not just when
> +	 * the current state uses it. The plane may have been enabled with
> +	 * selective fetch earlier and had its enable bit orphaned when the
> +	 * feature was switched off.
> +	 */
> +	if (!HAS_PSR2_SEL_FETCH(display))
>  		return;
>  
>  	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane->id), 0);

-- 
Jani Nikula, Intel
