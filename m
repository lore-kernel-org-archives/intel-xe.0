Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F68F31E41
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 15:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7710910E826;
	Thu,  9 Apr 2026 15:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="aSfB7Bdp";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B567310E822;
 Thu,  9 Apr 2026 15:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1775749256; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iXzyQk271OBRc37waQlN606GYufyvqYDPuQJEerSn58O6DiYV29UP+JtWrOFqV1c8u6wer2K80EUftvrYKFAgUq8PY7r1YezjszQlFcw0v2qNNq09/KGonUCNPt/elA9zLEOM1kCZrw6Ubn4j58y/wT9rgDnLEEntCMIKQb4jos=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1775749256;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=SOzQ0gkJi54dETLF5hhaaWDELmyy/cBorqrzK8wYClA=; 
 b=guG2niL84lbBA6ZI/t9ONtgAzQ83YS97jFEuTDkpjRbaknmUbdq537OwXOIZKY/n12EOq/OpJqI8JilC19SpGftJynZ/pzYKqMWX7BjLC2/vxHc4LpqSjhdpKaaXZQ61AvEb8s6koN4XobughEvsf76HoS4m/rYukCWTT3a7FDU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749256; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=SOzQ0gkJi54dETLF5hhaaWDELmyy/cBorqrzK8wYClA=;
 b=aSfB7BdpsvMSEXjf3+kR9mxFHra4iDSILkBJ6gJuX1KaTAmw/m4lMLr7SBRm+0Ur
 /pBPZ8cBSsj4+83LjgpFHWX0ArpixXxKLLttU2qCgDT+FcNwVihEMH8+ORi1ncoZYEM
 xbbHcsqU9QzO83BcTEAUYkeOd10L5J8cc+Ks4BOs=
Received: by mx.zohomail.com with SMTPS id 1775749254310412.16547037409043;
 Thu, 9 Apr 2026 08:40:54 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: intel-gfx@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v2 0/9] drm/i915/{dp,
 hdmi}: Restructure DP/HDMI sink format handling
Date: Thu, 09 Apr 2026 17:40:50 +0200
Message-ID: <8031984.DvuYhMxLoT@workhorse>
In-Reply-To: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
References: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
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

On Thursday, 9 April 2026 12:15:30 Central European Summer Time Ville Syrja=
la wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Restructure the DP/HDMI sink format handling. I got inspired to do this
> by https://lore.kernel.org/dri-devel/20260324-color-format-v11-8-605559af=
4fb4@collabora.com/
>=20
> I envision that after this the aforementioned patch could just
> become something like this:
>=20
> 1. s/intel_foo_compute_formats/intel_foo_compute_formats_auto/
> 2. Add a new intel_foo_compute_formats()
>=20
>    intel_foo_compute_formats()
>    {
>         switch (color_format) {
>         case YCBCR420:
>                 return intel_foo_compute_output_format(YCBCR420);
>         case RGB:
>                 return intel_foo_compute_output_format(RGB);
>         case AUTO:
>                 return intel_foo_compute_formats_auto();
>         }
>    }
>=20
> v2: A few more updates to the DP mode validation
>=20
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>=20
> Ville Syrj=C3=A4l=C3=A4 (9):
>   drm/i915/hdmi: Add missing intel_pfit_mode_valid() for 4:2:0 also
>     modes
>   drm/i915/hdmi: Restructure the sink/output format selection
>   drm/i915/hdmi: Restructure 4:2:0 vs. 4:4:4 mode validation
>   drm/i915/dp: Restructure the sink/output format selection
>   drm/i915/dp: Validate "4:2:0 also" modes twice
>   drm/i915/dp: Require a HDMI sink for YCbCr output via PCON
>   drm/i915/dp: Validate sink format in .mode_valid()
>   drm/i915/hdmi: Make the RGB fallback for "4:2:0 only" modes the last
>     resort
>   drm/i915/dp: Make the RGB fallback for "4:2:0 only" modes the last
>     resort
>=20
>  drivers/gpu/drm/i915/display/intel_dp.c   | 250 +++++++++++++---------
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 167 +++++++++------
>  2 files changed, 254 insertions(+), 163 deletions(-)
>=20
>=20

=46or the whole series:

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Tested both DisplayPort and HDMI on an N97 board, exercising various
output formats.


