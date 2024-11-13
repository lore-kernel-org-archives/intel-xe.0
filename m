Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39C3D462CA
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 15:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DC310E144;
	Wed, 13 Nov 2024 15:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2d6btKZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A759E10E144
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731513143; x=1763049143;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kYy3e///U++kBroPE5MP4Nn07jssolJkhdKnqeqyTgQ=;
 b=T2d6btKZHAGC9nO74utxxrjH53LR8mOj5OC6T2tTySaZnJ1Vc5QOE48H
 TH+RscNLB9kmOfjQLv8HqfuJMLWalS9+Y6rGFQzajVD36owY8vfdqfDs+
 qDPebB63yZ6dtSiCtmaGBlWwjz7SPm2bearqJ5+Mt7pe2DRNTH/TYNYsL
 hT1Qpp4pz+ThgYQCe7WbfDCi0ZLSpLgFWH7n4gHEKHglFw1oQIjoAKwJo
 DanFhySK0xUkaVBnBIJsnOaclrrkqs0UiYwizTOAtnJLjku723mpOqI0P
 6Ek6YkjoDwQ0OjNwGTvTgrGBHAVlUFAArKh7fZyTqa2iLBpHcgchxPQfH g==;
X-CSE-ConnectionGUID: ETF487Z9Skms48ZGJEvqmg==
X-CSE-MsgGUID: tjFt8gcUR7eDv39vk8n1aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42024638"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="42024638"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 07:52:23 -0800
X-CSE-ConnectionGUID: NghsakhXRwWFLOfQdh183Q==
X-CSE-MsgGUID: kYBaTEeyR1aBy2MnVPCUMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="92977437"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.190])
 ([10.245.246.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 07:52:22 -0800
Message-ID: <ce8f155875eb7df9e54773c293c0077cbd66a8b1.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/tests: Limit purgeable size for faster execution
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
Date: Wed, 13 Nov 2024 16:52:19 +0100
In-Reply-To: <20241113150228.2337530-1-nirmoy.das@intel.com>
References: <20241113150228.2337530-1-nirmoy.das@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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

On Wed, 2024-11-13 at 16:02 +0100, Nirmoy Das wrote:
> xe_bo_shrink_kunit takes a while to run on some machines depending
> on swap storage speed and ram size. Limit purgeable size to 2GB
> so xe_bo_shrink_kunit can execute much faster.

Hmm. This actually limits the swap size to 2GiB, and thus *increases*
the fraction of purgeable bos.

But question is if we end up shrinking only purgeable bos, given that
we, to be safe, overestimate the need for purgeable bos with 20%.

Probably better than skipping the test completely, though.

/Thomas
=20

>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2998
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
> b/drivers/gpu/drm/xe/tests/xe_bo.c
> index cd811aa2b227..71b71a546abe 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -467,7 +467,7 @@ static int shrink_test_run_device(struct
> xe_device *xe)
> =C2=A0	}
> =C2=A0	to_alloc =3D ram * 2;
> =C2=A0
> -	ram_and_swap =3D ram + get_nr_swap_pages() * PAGE_SIZE;
> +	ram_and_swap =3D ram + min(get_nr_swap_pages() * PAGE_SIZE,
> SZ_2G);
> =C2=A0	if (to_alloc > ram_and_swap)
> =C2=A0		purgeable =3D to_alloc - ram_and_swap;
> =C2=A0	purgeable +=3D div64_u64(purgeable, 5);

