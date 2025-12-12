Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F24CD5B840
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 15:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B1C10E606;
	Mon, 15 Dec 2025 15:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="Mz7z41gV";
	dkim-atps=neutral
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E476210E92A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1765563915; x=1765823115;
 bh=81lZ9AJhVuXTcVwub06bRA2fhpUQeVRjqZRon6G/4p8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Mz7z41gVkBF0viIbbzW/hJjc7zOTxxQRByJd5r3mGtgScGMdZiDbty/EiDofibxiN
 xYeZ/Hv8qdf1b80N+MC1fnVSWBCTCftlfkYt4b5ETwgcAa0ZzUf4lDZ0I+TZwmUvyV
 RPD8C8YJvl4bSwIzlATCO5PZWxYnh+ihj/7e5huohOSSXQerUr6qZNKxJq7GSx8usq
 neyc6bHxx+NOTQEX82U9LI3jklvu79o7vblsOENttcB9WyR7zQ2+jhpnbAe70zNdKq
 3JhZunyln7+6Po4HgmlTkUtDbc0sv148H8dkSI8IlVJMAAlKC2CsVIg55IPFN6qI9w
 CJ8PZqLCQ7L8A==
Date: Fri, 12 Dec 2025 18:25:09 +0000
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 pekka.paalanen@collabora.com, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, swati2.sharma@intel.com,
 alex.hung@amd.com, jani.nikula@intel.com, suraj.kandpal@intel.com
Subject: Re: [v8 14/15] drm/i915/color: Add 3D LUT to color pipeline
Message-ID: <k4mMdQv6X-RIzc4veUD5pP2oD1KGp1Tx6ifJM6S8W3nrowRPz275vsfcNUHeflvxZaISPaM_e861Q-1rO1jnV8bNNmOdPJ3tyS3GVbnpbao=@emersion.fr>
In-Reply-To: <f24364ad-a861-4fcd-93ab-3230a6b3299b@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
 <20251203085211.3663374-15-uma.shankar@intel.com>
 <aTwwBMKUp5AYmFTN@intel.com> <f24364ad-a861-4fcd-93ab-3230a6b3299b@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 87980b23961ea0d05cce49096a84bcfd60ed80d3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 15 Dec 2025 15:30:56 +0000
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

On Friday, December 12th, 2025 at 18:47, Borah, Chaitanya Kumar <chaitanya.=
kumar.borah@intel.com> wrote:

> > > +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
> > > + const struct intel_plane_state *plane_state)
> > > +{
> > > + struct intel_display *display =3D to_intel_display(plane_state);
> > > + struct intel_crtc *crtc =3D to_intel_crtc(plane_state->uapi.crtc);
> > > +
> > > + if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
> > > + glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
> > > ^^^^^^^^^^^^
> >=20
> > And this looks like a pretty major fail. Why is the 3D LUT stored in
> > the plane state when it's a pipe level thing?
>=20
> With DISPLAY_VER(display) >=3D 35, 3DLUT can be attached to a plane.
>=20
> (Bits[23:22] in 3DLUT_CTL). This is the only way we are exposing the HW
> to the userspace right now (through the new plane color pipeline uapi).
> Therefore, it lies in the plane state.
>=20
> However, there are (soonish)plans to adopt the color pipeline for crtcs
> too. Once that happens, it needs to be handled a bit more carefully. A
> potential approach is to allow userspace to program the block with a
> first come first served semantics and fail the commit if it tries to set
> 3DLUT both on plane and crtc in the same commit.

The plane 3D LUT must only be used before blending. Any pipe-level
post-blending 3D LUT hardware block is not suitable to implement plane
colorops.
