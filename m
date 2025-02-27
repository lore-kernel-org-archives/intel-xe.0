Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3637C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 23:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA4D10EBB9;
	Thu, 27 Feb 2025 23:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNLaxreE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DF810EBB9
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 23:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740699989; x=1772235989;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/weGhR4Y7uTpCtazYaGjEo8zdeyZ1h0LHpli+tdl0lw=;
 b=DNLaxreE9unHw4toKNmacHxlvD82Tn9h9nAVDdPeGUEroQLIgk9ZCKlp
 7gyWqjHDNsQWhNgKwjLeIGnZsbT4/GsmGuojceGipZVdErs6nf2fSk8/4
 A6e7te1xsJbH1XMOrlUGizf87i1Kv7iSWNloYXE42zHWQsp5qM0ndWvSR
 9CJ5522NSOAAMdyaW9p4L7TvcKmV3bKmmKRjjHy+NlKSScNpWD2ehOf0g
 GLr5vRGJXXBYioSGuI+s5sEwrno2nDJuAbco7hQ9/aHh7vqpJs9HxhLzN
 L10ytWeOUK5zr1Hlq49y46RXdf5BLTfKwge5V9GQ3bz0m4C3aUW9x/6nH w==;
X-CSE-ConnectionGUID: zyM9vDgWTaaw20Bbp1uGaQ==
X-CSE-MsgGUID: jSj6ld3IRAyJ+uz/x2VyDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45397207"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="45397207"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:46:29 -0800
X-CSE-ConnectionGUID: 7P209ncQTbqdMMO+LgpPng==
X-CSE-MsgGUID: PG99auI/Q+2NSXudU5Kw5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122400645"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 15:46:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 15:46:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 15:46:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 15:46:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGsgEcCIwc89VkwMoZaoOeA3n79zzDyy91pmNaiiQW6OIBwTxsbSyAjJB9NKd448IqtvMUm2L02yQ6ZgEtMvrpVxlULd8VCUnQ/qFfRT21eZmVcp9u1ltS4B5QsU6DN2i/OAV6/Hqate44aQs4mfvVQlJJk0vpLuzq1W6I5wcs5IGHyVB7+vGk02vk65AicpOVxDp4X4XBPKNXtJwN+zaXvoVha1ZZhvEtem0caLVw5slwNKgeKfZsPk9stI62DKCtT1BxFogwS4gNjhYA/Wi0R4rHWW0HeMYRID1sX6sdvEnRmXM9l105nhIFIi1QY/SFPm/JZAvN5p+PD5en1YvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsTHvlWfgOB5saIBDH3Yy2lwuGmvB8iACqmvg+v3jOM=;
 b=Z7hQtTZkFTKV5ZV13ngXtB4EVTVKGUMx+PKszMl82GztCryUp5x0KoIQQffgU4s8Eva4dTCFeXOgMQloSJR0Too9BFSoMVDxhaM2IiVYI5k+N6gDy+PujwGJFV+0pn2I2VLfHW9pEjzy2R8bqwABHmTqSzRrJhtukYraykG8nepVH3vfww86yS+hS5dFB6yytBqqsZ7je9bKt7xIjTrj2Mvl7ioh/P7Bf0sfyFuGwatGoQTKOtA8JkLFVoVmGoFmqWztL+U3NtcprVIGuYpH7IKRzm7dUha0KCxNyXGeD3R7ztG9NNAkuZtBKV6XPDmq6zgkhadnGw3xeOpCHF1m3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 23:46:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 23:46:25 +0000
Date: Thu, 27 Feb 2025 15:46:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 02/12] drm/xe: Fix ring flush invalidation
Message-ID: <20250227234622.GL5109@mdroper-desk1.amr.corp.intel.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221101736.78986-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d856c8-6318-4093-910b-08dd5788f242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RtCC2ohAsxOmtlkNOZ8WmbdZsq6pC6lAttP/yNGAu7w7ST+PFkwfD3HdK6PQ?=
 =?us-ascii?Q?htw2Fy+bVO8HAu5p/kD2zbk6co4d51lSVIJ5yHoNeui9W8bsTOVKvCUv+Nu6?=
 =?us-ascii?Q?OM2lg+/omZpHLwnJrvGSOLYwwRaOo0M/Vve467AovCoL5XXsp0Xw2ejfTGAG?=
 =?us-ascii?Q?512YykcZDuEvLqUSmLS3kMeYNe0rJ7R4+9OCgSqHu7st9/noSSqIYJ1n2Y9r?=
 =?us-ascii?Q?6oj25wOSRhPbVnpyjCIG3wI/RtLNbU75sBC4zWfTR0uxUC42G+E6JWZ8HS3z?=
 =?us-ascii?Q?2Auj3pDswaPFJ02mDa0jQaWGJUfK5xmnsCkib8Gx4ui8RBY8hKfF6Y7i2Oi7?=
 =?us-ascii?Q?f3mflVcUiGY3mKostMTJ7Ut8QDvw3MyO25O6U7kLFSL+AHz8+3nR0p7UeLJv?=
 =?us-ascii?Q?yxr84g2PbcORjcCQ+fmh/C6GNQMDDqp2ZFvrRceV7rJ1JNGTegTcxRDQng5a?=
 =?us-ascii?Q?STy4BlF0kiQRNppLyN9CoKLNmQ5MS8UELgh6ZpSvRYAEq7axi3RKRXTajBA1?=
 =?us-ascii?Q?76vpMEMB23G38gdnWzO6+5saW+cJ2h7q4PZEiCL/X5JBwAe9g8Ehh4ktazNJ?=
 =?us-ascii?Q?LhVePkLFrNI5Dj+JCl/p64UWSXkzWI5YomwgryOjgrqImuGeR7ihBdcG3MG6?=
 =?us-ascii?Q?/OotT5hm6yj+d76bOfFuSKBxnTtSWyRq3NrLVcbQrcZTHjWH4Q/JAFitodGK?=
 =?us-ascii?Q?4Qu76AVef29F7Jfl54OM4Sv9WA2VNvBt8fIXFysGk+fcLt5k0DPxzX7W/txq?=
 =?us-ascii?Q?zKmqNywFgUgIAu2y2Xee97V4XwlBYcdP8uJsZFqNTiSO+HvtEMLJe4IXA+PQ?=
 =?us-ascii?Q?Y/bsA44wlLgJofPk19xDZqPvJoW8O40sPk2eh1juHKDFuyndgfYS4hCZFC4v?=
 =?us-ascii?Q?IWo2RE54uAkJM3JEOPBtI8j8fBFKqUkRJ8Kt8Uc6GnBnoGxjozyUCgUG3r7k?=
 =?us-ascii?Q?WThUKaTeusXpL3ZACeut/ML+efa8+CPSDKpFJ5iPJ/ic/BSUgsM55ikJrmaw?=
 =?us-ascii?Q?y2ssevACqVAXWnTkQ+1P7Uu1uM0cbIlD8aWJ8yOas7cvHvmqNH27j8LWcyxl?=
 =?us-ascii?Q?e5uhOetGm16ZdA6hlQ8NzDB9fMTVvRKkft+RKIIGczrbny0QfdAPZ89c33Ly?=
 =?us-ascii?Q?hrPSb0c870DcOqFKUylx0RfxY7GhFMLs5qKG9Lfq7MRGJ220FkdnxwodBTyq?=
 =?us-ascii?Q?WN6EA+yffmZvwTVbL8opjai1vpBbfWSfLmT2xTRGDDIsz1AU+gBuX6o4i7a+?=
 =?us-ascii?Q?oXnFZ9qhrXQkfEYYa2j/42mkMK5Ne9aQUaJkqMM/STdKVLyN49ndxQy6Bcx2?=
 =?us-ascii?Q?AziodRezTtTwrMnmlEo9ehLqC1NaQSfGWGOx++PuCUbCLCvBRkjZaf/vtqXI?=
 =?us-ascii?Q?gMNnIRuhaLovM7VQUAi0M/0jwilD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sy8zMksfh8Kpmh7TGniJHHS752NEB/nzu34idAzjfxvS0SQZBfJl88bLQVWp?=
 =?us-ascii?Q?fMaQmepzqLEXkNe06PoPaEDo4eS2Kr9kAc1sn046GHEZ+A/4sdBdvqe8UC/w?=
 =?us-ascii?Q?85G9rBr0nijFBIDR1ZqNPYuHeG/IjfpDyNU9JWZEAE3z/MBEhtu1tQknO2nj?=
 =?us-ascii?Q?iSapKK654jB6Vq/2bP18qanRQHsMD4v6FhJwtugr04Beh/pyDa3L09+VV8SH?=
 =?us-ascii?Q?MNmzZHAm0exGbTh0W3NJO5tVczxD8MdPL60U/7a+/9QRgMtRETASkQaZmybk?=
 =?us-ascii?Q?GJQc/X8KSNWLF4XXUUHXegsRJRG4mH2HqS3e9LK+on1EbW/EcTWsqSGj8Tzh?=
 =?us-ascii?Q?Jp1KD1Cp27c4klssnaVHIIfKFAJiVijWDTK4sGTVQ9D1TdI8+c38td2d3DVh?=
 =?us-ascii?Q?irpqX6ipTsq4zahHBwARJBwzyQ+ZFozQOKDrv/OnlTG3HIg2MD7YH8R2Ivnn?=
 =?us-ascii?Q?evLi6zsKH9eHIlzBDEzePo4M2M1z2cKKiWf8ThMDIatGfeHVnoX1UjxvgWCf?=
 =?us-ascii?Q?GCZzlB2cA+h8RIuq0KezGgaEIZZnqJwfSRwI2y/bjAH/gEJJvDsPex+k4gA4?=
 =?us-ascii?Q?i5uvBLh4pffDrlPk7KrD2n4u4YsKFPFBAsjfeWA188LJCOD8TidTTzjdbE7n?=
 =?us-ascii?Q?rjxlEejmr9G10HuiriDAZ/hF3UFrBVA0op7bqm7roJK7UoEU7NdGCDcwA40o?=
 =?us-ascii?Q?WxW2qzlDEAezbnNzqG8clmE50j3KNagYOr4nGNnE4IB8kvjjzXWOJbxlbkD4?=
 =?us-ascii?Q?thkPeNv0a+fXq35dbWAzuvgK7zoJgc/K5zQcf8njCxCtpCesC53UANpUm0lq?=
 =?us-ascii?Q?HYnoKC9HFN6oeciKB+LIV7KpH3V8xpUZBMSLO5pOghMBGHUNlOg10Sie+c+Z?=
 =?us-ascii?Q?yrbbkRM3Ff6hgNG8RIZbPt8pjBi9+/BDVDX2Zh3JLLSbfozoTrpmZpPhZoEK?=
 =?us-ascii?Q?V51f4gG7O2FO0Cc0NxYIzAO1V63gWUVIg8NE9kDsZKhpQxnTublO0zW1YOr1?=
 =?us-ascii?Q?gXcjdx2lhfJEC8GCz275a7gyZ0QbzXGsoki2c+Yp17GNjAdLhnYFJzyDPZTr?=
 =?us-ascii?Q?3FrDdjZsMM8mxlHSlpJL7oLnIlzUXVbAp87A5qD3bEWr8BwHqW6v1ggi/STd?=
 =?us-ascii?Q?ndJEx3D4g3sTWkYACfJMfVsX7yeZR0aiyH7wq7sVLIEtw7Rk0NcDa+Cnf3uZ?=
 =?us-ascii?Q?DWvCdeHXTM2NGfMCQDsrnekNm4UV4pr+msdCkley2POdoZSCou/hOhzBUt0i?=
 =?us-ascii?Q?5Skm01JvGcENEVLqj8nACm1YNMISFMjji1+Ygl+6j88ftzY+ImyMagbwGFuJ?=
 =?us-ascii?Q?P4xAahLtUz594oktj4qhnV1fqdTvnR2fA1aH4OuKhM5e4vsBy0Dvmlbd3M77?=
 =?us-ascii?Q?uuwcx58tVS7Lm5L6cDk4EJcJnDDs1jxLjs/yx3tYAgmulhmJIZm6dq5EBvuK?=
 =?us-ascii?Q?BvOtxhWzjgayF4weTXH6T0FzQ2hppBQvBMg0vDfOlbb4tQ3Z/xpQ5LdxQlgN?=
 =?us-ascii?Q?CmHUui1wjNwBq61wwTme+ty7Zb/CL5gQLjgicdnivdsbJ2gPgx3URdiojUGF?=
 =?us-ascii?Q?tyJsRJAXvI34NnzkVHcZArCXWKLy4ZBTAqBIa7L0pQ2AlJ/cTZaijGCOWh7K?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d856c8-6318-4093-910b-08dd5788f242
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 23:46:25.0584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXTXj+QcChqtJuKhcwiJai69UVjFg7XkoNp8K3SgXJFRJVfdF4BLHvlc/rROjOIpmG2F2nv7UzV5IMO9PWG1GNBF/utkHm+4YqdfX/vM2JQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
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

On Fri, Feb 21, 2025 at 10:17:21AM +0000, Tvrtko Ursulin wrote:
> Emit_flush_invalidate() is incorrectly marking the write to LRC_PPHWSP as
> a GGTT write and also writing an atypical ~0 dword as the payload. Fix it.

Technically the write is a GGTT write (the PPHWSP is allocated as part
of the LRC, and the LRC is mapped to the GGTT).  But the important thing
here is that bit 21 (MI_FLUSH_DW_STORE_INDEX) redefines the meaning of
the PPGTT vs GGTT bit to instead mean "index into pphwsp" vs "index into
ghwsp."  And based on the name of the offset we use
(LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR) it sounds like the pphwsp was
indeed intended here, so dropping the 'use GTT' flag is in line with
that.

I don't think the actual destination (ghwsp vs pphwsp) or the value (~0
or 0) actually has any functional impact since there doesn't seem to be
anything watching and waiting for those writes to show up in memory.  We
just have to use the OP_STOREDW flag because the TLB invalidate flag
mandates that it also be present.

But your patch makes things more consistent, so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> While at it drop the unused flags argument.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 0c230ee53bba..a2d1fb8f0adf 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -111,16 +111,13 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
>  	return i;
>  }
>  
> -static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
> +static int emit_flush_invalidate(u32 *dw, int i)
>  {
> -	dw[i] = MI_FLUSH_DW;
> -	dw[i] |= flag;
> -	dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
> -		MI_FLUSH_DW_STORE_INDEX;
> -
> -	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
> +	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
> +	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
> +	dw[i++] = 0;
>  	dw[i++] = 0;
> -	dw[i++] = ~0U;
>  
>  	return i;
>  }
> @@ -409,7 +406,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
>  		/* XXX: Do we need this? Leaving for now. */
>  		dw[i++] = preparser_disable(true);
> -		i = emit_flush_invalidate(0, dw, i);
> +		i = emit_flush_invalidate(dw, i);
>  		dw[i++] = preparser_disable(false);
>  	}
>  
> -- 
> 2.48.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
