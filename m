Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46A6D262AD
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 00:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918E110E0CA;
	Wed, 21 Jan 2026 00:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3UaeAuZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEA210E0CA
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 00:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768953889; x=1800489889;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y0eVi+u6Q8zRbifjTUiiPrfZn1jeNWSGfEJLQ8et8Ic=;
 b=U3UaeAuZ0R43If+sQv+myAXipATe/qDdzcEQOqTP4sgJVfI8QZn9iyaR
 KFBCYWylNr6/1lTcB5c6GBo6iDxL0fzVfuRhRkdytaQ07Ok1PWA+zRuZu
 fmZtGM6UFcMcHJz+acWmCr7J2+xXFoWEoOdAQPN8K+lqqR5H5bfzLy4vN
 /JCj6d+MwdGlbdyi62K2dsJ41KjOvWz3IvsoWuptrh96OSqeais6hwSH/
 vEYZTiCuP+EgacryoSfhfSXQ7NphKZjpwLMEIrVdiH175J/WsHaxoXtEb
 uIlkvgUXItejFjkHD/lVTixtlMHwJTbYXQibrkg00ri69uRsUazUOg5bn g==;
X-CSE-ConnectionGUID: a77JGAXxRVORvMa8nGCJew==
X-CSE-MsgGUID: hSxrur5fQSaCQlhoHBrjsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70340601"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70340601"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 16:04:48 -0800
X-CSE-ConnectionGUID: 9PfiuZi3S3Kg2gCQSljW4w==
X-CSE-MsgGUID: VUeDkX9URuKoIhDJ24SavA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="237520981"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 16:04:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 16:04:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 16:04:47 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 16:04:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oztemvJ+Eb/wIENyd5Od9kiZ0qZyOJQ2cCFsweNLAHPBnEkl8yaa6eM/roNN4x9yzIaMdSjPfh76Pp7r48ApMbrpfebk4VQwvVgk3iACbqW0yPXWfPVqgmkWkFGDzoBuOED0Kz9QKukJ88bczzfbSIvFYVbfxRrzor0b658nU6uyUciFIBIZ0koNd0LD97d4pLs1QoxDx+GJZ48C/6Fxpr9Zo9EtYe8T+FotrHp0wr9rrxAUCVvmoqUXSSmfAj1/aBVtnRv4D0vBXo8zehEx+knlqW8Rq7Cw6YFx0ugf6uJwCO5OgjzgPWxO1un0CuHw2UyOVfi+qHVYlcee3zkuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcAuxy4ICskZUx/1/JFDA3q+Kkt8qqR4H4Wq/Wsmpjs=;
 b=ZsZljY42ks615WBmWzyDmKiUodH86rdFXpL5Ve1dt/+JZbnChPbffc3cuYRJg9Mg4izSkQJdP6gOzKztKBCmvV2mndPR9Wfuk/9BZmi2VS//aOfCshVBFBoysUKxaxYtG5TM2fbw1us5NQife/gIrPa058GOMJ+8BKGce3uvkmiIkZQlUJZZwanXXWMoX+NI8UKyYO8veaY4+4L2EJEZFb4g5NyOn4+5QzAwlRM+JX9fWH6fybdSqLcxdh8NQWJ7yz+W87wv5r9X8iW7fqlVnQdD2MwwAvrR/kJdQ8LyYWjIRcZE/TTJkQaimEJu5nQyem9BsPpHj0fVCBkis0g22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB6151.namprd11.prod.outlook.com (2603:10b6:8:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 00:04:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 00:04:44 +0000
Date: Tue, 20 Jan 2026 16:04:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/12] drm/xe: Define CACHE_MODE_1 as MCR register
Message-ID: <20260121000441.GM458797@mdroper-desk1.amr.corp.intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-1-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260116-rtp-mcr-check-v1-1-d420b9c1a327@intel.com>
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: 2005f2c1-cb93-40dd-caf4-08de5880aea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?emoPrhdZ50Q3I6jSXM8j0QcqkrKjZIq8IbcPieMyi5gNq/W9tY+awsKmeNO3?=
 =?us-ascii?Q?yoc3PxSMNLl28qXWAn7D1qKrD5c6Ts+tjOSciyZnpz32P9EY+HTelVszykt8?=
 =?us-ascii?Q?BmDOqZdd5KyCBOWCpHDErzRZaT//jcDbPF2acYUItgi/XAksan4ibcerPXR3?=
 =?us-ascii?Q?okJ13JKeC1buFXVcl4GQ5NEtl2uDlr+A52QWnwI8DpXMn3VRMh+9uhCp8QmF?=
 =?us-ascii?Q?PtEgW9g/Kq/RPhe1dRa2EllKWI0zSLEcGZ9u9qTxqFZTQiomNCb0eRlVUqI7?=
 =?us-ascii?Q?vuEILtrORaZwLZB6tdhfkdQ4XuuW4xDZ5Xz27H3MMN+2dDVXdbRvfVdnJIXo?=
 =?us-ascii?Q?0Hkz3wYKEI5lItpUtaWXS9PtJC0fgtI1wqZe47QyGpj1wTSVu5Oesxp4KUHb?=
 =?us-ascii?Q?ntoGgHvYES0eU1KFx0SNTmwyE2cQY1JbTxqrxALgVtoPKcdFSB0BJPBiAyXq?=
 =?us-ascii?Q?Q23+wQ+dgI8Dn/aY0z34PJumCqhmodDUQLg75PQCWT4Y1QgYVErYDXaWMpM/?=
 =?us-ascii?Q?yaftg10qKlR9bHBlTvKuTy+bsQMyuvp2IrWAv+A75QTBC6f69gYpoAE+nZLW?=
 =?us-ascii?Q?ouPcXew2mD7pMvg2mAYBm8+42LyxAr+uG19dp8NMz+uJjoE1PEXauUtH+748?=
 =?us-ascii?Q?fytow60Xf/1qB+VReV9N/AEnCovUYwQDOOmPFUOasmBPGE+CKqzPYyDQstlB?=
 =?us-ascii?Q?GOzhnfu9AuJQwGfX4hpRWKKCA4y3JQ5h4nGMKDjfRIQOPqQxzxvvIPUWFlSN?=
 =?us-ascii?Q?Wdwq/OhGU4wMBwyY8LIV7uXpOqzy2n5ziLU37tHVEp/iYFMyhivg2oIvp5VI?=
 =?us-ascii?Q?3hLezocxcekUcHyDMO1QVX9EBVqBsxvuC6HGhvD4VdNJ3Rtg0LBFKmZnu7Qp?=
 =?us-ascii?Q?FBwSSUCy06u+4CSnILSRwAW97fcrxgMKdxJq6UIBiuYlyrqPXGThfBR7VUW4?=
 =?us-ascii?Q?/tMHhx/wtNHKQelqo6CDn/A9jYzHsLFEzoHO1YGcjVSjvqug69YYI+j4QjTu?=
 =?us-ascii?Q?puPoyDJ9EYfcFHeaBtdJBgLyvgH86jbSToc/YWAVz8ofWGj0EZMg583dE+R1?=
 =?us-ascii?Q?kVZtHAwmHqlxiAqjc71pDEJ8d2kbgY2qvl9vnXA73wt12TANhiMzJSvXSP5j?=
 =?us-ascii?Q?9BwUoIOPxGDjXHHOrB6Vjp0/8JJXCfjkDdWjxrVOo6zPxq3h9p4N6t4zWqi2?=
 =?us-ascii?Q?FJX153mVqVGgwVWFQ3oQBfsw1ShWUz8591+H/VH1JpIchgtZu/V7UYN2ESbU?=
 =?us-ascii?Q?J8PuQqdOTwoN7ONiK2U7hgwaJXrh8TcEo2pHlTIPEhSw9QE28D3zDrI0/RtF?=
 =?us-ascii?Q?3ntoNcwrnKBVM4Iyvh6xaX1SuhQabShHiGKMgkF9N9wPFCS9GBEIa/SLwKZf?=
 =?us-ascii?Q?96ijJ9lD7MIG+Uty0e+ZCPKsv+i0jgKCzV/Q3iZT56vyzYDimjnZ6seQfBnF?=
 =?us-ascii?Q?s8YuTjy96c1hOpSHX8xxwnLrry4cDUxehaoBIySCpzTytvYENPgahoG+FW+N?=
 =?us-ascii?Q?uOuoVecXCE2ydWw24+Fi/TXl/Mv43b6VCGg/P9zofATK3KtaUgeI/AcUfKu7?=
 =?us-ascii?Q?eb4elwZLSst+3rx0Rzk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IIykHQWDcfSSMcjJmdj8y71ZGQOjEAni9csJkhEg6i8zDna8Ir8WKQu4Gbd7?=
 =?us-ascii?Q?cH/J6RsD1OeGXtNsGK3Q1V5xKZtmnPba+SPJefT7aXsj+/e5qaU+XEqEdEWs?=
 =?us-ascii?Q?5uYVlIPrI1I4g/91eNeB0J2O2LaFVcc/POaloLJmW6h9G8w8bLRVyB0fPVxl?=
 =?us-ascii?Q?QJRkAFgi5xBOPg/6uHQ9q8uY/tB7/3SDda5sBN2D8bk0vwezkqpr72M84CLe?=
 =?us-ascii?Q?QkR/1ZI1wo0jR1+GJfXHkawQvmdt7hJawzc9L6/rwbso2t+NgNjVuAx1I0Tp?=
 =?us-ascii?Q?JHkJQsLwCAd/QY4FOLFe8s3kR76HcLuvoRac60Z/SuxnTtLgzFWnh6ddGIwa?=
 =?us-ascii?Q?WibHTPu8zP7+qYgfu2VoBAc+/xQNEa8eQo1V6DAssVg2U494DI19q0v9juVq?=
 =?us-ascii?Q?fxy77NH0WfqVwMZ7K5PZaASL5+Hwp0ncLNdN9M4WjSsWvvY4GPoauk7IvMZZ?=
 =?us-ascii?Q?U3qswA1/h++MKt5/inCLSgGipLL/WFOcnW/fDwHDfxWTshQ10cvSY7vbgaQG?=
 =?us-ascii?Q?dMEqjLZqyr/gxuewUuR/eCPdC6+68NPKmCjPaGTwoS+1sGA9gcDAfbD0AuTE?=
 =?us-ascii?Q?Q3jWcA7l70l9OfB4pfPB2D/mfUS68WbcQYMpRbh9/Vp7/Pqh+S4FlmSXLGPI?=
 =?us-ascii?Q?fg24UKoE4JROrwKs5UhxKsznx5FjUEpjfn3cDwo99Y2x2j+flhQTk87Zf0LX?=
 =?us-ascii?Q?CqFsDcYujcHraJmjJvYA8Tii7HGQ4+ikkmVYWwtoDNXp1UW914hCB8I3v55T?=
 =?us-ascii?Q?ynj1tEJ+CSM4ckFlsHEqRoGzTask0SlwpQFP41+WCSC/OU7OTOw9s8t4yrZp?=
 =?us-ascii?Q?A9q2mBRZOzEPp55gILChNYK6RqsY30ZomLkkiblSsraZdIB0dgFDyLXkPVhJ?=
 =?us-ascii?Q?FT2sOesOj//XDhAgNwbTn7+hNc7L+Vs/WpEIP1BWfvC/pvJV5CsrUcHwJi9H?=
 =?us-ascii?Q?QOUOoRWw0o6Vy3h0j3KtlU9Ow6DBOQhUo44MXSJ7Gqi9LBVbiCqmWHViUjK8?=
 =?us-ascii?Q?vD6omgPW7SaAfxT5DMyWG20WyysGTKXNIc9Z1KyCKXo+Q/Z5Fd5kTlwB2fL4?=
 =?us-ascii?Q?kd6wUr8cMNy2pAbP1QMS6fGE6q/qsLUfcKe2Pft9hvezNJf/AlUGdAMxgDtI?=
 =?us-ascii?Q?w0DaH0DIcFXlTZTUAyoUK8AvI2o1HQ82zPGcXszDwN+2T+hgctUm2Z2AWAC/?=
 =?us-ascii?Q?81zJuQjIS34LMsc5XBhgZL2T8oFu3eZRNnStnBdLSk55/To0TO9hWVh06TsF?=
 =?us-ascii?Q?E7syr9kijinY367SJcMpsQYIjKFz27NUrbLO/RTRUKEUUbeFA2O9hLYjfCRT?=
 =?us-ascii?Q?BR8SrChDJINUO9Fdk9BGcXljPC+Ql8R0gryqQvJlsGvAvLOYNhn2x4J4zcCB?=
 =?us-ascii?Q?tpmKroA52w1RqTCcmHT/+TVY5HBbltIF2wek4un60zM3Uwx+aJ0jTLNEJlR+?=
 =?us-ascii?Q?M7VT/txT85ELfst2VawOBjinuendZ/3iS3CAzCHqL2Gm30GciH4ig85J296g?=
 =?us-ascii?Q?LShrGB9D/qxMrnu1MImcoSA5WeqOuXGikadAkqvjpeF8asOzPGOpDeu/wPeu?=
 =?us-ascii?Q?4scn33jkdST4GWqRlEuAqFXw/scTLqiJN2mP5oUhSbY+6h0zmD493YDiLBhK?=
 =?us-ascii?Q?W2BQLuYuFNOT9en20xEDAG8DFtiwY+8xgLrRgrhH20pyjh59dB/Vd+WnXxa6?=
 =?us-ascii?Q?Nm0DeJIF9LwjjavbN/ITSm7kKlx3rmtpuUZ2YQH27q5B7fhAK0z5Jp5Z6K6y?=
 =?us-ascii?Q?8rPx6v6DfmyIGZ/N/XP8K7NBT7XPlxQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2005f2c1-cb93-40dd-caf4-08de5880aea4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 00:04:44.4309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQqcf/ka47PWMOXkFO+ng0stwa08LLbc5A3uX6jyMC1FFJk9SVQY2raNWTR7kVXKX+ViuweOlhEOmWrUmr38fpqdfBHyVC7akrg0DrgfAUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6151
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

On Fri, Jan 16, 2026 at 07:12:09PM -0300, Gustavo Sousa wrote:
> CACHE_MODE_1 is a MCR register for all platforms that currently use it
> in the Xe driver.  Use XE_REG_MCR() when defining it.
> 
> Fixes: 8cd7e9759766 ("drm/xe: Add missing DG2 lrc workarounds")
> Fixes: ff063430caa8 ("drm/xe/mtl: Add some initial MTL workarounds")
> Bspec: 66534, 67788
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

It looks like we're handling this incorrectly on i915 too, so we should
probably also send a patch over there to split out a separate definition
for the Xe_HP and later platforms.


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 24fc64fc832e..bc984dde2773 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -141,7 +141,7 @@
>  
>  #define XEHPG_INSTDONE_GEOM_SVGUNIT		XE_REG_MCR(0x666c)
>  
> -#define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
> +#define CACHE_MODE_1				XE_REG_MCR(0x7004, XE_REG_OPTION_MASKED)
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
>  #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010, XE_REG_OPTION_MASKED)
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
