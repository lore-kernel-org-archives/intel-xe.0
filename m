Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0FAC36008
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 19:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E39810E5D6;
	Tue, 25 Mar 2025 19:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYQgEUKs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861C110E5D6
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 19:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742929536; x=1774465536;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=0CBmyVkWu6twWvre+JTeeQrqrkhyq4KpcDQCwJlsPeU=;
 b=kYQgEUKs5BgRlcaLKVe2gOVQyI4n5LD9qQN3iWDj5cJghCShI56+P4EI
 rdvJaMIlL8ZiiaKl25bQt1XUI45q+Cu34Amrimo/sNB1qYRwxSgZ7uob/
 WMgBXvijsSZZbfI6sBUHQcrRnpaeH3We0icEgCFd4d5/M6xX0gA8WaTKP
 eCFODqMYjruII1OtBnno0B2gtEsICdYmwDdUfyVYTkia1Don1izyEhWtD
 XE4g0uM0IYCTbtQkIXejXxDtiLqnSkKG68n2C1GwPx70qQVAbeU1bDy+A
 w8QaxZM5jrYAm9Geff/O/C5b7JIk0WTjbGfSNWfae53Af2KpCZafRmPSc A==;
X-CSE-ConnectionGUID: hLvZdeggRgKidAmw1ZPSVQ==
X-CSE-MsgGUID: JWqLRL3WTg+mU0Hm9iW86A==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44317073"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44317073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:05:34 -0700
X-CSE-ConnectionGUID: w8T707JcRp+z6iZWM839uQ==
X-CSE-MsgGUID: KdXSCmQYQPq19l8Z0puUQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="125405209"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.125])
 ([10.245.246.125])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:05:33 -0700
Message-ID: <99ca7aa9bdfd797ad52b43b770136a0dbbcda854.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.BAT: failure for series starting
 with [1/2] drm/xe: Remove extra spaces in xe_vm.c (rev2)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org, 
 Matthew Auld <matthew.auld@intel.com>
Date: Tue, 25 Mar 2025 20:05:29 +0100
In-Reply-To: <c010cb9d-cfed-46fa-a232-7ce8768f3f4d@lankhorst.se>
References: <20250320211519.632432-1-dev@lankhorst.se>
 <174289544214.218.14501066439435038545@e6b6f09ec485>
 <c010cb9d-cfed-46fa-a232-7ce8768f3f4d@lankhorst.se>
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

Hi,

On Tue, 2025-03-25 at 11:41 +0100, Maarten Lankhorst wrote:
> Cc: Matthew Auld
>=20
> Hey,
>=20
> For peer-to-peer DMA-BUF, it can be beneficial to allow mapping
> memory as uncached.
> Initially I tried copying the caching on same-driver import from the
> original BO.
>=20
> Thomas suggested that since memory access from discrete is always
> coherent, the
> check in xe_vm.c can be simplified from XE_IOCTL_DBG(xe, coh_mode =3D=3D
> XE_COH_NONE)
> to XE_IOCTL_DBG(xe, !ID_DGFX(xe) && coh_mode =3D=3D XE_COH_NONE)
>=20
> This causes below failures.
>=20
> Should I continue with the original patch, or change the testcase as
> well?

This is a tricky one.
But first, why aren't those tests failing similarly with the original
patch?

Also, If we were to use system dma-buf with the exported bo WB, then
the app would fail anyway?

Perhaps we should use a separate test for p2p dma-bufs (attach-
>peer2peer), but then again UMD wouldn't know whether it's peer2peer or
not.

I think if we need to access cross-device bos for metadata, we need to
check with Sima / Dave first. I don't think that's something that is
encouraged, really.

/Thomas






>=20
> Kind Regards,
> ~Maarten
>=20
>=20
> On 2025-03-25 10:37, Patchwork wrote:
> > *Patch Details*
> > *Series:*	series starting with [1/2] drm/xe: Remove extra
> > spaces in xe_vm.c (rev2)
> > *URL:*=09
> > https://patchwork.freedesktop.org/series/146562/=C2=A0<https://patchwor=
k
> > .freedesktop.org/series/146562/>
> > *State:*	failure
> > *Details:*=09
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/index.html
> > =C2=A0<
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/index.html
> > >
> >=20
> >=20
> > =C2=A0 CI Bug Log - changes from xe-2844-
> > 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056_BAT -> xe-pw-146562v2_BAT
> >=20
> >=20
> > =C2=A0=C2=A0=C2=A0 Summary
> >=20
> > *FAILURE*
> >=20
> > Serious unknown changes coming with xe-pw-146562v2_BAT absolutely
> > need to be
> > verified manually.
> >=20
> > If you think the reported changes have nothing to do with the
> > changes
> > introduced in xe-pw-146562v2_BAT, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false
> > positives in CI.
> >=20
> >=20
> > =C2=A0=C2=A0=C2=A0 Participating hosts (10 -> 9)
> >=20
> > Missing (1): bat-adlp-vm
> >=20
> >=20
> > =C2=A0=C2=A0=C2=A0 Possible new issues
> >=20
> > Here are the unknown changes that may have been introduced in xe-
> > pw-146562v2_BAT:
> >=20
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IGT changes
> >=20
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Possible regressions
> >=20
> > =C2=A0 * igt@xe_pat@prime-external-import-coh:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o bat-bmg-2: PASS
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c
> > 1e947e283cc3b267b1ce2056/bat-bmg-2/igt@xe
> > _pat@prime-external-import-coh.html> -> FAIL
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-2
> > /igt@xe_pat@prime-external-import-coh.html>
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o bat-bmg-1: PASS
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c
> > 1e947e283cc3b267b1ce2056/bat-bmg-1/igt@xe
> > _pat@prime-external-import-coh.html> -> FAIL
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-1
> > /igt@xe_pat@prime-external-import-coh.html>
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o bat-dg2-oem2: PASS
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c
> > 1e947e283cc3b267b1ce2056/bat-dg2-oem2/igt@xe
> > _pat@prime-external-import-coh.html> -> FAIL
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-dg2-o
> > em2/igt@xe_pat@prime-external-import-coh.html>
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o bat-atsm-2: PASS
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c
> > 1e947e283cc3b267b1ce2056/bat-atsm-2/igt@xe
> > _pat@prime-external-import-coh.html> -> FAIL
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-atsm
> > -2/igt@xe_pat@prime-external-import-coh.html>
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o bat-pvc-2: PASS
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c
> > 1e947e283cc3b267b1ce2056/bat-pvc-2/igt@xe
> > _pat@prime-external-import-coh.html> -> FAIL
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-pvc-2
> > /igt@xe_pat@prime-external-import-coh.html>

