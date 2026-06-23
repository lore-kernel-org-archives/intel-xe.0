Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED635CDB470
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 09:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D6E10EA2B;
	Tue, 23 Jun 2026 09:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tygb+bJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E153510EA2B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 09:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782206011; x=1813742011;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=H67/UKX0qPqaf/5FJvG8OqN2EL3E6gTU+C++rltPvtI=;
 b=Tygb+bJwGPUAey635TUjOh/MnH8awcwvfsRK73kA7zYRl6IsL1RHgsJG
 8dIhXZ+JDkKolc/hJ8ubiTsPLqnpoJbwYmv6G8pAWc4Cj/p2DKb4pZq7h
 9WvjpHBbptezOA8d6CJ0AqJosagTTS/XwgQwXB2qAYZ2T/3aXvEPuyJQR
 ot/zZvL5sWT0oCPB15/CVpMAwvQRccKB+0XEbJv1iW/zwuhXL99KPA681
 ZsrzkP9aYCCkaFHWm+DzlsCpxzaeqRVFUPAaEuknWnNEdnqwNqpwjKvaP
 I7jAy3K2REDIpIyyZloBXeaBH39Q+Jdlu730ANaTQUXgMPVjE4bKChHVt g==;
X-CSE-ConnectionGUID: h1fHh7eVRsKwJW69wniwbA==
X-CSE-MsgGUID: fZTdjsgRQxW7NYELLv30ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82949050"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="82949050"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 02:13:31 -0700
X-CSE-ConnectionGUID: f1BcAwwnRKSwegU6QLeW8w==
X-CSE-MsgGUID: NbpvDdsART2WNjrNpS+4JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="253349162"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.52])
 ([10.245.244.52])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 02:13:30 -0700
Message-ID: <9883b211-98c6-49a2-9c96-f2048a6c5dcc@intel.com>
Date: Tue, 23 Jun 2026 10:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/xe/mmio: Prefer tile-based WARN message
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260622132342.19600-1-michal.wajdeczko@intel.com>
 <20260622132342.19600-7-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260622132342.19600-7-michal.wajdeczko@intel.com>
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

On 22/06/2026 14:23, Michal Wajdeczko wrote:
> If 64-bit read operations are unstable, use tile-based WARN message
> to provide more details on which tile this was observed.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 41e6b753634f..7fa18dfcb5a2 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -11,7 +11,6 @@
>   #include <linux/pci.h>
>   
>   #include <drm/drm_managed.h>
> -#include <drm/drm_print.h>
>   
>   #include "regs/xe_bars.h"
>   #include "xe_device.h"
> @@ -315,8 +314,8 @@ u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
>   		oldudw = udw;
>   	}
>   
> -	drm_WARN(&mmio->tile->xe->drm, retries == 0,
> -		 "64-bit read of %#x did not stabilize\n", reg.addr);
> +	xe_tile_WARN(mmio->tile, retries == 0,
> +		     "MMIO: 64-bit read of %#x did not stabilize\n", reg.addr);
>   
>   	return (u64)udw << 32 | ldw;
>   }

