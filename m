Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B571606A321
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 08:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bJFQgm5c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECCE10E6AE;
	Mon, 23 Nov 2026 08:14:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD58B10E684;
 Mon, 23 Nov 2026 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795421647; x=1826957647;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=w7FVwGcVFrwXsIlJ7ekIX0LM1Tot4i9qZLwIJJBQy7c=;
 b=bJFQgm5cg3UUBxZAcWsUOMX8+QDh9+CvUFaDNj/mNKBqn+4TWS34BrCo
 rh3KtnlPAQ18NaQWxp6rWKvgmDkCA53yohfBZ7fdJJzPto5XK717gS4S/
 owJPTUy7cMFEQs66dB9ewCJVXOI16lrhzxLmeMC61lFsbpgVKQN/WPXpm
 w6bRoynsSEOB0tMCscYGowoRI2bRvi/zllzD/vdodGoxdxx7aKSO0VKgY
 SWSXPf6Sq/HHLKhtAM+671ATjHVFPpzA2MTmS2x3v0J0l9hiSnVT3TqU3
 KW3BV80zXcjBkKVbznc16uQreHK/texgPLwGRYc0j7fa+JSb5ynmdu2gN g==;
X-CSE-ConnectionGUID: nhYmYO4iS52erXCuX4dodw==
X-CSE-MsgGUID: VYphsupOQG+olxjPEFWsBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4106851"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4106851"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:14:07 -0800
X-CSE-ConnectionGUID: hYG084I1Si+Ew+qGjhVLrQ==
X-CSE-MsgGUID: j1tvqu08Qj6KAaZ8kirzMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11445401"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.220])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:14:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: Handle type 0 in mipi_exec_send_packet()
In-Reply-To: <20261122215051.73289-1-johannes.goede@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261122215051.73289-1-johannes.goede@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:14:01 +0200
Message-ID: <235e24d3a8f6c9024f3344f87135557fd811c090@intel.com>
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 22 Nov 2026, Hans de Goede <johannes.goede@oss.qualcomm.com> wrote:
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
>
> Fixes: b84befa31266 ("drm/i915/display: Add default case to mipi_exec_send_packet")
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

The VBTs out there have ceased to surprise me.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

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

-- 
Jani Nikula, Intel
