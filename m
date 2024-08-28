Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F100C7112F
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 20:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5216F10E5D3;
	Wed, 28 Aug 2024 20:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffT6lA5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F32C10E5D3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 20:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724877763; x=1756413763;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=coOFQg4R773nT10WvITmqqMEr/bndeZA/w6qbJvuoCk=;
 b=ffT6lA5AxK+9HM7ySo1OfphHaUy+9LrGp9Qw3Z0RhOXhgpbdiKMzIsKY
 DJ9nS49Kv4iVD1GHB/PaK9klTHNv6jomM1+yzh7cB6eZmhRgFFaRU+G0u
 NMTbuqtuyseXFbEEsnwGSyJojNcms5q5Eo5hOn3jZC79K16wBXWLhoUnN
 kcIiliInyCi9t++VQfrl1E5fhIqdqI7e+xXl9KDMU1uBm/9y6PiF0iJL1
 A6bi/Q3m2TQqb347Ig67Jrgtyf9nH9iZmSZe7RjnaKu7uh6bcoU67wtZe
 tDizwMqb8P9xvpbWgNZYNwiryeuDrzpJLAbAGaR595bSAVO2dHAkrfchf Q==;
X-CSE-ConnectionGUID: XY9uFhbcQZWGF5Gx57iCQA==
X-CSE-MsgGUID: j8ALDAG3RnOaHb/ok1+GgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="40941281"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="40941281"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 13:42:42 -0700
X-CSE-ConnectionGUID: WhQeFRCMQo2kXy6SBXY1Pg==
X-CSE-MsgGUID: 1tPxdosTSJmjrv7qpQGpeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="68248279"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 28 Aug 2024 13:42:35 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 826E1312D7;
 Wed, 28 Aug 2024 21:42:33 +0100 (IST)
Message-ID: <1429c1eb-91b8-43e0-9e3d-51b2367f2b9d@intel.com>
Date: Wed, 28 Aug 2024 22:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/xe: separate memirq reset/postinstall from vf
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, koby.elbaz@intel.com, yaron.avizrat@intel.com
References: <20240828091841.1840086-1-ilia.levi@intel.com>
 <20240828091841.1840086-6-ilia.levi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240828091841.1840086-6-ilia.levi@intel.com>
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



On 28.08.2024 11:18, Ilia Levi wrote:
> Up until now only VF used Memory Based Interrupts (memirq).
> Moving reset/postinstall flows out of VF to cater for other usages.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  2 +-
>  drivers/gpu/drm/xe/xe_device.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_irq.c    | 36 +++++++++++++++++++---------------
>  3 files changed, 27 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c4f8bfd08b09..a23fb0c81ca6 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -660,7 +660,7 @@ int xe_device_probe(struct xe_device *xe)
>  		err = xe_ggtt_init_early(tile->mem.ggtt);
>  		if (err)
>  			return err;
> -		if (IS_SRIOV_VF(xe)) {
> +		if (xe_device_needs_memirq(xe)) {
>  			err = xe_memirq_init(&tile->memirq, false);
>  			if (err)
>  				return err;
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index f052c06a2d2f..4ba07617084c 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -9,6 +9,7 @@
>  #include <drm/drm_util.h>
>  
>  #include "xe_device_types.h"
> +#include "xe_sriov.h"
>  
>  static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>  {
> @@ -154,6 +155,11 @@ static inline bool xe_device_has_memirq(struct xe_device *xe)
>  	return GRAPHICS_VERx100(xe) >= 1250;
>  }
>  
> +static inline bool xe_device_needs_memirq(struct xe_device *xe)
> +{
> +	return IS_SRIOV_VF(xe) && xe_device_has_memirq(xe);
> +}

maybe worth to introduce this helper earlier in the series?

> +
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>  
>  void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 18a5272d9bb0..a080d4869b16 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -559,17 +559,15 @@ static void vf_irq_reset(struct xe_device *xe)
>  
>  	xe_assert(xe, IS_SRIOV_VF(xe));
>  
> -	if (GRAPHICS_VERx100(xe) < 1210)
> -		xelp_intr_disable(xe);
> -	else
> +	if (GRAPHICS_VERx100(xe) >= 1210) {
>  		xe_assert(xe, xe_device_has_memirq(xe));
> -
> -	for_each_tile(tile, xe, id) {
> -		if (xe_device_has_memirq(xe))
> -			xe_memirq_reset(&tile->memirq);
> -		else
> -			gt_irq_reset(tile);
> +		return;
>  	}
> +
> +	xelp_intr_disable(xe);
> +
> +	for_each_tile(tile, xe, id)
> +		gt_irq_reset(tile);
>  }
>  
>  static void xe_irq_reset(struct xe_device *xe)
> @@ -577,6 +575,11 @@ static void xe_irq_reset(struct xe_device *xe)
>  	struct xe_tile *tile;
>  	u8 id;
>  
> +	if (xe_device_needs_memirq(xe)) {
> +		for_each_tile(tile, xe, id)
> +			xe_memirq_reset(&tile->memirq);
> +	}
> +

"else" or "return" ?

>  	if (IS_SRIOV_VF(xe))
>  		return vf_irq_reset(xe);
>  
> @@ -604,13 +607,6 @@ static void xe_irq_reset(struct xe_device *xe)
>  
>  static void vf_irq_postinstall(struct xe_device *xe)
>  {
> -	struct xe_tile *tile;
> -	unsigned int id;
> -
> -	for_each_tile(tile, xe, id)
> -		if (xe_device_has_memirq(xe))
> -			xe_memirq_postinstall(&tile->memirq);
> -
>  	if (GRAPHICS_VERx100(xe) < 1210)
>  		xelp_intr_enable(xe, true);
>  	else
> @@ -619,6 +615,14 @@ static void vf_irq_postinstall(struct xe_device *xe)
>  
>  static void xe_irq_postinstall(struct xe_device *xe)
>  {
> +	struct xe_tile *tile;
> +	unsigned int id;
> +
> +	if (xe_device_needs_memirq(xe)) {
> +		for_each_tile(tile, xe, id)
> +			xe_memirq_postinstall(&tile->memirq);
> +	}
> +
>  	if (IS_SRIOV_VF(xe))
>  		return vf_irq_postinstall(xe);
>  
