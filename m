Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A907DC48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 08:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C04E10E20E;
	Tue, 20 Feb 2024 08:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYwyLff0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FE110E20E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 08:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708418579; x=1739954579;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=goh0+YqWyS0dLko0HJwqoDHRZMfvAROF9vJuX8JDIxI=;
 b=GYwyLff0YrfYur7bcij5I0fw8G+vN49kvzjsHCdb+lfLcEyjSpKJ0HuL
 0kaEbc3FpMoAVK6YgvLKYeBRfdWRnE3wfDBlBGZEikxr8lhtcySsWHMbN
 5zHHfvln9YcFsXGzzS+FT7JytiZ4RQfG0IadY13P7jfCHPflJX711Jghl
 o8xBbGen1IsbeLrLZM/Rx6x008oNJKtXKA/4J1mW3S/fHMAO45X5Y2O3O
 5YoZk9fUq7boGpWlVRpopVcLPDaLpnbJPRlZwUHmMWf57hJ5s85/K9cAy
 2gqmEGJaGf5RrCVwkK692ueyqB3Q4G+1kszaLp2Q3KEoBHxncTg0CGGWW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="20042133"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="20042133"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 00:42:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4959388"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.16])
 ([10.249.254.16])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 00:42:55 -0800
Message-ID: <d1eb8873c76a540e5f76306989333bcf8d2f94f3.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/3] Skip remap fixes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 09:42:52 +0100
In-Reply-To: <20240219211942.3633795-1-matthew.brost@intel.com>
References: <20240219211942.3633795-1-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Mon, 2024-02-19 at 13:19 -0800, Matthew Brost wrote:
> A few fixes related to skipping remaps.
>=20
> Will put together an IGT showing failures too.
>=20
> v2: Including missing files
>=20
> Matt
>=20
> Matthew Brost (3):
> =C2=A0 drm/xe: Fix xe_vma_set_pte_size
> =C2=A0 drm/xe: Add XE_VMA_PTE_64K VMA flag
> =C2=A0 drm/xe: Return 2MB page size for compact 64k PTEs
>=20
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11=
 ++++++++---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14=
 ++++++++++----
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 2 ++
> =C2=A03 files changed, 20 insertions(+), 7 deletions(-)
>=20

Series LGTM Will add separate R-Bs on each patch.

Although I think in the longer run we're going to need something like
xe_pt_expand_unbind_range() or something similar that, given a minimum
unbind range, expands that range to completely include any partially
covered large ptes / compact page-table.

/Thomas

