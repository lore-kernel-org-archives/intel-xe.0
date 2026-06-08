Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBE2CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 13:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBDA10E60C;
	Mon,  8 Jun 2026 13:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqN0Y0yM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A2210F39D;
 Mon,  8 Jun 2026 13:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780924475; x=1812460475;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9sF+4v8YI2ZxezWNWd3vYVsqPYHQjJ0RAbV6Z99ENAA=;
 b=fqN0Y0yMWedEhsocUL3naRUSGMf8Q9mbzeQRQ/ZdwyekpJMTvEX7/8KE
 U7JIVbZTzAgENXI+QO47vGME7VW7nHF3Ho1VlfqVjozSNE0A2yns/3m0y
 PcLO8pkcEZsbJz1NeqAuDa4roKVZUz1ZSZyz39VO3KR3kuphJtlHSh8LB
 4pCnzm3ftg24DfYI8NcvGskQPu2chLY0NZAAQn3GRu1G1OXiBRPzL8eTF
 xDKvzDc3/AULkfrAuN+Rqeby8kZ5iXPvIs4UUT9rF1OmFpxNFTFT4tN7e
 bg+mHeC+bD1SHfWe6qyJE3dbZkVabza+/tFZAk2aNsYPsseGc5f+1CtGi w==;
X-CSE-ConnectionGUID: vs9/nhjbRd+85WL9lWHVjw==
X-CSE-MsgGUID: UJeOWYfXRraoKn1EzPu1yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80685744"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80685744"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 06:14:34 -0700
X-CSE-ConnectionGUID: JSR4p8OHQzi0G+g0qWlGxg==
X-CSE-MsgGUID: boYrYMR/Q5y/Okv5ZIqklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="243104293"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.230])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 06:14:33 -0700
Date: Mon, 8 Jun 2026 16:14:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [RFC PATCH 2/2] drm/i915/wm: Wait a vblank before shrinking
 plane DDB
Message-ID: <aibANUfuILwpHQA8@intel.com>
References: <20260608125009.979672-1-nemesa.garg@intel.com>
 <20260608125009.979672-3-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608125009.979672-3-nemesa.garg@intel.com>
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

On Mon, Jun 08, 2026 at 06:20:09PM +0530, Nemesa Garg wrote:
> Back-to-back atomic commits that keep the per-pipe DBUF
> allocation, MBUS join state and slice mask unchanged but
> reshuffle per-plane PLANE_BUF_CFG sub-ranges can cause
> pipe FIFO underruns. Wait a vblank on the CRTC if any plane
> is shrink (stays allocated, range got smaller) or swap (new
> range overlaps another plane's old range on the same pipe).

skl_crtc_planes_update_arm() doesn't allow DBUF overlaps to
occur.

> 
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_watermark.c | 49 ++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
> index 5a3677ea25b0..fdd09700e808 100644
> --- a/drivers/gpu/drm/i915/display/skl_watermark.c
> +++ b/drivers/gpu/drm/i915/display/skl_watermark.c
> @@ -3648,6 +3648,53 @@ void intel_dbuf_mbus_post_ddb_update(struct intel_atomic_state *state)
>  
>  }
>  
> +/*
> + * Pre-program shrinking plane DDBs and wait a vblank so HW retires
> + * the old (larger) ranges before the main commit places new/grown planes
> + * into the freed space. Avoids the brief DDB overlap that causes pipe
> + * FIFO underruns. Only handles pure shrinks (new range contained in old);
> + * swaps are not handled here.
> + */
> +static void skl_dbuf_pre_shrink(struct intel_atomic_state *state)
> +{
> +	struct intel_display *display = to_intel_display(state);
> +	const struct intel_crtc_state *old_cs, *new_cs;
> +	struct intel_crtc *crtc;
> +
> +	if (DISPLAY_VER(display) != 30)
> +		return;
> +
> +	for_each_oldnew_intel_crtc_in_state(state, crtc, old_cs, new_cs) {
> +		struct intel_plane *plane;
> +		bool need_wait = false;
> +
> +		if (!old_cs->hw.active || !new_cs->hw.active)
> +			continue;
> +
> +		for_each_intel_plane_on_crtc(display->drm, crtc, plane) {
> +			enum plane_id pid = plane->id;
> +			enum pipe pipe = crtc->pipe;
> +			const struct skl_ddb_entry *o = &old_cs->wm.skl.plane_ddb[pid];
> +			const struct skl_ddb_entry *n = &new_cs->wm.skl.plane_ddb[pid];
> +			u16 osz = skl_ddb_entry_size(o), nsz = skl_ddb_entry_size(n);
> +
> +			if (pid == PLANE_CURSOR || !osz || !nsz || nsz >= osz ||
> +			    n->start < o->start || n->end > o->end)
> +				continue;
> +
> +			intel_de_write(display, PLANE_BUF_CFG(pipe, pid),
> +				       PLANE_BUF_END(n->end - 1) | PLANE_BUF_START(n->start));
> +			/* Arm by re-writing PLANE_SURF (same value -> no visible flip). */
> +			intel_de_write(display, PLANE_SURF(pipe, pid),
> +				       intel_de_read(display, PLANE_SURF(pipe, pid)));
> +			need_wait = true;
> +		}
> +
> +		if (need_wait)
> +			intel_crtc_wait_for_next_vblank(crtc);
> +	}
> +}
> +
>  void intel_dbuf_pre_plane_update(struct intel_atomic_state *state)
>  {
>  	struct intel_display *display = to_intel_display(state);
> @@ -3660,6 +3707,8 @@ void intel_dbuf_pre_plane_update(struct intel_atomic_state *state)
>  	if (!new_dbuf_state)
>  		return;
>  
> +	skl_dbuf_pre_shrink(state);
> +
>  	old_slices = old_dbuf_state->enabled_slices;
>  	new_slices = old_dbuf_state->enabled_slices | new_dbuf_state->enabled_slices;
>  
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
