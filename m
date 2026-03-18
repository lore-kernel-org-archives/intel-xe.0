Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEBC103E16A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 12:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D09C10E75A;
	Wed, 18 Mar 2026 12:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ZoFxJRml";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B318510E71A;
 Wed, 18 Mar 2026 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1773835525;
 bh=tF5q0vL2qxVDFyGWLZqCYdrLjaZO/kNMYzRya6oPuHk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZoFxJRmlvBhWbPrOM0eoNUv8iLdWmO0PCyqV3W7Ghw6Fjvl3PwWnBp8VTwd9wAyr1
 uKHujBSvMr/peQ/sDDBOHBtdultfahgBrNJAgKtLvYfzt6kcZm78GaPYuef/Zcb4M7
 yhPGa9Th5KoEyPlmtCP6Yg9W3Hb0Iby7vsry7ZjtB2DULDCMtqQ6j+QpGJ/N0+h1Rd
 Q15FWKoaWSgWLjjeIdFartJEU+0ynGOM8wyAHZ6oKYM/V8ilL1Cmw6Il0kPvVOQJ39
 4O6fz21vHPc5VLS6aUVgmajGsLxJWibrU7Etage3i/rehfeX947RTAhz8+zHCwozzt
 qjRV6EOCk5M4g==
Message-ID: <b617a1e9-2f12-47fe-a44f-9b07d30024c4@lankhorst.se>
Date: Wed, 18 Mar 2026 13:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/display: Fix reading the framebuffer from
 stolen memory
To: Juasheem Sultan <jdsultan@google.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Manasi Navare <navaremanasi@google.com>,
 Drew Davenport <ddavenport@google.com>, Sean Paul <seanpaul@google.com>,
 Samuel Jacob <samjaco@google.com>, Rajat Jain <rajatja@google.com>
References: <20260317220908.130968-1-jdsultan@google.com>
 <20260317220908.130968-2-jdsultan@google.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten@lankhorst.se>
In-Reply-To: <20260317220908.130968-2-jdsultan@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

Den 2026-03-17 kl. 23:09, skrev Juasheem Sultan:
> Currently, we attempt to pin stolen memory using the ggtt address. This
> doesn't appear to actually read the framebuffer that was setup by the
> bios. Instead, we have to use the underlying physical address offset
> within stolen memory.
>
> Signed-off-by: Juasheem Sultan <jdsultan@google.com>
> ---
>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> index 4cfeafcc158d..d818993d9b8a 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -19,6 +19,7 @@
>  #include "intel_fb.h"
>  #include "intel_fb_pin.h"
>  #include "xe_bo.h"
> +#include "xe_ttm_stolen_mgr.h"
>  #include "xe_vram_types.h"
>  #include "xe_wa.h"
>  
> @@ -87,7 +88,26 @@ initial_plane_bo(struct xe_device *xe,
>  
>  		if (!stolen)
>  			return NULL;
> -		phys_base = base;
> +
> +		/* Read PTE to find physical address backing the GGTT address */
> +		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
> +		u64 phys_addr = pte & ~(page_size - 1);
> +
> +		u64 stolen_base = xe_ttm_stolen_gpu_offset(xe);
> +
> +		drm_dbg_kms(&xe->drm,
> +				"Stolen Framebuffer base=%x pte=%llx phys_addr=%llx stolen_base=%llx\n",
> +				base, pte, phys_addr, stolen_base);
> +
> +		/* Make sure that the physical address is in the range of stolen memory */
> +		if (phys_addr >= stolen_base) {
> +			phys_base = phys_addr - stolen_base;
> +		} else {
> +			drm_err(&xe->drm, "Stolen memory outside of stolen range phys_base=%pa\n",
> +					&phys_base);
> +			return NULL;
> +		}
> +
>  		flags |= XE_BO_FLAG_STOLEN;
>  
>  		if (XE_DEVICE_WA(xe, 22019338487_display))
So far all platforms had an identity mapping of GGTT with stolen, is that different?

There should probably also be a mention that allocation will fail anyway if phys_addr + bo_size < xe_ttm_stolen_size()

Kind regards,
~Maarten Lankhorst
