Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D1BC77B6C
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 10:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12ED10EAC5;
	Thu, 13 Apr 2023 10:49:17 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C0B10E0FC
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 10:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681382955; x=1712918955;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JhZ4VKUsGzAZHdiKhfRtPo3icS+mQjmsyz5nl53ezH4=;
 b=WwTIeMwPlvp1fkHm7oJh8Tf0d9A/rl54y2DFMqkGtcOAqPxl0KBczA0O
 133JTR+u02qfz35ssDo7Hgr0DABcZ8Ih1v7FVa592ermPoaNBBADLYv1A
 sVJzGH3jpBVccubn3x1v/Ou+k9JH6JdqXZBg2yi21oippfyPZsL+G2/oH
 1UuVfTv+sJWcPpBC1DfcKMXfAU5ZsctKgt+yVJKK85PrescJqeh6u7Ibe
 OACk2w7uvurqx5NGXFngFpsRHa1iYVmqWMER37m2eBn0QwHtTBSlA2ms4
 EsvlYs/lD3SK7AYyWVXYyyRrrzmbbheql3O0xWuic5yqdH1CVY8jQGC2x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406988828"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="406988828"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 03:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666748743"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="666748743"
Received: from ljcornel-mobl.ger.corp.intel.com (HELO [10.249.33.227])
 ([10.249.33.227])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 03:49:13 -0700
Message-ID: <8fb02acd-8490-fd8b-bbb8-bbe862705538@linux.intel.com>
Date: Thu, 13 Apr 2023 12:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-5-matthew.d.roper@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230412225248.3229571-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 4/8] drm/xe: Fix xe_mmio_rmw32 operation
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

Hey,

I thought this was on purpose, and xe_mmio_rmw32 specified which parts 
to keep,

as opposed to i915 which set a clear mask.

If this was not, can you also fix display/xe_de.h to no longer invert?

Otherwise, you break the entirety of display.

~Maarten

On 2023-04-13 00:52, Matt Roper wrote:
> xe_mmio_rmw32 was failing to invert the passed in mask, resulting in a
> register updated that wasn't the expected RMW operation.  Fortunately
> the impact of this mistake was limited, since xe_mmio_rmw32() is only
> used in two places to unmask certain GuC-related interrupts.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 388a633b438b..a3b7f9f5db67 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -40,7 +40,7 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, u32 reg, u32 mask,
>   	u32 old, reg_val;
>   
>   	old = xe_mmio_read32(gt, reg);
> -	reg_val = (old & mask) | val;
> +	reg_val = (old & ~mask) | val;
>   	xe_mmio_write32(gt, reg, reg_val);
>   
>   	return old;
