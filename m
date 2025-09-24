Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295DFCAC5B0
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 13:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB5410E238;
	Wed, 24 Sep 2025 13:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGWyv6fh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B411D10E238
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758720033; x=1790256033;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xoLpeadviUXsEP/CEowSqfNLOoPw477yxh7ArAH9BCw=;
 b=jGWyv6fhpOyjD26gIlJvcADma+kAkVRjfr4Bd1x+yiRpfQ3RphvCQZYb
 /MqPANztpBwKvka/rPNk4mIlp+tgtmrFl75jLPQ1h9CljghyOBmqCS5hq
 j0DQxScF5oeEV5PcR6RkqOI6dvfLFiffsyJUdMhdhdo8dvpRFr4dNxobI
 GLLx9k0OyCcMlTD+CbEjmpHb20DZggjw+plzc0w+1rrT9oyZRYdDuKYnp
 hlpmNjQnVZKA6DL+7dnQmgEHgIndSWDtHEyGFMxfeIIWhb15dMC/V+8Gh
 +6sqAgvjXQVGPOi3i0Kab6CzJcbhwaNP0XFwNoQHfEw1abFU8OSOLTsgY Q==;
X-CSE-ConnectionGUID: fhjyCKRHQheAx9AFz/w0NQ==
X-CSE-MsgGUID: RFv/VR19Tmiqdk5+koIqWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60929171"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60929171"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:20:33 -0700
X-CSE-ConnectionGUID: TuFbaUtKTjqUct76wLzqEQ==
X-CSE-MsgGUID: tecgGSq/QvCowngzlG4L/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176325621"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.199])
 ([10.245.245.199])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:20:32 -0700
Message-ID: <63a38c42-0e4c-47fe-83b8-9ac16105f2da@intel.com>
Date: Wed, 24 Sep 2025 14:20:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] drm/xe: Combine vm->xef and XE_LRC_CREATE_USER_CTX
 checks to detect userspace context
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
 <20250922170707.1556781-6-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250922170707.1556781-6-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 22/09/2025 18:07, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Both vm->xef and XE_LRC_CREATE_USER_CTX indicate in xe_lrc_init that
> the context originates from userspace. However, XE_LRC_CREATE_USER_CTX
> has a broader scope as it may be set even when no vm->xef is present.
> The XE_BO_FLAG_PINNED_LATE_RESTORE flag can be extended to both cases,
> so there is no point in handling the two cases separately.
> Let's combine vm->xef and XE_LRC_CREATE_USER_CTX checks to detect
> userspace context.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>

Nit: Commit title is maybe a bit long?

Maybe "Combine userspace context check" or something?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index c88e90175f59..af09f70f6e78 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1412,11 +1412,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   
>   	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
>   		   XE_BO_FLAG_GGTT_INVALIDATE;
> -	if (vm && vm->xef) /* userspace */
> -		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
>   
> -	if (init_flags & XE_LRC_CREATE_USER_CTX)
> -		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
> +	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
> +		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
>   
>   	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
>   					    bo_size,

