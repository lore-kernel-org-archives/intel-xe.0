Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32246C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 07:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DB5112883;
	Fri,  3 May 2024 07:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNUA8da4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42E511287F
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 07:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714722070; x=1746258070;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=rFs0kWa3u097Zy7Trpb9RPjH8/HMsWMnRnkA7GcdNTU=;
 b=BNUA8da4wGCaraTi+9v/P6L+wX0swByWBx2m/FRYI9XAkF2CPDUM0N8o
 /BAJJBQKDiwda/LnDZmEEvvFN8IvxbFxCIyvBgYRhVMvu4/cO9EP29W20
 YkHPhYC/u4HitUycZ2gBuH7EiZ7adpkIMA15WdgwyAUsuTZtPXIQy02T/
 fFfrfEPMt2FTMDRDUSyOWI/3ITT22ksfi2MHL7OAAdfg/jd8fDDKv1H8I
 gOvmvQVK4ZC1ZY7nrKximWE4VOzXaq9Wsmn6P6w0cnGVwkw2ZLQXYI2l1
 wMtB3mMGf+RlIjNCRzDVTcqBPZbRCr4PboYEK0WV/FBDrn16wmkUzZEO0 g==;
X-CSE-ConnectionGUID: +nkxSahqQXujKSx7a91+4w==
X-CSE-MsgGUID: mHWCHRN9TiO27wYM7sl8NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21076759"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21076759"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 00:41:09 -0700
X-CSE-ConnectionGUID: V/n+JmdwTQCO9bl58MzZnw==
X-CSE-MsgGUID: euNxO9c6Tqq3SpbsM1mx3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31886791"
Received: from jpauw-mobl1.ger.corp.intel.com (HELO [10.252.50.137])
 ([10.252.50.137])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 00:41:08 -0700
Message-ID: <60ea5050f36c45780a2d73919483842d71f1dd35.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.FULL: failure for drm/xe: Perform
 dma_map when moving system buffer objects to TT (rev3)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 03 May 2024 09:41:05 +0200
In-Reply-To: <171468421638.1848696.8295002635409241249@8e613ede5ea5>
References: <20240502183251.10170-1-thomas.hellstrom@linux.intel.com>
 <171468421638.1848696.8295002635409241249@8e613ede5ea5>
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

On Thu, 2024-05-02 at 21:10 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Perform dma_map when moving system buffer objects to
> TT (rev3)
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/133068/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-1224-
> 83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6_full -> xe-pw-133068v3_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-133068v3_full absolutely
> need to be
> =C2=A0 verified manually.

For the record, this change should not touch dg2 display nor userptr,
and the failing igt@kms_flip@flip-vs-expired-vblank passes locally,
although on DP1 subtests.

/Thomas


> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-133068v3_full, please notify your bug team
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
> pw-133068v3_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][1] ->=
 [FAIL][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-=
a6.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
>=20
> =C2=A0=20
> #### Suppressed ####
>=20
> =C2=A0 The following results come from untrusted machines, tests, or
> statuses.
> =C2=A0 They do not affect the overall result.
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [PASS][3] -> [FAIL][4]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-=
indfb-pgflip-blt.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-lnl-2/igt@=
kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate
> :
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [PASS][5] -> [DMESG-WARN][6]
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-lnl-2/igt@xe_exec_compute_mode@many-execqueues-bind=
execqueue-userptr-invalidate.html
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-lnl-6/igt@=
xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
>=20
> =C2=A0 * igt@xe_vm@large-userptr-split-misaligned-binds-16777216:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [PASS][7] -> [INCOMPLETE][8]
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-lnl-7/igt@xe_vm@large-userptr-split-misaligned-bind=
s-16777216.html
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-lnl-3/igt@=
xe_vm@large-userptr-split-misaligned-binds-16777216.html
>=20
> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-133068v3_full that come from
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
=A0=C2=A0 [PASS][9] -> [DMESG-WARN][10] ([Intel
> XE#1214] / [Intel XE#324] / [Intel XE#358])
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-fli=
p-events@pipe-b-hdmi-a-1-x.html
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-1/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][11] ([Intel XE#1124] /
> [Intel XE#1201]) +2 other tests skip
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_big_fb@4-tiled-32bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][12] ([Intel XE#1201] /
> [Intel XE#316]) +1 other test skip
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_big_fb@y-tiled-8bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_joiner@invalid-modeset-force-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][13] -=
> [SKIP][14] ([Intel XE#1201])
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-433/igt@kms_big_joiner@invalid-modeset-force-jo=
iner.html
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-464/ig=
t@kms_big_joiner@invalid-modeset-force-joiner.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][15] ([Intel XE#1201] /
> [Intel XE#367]) +1 other test skip
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_bw@linear-tiling-1-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-
> hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#1201] /
> [Intel XE#787]) +20 other tests skip
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-
> hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#787]) +13 other tests skip
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-7=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][18] ([Intel XE#1201] /
> [Intel XE#787]) +75 other tests skip
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-464/ig=
t@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-7.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-7=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][19] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#787]) +23 other tests skip
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-464/ig=
t@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-7.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][20] ([Intel XE#1201] /
> [Intel XE#314]) +3 other tests skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-433/ig=
t@kms_cdclk@mode-transition@pipe-c-dp-4.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#1152] /
> [Intel XE#1201] / [Intel XE#455])
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_cdclk@plane-scaling.html
>=20
> =C2=A0 * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#1152] /
> [Intel XE#1201]) +2 other tests skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#1201] /
> [Intel XE#373]) +3 other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_chamelium_hpd@dp-hpd-after-suspend.html
>=20
> =C2=A0 * igt@kms_content_protection@legacy:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][24] ([Intel XE#1201] /
> [Intel XE#455]) +13 other tests skip
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_content_protection@legacy.html
>=20
> =C2=A0 * igt@kms_content_protection@legacy@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][25] ([Intel XE#1178])
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-433/ig=
t@kms_content_protection@legacy@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-random-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#1201] /
> [Intel XE#308]) +1 other test skip
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_cursor_crc@cursor-random-512x170.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][27] ([Intel XE#1201] /
> [Intel XE#309]) +1 other test skip
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][28] -=
> [DMESG-WARN][29] ([Intel
> XE#1214] / [Intel XE#282] / [Intel XE#910]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic=
-transitions.html
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-435/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@forked-bo@all-pipes:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][30] -=
> [DMESG-WARN][31] ([Intel
> XE#1214] / [Intel XE#282]) +7 other tests dmesg-warn
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.h=
tml
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-466/ig=
t@kms_cursor_legacy@forked-bo@all-pipes.html
>=20
> =C2=A0 * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][32] ([Intel XE#1201] /
> [i915#3804])
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-2x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#1201] /
> [Intel XE#702])
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_feature_discovery@display-2x.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-4x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#1138] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_feature_discovery@display-4x.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#1201] /
> [Intel XE#310]) +2 other tests skip
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][36] -=
> [FAIL][37] ([Intel XE#301])
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_flip@flip-vs-expired-vblank.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@a-hdmi-a7:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [D=
MESG-WARN][38] ([Intel XE#1162]
> / [Intel XE#1214]) +3 other tests dmesg-warn
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-464/ig=
t@kms_flip@flip-vs-suspend@a-hdmi-a7.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@c-hdmi-a6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][39] -=
> [DMESG-WARN][40] ([Intel
> XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-464/ig=
t@kms_flip@flip-vs-suspend@c-hdmi-a6.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][41] ([Intel XE#324]
> / [Intel XE#358]) +1 other test dmesg-fail
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
>=20
> =C2=A0 * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][42] -> [FAIL][43] ([Intel XE#616])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-=
d-hdmi-a-1-y-to-y.html
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][44] ([Intel XE#1201] /
> [Intel XE#656]) +19 other tests skip
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][45] ([Intel XE#616]) +1
> other test fail
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][46] ([Intel XE#1191]
> / [Intel XE#1214] / [Intel XE#1608])
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_frontbuffer_tracking@fbc-suspend.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#1201] /
> [Intel XE#651]) +5 other tests skip
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#1201] /
> [Intel XE#653]) +3 other tests skip
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_getfb@getfb-reject-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#1201] /
> [Intel XE#1341])
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_getfb@getfb-reject-ccs.html
>=20
> =C2=A0 * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][50] ([Intel XE#616])
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-466/ig=
t@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][51] ([Intel XE#1214]
> / [Intel XE#1608]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe
> -a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][52] ([Intel XE#1201] /
> [Intel XE#305]) +2 other tests skip
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-=
a-6.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe
> -d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][53] ([Intel XE#1201] /
> [Intel XE#305] / [Intel XE#455])
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-=
a-6.html
>=20
> =C2=A0 * igt@kms_pm_backlight@fade-with-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][54] ([Intel XE#1201] /
> [Intel XE#870])
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_pm_backlight@fade-with-dpms.html
>=20
> =C2=A0 * igt@kms_pm_rpm@basic-rte:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][55] ([Intel XE#1203])
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_pm_rpm@basic-rte.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][56] ([Intel XE#1201] /
> [Intel XE#1211])
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][57] ([Intel XE#1201]) +4
> other tests skip
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-cursor-render:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][58] ([Intel XE#1201] /
> [Intel XE#929]) +4 other tests skip
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_psr@fbc-pr-cursor-render.html
>=20
> =C2=A0 * igt@kms_rmfb@close-fd@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][59] ([Intel XE#294])
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-433/ig=
t@kms_rmfb@close-fd@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][60] ([Intel XE#1201] /
> [Intel XE#327])
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [ABORT][61] ([Intel XE#1760])
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][62] -=
> [FAIL][63] ([Intel XE#899])
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe=
-d-hdmi-a-6.html
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-466/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@xe_ccs@block-copy-compressed:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][64] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#488])
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@xe_ccs@block-copy-compressed.html
>=20
> =C2=A0 * igt@xe_compute@ccs-mode-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][65] ([Intel XE#1201] /
> [Intel XE#1447])
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@xe_compute@ccs-mode-basic.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][66] ([Intel XE#1201] /
> [Intel XE#261]) +3 other tests skip
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@xe_evict@evict-beng-mixed-threads-large.html
>=20
> =C2=A0 * igt@xe_evict@evict-small-external-cm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#1201] /
> [Intel XE#261] / [Intel XE#688])
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@xe_evict@evict-small-external-cm.html
>=20
> =C2=A0 * igt@xe_evict@evict-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][68] -=
> [INCOMPLETE][69] ([Intel
> XE#1195] / [Intel XE#1473] / [Intel XE#392]) +1 other test incomplete
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-464/igt@xe_evict@evict-threads-large.html
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-433/ig=
t@xe_evict@evict-threads-large.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][70] ([Intel XE#1201] /
> [Intel XE#1392]) +2 other tests skip
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@xe_exec_basic@multigpu-no-exec-basic.html
>=20
> =C2=A0 *
> igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][71] ([Intel XE#1201] /
> [Intel XE#288]) +6 other tests skip
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-userptr-rebind-imm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][72] ([Intel XE#1201] /
> [Intel XE#1562])
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@xe_exec_fault_mode@many-userptr-rebind-imm.html
>=20
> =C2=A0 * igt@xe_exec_reset@cat-error:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][73] ([Intel XE#1214]
> / [Intel XE#358])
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@xe_exec_reset@cat-error.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xelpg:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][74] ([Intel XE#1201] /
> [Intel XE#979]) +1 other test skip
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@xe_pat@pat-index-xelpg.html
>=20
> =C2=A0 * igt@xe_pm@d3-mmap-system:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][75] ([Intel XE#1221])
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@xe_pm@d3-mmap-system.html
>=20
> =C2=A0 * igt@xe_pm@s3-exec-after:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][76] ([Intel XE#1191]
> / [Intel XE#1214])
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@xe_pm@s3-exec-after.html
>=20
> =C2=A0 * igt@xe_pm@s3-multiple-execs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][77] -> [DMESG-WARN][78] ([Intel
> XE#1191] / [Intel XE#1214])
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-4/igt=
@xe_pm@s3-multiple-execs.html
>=20
> =C2=A0 * igt@xe_pm@s4-multiple-execs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][79] ([Intel XE#1043] /
> [Intel XE#845])
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@xe_pm@s4-multiple-execs.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[80] ([Intel XE#1214] / [Intel
> XE#282]) -> [PASS][81] +5 other tests pass
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic=
-transitions.html
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@torture-bo@pipe-b:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[82] ([Intel XE#1214] / [Intel
> XE#877]) -> [PASS][83] +1 other test pass
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-464/igt@kms_cursor_legacy@torture-bo@pipe-b.htm=
l
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-433/ig=
t@kms_cursor_legacy@torture-bo@pipe-b.html
>=20
> =C2=A0 * igt@kms_flip@nonblocking-read:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][84] (=
[Intel XE#1201] / [i915#2575])
> -> [PASS][85] +7 other tests pass
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@kms_flip@nonblocking-read.html
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_flip@nonblocking-read.html
>=20
> =C2=A0 * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][86] ([Intel XE#616]) -> [PASS][87]
> +2 other tests pass
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-=
d-hdmi-a-1-y-to-x.html
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][88] -> [PASS][89]
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb=
-multidraw.html
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-lnl-3/igt@=
kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
>=20
> =C2=A0 * igt@kms_pm_rpm@basic-pci-d3-state:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [SKIP][90] ([Intel XE#1211]) -> [PASS][91]
> +1 other test pass
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-lnl-5/igt@kms_pm_rpm@basic-pci-d3-state.html
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-lnl-5/igt@=
kms_pm_rpm@basic-pci-d3-state.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][92] (=
[Intel XE#899]) -> [PASS][93]
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe=
-c-hdmi-a-6.html
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-466/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-many-threads-small:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [TIMEOUT][94=
] ([Intel XE#1473] / [Intel
> XE#402]) -> [PASS][95]
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-=
small.html
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-464/ig=
t@xe_evict@evict-beng-mixed-many-threads-small.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[96] ([Intel XE#1195] / [Intel
> XE#1473] / [Intel XE#392]) -> [PASS][97] +1 other test pass
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-463/ig=
t@xe_evict@evict-mixed-threads-large.html
>=20
> =C2=A0 * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][98] ([Intel XE#1330]) ->
> [PASS][99] +1 other test pass
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-lnl-8/igt@xe_exec_compute_mode@twice-bindexecqueue-=
userptr-invalidate.html
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-lnl-3/igt@=
xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-cm-fd-basic:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][100] -> [PASS][101] +1 other test
> pass
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-lnl-2/igt@xe_exec_threads@threads-cm-fd-basic.html
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-lnl-1/igt@=
xe_exec_threads@threads-cm-fd-basic.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-hang-basic:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][102] ([Intel XE#1256]) ->
> [PASS][103]
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-lnl-1/igt@xe_exec_threads@threads-hang-basic.html
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-lnl-5/igt@=
xe_exec_threads@threads-hang-basic.html
>=20
> =C2=A0 * igt@xe_gt_freq@freq_suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][104] ([Intel XE#1195]) ->
> [PASS][105]
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-9/igt@xe_gt_freq@freq_suspend.html
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@xe_gt_freq@freq_suspend.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-exec-after:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][106] ([Intel XE#1595]) ->
> [PASS][107]
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-lnl-5/igt@xe_pm@s2idle-exec-after.html
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-lnl-5/igt@=
xe_pm@s2idle-exec-after.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [INCOMPLETE][108] ([Intel XE#1595]) ->
> [PASS][109]
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-lnl-1/igt@=
xe_pm_residency@gt-c6-freeze.html
>=20
> =C2=A0 * igt@xe_vm@large-userptr-binds-33554432:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [INCOMPLETE][110] -> [PASS][111]
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-lnl-7/igt@xe_vm@large-userptr-binds-33554432.html
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-lnl-2/igt@=
xe_vm@large-userptr-binds-33554432.html
>=20
> =C2=A0 * igt@xe_vm@large-userptr-misaligned-binds-2097152:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][112] =
([Intel XE#1201]) ->
> [PASS][113] +21 other tests pass
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@xe_vm@large-userptr-misaligned-binds-20=
97152.html
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@xe_vm@large-userptr-misaligned-binds-2097152.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@core_hotunplug@hotreplug:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][114] ([Intel XE#1538] / [Intel
> XE#1717]) -> [INCOMPLETE][115] ([Intel XE#1195] / [Intel XE#1451])
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-8/igt@core_hotunplug@hotreplug.html
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-1/igt=
@core_hotunplug@hotreplug.html
>=20
> =C2=A0 * igt@core_hotunplug@hotreplug-lateclose:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][116] ([Intel XE#1717]) ->
> [INCOMPLETE][117] ([Intel XE#1195] / [Intel XE#1365] / [Intel
> XE#1717])
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose.html
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-1/igt=
@core_hotunplug@hotreplug-lateclose.html
>=20
> =C2=A0 * igt@core_hotunplug@hotunplug-rescan:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][118] ([Intel XE#1195] / [Intel
> XE#1365] / [Intel XE#1451]) -> [ABORT][119] ([Intel XE#1717])
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-9/igt@core_hotunplug@hotunplug-rescan.html
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@core_hotunplug@hotunplug-rescan.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][120] ([Intel XE#1033] / [Intel
> XE#1214] / [Intel XE#358]) -> [DMESG-WARN][121] ([Intel XE#1033] /
> [Intel XE#1214] / [Intel XE#324] / [Intel XE#358])
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-fli=
p-events.html
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-1/igt=
@kms_async_flips@async-flip-with-page-flip-events.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi=
-
> a-1-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][122] ([Intel XE#1033] / [Intel
> XE#1214]) -> [DMESG-WARN][123] ([Intel XE#1033] / [Intel XE#1214] /
> [Intel XE#324]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-fli=
p-events@pipe-d-hdmi-a-1-y.html
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-1/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][124] =
([Intel XE#1201]) ->
> [INCOMPLETE][125] ([Intel XE#1195])
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_big_fb@4-tiled-8bpp-rotate-0.html
>=20
> =C2=A0 *
> igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][126] ([Intel XE#1231]) -> [DMESG-
> FAIL][127] ([Intel XE#324])
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-r=
otate-0-hflip-async-flip.html
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 *
> igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][128] ([Intel XE#324]) ->
> [FAIL][129] ([Intel XE#1231])
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-0-hflip-async-flip.html
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-9/igt=
@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][130] =
([Intel XE#1201] / [i915#2575])
> -> [SKIP][131] ([Intel XE#1201] / [Intel XE#367])
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-3840x21=
60p.html
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_bw@linear-tiling-4-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][132] =
([Intel XE#1201]) ->
> [SKIP][133] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tile=
d-ccs.html
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
>=20
> =C2=A0 * igt@kms_content_protection@legacy:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][134] =
([Intel XE#1201] / [Intel
> XE#455]) -> [FAIL][135] ([Intel XE#1178])
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-464/igt@kms_content_protection@legacy.html
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-433/ig=
t@kms_content_protection@legacy.html
>=20
> =C2=A0 * igt@kms_content_protection@srm:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][136] =
([Intel XE#1178]) ->
> [SKIP][137] ([Intel XE#1201] / [Intel XE#455])
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-433/igt@kms_content_protection@srm.html
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-464/ig=
t@kms_content_protection@srm.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][138] ([Intel XE#1195] / [Intel
> XE#927]) -> [DMESG-WARN][139] ([Intel XE#1191] / [Intel XE#1214] /
> [Intel XE#1608])
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_cursor_crc@cursor-suspend.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][140] ([Intel XE#1195]) ->
> [DMESG-WARN][141] ([Intel XE#1191] / [Intel XE#1214] / [Intel
> XE#1608])
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdm=
i-a-1.html
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-2/igt=
@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-FAIL]=
[142] ([Intel XE#1162]) ->
> [FAIL][143] ([Intel XE#616]) +1 other test fail
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend@pipe-d-hd=
mi-a-6.html
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-464/ig=
t@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@torture-bo:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[144] ([Intel XE#1214] / [Intel
> XE#877]) -> [DMESG-WARN][145] ([Intel XE#1214] / [Intel XE#282])
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-464/igt@kms_cursor_legacy@torture-bo.html
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-433/ig=
t@kms_cursor_legacy@torture-bo.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@psr-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][146] =
([Intel XE#1201]) ->
> [SKIP][147] ([Intel XE#1201] / [Intel XE#776])
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_fbcon_fbt@psr-suspend.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][148] ([Intel XE#1191] / [Intel
> XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][149] ([Intel XE#1195] /
> [Intel XE#927])
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-9/igt=
@kms_flip@flip-vs-suspend.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][150] ([Intel XE#1191] / [Intel
> XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][151] ([Intel XE#1195])
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-9/igt=
@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][152] =
([Intel XE#1201]) ->
> [SKIP][153] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primsc=
rn-spr-indfb-draw-render.html
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][154] =
([Intel XE#1201]) ->
> [SKIP][155] ([Intel XE#1201] / [Intel XE#653])
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-prim=
scrn-pri-shrfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_plane@plane-panning-bottom-right-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][156] ([Intel XE#1035] / [Intel
> XE#1195] / [Intel XE#927]) -> [DMESG-WARN][157] ([Intel XE#1191] /
> [Intel XE#1214] / [Intel XE#1608])
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-sus=
pend.html
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_plane@plane-panning-bottom-right-suspend.html
>=20
> =C2=A0 * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][158] ([Intel XE#1195] / [Intel
> XE#927]) -> [DMESG-WARN][159] ([Intel XE#1191] / [Intel XE#1214])
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-sus=
pend@pipe-a.html
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-8/igt=
@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>=20
> =C2=A0 * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][160] =
([Intel XE#1201] / [i915#2575])
> -> [SKIP][161] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-fact=
or-0-25-unity-scaling.html
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-cursor-plane-move:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][162] =
([Intel XE#1201]) ->
> [SKIP][163] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@kms_psr@fbc-psr2-cursor-plane-move.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][164] ([Intel XE#1191] / [Intel
> XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][165] ([Intel XE#1034] /
> [Intel XE#1195])
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.=
html
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-9/igt=
@kms_vblank@ts-continuation-dpms-suspend.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][166] ([Intel XE#1191] / [Intel
> XE#1214]) -> [INCOMPLETE][167] ([Intel XE#1034] / [Intel XE#1195])
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@=
pipe-a-hdmi-a-1.html
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-9/igt=
@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0xfd:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][168] =
([Intel XE#1201]) ->
> [SKIP][169] ([Intel XE#1126] / [Intel XE#1201])
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@xe_copy_basic@mem-set-linear-0xfd.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][170] =
([Intel XE#1201]) ->
> [SKIP][171] ([Intel XE#1201] / [Intel XE#1562])
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-invalid=
ate-imm.html
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@xe_exec_fault_mode@many-userptr-invalidate-imm.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-bindexecqueue:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][172] =
([Intel XE#1201]) ->
> [SKIP][173] ([Intel XE#1201] / [Intel XE#288])
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue.=
html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-dg2-436/ig=
t@xe_exec_fault_mode@twice-bindexecqueue.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][174] ([Intel XE#1191] / [Intel
> XE#1214]) -> [INCOMPLETE][175] ([Intel XE#1044] / [Intel XE#1195] /
> [Intel XE#1358])
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1224-83d6b363ebb5ba75c62b3d6=
32a3eb2f73b05f9d6/shard-adlp-8/igt@xe_pm@s2idle-basic.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/shard-adlp-1/igt=
@xe_pm@s2idle-basic.html
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
> =C2=A0 [Intel XE#1034]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
> =C2=A0 [Intel XE#1035]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
> =C2=A0 [Intel XE#1043]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
> =C2=A0 [Intel XE#1044]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
> =C2=A0 [Intel XE#1081]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1126]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> =C2=A0 [Intel XE#1127]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
> =C2=A0 [Intel XE#1137]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
> =C2=A0 [Intel XE#1138]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
> =C2=A0 [Intel XE#1152]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
> =C2=A0 [Intel XE#1162]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
> =C2=A0 [Intel XE#1195]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> =C2=A0 [Intel XE#1201]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
> =C2=A0 [Intel XE#1203]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
> =C2=A0 [Intel XE#1211]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
> =C2=A0 [Intel XE#1214]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
> =C2=A0 [Intel XE#1221]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
> =C2=A0 [Intel XE#1231]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
> =C2=A0 [Intel XE#1256]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
> =C2=A0 [Intel XE#1330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
> =C2=A0 [Intel XE#1341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
> =C2=A0 [Intel XE#1358]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
> =C2=A0 [Intel XE#1365]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1399]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
> =C2=A0 [Intel XE#1401]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1407]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1437]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
> =C2=A0 [Intel XE#1446]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
> =C2=A0 [Intel XE#1447]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
> =C2=A0 [Intel XE#1451]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
> =C2=A0 [Intel XE#1473]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
> =C2=A0 [Intel XE#1538]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
> =C2=A0 [Intel XE#1562]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
> =C2=A0 [Intel XE#1595]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
> =C2=A0 [Intel XE#1608]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
> =C2=A0 [Intel XE#1620]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
> =C2=A0 [Intel XE#1646]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646
> =C2=A0 [Intel XE#1650]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
> =C2=A0 [Intel XE#1717]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
> =C2=A0 [Intel XE#1745]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> =C2=A0 [Intel XE#1755]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1755
> =C2=A0 [Intel XE#1760]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
> =C2=A0 [Intel XE#261]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> =C2=A0 [Intel XE#282]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#294]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#305]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
> =C2=A0 [Intel XE#308]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#310]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> =C2=A0 [Intel XE#314]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#324]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
> =C2=A0 [Intel XE#327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
> =C2=A0 [Intel XE#358]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
> =C2=A0 [Intel XE#366]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
> =C2=A0 [Intel XE#402]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#480]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
> =C2=A0 [Intel XE#488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
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
> =C2=A0 [Intel XE#702]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
> =C2=A0 [Intel XE#756]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> =C2=A0 [Intel XE#776]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#845]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#877]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
> =C2=A0 [Intel XE#886]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> =C2=A0 [Intel XE#899]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
> =C2=A0 [Intel XE#910]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
> =C2=A0 [Intel XE#927]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#979]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> =C2=A0 [i915#2575]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> =C2=A0 [i915#3804]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-1224-83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6 -> xe-pw=
-
> 133068v3
>=20
> =C2=A0 IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 xe-1224-83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6:
> 83d6b363ebb5ba75c62b3d632a3eb2f73b05f9d6
> =C2=A0 xe-pw-133068v3: 133068v3
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133068v3/index.html

