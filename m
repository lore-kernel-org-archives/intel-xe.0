Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A15606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rr5ibvDw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AFD11257C;
	Thu, 22 Oct 2026 12:31:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6026611257C;
 Thu, 22 Oct 2026 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792672283; x=1824208283;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tLvV5/ERMt+eQR+efaGmmP+87VaCKZlhMPjpiEKyPfA=;
 b=Rr5ibvDwAcApINeg1gUQEHtGrrYXeNbEg/urMNmTjFvUu4MbSsqIzWq0
 kWGi2IOQftBbbNfkBbe2Qt9bzUiYtxoxCSzF7JtBkxd7WvjGJRJ6I86MI
 U2IHAhrk4T8ZWI/d9zgFtyBqgwCDPFHh26ELqUemzLV6QHvYj0FeYdnjl
 F7U8TMtYWyoYI2kSmKujjZHGgxH9hmWY+DJfjOh1736ElvehH1DIEQy60
 XVvhDltGPC9aWNmCKFKgoAiyvYrY0VShKg3V6I/jG6tfP5HrknMotTC5E
 uGGYxfQzLkuaRlehIAsWj/YFOot9vdFe48nTvE/OhUCtmKL5kg5pi88c1 Q==;
X-CSE-ConnectionGUID: X5beNAJNQ7iHkLLt0lhr9A==
X-CSE-MsgGUID: r8ct2KKgRAeWliUuLbhSew==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1305448"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1305448"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:31:22 -0700
X-CSE-ConnectionGUID: /synAoI6RbSQEmIsBtumgw==
X-CSE-MsgGUID: XTx2K88kSpGRd6GhUdzq2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3742358"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.5])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:31:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/i915: Use intel_de_{read, write})fw() in
 VLV/CHV irq handlers
In-Reply-To: <20261022115548.32678-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
 <20261022115548.32678-4-ville.syrjala@linux.intel.com>
Date: Thu, 22 Oct 2026 15:31:17 +0300
Message-ID: <ec5542fe2c281219ff4c63bb5fd1bed9775a0d36@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 22 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> MMIO is rather expensive on VLV and CHV. MMIO read in particular
> seems to take around 450 ns on CHV. VLV is a bit better
> in the 200-300 ns range. The use of the non-fw() register
> accessors means that each actual register access is bracketed
> by two CLAIM_ER reads. I'm thinking we don't want that extra
> cost in the irq handlers, so switch over to the fw() accessors.
>
> On VLV/CHV this also means we lose the uncore.lock protection
> around the MMIO accesses, but that is fine as these platforms
> do not need any serialization of parallel MMIO accesses.
>
> This actually changes all GMCH platofors since the irq

*platforms

> handlers are shared between the platforms. But that doesn't
> actually cause significant functional changes on the older
> platforms as the non-fw() accessors are identical to the fw()
> versions, apart from some rpm asserts.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Subject needs one s/)/_/

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  .../gpu/drm/i915/display/intel_display_irq.c  | 32 +++++++++----------
>  .../gpu/drm/i915/display/intel_hotplug_irq.c  |  8 ++---
>  2 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/g=
pu/drm/i915/display/intel_display_irq.c
> index d2d45767bfd2..25b899990475 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> @@ -501,19 +501,19 @@ static void i9xx_pipe_crc_irq_handler(struct intel_=
display *display,
>  	u32 res1, res2;
>=20=20
>  	if (DISPLAY_VER(display) >=3D 3)
> -		res1 =3D intel_de_read(display, PIPE_CRC_RES_RES1_I915(display, pipe));
> +		res1 =3D intel_de_read_fw(display, PIPE_CRC_RES_RES1_I915(display, pip=
e));
>  	else
>  		res1 =3D 0;
>=20=20
>  	if (DISPLAY_VER(display) >=3D 5 || display->platform.g4x)
> -		res2 =3D intel_de_read(display, PIPE_CRC_RES_RES2_G4X(display, pipe));
> +		res2 =3D intel_de_read_fw(display, PIPE_CRC_RES_RES2_G4X(display, pipe=
));
>  	else
>  		res2 =3D 0;
>=20=20
>  	display_pipe_crc_irq_handler(display, pipe,
> -				     intel_de_read(display, PIPE_CRC_RES_RED(display, pipe)),
> -				     intel_de_read(display, PIPE_CRC_RES_GREEN(display, pipe)),
> -				     intel_de_read(display, PIPE_CRC_RES_BLUE(display, pipe)),
> +				     intel_de_read_fw(display, PIPE_CRC_RES_RED(display, pipe)),
> +				     intel_de_read_fw(display, PIPE_CRC_RES_GREEN(display, pipe)),
> +				     intel_de_read_fw(display, PIPE_CRC_RES_BLUE(display, pipe)),
>  				     res1, res2);
>  }
>=20=20
> @@ -577,7 +577,7 @@ static void i9xx_pipestat_irq_ack(struct intel_displa=
y *display,
>  			continue;
>=20=20
>  		reg =3D PIPESTAT(display, pipe);
> -		pipe_stats[pipe] =3D intel_de_read(display, reg) & status_mask;
> +		pipe_stats[pipe] =3D intel_de_read_fw(display, reg) & status_mask;
>  		enable_mask =3D i915_pipestat_enable_mask(display, pipe);
>=20=20
>  		/*
> @@ -590,8 +590,8 @@ static void i9xx_pipestat_irq_ack(struct intel_displa=
y *display,
>  		 * an interrupt is still pending.
>  		 */
>  		if (pipe_stats[pipe]) {
> -			intel_de_write(display, reg, pipe_stats[pipe]);
> -			intel_de_write(display, reg, enable_mask);
> +			intel_de_write_fw(display, reg, pipe_stats[pipe]);
> +			intel_de_write_fw(display, reg, enable_mask);
>  		}
>  	}
>  	spin_unlock(&display->irq.lock);
> @@ -1893,7 +1893,7 @@ static void vlv_page_table_error_irq_ack(struct int=
el_display *display, u32 *dpi
>  {
>  	u32 status, enable, tmp;
>=20=20
> -	tmp =3D intel_de_read(display, DPINVGTT);
> +	tmp =3D intel_de_read_fw(display, DPINVGTT);
>=20=20
>  	enable =3D tmp >> 16;
>  	status =3D tmp & 0xffff;
> @@ -1909,8 +1909,8 @@ static void vlv_page_table_error_irq_ack(struct int=
el_display *display, u32 *dpi
>  	enable &=3D ~status;
>=20=20
>  	/* customary ack+disable then re-enable to guarantee an edge */
> -	intel_de_write(display, DPINVGTT, status);
> -	intel_de_write(display, DPINVGTT, enable << 16);
> +	intel_de_write_fw(display, DPINVGTT, status);
> +	intel_de_write_fw(display, DPINVGTT, enable << 16);
>  }
>=20=20
>  static void vlv_page_table_error_irq_handler(struct intel_display *displ=
ay, u32 dpinvgtt)
> @@ -1932,21 +1932,21 @@ static void vlv_display_error_irq_ack(struct inte=
l_display *display,
>  {
>  	u32 emr;
>=20=20
> -	*eir =3D intel_de_read(display, VLV_EIR);
> +	*eir =3D intel_de_read_fw(display, VLV_EIR);
>=20=20
>  	if (*eir & VLV_ERROR_PAGE_TABLE)
>  		vlv_page_table_error_irq_ack(display, dpinvgtt);
>=20=20
> -	intel_de_write(display, VLV_EIR, *eir);
> +	intel_de_write_fw(display, VLV_EIR, *eir);
>=20=20
>  	/*
>  	 * Toggle all EMR bits to make sure we get an edge
>  	 * in the ISR master error bit if we don't clear
>  	 * all the EIR bits.
>  	 */
> -	emr =3D intel_de_read(display, VLV_EMR);
> -	intel_de_write(display, VLV_EMR, 0xffffffff);
> -	intel_de_write(display, VLV_EMR, emr);
> +	emr =3D intel_de_read_fw(display, VLV_EMR);
> +	intel_de_write_fw(display, VLV_EMR, 0xffffffff);
> +	intel_de_write_fw(display, VLV_EMR, emr);
>  }
>=20=20
>  static void vlv_display_error_irq_handler(struct intel_display *display,
> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c b/drivers/g=
pu/drm/i915/display/intel_hotplug_irq.c
> index 913fcd2a1723..ce0c8f56106a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
> @@ -439,15 +439,15 @@ u32 i9xx_hpd_irq_ack(struct intel_display *display)
>  	 * bits can itself generate a new hotplug interrupt :(
>  	 */
>  	for (i =3D 0; i < 10; i++) {
> -		u32 tmp =3D intel_de_read(display,
> -					PORT_HOTPLUG_STAT(display)) & hotplug_status_mask;
> +		u32 tmp =3D intel_de_read_fw(display,
> +					   PORT_HOTPLUG_STAT(display)) & hotplug_status_mask;
>=20=20
>  		if (tmp =3D=3D 0)
>  			return hotplug_status;
>=20=20
>  		hotplug_status |=3D tmp;
> -		intel_de_write(display, PORT_HOTPLUG_STAT(display),
> -			       hotplug_status);
> +		intel_de_write_fw(display, PORT_HOTPLUG_STAT(display),
> +				  hotplug_status);
>  	}
>=20=20
>  	drm_WARN_ONCE(display->drm, 1,

--=20
Jani Nikula, Intel
