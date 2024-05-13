Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACC3C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5B710E4E3;
	Mon, 13 May 2024 08:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OzQY3iHw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF32910E4E3
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715588014; x=1747124014;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zRhpdTgZotA7zTvzyfLeoOkcBeydF9TswKEJh8UtMpo=;
 b=OzQY3iHwr7me4qQQNJn5MXHxwV33/WUSnT3LUjdt2/CoMIJXzO5jGYPC
 7M8/jb7JSeiH3B67feAgNItv10VjgueQySPfWQSLRwf4SPX/mgSGaZxb7
 17rh/le6SsbB6jQZP+05RNVLSiHyv4Rb84ItsdqUYWa1KPIr4NBdCFxoq
 OHqoinwVSMHmX5GsTuS8OlHSU72RECwRHPqVHDJCMRagqLptrooMguFhj
 O2au2yy9ZF2bbWIw7pFYZxNU/XY9sb+rBsiIrD9p0NIvOR7AsvwvQ9fPm
 c2NjQGOXvLX/62Jz6zE1G3g1oDm48j5deIR7d6xdd5FqR7axnVn6Da8Wm g==;
X-CSE-ConnectionGUID: B5uP8hQETByi+XuHOwP50g==
X-CSE-MsgGUID: u5jGG4q6RhKOJhQyaDUcHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15343033"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="15343033"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:13:33 -0700
X-CSE-ConnectionGUID: D0VyJI75RGumPURXH9usrA==
X-CSE-MsgGUID: DxFs0DXQT1iiXyILAucxpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30830761"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:13:32 -0700
Message-ID: <edd75823-c9ec-4a44-9b52-7784760afcf7@intel.com>
Date: Mon, 13 May 2024 10:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] drm/xe/display: move display fini stuff to devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-40-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-40-matthew.auld@intel.com>
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
> Match the i915 display handling here with calling both no_irq and
> noaccel when removing the device.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/xe/display/xe_display.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 0de0566e5b39..6d74c9f55b0a 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -126,9 +126,9 @@ int xe_display_init_nommio(struct xe_device *xe)
>   	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
>   }
>   
> -static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
> +static void xe_display_fini_noirq(void *arg)
>   {
> -	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_device *xe = arg;
>   
>   	if (!xe->info.enable_display)
>   		return;
> @@ -163,12 +163,12 @@ int xe_display_init_noirq(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> -	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noirq, NULL);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_noirq, xe);
>   }
>   
> -static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
> +static void xe_display_fini_noaccel(void *arg)
>   {
> -	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_device *xe = arg;
>   
>   	if (!xe->info.enable_display)
>   		return;
> @@ -187,7 +187,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> -	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noaccel, NULL);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_noaccel, xe);
>   }
>   
>   int xe_display_init(struct xe_device *xe)

