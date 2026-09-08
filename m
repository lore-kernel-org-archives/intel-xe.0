Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E43C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 23:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34F210EDEB;
	Tue,  8 Sep 2026 23:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TEt1TPih";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D0A10EDEA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 23:26:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D832043A5F;
 Tue,  8 Sep 2026 23:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910CD1F00A3A;
 Tue,  8 Sep 2026 23:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788909972;
 bh=hYuHFUHSTxVN+aldBrns7Uk0wnBzBBurBMmqfEgFXWE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TEt1TPihC7QNXsvkaNGruhZGRCrx/gIMR/SxruUdc/AMUlROKdO5XPMoEMI7r7lr6
 536yD13yApOGy+vsr9iw7n5h76iSBm/0b5465bz8dTQJASN7AP+dhKET4H0socobB4
 tsh5HtxRxrrpQCp5NLanErhhJI9fqdb0yhQvDnvHL1TwOaKXogELXpxI2svkSlstXA
 ObNwcYW7er32wBL237QIRbOlVvwKrK1fQKW1W+wYbBw77fyG0p0mlA+3zW777XcwV5
 M11+7nsi3mUfBS76gqyTE0qbckwJNXddhefdEJf3RdaxUA41fyyaJYbzkE2sacdev5
 pM0L0yI3SW98g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe/guc: Sanity check GuC-reported hwconfig
 table size
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908231854.1218934-6-umesh.nerlige.ramappa@intel.com>
References: <20260908231854.1218934-4-umesh.nerlige.ramappa@intel.com>
 <20260908231854.1218934-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 23:26:12 +0000
Message-Id: <20260908232612.910CD1F00A3A@smtp.kernel.org>
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
- [High] Integer overflow in hwconfig table parsing can lead to an infinite=
 loop.
--

commit 7ddfaaa1b670c316c0100635679a9a76370d95cf
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
drm/xe/guc: Sanity check GuC-reported hwconfig table size

This patch bounds-checks the hardware configuration table size reported by
the GuC firmware. It enforces a 4K upper limit to prevent allocating overly
large buffers based on untrusted firmware data.

> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe=
_guc_hwconfig.c
> index b300901dbb8e1..fb8caf6e9240f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
[ ... ]
> +/*
> + * The hwconfig table is a small KLV blob, but its length is reported by=
 the
> + * GuC in the 28-bit DATA0 field of the MMIO response, i.e. it can claim=
 up to
> + * 256MB. Since the reported size drives both a GGTT-pinned BO allocatio=
n that
> + * lives for the whole device lifetime and several kzalloc()s in the rea=
ders,
> + * sanity check it against a generous upper bound instead of trusting the
> + * firmware value blindly.
> + */

[Severity: High]
This is a pre-existing issue, but since the patch explicitly treats the
firmware data as untrusted, can malformed hwconfig table contents still cau=
se
an infinite loop in the parsers?

In drivers/gpu/drm/xe/xe_guc_hwconfig.c:xe_guc_hwconfig_dump(), the bounds
check performs an addition that can wrap around:

	while (i + 3 <=3D num_dw) {
		u32 attribute =3D hwconfig[i++];
		u32 len_dw =3D hwconfig[i++];

		if (i + len_dw > num_dw) {

If corrupted firmware provides a large value like len_dw =3D 0xFFFFFFFE, the
addition i + len_dw wraps around to 0. This bypasses the bounds check since
0 > num_dw evaluates to false.

The loop index is then advanced:

		i +=3D len_dw;
	}

Because i is an int, advancing it by 0xFFFFFFFE wraps it back to 0, which
causes the loop to repeat indefinitely and hang the kernel thread.

A similar overflow appears to be possible in xe_guc_hwconfig_lookup_u32():

	while (i + 3 <=3D num_dw) {
		u32 key =3D hwconfig[i++];
		u32 len_dw =3D hwconfig[i++];

		if (key !=3D attribute) {
			i +=3D len_dw;
			continue;
		}

Does this code need safe addition checks when handling len_dw from the
firmware table to prevent these integer overflows?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908231854.1218=
934-4-umesh.nerlige.ramappa@intel.com?part=3D2
