Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F6BCAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 09:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6848810E36F;
	Thu,  2 Oct 2025 09:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mb+9QirI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CBE10E369
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759398333; x=1790934333;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=1BWKcNm7Xg18BprbEnXuLZ/tQXmB43F7ZgDEIucfxkU=;
 b=mb+9QirIsWcEONOcTH+bBLMpAysjUWxfYeiudYEc9I7IE6hFga765t6p
 ItC8wh0tVWXUHJrzX19JwnRInkHWm2EkKcldmMGhW64WqrUdQWJXxwCbM
 pfw0kAwhS6B1b79SWoyGSDeo2LJvPG4KJrUZAus80Dx9brLIYsbx44XXg
 1FW2anG6WVK0JAIXBNeX+bxT9QoGV2iP7EM44uGj0yMlpMksQIAlcc/ve
 1iO2cCR3O7LJG7D2Y2usPmyUbN63kgSdU36Tpif5G98F7mUe2jItqWR/S
 C69CzIUUjcNwBCM0oD7ZuyfjBBv2FpZuncMOl+hiqBixgr65BCdNI4GyI Q==;
X-CSE-ConnectionGUID: RP/NMd7rTqCie0rJ5Rmj6g==
X-CSE-MsgGUID: J0SbtDPcTpyJwDEMrt0Ogg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61569849"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="61569849"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 02:45:33 -0700
X-CSE-ConnectionGUID: 87RBLXr0R8CDT9pQZQunPw==
X-CSE-MsgGUID: z9E/gGfHSLGUWBauHcsGHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178115256"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.245.181])
 ([10.245.245.181])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 02:45:32 -0700
Message-ID: <193d99b66dcd73417d94dc816bf9e02822ecbda0.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/gpusvm,
 drm/xe: Fix userptr to not allow device private pages (rev2)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 02 Oct 2025 11:45:28 +0200
In-Reply-To: <175922356038.377882.11378431231115787429@1538d3639d33>
References: <20250930072144.12170-1-thomas.hellstrom@linux.intel.com>
 <175922356038.377882.11378431231115787429@1538d3639d33>
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

On Tue, 2025-09-30 at 09:12 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/gpusvm, drm/xe: Fix userptr to not allow device private
> pages (rev2)
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/155175/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-3843-
> 85a5199d1e7b009e10b7c2cad0c43d28f0540085_FULL -> xe-pw-155175v2_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-155175v2_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-155175v2_FULL, please notify your bug team
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
> pw-155175v2_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_create@create-contexts:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][1] -> [FAIL][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-2/igt@xe_create@create-contexts.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-6/igt=
@xe_create@create-contexts.html
>=20
> =C2=A0 * igt@xe_pmu@fn-engine-activity-sched-if-idle:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][3] -> [SKIP][4]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.=
html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-6/igt=
@xe_pmu@fn-engine-activity-sched-if-idle.html

These failures are unrelated.
/Thomas

>=20
> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-155175v2_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@intel_hwmon@hwmon-write:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][5] -> [FAIL][6] ([Intel XE#4665])
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-7/igt@intel_hwmon@hwmon-write.html
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-4/igt@=
intel_hwmon@hwmon-write.html
>=20
> =C2=A0 *
> igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pi
> pe-c-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][7] -> [FAIL][8] ([Intel XE#6054]) +3
> other tests fail
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip=
-events-linear-atomic@pipe-c-edp-1.html
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-5/igt@=
kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1=
.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe=
-
> c-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][9] -> [FAIL][10] ([Intel XE#5993])
> +3 other tests fail
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip=
-events-linear@pipe-c-edp-1.html
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-5/igt@=
kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
>=20
> =C2=A0 * igt@kms_atomic_transition@plane-all-modeset-transition:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][11] ([Intel XE#3279])
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-8/igt@=
kms_atomic_transition@plane-all-modeset-transition.html
>=20
> =C2=A0 * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][12] -> [FAIL][13] ([Intel XE#3908])
> +1 other test fail
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-=
transition-fencing.html
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-9/igt=
@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][14] ([Intel XE#619])
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@kms_big_fb@4-tiled-addfb.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][15] ([Intel XE#316])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-463/ig=
t@kms_big_fb@x-tiled-16bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#316])
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-1/igt=
@kms_big_fb@y-tiled-64bpp-rotate-270.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#1124]) +1
> other test skip
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-2/igt@=
kms_big_fb@y-tiled-64bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][18] ([Intel XE#1124]) +8
> other tests skip
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-466/ig=
t@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
>=20
> =C2=A0 *
> igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][19] ([Intel
> XE#4543])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-9/igt=
@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#1124]) +2
> other tests skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-5/igt@=
kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1
> other test skip
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@kms_big_fb@yf-tiled-16bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][22] ([Intel XE#2191])
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-436/ig=
t@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#367]) +1
> other test skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-9/igt=
@kms_bw@linear-tiling-4-displays-1920x1080p.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][24] ([Intel XE#367]) +1
> other test skip
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-434/ig=
t@kms_bw@linear-tiling-4-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][25] ([Intel XE#367]) +1
> other test skip
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-7/igt@=
kms_bw@linear-tiling-4-displays-3840x2160p.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#1512])
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-5/igt@=
kms_bw@linear-tiling-4-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a=
-
> 1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][27] ([Intel XE#787]) +5
> other tests skip
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][28] ([Intel XE#2907]) +1
> other test skip
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-434/ig=
t@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][29] ([Intel XE#787]) +174
> other tests skip
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-432/ig=
t@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][30] -=
> [INCOMPLETE][31] ([Intel
> XE#3862]) +1 other test incomplete
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2=
-mc-ccs@pipe-d-dp-4.html
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-435/ig=
t@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][32] ([Intel XE#3432])
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-2/igt@=
kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a=
-
> 1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#455] /
> [Intel XE#787]) +3 other tests skip
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-2/igt=
@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][34] ([Intel XE#3442])
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-466/ig=
t@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#2887]) +3
> other tests skip
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-7/igt@=
kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][36] ([Intel XE#2887]) +1
> other test skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-2/igt@=
kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][37] ([Intel XE#2907])
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-2/igt=
@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-
> a-3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][38] ([Intel XE#2652] /
> [Intel XE#787]) +8 other tests skip
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-7/igt@=
kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][39] ([Intel
> XE#6168])
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [D=
MESG-WARN][40] ([Intel XE#1727]
> / [Intel XE#3113])
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][41] ([Intel XE#455] /
> [Intel XE#787]) +29 other tests skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-432/ig=
t@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][42] ([Intel XE#4416] /
> [Intel XE#455])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-2/igt=
@kms_cdclk@plane-scaling.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][43] ([Intel XE#4416]) +2
> other tests skip
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-2/igt=
@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][44] ([Intel XE#4416]) +3
> other tests skip
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-434/ig=
t@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][45] ([Intel XE#455]) +3
> other tests skip
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-2/igt=
@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_chamelium_audio@dp-audio:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][46] ([Intel XE#373]) +11
> other tests skip
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-463/ig=
t@kms_chamelium_audio@dp-audio.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#373]) +3
> other tests skip
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-2/igt@=
kms_chamelium_audio@dp-audio.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-green-to-red:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][48] ([Intel XE#306])
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-432/ig=
t@kms_chamelium_color@ctm-green-to-red.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#2252]) +1
> other test skip
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-5/igt@=
kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#373]) +3
> other tests skip
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-4/igt=
@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
>=20
> =C2=A0 * igt@kms_content_protection@legacy@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][51] ([Intel XE#1178])
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-1/igt@=
kms_content_protection@legacy@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_content_protection@mei-interface:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][52] ([Intel XE#1468])
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-4/igt@=
kms_content_protection@mei-interface.html
>=20
> =C2=A0 * igt@kms_content_protection@srm@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][53] ([Intel XE#1178]) +1
> other test fail
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-434/ig=
t@kms_content_protection@srm@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][54] ([Intel XE#1188]) +1
> other test fail
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-436/ig=
t@kms_content_protection@uevent.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][55] ([Intel XE#1188])
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-2/igt@=
kms_content_protection@uevent@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][56] ([Intel XE#1424])
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-7/igt@=
kms_cursor_crc@cursor-rapid-movement-128x42.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-512x512:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][57] ([Intel XE#308])
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-3/igt=
@kms_cursor_crc@cursor-sliding-512x512.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][58] ([Intel XE#308])
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-464/ig=
t@kms_cursor_crc@cursor-sliding-512x512.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][59] ([Intel XE#309])
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-2/igt@=
kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][60] -> [SKIP][61] ([Intel XE#2291])
> +1 other test skip
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][62] ([Intel XE#309]) +1
> other test skip
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-4/igt=
@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][63] -> [FAIL][64] ([Intel XE#5299])
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.h=
tml
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-7/igt@=
kms_cursor_legacy@flip-vs-cursor-legacy.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-va=
rying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][65] ([Intel XE#323])
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-6/igt=
@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying=
-size.html
>=20
> =C2=A0 * igt@kms_dp_link_training@uhbr-mst:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][66] ([Intel XE#4354])
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-2/igt@=
kms_dp_link_training@uhbr-mst.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#4354])
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-8/igt@=
kms_dp_link_training@uhbr-mst.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][68] ([Intel XE#4356])
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-464/ig=
t@kms_dp_link_training@uhbr-mst.html
>=20
> =C2=A0 * igt@kms_dp_linktrain_fallback@dsc-fallback:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][69] ([Intel XE#4331])
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-435/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#2244])
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_dsc@dsc-basic.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@psr-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][71] ([Intel XE#776])
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-464/ig=
t@kms_fbcon_fbt@psr-suspend.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-2x:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][72] -> [SKIP][73] ([Intel XE#2373])
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_feature_discovery@display-2x.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][74] -> [SKIP][75] ([Intel XE#2316])
> +3 other tests skip
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-i=
nterruptible.html
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-dpms-on-nop:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][76] ([Intel XE#1421]) +1
> other test skip
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-4/igt@=
kms_flip@2x-flip-vs-dpms-on-nop.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][77] ([Intel XE#310]) +2
> other tests skip
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@kms_flip@2x-plain-flip-ts-check-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-dpms-on-nop:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][78] -> [DMESG-WARN][79] ([Intel
> XE#2953] / [Intel XE#4173] / [Intel XE#4543])
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-6/igt@kms_flip@flip-vs-dpms-on-nop.html
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-1/igt=
@kms_flip@flip-vs-dpms-on-nop.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][80] ([Intel
> XE#4543]) +3 other tests dmesg-warn
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-3/igt=
@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][81] -> [FAIL][82] ([Intel XE#301])
> +1 other test fail
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.ht=
ml
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-7/igt@=
kms_flip@flip-vs-expired-vblank@a-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-rmfb-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][83] -> [DMESG-WARN][84] ([Intel
> XE#4543] / [Intel XE#5208])
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-2/igt=
@kms_flip@flip-vs-rmfb-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][85] -> [DMESG-WARN][86] ([Intel
> XE#4543]) +7 other tests dmesg-warn
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible@b-hd=
mi-a1.html
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-2/igt=
@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][87] ([Intel XE#2293] /
> [Intel XE#2380])
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][88] ([Intel XE#1401] /
> [Intel XE#1745])
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-3/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@p
> ipe-a-default-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][89] ([Intel XE#1401])
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-3/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-defa=
ult-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@p
> ipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][90] ([Intel XE#2293])
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-vali=
d-mode.html
>=20
> =C2=A0 * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][91] -> [DMESG-FAIL][92] ([Intel
> XE#4543])
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-=
c-hdmi-a-1-y-to-x.html
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-3/igt=
@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt=
:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][93] ([Intel XE#651]) +3
> other tests skip
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-8/igt@=
kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][94] ([Intel XE#651]) +1
> other test skip
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][95] ([Intel XE#2311]) +1
> other test skip
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-8/igt@=
kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][96] ([Intel XE#651]) +24
> other tests skip
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-463/ig=
t@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][97] ([Intel XE#656]) +4
> other tests skip
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-9/igt=
@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][98] ([Intel XE#5390])
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-modesetfrombusy.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][99] ([Intel XE#653]) +3
> other tests skip
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-4/igt=
@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][100] ([Intel XE#2313]) +1
> other test skip
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][101] ([Intel XE#653]) +26
> other tests skip
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][102] ([Intel XE#656]) +8
> other tests skip
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-3/igt@=
kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_hdmi_inject@inject-4k:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][103] ([Intel XE#1470])
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-5/igt@=
kms_hdmi_inject@inject-4k.html
>=20
> =C2=A0 * igt@kms_hdr@static-swap:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][104] -> [SKIP][105] ([Intel
> XE#1503])
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-4/igt@kms_hdr@static-swap.html
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_hdr@static-swap.html
>=20
> =C2=A0 * igt@kms_joiner@basic-force-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][106] -> [SKIP][107] ([Intel
> XE#3012])
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_joiner@basic-force-big-joiner.html
>=20
> =C2=A0 * igt@kms_plane@plane-panning-bottom-right-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][108] -> [DMESG-WARN][109] ([Intel
> XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-sus=
pend.html
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-1/igt=
@kms_plane@plane-panning-bottom-right-suspend.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][110] ([Intel XE#455]) +10
> other tests skip
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-464/ig=
t@kms_plane_lowres@tiling-y.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][111] ([Intel XE#599])
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-4/igt@=
kms_plane_lowres@tiling-y.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][112] ([Intel XE#4596])
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@kms_plane_multiple@2x-tiling-4.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][113] ([Intel XE#4596])
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-5/igt@=
kms_plane_multiple@2x-tiling-4.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats
> @pipe-b:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][114] ([Intel XE#2763]) +1
> other test skip
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-1/igt@=
kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.=
html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][115] ([Intel XE#908])
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-436/ig=
t@kms_pm_dc@dc6-dpms.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][116] -> [FAIL][117] ([Intel XE#718])
> +1 other test fail
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-7/igt@=
kms_pm_dc@dc6-dpms.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc9-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][118] ([Intel XE#734])
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-3/igt=
@kms_pm_dc@dc9-dpms.html
>=20
> =C2=A0 * igt@kms_pm_dc@deep-pkgc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][119] ([Intel XE#2007])
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-1/igt=
@kms_pm_dc@deep-pkgc.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][120] ([Intel XE#2505])
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-3/igt@=
kms_pm_dc@deep-pkgc.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][121] ([Intel XE#1439] /
> [Intel XE#3141])
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-2/igt@=
kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>=20
> =C2=A0 * igt@kms_pm_rpm@universal-planes-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][122] ([Intel
> XE#2953] / [Intel XE#4173] / [Intel XE#5750])
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-4/igt=
@kms_pm_rpm@universal-planes-dpms.html
>=20
> =C2=A0 * igt@kms_pm_rpm@universal-planes-dpms@plane-63:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][123] ([Intel
> XE#2953] / [Intel XE#4173])
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-4/igt=
@kms_pm_rpm@universal-planes-dpms@plane-63.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][124] ([Intel XE#1406] /
> [Intel XE#1489]) +4 other tests skip
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-464/ig=
t@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][125] ([Intel XE#1406] /
> [Intel XE#2893])
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-4/igt@=
kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][126] ([Intel XE#1406])
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-8/igt@=
kms_psr@fbc-pr-suspend.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][127] ([Intel XE#1406] /
> [Intel XE#2850] / [Intel XE#929]) +11 other tests skip
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-435/ig=
t@kms_psr@fbc-psr2-sprite-plane-onoff.html
>=20
> =C2=A0 * igt@kms_psr@psr-cursor-plane-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][128] ([Intel XE#1406] /
> [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@kms_psr@psr-cursor-plane-onoff.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][129] ([Intel XE#1406] /
> [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-5/igt@=
kms_psr@psr-cursor-plane-onoff.html
>=20
> =C2=A0 * igt@kms_rotation_crc@bad-pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][130] ([Intel XE#3414]) +1
> other test skip
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@kms_rotation_crc@bad-pixel-format.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][131] ([Intel XE#3414]) +1
> other test skip
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-435/ig=
t@kms_rotation_crc@bad-pixel-format.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][132] ([Intel XE#3414] /
> [Intel XE#3904])
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-8/igt@=
kms_rotation_crc@primary-4-tiled-reflect-x-0.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][133] ([Intel XE#3414] /
> [Intel XE#3904])
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-1/igt@=
kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>=20
> =C2=A0 * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][134] -> [FAIL][135] ([Intel
> XE#2142]) +1 other test fail
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a=
-edp-1.html
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-5/igt@=
kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][136] -> [FAIL][137] ([Intel
> XE#5937])
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-2/igt@sriov_basic@enable-vfs-bind-unbind-each-n=
umvfs-all.html
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-3/igt@=
sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0x3fff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][138] ([Intel XE#1123])
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-434/ig=
t@xe_copy_basic@mem-copy-linear-0x3fff.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0xfffe:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][139] ([Intel XE#1126])
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-464/ig=
t@xe_copy_basic@mem-set-linear-0xfffe.html
>=20
> =C2=A0 * igt@xe_eu_stall@invalid-sampling-rate:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][140] ([Intel XE#5626]) +1
> other test skip
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-434/ig=
t@xe_eu_stall@invalid-sampling-rate.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-vm-access-parameters-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][141] ([Intel XE#4837] /
> [Intel XE#5565]) +2 other tests skip
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-1/igt=
@xe_eudebug@basic-vm-access-parameters-userptr.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-vm-bind-vm-destroy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][142] ([Intel XE#4837])
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-7/igt@=
xe_eudebug@basic-vm-bind-vm-destroy.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][143] ([Intel XE#4837])
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-7/igt@=
xe_eudebug@basic-vm-bind-vm-destroy.html
>=20
> =C2=A0 * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][144] ([Intel XE#4837]) +8
> other tests skip
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-464/ig=
t@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html
>=20
> =C2=A0 * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][145] ([Intel XE#688]) +1
> other test skip
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-4/igt@=
xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][146] ([Intel XE#1392] /
> [Intel XE#5575]) +1 other test skip
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-1/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][147] ([Intel XE#2322]) +1
> other test skip
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-3/igt@=
xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][148] =
-> [SKIP][149] ([Intel
> XE#1392]) +6 other tests skip
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-basic-de=
fer-mmap.html
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][150] ([Intel XE#1392]) +2
> other tests skip
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-3/igt@=
xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][151] ([Intel XE#288] /
> [Intel XE#5561]) +4 other tests skip
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-9/igt=
@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][152] ([Intel XE#288]) +16
> other tests skip
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-463/ig=
t@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
>=20
> =C2=A0 * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][153] ([Intel XE#2360])
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-464/ig=
t@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
>=20
> =C2=A0 * igt@xe_exec_reset@cm-cat-error:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][154] ([Intel
> XE#3868])
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-4/igt=
@xe_exec_reset@cm-cat-error.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dont=
unmap-eocheck
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][155] ([Intel XE#4915]) +54
> other tests skip
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-2/igt=
@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap=
-eocheck.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][156] ([Intel XE#4943]) +2
> other tests skip
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-2/igt@=
xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@threads-many-mmap-huge:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][157] ([Intel XE#4943]) +1
> other test skip
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-1/igt@=
xe_exec_system_allocator@threads-many-mmap-huge.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][158] ([Intel XE#4915])
> +198 other tests skip
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-466/ig=
t@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_eudebug:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][159] ([Intel XE#2833])
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-3/igt@=
xe_live_ktest@xe_eudebug.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][160] ([Intel XE#455] /
> [Intel XE#5712])
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-3/igt=
@xe_live_ktest@xe_eudebug.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][161] ([Intel XE#2833])
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-4/igt@=
xe_live_ktest@xe_eudebug.html
>=20
> =C2=A0 * igt@xe_oa@mi-rpc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][162] ([Intel XE#3573]) +7
> other tests skip
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-432/ig=
t@xe_oa@mi-rpc.html
>=20
> =C2=A0 * igt@xe_oa@non-sampling-read-error:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][163] ([Intel XE#3573]) +1
> other test skip
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-6/igt=
@xe_oa@non-sampling-read-error.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xehpc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][164] ([Intel XE#2838] /
> [Intel XE#979])
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-432/ig=
t@xe_pat@pat-index-xehpc.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xelpg:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][165] ([Intel XE#979])
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-8/igt@=
xe_pat@pat-index-xelpg.html
>=20
> =C2=A0 * igt@xe_pm@d3hot-i2c:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][166] ([Intel XE#5742])
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-463/ig=
t@xe_pm@d3hot-i2c.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-vm-bind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][167] -> [INCOMPLETE][168] ([Intel
> XE#4504])
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-prefetch.html
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-6/igt=
@xe_pm@s2idle-vm-bind-prefetch.html
>=20
> =C2=A0 * igt@xe_pmu@all-fn-engine-activity-load:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][169] ([Intel XE#4650])
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-466/ig=
t@xe_pmu@all-fn-engine-activity-load.html
>=20
> =C2=A0 * igt@xe_pmu@fn-engine-activity-sched-if-idle:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][170] -> [DMESG-WARN][171] ([Intel
> XE#3876])
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.h=
tml
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
xe_pmu@fn-engine-activity-sched-if-idle.html
>=20
> =C2=A0 * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][172] ([Intel XE#4733]) +1
> other test skip
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-435/ig=
t@xe_pxp@pxp-stale-bo-bind-post-rpm.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-mem-usage:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][173] ([Intel XE#944]) +1
> other test skip
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-464/ig=
t@xe_query@multigpu-query-mem-usage.html
>=20
> =C2=A0 * igt@xe_sriov_flr@flr-vfs-parallel:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][174] ([Intel XE#4273])
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-2/igt@=
xe_sriov_flr@flr-vfs-parallel.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[175] ([Intel XE#1727] / [Intel
> XE#3113] / [Intel XE#4345]) -> [PASS][176] +1 other test pass
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-=
ccs@pipe-b-dp-4.html
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-435/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[177] ([Intel XE#1727] / [Intel
> XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345]) ->
> [PASS][178]
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs.html
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[179] ([Intel XE#2705] / [Intel
> XE#3113] / [Intel XE#4212] / [Intel XE#4345]) -> [PASS][180]
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs@pipe-a-hdmi-a-6.html
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-463/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[181] ([Intel XE#3226]) ->
> [PASS][182]
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-legacy=
.html
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-466/ig=
t@kms_cursor_legacy@cursor-vs-flip-legacy.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][183] ([Intel XE#5354]) ->
> [PASS][184] +1 other test pass
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-7/igt@=
kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][185] ([Intel XE#2291]) ->
> [PASS][186] +4 other tests pass
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-5/igt@=
kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][187] ([Intel XE#1340]) ->
> [PASS][188]
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-4/igt@=
kms_dither@fb-8bpc-vs-panel-6bpc.html
>=20
> =C2=A0 * igt@kms_dp_linktrain_fallback@dp-fallback:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][189] ([Intel XE#4294]) ->
> [PASS][190]
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.htm=
l
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-8/igt@=
kms_dp_linktrain_fallback@dp-fallback.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][191] =
([Intel XE#301]) -> [PASS][192]
> +1 other test pass
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bd-h=
dmi-a6-dp4.html
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-435/ig=
t@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][193] ([Intel XE#2316]) ->
> [PASS][194] +2 other tests pass
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-4/igt@=
kms_flip@2x-plain-flip-fb-recreate.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][195] ([Intel XE#301] / [Intel
> XE#3149]) -> [PASS][196]
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible.html
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-4/igt@=
kms_flip@flip-vs-expired-vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][197] ([Intel XE#301]) -> [PASS][198]
> +1 other test pass
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible@c-edp1.html
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-4/igt@=
kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][199] ([Intel XE#4543]) ->
> [PASS][200] +3 other tests pass
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][201] ([Intel XE#2953] / [Intel
> XE#4173]) -> [PASS][202] +1 other test pass
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@kms_flip@flip-vs-suspend@d-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][203] ([Intel XE#4543]) ->
> [PASS][204]
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-=
b-hdmi-a-1-x-to-y.html
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-3/igt=
@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
>=20
> =C2=A0 * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][205] ([Intel XE#1874]) ->
> [PASS][206]
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-=
c-hdmi-a-1-x-to-y.html
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-3/igt=
@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
>=20
> =C2=A0 * igt@kms_vblank@query-busy-hang:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][207] ([Intel XE#4488]) ->
> [PASS][208] +1 other test pass
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-3/igt@kms_vblank@query-busy-hang.html
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-7/igt@=
kms_vblank@query-busy-hang.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][209] ([Intel XE#4488]) ->
> [PASS][210] +1 other test pass
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-1/igt@kms_vblank@query-busy-hang.html
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-2/igt=
@kms_vblank@query-busy-hang.html
>=20
> =C2=A0 * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][211] -> [PASS][212]
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-1/igt@xe_exec_balancer@once-cm-parallel-userpt=
r-invalidate.html
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-6/igt=
@xe_exec_balancer@once-cm-parallel-userptr-invalidate.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][213] =
([Intel XE#1392]) ->
> [PASS][214] +3 other tests pass
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexec=
queue-userptr-rebind.html
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-436/ig=
t@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>=20
> =C2=A0 * igt@xe_exec_reset@parallel-gt-reset:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][215] ([Intel XE#3876]) ->
> [PASS][216]
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-9/igt=
@xe_exec_reset@parallel-gt-reset.html
>=20
> =C2=A0 * {igt@xe_exec_system_allocator@once-malloc-prefetch-race}:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [CRASH][217] ([Intel XE#6192]) ->
> [PASS][218] +18 other tests pass
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-7/igt@xe_exec_system_allocator@once-malloc-pref=
etch-race.html
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-1/igt@=
xe_exec_system_allocator@once-malloc-prefetch-race.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@threads-many-stride-new-busy:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][219] -> [PASS][220]
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-lnl-1/igt@xe_exec_system_allocator@threads-many-str=
ide-new-busy.html
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-3/igt@=
xe_exec_system_allocator@threads-many-stride-new-busy.html
>=20
> =C2=A0 * {igt@xe_exec_system_allocator@twice-malloc-prefetch}:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [CRASH][221] ([Intel XE#6192]) ->
> [PASS][222] +8 other tests pass
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-lnl-7/igt@xe_exec_system_allocator@twice-malloc-pre=
fetch.html
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-lnl-3/igt@=
xe_exec_system_allocator@twice-malloc-prefetch.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][223] ([Intel XE#3876]) ->
> [PASS][224]
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-1/igt@xe_exec_threads@threads-hang-shared-vm-u=
serptr-invalidate.html
> =C2=A0=C2=A0 [224]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-FAIL][225] ([Intel XE#3876]) ->
> [PASS][226]
> =C2=A0=C2=A0 [225]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-3/igt@xe_exec_threads@threads-hang-shared-vm-us=
erptr-invalidate.html
> =C2=A0=C2=A0 [226]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-5/igt@=
xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
>=20
> =C2=A0 * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[227] ([Intel XE#5893]) ->
> [PASS][228]
> =C2=A0=C2=A0 [227]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_gu=
c_mmio_send_recv.html
> =C2=A0=C2=A0 [228]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-463/ig=
t@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-vm-bind-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][229] ([Intel XE#4504]) ->
> [PASS][230]
> =C2=A0=C2=A0 [229]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html
> =C2=A0=C2=A0 [230]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-9/igt=
@xe_pm@s2idle-vm-bind-userptr.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze@gt0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-FAIL][231] ([Intel XE#5545]) ->
> [PASS][232] +1 other test pass
> =C2=A0=C2=A0 [231]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> =C2=A0=C2=A0 [232]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-5/igt@=
xe_pm_residency@gt-c6-freeze@gt0.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][233] ([Intel XE#5545]) ->
> [PASS][234] +1 other test pass
> =C2=A0=C2=A0 [233]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> =C2=A0=C2=A0 [234]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-3/igt=
@xe_pm_residency@gt-c6-freeze@gt0.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze@gt1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][235] -> [PASS][236]
> =C2=A0=C2=A0 [235]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt1.html
> =C2=A0=C2=A0 [236]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-5/igt@=
xe_pm_residency@gt-c6-freeze@gt1.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_content_protection@legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][237] ([Intel XE#2341]) ->
> [FAIL][238] ([Intel XE#1178])
> =C2=A0=C2=A0 [237]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-6/igt@kms_content_protection@legacy.html
> =C2=A0=C2=A0 [238]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-1/igt@=
kms_content_protection@legacy.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][239] ([Intel XE#1178]) ->
> [SKIP][240] ([Intel XE#2341])
> =C2=A0=C2=A0 [239]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-3/igt@kms_content_protection@lic-type-0.html
> =C2=A0=C2=A0 [240]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_content_protection@lic-type-0.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][241] ([Intel XE#2341]) ->
> [FAIL][242] ([Intel XE#1188])
> =C2=A0=C2=A0 [241]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-6/igt@kms_content_protection@uevent.html
> =C2=A0=C2=A0 [242]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-2/igt@=
kms_content_protection@uevent.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][243] ([Intel XE#2953] / [Intel
> XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][244] ([Intel XE#4543])
> =C2=A0=C2=A0 [243]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
> =C2=A0=C2=A0 [244]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-8/igt=
@kms_flip@flip-vs-suspend.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][245] ([Intel XE#2311]) ->
> [SKIP][246] ([Intel XE#2312]) +12 other tests skip
> =C2=A0=C2=A0 [245]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn=
-spr-indfb-draw-render.html
> =C2=A0=C2=A0 [246]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][247] ([Intel XE#2312]) ->
> [SKIP][248] ([Intel XE#5390]) +8 other tests skip
> =C2=A0=C2=A0 [247]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
indfb-msflip-blt.html
> =C2=A0=C2=A0 [248]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-5/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][249] ([Intel XE#5390]) ->
> [SKIP][250] ([Intel XE#2312]) +1 other test skip
> =C2=A0=C2=A0 [249]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
indfb-plflip-blt.html
> =C2=A0=C2=A0 [250]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][251] ([Intel XE#2312]) ->
> [SKIP][252] ([Intel XE#2311]) +12 other tests skip
> =C2=A0=C2=A0 [251]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-prims=
crn-indfb-plflip-blt.html
> =C2=A0=C2=A0 [252]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][253] ([Intel XE#2312]) ->
> [SKIP][254] ([Intel XE#2313]) +11 other tests skip
> =C2=A0=C2=A0 [253]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-shrfb-plflip-blt.html
> =C2=A0=C2=A0 [254]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-5/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][255] ([Intel XE#2313]) ->
> [SKIP][256] ([Intel XE#2312]) +9 other tests skip
> =C2=A0=C2=A0 [255]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-=
pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [256]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][257] ([Intel XE#3374] / [Intel
> XE#3544]) -> [SKIP][258] ([Intel XE#3544])
> =C2=A0=C2=A0 [257]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
> =C2=A0=C2=A0 [258]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-1/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-yf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][259] ([Intel XE#5021]) ->
> [SKIP][260] ([Intel XE#4596])
> =C2=A0=C2=A0 [259]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
> =C2=A0=C2=A0 [260]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-6/igt@=
kms_plane_multiple@2x-tiling-yf.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][261] ([Intel XE#1729]) ->
> [SKIP][262] ([Intel XE#2426])
> =C2=A0=C2=A0 [261]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
> =C2=A0=C2=A0 [262]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-8/igt@=
kms_tiled_display@basic-test-pattern.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][263] =
([Intel XE#362]) -> [FAIL][264]
> ([Intel XE#1729])
> =C2=A0=C2=A0 [263]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.ht=
ml
> =C2=A0=C2=A0 [264]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-dg2-436/ig=
t@kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][265] ([Intel XE#4917] / [Intel
> XE#5530]) -> [ABORT][266] ([Intel XE#5530])
> =C2=A0=C2=A0 [265]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc=
_ct_send_recv.html
> =C2=A0=C2=A0 [266]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-9/igt=
@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][267] ([Intel XE#4917] / [Intel
> XE#5466] / [Intel XE#5530]) -> [ABORT][268] ([Intel XE#5466] / [Intel
> XE#5530])
> =C2=A0=C2=A0 [267]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_=
ct_send_recv.html
> =C2=A0=C2=A0 [268]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-bmg-8/igt@=
xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>=20
> =C2=A0 * igt@xe_sriov_scheduling@equal-throughput:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][269] ([Intel XE#5213]) ->
> [DMESG-FAIL][270] ([Intel XE#5213] / [Intel XE#5545]) +1 other test
> dmesg-fail
> =C2=A0=C2=A0 [269]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2c=
ad0c43d28f0540085/shard-adlp-6/igt@xe_sriov_scheduling@equal-throughput.htm=
l
> =C2=A0=C2=A0 [270]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/shard-adlp-6/igt=
@xe_sriov_scheduling@equal-throughput.html
>=20
> =C2=A0=20
> =C2=A0 {name}: This element is suppressed. This means it is ignored when
> computing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the status of the =
difference (SUCCESS, WARNING, or
> FAILURE).
>=20
> =C2=A0 [Intel XE#1123]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1126]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1188]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> =C2=A0 [Intel XE#1340]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1401]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1439]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> =C2=A0 [Intel XE#1468]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
> =C2=A0 [Intel XE#1470]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1512]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
> =C2=A0 [Intel XE#1727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> =C2=A0 [Intel XE#1729]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> =C2=A0 [Intel XE#1745]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> =C2=A0 [Intel XE#1874]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> =C2=A0 [Intel XE#2007]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
> =C2=A0 [Intel XE#2142]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
> =C2=A0 [Intel XE#2191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2244]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
> =C2=A0 [Intel XE#2316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> =C2=A0 [Intel XE#2360]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
> =C2=A0 [Intel XE#2373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
> =C2=A0 [Intel XE#2380]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> =C2=A0 [Intel XE#2426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> =C2=A0 [Intel XE#2505]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
> =C2=A0 [Intel XE#2652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> =C2=A0 [Intel XE#2705]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> =C2=A0 [Intel XE#2763]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> =C2=A0 [Intel XE#2833]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
> =C2=A0 [Intel XE#2838]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2893]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
> =C2=A0 [Intel XE#2907]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#3012]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
> =C2=A0 [Intel XE#306]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> =C2=A0 [Intel XE#308]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#310]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> =C2=A0 [Intel XE#3113]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> =C2=A0 [Intel XE#3141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
> =C2=A0 [Intel XE#3149]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#3226]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
> =C2=A0 [Intel XE#323]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
> =C2=A0 [Intel XE#3279]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
> =C2=A0 [Intel XE#3374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
> =C2=A0 [Intel XE#3414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> =C2=A0 [Intel XE#3432]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> =C2=A0 [Intel XE#3442]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
> =C2=A0 [Intel XE#3544]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> =C2=A0 [Intel XE#3573]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#3862]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
> =C2=A0 [Intel XE#3868]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
> =C2=A0 [Intel XE#3876]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
> =C2=A0 [Intel XE#3904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> =C2=A0 [Intel XE#3908]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4212]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> =C2=A0 [Intel XE#4273]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
> =C2=A0 [Intel XE#4294]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
> =C2=A0 [Intel XE#4331]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
> =C2=A0 [Intel XE#4345]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> =C2=A0 [Intel XE#4354]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
> =C2=A0 [Intel XE#4356]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
> =C2=A0 [Intel XE#4416]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
> =C2=A0 [Intel XE#4488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
> =C2=A0 [Intel XE#4504]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
> =C2=A0 [Intel XE#4543]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#4596]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> =C2=A0 [Intel XE#4650]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
> =C2=A0 [Intel XE#4665]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
> =C2=A0 [Intel XE#4733]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> =C2=A0 [Intel XE#4837]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> =C2=A0 [Intel XE#4915]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> =C2=A0 [Intel XE#4917]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
> =C2=A0 [Intel XE#4943]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> =C2=A0 [Intel XE#5007]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
> =C2=A0 [Intel XE#5021]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
> =C2=A0 [Intel XE#5208]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
> =C2=A0 [Intel XE#5213]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
> =C2=A0 [Intel XE#5299]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
> =C2=A0 [Intel XE#5300]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
> =C2=A0 [Intel XE#5354]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
> =C2=A0 [Intel XE#5390]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> =C2=A0 [Intel XE#5466]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
> =C2=A0 [Intel XE#5530]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
> =C2=A0 [Intel XE#5545]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
> =C2=A0 [Intel XE#5561]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
> =C2=A0 [Intel XE#5565]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
> =C2=A0 [Intel XE#5575]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
> =C2=A0 [Intel XE#5626]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
> =C2=A0 [Intel XE#5712]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5712
> =C2=A0 [Intel XE#5742]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
> =C2=A0 [Intel XE#5750]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5750
> =C2=A0 [Intel XE#5786]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
> =C2=A0 [Intel XE#5893]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
> =C2=A0 [Intel XE#5937]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
> =C2=A0 [Intel XE#599]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
> =C2=A0 [Intel XE#5993]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
> =C2=A0 [Intel XE#6032]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
> =C2=A0 [Intel XE#6054]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
> =C2=A0 [Intel XE#6168]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
> =C2=A0 [Intel XE#619]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
> =C2=A0 [Intel XE#6192]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#688]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> =C2=A0 [Intel XE#718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> =C2=A0 [Intel XE#734]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
> =C2=A0 [Intel XE#776]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#908]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [Intel XE#979]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * IGT: IGT_8557 -> IGT_8558
> =C2=A0 * Linux: xe-3843-85a5199d1e7b009e10b7c2cad0c43d28f0540085 -> xe-pw=
-
> 155175v2
>=20
> =C2=A0 IGT_8557: 8557
> =C2=A0 IGT_8558: 8d523a5eb4860834ed1ba97dd08d591d9272f837 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 xe-3843-85a5199d1e7b009e10b7c2cad0c43d28f0540085:
> 85a5199d1e7b009e10b7c2cad0c43d28f0540085
> =C2=A0 xe-pw-155175v2: 155175v2
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155175v2/index.html

