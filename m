Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C99FCB624
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 23:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8100010E06B;
	Fri,  6 Mar 2026 23:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUPko3wM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C229C10E06B
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772838990; x=1804374990;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vOxEvpmCbTZtMyQTTbfIO+jqbeMa6vZlCqCIEJYxHys=;
 b=VUPko3wMFm8MUB7gYTMV2wUArj2CKL3DiBpacwQ0xJbt+QZIQsEEBfQb
 xQXj3G1dxritr4JsYxMHpnboHiX9cu4GsGIi3MbmKkfnDtCirfEdukYWF
 cPSvWhkhKE883vzIKxgo9Wc92NoEK8DGuqlg1VlYIi4gPWDv2mR/vm5KW
 jyBtJY1hpPxuC2+AqYKgHzx+R88HCSAGTuUOPQR6FvCTDyF1A1Q884VG3
 2+taej68bQ4HSC8JwUeLR4050m9dOelAEjyORX2xLBbP4FzHnO0EQmA6o
 ySbKhXyG8MsxVjsLnlSb9LuXHivDeX+9XslnQ1ELfLRNPIfvvDrOeSPxW g==;
X-CSE-ConnectionGUID: 6Rmp81zdR5OXZl61RZbD/A==
X-CSE-MsgGUID: awi6GVE/Qja7tEiKsC0iZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77555811"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77555811"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 15:16:30 -0800
X-CSE-ConnectionGUID: +Vy7cy2LQpmce2JYoAzxgA==
X-CSE-MsgGUID: G6tH41JJSf21CeG+4BKmTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="217332464"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 15:16:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 15:16:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 15:16:29 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 15:16:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPdYHHe+xraWNzrC6cWy03J0H7kUh9PHW5Wue0oVnltSbmw55GpJMAwOzcVnfTWUPauZLkZyha50YqFtd8IUQQFQPX8O3RJx+QKgv3D4eUqN0DVXmtt4tblic7KGl84nkhMyd+dGflBHqjIqUrgjKXEJ6zqgF0r/o4LDE2EeF1zuuw5hvPu6j5tVYW0cxYT0y4GCqMqZXE7OW1JkECmDW7pOyXaxf27rWm2oFqXovA8HOCdXoY3XYtalaeC7EC9QTloS9bq04172oCnozFIksDRKOomEh/5JrE/baDjG9L3kCZIGoStQhWY+8axIsg4w4gUmpAwBJVIddgYoT/8Xew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRjyotO+oHQW7xxM/IAiQC742DpGDGCPlXiK1wwGs3c=;
 b=UpSFoR5kktwjDKZInFI1pC2IOWlnq+YRzfDnF+EKJ4nL+ohdwqGUv1uPGZMPnFEVc4TuVEiSFZxbV20MNT3m/+7fGJl68GjXiYiki07jaJli+LERJqbxv0Ym4nw9jaIpTlSLS5pNRxPlYKqbWbkTivKi2xQ+wK2xcfEDT12liImd6w/AXBM89yUoYpQFrzPIkUFTCYBfyJfufZleTag9hDba+bG96HNxm07DS101x+tHI3GjZFfV91K5K4SgI44Y2cB8hb6fEsGy7AeUgdOJQ2HnhXOEF6f6zmdgDWeQDc0NuSdAzQ5yuww8ZPI7qW/5e8+rb8zVvbVWO4c/uB/hbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5957.namprd11.prod.outlook.com (2603:10b6:510:1e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.6; Fri, 6 Mar
 2026 23:16:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 23:16:26 +0000
Date: Fri, 6 Mar 2026 15:16:23 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Raag Jadav <raag.jadav@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 drm/xe/migrate: Refactor xe_migrate_prepare_vm()
Message-ID: <20260306231623.GV4694@mdroper-desk1.amr.corp.intel.com>
References: <20260303101913.3576481-1-raag.jadav@intel.com>
 <177257258747.311574.16166105339280469603@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177257258747.311574.16166105339280469603@a3b018990fe9>
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: ecbe56c9-4a38-4489-0cb4-08de7bd663d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: H9afVvmz5BXlyiKc9CoJECSVRVcJY2BGFfLWrO0NYDfCyNW51m2TbXVEDbbLQfnuBfZopy7Uz525XTN3Y+kxobs7m5aSRGJ/E8bYjenTzga/biCIeRiTqtqiuL1cliyP4zaTEkBDAGSxGIXDCYzzwqfeYkYIf20eXsJm29Z6Fbn4+el6KtiPPSWBr2sRn2ytJ9QgpSjeHUqfu6oAYWe8Mku66WBa8UKT2azFwN0hK3sEoxUXp8lV0sV6kvfWMrqS724tjhEuPV4ShFwnj1wbvdk7eB0nScxnitiBIjQ+G5023LBHmpNk3nH9i9rWI7mh4dYACoWQP+6SaLvNi36Bd0GWCJgHa2hkKn7MgZpVl6n6VJQAgj6IKTXtXZNfP3z/c14mxdKa2l0BG8vwvqlGzTpFoZwx01Hwo9YCaJrimUXt3HSkSWSoHI0m23Ui6PF8wjWZnAeMLTSAKr9s5pnfqWOzgHCj7zeLLNGbTy9hVzAENGAVPPae9Fsvz+6h32YmY8sCEWsLSwStTvKvT6pG6okOKCp6rBgEUSppjS3ymDvNhIdjLoAkSi/FRcQUCfp6j8CUmLIVV/G/fVpoDyHDLYs7Mtqx7kPHCbsIbY7u1GrQKr8PWTKvkJc/IOMQ4RJUamWBwBSrzaa6TEovPFIqFkLEaGKfBEkDY9oKuIhI9fTce9yibzXKFihmiDQxsSXz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?khDGN+qjCFKmfHiNjPDrLfKy81QV/NOfAuvyrtJ5D+psqYDhDwb/w/8baaUf?=
 =?us-ascii?Q?0B6QT9DQqIY+4fbOb2r+W89IuXdFx3v1lnYIZmA0vbud0VUjcSNShyu7DhVF?=
 =?us-ascii?Q?K/CzMHZ2O34Jba/2VrYH3J7Kg27+SOJYpC35pFy9mBqBELrOsbeu0eXXzTRY?=
 =?us-ascii?Q?6iTqjKG+wNH4f+lGB/fTuwwzCHYZ5OsFO4mUtsGzOjuEGttCWhQ+5cVvvROi?=
 =?us-ascii?Q?KGac6/9ynFI7BQjbZhA5EuK8b57SDyecO1gRZbVJLssStfCNlY7CYeYbg5RP?=
 =?us-ascii?Q?0boYNopBni1Znlv0vpSI9ZpMrUhdGEtivdTlopGJFLvpGQAi5YUdUwx9sFcH?=
 =?us-ascii?Q?u68IrPSzGdXVUDPaGY/PHUpJlit8fdBl+PDXac4hFqerUCRB6YbGliuenDBS?=
 =?us-ascii?Q?9ZwC0GN+/smA/ZGRbWUlMIxg54a7MTBBWVnzvdLdLNuK9ntdkTTuGIXI3EDL?=
 =?us-ascii?Q?HQnmAhpgy0KWWSGQMbTKE2qh2EO8Klglqy051zKPE8P5UBRZAGY/4bccBH4j?=
 =?us-ascii?Q?jC9UCQpNGuywCKoq7AgdQwF8OtqyRuQF29SFIQj9u5QBjvcDxPuRqJwvfw8u?=
 =?us-ascii?Q?kWEb7Ie8F1o/7iENaVwsY/Os541KRnWopsNnURBGKnXIpoEB4vdMI29UJZfV?=
 =?us-ascii?Q?tAa7MGtDseVBSxpIu8btX0Qxp33fgsQ0V9WlELu7B705cWkfvaRLqZdLNPWG?=
 =?us-ascii?Q?jT2jxMIeHuaMi10RLvryvxfbEoJNfvPiCVDnkEXb49+wgI45DcoipLHjnT3x?=
 =?us-ascii?Q?CZkhIMoZtWx2/pfbn4LoRrG11jANwqCR7SQ2xsVukIoewfAtITVLOkf94gKT?=
 =?us-ascii?Q?/yH+KtaTS0Jd1/0Ot1bWEegklLYsB4xOvIjOP4jd6ZhH6jW7r/0ESr2Cc8L5?=
 =?us-ascii?Q?ZNijIHGcBsN/p54qHkqeheuHrLRgUILuxqz9efx5h1swf99PW51Wfr7TJEhP?=
 =?us-ascii?Q?FWlXKTXy1wOIY08hzfZ6+7jIZIVedc4CEedsLXn2Gnt1GFA0MXMo2/WZ5An9?=
 =?us-ascii?Q?tyBrBnbsGjJQyEDTRitBYjl6O1ROAgZmMIFrsvimFYFW6OAhZGMO1V5hnspk?=
 =?us-ascii?Q?712qGsny4SZ6tA7idPDN3A8Nqs/TK9nr0AYaHNBBa941gSk0kzYDzoS/XR4h?=
 =?us-ascii?Q?CGYcxAL/fHh2s2aTLEGmzSViirZBNENMuecDn22WTtiGyJMMS37FLCFWfDwA?=
 =?us-ascii?Q?r+komUZyUMAsLMzxGKhTZuBm/9WQzYw0gKI5XBfsNyM3mR8mFnEg0svCsWQG?=
 =?us-ascii?Q?ls4u8SxEB18aejWv3EX/EAlQeYdxGBOMe/6OZ1Wj11vGLtVyZm05j5j9Otmw?=
 =?us-ascii?Q?AETkFNY8Gr8ND7LCjJIdwPT5/p346ax8tToAnNm9pBNssAs7yC7O45Op1Ghk?=
 =?us-ascii?Q?zjbleiqfCX1m8eso1iZrCVo6eZCooBxELE7gU2Nk4dlFx7w4BMOarMvxoYYL?=
 =?us-ascii?Q?8qTdaMwWZKtX8a4lF3hKq7/BMNRUg/XdjNxPPCGIsqZfzxHs0TQ9zUUCRN9l?=
 =?us-ascii?Q?mjK/N7dn+m+UUjI81wTrvX5jbLJEIz8eaLeiSRbidG7C++MG/cMsQ/7zzLqF?=
 =?us-ascii?Q?zFxIrSTtTihK1kTtvh9eekc0wlEnwmzN5fFyzrBeGxFsTHynyw7bcHUF+s8/?=
 =?us-ascii?Q?rAns96XW+erfvdCVlooyKPen8W1qOOoT98V26aKIE0yhH0I4i4CmCKMGTKFU?=
 =?us-ascii?Q?KXkKgLCDdH20kqKD2hRBtvwrqceRCfnmwjdAjZxVIR2SnfX4FV4G+KiJG54G?=
 =?us-ascii?Q?U4NykCEdeDKAWvY9LtS6WdQv1JXtf2s=3D?=
X-Exchange-RoutingPolicyChecked: h5A4/B5m53vj4qnpqcsK2unbtY4shKJEVUqJWDfNN/WtJbffKE1MRW0BbxUh10YEqPAsimihz8ghkTiB8GB91dT25ZZk9/MpRF6B96ABpVwwF+uu5xRg7GiznIu13em7ycaHSBkWPP/lWJGufAz6rJDrP8giOenERZI5H7tFO/R0upkGxwC1vNCmOdA7em6WVX/kDhIEGeIOw77tcWSMa6/8kZfWntiwhyYPzzVKuxlCi3TsapxHTSNdRTv7K/gX8w29MxhC/dZ5+vlEBU874is3lIIA9U6y88/2uK7c8ow8t7zLHPZiDo7GiBKk9bBGEmhf2y2cm0VR3ZXUQwbbGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbe56c9-4a38-4489-0cb4-08de7bd663d0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 23:16:26.2918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwIg9xq4jXNYmS0tlbGUF5KRhgJkJqlIaFeyWJ2s3yJAzkj3RQkWleVoGkcJbcjXheNPFGcn7KBxml4WrKGO1XGwyfg88CsmEvlm0YVlzSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5957
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

On Tue, Mar 03, 2026 at 09:16:27PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/migrate: Refactor xe_migrate_prepare_vm()
> URL   : https://patchwork.freedesktop.org/series/162485/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db_FULL -> xe-pw-162485v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-162485v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][1] ([Intel XE#6054] / [Intel XE#7509]) -> [PASS][2] +3 other tests pass
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162485v1/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][3] ([Intel XE#2142]) -> [PASS][4] +1 other test pass
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162485v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [FAIL][5] ([Intel XE#5625]) -> [PASS][6] +1 other test pass
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162485v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
>   [Intel XE#7509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7509
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db -> xe-pw-162485v1
> 
>   IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db: 7cc5603b0096f346e64753d0a599252e6177c5db
>   xe-pw-162485v1: 162485v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162485v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
