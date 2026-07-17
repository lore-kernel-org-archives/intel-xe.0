Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29C3C4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 14:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F5210E47A;
	Fri, 17 Jul 2026 14:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4UyEzuF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56C110E47B;
 Fri, 17 Jul 2026 14:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784298273; x=1815834273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=I5WeNheQUqyJ2djsNy9Ek5GZq857N5Xb6H42KfSa92g=;
 b=P4UyEzuFGYcR4umKJOIfK6xDXNkNEXGDZqdNZvE4JHnRBp5Iu2SB/Umm
 3PkipZ9H9bYL/nsb7E+q1U3EnDQpYMpYBEb/KbmzAFC+GI8ziQHR/TQRb
 ob/D2ofviMeRGBowe70sGqjdstyr5MHFioM+97tTEBZv59MUJWx0faXbb
 ePu4PiHqvkM4oe/akuoLJvemRkcX6q4iAFPDfvn3vxFsmyP6eFW8D5rWS
 Ik2jW710lM+ameiU8yMe+SMg3CZbeil8PH3g0Q0FWyx4ND2riQ3AAUzsX
 O5JTh+0dhBoQAS+pSK92GsaWLIBw93Sq6CF4lx8/K1tJ/bv95FGszjZhN w==;
X-CSE-ConnectionGUID: YTjaSJ76Tj2j3zR1stfT7g==
X-CSE-MsgGUID: DEJHrfD3RN+JK6AAXDQofw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84826450"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="84826450"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:24:32 -0700
X-CSE-ConnectionGUID: 2Fat+EYkToagmAnGcPORfA==
X-CSE-MsgGUID: 9U5zc1IBT5CpH1cxmyIXiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="258795489"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:24:31 -0700
Date: Fri, 17 Jul 2026 17:24:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 1/6] drm/xe/ggtt: Add xe_ggtt_insert_node_at
Message-ID: <alo7HDLezQEmfogQ@intel.com>
References: <20260715110557.2172095-1-dev@lankhorst.se>
 <20260715110557.2172095-2-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715110557.2172095-2-dev@lankhorst.se>
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

On Wed, Jul 15, 2026 at 01:05:52PM +0200, Maarten Lankhorst wrote:
> Create a new function xe_ggtt_insert_node_at() which will be used
> for reserving the part of GGTT where the initial framebuffer was
> allocated.
> 
> This will allow us to either take over the initial mapping, or
> reserve it to have the newly allocated GGTT mapping not overwriting
> the initial mapping, which would cause flickering.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 35 +++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
>  2 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ec23862477fc..c9f84db3bfecd 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -636,14 +636,17 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
>  }
>  
>  /**
> - * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
> + * xe_ggtt_insert_node_at - Insert a &xe_ggtt_node into the GGTT
>   * @ggtt: the &xe_ggtt into which the node should be inserted.
>   * @size: size of the node
>   * @align: alignment constrain of the node
> + * @start: Starting offset of range to insert node
> + * @end: Last offset for node insertion
>   *
>   * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
>   */
> -struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
> +struct xe_ggtt_node *xe_ggtt_insert_node_at(struct xe_ggtt *ggtt, u32 size,
> +					    u32 align, u64 start, u64 end)
>  {
>  	struct xe_ggtt_node *node;
>  	int ret;
> @@ -653,8 +656,19 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
>  		return node;
>  
>  	guard(mutex)(&ggtt->lock);
> -	ret = xe_ggtt_insert_node_locked(node, size, align,
> -					 DRM_MM_INSERT_HIGH);
> +	if (start >= ggtt->start)
> +		start -= ggtt->start;
> +	else
> +		start = 0;
> +
> +	/* Should never happen, but since we handle start, fail graciously for end */

I remember seeing this weird comment in the existing code as well.
I confused me then and still does. Which should never happen, the
'if' or the 'else'? And both cases seem entirely possible to me. 
The default end==~0ull is certainly going to hit the 'if', and the
initial fb can certainly be fully below ggtt->start so 'else' seems
possible as well.

> +	if (end >= ggtt->start)
> +		end -= ggtt->start;
> +	else
> +		end = 0;
> +
> +	ret = drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align,
> +					  0, start, end, DRM_MM_INSERT_HIGH);

That is going to fail if the size matches the original range, and
then we reduce the range due to ggtt_start/end.

Can I presume the drm_mm code can deal with the start/end > ggtt_end case?

Hmm, I now see that you handle those cases in the caller in the
later patch. But that just makes just this whole function feel
rather strange; Why do we even allow start/end that aren't within
the valid range for the mm if the caller has to handle that anyway?
OTOH I guess the 0/~0ull stuff does need this here :/

>  	if (ret) {
>  		ggtt_node_fini(node);
>  		return ERR_PTR(ret);
> @@ -663,6 +677,19 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
>  	return node;
>  }
>  
> +/**
> + * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
> + * @ggtt: the &xe_ggtt into which the node should be inserted.
> + * @size: size of the node
> + * @align: alignment constrain of the node
> + *
> + * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
> + */
> +struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
> +{
> +	return xe_ggtt_insert_node_at(ggtt, size, align, 0, ~0ULL);
> +}
> +
>  /**
>   * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
>   * @node: the &xe_ggtt_node
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index c864cc975a695..69974da523f74 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -22,6 +22,8 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
> +struct xe_ggtt_node *
> +xe_ggtt_insert_node_at(struct xe_ggtt *ggtt, u32 size, u32 align, u64 start, u64 end);
>  struct xe_ggtt_node *
>  xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
>  struct xe_ggtt_node *
> -- 
> 2.53.0

-- 
Ville Syrjälä
Intel
