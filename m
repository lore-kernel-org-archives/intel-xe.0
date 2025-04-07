Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87160C36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 07:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8B010E31F;
	Mon,  7 Apr 2025 07:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/kmohbc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A653B10E328
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 07:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744010059; x=1775546059;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FZI6i1YNDWkNimgfJG8bQAR8vBZAJnwVRpont53D46I=;
 b=e/kmohbc69F8CO3HZT8pG9p9ZRKHpct0N7fb7Ue1uE0rFNPh6JexFbkB
 k3cDJuyCF22UwT4sPYTy3e49Dol7mXgFcLHQiLUo6E7PVFL4j9VwYILOR
 RM8OAVkVEdrSzJWmlh2bDe3D/lzVgjRnIrgpD7RgEkeUY+OyItfIFdTqM
 jrZ8d0dN0a4hqByI97NOZ99YmIohyzf3d5vGtQn0EFO2b/gaiikKYhHJZ
 n30ljJTX76W2yn/Yzo8KsE4/5BJTj9rugerBnv2hrxpkzAPbZ9lRy0My8
 HmZc4aTEZlWQ67LkyPYxRy35MMCqGNuG4EnqsTpOHXFKe66eCiQJUNyiW g==;
X-CSE-ConnectionGUID: hrdI6fbCTNGfWtAUQZJnPQ==
X-CSE-MsgGUID: tFpKJ9p7TK+qY6Y1LMuzOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45469078"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="45469078"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 00:14:19 -0700
X-CSE-ConnectionGUID: KLjmAq8RRC65cio8XjGZTw==
X-CSE-MsgGUID: Rw+L6E7BSVOMta+InIJ1tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="158836250"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.196])
 ([10.245.245.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 00:14:19 -0700
Message-ID: <f875d21f-42d2-44d7-9403-25f5ef067849@intel.com>
Date: Mon, 7 Apr 2025 08:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Ensure XE_BO_FLAG_CPU_ADDR_MIRROR has a unique
 value
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20250404220053.1758356-2-matthew.d.roper@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250404220053.1758356-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 04/04/2025 23:00, Matt Roper wrote:
> When XE_BO_FLAG_PINNED_NORESTORE and XE_BO_FLAG_PINNED_LATE_RESTORE were
> added, they were assigned BO flag values in the middle of the flag
> range, requiring renumbering of the higher flags.  In both cases,
> XE_BO_FLAG_CPU_ADDR_MIRROR was overlooked during renumbering because it
> was defined below XE_BO_FLAG_GGTT_ALL and thus was not immediately
> visible in code diffs changing this area of the code; this resulted in
> XE_BO_FLAG_CPU_ADDR_MIRROR clashing with another flag.
> 
> Assign XE_BO_FLAG_CPU_ADDR_MIRROR a unique value, and also move the
> definition of XE_BO_FLAG_GGTT_ALL down below all of the individual flags
> so that this kind of mistake is less likely in the future.  Also, while
> we're at it, fix up some space vs tab whitespace inconsistency in these
> flag definitions.
> 
> Fixes: 7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")
> Fixes: 045448da87bf ("drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Sorry for missing this,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo.h | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index f7e716f59948..0a19b50045b2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -40,21 +40,22 @@
>   #define XE_BO_FLAG_NEEDS_2M		BIT(16)
>   #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
>   #define XE_BO_FLAG_PINNED_NORESTORE	BIT(18)
> -#define XE_BO_FLAG_PINNED_LATE_RESTORE BIT(19)
> -#define XE_BO_FLAG_GGTT0                BIT(20)
> -#define XE_BO_FLAG_GGTT1                BIT(21)
> -#define XE_BO_FLAG_GGTT2                BIT(22)
> -#define XE_BO_FLAG_GGTT3                BIT(23)
> -#define XE_BO_FLAG_GGTT_ALL             (XE_BO_FLAG_GGTT0 | \
> -					 XE_BO_FLAG_GGTT1 | \
> -					 XE_BO_FLAG_GGTT2 | \
> -					 XE_BO_FLAG_GGTT3)
> -#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(22)
> +#define XE_BO_FLAG_PINNED_LATE_RESTORE	BIT(19)
> +#define XE_BO_FLAG_GGTT0		BIT(20)
> +#define XE_BO_FLAG_GGTT1		BIT(21)
> +#define XE_BO_FLAG_GGTT2		BIT(22)
> +#define XE_BO_FLAG_GGTT3		BIT(23)
> +#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
>   
>   /* this one is trigger internally only */
>   #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
>   #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
>   
> +#define XE_BO_FLAG_GGTT_ALL		(XE_BO_FLAG_GGTT0 | \
> +					 XE_BO_FLAG_GGTT1 | \
> +					 XE_BO_FLAG_GGTT2 | \
> +					 XE_BO_FLAG_GGTT3)
> +
>   #define XE_BO_FLAG_GGTTx(tile) \
>   	(XE_BO_FLAG_GGTT0 << (tile)->id)
>   

