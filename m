Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D84E9A05F
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 20:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697B610E748;
	Thu, 19 Feb 2026 20:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPyMNvU9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C5810E748
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 20:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771533620; x=1803069620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=It4PtUShL7Wg26ndCX0K0aGkFSy7Z3+KSnSSg1ehcDg=;
 b=DPyMNvU9ThOi2Pz4dbi9fQlx72cnowqK4dlkfH5www+hfm7OcEElJBZA
 GFpq45Oyxj3idN+Mq5X5pSRMYwkloRLJ+biPpVyYRQYnmVtwDdFNX/AFU
 0ZnfUxGTRsIY8nyZUTVcpvxRlCwbOWtJ+N7wUDlt37chEsb912tgKYWmC
 fvlZ+tD9gqbqjR36ivnIHfXVELyHvDAGofFhZ0DpWBM0cqafmXgmMcGUL
 +vuahkbGh2S+mcPU3OCDkzg2JQ3Jn4kIjJpPlXF7XOPSLq3UE7foxRbSr
 V8PP0NJXxVynTJn6oLso9zXONogK1Fq7+RL2KtT5kITs1To6WoK0KPPUu w==;
X-CSE-ConnectionGUID: 2asZhe1yQhGDu1fy70Ij/g==
X-CSE-MsgGUID: HoTC6et9SGGk52WZFzIdBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72807645"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72807645"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:40:19 -0800
X-CSE-ConnectionGUID: YUFveWEISp6vgiF29vEm0g==
X-CSE-MsgGUID: Tn7pTHgqQ5+14qR2sAgQSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="218394207"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:40:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 12:40:14 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 12:40:14 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 12:40:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALPI4JmbU6N6F7c6rxn6TywNErrPS2ZjTPPL0QVyM+unM4a8Rh9kitD8GHK58Did+BVY25sCm092wSi1UCQBHnkQsy3hN5RHLGjfPkmD80uJ8QqGkzEE6BAPQ034lLEr1D4Ye+nkCXj1Sr3C3rDX4THP12Cu5eiG5MShlNixjq+4u8TZ7zQYA8WiDtjZ/gKGqWKIGHmU4507D9v8E5v/Kkwo4zgPOApclosH/9ruTdF4nDucR5Cop+dqKyvEcYkcRdsat0cwrp+0GeM0pMC7WUpb1L6/8xeG2qEwL+QgGJutg9yHGPvan3OMXWolklZKMvczet4UAcx4xwYZXgs8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DY3h1fiZIr1o0Q85ASMGIcIIVDQlT9aSYYnginy/AC4=;
 b=DUzS8LhbnzvqwH8jJR/PWYfJT/XBs4kej5tofDIDHXwP63fmySPsXwICRnHDH9UsLCbwRpsYiemOde3cWPbCBxxorW/BNq27jiq0rAw2oXDWgYXCZ+S88gbJC/e+i3sBa/wIRMeGEzxjI3G5tLuwjiQr4k7wblKWvJ01p5VhVpE2x5+LW/JLpI4bJ+bDytZc05yjSKjsOWAH51juunrqMqwvQKtD5zJ1LyGEPK7iq/L91OBQjMehCI3O/S2/zfooMV6MbVUnDsLOMusVHTVsSp5GT1n7FNAODXG2Ta9bJxv7njNjAEhQ+X5Q8ELDMMw5wl7RrEyUsuoye4fkI4DBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 20:40:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 20:40:12 +0000
Date: Thu, 19 Feb 2026 12:40:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe/vf: Wait for default LRCs fixups before
 using
Message-ID: <aZd1KlxP27XeaH6w@lstrano-desk.jf.intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
 <20260218232159.1726873-4-tomasz.lis@intel.com>
 <aZdvsX0+ST//Lk3B@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aZdvsX0+ST//Lk3B@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:303:b7::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 2577b681-1226-4861-9652-08de6ff7149a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7UEmDk76BPOPUTK9fwwpGCE/bU5YWnUBomvYD2zn0dpgYJN5I2ul1XB1FbqC?=
 =?us-ascii?Q?LflaMIcpyp84mVWP/tLFWXDmPRjgVCAF7JFxitxoxSTupRY3a7X7X/MABPsH?=
 =?us-ascii?Q?2sIAer2zRP3CxsLWWHdeMp2k1AVn4rDLf8mQTwdHEI0fUkI2YazX3JjRWT0N?=
 =?us-ascii?Q?4Sdat4fKJTdkvbAfLU74U+ReLsJVaZZP1SmqWFTRZJryxky8TDhUOHh1wubE?=
 =?us-ascii?Q?q3JROQe6HtSBPUygUqLcogBGKe8pTIvVs+zqpIPnIYgK1XLOlQTOqgGDy29t?=
 =?us-ascii?Q?yEeLxWMqc2nM9jckEGafO7Nj5ILDkrqxsqPy5W0gSXXRljXDXM0ViDfNQHG8?=
 =?us-ascii?Q?5RpYBDY3b+VModbq2XtKQsCtxjhq5Bdc9qKEe7AW5u+LiZuzV/m5jM7ZyH8y?=
 =?us-ascii?Q?sq2HRjmsGoRZtqGH8X1JfET6BMUVzo9ttlWFnIUpHMF7z//CgPHldOr7sEOB?=
 =?us-ascii?Q?ZTxrBZG9O6rGKZ5oXYHWMMYgeEowoCUAo2o8ZxpuPGpIINK3Tu7WDzHqrcXq?=
 =?us-ascii?Q?6ciNbaj0ywDmPTdDAZUr0SquU7PSQQr/kkzcIVelyWgR5/Hw+DnWK1z4frtW?=
 =?us-ascii?Q?LA41LAFJ1sT5lakStMfXab5WmnLGuTifsSb08yOHYJtBKS2RhC5E8Lk7QpJy?=
 =?us-ascii?Q?XfoaKxGVSB7Se1vlWQe4Q1vy6mLKRhHm87li3YRcYC9h2RrBPLXz9zbXhD/K?=
 =?us-ascii?Q?i0vFNrKzWlw71BdVnfY/CIS0lOGNXpA/iFltgBhs30UDHlZjwr29c9ni3Qv3?=
 =?us-ascii?Q?UT7hZ45MBcwupy9yrGywyuKf8AoOlqHrf5HCMESXRE55EWia93D7x0CZFDeO?=
 =?us-ascii?Q?09Gx53a9y3+L3g+fME8d2DKYi8b3Dyhu/NbM7yOm+MngfxS6dkGP6/pMWdCB?=
 =?us-ascii?Q?IC7yL69eP8pD0RDiHDgqCxsu0Wk5jpM27PuXaFWj4bym1zkjTFSErCMGroHm?=
 =?us-ascii?Q?rDfBYbrhwG79kwxfMZOKSWWXjNFxeo/KqDqbQADjqNIvi1E2qmed790R1dZL?=
 =?us-ascii?Q?ClWk1OiwZyruw1+hg4Wnw4KYIF0n0evpc5l94Kbm147agXdPUTn8ecPjTVlB?=
 =?us-ascii?Q?ff19DcFHJmEwV0n0OyJxZ9Z9JLaJCI1VUSaki4uj7p//uz9Wb0Nlk7Q65+po?=
 =?us-ascii?Q?r8l/IfSMRgte5U9FK5K8YWv95fqjWdl4jB2DcOyCzvqe2rYeUsoA2LIBmveE?=
 =?us-ascii?Q?l+oj31YecKGufGnlCYwmx3Djese+liYMubyjusDfNT1NMdDUYJvOdELUO0IG?=
 =?us-ascii?Q?/y8ECTXOca17bZtIIahT0NEtxF75k8KwujTjlava0Ugfrd9MdUxR7d8R9Llw?=
 =?us-ascii?Q?q9CjFgYquctRA/faCkkHeLZZ6wB3b5bDSkLZQSWiWke29uyGMNEyc3Fxxoat?=
 =?us-ascii?Q?nRkbAC2bpnsyNbh6AaGrKSiYH4hpZ1+kGvKA9slrShXPdY6z9glXeGPvc9HA?=
 =?us-ascii?Q?OVNs73qtkcWlr9pLQelMrXBGhuy2eIm5MJ6Z4AVuTZy1QkLBYp21AoH6SWvJ?=
 =?us-ascii?Q?PQ1zMHZMKPOy1czdK7f/H7HEWKkXm0T5F/sz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?751KQWT3ro+XIVRa2+ePEPP6GLS43COO/EgmJFW56AsbJ48dw0xn0sKZGgLq?=
 =?us-ascii?Q?BtI/KJ1E3v3aVvLeVNUs2UDIWhJcbg8Owsm2yW70IHNU2MPolYKXB/1xnRVP?=
 =?us-ascii?Q?2asRax5TyEplk8Suta9C4SNXtUY3WASAwnt+EvF9BUuQDYU0ZVwXNfWgaKjG?=
 =?us-ascii?Q?ma2jVYQn6g+MD26Fp/PvLqZZ3ITY6GNoPOBY8nwA0tkiIFQh+ZpR78xRCDS7?=
 =?us-ascii?Q?gbs9cSO+xnUDda0vnmstsAAs6LvskXhoFioYsXeFMU69YXHfRWDITImjVPtc?=
 =?us-ascii?Q?Py5Q8Iuqu/BaoCo1GQxPIkKdEEQwB1pRJaJMkg1q92gz2ebXxrwe8RU2Bg48?=
 =?us-ascii?Q?l+X87IRNYEr9zy3X4P66zB6+RJxThY06DFHgZtXwMWAmZR5dMws+BjApN0Iz?=
 =?us-ascii?Q?AiX2om7H3b0VCJxJibFsrxnSXLrs/khDWS8c84kyp4Shl+CcKzmySKzTD4cD?=
 =?us-ascii?Q?d3ViFB6gDuCj67nGfgzR5J+ivRulc2IgA7U2gPOtOhQw97zz2YjsG+15MxFH?=
 =?us-ascii?Q?4NyR1NYuH7emOXGlFrLW2zovoTPcuVHEL4cbmvN6YEZgKCnFA9VUsAxkEJEy?=
 =?us-ascii?Q?ZbUDuAoInB7kFXf5kThn7ghSG5GCobclAz1ZvVrulaDYzF2Ujx2LI3qKDd1w?=
 =?us-ascii?Q?pwCzfIoONv5lyR0N5fxZr2f9uXdHY0zSmfgjk6sGRYfmcbPXUcEvZXp3FFRw?=
 =?us-ascii?Q?OiNHduRw44KJHGfc78xrlsG0NvCoGZ2gabG1WWYWKgW0FSgnaU9/Tseso8cM?=
 =?us-ascii?Q?rjaYI0r1XjkSg8AFHxsudKHVYj/qw6+qjlJwk/gMjLWFng3yLIKpj6ape3Gp?=
 =?us-ascii?Q?G0tAwr/cYrbunElGvqOutEWP/HUX8HPP9DYvKcJaONaT0YVXxP8w3Qq+OlOD?=
 =?us-ascii?Q?34/qEtjq9W9kBO5s1gvXM/03TG/Rktscubmj/w2/c9E5qvY9c1b9qEoC5liX?=
 =?us-ascii?Q?HnVnovsvq/ZNKxEbxhT24eDg8gSOdPtks0VxHm9p5ex5ljgmhLyibq3ysWuX?=
 =?us-ascii?Q?I03j/oNF4MOjz5obvwz/VtVv7lQuD/k6TxD/c0qX7XAuQQYTN3MMSgHHFFUD?=
 =?us-ascii?Q?pbCOaki7ZamQ9bC1BtswZu5mlMk3R774zNJNtUN9sPBctK7woOEhe1P6JT63?=
 =?us-ascii?Q?yq7AvL3vU/rWJbq5zp53U/Wx3uogfIFCNayBNSKuP+ZKJk/qGkE/QGVDWAtt?=
 =?us-ascii?Q?KZoru1EScTvqHc3ZrwDHckCxxP++MpC5PgJa39K57snYUQCiCTcFtkMeBPiU?=
 =?us-ascii?Q?0ZgUcoa3SnQrkvOaD1fFoqW1kp2H6YD4E7I7Y1YN4LswUhN7kOiiU4Dtuagz?=
 =?us-ascii?Q?xBES73czj+PjXMD4wVplklBmJru6C0+5gr8w2B+V92Ynq+aPVgwDbZzOygOA?=
 =?us-ascii?Q?dE9NNF8hzloEHJB8KaW6TsPKb5Wg5206w3EnewRoPfiVKNUZ/DTGKWDZWAfa?=
 =?us-ascii?Q?CxT8BI0fCxsauLMz6u7Z/ptExbda+xDWtc2J5XeT1J1g/6WJh5a3JJ9BiSes?=
 =?us-ascii?Q?/7Ovy6J5XrVD31t4+dYM0qMxrO6ejYgmQxjOqufjAqAE8CoRh/CpgWg2IH2O?=
 =?us-ascii?Q?SXi6QprJOTkjvcUVJJ06bjTKjJJc9JN/r55uY8DB6kndnkUiGUHclTChfPPa?=
 =?us-ascii?Q?Svh4uNOk5JQDfCxW46biMwaQ6IDmFtQHGyGgCEwPUDRNrYY/dgncBHjzlFZr?=
 =?us-ascii?Q?pe3CpGt2D547RhFY2xJvJZJuSc+zFHw/f4QmemQnNags0KygZ7/FIlc1EbqK?=
 =?us-ascii?Q?hoUbCfMPL14tIzMb0yBF4ZJIdq+wzdA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2577b681-1226-4861-9652-08de6ff7149a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 20:40:12.7569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSv7/3nzzI80UZgDj0qHfxICTg9RcHqq/RgPd+Zy8X1mINzGiEpjwfDSfdG/5Gz4syzz4wzeopx8kxpPmwEXwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
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

On Thu, Feb 19, 2026 at 12:16:49PM -0800, Matthew Brost wrote:
> On Thu, Feb 19, 2026 at 12:21:56AM +0100, Tomasz Lis wrote:
> > When a context is being created during save/restore, the LRC creation
> > needs to wait for GGTT address space to be shifted. But it also needs
> > to have fixed default LRCs. This is mandatory to avoid the situation
> > where LRC will be created based on data from before the fixups, but
> > reference within exec queue will be set too late for fixups.
> > 
> > This fixes an issue where contexts created during save/restore have
> > a large chance of having one unfixed LRC, due to the xe_lrc_create()
> > being synced for equal start to race with default LRC fixups.
> > 
> > Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> 
> This is better than what is in place, so...
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

A little quick on this RB, see my comment here [1].

[1] https://patchwork.freedesktop.org/patch/705610/?series=161287&rev=2#comment_1298253

> 
> But I think we need to close on why my suggestion in the previous rev
> isn't fixing the issue (off list discussion). If we go this series, then

We still need to figure out why my previous suggestion doesn't work.

> my RB holds for future revs.
> 
> Matt 
> 
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c        |  2 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 24 +++++++++++------------
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++--
> >  4 files changed, 15 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index e9396ad3390a..6eb561086e1c 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -309,7 +309,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> >  	for (i = 0; i < q->width; ++i) {
> >  		struct xe_lrc *lrc;
> >  
> > -		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> > +		xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
> >  		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> >  				    xe_lrc_ring_size(), q->msix_vec, flags);
> >  		if (IS_ERR(lrc)) {
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 527ded3c9c22..5ce06031018d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -536,12 +536,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
> >  	 */
> >  	xe_ggtt_shift_nodes(tile->mem.ggtt, start);
> >  
> > -	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
> > -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> > -		smp_wmb();	/* Ensure above write visible before wake */
> > -		wake_up_all(&gt->sriov.vf.migration.wq);
> > -	}
> > -
> >  	return 0;
> >  }
> >  
> > @@ -844,6 +838,10 @@ static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> >  
> >  	for_each_hw_engine(hwe, gt, id)
> >  		xe_default_lrc_update_memirq_regs_with_address(hwe);
> > +
> > +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
> > +	smp_wmb();	/* Ensure above write visible before wake */
> > +	wake_up_all(&gt->sriov.vf.migration.wq);

Then with [1], move this wakeup to vf_post_migration_fixups after all fixups.

Matt

> >  }
> >  
> >  static void vf_start_migration_recovery(struct xe_gt *gt)
> > @@ -858,7 +856,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
> >  	    !gt->sriov.vf.migration.recovery_teardown) {
> >  		gt->sriov.vf.migration.recovery_queued = true;
> >  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> > -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> > +		WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, true);
> >  		smp_wmb();	/* Ensure above writes visible before wake */
> >  
> >  		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
> > @@ -1303,7 +1301,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
> >  {
> >  	spin_lock_irq(&gt->sriov.vf.migration.lock);
> >  	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> > -	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> > +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
> >  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> >  
> >  	wake_up_all(&gt->sriov.vf.migration.wq);
> > @@ -1499,7 +1497,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
> >  	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
> >  }
> >  
> > -static bool vf_valid_ggtt(struct xe_gt *gt)
> > +static bool vf_valid_default_lrc(struct xe_gt *gt)
> >  {
> >  	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> >  	bool irq_pending = xe_device_uses_memirq(gt_to_xe(gt)) &&
> > @@ -1507,17 +1505,17 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > -	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
> > +	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes))
> >  		return false;
> >  
> >  	return true;
> >  }
> >  
> >  /**
> > - * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
> > + * xe_gt_sriov_vf_wait_valid_default_lrc() - wait for valid GGTT refs in default LRCs
> >   * @gt: the &xe_gt
> >   */
> > -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> > +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt)
> >  {
> >  	int ret;
> >  
> > @@ -1526,7 +1524,7 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> >  		return;
> >  
> >  	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> > -					       vf_valid_ggtt(gt),
> > +					       vf_valid_default_lrc(gt),
> >  					       HZ * 5);
> >  	xe_gt_WARN_ON(gt, !ret);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index 7d97189c2d3d..70232dc38f9a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -39,6 +39,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
> >  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> >  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
> >  
> > -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> > +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 4ef881b9b662..8be181bf3cf3 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -73,8 +73,8 @@ struct xe_gt_sriov_vf_migration {
> >  	bool recovery_queued;
> >  	/** @recovery_inprogress: VF post migration recovery in progress */
> >  	bool recovery_inprogress;
> > -	/** @ggtt_need_fixes: VF GGTT needs fixes */
> > -	bool ggtt_need_fixes;
> > +	/** @default_lrcs_need_fixes: GGTT refs within default LRCs need fixes */
> > +	bool default_lrcs_need_fixes;
> >  };
> >  
> >  /**
> > -- 
> > 2.25.1
> > 
