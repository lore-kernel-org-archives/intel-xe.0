Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D03C25B78
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 15:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D89110E202;
	Mon, 27 May 2024 15:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ihv8WKRI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE5710E202
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716825196; x=1748361196;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=30rdN58Z5Z4I5e4W+aoyI+S4KeIF/qQuqKc/REdHwMk=;
 b=Ihv8WKRIKIjPPsPCpky3Hmg1jA5va56XVQ5p9BFXrPM3VVJ+Vvfmr8S0
 OUUHaCfeK1QvlNcc9TRDHBRu5+m+xn9C/ifbP9JAkKaYklvchmR/0xpCQ
 5oKBvlfLi+WqumUNZWiP++fj4q3WyoznEOJCOeaWO0DUI0c8N6Dc9SHtv
 e9MpgUqyxWeldUDuJWJsmDSO871Vw4+xfr2DkVjoxN5DdaAGj+Zj8xj9o
 BTzISdJCe/xMXtGF0rkFgZqMetdulgM0N+hVRCn04pHV2iBkGqEsOy4gA
 C3i/VSs2b8OXcFj6pkWobtpR72oTQrZ1Fperx4txH/SqHIZ4iDZppHGII w==;
X-CSE-ConnectionGUID: sox7n6KbREKP3FMHFR66cg==
X-CSE-MsgGUID: pmWF22Q5QxGI/Rfq2EXjvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16983210"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="16983210"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 08:53:16 -0700
X-CSE-ConnectionGUID: dZal2MVPRcW/mduRQWIGdA==
X-CSE-MsgGUID: bYBdpMOBQIWm4iSlrr61Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34686301"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.209])
 ([10.245.246.209])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 08:53:15 -0700
Message-ID: <9bf24bca88e359796c9a89b8b64bbe4e785ed27d.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.FULL: failure for drm/xe: Allow
 migrate vm gpu submissions from reclaim context
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 17:53:12 +0200
In-Reply-To: <171682413059.2213622.6429658591618212889@8e613ede5ea5>
References: <20240527135912.152156-1-thomas.hellstrom@linux.intel.com>
 <171682413059.2213622.6429658591618212889@8e613ede5ea5>
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

On Mon, 2024-05-27 at 15:35 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Allow migrate vm gpu submissions from reclaim context
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/134087/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-1348-
> f2c37d7fd878c82ea57075948d614f60a168128c_full -> xe-pw-134087v1_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-134087v1_full absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-134087v1_full, please notify your bug team
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
> pw-134087v1_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_pm@d3hot-mmap-system:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][1]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@xe_pm@d3hot-mmap-system.html


This failure appears completely unrelated.


>=20
> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-134087v1_full that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][2] ([Intel XE#1201] /
> [Intel XE#660])
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][3] ([Intel XE#1124] /
> [Intel XE#1201]) +18 other tests skip
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_big_fb@4-tiled-64bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][4] ([Intel XE#1874]) +7
> other tests fail
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@kms_big_fb@x-tiled-64bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][5] ([Intel XE#1201] /
> [Intel XE#316]) +9 other tests skip
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_big_fb@y-tiled-32bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][6] ([Intel XE#1201] /
> [Intel XE#367]) +2 other tests skip
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_bw@linear-tiling-4-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-
> a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][7] ([Intel XE#1201] /
> [Intel XE#787]) +74 other tests skip
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1=
:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][8] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#787]) +49 other tests skip
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition-all-outputs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][9] ([Intel XE#1201] /
> [Intel XE#314])
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_cdclk@mode-transition-all-outputs.html
>=20
> =C2=A0 * igt@kms_chamelium_color@gamma:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][10] ([Intel XE#1201] /
> [Intel XE#306]) +3 other tests skip
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_chamelium_color@gamma.html
>=20
> =C2=A0 * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][11] ([Intel XE#1201] /
> [Intel XE#373]) +11 other tests skip
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>=20
> =C2=A0 * igt@kms_content_protection@dp-mst-type-0:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][12] ([Intel XE#1201] /
> [Intel XE#307]) +1 other test skip
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_content_protection@dp-mst-type-0.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][13] ([Intel XE#1201] /
> [Intel XE#308]) +2 other tests skip
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@kms_cursor_crc@cursor-offscreen-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][14] ([Intel XE#1191]
> / [Intel XE#1214] / [Intel XE#1608]) +5 other tests dmesg-warn
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][15] ([Intel XE#1201] /
> [Intel XE#309]) +7 other tests skip
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#1201] /
> [Intel XE#323])
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-3x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#1201] /
> [Intel XE#703])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_feature_discovery@display-3x.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-4x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][18] ([Intel XE#1138] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_feature_discovery@display-4x.html
>=20
> =C2=A0 * igt@kms_feature_discovery@psr1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#1135] /
> [Intel XE#1201]) +1 other test skip
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@kms_feature_discovery@psr1.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#1201] /
> [Intel XE#310]) +11 other tests skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_flip@2x-plain-flip-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][21] ([Intel XE#1214]
> / [Intel XE#1608]) +5 other tests dmesg-warn
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pip
> e-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [ABORT][22] ([Intel XE#1939]) +2
> other tests abort
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid=
-mode.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#1201] /
> [Intel XE#656]) +66 other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][24] ([Intel XE#1861])
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [INCOMPLETE][25] ([Intel XE#1195]
> / [Intel XE#927])
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@kms_frontbuffer_tracking@fbc-suspend.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][26] ([Intel XE#1201] /
> [Intel XE#651]) +19 other tests skip
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][27] ([Intel XE#1158] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_frontbuffer_tracking@plane-fbc-rte.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][28] ([Intel XE#1201] /
> [Intel XE#653]) +20 other tests skip
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][29] ([Intel XE#1201] /
> [Intel XE#356])
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format-source-clamping:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][30] ([Intel XE#1331]) +2
> other tests fail
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@kms_plane@pixel-format-source-clamping.html
>=20
> =C2=A0 * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][31] ([Intel XE#361]) +1
> other test fail
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25=
:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][32] ([Intel XE#1201] /
> [Intel XE#305] / [Intel XE#455]) +1 other test skip
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe
> -b-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#1201] /
> [Intel XE#305]) +2 other tests skip
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a=
-1.html
>=20
> =C2=A0 * igt@kms_pm_backlight@bad-brightness:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#1201] /
> [Intel XE#870]) +2 other tests skip
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@kms_pm_backlight@bad-brightness.html
>=20
> =C2=A0 * igt@kms_pm_rpm@dpms-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#1201] /
> [Intel XE#1211])
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@kms_pm_rpm@dpms-lpsp.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][36] ([Intel XE#1201]) +8
> other tests skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-nv12:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][37] ([Intel XE#1122] /
> [Intel XE#1201]) +1 other test skip
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@kms_psr2_su@page_flip-nv12.html
>=20
> =C2=A0 * igt@kms_psr@psr2-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][38] ([Intel XE#1201] /
> [Intel XE#929]) +21 other tests skip
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@kms_psr@psr2-basic.html
>=20
> =C2=A0 * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][39] ([Intel XE#1149] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][40] ([Intel XE#1127] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-90:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#1201] /
> [Intel XE#327]) +2 other tests skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_rotation_crc@sprite-rotation-90.html
>=20
> =C2=A0 * igt@kms_sysfs_edid_timing:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][42] ([Intel XE#1174])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_sysfs_edid_timing.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][43] ([Intel XE#1191]
> / [Intel XE#1214]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_vrr@flip-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][44] ([Intel XE#1201] /
> [Intel XE#455]) +34 other tests skip
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@kms_vrr@flip-suspend.html
>=20
> =C2=A0 * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][45] ([Intel XE#1201] /
> [Intel XE#756]) +1 other test skip
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@kms_writeback@writeback-fb-id-xrgb2101010.html
>=20
> =C2=A0 * igt@sriov_basic@bind-unbind-vf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][46] ([Intel XE#1201] /
> [Intel XE#1932])
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@sriov_basic@bind-unbind-vf.html
>=20
> =C2=A0 * igt@xe_ccs@suspend-resume:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#488]) +1 other test skip
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@xe_ccs@suspend-resume.html
>=20
> =C2=A0 * igt@xe_create@create-big-vram:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#1062] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@xe_create@create-big-vram.html
>=20
> =C2=A0 * igt@xe_evict@evict-small-multi-vm-cm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#1201] /
> [Intel XE#261] / [Intel XE#688]) +5 other tests skip
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@xe_evict@evict-small-multi-vm-cm.html
>=20
> =C2=A0 * igt@xe_evict@evict-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#1201] /
> [Intel XE#261]) +6 other tests skip
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@xe_evict@evict-threads-large.html
>=20
> =C2=A0 * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][51] ([Intel XE#1201] /
> [Intel XE#688]) +3 other tests skip
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][52] ([Intel XE#1201] /
> [Intel XE#1392]) +16 other tests skip
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][53] ([Intel XE#1201] /
> [Intel XE#288]) +40 other tests skip
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
>=20
> =C2=A0 * igt@xe_exec_reset@gt-reset-stress:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][54] ([Intel XE#1214]
> / [Intel XE#1638])
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@xe_exec_reset@gt-reset-stress.html
>=20
> =C2=A0 * igt@xe_gt_freq@freq_reset_multiple:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][55] ([Intel
> XE#1214]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-2/igt=
@xe_gt_freq@freq_reset_multiple.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_migrate:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][56] ([Intel XE#1192] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@xe_live_ktest@xe_migrate.html
>=20
> =C2=A0 * igt@xe_mmap@small-bar:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][57] ([Intel XE#1201] /
> [Intel XE#512])
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@xe_mmap@small-bar.html
>=20
> =C2=A0 * igt@xe_mmap@vram:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][58] ([Intel XE#1008] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@xe_mmap@vram.html
>=20
> =C2=A0 * igt@xe_module_load@load:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][59] ([Intel XE#1201] /
> [Intel XE#378]) +1 other test skip
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@xe_module_load@load.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xe2:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][60] ([Intel XE#1201] /
> [Intel XE#977])
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@xe_pat@pat-index-xe2.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-multiple-execs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][61] ([Intel XE#1201] /
> [Intel XE#366]) +1 other test skip
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@xe_pm@d3cold-multiple-execs.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][62] -> [DMESG-WARN][63] ([Intel
> XE#1214])
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@xe_pm@s4-vm-bind-userptr.html
>=20
> =C2=A0 * igt@xe_pm@vram-d3cold-threshold:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][64] ([Intel XE#1201] /
> [Intel XE#579])
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@xe_pm@vram-d3cold-threshold.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-uc-fw-version-huc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][65] ([Intel XE#1201] /
> [Intel XE#944]) +2 other tests skip
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@xe_query@multigpu-query-uc-fw-version-huc.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-
> a-1-x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][66] ([Intel XE#1214] / [Intel
> XE#324]) -> [PASS][67]
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-fli=
p-events@pipe-b-hdmi-a-1-x.html
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-
> a-1-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][68] ([Intel XE#1033] / [Intel
> XE#1214]) -> [PASS][69] +1 other test pass
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-fli=
p-events@pipe-b-hdmi-a-1-y.html
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-8bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [INCOMPLETE][70] -> [PASS][71]
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-lnl-8/igt@kms_big_fb@linear-8bpp-rotate-180.html
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-lnl-7/igt@=
kms_big_fb@linear-8bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-suspend:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][72] ([Intel XE#1830]) ->
> [PASS][73] +1 other test pass
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend.html
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-lnl-5/igt@=
kms_cursor_crc@cursor-suspend.html
>=20
> =C2=A0 * igt@kms_flip@plain-flip-fb-recreate:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [ABORT][74] ([Intel XE#1939]) -> [PASS][75]
> +3 other tests pass
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate.html
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-lnl-5/igt@=
kms_flip@plain-flip-fb-recreate.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-bal-mixed-userptr-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][76] ([Intel XE#1069] / [Intel
> XE#1638]) -> [PASS][77]
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-userpt=
r-rebind.html
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@xe_exec_threads@threads-bal-mixed-userptr-rebind.html
>=20
> =C2=A0 * igt@xe_pm@s4-d3hot-basic-exec:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [ABORT][78] ([Intel XE#1358] / [Intel
> XE#1607]) -> [PASS][79]
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-lnl-6/igt@=
xe_pm@s4-d3hot-basic-exec.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][80] ([Intel XE#1033] / [Intel
> XE#1214] / [Intel XE#324]) -> [DMESG-WARN][81] ([Intel XE#1033] /
> [Intel XE#1214])
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-fli=
p-events.html
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@kms_async_flips@async-flip-with-page-flip-events.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi=
-
> a-1-x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][82] ([Intel XE#1214] / [Intel
> XE#324]) -> [DMESG-WARN][83] ([Intel XE#1033] / [Intel XE#1214])
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-fli=
p-events@pipe-d-hdmi-a-1-x.html
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-1/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-exec-after:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][84] ([Intel XE#1191] / [Intel
> XE#1214]) -> [INCOMPLETE][85] ([Intel XE#1044] / [Intel XE#1195] /
> [Intel XE#1358])
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-6/igt@xe_pm@s2idle-exec-after.html
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-9/igt=
@xe_pm@s2idle-exec-after.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][86] ([Intel XE#1214] / [Intel
> XE#1608]) -> [INCOMPLETE][87] ([Intel XE#1195] / [Intel XE#1694])
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-9/igt=
@xe_pm@s2idle-vm-bind-unbind-all.html
>=20
> =C2=A0 * igt@xe_pm@s3-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][88] ([Intel XE#1195]) ->
> [DMESG-WARN][89] ([Intel XE#1214])
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-1/igt@xe_pm@s3-mocs.html
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@xe_pm@s3-mocs.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][90] ([Intel XE#1214]) ->
> [ABORT][91] ([Intel XE#1794])
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-9/igt=
@xe_pm@s4-vm-bind-prefetch.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][92] ([Intel XE#1794]) -> [DMESG-
> WARN][93] ([Intel XE#1214])
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-8/igt=
@xe_pm@s4-vm-bind-unbind-all.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][94] ([Intel XE#1195] / [Intel
> XE#1349]) -> [DMESG-WARN][95] ([Intel XE#1191] / [Intel XE#1214] /
> [Intel XE#1941])
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1348-f2c37d7fd878c82ea570759=
48d614f60a168128c/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/shard-adlp-6/igt=
@xe_pm_residency@gt-c6-freeze.html
>=20
> =C2=A0=20
> =C2=A0 {name}: This element is suppressed. This means it is ignored when
> computing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the status of the =
difference (SUCCESS, WARNING, or
> FAILURE).
>=20
> =C2=A0 [Intel XE#1008]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
> =C2=A0 [Intel XE#1033]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
> =C2=A0 [Intel XE#1044]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
> =C2=A0 [Intel XE#1062]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
> =C2=A0 [Intel XE#1069]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
> =C2=A0 [Intel XE#1122]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1125]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
> =C2=A0 [Intel XE#1127]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
> =C2=A0 [Intel XE#1135]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
> =C2=A0 [Intel XE#1138]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
> =C2=A0 [Intel XE#1149]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
> =C2=A0 [Intel XE#1152]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
> =C2=A0 [Intel XE#1158]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
> =C2=A0 [Intel XE#1174]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
> =C2=A0 [Intel XE#1191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
> =C2=A0 [Intel XE#1192]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
> =C2=A0 [Intel XE#1195]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> =C2=A0 [Intel XE#1201]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
> =C2=A0 [Intel XE#1211]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
> =C2=A0 [Intel XE#1214]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
> =C2=A0 [Intel XE#1330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
> =C2=A0 [Intel XE#1331]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
> =C2=A0 [Intel XE#1349]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349
> =C2=A0 [Intel XE#1358]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1397]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
> =C2=A0 [Intel XE#1399]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
> =C2=A0 [Intel XE#1401]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1407]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> =C2=A0 [Intel XE#1413]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
> =C2=A0 [Intel XE#1420]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1428]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1437]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
> =C2=A0 [Intel XE#1446]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
> =C2=A0 [Intel XE#1488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1488
> =C2=A0 [Intel XE#1512]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
> =C2=A0 [Intel XE#1607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
> =C2=A0 [Intel XE#1608]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
> =C2=A0 [Intel XE#1638]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
> =C2=A0 [Intel XE#1659]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
> =C2=A0 [Intel XE#1694]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
> =C2=A0 [Intel XE#1745]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> =C2=A0 [Intel XE#1760]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
> =C2=A0 [Intel XE#1794]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> =C2=A0 [Intel XE#1830]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
> =C2=A0 [Intel XE#1861]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
> =C2=A0 [Intel XE#1874]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> =C2=A0 [Intel XE#1908]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
> =C2=A0 [Intel XE#1932]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
> =C2=A0 [Intel XE#1939]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939
> =C2=A0 [Intel XE#1941]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
> =C2=A0 [Intel XE#261]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#305]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
> =C2=A0 [Intel XE#306]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> =C2=A0 [Intel XE#307]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
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
> =C2=A0 [Intel XE#323]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
> =C2=A0 [Intel XE#324]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
> =C2=A0 [Intel XE#327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
> =C2=A0 [Intel XE#352]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
> =C2=A0 [Intel XE#356]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
> =C2=A0 [Intel XE#361]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
> =C2=A0 [Intel XE#366]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
> =C2=A0 [Intel XE#378]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
> =C2=A0 [Intel XE#498]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
> =C2=A0 [Intel XE#512]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
> =C2=A0 [Intel XE#560]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
> =C2=A0 [Intel XE#579]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
> =C2=A0 [Intel XE#584]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
> =C2=A0 [Intel XE#599]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#660]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
> =C2=A0 [Intel XE#688]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> =C2=A0 [Intel XE#702]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
> =C2=A0 [Intel XE#703]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
> =C2=A0 [Intel XE#756]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#927]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [Intel XE#958]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> =C2=A0 [Intel XE#977]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-1348-f2c37d7fd878c82ea57075948d614f60a168128c -> xe-pw=
-
> 134087v1
>=20
> =C2=A0 IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 xe-1348-f2c37d7fd878c82ea57075948d614f60a168128c:
> f2c37d7fd878c82ea57075948d614f60a168128c
> =C2=A0 xe-pw-134087v1: 134087v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134087v1/index.html

