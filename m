Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07C0C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 15:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3BD10F44C;
	Thu,  2 Jul 2026 15:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNJS+Fap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3192910F445
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783004962; x=1814540962;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=F8PBomUevgOtgGWk3+bxTnHbkvnqPqBxki1BLC0dC9E=;
 b=TNJS+Fap+6FLpDNNa7PTx914VCfNoHkNWdpIbfrpaR517Wr3hDwFHWGL
 6Qa9aezR7n7mRUXEHlswNUK3O/5s+9cpZv8rTJBn9hRJ5NIhGnfoBZLV8
 Ua5b0FVEQHYBC+abJ0q81STJQ5O5uddhUIq7b2eUT3Jr08QoDythNo8o+
 VmieoeF27NqoOyIbYeI9gJ+5qC/hdFXFTEHQ85jShVU8iBQ1Opl40aEfX
 6Arzul4kVc7l0araLvHcujlF41qqqSFZFCIxbLt4xmkWaPHN8pk4J1NxH
 Is+2OOruD/ZDg0EVyIG13mfTSI+awwoCbgObqb17sH+6she50yGvjGhBv g==;
X-CSE-ConnectionGUID: vGG5SrTBTeKn2VpObPL1mQ==
X-CSE-MsgGUID: tZ/BZ/wgQSGprm1s07u4AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82872008"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="82872008"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 08:09:22 -0700
X-CSE-ConnectionGUID: dOweJaqeRYC3uAfkNTzPFw==
X-CSE-MsgGUID: 1gjX3C6kSfqz9sWxNiXLCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="248435596"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.244.242])
 ([10.245.244.242])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 08:09:21 -0700
Message-ID: <b30ef231-f221-4051-b45a-69160f013716@intel.com>
Date: Thu, 2 Jul 2026 16:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add support for WA 22022079272
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260701165830.2355397-3-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260701165830.2355397-3-daniele.ceraolospurio@intel.com>
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
> This WA is supported starting from GuC 70.62.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 3 +++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 3 +++
>   3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 644f5a4226d7..fbbee40d7217 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -504,6 +504,7 @@ enum xe_guc_klv_ids {
>   	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
>   	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
>   	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
> +	GUC_WA_KLV_REMAP_RANGED_TLB_INV							= 0x900f,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index c98454545a85..becf9a004867 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -364,6 +364,9 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>   				 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
>   
> +	if (XE_GT_WA(gt, 22022079272) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 62))
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain, GUC_WA_KLV_REMAP_RANGED_TLB_INV);
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9027365f0043..a2ccd036abce 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -66,3 +66,6 @@
>   14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>   		GRAPHICS_VERSION_RANGE(2004, 3005)
>   16029380221	MEDIA_VERSION(3500)
> +22022079272	MEDIA_VERSION(3503)
> +		GRAPHICS_VERSION(3510)
> +		GRAPHICS_VERSION(3511)

