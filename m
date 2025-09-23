Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59084CAC5A7
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 12:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1247F10E124;
	Tue, 23 Sep 2025 12:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YGG8tReV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795F710E124
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 12:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758631030; x=1790167030;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=fVNJ92OyqTmBRMg86gJPMRIxgSuv9CEYR9h5BKbkh2g=;
 b=YGG8tReV+n4kdJqrDSeanB3bADESgo56ga7yBz/QlidmDuGxOhe2I6T/
 iDFMSo7uzrUZGs33LY4RZDz6RL3WO2Dg/pkR66aoDWZv17clQGSRSivCz
 m+rUGSBGmwDXZ36gbzE6D4rQptwQBpjvYaLty8EnmC6/oHG1MzFwz3R/C
 VmdldjKPS0Kfmwnk+qwqTY4PbkgaBeW479CwshYDIL/0rDSmKTmqqIBaQ
 h7mJxj/cocCtDEfgamG8j5GpWwbLn84aV7UCFfyw3fxvMKmy4sh7Awy4R
 SUxR31Bp7FgGZNRpIbCFyhbktTVX6HZBlfshIQ8yjR2Gi01qvgUrzgBke g==;
X-CSE-ConnectionGUID: VADCM8fmRuqJMGvF0DhkQA==
X-CSE-MsgGUID: 4oxUwlKXTWSd0MWkHIF+XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60824537"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60824537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 05:37:09 -0700
X-CSE-ConnectionGUID: ws6yRFnHQFOHZpzgkRCMtw==
X-CSE-MsgGUID: 45SS+VN2QeeewT0gV4OWGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="207511198"
Received: from opintica-mobl1 (HELO [10.245.245.2]) ([10.245.245.2])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 05:37:07 -0700
Message-ID: <472a48d8ef727e16650cca80453e29c4c17166d9.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for Suspend improvements
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 23 Sep 2025 14:37:05 +0200
In-Reply-To: <175824467604.346973.8284667320844330658@1538d3639d33>
References: <20250918142848.21807-1-thomas.hellstrom@linux.intel.com>
 <175824467604.346973.8284667320844330658@1538d3639d33>
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

On Fri, 2025-09-19 at 01:17 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: Suspend improvements
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/154717/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-3791-
> b63885ef3a8242ea4b307ec9427cb4255c82abfc_FULL -> xe-pw-154717v1_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-154717v1_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-154717v1_FULL, please notify your bug team
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
> pw-154717v1_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][1] ->=
 [DMESG-WARN][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_gu=
c_mmio_send_recv.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-466/ig=
t@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>=20
> =C2=A0 * igt@xe_pm@s3-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][3] ->=
 [TIMEOUT][4]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-466/ig=
t@xe_pm@s3-vm-bind-unbind-all.html

These do not appear related. The first one appears to warn due to fault
injection. The second one verified to pass on a dg2 system.=20

/Thomas


>=20
> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-154717v1_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][5] -> [SKIP][6] ([Intel XE#2314] /
> [Intel XE#2894])
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays=
-2560x1440p.html
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][7] ([Intel XE#787]) +62
> other tests skip
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-432/ig=
t@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][8] ([Intel XE#455] /
> [Intel XE#787]) +8 other tests skip
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-432/ig=
t@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][9] ->=
 [INCOMPLETE][10] ([Intel
> XE#1727] / [Intel XE#3113] / [Intel XE#4345])
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-=
ccs.html
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][11] -=
> [INCOMPLETE][12] ([Intel
> XE#1727] / [Intel XE#3113])
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-=
ccs@pipe-a-hdmi-a-6.html
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][13] -=
> [INCOMPLETE][14] ([Intel
> XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] /
> [Intel XE#4345] / [Intel XE#4522])
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc.html
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][15] ([Intel XE#1727]
> / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel
> XE#4522])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_content_protection@srm@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][16] ([Intel XE#1178])
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-432/ig=
t@kms_content_protection@srm@pipe-a-dp-2.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][17] -> [SKIP][18] ([Intel XE#2291])
> +1 other test skip
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][19] -> [FAIL][20] ([Intel XE#4633])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.h=
tml
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-4/igt@=
kms_cursor_legacy@flip-vs-cursor-atomic.html
>=20
> =C2=A0 * igt@kms_dp_aux_dev:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][21] -> [SKIP][22] ([Intel XE#3009])
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-5/igt@kms_dp_aux_dev.html
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
kms_dp_aux_dev.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][23] -> [SKIP][24] ([Intel XE#2316])
> +3 other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
kms_flip@2x-plain-flip-fb-recreate.html
>=20
> =C2=A0 * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][25] -> [INCOMPLETE][26] ([Intel
> XE#2049]) +1 other test incomplete
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-of=
f-vs-modeset.html
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-8/igt@=
kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
>=20
> =C2=A0 * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][27] -> [DMESG-WARN][28] ([Intel
> XE#4543]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1=
.html
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-adlp-3/igt=
@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][29] -=
> [FAIL][30] ([Intel XE#301])
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-463/ig=
t@kms_flip@flip-vs-expired-vblank.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][31] -=
> [FAIL][32] ([Intel XE#301] /
> [Intel XE#3321])
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-dp4.h=
tml
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-463/ig=
t@kms_flip@flip-vs-expired-vblank@c-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][33] -> [FAIL][34] ([Intel XE#301] /
> [Intel XE#3149])
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.ht=
ml
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-lnl-3/igt@=
kms_flip@flip-vs-expired-vblank@c-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@d-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][35] -=
> [INCOMPLETE][36] ([Intel
> XE#2049] / [Intel XE#2597]) +1 other test incomplete
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-466/ig=
t@kms_flip@flip-vs-suspend@d-dp4.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][37] -=
> [SKIP][38] ([Intel XE#455])
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-434/ig=
t@kms_hdr@invalid-hdr.html
>=20
> =C2=A0 * igt@kms_hdr@static-swap:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][39] -> [SKIP][40] ([Intel XE#1503])
> +1 other test skip
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-5/igt@kms_hdr@static-swap.html
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
kms_hdr@static-swap.html
>=20
> =C2=A0 * igt@kms_invalid_mode@uint-max-clock@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][41] -> [DMESG-WARN][42] ([Intel
> XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-adlp-6/igt@kms_invalid_mode@uint-max-clock@pipe-a-h=
dmi-a-1.html
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-adlp-2/igt=
@kms_invalid_mode@uint-max-clock@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][43] ([Intel XE#616]) +2
> other tests fail
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-432/ig=
t@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html
>=20
> =C2=A0 * igt@kms_setmode@clone-exclusive-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][44] -> [SKIP][45] ([Intel XE#1435])
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
kms_setmode@clone-exclusive-crtc.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][46] -=
> [SKIP][47] ([Intel XE#1392])
> +3 other tests skip
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-def=
er-mmap.html
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][48] ([Intel XE#3718]) -> [PASS][49]
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip=
-atomic.html
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-2/igt@=
kms_async_flips@alternate-sync-async-flip-atomic.html
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][50] -> [PASS][51]
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip=
-atomic@pipe-c-dp-2.html
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-2/igt@=
kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_atomic_transition@plane-toggle-modeset-transition:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][52] ([Intel XE#3908]) -> [PASS][53]
> +1 other test pass
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modes=
et-transition.html
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-adlp-8/igt=
@kms_atomic_transition@plane-toggle-modeset-transition.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][54] ([Intel XE#2314] / [Intel
> XE#2894]) -> [PASS][55]
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays=
-3840x2160p.html
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-1/igt@=
kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][56] ([Intel XE#2953] / [Intel
> XE#4173]) -> [PASS][57] +3 other tests pass
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-adlp-4/igt@kms_cursor_legacy@basic-flip-after-curso=
r-varying-size.html
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-adlp-9/igt=
@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][58] ([Intel XE#2291]) -> [PASS][59]
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varyin=
g-size.html
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-1/igt@=
kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
>=20
> =C2=A0 * igt@kms_dp_link_training@non-uhbr-sst:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][60] ([Intel XE#4354]) -> [PASS][61]
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-1/igt@=
kms_dp_link_training@non-uhbr-sst.html
>=20
> =C2=A0 * igt@kms_dp_linktrain_fallback@dp-fallback:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][62] ([Intel XE#4294]) -> [PASS][63]
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.htm=
l
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-1/igt@=
kms_dp_linktrain_fallback@dp-fallback.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-2x:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][64] ([Intel XE#2373]) -> [PASS][65]
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-1/igt@=
kms_feature_discovery@display-2x.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-dpms-on-nop:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][66] ([Intel XE#2316]) -> [PASS][67]
> +4 other tests pass
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-1/igt@=
kms_flip@2x-flip-vs-dpms-on-nop.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][68] ([Intel XE#301]) -> [PASS][69]
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.ht=
ml
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-lnl-3/igt@=
kms_flip@flip-vs-expired-vblank@a-edp1.html
>=20
> =C2=A0 * igt@kms_vrr@negative-basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][70] ([Intel XE#1499]) -> [PASS][71]
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-6/igt@kms_vrr@negative-basic.html
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-1/igt@=
kms_vrr@negative-basic.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][72] (=
[Intel XE#1392]) -> [PASS][73]
> +2 other tests pass
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-464/ig=
t@xe_exec_basic@multigpu-once-rebind.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[74] ([Intel XE#1727] / [Intel
> XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][75] ([Intel XE#1727] /
> [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345]
> / [Intel XE#4522]) +1 other test incomplete
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs.html
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-dg2-434/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][76] ([Intel XE#1178]) -> [SKIP][77]
> ([Intel XE#2341])
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
kms_content_protection@atomic-dpms.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][78] ([Intel XE#1188]) -> [SKIP][79]
> ([Intel XE#2341])
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-5/igt@kms_content_protection@uevent.html
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
kms_content_protection@uevent.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][80] ([Intel XE#301]) -> [FAIL][81]
> ([Intel XE#301] / [Intel XE#3149])
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-lnl-3/igt@=
kms_flip@flip-vs-expired-vblank.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][82] ([Intel XE#2311]) -> [SKIP][83]
> ([Intel XE#2312]) +13 other tests skip
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn=
-pri-shrfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][84] ([Intel XE#2312]) -> [SKIP][85]
> ([Intel XE#2311]) +10 other tests skip
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn=
-pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-1/igt@=
kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][86] ([Intel XE#5390]) -> [SKIP][87]
> ([Intel XE#2312]) +5 other tests skip
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
spr-indfb-draw-render.html
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][88] ([Intel XE#2312]) -> [SKIP][89]
> ([Intel XE#5390]) +7 other tests skip
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
spr-indfb-onoff.html
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][90] ([Intel XE#2312]) -> [SKIP][91]
> ([Intel XE#2313]) +12 other tests skip
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-shrfb-plflip-blt.html
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][92] ([Intel XE#2313]) -> [SKIP][93]
> ([Intel XE#2312]) +10 other tests skip
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-=
pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][94] ([Intel XE#4596]) -> [SKIP][95]
> ([Intel XE#5021])
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-1/igt@=
kms_plane_multiple@2x-tiling-y.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][96] ([Intel XE#2426]) -> [SKIP][97]
> ([Intel XE#2509])
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with=
-chamelium.html
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-5/igt@=
kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
> =C2=A0 * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][98] ([Intel XE#5466] / [Intel
> XE#5530]) -> [ABORT][99] ([Intel XE#4917] / [Intel XE#5466] / [Intel
> XE#5530])
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3791-b63885ef3a8242ea4b307ec=
9427cb4255c82abfc/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_=
ct_send_recv.html
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/shard-bmg-6/igt@=
xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>=20
> =C2=A0=20
> =C2=A0 {name}: This element is suppressed. This means it is ignored when
> computing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the status of the =
difference (SUCCESS, WARNING, or
> FAILURE).
>=20
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1188]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1499]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> =C2=A0 [Intel XE#2049]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> =C2=A0 [Intel XE#2291]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> =C2=A0 [Intel XE#2311]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> =C2=A0 [Intel XE#2312]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> =C2=A0 [Intel XE#2313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> =C2=A0 [Intel XE#2314]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> =C2=A0 [Intel XE#2316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> =C2=A0 [Intel XE#2341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> =C2=A0 [Intel XE#2373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
> =C2=A0 [Intel XE#2426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> =C2=A0 [Intel XE#2509]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
> =C2=A0 [Intel XE#2597]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> =C2=A0 [Intel XE#2705]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> =C2=A0 [Intel XE#2894]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#3009]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#3113]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> =C2=A0 [Intel XE#3149]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
> =C2=A0 [Intel XE#3321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> =C2=A0 [Intel XE#3718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
> =C2=A0 [Intel XE#3908]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4212]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> =C2=A0 [Intel XE#4294]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
> =C2=A0 [Intel XE#4345]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> =C2=A0 [Intel XE#4354]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
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
> =C2=A0 [Intel XE#4917]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
> =C2=A0 [Intel XE#5021]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
> =C2=A0 [Intel XE#5390]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> =C2=A0 [Intel XE#5466]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
> =C2=A0 [Intel XE#5530]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
> =C2=A0 [Intel XE#616]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-3791-b63885ef3a8242ea4b307ec9427cb4255c82abfc -> xe-pw=
-
> 154717v1
>=20
> =C2=A0 IGT_8543: 8543
> =C2=A0 xe-3791-b63885ef3a8242ea4b307ec9427cb4255c82abfc:
> b63885ef3a8242ea4b307ec9427cb4255c82abfc
> =C2=A0 xe-pw-154717v1: 154717v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154717v1/index.html

