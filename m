Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96887CE7AB0
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 07:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E27D10E2F6;
	Mon,  9 Sep 2024 07:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSUY47JX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF7910E2F5;
 Mon,  9 Sep 2024 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725866495; x=1757402495;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sGE5J8XJR188gGKJc+b6UrGe+5Ofece0RIK7tcV+2rI=;
 b=ZSUY47JX+y/ahyrNu7fVq8pQ8SVaRHxfQz1qJsN0eVuNQUGRpmtbrLio
 W13Po4pIXFCI7R4UjjAdENnElg88nhlhTSFPfJj3RWvm2mt2x6pLdNe8x
 hYZj1rhqlJKRc1SWaCe/m+P5+6mXa74FCt8CtnlGA26j7tXIqmIAjc3Mi
 XdpQyUHGbtWZVLALaIPG+pewpVrY8xE896OGqql7W4iGOcUmiCR02b8Mk
 m46qU5dzBSmAHyGdgjizLi1txFczZHowhQq09wgym61/yzIjxaNX6ZaSq
 vv7lgucxeoBBkI5++Vndaa4DJnkGPzZ6tVjlK2VQ6XRxvrMFLm0e1eAAE g==;
X-CSE-ConnectionGUID: H3RwtdgrRVWEOigJGVs8vQ==
X-CSE-MsgGUID: notROd1iRqWf4I06pPHYhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24651256"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="24651256"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:21:35 -0700
X-CSE-ConnectionGUID: o8FxplH8QiyfWkf7Ig7ksA==
X-CSE-MsgGUID: c+kdX7Q8Ss6DS8WQK4thUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="66807803"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.245.41])
 ([10.245.245.41])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:21:33 -0700
Message-ID: <cfd1cb04cd1bc7ce9a7a9e98a51980ef618a44dc.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.FULL: failure for drm/xe: Add a xe_bo
 subtest for shrinking / swapping
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Date: Mon, 09 Sep 2024 09:21:30 +0200
In-Reply-To: <172571670533.955480.14239680772196815040@2413ebb6fbb6>
References: <20240905131617.8521-1-thomas.hellstrom@linux.intel.com>
 <172571670533.955480.14239680772196815040@2413ebb6fbb6>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Sat, 2024-09-07 at 13:45 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Add a xe_bo subtest for shrinking / swapping
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/138262/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-1896-
> b9fe1879bf216a835796a599fbc717992ba16e04_full -> xe-pw-138262v1_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-138262v1_full absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-138262v1_full, please notify your bug team
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
> pw-138262v1_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_intel_bb@destroy-bb:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][1] ->=
 [DMESG-WARN][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@xe_intel_bb@destroy-bb.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@xe_intel_bb@destroy-bb.html

This failure is unrelated and seen also in other shard runs:

https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v5/shard-dg2-435/igt@=
xe_intel_bb@destroy-bb.html
   I.=20

>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit (NEW):
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][3]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-3/igt@=
xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>=20
>=20

This skip here is expected.

/Thomas



> =C2=A0=20
> #### Suppressed ####
>=20
> =C2=A0 The following results come from untrusted machines, tests, or
> statuses.
> =C2=A0 They do not affect the overall result.
>=20
> =C2=A0 * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [PASS][4] -> [INCOMPLETE][5]
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-bmg-1/igt@xe_drm_fdinfo@utilization-single-full-loa=
d-destroy-queue.html
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-bmg-2/igt@=
xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze@gt1:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NOTRUN -> [INCOMPLETE][6] +1 other test
> incomplete
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-bmg-5/igt@=
xe_pm_residency@gt-c6-freeze@gt1.html
>=20
> =C2=A0=20
> New tests
> ---------
>=20
> =C2=A0 New tests have been introduced between xe-1896-
> b9fe1879bf216a835796a599fbc717992ba16e04_full and xe-pw-
> 138262v1_full:
>=20
> ### New IGT tests (1) ###
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> =C2=A0=C2=A0=C2=A0 - Statuses : 3 pass(s) 1 skip(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.18, 79.02] s
>=20
> =C2=A0=20
>=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-138262v1_full that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-
> a-1-x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][7] -> [DMESG-WARN][8] ([Intel
> XE#1033])
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-fli=
p-events@pipe-b-hdmi-a-1-x.html
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-adlp-9/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>=20
> =C2=A0 * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing=
:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][9] -> [FAIL][10] ([Intel XE#1701])
> +1 other test fail
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-=
nonblocking-fencing.html
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-1/igt@=
kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>=20
> =C2=A0 *
> igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-
> a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][11] -=
> [FAIL][12] ([Intel XE#1426])
> +1 other test fail
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset=
-transition-fencing@pipe-a-hdmi-a-6.html
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-=
6.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-8bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][13] ([Intel XE#1407])
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
kms_big_fb@linear-8bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][14] ([Intel XE#1124] /
> [Intel XE#1201]) +1 other test skip
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>=20
> =C2=A0 *
> igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][15] ([Intel XE#1124])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#1399]) +2
> other tests skip
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][17] ([Intel XE#1201] /
> [Intel XE#373])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][18] ([Intel XE#373])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][19] ([Intel XE#1178]) +1
> other test fail
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@kms_content_protection@atomic-dpms.html
>=20
> =C2=A0 * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][20] ([Intel XE#1201] /
> [Intel XE#455])
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_dirtyfb@drrs-dirtyfb-ioctl.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#1421])
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#1401] /
> [Intel XE#1745]) +1 other test skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
> @pipe-a-default-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#1401]) +1
> other test skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-=
a-default-mode.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][24] ([Intel XE#651]) +1
> other test skip
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][25] ([Intel XE#656]) +3
> other tests skip
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][26] ([Intel XE#1201] /
> [Intel XE#651]) +5 other tests skip
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][27] ([Intel XE#1201] /
> [Intel XE#653]) +3 other tests skip
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@fbcpsr-stridechange.html
>=20
> =C2=A0 * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][28] -> [DMESG-FAIL][29] ([Intel
> XE#324]) +1 other test dmesg-fail
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plan=
e-4.html
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-4/igt@=
kms_plane@plane-position-hole@pipe-a-plane-4.html
>=20
> =C2=A0 * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][30] -> [DMESG-WARN][31] ([Intel
> XE#324])
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plan=
e-1.html
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-4/igt@=
kms_plane@plane-position-hole@pipe-b-plane-1.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][32] -> [FAIL][33] ([Intel XE#1874])
> +1 other test fail
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-=
1.html
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-adlp-4/igt=
@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][34] ([Intel
> XE#1195])
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-basic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][35] ([Intel XE#1201] /
> [Intel XE#929])
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@kms_psr@fbc-psr2-basic.html
>=20
> =C2=A0 * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][36] ([Intel XE#1149] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][37] -=
> [FAIL][38] ([Intel XE#771] /
> [Intel XE#899])
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-463/ig=
t@kms_universal_plane@cursor-fb-leak.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][39] -=
> [FAIL][40] ([Intel XE#899])
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe=
-d-hdmi-a-6.html
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-463/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_writeback@writeback-invalid-parameters:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][41] ([Intel XE#1201] /
> [Intel XE#756])
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@kms_writeback@writeback-invalid-parameters.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-many-threads-small:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][42] -=
> [TIMEOUT][43] ([Intel
> XE#1473] / [Intel XE#402])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-=
small.html
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-466/ig=
t@xe_evict@evict-beng-mixed-many-threads-small.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-many-threads-small:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][44] -=
> [TIMEOUT][45] ([Intel
> XE#1473])
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small=
.html
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-434/ig=
t@xe_evict@evict-mixed-many-threads-small.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][46] ([Intel XE#1201] /
> [Intel XE#288]) +3 other tests skip
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@xe_exec_fault_mode@once-bindexecqueue-imm.html
>=20
> =C2=A0 * igt@xe_oa@mi-rpc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][47] ([Intel XE#1201] /
> [Intel XE#2541]) +1 other test skip
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@xe_oa@mi-rpc.html
>=20
> =C2=A0 * igt@xe_pm@s3-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#584])
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
xe_pm@s3-mocs.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][49] -> [ABORT][50] ([Intel XE#1794])
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-2/igt@=
xe_pm@s4-vm-bind-unbind-all.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][51] ([Intel XE#944])
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-
> a-1-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][52] ([Intel XE#1033]) ->
> [PASS][53]
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-fli=
p-events@pipe-b-hdmi-a-1-y.html
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-adlp-9/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>=20
> =C2=A0 *
> igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels
> @pipe-a-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][54] ([Intel XE#1426]) -> [PASS][55]
> +1 other test pass
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-t=
ransition-internal-panels@pipe-a-edp-1.html
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-3/igt@=
kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-e=
dp-1.html
>=20
> =C2=A0 * igt@kms_atomic_transition@plane-toggle-modeset-transition:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][56] ([Intel XE#1426]) -> [PASS][57]
> +1 other test pass
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modes=
et-transition.html
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-adlp-9/igt=
@kms_atomic_transition@plane-toggle-modeset-transition.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][58] ([Intel XE#1659]) -> [PASS][59]
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-5/igt@=
kms_big_fb@4-tiled-64bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][60] ([Intel XE#2436]) -> [PASS][61]
> +1 other test pass
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-b=
mg-ccs@pipe-d-dp-2.html
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-bmg-8/igt@=
kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@single-move:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][62] ([Intel XE#877]) ->
> [PASS][63] +5 other tests pass
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-bmg-3/igt@kms_cursor_legacy@single-move.html
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-bmg-4/igt@=
kms_cursor_legacy@single-move.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@single-move@pipe-b:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][64] -> [PASS][65]
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-bmg-3/igt@kms_cursor_legacy@single-move@pipe-b.html
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-bmg-4/igt@=
kms_cursor_legacy@single-move@pipe-b.html
>=20
> =C2=A0 * igt@kms_plane@plane-position-covered:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][66] ([Intel XE#324]) ->
> [PASS][67] +1 other test pass
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-lnl-3/igt@kms_plane@plane-position-covered.html
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-5/igt@=
kms_plane@plane-position-covered.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][68] ([Intel XE#1874]) -> [PASS][69]
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-=
1.html
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-adlp-4/igt=
@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][70] (=
[Intel XE#361]) -> [PASS][71]
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pi=
pe-a-hdmi-a-6.html
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][72] ([Intel XE#718]) -> [PASS][73]
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-adlp-8/igt=
@kms_pm_dc@dc6-dpms.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-large-multi-vm-cm:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][74] ([Intel XE#2364]) -> [PASS][75]
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.htm=
l
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-bmg-1/igt@=
xe_evict@evict-beng-large-multi-vm-cm.html
>=20
> =C2=A0 * igt@xe_evict@evict-threads-large:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [TIMEOUT][76] ([Intel XE#1473] / [Intel
> XE#2472]) -> [PASS][77]
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-bmg-5/igt@xe_evict@evict-threads-large.html
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-bmg-2/igt@=
xe_evict@evict-threads-large.html
>=20
> =C2=A0 * igt@xe_exec_compute_mode@once-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][78] ([Intel XE#1069]) -> [PASS][79]
> +1 other test pass
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalid=
ate-race.html
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-3/igt@=
xe_exec_compute_mode@once-userptr-invalidate-race.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][80] ([Intel XE#1201] / [Intel
> XE#2229] / [Intel XE#455]) -> [PASS][81]
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-adlp-8/igt@xe_live_ktest@xe_bo.html
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-adlp-1/igt=
@xe_live_ktest@xe_bo.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [INCOMPLETE][82] ([Intel XE#1616]) ->
> [PASS][83]
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-bmg-7/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-bmg-5/igt@=
xe_pm@s2idle-vm-bind-unbind-all.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[84] ([Intel XE#1195] / [Intel
> XE#1694]) -> [PASS][85]
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@xe_pm@s2idle-vm-bind-unbind-all.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][86] ([Intel XE#1607] / [Intel
> XE#1794]) -> [PASS][87]
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-lnl-7/igt@=
xe_pm@s4-vm-bind-prefetch.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-
> a-6-4-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][88] (=
[Intel XE#1201] / [Intel
> XE#801]) -> [SKIP][89] ([Intel XE#801]) +23 other tests skip
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-fl=
ip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs=
.html
>=20
> =C2=A0 * igt@kms_async_flips@invalid-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][90] (=
[Intel XE#873]) -> [SKIP][91]
> ([Intel XE#1201] / [Intel XE#873])
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_async_flips@invalid-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][92] (=
[Intel XE#1201] / [Intel
> XE#316]) -> [SKIP][93] ([Intel XE#316]) +4 other tests skip
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.htm=
l
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_big_fb@4-tiled-32bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][94] (=
[Intel XE#316]) -> [SKIP][95]
> ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_big_fb@x-tiled-32bpp-rotate-90.html
>=20
> =C2=A0 *
> igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][96] ([Intel XE#1231]) -> [DMESG-
> FAIL][97] ([Intel XE#324])
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-r=
otate-180-hflip-async-flip.html
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-adlp-2/igt=
@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 *
> igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][98] ([Intel XE#324]) ->
> [FAIL][99] ([Intel XE#1231]) +1 other test fail
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-180-hflip-async-flip.html
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-adlp-8/igt=
@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][100] =
([Intel XE#1124] / [Intel
> XE#1201]) -> [SKIP][101] ([Intel XE#1124]) +9 other tests skip
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.ht=
ml
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][102] =
([Intel XE#1201] / [Intel
> XE#607]) -> [SKIP][103] ([Intel XE#607])
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-o=
verflow.html
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][104] =
([Intel XE#1124]) ->
> [SKIP][105] ([Intel XE#1124] / [Intel XE#1201]) +10 other tests skip
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp=
-rotate-180-hflip.html
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>=20
> =C2=A0 * igt@kms_big_joiner@basic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][106] =
([Intel XE#346]) -> [SKIP][107]
> ([Intel XE#1201] / [Intel XE#346])
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_big_joiner@basic.html
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_big_joiner@basic.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][108] =
([Intel XE#367]) -> [SKIP][109]
> ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displa=
ys-2560x1440p.html
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][110] =
([Intel XE#1201] / [Intel
> XE#367]) -> [SKIP][111] ([Intel XE#367]) +3 other tests skip
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displa=
ys-2160x1440p.html
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][112] =
([Intel XE#1201] / [Intel
> XE#2191]) -> [SKIP][113] ([Intel XE#2191]) +1 other test skip
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displa=
ys-2160x1440p.html
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][114] =
([Intel XE#2191]) ->
> [SKIP][115] ([Intel XE#1201] / [Intel XE#2191])
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displa=
ys-3840x2160p.html
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][116] =
([Intel XE#1201] / [Intel
> XE#455] / [Intel XE#787]) -> [SKIP][117] ([Intel XE#455] / [Intel
> XE#787]) +21 other tests skip
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.h=
tml
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][118] =
([Intel XE#1252]) ->
> [SKIP][119] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs=
.html
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][120] =
([Intel XE#455] / [Intel
> XE#787]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#455] / [Intel
> XE#787]) +21 other tests skip
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-r=
c-ccs.html
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][122] =
([Intel XE#787]) -> [SKIP][123]
> ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@p=
ipe-b-dp-4.html
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c=
-
> hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][124] =
([Intel XE#1201] / [Intel
> XE#787]) -> [SKIP][125] ([Intel XE#787]) +76 other tests skip
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled=
-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.htm=
l
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][126] =
([Intel XE#1201] / [Intel
> XE#1252]) -> [SKIP][127] ([Intel XE#1252]) +2 other tests skip
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs=
.html
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][128] =
([Intel XE#314]) -> [SKIP][129]
> ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.h=
tml
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_cdclk@mode-transition@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_chamelium_audio@dp-audio:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][130] =
([Intel XE#373]) -> [SKIP][131]
> ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@kms_chamelium_audio@dp-audio.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-0-50:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][132] =
([Intel XE#1201] / [Intel
> XE#306]) -> [SKIP][133] ([Intel XE#306]) +1 other test skip
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_chamelium_color@ctm-0-50.html
>=20
> =C2=A0 * igt@kms_chamelium_color@gamma:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][134] =
([Intel XE#306]) -> [SKIP][135]
> ([Intel XE#1201] / [Intel XE#306]) +3 other tests skip
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_chamelium_color@gamma.html
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@kms_chamelium_color@gamma.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-mode-timings:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][136] =
([Intel XE#1201] / [Intel
> XE#373]) -> [SKIP][137] ([Intel XE#373]) +8 other tests skip
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_chamelium_edid@hdmi-mode-timings.ht=
ml
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_chamelium_edid@hdmi-mode-timings.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][138] =
([Intel XE#1201] / [Intel
> XE#308]) -> [SKIP][139] ([Intel XE#308]) +1 other test skip
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170=
.html
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_cursor_crc@cursor-offscreen-512x170.html
>=20
> =C2=A0 * igt@kms_feature_discovery@psr2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][140] =
([Intel XE#1135]) ->
> [SKIP][141] ([Intel XE#1135] / [Intel XE#1201])
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_feature_discovery@psr2.html
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_feature_discovery@psr2.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][142] =
([Intel XE#1201] / [Intel
> XE#455]) -> [SKIP][143] ([Intel XE#455]) +14 other tests skip
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to=
-32bpp-ytile-downscaling.html
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][144] =
([Intel XE#455]) -> [SKIP][145]
> ([Intel XE#1201] / [Intel XE#455]) +16 other tests skip
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to=
-32bpp-ytilegen12rcccs-upscaling.html
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.h=
tml
>=20
> =C2=A0 * igt@kms_force_connector_basic@prune-stale-modes:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][146] =
([i915#5274]) -> [SKIP][147]
> ([Intel XE#1201] / [i915#5274])
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-m=
odes.html
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@kms_force_connector_basic@prune-stale-modes.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][148] =
([Intel XE#651]) -> [SKIP][149]
> ([Intel XE#1201] / [Intel XE#651]) +26 other tests skip
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-spr-indfb-fullscreen.html
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][150] =
([Intel XE#1201] / [Intel
> XE#651]) -> [SKIP][151] ([Intel XE#651]) +28 other tests skip
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101=
010-draw-mmap-wc.html
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][152] =
([Intel XE#1201] / [Intel
> XE#658]) -> [SKIP][153] ([Intel XE#658]) +1 other test skip
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling=
-y.html
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][154] =
([Intel XE#653]) -> [SKIP][155]
> ([Intel XE#1201] / [Intel XE#653]) +26 other tests skip
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scnd=
scrn-pri-indfb-draw-blt.html
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][156] =
([Intel XE#1201] / [Intel
> XE#653]) -> [SKIP][157] ([Intel XE#653]) +30 other tests skip
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdra=
w.html
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>=20
> =C2=A0 * igt@kms_getfb@getfb-reject-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][158] =
([Intel XE#1201] / [Intel
> XE#605]) -> [SKIP][159] ([Intel XE#605])
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_getfb@getfb-reject-ccs.html
>=20
> =C2=A0 * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][160] =
([Intel XE#1201] / [Intel
> XE#455] / [Intel XE#498]) -> [SKIP][161] ([Intel XE#455] / [Intel
> XE#498]) +1 other test skip
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-facto=
r-0-25-with-modifiers.html
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe
> -c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][162] =
([Intel XE#1201] / [Intel
> XE#498]) -> [SKIP][163] ([Intel XE#498]) +2 other tests skip
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-facto=
r-0-25-with-modifiers@pipe-c-hdmi-a-6.html
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-=
a-6.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][164] =
([Intel XE#455] / [Intel
> XE#498]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#455] / [Intel
> XE#498]) +1 other test skip
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-facto=
r-0-25-with-pixel-format.html
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@p
> ipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][166] =
([Intel XE#498]) -> [SKIP][167]
> ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-facto=
r-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hd=
mi-a-6.html
>=20
> =C2=A0 * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a=
-
> 6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][168] =
([Intel XE#2318]) ->
> [SKIP][169] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-fact=
or-0-25@pipe-b-hdmi-a-6.html
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a=
-
> 6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][170] =
([Intel XE#2318] / [Intel
> XE#455]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#2318] / [Intel
> XE#455]) +1 other test skip
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-fact=
or-0-25@pipe-d-hdmi-a-6.html
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_pm_backlight@fade-with-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][172] =
([Intel XE#870]) -> [SKIP][173]
> ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_pm_backlight@fade-with-suspend.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-psr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][174] =
([Intel XE#1129] / [Intel
> XE#1201]) -> [SKIP][175] ([Intel XE#1129]) +1 other test skip
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_pm_dc@dc5-psr.html
>=20
> =C2=A0 * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][176] =
([Intel XE#1201] / [Intel
> XE#1489]) -> [SKIP][177] ([Intel XE#1489]) +2 other tests skip
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuou=
s-sf.html
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_psr2_sf@cursor-plane-move-continuous-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][178] =
([Intel XE#1489]) ->
> [SKIP][179] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg=
-area.html
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-p010:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][180] =
([Intel XE#1122]) ->
> [SKIP][181] ([Intel XE#1122] / [Intel XE#1201])
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_psr2_su@page_flip-p010.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr-no-drrs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][182] =
([Intel XE#1201] / [Intel
> XE#929]) -> [SKIP][183] ([Intel XE#929]) +15 other tests skip
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_psr@fbc-psr-no-drrs.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-sprite-plane-move:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][184] =
([Intel XE#929]) -> [SKIP][185]
> ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_psr@fbc-psr2-sprite-plane-move.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-rotation-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][186] =
([Intel XE#1201] / [Intel
> XE#327]) -> [SKIP][187] ([Intel XE#327]) +2 other tests skip
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.ht=
ml
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_rotation_crc@primary-rotation-90.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][188] =
([Intel XE#1127] / [Intel
> XE#1201]) -> [SKIP][189] ([Intel XE#1127])
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-refle=
ct-x-180.html
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][190] =
([Intel XE#327]) -> [SKIP][191]
> ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos=
-100-0.html
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][192] =
([Intel XE#1729]) ->
> [SKIP][193] ([Intel XE#1201] / [Intel XE#362])
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.ht=
ml
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-463/ig=
t@kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@kms_vrr@cmrr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][194] =
([Intel XE#1201] / [Intel
> XE#2168]) -> [SKIP][195] ([Intel XE#2168])
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_vrr@cmrr.html
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_vrr@cmrr.html
>=20
> =C2=A0 * igt@kms_writeback@writeback-fb-id:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][196] =
([Intel XE#1201] / [Intel
> XE#756]) -> [SKIP][197] ([Intel XE#756])
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@kms_writeback@writeback-fb-id.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0xfd:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][198] =
([Intel XE#1126]) ->
> [SKIP][199] ([Intel XE#1126] / [Intel XE#1201])
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@xe_copy_basic@mem-set-linear-0xfd.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0xfffe:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][200] =
([Intel XE#1126] / [Intel
> XE#1201]) -> [SKIP][201] ([Intel XE#1126])
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.htm=
l
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@xe_copy_basic@mem-set-linear-0xfffe.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][202] =
([Intel XE#288]) -> [SKIP][203]
> ([Intel XE#1201] / [Intel XE#288]) +21 other tests skip
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invali=
date-race.html
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][204] =
([Intel XE#1201] / [Intel
> XE#288]) -> [SKIP][205] ([Intel XE#288]) +24 other tests skip
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind=
-imm.html
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][206] ([Intel XE#1201] / [Intel
> XE#2229] / [Intel XE#455]) -> [SKIP][207] ([Intel XE#1201] / [Intel
> XE#2229])
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.ht=
ml
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-adlp-1/igt=
@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>=20
> =C2=A0 * igt@xe_module_load@force-load:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][208] =
([Intel XE#378]) -> [SKIP][209]
> ([Intel XE#1201] / [Intel XE#378])
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@xe_module_load@force-load.html
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@xe_module_load@force-load.html
>=20
> =C2=A0 * igt@xe_oa@invalid-create-userspace-config:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][210] =
([Intel XE#1201] / [Intel
> XE#2541]) -> [SKIP][211] ([Intel XE#2541]) +6 other tests skip
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@xe_oa@invalid-create-userspace-config.h=
tml
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@xe_oa@invalid-create-userspace-config.html
>=20
> =C2=A0 * igt@xe_oa@whitelisted-registers-userspace-config:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][212] =
([Intel XE#2541]) ->
> [SKIP][213] ([Intel XE#1201] / [Intel XE#2541]) +5 other tests skip
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-c=
onfig.html
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@xe_oa@whitelisted-registers-userspace-config.html
>=20
> =C2=A0 * igt@xe_pat@display-vs-wb-transient:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][214] =
([Intel XE#1337]) ->
> [SKIP][215] ([Intel XE#1201] / [Intel XE#1337])
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@xe_pat@display-vs-wb-transient.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xehpc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][216] =
([Intel XE#979]) -> [SKIP][217]
> ([Intel XE#1201] / [Intel XE#979])
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-436/ig=
t@xe_pat@pat-index-xehpc.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-mmap-vram:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][218] =
([Intel XE#1201] / [Intel
> XE#2284] / [Intel XE#366]) -> [SKIP][219] ([Intel XE#2284] / [Intel
> XE#366]) +2 other tests skip
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@xe_pm@d3cold-mmap-vram.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-engines:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][220] =
([Intel XE#1201] / [Intel
> XE#944]) -> [SKIP][221] ([Intel XE#944]) +2 other tests skip
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-432/ig=
t@xe_query@multigpu-query-engines.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-oa-units:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][222] =
([Intel XE#944]) -> [SKIP][223]
> ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/shard-dg2-433/ig=
t@xe_query@multigpu-query-oa-units.html
>=20
> =C2=A0=20
> =C2=A0 {name}: This element is suppressed. This means it is ignored when
> computing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the status of the =
difference (SUCCESS, WARNING, or
> FAILURE).
>=20
> =C2=A0 [Intel XE#1033]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
> =C2=A0 [Intel XE#1069]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
> =C2=A0 [Intel XE#1122]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1126]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> =C2=A0 [Intel XE#1127]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
> =C2=A0 [Intel XE#1129]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
> =C2=A0 [Intel XE#1135]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
> =C2=A0 [Intel XE#1149]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1195]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> =C2=A0 [Intel XE#1201]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
> =C2=A0 [Intel XE#1231]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
> =C2=A0 [Intel XE#1252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
> =C2=A0 [Intel XE#1337]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
> =C2=A0 [Intel XE#1399]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
> =C2=A0 [Intel XE#1401]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> =C2=A0 [Intel XE#1407]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
> =C2=A0 [Intel XE#1473]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1508]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
> =C2=A0 [Intel XE#1607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
> =C2=A0 [Intel XE#1616]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
> =C2=A0 [Intel XE#1659]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
> =C2=A0 [Intel XE#1694]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
> =C2=A0 [Intel XE#1701]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
> =C2=A0 [Intel XE#1729]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> =C2=A0 [Intel XE#1745]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> =C2=A0 [Intel XE#1794]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> =C2=A0 [Intel XE#1874]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> =C2=A0 [Intel XE#2026]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
> =C2=A0 [Intel XE#2168]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
> =C2=A0 [Intel XE#2191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> =C2=A0 [Intel XE#2229]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2284]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> =C2=A0 [Intel XE#2311]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> =C2=A0 [Intel XE#2313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> =C2=A0 [Intel XE#2318]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> =C2=A0 [Intel XE#2333]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
> =C2=A0 [Intel XE#2357]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
> =C2=A0 [Intel XE#2364]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
> =C2=A0 [Intel XE#2436]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
> =C2=A0 [Intel XE#2472]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
> =C2=A0 [Intel XE#2541]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#306]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> =C2=A0 [Intel XE#308]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> =C2=A0 [Intel XE#314]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#324]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
> =C2=A0 [Intel XE#327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
> =C2=A0 [Intel XE#346]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
> =C2=A0 [Intel XE#361]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#366]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
> =C2=A0 [Intel XE#402]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#498]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
> =C2=A0 [Intel XE#584]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
> =C2=A0 [Intel XE#605]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
> =C2=A0 [Intel XE#607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#658]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
> =C2=A0 [Intel XE#718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> =C2=A0 [Intel XE#756]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> =C2=A0 [Intel XE#771]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#801]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#873]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
> =C2=A0 [Intel XE#877]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
> =C2=A0 [Intel XE#899]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [Intel XE#979]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> =C2=A0 [i915#5274]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-1896-b9fe1879bf216a835796a599fbc717992ba16e04 -> xe-pw=
-
> 138262v1
>=20
> =C2=A0 IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 xe-1896-b9fe1879bf216a835796a599fbc717992ba16e04:
> b9fe1879bf216a835796a599fbc717992ba16e04
> =C2=A0 xe-pw-138262v1: 138262v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/index.html

