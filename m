Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7CCCE7AB0
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 07:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2886610E2F7;
	Mon,  9 Sep 2024 07:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsrdNzix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC88810E2F7
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 07:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725866593; x=1757402593;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Wm489iuIIy9TIoAkoo7AWP2AvZsWMvVG5LZLo4nhV3A=;
 b=nsrdNzixZNq0/AWcoOEd8Gvr1SJK1Pa7shGswDY9gxYqIWqKHJCkH5hI
 NlaKHhWSeCuw/6UOengBWUt1IPrlVZsWNOnSa+Rsc9U9FCNcXtgkFqSgE
 2sYOymixbUgJKkH7uDOPwxtJjMHT22ZcqiDqEl2D2U3yhOUxkG48xzFOv
 qGluLCySAiLD16XYkzQrFXabFrsdZlTF5hR+OFVbw6Zv2AiH7Ot3ow5qk
 6fezbuyJ+YAn5QlLvmz1OVeiPP/qk5gsxn0CEYKnp/LPnPXInE3kYm3bY
 PGCFCL+aBAudn3Vp+LXkRB0Y/skoBboEfr+8lrAqzsR4hoX1YEySDCNvZ w==;
X-CSE-ConnectionGUID: 6u0eWMqcSDSmeqe2wtDLGg==
X-CSE-MsgGUID: QOtIhE2QQjmCTqUhzM49eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="27466305"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="27466305"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:23:12 -0700
X-CSE-ConnectionGUID: MweGn0U2Tk20QXssMxoRZw==
X-CSE-MsgGUID: UGuZahsQT+m1LSc3BgC2pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="71373843"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.245.41])
 ([10.245.245.41])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:23:11 -0700
Message-ID: <8bc4acc376b406345160379f3353d9057ebdf41b.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.BAT: failure for drm/xe: Add a xe_bo
 subtest for shrinking / swapping
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 09 Sep 2024 09:23:09 +0200
In-Reply-To: <172554549945.950921.1932212412167581529@2413ebb6fbb6>
References: <20240905131617.8521-1-thomas.hellstrom@linux.intel.com>
 <172554549945.950921.1932212412167581529@2413ebb6fbb6>
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

On Thu, 2024-09-05 at 14:11 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Add a xe_bo subtest for shrinking / swapping
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/138262/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-1896-
> b9fe1879bf216a835796a599fbc717992ba16e04_BAT -> xe-pw-138262v1_BAT
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-138262v1_BAT absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-138262v1_BAT, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> =C2=A0 to document this new failure mode, which will reduce false
> positives in CI.
>=20
> =C2=A0=20
>=20
> Participating hosts (9 -> 9)
> ------------------------------
>=20
> =C2=A0 No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
> =C2=A0 Here are the unknown changes that may have been introduced in xe-
> pw-138262v1_BAT:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit (NEW):
> =C2=A0=C2=A0=C2=A0 - bat-atsm-2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][1]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/bat-atsm-2/igt@x=
e_live_ktest@xe_bo@xe_bo_shrink_kunit.html
> =C2=A0=C2=A0=C2=A0 - bat-pvc-2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][2]
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/bat-pvc-2/igt@xe=
_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>=20
> =C2=A0=20

These skips here are expected.


> New tests
> ---------
>=20
> =C2=A0 New tests have been introduced between xe-1896-
> b9fe1879bf216a835796a599fbc717992ba16e04_BAT and xe-pw-138262v1_BAT:
>=20
> ### New IGT tests (1) ###
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> =C2=A0=C2=A0=C2=A0 - Statuses : 7 pass(s) 2 skip(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.26, 44.29] s
>=20
> =C2=A0=20
>=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-138262v1_BAT that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo:
> =C2=A0=C2=A0=C2=A0 - bat-adlp-vf:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [SKIP][3] ([Intel XE#2229] / [Intel
> XE#455]) -> [PASS][4]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/bat-adlp-vf/igt@=
xe_live_ktest@xe_bo.html
> =C2=A0=C2=A0=C2=A0 - bat-adlp-7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][5] ([Intel XE#2229] / [Intel
> XE#455]) -> [PASS][6]
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/bat-adlp-7/igt@x=
e_live_ktest@xe_bo.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> =C2=A0=C2=A0=C2=A0 - bat-adlp-7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][7] ([Intel XE#2229] / [Intel
> XE#455]) -> [SKIP][8] ([Intel XE#2229])
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/bat-adlp-7/igt@x=
e_live_ktest@xe_bo@xe_bo_evict_kunit.html
> =C2=A0=C2=A0=C2=A0 - bat-adlp-vf:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [SKIP][9] ([Intel XE#2229] / [Intel
> XE#455]) -> [SKIP][10] ([Intel XE#2229])
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1896-b9fe1879bf216a835796a59=
9fbc717992ba16e04/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.htm=
l
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v1/bat-adlp-vf/igt@=
xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>=20
> =C2=A0=20
> =C2=A0 [Intel XE#2229]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
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

