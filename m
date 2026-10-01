Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B63BCA5FA5
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 10:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A29E10F5F5;
	Thu,  1 Oct 2026 10:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBpA3sWx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7862510F5F5
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 10:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790849183; x=1822385183;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ILy7hKYWfR8T4FTVqSfDdi9pATKpkpVNjimnM1wE648=;
 b=oBpA3sWx11jtx3elNe4QxrPrFw4JsDijVpOtOqRRdOw2gISf5sMIROo3
 gVafeOEiriRy87xTWQad0aU+MLc6fF0LtHxEq5jYLxmZEh9pWJ2xgkLFm
 3SZqUXMEqht3W5t93ETl2Rxiuk7ELc8dl9hIaW08gZyZ1/txJnqquR7xh
 VFBdvmAdHaWRXnZS/tLyG3gpV74r5HkQggUUKK+ruLtmGLCy6EtWdDExC
 dj2lQeHsaWqql2vAGJIoAWLokRvcvhyb3pl4ns89leCk5BJ1jpEz2+1CL
 33wGSOHrdT0WTpvkd2Xn8Mv1VIkBPpe5rKZPMeCsxyh0kPy72vnokkN4S g==;
X-CSE-ConnectionGUID: tNuCwlH7RuKVaSX4DoovNg==
X-CSE-MsgGUID: ulfsWyiZSf+KWieKxW9xgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90656161"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="90656161"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:06:22 -0700
X-CSE-ConnectionGUID: iPvnoE0fTyyM57SqYBTXJw==
X-CSE-MsgGUID: q634cjOcTTaW3PVS7IbBAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="274568643"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.244.16])
 ([10.245.244.16])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:06:21 -0700
Message-ID: <76e923935b8c963d4487aba16ac2d10995833559.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for drm/xe: Protect
 against premature module unloads
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 01 Oct 2026 12:06:18 +0200
In-Reply-To: <179070569387.220833.14994976099859651224@61270ab9df2a>
References: <20260929142910.47480-1-thomas.hellstrom@linux.intel.com>
 <179070569387.220833.14994976099859651224@61270ab9df2a>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
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

On Tue, 2026-09-29 at 18:14 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Protect against premature module unloads
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/175230/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-5838-
> ecc5a84be849c400af610cdc613a0274e3b101b2_FULL -> xe-pw-175230v1_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-175230v1_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-175230v1_FULL, please notify your bug team
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
> pw-175230v1_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_configfs@ctx-restore-mid-bb:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][1] -> [ABORT][2] +1 other test abort
> =C2=A0=C2=A0 [1]:

This signature is present on later series as well. Not introduced by
this one:

> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-4/igt@xe_configfs@ctx-restore-mid-bb.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-2/igt@=
xe_configfs@ctx-restore-mid-bb.html
>=20
> =C2=A0 * igt@xe_sync_file@sync_file_race:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][3]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-7/igt@=
xe_sync_file@sync_file_race.html
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][4]
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-8/igt@=
xe_sync_file@sync_file_race.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][5]
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-7/igt@=
xe_sync_file@sync_file_race.html
>=20

Unrelated.

/Thomas


> =C2=A0=20
> New tests
> ---------
>=20
> =C2=A0 New tests have been introduced between xe-5838-
> ecc5a84be849c400af610cdc613a0274e3b101b2_FULL and xe-pw-
> 175230v1_FULL:
>=20
> ### New IGT tests (8) ###
>=20
> =C2=A0 * igt@kms_lease@lease-unleased-crtc@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.16] s
>=20
> =C2=A0 * igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.05] s
>=20
> =C2=A0 * igt@kms_lease@lease-unleased-crtc@pipe-b-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.08] s
>=20
> =C2=A0 * igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.04] s
>=20
> =C2=A0 * igt@kms_lease@lease-unleased-crtc@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.14] s
>=20
> =C2=A0 * igt@kms_lease@lease-unleased-crtc@pipe-c-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.04] s
>=20
> =C2=A0 * igt@kms_lease@lease-unleased-crtc@pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.07] s
>=20
> =C2=A0 * igt@kms_lease@lease-unleased-crtc@pipe-d-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.04] s
>=20
> =C2=A0=20
>=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-175230v1_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][6] -> [DMESG-WARN][7] ([Intel
> XE#1727] / [Intel XE#6819])
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.h=
tml
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-3/igt@=
kms_addfb_basic@addfb25-yf-tiled-legacy.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][8] -> [ABORT][9] ([Intel XE#9362])
> +1 other test abort
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-ptl-1/igt@kms_async_flips@async-flip-suspend-resume=
@pipe-a-edp-1.html
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-3/igt@=
kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][10] -> [ABORT][11] ([Intel XE#9405]
> / [Intel XE#9422])
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume=
@pipe-b-hdmi-a-3.html
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-8/igt@=
kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][12] ([Intel XE#5901]) +1
> other test skip
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-3/igt@=
kms_big_fb@4-tiled-32bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-64bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][13] ([Intel XE#2327])
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-4/igt@=
kms_big_fb@linear-64bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][14] ([Intel XE#7059] /
> [Intel XE#7085])
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-10/igt=
@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][15] ([Intel XE#5850]) +1
> other test skip
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-4/igt@=
kms_big_fb@x-tiled-addfb.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#5851])
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
kms_big_fb@x-tiled-addfb-size-offset-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#2328] /
> [Intel XE#7367])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-3/igt@=
kms_big_fb@y-tiled-addfb.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][18] ([Intel XE#610] /
> [Intel XE#7387])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-6/igt@=
kms_big_fb@y-tiled-addfb-size-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#1124]) +5
> other tests skip
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-7/igt@=
kms_big_fb@yf-tiled-32bpp-rotate-0.html
>=20
> =C2=A0 *
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#5808]) +9
> other tests skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-8/igt@=
kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#367]) +1
> other test skip
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-8/igt@=
kms_bw@linear-tiling-4-displays-target-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#367])
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-10/igt=
@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#5822]) +9
> other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-2/igt@=
kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][24] ([Intel XE#2887]) +12
> other tests skip
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-9/igt@=
kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][25] ([Intel XE#5823] /
> [Intel XE#6918]) +4 other tests skip
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-1/igt@=
kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#3432]) +2
> other tests skip
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-7/igt@=
kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition-all-outputs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][27] ([Intel XE#2724] /
> [Intel XE#7449]) +1 other test skip
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-7/igt@=
kms_cdclk@mode-transition-all-outputs.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-max:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][28] ([Intel XE#5824]) +1
> other test skip
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-6/igt@=
kms_chamelium_color@ctm-max.html
>=20
> =C2=A0 * igt@kms_chamelium_color_pipeline@plane-lut1d:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][29] ([Intel XE#7358]) +1
> other test skip
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-9/igt@=
kms_chamelium_color_pipeline@plane-lut1d.html
>=20
> =C2=A0 * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][30] ([Intel XE#8391])
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-1/igt@=
kms_chamelium_color_pipeline@plane-lut3d-green-only.html
>=20
> =C2=A0 * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][31] ([Intel XE#2252]) +5
> other tests skip
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-9/igt@=
kms_chamelium_frames@hdmi-aspect-ratio.html
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][32] ([Intel XE#2252]) +1
> other test skip
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-8/igt@=
kms_chamelium_frames@hdmi-aspect-ratio.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#373])
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-8/igt@=
kms_chamelium_hpd@common-hpd-after-suspend.html
>=20
> =C2=A0 * igt@kms_chamelium_sharpness_filter@filter-basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#6507] /
> [Intel XE#7358])
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-1/igt@=
kms_chamelium_sharpness_filter@filter-basic.html
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#6507])
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
kms_chamelium_sharpness_filter@filter-basic.html
>=20
> =C2=A0 * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][36] ([Intel XE#6969]) +23
> other tests skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-2/igt@=
kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3.html
>=20
> =C2=A0 * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][37] ([Intel XE#6969]) +7
> other tests skip
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-5/igt@=
kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3.html
>=20
> =C2=A0 * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-
> plane-3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][38] -> [FAIL][39] ([Intel XE#9333])
> +14 other tests fail
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-10/igt@kms_color_pipeline@plane-fixed-matrix-yu=
v-rgb-bt2020@pipe-a-plane-3.html
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-3/igt@=
kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-3.html
>=20
> =C2=A0 * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-
> plane-1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][40] ([Intel XE#9333]) +20
> other tests fail
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-3/igt@=
kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-a-plane-1.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][41] ([Intel XE#1178] /
> [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-3/igt@=
kms_content_protection@atomic.html
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][42] ([Intel XE#7642])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-1/igt@=
kms_content_protection@atomic.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][43] ([Intel XE#7642])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-3/igt@=
kms_content_protection@lic-type-1.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-onscreen-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][44] ([Intel XE#2321] /
> [Intel XE#7355])
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-7/igt@=
kms_cursor_crc@cursor-onscreen-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-onscreen-512x512:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][45] ([Intel XE#5846]) +1
> other test skip
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
kms_cursor_crc@cursor-onscreen-512x512.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][46] ([Intel XE#5900]) +1
> other test skip
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-4/igt@=
kms_cursor_crc@cursor-rapid-movement-64x21.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-32x32:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#2320])
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-4/igt@=
kms_cursor_crc@cursor-sliding-32x32.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#5962]) +1
> other test skip
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-7/igt@=
kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>=20
> =C2=A0 * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#4210] /
> [Intel XE#7467])
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-6/igt@=
kms_dirtyfb@fbc-dirtyfb-ioctl.html
>=20
> =C2=A0 * igt@kms_dp_link_training@uhbr-mst:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#7386])
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-8/igt@=
kms_dp_link_training@uhbr-mst.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][51] ([Intel XE#8265]) +2
> other tests skip
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-10/igt=
@kms_dsc@dsc-with-bpc-formats-bigjoiner.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][52] ([Intel XE#5907]) +2
> other tests skip
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-3/igt@=
kms_dsc@dsc-with-output-formats-with-bpc.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@fbc-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][53] ([Intel XE#4156] /
> [Intel XE#7425])
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-6/igt@=
kms_fbcon_fbt@fbc-suspend.html
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [ABORT][54] ([Intel XE#9362]) +1
> other test abort
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-1/igt@=
kms_fbcon_fbt@fbc-suspend.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][55] ([Intel XE#2316]) +6
> other tests skip
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-3/igt@=
kms_flip@2x-flip-vs-dpms.html
>=20
> =C2=A0 *
> igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][56] ([Intel XE#1421])
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-3/igt@=
kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][57] -> [FAIL][58] ([Intel XE#3321])
> +1 other test fail
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-ptl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.ht=
ml
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
kms_flip@flip-vs-expired-vblank@a-edp1.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][59] -> [FAIL][60] ([Intel XE#301])
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.ht=
ml
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-7/igt@=
kms_flip@flip-vs-expired-vblank@a-edp1.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][61] ([Intel XE#7178]) +2
> other tests skip
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-6/igt@=
kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][62] ([Intel XE#7178] /
> [Intel XE#7351])
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-4/igt@=
kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect=
-x
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][63] ([Intel XE#7179])
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-1/igt@=
kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.htm=
l
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][64] ([Intel XE#7179])
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.htm=
l
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][65] ([Intel XE#7061] /
> [Intel XE#7356]) +1 other test skip
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][66] ([Intel XE#5800] /
> [Intel XE#6312]) +2 other tests skip
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#6312])
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-5/igt@=
kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][68] ([Intel XE#7061])
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-5/igt@=
kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][69] ([Intel XE#4141]) +7
> other tests skip
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-8/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#7061] /
> [Intel XE#7356])
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-w=
c
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][71] ([Intel XE#2311]) +34
> other tests skip
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][72] ([Intel XE#6312]) +13
> other tests skip
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-7/igt@=
kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][73] ([Intel XE#7865]) +11
> other tests skip
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-1/igt@=
kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][74] ([Intel XE#5812]) +51
> other tests skip
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-1/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsrhdr-slowdraw:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][75] ([Intel XE#7865])
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-2/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-slowdraw.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][76] ([Intel XE#7061]) +2
> other tests skip
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][77] ([Intel XE#7061]) +3
> other tests skip
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-1/igt@=
kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][78] ([Intel XE#2313]) +37
> other tests skip
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-8/igt@=
kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][79] ([Intel XE#3544])
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-1/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_hdr@static-toggle-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][80] ([Intel XE#5917] /
> [Intel XE#6174])
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-2/igt@=
kms_hdr@static-toggle-suspend.html
>=20
> =C2=A0 * igt@kms_joiner@basic-ultra-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][81] ([Intel XE#6911] /
> [Intel XE#7378])
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-1/igt@=
kms_joiner@basic-ultra-joiner.html
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][82] ([Intel XE#6900])
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-3/igt@=
kms_joiner@basic-ultra-joiner.html
>=20
> =C2=A0 *
> igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping
> :
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][83] ([Intel XE#7283]) +2
> other tests skip
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-2/igt@=
kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][84] ([Intel XE#7283])
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-8/igt@=
kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][85] ([Intel XE#8303]) +1
> other test skip
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-1/igt@=
kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][86] ([Intel XE#7283]) +1
> other test skip
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-4/igt@=
kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][87] ([Intel XE#2763] /
> [Intel XE#6886]) +4 other tests skip
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-9/igt@=
kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
>=20
> =C2=A0 * igt@kms_pm_backlight@bad-brightness:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][88] ([Intel XE#7376] /
> [Intel XE#7760] / [Intel XE#870])
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-7/igt@=
kms_pm_backlight@bad-brightness.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][89] -> [FAIL][90] ([Intel XE#8399])
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-5/igt@=
kms_pm_dc@dc6-dpms.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][91] ([Intel XE#1489]) +6
> other tests skip
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-10/igt=
@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][92] ([Intel XE#7304]) +1
> other test skip
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-1/igt@=
kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][93] ([Intel XE#5858] /
> [Intel XE#7304]) +1 other test skip
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-2/igt@=
kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a=
-
> edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][94] ([Intel XE#5858])
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-2/igt@=
kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_psr2_su@frontbuffer-xrgb8888:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][95] ([Intel XE#7413]) +1
> other test skip
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-6/igt@=
kms_psr2_su@frontbuffer-xrgb8888.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-p010:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][96] ([Intel XE#2387] /
> [Intel XE#7429]) +1 other test skip
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-2/igt@=
kms_psr2_su@page_flip-p010.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-cursor-plane-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][97] ([Intel XE#1406]) +2
> other tests skip
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-1/igt@=
kms_psr@fbc-pr-cursor-plane-onoff.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-cursor-plane-move:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][98] ([Intel XE#2234] /
> [Intel XE#2850]) +4 other tests skip
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-5/igt@=
kms_psr@fbc-psr2-cursor-plane-move.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][99] ([Intel XE#1406] /
> [Intel XE#5835]) +1 other test skip
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-7/igt@=
kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][100] ([Intel XE#5813])
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-7/igt@=
kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][101] ([Intel XE#5848])
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-7/igt@=
kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][102] -> [DMESG-WARN][103] ([Intel
> XE#9365]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-2/igt@kms_vblank@ts-continuation-suspend.html
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-5/igt@=
kms_vblank@ts-continuation-suspend.html
>=20
> =C2=A0 * igt@kms_vrr@flipline@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][104] -> [FAIL][105] ([Intel XE#4227]
> / [Intel XE#7397]) +1 other test fail
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-ptl-3/igt@kms_vrr@flipline@pipe-a-edp-1.html
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-7/igt@=
kms_vrr@flipline@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@kms_vrr@max-min:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][106] ([Intel XE#1499] /
> [Intel XE#9271])
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-8/igt@=
kms_vrr@max-min.html
>=20
> =C2=A0 * igt@kms_vrr@seamless-rr-switch-vrr:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][107] ([Intel XE#5948] /
> [Intel XE#9277])
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
kms_vrr@seamless-rr-switch-vrr.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-many-threads-small:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][108] -> [INCOMPLETE][109] ([Intel
> XE#6321] / [Intel XE#8355])
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-sm=
all.html
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-5/igt@=
xe_evict@evict-beng-mixed-many-threads-small.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][110] ([Intel XE#5764]) +8
> other tests skip
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
xe_evict@evict-mixed-threads-large.html
>=20
> =C2=A0 * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][111] ([Intel XE#6144])
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-8/igt@=
xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
>=20
> =C2=A0 * igt@xe_exec_balancer@once-parallel-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][112] ([Intel XE#7482]) +17
> other tests skip
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-7/igt@=
xe_exec_balancer@once-parallel-rebind.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][113] ([Intel XE#5575] /
> [Intel XE#7484]) +3 other tests skip
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-1/igt@=
xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-null-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][114] ([Intel XE#2322] /
> [Intel XE#7372]) +5 other tests skip
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-10/igt=
@xe_exec_basic@multigpu-once-null-rebind.html
>=20
> =C2=A0 *
> igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetc=
h
> :
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][115] ([Intel XE#8374]) +7
> other tests skip
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html
>=20
> =C2=A0 *
> igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][116] ([Intel XE#8374]) +11
> other tests skip
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-3/igt@=
xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][117] ([Intel XE#8374])
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-4/igt@=
xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html
>=20
> =C2=A0 * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][118] ([Intel XE#9003])
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-10/igt=
@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][119] ([Intel XE#9003])
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-7/igt@=
xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html
>=20
> =C2=A0 * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][120] ([Intel XE#8364]) +15
> other tests skip
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-4/igt@=
xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
>=20
> =C2=A0 * igt@xe_exec_multi_queue@max-queues-preempt-mode-priority:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][121] ([Intel XE#8364]) +20
> other tests skip
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
xe_exec_multi_queue@max-queues-preempt-mode-priority.html
>=20
> =C2=A0 * igt@xe_exec_reset@cm-multi-queue-gt-reset:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][122] ([Intel XE#8369]) +1
> other test skip
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-4/igt@=
xe_exec_reset@cm-multi-queue-gt-reset.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][123] ([Intel XE#8378]) +6
> other tests skip
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-5/igt@=
xe_exec_threads@threads-multi-queue-cm-fd-userptr.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][124] ([Intel XE#8378]) +5
> other tests skip
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-6/igt@=
xe_exec_threads@threads-multi-queue-shared-vm-userptr.html
>=20
> =C2=A0 * igt@xe_gpgpu_fill@offset-4x4:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][125] ([Intel XE#7954])
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
xe_gpgpu_fill@offset-4x4.html
>=20
> =C2=A0 * igt@xe_madvise@atomic-global:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][126] ([Intel XE#7980])
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-1/igt@=
xe_madvise@atomic-global.html
>=20
> =C2=A0 * igt@xe_mmap@small-bar:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][127] ([Intel XE#586] /
> [Intel XE#7323] / [Intel XE#7384])
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-4/igt@=
xe_mmap@small-bar.html
>=20
> =C2=A0 * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][128] ([Intel XE#6964]) +1
> other test skip
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-3/igt@=
xe_multigpu_svm@mgpu-atomic-op-conflict.html
>=20
> =C2=A0 * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][129] ([Intel XE#6964]) +2
> other tests skip
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-7/igt@=
xe_multigpu_svm@mgpu-latency-copy-basic.html
>=20
> =C2=A0 * igt@xe_noexec_ping_pong@basic:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][130] ([Intel XE#6259] /
> [Intel XE#7406])
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
xe_noexec_ping_pong@basic.html
>=20
> =C2=A0 * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][131] ([Intel XE#7590])
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-3/igt@=
xe_pat@l2-flush-opt-svm-pat-restrict.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xelp:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][132] ([Intel XE#5771] /
> [Intel XE#7590])
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-4/igt@=
xe_pat@pat-index-xelp.html
>=20
> =C2=A0 * igt@xe_pat@pat-sw-hw-compare:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][133] ([Intel XE#7695])
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-10/igt=
@xe_pat@pat-sw-hw-compare.html
>=20
> =C2=A0 * igt@xe_pm@s3-d3hot-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][134] ([Intel XE#6867])
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
xe_pm@s3-d3hot-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm_residency@aspm_link_residency:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][135] ([Intel XE#7271])
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
xe_pm_residency@aspm_link_residency.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][136] ([Intel XE#7271])
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-8/igt@=
xe_pm_residency@aspm_link_residency.html
>=20
> =C2=A0 * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][137] ([Intel XE#4733] /
> [Intel XE#7417]) +2 other tests skip
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-8/igt@=
xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-engines:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][138] ([Intel XE#6019]) +1
> other test skip
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-7/igt@=
xe_query@multigpu-query-engines.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-uc-fw-version-huc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][139] ([Intel XE#944]) +1
> other test skip
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-9/igt@=
xe_query@multigpu-query-uc-fw-version-huc.html
>=20
> =C2=A0 * igt@xe_sriov_vram@vf-access-after-resize-up:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][140] ([Intel XE#6376] /
> [Intel XE#7422])
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-2/igt@=
xe_sriov_vram@vf-access-after-resize-up.html
>=20
> =C2=A0 * igt@xe_survivability@i2c-functionality:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][141] ([Intel XE#8415] /
> [Intel XE#8432])
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-3/igt@=
xe_survivability@i2c-functionality.html
>=20
> =C2=A0 * igt@xe_vm@bind-array-enobufs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][142] ([Intel XE#9424])
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-6/igt@=
xe_vm@bind-array-enobufs.html
>=20
> =C2=A0 * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][143] ([Intel XE#7892]) +1
> other test skip
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-7/igt@=
xe_vm@overcommit-nonfault-vram-lr-defer.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@intel_hwmon@hwmon-write:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][144] ([Intel XE#8583]) ->
> [PASS][145]
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-2/igt@intel_hwmon@hwmon-write.html
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-1/igt@=
intel_hwmon@hwmon-write.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][146] ([Intel XE#7809]) ->
> [PASS][147]
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.h=
tml
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-6/igt@=
kms_cursor_legacy@flip-vs-cursor-atomic.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][148] ([Intel XE#301]) -> [PASS][149]
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.ht=
ml
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-7/igt@=
kms_flip@flip-vs-expired-vblank@b-edp1.html
>=20
> =C2=A0 * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][150] ([Intel XE#9313]) ->
> [PASS][151]
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-6/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-4/igt@=
kms_hdmi_audio_bw@audio-bw-hblank160.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][152] ([Intel XE#1503]) ->
> [PASS][153]
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-6/igt@=
kms_hdr@invalid-hdr.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe=
-
> a-plane-0:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][154] ([Intel XE#9340]) ->
> [PASS][155] +1 other test pass
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-ptl-3/igt@kms_plane@pixel-format-4-tiled-modifier-s=
ource-clamping@pipe-a-plane-0.html
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-8/igt@=
kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-psr:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][156] ([Intel XE#8399]) ->
> [PASS][157] +1 other test pass
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-8/igt@=
kms_pm_dc@dc6-psr.html
>=20
> =C2=A0 * igt@kms_pm_dc@deep-pkgc:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][158] ([Intel XE#2029] / [Intel
> XE#7395]) -> [PASS][159]
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-3/igt@=
kms_pm_dc@deep-pkgc.html
>=20
> =C2=A0 * igt@kms_pm_rpm@system-suspend-modeset:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][160] ([Intel XE#9365]) ->
> [PASS][161]
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-5/igt@=
kms_pm_rpm@system-suspend-modeset.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][162] ([Intel XE#9375]) ->
> [PASS][163] +1 other test pass
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-ptl-7/igt@kms_vblank@ts-continuation-suspend.html
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-2/igt@=
kms_vblank@ts-continuation-suspend.html
>=20
> =C2=A0 * igt@kms_vrr@flip-basic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][164] ([Intel XE#4227] / [Intel
> XE#7397]) -> [PASS][165] +1 other test pass
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-lnl-6/igt@kms_vrr@flip-basic.html
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-4/igt@=
kms_vrr@flip-basic.html
>=20
> =C2=A0 * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][166] ([Intel XE#4227] / [Intel
> XE#7397]) -> [PASS][167] +3 other tests pass
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-ptl-1/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-5/igt@=
kms_vrr@flip-dpms@pipe-a-edp-1.html
>=20
> =C2=A0 * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
> =C2=A0=C2=A0=C2=A0 - shard-ptl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][168] ([Intel XE#7850]) ->
> [PASS][169]
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-ptl-3/igt@xe_exec_reset@long-spin-comp-reuse-many-p=
reempt-threads.html
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-ptl-3/igt@=
xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
>=20
> =C2=A0 * igt@xe_pm@s4-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][170] ([Intel XE#9362]) ->
> [PASS][171] +1 other test pass
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-5/igt@xe_pm@s4-basic-exec.html
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-1/igt@=
xe_pm@s4-basic-exec.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][172] ([Intel XE#9362]) ->
> [PASS][173]
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-lnl-7/igt@xe_pm@s4-basic-exec.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-5/igt@=
xe_pm@s4-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-exec-after:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][174] ([Intel XE#7727]) ->
> [PASS][175]
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-lnl-4/igt@xe_pm@s4-exec-after.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-5/igt@=
xe_pm@s4-exec-after.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-suspend-resume:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][176] ([Intel XE#8587]) ->
> [ABORT][177] ([Intel XE#9405] / [Intel XE#9422])
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume=
.html
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-bmg-8/igt@=
kms_async_flips@async-flip-suspend-resume.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][178] ([Intel XE#309] / [Intel
> XE#7343]) -> [SKIP][179] ([Intel XE#309] / [Intel XE#7343] / [Intel
> XE#7935])
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-5838-ecc5a84be849c400af610cd=
c613a0274e3b101b2/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic=
-transitions.html
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/shard-lnl-8/igt@=
kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>=20
> =C2=A0=20
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1499]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> =C2=A0 [Intel XE#2029]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2311]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> =C2=A0 [Intel XE#2313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> =C2=A0 [Intel XE#2316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> =C2=A0 [Intel XE#2320]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> =C2=A0 [Intel XE#2321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> =C2=A0 [Intel XE#2328]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
> =C2=A0 [Intel XE#2387]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
> =C2=A0 [Intel XE#2724]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
> =C2=A0 [Intel XE#2763]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#3304]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
> =C2=A0 [Intel XE#3321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> =C2=A0 [Intel XE#3432]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> =C2=A0 [Intel XE#3544]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#4141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> =C2=A0 [Intel XE#4156]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
> =C2=A0 [Intel XE#4210]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
> =C2=A0 [Intel XE#4227]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
> =C2=A0 [Intel XE#4733]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> =C2=A0 [Intel XE#5575]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
> =C2=A0 [Intel XE#5764]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
> =C2=A0 [Intel XE#5771]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
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
> =C2=A0 [Intel XE#5823]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
> =C2=A0 [Intel XE#5824]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
> =C2=A0 [Intel XE#5835]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
> =C2=A0 [Intel XE#5846]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
> =C2=A0 [Intel XE#5848]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
> =C2=A0 [Intel XE#5850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850
> =C2=A0 [Intel XE#5851]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
> =C2=A0 [Intel XE#5858]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
> =C2=A0 [Intel XE#586]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
> =C2=A0 [Intel XE#5900]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
> =C2=A0 [Intel XE#5901]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
> =C2=A0 [Intel XE#5907]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
> =C2=A0 [Intel XE#5917]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
> =C2=A0 [Intel XE#5948]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948
> =C2=A0 [Intel XE#5962]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
> =C2=A0 [Intel XE#6019]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
> =C2=A0 [Intel XE#610]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
> =C2=A0 [Intel XE#6144]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
> =C2=A0 [Intel XE#6174]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
> =C2=A0 [Intel XE#6259]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
> =C2=A0 [Intel XE#6312]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
> =C2=A0 [Intel XE#6321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
> =C2=A0 [Intel XE#6376]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
> =C2=A0 [Intel XE#6507]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
> =C2=A0 [Intel XE#6819]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
> =C2=A0 [Intel XE#6867]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
> =C2=A0 [Intel XE#6886]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
> =C2=A0 [Intel XE#6900]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
> =C2=A0 [Intel XE#6911]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
> =C2=A0 [Intel XE#6918]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
> =C2=A0 [Intel XE#6964]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
> =C2=A0 [Intel XE#6969]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
> =C2=A0 [Intel XE#7059]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
> =C2=A0 [Intel XE#7061]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
> =C2=A0 [Intel XE#7085]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
> =C2=A0 [Intel XE#7178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
> =C2=A0 [Intel XE#7179]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
> =C2=A0 [Intel XE#7271]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
> =C2=A0 [Intel XE#7283]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
> =C2=A0 [Intel XE#7304]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
> =C2=A0 [Intel XE#7323]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
> =C2=A0 [Intel XE#7343]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
> =C2=A0 [Intel XE#7351]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
> =C2=A0 [Intel XE#7355]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
> =C2=A0 [Intel XE#7356]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
> =C2=A0 [Intel XE#7358]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
> =C2=A0 [Intel XE#7367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
> =C2=A0 [Intel XE#7372]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
> =C2=A0 [Intel XE#7374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
> =C2=A0 [Intel XE#7376]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
> =C2=A0 [Intel XE#7378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
> =C2=A0 [Intel XE#7384]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
> =C2=A0 [Intel XE#7386]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
> =C2=A0 [Intel XE#7387]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
> =C2=A0 [Intel XE#7395]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
> =C2=A0 [Intel XE#7397]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
> =C2=A0 [Intel XE#7406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406
> =C2=A0 [Intel XE#7413]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
> =C2=A0 [Intel XE#7417]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
> =C2=A0 [Intel XE#7422]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
> =C2=A0 [Intel XE#7425]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
> =C2=A0 [Intel XE#7429]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
> =C2=A0 [Intel XE#7449]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
> =C2=A0 [Intel XE#7467]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
> =C2=A0 [Intel XE#7482]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
> =C2=A0 [Intel XE#7484]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
> =C2=A0 [Intel XE#7590]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
> =C2=A0 [Intel XE#7642]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
> =C2=A0 [Intel XE#7695]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
> =C2=A0 [Intel XE#7727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
> =C2=A0 [Intel XE#7760]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
> =C2=A0 [Intel XE#7809]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
> =C2=A0 [Intel XE#7850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
> =C2=A0 [Intel XE#7865]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
> =C2=A0 [Intel XE#7892]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
> =C2=A0 [Intel XE#7935]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
> =C2=A0 [Intel XE#7954]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
> =C2=A0 [Intel XE#7980]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
> =C2=A0 [Intel XE#8265]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
> =C2=A0 [Intel XE#8303]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
> =C2=A0 [Intel XE#8355]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
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
> =C2=A0 [Intel XE#8399]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
> =C2=A0 [Intel XE#8415]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
> =C2=A0 [Intel XE#8432]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432
> =C2=A0 [Intel XE#8583]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
> =C2=A0 [Intel XE#8587]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/8587
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#9003]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
> =C2=A0 [Intel XE#9271]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
> =C2=A0 [Intel XE#9277]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
> =C2=A0 [Intel XE#9313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
> =C2=A0 [Intel XE#9333]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333
> =C2=A0 [Intel XE#9340]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9340
> =C2=A0 [Intel XE#9362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
> =C2=A0 [Intel XE#9365]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
> =C2=A0 [Intel XE#9375]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
> =C2=A0 [Intel XE#9405]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9405
> =C2=A0 [Intel XE#9422]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9422
> =C2=A0 [Intel XE#9424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/9424
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * IGT: IGT_9114 -> IGT_9115
> =C2=A0 * Linux: xe-5838-ecc5a84be849c400af610cdc613a0274e3b101b2 -> xe-pw=
-
> 175230v1
>=20
> =C2=A0 IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 IGT_9115: 9115
> =C2=A0 xe-5838-ecc5a84be849c400af610cdc613a0274e3b101b2:
> ecc5a84be849c400af610cdc613a0274e3b101b2
> =C2=A0 xe-pw-175230v1: 175230v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175230v1/index.html
