Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9614DCCD19A
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 11:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B03710EBAE;
	Fri, 17 Oct 2025 11:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bmcz20Ve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6935E10EBAE
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 11:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760699158; x=1792235158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kj4cCKJOIbyJFsZBm+d62NpsBT58Tbie0dhuUFLwJ5M=;
 b=Bmcz20VeG7sw9gK6DVNZrR2PvY9sajVmG/E/fOsd7iGG+qVNlToxknA0
 45dizxDzh1q4xTa+M+d9GHSK5aHy3yI8DgWaQT2nhL2RniBG4zTc3knRV
 1CXZYrgH0WrbENd3eJzIHabn7FZnltL7MSbfbV3eA40cJ+sCxbnEhcFSB
 ey1cM5VrHnrfKt6gyrbWsCgzSJ3taKl8pavTRhRzeRdDnEzPQdLOmHfYI
 ULupk6iBZ81/Ebck64jMUcpT2GntIbG3kh1m2jMoh/J6nZaIe3cOH/zhh
 08Xs9qdufK39HHZhTFRxyi2mfNNG/p555rSZrXWKZ6t6BqI9QX2JkCnJq w==;
X-CSE-ConnectionGUID: ao0/7tP5ReaAIJfiAv1pqA==
X-CSE-MsgGUID: hgV82n2nQIyewaJGFILFZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62956030"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="62956030"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 04:05:58 -0700
X-CSE-ConnectionGUID: cChJepj2QD25h1JAeDQsLA==
X-CSE-MsgGUID: sR5Rb7sfTkaHXHvh2w4GpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="186740310"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 04:05:56 -0700
Date: Fri, 17 Oct 2025 14:05:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 23/24] drm/xe/xe3p_xpc: Setup PAT table
Message-ID: <aPIjEfXpEQKjewIS@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-23-3dd173a3097a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251016-xe3p-v3-23-3dd173a3097a@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Oct 16, 2025 at 07:26:42PM -0700, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe3p_XPC IP requires a new PAT table; note that this table has one fewer
> column than the Xe2/Xe3 tables since compression is not supported.
> There's also no "WT" entry (which we wouldn't have used on a platform
> without display anyway).
> 
> Bspec: 71582
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 96 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 6e48ff84ad0a0..7649b554942aa 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -154,6 +154,41 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
>  static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
>  static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
>  
> +/*
> + * Xe3p_XPC PAT table uses the same layout as Xe2/Xe3, except that there's no
> + * option for compression.  Also note that the "L3" and "L4" register fields
> + * actually control L2 and L3 cache respectively on this platform.
> + */
> +#define XE3P_XPC_PAT(no_promote, l3clos, l3_policy, l4_policy, __coh_mode) \
> +	XE2_PAT(no_promote, 0, l3clos, l3_policy, l4_policy, __coh_mode)
> +
> +static const struct xe_pat_table_entry xe3p_xpc_pat_ats = XE3P_XPC_PAT( 0, 0, 0, 0, 3 );
> +static const struct xe_pat_table_entry xe3p_xpc_pat_pta = XE3P_XPC_PAT( 0, 0, 0, 0, 0 );
> +
> +static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
> +	[ 0] = XE3P_XPC_PAT( 0, 0, 0, 0, 0 ),
> +	[ 1] = XE3P_XPC_PAT( 0, 0, 0, 0, 2 ),
> +	[ 2] = XE3P_XPC_PAT( 0, 0, 0, 0, 3 ),
> +	[ 3] = XE3P_XPC_PAT( 0, 0, 3, 3, 0 ),
> +	[ 4] = XE3P_XPC_PAT( 0, 0, 3, 3, 2 ),
> +	[ 5] = XE3P_XPC_PAT( 0, 0, 3, 0, 0 ),
> +	[ 6] = XE3P_XPC_PAT( 0, 0, 3, 0, 2 ),
> +	[ 7] = XE3P_XPC_PAT( 0, 0, 3, 0, 3 ),
> +	[ 8] = XE3P_XPC_PAT( 0, 0, 0, 3, 0 ),
> +	[ 9] = XE3P_XPC_PAT( 0, 0, 0, 3, 2 ),
> +	[10] = XE3P_XPC_PAT( 0, 0, 0, 3, 3 ),
> +	/* 11..22 are reserved; leave set to all 0's */
> +	[23] = XE3P_XPC_PAT( 0, 1, 0, 0, 0 ),
> +	[24] = XE3P_XPC_PAT( 0, 1, 0, 0, 2 ),
> +	[25] = XE3P_XPC_PAT( 0, 1, 0, 0, 3 ),
> +	[26] = XE3P_XPC_PAT( 0, 2, 0, 0, 0 ),
> +	[27] = XE3P_XPC_PAT( 0, 2, 0, 0, 2 ),
> +	[28] = XE3P_XPC_PAT( 0, 2, 0, 0, 3 ),
> +	[29] = XE3P_XPC_PAT( 0, 3, 0, 0, 0 ),
> +	[30] = XE3P_XPC_PAT( 0, 3, 0, 0, 2 ),
> +	[31] = XE3P_XPC_PAT( 0, 3, 0, 0, 3 ),

Why did we go from human readable names to raw magic numbers?
This is now completely illegible.

> +};
> +
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>  {
>  	WARN_ON(pat_index >= xe->pat.n_entries);
> @@ -380,9 +415,68 @@ static const struct xe_pat_ops xe2_pat_ops = {
>  	.dump = xe2_dump,
>  };
>  
> +static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int fw_ref;
> +	u32 pat;
> +	int i;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
> +
> +	drm_printf(p, "PAT table:\n");
> +
> +	for (i = 0; i < xe->pat.n_entries; i++) {
> +		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
> +
> +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n", i,
> +			   !!(pat & XE2_NO_PROMOTE),
> +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +			   REG_FIELD_GET(XE2_COH_MODE, pat),
> +			   pat);
> +	}
> +
> +	/*
> +	 * Also print PTA_MODE, which describes how the hardware accesses
> +	 * PPGTT entries.
> +	 */
> +	pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
> +
> +	drm_printf(p, "Page Table Access:\n");
> +	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> +		   !!(pat & XE2_NO_PROMOTE),
> +		   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +		   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +		   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +		   REG_FIELD_GET(XE2_COH_MODE, pat),
> +		   pat);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
> +}
> +
> +static const struct xe_pat_ops xe3p_xpc_pat_ops = {
> +	.program_graphics = program_pat_mcr,
> +	.program_media = program_pat,
> +	.dump = xe3p_xpc_dump,
> +};
> +
>  void xe_pat_init_early(struct xe_device *xe)
>  {
> -	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
> +	if (GRAPHICS_VERx100(xe) == 3511) {
> +		xe->pat.ops = &xe3p_xpc_pat_ops;
> +		xe->pat.table = xe3p_xpc_pat_table;
> +		xe->pat.pat_ats = &xe3p_xpc_pat_ats;
> +		xe->pat.pat_pta = &xe3p_xpc_pat_pta;
> +		xe->pat.n_entries = ARRAY_SIZE(xe3p_xpc_pat_table);
> +		xe->pat.idx[XE_CACHE_NONE] = 3;
> +		xe->pat.idx[XE_CACHE_WT] = 3;	/* N/A (no display); use UC */
> +		xe->pat.idx[XE_CACHE_WB] = 2;
> +	} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
>  		xe->pat.ops = &xe2_pat_ops;
>  		xe->pat.table = xe2_pat_table;
>  		xe->pat.pat_ats = &xe2_pat_ats;
> 
> -- 
> 2.51.0

-- 
Ville Syrjälä
Intel
