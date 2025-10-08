Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCFDCCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4610110E8E5;
	Wed,  8 Oct 2025 21:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kx24HgwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3B110E88D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759960700; x=1791496700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/lrjO5YkM6Giy2wQlx61hQZIAgG4AVhMuxAP5r39srg=;
 b=Kx24HgwEe6giqxNChysDlflC9z2Bim4B/gZQCTC/R7IL8xg7wv0HcFFt
 wUdScAqQLonA1PIvATA8sSZnje0W9faCmH8RcDHnPayoGiyPt4eX4h7ie
 fXcg981BSrbELqKRPCxXORPSD5ULzGVoTxUfwh4dnBlxH7wSfdAvBIoyw
 bqzC2TkrvtI2Y5+gyoZJNpbFDDr8IQhvM3SEr6xvxac6n4PnMEKcSd1ag
 VZWjagAbnYuS4huoHULmJ5Rbk727EDNsA2/mKLSuAV05mxbl/WiUg3LFc
 yVzwLKYBDEPVrvjcGYMMFyt6WX/epXkNgmwttA6hEOO9AOe8fcGBR/s2Y w==;
X-CSE-ConnectionGUID: aPF8AouZS/a+q0ItOJ2ykQ==
X-CSE-MsgGUID: rsnA7ThHRMG3KtPI7ixFGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73512439"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="73512439"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:58:20 -0700
X-CSE-ConnectionGUID: Pc8yb66YTyiv+8bXGltX1Q==
X-CSE-MsgGUID: cFtbhuT7QHqHVcbhme1j3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184929158"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:58:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:58:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 14:58:18 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E96jHkh7ATmK70oXxkeH010fiZcZH1JEZQKAawf7NrexHlR0q2vCr7XqEZoZYoEKhpG849IQoTg4A34jHq6yYOKA3anzrSbtIDHAo+8/Snmu4hwJaGFRojxiuVNPyHX9sJUXIqo/sfVufftr6t52KnS3CGvIOB9lVO+yiUpPXhU8w8FQe8Klf0lNIDTNan877UrclgsTz7YeBEKXluYL/bV0I6V9aV55qAdR8Br9gBfD2CtnxO822yYzwlXRZhsgDeWyjeGQKFE6vJ+eHTVlYvTwEY+S+39vCI7iWbcTjdXhUu22m5zxuhKoNJWq3VupHACSvwH10AEc0/FzPpb2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yt1FrmxUT9dwNfQk5A16OxNnk1HSnxI0bIoxkV/C+gs=;
 b=UAhTsnB/0uDVWS0lcPkybAoCjk1Eij82hT53b3pUfAlQ26q1WKrBhEGc6WKLJC+Yb1aKKRMAD3QmOtQgT+HLCe4cAHQfhNh9El1k/vmSRvw1S3yHbcpIyA2PAYH5GfCwiBVjwIMNmZ5uTLiquyzWRMEyAAq17nKK8ECJZi51qROIgjvxI750+bXnb/+PZ5ZuQeHzlG5HjuUzz5nbhSFCKVecQLuiS8aKa+G2uFAm8UTh0fjedxuHGay1kNUHvrtrpcA0EBJgWg5HIp98gablG2rqrfFbKHup0SWdhp4UX5M47qM9/fWCA+CtRFZwO9ow32hP2jCgLgKs74Nb6hvUuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6321.namprd11.prod.outlook.com (2603:10b6:208:38b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 21:58:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 21:58:14 +0000
Date: Wed, 8 Oct 2025 14:58:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v3 2/6] drm/mm: Introduce address space shifting
Message-ID: <aObec3FqsasCQfbU@lstrano-desk.jf.intel.com>
References: <20250819101119.511705-8-dev@lankhorst.se>
 <20250819101119.511705-10-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250819101119.511705-10-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:303:b4::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: d01c02db-5e70-402e-df6f-08de06b5c7ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dRCC01KHfhHBd9IIJTOqOh0FUI1GrXLXg4jjILmjUMHO+7AHGYCadlpNWHli?=
 =?us-ascii?Q?ClJYUvs6M6aBOSzJOG6A9Dtaqg/D1dc6tlk2BX8K8wEMhLCvOeBRdhk544qy?=
 =?us-ascii?Q?z7xOO6cv93MaLMU9802i5el78zz8Nb1oyf8srO+7Dsg7KQevlCWNHDFg4m8L?=
 =?us-ascii?Q?7Zb0tBGGJ2yae5gOQQ7pfomn7AvvCSzekR54sta74SPJJ2ROEgTqg/HI3Odh?=
 =?us-ascii?Q?ryLICI9jji+coXMTa89+MOJ/GIRNO1t9L2hqSPJqEMjHBpL0MHun1MW/pO6R?=
 =?us-ascii?Q?epdP2Rc4e0K0ssq0NTvjZoLrOmRcFg5cVJnAUv6XaIOGDqE6y+jt6913srcX?=
 =?us-ascii?Q?BM+VZdqEaROxkY0Qn90W5C/DYvX44DLR1boB3Xq8kmur1lP8IHDBRBW46qEs?=
 =?us-ascii?Q?zwpGS0Hx2bczSLnZVJscb3NJMDx7Cl45eyw7oTwJUXRDQDXMJb12A7von7mq?=
 =?us-ascii?Q?RoVEEW9btFSnxkBu3hB3XqTwZIqGngHvqSKKwAStOCtR/G5DvaaLl3Og6lrI?=
 =?us-ascii?Q?5l2iwZ97bd4pIPciP2CdLtJAsdpXWAqIFnNMmCo/cBkv54ZSocm5rWQU1yYv?=
 =?us-ascii?Q?kvyXsoNyTDZ3bVLFJK50huT0oHsuGCz4WeJWOEQ/2buXCo/meFYDKgGyh5mb?=
 =?us-ascii?Q?mz3ALuaoEZovCKgDq+Ck1vSJsysXDUxD2KrXv5Efn8xlTOkBCAZnIMGUegqS?=
 =?us-ascii?Q?lMj7p+37HEYeKZ1ZHjhgZU1ZiN7TSNZLcf4pNHJG9BHwzLzGZAxU+UUX+1rv?=
 =?us-ascii?Q?amLawpWW64g9W2ai5+G5254RMUgsTuw3mN45jK/qgvOQoVUNFwxRPpKEfGJ9?=
 =?us-ascii?Q?od0ULaTTjujP2jtU+lt9X7Z+Jn5jmHhfdKHnZK8oelQpSzaKjsM2dqXXnq/j?=
 =?us-ascii?Q?8olGJCvivTNJ6hHNYROR1fwpeiLIMqeAXYerUZtJdYxTd8BC7i7Y0pFXdEHO?=
 =?us-ascii?Q?89Py/nWYxlaRdhhgj6IUN1CIK/eK69CQlWX1l4ffrY/OO6Shz5YGLzaTPFFI?=
 =?us-ascii?Q?ZKAKi95ASUwbcqFf4+TIyTeB0JkSUH0L6uKu1nPAfFjKcTG9w/LwUsjTp5vO?=
 =?us-ascii?Q?nzR1FvnwgH831MDIBdD0DHzI+SOVYWm1UYhNzqnYVWPNehVx6TKYnRtgUk5m?=
 =?us-ascii?Q?7HLp3vUOGFwikAslEF6tgvEfOnkVL4wFs1YT8bU9ydzDZ6s88g037YJiZo42?=
 =?us-ascii?Q?uWPXqIOGEnFpxE2vlEuLY9DeiWdBpKklV2M31bISfaArv1DBc2Va7+jMViip?=
 =?us-ascii?Q?kLV/5VJ3WSvEuJF3KckUrPlBMJwgz1xGMni14SmOgJC5A3ZV0SQM9WcBCfki?=
 =?us-ascii?Q?iQ4pezqDwoyrbaFGqHNmF6hJ9cvoi8KlkH+aeK6mTl/+cS0meHqPOdGfSs03?=
 =?us-ascii?Q?5wNF1kWY1STenlLFZuGkq5Rz8Ub43CH3xq09/THIzMkK1vKk0fy/1Sy2lmCb?=
 =?us-ascii?Q?jJmyd8ksfolf5GGIOpSroUsWz61O6Y5589dL4NM9DljPRA9uwMIGRQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rZZUpuvkKumHypcS9VKEtCGlMotGpeK6g6t7JCgeDgXjSp2cLdFqDmAfWWIf?=
 =?us-ascii?Q?AFMDC1GnjToWXr/MBD6Z+sfXbdeIor5jVJihBsKR3ihXg0nT3YDnsq3+kC0/?=
 =?us-ascii?Q?jQU/ZKU1W5JEM8NvXkM2IC6qIxpqesvZzTSp66BxTO7QFGu3kxtHPrHCEpjL?=
 =?us-ascii?Q?arPgSkQag1FCvV6p1tt3d2l4L0g/QaLg+ikXJBVA2nZZeEYMNjaACelwcMjr?=
 =?us-ascii?Q?mFyuqcfn/TY8hrmlAINHH6yIFXodvCHYzXIIOUjdGMsZeGuohAjP3PlRKQ6n?=
 =?us-ascii?Q?Y0eLeB0eRdtmqVuAHd2nXhuo0j7K4O0Q/LOSWzDSkwU89oCaazeVX6qw4Aa4?=
 =?us-ascii?Q?dQap74Md4d/+SJovP1lGohHE66auz/NibhScv/1uGcGPONbgJbLOWdH1lEJ4?=
 =?us-ascii?Q?oQZ7yFd2YUW5jFG2TVaVK/TaBV57k03qj8HYynn/H0xsfFDiTGBoK7ujmmVe?=
 =?us-ascii?Q?f7oRtoVL1gvKsfkZO4ILTVLWUdZKYTVoKDDaYXTyLpyhbIt9wjWQFFRfjsvM?=
 =?us-ascii?Q?mNHd0CxQW+R7GTqL++RmdF/CQhD7kwDpSsbGT3c+y/+hoO9SNwqbzehNlgv1?=
 =?us-ascii?Q?VibuJUP3SpWs4THFxh2cb1RKNfs/JO+FtzV1xESMN7GOIyhcMLCPmM5lNBoX?=
 =?us-ascii?Q?0HOH17guWcMPevAKdDK/sN0lNENC9heJ9kpfqVwTAvnfgixiQhsRYLgoS7s7?=
 =?us-ascii?Q?mQWPhXNaPfvFVVeuwfJ+H1zRi1a97ANhSZH6Drjyip1ScI+kKbCJGn+p+Riw?=
 =?us-ascii?Q?R4NBL0OO5yAT1qxvzNT3Utfp1DfqQAioyQm1LM9XvtkLLj4XlCAaAFol+wEQ?=
 =?us-ascii?Q?GNL+8HhqrIahY4BPUGtaQa1+/2YoR9jwtk9nRc/T5ULQ3gEQS13dcM26PuAm?=
 =?us-ascii?Q?qh+bK0hAuNbZrm0eSUNup1ELkLPgPoEief8prZZNEPtozRa+sz6PSBjw25VX?=
 =?us-ascii?Q?U2/xXkftN5zlLXsYWDnuBgvq72w5+QR1A3RphnNCJ2kyqpUi/gF0+6QHFQ88?=
 =?us-ascii?Q?Rdgyt3t5If38rJKQShj5IGZCuTxtValq9LsbUFvtO4Jqrc1/D3M7giGiYkVZ?=
 =?us-ascii?Q?eEJ9UEdUUAcIuLDupf0K39tA8gDStvMyU+JqaiG30r9FygbPge791KheX6jH?=
 =?us-ascii?Q?NQ8mcEprDgszX7FMawlS+kXkBiWGCS3h8kn3/iLuP1yNIm7do2pA9SvzOLNx?=
 =?us-ascii?Q?XsgYCySoI27gEp+xcn+z9WEd95vaif8Hn0YwBtBhzBvqVoG7Ra7uzmOBMz4R?=
 =?us-ascii?Q?VTBWuOPIn+O2ARnCu0Yyt/PCKqLQicygkCIssWGtv1xD94rsE9G1+pdnkEu7?=
 =?us-ascii?Q?0IIQm7eVEV/DwcknKY1c6WiTDatvPSdGLU/6o30d08MRgVIEJbzz2EFX+R/T?=
 =?us-ascii?Q?10lbRLo6HVdaENysm7CWvXWVDehgGPOg9HbIaZjS+qOdgIMxZTxPe8RDxrrp?=
 =?us-ascii?Q?ujcLrRWmoAyuMrflO0U5bTiiYceOSjPMlmYocp60ew4/DukQFGQmT5nuvanF?=
 =?us-ascii?Q?l91httnI26xz6Y3X/4z9n+7BuTSYNEpq5zOmUB9kwVwZLEtvZUtJpFqmwi88?=
 =?us-ascii?Q?gKp6gLUN/DK9qNWvi50AsgfBBrBGok8dYii3It3s3eQVoAyhjnF0EBujef75?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d01c02db-5e70-402e-df6f-08de06b5c7ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 21:58:14.4842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nj27pf76sQSGp6yiKekbSJrr6ybcOG4v7MKJD2ZdgkWgCYGN74GJyvYIZ/GrUL5RofePpsI3Djo4PaIxr/deRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
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

On Tue, Aug 19, 2025 at 12:11:20PM +0200, Maarten Lankhorst wrote:
> From: Tomasz Lis <tomasz.lis@intel.com>
> 
> Due to resource reprovisioning, sometimes a need arises to move
> a living address space to a new area, preserving all the nodes
> and holes stored within.
> 
> It is possible to do that by removing all nodes to a temporary list,
> reiniting the drm_mm instance and re-adding everything while applying
> a shift to each node. But that is a lot of extra work for a task
> which could be done internally without any node shuffle operations.
> 
> This change introduces an interface which allows to shift the range
> without pruning the whole drm_mm instance.
> 
> Having a drm_mm interface for such shift significantly simplifies
> the code required to adjust a KMD for a change in base address
> of a space managed by drm_mm instance.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Link: https://lore.kernel.org/r/20250204224136.3183710-2-tomasz.lis@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_mm.c | 24 ++++++++++++++++++++++++
>  include/drm/drm_mm.h     |  1 +
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index ca254611b3823..ce3bd8b5e41f0 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -917,6 +917,30 @@ struct drm_mm_node *drm_mm_scan_color_evict(struct drm_mm_scan *scan)
>  }
>  EXPORT_SYMBOL(drm_mm_scan_color_evict);
>  
> +/**
> + * drm_mm_shift - move the range of addresses managed by this @mm
> + * @mm: the drm_mm structure instance to shift
> + * @shift: the shift value to be added to addresses of all nodes
> + *
> + * The function shifts all nodes by given offset, moving the address space
> + * range managed by this @mm.
> + */
> +void drm_mm_shift(struct drm_mm *mm, s64 shift)
> +{
> +	struct drm_mm_node *node;
> +
> +	/*
> +	 * Head node represents a hole, with negative size and start at the end
> +	 * of addressable area. This means it is never present within nodes
> +	 * list - needs to be shifted separately.
> +	 */
> +	mm->head_node.start += shift;
> +
> +	drm_mm_for_each_node(node, mm)
> +		node->start += shift;
> +}
> +EXPORT_SYMBOL(drm_mm_shift);
> +
>  /**
>   * drm_mm_init - initialize a drm-mm allocator
>   * @mm: the drm_mm structure to initialize
> diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
> index f654874c4ce67..798e5a4f07add 100644
> --- a/include/drm/drm_mm.h
> +++ b/include/drm/drm_mm.h
> @@ -465,6 +465,7 @@ static inline int drm_mm_insert_node(struct drm_mm *mm,
>  void drm_mm_remove_node(struct drm_mm_node *node);
>  void drm_mm_init(struct drm_mm *mm, u64 start, u64 size);
>  void drm_mm_takedown(struct drm_mm *mm);
> +void drm_mm_shift(struct drm_mm *mm, s64 shift);
>  
>  /**
>   * drm_mm_clean - checks whether an allocator is clean
> -- 
> 2.50.0
> 
