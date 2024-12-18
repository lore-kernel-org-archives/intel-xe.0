Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3E9E77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 13:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B355510E1A0;
	Wed, 18 Dec 2024 13:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfyFi4GE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6BD10E1A0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 13:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734530347; x=1766066347;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=G/fCLbNlOiUKrh9xC3UH6zeoYELeqRVj4MBHUvSA4+A=;
 b=GfyFi4GEGrvRNMMTXor6QhSmahAxD22i+TKcOkg8T2dcjiRVNRzmWz9c
 8y1eEVKPv9J+70eEJ3hFt17w7RFOtC7Or4qyuyA7XgNafBjSGuEiq7sx/
 rMANUr2pCpBWePZJTt96PgRlN6L53QRGOCfCYT2uLVJ4EK5osFG3sFyrr
 bxlYxhJU/XF8igVOwSV8CD8kIVxKk+r4u/RKOLKVXMBZ6vumSvOGhF4nq
 IxQTWn7kbo6iepzryfMQbjaDlpMakIygWcmhwh4epBhC5siu0pOwcH1q2
 P9+6wBetiL4CLweV1haN4nAHGNLJjoCrXcDWQY0RrCeBMvvONRB8LJkcc w==;
X-CSE-ConnectionGUID: eCx7dNAiQ6KWeuHCUWGeYQ==
X-CSE-MsgGUID: vTc234A5SZeGcvxwmQ5IKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34887713"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="34887713"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 05:59:07 -0800
X-CSE-ConnectionGUID: 7dY9v4w1STeRg+19x3vOaw==
X-CSE-MsgGUID: MmmURt8+TgGy+NLnG8UhfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="102867588"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.105])
 ([10.245.246.105])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 05:59:05 -0800
Message-ID: <26160d0fb20982b110c91bf607f6886feb8ad8a9.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/tests: Move shrink test out of xe_bo
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
Date: Wed, 18 Dec 2024 14:59:02 +0100
In-Reply-To: <20241218141447.2528530-1-nirmoy.das@intel.com>
References: <20241218141447.2528530-1-nirmoy.das@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Wed, 2024-12-18 at 15:14 +0100, Nirmoy Das wrote:
> The subtest typically has an execution time long enough to motivate a
> separate test so that it can be easily excluded if needed.
>=20
> v2: reword commit message(Thomas)
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/tests/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 ++++++++++++++--
> =C2=A0drivers/gpu/drm/xe/tests/xe_live_test_mod.c |=C2=A0 2 ++
> =C2=A02 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
> b/drivers/gpu/drm/xe/tests/xe_bo.c
> index c9ec7a313c6b..405ff904153e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -606,8 +606,6 @@ static void xe_bo_shrink_kunit(struct kunit
> *test)
> =C2=A0static struct kunit_case xe_bo_tests[] =3D {
> =C2=A0	KUNIT_CASE_PARAM(xe_ccs_migrate_kunit,
> xe_pci_live_device_gen_param),
> =C2=A0	KUNIT_CASE_PARAM(xe_bo_evict_kunit,
> xe_pci_live_device_gen_param),
> -	KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit,
> xe_pci_live_device_gen_param,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {.speed =3D KUNIT_SPEED_SLOW}),
> =C2=A0	{}
> =C2=A0};
> =C2=A0
> @@ -618,3 +616,17 @@ struct kunit_suite xe_bo_test_suite =3D {
> =C2=A0	.init =3D xe_kunit_helper_xe_device_live_test_init,
> =C2=A0};
> =C2=A0EXPORT_SYMBOL_IF_KUNIT(xe_bo_test_suite);
> +
> +static struct kunit_case xe_bo_shrink_test[] =3D {
> +	KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit,
> xe_pci_live_device_gen_param,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {.speed =3D KUNIT_SPEED_SLOW}),
> +	{}
> +};
> +
> +VISIBLE_IF_KUNIT
> +struct kunit_suite xe_bo_shrink_test_suite =3D {
> +	.name =3D "xe_bo_shrink",
> +	.test_cases =3D xe_bo_shrink_test,
> +	.init =3D xe_kunit_helper_xe_device_live_test_init,
> +};
> +EXPORT_SYMBOL_IF_KUNIT(xe_bo_shrink_test_suite);
> diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> index 0d36ab864ec0..81277c77016d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> +++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> @@ -6,11 +6,13 @@
> =C2=A0#include <kunit/test.h>
> =C2=A0
> =C2=A0extern struct kunit_suite xe_bo_test_suite;
> +extern struct kunit_suite xe_bo_shrink_test_suite;
> =C2=A0extern struct kunit_suite xe_dma_buf_test_suite;
> =C2=A0extern struct kunit_suite xe_migrate_test_suite;
> =C2=A0extern struct kunit_suite xe_mocs_test_suite;
> =C2=A0
> =C2=A0kunit_test_suite(xe_bo_test_suite);
> +kunit_test_suite(xe_bo_shrink_test_suite);
> =C2=A0kunit_test_suite(xe_dma_buf_test_suite);
> =C2=A0kunit_test_suite(xe_migrate_test_suite);
> =C2=A0kunit_test_suite(xe_mocs_test_suite);

