Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2719CA5FAC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 12:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B418610E814;
	Wed, 30 Sep 2026 12:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hBsM+EqE";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FF910E814;
 Wed, 30 Sep 2026 12:01:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 89FD960239;
 Wed, 30 Sep 2026 12:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C581F000FF;
 Wed, 30 Sep 2026 12:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790769697;
 bh=mBFFoJhMR/+bLMr+sn9ripYTS4W4xAdM7E4NOT6S99I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hBsM+EqEIaSbS65wWu+Dg0vy5n1sx8Nh0CWrOvnfyFTKAz/Bc5TfzioL1pMHWt/Ir
 2Loy5ndEXgRIEI5GCOAoUds/Ieg/3mhBg4ZT+8Urct0IuCTCWLfRsv7l80P716S/B6
 q36uN04cjx4zsv/5N3O7lxZVCB1BzXE6FhBbTtNXItHbUgRYIqagf98bu7wnv3slaZ
 iCDYEVSNYV9AxNMVWyeWDhIMJuCqugSq9yFvEC3h+NT0+W5rtpy8LhE83iHY/6ufbt
 +AiX7B9vU4NojdidQtv987WqUUePWaDKiLlBdpSpGsLfg0X+Z7UjwpOxv5vrEY69jT
 JtTZbPsj0ANWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/i915/de: Nuke intel_de_{read,write}_notrace()
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260930115303.24285-3-ville.syrjala@linux.intel.com>
References: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
 <20260930115303.24285-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 12:01:36 +0000
Message-Id: <20260930120137.13C581F000FF@smtp.kernel.org>
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
- [Low] drm/i915: unused intel_uncore_write_notrace generator leftover
--

commit 63a0967a4211723ada8b8d7082bed7b2f369c08a
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/de: Nuke intel_de_{read,write}_notrace()

The commit removes the unused intel_de_read_notrace() and=20
intel_de_write_notrace() accessors, along with their xe compat wrappers. Th=
is=20
reduces the number of register access functions to clean up the code betwee=
n=20
i915 and xe.

> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index 8144588d3cf77..4ae041a96b31a 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -164,18 +164,6 @@ intel_de_posting_read_fw(struct intel_display *displ=
ay, intel_reg_t reg)
>  	intel_de_read_fw(display, reg);
>  }
> =20
> -static inline u32
> -intel_de_read_notrace(struct intel_display *display, intel_reg_t reg)
> -{
> -	return intel_uncore_read_notrace(__to_uncore(display), reg);
> -}
> -
> -static inline void
> -intel_de_write_notrace(struct intel_display *display, intel_reg_t reg, u=
32 val)
> -{
> -	intel_uncore_write_notrace(__to_uncore(display), reg, val);
> -}

[Severity: Low]
With the removal of intel_de_write_notrace(), it looks like
intel_uncore_write_notrace() is now unused. Should the macro expansion that
generates it in i915 be removed as well to complete the cleanup?

drivers/gpu/drm/i915/intel_uncore.h:
__uncore_write(write_notrace, 32, l, false)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930115303.2428=
5-1-ville.syrjala@linux.intel.com?part=3D3
