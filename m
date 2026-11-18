Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBD6606A325
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 20:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VL11uMok
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2EE10ECA7;
	Wed, 18 Nov 2026 20:32:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7279D10ECA7
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 20:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795033930; x=1826569930;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=B8rZRAdT5xgK9iS7rViD4reijpBBS8jbA1cFezyjUt0=;
 b=VL11uMok4erGjSqmh6GNDtnIWjo4ZKs3ZwBidS2rvD2iyDXBP4FerQBh
 VY28B2n/yGYLhFv16x9BmKLUWYlMH2Av2PQrEyjEvBYKsbEWR7k8iWAgO
 Pun5qbz9VhFAXlmoGlhVJf2HOqL2mwi/QtvcqgKb4NZf2iV0u87lXME6a
 xzUPF9A/CV7REcF4DlAXrF8/wBnWhlodZuA2ljBhakgfRL3fVqQkybHto
 sx48wQWXloDRl7xaaI74Vb3nyrwbgLYSE8DN5xXSi3i8OEA7czrAyxkF+
 pr0chxH1WBeQ6hlH/68cldupPXaILUC5i3Hs14Z7/+jBqzf7m+Riv+gOR A==;
X-CSE-ConnectionGUID: BI57Z74hSu68s8h9QEwrQw==
X-CSE-MsgGUID: IQm5qBY0Rhygy2e3YEP0fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3909347"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3909347"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:32:09 -0800
X-CSE-ConnectionGUID: LAy45lnrRnS1oQtOV7SJVQ==
X-CSE-MsgGUID: /juIYt+BSlGn1cTw+I5nRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10117062"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:32:08 -0800
Date: Wed, 18 Nov 2026 22:32:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 4/6] drm/xe/display: Use the correct calculation for
 phys_base on integrated
Message-ID: <av4LRFZZXU2zmd73@intel.com>
References: <20261116122828.266113-8-dev@lankhorst.se>
 <20261116122828.266113-12-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116122828.266113-12-dev@lankhorst.se>
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

On Mon, Nov 16, 2026 at 01:28:33PM +0100, Maarten Lankhorst wrote:
> The code originally assumed there was a 1:1 mapping between
> stolen and GGTT offset. This is no longer true as of MTL, so
> perform the correct calculations, similar to how they're
> performed for the DGFX case.
> 
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> index a100ad23be2a0..451c24a4ed8d5 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -101,7 +101,7 @@ initial_plane_bo(struct xe_device *xe,
>  			return NULL;
>  		}
>  
> -		phys_base = base;
> +		phys_base = (pte & ~(page_size - 1)) - xe_ttm_stolen_gpu_offset(xe);

Do we have anything guarding against a bogus dma address in the PTE?

In the i915 code I'm doing this:

if (dma_addr < mem->region.start || dma_addr > mem->region.end)
	-> bail
*out_phys_base = dma_addr - mem->region.start;

The end check is perhaps redundant because we will anyway fail later
if the whole thing doesn't fit inside the appointed memory region.
On the other hand, I think making sure it's at least partially in
there is a decent sanity check to do before going any further.

i915 also consistently logs all the information: the dma address,
the resulting phys_base, and the name of the memory region.
Having all that information at hand could help with debugging,
so I think the xe code should do the same.

>  		flags |= XE_BO_FLAG_STOLEN;
>  
>  		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
> -- 
> 2.55.0

-- 
Ville Syrjälä
Intel
