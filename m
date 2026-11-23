Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D028606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gAvq1jId
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF80A89CCE;
	Mon, 23 Nov 2026 08:43:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29C389CCE;
 Mon, 23 Nov 2026 08:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795423418; x=1826959418;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rVcmT/gRBv6HJ+rwPcCMOvyFrUm3MmFK0P2qiZdOZyw=;
 b=gAvq1jIdEPP21VL+xnttl10TA0D3kmX7eXzTs3StkZRi4Fv8OnJJsUih
 jF/NlcoCdydpcqpK1PtK1i865+VQpHnF4+XLJRv6lEEjz1gLydxuY6vKx
 Ztw7ZwsyD8u+IoeLJzAn8OfrOX30P3VVOS9vrcmkEc7TD8wh6p60LpU21
 EudWd3Q7A9EHt1jH1iJN9zV/Z57NTlfVS5fUkgKNNnr74WndbCpD1XhlU
 eCMlflBCcc7Qx/BhztY1obeUhQTm9LmSlVlB2n8O8H6U5RateZ0Xf2awS
 mTgHq/6QuIHYWf5qYF57m1dTDORkx6dgUGowfncIXqnZWZLy6fzfa6ZKC g==;
X-CSE-ConnectionGUID: yjFSfpv+Q4y/GiqTSwPSyA==
X-CSE-MsgGUID: VBASQimNTZyNTF7C2hACDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4197764"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4197764"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:43:38 -0800
X-CSE-ConnectionGUID: irIq2m9BQLilnLYqFQhbrQ==
X-CSE-MsgGUID: CQtJ9k3sRL20GtLxgyb44w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11228640"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.170])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:43:36 -0800
Date: Mon, 23 Nov 2026 10:43:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: Handle type 0 in mipi_exec_send_packet()
Message-ID: <awP8tOd5z_z7sg6N@intel.com>
References: <20261122215051.73289-1-johannes.goede@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261122215051.73289-1-johannes.goede@oss.qualcomm.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Sun, Nov 22, 2026 at 10:50:51PM +0100, Hans de Goede wrote:
> Some devices, like e.g. the MPMan Converter9 tablet have some
> MIPI_SEQ_ELEM_SEND_PKT in their VBT DSI init sequences table with a type
> of 0. The table for Processor-to-Peripheral commands in the MIPI DSI spec
> does not list such a type.
> 
> This leads to the following error getting logged:
> 
> i915 0000:00:02.0: [drm] *ERROR* DSI send packet failed with -EINVAL
> 
> With no ill effects since errors are ignored.
> 
> Presumably the intended behavior here is for this to be a no-op like
> MIPI_DCS_NOP which is defined as 0; and the display works fine including
> powering it off / on.
> 
> At handling for a MIPI_SEQ_ELEM_SEND_PKT sequence with a type of 0 and
> treat this as a nop to silence the error.

Please file the usual bug with the VBT attached.

> 
> Fixes: b84befa31266 ("drm/i915/display: Add default case to mipi_exec_send_packet")
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index fe12041e913c..423be33443c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -142,6 +142,9 @@ static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
>  		    hs_mode ? "HS" : "LP", type, len, (int)len, data);
>  
>  	switch (type) {
> +	case 0: /* Not in MIPI DSI specification, presumably nop like MIPI_DCS_NOP */
> +		ret = 0;
> +		break;
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
>  		ret = mipi_dsi_generic_write(dsi_device, NULL, 0);
>  		break;
> -- 
> 2.56.0

-- 
Ville Syrjälä
Intel
