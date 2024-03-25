Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37511C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 21:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B5410E3F3;
	Mon, 25 Mar 2024 21:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0fQ5T59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ED610E3F3
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 21:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711402521; x=1742938521;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hxfb7x1YA5oNsmSY+siDdIw2JbI7NK12XLIhlEPSY4I=;
 b=A0fQ5T59b1IDJB5O+FJoAzULwhaYbC9Ht85HA5LW0zIHtFBXWkxgFFwN
 whXEwhSYWTjYQPsburYAyijSyyuZyWQSM8sgl/eSX3NCdc4/Q/pJNzVEX
 nW6Oj7OMIMzQyNPm/i5ACVfFP4GZt3J93R377SHy54DITO7GmIrukVy59
 G5SJRyVu/YpK+dPhZmmkHFrkqs6Je4WlxG/VjyLs8oghHpb21orfYal5i
 gWNhwYljQejg/CMMLYitzCKHjuMoePJOhBOzFGZJwWId7F5QB75DWwSxY
 nOFIuj9e/nCrpdTsKh2DE6/Pg3oiyzcRZU8ohOh9WHOZExkaEq4Thp8j/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6297006"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6297006"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:35:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20436216"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 14:35:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 14:35:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 14:35:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 14:35:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcsTpLbdEEOyBzRs8oQvrUegYV4rRaOb0bBTQBXvfSkFkUkBPSXxWvLE/8nYG11wRS27VJQxZUxWWcOmlR4VE7Aw6n+9kv5jmnwkZui++PAhEBFksR/u0xBbfFH8HFBxb4qjWtUTFD3EhAnnFsWTPVzqLwPo4NtmqtyQo0xntZoT608Q3+Ze5joU1/df6KYVLy+14TMwzlOVGEbzjeS1C4YyXdby+LBIJRW/t60eawlB9+jWmnMArl9H413zwVNaTUy1yw+KTwAXhnuO4Q6klNSkqNaf5KuyZzvjY3cHI+Vfztgna6e6T9SFQao5i39R8bqtspPvyMp1wZIGql9INg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GNQNr+sxSHP6IsAHeS9Vzi/jcDcqP+rsbHHjpvnZts=;
 b=fDcvjQp384JxuMH0E77r5ZZ8wJ55oEzwsE9TBSJepB2vG+W8kHCG1KlTuG1nllnHVjHrkw78YZjssLPzhUBdXB3Don6K75FaJ21WG/EaZ/G38U57gfMGGNez5OakBOChbh4/Ahwnv9hKHP6yNeag4eQscp94yFTC9gp5iBhl0M2lXdP5saBw8tMaUuJnQJ/5PWk21n9NvvMfvRxNvVvpnuoVBf2zayPgcfLTRY4K3imW+RTphIX3mJuIbqU4VCjhmGEIhhC7j7s0uIrAeU24zgeyEBoqLs3UhQ9dONSfm4ClpzqPc+CwSzhOa4PLvcEiELoRsasQopF/jPS9qw2jvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SJ2PR11MB8324.namprd11.prod.outlook.com (2603:10b6:a03:538::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 21:35:17 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 25 Mar 2024
 21:35:16 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 14/30] drm/xe: Add xe_gt_tlb_invalidation_range and
 convert PT layer to use this
Thread-Topic: [PATCH v4 14/30] drm/xe: Add xe_gt_tlb_invalidation_range and
 convert PT layer to use this
Thread-Index: AQHacRajKHCer+kPikOUjMVyLVzqs7FJFecw
Date: Mon, 25 Mar 2024 21:35:16 +0000
Message-ID: <SA1PR11MB69914DBB81E68E590F33511492362@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-15-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-15-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SJ2PR11MB8324:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 863oSZScim27CKC1s2nmHqLVOHkx6S6kOJXR6EOYDfblocXEO9llw3DCDsncOLVAYuAXZRMCq6bA3Rrv5ahKXFv5gb1WtKBcJLrABSGzf38Gz/fiy0ObRJt6naZDFWC4BtPXUNdUUQnTjPWvHPEBi5wOnfbNtBQtKsvmYaNQN4gz+nljx495O+ws7wi/v8zm2o34Pi3zsOwvc29b2h0zKrtbxs+PJF+COb6S81PiyIMiCqCAY85Qwz6Bu8SSHRC1gpO/+Eb4JSfLNTjlx8KRpTq0sGiYrrcgYWYgRGCJoSqj6sFPo6/YnELbCvrOjyNgxXyAn/hmltliuh+GyDm88mXBX3TSa0qM9X8qPnsdufIV3/ikSzQSvBiY0mrP7kfy8wiV9i/KiK2UnStkEsbnfFdM3FPiCTOZHtkfLcUk+lIxcinGWYMMoFMdBUllEnHSfHJjZHdMiF387FCHA9TIddFZ8ZF5HaJ0tO+ZSxlt/gpwq+M64JcmWwUtxSODA+czZyRL2Y72/ABLFD65bAs+KXda5tyrddyaR9rWKdyRgQfi7P4enDA1QR3/gPbwhKKZ5dy7p0U/N19mAUIpvAekvHZReyqrO7c501Uds7hFBWo//zJA7LX6yEjOV5kwoD4FyJreOIPS/epucBqomcaijeHp75JfO/rnH3duFTGjtCs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tKFdIJY4V2FfIHKg9dMCppR2cuilvziylgoycnRaCutUXIRAMpkhj5Cwt9mM?=
 =?us-ascii?Q?KDYHlOkfur6euzbnNjlCKQ1gdRWYRpDucc797riLNwF8q/OGwakm0RgnHADT?=
 =?us-ascii?Q?VUa2hYe8AmjdtGqzpw+3mYkCz5o8hOtCfTPHYf1PvggoQdMCRAZa190hjFbJ?=
 =?us-ascii?Q?BhWBA//YmCZrnR4yrzyxGO5ZC6NkvBghlJ5JE/QuN0poU/g42RtzWLQOycvx?=
 =?us-ascii?Q?mDWjrfWRVJLk6+duTRKoR4q7sHpVARitkajyt7N9bjJkMRw0ub5YC1tcI50e?=
 =?us-ascii?Q?aiGQ6bd7LdLFH0sVBiPdK0/xxekY/YjKFr3g0A9T9iF/ukn12r8CbyeGWg8q?=
 =?us-ascii?Q?9n0bA9aNzlqbKB7V41bpWXKKaJwdv4m4TGr6Hsjem1EHzvkpfV7JHvuqGYzr?=
 =?us-ascii?Q?rfDa6sz4e2DDI1P8CKe/ZeQ5CCHn4t7pjFyL4f8oDBGlumHl6ulqLazlOfge?=
 =?us-ascii?Q?WxLvo9VCeSdfUTDTVHcMjtFs/oW7BaIwSpyhbiFW4q6xbez6V+F1wvud7VJ0?=
 =?us-ascii?Q?NJBjVUSeF+Oc20kx/dJc6RQTTbRo4OiP1R8XBnatswM7OwKhbn4T52Rs56on?=
 =?us-ascii?Q?5AbG3f+alDJS2yqnM5NPReT+xE7fLY9NAhtPBZ9rBySvtO3YVovZOKxTXw9N?=
 =?us-ascii?Q?YlKbhIOzXpRqO1jj3U75tBHjZfyH72CNJVdTxqOxM5Q3vRp7ppRLUCYw+sDk?=
 =?us-ascii?Q?AuMLlzUkdIedHsfC8xMu6pjaF+TYxtDSRB7ei3eEacIhr4hlvGH1+tk+GDML?=
 =?us-ascii?Q?TeRyaLGHF3W4sQHFPzbYOO7cJtPuZV13rIuWhpdP9VUR01DAurwEMUFGDDBL?=
 =?us-ascii?Q?ZpIXASCGC5ZS3mzdEcd1ZvsWFlxoyKPp9O+d6GrS7dPmOvxaoZskPhjADs3W?=
 =?us-ascii?Q?AvhEfOSot1/wYgLJAfEydHF1Lqr4SgTXlZ6bDOY9ubb8HlRPGevXTfdDABLX?=
 =?us-ascii?Q?9ASq5Iqou1se8W6TfFUE0Ek8iv4TcPBCnxOlzMklUE+sWdDHL92hKJLa7qUL?=
 =?us-ascii?Q?CYuNcsU+FpqQuWzJdQn/jsj1yye6cVlijQa0P7vV11E5uBzw9WsMCoz+lNQ9?=
 =?us-ascii?Q?FyrnZFTecuWO+QRpjjvA63zn1T8H0ykCuIm/zIi5VQZiopoE+5pRVwisgUmO?=
 =?us-ascii?Q?6wmDXbKoMm+pA6/Jk/kHnUvgiwaugoTm8bHeV2IoKD+5Y/ZbndHQ4bBDaDil?=
 =?us-ascii?Q?NDn5Y+ospS8eCxxXK171DqTiQSvhQv/EAhtTtcHf5jp1v3vlP6Mnfv3HXaDD?=
 =?us-ascii?Q?EA0GG5LWGbeATvoZnsIhe9uztW+jYwsOgZKu/xs7zI+hkkIhcLq8V8XxJW73?=
 =?us-ascii?Q?Jf4YcvEqtN41YKaN6GxyKkLWmutX0rUwkHuT9p2sLr68VrTT4Q+23vWFkAMi?=
 =?us-ascii?Q?j2l+AWo1GDCo0fEEmh7FzIyFAT3mr+JoNeb26sZbwlE77j9fSxOeQmneg5pO?=
 =?us-ascii?Q?lTmwsdYrvuWvBI9YB0Fg31qnph17S0BHK0XNEACnmqIhjtUvW/uB98Mr2wXs?=
 =?us-ascii?Q?N5OHjqDStMlCNNwiXiDVXeYIpPeqZTErldAwrPuUWvNGssmbOohOLxhk0wp3?=
 =?us-ascii?Q?q7dybfgM18Jry5WCo4E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d2a258-629c-4e71-98aa-08dc4d13769a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 21:35:16.8960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V56vUdRJMJAqBsCf+dYz/e+hcgUoIg52MsXKZgngYCXM67gIyegVbfbU5rDycERb7ubcAfQjdN8ke8S5W/mvTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8324
X-OriginatorOrg: intel.com
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

Hi Matt,

Patch looks good to me. See one question inline

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Friday, March 8, 2024 12:08 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v4 14/30] drm/xe: Add xe_gt_tlb_invalidation_range and
> convert PT layer to use this
>=20
> xe_gt_tlb_invalidation_range accepts a start and end address rather than
> a VMA. This will enable multiple VMAs to be invalidated in a single
> invalidation. Update the PT layer to use this new function.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 59 +++++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  3 ++
>  drivers/gpu/drm/xe/xe_pt.c                  | 25 ++++++---
>  3 files changed, 65 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index a3c4ffba679d..ac2bf86de39a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -264,11 +264,15 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  }
>=20
>  /**
> - * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for =
a VMA
> + * xe_gt_tlb_invalidation_range - Issue a TLB invalidation on this GT fo=
r an
> + * address range
> + *
>   * @gt: graphics tile
>   * @fence: invalidation fence which will be signal on TLB invalidation
>   * completion, can be NULL
> - * @vma: VMA to invalidate
> + * @start: start address
> + * @end: end address
> + * @asid: address space id
>   *
>   * Issue a range based TLB invalidation if supported, if not fallback to=
 a full
>   * TLB invalidation. Completion of TLB is asynchronous and caller can ei=
ther use
> @@ -278,17 +282,15 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>   * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on s=
uccess,
>   * negative error code on error.
>   */
> -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> -			       struct xe_gt_tlb_invalidation_fence *fence,
> -			       struct xe_vma *vma)
> +int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> +				 struct xe_gt_tlb_invalidation_fence *fence,
> +				 u64 start, u64 end, u32 asid)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  #define MAX_TLB_INVALIDATION_LEN	7
>  	u32 action[MAX_TLB_INVALIDATION_LEN];
>  	int len =3D 0;
>=20
> -	xe_gt_assert(gt, vma);
> -
>  	/* Execlists not supported */
>  	if (gt_to_xe(gt)->info.force_execlist) {
>  		if (fence)
> @@ -302,8 +304,8 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  	if (!xe->info.has_range_tlb_invalidation) {
>  		action[len++] =3D MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
>  	} else {
> -		u64 start =3D xe_vma_start(vma);
> -		u64 length =3D xe_vma_size(vma);
> +		u64 orig_start =3D start;
> +		u64 length =3D end - start;
>  		u64 align, end;
>=20
>  		if (length < SZ_4K)
> @@ -316,12 +318,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  		 * address mask covering the required range.
>  		 */
>  		align =3D roundup_pow_of_two(length);
> -		start =3D ALIGN_DOWN(xe_vma_start(vma), align);
> -		end =3D ALIGN(xe_vma_end(vma), align);
> +		start =3D ALIGN_DOWN(start, align);
> +		end =3D ALIGN(end, align);
>  		length =3D align;
>  		while (start + length < end) {
>  			length <<=3D 1;
> -			start =3D ALIGN_DOWN(xe_vma_start(vma), length);
> +			start =3D ALIGN_DOWN(orig_start, length);
>  		}
>=20
>  		/*
> @@ -330,16 +332,17 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  		 */
>  		if (length >=3D SZ_2M) {
>  			length =3D max_t(u64, SZ_16M, length);
> -			start =3D ALIGN_DOWN(xe_vma_start(vma), length);
> +			start =3D ALIGN_DOWN(orig_start, length);
>  		}
>=20
>  		xe_gt_assert(gt, length >=3D SZ_4K);
>  		xe_gt_assert(gt, is_power_of_2(length));
> -		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
> ilog2(SZ_2M) + 1)));
> +		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
> +						    ilog2(SZ_2M) + 1)));
>  		xe_gt_assert(gt, IS_ALIGNED(start, length));
>=20
>  		action[len++] =3D
> MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> -		action[len++] =3D xe_vma_vm(vma)->usm.asid;
> +		action[len++] =3D asid;
>  		action[len++] =3D lower_32_bits(start);
>  		action[len++] =3D upper_32_bits(start);
>  		action[len++] =3D ilog2(length) - ilog2(SZ_4K);
> @@ -350,6 +353,32 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
>  }
>=20
> +/**
> + * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for =
a VMA
> + * @gt: graphics tile
> + * @fence: invalidation fence which will be signal on TLB invalidation
> + * completion, can be NULL
> + * @vma: VMA to invalidate
> + *
> + * Issue a range based TLB invalidation if supported, if not fallback to=
 a full
> + * TLB invalidation. Completion of TLB is asynchronous and caller can ei=
ther use
> + * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait=
 for
> + * completion.
> + *
> + * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on s=
uccess,
> + * negative error code on error.
> + */
> +int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> +			       struct xe_gt_tlb_invalidation_fence *fence,
> +			       struct xe_vma *vma)
> +{
> +	xe_gt_assert(gt, vma);
> +
> +	return xe_gt_tlb_invalidation_range(gt, fence, xe_vma_start(vma),
> +					    xe_vma_end(vma),
> +					    xe_vma_vm(vma)->usm.asid);
> +}
> +
>  /**
>   * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
>   * @gt: graphics tile
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index fbb743d80d2c..bf3bebd9f985 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -20,6 +20,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
>  int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  			       struct xe_gt_tlb_invalidation_fence *fence,
>  			       struct xe_vma *vma);
> +int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> +				 struct xe_gt_tlb_invalidation_fence *fence,
> +				 u64 start, u64 end, u32 asid);
>  int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
>  int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u=
32
> len);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 7f54bc3e389d..110d6917089b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1074,10 +1074,12 @@ static const struct xe_migrate_pt_update_ops
> userptr_bind_ops =3D {
>  struct invalidation_fence {
>  	struct xe_gt_tlb_invalidation_fence base;
>  	struct xe_gt *gt;
> -	struct xe_vma *vma;
>  	struct dma_fence *fence;
>  	struct dma_fence_cb cb;
>  	struct work_struct work;
> +	u64 start;
> +	u64 end;
> +	u32 asid;


I didn't see start/end/asid is used anywhere else, except in the below fenc=
e_init function... do we really need those members?

Oak

>  };
>=20
>  static const char *
> @@ -1120,13 +1122,14 @@ static void invalidation_fence_work_func(struct
> work_struct *w)
>  		container_of(w, struct invalidation_fence, work);
>=20
>  	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
> -	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
> +	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence->start,
> +				     ifence->end, ifence->asid);
>  }
>=20
>  static int invalidation_fence_init(struct xe_gt *gt,
>  				   struct invalidation_fence *ifence,
>  				   struct dma_fence *fence,
> -				   struct xe_vma *vma)
> +				   u64 start, u64 end, u32 asid)
>  {
>  	int ret;
>=20
> @@ -1144,7 +1147,9 @@ static int invalidation_fence_init(struct xe_gt *gt=
,
>  	dma_fence_get(&ifence->base.base);	/* Ref for caller */
>  	ifence->fence =3D fence;
>  	ifence->gt =3D gt;
> -	ifence->vma =3D vma;
> +	ifence->start =3D start;
> +	ifence->end =3D end;
> +	ifence->asid =3D asid;
>=20
>  	INIT_WORK(&ifence->work, invalidation_fence_work_func);
>  	ret =3D dma_fence_add_callback(fence, &ifence->cb,
> invalidation_fence_cb);
> @@ -1286,8 +1291,11 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_v=
ma
> *vma, struct xe_exec_queue
>=20
>  		/* TLB invalidation must be done before signaling rebind */
>  		if (ifence) {
> -			int err =3D invalidation_fence_init(tile->primary_gt, ifence,
> fence,
> -							  vma);
> +			int err =3D invalidation_fence_init(tile->primary_gt,
> +							  ifence, fence,
> +							  xe_vma_start(vma),
> +							  xe_vma_end(vma),
> +							  xe_vma_vm(vma)-
> >usm.asid);
>  			if (err) {
>  				dma_fence_put(fence);
>  				kfree(ifence);
> @@ -1625,7 +1633,10 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct
> xe_vma *vma, struct xe_exec_queu
>  			dma_fence_wait(fence, false);
>=20
>  		/* TLB invalidation must be done before signaling unbind */
> -		err =3D invalidation_fence_init(tile->primary_gt, ifence, fence,
> vma);
> +		err =3D invalidation_fence_init(tile->primary_gt, ifence, fence,
> +					      xe_vma_start(vma),
> +					      xe_vma_end(vma),
> +					      xe_vma_vm(vma)->usm.asid);
>  		if (err) {
>  			dma_fence_put(fence);
>  			kfree(ifence);
> --
> 2.34.1

