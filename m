Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68C3CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 18:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D29D10E0B7;
	Wed, 27 May 2026 18:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Soi/wkh3";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F358010E0B7
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 18:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1779905112;
 bh=bQ9H5LkpTVnma4kaCd96oO8gjxX45NI+2DdgBLPkHfo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Soi/wkh3iFo3ze3eF7W9PLWtijzJeB3fPwuFTnvSD9RKzSkcdd4K0eIgdjpeGiKW/
 q0Rf0M28kr8D4xYDwqJmIMgn+8BeZlznIr0uxmwXb/eWNEbw7lucr6EuTlAWYZ3nmV
 8ptNG41zYsk63n7BW3+mk/bX1AWTKv7468HcMeyatt73H62hWYT3IhF3gdBWNqLxNv
 gQ+kcywQVUnt3R+5sIK0UpfmMX9Nrh7JcGg5xvdkTwulPIZtBHlPCXnPiE3CFIRfHj
 f+/6Ry/O7767VlFb9wH81ekaP7R4fY+99+ovJaPjYUoD0Q0PuDLdXR2cZVKFvvO82u
 hJBg2BXcEi6yg==
Message-ID: <e5abf7ae-6591-4ecc-aee1-8a649ae7fc80@lankhorst.se>
Date: Wed, 27 May 2026 20:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ggtt: Fix xe_ggtt documentation
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260527122154.22480-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260527122154.22480-1-michal.wajdeczko@intel.com>
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

Den 2026-05-27 kl. 14:21, skrev Michal Wajdeczko:
> The following error is reported during the htmldocs build:
> 
>  ... Documentation/gpu/xe/xe_mm:22:
>      ../drivers/gpu/drm/xe/xe_ggtt.c:125:
>         ERROR: Unexpected indentation. [docutils]
> 
> Fix this by adding a blank line before the enumeration.
> While around correct some invalid spaces.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index a351c578b170..8ec23862477f 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -111,14 +111,14 @@ struct xe_ggtt_pt_ops {
>  struct xe_ggtt {
>  	/** @tile: Back pointer to tile where this GGTT belongs */
>  	struct xe_tile *tile;
> -        /** @start: Start offset of GGTT */
> +	/** @start: Start offset of GGTT */
>  	u64 start;
>  	/** @size: Total usable size of this GGTT */
>  	u64 size;
> -
>  	/**
> -	 * @flags: Flags for this GGTT
> +	 * @flags: Flags for this GGTT.
>  	 * Acceptable flags:
> +	 *
>  	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
>  	 * - %XE_GGTT_FLAGS_ONLINE - is GGTT online, protected by ggtt->lock
>  	 *   after init
> @@ -129,7 +129,7 @@ struct xe_ggtt {
>  	/** @lock: Mutex lock to protect GGTT data */
>  	struct mutex lock;
>  	/**
> -	 *  @gsm: The iomem pointer to the actual location of the translation
> +	 * @gsm: The iomem pointer to the actual location of the translation
>  	 * table located in the GSM for easy PTE manipulation
>  	 */
>  	u64 __iomem *gsm;
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
