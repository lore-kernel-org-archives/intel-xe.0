Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB9DCA0ED3
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 08:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F0F10E6C5;
	Wed,  4 Sep 2024 08:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOJ1R1++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5D310E6C5;
 Wed,  4 Sep 2024 08:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725438303; x=1756974303;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=96ShFOPdT/kE63ZMNmUsPpnEsS0v0IMOjVpa/lohWO4=;
 b=NOJ1R1++1Fm9Er7ai4muw9vESSagCZnWXHipq0z4foOfq0bFs/FXLN4R
 e9RBoPceyjvSS5iwlBf9QhVZXb1FbXlul5f68ezAZkL3pnUi2Yy9sx+M2
 ZszUYKxfWnVJLuvTzY1CmP8Bnx09yvTqmX2ZC2bic5l4pCeDsLeCTmSYv
 kVJefuTG0wtuE3m02CmfG39r4HRArcZliPNbQH3mXKI0lphr1VEPDF+ms
 ZLlMRccP9ge3la48AbAqBlo4Kul6BjodLSt+uJHYKPgza11Q5XcovIjZD
 9SOcAjmovOYgAx3PIrR/8mm3W2BcM+PcDJ0bpaBtCw0X5Q/7ZJH7f31He A==;
X-CSE-ConnectionGUID: PDCKB77STvewP/jZjOitBw==
X-CSE-MsgGUID: 32Rek+7YTG2VmLaa6DhW8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24273385"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="24273385"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:24:47 -0700
X-CSE-ConnectionGUID: wTdHNd3BT+WeZobcgVVPeQ==
X-CSE-MsgGUID: j/f/rTxoTiGFiObgFn1xeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65927079"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.93])
 ([10.245.245.93])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:24:46 -0700
Message-ID: <76b1d906b6e83326f1c7b8af9d6c178b2e0ae6aa.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.FULL: failure for drm/xe: Use
 xe_pm_runtime_get in xe_bo_move() if reclaim-safe.
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Date: Wed, 04 Sep 2024 10:24:43 +0200
In-Reply-To: <172536517346.912224.8141954656608709943@2413ebb6fbb6>
References: <20240903094232.166342-1-thomas.hellstrom@linux.intel.com>
 <172536517346.912224.8141954656608709943@2413ebb6fbb6>
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

On Tue, 2024-09-03 at 12:06 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-
> safe.
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/138131/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-1884-
> dd987a9431a336ddbfc6bfe9720f4783a6bc94b0_full -> xe-pw-138131v1_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-138131v1_full absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-138131v1_full, please notify your bug team
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
> pw-138131v1_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@kms_atomic_interruptible@legacy-cursor:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][1] ->=
 [INCOMPLETE][2] +1 other test
> incomplete
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe=
9720f4783a6bc94b0/shard-dg2-436/igt@kms_atomic_interruptible@legacy-cursor.=
html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-dg2-432/ig=
t@kms_atomic_interruptible@legacy-cursor.html
>=20
> =C2=A0=20
> #### Suppressed ####
>=20
> =C2=A0 The following results come from untrusted machines, tests, or
> statuses.
> =C2=A0 They do not affect the overall result.
>=20
> =C2=A0 * igt@kms_content_protection@srm:
> =C2=A0=C2=A0=C2=A0 - {shard-bmg}:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [FAIL][3] ([Intel XE#1178]) ->
> [INCOMPLETE][4] +1 other test incomplete
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-1884-dd987a9431a336ddbfc6bfe=
9720f4783a6bc94b0/shard-bmg-3/igt@kms_content_protection@srm.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/shard-bmg-4/igt@=
kms_content_protection@srm.html
>=20
> =C2=A0

These failures should not be related, and they pass locally on dg2
non3dcold-capable.

/Thomas

