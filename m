Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123EACD5BB4
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 15:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A266210E0B5;
	Fri, 22 May 2026 15:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0k7tCrt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A71F10E0B5
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779462165; x=1810998165;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=OKw0Xd/Oaj4A7Do16VcIkRZwlUwHDAf/64lHtCPM+xQ=;
 b=m0k7tCrt3hE+B61n/YgMFjXDCA+5z4l0WAVK0VHDKbSWIFf2tjN01OkB
 joFoxycYG3HjwEok73n9yp57Uw1r3MLVJ/rOWCgxqipx4u8CG9DSVXtoo
 MSA+z0G234ZGpbYwmLRl29NaY++JNbgFSJGsmt1NeZMvG1aTOLBCULfBB
 I5K8B/Q8Cnh61hG8vHrFzDqmu8LpRsGEq63Z7h7BQyqrvmj3giJVkwL3e
 XqHDNt85u+lxkUem1uzqNqa3Co4zWe8wokifdkjUPvMkL/dB9JwsyApst
 VdiuWi/xSlCnSdcZ08e09DRwryVFUqWM55snjkLZbG4KDTHuHCVkh2ypt g==;
X-CSE-ConnectionGUID: LXZ657HETI++T5K3chHXxA==
X-CSE-MsgGUID: nL5jOsdbRkyZa0Gt9l08QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84011269"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84011269"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 08:02:44 -0700
X-CSE-ConnectionGUID: 7Hcv7DgeQDm+SaeDukRlqQ==
X-CSE-MsgGUID: OVqgJ83BSBaWmSMdqBouGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="236500045"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.22])
 ([10.245.245.22])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 08:02:43 -0700
Message-ID: <cc014db3-31ba-4862-b2ba-d2f16767c189@intel.com>
Date: Fri, 22 May 2026 16:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/mmio: Drop tiles_fini action
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260522143112.10643-1-michal.wajdeczko@intel.com>
 <20260522143112.10643-4-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260522143112.10643-4-michal.wajdeczko@intel.com>
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

On 22/05/2026 15:31, Michal Wajdeczko wrote:
> The pointer zeroing is not required, as there should be no active
> code running during a driver unwind.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 3e31a2141886..7043289a0eb9 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -23,16 +23,6 @@
>   
>   #include "generated/xe_device_wa_oob.h"
>   
> -static void tiles_fini(void *arg)
> -{
> -	struct xe_device *xe = arg;
> -	struct xe_tile *tile;
> -	int id;
> -
> -	for_each_remote_tile(tile, xe, id)
> -		tile->mmio.regs = NULL;

Same comment here. This makes it easier to spot places still trying to 
touch hw state post unplug.

> -}
> -
>   /*
>    * On multi-tile devices, partition the BAR space for MMIO on each tile,
>    * possibly accounting for register override on the number of tiles available.
> @@ -73,8 +63,7 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>   	size_t tile_mmio_size = SZ_16M;
>   
>   	mmio_multi_tile_setup(xe, tile_mmio_size);
> -
> -	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
> +	return 0;
>   }
>   
>   /**

