Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64718C8303F
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 07:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6F110EB55;
	Fri, 29 Aug 2025 07:43:00 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2612B10EB55
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 07:42:58 +0000 (UTC)
Message-ID: <e8a176ab-a24c-4b9d-a046-ae386f08f129@lankhorst.se>
Date: Fri, 29 Aug 2025 09:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Attempt to bring bos back to VRAM after eviction
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org
References: <20250828154219.4889-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20250828154219.4889-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Den 2025-08-28 kl. 17:42, skrev Thomas Hellström:
> VRAM+TT bos that are evicted from VRAM to TT may remain in
> TT also after a revalidation following eviction or suspend.
> 
> This manifests itself as applications becoming sluggish
> after buffer objects get evicted or after a resume from
> suspend or hibernation.
> 
> If the bo supports placement in both VRAM and TT, and
> we are on DGFX, mark the TT placement as fallback. This means
> that it is tried only after VRAM + eviction.
> 
> This flaw has probably been present since the xe module was
> upstreamed but use a Fixes: commit below where backporting is
> likely to be simple. For earlier versions we need to open-
> code the fallback algorithm in the driver.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5995
> Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
I'd say it this closes a bug in the original driver, although effectively v6.8 is no longer supported anyway.

Should DESIRED also be set on the add_vram flags?

> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.9+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4faf15d5fa6d..64dea4e478bd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -188,6 +188,8 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
>  
>  		bo->placements[*c] = (struct ttm_place) {
>  			.mem_type = XE_PL_TT,
> +			.flags = (IS_DGFX(xe) && (bo_flags & XE_BO_FLAG_VRAM_MASK)) ?
> +			TTM_PL_FLAG_FALLBACK : 0,
>  		};
>  		*c += 1;
>  	}

Kind regards,
~Maarten Lankhorst
