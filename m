Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED66C77B7D
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 14:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C7010E1E1;
	Mon, 15 May 2023 14:00:24 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0E710E1E1
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684159223; x=1715695223;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+4XgUw9Ko3DSKyWbx15/XIJp4+e3U4CG1HbVWW1F7Bs=;
 b=OlT11O08bU/mf8/IsLBTIIKlcpMI1esVaq8f+EZ0lkvAY4o0UnANC0eW
 Uxn/CIkuVE3oheVQHJ1e3vhcS+udpWmeKmdS0Iu8bIfDQW3xaHF1qHUgB
 u4+ecRizc3yVVADXPl4U9PPE6J4xqZIwWeXbz8Rv0oUqOTXn76/vXLrwx
 dIi8TXktZGbUJ+/U5co7m3c21RBB3avkR45KDtIqK/aZxG3MG06NIuZWB
 hrxH020ZoKolvT+yYjjvRQ6ET4o5/Xxv/INL5U7y+zn/OX4ZUTpqvJxRP
 0asg9JbIFOWqrddkHgaC647Y+Is4SnnVuKhT2L26WvQK9cjb0mgiO4/tU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331575802"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="331575802"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 07:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="765937478"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="765937478"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.56])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 07:00:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
In-Reply-To: <20230512074335.1293293-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230512074335.1293293-1-jani.nikula@intel.com>
Date: Mon, 15 May 2023 17:00:17 +0300
Message-ID: <87jzx9itji.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/2] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


Lucas, Rodrigo, r-b on these two?

Thanks,
Jani.


On Fri, 12 May 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> The dependency on display/intel_display_reg_defs.h is removed by
> upstream commit 6e4e9fbd5ba0 ("drm/i915/gt: drop dependency on
> VLV_DISPLAY_BASE").
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 7ae5fa5a8ff7..af80d2fe739b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -7,9 +7,7 @@
>  #define __INTEL_GT_REGS__
>  
>  #include "i915_reg_defs.h"
> -#ifdef I915
>  #include "display/intel_display_reg_defs.h"	/* VLV_DISPLAY_BASE */
> -#endif
>  
>  /*
>   * The perf control registers are technically multicast registers, but the

-- 
Jani Nikula, Intel Open Source Graphics Center
