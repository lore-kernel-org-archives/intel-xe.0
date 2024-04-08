Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5152DCD128A
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 10:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23C310F6BF;
	Mon,  8 Apr 2024 10:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcyEpqm0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5633810F6BF
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712571192; x=1744107192;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zRzAGpjrWuZ9EFZvedjukv2D1hIx1Y8GLMnbDytAIZ8=;
 b=KcyEpqm0BIWxynqyAuwSvIotbcXrtQOj5fZw+JKJyYDn8aViN46RR/i9
 nQa4ych39T8Y0UCPtTTXDomJjDX6mLQEMDGQjYrO2pA9deu4Sei9B7ZM4
 UjnZ0yIX6eQ6PJhVFr3JIFEAmDXdMx7fr/H1Kgk00d+habV8o6qYFCmwk
 Nw5RbxY+PonD/1G/MFr5e6+oQ+yF8kwCIJ6SgFlWYZg0SXLQtUaeR0H+F
 sFmAFBbt0VKTAbL6yuq7izpN3Gfbfmz7ad1TlAEcex6XrAek8HNjKEw4M
 F9GaOBnxaccmfzjFD8RKezYB6Q0yMnCnPapmKOAMRlsVhSHv/VTpQiyro A==;
X-CSE-ConnectionGUID: w2xLK82oRnOyq7GhYjekyw==
X-CSE-MsgGUID: nSKqOMdoRuCtL8oCAk1oBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="30333621"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="30333621"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 03:13:11 -0700
X-CSE-ConnectionGUID: WnwEhwRvTpa5HAsgaxFviw==
X-CSE-MsgGUID: DidAYF2lSJah1XOXCsatHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="20402414"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.15])
 ([10.246.36.15])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 03:13:08 -0700
Message-ID: <c86e90ef-5bee-4638-9dcd-2666bb7f6e51@linux.intel.com>
Date: Mon, 8 Apr 2024 12:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
References: <20240404090302.68422-1-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240404090302.68422-1-maarten.lankhorst@linux.intel.com>
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


On 4/4/2024 11:03 AM, Maarten Lankhorst wrote:
> Add a unreference bo in the error path, to prevent leaking a bo ref.
>
> Return 0 on success to clarify the success path.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
> Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/display/intel_fb_bo.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> index dba327f53ac5..e18521acc516 100644
> --- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> @@ -31,7 +31,7 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
>   
>   	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
>   	if (ret)
> -		return ret;
> +		goto err;
>   
>   	if (!(bo->flags & XE_BO_FLAG_SCANOUT)) {
>   		/*
> @@ -42,12 +42,16 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
>   		 */
>   		if (XE_IOCTL_DBG(i915, !list_empty(&bo->ttm.base.gpuva.list))) {
>   			ttm_bo_unreserve(&bo->ttm);
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto err;
>   		}
>   		bo->flags |= XE_BO_FLAG_SCANOUT;
>   	}
>   	ttm_bo_unreserve(&bo->ttm);
> +	return 0;
>   
> +err:
> +	xe_bo_put(bo);
>   	return ret;
>   }
>   
