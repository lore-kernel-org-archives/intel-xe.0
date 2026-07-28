Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1818FC53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 12:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21FC10E2A4;
	Tue, 28 Jul 2026 12:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dP3XjubF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE58E10E2A4
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 12:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785242550; x=1816778550;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=u7hHYu15k/BNU0t580JUGtLK/QGVEUpvaPtN1GGLl2U=;
 b=dP3XjubFbmCRLyyiL18yZ0vu/cxhx5RPF5e7AQvcmuQNimhOV4C47nK2
 2b48xaI8uZ0+NTydn/7T2FbbA0PLF+r3PwVmSJSmoWCqKKJx23ye9vo20
 3LexTnUMsW/dNsuPTMZFn4+EAyA9d/efAmS8Cc1BZhz+HtGm/9GL3cc9L
 ymnptRICAhouXTZO8VgsVvwLnTD3FntwjPOd+Rr2HHGjyugVH+Z3rQQ0x
 y7KxZDN6FzBrzfS9qnVMIb/mrf+SDbMKRmJsVYnBEHbcuTwSwlp/Z0OlI
 sJzxh+ayxLJ7sBxeTAqO07fL+o9HL58QQxLCz8bWMDh+DlEg6/CSY1AVG w==;
X-CSE-ConnectionGUID: fi1jdbBoQUChBu7VVpF3cw==
X-CSE-MsgGUID: HwT1vs5cRiGxmuFZsHD3eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="86013705"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="86013705"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 05:42:30 -0700
X-CSE-ConnectionGUID: qmqEDdUYTF6AUCx+ku/3Ew==
X-CSE-MsgGUID: lputB6TlQ6uWTFJYBGyQ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259770091"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.120])
 ([10.245.244.120])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 05:42:29 -0700
Message-ID: <76db8482-5393-42f3-8173-a8681a3526d0@intel.com>
Date: Tue, 28 Jul 2026 13:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Extract override_has_cached_pt()
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
References: <20260724-wa_14026539277-v2-0-ad786cc6ba1e@intel.com>
 <20260724-wa_14026539277-v2-1-ad786cc6ba1e@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260724-wa_14026539277-v2-1-ad786cc6ba1e@intel.com>
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

On 24/07/2026 22:44, Gustavo Sousa wrote:
> Some platforms support cached page tables, but some workarounds might
> require disabling the cached access on the CPU side.  One such example
> is Wa_16029380221, but there could be others as well.  Extract the
> code responsible for overriding xe->info.has_cached_pt into a new
> function called override_has_cached_pt(), so that we have a common
> place to add the necessary runtime checks specific for has_cached_pt.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_device.c | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4eed9a251e65..5189419a0593 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -831,6 +831,21 @@ int xe_device_probe_early(struct xe_device *xe)
>   }
>   ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
>   
> +static void override_has_cached_pt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	/*
> +	 * Wa_16029380221: The affected GT will always use non-coherent
> +	 * access to page tables, so we must do uncached writes from the
> +	 * CPU.
> +	 */
> +	for_each_gt(gt, xe, id)
> +		if (XE_GT_WA(gt, 16029380221))
> +			xe->info.has_cached_pt = false;
> +}
> +
>   static int probe_has_flat_ccs(struct xe_device *xe)
>   {
>   	struct xe_gt *gt;
> @@ -950,14 +965,7 @@ int xe_device_probe(struct xe_device *xe)
>   			return err;
>   	}
>   
> -	/*
> -	 * Wa_16029380221: The affected GT will always use non-coherent
> -	 * access to page tables, so we must do uncached writes from the
> -	 * CPU.
> -	 */
> -	for_each_gt(gt, xe, id)
> -		if (XE_GT_WA(gt, 16029380221))
> -			xe->info.has_cached_pt = false;
> +	override_has_cached_pt(xe);
>   
>   	for_each_tile(tile, xe, id) {
>   		err = xe_ggtt_init_early(tile->mem.ggtt);
> 

