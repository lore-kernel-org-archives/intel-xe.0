Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C4BC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 19:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FFD10E064;
	Wed, 14 May 2025 19:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVTkEyN3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E773A10E064
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 19:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747250361; x=1778786361;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zs5S0Dgxr5qcEWMnz28oPfFAI6yeMO38D0ANAmjrfCM=;
 b=cVTkEyN3NbV2YjLgaqYn1asGRy8MBswOnFBiZDmJLpnlIJ8fj6zNgqhV
 Mx7hd5BuqrC4YRD9qAY4HGw87BojUiGTMBDYje9Xf7RPmUw0S9xK5pbeU
 ZUqkVBz0KSCB6YRoTENRHyZKS0+JxTBRi/odltR6yWTyqugqwiGtq98AH
 /mXOolS1IW02Vyws1pxfaYe1oXB2CBZ6ZBKG5QW/qGeEE/CrKGOVIJqb8
 DemF1rj0/isoKIi02xKfQZiWw3JqnqdzXuQtZbabNHbIR64rrkWXpav8t
 jJ5NQWsxBL2rwMLgOuucJ+LmRhe4ZSXtxOyDe9Ej27sW+8HaopRjk8y25 g==;
X-CSE-ConnectionGUID: FpBpmiJMTPOxHhGaA7RAwQ==
X-CSE-MsgGUID: wOEE+lyrRWu/fvNhOQyUkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49059273"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49059273"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:19:07 -0700
X-CSE-ConnectionGUID: 821K1tbsSi2yJocpWoeEhw==
X-CSE-MsgGUID: nl8+PR3SSl+1MeR3u4qxYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="161421295"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:19:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 12:19:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 12:19:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 12:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecmRiawDMyubzL1ygf+EsHSGQPEsS32LvnHWoTJXdjtM/7QVE9C1kCu4V4/654712skgLwKH4dB0fC97i9d40TQ0p4kvK92etLBEv3EwibSnGXS/PznLdmbp7f++Paoyp0Bf+x9jqGR/E0+P8N6JV9ZGjhMlaX7bGxjA87SxLqvLJxMWyP1gtv2A/TCbj1CSQ3qEx1q6mJSZREF/Xm6Q/UdOGnHFFB3i2+pIRVCXCeflQIKigwLXhAJhS1khn7zzttgYpWT8lWHqBog64l2mqMSc51PM14I9ln71pOkhsghtyIR2tJj9ZIlKYrFdoeTOvRy059FtkpUbzBh3YBmftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AMo/Tl2z85QFbB6QMrwhfRDZSS/7kDVvDxLpRuJkGI=;
 b=nYsqHpw0MlBoH2g1j7ivxwaLTqZ2uI9GiYLz9sEWhjrB+F1uxes+EMoRotL1+b+ui9QLJaJttJsc+y/maHenJKNCJRsN5YNYOglRgl/YF8aNGb8hB4ce0CWSzgBMcK5Jf4YlEKJe+RdPrCdoEZVNstVFjGmQnUM/3ZZE184FQYoLFKA6bpHN3sgczwDRYaOh4Qw/evdCjx16+5yWlketKfPlFvJLlqfDoMMvUARd/fEf9r/4eHb1kY/fPSG5nUz+g4iFbTaWhQW3Pom6L7KB2x5+uP89U6KtYCFWkCAjPEsme+R6z5tlXBHgikXBTx5/DRg7VrlzkOCEHXUMrDQejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7488.namprd11.prod.outlook.com (2603:10b6:806:313::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 19:18:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 19:18:34 +0000
Date: Wed, 14 May 2025 12:20:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 24/32] drm/xe: Allow CPU address mirror VMA unbind
 with gpu bindings for madvise
Message-ID: <aCTs4du68Hs4Kgla@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-25-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-25-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:303:85::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d5acfc-2232-4006-0a0b-08dd931c1ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+6M5EMLIjaH0f/sG3Q91/UXKxS5wJkPw6xM67cGgAuoLv2rFJnO2vbWmF65A?=
 =?us-ascii?Q?VNzAuYUCBobCplMjr5kPMfNRUpvkl9Ia3zv7MEaKb2exEXPqKbjpwEcLP6uU?=
 =?us-ascii?Q?57EDspkJdrlINwdth3JusUcwcHFYaCHiNZpXfZ7jEY7NYT3fcx8wNuInW5kw?=
 =?us-ascii?Q?elsK4ANDyeyRedEnMwykOchLRcJOKp/E3s/gSIof+TuoVvU+qFKeSrBwXk1M?=
 =?us-ascii?Q?7IgJrJnUsOfmoHsc9XM+5WZciUsH6eZUh6Lz3nEcijkL766yE6qFrrj+QJdi?=
 =?us-ascii?Q?d1EekYdWrswKS1Yc/LRYIMFddxyEZp8RbKFpyt7yZ4qXTJnLcyYS+cF0CQ1c?=
 =?us-ascii?Q?Pbyo9TfTqAMIvEXJL1B1NUIms7AYaqQVnGcgf46jeiB6kbOn4UqwWeQMyQ73?=
 =?us-ascii?Q?29s+1wurTg9/7mLyY+EwQAufxM2zoKJYq/OeDno5EdesQRLOcgUdqwboZwfW?=
 =?us-ascii?Q?sv9MGoHnb+9hwhsJVXTfESOujZTZb6UkQ75gnoZeG+rp691dxIPVVvCgNqc9?=
 =?us-ascii?Q?fhSV1cqHykRlcI1xJzvA2426F9APOuJEeO6x9eZ8aYFw/06Gp4NnTP0tzx8C?=
 =?us-ascii?Q?T1CoadZKHF8yLJmnN97EXKHxdEFBl7Of/k0YH0dhTmToCdR0mzN1Awg1qymF?=
 =?us-ascii?Q?KJ1YgLTNLNnkESngGHFb2Vxa7fqkgiIOdSqiNpoqLKNJHtihY0BrvMvXmKcf?=
 =?us-ascii?Q?j48ggXXM9C+vds0vmSV2DsMN8+RwMV8/uRCfnoLPtir257UBGRo5jzFUCFsE?=
 =?us-ascii?Q?MtL217LyF/2jxpNGVhynsq0o9OAEe01BGwf//PPoKsXp5pxMQTSaOfBVhAC1?=
 =?us-ascii?Q?5dXfh12J23VJY8so117Uy0Q6DlUr83yl+JX0jXu/S77QeYm9+CCPIJpV4Y45?=
 =?us-ascii?Q?2yBgN++e1fUqabr43lOgA/A6Bt5LjMYPF38TAEb7Dy+GvKctdkpv1gmTQ8uV?=
 =?us-ascii?Q?XQEzhturwc1k2bVDP4Wfb2XtF0ad9xwo1X0j6/te6qx6RSu27joQhzePjvHZ?=
 =?us-ascii?Q?12tGENvL3p0A1XtCEba7mJH/j7W3cfgn1n/THOP6o3Kx/kKqw7pCGYbQqW83?=
 =?us-ascii?Q?hxRs6AhKcj8UwLtypntpODvPBusdvfRfFbm9mm4N2aEOPZm2GtWFz/16Teua?=
 =?us-ascii?Q?SQ+s3w32vRM7rLI+hlC4NDbyyNv6ElYqPgN7FX7fw2+Y0xN07XChnBx4NdHA?=
 =?us-ascii?Q?Wyel91VCAVr9RpMRcf1ZIljqVYdpxmw9QVye11G7Y4FzpkUTSySgsBqtLbhI?=
 =?us-ascii?Q?wF20m/2zn09xXHmTvNYhayClluGgCzHakt1On6sX0ugxXNM4RPFZz37Km9NK?=
 =?us-ascii?Q?sjH76e9Q86kR2BqOK2p4a4KJGBeJ7TXaaTprOnZXvff2Sx36EoEmTm8li2qq?=
 =?us-ascii?Q?0ZytWAavRoFSjsEy6nZ/RXFJqnwFwMoajmVF8Mg/Igxg37zZ4lSJkUw2PI+x?=
 =?us-ascii?Q?nzHppPgadN8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i53OuRBSr4s5TSZgsy7rSZMa91EpOFuZdPEZVe1wdKjF5IoANOO1ERC5IjHj?=
 =?us-ascii?Q?WzVFKrW6xNDAGtnre9X43WmZL0XJPtYiWw7b0eSp4P4BL0EO1uZVbEcN25jr?=
 =?us-ascii?Q?toBWRk4gzBYCQ8pRYrr3iwuwyB6O/bODLVx+6UkOtZ2+hpiC1/IQxq/G2f34?=
 =?us-ascii?Q?S2H5vL0PpcQeUziLBGFg58oABJtiYQaDiWLI+dgcSPu13cpqt9hMHxmhOCv7?=
 =?us-ascii?Q?r6u4cg1cQjgavCVBo9+yOgLf19AyTPQgbJA/fJF/t536x5WPiyzrgdCi0OA/?=
 =?us-ascii?Q?uiWorowTTNXIx6JNHD8Ai6UD4boXfyrDy9IYwBqI3AY9rdClKpkQ0hct0iHS?=
 =?us-ascii?Q?rKj43AXTyENdRkU3qPCBnXNjezpjNqH8dUxsCuaji5S60ZJ4Kexg/4hCJeyL?=
 =?us-ascii?Q?Wr1KWH3ZqGjyNa3O51RT91Nldmb4spWx5J7GTGqRQ9uQF7B5kfWT2nPUEKG4?=
 =?us-ascii?Q?nQCaYwJ4gFIyi4lu442vgV89oWXymsBIy2JRqjrMz+OFluSSOprj9+bhEWCH?=
 =?us-ascii?Q?vy/bNWotlKm0P76saMLiU8hBQhnzTuhxuqeEzcTu/tOHfi6G2IzJRnl2G0Jd?=
 =?us-ascii?Q?5VqdK5zgPWD4BoI+CeyEZ8Arcw9gzJN3R+GKYPQahhWwg8EhhDCSAPqBDj0d?=
 =?us-ascii?Q?PPq6yQ17ONMlZ+flhNRu/Q5tM7VSBDjRfa4x2aWeU0CzEhtiWtE1XnS7OeYO?=
 =?us-ascii?Q?vj/XB7WpshgoqyOKOgCjF/xIE1bDZuph83up66G1iyoHXXwjTK/oY0LqUkJN?=
 =?us-ascii?Q?JrfaySr3WEy37DF8NEvsUeSYjOsiC9TcrfC7Dv8xoc8NSkAXhcuScAeNCHK0?=
 =?us-ascii?Q?vESq/XAeGcCcuPpEvJokB3eysuDhnf7s8OPSwSb3REWkSB7quJqSU6uxTlQk?=
 =?us-ascii?Q?cIM26fslKmZOVSmbyRwXdxhUg0YiFY5zkUh/oSvn2Po+AzL0isToeXOscsdc?=
 =?us-ascii?Q?ftNVchAU5RD9OtivTSx30tIFljgrZUp0AB0C0oEpQA5ojw17DJF5y8N+235C?=
 =?us-ascii?Q?Q/8vNHaJr80OK/1/Mx0Ga0+WkCeaMB126sNfcmErjeBaGiZqlUoDG/lyzhBX?=
 =?us-ascii?Q?AjaHxJLumDEydLx6z9Mi+r1WUOahsvO5bWyMgC9VYuFaYdmPQNh3CTt8GZ9r?=
 =?us-ascii?Q?OwkyPT8iguNBEgDrh5XXdFc8+r0NBbf/+2D2anvoXZizob2VMNqYIMDQbVcg?=
 =?us-ascii?Q?jZSSyU/d6va9Xki297TWoTjRhWJUzzYvM8swNvjRdwFPS+BqlLyb1d29yAC6?=
 =?us-ascii?Q?VSHn1cUM5NJASYp0qVA6Bd0DxxTyJGTRJGNDZINgLY9goMtEHGeOauGLHTZd?=
 =?us-ascii?Q?d5MbH9UU+o/Twv/LjWvphkKHzvgU1FAfqb5YJz9S0WqJio/kKy0HdlfJk/3/?=
 =?us-ascii?Q?OV1p0wyi6cnHzvRhFo76Wosy0CF7R1Yi7HacvuhG95F2pjJEgaeTmEYSs6Ys?=
 =?us-ascii?Q?MG2B/e0Fc5Y5bMnXEfQ8iqH41gUzviHQM6xeOaL6o5CnxXvMyYPxEN8phnwt?=
 =?us-ascii?Q?cCDcLLpCU8hdXpKyKAIq+nlAJgVOIGUROh79nJARxKgzSuI/RrBBdRf6ICq1?=
 =?us-ascii?Q?p8kg7xD4MODxFU+Nhl2d+zlu6k9DyQ4tzAaPdaLR7nzCtwHdI3DeqEQw5C+Y?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d5acfc-2232-4006-0a0b-08dd931c1ed1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 19:18:34.3216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6b9Kq0xsmag9Dc9szpFBsEVIWeKasGlBqGA8fzrcvVV+E2DmPck+zpiBj9s5OFFZ/HsU6r5e//gZl+CjTL/HVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7488
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

On Mon, Apr 07, 2025 at 03:47:11PM +0530, Himal Prasad Ghimiray wrote:
> In the case of the MADVISE ioctl, if the start or end addresses fall
> within a VMA and existing SVM ranges are present, remove the existing
> SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
> unmapping of old one.
> 

I'm quite confused why this patch is needed. Why is invalidating the
ranges not sufficient?

Matt

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>  drivers/gpu/drm/xe/xe_vm.c  | 18 +++++++++++++++++-
>  3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 7ec7ecd7eb1f..efcba4b77250 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -903,6 +903,31 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>  	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>  }
>  
> +/**
> + * xe_svm_range_clean_if_addr_within - Clean SVM mappings and ranges
> + * @start: start addr
> + * @end: end addr
> + *
> + * This function cleans up svm ranges if start or end address are inside them.
> + */
> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct drm_gpusvm_notifier *notifier, *next;
> +
> +	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
> +		struct drm_gpusvm_range *range, *__next;
> +
> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
> +			if (start > drm_gpusvm_range_start(range) ||
> +			    end < drm_gpusvm_range_end(range)) {
> +				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
> +					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
> +				__xe_svm_garbage_collector(vm, to_xe_range(range));
> +			}
> +		}
> +	}
> +}
> +
>  /**
>   * xe_svm_bo_evict() - SVM evict BO to system memory
>   * @bo: BO to evict
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index d5be8229ca7e..d00ba6d6ba53 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -98,6 +98,8 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>  					u32 region);
>  
> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -291,6 +293,11 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	return false;
>  }
>  
> +static inline
> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
> +{
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c7c012afe9eb..92b8e0cac063 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2362,6 +2362,22 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			op->map.pat_index = pat_index;
>  			op->map.invalidate_on_bind =
>  				__xe_vm_needs_clear_scratch_pages(vm, flags);
> +		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
> +			struct xe_vma *old =
> +				gpuva_to_vma(op->base.remap.unmap->va);
> +			u64 start = xe_vma_start(old), end = xe_vma_end(old);
> +
> +			if (op->base.remap.prev)
> +				start = op->base.remap.prev->va.addr +
> +					op->base.remap.prev->va.range;
> +			if (op->base.remap.next)
> +				end = op->base.remap.next->va.addr;
> +
> +			if (xe_vma_is_cpu_addr_mirror(old) &&
> +			    xe_svm_has_mapping(vm, start, end)) {
> +				drm_gpuva_ops_free(&vm->gpuvm, ops);
> +				return ERR_PTR(-EBUSY);
> +			}
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>  			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  
> @@ -2653,7 +2669,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (xe_vma_is_cpu_addr_mirror(old) &&
>  			    xe_svm_has_mapping(vm, start, end))
> -				return -EBUSY;
> +				xe_svm_range_clean_if_addr_within(vm, start, end);
>  
>  			op->remap.start = xe_vma_start(old);
>  			op->remap.range = xe_vma_size(old);
> -- 
> 2.34.1
> 
