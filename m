Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395A0EE57CE
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 18:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A8410E199;
	Wed, 11 Sep 2024 18:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHAAxll2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF6B10E133;
 Wed, 11 Sep 2024 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726080396; x=1757616396;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1GkXMtd+oQQNx4dwsI499tc5RGJgsUb5JKgjO6+Kub0=;
 b=oHAAxll2553c8AvErw+rWZmuL/aYP5f7fjQxwYThVLzoYpupvBx+r2EI
 hI34Kgbyq01tptBsoICifIU8tVD9g3xhDksUm8A1aeV85YXNi1mxDMwVU
 XBS1q7CQJHBR8efP6bvFtWg0b13iAsHKvQcOVl17/xINGdhToGeSZKA99
 o8WiWUxPzCFNRLL0ln3ebt2fw5DCHwqoL0v6fBZ6NkxnRSm65lq4yRC1z
 T/ZN4m1DoAcgAyyUfkfOP/IZ++VBefQNfpvIY6PDvW5l9V3DOJgJsCRHd
 pPWdj/gheJxfVdkeB6rX+QLnBgZv/SoCMymPPjMdm4GcVfMi/tvKM2LZL g==;
X-CSE-ConnectionGUID: tqelmILURl+cnK5yVB58Tg==
X-CSE-MsgGUID: seK8GAXZRuiqFga9nskFcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36036963"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="36036963"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 11:46:20 -0700
X-CSE-ConnectionGUID: fVVjCmTOS0umipyb3SLZsw==
X-CSE-MsgGUID: DXGTODcsQG+viGM6VzmuDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="72256798"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.71])
 ([10.245.244.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 11:46:19 -0700
Message-ID: <084a17d1b676badcc340ecb2957a7ae8c7c812c7.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.FULL: failure for drm/ttm: Really use
 a separate LRU list for swapped- and pinned objects (rev6)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Date: Wed, 11 Sep 2024 20:46:16 +0200
In-Reply-To: <172606399080.985329.16297113044298413957@2413ebb6fbb6>
References: <20240911121859.85387-1-thomas.hellstrom@linux.intel.com>
 <172606399080.985329.16297113044298413957@2413ebb6fbb6>
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

On Wed, 2024-09-11 at 14:13 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/ttm: Really use a separate LRU list for swapped- and
> pinned objects (rev6)
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/138103/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-1924-
> f3eded4f8a05d73a0b94f27e05737ea3427450b3_full -> xe-pw-138103v6_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-138103v6_full absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-138103v6_full, please notify your bug team
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
> pw-138103v6_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit (NEW):
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][1]
> =C2=A0=C2=A0 [1]:

This skip is expected and should be documented.


> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-5/igt@=
xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>=20
> =C2=A0=20
> #### Suppressed ####
>=20
> =C2=A0 The following results come from untrusted machines, tests, or
> statuses.
> =C2=A0 They do not affect the overall result.
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NOTRUN -> [INCOMPLETE][2]
> =C2=A0=C2=A0 [2]:=C2=A0

This is unrelated

> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-bmg-3/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
>=20
> =C2=A0 * igt@xe_wedged@wedged-at-any-timeout:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [PASS][3] -> [FAIL][4]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-bmg-2/igt@=
xe_wedged@wedged-at-any-timeout.html
>=20
> =C2=A0=20

Also unrelated and appears to be due to closing a canceled VM.

/Thomas


> New tests
> ---------
>=20
> =C2=A0 New tests have been introduced between xe-1924-
> f3eded4f8a05d73a0b94f27e05737ea3427450b3_full and xe-pw-
> 138103v6_full:
>=20
> ### New IGT tests (1) ###
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> =C2=A0=C2=A0=C2=A0 - Statuses : 3 pass(s) 1 skip(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.19, 78.70] s
>=20
> =C2=A0=20
>=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-138103v6_full that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi=
-
> a-1-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][5] -> [DMESG-WARN][6] ([Intel
> XE#1033])
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-fli=
p-events@pipe-c-hdmi-a-1-y.html
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-6/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][7] ([Intel XE#1201] /
> [Intel XE#316])
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-435/ig=
t@kms_big_fb@4-tiled-16bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][8] ([Intel XE#1201] /
> [Intel XE#619])
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@kms_big_fb@4-tiled-addfb.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][9] ([Intel XE#1124] /
> [Intel XE#1201]) +3 other tests skip
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][10] -> [FAIL][11] ([Intel XE#1659])
> +1 other test fail
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip.html
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][12] ([Intel XE#1124] /
> [Intel XE#1201])
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-435/ig=
t@kms_big_fb@y-tiled-16bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][13] ([Intel XE#1467])
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
kms_big_fb@y-tiled-addfb.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2
> other tests skip
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_big_fb@yf-tiled-8bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][15] ([Intel XE#1201] /
> [Intel XE#619])
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-435/ig=
t@kms_big_fb@yf-tiled-addfb.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#1201] /
> [Intel XE#2191]) +1 other test skip
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][17] ([Intel XE#1201] /
> [Intel XE#2191])
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][18] ([Intel XE#1201] /
> [Intel XE#367])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@kms_bw@linear-tiling-3-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#1512])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_bw@linear-tiling-4-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#1399]) +2
> other tests skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-
> 1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][21] ([Intel XE#1201] /
> [Intel XE#787]) +20 other tests skip
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][22] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#787]) +1 other test skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-
> dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][23] ([Intel XE#1201] /
> [Intel XE#787]) +6 other tests skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][24] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#787]) +13 other tests skip
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][25] ([Intel XE#1201] /
> [Intel XE#1252])
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition-all-outputs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][26] ([Intel XE#1201] /
> [Intel XE#314])
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-435/ig=
t@kms_cdclk@mode-transition-all-outputs.html
>=20
> =C2=A0 * igt@kms_chamelium_audio@dp-audio-edid:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][27] ([Intel XE#373]) +1
> other test skip
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_chamelium_audio@dp-audio-edid.html
>=20
> =C2=A0 * igt@kms_chamelium_color@degamma:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][28] ([Intel XE#1201] /
> [Intel XE#306])
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_chamelium_color@degamma.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][29] ([Intel XE#1201] /
> [Intel XE#373]) +2 other tests skip
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@kms_chamelium_hpd@dp-hpd-after-suspend.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@dp-hpd-fast:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][30] ([Intel XE#1201] /
> [Intel XE#373])
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_chamelium_hpd@dp-hpd-fast.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-onscreen-512x512:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][31] ([Intel XE#1201] /
> [Intel XE#308]) +1 other test skip
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_cursor_crc@cursor-onscreen-512x512.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][32] ([Intel XE#1424]) +1
> other test skip
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_cursor_crc@cursor-rapid-movement-256x85.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#309]) +2
> other tests skip
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#1201] /
> [Intel XE#309])
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@torture-move:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][35] -> [DMESG-WARN][36] ([Intel
> XE#877]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-2/igt@kms_cursor_legacy@torture-move.html
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-1/igt=
@kms_cursor_legacy@torture-move.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@torture-move@pipe-a:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][37] -> [DMESG-WARN][38] ([Intel
> XE#877]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-4/igt@kms_cursor_legacy@torture-move@pipe-a.htm=
l
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-3/igt@=
kms_cursor_legacy@torture-move@pipe-a.html
>=20
> =C2=A0 * igt@kms_flip@2x-busy-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][39] ([Intel XE#1201] /
> [Intel XE#310])
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_flip@2x-busy-flip.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-ts-check:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][40] ([Intel XE#1421]) +3
> other tests skip
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
kms_flip@2x-plain-flip-ts-check.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling
> @pipe-a-default-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][41] ([Intel XE#1401]) +3
> other tests skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a=
-default-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][42] ([Intel XE#1401] /
> [Intel XE#1745]) +3 other tests skip
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
>=20
> =C2=A0 * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][43] -> [FAIL][44] ([Intel XE#1874])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-=
c-hdmi-a-1-x-to-y.html
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-6/igt=
@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][45] ([Intel XE#1201] /
> [Intel XE#651]) +1 other test skip
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-435/ig=
t@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [FAIL][46] ([Intel XE#1861])
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#651]) +4
> other tests skip
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#1201] /
> [Intel XE#651]) +4 other tests skip
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#1201] /
> [Intel XE#656]) +5 other tests skip
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#656]) +8
> other tests skip
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [CRASH][51] ([Intel XE#2749]) +4
> other tests crash
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][52] ([Intel XE#1201] /
> [Intel XE#653]) +4 other tests skip
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][53] ([Intel XE#1201] /
> [Intel XE#653]) +1 other test skip
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-435/ig=
t@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
>=20
> =C2=A0 * igt@kms_hdr@static-toggle-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][54] ([Intel XE#1503] /
> [Intel XE#599])
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_hdr@static-toggle-suspend.html
>=20
> =C2=A0 * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][55] ([Intel XE#1201] /
> [Intel XE#356])
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [INCOMPLETE][56] ([Intel XE#1035]
> / [Intel XE#1195])
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_plane@pixel-format.html
>=20
> =C2=A0 * igt@kms_plane@pixel-format@pipe-a-plane-3:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [WARN][57] ([Intel XE#2078]) +1
> other test warn
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_plane@pixel-format@pipe-a-plane-3.html
>=20
> =C2=A0 * igt@kms_plane@plane-position-hole:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][58] -> [DMESG-WARN][59] ([Intel
> XE#324]) +3 other tests dmesg-warn
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-7/igt@kms_plane@plane-position-hole.html
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-2/igt@=
kms_plane@plane-position-hole.html
>=20
> =C2=A0 * igt@kms_plane_scaling@intel-max-src-size:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][60] ([Intel XE#599]) +1
> other test skip
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_plane_scaling@intel-max-src-size.html
>=20
> =C2=A0 * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][61] -=
> [FAIL][62] ([Intel XE#361])
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pi=
pe-a-hdmi-a-6.html
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-
> b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][63] ([Intel XE#2318]) +3
> other tests skip
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1.ht=
ml
>=20
> =C2=A0 * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][64] ([Intel XE#1439])
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>=20
> =C2=A0 * igt@kms_properties@connector-properties-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][65] ([Intel
> XE#1195]) +1 other test incomplete
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_properties@connector-properties-legacy.html
>=20
> =C2=A0 * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][66] ([Intel XE#1201] /
> [Intel XE#1489]) +1 other test skip
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-435/ig=
t@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#1201])
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][68] ([Intel XE#2749]) +1
> other test fail
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-p010:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][69] ([Intel XE#1128])
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
kms_psr2_su@page_flip-p010.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr-cursor-blt@edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [CRASH][70] ([Intel XE#2748]) +1
> other test crash
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
kms_psr@fbc-psr-cursor-blt@edp-1.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr-sprite-plane-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [WARN][71] ([Intel XE#2748]) +1
> other test warn
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
kms_psr@fbc-psr-sprite-plane-onoff.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-cursor-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][72] ([Intel XE#1201] /
> [Intel XE#929]) +7 other tests skip
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_psr@fbc-psr2-cursor-blt.html
>=20
> =C2=A0 * igt@kms_psr@pr-no-drrs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][73] ([Intel XE#1406])
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_psr@pr-no-drrs.html
>=20
> =C2=A0 * igt@kms_psr@psr-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][74] ([Intel XE#1201] /
> [Intel XE#929]) +2 other tests skip
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_psr@psr-dpms.html
>=20
> =C2=A0 * igt@kms_rotation_crc@bad-pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][75] ([Intel XE#1201] /
> [Intel XE#327]) +1 other test skip
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_rotation_crc@bad-pixel-format.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][76] ([Intel XE#1437])
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>=20
> =C2=A0 * igt@kms_setmode@clone-exclusive-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][77] ([Intel XE#1201] /
> [Intel XE#455]) +7 other tests skip
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@kms_setmode@clone-exclusive-crtc.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][78] ([Intel XE#362])
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_tiled_display@basic-test-pattern.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][79] -> [FAIL][80] ([Intel XE#899])
> +1 other test fail
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-1/igt@=
kms_universal_plane@cursor-fb-leak.html
>=20
> =C2=A0 * igt@kms_vrr@flip-basic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][81] ([Intel XE#2443]) +1
> other test fail
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
kms_vrr@flip-basic.html
>=20
> =C2=A0 * igt@kms_vrr@flip-basic-fastset:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][82] ([Intel XE#1201] /
> [Intel XE#455]) +4 other tests skip
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_vrr@flip-basic-fastset.html
>=20
> =C2=A0 * igt@kms_writeback@writeback-pixel-formats:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][83] ([Intel XE#1201] /
> [Intel XE#756])
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_writeback@writeback-pixel-formats.html
>=20
> =C2=A0 * igt@xe_ccs@block-copy-compressed:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][84] ([Intel XE#1201] /
> [Intel XE#455] / [Intel XE#488])
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@xe_ccs@block-copy-compressed.html
>=20
> =C2=A0 * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][85] -> [FAIL][86] ([Intel XE#2667])
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-loa=
d-destroy-queue.html
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-3/igt@=
xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][87] ([Intel XE#1201] /
> [Intel XE#261]) +1 other test skip
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@xe_evict@evict-beng-threads-large.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-many-threads-small:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][88] ([Intel XE#688]) +1
> other test skip
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
xe_evict@evict-mixed-many-threads-small.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-threads-small:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][89] ([Intel XE#1201] /
> [Intel XE#261] / [Intel XE#688])
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@xe_evict@evict-mixed-threads-small.html
>=20
> =C2=A0 * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][90] ([Intel XE#1201] /
> [Intel XE#688])
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][91] ([Intel XE#1392]) +3
> other tests skip
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][92] ([Intel XE#1201] /
> [Intel XE#1392]) +2 other tests skip
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][93] ([Intel XE#1201] /
> [Intel XE#288]) +9 other tests skip
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-userptr-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][94] ([Intel XE#1201] /
> [Intel XE#288]) +1 other test skip
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@xe_exec_fault_mode@twice-userptr-prefetch.html
>=20
> =C2=A0 * igt@xe_exec_reset@cm-cat-error:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][95] ([Intel
> XE#1962])
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@xe_exec_reset@cm-cat-error.html
>=20
> =C2=A0 * igt@xe_oa@oa-regs-whitelisted@ccs-0:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][96] ([Intel XE#2514])
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-1/igt@=
xe_oa@oa-regs-whitelisted@ccs-0.html
>=20
> =C2=A0 * igt@xe_oa@stress-open-close:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][97] ([Intel XE#1201] /
> [Intel XE#2541]) +2 other tests skip
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@xe_oa@stress-open-close.html
>=20
> =C2=A0 * igt@xe_peer2peer@read:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][98] ([Intel XE#1061])
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
xe_peer2peer@read.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-basic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][99] ([Intel XE#2284] /
> [Intel XE#366])
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
xe_pm@d3cold-basic.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][100] -> [ABORT][101] ([Intel
> XE#1794])
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-9/igt=
@xe_pm@s4-vm-bind-unbind-all.html
>=20
> =C2=A0 * igt@xe_pm_residency@toggle-gt-c6:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][102] -> [FAIL][103] ([Intel XE#958])
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-2/igt@=
xe_pm_residency@toggle-gt-c6.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-gt-list:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][104] ([Intel XE#944])
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
xe_query@multigpu-query-gt-list.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-invalid-query:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][105] ([Intel XE#1201] /
> [Intel XE#944])
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@xe_query@multigpu-query-invalid-query.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_atomic_transition@plane-toggle-modeset-transition:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][106] ([Intel XE#1426]) ->
> [PASS][107] +1 other test pass
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modes=
et-transition.html
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-2/igt=
@kms_atomic_transition@plane-toggle-modeset-transition.html
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][108] ([Intel XE#1426]) ->
> [PASS][109] +1 other test pass
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modese=
t-transition.html
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-bmg-3/igt@=
kms_atomic_transition@plane-toggle-modeset-transition.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][110] ([Intel XE#1659]) ->
> [PASS][111] +1 other test pass
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-ro=
tate-0.html
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-7/igt@=
kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][112] ([Intel XE#2436]) ->
> [PASS][113] +3 other tests pass
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-b=
mg-ccs.html
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-bmg-2/igt@=
kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[114] ([Intel XE#1551]) ->
> [PASS][115] +1 other test pass
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@kms_cursor_crc@cursor-suspend.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [DMESG-WARN][116] ([Intel XE#877]) ->
> [PASS][117] +13 other tests pass
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic=
-transitions-varying-size.html
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-bmg-2/igt@=
kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [INCOMPLETE][118] -> [PASS][119] +3 other
> tests pass
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad=
-dp2-hdmi-a3.html
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-bmg-1/igt@=
kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-panning-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[120] ([Intel XE#877]) ->
> [PASS][121]
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptib=
le.html
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-466/ig=
t@kms_flip@2x-flip-vs-panning-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [DMESG-WARN]=
[122] -> [PASS][123]
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptib=
le@ac-hdmi-a6-dp4.html
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-466/ig=
t@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [INCOMPLETE][124] ([Intel XE#2635]) ->
> [PASS][125]
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interr=
uptible.html
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-bmg-3/igt@=
kms_flip@2x-modeset-vs-vblank-race-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@absolute-wf_vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [INCOMPLETE][126] ([Intel XE#1195]) ->
> [PASS][127] +1 other test pass
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-6/igt@kms_flip@absolute-wf_vblank-interruptibl=
e.html
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@kms_flip@absolute-wf_vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@blocking-wf_vblank:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][128] ([Intel XE#886]) -> [PASS][129]
> +1 other test pass
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-5/igt@=
kms_flip@blocking-wf_vblank.html
>=20
> =C2=A0 * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][130] ([Intel XE#1874]) ->
> [PASS][131] +2 other tests pass
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-=
c-hdmi-a-1-x-to-x.html
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-6/igt=
@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][132] =
([Intel XE#771] / [Intel
> XE#899]) -> [PASS][133]
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-434/ig=
t@kms_universal_plane@cursor-fb-leak.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][134] =
([Intel XE#899]) -> [PASS][135]
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe=
-b-dp-4.html
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-434/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>=20
> =C2=A0 * igt@kms_vblank@accuracy-idle:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][136] ([Intel XE#1523]) ->
> [PASS][137] +1 other test pass
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-5/igt@=
kms_vblank@accuracy-idle.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-large-multi-vm-cm:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][138] ([Intel XE#2364]) ->
> [PASS][139]
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.htm=
l
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-bmg-1/igt@=
xe_evict@evict-beng-large-multi-vm-cm.html
>=20
> =C2=A0 * igt@xe_evict@evict-beng-mixed-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [TIMEOUT][14=
0] ([Intel XE#1473]) ->
> [PASS][141]
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large=
.html
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@xe_evict@evict-beng-mixed-threads-large.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][142] =
([Intel XE#1000]) ->
> [PASS][143]
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@xe_evict@evict-mixed-threads-large.html
>=20
> =C2=A0 * igt@xe_exec_reset@parallel-gt-reset:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [TIMEOUT][14=
4] ([Intel XE#2105]) ->
> [PASS][145]
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-466/ig=
t@xe_exec_reset@parallel-gt-reset.html
>=20
> =C2=A0 * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][146] -> [PASS][147]
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-us=
erptr-rebind.html
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-8/igt@=
xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][148] ([Intel XE#1201] / [Intel
> XE#2229] / [Intel XE#455]) -> [PASS][149]
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-8/igt@xe_live_ktest@xe_bo.html
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@xe_live_ktest@xe_bo.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-basic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[150] ([Intel XE#1195] / [Intel
> XE#1358]) -> [PASS][151]
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-435/igt@xe_pm@s2idle-basic.html
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@xe_pm@s2idle-basic.html
>=20
> =C2=A0 * igt@xe_pm@s4-exec-after:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][152] ([Intel XE#1358] / [Intel
> XE#1607]) -> [PASS][153]
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-8/igt=
@xe_pm@s4-exec-after.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][154] ([Intel XE#1607] / [Intel
> XE#1794]) -> [PASS][155]
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-4/igt@=
xe_pm@s4-vm-bind-prefetch.html
>=20
> =C2=A0 * igt@xe_pm@s4-vm-bind-userptr:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][156] ([Intel XE#1794]) ->
> [PASS][157]
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@xe_pm@s4-vm-bind-userptr.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_big_fb@linear-16bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][158] =
([Intel XE#316]) -> [SKIP][159]
> ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_big_fb@linear-16bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][160] =
([Intel XE#1201] / [Intel
> XE#316]) -> [SKIP][161] ([Intel XE#316]) +4 other tests skip
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_big_fb@x-tiled-8bpp-rotate-270.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-addfb:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][162] =
([Intel XE#1201] / [Intel
> XE#619]) -> [SKIP][163] ([Intel XE#619])
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_big_fb@y-tiled-addfb.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][164] ([Intel XE#324]) ->
> [FAIL][165] ([Intel XE#1231])
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-0-async-flip.html
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-6/igt=
@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][166] =
([Intel XE#1124] / [Intel
> XE#1201]) -> [SKIP][167] ([Intel XE#1124]) +9 other tests skip
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.ht=
ml
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>=20
> =C2=A0 *
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][168] =
([Intel XE#1124]) ->
> [SKIP][169] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp=
-rotate-0-hflip-async-flip.html
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_joiner@basic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][170] =
([Intel XE#1201] / [Intel
> XE#346]) -> [SKIP][171] ([Intel XE#346])
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@kms_big_joiner@basic.html
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_big_joiner@basic.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][172] =
([Intel XE#1201] / [Intel
> XE#2191]) -> [SKIP][173] ([Intel XE#2191]) +1 other test skip
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displa=
ys-2560x1440p.html
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][174] =
([Intel XE#2191]) ->
> [SKIP][175] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displa=
ys-1920x1080p.html
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-463/ig=
t@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][176] =
([Intel XE#1201] / [Intel
> XE#367]) -> [SKIP][177] ([Intel XE#367]) +1 other test skip
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x14=
40p.html
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_bw@linear-tiling-3-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][178] =
([Intel XE#367]) -> [SKIP][179]
> ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x21=
60p.html
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_bw@linear-tiling-3-displays-3840x2160p.html
>=20
> =C2=A0 * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][180] =
([Intel XE#1201] / [Intel
> XE#1252]) -> [SKIP][181] ([Intel XE#1252]) +1 other test skip
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs=
.html
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][182] =
([Intel XE#787]) -> [SKIP][183]
> ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-r=
c-ccs@pipe-b-hdmi-a-6.html
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-
> hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][184] =
([Intel XE#1201] / [Intel
> XE#787]) -> [SKIP][185] ([Intel XE#787]) +76 other tests skip
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled=
-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][186] =
([Intel XE#455] / [Intel
> XE#787]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#455] / [Intel
> XE#787]) +21 other tests skip
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-=
mc-ccs@pipe-d-dp-4.html
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][188] =
([Intel XE#1201] / [Intel
> XE#455] / [Intel XE#787]) -> [SKIP][189] ([Intel XE#455] / [Intel
> XE#787]) +21 other tests skip
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-=
ccs-cc.html
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-blue-to-red:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][190] =
([Intel XE#306]) -> [SKIP][191]
> ([Intel XE#1201] / [Intel XE#306])
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.htm=
l
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-463/ig=
t@kms_chamelium_color@ctm-blue-to-red.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-limited-range:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][192] =
([Intel XE#1201] / [Intel
> XE#306]) -> [SKIP][193] ([Intel XE#306]) +2 other tests skip
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.h=
tml
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_chamelium_color@ctm-limited-range.html
>=20
> =C2=A0 * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][194] =
([Intel XE#373]) -> [SKIP][195]
> ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.=
html
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@kms_chamelium_frames@hdmi-aspect-ratio.html
>=20
> =C2=A0 * igt@kms_chamelium_hpd@vga-hpd:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][196] =
([Intel XE#1201] / [Intel
> XE#373]) -> [SKIP][197] ([Intel XE#373]) +9 other tests skip
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_chamelium_hpd@vga-hpd.html
>=20
> =C2=A0 * igt@kms_content_protection@dp-mst-lic-type-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][198] =
([Intel XE#1201] / [Intel
> XE#307]) -> [SKIP][199] ([Intel XE#307]) +1 other test skip
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-=
0.html
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_content_protection@dp-mst-lic-type-0.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-onscreen-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][200] =
([Intel XE#1201] / [Intel
> XE#308]) -> [SKIP][201] ([Intel XE#308]) +1 other test skip
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.=
html
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_cursor_crc@cursor-onscreen-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][202] =
([Intel XE#308]) -> [SKIP][203]
> ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.h=
tml
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@kms_cursor_crc@cursor-sliding-512x170.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-3x:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][204] =
([Intel XE#703]) -> [SKIP][205]
> ([Intel XE#1201] / [Intel XE#703])
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-463/ig=
t@kms_feature_discovery@display-3x.html
>=20
> =C2=A0 * igt@kms_feature_discovery@psr2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][206] =
([Intel XE#1135]) ->
> [SKIP][207] ([Intel XE#1135] / [Intel XE#1201])
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_feature_discovery@psr2.html
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-463/ig=
t@kms_feature_discovery@psr2.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][208] =
([Intel XE#455]) -> [SKIP][209]
> ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to=
-32bpp-ytile-downscaling.html
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][210] =
([Intel XE#1201] / [Intel
> XE#651]) -> [SKIP][211] ([Intel XE#651]) +29 other tests skip
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primsc=
rn-cur-indfb-onoff.html
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][212] =
([Intel XE#651]) -> [SKIP][213]
> ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-pri-shrfb-draw-render.html
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][214] =
([Intel XE#1201] / [Intel
> XE#653]) -> [SKIP][215] ([Intel XE#653]) +28 other tests skip
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-prim=
scrn-spr-indfb-draw-render.html
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][216] =
([Intel XE#1158] / [Intel
> XE#1201]) -> [SKIP][217] ([Intel XE#1158])
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.=
html
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-slowdraw:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][218] =
([Intel XE#653]) -> [SKIP][219]
> ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.h=
tml
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@psr-slowdraw.html
>=20
> =C2=A0 * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][220] =
([Intel XE#1201] / [Intel
> XE#356]) -> [SKIP][221] ([Intel XE#356])
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-cr=
c-check.html
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>=20
> =C2=A0 * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][222] =
([Intel XE#455] / [Intel
> XE#498]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#455] / [Intel
> XE#498]) +1 other test skip
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-facto=
r-0-25-with-modifiers.html
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe
> -c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][224] =
([Intel XE#498]) -> [SKIP][225]
> ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
> =C2=A0=C2=A0 [224]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-facto=
r-0-25-with-modifiers@pipe-c-hdmi-a-6.html
> =C2=A0=C2=A0 [225]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-=
a-6.html
>=20
> =C2=A0 * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][226] =
([Intel XE#2318] / [Intel
> XE#455]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#2318] / [Intel
> XE#455]) +5 other tests skip
> =C2=A0=C2=A0 [226]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-fact=
or-0-25-unity-scaling.html
> =C2=A0=C2=A0 [227]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-463/ig=
t@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25
> @pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][228] =
([Intel XE#2318]) ->
> [SKIP][229] ([Intel XE#1201] / [Intel XE#2318]) +8 other tests skip
> =C2=A0=C2=A0 [228]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor=
-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> =C2=A0=C2=A0 [229]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c=
-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc3co-vpb-simulation:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][230] =
([Intel XE#1122] / [Intel
> XE#1201]) -> [SKIP][231] ([Intel XE#1122]) +1 other test skip
> =C2=A0=C2=A0 [230]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
> =C2=A0=C2=A0 [231]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_pm_dc@dc3co-vpb-simulation.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc6-psr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][232] =
([Intel XE#1129] / [Intel
> XE#1201]) -> [SKIP][233] ([Intel XE#1129])
> =C2=A0=C2=A0 [232]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
> =C2=A0=C2=A0 [233]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_pm_dc@dc6-psr.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][234] =
([Intel XE#1489]) ->
> [SKIP][235] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
> =C2=A0=C2=A0 [234]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-conti=
nuous-exceed-fully-sf.html
> =C2=A0=C2=A0 [235]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-463/ig=
t@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][236] ([Intel XE#2605]) ->
> [FAIL][237] ([Intel XE#2605] / [Intel XE#2749])
> =C2=A0=C2=A0 [236]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-lnl-8/igt@kms_psr2_sf@fbc-cursor-plane-move-continu=
ous-sf.html
> =C2=A0=C2=A0 [237]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-lnl-7/igt@=
kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][238] =
([Intel XE#1201] / [Intel
> XE#1489]) -> [SKIP][239] ([Intel XE#1489]) +2 other tests skip
> =C2=A0=C2=A0 [238]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg=
-area.html
> =C2=A0=C2=A0 [239]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][240] =
([Intel XE#929]) -> [SKIP][241]
> ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
> =C2=A0=C2=A0 [240]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
> =C2=A0=C2=A0 [241]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@kms_psr@fbc-pr-dpms.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][242] =
([Intel XE#1201] / [Intel
> XE#929]) -> [SKIP][243] ([Intel XE#929]) +13 other tests skip
> =C2=A0=C2=A0 [242]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.htm=
l
> =C2=A0=C2=A0 [243]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_psr@fbc-psr2-sprite-plane-onoff.html
>=20
> =C2=A0 * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][244] =
([Intel XE#1149] / [Intel
> XE#1201]) -> [SKIP][245] ([Intel XE#1149]) +1 other test skip
> =C2=A0=C2=A0 [244]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invali=
date-overlay.html
> =C2=A0=C2=A0 [245]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-rotation-270:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][246] =
([Intel XE#327]) -> [SKIP][247]
> ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
> =C2=A0=C2=A0 [246]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.h=
tml
> =C2=A0=C2=A0 [247]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@kms_rotation_crc@primary-rotation-270.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][248] =
([Intel XE#1127] / [Intel
> XE#1201]) -> [SKIP][249] ([Intel XE#1127])
> =C2=A0=C2=A0 [248]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflec=
t-x-180.html
> =C2=A0=C2=A0 [249]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][250] =
([Intel XE#1127]) ->
> [SKIP][251] ([Intel XE#1127] / [Intel XE#1201])
> =C2=A0=C2=A0 [250]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-refle=
ct-x-0.html
> =C2=A0=C2=A0 [251]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>=20
> =C2=A0 * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][252] =
([Intel XE#1201] / [Intel
> XE#327]) -> [SKIP][253] ([Intel XE#327]) +1 other test skip
> =C2=A0=C2=A0 [252]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos=
-100-0.html
> =C2=A0=C2=A0 [253]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][254] =
([Intel XE#1201] / [Intel
> XE#362]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#1500])
> =C2=A0=C2=A0 [254]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-wi=
th-chamelium.html
> =C2=A0=C2=A0 [255]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-435/ig=
t@kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
> =C2=A0 * igt@kms_tv_load_detect@load-detect:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][256] =
([Intel XE#1201] / [Intel
> XE#330]) -> [SKIP][257] ([Intel XE#330])
> =C2=A0=C2=A0 [256]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
> =C2=A0=C2=A0 [257]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_tv_load_detect@load-detect.html
>=20
> =C2=A0 * igt@kms_vrr@cmrr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][258] =
([Intel XE#1201] / [Intel
> XE#2168]) -> [SKIP][259] ([Intel XE#2168])
> =C2=A0=C2=A0 [258]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-434/igt@kms_vrr@cmrr.html
> =C2=A0=C2=A0 [259]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_vrr@cmrr.html
>=20
> =C2=A0 * igt@kms_vrr@flipline:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][260] =
([Intel XE#1201] / [Intel
> XE#455]) -> [SKIP][261] ([Intel XE#455]) +17 other tests skip
> =C2=A0=C2=A0 [260]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@kms_vrr@flipline.html
> =C2=A0=C2=A0 [261]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@kms_vrr@flipline.html
>=20
> =C2=A0 * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][262] =
([Intel XE#756]) -> [SKIP][263]
> ([Intel XE#1201] / [Intel XE#756])
> =C2=A0=C2=A0 [262]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb21010=
10.html
> =C2=A0=C2=A0 [263]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@kms_writeback@writeback-fb-id-xrgb2101010.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-preempt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][264] =
([Intel XE#1280] / [Intel
> XE#455]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#1280] / [Intel
> XE#455]) +1 other test skip
> =C2=A0=C2=A0 [264]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
> =C2=A0=C2=A0 [265]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-463/ig=
t@xe_compute_preempt@compute-preempt.html
>=20
> =C2=A0 * igt@xe_compute_preempt@compute-preempt-many:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][266] =
([Intel XE#1201] / [Intel
> XE#1280] / [Intel XE#455]) -> [SKIP][267] ([Intel XE#1280] / [Intel
> XE#455]) +3 other tests skip
> =C2=A0=C2=A0 [266]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many=
.html
> =C2=A0=C2=A0 [267]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@xe_compute_preempt@compute-preempt-many.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0xfffe:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][268] =
([Intel XE#1123]) ->
> [SKIP][269] ([Intel XE#1123] / [Intel XE#1201])
> =C2=A0=C2=A0 [268]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.ht=
ml
> =C2=A0=C2=A0 [269]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@xe_copy_basic@mem-copy-linear-0xfffe.html
>=20
> =C2=A0 * igt@xe_evict@evict-mixed-many-threads-large:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [TIMEOUT][27=
0] ([Intel XE#1473]) ->
> [FAIL][271] ([Intel XE#1000])
> =C2=A0=C2=A0 [270]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large=
.html
> =C2=A0=C2=A0 [271]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@xe_evict@evict-mixed-many-threads-large.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-invalid-fault:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][272] =
([Intel XE#288]) -> [SKIP][273]
> ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
> =C2=A0=C2=A0 [272]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.=
html
> =C2=A0=C2=A0 [273]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@xe_exec_fault_mode@twice-invalid-fault.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][274] =
([Intel XE#1201] / [Intel
> XE#288]) -> [SKIP][275] ([Intel XE#288]) +25 other tests skip
> =C2=A0=C2=A0 [274]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invali=
date-race.html
> =C2=A0=C2=A0 [275]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][276] ([Intel XE#1201] / [Intel
> XE#2229] / [Intel XE#455]) -> [SKIP][277] ([Intel XE#1201] / [Intel
> XE#2229])
> =C2=A0=C2=A0 [276]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.ht=
ml
> =C2=A0=C2=A0 [277]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-adlp-4/igt=
@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>=20
> =C2=A0 * igt@xe_oa@closed-fd-and-unmapped-access:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][278] =
([Intel XE#1201] / [Intel
> XE#2541]) -> [SKIP][279] ([Intel XE#2541]) +5 other tests skip
> =C2=A0=C2=A0 [278]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.htm=
l
> =C2=A0=C2=A0 [279]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@xe_oa@closed-fd-and-unmapped-access.html
>=20
> =C2=A0 * igt@xe_oa@mmio-triggered-reports:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][280] =
([Intel XE#2541]) ->
> [SKIP][281] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
> =C2=A0=C2=A0 [280]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html
> =C2=A0=C2=A0 [281]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-433/ig=
t@xe_oa@mmio-triggered-reports.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xehpc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][282] =
([Intel XE#979]) -> [SKIP][283]
> ([Intel XE#1201] / [Intel XE#979])
> =C2=A0=C2=A0 [282]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
> =C2=A0=C2=A0 [283]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@xe_pat@pat-index-xehpc.html
>=20
> =C2=A0 * igt@xe_pat@pat-index-xelpg:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][284] =
([Intel XE#1201] / [Intel
> XE#979]) -> [SKIP][285] ([Intel XE#979])
> =C2=A0=C2=A0 [284]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
> =C2=A0=C2=A0 [285]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@xe_pat@pat-index-xelpg.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][286] =
([Intel XE#2284]) ->
> [SKIP][287] ([Intel XE#1201] / [Intel XE#2284])
> =C2=A0=C2=A0 [286]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
> =C2=A0=C2=A0 [287]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-463/ig=
t@xe_pm@d3cold-mocs.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-d3cold-basic-exec:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][288] =
([Intel XE#1201] / [Intel
> XE#2284] / [Intel XE#366]) -> [SKIP][289] ([Intel XE#2284] / [Intel
> XE#366]) +2 other tests skip
> =C2=A0=C2=A0 [288]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html
> =C2=A0=C2=A0 [289]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@xe_pm@s2idle-d3cold-basic-exec.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-oa-units:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][290] =
([Intel XE#1201] / [Intel
> XE#944]) -> [SKIP][291] ([Intel XE#944]) +3 other tests skip
> =C2=A0=C2=A0 [290]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html
> =C2=A0=C2=A0 [291]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-432/ig=
t@xe_query@multigpu-query-oa-units.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-uc-fw-version-huc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][292] =
([Intel XE#944]) -> [SKIP][293]
> ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
> =C2=A0=C2=A0 [292]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-h=
uc.html
> =C2=A0=C2=A0 [293]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/shard-dg2-436/ig=
t@xe_query@multigpu-query-uc-fw-version-huc.html
>=20
> =C2=A0=20
> =C2=A0 {name}: This element is suppressed. This means it is ignored when
> computing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the status of the =
difference (SUCCESS, WARNING, or
> FAILURE).
>=20
> =C2=A0 [Intel XE#1000]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
> =C2=A0 [Intel XE#1033]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
> =C2=A0 [Intel XE#1035]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
> =C2=A0 [Intel XE#1061]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
> =C2=A0 [Intel XE#1091]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
> =C2=A0 [Intel XE#1122]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> =C2=A0 [Intel XE#1123]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1127]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
> =C2=A0 [Intel XE#1128]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
> =C2=A0 [Intel XE#1129]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
> =C2=A0 [Intel XE#1135]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
> =C2=A0 [Intel XE#1149]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
> =C2=A0 [Intel XE#1158]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
> =C2=A0 [Intel XE#1195]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> =C2=A0 [Intel XE#1201]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
> =C2=A0 [Intel XE#1231]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
> =C2=A0 [Intel XE#1252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
> =C2=A0 [Intel XE#1280]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
> =C2=A0 [Intel XE#1358]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1399]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
> =C2=A0 [Intel XE#1401]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1426]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
> =C2=A0 [Intel XE#1437]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
> =C2=A0 [Intel XE#1439]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> =C2=A0 [Intel XE#1467]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
> =C2=A0 [Intel XE#1473]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1500]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1512]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
> =C2=A0 [Intel XE#1523]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
> =C2=A0 [Intel XE#1551]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
> =C2=A0 [Intel XE#1607]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
> =C2=A0 [Intel XE#1659]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
> =C2=A0 [Intel XE#1745]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> =C2=A0 [Intel XE#1760]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
> =C2=A0 [Intel XE#1794]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> =C2=A0 [Intel XE#1861]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
> =C2=A0 [Intel XE#1874]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> =C2=A0 [Intel XE#1962]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
> =C2=A0 [Intel XE#2078]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
> =C2=A0 [Intel XE#2105]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
> =C2=A0 [Intel XE#2168]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
> =C2=A0 [Intel XE#2191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> =C2=A0 [Intel XE#2229]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
> =C2=A0 [Intel XE#2233]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2244]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> =C2=A0 [Intel XE#2251]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2284]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> =C2=A0 [Intel XE#2311]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> =C2=A0 [Intel XE#2313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> =C2=A0 [Intel XE#2314]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> =C2=A0 [Intel XE#2318]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
> =C2=A0 [Intel XE#2320]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> =C2=A0 [Intel XE#2321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> =C2=A0 [Intel XE#2333]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
> =C2=A0 [Intel XE#2364]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
> =C2=A0 [Intel XE#2393]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
> =C2=A0 [Intel XE#2436]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
> =C2=A0 [Intel XE#2443]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
> =C2=A0 [Intel XE#2514]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
> =C2=A0 [Intel XE#2541]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> =C2=A0 [Intel XE#2605]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2605
> =C2=A0 [Intel XE#261]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> =C2=A0 [Intel XE#2635]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
> =C2=A0 [Intel XE#2667]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
> =C2=A0 [Intel XE#2748]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2748
> =C2=A0 [Intel XE#2749]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2749
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
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
> =C2=A0 [Intel XE#324]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
> =C2=A0 [Intel XE#327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
> =C2=A0 [Intel XE#330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
> =C2=A0 [Intel XE#346]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
> =C2=A0 [Intel XE#356]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
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
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#488]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
> =C2=A0 [Intel XE#498]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
> =C2=A0 [Intel XE#599]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
> =C2=A0 [Intel XE#619]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#688]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> =C2=A0 [Intel XE#703]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
> =C2=A0 [Intel XE#756]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> =C2=A0 [Intel XE#771]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#877]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
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
> =C2=A0 [Intel XE#979]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3 -> xe-pw=
-
> 138103v6
>=20
> =C2=A0 IGT_8012: 8012
> =C2=A0 xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3:
> f3eded4f8a05d73a0b94f27e05737ea3427450b3
> =C2=A0 xe-pw-138103v6: 138103v6
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/index.html

