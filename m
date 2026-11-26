Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3220606A32A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mxS9TJG/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9BF1121D4;
	Thu, 26 Nov 2026 08:46:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D03A1121A2;
 Thu, 26 Nov 2026 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795682758; x=1827218758;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kBSdIhmnRTFporflVf2nKmf/ubfhBRPjCKxqm8hLimA=;
 b=mxS9TJG/KBV6Z7n5P3NX6T5EfvKzuk80Obqw4G+XyuAG0UlFUvxR3ywk
 L//UrYIW5e9gDKTURmZ+HI02dFvKg9n6VFposKSrrJXF9/Yk23ZALx6HR
 F4xn2tCaENHNiENLHkKYP2TFmJLXYUD/wPPCmByuKCifKjKT7JGMKHsSX
 Gjj/31rynvvkwrQjwzVetRgbHPiHc7ycKwmFTXZbed8wic/snyryfnp0f
 q4fDCxxcp6b7gFoO6sgllqrFttuMHiQgmmghi1R7i/95AaVMwWkTV0dhv
 wHNiu0RqOfaqhDKzdAXM6+wu4ge/rpaRaF+R0qIoAsRbfOXko8JtnEw2e A==;
X-CSE-ConnectionGUID: 4VuAlbydQUu1Hza2RiCtpA==
X-CSE-MsgGUID: o76HjoGmQheqf0Wc6J0UOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4598886"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4598886"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:45:56 -0800
X-CSE-ConnectionGUID: l2HgIZtySZ2RcZckMZ8yIQ==
X-CSE-MsgGUID: 1lGfhd/0QKi/xbjG/rv+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12439373"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:45:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 03/15] drm/i915/display: Add pipelock bits to
 TRANS_DDI_FUNC_CTL2
In-Reply-To: <20261126063459.863698-4-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-4-suraj.kandpal@intel.com>
Date: Thu, 26 Nov 2026 10:45:51 +0200
Message-ID: <df3bd5280450f28450d2e486c067dfc9418f35e7@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Add the genlock enable, genlock mode, per-frame sync and timing
> generator start delay fields used to set up a pipelock secondary.
> The primary select field is shared with port sync.
>
> Bspec: 73521, 69965
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_regs.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index f213bdffcc8d..05477fb4885f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -2558,6 +2558,12 @@ enum skl_power_gate {
>  #define _TRANS_DDI_FUNC_CTL2_DSI0	0x6b404
>  #define _TRANS_DDI_FUNC_CTL2_DSI1	0x6bc04
>  #define TRANS_DDI_FUNC_CTL2(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _TRANS_DDI_FUNC_CTL2_A)
> +#define  GENLOCK_ENABLE				REG_BIT(31)
> +#define  GENLOCK_MODE_MASK			REG_GENMASK(30, 29)
> +#define  GENLOCK_MODE_LOCAL_SECONDARY		REG_FIELD_PREP(GENLOCK_MODE_MASK, 0)
> +#define  PIPELOCK_PER_FRAME_SYNC		REG_BIT(28)
> +#define  TG_START_DELAY_MASK			REG_GENMASK(27, 16)
> +#define  TG_START_DELAY(x)			REG_FIELD_PREP(TG_START_DELAY_MASK, (x))

At some point we had the convention of suffixing the register bits and
fields per platform introduced. See big comment near top of i915_reg.h.

I'm not sure that's the cleanest. But the information was useful while
reading the code. Maybe we should have end of the line comments to the
same effect, similar to the DPCD spec version annotations?

Ville, thoughts?

BR,
Jani.


>  #define  PORT_SYNC_MODE_ENABLE			REG_BIT(4)
>  #define  CMTG_SECONDARY_MODE			REG_BIT(3)
>  #define  PORT_SYNC_MODE_MASTER_SELECT_MASK	REG_GENMASK(2, 0)

-- 
Jani Nikula, Intel
