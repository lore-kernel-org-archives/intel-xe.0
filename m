Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCC8C7EE2A
	for <intel-xe@archiver.kernel.org>; Sat, 28 Jun 2025 02:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819EA10E058;
	Sat, 28 Jun 2025 02:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="O/CaStsZ";
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AAC10E058
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Jun 2025 02:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=MUkd/n07sYxLp0tygVU+UyzFBGK+s6E2xhkuUJ8VpP8=; b=O/CaStsZw79P9He9+4pyHCXH8o
 6DAFR+WnUZIHmEzAbrmu0V/IuvYE2tTNhZc/dHcKfS7T/JDwh2kThgTlz/S9NhHMbovQFZNF/+5aV
 FZqEQZ+zz5InU8N/cTdzjcehTQhkyZv30PymbMKgY2ajLpIMC3tpDlbvQuy/oWW9X8nMtAq+tZ1yO
 WBtS3BTVIkJb0htfYb5xndHwomSrDVb0w/OreGkm04FtvIDasTxT690tNAXRR7WC165m9gzm9xAbv
 r8alnMtVMh/dWPxdRqdfdCns52crmpIKhqBCtqh+iIrhsSNLuKK8z0/K9VchhzemTa7aElJ41ivk5
 5VijUANA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uVLjO-0000000FYyE-1ynE; Sat, 28 Jun 2025 02:55:54 +0000
Message-ID: <27d0c458-1a05-4fb1-af2e-6f8ea6a4d9e8@infradead.org>
Date: Fri, 27 Jun 2025 19:55:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Fix conflicting intel_pcode_* symbols
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Harry Austen <hpausten@protonmail.com>
References: <20250627-xe-kunit-v2-0-756fe5cd56cf@intel.com>
 <20250627-xe-kunit-v2-1-756fe5cd56cf@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250627-xe-kunit-v2-1-756fe5cd56cf@intel.com>
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



On 6/27/25 1:30 PM, Lucas De Marchi wrote:
> If CONFIG_DRM_XE_DISPLAY is set, the xe module can only be built as
> module to avoid duplicate symbols from i915. The interface for pcode was
> added without considering that, so the build breaks if both xe and i915
> are built-in.
> 
> Since the intel_pcode_* functions should only be called from the display
> side (xe side should call the xe interface directly) and there's already
> a protection in Kconfig to avoid the problematic configuration, ifdef it
> out in case CONFIG_DRM_XE_DISPLAY is disabled.
> 
> Closes: https://lore.kernel.org/r/3667a992-a24b-4e49-aab2-5ca73f2c0a56@infradead.org
> Fixes: d9465cc8ac2d ("drm/xe/pcode: add struct drm_device based interface")
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 87323ad0cbbb2..6a7ddb9005f99 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -337,7 +337,9 @@ int xe_pcode_probe_early(struct xe_device *xe)
>  }
>  ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
>  
> -/* Helpers with drm device */
> +/* Helpers with drm device. These should only be called by the display side */
> +#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +
>  int intel_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32 *val1)
>  {
>  	struct xe_device *xe = to_xe_device(drm);
> @@ -362,3 +364,5 @@ int intel_pcode_request(struct drm_device *drm, u32 mbox, u32 request,
>  
>  	return xe_pcode_request(tile, mbox, request, reply_mask, reply, timeout_base_ms);
>  }
> +
> +#endif
> 

-- 
~Randy
