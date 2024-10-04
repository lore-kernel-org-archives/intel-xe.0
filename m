Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F7DCF34C5
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 13:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D952010E171;
	Fri,  4 Oct 2024 13:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FE1+tpJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2AE10E171
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728049749; x=1759585749;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9sn/27MNVaINhW7vZNDcrurym+g+zyVFHXsrlXfcWYQ=;
 b=FE1+tpJTovJMODMKo2upBKCGVG7W35kwsK3ZnyUCRgZ720oXZ612m5ij
 8kuBtcLPLvzeMICanHwcUvZQN/SK5NyGJI+Oixj1atXWbOBLJYhoJSxpn
 0C9JXG0a/lJicZhnNWDkDzQkpYJjiJ/ZZ7YGUK6unD+8mbCdKX12RtdKV
 GJJ8tAQC3iAb2eJKh0shYtFkSnLE/QYvIt1dBpFbuyq9alWArLhN8+lkU
 3TdEEv222Xxx2mMAPAz9Co1v7AuOpHl8XZ7PAZLkTVjVXiNqEXGppAXBB
 u578jOkdqSMmMzdRHqXLtx4AkfSRyojBJZ+V7phm7dlXRkjuEYhXjfQuz w==;
X-CSE-ConnectionGUID: FzMj5/CyRAO8OLSF2Ep+xA==
X-CSE-MsgGUID: HR5Umh5oTDSwbW228eeaZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="49802987"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="49802987"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:49:08 -0700
X-CSE-ConnectionGUID: GBRFY7EvSPan9PgwaDLLpA==
X-CSE-MsgGUID: 4qs9Z2D9RRS4gOOZzWGehA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="75139556"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.128])
 ([10.245.245.128])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:49:07 -0700
Message-ID: <eb1f2f71dfa249ec34e9e0a8878266770c235618.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/tests: Fix the shrinker test compiler warnings.
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 04 Oct 2024 15:49:04 +0200
In-Reply-To: <3e661da9-126f-429f-bcbc-897e481470da@intel.com>
References: <20241004123922.38904-1-thomas.hellstrom@linux.intel.com>
 <3e661da9-126f-429f-bcbc-897e481470da@intel.com>
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

On Fri, 2024-10-04 at 14:10 +0100, Matthew Auld wrote:
> On 04/10/2024 13:39, Thomas Hellstr=C3=B6m wrote:
> > The xe_bo_shrink_kunit test has an uninitialized value and illegal
> > integer size conversions on 32-bit. Fix.
> >=20
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Closes:
> > https://lore.kernel.org/20240913195649.GA61514@thelio-3990X/
> > Fixes: 5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking /
> > swapping")
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
> > b/drivers/gpu/drm/xe/tests/xe_bo.c
> > index 7d3fd720478b..1562c08aaf34 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > @@ -440,7 +440,7 @@ static int shrink_test_run_device(struct
> > xe_device *xe)
> > =C2=A0=C2=A0	LIST_HEAD(bos);
> > =C2=A0=C2=A0	struct xe_bo_link *link, *next;
> > =C2=A0=C2=A0	struct sysinfo si;
> > -	size_t ram, ram_and_swap, purgeable, alloced, to_alloc,
> > limit;
> > +	u64 ram, ram_and_swap, purgeable =3D 0, alloced, to_alloc,
> > limit;
>=20
> Maybe just double check that this doesn't now introduce 64b division=20
> errors on 32b arch.
>=20
> Assuming it doesn't,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Good point. While it compiles without missing symbol on gcc ARCH=3Di386
it may well complain on other compilers / archs. I'll respin to use
div64_u64

/Thomas


>=20
> > =C2=A0=C2=A0	unsigned int interrupted =3D 0, successful =3D 0, count =
=3D 0;
> > =C2=A0=C2=A0	struct rnd_state prng;
> > =C2=A0=C2=A0	u64 rand_seed;

