Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EE7C282C6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 19:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D739C10E33E;
	Fri, 28 Feb 2025 19:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbKrBDbe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154ED10E33E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 19:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740771927; x=1772307927;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pjjYFf1pMrBm23AVkHbeTmG6ndwHUltSusXRQDJVrqA=;
 b=FbKrBDbeJVDZC4YpnZM1DB2Qu8uacqgge+htaBP8BUuVIUdo6piQ/P3S
 0vzvkugP9pjFqeQnCuJFQhVC6iWjhWq6tjdwYMfBHFn1kOA1JGBTzT5sm
 oCcOu6a4me7ipAQCZcIS16fW2JN5tllS7gKH5N6Zvlenxt8d2+J3EBtsq
 mQ8TBSAXjQ8HuF+pVs6V+p1QetwUD7grxprm7oeAxowwrYi1VQv3ej+bc
 otfETNNVrM8xWFX/QZm8QwYMHmv8T0XL5St5Xp1KlDhNkOBmA9s6Vd+R/
 wJp+m/mzU7g6Tr2nSzZBWHx9beo15y2vcrhFZBT0Mm1vawIeQJ0n+TcEo A==;
X-CSE-ConnectionGUID: WPy405mzQvGKM4MInpj+og==
X-CSE-MsgGUID: W1ZAhmhGQSScMEdqVevHng==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41415420"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41415420"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:45:27 -0800
X-CSE-ConnectionGUID: FAwooKTNQYO9nhN+d/VtGg==
X-CSE-MsgGUID: 1RXjQFzxRne1InKCA9ru7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122659611"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 11:45:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 11:45:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 11:45:26 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 11:45:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5umkeEoZH2DI7JJAQJkiv/OdNfSsFQkzB3K770W4Fy6s5oPENNidhNjzunnzqln7xUYjDhADw6sXRcYAm5NKgZzIluRqH3x3yIA3m3sCg8euffmfkU8RLzc11jPe3KLIEZyWVNtqGpg1MxHkvrx0qAPzbyCAl0yrF5vpssHrkkcsnymJI8WSHdjpX918K+rrNJSaPe4dU9Eyl6MzXovW/0rjR+xUkVfQvGvvSPpovUcf2ogWQ22CTue8Jo+JAcyPhrymxgwge9y6RL1YTLvcjbuDyt4Mfa+HcQArscczD15eBkEyZTXSwyG4i9jF8Z7Jf+e5JU17WLDfQ1LMasAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWn24sfqPAccgdP33/z8hIQA74O7ao8YRjVW6Q4obLk=;
 b=ilNbvgW59Rl4rFsQ16E3mgvqdZQleX43K4vZEoEnrsxs+WophNnDrZ6AHos/H9CF30FxbOjN66MUIgxuRWN76wLohzQCZTRjgfFCWFvcvcG3dbHQH4ai9RjSB6YUcP6duFvn9EAeU+Ur8b9WLN3yZfRKSkiIGiu3v/81vN5lnwCi+YVmHaEvr0Plt/tGvjIcpyyC0Z195PkXRMyJ3L5xcSrDgT0cbCuifvwa2/AJkgU6fmOskv837iCE60wEm8hya1c5f7f6LjlKjbXHkeb0UkOVT5h1mGTmv6ycaZEc5YRreEfyrzLgcoaSR3aC6fb8Kx4mbl/bmIBqRZj9qVQrEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CY8PR11MB7875.namprd11.prod.outlook.com (2603:10b6:930:6c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 19:45:24 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 19:45:24 +0000
Date: Fri, 28 Feb 2025 14:45:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
Message-ID: <Z8ISULSSQYvaYIjl@intel.com>
References: <20250214172503.502320-1-rodrigo.vivi@intel.com>
 <a11812cc-bf0e-488f-9701-317ee9807699@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a11812cc-bf0e-488f-9701-317ee9807699@intel.com>
X-ClientProxiedBy: MW4P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::20) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CY8PR11MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e492865-c35a-48ae-ad98-08dd58307159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sDNy6gKkxOADyhpz/GbayWinbzxdmMxmqBo+zZhmxZMOPF9zaoFW8IRQtLya?=
 =?us-ascii?Q?N+9XbMipMY+FZVWU32M6lBgWACA+o5wQMMg4hue7xDcLkr6MLhxm3XpMyPfo?=
 =?us-ascii?Q?QQ3YbrcAxzDpVp2tphE6DT8PUdzpwYnLyuvviJxK7l88LnhRID6TB2XsE53t?=
 =?us-ascii?Q?CTYIvu6TncVmMEjxlJONcj0hlN6FIZhuTW36K3YWo4QgfTENJMO4Hq/+9C0k?=
 =?us-ascii?Q?/2U1Gu8VDzcWOqqx0KL/e5rFUvbQWnHs1tV5D4ZvOlPahc75zajWNCO3FH9z?=
 =?us-ascii?Q?3IDEzXRWHY8Tm1sHbnNnBJnhldGDZySFLsGU0ZkUYplV2AhTx3EpNWP9mkOi?=
 =?us-ascii?Q?PhHkh2bZwj5agDAVrDxiNGqRTRsRKxu6Hvd8YhiQj6ZM7K1ErS/ygjZs4fpG?=
 =?us-ascii?Q?aPjHplLGff9BJB4dU7MiGO2WH4zH7gNtEGoTywD15xm8VZV44HfrR1xr7evj?=
 =?us-ascii?Q?tWqhc9y35ehXwARZyeq2xxSMLkhcLjgY1ZB4oiXKnBc4ZjuPu5pYzG/A9PKx?=
 =?us-ascii?Q?J/AAhUZW94rTvfwo4Rid/l0hJhXJzchUnYvDGtG9UjopA05vZ3jXSoGXlUF6?=
 =?us-ascii?Q?ftnIAC7yF/ilyW6o6hSlezK2d31pRcTDAkdO063xN/8XCecogNAGQl5QNIWo?=
 =?us-ascii?Q?uxldgMj0ninxue6EXaU55B3Wua/TfYL0RuzidbfD9vN/+qydiAfRsvNhzCdb?=
 =?us-ascii?Q?jHQgIMcrl8DlKpaoPbfJC0eBHRnUh5+Q0eKtWzCN1VvUQM078/IVUv58cI+r?=
 =?us-ascii?Q?Pr6UQ6CzM1BNpdAV2xt6zWuzKE1r5O1ClQZ0b+O2VNFfDLcukYSsBxP8hZ4d?=
 =?us-ascii?Q?+msOk4Yhky9eC/K+sd0Irn0QaOYfQq2GcomxrqZeChuFhvmcnphuNeKHH5p1?=
 =?us-ascii?Q?ncHyx8zr9Zoc9Bvt3Yj1XylDWa5CcwzId6DMqvwIPS8kS6xVmWfLptwZjjAL?=
 =?us-ascii?Q?GmZ8NxHlo7VlsRoWh6Hb53+PKaeu0CzQbfx4l5NRlVaNPtnR7dKd5sX0/Ww2?=
 =?us-ascii?Q?1NuCtn7KAnggEP5VnFagrGq/Dv429G/jjmKwYhNNnTqep/JK/7CpjDTM+nAl?=
 =?us-ascii?Q?V81IWFSiJcT4O1G/ybtWEHunyLLEIWv6nHsWhUnU3tQHB8sTuRh9JHIq9Nqs?=
 =?us-ascii?Q?/qlaekt8gddBFequLE02n7K2neYan3tDr7/F09e+FhXTEiSwODufOxsyhVRz?=
 =?us-ascii?Q?kn1StjB21VfwaxII1XNJQlYA55S203d9RfzowfJMPXrvPVkiySY80hPo7RQD?=
 =?us-ascii?Q?XUkAv43FGxMQrZdCBu+k8WlkumFmHbCuYzszYjAmhS8nW8zVvqwZD9mGVCQv?=
 =?us-ascii?Q?5BoR32QK/y+2oPGvLY4+EIPg9bvOKFQjeH95LwfKe/6DnEzKwtlnE60loybB?=
 =?us-ascii?Q?Aqp7U8mGx4gjroxUasElEqgUjexa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/tucuuiGRSezH+RHcihaXT2pjOtxB+/kQywVrpOyvmO+ZtiXT7FZN2Q8Gsff?=
 =?us-ascii?Q?MlM43vAk7VB08iASLR5IXj/QmIXfJ77vuvU0wD7YWkq9D6+L4zAJLf5uVA0j?=
 =?us-ascii?Q?VjTd3ujqilu+RzAfzAfXyyNfw3JyePHGdek61RUzgmfCqGoqfLmvpG6DU3yP?=
 =?us-ascii?Q?lz984dc/xZnWGKGKchhV1IeMntoKO57qY/fc4Vby9tUseY+Eqn5WBwu3YBdX?=
 =?us-ascii?Q?gB2yTS2Foeo30onnfV0CMzCDHcYPK0uAzSzVBafzgTI89eWXca01s7zzqoef?=
 =?us-ascii?Q?iHzbMCbeb130bee5MkBc3j4XfoNNsqCtdcQAqV1jzygO2Nzq9fX6/eNRkV0K?=
 =?us-ascii?Q?xHTBq/RGvk7VEYWKWYaOOOI9hL1ThpNXnIzooxtMZSG6XNfH9Z7hLWwu9qKA?=
 =?us-ascii?Q?EkVHX8cQOetikp4t8RV1e4fZxkhlEXt8enxldNGAzWgYNEOUiIdTMZFQNHLM?=
 =?us-ascii?Q?LMIpcgx81G+kklF59DYg94UYiSR05xN6f6/YzKJIzcNx+Poy7hsOyfXSwe/U?=
 =?us-ascii?Q?i5ylCFP2cvHUDVIjgykR0Z7ClmEnzQozPT/Mbg0utY34/ckibY1uYeHrCIeJ?=
 =?us-ascii?Q?GvgdM9K2NLpCDdW4clxXq0u70DlhQZrVAhuefOyYivGB3Y4QXjls7Jc9XHC7?=
 =?us-ascii?Q?RDzhV61P1mZBtfyfmPMFoqadnLf8HL69U+m7I2QbnowZQ1UPneXwn2yTxTdL?=
 =?us-ascii?Q?6yKJ8YXURtfWXRW61nyWVB8a/Z9enmbnIvfLXPupnMKiLfLKp5Ew4iZs4NSr?=
 =?us-ascii?Q?NAZWZtLtWHP5euT9m0puMagUphMMj4CBvAHnD2bEsJERIH8D72vxxxXzYDcx?=
 =?us-ascii?Q?ZknZLWurW/mdGjlTUp97UnDupY9rn/NXnMuJgXvS+/8aiUSA39Dbifjy9Bc2?=
 =?us-ascii?Q?4+Cfl3qy6mFODm2nFN+P45b2ZJA+Ax3dhfj8Ebd15foJb0VUGfVYWK2CVftI?=
 =?us-ascii?Q?kvV+v0a9+/K6+bT6Lp/LYf/cRfq2qLKs5m37jG07lvMKwcySkhDAGjVh79R8?=
 =?us-ascii?Q?4Yc7Dxo2TzV34EQLin+XC78Jz5R8YkD27sC3+R1zQrIDQiEO0wafJ+olXibQ?=
 =?us-ascii?Q?YTcigou+K3jLRWOmYF0/ym1HeQym+EMqJIuitx2WYeV+3MsJ3f/m1tfT4UAT?=
 =?us-ascii?Q?TvfuIdNKRQEjZvc9tjb/8AkRcblhPogO50s+aFA9pV8gGtEhcogErlv5xbYj?=
 =?us-ascii?Q?xEItFGBouwOFf97Pt028bwzOLlx9pR+AhGit9ne6z8XBFoJmxIWbrVlSN6LY?=
 =?us-ascii?Q?wm9kem324N2PzP7BzNzgVc2b1L4RPgMddgYOyMaH1izLMGSn3iG7iuj5/Frf?=
 =?us-ascii?Q?ubTmc34aSDdSVcMggay9TM3SKBvGZGfsMvV62O62Tm82kbfZVYYWlZscScxh?=
 =?us-ascii?Q?PkloYBZdgfpfIHVPTrDmjpKf6b4+yjB1pqwlrEH1xduBYKILxwl5t+bgE5+u?=
 =?us-ascii?Q?bJHDcuVmQZTAgsmOduc8Dh2XVBQb289Gr1vyNL/JqDBUsh2PZfIE2tab5mfu?=
 =?us-ascii?Q?EbPVrVkr8XXAkb6QgmXtV+H2X5BTD5ubJJ1W2BO6UZeHXLeXPC8zCvn8Sap1?=
 =?us-ascii?Q?NXVKhzugb3+1OPlq4Q4bAUE7t8HNwXCuV+h+wVQD0QBNd8msAAxg5tCVGevs?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e492865-c35a-48ae-ad98-08dd58307159
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 19:45:24.2204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcPSMzOQRRJWby/jHgF/1ZlbRTg+Zey/klAaw6QP8rHv9PqDG8PoaOHQel8gI2ph9kqBKsSq8xd1SJycMIb3jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7875
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

On Fri, Feb 28, 2025 at 11:22:02AM -0800, John Harrison wrote:
> On 2/14/2025 09:25, Rodrigo Vivi wrote:
> > In a rare situation of thermal limit during resume, GuC can
> > be slow and run into delays like this:
> > 
> > xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
> >     		 [status = 0x8002F034, timeouts = 0]
> > xe 0000:00:02.0: [drm] GT1: excessive init time: \
> >     		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
> >     		 perf_limit_reasons = 0x1C001000]
> > xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> > ------------[ cut here ]------------
> > xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
> > 
> > If this happens, this can block entirely the GPU to be used.
> > However, GPU can still be used, although the GT frequencies might be
> > messed up.
> > 
> > Let's report the error, but not block the flow.
> > But, instead of just giving up and moving on, let's re-attempt a wait
> > with a very long second timeout.
> > 
> > v2: Keep the precision comment (Jonathan)
> >      Use a define for the regular SLPC reset timeout.
> > v3: Improve messages (Vinay)
> >      Only skip initialization if the second full-second wait failed.
> > 
> > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v2
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_pc.c | 46 ++++++++++++++++++++++++----------
> >   1 file changed, 33 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 02409eedb914..74cc13012532 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -20,6 +20,7 @@
> >   #include "xe_gt.h"
> >   #include "xe_gt_idle.h"
> >   #include "xe_gt_printk.h"
> > +#include "xe_gt_throttle.h"
> >   #include "xe_gt_types.h"
> >   #include "xe_guc.h"
> >   #include "xe_guc_ct.h"
> > @@ -50,6 +51,8 @@
> >   #define LNL_MERT_FREQ_CAP	800
> >   #define BMG_MERT_FREQ_CAP	2133
> > +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
> > +
> >   /**
> >    * DOC: GuC Power Conservation (PC)
> >    *
> > @@ -114,9 +117,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
> >   	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
> >   static int wait_for_pc_state(struct xe_guc_pc *pc,
> > -			     enum slpc_global_state state)
> > +			     enum slpc_global_state state,
> > +			     int timeout_ms)
> >   {
> > -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
> > +	int timeout_us = 1000 * timeout_ms;
> >   	int slept, wait = 10;
> >   	xe_device_assert_mem_access(pc_to_xe(pc));
> > @@ -165,7 +169,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
> >   	};
> >   	int ret;
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS))
> >   		return -EAGAIN;
> >   	/* Blocking here to ensure the results are ready before reading them */
> > @@ -188,7 +193,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> >   	};
> >   	int ret;
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS))
> >   		return -EAGAIN;
> >   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > @@ -209,7 +215,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> >   	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> >   	int ret;
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS))
> >   		return -EAGAIN;
> >   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > @@ -443,6 +450,15 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
> >   	return freq;
> >   }
> > +static u32 get_cur_freq(struct xe_gt *gt)
> > +{
> > +	u32 freq;
> > +
> > +	freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
> > +	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
> > +	return decode_freq(freq);
> > +}
> > +
> >   /**
> >    * xe_guc_pc_get_cur_freq - Get Current requested frequency
> >    * @pc: The GuC PC
> > @@ -466,10 +482,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
> >   		return -ETIMEDOUT;
> >   	}
> > -	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
> > -
> > -	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
> > -	*freq = decode_freq(*freq);
> > +	*freq = get_cur_freq(gt);
> >   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >   	return 0;
> > @@ -1033,10 +1046,17 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> >   	if (ret)
> >   		goto out;
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> > -		xe_gt_err(gt, "GuC PC Start failed\n");
> > -		ret = -EIO;
> > -		goto out;
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS)) {
> > +		xe_gt_warn(gt, "GuC PC excessive start time: [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
> > +			   xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
> > +			   xe_gt_throttle_get_limit_reasons(gt));
> > +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000)) {
> Shouldn't this be a define as well - SLPC_RESET_EXTENDED_TIMEOUT_MS or
> something?

good idea! will do.

> 
> More importantly, Is 1ms enough of an extra wait?

The new timeout argument is in ms, so it is 1 second.

> If the GT freq is 100MHz
> instead of 2GHz or some such then the expected max of 5ms could now be more
> like 100ms if not even longer (the slow down does not seem linear). As an
> example, the GuC load itself should be <10ms but with clamped frequencies we
> generally see over 500ms, sometimes over 1s.

hmm... over 1s possible? so, perhaps 1250 to be on the safe side?
other suggestions?

> 
> > +			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
> > +			/* Although GuC PC failed, do not block the usage of GPU */
> > +			ret = 0;
> I thought the new policy was that any subsystem failure should now be
> considered fatal and abort driver load? I recall a PXP start failure was
> recently upgrading to being fatal even though PXP is almost never used by
> any actual users. SLPC seems much more vital to the system than PXP!

Hmm... good point! I have to get back to the board then and have
this logic only for the resume?!

If this happens during the probe yeap, let's block because subsystems
are buggy. But the case I'm hunting here is a resume from S2idle that
is entirely hanging the platform when this happens under thermal constrains.

Thoughts? I'm open to suggestions here.

Thanks a lot for raising these so far,
Rodrigo.

> 
> John.
> 
> > +			goto out;
> > +		}
> >   	}
> >   	ret = pc_init_freqs(pc);
> 
