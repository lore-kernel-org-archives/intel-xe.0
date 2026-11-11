Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56DC606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 17:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SIaBljch
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF2310FD0A;
	Wed, 11 Nov 2026 17:20:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54CA10FD10
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 17:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794417601; x=1825953601;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=TwN7LlLyxP8CNJcDnNU6N529W4GBvfLEukHZgHs0UPQ=;
 b=SIaBljchPm6dpw3/3RXdixKHCTidPbuSw/pum2wk8RRPe+QBHDb4SqWx
 ZamoK7hRM9Hn02VtEs8WROd0vi9E/OFdjE1/OmKy7qUU2TxGr0Y/A28nM
 Yghp+q7M7ucMLbkeBkH4IN1yZ6MRRjVgDBXB2dbaYlrEm/5KYrp9PozoV
 BltET6fQMJlFH+ICOckUiMN9UsKvsnDCgde+Dojpgps/WECr6l8F3bLsN
 CqI6IFEUZDDLsjXvcUNDrenR17+8TUnB3OzTohNs2hpj5tA3DyprI5O+b
 Ra0no1QywndrdKDpysbqf3kl0P2vZoKEuTwA/GH1lLl5YOme+Rs9KUElI g==;
X-CSE-ConnectionGUID: 9cvjDOGlQTqoSQqhALs65Q==
X-CSE-MsgGUID: m+01zmLXT8K5MxkgPlsYpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3093146"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3093146"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 09:20:00 -0800
X-CSE-ConnectionGUID: 1slqua1JSry5V+HD4r7d7g==
X-CSE-MsgGUID: GgVumdbEQMyoU1X1FYc23Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8798630"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.171])
 ([10.245.245.171])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 09:19:59 -0800
Message-ID: <37c8356e1b14fbcfa16c0bbb39660824ebb1c027.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for drm/xe/dma-buf:
 Validate BOs on export to charge the exporter
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Nov 2026 18:19:56 +0100
In-Reply-To: <179441661007.11254.4996427021609448634@9ac1b63fe3ea>
References: <20261111100929.2228-1-thomas.hellstrom@linux.intel.com>
 <179441661007.11254.4996427021609448634@9ac1b63fe3ea>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 2026-11-11 at 17:03 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe/dma-buf: Validate BOs on export to charge the exporter
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/178301/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-6108-
> 2077fe24e29527c2b5cb634ffbc3725893f5c54c_FULL -> xe-pw-178301v1_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-178301v1_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-178301v1_FULL, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> =C2=A0 to document this new failure mode, which will reduce false
> positives in CI.
>=20
> =C2=A0=20
>=20
> Participating hosts (3 -> 3)
> ------------------------------
>=20
> =C2=A0 No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
> =C2=A0 Here are the unknown changes that may have been introduced in xe-
> pw-178301v1_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_pmu@engine-activity-gt-reset-idle@engine-
> drm_xe_engine_class_video_decode0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][1] +1 other test
> incomplete
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-1/igt@=
xe_pmu@engine-activity-gt-reset-idle@engine-drm_xe_engine_class_video_decod=
e0.html
>=20
> =C2=A0=20

Unrelated.

/Thomas



> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-178301v1_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_3d@basic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][2] ([Intel XE#6011])
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_3d@basic.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][3] ([Intel XE#2327])
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-1/igt@=
kms_big_fb@4-tiled-16bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][4] ([Intel XE#5901])
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_big_fb@4-tiled-32bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip=
:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][5] ([Intel XE#5808]) +2
> other tests skip
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][6] ([Intel XE#1124])
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_big_fb@yf-tiled-32bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][7] ([Intel XE#5822]) +2
> other tests skip
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][8] ([Intel XE#2652]) +3
> other tests skip
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-5/igt@=
kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][9] ([Intel XE#2887])
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][10] ([Intel XE#2887])
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-2/igt@=
kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
>=20
> =C2=A0 *
> igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][11] ([Intel XE#7358])
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html
>=20
> =C2=A0 * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][12] ([Intel XE#8391])
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_chamelium_color_pipeline@plane-lut3d-green-only.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][13] ([Intel XE#373])
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
>=20
> =C2=A0 * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][14] ([Intel XE#2252])
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][15] ([Intel XE#3304])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-7/igt@=
kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][16] ([Intel XE#1178] /
> [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_content_protection@atomic-hdcp14@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_content_protection@suspend-resume:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#7642])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_content_protection@suspend-resume.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][18] ([Intel XE#6707] /
> [Intel XE#7439])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-7/igt@=
kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-64x21:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#1424])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_cursor_crc@cursor-offscreen-64x21.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-onscreen-512x512:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#5846])
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_cursor_crc@cursor-onscreen-512x512.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#5900])
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_cursor_crc@cursor-rapid-movement-128x42.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#8265])
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_dsc@dsc-with-bpc-formats-bigjoiner.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#1421])
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_flip@2x-flip-vs-dpms.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][24] -> [FAIL][25] ([Intel XE#301] /
> [Intel XE#3149])
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.ht=
ml
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-7/igt@=
kms_flip@flip-vs-expired-vblank@c-edp1.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#7178])
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][27] ([Intel XE#7178] /
> [Intel XE#7351])
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.htm=
l
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][28] ([Intel XE#5800] /
> [Intel XE#6312]) +2 other tests skip
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][29] ([Intel XE#656] /
> [Intel XE#7905]) +2 other tests skip
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][30] ([Intel XE#7061] /
> [Intel XE#7356])
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][31] ([Intel XE#6312] /
> [Intel XE#651])
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-w=
c
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][32] ([Intel XE#6312]) +1
> other test skip
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-mmap-w=
c
> :
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#6312])
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#7905]) +4
> other tests skip
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc=
:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#7061])
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][36] ([Intel XE#7865]) +2
> other tests skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][37] ([Intel XE#7865]) +3
> other tests skip
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][38] ([Intel XE#7061] /
> [Intel XE#7356])
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][39] ([Intel XE#5865] /
> [Intel XE#7399])
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][40] ([Intel XE#5812]) +18
> other tests skip
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsrhdr-stridechange:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#2313]) +1
> other test skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-stridechange.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][42] ([Intel XE#7283])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-yf:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][43] ([Intel XE#4596] /
> [Intel XE#5854])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_plane_multiple@2x-tiling-yf.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][44] ([Intel XE#8395] /
> [Intel XE#8396]) +1 other test skip
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][45] ([Intel XE#8396]) +1
> other test skip
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][46] ([Intel XE#1439] /
> [Intel XE#3141] / [Intel XE#7383])
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#2893] /
> [Intel XE#4608] / [Intel XE#7304])
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-
> a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#4608])
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.ht=
ml
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-
> b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#4608] /
> [Intel XE#7304])
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.ht=
ml
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-no-drrs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#1406] /
> [Intel XE#7345])
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_psr@fbc-psr2-no-drrs.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][51] ([Intel XE#1406] /
> [Intel XE#4609] / [Intel XE#7345])
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
kms_psr@fbc-psr2-no-drrs@edp-1.html
>=20
> =C2=A0 * igt@kms_rotation_crc@multiplane-rotation:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][52] -> [DMESG-WARN][53] ([Intel
> XE#7774])
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation.html
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-5/igt@=
kms_rotation_crc@multiplane-rotation.html
>=20
> =C2=A0 * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][54] -> [FAIL][55] ([Intel XE#4227] /
> [Intel XE#7397]) +1 other test fail
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-ptl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-4/igt@=
kms_vrr@flip-suspend@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_vrr@seamless-rr-switch-vrr:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][56] ([Intel XE#5948] /
> [Intel XE#9277])
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
kms_vrr@seamless-rr-switch-vrr.html
>=20
> =C2=A0 * igt@sriov_basic@enable-vfs-autoprobe-off:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][57] ([Intel XE#1091] /
> [Intel XE#2849])
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
sriov_basic@enable-vfs-autoprobe-off.html
>=20
> =C2=A0 * igt@xe_create@create-big-vram:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][58] ([Intel XE#5853] /
> [Intel XE#7457])
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
xe_create@create-big-vram.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][59] ([Intel XE#5764])
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
xe_evict@evict-beng-mixed-threads-large.html
>=20
> =C2=A0 * igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][60] ([Intel XE#7482])
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
xe_exec_balancer@many-parallel-userptr-invalidate-race.html
>=20
> =C2=A0 * igt@xe_exec_balancer@once-parallel-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][61] ([Intel XE#7482]) +4
> other tests skip
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
xe_exec_balancer@once-parallel-rebind.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][62] ([Intel XE#1392])
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][63] ([Intel XE#5575] /
> [Intel XE#7484]) +1 other test skip
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
xe_exec_basic@multigpu-once-rebind.html
>=20
> =C2=A0 *
> igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][64] ([Intel XE#8374])
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-1/igt@=
xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][65] ([Intel XE#8374])
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html
>=20
> =C2=A0 * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][66] ([Intel XE#8364])
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
>=20
> =C2=A0 * igt@xe_exec_multi_queue@one-queue-preempt-mode-dyn-priority-smem=
:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#8364]) +5
> other tests skip
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
xe_exec_multi_queue@one-queue-preempt-mode-dyn-priority-smem.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][68] ([Intel XE#8378])
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][69] ([Intel XE#8378])
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#8378])
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-2/igt@=
xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html
>=20
> =C2=A0 * igt@xe_page_reclaim@binds-full-pd:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][71] ([Intel XE#7793])
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-3/igt@=
xe_page_reclaim@binds-full-pd.html
>=20
> =C2=A0 * igt@xe_pm@s3-d3hot-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][72] ([Intel XE#6867])
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
xe_pm@s3-d3hot-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze@gt1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][73] -> [FAIL][74] ([Intel XE#9254])
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-7/igt@=
xe_pm_residency@gt-c6-freeze@gt1.html
>=20
> =C2=A0 * igt@xe_prefetch_fault@l2-prefetch-fault:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][75] ([Intel XE#8815])
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-2/igt@=
xe_prefetch_fault@l2-prefetch-fault.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-size:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][76] ([Intel XE#6019])
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
xe_query@multigpu-query-invalid-size.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][77] ([Intel XE#367]) -> [PASS][78]
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-38=
40x2160p.html
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-7/igt@=
kms_bw@linear-tiling-1-displays-target-3840x2160p.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][79] ([Intel XE#7084] / [Intel
> XE#8150]) -> [PASS][80] +1 other test pass
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-c=
cs.html
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-2/igt@=
kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][81] ([Intel XE#301]) -> [PASS][82]
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.ht=
ml
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-7/igt@=
kms_flip@flip-vs-expired-vblank@b-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][83] ([Intel XE#2597] / [Intel
> XE#8155]) -> [PASS][84] +1 other test pass
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.ht=
ml
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-1/igt@=
kms_flip@flip-vs-suspend-interruptible.html
>=20
> =C2=A0 * igt@kms_pm_backlight@fade-with-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][85] -> [PASS][86]
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-ptl-8/igt@kms_pm_backlight@fade-with-suspend.html
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-8/igt@=
kms_pm_backlight@fade-with-suspend.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-non-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][87] -> [PASS][88]
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp.html
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_pm_rpm@modeset-non-lpsp.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-
> drm_xe_engine_class_compute:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-FAIL][89] -> [PASS][90] +1 other
> test pass
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-v=
ram-evict@engine-drm_xe_engine_class_compute.html
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_cla=
ss_compute.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@atomic-many:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][91] ([Intel XE#8578]) -> [PASS][92]
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-1/igt@xe_exec_fault_mode@atomic-many.html
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-7/igt@=
xe_exec_fault_mode@atomic-many.html
>=20
> =C2=A0 * igt@xe_exec_reset@gt-stress-reset-bo-invalidation:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][93] ([Intel XE#8652]) ->
> [PASS][94]
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-ptl-4/igt@xe_exec_reset@gt-stress-reset-bo-invalida=
tion.html
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-4/igt@=
xe_exec_reset@gt-stress-reset-bo-invalidation.html
>=20
> =C2=A0 * igt@xe_mmap@bad-flags:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][95] ([Intel XE#8589]) -> [PASS][96]
> +68 other tests pass
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@xe_mmap@bad-flags.html
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
xe_mmap@bad-flags.html
>=20
> =C2=A0 * igt@xe_pm@s4-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][97] ([Intel XE#7727]) ->
> [PASS][98]
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-lnl-3/igt@xe_pm@s4-mocs.html
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-6/igt@=
xe_pm@s4-mocs.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][99] ([Intel XE#9362]) ->
> [PASS][100]
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-ptl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-ptl-1/igt@=
xe_pm@s4-vm-bind-unbind-all.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze@gt0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][101] ([Intel XE#9254]) ->
> [PASS][102]
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-7/igt@=
xe_pm_residency@gt-c6-freeze@gt0.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][103] ([Intel XE#8589]) ->
> [SKIP][104] ([Intel XE#2887]) +1 other test skip
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-cc=
s.html
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@dp-hpd-storm:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][105] ([Intel XE#8589]) ->
> [SKIP][106] ([Intel XE#2252]) +1 other test skip
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_chamelium_hpd@dp-hpd-storm.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic-hdcp14:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][107] ([Intel XE#8589]) ->
> [FAIL][108] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_content_protection@atomic-hdcp14.html
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_content_protection@atomic-hdcp14.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][109] ([Intel XE#301]) -> [FAIL][110]
> ([Intel XE#301] / [Intel XE#3149])
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-lnl-7/igt@=
kms_flip@flip-vs-expired-vblank.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][111] ([Intel XE#8589]) ->
> [SKIP][112] ([Intel XE#7178] / [Intel XE#7351])
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-3=
2bpp-ytile-downscaling.html
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][113] ([Intel XE#8589]) ->
> [SKIP][114] ([Intel XE#2311]) +4 other tests skip
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-sc=
aledprimary.html
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][115] ([Intel XE#8589]) ->
> [SKIP][116] ([Intel XE#2313]) +2 other tests skip
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-=
cur-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][117] ([Intel XE#8589]) ->
> [SKIP][118] ([Intel XE#7061] / [Intel XE#7356])
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-abgr161616f-=
draw-render.html
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
>=20
> =C2=A0 *
> igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][119] ([Intel XE#8589]) ->
> [SKIP][120] ([Intel XE#7283])
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs=
-modifier-source-clamping.html
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][121] ([Intel XE#8589]) ->
> [SKIP][122] ([Intel XE#1489])
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-c=
ontinuous-sf.html
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
>=20
> =C2=A0 * igt@kms_rotation_crc@bad-tiling:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][123] ([Intel XE#8589]) ->
> [SKIP][124] ([Intel XE#3904] / [Intel XE#7342])
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_rotation_crc@bad-tiling.html
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_rotation_crc@bad-tiling.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][125] ([Intel XE#8589]) ->
> [SKIP][126] ([Intel XE#2330] / [Intel XE#5813])
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect=
-x-0.html
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][127] ([Intel XE#8589]) ->
> [SKIP][128] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-ma=
ny-vm-userptr-rebind.html
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][129] ([Intel XE#8589]) ->
> [SKIP][130] ([Intel XE#8374]) +1 other test skip
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-userp=
tr-rebind-prefetch.html
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html
>=20
> =C2=A0 * igt@xe_exec_multi_queue@max-queues-close-fd:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][131] ([Intel XE#8589]) ->
> [SKIP][132] ([Intel XE#8364]) +2 other tests skip
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-close-fd.h=
tml
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
xe_exec_multi_queue@max-queues-close-fd.html
>=20
> =C2=A0 * igt@xe_exec_reset@multi-queue-cat-error:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][133] ([Intel XE#8589]) ->
> [SKIP][134] ([Intel XE#8369])
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@xe_exec_reset@multi-queue-cat-error.html
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
xe_exec_reset@multi-queue-cat-error.html
>=20
> =C2=A0 * igt@xe_page_reclaim@binds-null-vma:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][135] ([Intel XE#8589]) ->
> [SKIP][136] ([Intel XE#7793])
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6108-2077fe24e29527c2b5cb634=
ffbc3725893f5c54c/shard-bmg-3/igt@xe_page_reclaim@binds-null-vma.html
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/shard-bmg-4/igt@=
xe_page_reclaim@binds-null-vma.html
>=20
> =C2=A0=20
> =C2=A0 [Intel XE#1091]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1439]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2311]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> =C2=A0 [Intel XE#2313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> =C2=A0 [Intel XE#2330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
> =C2=A0 [Intel XE#2597]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> =C2=A0 [Intel XE#2652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> =C2=A0 [Intel XE#2849]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2893]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#3141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
> =C2=A0 [Intel XE#3149]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
> =C2=A0 [Intel XE#3304]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#3904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> =C2=A0 [Intel XE#4227]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
> =C2=A0 [Intel XE#4596]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> =C2=A0 [Intel XE#4608]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
> =C2=A0 [Intel XE#4609]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
> =C2=A0 [Intel XE#5575]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
> =C2=A0 [Intel XE#5764]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
> =C2=A0 [Intel XE#5800]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
> =C2=A0 [Intel XE#5808]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
> =C2=A0 [Intel XE#5812]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
> =C2=A0 [Intel XE#5813]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
> =C2=A0 [Intel XE#5822]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
> =C2=A0 [Intel XE#5846]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
> =C2=A0 [Intel XE#5853]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5853
> =C2=A0 [Intel XE#5854]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
> =C2=A0 [Intel XE#5865]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5865
> =C2=A0 [Intel XE#5900]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
> =C2=A0 [Intel XE#5901]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
> =C2=A0 [Intel XE#5948]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948
> =C2=A0 [Intel XE#6011]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
> =C2=A0 [Intel XE#6019]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
> =C2=A0 [Intel XE#6312]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#6707]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
> =C2=A0 [Intel XE#6867]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
> =C2=A0 [Intel XE#7061]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
> =C2=A0 [Intel XE#7084]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
> =C2=A0 [Intel XE#7178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
> =C2=A0 [Intel XE#7283]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
> =C2=A0 [Intel XE#7304]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
> =C2=A0 [Intel XE#7342]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
> =C2=A0 [Intel XE#7345]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
> =C2=A0 [Intel XE#7351]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
> =C2=A0 [Intel XE#7356]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
> =C2=A0 [Intel XE#7358]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
> =C2=A0 [Intel XE#7372]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
> =C2=A0 [Intel XE#7374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
> =C2=A0 [Intel XE#7383]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
> =C2=A0 [Intel XE#7397]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
> =C2=A0 [Intel XE#7399]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
> =C2=A0 [Intel XE#7439]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
> =C2=A0 [Intel XE#7457]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
> =C2=A0 [Intel XE#7482]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
> =C2=A0 [Intel XE#7484]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
> =C2=A0 [Intel XE#7642]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
> =C2=A0 [Intel XE#7727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
> =C2=A0 [Intel XE#7774]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
> =C2=A0 [Intel XE#7793]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
> =C2=A0 [Intel XE#7865]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
> =C2=A0 [Intel XE#7905]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
> =C2=A0 [Intel XE#8150]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
> =C2=A0 [Intel XE#8155]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
> =C2=A0 [Intel XE#8265]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
> =C2=A0 [Intel XE#8364]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
> =C2=A0 [Intel XE#8369]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
> =C2=A0 [Intel XE#8374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
> =C2=A0 [Intel XE#8378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
> =C2=A0 [Intel XE#8391]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
> =C2=A0 [Intel XE#8395]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
> =C2=A0 [Intel XE#8396]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
> =C2=A0 [Intel XE#8578]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
> =C2=A0 [Intel XE#8589]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
> =C2=A0 [Intel XE#8652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
> =C2=A0 [Intel XE#8815]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
> =C2=A0 [Intel XE#9254]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
> =C2=A0 [Intel XE#9277]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
> =C2=A0 [Intel XE#9362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-6108-2077fe24e29527c2b5cb634ffbc3725893f5c54c -> xe-pw=
-
> 178301v1
>=20
> =C2=A0 IGT_9186: 9186
> =C2=A0 xe-6108-2077fe24e29527c2b5cb634ffbc3725893f5c54c:
> 2077fe24e29527c2b5cb634ffbc3725893f5c54c
> =C2=A0 xe-pw-178301v1: 178301v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178301v1/index.html
