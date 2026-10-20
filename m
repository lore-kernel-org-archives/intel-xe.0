Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB40606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LNc44Uvp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4406610F398;
	Tue, 20 Oct 2026 08:11:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9290010EB9A;
 Tue, 20 Oct 2026 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792483902; x=1824019902;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WVg6MX4ItiNYukq3VByjdo+IBsc1121UzFPHr5SerLQ=;
 b=LNc44Uvp2BxFFXLX0e09qFmoyGn48pfMdEH/ndQnPPYEzJ0iZ8xqBvoO
 QdXMaFwfWbyXW33Wt3Ec3N5gTGw04cDg0/Zu2+6DGlVDks5Aapr6WrhtT
 XfkCv6QHQbGBCH14H0tmFDiOWG905r3LAWLHbg+cUOrVqqjeeLc2VnHAJ
 PAuWi2w8RF2k3Shd79bHdWF2ZaRtt4VbRBjJOBn5N2fE1WH+hEQpkUHQH
 Y9MK5OydM0NrwzPxX/zyooWh7+Xx9N4Giadvrc7VqHYbyEbACcXTet032
 2kf1DAGGYMxLzTb8I3PVT3YkNdIZK3vux8siteuvw04JM31cDT8hUWRWl Q==;
X-CSE-ConnectionGUID: 9oBN9gyMRe+ZPOjpkvZOYA==
X-CSE-MsgGUID: Rg5ZOak8TxGKHJTVKdTk3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1082793"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1082793"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:11:42 -0700
X-CSE-ConnectionGUID: Tn4KHZH5TPi4Ol+/OMMACQ==
X-CSE-MsgGUID: neLi0x68S86dNjQmOCuSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2741431"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:11:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xiao Lu <xiaolu.xie@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, imre.deak@intel.com, Xiao Lu
 <xiaolu.xie@intel.com>, Marco Nenciarini <mnencia@kcore.it>
Subject: Re: [PATCH v2] drm/i915/dp: clear and restore MSTM_CTRL around MST
 DPMS off/on
In-Reply-To: <20261020021714.62573-1-xiaolu.xie@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261014081448.2320363-1-xiaolu.xie@intel.com>
 <20261020021714.62573-1-xiaolu.xie@intel.com>
Date: Tue, 20 Oct 2026 11:11:35 +0300
Message-ID: <577881d2754fc164f544e7148241ad7a5b80760c@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026, Xiao Lu <xiaolu.xie@intel.com> wrote:
> When the last MST stream is disabled, i915 sends SET_POWER D3 to the
> MST trunk while MSTM_CTRL (DPCD 0x111) still has MST mode enabled.
> On re-enable, POWER_UP_PHY is sent before MSTM_CTRL is restored, so
> the hub may process the PHY power-up in an inconsistent state and
> fail to retrain its downstream links.
>
> Fix this by clearing MST_EN and UP_REQ_EN in MSTM_CTRL before sending
> D3 on the last stream disable. On re-enable, restore MSTM_CTRL after
> writing D0 and before sending POWER_UP_PHY, so the hub is back in MST
> mode when it processes the PHY power-up and retrains its downstream
> links.
>
> Keep UPSTREAM_IS_SRC set while MST mode is disabled this way, and
> accept this value in intel_dp_mst_verify_dpcd_state() while no MST
> stream is active. Otherwise a connector detection during DPMS off,
> for instance after a runtime resume, would see MSTM_CTRL as reset and
> tear down the MST topology. A real DPCD reset still clears
> UPSTREAM_IS_SRC and so it's still detected.

I did not dig deep into this, but my overall comment is that I think
accessing DP_MSTM_CTRL should be done in the topology manager alone, not
split between the topology manager and the drivers.


BR,
Jani.


>
> v2: Write UPSTREAM_IS_SRC instead of 0 and accept it in
>     intel_dp_mst_verify_dpcd_state(), to avoid removing the topology
>     on a connector detection during DPMS off. (Marco)
>
> Cc: Marco Nenciarini <mnencia@kcore.it>
> Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c    |  3 +++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 14 +++++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index a46ab5d3d..6b7665206 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3163,6 +3163,9 @@ static void intel_ddi_post_disable_dp(struct intel_atomic_state *state,
>  	 * Power down sink before disabling the port, otherwise we end
>  	 * up getting interrupts from the sink on detecting link loss.
>  	 */
> +	if (is_mst)
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_MSTM_CTRL,
> +				       DP_UPSTREAM_IS_SRC);
>  	intel_dp_set_power(intel_dp, DP_SET_POWER_D3);
>  
>  	if (DISPLAY_VER(display) >= 12) {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 7023619aa..da3cf7493 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1270,8 +1270,12 @@ static void mst_stream_pre_enable(struct intel_atomic_state *state,
>  	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 12 && first_mst_stream &&
>  		    !intel_dp_mst_is_master_trans(pipe_config));
>  
> -	if (first_mst_stream)
> +	if (first_mst_stream) {
>  		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_MSTM_CTRL,
> +				       DP_MST_EN | DP_UP_REQ_EN |
> +				       DP_UPSTREAM_IS_SRC);
> +	}
>  
>  	drm_dp_send_power_updown_phy(&intel_dp->mst.mgr, connector->mst.port, true);
>  
> @@ -2254,6 +2258,14 @@ bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp)
>  
>  	ret = drm_dp_dpcd_read_byte(intel_dp->mst.mgr.aux, DP_MSTM_CTRL, &val);
>  
> +	/*
> +	 * MST mode is disabled while all MST streams are disabled, keeping
> +	 * UPSTREAM_IS_SRC set to tell this apart from a DPCD reset.
> +	 */
> +	if (ret == 0 && val == DP_UPSTREAM_IS_SRC &&
> +	    intel_dp_mst_active_streams(intel_dp) == 0)
> +		return true;
> +
>  	/* Adjust the expected register value for SST + SideBand. */
>  	if (ret < 0 || val != (DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC)) {
>  		drm_dbg_kms(display->drm,

-- 
Jani Nikula, Intel
