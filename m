Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41219C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 13:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CAA10F1E3;
	Wed,  2 Sep 2026 13:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNTGy5JU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE1E10E4FD;
 Wed,  2 Sep 2026 13:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788356015; x=1819892015;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=b5w0fUfxs1rBHu7dJfKQNlPcfhy0xIz52apr8xw0KCI=;
 b=JNTGy5JUE/ruGXl0tPdo4clYW7MywUo9Fuum0P0wOUhBHyRZcp/XFzWn
 x7K6uzIM7SOrOE0azuX9MVeVDuGBZge6qxVy7Iyj1aaYndtDYXBRNpc9E
 CveKVhp2gDslhZXqFBiCmf/8Me0LyvOWWnNt2vvu3Y6O2KB6q94w7slW5
 ZoHXXIn2iQvT1+QJo31l9nJviVSfsihkoDHxV0Mzs8VyNrPxFp2CCWQhV
 BVeoER2BpJ5u25ZMsTjEVWxfSpbOKyr9eax3nFR2KdwIELBZxEQnGm8nL
 NYY62Kc1Q7tyk6Zi450Eo6AFJsk/lMZT+9mGCXBPQUx/cm1ZkUMyYH/HG g==;
X-CSE-ConnectionGUID: xr+A1xCZTymwI8ELWw53vg==
X-CSE-MsgGUID: 7uP46X5aSWKu2cgml6aZ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99477732"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="99477732"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 06:33:28 -0700
X-CSE-ConnectionGUID: rjpSKsg+QGWfT8XBI6zPDA==
X-CSE-MsgGUID: Hu4KzYL1RmO1ngAfNiXrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="272916439"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.200])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 06:33:27 -0700
Date: Wed, 2 Sep 2026 16:33:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/i915/display: Reset use_flipq when
 duplicating crtc state
Message-ID: <apglo7fGdY24TjSs@intel.com>
References: <20260902105448.809455-1-mika.kahola@intel.com>
 <20260902105448.809455-3-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902105448.809455-3-mika.kahola@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Sep 02, 2026 at 10:54:47AM +0000, Mika Kahola wrote:
> intel_crtc_duplicate_state() resets use_dsb to false but not
> use_flipq, letting a stale true value survive into the new state.
> 
> Reset use_flipq alongside use_dsb.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>

I had the same patch in some series, but that might need a rebase so
let's go with yours.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_atomic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 9d0d47c79dd1..b66c2d4ba2b3 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -276,6 +276,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  	crtc_state->dsb_color = NULL;
>  	crtc_state->dsb_commit = NULL;
>  	crtc_state->use_dsb = false;
> +	crtc_state->use_flipq = false;
>  
>  	return &crtc_state->uapi;
>  }
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
