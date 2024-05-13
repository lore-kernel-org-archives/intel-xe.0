Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA8AC25B74
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7150E892F2;
	Mon, 13 May 2024 08:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTQmBwRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0399F892F2
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715588571; x=1747124571;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o9Zk4SiuQuwMC9I2CZkADwNqlTpkWA0gjd2aappy6GM=;
 b=NTQmBwRyYAZATzBnwE0ektqQtrqSZZHVKBN2l5geJQFzd8gkxStG5Uti
 ePqAvsZ6r+B4zbdCzDtdxP5JVnOxFTjSalZe+RxunOyA6ZWh3MXyqbMCL
 VEIPgVP7QgCM/5Fr04K9AkzHMqVoG0ibc3Pb6/nx56D34uwo52Nr8Bs7t
 lU8j7UFoct5q1YGDuvPx26RGr4P3MOXn56WGWEKt0KxpXuzNxW+H8qKQD
 wgKEwFthS9bdreZBKfrZ1j50al+taUEDxoc5gWbSL4qQCmvKxC4ypx0SG
 6BMIL9TQmH09/7W9yla9W2tQBUQBqTzzT3MQH1ykCdJnFvSOBbtBsP5rz Q==;
X-CSE-ConnectionGUID: hmcuCr6+TI2CHNHnwht2gA==
X-CSE-MsgGUID: GSh7Jma0QD6ssmvdbqgOaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22914058"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="22914058"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:22:51 -0700
X-CSE-ConnectionGUID: 0GO7Djf+S12CXnzpYM0E5w==
X-CSE-MsgGUID: Dj2JoweUTMqBCqa3zJOzsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30300510"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:22:50 -0700
Message-ID: <0e84c317-1149-4307-96c4-dcc4020210c3@intel.com>
Date: Mon, 13 May 2024 10:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/20] drm/xe/display: move device_remove over to drmm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-42-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-42-matthew.auld@intel.com>
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
> i915 display calls this when releasing the drm_device, match this also
> in xe by using drmm. intel_display_device_remove() is freeing purely
> software state for the drm_device.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_display.c | 20 ++++++++++++++++----
>   drivers/gpu/drm/xe/display/xe_display.h |  4 ++--
>   drivers/gpu/drm/xe/xe_pci.c             |  4 +++-
>   3 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 734bddbb8932..ac674a08664d 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -234,8 +234,6 @@ void xe_display_driver_remove(struct xe_device *xe)
>   		return;
>   
>   	intel_display_driver_remove(xe);
> -
> -	intel_display_device_remove(xe);
>   }
>   
>   /* IRQ-related functions */
> @@ -377,17 +375,31 @@ void xe_display_pm_resume(struct xe_device *xe)
>   	intel_power_domains_enable(xe);
>   }
>   
> -void xe_display_probe(struct xe_device *xe)
> +static void display_device_remove(struct drm_device *dev, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	intel_display_device_remove(xe);
> +}
> +
> +int xe_display_probe(struct xe_device *xe)
>   {
> +	int err;
> +
>   	if (!xe->info.enable_display)
>   		goto no_display;
>   
>   	intel_display_device_probe(xe);
>   
> +	err = drmm_add_action_or_reset(&xe->drm, display_device_remove, xe);
> +	if (err)
> +		return err;
> +
>   	if (has_display(xe))
> -		return;
> +		return 0;
>   
>   no_display:
>   	xe->info.enable_display = false;
>   	unset_display_features(xe);
> +	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index 710e56180b52..148bf7d744e6 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -18,7 +18,7 @@ void xe_display_driver_remove(struct xe_device *xe);
>   
>   int xe_display_create(struct xe_device *xe);
>   
> -void xe_display_probe(struct xe_device *xe);
> +int xe_display_probe(struct xe_device *xe);
>   
>   int xe_display_init_nommio(struct xe_device *xe);
>   int xe_display_init_noirq(struct xe_device *xe);
> @@ -47,7 +47,7 @@ static inline void xe_display_driver_remove(struct xe_device *xe) {}
>   
>   static inline int xe_display_create(struct xe_device *xe) { return 0; }
>   
> -static inline void xe_display_probe(struct xe_device *xe) { }
> +static inline int xe_display_probe(struct xe_device *xe) { }

With added "return 0"
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   
>   static inline int xe_display_init_nommio(struct xe_device *xe) { return 0; }
>   static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 841b02ac6ba1..b366cbceb476 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -768,7 +768,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (err)
>   		return err;
>   
> -	xe_display_probe(xe);
> +	err = xe_display_probe(xe);
> +	if (err)
> +		return err;
>   
>   	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d gscfi:%d",
>   		desc->platform_name,

