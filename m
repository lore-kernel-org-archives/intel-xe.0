Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32684C636CC
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 07:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D4D10E339;
	Tue, 31 Jan 2023 07:24:14 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1406D10E339
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675149852; x=1706685852;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JRvjn3iYFupMHuOOln2No/QkQOCH++HuZihEC3BwkMI=;
 b=LbibkZuNrNYKDAW34t0SrV/xCm+7qdeYT0Q+jPeOquc3zUyz47n0dqLj
 esByNlj5rXqlPLQ+WZgOH/rdpahMIqPorBLEZDgd5LRG9kFyVt3Yl5R1v
 rB5wk/Oankjn7bFcPuvZ4Mo9iIyICOOVlkFX/MqmzehOhCcPGMYdOzuhw
 Sr04V1vXuBCxa1WbOYA/8Yuzs8BerOJ/lg1T2VEJJxsoBWeBpNadUmpth
 DjMC+B/FvdOueRVJvkUqa1LLHJ9OjU1EDyFIbZXLZWfMOOIV/8ya5xaxZ
 9hGjeaQQUcq/qt11cfkeMyUwFCyf60762ZbodZWAzkPs4MuSyh6xHA2Cm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327790592"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="327790592"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 23:24:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="614339306"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="614339306"
Received: from akryuko1-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.34.35])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 23:24:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230130161723.42602-1-jose.souza@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230130161723.42602-1-jose.souza@intel.com>
Date: Tue, 31 Jan 2023 09:24:06 +0200
Message-ID: <87o7qf2mll.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 30 Jan 2023, Jos=C3=A9 Roberto de Souza <jose.souza@intel.com> wrot=
e:
> i915 has the same fake workaround to return MI_BATCH_BUFFER_START
> nested batch buffer behavior in DG2 and newer platforms to the same
> behavior as older platforms.
>
> So here cleaning up TGL_NESTED_BB_EN in MI_MODE to disable third level
> chained batch buffer level.
>
> v2:
> - replace IP_VERSION_FOREVER by XE_RTP_END_VERSION_UNDEFINED
> - move fake workaround to lrc_additional_programming table
>
> Bspec: 45974, 45718
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c |  1 +
>  drivers/gpu/drm/xe/xe_wa.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.h |  1 +
>  3 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 84a73eeccd297..5d07e1e7bd506 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -311,6 +311,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>=20=20
>  		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
>  		xe_wa_process_lrc(hwe);
> +		xe_wa_process_lrc_additional_programming(hwe);
>=20=20
>  		default_lrc =3D drmm_kzalloc(&xe->drm,
>  					   xe_lrc_size(xe, hwe->class),
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 3325de3edf691..744b7d0982683 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -288,6 +288,21 @@ static const struct xe_rtp_entry lrc_was[] =3D {
>  	{}
>  };
>=20=20
> +static const struct xe_rtp_entry lrc_additional_programming[] =3D {
> +	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),

Please add newline after {, and indent with tabs not spaces.

> +	  /*
> +	   * This is a "fake" workaround defined by software to ensure we
> +	   * maintain reliable, backward-compatible behavior for userspace with
> +	   * regards to how nested MI_BATCH_BUFFER_START commands are handled.
> +	   */
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINE=
D)),
> +	  XE_RTP_CLR(RING_MI_MODE(0),
> +		     TGL_NESTED_BB_EN,
> +		     XE_RTP_FLAG(MASKED_REG, ENGINE_BASE))
> +	},
> +	{}
> +};
> +
>  static const struct xe_rtp_entry register_whitelist[] =3D {
>  	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 140855686=
5"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)=
),
> @@ -362,6 +377,19 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>  	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
>  }
>=20=20
> +/**
> + * xe_wa_process_lrc_additional_programming - process additional LRC pro=
gramming
> + * table
> + * @hwe: engine instance to process workarounds for
> + *
> + * Process additional context programming table for this platform, savin=
g in
> + * @hwe all the registers changes that need to be applied on context res=
tore.
> + */
> +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe)
> +{
> +	xe_rtp_process(lrc_additional_programming, &hwe->reg_lrc, hwe->gt, hwe);
> +}
> +
>  /**
>   * xe_reg_whitelist_process_engine - process table of registers to white=
list
>   * @hwe: engine instance to process whitelist for
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index 1a0659690a320..872f3e4ddc73c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -12,6 +12,7 @@ struct xe_hw_engine;
>  void xe_wa_process_gt(struct xe_gt *gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe);
>=20=20
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>  void xe_reg_whitelist_apply(struct xe_hw_engine *hwe);

--=20
Jani Nikula, Intel Open Source Graphics Center
