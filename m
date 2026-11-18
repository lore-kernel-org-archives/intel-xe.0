Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C13606A333
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 20:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WjNrGbt+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F20810FFE6;
	Wed, 18 Nov 2026 20:09:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E64210E81B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 20:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795032586; x=1826568586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XvcZdfbRnAvx6F2mXRwUv/OUrJ/WNUFS1jkFJzdQLo8=;
 b=WjNrGbt+LXNtK4141v7uEKMSxG1Yad7na7n3X059PAWEL0NdkGwnSFz7
 i7XZrDv+nicFPQ9NSuSR7ZpJ43onjfztpkciWt2aXxQl2t4v+0N1zfMZz
 dWJINbNlEcNKhMslF/6sKpBIP4aPEDtUYvsb7h6AK9drK6bRKzngQ3MoA
 GucpYQEATYyWtfi6SFXY4yfWyPZ0czaZpR42zDKOVRmUhf0HOkdC0LB6i
 tdj6OnNCYbY229CrEx/Xbw9ccVp/h26166df1fTmDqJyi7hJJBff0+pA7
 /ffn2dhrmCdlRe7hQjTSWglqbz+Ou4xOaNbCP3Q8cbK0lD/ZsWQburWM/ Q==;
X-CSE-ConnectionGUID: fK4fZgJDR3Cm0zRDgIQO/g==
X-CSE-MsgGUID: NuwVEF3wSuKQLxJqL7T12g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3746373"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3746373"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:09:45 -0800
X-CSE-ConnectionGUID: nDtjTb/PR26/wfgzESSqCA==
X-CSE-MsgGUID: 8ulnK6WDTJKDzTpcxYuCwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10777834"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:09:43 -0800
Date: Wed, 18 Nov 2026 22:09:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 1/6] drm/xe/ggtt: Add xe_ggtt_reserve_area
Message-ID: <av4GBGvSkQttjqfn@intel.com>
References: <20261116122828.266113-8-dev@lankhorst.se>
 <20261116122828.266113-9-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116122828.266113-9-dev@lankhorst.se>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 01:28:30PM +0100, Maarten Lankhorst wrote:
> Create a new function xe_ggtt_reserve_area() which will be used
> for reserving the part of GGTT where the initial framebuffer was
> allocated, while ensuring the reservation fits within mappable
> GGTT boundaries.
> 
> This will allow us to either take over the initial mapping, or
> reserve it to have the newly allocated GGTT mapping not overwriting
> the initial mapping, which would cause flickering.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 69 +++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
>  2 files changed, 67 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 9ef2ce743770f..ca38d51f41441 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -681,14 +681,17 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
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
> +static struct xe_ggtt_node *xe_ggtt_insert_node_at(struct xe_ggtt *ggtt, u32 size,
> +						   u32 align, u64 start, u64 end)
>  {
>  	struct xe_ggtt_node *node;
>  	int ret;
> @@ -698,8 +701,19 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
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
> +	if (end >= ggtt->start)
> +		end -= ggtt->start;
> +	else
> +		end = 0;
> +
> +	ret = drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align,
> +					  0, start, end, DRM_MM_INSERT_HIGH);
>  	if (ret) {
>  		ggtt_node_fini(node);
>  		return ERR_PTR(ret);
> @@ -708,6 +722,53 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
>  	return node;
>  }
>  
> +/**
> + * xe_ggtt_reserve_area - Ensure an area of the GGTT is reserved.
> + * @ggtt: the &xe_ggtt where the area should be reserved.
> + * @start: Starting offset of range to reserve
> + * @size: size of the reservation
> + *
> + * This function ensures the area of [start...start+size)
> + * is reserved, while taking care of any clipping due to start or start+size
> + * falling outside of the adressable GGTT. The size of the returned node may
> + * be smaller if part of the region falls outside the accessible GGTT, or a
> + * NULL node may be returned.
> + *
> + * Return: &xe_ggtt_node or NULL on success or a ERR_PTR on failure.
> + */
> +struct xe_ggtt_node *xe_ggtt_reserve_area(struct xe_ggtt *ggtt, u32 base, u32 size)
> +{
> +	u64 ggtt_start = xe_ggtt_start(ggtt), ggtt_end = ggtt_start + xe_ggtt_size(ggtt);
> +
> +	/* Completely truncated? */
> +	if (base + size <= ggtt_start || base >= ggtt_end)
> +		return NULL;
> +
> +	/* Partially truncated? */
> +	if (base <= ggtt_start) {
> +		size -= ggtt_start - base;
> +		base = ggtt_start;
> +	}
> +
> +	if (base + size >= ggtt_end)
> +		size = ggtt_end - base;

We seem to be doing the same chop both here and in
xe_ggtt_insert_node_at(). Isn't one place enough?

Sashiko's comments about the 32bit overflow seem potentially valid
to me. I don't recall how high in the ggtt the GOP now places the
FB, but if it's at the very top, and there is no extra padding then
we could have the FB extend all the way to the 4 GiB mark.

We also have a 32bit 'plane_config->base + plane_config->size' in
both i915 and xe initial plane code, where that overflow would also
hit us.

> +
> +	return xe_ggtt_insert_node_at(ggtt, size, XE_PAGE_SIZE, base, base + size);
> +}
> +
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
> index c864cc975a695..15e62ecec2287 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -22,6 +22,8 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
> +struct xe_ggtt_node *
> +xe_ggtt_reserve_area(struct xe_ggtt *ggtt, u32 base, u32 size);
>  struct xe_ggtt_node *
>  xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
>  struct xe_ggtt_node *
> -- 
> 2.55.0

-- 
Ville Syrjälä
Intel
