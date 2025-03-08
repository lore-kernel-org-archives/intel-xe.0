Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7754AC282EC
	for <intel-xe@archiver.kernel.org>; Sat,  8 Mar 2025 11:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C17710E215;
	Sat,  8 Mar 2025 11:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3wjU0w/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0329310E215
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Mar 2025 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741432583; x=1772968583;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=VKSG+0u+cD+GeSOPqYyI8Tr3CRsyxWJbydYrYpRhPtk=;
 b=j3wjU0w/0cYm6lgLYYz0LFZFi0VQrOr6RiN0nBUI2a52nSxCLiPc+/nE
 LD+wa7V56fbRaPvfJEPy6RPqVAsvxXI/wC8aWTNlAKisJV322Pf4/ujMG
 J+AyHhEThJfHK9OO4Xs08tcBeTImFj2mwyYHfOb0aupY4PcFtwlVMi5v/
 9n+ECp41As8ZYaTV7sKi8fWHipk4PSqJcFLXkH06m1Bi6nlmduL7tA2i6
 EM55BhAJoKqscn8/EQYPsLhdfPG60USvAK4MdU7uBgyyzY0VuPR7GhsdM
 BQWHM+OG8Tku6IEixDP2m4NoCSsFWtjrcsWvstyuvfyg9iGtmtb0txwm8 Q==;
X-CSE-ConnectionGUID: O6eRYEhFTBKyZLA9RNC7lA==
X-CSE-MsgGUID: /3quQsKgQ1uDSvKbTVpLyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="52689096"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; d="scan'208";a="52689096"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2025 03:16:20 -0800
X-CSE-ConnectionGUID: DZ+fGoppQFyzwlFqX8Jqxg==
X-CSE-MsgGUID: HYVeV6uiRyijeCCr8XQm7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; d="scan'208";a="120245850"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.22])
 ([10.245.246.22])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2025 03:16:19 -0800
Message-ID: <e66a3549e21036b25d528520339a22f6119763b0.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/xe/userptr:
 Fix an incorrect assert
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 08 Mar 2025 12:16:14 +0100
In-Reply-To: <174139976718.4957.12477891842045978367@18a75f3d1eae>
References: <20250307100109.21397-1-thomas.hellstrom@linux.intel.com>
 <174139976718.4957.12477891842045978367@18a75f3d1eae>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Sat, 2025-03-08 at 02:09 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe/userptr: Fix an incorrect assert
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/145982/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-2773-
> 2c4fba1d065427efba4aaed5f80f4664c9f4a729_full -> xe-pw-145982v1_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-145982v1_full absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-145982v1_full, please notify your bug team
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
> pw-145982v1_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][1] +1 other test fail
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a2.html
>=20
> =C2=A0 * igt@kms_flip@plain-flip-ts-check@b-hdmi-a2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][2] ->=
 [FAIL][3]
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-432/igt@kms_flip@plain-flip-ts-check@b-hdmi-a2.=
html
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_flip@plain-flip-ts-check@b-hdmi-a2.html
>=20
> =C2=A0 * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][4] -> [DMESG-WARN][5]
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-adlp-1/igt@xe_fault_injection@vm-create-fail-xe_exe=
c_queue_create_bind.html
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-adlp-6/igt=
@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@xe_pm@s4-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][6] ([Intel XE#4268]) -> [ABORT][7]
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-8/igt@xe_pm@s4-mocs.html
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-4/igt@=
xe_pm@s4-mocs.html
>=20
>=20

None of the above is related to this patch.
Thanks,
Thomas


> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-145982v1_full that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][8] ([Intel XE#2385])
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_atomic@plane-primary-overlay-mutable-zpos.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][9] ([Intel XE#2327])
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_big_fb@x-tiled-16bpp-rotate-90.html
>=20
> =C2=A0 *
> igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][10] -> [DMESG-FAIL][11] ([Intel
> XE#4330])
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-0-hflip-async-flip.html
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-adlp-4/igt=
@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][12] ([Intel XE#1124]) +5
> other tests skip
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_big_fb@yf-tiled-32bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][13] -> [SKIP][14] ([Intel XE#2314] /
> [Intel XE#2894])
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays=
-3840x2160p.html
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-4/igt@=
kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][15] ([Intel XE#2314] /
> [Intel XE#2894]) +1 other test skip
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#367])
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-lnl-4/igt@=
kms_bw@linear-tiling-2-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#367])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_bw@linear-tiling-4-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][18] ([Intel XE#787]) +119
> other tests skip
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#2652] /
> [Intel XE#787]) +7 other tests skip
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#2887]) +7
> other tests skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#3432])
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][22] ([Intel XE#455] /
> [Intel XE#787]) +23 other tests skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-red-to-blue:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#2325])
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_chamelium_color@ctm-red-to-blue.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][24] ([Intel XE#2252]) +4
> other tests skip
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_chamelium_hpd@hdmi-hpd-storm-disable.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][25] ([Intel XE#1178]) +1
> other test fail
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_content_protection@atomic-dpms@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_content_protection@srm@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][26] ([Intel XE#1178]) +2
> other tests fail
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_content_protection@srm@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-random-32x32:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][27] ([Intel XE#2320]) +3
> other tests skip
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_cursor_crc@cursor-random-32x32.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][28] ([Intel XE#2286])
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursora-vs-flipa-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][29] -=
> [INCOMPLETE][30] ([Intel
> XE#3226])
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-atom=
ic.html
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_cursor_legacy@cursora-vs-flipa-atomic.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][31] -> [SKIP][32] ([Intel XE#2291])
> +2 other tests skip
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy=
.html
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-4/igt@=
kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][33] -=
> [SKIP][34] ([Intel XE#309])
> +3 other tests skip
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-vary=
ing-size.html
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-464/ig=
t@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>=20
> =C2=A0 * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#4422]) +1
> other test skip
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-2x:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][36] -> [SKIP][37] ([Intel XE#2373])
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-8/igt@kms_feature_discovery@display-2x.html
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-4/igt@=
kms_feature_discovery@display-2x.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][38] -> [FAIL][39] ([Intel XE#3321])
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2=
-hdmi-a3.html
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-7/igt@=
kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][40] -=
> [FAIL][41] ([Intel XE#2882])
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-inte=
rruptible.html
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a2-
> dp2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][42] ([Intel XE#2882])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a2-dp2.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][43] -> [SKIP][44] ([Intel XE#2316])
> +5 other tests skip
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interrupt=
ible.html
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-4/igt@=
kms_flip@2x-plain-flip-ts-check-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][45] -=
> [SKIP][46] ([Intel XE#310])
> +2 other tests skip
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check-interrup=
tible.html
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-464/ig=
t@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][47] -=
> [FAIL][48] ([Intel XE#2882] /
> [Intel XE#3098])
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-int=
erruptible.html
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][49] ([Intel XE#3098])
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][50] ([Intel XE#3321]) +2
> other tests fail
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_flip@flip-vs-expired-vblank@a-dp2.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][51] ([Intel XE#301] /
> [Intel XE#3321]) +1 other test fail
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_flip@flip-vs-expired-vblank@c-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][52] -=
> [FAIL][53] ([Intel XE#301])
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-=
a6.html
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-rmfb:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][54] -=
> [INCOMPLETE][55] ([Intel
> XE#2049])
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_flip@flip-vs-rmfb.html
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_flip@flip-vs-rmfb.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-rmfb@b-dp2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][56] ([Intel
> XE#2049])
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_flip@flip-vs-rmfb@b-dp2.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-rmfb@c-dp2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][57] -> [INCOMPLETE][58] ([Intel
> XE#2049]) +1 other test incomplete
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-2/igt@kms_flip@flip-vs-rmfb@c-dp2.html
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-8/igt@=
kms_flip@flip-vs-rmfb@c-dp2.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][59] -> [INCOMPLETE][60] ([Intel
> XE#2049] / [Intel XE#2597]) +1 other test incomplete
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.ht=
ml
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-8/igt@=
kms_flip@flip-vs-suspend-interruptible.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][61] -=
> [INCOMPLETE][62] ([Intel
> XE#2049] / [Intel XE#2597])
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.=
html
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_flip@flip-vs-suspend-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][63] ([Intel XE#2049]
> / [Intel XE#2597])
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][64] -> [DMESG-WARN][65] ([Intel
> XE#2953] / [Intel XE#4173])
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-adlp-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-adlp-6/igt=
@kms_flip@flip-vs-suspend@c-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_flip@plain-flip-ts-check@a-hdmi-a2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][66] -=
> [FAIL][67] ([Intel XE#886])
> +1 other test fail
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-432/igt@kms_flip@plain-flip-ts-check@a-hdmi-a2.=
html
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_flip@plain-flip-ts-check@a-hdmi-a2.html
>=20
> =C2=A0 * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][68] -> [FAIL][69] ([Intel XE#886])
> +2 other tests fail
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.ht=
ml
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-adlp-1/igt=
@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@p
> ipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#2293]) +3
> other tests skip
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-vali=
d-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][71] ([Intel XE#2293] /
> [Intel XE#2380]) +3 other tests skip
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][72] ([Intel XE#2311]) +12
> other tests skip
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][73] -=
> [SKIP][74] ([Intel XE#656])
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscr=
n-indfb-plflip-blt.html
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][75] ([Intel XE#4141]) +9
> other tests skip
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][76] ([Intel XE#651])
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-lnl-4/igt@=
kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][77] ([Intel XE#2313]) +15
> other tests skip
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_getfb@getfb2-accept-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][78] ([Intel XE#2340])
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_getfb@getfb2-accept-ccs.html
>=20
> =C2=A0 * igt@kms_joiner@invalid-modeset-ultra-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][79] ([Intel XE#2927])
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_joiner@invalid-modeset-ultra-joiner.html
>=20
> =C2=A0 * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][80] ([Intel XE#616])
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe
> -a:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][81] ([Intel XE#2763]) +9
> other tests skip
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
>=20
> =C2=A0 * igt@kms_pm_backlight@bad-brightness:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][82] ([Intel XE#870])
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_pm_backlight@bad-brightness.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][83] ([Intel XE#1489]) +3
> other tests skip
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-cursor-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][84] ([Intel XE#2234] /
> [Intel XE#2850]) +6 other tests skip
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_psr@fbc-pr-cursor-blt.html
>=20
> =C2=A0 * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][85] ([Intel XE#2414])
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_psr_stress_test@flip-primary-invalidate-overlay.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][86] ([Intel XE#3414] /
> [Intel XE#3904])
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][87] -> [FAIL][88] ([Intel XE#899])
> +1 other test fail
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a=
-edp-1.html
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-lnl-5/igt@=
kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_vrr@flipline:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][89] ([Intel XE#1499])
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_vrr@flipline.html
>=20
> =C2=A0 * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][90] ([Intel XE#1091] /
> [Intel XE#2849])
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>=20
> =C2=A0 * igt@xe_eudebug@discovery-race-vmbind:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][91] ([Intel XE#2905]) +3
> other tests skip
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
xe_eudebug@discovery-race-vmbind.html
>=20
> =C2=A0 * igt@xe_eudebug_online@stopped-thread:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][92] ([Intel XE#2905])
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-lnl-4/igt@=
xe_eudebug_online@stopped-thread.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][93] ([Intel XE#1392])
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-lnl-4/igt@=
xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-null-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][94] ([Intel XE#2322]) +4
> other tests skip
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
xe_exec_basic@multigpu-once-null-rebind.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][95] -=
> [SKIP][96] ([Intel XE#1392])
> +7 other tests skip
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null-rebind=
.html
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-once-null-rebind.html
>=20
> =C2=A0 * igt@xe_peer2peer@read:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][97] ([Intel XE#2427])
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
xe_peer2peer@read.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-d3cold-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][98] ([Intel XE#2284])
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
xe_pm@s2idle-d3cold-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-exec-after:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [ABORT][99] ([Intel XE#4268])
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-lnl-4/igt@=
xe_pm@s4-exec-after.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze@gt0:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][100] -> [DMESG-WARN][101] ([Intel
> XE#4173]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-adlp-8/igt=
@xe_pm_residency@gt-c6-freeze@gt0.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-cs-cycles:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][102] ([Intel XE#944])
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
xe_query@multigpu-query-cs-cycles.html
>=20
> =C2=A0 * igt@xe_sriov_auto_provisioning@selfconfig-basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][103] ([Intel XE#4130])
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
xe_sriov_auto_provisioning@selfconfig-basic.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][104] =
([Intel XE#309]) -> [PASS][105]
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_cursor_legacy@2x-long-nonblocking-m=
odeset-vs-cursor-atomic.html
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][106] ([Intel XE#2291]) ->
> [PASS][107] +3 other tests pass
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_dp_aux_dev:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][108] =
([Intel XE#3009]) ->
> [PASS][109]
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_dp_aux_dev.html
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_dp_aux_dev.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-2x:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][110] =
([Intel XE#702]) -> [PASS][111]
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_feature_discovery@display-2x.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][112] ([Intel XE#3321]) ->
> [PASS][113] +3 other tests pass
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2=
-hdmi-a3.html
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-7/igt@=
kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-nonexisting-fb-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][114] =
([Intel XE#310]) -> [PASS][115]
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptibl=
e.html
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_flip@2x-nonexisting-fb-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][116] ([Intel XE#2316]) ->
> [PASS][117] +5 other tests pass
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interrupti=
ble.html
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_flip@2x-wf_vblank-ts-check-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][118] ([Intel XE#886]) -> [PASS][119]
> +1 other test pass
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-inter=
ruptible.html
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-lnl-1/igt@=
kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][120] =
([Intel XE#301]) -> [PASS][121]
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-=
a6.html
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][122] =
([Intel XE#656]) -> [PASS][123]
> +4 other tests pass
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscr=
n-spr-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][124] ([Intel XE#2571]) ->
> [PASS][125]
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.ht=
ml
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_plane_scaling@2x-scaler-multi-pipe.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pi
> pe-b:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][126] ([Intel XE#2566]) ->
> [PASS][127] +1 other test pass
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipp=
ing-clamping-rotation@pipe-b.html
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-lnl-4/igt@=
kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pip
> e-a:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][128] ([Intel XE#4173]) ->
> [PASS][129] +1 other test pass
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-adlp-6/igt@kms_plane_scaling@plane-upscale-factor-0=
-25-with-pixel-format@pipe-a.html
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-adlp-8/igt=
@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][130] ([Intel XE#718]) -> [PASS][131]
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-adlp-8/igt=
@kms_pm_dc@dc6-dpms.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][132] =
([Intel XE#836]) -> [PASS][133]
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_pm_rpm@modeset-non-lpsp-stress.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-
> edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][134] ([Intel XE#324]) ->
> [PASS][135] +2 other tests pass
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-co=
ntinuous-sf@pipe-a-edp-1.html
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-lnl-8/igt@=
kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-=
rebind
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][136] =
([Intel XE#1392]) ->
> [PASS][137] +2 other tests pass
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-=
many-vm-bindexecqueue-userptr-rebind.html
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-464/ig=
t@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebi=
nd.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-hang-rebind-err:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[138] ([Intel XE#3876]) ->
> [PASS][139]
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind-err=
.html
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-464/ig=
t@xe_exec_threads@threads-hang-rebind-err.html
>=20
> =C2=A0 * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][140] -> [PASS][141]
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_exec=
_queue_create_bind.html
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][142] =
([Intel XE#455] / [Intel
> XE#787]) -> [SKIP][143] ([Intel XE#787]) +5 other tests skip
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-c=
cs@pipe-d-hdmi-a-6.html
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][144] =
([Intel XE#455]) -> [FAIL][145]
> ([Intel XE#1178])
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_content_protection@atomic-dpms.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][146] ([Intel XE#2312]) ->
> [SKIP][147] ([Intel XE#2311]) +10 other tests skip
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn=
-indfb-pgflip-blt.html
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][148] ([Intel XE#2311]) ->
> [SKIP][149] ([Intel XE#2312]) +12 other tests skip
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn=
-indfb-pgflip-blt.html
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][150] ([Intel XE#2312]) ->
> [SKIP][151] ([Intel XE#4141]) +1 other test skip
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
shrfb-msflip-blt.html
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][152] ([Intel XE#4141]) ->
> [SKIP][153] ([Intel XE#2312]) +5 other tests skip
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
spr-indfb-onoff.html
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][154] =
([Intel XE#651]) -> [SKIP][155]
> ([Intel XE#656]) +7 other tests skip
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri=
mscrn-pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][156] =
([Intel XE#656]) -> [SKIP][157]
> ([Intel XE#651]) +9 other tests skip
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scn=
dscrn-indfb-plflip-blt.html
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][158] ([Intel XE#2312]) ->
> [SKIP][159] ([Intel XE#2313]) +12 other tests skip
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primsc=
rn-spr-indfb-onoff.html
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][160] ([Intel XE#2313]) ->
> [SKIP][161] ([Intel XE#2312]) +12 other tests skip
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-cur-indfb-draw-blt.html
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][162] =
([Intel XE#653]) -> [SKIP][163]
> ([Intel XE#656]) +6 other tests skip
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scnd=
scrn-pri-shrfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][164] =
([Intel XE#656]) -> [SKIP][165]
> ([Intel XE#653]) +5 other tests skip
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscr=
n-shrfb-msflip-blt.html
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][166] ([Intel XE#3374] / [Intel
> XE#3544]) -> [SKIP][167] ([Intel XE#3544])
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-4/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][168] =
([Intel XE#362]) -> [FAIL][169]
> ([Intel XE#1729])
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.ht=
ml
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-432/ig=
t@kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@xe_pm@s4-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][170] ([Intel XE#4054] / [Intel
> XE#4268]) -> [ABORT][171] ([Intel XE#4268])
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-adlp-9/igt@xe_pm@s4-basic.html
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-adlp-4/igt=
@xe_pm@s4-basic.html
>=20
> =C2=A0 * igt@xe_pm@s4-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][172] -> [ABORT][173] ([Intel
> XE#4268])
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-bmg-2/igt@xe_pm@s4-basic-exec.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-bmg-8/igt@=
xe_pm@s4-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [ABORT][174]=
 ([Intel XE#4268]) ->
> [ABORT][175] ([Intel XE#4054])
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2773-2c4fba1d065427efba4aaed=
5f80f4664c9f4a729/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/shard-dg2-433/ig=
t@xe_pm@s4-vm-bind-userptr.html
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
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1499]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> =C2=A0 [Intel XE#1729]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> =C2=A0 [Intel XE#2049]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2284]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> =C2=A0 [Intel XE#2286]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
> =C2=A0 [Intel XE#2291]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> =C2=A0 [Intel XE#2293]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
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
> =C2=A0 [Intel XE#2320]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2325]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> =C2=A0 [Intel XE#2327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> =C2=A0 [Intel XE#2340]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
> =C2=A0 [Intel XE#2373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
> =C2=A0 [Intel XE#2380]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> =C2=A0 [Intel XE#2385]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
> =C2=A0 [Intel XE#2414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
> =C2=A0 [Intel XE#2427]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
> =C2=A0 [Intel XE#2566]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
> =C2=A0 [Intel XE#2571]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
> =C2=A0 [Intel XE#2597]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> =C2=A0 [Intel XE#2652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> =C2=A0 [Intel XE#2763]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> =C2=A0 [Intel XE#2849]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#2882]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2894]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> =C2=A0 [Intel XE#2905]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> =C2=A0 [Intel XE#2927]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#3009]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#3098]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
> =C2=A0 [Intel XE#310]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> =C2=A0 [Intel XE#3226]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
> =C2=A0 [Intel XE#324]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
> =C2=A0 [Intel XE#3321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> =C2=A0 [Intel XE#3374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
> =C2=A0 [Intel XE#3414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> =C2=A0 [Intel XE#3432]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> =C2=A0 [Intel XE#3544]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#3876]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
> =C2=A0 [Intel XE#3904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> =C2=A0 [Intel XE#4054]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054
> =C2=A0 [Intel XE#4130]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
> =C2=A0 [Intel XE#4141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4268]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
> =C2=A0 [Intel XE#4330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
> =C2=A0 [Intel XE#4422]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#616]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#702]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
> =C2=A0 [Intel XE#718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#836]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#886]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> =C2=A0 [Intel XE#899]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-2773-2c4fba1d065427efba4aaed5f80f4664c9f4a729 -> xe-pw=
-
> 145982v1
>=20
> =C2=A0 IGT_8264: 8264
> =C2=A0 xe-2773-2c4fba1d065427efba4aaed5f80f4664c9f4a729:
> 2c4fba1d065427efba4aaed5f80f4664c9f4a729
> =C2=A0 xe-pw-145982v1: 145982v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145982v1/index.html

