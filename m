Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EE2EE49A5
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 13:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5625710EA0D;
	Wed, 11 Sep 2024 13:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buI5Bnxw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9601B10E197;
 Wed, 11 Sep 2024 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726061545; x=1757597545;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CnvRvW93ssJ8t8wApPAvmeZ5Qh3OR70MmcFE28KuKUk=;
 b=buI5Bnxwz0eRhFWXm9lGYTf5inMgzShx380L2uiFyI+ywbvyv+v66xZc
 JVBSY71tzdPcQtyAjLEZsnALQNRm/7gdc7zUP6dukWhoVK5axKHISx05i
 XtJSJUVBwNGSokUzI9Y0A5innAt1iqLOWzBYOHlfjuka3FdvyDGwybDA/
 hM5VzKD1mSa+BJGKp8h+IKWoYJCppOv0yozcAFpsBjR9XZjRcH/Wu1Mz3
 d/iuy1hKPQ3DiBPvHnrIaG4VLEvcZwHP3Uuv4HhBvtTTqVYH0QqlDhRR8
 eXXZBz3osWQycbkK7S1rszu+RRI5oc3F7rea3XhOSzPkgIfWotVcCIKKz w==;
X-CSE-ConnectionGUID: KOZNrQmdQ4G8TTR5tzlH2Q==
X-CSE-MsgGUID: r7Xlyh2QSeSppTWvYSH1Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="27782130"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="27782130"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 06:32:24 -0700
X-CSE-ConnectionGUID: BdfZfwmJRUSJrKHeiqVY7w==
X-CSE-MsgGUID: HhDU13jARsWeJuJi9wzZOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67313397"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.71])
 ([10.245.244.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 06:32:23 -0700
Message-ID: <c21b7b400e5719a86adc86a1e95ce5293308887f.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.BAT: failure for drm/ttm: Really use a
 separate LRU list for swapped- and pinned objects (rev6)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: i915-ci-infra@lists.freedesktop.org
Date: Wed, 11 Sep 2024 15:32:07 +0200
In-Reply-To: <172605955381.984929.1451363040600705870@2413ebb6fbb6>
References: <20240911121859.85387-1-thomas.hellstrom@linux.intel.com>
 <172605955381.984929.1451363040600705870@2413ebb6fbb6>
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

On Wed, 2024-09-11 at 12:59 +0000, Patchwork wrote:
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
> f3eded4f8a05d73a0b94f27e05737ea3427450b3_BAT -> xe-pw-138103v6_BAT
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-138103v6_BAT absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-138103v6_BAT, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> =C2=A0 to document this new failure mode, which will reduce false
> positives in CI.



>=20
> =C2=A0=20
>=20
> Participating hosts (8 -> 8)
> ------------------------------
>=20
> =C2=A0 No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
> =C2=A0 Here are the unknown changes that may have been introduced in xe-
> pw-138103v6_BAT:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit (NEW):
> =C2=A0=C2=A0=C2=A0 - bat-atsm-2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][1]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/bat-atsm-2/igt@x=
e_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>=20
>=20

Hi!

This skip is expected and should be documented as such.

Thanks,
Thomas


> =C2=A0=20
> New tests
> ---------
>=20
> =C2=A0 New tests have been introduced between xe-1924-
> f3eded4f8a05d73a0b94f27e05737ea3427450b3_BAT and xe-pw-138103v6_BAT:
>=20
> ### New IGT tests (1) ###
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> =C2=A0=C2=A0=C2=A0 - Statuses : 7 pass(s) 1 skip(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.32, 44.30] s
>=20
> =C2=A0=20
>=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-138103v6_BAT that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_flip@basic-flip-vs-wf_vblank:
> =C2=A0=C2=A0=C2=A0 - bat-lnl-1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][2] -> [FAIL][3] ([Intel XE#886]) +1
> other test fail
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/bat-lnl-1/igt@km=
s_flip@basic-flip-vs-wf_vblank.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo:
> =C2=A0=C2=A0=C2=A0 - bat-adlp-vf:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [SKIP][4] ([Intel XE#2229] / [Intel
> XE#455]) -> [PASS][5]
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/bat-adlp-vf/igt@=
xe_live_ktest@xe_bo.html
> =C2=A0=C2=A0=C2=A0 - bat-adlp-7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][6] ([Intel XE#2229] / [Intel
> XE#455]) -> [PASS][7]
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/bat-adlp-7/igt@x=
e_live_ktest@xe_bo.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> =C2=A0=C2=A0=C2=A0 - bat-adlp-7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][8] ([Intel XE#2229] / [Intel
> XE#455]) -> [SKIP][9] ([Intel XE#2229])
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/bat-adlp-7/igt@x=
e_live_ktest@xe_bo@xe_bo_evict_kunit.html
> =C2=A0=C2=A0=C2=A0 - bat-adlp-vf:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [SKIP][10] ([Intel XE#2229] / [Intel
> XE#455]) -> [SKIP][11] ([Intel XE#2229])
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27=
e05737ea3427450b3/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.htm=
l
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v6/bat-adlp-vf/igt@=
xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>=20
> =C2=A0=20
> =C2=A0 [Intel XE#2229]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#886]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
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

