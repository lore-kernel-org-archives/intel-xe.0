Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD535C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 09:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB7610EA91;
	Mon,  6 May 2024 09:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKipcEq1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF6610EA91
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714986778; x=1746522778;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2Qu4SL2V0Rxwlf43/nU8OchmzCGtJaXT4R/q3cdjmHM=;
 b=iKipcEq1rSnxFnN6ma3suxjJaNzdKuieUOu/LZfXY4dxRnWii2QIZZqt
 1XF6RydWeUKtPFpad9gdLLWKytBFj+GRgAwMM4w6Gs3bNgoC6n3GJuBh4
 EqIjTgu29NPHyO4XwhKlOTUoq4Sbd3E+u0s0WcHYumHpUZxQYKwx4uu7M
 yofslN1Qe52A5dLRWXE+nYwuwsIEWCl9zCiGu+Gjo3xqbg3MPezKS6sFF
 Px/QCagnBcqCL2wZica0cekwXCEVBOE715uDB56bH8LSrlj9NXmYKgI+1
 1UWe9wplB5tl8KJv4LqZDy9Q/Tcuha/RUHKdS+9c0/EqfCrzYW1b9bN6A Q==;
X-CSE-ConnectionGUID: 9DmcIokNS4+bsl88KKtdEA==
X-CSE-MsgGUID: IZbRLuSgR8eeUfTLmv8elQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21278359"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="21278359"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:12:57 -0700
X-CSE-ConnectionGUID: +2MVn6ZaTPGSJek2i+3vGA==
X-CSE-MsgGUID: FTnu8nc9QHGhwBSiWB9pgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="58987057"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:12:55 -0700
Message-ID: <4b2283cf-dc3a-487b-9e3e-45bf863d2c92@intel.com>
Date: Mon, 6 May 2024 11:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/xe/device: move flr to devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-15-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240429121436.33013-15-matthew.auld@intel.com>
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

On 29.04.2024 14:14, Matthew Auld wrote:
> Should be called when driver is removed, not when this particular driver
> instance is destroyed.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/xe/xe_device.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b61f8356e23e..ba917e383f8f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -387,7 +387,7 @@ static void xe_driver_flr(struct xe_device *xe)
>   	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
>   }
>   
> -static void xe_driver_flr_fini(struct drm_device *drm, void *arg)
> +static void xe_driver_flr_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
>   
> @@ -589,7 +589,7 @@ int xe_device_probe(struct xe_device *xe)
>   	err = xe_devcoredump_init(xe);
>   	if (err)
>   		return err;
> -	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> +	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
>   	if (err)
>   		return err;
>   

