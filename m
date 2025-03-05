Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4E4C19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 13:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6084810E2A8;
	Wed,  5 Mar 2025 13:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIxiXqNb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575C510E294
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Mar 2025 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741182171; x=1772718171;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=kyKyQuXrx6WV9AWjdOQ9X3RpJGL4q3MFOy379YoH23g=;
 b=CIxiXqNbK4uk8TAjcIPcKuxcQgD0x7xqh4zUVgaKuSDtERlcRvrVUwmt
 wRcETrQCZ1yyjxq4LIk7viWcpUfhCwjHxbbipEqfpyVe3apdhlL7gD/1m
 rsP9RA8hFq+BcSn8mMCtADCsJ6FmDFuqrrTqfdE1JlVmTvWNVlviZZaIf
 CaIgpHgU9VzYiIOW5WbO8Lrwa8yLSnEwZHqbkjL0Je2zb7IXeX+NViCNA
 y7og/YB+F6t5KD8iDg0+gP3fJ4VgLAyKAVZccqa+ze0AShPL5C3uE3KHh
 70PilIUqP19v87j8GJnXdrc27jUnddwxxtyzfP6gHW3fqlnbzeX+PuRZU A==;
X-CSE-ConnectionGUID: aHqNZ1DbRtOR9ptEkMZIfQ==
X-CSE-MsgGUID: QtFOgckwR3K9PIbdmu6Jlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64587549"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="64587549"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:42:50 -0800
X-CSE-ConnectionGUID: lo0j4SjWQwmhDykpvf4xcw==
X-CSE-MsgGUID: 5oD0rv8GS/65KKE+gVumrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123893698"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.45])
 ([10.245.246.45])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:42:49 -0800
Message-ID: <4c3bf18fe5009c6676d9372f582a0f21807a864f.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.BAT: failure for drm/xe: The xe bo
 shrinker series for testing
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 05 Mar 2025 14:42:46 +0100
In-Reply-To: <174118176684.104792.14950894590349355930@db0ebb060c04>
References: <20250305101023.251956-1-thomas.hellstrom@linux.intel.com>
 <174118176684.104792.14950894590349355930@db0ebb060c04>
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

On Wed, 2025-03-05 at 13:36 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: The xe bo shrinker series for testing
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/145816/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-2756-
> 9391bc304a5cea9a9b63bff8e2d3b38f8d44d033_BAT -> xe-pw-145816v1_BAT
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-145816v1_BAT absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-145816v1_BAT, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> =C2=A0 to document this new failure mode, which will reduce false
> positives in CI.
>=20
> =C2=A0=20
>=20
> Participating hosts (10 -> 9)
> ------------------------------
>=20
> =C2=A0 Missing=C2=A0=C2=A0=C2=A0 (1): bat-adlp-vm=20
>=20
> Possible new issues
> -------------------
>=20
> =C2=A0 Here are the unknown changes that may have been introduced in xe-
> pw-145816v1_BAT:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_intel_bb@render@render-xmajor-256:
> =C2=A0=C2=A0=C2=A0 - bat-adlp-vf:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [PASS][1] -> [ABORT][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2756-9391bc304a5cea9a9b63bff=
8e2d3b38f8d44d033/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/bat-adlp-vf/igt@=
xe_intel_bb@render@render-xmajor-256.html
>=20
> =C2=A0 * igt@xe_intel_bb@render@render-ymajor-256:
> =C2=A0=C2=A0=C2=A0 - bat-adlp-vf:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [PASS][3] -> [DMESG-WARN][4]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2756-9391bc304a5cea9a9b63bff=
8e2d3b38f8d44d033/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/bat-adlp-vf/igt@=
xe_intel_bb@render@render-ymajor-256.html
>=20
>=20

These errors should not be related to the patch, but rather look like
duplicates of [Intel XE#4491]

Thanks,
Thomas



> =C2=A0=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-145816v1_BAT that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@xe_intel_bb@render:
> =C2=A0=C2=A0=C2=A0 - bat-adlp-vf:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [PASS][5] -> [ABORT][6] ([Intel XE#4491])
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2756-9391bc304a5cea9a9b63bff=
8e2d3b38f8d44d033/bat-adlp-vf/igt@xe_intel_bb@render.html
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/bat-adlp-vf/igt@=
xe_intel_bb@render.html
>=20
> =C2=A0=20
> =C2=A0 [Intel XE#4491]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033 -> xe-pw=
-
> 145816v1
>=20
> =C2=A0 IGT_8261: 8261
> =C2=A0 xe-2756-9391bc304a5cea9a9b63bff8e2d3b38f8d44d033:
> 9391bc304a5cea9a9b63bff8e2d3b38f8d44d033
> =C2=A0 xe-pw-145816v1: 145816v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145816v1/index.html

