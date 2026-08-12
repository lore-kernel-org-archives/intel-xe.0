Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168B5C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D072310F0B7;
	Wed, 12 Aug 2026 17:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Po1YtSDv";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18A910EF58;
 Wed, 12 Aug 2026 10:15:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 53E0F406FC;
 Wed, 12 Aug 2026 10:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE491F000E9;
 Wed, 12 Aug 2026 10:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786529759;
 bh=vkRLcXnVuMhVDZKH1ZqfIQ9iJC7YJbehr0LTA0vFh+M=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Po1YtSDviQLs7eL/UE32S+0zegQ+JN3P8NnbMCd40K4+ZmE6FKEy+p82pTn1zJXOo
 IU+6WIhvRXzL1rpe9RMJMesXdiabvihYoaaZCB0XGDRDqAwjZxEut2Yi04QaRqIsud
 fhp13b3GDOhRINCts7xE69K34qoWvC20Ir8FYNqD1hqGIhpSreh0wN5XYHguWUi5Ks
 1s/Kjqc3IqWD+BzKQZGcr8ydjKpA/Yo7sg9gbAE1I6mzl8PUnMdDTt8KYJbf35Kwc0
 EtSVTM7uHKVZzgM7NMKmEgRHUaUbUbz123Z5Cu1gvTOfijmu5EGujrdB9f7IvPPKLt
 Bmyj/u3NG5tKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
 disable
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260812094547.1808459-1-nemesa.garg@intel.com>
References: <20260812094547.1808459-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 10:15:58 +0000
Message-Id: <20260812101558.DBE491F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:21 +0000
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

Pre-existing issues:
- [High] The fix for orphaned selective fetch enable bits is incomplete, mi=
ssing the identical flaw in the cursor plane disable logic (`i9xx_cursor_di=
sable_sel_fetch_arm()`).
--

--- Patch [1]: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane=
 disable ---
commit e0077c037f1d1d0137a05dcfc36800e4add084cd
Author: Nemesa Garg <nemesa.garg@intel.com>
drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable

This commit fixes an issue where disabling a plane after selective fetch
was turned off would leave the SEL_FETCH_PLANE_CTL enable bit set in
hardware. It changes the early return condition to check for hardware
support rather than the current state.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8739

> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index 07a6832933521..afc1df1b84a4a 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -885,7 +885,13 @@ static void icl_plane_disable_sel_fetch_arm(struct i=
ntel_dsb *dsb,
>  	struct intel_display *display =3D to_intel_display(plane);
>  	enum pipe pipe =3D plane->pipe;
> =20
> -	if (!crtc_state->enable_psr2_sel_fetch)
> +	/*
> +	 * Clear this whenever the hardware has selective fetch, not just when
> +	 * the current state uses it. The plane may have been enabled with
> +	 * selective fetch earlier and had its enable bit orphaned when the
> +	 * feature was switched off.
> +	 */
> +	if (!HAS_PSR2_SEL_FETCH(display))
>  		return;
> =20
>  	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe, plane->id), =
0);

[Severity: High]
This is a pre-existing issue, but does this fix need to be applied to the
cursor plane logic as well?=20

Looking at drivers/gpu/drm/i915/display/intel_cursor.c, the function
i9xx_cursor_disable_sel_fetch_arm() still uses the old state-based early
return:

	if (!crtc_state->enable_psr2_sel_fetch)
		return;

	intel_de_write_dsb(display, dsb, SEL_FETCH_CUR_CTL(pipe), 0);

If selective fetch is dynamically disabled while a cursor plane is active,
and then the cursor is disabled, this early return will leave the
SEL_FETCH_CUR_CTL bit set in hardware.=20

If selective fetch is later re-enabled, could the hardware mistakenly resume
fetching for the disabled cursor and keep its old Display Data Buffer range
reserved, potentially starving other planes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812094547.1808=
459-1-nemesa.garg@intel.com?part=3D1
