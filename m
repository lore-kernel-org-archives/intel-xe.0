Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43CBC88E75
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 03:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4E110E253;
	Wed, 16 Sep 2026 03:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bn7BuQu+";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E7910E1A5;
 Wed, 16 Sep 2026 03:02:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 17F0F43EB6;
 Wed, 16 Sep 2026 03:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C271F000FF;
 Wed, 16 Sep 2026 03:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789527754;
 bh=OrN+bhgIyqzDL/lVVV+SBqZR5fQsJCFk1xqE5zvpZ4w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Bn7BuQu+hZGzdG0MlDc6kXTG+2XD8H7Zy3/Egtv9v2NBKYjYpANJ2F9eiFfwAdXEJ
 N/JVlCcvh3KPdPVZ4dxDN/8zKxTxniN40Q5JS161MqSJe16J/hyyBesC5q6uDZikeD
 G6rUoY6d9h1DOuKR5t3Borm1OvSkfh87ckMg2KE7hEbXB0HUOffvmtHCX1T+ImU3EU
 ZXJcbJEnTYHRgrMTSjK34z20PNCMfw2Dj8qwAaa9JAI2DSOQmUhy+XTb8cY/asutEf
 N6EIBWOGJkf2IzWWktp8SYh3rfFaGeIqGKyFjh5XQeXo/HAFbDPCt8+07fCEgSy+Ib
 6ouNkCuZL3e7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/10] drm/i915/display: Add bits for link_n_extended
 for DISPLAY >= 14
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260916025710.432281-6-suraj.kandpal@intel.com>
References: <20260916025710.432281-1-suraj.kandpal@intel.com>
 <20260916025710.432281-6-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 03:02:33 +0000
Message-Id: <20260916030233.B4C271F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915: Redundant DISPLAY_VER split despite commit message cla=
im
--

commit 42050e03ecee4bb8780c62f3acc4e0b55c85e966
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/display: Add bits for link_n_extended for DISPLAY >=3D 14

LINK_N register has bits 31:24 for extended link N value used for
HDMI2.1 and for an alternate mode of operation of DP TG DDA. This commit
adds the definition for these extra bits and masks the software link_n
value down to the low 24 bits in intel_set_m_n().

>     v5: Drop the now redundant DISPLAY_VER split, the two masks were
>         identical.

[Severity: Medium]
Is this description accurate? The commit message states the redundant
DISPLAY_VER split was dropped, but it appears to still be present in both
intel_set_m_n() and intel_get_m_n().

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index c53163d7c082e..6d2025e109956 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2711,14 +2711,22 @@ void intel_set_m_n(struct intel_display *display,
>  		   intel_reg_t data_m_reg, intel_reg_t data_n_reg,
>  		   intel_reg_t link_m_reg, intel_reg_t link_n_reg)
>  {
> +	u32 link_n =3D m_n->link_n;
> +
>  	intel_de_write(display, data_m_reg, TU_SIZE(m_n->tu) | m_n->data_m);
>  	intel_de_write(display, data_n_reg, m_n->data_n);
>  	intel_de_write(display, link_m_reg, m_n->link_m);
> +
> +	if (DISPLAY_VER(display) >=3D 14)
> +		link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;
> +	else
> +		link_n &=3D DATA_LINK_M_N_MASK;

[Severity: Medium]
Since ~PIPE_LINK_N1_EXTENDED_MASK and DATA_LINK_M_N_MASK both apply a
0x00FFFFFF mask, does this redundant if/else block in intel_set_m_n()
need to be removed to match the commit message?

> +
>  	/*
>  	 * On BDW+ writing LINK_N arms the double buffered update
>  	 * of all the M/N registers, so it must be written last.
>  	 */
> -	intel_de_write(display, link_n_reg, m_n->link_n);
> +	intel_de_write(display, link_n_reg, link_n);
>  }
> =20
[ ... ]
> @@ -3475,7 +3483,13 @@ void intel_get_m_n(struct intel_display *display,
>  		   intel_reg_t link_m_reg, intel_reg_t link_n_reg)
>  {
>  	m_n->link_m =3D intel_de_read(display, link_m_reg) & DATA_LINK_M_N_MASK;
> -	m_n->link_n =3D intel_de_read(display, link_n_reg) & DATA_LINK_M_N_MASK;
> +	m_n->link_n =3D intel_de_read(display, link_n_reg);
> +
> +	if (DISPLAY_VER(display) >=3D 14)
> +		m_n->link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;
> +	else
> +		m_n->link_n &=3D DATA_LINK_M_N_MASK;

[Severity: Medium]
Similarly, does this split in intel_get_m_n() also need to be removed?

> +
>  	m_n->data_m =3D intel_de_read(display, data_m_reg) & DATA_LINK_M_N_MASK;
>  	m_n->data_n =3D intel_de_read(display, data_n_reg) & DATA_LINK_M_N_MASK;
>  	m_n->tu =3D REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display, data_m_r=
eg)) + 1;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916025710.4322=
81-1-suraj.kandpal@intel.com?part=3D5
