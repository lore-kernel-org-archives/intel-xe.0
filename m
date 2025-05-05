Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582D6C3ABB0
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 14:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1D710E330;
	Mon,  5 May 2025 14:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aree2RJG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD1A10E330;
 Mon,  5 May 2025 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746456725; x=1777992725;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2y+FPeHVu/r7tifTm3nnAdTHkCM5/Cf+d0KKL4dwD+g=;
 b=Aree2RJGD2WXLvRGuIf1D4TUABt1/IJ65weVRk5rf1wQ02XxkaWzpcIH
 JQrx/IsjFEupapElEPgFTOYuk3Nx22+zGwD3KQnEUNY84Qi7G7xMUdEbZ
 YsoELklQPxgpKwVAt51qMt/6ZCHD41hqrGiFsTyBoj3W00k8y5b5t5kSq
 a8dP3JpxUH5r7qHHKLAlNcQ9IMA8ueB4rXy8ltrUMctIiSvuM55+NfOOq
 cvuFtLxJzSwQjCo/o6DA7FbJg5AnV9V8HbLDuNZHB5oX5p8h+heXeZW1A
 +eEDTBGHxelmjLUycUQGKZh/Eb7FR6zA6io+HY53oY0Y/eqvjkp0oV5oK w==;
X-CSE-ConnectionGUID: VUDsHoHRSHaXu0uNpuj/kg==
X-CSE-MsgGUID: q0HsuXBHTcuG9J48dp70SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="70573164"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="70573164"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 07:52:04 -0700
X-CSE-ConnectionGUID: qFY2a/UpRr2m/0NyBAZ/0w==
X-CSE-MsgGUID: nNLTsIp6SISy0Cmw151e+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135200220"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.221])
 ([10.245.246.221])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 07:52:02 -0700
Message-ID: <4d10c2213bb76f247d138e43463561362b79add1.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/ttm: Remove
 the struct ttm_backup abstraction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Date: Mon, 05 May 2025 16:51:58 +0200
In-Reply-To: <174621781126.36881.5832889566828745507@c664b1dc75d1>
References: <20250502130014.3156-1-thomas.hellstrom@linux.intel.com>
 <174621781126.36881.5832889566828745507@c664b1dc75d1>
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

On Fri, 2025-05-02 at 20:30 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/ttm: Remove the struct ttm_backup abstraction
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/148553/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-3026-
> 5303c0e49b49fe27639ba8b2c178931bc22344a2_FULL -> xe-pw-148553v1_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-148553v1_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-148553v1_FULL, please notify your bug team
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
> pw-148553v1_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nom=
emset
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][1] -> [FAIL][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-v=
m-many-stride-new-bo-map-nomemset.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-lnl-2/igt@=
xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.=
html
>=20
> =C2=A0=20

The above error is not related to this change.
Thanks,
Thomas





> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-148553v1_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@intel_hwmon@hwmon-read:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][3] ([Intel XE#1125])
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@intel_hwmon@hwmon-read.html
>=20
> =C2=A0 * igt@kms_atomic@plane-invalid-params-fence:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][4] ->=
 [SKIP][5] ([Intel XE#4208] /
> [i915#2575]) +13 other tests skip
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.h=
tml
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_atomic@plane-invalid-params-fence.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-64bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][6] ([Intel XE#2327])
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_big_fb@linear-64bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][7] ([Intel XE#1124]) +1
> other test skip
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_big_fb@y-tiled-64bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][8] ([Intel XE#1124])
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
>=20
> =C2=A0 *
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][9] ([Intel XE#1124]) +2
> other tests skip
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][10] -> [SKIP][11] ([Intel XE#2314] /
> [Intel XE#2894])
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays=
-2560x1440p.html
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-4/igt@=
kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][12] ([Intel XE#2191]) +1
> other test skip
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][13] ([Intel XE#2191]) +1
> other test skip
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][14] ([Intel XE#367])
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@kms_bw@linear-tiling-3-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][15] ([Intel XE#2652] /
> [Intel XE#787]) +7 other tests skip
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-2/igt@=
kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#2887]) +2
> other tests skip
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-
> d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][17] ([Intel XE#455] /
> [Intel XE#787]) +28 other tests skip
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a=
-
> 2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][18] ([Intel XE#787]) +174
> other tests skip
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#455] /
> [Intel XE#787]) +3 other tests skip
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#787]) +5
> other tests skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][21] ([Intel XE#1727]
> / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][22] ([Intel
> XE#3124])
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [D=
MESG-WARN][23] ([Intel XE#1727]
> / [Intel XE#3113])
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][24] -=
> [INCOMPLETE][25] ([Intel
> XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc@pipe-b-dp-4.html
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-436/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][26] -=
> [INCOMPLETE][27] ([Intel
> XE#2705] / [Intel XE#4212])
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs@pipe-a-dp-4.html
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][28] ([Intel XE#2907])
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][29] ([Intel XE#4417]) +3
> other tests skip
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@kms_cdclk@mode-transition@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@hdmi-hpd:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][30] ([Intel XE#373]) +4
> other tests skip
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@kms_chamelium_hpd@hdmi-hpd.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][31] ([Intel XE#2252]) +2
> other tests skip
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_chamelium_hpd@hdmi-hpd-storm-disable.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][32] ([Intel XE#1178])
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-7/igt@=
kms_content_protection@lic-type-0@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-128x42:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#2320])
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_cursor_crc@cursor-offscreen-128x42.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-onscreen-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#2321])
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_cursor_crc@cursor-onscreen-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-onscreen-512x512:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][35] ([Intel XE#308]) +1
> other test skip
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@kms_cursor_crc@cursor-onscreen-512x512.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][36] -> [SKIP][37] ([Intel XE#2320])
> +1 other test skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-128x=
128.html
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
kms_cursor_crc@cursor-rapid-movement-128x128.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][38] ([Intel XE#455]) +3
> other tests skip
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@kms_cursor_crc@cursor-rapid-movement-32x10.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-max-size:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][39] ([Intel XE#455]) +2
> other tests skip
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@kms_cursor_crc@cursor-sliding-max-size.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][40] -> [SKIP][41] ([Intel XE#2291])
> +5 other tests skip
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legac=
y.html
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][42] ([Intel XE#309]) +1
> other test skip
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-va=
rying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][43] ([Intel XE#323])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varyin=
g-size.html
>=20
> =C2=A0 * igt@kms_display_modes@extended-mode-basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][44] -> [SKIP][45] ([Intel XE#4302])
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.htm=
l
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
kms_display_modes@extended-mode-basic.html
>=20
> =C2=A0 * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][46] ([Intel XE#4494] /
> [i915#3804])
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-436/ig=
t@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#2244])
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_dsc@dsc-basic.html
>=20
> =C2=A0 * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#4422])
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][49] -> [SKIP][50] ([Intel XE#2316])
> +9 other tests skip
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-i=
nterruptible.html
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi=
-
> a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][51] -> [FAIL][52] ([Intel XE#3321])
> +4 other tests fail
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interr=
uptible@bc-dp2-hdmi-a3.html
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-panning-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][53] ([Intel XE#310]) +1
> other test skip
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@kms_flip@2x-flip-vs-panning-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][54] -=
> [FAIL][55] ([Intel XE#301])
> +1 other test fail
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@kms_flip@flip-vs-expired-vblank.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][56] ([Intel XE#301] /
> [Intel XE#3321]) +1 other test fail
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@kms_flip@flip-vs-expired-vblank@c-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][57] ([Intel XE#301])
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][58] -> [DMESG-WARN][59] ([Intel
> XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible@a=
-hdmi-a1.html
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-6/igt=
@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][60] -> [FAIL][61] ([Intel XE#886])
> +3 other tests fail
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interrupt=
ible@a-edp1.html
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-lnl-8/igt@=
kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][62] ([Intel XE#2293] /
> [Intel XE#2380])
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
> @pipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][63] ([Intel XE#2293])
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-=
a-valid-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][64] -=
> [SKIP][65] ([Intel XE#2351] /
> [Intel XE#4208]) +2 other tests skip
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to=
-32bpp-xtile-downscaling.html
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][66] ([Intel XE#651]) +13
> other tests skip
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#2311]) +6
> other tests skip
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][68] ([Intel XE#4141])
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][69] ([Intel XE#651]) +1
> other test skip
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#2313]) +9
> other tests skip
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][71] ([Intel XE#653]) +2
> other tests skip
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][72] ([Intel XE#2312]) +1
> other test skip
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][73] ([Intel XE#653]) +11
> other tests skip
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][74] ([Intel XE#656]) +8
> other tests skip
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_hdr@static-toggle-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][75] -> [SKIP][76] ([Intel XE#1503])
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
kms_hdr@static-toggle-suspend.html
>=20
> =C2=A0 * igt@kms_invalid_mode@bad-vsync-start:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][77] -> [DMESG-WARN][78] ([Intel
> XE#4173]) +8 other tests dmesg-warn
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-adlp-2/igt@kms_invalid_mode@bad-vsync-start.html
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-3/igt=
@kms_invalid_mode@bad-vsync-start.html
>=20
> =C2=A0 * igt@kms_joiner@basic-max-non-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][79] ([Intel XE#4298])
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@kms_joiner@basic-max-non-joiner.html
>=20
> =C2=A0 * igt@kms_plane_alpha_blend@constant-alpha-max:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][80] -> [SKIP][81] ([Intel XE#4848])
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-8/igt@kms_plane_alpha_blend@constant-alpha-max.=
html
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
kms_plane_alpha_blend@constant-alpha-max.html
>=20
> =C2=A0 * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][82] ([Intel XE#616]) +2
> other tests fail
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][83] -> [SKIP][84] ([Intel XE#4596])
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-4/igt@=
kms_plane_multiple@2x-tiling-4.html
>=20
> =C2=A0 * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [D=
MESG-WARN][85] ([Intel
> XE#4212])
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-436/ig=
t@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [A=
BORT][86] ([Intel XE#4760])
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-436/ig=
t@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_pm_backlight@fade-with-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][87] ([Intel XE#870])
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@kms_pm_backlight@fade-with-suspend.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-psr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][88] ([Intel XE#1129])
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@kms_pm_dc@dc5-psr.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][89] ([Intel XE#1489]) +2
> other tests skip
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][90] ([Intel XE#1489])
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][91] ([Intel XE#1489]) +2
> other tests skip
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-p010:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][92] ([Intel XE#1122])
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@kms_psr2_su@page_flip-p010.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][93] ([Intel XE#1122])
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@kms_psr2_su@page_flip-p010.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-primary-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][94] ([Intel XE#2234] /
> [Intel XE#2850]) +1 other test skip
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_psr@fbc-pr-primary-render.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr-cursor-plane-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][95] ([Intel XE#2850] /
> [Intel XE#929]) +4 other tests skip
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@kms_psr@fbc-psr-cursor-plane-onoff.html
>=20
> =C2=A0 * igt@kms_psr@psr-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][96] ([Intel XE#2850] /
> [Intel XE#929]) +4 other tests skip
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@kms_psr@psr-basic.html
>=20
> =C2=A0 * igt@kms_psr@psr2-primary-render:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][97] ([Intel XE#2234])
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_psr@psr2-primary-render.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-270:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][98] ([Intel XE#3414] /
> [Intel XE#3904])
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_rotation_crc@sprite-rotation-270.html
>=20
> =C2=A0 * igt@kms_setmode@clone-exclusive-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][99] -> [SKIP][100] ([Intel XE#1435])
> +1 other test skip
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
kms_setmode@clone-exclusive-crtc.html
>=20
> =C2=A0 * igt@kms_vrr@flip-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][101] ([Intel XE#1499])
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_vrr@flip-dpms.html
>=20
> =C2=A0 * igt@kms_vrr@lobf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][102] ([Intel XE#2168])
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@kms_vrr@lobf.html
>=20
> =C2=A0 * igt@kms_writeback@writeback-invalid-parameters:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][103] ([Intel XE#756])
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_writeback@writeback-invalid-parameters.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-preempt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][104] ([Intel XE#1280] /
> [Intel XE#455]) +1 other test skip
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@xe_compute_preempt@compute-preempt.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0x369:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][105] ([Intel XE#1123])
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@xe_copy_basic@mem-copy-linear-0x369.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0x3fff:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][106] ([Intel XE#1123])
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@xe_copy_basic@mem-copy-linear-0x3fff.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0x3fff:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][107] ([Intel XE#1126])
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@xe_copy_basic@mem-set-linear-0x3fff.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0xfd:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][108] ([Intel XE#1126]) +1
> other test skip
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@xe_copy_basic@mem-set-linear-0xfd.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-vm-bind-discovery:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][109] ([Intel XE#4837]) +1
> other test skip
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@xe_eudebug@basic-vm-bind-discovery.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-vm-bind-ufence:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][110] ([Intel XE#4837]) +4
> other tests skip
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
xe_eudebug@basic-vm-bind-ufence.html
>=20
> =C2=A0 * igt@xe_eudebug@sysfs-toggle:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][111] ([Intel XE#4837]) +3
> other tests skip
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@xe_eudebug@sysfs-toggle.html
>=20
> =C2=A0 * igt@xe_evict@evict-large-external-cm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][112] ([Intel XE#261] /
> [Intel XE#688])
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@xe_evict@evict-large-external-cm.html
>=20
> =C2=A0 * igt@xe_evict_ccs@evict-overcommit-simple:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][113] ([Intel XE#688])
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@xe_evict_ccs@evict-overcommit-simple.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-=
rebind
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][114] =
-> [SKIP][115] ([Intel
> XE#1392]) +7 other tests skip
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-=
many-vm-bindexecqueue-userptr-rebind.html
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebi=
nd.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][116] ([Intel XE#1392])
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][117] ([Intel XE#1392])
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][118] ([Intel XE#2322]) +1
> other test skip
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
xe_exec_basic@multigpu-once-userptr.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-bindexecqueue:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][119] ([Intel XE#288]) +2
> other tests skip
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@xe_exec_fault_mode@many-bindexecqueue.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][120] ([Intel XE#288]) +6
> other tests skip
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
>=20
> =C2=A0 * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][121] ([Intel XE#2360])
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][122] ([Intel XE#2360])
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>=20
> =C2=A0 * igt@xe_exec_reset@cat-error:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][123] ([Intel
> XE#3868])
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@xe_exec_reset@cat-error.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][124] ([Intel XE#4943]) +8
> other tests skip
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][125] ([Intel XE#4915]) +62
> other tests skip
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@xe_exec_system_allocator@many-large-malloc-nomemset.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@many-stride-mmap-new-huge:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][126] ([Intel XE#4915]) +37
> other tests skip
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@xe_exec_system_allocator@many-stride-mmap-new-huge.html
>=20
> =C2=A0 * igt@xe_mmap@small-bar:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][127] ([Intel XE#586])
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
xe_mmap@small-bar.html
>=20
> =C2=A0 * igt@xe_module_load@force-load:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][128] ([Intel XE#378])
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@xe_module_load@force-load.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][129] ([Intel XE#378])
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@xe_module_load@force-load.html
>=20
> =C2=A0 * igt@xe_oa@invalid-map-oa-buffer:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][130] ([Intel XE#2541] /
> [Intel XE#3573])
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@xe_oa@invalid-map-oa-buffer.html
>=20
> =C2=A0 * igt@xe_oa@syncs-syncobj-wait-cfg:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][131] ([Intel XE#2541] /
> [Intel XE#3573] / [Intel XE#4501])
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@xe_oa@syncs-syncobj-wait-cfg.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][132] ([Intel XE#2541] /
> [Intel XE#3573] / [Intel XE#4501])
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@xe_oa@syncs-syncobj-wait-cfg.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xelpg:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][133] ([Intel XE#2236])
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
xe_pat@pat-index-xelpg.html
>=20
> =C2=A0 * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][134] ([Intel XE#1173]) +1
> other test fail
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][135] -> [ABORT][136] ([Intel
> XE#1794]) +1 other test abort
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-lnl-2/igt@=
xe_pm@s4-vm-bind-unbind-all.html
>=20
> =C2=A0 * igt@xe_pxp@display-pxp-fb:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][137] ([Intel XE#4733])
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-4/igt=
@xe_pxp@display-pxp-fb.html
>=20
> =C2=A0 * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][138] ([Intel XE#4733])
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
>=20
> =C2=A0 * igt@xe_pxp@pxp-termination-key-update-post-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][139] ([Intel XE#4733]) +1
> other test skip
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@xe_pxp@pxp-termination-key-update-post-suspend.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-hwconfig:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][140] ([Intel XE#944])
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@xe_query@multigpu-query-hwconfig.html
>=20
> =C2=A0 *
> igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][141] ([Intel XE#4130]) +1
> other test skip
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
>=20
> =C2=A0 * igt@xe_vm@large-binds-8388608:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][142] =
-> [SKIP][143] ([Intel
> XE#4208]) +25 other tests skip
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@xe_vm@large-binds-8388608.html
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@xe_vm@large-binds-8388608.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][144] ([Intel XE#4543]) ->
> [PASS][145] +1 other test pass
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-adlp-3/igt@kms_async_flips@invalid-async-flip-atomi=
c@pipe-c-hdmi-a-1.html
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-6/igt=
@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][146] =
([Intel XE#367]) -> [PASS][147]
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displa=
ys-3840x2160p.html
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-436/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][148] ([Intel XE#3862]) ->
> [PASS][149] +1 other test pass
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-c=
cs.html
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[150] ([Intel XE#3862]) ->
> [PASS][151] +1 other test pass
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2=
-mc-ccs@pipe-d-dp-4.html
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-433/ig=
t@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_cursor_edge_walk@256x256-left-edge:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][152] -> [PASS][153]
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-left-edge.ht=
ml
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_cursor_edge_walk@256x256-left-edge.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][154] ([Intel XE#2291]) ->
> [PASS][155] +2 other tests pass
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-=
legacy.html
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-7/igt@=
kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-dpms-on-nop:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][156] ([Intel XE#2316]) ->
> [PASS][157] +5 other tests pass
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-2/igt@=
kms_flip@2x-flip-vs-dpms-on-nop.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-
> dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][158] =
([Intel XE#301]) -> [PASS][159]
> +4 other tests pass
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-inte=
rruptible@ad-hdmi-a6-dp4.html
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][160] ([Intel XE#3321]) ->
> [PASS][161] +3 other tests pass
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2=
-hdmi-a3.html
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-8/igt@=
kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][162] ([Intel XE#301]) -> [PASS][163]
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.ht=
ml
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-lnl-6/igt@=
kms_flip@flip-vs-expired-vblank@b-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[164] ([Intel XE#2049] / [Intel
> XE#2597]) -> [PASS][165]
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.=
html
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-432/ig=
t@kms_flip@flip-vs-suspend-interruptible.html
>=20
> =C2=A0 * igt@kms_hdr@static-swap:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][166] =
([Intel XE#4426]) ->
> [PASS][167] +1 other test pass
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-434/igt@kms_hdr@static-swap.html
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-436/ig=
t@kms_hdr@static-swap.html
>=20
> =C2=A0 * igt@kms_hdr@static-toggle:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][168] ([Intel XE#1503]) ->
> [PASS][169]
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-4/igt@kms_hdr@static-toggle.html
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-7/igt@=
kms_hdr@static-toggle.html
>=20
> =C2=A0 * igt@kms_pm_rpm@drm-resources-equal:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][170] ([Intel XE#4936]) ->
> [PASS][171]
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-6/igt@kms_pm_rpm@drm-resources-equal.html
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
kms_pm_rpm@drm-resources-equal.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][172] =
([Intel XE#1392]) ->
> [PASS][173] +6 other tests pass
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-de=
fer-mmap.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [DMESG-WARN][174] ([Intel XE#3428]) ->
> [PASS][175] +2 other tests pass
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-mmap=
-shared-nomemset.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-1/igt@=
xe_exec_system_allocator@many-stride-mmap-shared-nomemset.html
>=20
> =C2=A0 * {igt@xe_exec_system_allocator@many-stride-mmap-shared-remap}:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [INCOMPLETE][176] -> [PASS][177]
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap=
-shared-remap.html
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
xe_exec_system_allocator@many-stride-mmap-shared-remap.html
>=20
> =C2=A0 *
> igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-=
bo-map-nomemset
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][178] -> [PASS][179] +1 other test
> pass
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-v=
m-many-large-execqueues-new-bo-map-nomemset.html
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-lnl-7/igt@=
xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map=
-nomemset.html
>=20
> =C2=A0 * igt@xe_oa@oa-exponents:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [TIMEOUT][180] -> [PASS][181]
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-lnl-1/igt@xe_oa@oa-exponents.html
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-lnl-2/igt@=
xe_oa@oa-exponents.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][182] ([Intel XE#1794]) ->
> [PASS][183] +1 other test pass
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@xe_pm@s4-vm-bind-unbind-all.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-suspend-resume:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][184] ([Intel XE#4543]) ->
> [DMESG-WARN][185] ([Intel XE#4173] / [Intel XE#4543])
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resum=
e.html
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-8/igt=
@kms_async_flips@async-flip-suspend-resume.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][186] =
([Intel XE#316]) -> [SKIP][187]
> ([Intel XE#4208])
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_big_fb@x-tiled-64bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][188] =
([Intel XE#1124]) ->
> [SKIP][189] ([Intel XE#4208]) +1 other test skip
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_big_fb@y-tiled-16bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][190] =
([Intel XE#2191]) ->
> [SKIP][191] ([Intel XE#4208] / [i915#2575])
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displa=
ys-1920x1080p.html
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][192] =
([Intel XE#455] / [Intel
> XE#787]) -> [SKIP][193] ([Intel XE#4208]) +1 other test skip
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-=
ccs.html
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][194] =
([Intel XE#2907]) ->
> [SKIP][195] ([Intel XE#4208])
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-c=
cs.html
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[196] ([Intel XE#1727] / [Intel
> XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][197]
> ([Intel XE#2705] / [Intel XE#4212])
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs.html
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[198] ([Intel XE#2705] / [Intel
> XE#4212]) -> [INCOMPLETE][199] ([Intel XE#1727] / [Intel XE#3113] /
> [Intel XE#4212] / [Intel XE#4522])
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc.html
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-436/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-blue-to-red:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][200] =
([Intel XE#306]) -> [SKIP][201]
> ([Intel XE#4208] / [i915#2575])
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.htm=
l
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_chamelium_color@ctm-blue-to-red.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][202] =
([Intel XE#373]) -> [SKIP][203]
> ([Intel XE#4208] / [i915#2575])
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pip=
e.html
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][204] ([Intel XE#2341]) ->
> [FAIL][205] ([Intel XE#1178])
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-7/igt@=
kms_content_protection@lic-type-0.html
>=20
> =C2=A0 * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][206] =
([Intel XE#455]) -> [SKIP][207]
> ([Intel XE#4208])
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_dirtyfb@drrs-dirtyfb-ioctl.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][208] =
([Intel XE#651]) -> [SKIP][209]
> ([Intel XE#2351] / [Intel XE#4208])
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primsc=
rn-cur-indfb-move.html
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][210] =
([Intel XE#651]) -> [SKIP][211]
> ([Intel XE#4208]) +2 other tests skip
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-indfb-pgflip-blt.html
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][212] ([Intel XE#2311]) ->
> [SKIP][213] ([Intel XE#2312]) +21 other tests skip
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn=
-pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][214] ([Intel XE#2312]) ->
> [SKIP][215] ([Intel XE#2311]) +11 other tests skip
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn=
-pri-shrfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-7/igt@=
kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][216] ([Intel XE#4141]) ->
> [SKIP][217] ([Intel XE#2312]) +5 other tests skip
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
indfb-plflip-blt.html
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][218] ([Intel XE#2312]) ->
> [SKIP][219] ([Intel XE#4141]) +6 other tests skip
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
shrfb-pgflip-blt.html
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-7/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][220] =
([Intel XE#653]) -> [SKIP][221]
> ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-prim=
scrn-pri-indfb-draw-blt.html
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][222] ([Intel XE#2313]) ->
> [SKIP][223] ([Intel XE#2312]) +22 other tests skip
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-shrfb-plflip-blt.html
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][224] ([Intel XE#2312]) ->
> [SKIP][225] ([Intel XE#2313]) +11 other tests skip
> =C2=A0=C2=A0 [224]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-=
indfb-plflip-blt.html
> =C2=A0=C2=A0 [225]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-7/igt@=
kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][226] =
([Intel XE#653]) -> [SKIP][227]
> ([Intel XE#4208]) +2 other tests skip
> =C2=A0=C2=A0 [226]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-shrfb-scal=
edprimary.html
> =C2=A0=C2=A0 [227]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][228] ([Intel XE#4596]) ->
> [SKIP][229] ([Intel XE#2493])
> =C2=A0=C2=A0 [228]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
> =C2=A0=C2=A0 [229]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-7/igt@=
kms_plane_multiple@2x-tiling-y.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-yf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][230] ([Intel XE#2493]) ->
> [SKIP][231] ([Intel XE#4596])
> =C2=A0=C2=A0 [230]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
> =C2=A0=C2=A0 [231]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-bmg-4/igt@=
kms_plane_multiple@2x-tiling-yf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][232] =
([Intel XE#1489]) ->
> [SKIP][233] ([Intel XE#4208]) +1 other test skip
> =C2=A0=C2=A0 [232]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_psr2_sf@pr-primary-plane-update-sf-=
dmg-area-big-fb.html
> =C2=A0=C2=A0 [233]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-sprite-plane-move:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][234] =
([Intel XE#2850] / [Intel
> XE#929]) -> [SKIP][235] ([Intel XE#4208]) +1 other test skip
> =C2=A0=C2=A0 [234]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-plane-move.html
> =C2=A0=C2=A0 [235]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_psr@fbc-pr-sprite-plane-move.html
>=20
> =C2=A0 * igt@kms_psr@psr-sprite-plane-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][236] =
([Intel XE#2850] / [Intel
> XE#929]) -> [SKIP][237] ([Intel XE#2351] / [Intel XE#4208])
> =C2=A0=C2=A0 [236]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html
> =C2=A0=C2=A0 [237]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@kms_psr@psr-sprite-plane-onoff.html
>=20
> =C2=A0 * igt@xe_eu_stall@blocking-read:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][238] =
([Intel XE#4497]) ->
> [SKIP][239] ([Intel XE#4208])
> =C2=A0=C2=A0 [238]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@xe_eu_stall@blocking-read.html
> =C2=A0=C2=A0 [239]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@xe_eu_stall@blocking-read.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-vm-access-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][240] =
([Intel XE#4837]) ->
> [SKIP][241] ([Intel XE#4208]) +1 other test skip
> =C2=A0=C2=A0 [240]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@xe_eudebug@basic-vm-access-userptr.html
> =C2=A0=C2=A0 [241]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@xe_eudebug@basic-vm-access-userptr.html
>=20
> =C2=A0 *
> igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-r=
ace-imm
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][242] =
([Intel XE#288]) -> [SKIP][243]
> ([Intel XE#4208]) +3 other tests skip
> =C2=A0=C2=A0 [242]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bind=
execqueue-userptr-invalidate-race-imm.html
> =C2=A0=C2=A0 [243]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-=
imm.html
>=20
> =C2=A0 * igt@xe_exec_system_allocator@process-many-free-race-nomemset:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][244] =
([Intel XE#4915]) ->
> [SKIP][245] ([Intel XE#4208]) +23 other tests skip
> =C2=A0=C2=A0 [244]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@xe_exec_system_allocator@process-many-f=
ree-race-nomemset.html
> =C2=A0=C2=A0 [245]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@xe_exec_system_allocator@process-many-free-race-nomemset.html
>=20
> =C2=A0 * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][246] ([Intel XE#4911]) ->
> [TIMEOUT][247] ([Intel XE#4911])
> =C2=A0=C2=A0 [246]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc=
_mmio_send_recv.html
> =C2=A0=C2=A0 [247]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-adlp-2/igt=
@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>=20
> =C2=A0 * igt@xe_oa@short-reads:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][248] =
([Intel XE#2541] / [Intel
> XE#3573]) -> [SKIP][249] ([Intel XE#4208])
> =C2=A0=C2=A0 [248]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@xe_oa@short-reads.html
> =C2=A0=C2=A0 [249]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@xe_oa@short-reads.html
>=20
> =C2=A0 * igt@xe_pmu@all-fn-engine-activity-load:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][250] =
([Intel XE#4650]) ->
> [SKIP][251] ([Intel XE#4208])
> =C2=A0=C2=A0 [250]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html
> =C2=A0=C2=A0 [251]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@xe_pmu@all-fn-engine-activity-load.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-cs-cycles:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][252] =
([Intel XE#944]) -> [SKIP][253]
> ([Intel XE#4208])
> =C2=A0=C2=A0 [252]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b=
2c178931bc22344a2/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html
> =C2=A0=C2=A0 [253]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/shard-dg2-434/ig=
t@xe_query@multigpu-query-cs-cycles.html
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
> =C2=A0 [Intel XE#1123]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1125]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
> =C2=A0 [Intel XE#1126]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> =C2=A0 [Intel XE#1129]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
> =C2=A0 [Intel XE#1173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1280]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
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
> =C2=A0 [Intel XE#1794]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> =C2=A0 [Intel XE#2049]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> =C2=A0 [Intel XE#2168]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
> =C2=A0 [Intel XE#2191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2236]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
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
> =C2=A0 [Intel XE#2314]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
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
> =C2=A0 [Intel XE#2341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> =C2=A0 [Intel XE#2351]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> =C2=A0 [Intel XE#2360]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
> =C2=A0 [Intel XE#2380]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> =C2=A0 [Intel XE#2493]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
> =C2=A0 [Intel XE#2541]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> =C2=A0 [Intel XE#2597]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> =C2=A0 [Intel XE#261]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> =C2=A0 [Intel XE#2652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> =C2=A0 [Intel XE#2705]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2894]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> =C2=A0 [Intel XE#2907]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
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
> =C2=A0 [Intel XE#3124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#323]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
> =C2=A0 [Intel XE#3321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> =C2=A0 [Intel XE#3414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> =C2=A0 [Intel XE#3428]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
> =C2=A0 [Intel XE#3573]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
> =C2=A0 [Intel XE#3862]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
> =C2=A0 [Intel XE#3868]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
> =C2=A0 [Intel XE#3904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> =C2=A0 [Intel XE#4130]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
> =C2=A0 [Intel XE#4141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4208]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
> =C2=A0 [Intel XE#4212]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> =C2=A0 [Intel XE#4298]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
> =C2=A0 [Intel XE#4302]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
> =C2=A0 [Intel XE#4345]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> =C2=A0 [Intel XE#4417]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
> =C2=A0 [Intel XE#4422]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
> =C2=A0 [Intel XE#4426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426
> =C2=A0 [Intel XE#4494]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
> =C2=A0 [Intel XE#4497]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
> =C2=A0 [Intel XE#4501]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
> =C2=A0 [Intel XE#4522]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
> =C2=A0 [Intel XE#4543]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#4596]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> =C2=A0 [Intel XE#4650]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
> =C2=A0 [Intel XE#4733]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> =C2=A0 [Intel XE#4760]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
> =C2=A0 [Intel XE#4837]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> =C2=A0 [Intel XE#4848]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4848
> =C2=A0 [Intel XE#4911]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
> =C2=A0 [Intel XE#4915]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> =C2=A0 [Intel XE#4936]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4936
> =C2=A0 [Intel XE#4943]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> =C2=A0 [Intel XE#586]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
> =C2=A0 [Intel XE#616]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#688]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> =C2=A0 [Intel XE#756]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#886]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [i915#2575]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> =C2=A0 [i915#3804]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2 -> xe-pw=
-
> 148553v1
>=20
> =C2=A0 IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2:
> 5303c0e49b49fe27639ba8b2c178931bc22344a2
> =C2=A0 xe-pw-148553v1: 148553v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148553v1/index.html

