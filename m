Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C13DC43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 15:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2842210F445;
	Thu,  2 Jul 2026 15:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpFC1Xsq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5627C10F43A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783005004; x=1814541004;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tSiYuecwEZcZ9CenmwPqJMBGgNVScC3RMRER1kIeu0w=;
 b=OpFC1XsqWyKOchN0qwCdBf+Euu1RZ3Jdl1Nv7NjHppiqqD77n/J65BZs
 J2b/Z/sOqnzol8sg2s9low4TqlGFYZ5ZbBDbRg2RhLfI68/m6erY6LCiJ
 Nv8bf9LclipvfaNYYhL265TwvdBX1dIW/bo9Frp4gwnqq1TA159L6jrtK
 HR2dwD0e9eW4YD2Uzj4IBD+4gSYocz3cmn2auGnO6FrJ7u7wy5BZMKcUj
 Tss6uZ+If/X5xBVszV5wWdTTP2ebzC8XvBVTuwcvcaGzJoJppmb5MaD40
 e9aw9HqBR6a5rG6bopZUjfpthvFlkPkVRIqZMWMUJ0IDJEBYsWKSXP68Z Q==;
X-CSE-ConnectionGUID: tEaEhbmgQJuZxxQpH2/zYg==
X-CSE-MsgGUID: CduSCFvBQ6q2vpK3R6Bs0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82872059"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="82872059"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 08:10:04 -0700
X-CSE-ConnectionGUID: jGp0wV8wSN+07aELGjUrvg==
X-CSE-MsgGUID: i8I64rPSTuiFjYXW3bktkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="248435693"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.244.242])
 ([10.245.244.242])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 08:10:03 -0700
Message-ID: <585cc96e-43ee-4e94-b883-5a9109caff0e@intel.com>
Date: Thu, 2 Jul 2026 16:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add support for WA 16029897822
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260701165830.2355397-3-daniele.ceraolospurio@intel.com>
 <20260701165830.2355397-4-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260701165830.2355397-4-daniele.ceraolospurio@intel.com>
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

On 01/07/2026 17:58, Daniele Ceraolo Spurio wrote:
> The WA is implemented by the GuC, so we just need to enable it via the
> dedicated KLV.
> This WA is supported starting from GuC 70.69.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
>   3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index fbbee40d7217..e4b028ab24c9 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -505,6 +505,7 @@ enum xe_guc_klv_ids {
>   	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
>   	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
>   	GUC_WA_KLV_REMAP_RANGED_TLB_INV							= 0x900f,
> +	GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64					= 0x9010,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index becf9a004867..ff36946523aa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -367,6 +367,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   	if (XE_GT_WA(gt, 22022079272) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 62))
>   		guc_waklv_enable(ads, NULL, 0, &offset, &remain, GUC_WA_KLV_REMAP_RANGED_TLB_INV);
>   
> +	if (XE_GT_WA(gt, 16029897822) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 69))
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64);
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index a2ccd036abce..5d6574ec9dee 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -69,3 +69,5 @@
>   22022079272	MEDIA_VERSION(3503)
>   		GRAPHICS_VERSION(3510)
>   		GRAPHICS_VERSION(3511)
> +16029897822	MEDIA_VERSION(3500)
> +		GRAPHICS_VERSION(3510)

