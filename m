Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F66C10F15
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 08:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F25E10F066;
	Wed, 24 Apr 2024 08:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5LcocZ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B6010F066
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 08:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713946768; x=1745482768;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=TZ7aA/dEeVM0qBv5A7JlCRQ+TeXYAoUx29PSg0YRZ6k=;
 b=g5LcocZ+dAvV2UYEZFLA+y4BrdN3wxFp1gfHWcUhtPnuDGmYIXchprPy
 FWS8n+MBdx1zE5N7PZa4xnVDb2qzhHVPv/MQjVFTNhbPhovDcAgTz6fcE
 2yFYY/KPC3jaXY0T0hNPLuc47U+3d/p1F6zEUurewpUamjk5/J5lMdiNa
 4r1wUJvORQjWFnybpNAQiBrQ8/JFvd0Nj9HlPmUJBGTUFZiVJxHU9NemC
 X8du7+PUzU8MMHB7mpRnFujhg+DplYOD3RljclO+w7VSegvBvzS3tlM8+
 CKflCn2po/fqYmn2JVHSi46ZZJRfi1+PUMh3+fP/RcX6400Vjz+3vp9Db A==;
X-CSE-ConnectionGUID: jN2F7tpAQ+azLDOInmgvtg==
X-CSE-MsgGUID: lTB+5ZICQHW/FxO6oI9Khw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="32055838"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="32055838"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:19:28 -0700
X-CSE-ConnectionGUID: 33ZB0RPPRLKb/hREoZ7KlA==
X-CSE-MsgGUID: 08d2J54LQf6DXeFZdgx6og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24691135"
Received: from nyong-mobl1.ccr.corp.intel.com (HELO [10.249.254.246])
 ([10.249.254.246])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:19:26 -0700
Message-ID: <16c91174234602bcb2e393feeb29c3c5551200cf.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.FULL: failure for drm/xe: Fix
 unexpected backmerge results
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 10:19:02 +0200
In-Reply-To: <171393064339.1610190.10809091354147382803@8e613ede5ea5>
References: <20240423121114.39325-1-thomas.hellstrom@linux.intel.com>
 <171393064339.1610190.10809091354147382803@8e613ede5ea5>
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

The failures are unrelated to this patch.

/Thomas



On Wed, 2024-04-24 at 03:50 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Fix unexpected backmerge results
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/132774/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-1161-
> d3158dfc418559bcd958bae7af47374e38d6f468_full -> xe-pw-132774v1_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-132774v1_full absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-132774v1_full, please notify your bug team
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
> pw-132774v1_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@core_setmaster@master-drop-set-root:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][1] +1 other test fail
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@core_setmaster@master-drop-set-root.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][2] -> [FAIL][3]
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interrup=
tible@a-hdmi-a1.html
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-4/igt=
@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
>=20
> =C2=A0=20
> #### Suppressed ####
>=20
> =C2=A0 The following results come from untrusted machines, tests, or
> statuses.
> =C2=A0 They do not affect the overall result.
>=20
> =C2=A0 * igt@kms_big_fb@linear-64bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][4] -> [INCOMPLETE][5]
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-4/igt@=
kms_big_fb@linear-64bpp-rotate-0.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NOTRUN -> [SKIP][6] +17 other tests skip
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-8/igt@=
kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_pm_rpm@legacy-planes-dpms:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [PASS][7] -> [INCOMPLETE][8]
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms.html
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-4/igt@=
kms_pm_rpm@legacy-planes-dpms.html
>=20
> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-132774v1_full that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@core_hotunplug@hotreplug-lateclose:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [D=
MESG-FAIL][9] ([Intel XE#1548])
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-466/ig=
t@core_hotunplug@hotreplug-lateclose.html
>=20
> =C2=A0 * igt@core_hotunplug@hotunplug-rescan:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [INCOMPLETE][10] ([Intel XE#1195]
> / [Intel XE#1365])
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-9/igt=
@core_hotunplug@hotunplug-rescan.html
>=20
> =C2=A0 * igt@kms_big_fb@linear-16bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][11] ([Intel XE#1201] /
> [Intel XE#316])
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-9/igt=
@kms_big_fb@linear-16bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][12] ([Intel XE#1201] /
> [Intel XE#316])
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@kms_big_fb@x-tiled-32bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip=
:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][13] ([Intel XE#1204]) +1
> other test fail
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>=20
> =C2=A0 *
> igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][14] ([Intel XE#1231]) +2
> other tests fail
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-4/igt=
@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][15] ([Intel XE#1201] /
> [Intel XE#829]) +6 other tests skip
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-463/ig=
t@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][16] ([Intel XE#1124] /
> [Intel XE#1201]) +2 other tests skip
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@kms_big_fb@yf-tiled-8bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#1124] /
> [Intel XE#1201]) +12 other tests skip
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_big_fb@yf-tiled-8bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][18] ([Intel XE#1201] /
> [Intel XE#619])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-466/ig=
t@kms_big_fb@yf-tiled-addfb.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#1201] /
> [Intel XE#367])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@kms_bw@linear-tiling-3-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#787]) +21 other tests skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-8/igt=
@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-
> 1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#1201] /
> [Intel XE#787]) +32 other tests skip
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-8/igt=
@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][22] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#787]) +3 other tests skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c=
-
> hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][23] ([Intel XE#1201] /
> [Intel XE#787]) +13 other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.htm=
l
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-0-25:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][24] ([Intel XE#1201] /
> [Intel XE#306])
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-466/ig=
t@kms_chamelium_color@ctm-0-25.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-max:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][25] ([Intel XE#1201] /
> [Intel XE#306]) +2 other tests skip
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-8/igt=
@kms_chamelium_color@ctm-max.html
>=20
> =C2=A0 * igt@kms_chamelium_frames@hdmi-crc-single:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][26] ([Intel XE#1201] /
> [Intel XE#373])
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@kms_chamelium_frames@hdmi-crc-single.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][27] ([Intel XE#1201] /
> [Intel XE#373]) +5 other tests skip
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-4/igt=
@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@vga-hpd:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][28] ([Intel XE#1201] /
> [i915#2575]) +44 other tests skip
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_chamelium_hpd@vga-hpd.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][29] ([Intel XE#1201] /
> [Intel XE#308]) +1 other test skip
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-466/ig=
t@kms_cursor_crc@cursor-offscreen-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][30] ([Intel XE#1201] /
> [Intel XE#308]) +2 other tests skip
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_cursor_crc@cursor-sliding-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_edge_walk@128x128-left-edge:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][31] ([Intel XE#581]) +1
> other test fail
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-463/ig=
t@kms_cursor_edge_walk@128x128-left-edge.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][32] -=
> [DMESG-WARN][33] ([Intel
> XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-leg=
acy.html
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#1201] /
> [Intel XE#323])
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#1201] /
> [Intel XE#309]) +4 other tests skip
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@psr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][36] ([Intel XE#1201] /
> [Intel XE#776])
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_fbcon_fbt@psr.html
>=20
> =C2=A0 * igt@kms_fbcon_fbt@psr-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][37] ([Intel XE#1201] /
> [Intel XE#776])
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-463/ig=
t@kms_fbcon_fbt@psr-suspend.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-4x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][38] ([Intel XE#1138] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_feature_discovery@display-4x.html
>=20
> =C2=A0 * igt@kms_feature_discovery@psr2:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][39] ([Intel XE#1135] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@kms_feature_discovery@psr2.html
>=20
> =C2=A0 * igt@kms_flip@2x-wf_vblank-ts-check:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][40] ([Intel XE#1201] /
> [Intel XE#310]) +3 other tests skip
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_flip@2x-wf_vblank-ts-check.html
>=20
> =C2=A0 * igt@kms_flip@busy-flip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][41] -=
> [SKIP][42] ([Intel XE#1201] /
> [i915#2575]) +135 other tests skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_flip@busy-flip.html
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_flip@busy-flip.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][43] -> [FAIL][44] ([Intel XE#301])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interrup=
tible.html
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-4/igt=
@kms_flip@flip-vs-expired-vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][45] ([Intel XE#1214]
> / [Intel XE#1608]) +2 other tests dmesg-warn
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>=20
> =C2=A0 *
> igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][46] ([Intel XE#1201] /
> [Intel XE#1235])
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-463/ig=
t@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pip
> e-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][47] ([Intel XE#422] /
> [Intel XE#616]) +1 other test fail
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-8/igt=
@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid=
-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][48] ([Intel XE#324])
> +1 other test dmesg-fail
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][49] ([Intel XE#616]) +9
> other tests fail
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][50] ([Intel XE#616])
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-466/ig=
t@kms_frontbuffer_tracking@fbc-suspend.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][51] ([Intel XE#1201] /
> [Intel XE#651]) +14 other tests skip
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][52] ([Intel XE#1201] /
> [Intel XE#651]) +11 other tests skip
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-466/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][53] ([Intel XE#1201] /
> [Intel XE#653]) +7 other tests skip
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-463/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][54] ([Intel XE#1201] /
> [Intel XE#653]) +11 other tests skip
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][55] ([Intel XE#1201] /
> [Intel XE#656]) +29 other tests skip
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-8/igt=
@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][56] ([Intel XE#1201] /
> [Intel XE#455]) +6 other tests skip
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@kms_hdr@invalid-hdr.html
>=20
> =C2=A0 * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][57] ([Intel XE#1201] /
> [Intel XE#356])
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format-source-clamping@pipe-a:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][58] ([Intel XE#1331]) +2
> other tests fail
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_plane@pixel-format-source-clamping@pipe-a.html
>=20
> =C2=A0 * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][59] ([Intel XE#1201] /
> [Intel XE#1234])
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-463/ig=
t@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
>=20
> =C2=A0 * igt@kms_plane_scaling@planes-downscale-factor-0-25:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][60] ([Intel XE#1201] /
> [Intel XE#305] / [Intel XE#455]) +1 other test skip
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_plane_scaling@planes-downscale-factor-0-25.html
>=20
> =C2=A0 * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a=
-
> 1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][61] ([Intel XE#1201] /
> [Intel XE#305]) +2 other tests skip
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_pm_backlight@fade:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][62] ([Intel XE#1201] /
> [Intel XE#870])
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-466/ig=
t@kms_pm_backlight@fade.html
>=20
> =C2=A0 * igt@kms_pm_backlight@fade-with-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][63] ([Intel XE#1201] /
> [Intel XE#870])
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@kms_pm_backlight@fade-with-suspend.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-non-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][64] ([Intel XE#1201] /
> [Intel XE#836])
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_pm_rpm@modeset-non-lpsp.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][65] ([Intel XE#1201] /
> [Intel XE#1211])
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>=20
> =C2=A0 * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][66] ([Intel XE#1201] /
> [Intel XE#929]) +5 other tests skip
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-463/ig=
t@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#1201]) +4
> other tests skip
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-8/igt=
@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
>=20
> =C2=A0 * igt@kms_psr@psr-cursor-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][68] ([Intel XE#1201] /
> [Intel XE#929]) +8 other tests skip
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@kms_psr@psr-cursor-blt.html
>=20
> =C2=A0 * igt@kms_rotation_crc@bad-pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][69] ([Intel XE#1201] /
> [Intel XE#327]) +2 other tests skip
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@kms_rotation_crc@bad-pixel-format.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][70] ([Intel XE#1127] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][71] ([Intel XE#1127] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>=20
> =C2=A0 * igt@kms_sysfs_edid_timing:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][72] ([Intel XE#1174])
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-8/igt=
@kms_sysfs_edid_timing.html
>=20
> =C2=A0 * igt@kms_tv_load_detect@load-detect:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][73] ([Intel XE#1201] /
> [Intel XE#330])
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-8/igt=
@kms_tv_load_detect@load-detect.html
>=20
> =C2=A0 * igt@kms_vrr@flip-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][74] ([Intel XE#1201] /
> [Intel XE#455]) +19 other tests skip
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_vrr@flip-suspend.html
>=20
> =C2=A0 * igt@sriov_basic@enable-vfs-bind-unbind-each:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][75] ([Intel XE#1091] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@sriov_basic@enable-vfs-bind-unbind-each.html
>=20
> =C2=A0 * igt@xe_ccs@block-multicopy-compressed:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][76] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#488])
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@xe_ccs@block-multicopy-compressed.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0x369:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][77] ([Intel XE#1123] /
> [Intel XE#1201]) +1 other test skip
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@xe_copy_basic@mem-copy-linear-0x369.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0x3fff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][78] ([Intel XE#1123] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@xe_copy_basic@mem-copy-linear-0x3fff.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0xfffe:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][79] ([Intel XE#1126] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-466/ig=
t@xe_copy_basic@mem-set-linear-0xfffe.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-large-external:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][80] ([Intel XE#1201] /
> [Intel XE#261]) +3 other tests skip
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-9/igt=
@xe_evict@evict-beng-large-external.html
>=20
> =C2=A0 * igt@xe_evict@evict-small-cm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][81] ([Intel XE#1201] /
> [Intel XE#261] / [Intel XE#688])
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@xe_evict@evict-small-cm.html
>=20
> =C2=A0 * igt@xe_evict@evict-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][82] ([Intel XE#1195]
> / [Intel XE#1473] / [Intel XE#392])
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@xe_evict@evict-threads-large.html
>=20
> =C2=A0 * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][83] ([Intel XE#1201] /
> [Intel XE#688]) +1 other test skip
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
>=20
> =C2=A0 * igt@xe_exec_basic@many-null-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][84] -=
> [SKIP][85] ([Intel XE#1201])
> +302 other tests skip
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_exec_basic@many-null-rebind.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][86] ([Intel XE#1201] /
> [Intel XE#1392]) +6 other tests skip
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-8/igt=
@xe_exec_basic@multigpu-once-null-defer-mmap.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][87] ([Intel XE#1201] /
> [Intel XE#288]) +17 other tests skip
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-4/igt=
@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][88] ([Intel XE#1201] /
> [Intel XE#288]) +7 other tests skip
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][89] ([Intel XE#1192] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@xe_live_ktest@xe_bo.html
>=20
> =C2=A0 * igt@xe_media_fill@media-fill:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][90] ([Intel XE#1201] /
> [Intel XE#560])
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@xe_media_fill@media-fill.html
>=20
> =C2=A0 * igt@xe_noexec_ping_pong:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][91] ([Intel XE#1201] /
> [Intel XE#379])
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@xe_noexec_ping_pong.html
>=20
> =C2=A0 * igt@xe_pm@d3-mmap-vram:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][92] ([Intel XE#1008] /
> [Intel XE#1201]) +1 other test skip
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@xe_pm@d3-mmap-vram.html
>=20
> =C2=A0 * igt@xe_pm@s3-d3hot-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [WARN][93] ([Intel XE#1639])
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@xe_pm@s3-d3hot-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-d3cold-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][94] ([Intel XE#1201] /
> [Intel XE#366])
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@xe_pm@s4-d3cold-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-exec-after:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][95] ([Intel XE#1043] /
> [Intel XE#845])
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-4/igt=
@xe_pm@s4-exec-after.html
>=20
> =C2=A0 * igt@xe_pm_residency@gt-c6-freeze:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-WARN][96] ([Intel XE#1191]
> / [Intel XE#1214]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@xe_pm_residency@gt-c6-freeze.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-config:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][97] ([Intel XE#1201] /
> [Intel XE#944])
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-463/ig=
t@xe_query@multigpu-query-config.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-extension:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][98] ([Intel XE#1201] /
> [Intel XE#944]) +1 other test skip
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-8/igt=
@xe_query@multigpu-query-invalid-extension.html
>=20
> =C2=A0 * igt@xe_vm@large-split-binds-536870912:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][99] ([Intel XE#1201]) +149
> other tests skip
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_vm@large-split-binds-536870912.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-
> outputs:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [INCOMPLETE][100] ([Intel XE#1330]) ->
> [PASS][101] +1 other test pass
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-=
nonblocking@1x-outputs.html
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-7/igt@=
kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[102] ([Intel XE#1214] / [Intel
> XE#282]) -> [PASS][103] +1 other test pass
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-toggle=
.html
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-434/ig=
t@kms_cursor_legacy@cursor-vs-flip-toggle.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a6-dp4=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[104] ([Intel XE#1195]) ->
> [PASS][105] +2 other tests pass
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-436/igt@kms_flip@2x-plain-flip-ts-check-interru=
ptible@bc-hdmi-a6-dp4.html
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-466/ig=
t@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@plain-flip-ts-check-interruptible:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][106] ([Intel XE#1652] / [Intel
> XE#480]) -> [PASS][107]
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptibl=
e.html
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-7/igt@=
kms_flip@plain-flip-ts-check-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@plain-flip-ts-check-interruptible@b-edp1:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][108] -> [PASS][109]
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptibl=
e@b-edp1.html
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-7/igt@=
kms_flip@plain-flip-ts-check-interruptible@b-edp1.html
>=20
> =C2=A0 * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][110] ([Intel XE#886]) -> [PASS][111]
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptibl=
e@c-edp1.html
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-7/igt@=
kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
>=20
> =C2=A0 * igt@kms_flip@wf_vblank-ts-check@a-edp1:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][112] ([Intel XE#480]) -> [PASS][113]
> +1 other test pass
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-8/igt@=
kms_flip@wf_vblank-ts-check@a-edp1.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][114] ([Intel XE#771] / [Intel
> XE#899]) -> [PASS][115]
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_universal_plane@cursor-fb-leak.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][116] ([Intel XE#899]) -> [PASS][117]
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-=
a-hdmi-a-1.html
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [TIMEOUT][11=
8] ([Intel XE#1473] / [Intel
> XE#392] / [Intel XE#931]) -> [PASS][119]
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large=
.html
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-433/ig=
t@xe_evict@evict-beng-mixed-threads-large.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [TIMEOUT][12=
0] ([Intel XE#1473] / [Intel
> XE#392]) -> [PASS][121]
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@xe_evict@evict-mixed-threads-large.html
>=20
> =C2=A0 * igt@xe_exec_reset@gt-reset-stress:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][122] -> [PASS][123]
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-1/igt@xe_exec_reset@gt-reset-stress.html
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-3/igt@=
xe_exec_reset@gt-reset-stress.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][124] ([Intel XE#1081]) ->
> [PASS][125]
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-i=
nvalidate-race.html
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-3/igt@=
xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>=20
> =C2=A0 * igt@xe_gt_freq@freq_fixed_idle:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][126] ([Intel XE#1414]) ->
> [PASS][127]
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-7/igt@=
xe_gt_freq@freq_fixed_idle.html
>=20
> =C2=A0 * igt@xe_gt_freq@freq_reset_multiple:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [INCOMPLETE][128] -> [PASS][129] +1 other
> test pass
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-7/igt@=
xe_gt_freq@freq_reset_multiple.html
>=20
> =C2=A0 * igt@xe_pm_residency@idle-residency-on-exec:
> =C2=A0=C2=A0=C2=A0 - {shard-lnl}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][130] ([Intel XE#1330]) ->
> [PASS][131] +7 other tests pass
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-lnl-5/igt@xe_pm_residency@idle-residency-on-exec.ht=
ml
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-lnl-8/igt@=
xe_pm_residency@idle-residency-on-exec.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@core_hotunplug@hotreplug:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-FAIL]=
[132] ([Intel XE#1548]) ->
> [SKIP][133] ([Intel XE#1201]) +1 other test skip
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-435/igt@core_hotunplug@hotreplug.html
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@core_hotunplug@hotreplug.html
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][134] =
([Intel XE#827]) -> [SKIP][135]
> ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-fl=
ip.html
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_async_flips@alternate-sync-async-flip.html
>=20
> =C2=A0 * igt@kms_async_flips@invalid-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][136] =
([Intel XE#1201] / [Intel
> XE#873]) -> [SKIP][137] ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_async_flips@invalid-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][138] =
([Intel XE#1201] / [Intel
> XE#316]) -> [SKIP][139] ([Intel XE#1201]) +5 other tests skip
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_big_fb@4-tiled-8bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][140] =
([Intel XE#1124] / [Intel
> XE#1201]) -> [SKIP][141] ([Intel XE#1201]) +21 other tests skip
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.ht=
ml
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][142] =
([Intel XE#1201] / [Intel
> XE#607]) -> [SKIP][143] ([Intel XE#1201])
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-o=
verflow.html
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][144] =
([Intel XE#1201] / [Intel
> XE#367]) -> [SKIP][145] ([Intel XE#1201] / [i915#2575]) +4 other
> tests skip
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x10=
80p.html
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_bw@linear-tiling-1-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][146] =
([Intel XE#1201] / [Intel
> XE#1252]) -> [SKIP][147] ([Intel XE#1201]) +1 other test skip
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tile=
d-xe2-ccs.html
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][148] =
([Intel XE#1201] / [Intel
> XE#455] / [Intel XE#787]) -> [SKIP][149] ([Intel XE#1201]) +21 other
> tests skip
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-=
ccs.html
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition-all-outputs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][150] =
([Intel XE#1201] / [Intel
> XE#314]) -> [SKIP][151] ([Intel XE#1201])
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.h=
tml
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_cdclk@mode-transition-all-outputs.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-red-to-blue:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][152] =
([Intel XE#1201] / [Intel
> XE#306]) -> [SKIP][153] ([Intel XE#1201] / [i915#2575]) +2 other
> tests skip
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.htm=
l
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_chamelium_color@ctm-red-to-blue.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][154] =
([Intel XE#1201] / [Intel
> XE#373]) -> [SKIP][155] ([Intel XE#1201] / [i915#2575]) +14 other
> tests skip
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe=
.html
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[156] ([Intel XE#1195]) ->
> [SKIP][157] ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_content_protection@lic-type-0.html
>=20
> =C2=A0 * igt@kms_content_protection@srm:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][158] =
([Intel XE#1178]) ->
> [SKIP][159] ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_content_protection@srm.html
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_content_protection@srm.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-onscreen-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][160] =
([Intel XE#1201] / [Intel
> XE#308]) -> [SKIP][161] ([Intel XE#1201] / [i915#2575]) +1 other test
> skip
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.=
html
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_cursor_crc@cursor-onscreen-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_edge_walk@256x256-top-bottom:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[162] ([Intel XE#1214] / [Intel
> XE#282]) -> [SKIP][163] ([Intel XE#1201] / [i915#2575]) +9 other
> tests skip
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-top-bottom=
.html
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_cursor_edge_walk@256x256-top-bottom.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][164] =
([Intel XE#1201] / [Intel
> XE#323]) -> [SKIP][165] ([Intel XE#1201] / [i915#2575]) +3 other
> tests skip
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-befor=
e-cursor-atomic.html
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[166] ([Intel XE#1214] / [Intel
> XE#282] / [Intel XE#910]) -> [SKIP][167] ([Intel XE#1201] /
> [i915#2575])
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_feature_discovery@chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][168] =
([Intel XE#1201] / [Intel
> XE#701]) -> [SKIP][169] ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_feature_discovery@chamelium.html
>=20
> =C2=A0 * igt@kms_feature_discovery@dp-mst:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][170] =
([Intel XE#1137] / [Intel
> XE#1201]) -> [SKIP][171] ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_feature_discovery@dp-mst.html
>=20
> =C2=A0 * igt@kms_feature_discovery@psr1:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][172] =
([Intel XE#1135] / [Intel
> XE#1201]) -> [SKIP][173] ([Intel XE#1201] / [i915#2575]) +1 other
> test skip
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_feature_discovery@psr1.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_feature_discovery@psr1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][174] ([Intel XE#1195] / [Intel
> XE#927]) -> [DMESG-WARN][175] ([Intel XE#1191] / [Intel XE#1214] /
> [Intel XE#1608])
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_flip@flip-vs-suspend.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][176] ([Intel XE#1191] / [Intel
> XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][177] ([Intel XE#1195] /
> [Intel XE#927])
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.h=
tml
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-9/igt=
@kms_flip@flip-vs-suspend-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][178] ([Intel XE#1191] / [Intel
> XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][179] ([Intel XE#1195])
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a=
-hdmi-a1.html
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-9/igt=
@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][180] ([Intel XE#1195]) ->
> [DMESG-WARN][181] ([Intel XE#1191] / [Intel XE#1214] / [Intel
> XE#1608])
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][182] =
([Intel XE#1201] / [Intel
> XE#455]) -> [SKIP][183] ([Intel XE#1201]) +10 other tests skip
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to=
-32bpp-ytilegen12rcccs-upscaling.html
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.h=
tml
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][184] =
([Intel XE#1201] / [Intel
> XE#651]) -> [SKIP][185] ([Intel XE#1201]) +51 other tests skip
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.h=
tml
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@drrs-suspend.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][186] =
([Intel XE#1201] / [Intel
> XE#658]) -> [SKIP][187] ([Intel XE#1201]) +1 other test skip
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling=
-y.html
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-slowdraw:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][188] =
([Intel XE#1201] / [Intel
> XE#653]) -> [SKIP][189] ([Intel XE#1201]) +53 other tests skip
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.h=
tml
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@psr-slowdraw.html
>=20
> =C2=A0 * igt@kms_pipe_crc_basic@suspend-read-crc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][190] ([Intel XE#1195] / [Intel
> XE#927]) -> [DMESG-WARN][191] ([Intel XE#1191] / [Intel XE#1214])
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc.html
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_pipe_crc_basic@suspend-read-crc.html
>=20
> =C2=A0 * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][192] ([Intel XE#1195]) ->
> [DMESG-WARN][193] ([Intel XE#1191] / [Intel XE#1214])
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe=
-a-hdmi-a-1.html
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-2/igt=
@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][194] =
([Intel XE#650]) -> [SKIP][195]
> ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-435/igt@kms_plane@pixel-format.html
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_plane@pixel-format.html
>=20
> =C2=A0 * igt@kms_plane_cursor@primary:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][196] =
([Intel XE#616]) -> [SKIP][197]
> ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_plane_cursor@primary.html
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_plane_cursor@primary.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [TIMEOUT][19=
8] ([Intel XE#380] / [Intel
> XE#904] / [Intel XE#909]) -> [SKIP][199] ([Intel XE#1201] /
> [i915#2575])
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-facto=
r-0-5-with-pixel-format.html
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pi
> pe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[200] ([Intel XE#1195]) ->
> [INCOMPLETE][201] ([Intel XE#1195] / [Intel XE#909]) +1 other test
> incomplete
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-sc=
aling-with-pixel-format@pipe-a-hdmi-a-6.html
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-466/ig=
t@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdm=
i-a-6.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [TIMEOUT][20=
2] ([Intel XE#295] / [Intel
> XE#380] / [Intel XE#909]) -> [SKIP][203] ([Intel XE#1201] /
> [i915#2575])
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-with-cli=
pping-clamping-pixel-formats.html
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][204] =
([Intel XE#1201] / [Intel
> XE#305] / [Intel XE#455]) -> [SKIP][205] ([Intel XE#1201] /
> [i915#2575])
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor=
-0-25-downscale-factor-0-25.html
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>=20
> =C2=A0 * igt@kms_pm_backlight@basic-brightness:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][206] =
([Intel XE#1201] / [Intel
> XE#870]) -> [SKIP][207] ([Intel XE#1201])
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_pm_backlight@basic-brightness.html
>=20
> =C2=A0 * igt@kms_pm_rpm@system-suspend-modeset:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][208] =
([Intel XE#1201] / [Intel
> XE#1211]) -> [SKIP][209] ([Intel XE#1201])
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_pm_rpm@system-suspend-modeset.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-nv12:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][210] =
([Intel XE#1122] / [Intel
> XE#1201]) -> [SKIP][211] ([Intel XE#1201]) +3 other tests skip
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_psr2_su@page_flip-nv12.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-no-drrs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][212] =
([Intel XE#1201] / [Intel
> XE#929]) -> [SKIP][213] ([Intel XE#1201]) +33 other tests skip
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-435/igt@kms_psr@fbc-pr-no-drrs.html
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_psr@fbc-pr-no-drrs.html
>=20
> =C2=A0 * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][214] =
([Intel XE#1149] / [Intel
> XE#1201]) -> [SKIP][215] ([Intel XE#1201])
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-=
flip-overlay.html
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][216] =
([Intel XE#1201] / [Intel
> XE#327]) -> [SKIP][217] ([Intel XE#1201] / [i915#2575]) +3 other
> tests skip
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflec=
t-x-90.html
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][218] =
([Intel XE#1127] / [Intel
> XE#1201]) -> [SKIP][219] ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-refle=
ct-x-180.html
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][220] =
([Intel XE#1201] / [Intel
> XE#362]) -> [SKIP][221] ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.ht=
ml
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@kms_tv_load_detect@load-detect:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][222] =
([Intel XE#1201] / [Intel
> XE#330]) -> [SKIP][223] ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_tv_load_detect@load-detect.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[224] ([Intel XE#1162] / [Intel
> XE#1214]) -> [SKIP][225] ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [224]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend=
.html
> =C2=A0=C2=A0 [225]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_vblank@ts-continuation-dpms-suspend.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][226] ([Intel XE#1034] / [Intel
> XE#1195]) -> [DMESG-WARN][227] ([Intel XE#1191] / [Intel XE#1214] /
> [Intel XE#1608])
> =C2=A0=C2=A0 [226]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.=
html
> =C2=A0=C2=A0 [227]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@kms_vblank@ts-continuation-dpms-suspend.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][228] ([Intel XE#1034] / [Intel
> XE#1195]) -> [DMESG-WARN][229] ([Intel XE#1191] / [Intel XE#1214])
> =C2=A0=C2=A0 [228]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@=
pipe-a-hdmi-a-1.html
> =C2=A0=C2=A0 [229]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-6/igt=
@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][230] ([Intel XE#1191] / [Intel
> XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][231] ([Intel XE#1034] /
> [Intel XE#1195])
> =C2=A0=C2=A0 [230]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
> =C2=A0=C2=A0 [231]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-1/igt=
@kms_vblank@ts-continuation-suspend.html
>=20
> =C2=A0 * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][232] ([Intel XE#1191] / [Intel
> XE#1214]) -> [INCOMPLETE][233] ([Intel XE#1034] / [Intel XE#1195])
> =C2=A0=C2=A0 [232]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-=
a-hdmi-a-1.html
> =C2=A0=C2=A0 [233]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-1/igt=
@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_vrr@flip-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][234] =
([Intel XE#1201] / [Intel
> XE#455]) -> [SKIP][235] ([Intel XE#1201] / [i915#2575]) +15 other
> tests skip
> =C2=A0=C2=A0 [234]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@kms_vrr@flip-dpms.html
> =C2=A0=C2=A0 [235]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@kms_vrr@flip-dpms.html
>=20
> =C2=A0 * igt@sriov_basic@enable-vfs-autoprobe-on:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][236] =
([Intel XE#1091] / [Intel
> XE#1201]) -> [SKIP][237] ([Intel XE#1201] / [i915#2575])
> =C2=A0=C2=A0 [236]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-on.htm=
l
> =C2=A0=C2=A0 [237]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@sriov_basic@enable-vfs-autoprobe-on.html
>=20
> =C2=A0 * igt@xe_compute@ccs-mode-basic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][238] =
([Intel XE#1050]) ->
> [SKIP][239] ([Intel XE#1201])
> =C2=A0=C2=A0 [238]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@xe_compute@ccs-mode-basic.html
> =C2=A0=C2=A0 [239]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_compute@ccs-mode-basic.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-preempt-many:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][240] =
([Intel XE#1317]) ->
> [SKIP][241] ([Intel XE#1201])
> =C2=A0=C2=A0 [240]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many=
.html
> =C2=A0=C2=A0 [241]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_compute_preempt@compute-preempt-many.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-threadgroup-preempt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][242] =
([Intel XE#1201] / [Intel
> XE#1280] / [Intel XE#455]) -> [SKIP][243] ([Intel XE#1201])
> =C2=A0=C2=A0 [242]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-=
preempt.html
> =C2=A0=C2=A0 [243]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_compute_preempt@compute-threadgroup-preempt.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0xfd:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][244] =
([Intel XE#1123] / [Intel
> XE#1201]) -> [SKIP][245] ([Intel XE#1201])
> =C2=A0=C2=A0 [244]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> =C2=A0=C2=A0 [245]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_copy_basic@mem-copy-linear-0xfd.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[246] ([Intel XE#1195] / [Intel
> XE#1473]) -> [SKIP][247] ([Intel XE#1201])
> =C2=A0=C2=A0 [246]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large-mu=
lti-vm.html
> =C2=A0=C2=A0 [247]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_evict@evict-beng-cm-threads-large-multi-vm.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-many-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[248] ([Intel XE#1195] / [Intel
> XE#1473]) -> [INCOMPLETE][249] ([Intel XE#1195] / [Intel XE#1473] /
> [Intel XE#392])
> =C2=A0=C2=A0 [248]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-=
large.html
> =C2=A0=C2=A0 [249]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-435/ig=
t@xe_evict@evict-beng-mixed-many-threads-large.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [TIMEOUT][25=
0] ([Intel XE#1473] / [Intel
> XE#821]) -> [SKIP][251] ([Intel XE#1201])
> =C2=A0=C2=A0 [250]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
> =C2=A0=C2=A0 [251]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_evict@evict-beng-threads-large.html
>=20
> =C2=A0 *
> igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][252] =
([Intel XE#1201] / [Intel
> XE#288]) -> [SKIP][253] ([Intel XE#1201]) +28 other tests skip
> =C2=A0=C2=A0 [252]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-=
userptr-rebind-prefetch.html
> =C2=A0=C2=A0 [253]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
>=20
> =C2=A0 * igt@xe_gt_freq@freq_suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][254] ([Intel XE#1191] / [Intel
> XE#1214]) -> [INCOMPLETE][255] ([Intel XE#1195])
> =C2=A0=C2=A0 [254]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html
> =C2=A0=C2=A0 [255]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-9/igt=
@xe_gt_freq@freq_suspend.html
>=20
> =C2=A0 * igt@xe_pm@d3-mmap-system:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][256] =
([Intel XE#1221]) ->
> [SKIP][257] ([Intel XE#1201])
> =C2=A0=C2=A0 [256]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-463/igt@xe_pm@d3-mmap-system.html
> =C2=A0=C2=A0 [257]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_pm@d3-mmap-system.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-basic:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][258] ([Intel XE#1191] / [Intel
> XE#1214]) -> [INCOMPLETE][259] ([Intel XE#1044] / [Intel XE#1195] /
> [Intel XE#1358])
> =C2=A0=C2=A0 [258]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-6/igt@xe_pm@s2idle-basic.html
> =C2=A0=C2=A0 [259]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-9/igt=
@xe_pm@s2idle-basic.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][260] ([Intel XE#1195] / [Intel
> XE#1358] / [Intel XE#927]) -> [DMESG-WARN][261] ([Intel XE#1214] /
> [Intel XE#1608])
> =C2=A0=C2=A0 [260]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
> =C2=A0=C2=A0 [261]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-8/igt=
@xe_pm@s2idle-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-d3hot-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][262] ([Intel XE#1214] / [Intel
> XE#1608]) -> [INCOMPLETE][263] ([Intel XE#1195] / [Intel XE#1358] /
> [Intel XE#927])
> =C2=A0=C2=A0 [262]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html
> =C2=A0=C2=A0 [263]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-adlp-1/igt=
@xe_pm@s2idle-d3hot-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s3-d3cold-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][264] =
([Intel XE#1201] / [Intel
> XE#366]) -> [SKIP][265] ([Intel XE#1201]) +1 other test skip
> =C2=A0=C2=A0 [264]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-435/igt@xe_pm@s3-d3cold-basic-exec.html
> =C2=A0=C2=A0 [265]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_pm@s3-d3cold-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s3-d3hot-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[266] ([Intel XE#1162] / [Intel
> XE#1214]) -> [SKIP][267] ([Intel XE#1201])
> =C2=A0=C2=A0 [266]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html
> =C2=A0=C2=A0 [267]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_pm@s3-d3hot-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s3-multiple-execs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[268] ([Intel XE#1044] / [Intel
> XE#1195] / [Intel XE#1358] / [Intel XE#569]) -> [SKIP][269] ([Intel
> XE#1201])
> =C2=A0=C2=A0 [268]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html
> =C2=A0=C2=A0 [269]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_pm@s3-multiple-execs.html
>=20
> =C2=A0 * igt@xe_pm@s4-d3hot-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][270] =
([Intel XE#1043] / [Intel
> XE#845]) -> [SKIP][271] ([Intel XE#1201]) +1 other test skip
> =C2=A0=C2=A0 [270]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html
> =C2=A0=C2=A0 [271]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_pm@s4-d3hot-basic-exec.html
>=20
> =C2=A0 * igt@xe_pm@s4-multiple-execs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-FAIL]=
[272] ([Intel XE#1162] / [Intel
> XE#1551]) -> [SKIP][273] ([Intel XE#1201])
> =C2=A0=C2=A0 [272]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-463/igt@xe_pm@s4-multiple-execs.html
> =C2=A0=C2=A0 [273]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_pm@s4-multiple-execs.html
>=20
> =C2=A0 * igt@xe_pm@vram-d3cold-threshold:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][274] =
([Intel XE#1201] / [Intel
> XE#579]) -> [SKIP][275] ([Intel XE#1201])
> =C2=A0=C2=A0 [274]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
> =C2=A0=C2=A0 [275]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_pm@vram-d3cold-threshold.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-uc-fw-version-huc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][276] =
([Intel XE#1201] / [Intel
> XE#944]) -> [SKIP][277] ([Intel XE#1201]) +6 other tests skip
> =C2=A0=C2=A0 [276]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-h=
uc.html
> =C2=A0=C2=A0 [277]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_query@multigpu-query-uc-fw-version-huc.html
>=20
> =C2=A0 * igt@xe_vm@bind-flag-invalid:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][278] =
([Intel XE#1559]) ->
> [SKIP][279] ([Intel XE#1201])
> =C2=A0=C2=A0 [278]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1161-d3158dfc418559bcd958bae=
7af47374e38d6f468/shard-dg2-435/igt@xe_vm@bind-flag-invalid.html
> =C2=A0=C2=A0 [279]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/shard-dg2-436/ig=
t@xe_vm@bind-flag-invalid.html
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
> =C2=A0 [Intel XE#1034]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
> =C2=A0 [Intel XE#1043]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
> =C2=A0 [Intel XE#1044]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
> =C2=A0 [Intel XE#1050]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
> =C2=A0 [Intel XE#1081]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
> =C2=A0 [Intel XE#1091]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
> =C2=A0 [Intel XE#1122]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> =C2=A0 [Intel XE#1123]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1126]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> =C2=A0 [Intel XE#1127]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
> =C2=A0 [Intel XE#1135]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
> =C2=A0 [Intel XE#1137]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
> =C2=A0 [Intel XE#1138]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
> =C2=A0 [Intel XE#1149]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
> =C2=A0 [Intel XE#1162]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
> =C2=A0 [Intel XE#1174]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
> =C2=A0 [Intel XE#1192]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
> =C2=A0 [Intel XE#1195]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> =C2=A0 [Intel XE#1201]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
> =C2=A0 [Intel XE#1204]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
> =C2=A0 [Intel XE#1211]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
> =C2=A0 [Intel XE#1214]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
> =C2=A0 [Intel XE#1221]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
> =C2=A0 [Intel XE#1231]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
> =C2=A0 [Intel XE#1234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
> =C2=A0 [Intel XE#1235]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
> =C2=A0 [Intel XE#1252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
> =C2=A0 [Intel XE#1280]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
> =C2=A0 [Intel XE#1317]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1317
> =C2=A0 [Intel XE#1330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
> =C2=A0 [Intel XE#1331]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
> =C2=A0 [Intel XE#1358]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
> =C2=A0 [Intel XE#1365]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
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
> =C2=A0 [Intel XE#1414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1428]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1446]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
> =C2=A0 [Intel XE#1450]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
> =C2=A0 [Intel XE#1469]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
> =C2=A0 [Intel XE#1473]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
> =C2=A0 [Intel XE#1488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1488
> =C2=A0 [Intel XE#1512]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
> =C2=A0 [Intel XE#1548]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
> =C2=A0 [Intel XE#1551]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
> =C2=A0 [Intel XE#1558]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
> =C2=A0 [Intel XE#1559]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559
> =C2=A0 [Intel XE#1577]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
> =C2=A0 [Intel XE#1603]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
> =C2=A0 [Intel XE#1608]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
> =C2=A0 [Intel XE#1639]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639
> =C2=A0 [Intel XE#1652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1652
> =C2=A0 [Intel XE#261]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> =C2=A0 [Intel XE#282]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#295]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
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
> =C2=A0 [Intel XE#330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
> =C2=A0 [Intel XE#356]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
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
> =C2=A0 [Intel XE#379]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
> =C2=A0 [Intel XE#380]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
> =C2=A0 [Intel XE#392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
> =C2=A0 [Intel XE#422]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#480]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
> =C2=A0 [Intel XE#488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
> =C2=A0 [Intel XE#560]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
> =C2=A0 [Intel XE#569]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
> =C2=A0 [Intel XE#579]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
> =C2=A0 [Intel XE#581]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
> =C2=A0 [Intel XE#584]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
> =C2=A0 [Intel XE#607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> =C2=A0 [Intel XE#616]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> =C2=A0 [Intel XE#619]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
> =C2=A0 [Intel XE#650]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#658]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
> =C2=A0 [Intel XE#660]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
> =C2=A0 [Intel XE#664]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
> =C2=A0 [Intel XE#688]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> =C2=A0 [Intel XE#701]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
> =C2=A0 [Intel XE#756]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> =C2=A0 [Intel XE#771]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
> =C2=A0 [Intel XE#776]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#821]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
> =C2=A0 [Intel XE#827]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
> =C2=A0 [Intel XE#829]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
> =C2=A0 [Intel XE#836]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> =C2=A0 [Intel XE#845]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#873]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
> =C2=A0 [Intel XE#886]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> =C2=A0 [Intel XE#899]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
> =C2=A0 [Intel XE#904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
> =C2=A0 [Intel XE#909]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
> =C2=A0 [Intel XE#910]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
> =C2=A0 [Intel XE#927]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#931]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/931
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> =C2=A0 [i915#2575]:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-1161-d3158dfc418559bcd958bae7af47374e38d6f468 -> xe-pw=
-
> 132774v1
>=20
> =C2=A0 IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> =C2=A0 xe-1161-d3158dfc418559bcd958bae7af47374e38d6f468:
> d3158dfc418559bcd958bae7af47374e38d6f468
> =C2=A0 xe-pw-132774v1: 132774v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132774v1/index.html

