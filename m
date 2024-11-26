Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA4CD65543
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 18:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABB910E979;
	Tue, 26 Nov 2024 18:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScMpHpEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB5110E979
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 18:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732645656; x=1764181656;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y/VgcZj7shpqvcYRSS3IMWyuQIHtz4hzuV5aBvphYvE=;
 b=ScMpHpEvJDb8205cKG511NUmsECD/MdBBqYE0tzFIJwDRMjMBjCyKLAI
 /y8/SAkcQpFqx0o98vSgYYPF1RPg8SWPV+F6VtaIOUcoUEzR4IT1f/Zfc
 038B+1suVLFigVITZqOTAO0ec0lHz+7doJjxF4c9wIs3lWyPWz3Xi196q
 almFBD1SopeKeGjqA9fLGT4dITt9b8/+J9vdY4IhUn6hxe+k1KMSKwq6m
 fTxjn+OfBOmBVJKHU6d70XuecZbN+WuLE3Wd+Zv5FEJGmBvYLgWzy92Nk
 p6LkvyI/IOVRyxwFVv2IzlqCZFZ5X/2YoZ4whm0NB4SwRR5hh22mbOtAP g==;
X-CSE-ConnectionGUID: rMCtGMmrRtuQo2pprG7E7A==
X-CSE-MsgGUID: 9hp99unLRVOcPNAvc+F2eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43892435"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43892435"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 10:27:35 -0800
X-CSE-ConnectionGUID: lQOUGVVTShqy0IJvJjwbtw==
X-CSE-MsgGUID: DQnAiYPhQt65paIQf6I9ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91519735"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.160.19])
 ([10.245.160.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 10:27:33 -0800
Message-ID: <e134fa72-678d-4e3f-9362-d303407a5e85@linux.intel.com>
Date: Tue, 26 Nov 2024 19:27:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/migrate: use XE_BO_FLAG_PAGETABLE
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, stable@vger.kernel.org
References: <20241126181259.159713-3-matthew.auld@intel.com>
 <20241126181259.159713-4-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241126181259.159713-4-matthew.auld@intel.com>
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


On 11/26/2024 7:13 PM, Matthew Auld wrote:
> On some HW we want to avoid the host caching PTEs, since access from GPU
> side can be incoherent. However here the special migrate object is
> mapping PTEs which are written from the host and potentially cached. Use
> XE_BO_FLAG_PAGETABLE to ensure that non-cached mapping is used, on
> platforms where this matters.
>
> Fixes: 7a060d786cc1 ("drm/xe/mtl: Map PPGTT as CPU:WC")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 48e205a40fd2..1b97d90aadda 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -209,7 +209,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  				  num_entries * XE_PAGE_SIZE,
>  				  ttm_bo_type_kernel,
>  				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -				  XE_BO_FLAG_PINNED);
> +				  XE_BO_FLAG_PINNED |
> +				  XE_BO_FLAG_PAGETABLE);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
