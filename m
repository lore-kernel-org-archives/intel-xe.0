Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF01C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 07:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEDD10E444;
	Mon, 13 May 2024 07:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afA2+pbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C84410E444
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 07:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715585841; x=1747121841;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cbbElqQCY+gB0bgjgEwcAq7x0XI2aqWpuhBqpZNMmWg=;
 b=afA2+pboQ+Fm9X4yWd+2+Pj9RGCR/LJ2z90CBhMUQeWKsszL/l1N8V6B
 j7tH5CH5dmYSaESHbepgE/5iv9V/66BJbsZkNeX/KyeNfekdvgXYw9Ue0
 K6NqWahYef2NQxxLPDZ6Xzuq2wiVFZ/yT7V1SyLxcAwdX8mJjXseb++ic
 fgpaEKDwEGhUrM2GDGruQfoC8JDp7feLR5vAclevCpcaAF73w9QrD5UwE
 uYN3UhOiKV2C6Ze9IZacnJOCPSDG5anq8izhJPaqe3exL2VrkZ20VACmz
 kyJ4z0oItSCDz17+OE+S3rOigrpzWWvgfHs7yfYXUgTvUS+cz1R6WZTA4 g==;
X-CSE-ConnectionGUID: 4J54ZAEYRE2GaKpLO6XnTA==
X-CSE-MsgGUID: ARUpCrbQReOVmLjeoEZXMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="34016156"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="34016156"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:37:20 -0700
X-CSE-ConnectionGUID: iu1ccSJRT36VSsKWGoPJGA==
X-CSE-MsgGUID: HRGhZpOgT6ycwj2lnpeSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30336075"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:37:19 -0700
Message-ID: <cfa62069-aec6-419e-8211-d9919c7e3b68@intel.com>
Date: Mon, 13 May 2024 09:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] drm/xe/guc_pc: s/pc_fini/pc_fini_hw/
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-31-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-31-matthew.auld@intel.com>
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

On 10.05.2024 20:12, Matthew Auld wrote:
> Make it clear that is about cleaning up the HW/FW side, and not software
> state.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 4164dab1ab66..aabe241be42b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -889,11 +889,11 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>   }
>   
>   /**
> - * xe_guc_pc_fini - Finalize GuC's Power Conservation component
> + * xe_guc_pc_fini_hw - Finalize GuC's Power Conservation component
>    * @drm: DRM device

With removal of @drm description
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>    * @arg: opaque pointer that should point to Xe_GuC_PC instance
>    */
> -static void xe_guc_pc_fini(void *arg)
> +static void xe_guc_pc_fini_hw(void *arg)
>   {
>   	struct xe_guc_pc *pc = arg;
>   	struct xe_device *xe = pc_to_xe(pc);
> @@ -941,5 +941,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   
>   	pc->bo = bo;
>   
> -	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini, pc);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
>   }

