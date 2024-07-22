Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8A3C3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 21:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C22B10E142;
	Mon, 22 Jul 2024 21:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDA9ZMWr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D23910E142
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 21:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721682670; x=1753218670;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UMaLYx2P0B+tWbco5+Q8ANetCHJOdRX4xjJuaOUCxGQ=;
 b=nDA9ZMWrS3+k0JUu33Zq6/VS9zkxsT/YENyQTzk5nJIwf0a7gOUJ9zWH
 cXCvfIgjfX3Iygd+dKJc59RGJLpNWulyJOpCFVcoreFYvrUH8TaMQevrX
 VRhxTt5AUzmRVbCU3cALuwuHT9oKxrG3eRxUuOiJA9xfbh2tBsk5kIn9Z
 Rh9r1yVGCrqOcBHqDWhOx9ylFJn3RC6AZt7HXsSVxm9H0nNLdAlaYkyQZ
 xq1RP0lO/T/ppGUMiCHhpK/XRo9udnHaJQ/b0OUe0ebYkJOdxV5yl/YkB
 7T8emkZp6ClC15LF/RswO+MZWBM3JjPe9sl6wvGWOvAr8fy9NeXDu5gRo A==;
X-CSE-ConnectionGUID: xy0o0HWIRHG703195DKUmg==
X-CSE-MsgGUID: eg0O8QrSQWe/UI16g33D+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="44699864"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="44699864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:11:09 -0700
X-CSE-ConnectionGUID: ZgutG3GaRLa8cvNyDCNPww==
X-CSE-MsgGUID: 0YgPLf3dSeyee/Vn7sQVhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="56171900"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2024 14:11:08 -0700
Received: from [10.246.48.141] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.48.141])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E10EC28775;
 Mon, 22 Jul 2024 22:11:05 +0100 (IST)
Message-ID: <fe86a6cc-65c6-48eb-8425-ecd73c879fba@intel.com>
Date: Mon, 22 Jul 2024 23:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove stale declaration of xe_mmio_probe_vram()
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
References: <20240722190524.71548-2-gustavo.sousa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240722190524.71548-2-gustavo.sousa@intel.com>
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



On 22.07.2024 21:05, Gustavo Sousa wrote:
> The declaration of xe_mmio_probe_vram() became useless since
> commit 638d1c79cbf1 ("drm/xe: Promote VRAM initialization function to
> own file"). Remove it.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 6ae0cc32c651..26551410ecc8 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -22,7 +22,6 @@ u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
>  int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask, u32 eval);
>  bool xe_mmio_in_range(const struct xe_gt *gt, const struct xe_mmio_range *range, struct xe_reg reg);
>  
> -int xe_mmio_probe_vram(struct xe_device *xe);
>  u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
>  int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>  		   u32 *out_val, bool atomic);

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
