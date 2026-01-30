Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAE8D49C80
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 09:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E5E10E959;
	Fri, 30 Jan 2026 09:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="By/qnQmq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B6310E959
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769764989; x=1801300989;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gb4Z8AkvaHT/N2dR19QDVOrqYw8Mje6a5SAEdSVG158=;
 b=By/qnQmqwhXCb9PaV024EJlWjqe42gaWj14fzuAU03L8coQzqMNF4vEQ
 X6Ov73oJOaJP3bLPR1mTON/yMrATMW1dCiWHBoFXpToLooK2mDirnl+0e
 JtwVqIdZRDJS8428LqBRsxl2JXRmmd2T4r9WuzYuUXDOFxMDapFS8CI7O
 61C1jKFO/3slroMiGET68UpBmEl9o7F9XR4oU5uBXKK55ijzFW4bmW4Ri
 3bduixGKNCs9jwRm+PZSGBCwItld6jXlP1J0RLaIBa2GrwUCeZ+2apvki
 qhPYZyo80G+zqOu0fNdFlK1l+8mhrOjSBgRYDjXxdCqBOq1fbDW7onHfI w==;
X-CSE-ConnectionGUID: 2u/nCwigRa2/5pbVydBNDw==
X-CSE-MsgGUID: sbGY9/awSEan6L6zK/x0Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70733171"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="70733171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:23:09 -0800
X-CSE-ConnectionGUID: oU8FiiRxQKatCChvQN5FfQ==
X-CSE-MsgGUID: LdzQv/d6R52ifLhVo4aHeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="209166902"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:23:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/mmio: Avoid double-adjust in 64-bit reads
In-Reply-To: <20260130021816.442958-2-shuicheng.lin@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130021816.442958-2-shuicheng.lin@intel.com>
Date: Fri, 30 Jan 2026 11:23:03 +0200
Message-ID: <59e02e754431c3ec9aa63b6b283c8f648c4262f9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 30 Jan 2026, Shuicheng Lin <shuicheng.lin@intel.com> wrote:
> xe_mmio_read64_2x32() was adjusting register addresses and then
> calling xe_mmio_read32(), which applies the adjustment again.
> This may shift accesses twice if adj_offset < adj_limit. There is
> no issue currently, as for media gt, adj_offset > adj_limit, so
> the 2nd adjust will be a no-op. But it may not work in future.
>
> To fix it, replace the adjusted-address comparison with a direct
> sanity check that ensures the MMIO address adjustment cutoff never
> falls within the 8-byte range of a 64-bit register. And let
> xe_mmio_read32() handle address translation.
>
> v2: rewrite the sanity check in a more natural way. (Matt)
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Fixes: ?

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index bcb6674b7dac..a1a05c68dc7d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -256,11 +256,11 @@ u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
>  	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
>  	u32 ldw, udw, oldudw, retries;
>  
> -	reg.addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> -	reg_udw.addr = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
> -
> -	/* we shouldn't adjust just one register address */
> -	xe_tile_assert(mmio->tile, reg_udw.addr == reg.addr + 0x4);
> +	/*
> +	 * The two dwords of a 64-bit register can never straddle the offset
> +	 * adjustment cutoff.
> +	 */
> +	xe_tile_assert(mmio->tile, !in_range(mmio->adj_limit, reg.addr + 1, 7));
>  
>  	oldudw = xe_mmio_read32(mmio, reg_udw);
>  	for (retries = 5; retries; --retries) {

-- 
Jani Nikula, Intel
