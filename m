Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A4BCD13CF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 10:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFBD10E465;
	Tue,  3 Sep 2024 10:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfJA4ayY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B4A10E465
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 10:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725360788; x=1756896788;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YJundqDHt/TqL4x3j24F/34v8ZjizQZsQk0oNBgnQHU=;
 b=UfJA4ayYXRH153QA7CuesEv2P8n+J1wrF/u9MIqFDN3xkjxr/DpgYK2m
 vPDLkhcHu6pjNN94Ac4f4jwQY+FYwoytYx08DB/9AbSGnTsH16zDQR9af
 REyQdMC1dPyU5V6QAS5EZ63qd7sr53Fcjy0mM59AL6b4lTfMl39TiRCJ8
 Xvbvmu//qx7dSoqZBpNCMnAko6k+ZXUeMiHFxAKbDSlVp9WhowdCVej7N
 bbbJQ+T8+wXGO+rp/EjQ6RNRjNBj6iK/7heGnNNzQlR+QeobxYeqNf20t
 9SawNclXkArJwpxAaAFnt5jL5mCbVRtR4T951k1W9ezXiRUcsy/D+TMEw w==;
X-CSE-ConnectionGUID: Yx1bp7s8SQOdjL4MQ/6QUw==
X-CSE-MsgGUID: vJAsvkbwRki7Oaa8iW2Gpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23758617"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="23758617"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 03:53:08 -0700
X-CSE-ConnectionGUID: Ek6FrbPNQ56oX7zYklpLpw==
X-CSE-MsgGUID: YUa04KdJT7q6JZvVoJZFDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="65376339"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.130.175])
 ([10.245.130.175])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 03:53:07 -0700
Message-ID: <9d3f3a9d-bfde-4a06-a776-743b1ed47236@linux.intel.com>
Date: Tue, 3 Sep 2024 12:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bmg: improve cache flushing behaviour
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240902153744.63456-2-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240902153744.63456-2-matthew.auld@intel.com>
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


On 9/2/2024 5:37 PM, Matthew Auld wrote:
> The BSpec seems to suggest that EN_L3_RW_CCS_CACHE_FLUSH must be toggled
> on for manual global invalidation to take effect

I couldn't find this reference, in which bspec is this mentioned ?


Regards,

Nirmoy

>   and actually flush
> device cache, however this also turns on flushing for things like
> pipecontrol, which occurs between submissions for compute/render. This
> sounds like massive overkill for our needs, where we already have the
> manual flushing on the display side with the global invalidation. Some
> observations on BMG:
>
> 1. Disabling l2 caching for host writes and stubbing out the driver
>     global invalidation but keeping EN_L3_RW_CCS_CACHE_FLUSH enabled, has
>     no impact on wb-transient-vs-display IGT, which makes sense since the
>     pipecontrol is now flushing the device cache after the render copy.
>     Without EN_L3_RW_CCS_CACHE_FLUSH the test then fails, which is also
>     expected since device cache is now dirty and display engine can't see
>     the writes.
>
> 2. Disabling EN_L3_RW_CCS_CACHE_FLUSH, but keeping the driver global
>     invalidation also has no impact on wb-transient-vs-display. This
>     suggests that the global invalidation still works as expected and is
>     flushing the device cache without EN_L3_RW_CCS_CACHE_FLUSH turned on.
>
> With that drop EN_L3_RW_CCS_CACHE_FLUSH.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
>   drivers/gpu/drm/xe/xe_gt.c           | 1 -
>   2 files changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0d1a4a9f4e11..88a01970cc5c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -387,9 +387,6 @@
>   
>   #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
>   
> -#define SCRATCH1LPFC				XE_REG(0xb474)
> -#define   EN_L3_RW_CCS_CACHE_FLUSH		REG_BIT(0)
> -
>   #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>   
>   #define XE2_TDF_CTRL				XE_REG(0xb418)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index f82b3e8ac5c8..313cc4242281 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -110,7 +110,6 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
>   		return;
>   
>   	if (!xe_gt_is_media_type(gt)) {
> -		xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
>   		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>   		reg |= CG_DIS_CNTLBUS;
>   		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
