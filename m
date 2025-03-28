Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1AAC3600B
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 02:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E215A10E963;
	Fri, 28 Mar 2025 02:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxbtxjRT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB3A10E963
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 02:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743130529; x=1774666529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qtzk+G9h45tpWfwcYU4NHDhOhDwKr5Ut1MTAC+zawzM=;
 b=nxbtxjRT2LQY9ctp2XKTK3Vo2wJJNy0Wjp1XG4jjJe0BB+N+uA20RI+J
 wKg+Hp5kcWAYNT1qVQIxY9vdu5MkuF3LWkrbur0Nxqv82qVzIxSRHhgfh
 rg8brKnPiXXXqglWl7qgzAEKuQzioWeyMZ3jkN88SO5E+cO2OFPyoFNJM
 7hWbzIp1G98B1f2Q85dmgOh9ZUBySWFQjoQaKtuzGQatk+Loyje/pc6yX
 mVzvLt9rO2OtaPjdG3qTKuVL5pTMcpcRXYiOOQC7XS65+memcPuYuaURh
 02IfUusNSFP79LMFUntE0mHyfJSDGELP7i+CFn6lSYXQqL6ZM8Hl1ejkr A==;
X-CSE-ConnectionGUID: mWq9L1xCSSSPJU6CFsnMMA==
X-CSE-MsgGUID: yaryLUMlTpKAM+m9XMg25w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55856438"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="55856438"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 19:55:26 -0700
X-CSE-ConnectionGUID: fbe/4wJDQrKaRs+cgHI1xg==
X-CSE-MsgGUID: DtrSbgFWTNOFz8BEuhH+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125073258"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 19:55:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 19:55:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 19:55:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 19:55:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7cYztmzlj/xTYYDR1aUBhlwZUOykNXYgMIwWY0CGQ4WjXE1Mz8dYvFiw/PzCoO7+eTxE1+hjz6aZGhTAIZ4NfFcSpYVEmzr8///syT7YEqQ6OgUhq3WMa5OVKUDO8hURsZXelyY0g4LoJLCxVGqgtNE/93CvaaKlnV1CQGH6JdljyAq02y6hg5aQC/nzgbX/MHw+b+VG4V20TZykAjFuo14qpqY/5BtpKtBy62iO82sKSCd8oa0bbXNQEUcIdtfR2xTORY5z5D51cUGaauFMOA39Dx9QMsAaWa0ZvGTvUPxIzwQd4esqyZNIiJKNTD6D0FngvNotvAFfQ85CBt5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPr6aC6n5ss50IqqoDPyoY7SgjqNq8criWuCBHZNO7w=;
 b=Y7xUrO0Hl4nlJplc9oLSzzK7STIxqTVqIjdH21aF1kRMTEV6DltTW5gZbCqxsW8yz4xuMHLsqixHWyvl71zHc7e0UmKH16itaLvVDHiWbjYFLJ3QoqhZ2LTV1KpSdB5nQdDiehP+5mXkeG00kulrpxi0wsBj/GhfFqjpmhWd5sVqZpdgVoAoIt9ZEFEIi1KM7amGmvfcq7NIz9l7gZHpkM410D27Dd0Rgrf0JP3ESdes12+hF1AjbWuJMqza1j1ix4ziF8nDxZ2M5/lKpXbg4zfYx91+hLJno0ro+EeGJZsctcypKp0GFqDv1G8yrFBPHLPvY1Rq0YCvBadNhM4sfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPFD80FA6330.namprd11.prod.outlook.com (2603:10b6:518:1::d52)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 02:55:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 02:55:09 +0000
Date: Thu, 27 Mar 2025 19:56:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 06/29] drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to
 take an increment value
Message-ID: <Z+YP1WAm4SwyD3xy@lstrano-desk.jf.intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-7-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0255.namprd04.prod.outlook.com
 (2603:10b6:303:88::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPFD80FA6330:EE_
X-MS-Office365-Filtering-Correlation-Id: b924bb75-73ff-4da7-f8bb-08dd6da3f353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kmQGUVD1+uisBHE0DTbHfeVkBBR6tBNHck1bkCknQFoRDMdNf3obQsxDEeG/?=
 =?us-ascii?Q?Rx4cpfJzUoPhfOXlhkI9H4SHTtJsVI1kgRGd9DGQo51Zxvtiz1vbdsxjCYNh?=
 =?us-ascii?Q?HxsWEzig3c6+3ej/0PqqrjROC4mcWoanwWSF8BchnjcNFtmcsPL2NO0cbq1M?=
 =?us-ascii?Q?yJ++BLZr7NfDZYoHsz3d/sl7U+0zf9VTK2ftdX1J/QYN4pG2yth26w1Tdi4t?=
 =?us-ascii?Q?+WzdY0dqXl2PqEMzn8uuxnitr6+TbZCo++gi8N1jp/6tVdeDfySkYYOh2uIH?=
 =?us-ascii?Q?qSDmecw4faY2l+IMP5K508emzggV857+KitCCiz42X8lzpMIvoSiLz0wETdV?=
 =?us-ascii?Q?D8Rmbmcqctm7k4hiC6d+d7wt+v7bBYfV7cV9IBOMLBhq+/BStEajkxA2Kxku?=
 =?us-ascii?Q?zqHSd7ruD4Z/cTIJwqGu42gbItSeopo1avys6d1iTrinfRRTybXXiMKiG4U0?=
 =?us-ascii?Q?CW4NFTC49XXgMp34I2APqS0buXZbc+lEagaXqz/SVY68LWTR8sAItSL60BbU?=
 =?us-ascii?Q?i2wpoLxJtms3Se8XBka7xCjuHNXhrj4QVAF0v2pmxOPgBMuY9zhkQ4l8SQuk?=
 =?us-ascii?Q?RelcxhzUop9p1oV8Ovekl/wl4/KgzGWH2QvQ9tJSVNgtgR+Hbq4WWny4AvDf?=
 =?us-ascii?Q?9uPMg/VGpFAVdepr4u2kYtNDVdF3tKd5QYhH0eJAxI36KeqUnY1obJpTPA6q?=
 =?us-ascii?Q?N/ZkBqliW9O7BlxQkUEsip3gTZY8sk1gDJr+smoVKftG+Uif5CIlG70WJXN3?=
 =?us-ascii?Q?tHkWmiUan2wUGfm3lQmJO5ZlV+DQ0X7vQfGMm8MgBzvaywhuSxy4c/RWDajr?=
 =?us-ascii?Q?RPw6AeiQsEXI0BrRgYWMny7FwU0KHjVjxhwYtvzOTLXBcyWr+QpknWd+qCvq?=
 =?us-ascii?Q?1V/RsMR9WO9Y5dnWfVFlA/vc1OWFGjSkoiTKQvilSXluD2yGzJ7FlF39M3Ab?=
 =?us-ascii?Q?yls3Pcvf5Hkh381LSpaYqYUzGekVtcumSb1rVRJQe+CLcufq6Yexp4vHl0j9?=
 =?us-ascii?Q?nSkdZLkIc4/lQcHWsaZFkYWLsw3JXTwr5szTXgShfVXk7eJhUTM7gHnSLrU2?=
 =?us-ascii?Q?0fYSM5my/FVl/KPUdAT0QKSgd8LbhTJh4RTP0Th/g3SKeJziH9l12vy7lgs8?=
 =?us-ascii?Q?EdDM0MT1Nm5YiYu027GZ3diuFf9VVZ+M/akGZg/c5cTlF7/cNG/Xm479f7al?=
 =?us-ascii?Q?jWXq3ZeF19Og/GoKgb4gcIaHcxRTVpIgdjTwX3AZkLnNf0eCwgI6ufwmRSCm?=
 =?us-ascii?Q?DSaQueCockTQukLybRKAI9H6pr2uypTuroRLM/bhrg41g2J+JrK0zGU6UjV9?=
 =?us-ascii?Q?OaV1rMk9Ox6IZ3/fJw/C3LMzuaOVll5xfQJOf4r8bp6/J8x6JISUnuBGK+E7?=
 =?us-ascii?Q?xeNBkYkWxSNitQ/JpfWUahP071nS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uqCVQvzRk83PqUBZspEM7j8rHTGpWq/z8Dd2Nnl5cmO/Cw+z2+S1rUBrBq6z?=
 =?us-ascii?Q?daLsL76KlzXZxtCAHxGCSX+ucdaehVbXAZQjO6+UC14IlTKbS5oSKcILhjeu?=
 =?us-ascii?Q?dxp5Vzyex4PExRsasvaEPwgAqli1+JV1tkO7DDy1PoRFtHndwG39y/CWno8K?=
 =?us-ascii?Q?MIToitaF3YGD4wb7t4rSxbUvw52j/riFu0hxmYnBYjz0qDOTAaaUDWK0+r4o?=
 =?us-ascii?Q?JmAN2+rNty4LSZss7SXoqNaVx6kIZFoygAHyyYenS5hpYrZfbHPy/pJbX5h8?=
 =?us-ascii?Q?Aa9sj9QWZETJ5HQy1bEy1JXCQ0fy/Yt0MhaqO8NTLaJkApUBMICPrmX0vip/?=
 =?us-ascii?Q?BxycWqzf3MeZnX3PK4CF02ROag+99C6fn30Vz3/eTIa8Rl3I/nY99s8/P5T5?=
 =?us-ascii?Q?wCOTSaAL6rXKTIrFM1TDKiqNV+bIYWeYaK+sTuU45aJgoXPlsu0f8exCDggX?=
 =?us-ascii?Q?IKvDXn0JIhqHuDBurJ/R7xr0Oa6weU6oW8QkCUwWlkhDG1whNuBu/hZCLWUG?=
 =?us-ascii?Q?p5wym36nBRV/XjNXSw6udRwFijL9U1e3oetgI5PqAL8xOK0TXBCdJqfbBgPJ?=
 =?us-ascii?Q?nAx2EaNAB2p9+2OG2bSEt8Z3M+kXynNWrgO/Eb/ph2tHx5MsLywFomXEc/Sk?=
 =?us-ascii?Q?ghTkKhie3g3WSO3GXAIhJ2EwT7o1JQg+zmyMhKJeRjKJqIP2YeZ+vo2YMeHC?=
 =?us-ascii?Q?eHevWN4FVh4BeFJu3PNk1n8bnQwIPRKo7kSIIZ9cQ/gPUCH+9JPvwJVGlNyB?=
 =?us-ascii?Q?cZPY0DYtYx6IW72MALbrDLAIwAJfmiXjivJvMxQl32O4XPbauqM5O1A3LpI1?=
 =?us-ascii?Q?sRGrHO4ngN7T8A8yf4FoeAnENSt6wJ/dTB9owIyk+viEGESdexGSn0ZDRSDa?=
 =?us-ascii?Q?ntU4j/Kuckubctis8sAs9rE9TFZRK4ziL0BLybNN86hZGFU4R7lzVduXqFJS?=
 =?us-ascii?Q?aYO1uwV+zTfzB8Ml6zib6bhJC2b/ZMIHPIsasTYZ7MZsSbghepm/tFIM2lly?=
 =?us-ascii?Q?oA81snBpRGmvBp/QQh2qhenMrlkmwFKC5N2qhv9Hqwf4A0h3OMvYr/2p3lVv?=
 =?us-ascii?Q?VIq9PpMjs5013DxqIG9HwFnSejBeiA1WdyRPY9Ia4F0Kfb+Xa8AxGRH0QRu1?=
 =?us-ascii?Q?u6VS64dY3lJc6xLZ/K81Fna4z5izVJSnA1bRx2r7jS1Dlc/l3Gb/jFtLCmDA?=
 =?us-ascii?Q?uK+TFedZo/lNzREgC4RvycBJADRZ0TSoWmCboiYE2D/swYWsUHYiGw7Yi/vo?=
 =?us-ascii?Q?jWssiHvcUhVKRYAWcdZTJ0D3poGjo56u2HztX/IJSEFndIwN7Xw5j8b6KW5I?=
 =?us-ascii?Q?fPikGG2wNStdOpOyC8ZDoZLLhBBcxq5EdUbKT81CeUoSNSSrWzBEDSGW0gtz?=
 =?us-ascii?Q?tPYM1x7naPhwkeaZ8H0gZv1Q6jHLLDZs8bIMorDwM6yg/jos1utIVnBaN225?=
 =?us-ascii?Q?CSX3XrB7wrCkU83EmMPXprqIoD/607sirTUPSLsiI9pSf1KqNOozvDlOgRTk?=
 =?us-ascii?Q?sob8J4xhrdNGeDgGs4ImJbE970DQFowLEFqdTovmW//xAnCX/e94HNm6U3IE?=
 =?us-ascii?Q?V1/ZPbAavlNmgln/F2cJ1vUOKDfDBo8TRint4ROd1JQ0/AN09dVS8RPx/yCr?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b924bb75-73ff-4da7-f8bb-08dd6da3f353
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 02:55:08.7557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiIApoIfB7vhLaoFR3JVkVbmiNIG9RbvxJV3aVgtpzGylvbn1wKv20ojx/85BSlJFU4Qna820xd63+HMPuh4+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD80FA6330
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

On Fri, Mar 14, 2025 at 01:32:03PM +0530, Himal Prasad Ghimiray wrote:
> Prefetch for SVM ranges can have more than one operation to increment,
> hence modify the function to accept an increment value as input.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 60303998bd61..53a80c0af8de 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -806,13 +806,13 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>  		kfree(vops->pt_update_ops[i].ops);
>  }
>  
> -static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
> +static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, u8 inc_val)
>  {
>  	int i;
>  
>  	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>  		if (BIT(i) & tile_mask)
> -			++vops->pt_update_ops[i].num_ops;
> +			vops->pt_update_ops[i].num_ops += inc_val;
>  }
>  
>  static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
> @@ -842,7 +842,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
>  
>  	xe_vm_populate_rebind(op, vma, tile_mask);
>  	list_add_tail(&op->link, &vops->list);
> -	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
>  
>  	return 0;
>  }
> @@ -977,7 +977,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
>  
>  	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
>  	list_add_tail(&op->link, &vops->list);
> -	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
>  
>  	return 0;
>  }
> @@ -1062,7 +1062,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
>  
>  	xe_vm_populate_range_unbind(op, range);
>  	list_add_tail(&op->link, &vops->list);
> -	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
> +	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present, 1);
>  
>  	return 0;
>  }
> @@ -2475,7 +2475,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			if ((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
>  			    !op->map.is_cpu_addr_mirror)
>  				xe_vma_ops_incr_pt_update_ops(vops,
> -							      op->tile_mask);
> +							      op->tile_mask, 1);
>  			break;
>  		}
>  		case DRM_GPUVA_OP_REMAP:
> @@ -2536,7 +2536,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					       (ULL)op->remap.start,
>  					       (ULL)op->remap.range);
>  				} else {
> -					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>  				}
>  			}
>  
> @@ -2565,11 +2565,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					       (ULL)op->remap.start,
>  					       (ULL)op->remap.range);
>  				} else {
> -					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>  				}
>  			}
>  			if (!skip)
> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);

Maybe update the code here (REMAP case) to call
xe_vma_ops_incr_pt_update_ops once. I feel like that would be a bit
cleaner and use the new interface correctly.

Matt

>  			break;
>  		}
>  		case DRM_GPUVA_OP_UNMAP:
> @@ -2581,7 +2581,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				return -EBUSY;
>  
>  			if (!xe_vma_is_cpu_addr_mirror(vma))
> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>  			break;
>  		case DRM_GPUVA_OP_PREFETCH:
>  			vma = gpuva_to_vma(op->base.prefetch.va);
> @@ -2593,7 +2593,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			}
>  
>  			if (!xe_vma_is_cpu_addr_mirror(vma))
> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> -- 
> 2.34.1
> 
