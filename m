Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B304C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 19:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4736210E57E;
	Wed, 29 Jan 2025 19:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4zhiO1I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51D010E57E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 19:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180048; x=1769716048;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5Yvrt8pdWk6a5AYgXNdxF+WVABrc9KtrmqXOl6Vn2fM=;
 b=P4zhiO1I9iYOb9KSrvLGGS2quT7LJqT8nN4IZpjt6H+TYUHHZHmh9tXP
 X1gdLweu1tHpM8kn0rzRqFHJxY4YDfv9d8es4ru6YRl0IQpp1sfD5obrd
 1lyNE4HKpsC4KpQMfTfizcvhS7oovnGGhdyCQz5tB4ZSbIvD1IfMoF8z3
 TvxKWP9cKBIx7x6je5Ay8Sa/ylA+7i/jVcrCp+BJ3S/gbE0QG5ihmZTlY
 Xra8C0FHFxVaLGYTEbdNMKMgWDAoyBRBbm+QGrhLvqscTYZiOMhW/SPyI
 2FiT1ftWQNmiHsQfoml3iEM3IhVpn9x19DUxFeBqbdcpt8hwKgQ1hLHKH w==;
X-CSE-ConnectionGUID: q/kBnLjMSJ+YpypZRoaN9Q==
X-CSE-MsgGUID: xcc/KSgxQZa3xVok5jbEZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38816753"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38816753"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:47:28 -0800
X-CSE-ConnectionGUID: KFvKtxLnSket6+N6V1tLNA==
X-CSE-MsgGUID: IAoZQKW+T6qhuMKraExURQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="114109012"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 11:47:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 11:47:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 11:47:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 11:47:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABnhKmVuunAZ4Rvn9SEPT4f5rPps4pN2Xt8WyvDa4ILz+wO4u9Ss2JCwkXGl95R0lofk/Ogqng/KW5W3MwWlaoeT1wp3yh2fR1HKL1snlYD57SBEsG2CrQgMKlpL9I+Vag7f9XYJgbFj5CttsoCyuPF6ItyDNCSCrMsrAZlDAKifyWur83Bn9gfFUbEPDqP0j/Rg/yTHgB7xlqvl7GukJDtSmKLw/IKv7JbO8RRELCjvsmve3KZxexnuXjnKHsyLITAeJRvSHQ5BlOrjGuoPRHZGjgFWCCleWURabPabbXkkFDxr2Dhw9D3Na/moKyeraX25E5bad8LaWIE4Cery/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyOUCEcFMdQRlAPP3ztqMeUVEBvlo5JDXCHdBp8M37A=;
 b=empCmMH4HSxp0gG8D8dh8b+Am86TdTsMPDPTJULnSJ5LsouugdTDiy4tZNx4dbPZiu4cATZ6JOLHE+XjhMvvc6uhKBLut4trmM1XN8i44wopcETbWyw+9ftE0jEWF/gc+wKm4sXgxsGZYNmhnVXPXwNtSiAYsWRRWWvzi8MHGIrh20lJ/OtGnoatgBzagzDTQMq7hi/pTwtD3cWGOLI6LxkBW+mtV2QbPSjtpqurYHhfHabPqG0coetcNyJX+mbDkVxiEwKOp2ydY/OPF9mctW9fYOxVc95ioTUXjvEp8Okmm/FrFxfLMLVCusj4SDYqssOROuBkr4R2EeJSB+06ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 19:47:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 19:47:09 +0000
Date: Wed, 29 Jan 2025 13:47:07 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, lkp
 <lkp@intel.com>, "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Fix size_t print format
Message-ID: <53earz4otqa5ydlf2isfzmhdjf7otfvdaavbgmnhymzz55uprs@a4pcg4qej4py>
References: <20250128154242.3371687-1-lucas.demarchi@intel.com>
 <d70d72bede522da63143bd4e318a787516e12627.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d70d72bede522da63143bd4e318a787516e12627.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0248.namprd04.prod.outlook.com
 (2603:10b6:303:88::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9729a5-06ea-431e-783a-08dd409db7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LY62g0bfAigcYzMnKwIiNnVFDNCkxuDqpMUan0k3gwMNEvtMTcAIvuB235?=
 =?iso-8859-1?Q?4M2CxOH13g9R7UzLkO/xZL+sG7ZUHdIF3aw3TEKMm6IbT2MWR3U+NisS9I?=
 =?iso-8859-1?Q?ailjLJYv26MI/8aSU/+ZUyRCMwosTBrTofnSqFx/QeY0ARPg8Ri87UezY3?=
 =?iso-8859-1?Q?hvKEXbvddM2ishZVAaM+Cb9/p3PAOaPTXoDQsoueIVDaMwR4OCECl/Qqw+?=
 =?iso-8859-1?Q?XfCo/VJYF2nPiz8E0GEXqE2OjFh6q+YIgdDfyzVNx3r1EonGI5Czj7p/az?=
 =?iso-8859-1?Q?/p01L8bc+gdo8jUaxD/y65aUyRSFIpGC+HUnr2Mhrbdkfdsa6Ro48AAdMb?=
 =?iso-8859-1?Q?AUE2v96a0f0hru9L7Et36454mwhejKESkPrW0rvKmPx7TkG1JzEmF9W8Sw?=
 =?iso-8859-1?Q?JzACsWKP1WJGc66SuWylisLW+44zCOD6Cw1ApEfwtzCwYmaabE3luItfKO?=
 =?iso-8859-1?Q?/chn3BG/fc6pX+c8G6mEVf9ELF2IZYCT2RC8cbeYzNfhgWpPsb2fQekz4G?=
 =?iso-8859-1?Q?X0RmzjqHt7LcjEhAZUc7k7lAZzmZsfigdAZqZvkOtkhQ3jtYAJxRJE50kQ?=
 =?iso-8859-1?Q?NcrJ5dL1GWiT+st406DildrwSOeWU0/jGgMRhlNqWS7UhV0IbPpVtJOAUK?=
 =?iso-8859-1?Q?PHFARgVNXI9EYQ0f45fJy/oFLQY87mPbP/E98pvKR3beCkE9zXqu9ySSsF?=
 =?iso-8859-1?Q?l5VA0HGNKIKUGTtW2DQnUeAcgLEU+418S5XLLbfQUy73bhPXLOJd+19aI3?=
 =?iso-8859-1?Q?Fxa2Nm9sNf+2GAOF6S+7ErkEhJIMQJzsEqv8AwJTMR2QMlNauq/AHuEJ4N?=
 =?iso-8859-1?Q?zjmJA+oG50TQvKRgfl+tvpYxBv6PoTARu6/EmxVDG4W12ToBOJUvRJhncX?=
 =?iso-8859-1?Q?+buO1yQOBuv3Eng/r4QPHrVZeEz5P2CDxVJAwNe9YI072jGrYBtD9EFpGo?=
 =?iso-8859-1?Q?yon+SwrLSBvtRTsXuOTM2UTplJ3FDKDzSDPWMyp+WHpV6SNJizFHwu50TV?=
 =?iso-8859-1?Q?JF2foVq3yC21LC/E7NVL2ftHCag5YFIx9ypiX3jL4kk503h6BqMnADJd//?=
 =?iso-8859-1?Q?brqi150Zm1LjRmFjRMq3F2yykoYtmIf+CqOFbf5Fo7Kv0VjDdzTqLGA4Y8?=
 =?iso-8859-1?Q?9M8xqJIUaUQmWQRwiRaA+EXe4Bky6SxTl4TPZa+bbB5FDf1PYEc9+NuA29?=
 =?iso-8859-1?Q?cWbB+Y8MyUHPMrPdV9T/Sp5X3ABMoCheUMHRJht9YskQKd0KM6VthS/Fwn?=
 =?iso-8859-1?Q?rbtWHWoRqWbVs6JEVJJkpTwFXXAYCpRWq4wjnVE7HhZ3VSXdYn1Gd5qX0l?=
 =?iso-8859-1?Q?8DHVrntxq3XoJ3tUyKqUVFOxgnYSE+IkDtWwAPwCeMvvLJ+Uuy1SrsTM1e?=
 =?iso-8859-1?Q?JG/T2cuQNoY3ixDeRAvyXUMuCKt5hq95Pgksqm+1LmLQ48KB65BpWUwhOO?=
 =?iso-8859-1?Q?b+0dNo65ktCueL9X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aVWpQ35JQze7+TquSauzkyN6CTNTZJgDBQU2OLU0PYHJUAOAgLIpTqLVQ2?=
 =?iso-8859-1?Q?7vyy+uwBRI1iv4GzjRUpHn1shegZVDFv+fFrB+fwhHdG1xAqsbi+m9tfqW?=
 =?iso-8859-1?Q?oZf1hKExnnNe8ZG4ityYnVFlJSn8yUL11Q6SI7QM59nF4GRhiBv9xentNU?=
 =?iso-8859-1?Q?MdwdOb+xJlr4nLFfoyO+WYtp9lehvpJLVaL2oGKXoaIcnMn3JHmkAsCTpE?=
 =?iso-8859-1?Q?Lb6bTeZQkmyjKFpExVdJjDTgp4DtkTiqvLIhiy700yFnIO3yt/iDlXkTgF?=
 =?iso-8859-1?Q?TcjdYsOTzuHNWPgbErmkSCyxN7jeCOAWWG1nKkdm/Mg38W9AdFfBGHbp7d?=
 =?iso-8859-1?Q?d5wIMZJ3heJq8JgAiFcV7XMstEJ0OLZsiHcvKwCqubCxb4CyhyhPghTIey?=
 =?iso-8859-1?Q?q08b3y8dTUH8KQjjabfa5ifuhidT4wRnwjVJyGkMoYUDfhV5qykhY01WoU?=
 =?iso-8859-1?Q?GorMCOhX7aZVMvy49PemMqhl+eBE5iTZe3faPMrZEgOu71it6h+Lc4vkGe?=
 =?iso-8859-1?Q?B5KtjyYtckTErd4dZL5UOphsOjcG2Ei3egXP0vmKvJzL5g0lnUnGcJVJS+?=
 =?iso-8859-1?Q?VBLcVIcKGpCHJPoVkqK03QI1+sN971P6mhlA8xQJFX1eo9eWNWoq2C+vUQ?=
 =?iso-8859-1?Q?Hmr4O6E+oY9MlJVSM8z8H/jb3BL952M7U1Z5t14FS5sT007BYWdXU9j0Ad?=
 =?iso-8859-1?Q?xz7v8Hzs6fqiA29JiWUW/ws6fmjHUkrGWeMj6cbu54z92iHMoSE7bOz2Ug?=
 =?iso-8859-1?Q?Rvuv+2cJTlbJLbJdCrx2rjj44cL7yqzDtdLqq5Ks/arNhzDCIPirEkerrX?=
 =?iso-8859-1?Q?Jf1dzoitjl7RB7ddJ/crSfmiwVfdq2ude8e6Auy/hJyBDHeHQ2m8D0pN+d?=
 =?iso-8859-1?Q?68/z8oeYuOLUegD7cbu8Q6IYntbSlm8Fb7aHI1qSzWyXS9gUWkEGIsvcJb?=
 =?iso-8859-1?Q?/kH+aCtwfa+izZaYJlJKIoYxITFUQBO0PNNuFDWMpAVeJMzOKp03cjKAaB?=
 =?iso-8859-1?Q?PKKCXTTFQOSnDmb8l0JOdZgFwL95kwuGTrq+RgzJk2rZBgn6S06u13xRuE?=
 =?iso-8859-1?Q?R6IoYMLuMLm8EWqY5kX8pv2q0fGwNMPkvisxd0UVdjgTjxi2ShigssuWVa?=
 =?iso-8859-1?Q?fJ6b7xGobHTekeFUAvrEXcFBhAvgzx/wVWAwp31cM8E0BiXreWIoH1xnKP?=
 =?iso-8859-1?Q?6KQ1wMOQGbZm7tLZncGyk9wtvsLsi9f3ZwnDVMilAmx1vzqF0Jb5viagEr?=
 =?iso-8859-1?Q?Ue1m3ZAL4nR1iS1rUNBdgfV8SzOdo+4IBylJtzzuLAfa5Fl3ML1g9Ah6+a?=
 =?iso-8859-1?Q?yY+p6UhQ4Zj3re5S9QHgnyV8mZHBXUeHadKtwE+865IwC4nXO7KCuwxIYr?=
 =?iso-8859-1?Q?ripfR6gUOo3IXEjJJ7MbyCc6PrsmUeCuyGEMXKZWQsVh2+k6TwAxyX6+EB?=
 =?iso-8859-1?Q?eiEYc7BkdwSFc7OQHv4ycAtQ5slhREMPcnPE38zvEOInsXk8M2jP94ZUtO?=
 =?iso-8859-1?Q?Njj2qiHB99aSvhfDRZV+MOOnhIxULlTvexgEt+6+fQJS/ioJ5DbsO4mzhT?=
 =?iso-8859-1?Q?8kIohCOjzAk15dqmD7VFtHt4yoJ6/V/lcbyiC/AUCBJco2CGMKiI43rKi5?=
 =?iso-8859-1?Q?pzsmXSW6pPMyDF/Dlf+tY10xKyJl4A/tbnJ7d2Rr7Mlis2c+Kx7lfIlQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9729a5-06ea-431e-783a-08dd409db7b0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 19:47:09.4206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXYIB87c4Am4SrSKC7EgNdp06yz0fzK8RjREm6Y8zXtR5uX5ZxaRMtYyQNaNqZSA9XLTEOKGbj0bs/mnzzhknbJrM3auCQb7IF5acFJegeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6950
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

On Wed, Jan 29, 2025 at 01:26:25PM -0600, Stuart Summers wrote:
>On Tue, 2025-01-28 at 07:42 -0800, Lucas De Marchi wrote:
>> Use %zx format to print size_t to remove the following warning when
>> building for i386:
>>
>>    include/linux/vmstat.h:518:36: warning: arithmetic between
>> different enumeration types ('enum node_stat_item' and 'enum
>> lru_list') [-Wenum-enum-conversion]
>>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; //
>> skip "nr_"
>>          |                               ~~~~~~~~~~~ ^ ~~~
>> > > drivers/gpu/drm/xe/xe_guc_ct.c:1727:43: warning: format specifies
>> > > type 'unsigned long' but the argument has type 'size_t' (aka
>> > > 'unsigned int') [-Wformat]
>>     1727 |                         drm_printf(p, "[CTB].length:
>> 0x%lx\n", snapshot->ctb_size);
>>          |                                                       
>> ~~~     ^~~~~~~~~~~~~~~~~~
>>          |                                                        %zx
>>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes:
>> https://lore.kernel.org/oe-kbuild-all/202501281627.H6nj184e-lkp@intel.com/
>> Fixes: cb1f868ca137 ("drm/xe: Make GUC binaries dump consistent with
>> other binaries in devcoredump")
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>

sorry, I pushed that a little bit before getting t this.


>
>For the test failure, looks like a ci-buglog issue not reporting the
>right logs...
>
>[763.452445] [114/122] (681s left) xe_drm_fdinfo (utilization-others-
>idle)
>[763.517537] Starting subtest: utilization-others-idle
>[770.545124] Subtest utilization-others-idle: SUCCESS (7.026s)
>
>Test seems fine.

yep... wondering if this is a one-of or if we have more similar cases
happening.

Lucas De Marchi

>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c  | 2 +-
>>  drivers/gpu/drm/xe/xe_guc_log.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 497036675a38c..72ad576fc18eb 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1724,7 +1724,7 @@ void xe_guc_ct_snapshot_print(struct
>> xe_guc_ct_snapshot *snapshot,
>>                            snapshot->g2h_outstanding);
>>  
>>                 if (snapshot->ctb) {
>> -                       drm_printf(p, "[CTB].length: 0x%lx\n",
>> snapshot->ctb_size);
>> +                       drm_printf(p, "[CTB].length: 0x%zx\n",
>> snapshot->ctb_size);
>>                         xe_print_blob_ascii85(p, "[CTB].data", '\n',
>>                                               snapshot->ctb, 0,
>> snapshot->ctb_size);
>>                 }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
>> b/drivers/gpu/drm/xe/xe_guc_log.c
>> index ab97ac728d7a8..80514a446ba28 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -204,7 +204,7 @@ void xe_guc_log_snapshot_print(struct
>> xe_guc_log_snapshot *snapshot, struct drm_
>>         drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot-
>> >stamp, snapshot->stamp);
>>         drm_printf(p, "Log level: %u\n", snapshot->level);
>>  
>> -       drm_printf(p, "[LOG].length: 0x%lx\n", snapshot->size);
>> +       drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
>>         remain = snapshot->size;
>>         for (i = 0; i < snapshot->num_chunks; i++) {
>>                 size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>
