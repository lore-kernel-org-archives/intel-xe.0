Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD657EA8131
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 15:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A3410E5B4;
	Tue, 10 Feb 2026 15:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPHrXwSZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6BD10E5B4
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770738645; x=1802274645;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=oTrz3JYuSB/cDFWX3Rft/fw+XFSjgsd9gtRgcepxJF0=;
 b=QPHrXwSZb7gyFyK01Mg7T066GJlZqvfs4QX6/yd6fUpqGE9H5l5LgRpC
 kJh/TMTfA3dH5ZQyqpoVyjmorDtJLhIe2Fz9s8XAUmjag79Fz5glv+eKF
 TK+mof8bLeBi36zgAbzY/Yknp9n9GzMUhTdQKGKrl4Dd9e9owLp8mMwkg
 YIoPDKqSSsfAG/EyVJFuVx+a+4O/QhXT0gwGNWhEhPFbWV2abNHXJ0sjk
 84EUhLYWwkYTdfEAdJYog9TEIUfLG/KfUplsGzGLi0mcsmA0waGNVT7wN
 pZ++FzjOojzk/T/WQ0T4dA8qvSSlM7hOEnEk9pfbMIq3HktDlNif1gnXY w==;
X-CSE-ConnectionGUID: 0h00oI1BSiCvsK9eQmIaFA==
X-CSE-MsgGUID: MSbiCSgvTT65UfyYbj5PkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="70884802"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="70884802"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:50:44 -0800
X-CSE-ConnectionGUID: nI2XVZAoScmI5GrljJFTXg==
X-CSE-MsgGUID: FHtYkb1hTSKYjFLdsMbPIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211057057"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:50:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 07:50:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 07:50:42 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 07:50:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2i+BsNNl01UY8gATxiD6kpS3S09ypaCNZxAa5f0kpWjYGaC2SAmkWSwje9Ky82eZgHF7UfqF4Wxs941EMvplUGfyZFaMl3crAkpeivQ9g1/DGXDor2lx7TrkVduGmgMB3cHFAK4qAYPQnd6zcy+lzK//Nb/W4T5Fj96MdEZCDcPjgRS4iC5XcdJK56AxK7CXAsyjZCLLg9+zA6Owdbg4Q03nUk1gHWkMqD0YxksUgf/f4PG5uOr6JR5tnyEuRUZhQvoV9HXKHPRZqO1pbcnUI67X1qYj3mgxpFDT8j0sbwZkaSH24qwcnH29Dp6nsncXLvG/9b49j+VfqTNiqIoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I71Rqu9X2z4osVRNAc6TW9KuT6jov78onoXokjVsSSY=;
 b=mVX8BWaErSJD3tQfVlAcJISrfeNbwi1xfiLrzUs4m3y3cAy1lA70dBPWdZ9KFvULtBd2BIHvr88xHPum+scuGRtQFsF6ZuU5q7xbqDlXwsCDjJrObCvKCR8aR5+CMhhZFZdETxRMgz6evGdQgMxEyu6zerV6WGwgiH0R49QOR4AIiTyQxuzacbbZj+X0PwmdlXiIeXYlHkboPdaFKCYpa6TrppG/nvybk4n4U4Ck83299xOHMKsIEbIR7vXQg1L/QMotgZdXK+cMjOCrk7spPTxLRCVbfGXcxmKCO+fxwliEDLCJyPppgrzY1CBBo8T0BxHDI78snLBwNmsjm96Xpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4600.namprd11.prod.outlook.com (2603:10b6:208:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 10 Feb
 2026 15:50:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 15:50:37 +0000
Date: Tue, 10 Feb 2026 07:50:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe=2Fxe2=5Fhpg?= =?utf-8?Q?=3A?= Fix handling of
 Wa_14019988906 & Wa_14019877138
Message-ID: <20260210155034.GA4694@mdroper-desk1.amr.corp.intel.com>
References: <20260205220508.51905-2-matthew.d.roper@intel.com>
 <177043178166.235304.4147149204050758394@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177043178166.235304.4147149204050758394@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4600:EE_
X-MS-Office365-Filtering-Correlation-Id: 919bf056-ee4d-4c70-06ed-08de68bc2233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0ExWtK9mnqY/FQimGEKiUI9j5XjpgktEKaaQ8mXzvS0na1n9tF91XrvFFI3S?=
 =?us-ascii?Q?83HTa3+oBAGZsUq7NZxD3UD4Ri9OSQXz1nZfugVsFlomTYm8w1jgHz5GGRLA?=
 =?us-ascii?Q?p/xnBM/nwjrWcTY6UEhoNs3OrqCMvPLKj1MpiFsO/B/E4PUbFdCG/vNvT8IJ?=
 =?us-ascii?Q?j040yQmDKO9M41903UMkccHPite9Ck/kHt1EB2Jfr1SAd1Gs/ywcPnkALQcM?=
 =?us-ascii?Q?3bgb6p64BbJLFPJWkUbiuY+Css8PPxhCybDbiPiecfPYu5aBsK5FUuElc54D?=
 =?us-ascii?Q?EOJjGTXysZdB9y9+kjehiKJyr1B3q4ubv+dmGG/kIuLD7Naegq1Iwqxmcy4w?=
 =?us-ascii?Q?7Zwx4+7fHZMwkMcw0BFA9awhEw8/Xd2CpvMVljS8JqVHjGnPHJDVVvUMt3J7?=
 =?us-ascii?Q?FVmWJ51M9u8m7Ecuhl67nAdxX1vRlhYR5iOYOxbTgNzv3mdWF3W9fxHYDfmW?=
 =?us-ascii?Q?yr2sNusCkbntmhahxMq1N9YYPaDuw4aMKvmaLfuseUTnwQ6GtAVW3MviOAfJ?=
 =?us-ascii?Q?pSA0PYctiM21p5roFEQDdk+1px/McLRLp9Vg4Gu4kWLLL4eZuvYQwtfIedJl?=
 =?us-ascii?Q?x1Z5o6OvJWDi4UHWHAfeIcfpHIyv9nIOvvSJDiMNINKZk22MQyiASxa2aNiX?=
 =?us-ascii?Q?odl0opDiluyOKuhxuo0qdJgX6gGMF2zm2smScSksWhTSCIIAmYZqJALDgG29?=
 =?us-ascii?Q?5kfGPUif2yBD2FJ+mlfzp1f8N4DoDysX32T/7Z4E+DxftEQCyZGMHZ46Wj8b?=
 =?us-ascii?Q?tXL9J6lsbh4ta58FFkIWi874T+MoKn2sp2/cIAwUCFi5vbhyP+39bX512Vrw?=
 =?us-ascii?Q?fsmF6ZcG/MnexPmM8c8AGagVi1zaitP8liX8+CKCyAljm7z9Mhttvn4+3Are?=
 =?us-ascii?Q?v94bUU/mGULn3VfTcT95cPoUnOLatV7V0TiUBDqr2MnnJXftyCudTT/LIKKb?=
 =?us-ascii?Q?fFWutGIRDxNijXOIv3i+HG3XcpNion9mPZOHBuoP4idQB1EHmytevtDJNtD4?=
 =?us-ascii?Q?/nA/liwo+jhUW1f0ohv4JZPioj3HQvO0mtag7Ms8jNlx+hxblLuXs0kzEQTT?=
 =?us-ascii?Q?NdJb/DyeTX8VLWwjpnuZLoZ0LwVFTfCkw9kyq5SkAQhqSPk73O0gq8+TiBk0?=
 =?us-ascii?Q?6JND5gov2nWDI7urcnMlCylS0B6i/3dm306lBITr2+KCwSJ+I92V6qu6cDxP?=
 =?us-ascii?Q?TUZVX6fVcZq9RPxqb29x38pvK4gZPpROK42SSm/gkyAIPhWNuCHPzAHHsd0N?=
 =?us-ascii?Q?NyLItD6e4QPiwCh2E9PnEXQ4nbkwlKKErCmsno93cWvqWn6pyEUvDiC4DWSJ?=
 =?us-ascii?Q?o39m7pCWb7mA3j5DWWUXrXoSkS1KvM9hC0v8rmTGRtgdS2eUqcKQT6h3xb8U?=
 =?us-ascii?Q?WK5jOVNHFQ9C++4c0frxAYt2U0eDUoD1fpHScLTaAiXj5EOW7Mom7gZuNorK?=
 =?us-ascii?Q?HnvpRUTk4D2assPjHs7VridHh4VYsrlv8Ls+xiHJiAVyrRpH3xmOVszvI3zU?=
 =?us-ascii?Q?n3HaA1uM/mLuTjs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OQI1VRfch3+qcorWU3WBFVf3UjuMdtOOwc6qtIna7AwviYlld0/AmXIvWxn6?=
 =?us-ascii?Q?XvNSMSGUnL63sOYoyw8pJFhwooYKk3gJGle7sn68LYld+JltlcDSuUJ4+PX2?=
 =?us-ascii?Q?SstLvYry72mcQJ0rT+gelJ0H7Ey5Y9E0ahvpeABa5nLgr3bxDKPrfr/+RT0O?=
 =?us-ascii?Q?UYdXXeQ/rkXIIbttWNF9gW/BUcjWWF5X/LwLtLbdRK4nG7CWwUj3QCOzaVbw?=
 =?us-ascii?Q?TFvO3pbgrFpYg9qcUoGGdhgcyXK+B1fPvTaSHX6hnVdDQl0yKRqhfUfLsF2z?=
 =?us-ascii?Q?37lFLFokqynwX75nhZEY+xtisihNZCQUU10j+r9uD3vMeztCHN4qvZkDXqSI?=
 =?us-ascii?Q?aLDCrurYgHacLB3VIA62pI72HCXqMSBOZGb7FSjuksrhMgBmW2HpMzfEU7dJ?=
 =?us-ascii?Q?l6COUQA48kArh0It1dBPBDBiCR73PRtOoZNBCIrRmolqXH8KLOu84Yrdqvd5?=
 =?us-ascii?Q?B7nXTjXbJPDDTY2oepdknTZMCvcMvgtYSLq5ccx544QDB1dLtl6zg52mESYs?=
 =?us-ascii?Q?ooGxJPGq7Zyu8KYo90YoZoKb0Iyu9bmyJQ/JbSB/NWcV/+wcrMzW8YJ0tXky?=
 =?us-ascii?Q?vwzh41GGQUQWU9iJH6Bi2wxx2GUhTRIdQQxLO+x/FvPRE+dIX9GCtTsV+OAL?=
 =?us-ascii?Q?zC4D27NB1r6pIAfedSgxj/dHxW+SBuzSAhWXBK0+ws3jg07rwM3WCz8CFMA2?=
 =?us-ascii?Q?MKQUAEIw6ucHLSEir5GPaWntCbwuqQUtVebHOvo+efhAUG6PMwUa18RHGKWI?=
 =?us-ascii?Q?0UKbQ2qtJXgRurd5EstWbJu4Ec1Okq0IgkfXWmC3grFLe2sbjaW31U4kQCuM?=
 =?us-ascii?Q?icuwwAeE19ixgqCb5275p93uJr5mXopJBlRbIB20Rs480DnP2rsdsZk6wd20?=
 =?us-ascii?Q?TzINaSgGd/P6FbtPaOrk20ocdILUpomjPnxipvx51IYMNAyrYlcNdUtR3zdt?=
 =?us-ascii?Q?lsqPlFCIoEUQ/sO+t5FPZ5YeM0nZw+aaKlAeRmnVd3aevCMD7NwgzI3N7afD?=
 =?us-ascii?Q?Q+/6RvqlrHDjgnHLRViKyaI5Dc37IAE7QfBmY8OTImnbyvY3MfzA2DXOY5hj?=
 =?us-ascii?Q?wIE6mf6CnO9GnW5FsBNSuji2ZLw87hxxVyx+CqdaqxitELPZ3ZecpcUz2Zkq?=
 =?us-ascii?Q?uXpue0dZ7OBHleFJhNMBYErGIIoTSiO02euh1fV2zKyGU6cfmx/fQKpBvsBO?=
 =?us-ascii?Q?y1JMpAxsWysIIih7oWdOHgy7BSl2C4CHq/qZUS0JTrc9oTXU4kB7Lw8BDDki?=
 =?us-ascii?Q?aPwxPH/G1bGw8UoH/h6uACc1EmXjR0mf+cG2tO1klP4ZX070nAlGxdUvYKob?=
 =?us-ascii?Q?Ag87mSrwxYe3EItfW6WUtKDXcI+V/hRU8RodTm8BaXJPcNaBlMJMnlzQh2Q5?=
 =?us-ascii?Q?kQOMwhG9IBLAtIwq30A6iXvcYXDPunrKR0x9mXCcuWbistkZK6IcWT2jSFV+?=
 =?us-ascii?Q?+PYLII9QBdkiGnhfIkwwkS1aNXxc1+7qdJs4sY5uav1txTHfXv9YUhcDH0Pj?=
 =?us-ascii?Q?P8hsEi07U6ksRFCXUpqvecAlc4D3KYrnInrI1a0LgQG+oqJuNPlXXFt+2I9y?=
 =?us-ascii?Q?mvup8dmPKOl5TBiniBXen7wK7ue6QvWgf3bYs38ujxzLwPHP6G6qsFFZa7Ge?=
 =?us-ascii?Q?boHBQG3IqBvNZGG+rcYr0mxE0KLCf2B/IeNdjMd4fNbalVSZY/I+IdqVNZ8M?=
 =?us-ascii?Q?vNPwQP7yCPExPD+jljLlSb7RgaafHZFVTpVrccdEyvg5ATgeUFJtTsOQ5Ghx?=
 =?us-ascii?Q?DVEjxfEBH8AEIAsxOyNKM1fbXfoldjg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 919bf056-ee4d-4c70-06ed-08de68bc2233
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:50:37.2309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BErezCFGAVq9mg3mYisgSe4VQG4BCE1JPkZuKHXP/vsxYZugq3KB/usWXNpz/M/3i04fO2whDwR6W3VpBbcCS4sZS+2uIZ77Arfb3jl9MWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4600
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

On Sat, Feb 07, 2026 at 02:36:21AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2_hpg: Fix handling of Wa_14019988906 & Wa_14019877138
> URL   : https://patchwork.freedesktop.org/series/161223/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4_FULL -> xe-pw-161223v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-161223v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161223v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-161223v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html

Unknown loss of connection to the machine during a display test; no
errors in log.  Doesn't appear related.

> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate@ac-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate@ac-dp2-hdmi-a3.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate@ac-dp2-hdmi-a3.html

Looks like the PCI link went down mid-test.  Not related to this
workaround.

> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-bmg:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html

Test isn't able to enter runtime suspend during the setup phase.  Not
related to this workaround.


Applied to drm-xe-next.  Thanks Shekhar for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161223v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-9/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#7084]) +1 other test incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2325])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178] / [Intel XE#3304]) +1 other test fail
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#6707])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2291]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2316]) +8 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          [PASS][19] -> [ABORT][20] ([Intel XE#1727] / [Intel XE#6652])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate@ad-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][21] -> [INCOMPLETE][22] ([Intel XE#6652])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate@ad-dp2-hdmi-a3.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate@ad-dp2-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7178])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4141]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2312])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7061]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2313]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7111] / [Intel XE#7130]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-a-plane-0:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7130]) +4 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-a-plane-0.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-bmg:          NOTRUN -> [ABORT][31] ([Intel XE#7169]) +1 other test abort
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1406] / [Intel XE#1489])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#1435])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-10/igt@kms_setmode@invalid-clone-single-crtc.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2168])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_vrr@cmrr.html
> 
>   * igt@xe_eudebug_online@interrupt-other:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4837] / [Intel XE#6665])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@xe_eudebug_online@interrupt-other.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][38] -> [INCOMPLETE][39] ([Intel XE#6321])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2322])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html
> 
>   * igt@xe_exec_multi_queue@two-queues-dyn-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6874]) +3 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-dyn-priority.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [PASS][42] -> [FAIL][43] ([Intel XE#5625]) +1 other test fail
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   * igt@xe_exec_system_allocator@twice-large-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4943])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-6/igt@xe_exec_system_allocator@twice-large-mmap-new-huge.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7138]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-bmg:          [PASS][46] -> [INCOMPLETE][47] ([Intel XE#5545])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-3/igt@xe_pm@s3-d3hot-basic-exec.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_survivability@runtime-survivability:
>     - shard-bmg:          [PASS][48] -> [DMESG-WARN][49] ([Intel XE#6627])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-8/igt@xe_survivability@runtime-survivability.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-10/igt@xe_survivability@runtime-survivability.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          [SKIP][50] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][51]
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-bmg:          [SKIP][52] ([Intel XE#2291]) -> [PASS][53] +3 other tests pass
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [FAIL][54] ([Intel XE#6715]) -> [PASS][55]
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-bmg:          [SKIP][56] ([Intel XE#2316]) -> [PASS][57] +3 other tests pass
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][58] ([Intel XE#1503]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-bmg:          [SKIP][60] ([Intel XE#7086]) -> [PASS][61]
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-9/igt@kms_joiner@basic-force-big-joiner.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14:
>     - shard-bmg:          [FAIL][62] ([Intel XE#3304]) -> [SKIP][63] ([Intel XE#7194]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-10/igt@kms_content_protection@lic-type-0-hdcp14.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@uevent-hdcp14:
>     - shard-bmg:          [SKIP][64] ([Intel XE#7194]) -> [FAIL][65] ([Intel XE#6707])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-6/igt@kms_content_protection@uevent-hdcp14.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>     - shard-bmg:          [SKIP][66] ([Intel XE#2311]) -> [SKIP][67] ([Intel XE#2312]) +12 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][68] ([Intel XE#2312]) -> [SKIP][69] ([Intel XE#2311]) +9 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [ABORT][70] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4760] / [Intel XE#7169]) -> [SKIP][71] ([Intel XE#4141])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][72] ([Intel XE#4141]) -> [SKIP][73] ([Intel XE#2312]) +6 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][74] ([Intel XE#2312]) -> [SKIP][75] ([Intel XE#4141]) +2 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][76] ([Intel XE#2312]) -> [SKIP][77] ([Intel XE#2313]) +10 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][78] ([Intel XE#2313]) -> [SKIP][79] ([Intel XE#2312]) +12 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][80] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][81] ([Intel XE#3544])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][82] ([Intel XE#4596]) -> [SKIP][83] ([Intel XE#5021])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          [ABORT][84] ([Intel XE#5466]) -> [ABORT][85] ([Intel XE#5466] / [Intel XE#6652])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
>   [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
>   [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4 -> xe-pw-161223v1
> 
>   IGT_8739: 8739
>   xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4: 59c0fb08bf06aca1ca138f7486028adcd94db7c4
>   xe-pw-161223v1: 161223v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
