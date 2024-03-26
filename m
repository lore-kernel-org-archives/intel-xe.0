Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A0BC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 08:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A81A10E1D1;
	Tue, 26 Mar 2024 08:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4kMuLZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFF610E1D1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 08:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711441561; x=1742977561;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6Z3fU7Ij7pnIS53m83dunt3+QD4sP8FM+rsv8O9EWFA=;
 b=Y4kMuLZ2k0x6Tse7efRfGDMo3Z5Q8JHIgs2p5p0lrKSRF7Mgsf1ndsNz
 0CXrgnU7uaur21fh6OXRsnlL4bVy7uLWBcNLAQNB2hmw1jfCvtrVdHyEI
 UMWJ3VhakiyXD1B3MILJfIfmPsb7Fc9oUB2WkMr5Q36Zp4vy8cB1fP50Q
 iavb8LAszkNfnZAjZ2JNCtFS0HZ0ptmPaYmfd6VeGSxGP7a8Q57OA4hO/
 LSTJYsiA16WLziV2K1qns3eYA0nWGUZz+cv8HYn7o8jyrXHdX1Kkf6bvi
 6AQf6TqMmC/xvNuZo3/RCfDL8z2RT2RElKw/TcJ8yA/w2X6nh6el9Zd1X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17910143"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="17910143"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 01:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15929513"
Received: from unknown (HELO [10.245.245.97]) ([10.245.245.97])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 01:25:58 -0700
Message-ID: <f2e72896-8524-44a5-bb75-ff277c50eaa6@intel.com>
Date: Tue, 26 Mar 2024 08:25:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/xe2: Send flat_ccs value in struct
 drm_xe_query_config
Content-Language: en-GB
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org, zbigniew.kempczynski@intel.com
References: <cover.1711447408.git.akshata.jahagirdar@intel.com>
 <b672be6eea948e332ba58b63d6f8c4c71c37a42b.1711447408.git.akshata.jahagirdar@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <b672be6eea948e332ba58b63d6f8c4c71c37a42b.1711447408.git.akshata.jahagirdar@intel.com>
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

On 26/03/2024 10:10, Akshata Jahagirdar wrote:
> Currently, we don't have any check in IGT testcases if platform supports
> compression or not. Send this flat_ccs value as part of the struct
> drm_xe_query_config so that we can read this value in the igt testcases
> and proceed accordingly.

AFAIK it's not valid to add uAPI just for an IGT. uAPI normally needs a 
real open source user (like Mesa etc) with UMD acks. However if this is 
going to be used by Mesa etc, how do they tell the difference between 
"this device doesn't have flat-CCS" and "this KMD version doesn't 
support FLAG_HAS_FLAT_CCS"?

If userspace doesn't need this, then other option could be debugfs. Or 
if this just a single test perhaps we can just dynamically check if the 
CCS state is zero for compressed buffer at the start of the test?

> Fixes: VLK-56136
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 3 +++
>   include/uapi/drm/xe_drm.h     | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index e80321b34918..8a3a3117491c 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -332,6 +332,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   	config->num_params = num_params;
>   	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
>   		xe->info.devid | (xe->info.revid << 16);
> +	if (xe->info.has_flat_ccs)
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS;
>   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =

This tramples the previous value AFAICT, like when we have VRAM + CCS on 
DG2. I think we need |= here.

>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f44a19ae9333..08783234bae1 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -405,6 +405,7 @@ struct drm_xe_query_config {
>   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>   #define DRM_XE_QUERY_CONFIG_FLAGS			1
>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS	(1 << 1)
>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
