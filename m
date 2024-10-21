Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AD3D0E6F0
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 10:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CED410E48C;
	Mon, 21 Oct 2024 10:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0WJgAHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4255C10E48C
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 10:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729507828; x=1761043828;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=+jtQFSoKvMXddLcoXPhsjY9wROP5QAYgaa6KpgMZz1M=;
 b=d0WJgAHZaGWJy2J0aSaRlcxKsnhwpXr/621IBxkIjMNerD5Ra3vRqi57
 rgR6LxmR7/8mLdk4raex6+JhdhFmUKGub9YRvPJxa6d/muH/OK4VdMTZz
 CLaTryIr9RLtL1PggXm6uQR2dcyqxN6xRcrmsGKjlvUVR08w2pv7sfuOT
 iNil3YzXxee4Ax4Y1F0OGwkfNeR2XdWmUzIx/ntrsNwgCVvmFv4NrbQ0x
 4wof+VR9pDr5brIjKhXrHsPQm3X0WksdY6gSB8QjnjKRWX44A+3yEOwIb
 RHvXLKAXn0KCI6EgLcm732v6sDs+3YvYfjHaBUaW1NlB6Vu8yZAam0Jkp g==;
X-CSE-ConnectionGUID: O1OojtDpSp6Chmpm0R8Lcw==
X-CSE-MsgGUID: 6iITiBDGTHuaDgo/5ttXXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46450624"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46450624"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 03:50:28 -0700
X-CSE-ConnectionGUID: WvBOPag+RmG0SNFvLSEZ2w==
X-CSE-MsgGUID: DT5K8Y+fRJuTWsOqeb71Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79084451"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.239])
 ([10.245.246.239])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 03:50:26 -0700
Message-ID: <525c1c97dc6d0c5a0118356854825ef74e6346e9.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.BAT: failure for TTM shrinker helpers
 and xe buffer object shrinker (rev10)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 12:50:24 +0200
In-Reply-To: <ZxVTnTQOl4NSf2i7@DUT025-TGLU.fm.intel.com>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
 <172907997277.1273612.2250565785976442475@2413ebb6fbb6>
 <ZxVTnTQOl4NSf2i7@DUT025-TGLU.fm.intel.com>
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

On Sun, 2024-10-20 at 19:01 +0000, Matthew Brost wrote:
> On Wed, Oct 16, 2024 at 11:59:32AM +0000, Patchwork wrote:
> > =C2=A0=C2=A0 Patch Details
> >=20
> > =C2=A0=C2=A0 Series:=C2=A0 TTM shrinker helpers and xe buffer object sh=
rinker
> > (rev10)
> > =C2=A0=C2=A0 URL:=C2=A0=C2=A0=C2=A0=C2=A0 [1]https://patchwork.freedesk=
top.org/series/131815/
> > =C2=A0=C2=A0 State:=C2=A0=C2=A0 failure
> > =C2=A0=C2=A0 Details:
> > =C2=A0=C2=A0
> > [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/index.
> > html
> >=20
> > =C2=A0CI Bug Log - changes from xe-2072-
> > 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519_BAT
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -> xe-pw-131815v10_BAT
> >=20
> > Summary
> >=20
> > =C2=A0=C2=A0 FAILURE
> >=20
> > =C2=A0=C2=A0 Serious unknown changes coming with xe-pw-131815v10_BAT
> > absolutely need
> > =C2=A0=C2=A0 to be
> > =C2=A0=C2=A0 verified manually.
> >=20
> > =C2=A0=C2=A0 If you think the reported changes have nothing to do with =
the
> > changes
> > =C2=A0=C2=A0 introduced in xe-pw-131815v10_BAT, please notify your bug =
team
> > =C2=A0=C2=A0 (I915-ci-infra@lists.freedesktop.org) to allow them
> > =C2=A0=C2=A0 to document this new failure mode, which will reduce false
> > positives in
> > =C2=A0=C2=A0 CI.
> >=20
> > Participating hosts (9 -> 9)
> >=20
> > =C2=A0=C2=A0 No changes in participating hosts
> >=20
> > Possible new issues
> >=20
> > =C2=A0=C2=A0 Here are the unknown changes that may have been introduced=
 in
> > =C2=A0=C2=A0 xe-pw-131815v10_BAT:
> >=20
> > =C2=A0 IGT changes
> >=20
> > =C2=A0=C2=A0=C2=A0 Possible regressions
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 * igt@xe_live_ktest@xe_bo:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bat-adlp-vf: [=
3]PASS -> [4]INCOMPLETE +1 other test
> > incomplete
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bat-lnl-1: [5]=
PASS -> [6]INCOMPLETE +1 other test
> > incomplete
> > =C2=A0=C2=A0=C2=A0=C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bat-lnl-2: [7]=
PASS -> [8]INCOMPLETE +1 other test
> > incomplete
>=20
> These look related. Any idea what these are about? Should I continue
> with my review or do you think another rev is needed?

Please continue. I'll investigate those, but I think they are related
to igt test duration timeouts. These tests execute for a very long
time, and it's hard to come up with a bulletproof way to shorten the
execution time.

/Thomas


>=20
> Matt
>=20
> >=20
> > Known issues
> >=20
> > =C2=A0=C2=A0 Here are the changes found in xe-pw-131815v10_BAT that com=
e from
> > known
> > =C2=A0=C2=A0 issues:
> >=20
> > =C2=A0 IGT changes
> >=20
> > =C2=A0=C2=A0=C2=A0 Issues hit
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bat-adlp-7: [9=
]PASS -> [10]INCOMPLETE ([11]Intel
> > XE#2874) +1
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 othe=
r test incomplete
> >=20
> > =C2=A0=C2=A0=C2=A0 Possible fixes
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 * igt@kms_frontbuffer_tracking@basic:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bat-adlp-7: [1=
2]FAIL ([13]Intel XE#1861) -> [14]PASS
> >=20
> > =C2=A0=C2=A0=C2=A0 Warnings
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 *
> > igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bat-lnl-1: [15=
]DMESG-FAIL ([16]Intel XE#2687) ->
> > [17]FAIL
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ([18=
]Intel XE#2754)
> >=20
> > Build changes
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 * IGT: IGT_8076 -> IGT_8077
> > =C2=A0=C2=A0=C2=A0=C2=A0 * Linux: xe-2072-12e4970af1ecdeb76e94df2daf51a=
9c3d6b9f519 ->
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe-pw-131815v10
> >=20
> > =C2=A0=C2=A0 IGT_8076: e511df10a1201d0d83c03ccbcabc3d57191e5f8e @
> > =C2=A0=C2=A0 https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > =C2=A0=C2=A0 IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @
> > =C2=A0=C2=A0 https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > =C2=A0=C2=A0 xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519:
> > =C2=A0=C2=A0 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519
> > =C2=A0=C2=A0 xe-pw-131815v10: 131815v10
> >=20
> > References
> >=20
> > =C2=A0=C2=A0 1. https://patchwork.freedesktop.org/series/131815/
> > =C2=A0=C2=A0 2.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/index.html
> > =C2=A0=C2=A0 3.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94d=
f2daf51a9c3d6b9f519/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
> > =C2=A0=C2=A0 4.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-adlp-vf/i=
gt@xe_live_ktest@xe_bo.html
> > =C2=A0=C2=A0 5.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94d=
f2daf51a9c3d6b9f519/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
> > =C2=A0=C2=A0 6.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-lnl-1/igt=
@xe_live_ktest@xe_bo.html
> > =C2=A0=C2=A0 7.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94d=
f2daf51a9c3d6b9f519/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.ht=
ml
> > =C2=A0=C2=A0 8.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-lnl-2/igt=
@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
> > =C2=A0=C2=A0 9.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94d=
f2daf51a9c3d6b9f519/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.h=
tml
> > =C2=A0 10.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-adlp-7/ig=
t@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
> > =C2=A0 11. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
> > =C2=A0 12.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94d=
f2daf51a9c3d6b9f519/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> > =C2=A0 13. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
> > =C2=A0 14.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-adlp-7/ig=
t@kms_frontbuffer_tracking@basic.html
> > =C2=A0 15.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94d=
f2daf51a9c3d6b9f519/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-=
userptr-invalidate.html
> > =C2=A0 16. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
> > =C2=A0 17.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-lnl-1/igt=
@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
> > =C2=A0 18. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754

