Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED4BD1BDE0
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 21:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBAA10E80B;
	Wed,  3 Dec 2025 21:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brADSvQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928D110E80B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764796158; x=1796332158;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=homZLGdr14ceE1HBeG1Q1gN/B3sZ/PCdKosOObGTwMg=;
 b=brADSvQFRlfJHzDr8ALPpvxrw0BmrcCkFUXz8yORJ7985XQpu4ptXHHC
 wsR10PL5xpxIYJRHD97LIqizyLypOGQWzvUXvo7n4UKYXdsAZl7+9Qdoc
 31/gYKcFJtUmIjbAQ1EvcXdS2KoVoPz+ungYmiSSd0tVVaLNIByENjaEg
 8Ip4AZCS98EYHmS+8NeAE9uyx4PVHd1sLO8t+xH7o6P4MwGKu+61la7Hk
 usA32ajhtCf6R6Dp/VNQYtMKkxAqeem0cqJbsdSF//1hT+vi6uGtmZJo8
 D5j77ZAWSBSuFJ0C3NkI3qPAPg7oVfXBoj0EpHvlk0qGwLKS2zVG4IQFq Q==;
X-CSE-ConnectionGUID: 09rq0pY3TCm2DP4TXhyvsg==
X-CSE-MsgGUID: mE360fG5ROyraGwyyKLR5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84406145"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="84406145"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:09:17 -0800
X-CSE-ConnectionGUID: wQLu+4I0TkywTlFlYTiUTQ==
X-CSE-MsgGUID: Ca8STfrgSWm8+LhIDNSsRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="199208534"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:09:17 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 13:09:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 13:09:16 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 13:09:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvleu5Fnvqr5DQG6luj+vxYUQ8eYNce5mWLXcCCnxT4OR9qK23aZ9XZBPJb29sDUcvVuZzcYuFsfRvDuGryA3Zmxa9QHCI8cTrErp9OPiN/V8slMrUdotvndIwGHCECYqkX19N+9gzMim8KmL7Gs5W6uf752i00dTiwShea0FBHJqtADsA+ONZtRiWI+hDfn2sI8691QIqhobgNVw63PNB9NKHH+FiJ8eQF5balv25XeiI/x9X/SRFbQpyQ4F/qHuvW8B+pjqJqIJG7dZ6eL9mxQpufOhqxOyDCKVSlK4n3e6Yf7iEOTi2fzGgxzTDFjdhuTT51BTQOlngOky7Ir6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QTknHAPxI6Ola0piqZvDYQRyKxOPz6s5BwtoxZoteM=;
 b=RuU7qrsyPTN4A0Z11DD6P8aBEQXJM+oxUuD2hGjDL7t+UleTfGZdmodNi+3LudX1x5zZR/UgNEnUxmltepyc0KCAmm0h/1c6tgX+3AjAS5DSpCtmWJiLpxSTPqqw3s4ziBGbGwSdO3XhFmoSNW74+UUe3sZMaZzMR+5qjEGdBS59oTQhMiK96d+ZejpUP2vnWGVWSFt+BlM8BOWAtiOmubvBW2eGJu5IrOT9sx8OHXaW6d6t68SZ9Ql2MHtHd3cmByIJUkzxl+T7wwiy4d9U5+viZLMxXNZ2x6xR60RU5AX0kGTfcf1fYVJve6ARHLc+z3nCaj6LRLktaKQRPdM46w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB8015.namprd11.prod.outlook.com (2603:10b6:510:23b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Wed, 3 Dec
 2025 21:09:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 21:09:12 +0000
Date: Wed, 3 Dec 2025 13:09:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_series_starting_wit?= =?utf-8?Q?h?= [v4.1,1/2] drm/xe:
 Track pre-production workaround support
Message-ID: <20251203210910.GC4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251202184256.1718298-3-matthew.d.roper@intel.com>
 <176473840766.52458.13109917704538687730@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176473840766.52458.13109917704538687730@a3b018990fe9>
X-ClientProxiedBy: BYAPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:a03:54::44) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7c8724-9ce4-408f-79c1-08de32b0357e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BwCnmXeWMToQF+xKHh9VARGO+Wd/KdGJpkgQ8B8EpW29CRjK9/z/mkSWpD7A?=
 =?us-ascii?Q?7jCrxLvdgU+ihAle4Be6MKKsrncsywYydQFWutS0qvcNHXS1kq+DfKqkNnCI?=
 =?us-ascii?Q?/Odt9TM+RQgXPotgiRcjvwbI8wgYDY2kUT5dlu8a/h4V/znXSslZ7SOtIYlE?=
 =?us-ascii?Q?tHuusZzoaBsFiyab5UOFqvm3q/C+92aKibnd+AeHRUPvfQD+2L2bopKCOh2H?=
 =?us-ascii?Q?mSDtL16lOXxTqpoHJpgpMHVtd2lpZtFEDE2WMispFUmRmgMVoSKUdyRnl1O4?=
 =?us-ascii?Q?jWOcYlHqeSmnNyFbAROo541vndHm0jdbAC03oA5i25FtvRG9vsmG13ex5lyu?=
 =?us-ascii?Q?LpJj4638Unu5UbfnfONZlewIudOJ1YiUpRHmUq7lX+Ck7WPm94wLVT7as84x?=
 =?us-ascii?Q?Qn/zalfcfuJDh8jthd4BZDRGSVg22rpYed4MQ4soQ31DifZBFjTS1di8Cw5T?=
 =?us-ascii?Q?lEr3YribVEBXjLSTPp5oLJC1fynDl1GHE9RkroYWg6cU1ZqMRY49ReujN8DX?=
 =?us-ascii?Q?ztYSLS3KqLFDe7866ek332+5hX0Ok+p8a/PsU8VLfgBgbecHv0wFoyvFxLYv?=
 =?us-ascii?Q?CuI9PbiLvNogEt6+gbNwSr6gluy1QrxJ6qZVMgGw0CLbi9lUOFoEbIwTX/nC?=
 =?us-ascii?Q?wXqmF8YrrSRzYf9S4wWaB022Gh2C7fVNXMg1krErl3t6AtPsKqTRP/WiaiRa?=
 =?us-ascii?Q?4RnMyhDaML4GdMEpeWhNx4D+rXC1ccF4vt3km7Zm2lETG6r+xnU98b5LN+kZ?=
 =?us-ascii?Q?kqBYiynNdrN6KoJ8Ax1sV+/+CmygANJgwQHKLx6QadDarOLwZKnPiUmRMDPA?=
 =?us-ascii?Q?DMSfQB5tmLsKKrb8xMvNgdBXBDUbyJL+8050Fd6w4hkdyqOaNhf7p4+GvMwD?=
 =?us-ascii?Q?zvNSTuLTDbuv6heo7BTSSbw8Iozp07sK0lt0T8M9lS5g5onvu4CUvPQP4gv+?=
 =?us-ascii?Q?wxTxhquXlpuFoXmPBB7de0WekFVEj3WDkSjHKQdbe40CbfF5UV+TEFqGXH3S?=
 =?us-ascii?Q?bAKjYeEDhcBiT/XcNm8VQ5K8O/vgroPww6/wyJ3S3dssNgkYZ/gVkwRArbOV?=
 =?us-ascii?Q?+kXwam7OxgndwHyJFXIipWnsmqdalGLGDyHpT1rkqnhb3LKcXDmV7iy5CZx2?=
 =?us-ascii?Q?jEHuoGsLQ3YUPcLD/3Ll7t71niG85fX8vB50mvVXXSZnW6Nvqaz/rLWTB8OE?=
 =?us-ascii?Q?Vxfwp14wyAoV4JGCgxX9dIlKMh44cLPWLfRfxvYvcZn3iPyipgEPgY36dlFD?=
 =?us-ascii?Q?jWczEv3zaX/lNyjmnsoKD2X3ltBAD1Rga8263yunITWub+Dzwk8DMtxec1eL?=
 =?us-ascii?Q?/T+HK4/86I+S+jbovLZg3iXjWe8hMETkB//Vsxb1eVieT5xrftTW/I68/NPb?=
 =?us-ascii?Q?wR5ZDgfM5B7os6L40CSJDNm/I1UQhQUGNrr2f1g+M5OO1gQU6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?prJSFAFGtwNJEc74MAvpNo9k++VITSfxvkgAgiqhPn1tNGP3gyv08RormaEg?=
 =?us-ascii?Q?ayygDUvSUDeThIF9fNDfAye3BT0Wtwwdy8OoyM1Kym8xY/8JWdYIgb33kncb?=
 =?us-ascii?Q?ZWBcWy6S75tJ1meHXf2Vd9/AVOOhiR8ubdZZXtscdwL41hw9IFYeVJwSqexW?=
 =?us-ascii?Q?y86DNe4HYbuN723Ks9XCxrRKU0rqNM6thIIagjPqN1cXI+zps7rj8TxzWQwz?=
 =?us-ascii?Q?CDNGD+GESmhwhpZlwD0L0QJoIpPYc7Q4/WjTXN3VVyviFPUDrvM5GpjK2K11?=
 =?us-ascii?Q?XfdYveSuIEpiHTTm0UnlxJJ9h1Me7S37HtU+o8xJUq5lqGhqge6GjlJ4rhNR?=
 =?us-ascii?Q?+acZFCFpHbqQODgTz/a6f2VOGaDpbSWQeCraXnC9IH1QLubuWkHcfm0Cc92T?=
 =?us-ascii?Q?cwOfV+7FXtHm3Z++6eGSoRM2eF/Y6AFxIeI+rC4bJf5DnYREAeGaTSxjOfyD?=
 =?us-ascii?Q?oiw1gFNMT59v4m++ezbl7jE0OEDzZt1fOFjGdkDjka3o7XHaWD8eu9aJNwAw?=
 =?us-ascii?Q?6XbBklDo1uRyrAh4PQZ0P7LCURxR/TjVOFXx4rdofSy3qrX5xBBFPfUGY0Og?=
 =?us-ascii?Q?DpMmmPnQ4YRygtG84ENVZRw0YM8pjfK7py3oVFCVs922vHuvcwDmYHG46Qn7?=
 =?us-ascii?Q?ZS4c1YvUv7D4GeTp5MfA8tnWapyIhGKewsv28IX50IuCV0y5xuiR6PvgwUY7?=
 =?us-ascii?Q?mJ01vMLk+NRYC684m1F1imcSZoW9b3FDSauVeWmuvlULyt6iN7ladu+Ia9qi?=
 =?us-ascii?Q?A7dz/58TPVZ62uuz8q3nhkLsmE9tyJZrTbQwJTvWW85pcNYACbATU19Z6C93?=
 =?us-ascii?Q?lggtUlnzEexZL9Z29p3y0fQ7p2SZx274q8sFWldwTM6Y4Wjw3rmjsa9Q4ghd?=
 =?us-ascii?Q?aQh+Nyi9hZK8lisCXQWdua4GqVsV7LZtjMaDF5CKRNaM7ALp44rKkmXBmzXC?=
 =?us-ascii?Q?tUSlut5OPvGknC6NAEVKRPuFSSp0gvhVFIkWD7/OuuIO6ZUM9ysiTjnUUAAF?=
 =?us-ascii?Q?P/9D5BG7Il4LDxnwQH//Z9wOx3zAyKFvVUNU2cOtO2B1svnZHsSgsF0shYMU?=
 =?us-ascii?Q?Y74g1I/9IfU3oxaeQmM6DtIo8CnLweESaETulFiMjKq3r1KpVF7vst0EN8dO?=
 =?us-ascii?Q?J/SJbBjHduAmkiYIvJt1TltX3l3Lv4LLPWj1M7nel5oV8XVvjU7oyivXi/+c?=
 =?us-ascii?Q?BGt0grsp7zI5Ny9VyDisiJANd0a3hbNXTN9RMp552xtvbL9j8BG/bfhI7wT0?=
 =?us-ascii?Q?e2sNveHZqMnPa6LFi3gluQBGEN5ATAOWMx72ifu62arb2Fv2Bl/CH+c69KMl?=
 =?us-ascii?Q?s1BF3swBhSTcphfzQ9UhC98Y891hS3ZCipvQj+HT1JWVxcrQ0dngBrIrSHwt?=
 =?us-ascii?Q?3ybE3lFJkl7UPit9Q93cpot4vooz6hFGV2ncWf+N58fSsnFIfXHK61qJSH0I?=
 =?us-ascii?Q?hkr3ZkU94za54Fem+MxSSEnPdf2sYacfjUXGCvV6WkPOo79INnm8Zrz2TAlJ?=
 =?us-ascii?Q?E98nSUSS8DVSrm+6UJTVH0PEOVFbDMmchvtIgXn38MRqxLudcwb1TIi7RkIS?=
 =?us-ascii?Q?D59gRNYVWRJDU6o5P2ntZbEb7NXn4hAC30z+fyFAa8P64OIdwFEMSU0YBHHB?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7c8724-9ce4-408f-79c1-08de32b0357e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 21:09:12.8573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSIsDIJatx7Y4CMg3N+pYz8xvHbhN8caXyGgWkyn1vmpz1VobOZff3vjG7hZOo7CFEp2wG2WbaWYMln5NYFPmt3fgU9thXLNhB4EMeH7Ryk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8015
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

On Wed, Dec 03, 2025 at 05:06:47AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [v4.1,1/2] drm/xe: Track pre-production workaround support
> URL   : https://patchwork.freedesktop.org/series/158396/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3_FULL -> xe-pw-158396v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-158396v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-158396v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-158396v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_module_load@load:

It looks like the report here is valid; after a bit of checking, it
appears we are still using several pre-production DG2-G12 cards in the
CI farm for Xe.  Interestingly, these seem to be "late pre-production"
so the GT, media, and SoC steppings match those of production cards and
we probably won't hit any workaround-related issues in this specific
case, but it's good that we successfully caught this.

I'll check with the CI team and see if they're aware that there's still
pre-production parts in our CI farm.  Since the Xe driver only
unofficially supports Xe1 platforms for driver development purposes, it
might just be time to start dropping some of these Xe1 platforms from CI
now that we have sufficient Xe2 and later platforms that the driver does
officially support...


Matt

>     - shard-dg2-set2:     ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22]) -> ([DMESG-WARN][23], [DMESG-WARN][24], [DMESG-WARN][25], [DMESG-WARN][26], [DMESG-WARN][27], [DMESG-WARN][28], [DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-434/igt@xe_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-433/igt@xe_module_load@load.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-433/igt@xe_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-433/igt@xe_module_load@load.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-436/igt@xe_module_load@load.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-432/igt@xe_module_load@load.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-432/igt@xe_module_load@load.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-436/igt@xe_module_load@load.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-436/igt@xe_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-436/igt@xe_module_load@load.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-432/igt@xe_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-432/igt@xe_module_load@load.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-435/igt@xe_module_load@load.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-435/igt@xe_module_load@load.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-435/igt@xe_module_load@load.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-464/igt@xe_module_load@load.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-434/igt@xe_module_load@load.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-463/igt@xe_module_load@load.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-463/igt@xe_module_load@load.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-463/igt@xe_module_load@load.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-464/igt@xe_module_load@load.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-dg2-464/igt@xe_module_load@load.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-463/igt@xe_module_load@load.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-463/igt@xe_module_load@load.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-463/igt@xe_module_load@load.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-463/igt@xe_module_load@load.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-435/igt@xe_module_load@load.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-435/igt@xe_module_load@load.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-435/igt@xe_module_load@load.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-435/igt@xe_module_load@load.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-432/igt@xe_module_load@load.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-432/igt@xe_module_load@load.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-432/igt@xe_module_load@load.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-434/igt@xe_module_load@load.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-434/igt@xe_module_load@load.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-434/igt@xe_module_load@load.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-434/igt@xe_module_load@load.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-464/igt@xe_module_load@load.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-464/igt@xe_module_load@load.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-464/igt@xe_module_load@load.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-433/igt@xe_module_load@load.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-433/igt@xe_module_load@load.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-433/igt@xe_module_load@load.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-433/igt@xe_module_load@load.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-436/igt@xe_module_load@load.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-436/igt@xe_module_load@load.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-dg2-436/igt@xe_module_load@load.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-158396v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#6054])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2327])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1124]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#316]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [PASS][53] -> [FAIL][54] ([Intel XE#1231] / [Intel XE#6699])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1124]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2314] / [Intel XE#2894])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#2907]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2887]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#787]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#3432])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_chamelium_frames@dp-crc-multiple:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2252]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_chamelium_frames@dp-crc-multiple.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-planes-random:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#373])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-4/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6704]) +3 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf.html
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#6704]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-4/igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2321])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#308]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2320])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][69] -> [ABORT][70] ([Intel XE#6675]) +6 other tests abort
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4354])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1138])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-4/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2374])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#310])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][75] -> [FAIL][76] ([Intel XE#5338] / [Intel XE#5416] / [Intel XE#6266]) +1 other test fail
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2293] / [Intel XE#2380])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2293])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#656]) +5 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#4141]) +2 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#651]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2311]) +10 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#653]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2313]) +12 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-bmg:          [PASS][85] -> [ABORT][86] ([Intel XE#6740]) +1 other test abort
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-bmg-4/igt@kms_hdr@bpc-switch.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#346] / [Intel XE#6590])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#356])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2393])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#5825]) +4 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#870]) +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-4/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2391])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1122])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1129])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr@psr-no-drrs:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@kms_psr@psr-no-drrs.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#455]) +2 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#6503]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@kms_sharpness_filter@filter-basic.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#2168])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@kms_vrr@cmrr.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#6599])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1126])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_eu_stall@non-blocking-read:
>     - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#5626])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_eu_stall@non-blocking-read.html
> 
>   * igt@xe_eudebug@basic-connect:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#4837] / [Intel XE#5565])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_eudebug@basic-connect.html
> 
>   * igt@xe_eudebug@discovery-race-vmbind:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#4837]) +7 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@xe_eudebug@discovery-race-vmbind.html
> 
>   * igt@xe_eudebug_online@pagefault-read-stress:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#6665])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_eudebug_online@pagefault-read-stress.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#261])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2322]) +3 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
>     - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#288] / [Intel XE#5561]) +3 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#4915]) +74 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock.html
> 
>   * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#4943]) +6 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          NOTRUN -> [ABORT][114] ([Intel XE#5466] / [Intel XE#5530])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-adlp:         NOTRUN -> [ABORT][115] ([Intel XE#6675]) +1 other test abort
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html
>     - shard-bmg:          NOTRUN -> [ABORT][116] ([Intel XE#6675]) +4 other tests abort
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_module_load@load:
>     - shard-adlp:         ([PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141]) -> ([PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [DMESG-WARN][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166]) ([Intel XE#2953] / [Intel XE#4173])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-3/igt@xe_module_load@load.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-3/igt@xe_module_load@load.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-1/igt@xe_module_load@load.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-1/igt@xe_module_load@load.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-2/igt@xe_module_load@load.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-2/igt@xe_module_load@load.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-2/igt@xe_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-6/igt@xe_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-6/igt@xe_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-6/igt@xe_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-1/igt@xe_module_load@load.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-4/igt@xe_module_load@load.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-4/igt@xe_module_load@load.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-4/igt@xe_module_load@load.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-3/igt@xe_module_load@load.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-1/igt@xe_module_load@load.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-4/igt@xe_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-8/igt@xe_module_load@load.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-8/igt@xe_module_load@load.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-8/igt@xe_module_load@load.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-2/igt@xe_module_load@load.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-8/igt@xe_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-4/igt@xe_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_module_load@load.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-4/igt@xe_module_load@load.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-3/igt@xe_module_load@load.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-3/igt@xe_module_load@load.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_module_load@load.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_module_load@load.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-6/igt@xe_module_load@load.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-6/igt@xe_module_load@load.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-6/igt@xe_module_load@load.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-8/igt@xe_module_load@load.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-8/igt@xe_module_load@load.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-4/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-8/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-8/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-1/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-1/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-1/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-6/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-3/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-4/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-4/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@syncs-syncobj-none:
>     - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#3573])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_oa@syncs-syncobj-none.html
> 
>   * igt@xe_oa@tail-address-wrap:
>     - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#6032])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@xe_oa@tail-address-wrap.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-lnl:          [PASS][169] -> [ABORT][170] ([Intel XE#6675])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-lnl-8/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
>     - shard-lnl:          [PASS][171] -> [FAIL][172] ([Intel XE#6251]) +2 other tests fail
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#944])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-9/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#944])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-bmg:          NOTRUN -> [FAIL][175] ([Intel XE#6569])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][176] ([Intel XE#1231] / [Intel XE#6699]) -> [PASS][177]
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@xe_exec_balancer@many-cm-virtual-basic:
>     - shard-adlp:         [TIMEOUT][178] -> [PASS][179]
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_exec_balancer@many-cm-virtual-basic.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_exec_balancer@many-cm-virtual-basic.html
> 
>   * igt@xe_exec_basic@twice-basic-defer-bind:
>     - shard-adlp:         [DMESG-FAIL][180] ([Intel XE#3876]) -> [PASS][181]
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_exec_basic@twice-basic-defer-bind.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_exec_basic@twice-basic-defer-bind.html
> 
>   * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         [FAIL][182] ([Intel XE#5625]) -> [PASS][183] +3 other tests pass
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [ABORT][184] ([Intel XE#6675]) -> [PASS][185] +2 other tests pass
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html
>     - shard-bmg:          [ABORT][186] ([Intel XE#6675]) -> [PASS][187] +3 other tests pass
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
>     - shard-lnl:          [FAIL][188] ([Intel XE#6676]) -> [FAIL][189] ([Intel XE#6054] / [Intel XE#6676])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][190] ([Intel XE#2426]) -> [FAIL][191] ([Intel XE#1729])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-FAIL][192] ([Intel XE#3868]) -> [DMESG-WARN][193] ([Intel XE#3868])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_pmu@engine-activity-suspend:
>     - shard-adlp:         [TIMEOUT][194] ([Intel XE#3876] / [Intel XE#6421]) -> [ABORT][195] ([Intel XE#6675])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3/shard-adlp-9/igt@xe_pmu@engine-activity-suspend.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/shard-adlp-2/igt@xe_pmu@engine-activity-suspend.html
> 
>   
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
>   [Intel XE#5416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5825
>   [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
>   [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
>   [Intel XE#6421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6421
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
>   [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
>   [Intel XE#6699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6699
>   [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
>   [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3 -> xe-pw-158396v1
> 
>   IGT_8649: f76e05461c8d5938856ed75ac8668640946f9ecd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4181-d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3: d0b9c57f3b8531d4ea5f9b1ca93756c8c7d55ea3
>   xe-pw-158396v1: 158396v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158396v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
