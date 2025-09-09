Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9380ECAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 11:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5555710E6D5;
	Tue,  9 Sep 2025 11:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+bMAgVd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B53D10E6D5
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 11:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757418970; x=1788954970;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=0MdSGlD47IDPpQrnH8HawRTUZFsv28Le4lVcuNtL8h4=;
 b=I+bMAgVdh/DGwA+Oy1Ix0sf2yFLsHMhAItdn5hnw+vL4zmTk/6dMoZWd
 l6dOJQMX2A7r+HhAOCwAaSt1wry3t9jySPpiKLMF8roEQ3Y+yeX4MJSdO
 l8QNEECoRLtVtzAD2x6XS5sLfr3yFcRsnxqDAtVr10tHfEOHmCJAhYkC2
 AurUnDRuVfYlROpgu6AevqzFUPqPj6AGJF1hSwdvAM9P2HUSGYK3BqUPG
 g4q7GQCgFBmMZpexaKeezaZ/zRlyw9sCqU2qBkRPUy8mhrwbjgeag6Ooq
 dIayBVvMdPKrxriBkBcHwsYp/IyWf7o/VEI5zcdD483AfBtVqg6y1OSc+ w==;
X-CSE-ConnectionGUID: zlQk+anXSwihbxh0zbW0WQ==
X-CSE-MsgGUID: RnCGUyfcTzG4pTyof+iSwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82289106"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82289106"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:56:10 -0700
X-CSE-ConnectionGUID: 3mhMXc3uTr6dF5PKeqpArA==
X-CSE-MsgGUID: J5PFqOSFRAS79Ym7/+pYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172236330"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.108])
 ([10.245.244.108])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:56:09 -0700
Message-ID: <69e58ea112836be5f31b7ee203fe26b50f18e7c2.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for Driver-managed
 exhaustive eviction (rev6)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 09 Sep 2025 13:56:08 +0200
In-Reply-To: <175734672489.313434.448331291246288333@1538d3639d33>
References: <20250908101246.65025-1-thomas.hellstrom@linux.intel.com>
 <175734672489.313434.448331291246288333@1538d3639d33>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Mon, 2025-09-08 at 15:52 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: Driver-managed exhaustive eviction (rev6)
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/152882/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-3698-
> 8ff22e1c035368015610c20c9cc612e7bdec5d61_FULL -> xe-pw-152882v6_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-152882v6_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-152882v6_FULL, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> =C2=A0 to document this new failure mode, which will reduce false
> positives in CI.
>=20
> =C2=A0=20
>=20
> Participating hosts (4 -> 4)
> ------------------------------
>=20
> =C2=A0 No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
> =C2=A0 Here are the unknown changes that may have been introduced in xe-
> pw-152882v6_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][1] ->=
 [FAIL][2] +1 other test fail
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-indfb-scal=
edprimary.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][3] -> [FAIL][4] +2 other tests fail
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-indfb-scaled=
primary.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-lnl-5/igt@=
kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][5] -> [FAIL][6]
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-indfb-scale=
dprimary.html
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-adlp-6/igt=
@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html


These failures don't seem related since they appear also with other
series. Tested igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary on
a dg2 and it passes.
/Thomas.

>=20
> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-152882v6_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][7] ([Intel XE#316]) +1
> other test skip
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-434/ig=
t@kms_big_fb@x-tiled-8bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][8] ([Intel XE#1124]) +2
> other tests skip
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-3/igt@=
kms_big_fb@y-tiled-64bpp-rotate-90.html
>=20
> =C2=A0 *
> igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][9] -> [DMESG-FAIL][10] ([Intel
> XE#4543]) +2 other tests dmesg-fail
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-0-hflip-async-flip.html
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-adlp-3/igt=
@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][11] ([Intel XE#1124])
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@kms_big_fb@yf-tiled-8bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][12] ([Intel XE#607])
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-3/igt@=
kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][13] ([Intel XE#610])
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-434/ig=
t@kms_big_fb@yf-tiled-addfb-size-overflow.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][14] ([Intel XE#367])
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@kms_bw@linear-tiling-1-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][15] ([Intel XE#2887])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-8/igt@=
kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][16] ([Intel XE#787]) +160
> other tests skip
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-434/ig=
t@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][17] ([Intel XE#455] /
> [Intel XE#787]) +25 other tests skip
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-432/ig=
t@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][18] ([Intel XE#2907])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][19] ([Intel XE#5376])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-8/igt@=
kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][20] ([Intel XE#4417]) +3
> other tests skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-434/ig=
t@kms_cdclk@mode-transition@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][21] ([Intel XE#4416]) +3
> other tests skip
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#2252])
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-3/igt@=
kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-mode-timings:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][23] ([Intel XE#373]) +3
> other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@kms_chamelium_edid@hdmi-mode-timings.html
>=20
> =C2=A0 * igt@kms_content_protection@dp-mst-type-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][24] ([Intel XE#307])
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@kms_content_protection@dp-mst-type-0.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][25] ([Intel XE#308]) +1
> other test skip
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@kms_cursor_crc@cursor-offscreen-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][26] -> [SKIP][27] ([Intel XE#2291])
> +1 other test skip
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legac=
y.html
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-6/igt@=
kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][28] -> [FAIL][29] ([Intel XE#4633])
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.h=
tml
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-8/igt@=
kms_cursor_legacy@flip-vs-cursor-legacy.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-with-bpc-formats:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][30] ([Intel XE#455]) +4
> other tests skip
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@kms_dsc@dsc-with-bpc-formats.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][31] -> [SKIP][32] ([Intel XE#2316])
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interr=
uptible.html
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-6/igt@=
kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][33] -> [INCOMPLETE][34] ([Intel
> XE#2049] / [Intel XE#2597]) +1 other test incomplete
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.ht=
ml
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-7/igt@=
kms_flip@flip-vs-suspend-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@c-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][35] -=
> [INCOMPLETE][36] ([Intel
> XE#2049] / [Intel XE#2597]) +1 other test incomplete
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-436/ig=
t@kms_flip@flip-vs-suspend@c-dp4.html
>=20
> =C2=A0 * igt@kms_flip@plain-flip-interruptible@d-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][37] -> [DMESG-WARN][38] ([Intel
> XE#4543]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-adlp-8/igt@kms_flip@plain-flip-interruptible@d-hdmi=
-a1.html
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-adlp-2/igt=
@kms_flip@plain-flip-interruptible@d-hdmi-a1.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][39] ([Intel XE#2311]) +2
> other tests skip
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-8/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][40] ([Intel XE#651]) +11
> other tests skip
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#2313]) +2
> other tests skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-3/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][42] ([Intel XE#653]) +13
> other tests skip
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_hdr@static-swap:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][43] -> [SKIP][44] ([Intel XE#1503])
> +1 other test skip
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-1/igt@kms_hdr@static-swap.html
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-6/igt@=
kms_hdr@static-swap.html
>=20
> =C2=A0 * igt@kms_joiner@basic-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][45] ([Intel XE#346]) +1
> other test skip
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-434/ig=
t@kms_joiner@basic-big-joiner.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc3co-vpb-simulation:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][46] ([Intel XE#1122])
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@kms_pm_dc@dc3co-vpb-simulation.html
>=20
> =C2=A0 * igt@kms_pm_dc@deep-pkgc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][47] ([Intel XE#908])
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@kms_pm_dc@deep-pkgc.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][48] ([Intel XE#1406] /
> [Intel XE#1489]) +1 other test skip
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-434/ig=
t@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-p010:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][49] ([Intel XE#1122] /
> [Intel XE#1406])
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@kms_psr2_su@page_flip-p010.html
>=20
> =C2=A0 * igt@kms_psr@psr2-cursor-plane-move:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#1406] /
> [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-3/igt@=
kms_psr@psr2-cursor-plane-move.html
>=20
> =C2=A0 * igt@kms_psr@psr2-cursor-plane-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][51] ([Intel XE#1406] /
> [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@kms_psr@psr2-cursor-plane-onoff.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][52] ([Intel XE#3414] /
> [Intel XE#3904])
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-3/igt@=
kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>=20
> =C2=A0 * igt@kms_setmode@invalid-clone-single-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][53] -> [SKIP][54] ([Intel XE#1435])
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.htm=
l
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-6/igt@=
kms_setmode@invalid-clone-single-crtc.html
>=20
> =C2=A0 * igt@kms_vrr@seamless-rr-switch-vrr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][55] ([Intel XE#1499])
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-3/igt@=
kms_vrr@seamless-rr-switch-vrr.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][56] ([Intel XE#4837]) +2
> other tests skip
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-8/igt@=
xe_eudebug@basic-vm-bind-ufence-reconnect.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][57] -=
> [SKIP][58] ([Intel XE#1392])
> +6 other tests skip
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-=
many-vm-basic-defer-bind.html
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-=
invalida
> te:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][59] ([Intel XE#2322])
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-3/igt@=
xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invali=
date.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][60] ([Intel XE#288]) +8
> other tests skip
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
>=20
> =C2=A0 * igt@xe_exec_sip_eudebug@breakpoint-writesip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][61] ([Intel XE#4837]) +5
> other tests skip
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@xe_exec_sip_eudebug@breakpoint-writesip.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomem=
set
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][62] ([Intel XE#4943]) +3
> other tests skip
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-3/igt@=
xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset.ht=
ml
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-n=
omemset
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][63] ([Intel XE#4915]) +102
> other tests skip
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomem=
set.html
>=20
> =C2=A0 * igt@xe_module_load@force-load:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][64] ([Intel XE#378])
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@xe_module_load@force-load.html
>=20
> =C2=A0 * igt@xe_module_load@reload-no-display:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [ABORT][65] ([Intel XE#5087])
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-8/igt@=
xe_module_load@reload-no-display.html
>=20
> =C2=A0 * igt@xe_oa@syncs-ufence-wait-cfg:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][66] ([Intel XE#3573]) +1
> other test skip
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@xe_oa@syncs-ufence-wait-cfg.html
>=20
> =C2=A0 * igt@xe_peer2peer@read:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#2427])
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-3/igt@=
xe_peer2peer@read.html
>=20
> =C2=A0 * igt@xe_pm@s3-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][68] -> [DMESG-WARN][69] ([Intel
> XE#3868] / [Intel XE#569])
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-adlp-6/igt@xe_pm@s3-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-adlp-3/igt=
@xe_pm@s3-vm-bind-unbind-all.html
>=20
> =C2=A0 * igt@xe_pmu@all-fn-engine-activity-load:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][70] ([Intel XE#4650])
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@xe_pmu@all-fn-engine-activity-load.html
>=20
> =C2=A0 * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][71] ([Intel XE#4733]) +1
> other test skip
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@xe_pxp@pxp-stale-bo-exec-post-suspend.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-uc-fw-version-huc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][72] ([Intel XE#944])
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@xe_query@multigpu-query-uc-fw-version-huc.html
>=20
> =C2=A0 *
> igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][73] ([Intel XE#4130])
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 *
> igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][74] ([Intel XE#4543]) ->
> [PASS][75]
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-r=
otate-180-hflip-async-flip.html
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-adlp-9/igt=
@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[76] ([Intel XE#1727] / [Intel
> XE#3113]) -> [PASS][77]
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc.html
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-434/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_dp_linktrain_fallback@dp-fallback:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][78] ([Intel XE#4294]) -> [PASS][79]
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.htm=
l
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-8/igt@=
kms_dp_linktrain_fallback@dp-fallback.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][80] ([Intel XE#2316]) -> [PASS][81]
> +2 other tests pass
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interrupt=
ible.html
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-2/igt@=
kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][82] ([Intel XE#301]) -> [PASS][83]
> +1 other test pass
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible.html
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-lnl-7/igt@=
kms_flip@flip-vs-expired-vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][84] ([Intel XE#2049] / [Intel
> XE#2597]) -> [PASS][85] +1 other test pass
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-3/igt@=
kms_flip@flip-vs-suspend.html
>=20
> =C2=A0 * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][86] ([Intel XE#4543]) ->
> [PASS][87] +2 other tests pass
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-adlp-8/igt@kms_flip@plain-flip-interruptible@b-hdmi=
-a1.html
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-adlp-2/igt=
@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_lease@lessee-list@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][88] ([Intel XE#2953] / [Intel
> XE#4173]) -> [PASS][89] +7 other tests pass
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-adlp-6/igt@kms_lease@lessee-list@pipe-a-hdmi-a-1.ht=
ml
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-adlp-8/igt=
@kms_lease@lessee-list@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][90] ([Intel XE#4596]) -> [PASS][91]
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-2/igt@=
kms_plane_multiple@2x-tiling-4.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][92] ([Intel XE#718]) -> [PASS][93]
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-adlp-8/igt=
@kms_pm_dc@dc6-dpms.html
>=20
> =C2=A0 * igt@kms_vrr@cmrr@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][94] ([Intel XE#4459]) -> [PASS][95]
> +1 other test pass
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-lnl-4/igt@=
kms_vrr@cmrr@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_vrr@flipline:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][96] ([Intel XE#4227]) -> [PASS][97]
> +1 other test pass
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-lnl-3/igt@kms_vrr@flipline.html
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-lnl-5/igt@=
kms_vrr@flipline.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-=
invalida
> te-race:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[98] ([Intel XE#4842]) ->
> [PASS][99]
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-=
many-vm-bindexecqueue-userptr-invalidate-race.html
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-inva=
lidate-race.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][100] =
([Intel XE#1392]) ->
> [PASS][101] +3 other tests pass
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-de=
fer-mmap.html
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-434/ig=
t@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>=20
> =C2=A0 * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[102] ([Intel XE#5893]) ->
> [PASS][103]
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_gu=
c_mmio_send_recv.html
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>=20
> =C2=A0 * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [ABORT][104]=
 ([Intel XE#4847] / [Intel
> XE#5732]) -> [PASS][105]
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-dg2-435/igt@xe_fault_injection@vm-create-fail-xe_ex=
ec_queue_create_bind.html
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-433/ig=
t@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[106] ([Intel XE#1727] / [Intel
> XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] /
> [Intel XE#4522]) -> [INCOMPLETE][107] ([Intel XE#1727] / [Intel
> XE#3113] / [Intel XE#3124] / [Intel XE#4345])
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-=
ccs.html
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-466/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[108] ([Intel XE#1727] / [Intel
> XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) ->
> [INCOMPLETE][109] ([Intel XE#1727] / [Intel XE#3113] / [Intel
> XE#3124])
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-=
ccs@pipe-d-hdmi-a-6.html
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-466/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][110] ([Intel XE#1188]) ->
> [SKIP][111] ([Intel XE#2341])
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-1/igt@kms_content_protection@uevent.html
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-6/igt@=
kms_content_protection@uevent.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][112] ([Intel XE#2311]) ->
> [SKIP][113] ([Intel XE#2312]) +6 other tests skip
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn=
-pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-6/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][114] ([Intel XE#5390]) ->
> [SKIP][115] ([Intel XE#2312]) +4 other tests skip
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
cur-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][116] ([Intel XE#2312]) ->
> [SKIP][117] ([Intel XE#5390]) +4 other tests skip
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
cur-indfb-draw-render.html
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][118] ([Intel XE#2312]) ->
> [SKIP][119] ([Intel XE#2311]) +7 other tests skip
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scnds=
crn-cur-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-8/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][120] ([Intel XE#2312]) ->
> [SKIP][121] ([Intel XE#2313]) +9 other tests skip
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-in=
dfb-multidraw.html
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][122] ([Intel XE#2313]) ->
> [SKIP][123] ([Intel XE#2312]) +8 other tests skip
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-cur-indfb-draw-blt.html
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc9-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][124] ([Intel XE#3325]) ->
> [SKIP][125] ([Intel XE#734])
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-adlp-4/igt=
@kms_pm_dc@dc9-dpms.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][126] ([Intel XE#2426]) ->
> [FAIL][127] ([Intel XE#1729])
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-bmg-1/igt@=
kms_tiled_display@basic-test-pattern.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][128] =
([Intel XE#1729]) ->
> [SKIP][129] ([Intel XE#362])
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3698-8ff22e1c035368015610c20=
c9cc612e7bdec5d61/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.ht=
ml
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/shard-dg2-463/ig=
t@kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0=20
> =C2=A0 {name}: This element is suppressed. This means it is ignored when
> computing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the status of the =
difference (SUCCESS, WARNING, or
> FAILURE).
>=20
> =C2=A0 [Intel XE#1122]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1188]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1499]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> =C2=A0 [Intel XE#1729]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> =C2=A0 [Intel XE#2049]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2291]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> =C2=A0 [Intel XE#2311]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> =C2=A0 [Intel XE#2312]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> =C2=A0 [Intel XE#2313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> =C2=A0 [Intel XE#2316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> =C2=A0 [Intel XE#2426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> =C2=A0 [Intel XE#2427]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
> =C2=A0 [Intel XE#2597]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> =C2=A0 [Intel XE#2705]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2907]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#307]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
> =C2=A0 [Intel XE#308]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> =C2=A0 [Intel XE#3113]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> =C2=A0 [Intel XE#3124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#3325]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
> =C2=A0 [Intel XE#3414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> =C2=A0 [Intel XE#346]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
> =C2=A0 [Intel XE#3573]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
> =C2=A0 [Intel XE#3868]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
> =C2=A0 [Intel XE#3904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> =C2=A0 [Intel XE#4130]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4212]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> =C2=A0 [Intel XE#4227]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
> =C2=A0 [Intel XE#4294]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
> =C2=A0 [Intel XE#4345]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> =C2=A0 [Intel XE#4416]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
> =C2=A0 [Intel XE#4417]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
> =C2=A0 [Intel XE#4459]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
> =C2=A0 [Intel XE#4522]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
> =C2=A0 [Intel XE#4543]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#4596]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> =C2=A0 [Intel XE#4633]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
> =C2=A0 [Intel XE#4650]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
> =C2=A0 [Intel XE#4733]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> =C2=A0 [Intel XE#4837]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> =C2=A0 [Intel XE#4842]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
> =C2=A0 [Intel XE#4847]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4847
> =C2=A0 [Intel XE#4915]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> =C2=A0 [Intel XE#4943]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> =C2=A0 [Intel XE#5087]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087
> =C2=A0 [Intel XE#5376]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
> =C2=A0 [Intel XE#5390]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> =C2=A0 [Intel XE#569]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
> =C2=A0 [Intel XE#5732]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5732
> =C2=A0 [Intel XE#5786]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
> =C2=A0 [Intel XE#5893]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
> =C2=A0 [Intel XE#607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> =C2=A0 [Intel XE#610]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> =C2=A0 [Intel XE#734]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#908]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-3698-8ff22e1c035368015610c20c9cc612e7bdec5d61 -> xe-pw=
-
> 152882v6
>=20
> =C2=A0 IGT_8524: 8524
> =C2=A0 xe-3698-8ff22e1c035368015610c20c9cc612e7bdec5d61:
> 8ff22e1c035368015610c20c9cc612e7bdec5d61
> =C2=A0 xe-pw-152882v6: 152882v6
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v6/index.html

