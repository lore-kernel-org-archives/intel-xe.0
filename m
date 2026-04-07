Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCBAEDB7C4
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 07:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5614D10E33D;
	Tue,  7 Apr 2026 07:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="jdgZBIAT";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906E510E33B;
 Tue,  7 Apr 2026 07:14:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1775546063; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=isMW04Tx464LH3+9W3wlBFEL4bGEk/L1W9NdAsaeuBF7uo6lOax+h9+6JmeEqCr5Gl4vGUPjYo79STsXRhtppPhcKMiA+KuZAhcs13K0t+pqmYDpCl0jkFYv0dt9mXnuHyowDIfbLhx7brA5ZxCjPcxP+mk6LaIckJrbAogLwV0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1775546063;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IiyN9b4mE5iZ2WpYFKzjCClpfGNBjTaWwGVJ6+517vk=; 
 b=VvkVgs2hfrS28N2OOSU36XkYHBCiOZP9/yIpCWUWz9m0z4QGlRUh8r2bBZUPTBWQaQ5fBBeEB08bRJEwxbzoBaDNc9a2SDhAh3UsRZCmeEYOpBNShGR+aoWxwSDagxTH0KNeHDVaw2sXDq61sZg14qWWslJxHnJCFZrdL+HEdnc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775546063; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=IiyN9b4mE5iZ2WpYFKzjCClpfGNBjTaWwGVJ6+517vk=;
 b=jdgZBIATLuAo9nlUteUXQ+vOq1wdTtKGfhSHna6hdXjFjfB5H7bYa4T6LiuIzoRe
 QO/0o+5UkI7ZChyssml4DFxLXqDQxbtfrUxsq7Ex5dTf21UBpi4/DTPlXjVxkKuxB0d
 Dbn9SlKJt1r/sArFY5Q1KkFQ7XCWilhRn+9oJ3Ko=
Received: by mx.zohomail.com with SMTPS id 1775546062465680.1301018681039;
 Tue, 7 Apr 2026 00:14:22 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: intel-gfx@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/9] drm/i915/hdmi: Restructure the sink/output format
 selection
Date: Tue, 07 Apr 2026 09:14:18 +0200
Message-ID: <12869026.O9o76ZdvQC@workhorse>
In-Reply-To: <61997692-afe2-4d6d-88f8-ce251e51beaf@intel.com>
References: <20260330235339.29479-1-ville.syrjala@linux.intel.com>
 <2868694.iZASKD2KPV@workhorse>
 <61997692-afe2-4d6d-88f8-ce251e51beaf@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

On Monday, 6 April 2026 07:26:04 Central European Summer Time Nautiyal, Ank=
it K wrote:
> On 3/31/2026 5:42 PM, Nicolas Frattaroli wrote:
> > On Tuesday, 31 March 2026 01:53:32 Central European Summer Time Ville S=
yrjala wrote:
> >> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >>
> >> intel_hdmi_compute_output_format() is a bit of a mess. Try to
> >> restructure it into a more readable form.
> >>
> >> Right now we basically have two main code paths:
> >> - YCbCr 4:2:0 only modes
> >> - everything else including YCbCr 4:2:0 also modes
> >>
> >> Those two basically do the same two steps (try 4:2:0 and try 4:4:4)
> >> but in opposite orders. Let's write that out in a more explicit
> >> if-else form. And since I'm running out of function names I'll
> >> rename the function with that high level logic into
> >> intel_hdmi_compute_formats() and it will call (the new) with
> >> intel_hdmi_compute_output_format() with an explicit sink_format
> >> as needed.
> >>
> >> Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> >> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/display/intel_hdmi.c | 112 ++++++++++++++------=
=2D-
> >>   1 file changed, 70 insertions(+), 42 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/d=
rm/i915/display/intel_hdmi.c
> >> index 072b0554cc24..16873fc7bcb9 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> >> @@ -2021,6 +2021,30 @@ intel_hdmi_mode_clock_valid(struct drm_connecto=
r *_connector, int clock,
> >>   	return status;
> >>   }
> >>  =20
> >> +static enum drm_mode_status
> >> +intel_hdmi_sink_format_valid(struct intel_connector *connector,
> >> +			     const struct drm_display_mode *mode,
> >> +			     bool has_hdmi_sink,
> >> +			     enum intel_output_format sink_format)
> >> +{
> >> +	const struct drm_display_info *info =3D &connector->base.display_inf=
o;
> >> +
> >> +	switch (sink_format) {
> >> +	case INTEL_OUTPUT_FORMAT_YCBCR420:
> >> +		if (!has_hdmi_sink ||
> >> +		    !connector->base.ycbcr_420_allowed ||
> >> +		    !drm_mode_is_420(info, mode))
> >> +			return MODE_NO_420;
> >> +
> >> +		return MODE_OK;
> >> +	case INTEL_OUTPUT_FORMAT_RGB:
> >> +		return MODE_OK;
> >> +	default:
> >> +		MISSING_CASE(sink_format);
> >> +		return MODE_BAD;
> >> +	}
> >> +}
> > I think this here is missing INTEL_OUTPUT_FORMAT_YCBCR444 as a case.
> > The following diff adding it for both intel_hdmi_sink_format_valid
> > and intel_hdmi_sink_bpc_possible that I quickly whipped up may be the
> > way to go, but I'm unsure about the interaction between the two:
>=20
> Hmm.. Trying YCBCR444 format, is not yet implemented.
>=20
> We need to have a well defined policy as to when to use YCBCR444, and=20
> that should be in the newly created intel_hdmi_compute_formats(),=20
> perhaps it should be after we have tried and failed with RGB444.
>=20
> (Although I am not sure in what case compute for RGB 444 will fail and=20
> pass for YCBCR444).
>=20
> However,this should be a separate patch/series.

Makes sense. Instead of defining this policy for automatic selection,
I'll add the necessary code to handle it in my color format series,
where such an output format can be explicitly requested through a DRM
property. I don't think using it as a fallback in automatic selection
makes any sense: it saves no bandwidth over RGB444 and I'm pretty sure
HDMI mandates that anything supported in YCBCR444 is also supported in
RGB444.

Kind regards,
Nicolas Frattaroli

>=20
>=20
> Regards,
>=20
> Ankit
>=20
>=20
> > [... snip ...]


