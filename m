Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88554C369A3
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391F910E549;
	Mon,  7 Apr 2025 18:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1wMl6I3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7381210E549
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744051852; x=1775587852;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dyuSbBxEGllSOGbf7Pla6zeRXsDJdEpYR7Dp2S7Mz88=;
 b=a1wMl6I3A0Oa6jQvINPfnuBL/bdF1OMZ0CsjLpQ/+NDRCTSFdzKCA+Wu
 WWiHmHebEUqkuBeqiNg6mg7pl2m73fPZabo7Y+KxyfuiGP3B0o5pgxyig
 X9p5OP8+1PsquTA0g8XYTwUFDgyJgdMbHH95vuoDt8z/qpdPlBj0kvFsu
 34H1xBGEmmCG9Vk1MCQlW+fcbkvTYK90J8EqHsexSZ5qdk0gN+0LGQOx4
 qTCSWOt9DR0Bz7R/zjPyHeMMUpigxzsDM3UJ1W3jRjHcqTffOmO5qceKR
 RqTy6yPjIR1ntGtOOhgQgm3lFOLM/+XIKBZDd2RNR5NqEVKxQ4LoASUPZ A==;
X-CSE-ConnectionGUID: Myfh7J29QVGJa0Uy1g2Svg==
X-CSE-MsgGUID: ypxV92QoT6iSPlVjqgpwfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49111724"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="49111724"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 11:50:51 -0700
X-CSE-ConnectionGUID: JcLchJLhQ1WK0kiW2Ju8dg==
X-CSE-MsgGUID: orh6xXK5TOei/CBFx0IxcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128970898"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 11:50:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 11:50:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 11:50:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 11:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWVGW7K+1ZgybWF4zwpFoKyvkY2KD7D6Hqm7lukKCF9AufGuDsh8YUC/M35NkU56ugtjPDtSe9f5xPQKPMBHrlr4uQwDFwIMrk5q/dAot141k7CKoGN5sey0Qe3o3G78H8o4bJNyGe/UJLZTCZlgozw3NL+FqQ6b6HqEXnab1DMM1JwHvmoUdeZrpMu/j1wZDNgc3DlVdxPqbx2b35gYH2N3c6DOvPffxRtMBTgBAJqIg2rnHzqwh0/o1Bjp/Vcz5ZvM7uNhGNwCCUMTxxGJSe7y4LeDKBB+rPnQIkENsNqLYRANm/2dXEmnCxDrZXhNM4Xw+wJlLyf0aIAEPHLUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H69dtk5VsIidBHg5LPzbntPs3s6MUaw5HNiuaONhNok=;
 b=Aui3cRZEh+FrC/oAUA3H1iH0v56iXUSIU0TlD8r8T7iiPMO5wBXwPrTNoEA66FM1206oZv/hoY2c6+oQkF5WUZZQdHbjICNrywgnDgSTO6/zLx21aWQTPw0tYOFZOKSh4vcB9gzbB6h6+FyLRYBlYNZmry7SH3wRF/Gzj2/c9R5yb4J/GBzSS6D62IUSI/wrUba1s4H97DhLMe7AmUSSEMsNGQZ8WX99/MMb9qfbm/aKdEn0NIXnvPvNArhOwrcXt9krBIwryViw//hCBBcTqSgVpD2tdjcsYWhQ5eaKMy5vcTjK7FAQad5zSX0Ny9gvxkxC/wPpaqtqpZYnU+I7gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 18:50:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 18:50:47 +0000
Date: Mon, 7 Apr 2025 11:52:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Ensure XE_BO_FLAG_CPU_ADDR_MIRROR has a unique
 value
Message-ID: <Z/Qe0+raVor0/f/g@lstrano-desk.jf.intel.com>
References: <20250404220053.1758356-2-matthew.d.roper@intel.com>
 <f875d21f-42d2-44d7-9403-25f5ef067849@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f875d21f-42d2-44d7-9403-25f5ef067849@intel.com>
X-ClientProxiedBy: MW4PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:303:b6::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e457b9-22be-455e-0049-08dd76051c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u5S74rSiIA7UV1dESsQdGNqJHKwDRLajJRM6HAICyJyTl5W6gZoHiqFULfvq?=
 =?us-ascii?Q?HKwOh984XzCsIuhdygt7YTU8z/Uk6+96IanjIdQck9+vI4r11rsF0ts0yhmf?=
 =?us-ascii?Q?b+AEvdeF3ubwJ2LDJlMtM7E/Ublu7jLDbAED2LDya/0IEDez5Y9tR3Eu3XYI?=
 =?us-ascii?Q?W4Gwh3lKB9UYKScq83u8/oFpp37w9Jwh56pu+Ioeh0mlx/K0bgHu6b9pWrJy?=
 =?us-ascii?Q?mewvdYWzJNqcp4OybbG+mfrXo4isdPFCNPBW5HMp4uQFmoXoFsEjOPNw9V5V?=
 =?us-ascii?Q?uYpLO++ItkTLoXR1PyNnSnc4cj4GQ6nEROcb2gXgQrsLlpv5kT8lVglJK6CU?=
 =?us-ascii?Q?jVXKs6CMhS67tYqEiwlNZPhvKtii6iKQa96KASckdwIa+tAeQ5P7+vd0kFG2?=
 =?us-ascii?Q?5fJuaYYgFMdonJ/EsYVDqBUPy5QIs+hvM2iJObnGl6e79t2omq7+fx9BlUlT?=
 =?us-ascii?Q?mCTLDcMDkeGFi9x4Kt1O53LvjWTTX4mbeBrlwkwUDTL3tqD24r8A1Ln12dnX?=
 =?us-ascii?Q?M12f6s2tcZ2gUGPzC5maNnIe23foZzPuE6wqQNIgO/BbzXA0wRA3ojl6dTd1?=
 =?us-ascii?Q?lZLMAn93uwIQgzwBIW2liCoirvdqGzkeTye5/vzU/y807cwzUsGhBD7Top1n?=
 =?us-ascii?Q?RSabkRCsZy3TcH+scfN57wShiOFVBX4dzrZTLEDUpEmAZi9MUs+hdKiINxEL?=
 =?us-ascii?Q?nDiu8X8tbtV1TSct5DEvavfkxq+92TrfC+CLhJ/S1PYl9bxn0PFuvd0Hi380?=
 =?us-ascii?Q?/Y7GBIIwhWT1Ggl5nwP65FzYp3T/4Eco7euOYPwtykQnS3SgfffcmWI2E4Eh?=
 =?us-ascii?Q?ZopmjCxSuM5vnUUJWoVy80wWSLp+dTyE+5vtNv/peswVb9ah2tcOAEA8Ymiz?=
 =?us-ascii?Q?82fVb3MGAQiagSXzX7cZnSsXlOgHaQrXgxixyTjQ9HFThi5KdEz46hLRE6Bk?=
 =?us-ascii?Q?B/MWAtBIxGZuTaS6848exiYuYV4ohoa4b6AcnXeQPHnc75Cgdl9NNOL1/29g?=
 =?us-ascii?Q?esb3ipv6bLvaAolDZBmwBMJ2hbDCBeS+FDyC08QyM+mcT/RL//KEeMNhHyPO?=
 =?us-ascii?Q?deqiAhiENnWUabxh7eo+zMMkI4kt1D6Qwd/ebeQnbDzDzuzmLKawS8HalYIS?=
 =?us-ascii?Q?PlRtzIqvWiiiljQPkuuHhIlfFJu/xS8eByWcR4qOuDa0Ors2XE3ibNWczWVb?=
 =?us-ascii?Q?euJGFnQs75LlZ+5WTMl05vYafKOoIWXTrzIG8fhJ308rONLgImfo7ksRUwX4?=
 =?us-ascii?Q?HR6X8LmvGNkD3SuL1ziKwDJE09RvJ77SAK+Y9ONubRY4INNdSF0wNud23dyD?=
 =?us-ascii?Q?ZUTzoWbcrstQV43a5OM/jsWdEQq6LFWEU00EoY/cxtzZOjzX9EAF3MHWytrS?=
 =?us-ascii?Q?vPlHwprHWhMCwUGZCrlcbwGYnAjT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yu+JSuupcJFltjxWmm31exWN2rYCrSIcgdbvwhZQT1VCW2IbnXurmhLCHVIJ?=
 =?us-ascii?Q?9qRo11msPmbjGalZl253T2/f8cFYfhwN0mQx2PLgN8wWynTwx+qnAtbBXn/I?=
 =?us-ascii?Q?R8FXeOJDfd7U4afciGS6IjiwyD/BUgoDj88FOnzQbMVwlxdq1sGcZAsSxZCl?=
 =?us-ascii?Q?jKHFITE5tQeBmKn3CfnSEwi5OvfCkorVYhSbrfDF4T3xfRxG4YyegxLe1FCq?=
 =?us-ascii?Q?wWrSq7Qy70wBK7+SGBb5snXBWTcQ7K3XwpLcVAUFqzk89VTJ00X9n7iivj+V?=
 =?us-ascii?Q?3Dst6c7lcuFNQTnyLzfxv+65uCysIZ0khguP1ykpgRsGv3p8BsbczNGBrKYd?=
 =?us-ascii?Q?OlnBsKLaXYH5tqOwnU4OifL2Q6hQ19MUJmTOPWBcaKRGUg+h35YBaC5hYEyh?=
 =?us-ascii?Q?JO/DBPLeFeQfJ8p0eexlbt2REqgClLGuVCUIvZ41/EQZyB5u1IBmjgxUnaNc?=
 =?us-ascii?Q?pekuL60fdvbmiqLpNqzHU01Urntsb1nx7KqkOBgP+n6czxbPk3IOBhPvcWAf?=
 =?us-ascii?Q?qeiTAtvWjJ5Y6QawwEgj3N1nSCJvnxe3vpU/Vo63IYZcD9oiNW9CQAT8WKy4?=
 =?us-ascii?Q?3byxS2REszK47o1VcZGfLwwHaQEo7J/bWeITCw5mS99JUpLp4ZQD8iCCd3h8?=
 =?us-ascii?Q?OskqQ5hgP56jf5d0qUjCuttiSPqKZI0NoaZmM4aOw9gA85xTBGaEu6b4IiJZ?=
 =?us-ascii?Q?LgIF+SVXszUEdNFEj8Q5fbIUhX/GxhKzRCeUU4GH3RVo5xmQQVcEKI1chwiF?=
 =?us-ascii?Q?AGc6Nf2qev1KPF4RaIE7QFvPuamaYXM0mZlq7zl3EOPAaYbK4/rTkysJ+DYQ?=
 =?us-ascii?Q?KIjA0RJQwliq26kWfNdmSlziUj+Un2NwA+DjOICHlg+6X07Z0mGqPBE/5Qdz?=
 =?us-ascii?Q?urlISeorQVC/09G8x49IFvo5TQjvMSAIUpN5W+G0NQ9L6sXtoSJ1S8JXhdeL?=
 =?us-ascii?Q?0oKoGZXb1xxummHcosVyp0eL8rOcY+79jO7B4ledWe2WuXg6rlxsp/Cwpufj?=
 =?us-ascii?Q?4peTaeZAbdn2gL7xpjAMmGrQ1qSDOktStzW5XkhnR4oY6+U9BArMGKpHLapC?=
 =?us-ascii?Q?I193Xe0DjQ0HJAb32yZn/38ltocZrxSqkWwJlFufyI1aB+f8bfsiHfEqiQoM?=
 =?us-ascii?Q?NmA+HnVE/t5G/Sa59BeadtKmUB0LFx0IjcKQ7lEtZf0IWW6uPMJVDb1Jhgsz?=
 =?us-ascii?Q?3GClC1eCkjYQChTNnuGDbCPD5HjpyD+CtXhCFWgx/Q/UlF4Qegk6sRbwez9P?=
 =?us-ascii?Q?Ost8zXmIekAxk2TvBH0wna+mmE1V95HEISTr0oOb49Bql3yucoCtvG4BeFBn?=
 =?us-ascii?Q?Vg1OsdW4UajCXYHhCy39mBysAFNq5UBlwLIIjAD5g1NT0v+DCoa97CgLiQ9O?=
 =?us-ascii?Q?pTZbXV/w1E6nEmogg9jRB2a6Q8umP6OqClP1kbMx8Uyl5+m07vtHP+RoBcxi?=
 =?us-ascii?Q?7bpckieINdINDegFtb0PXGwIlYbtraqeGo84uv+WuQvFJljzk5454hdjTNVD?=
 =?us-ascii?Q?lo7X6nr1Za9ATRFjaVAo0J3obKRvNyC6bshULPSW2PI6pZx0jIj2B0fJrDaS?=
 =?us-ascii?Q?L6BMkzKJydgnXItRuZ1nHXqSjjwJSMEyNiaWY+H7mGC6Zt/WnfeRQhRm+CJ6?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e457b9-22be-455e-0049-08dd76051c15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 18:50:47.6857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEyLjfrIZuyDkGGOPrWfdwky2EJHXsGhe/8Jsngz3skN82vLIRkqxK3Em2aEvh1BYKuVVpfLWu/30DWwy3zMJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
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

On Mon, Apr 07, 2025 at 08:14:16AM +0100, Matthew Auld wrote:
> On 04/04/2025 23:00, Matt Roper wrote:
> > When XE_BO_FLAG_PINNED_NORESTORE and XE_BO_FLAG_PINNED_LATE_RESTORE were
> > added, they were assigned BO flag values in the middle of the flag
> > range, requiring renumbering of the higher flags.  In both cases,
> > XE_BO_FLAG_CPU_ADDR_MIRROR was overlooked during renumbering because it
> > was defined below XE_BO_FLAG_GGTT_ALL and thus was not immediately
> > visible in code diffs changing this area of the code; this resulted in
> > XE_BO_FLAG_CPU_ADDR_MIRROR clashing with another flag.
> > 
> > Assign XE_BO_FLAG_CPU_ADDR_MIRROR a unique value, and also move the
> > definition of XE_BO_FLAG_GGTT_ALL down below all of the individual flags
> > so that this kind of mistake is less likely in the future.  Also, while
> > we're at it, fix up some space vs tab whitespace inconsistency in these
> > flag definitions.
> > 
> > Fixes: 7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")
> > Fixes: 045448da87bf ("drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE")
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Sorry for missing this,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 

My bad too.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > ---
> >   drivers/gpu/drm/xe/xe_bo.h | 21 +++++++++++----------
> >   1 file changed, 11 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index f7e716f59948..0a19b50045b2 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -40,21 +40,22 @@
> >   #define XE_BO_FLAG_NEEDS_2M		BIT(16)
> >   #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
> >   #define XE_BO_FLAG_PINNED_NORESTORE	BIT(18)
> > -#define XE_BO_FLAG_PINNED_LATE_RESTORE BIT(19)
> > -#define XE_BO_FLAG_GGTT0                BIT(20)
> > -#define XE_BO_FLAG_GGTT1                BIT(21)
> > -#define XE_BO_FLAG_GGTT2                BIT(22)
> > -#define XE_BO_FLAG_GGTT3                BIT(23)
> > -#define XE_BO_FLAG_GGTT_ALL             (XE_BO_FLAG_GGTT0 | \
> > -					 XE_BO_FLAG_GGTT1 | \
> > -					 XE_BO_FLAG_GGTT2 | \
> > -					 XE_BO_FLAG_GGTT3)
> > -#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(22)
> > +#define XE_BO_FLAG_PINNED_LATE_RESTORE	BIT(19)
> > +#define XE_BO_FLAG_GGTT0		BIT(20)
> > +#define XE_BO_FLAG_GGTT1		BIT(21)
> > +#define XE_BO_FLAG_GGTT2		BIT(22)
> > +#define XE_BO_FLAG_GGTT3		BIT(23)
> > +#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
> >   /* this one is trigger internally only */
> >   #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> >   #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
> > +#define XE_BO_FLAG_GGTT_ALL		(XE_BO_FLAG_GGTT0 | \
> > +					 XE_BO_FLAG_GGTT1 | \
> > +					 XE_BO_FLAG_GGTT2 | \
> > +					 XE_BO_FLAG_GGTT3)
> > +
> >   #define XE_BO_FLAG_GGTTx(tile) \
> >   	(XE_BO_FLAG_GGTT0 << (tile)->id)
> 
