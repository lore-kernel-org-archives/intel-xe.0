Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1077EC3271E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 13:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD74610E023;
	Fri,  5 Jul 2024 13:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8aXo3Uz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC04F10E023
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jul 2024 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720187171; x=1751723171;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ezmMSUgIf7sWnrgQ4e0glUPZOob5IyVd4ilqeUjtfyA=;
 b=I8aXo3UzhIQpo+shDnb0JpMpsw+eBkDpBOpbAOWynCs3H/s2H+H3YugZ
 JNxbEmRufZEEDG+g82oFC/lQOklTJXMW3qpTPVz6kZIe6kbvlGAoz26+F
 /VUwlcOeithyEpMDyeSPov9LxIHOzrHAxl1b2CbkUnv7Ymni/+TT6hQjB
 FwOKnhPsTKG+M706wYjhilncEeHKPk2I++pTkf2201rD539cKrG+hVtBJ
 PpPKJ+sD87+uaVZHJSHDNONrQMCRbByPostq2inziTs8J6HXEjIhkQ1Gn
 fW832qUhZl+K8xvGIlTuCGJukR9cpsDyh8ZuJutiaWWmzRbBgFQHIilt/ A==;
X-CSE-ConnectionGUID: zaq+NXYOQ0+H7KDWsVDD/w==
X-CSE-MsgGUID: cFERlkXVRdS3L+8xuEDTdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28636191"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="28636191"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 06:46:11 -0700
X-CSE-ConnectionGUID: Cu5S/fCYS7a2AlQJhVt9BA==
X-CSE-MsgGUID: 8dIuRU5vSFG+mWXm6C1Qdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="46882785"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.245.166])
 ([10.245.245.166])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 06:46:09 -0700
Message-ID: <8fe7af28165668f4eea7e219c9670e363268581e.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.FULL: failure for drm/xe: Use
 write-back caching mode for system memory on DGFX (rev3)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jul 2024 15:46:07 +0200
In-Reply-To: <172017439004.30624.113259849329450588@2413ebb6fbb6>
References: <20240705083214.307860-1-thomas.hellstrom@linux.intel.com>
 <172017439004.30624.113259849329450588@2413ebb6fbb6>
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

On Fri, 2024-07-05 at 10:13 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Use write-back caching mode for system memory on DGFX
> (rev3)
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/135071/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-1565-
> 55e18f9be7b75c5226a57eff4a3b3eb6110815c6_full -> xe-pw-135071v3_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-135071v3_full absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-135071v3_full, please notify your bug team
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
> pw-135071v3_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][1] -> [TIMEOUT][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-2/igt@xe_exec_compute_mode@many-bindexecqueue-=
userptr.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-2/igt=
@xe_exec_compute_mode@many-bindexecqueue-userptr.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-hang-rebind-err:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][3] ->=
 [ABORT][4] +1 other test abort
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind-err=
.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-435/ig=
t@xe_exec_threads@threads-hang-rebind-err.html
>=20
> =C2=A0=20
> #### Suppressed ####
>=20
> =C2=A0 The following results come from untrusted machines, tests, or
> statuses.
> =C2=A0 They do not affect the overall result.
>=20
> =C2=A0 * igt@kms_flip@dpms-off-confusion-interruptible:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NOTRUN -> [INCOMPLETE][5] +1 other test
> incomplete
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-lnl-6/igt@=
kms_flip@dpms-off-confusion-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-edp1:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [PASS][6] -> [ABORT][7]
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-lnl-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-v=
s-modeset@b-edp1.html
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-lnl-4/igt@=
kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-edp1.html
>=20
> =C2=A0 * igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NOTRUN -> [FAIL][8]
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-lnl-3/igt@=
xe_exec_basic@many-execqueues-bindexecqueue-rebind.html

The igfx regressions are unrelated since the igfx path is not changed.
The threads-hang-rebind error on dg2 should not be related either. It
passes locally.

>=20
> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-135071v3_full that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@intel_hwmon@hwmon-read:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][9] ([Intel XE#1125] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@intel_hwmon@hwmon-read.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][10] -=
> [INCOMPLETE][11] ([Intel
> XE#1150] / [Intel XE#1195])
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-fl=
ip-events.html
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-433/ig=
t@kms_async_flips@async-flip-with-page-flip-events.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-
> a-1-x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][12] -> [DMESG-WARN][13] ([Intel
> XE#1214] / [Intel XE#324]) +2 other tests dmesg-warn
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-fli=
p-events@pipe-b-hdmi-a-1-x.html
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-1/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi=
-
> a-6-linear:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][14] -=
> [INCOMPLETE][15] ([Intel
> XE#1195])
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-fl=
ip-events@pipe-c-hdmi-a-6-linear.html
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-433/ig=
t@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-linear.h=
tml
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#1124] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_big_fb@4-tiled-8bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#1201] /
> [Intel XE#607])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-8/igt=
@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][18] ([Intel XE#1201] /
> [Intel XE#316]) +1 other test skip
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_big_fb@y-tiled-64bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#1201] /
> [Intel XE#367])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_bw@linear-tiling-2-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-
> a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#1201] /
> [Intel XE#787]) +14 other tests skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-8/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.htm=
l
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-
> 1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#787]) +9 other tests skip
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_chamelium_color@degamma:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#1201] /
> [Intel XE#306])
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_chamelium_color@degamma.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@dp-edid-resolution-list:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#1201] /
> [Intel XE#373]) +3 other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_chamelium_edid@dp-edid-resolution-list.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-512x512:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][24] ([Intel XE#1201] /
> [Intel XE#308])
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_cursor_crc@cursor-sliding-512x512.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][25] ([Intel XE#1201] /
> [Intel XE#309]) +1 other test skip
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-8/igt=
@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>=20
> =C2=A0 * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#1201] /
> [Intel XE#310]) +2 other tests skip
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@d-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][27] -=
> [INCOMPLETE][28] ([Intel
> XE#1195] / [Intel XE#2049])
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-464/ig=
t@kms_flip@flip-vs-suspend@d-dp4.html
>=20
> =C2=A0 * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][29] -> [FAIL][30] ([Intel XE#1874])
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-=
c-hdmi-a-1-x-to-y.html
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-6/igt=
@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][31] ([Intel XE#1201] /
> [Intel XE#651]) +6 other tests skip
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][32] ([Intel XE#1201] /
> [Intel XE#653]) +3 other tests skip
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt=
:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#1201] /
> [Intel XE#656]) +15 other tests skip
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-8/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][34] -=
> [SKIP][35] ([Intel XE#1201] /
> [Intel XE#455])
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-435/ig=
t@kms_hdr@invalid-hdr.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe
> -b-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][36] ([Intel XE#1201] /
> [Intel XE#498]) +2 other tests skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a=
-1.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe
> -d-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][37] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#498]) +1 other test skip
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a=
-1.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-psr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][38] ([Intel XE#1129] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_pm_dc@dc5-psr.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-primary-page-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][39] ([Intel XE#1201] /
> [Intel XE#929]) +7 other tests skip
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-8/igt=
@kms_psr@fbc-pr-primary-page-flip.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-rotation-90:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][40] ([Intel XE#1201] /
> [Intel XE#327])
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_rotation_crc@primary-rotation-90.html
>=20
> =C2=A0 * igt@kms_scaling_modes@scaling-mode-none:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#1201] /
> [Intel XE#455]) +9 other tests skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-8/igt=
@kms_scaling_modes@scaling-mode-none.html
>=20
> =C2=A0 * igt@sriov_basic@bind-unbind-vf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][42] ([Intel XE#1201] /
> [Intel XE#1932])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@sriov_basic@bind-unbind-vf.html
>=20
> =C2=A0 * igt@xe_ccs@block-multicopy-compressed:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][43] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#488])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-8/igt=
@xe_ccs@block-multicopy-compressed.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0xfffe:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][44] ([Intel XE#1123] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@xe_copy_basic@mem-copy-linear-0xfffe.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0x369:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][45] ([Intel XE#1126] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-8/igt=
@xe_copy_basic@mem-set-linear-0x369.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][46] -=
> [DMESG-FAIL][47] ([Intel
> XE#482])
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large=
.html
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-466/ig=
t@xe_evict@evict-beng-mixed-threads-large.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-many-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#1201] /
> [Intel XE#261]) +1 other test skip
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@xe_evict@evict-mixed-many-threads-large.html
>=20
> =C2=A0 * igt@xe_evict@evict-small-multi-vm-cm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#1201] /
> [Intel XE#261] / [Intel XE#688])
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-8/igt=
@xe_evict@evict-small-multi-vm-cm.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#1201] /
> [Intel XE#1392]) +3 other tests skip
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][51] ([Intel XE#1201] /
> [Intel XE#288]) +7 other tests skip
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-fd-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][52] -> [DMESG-WARN][53] ([Intel
> XE#1214] / [Intel XE#1638])
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-2/igt@xe_exec_threads@threads-fd-rebind.html
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-2/igt=
@xe_exec_threads@threads-fd-rebind.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-mmap-vram:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][54] ([Intel XE#1201] /
> [Intel XE#366])
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@xe_pm@d3cold-mmap-vram.html
>=20
> =C2=A0 * igt@xe_pm_residency@toggle-gt-c6:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][55] -> [FAIL][56] ([Intel XE#958])
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-6/igt=
@xe_pm_residency@toggle-gt-c6.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-gt-list:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][57] ([Intel XE#1201] /
> [Intel XE#944])
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@xe_query@multigpu-query-gt-list.html
>=20
> =C2=A0 * igt@xe_vm@large-split-misaligned-binds-16777216:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][58] -> [DMESG-WARN][59] ([Intel
> XE#1214]) +3 other tests dmesg-warn
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-1/igt@xe_vm@large-split-misaligned-binds-16777=
216.html
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@xe_vm@large-split-misaligned-binds-16777216.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-
> a-1-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][60] ([Intel XE#1214] / [Intel
> XE#324]) -> [PASS][61] +1 other test pass
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-fli=
p-events@pipe-b-hdmi-a-1-y.html
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-1/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][62] ([Intel XE#1659]) -> [PASS][63]
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-ro=
tate-180.html
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-lnl-5/igt@=
kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-absolute-wf_vblank:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][64] ([Intel XE#886]) -> [PASS][65]
> +1 other test pass
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-lnl-6/igt@=
kms_flip@flip-vs-absolute-wf_vblank.html
>=20
> =C2=A0 * igt@kms_lease@empty-lease@pipe-c-edp-1:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][66] ([Intel XE#1638]) ->
> [PASS][67] +1 other test pass
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-lnl-6/igt@kms_lease@empty-lease@pipe-c-edp-1.html
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-lnl-3/igt@=
kms_lease@empty-lease@pipe-c-edp-1.html
>=20
> =C2=A0 * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][68] (=
[Intel XE#361]) -> [PASS][69]
> +2 other tests pass
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pi=
pe-a-dp-4.html
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-433/ig=
t@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-
> pipe-b-edp-1:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][70] ([Intel XE#1705]) ->
> [PASS][71] +1 other test pass
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-lnl-5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-a=
rea-big-fb@psr2-pipe-b-edp-1.html
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-lnl-4/igt@=
kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb@psr2-pipe-b-edp-1.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][72] (=
[Intel XE#771] / [Intel
> XE#899]) -> [PASS][73]
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-463/ig=
t@kms_universal_plane@cursor-fb-leak.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][74] (=
[Intel XE#899]) -> [PASS][75]
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe=
-b-dp-4.html
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-463/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [TIMEOUT][76=
] ([Intel XE#1473] / [Intel
> XE#392]) -> [PASS][77]
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-434/ig=
t@xe_evict@evict-mixed-threads-large.html
>=20
> =C2=A0 * igt@xe_gt_freq@freq_range_exec:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][78] -> [PASS][79]
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-4/igt@xe_gt_freq@freq_range_exec.html
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@xe_gt_freq@freq_range_exec.html
>=20
> =C2=A0 * igt@xe_module_load@many-reload:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [ABORT][80] -> [PASS][81]
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-lnl-7/igt@xe_module_load@many-reload.html
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-lnl-7/igt@=
xe_module_load@many-reload.html
>=20
> =C2=A0 * igt@xe_pm@s4-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][82] ([Intel XE#1358] / [Intel
> XE#1794]) -> [PASS][83]
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-8/igt=
@xe_pm@s4-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-exec-after:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][84] ([Intel XE#1358]) -> [PASS][85]
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@xe_pm@s4-exec-after.html
>=20
> =C2=A0 * igt@xe_vm@munmap-style-unbind-either-side-partial:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][86] ([Intel XE#1214]) ->
> [PASS][87] +2 other tests pass
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-1/igt@xe_vm@munmap-style-unbind-either-side-pa=
rtial.html
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@xe_vm@munmap-style-unbind-either-side-partial.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 *
> igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][88] ([Intel XE#324]) ->
> [FAIL][89] ([Intel XE#1204])
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-r=
otate-0-hflip-async-flip.html
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-1/igt=
@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 *
> igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][90] ([Intel XE#1242]) -> [FAIL][91]
> ([Intel XE#1231])
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-r=
otate-180-hflip-async-flip.html
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-4/igt=
@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][92] ([Intel XE#324]) ->
> [FAIL][93] ([Intel XE#1231])
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-0-async-flip.html
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-1/igt=
@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[94] ([Intel XE#1214] / [Intel
> XE#1551]) -> [INCOMPLETE][95] ([Intel XE#1195] / [Intel XE#1551] /
> [Intel XE#2049])
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-464/ig=
t@kms_flip@flip-vs-suspend.html
>=20
> =C2=A0 * igt@xe_wedged@wedged-at-any-timeout:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-FAIL]=
[96] ([Intel XE#1760]) ->
> [DMESG-WARN][97] ([Intel XE#1214] / [Intel XE#1760])
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-dg2-463/ig=
t@xe_wedged@wedged-at-any-timeout.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][98] ([Intel XE#1214] / [Intel
> XE#1330] / [Intel XE#1760]) -> [DMESG-FAIL][99] ([Intel XE#1760])
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1565-55e18f9be7b75c5226a57ef=
f4a3b3eb6110815c6/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/shard-adlp-6/igt=
@xe_wedged@wedged-at-any-timeout.html
>=20
> =C2=A0=20
> =C2=A0 {name}: This element is suppressed. This means it is ignored when
> computing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the status of the =
difference (SUCCESS, WARNING, or
> FAILURE).
>=20
> =C2=A0 [Intel XE#1091]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
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
> =C2=A0 [Intel XE#1150]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
> =C2=A0 [Intel XE#1195]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> =C2=A0 [Intel XE#1201]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
> =C2=A0 [Intel XE#1204]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
> =C2=A0 [Intel XE#1214]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
> =C2=A0 [Intel XE#1231]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
> =C2=A0 [Intel XE#1242]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
> =C2=A0 [Intel XE#1330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
> =C2=A0 [Intel XE#1358]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1407]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1473]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
> =C2=A0 [Intel XE#1551]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
> =C2=A0 [Intel XE#1553]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
> =C2=A0 [Intel XE#1622]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
> =C2=A0 [Intel XE#1638]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
> =C2=A0 [Intel XE#1659]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
> =C2=A0 [Intel XE#1705]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
> =C2=A0 [Intel XE#1760]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
> =C2=A0 [Intel XE#1794]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> =C2=A0 [Intel XE#1874]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> =C2=A0 [Intel XE#1932]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
> =C2=A0 [Intel XE#2049]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> =C2=A0 [Intel XE#2191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> =C2=A0 [Intel XE#261]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#306]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> =C2=A0 [Intel XE#308]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#310]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#324]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
> =C2=A0 [Intel XE#327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
> =C2=A0 [Intel XE#352]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
> =C2=A0 [Intel XE#361]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
> =C2=A0 [Intel XE#366]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#482]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
> =C2=A0 [Intel XE#488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
> =C2=A0 [Intel XE#498]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
> =C2=A0 [Intel XE#599]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
> =C2=A0 [Intel XE#607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#688]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> =C2=A0 [Intel XE#771]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#886]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> =C2=A0 [Intel XE#899]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [Intel XE#958]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6 -> xe-pw=
-
> 135071v3
>=20
> =C2=A0 IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6:
> 55e18f9be7b75c5226a57eff4a3b3eb6110815c6
> =C2=A0 xe-pw-135071v3: 135071v3
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v3/index.html

