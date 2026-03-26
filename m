Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669B810A1E7C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 11:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C38510E964;
	Thu, 26 Mar 2026 11:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPnUjca2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB1010E94E;
 Thu, 26 Mar 2026 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774524761; x=1806060761;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=gV9JinzFyRhPjMEsNyBeRFiqzZDOxcF3gIO/WuzVN64=;
 b=QPnUjca2lvbbYat2+ShpTlba8iiIZvv4AJbEMxnmN7JoKNHswelnJ4Xq
 zAMzu0wtQCnD9bH7I36qUEjtu3Ip1FpoaDUXKetL3+jSObt00rTEo6vCw
 wFm7MXKCjUjxTygZqgQlfDtzXWEtQw8/KdfFzFXUqtEFc63htd9JxPb4M
 xjc1TsafTanP0mhoJ4tN6/nTae5GKuUlQddivGzte0zC2Z0w41j7Zu8bB
 fHaUb1xGtpHsnB9A9Ota+QY6DkcRiHw/kwAiaxvD1VCdlbWBfo9A27jHi
 Rj/CubiXSZRjoNfZlPpINF9h/gAE6dMFNJjlG1/sN4J+5vRNPV5jKsqIn Q==;
X-CSE-ConnectionGUID: is2Ybx+vSx6qDmtC9QAdyA==
X-CSE-MsgGUID: yUIT8CpSRa2W+75GI/hn9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74606882"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="74606882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:32:41 -0700
X-CSE-ConnectionGUID: iPw34rOyRoe0c3OGC37akw==
X-CSE-MsgGUID: d7VwWdy3Rn+5BJfI0Cdgvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224044004"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:32:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 07/12] drm/i915/de: Add intel_de_read16()
In-Reply-To: <20260325185342.11482-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
 <20260325185342.11482-8-ville.syrjala@linux.intel.com>
Date: Thu, 26 Mar 2026 13:32:35 +0200
Message-ID: <d453f9c5cc08b3e4c96b42a8e4c47c48f19210b8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 25 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> We'll need a replacement for intel_uncore_read16() in order to
> untangle intel_mchbar_read16() from uncore. As with the 8 bit
> counterpart this doesn't need to work on modern platforms
> so we can forgo all the DMC wakelock stuff and whatnot.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 8 ++++++++
>  drivers/gpu/drm/i915/display/intel_de.h | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index d2a418da2d54..a96e83d76eaa 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -176,3 +176,11 @@ void intel_de_write8(struct intel_display *display, =
i915_reg_t reg, u8 val)
>=20=20
>  	intel_uncore_write8(__to_uncore(display), reg, val);
>  }
> +
> +u16 intel_de_read16(struct intel_display *display, i915_reg_t reg)
> +{
> +	/* this is only used on MCHBAR registers on pre-SNB */
> +	drm_WARN_ON(display->drm, DISPLAY_VER(display) >=3D 6);
> +
> +	return intel_uncore_read16(__to_uncore(display), reg);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index f87b84ab9d6d..3f9861b7a589 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -19,6 +19,7 @@ static inline struct intel_uncore *__to_uncore(struct i=
ntel_display *display)
>=20=20
>  u8 intel_de_read8(struct intel_display *display, i915_reg_t reg);
>  void intel_de_write8(struct intel_display *display, i915_reg_t reg, u8 v=
al);
> +u16 intel_de_read16(struct intel_display *display, i915_reg_t reg);
>=20=20
>  static inline u32
>  intel_de_read(struct intel_display *display, i915_reg_t reg)

--=20
Jani Nikula, Intel
