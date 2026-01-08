Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E12D1D478
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 16:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEB410E790;
	Thu,  8 Jan 2026 16:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qu0+l/eB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE7310E790
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767888989; x=1799424989;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=94m1pI+OYa51OEBQUoxo1vEqValVlQnZpTiRKaYq+C0=;
 b=Qu0+l/eBGpSVRz1zW1/ixXesONLtG6kcozShT8q7oWHp5kHeia4+m+gk
 jTHv16pmu9mMWKq7/bX83xi97+4KbPXMkI1nv5mD/4X2n9BC72l/H5DlJ
 03oatIBr9H22W7F4DYvhDFogEvlmRIPY0H3xTxMrfnGK+ZkPvw/SakunI
 ZNUVfHIXbEIbHLl14sEwECK8Z6sa6toJUcCkrZHh040UznaIPndERklfe
 v21YgnWIx9/Os7qpZz1nsKgiThOPhkpunz46MVtr9sUhLyKg8LWJgYk3r
 dhGJwCvXEi1fx7kOmmecEppXfmNMYLRm/mQXixVfOKxyTciJZiayv9FkF A==;
X-CSE-ConnectionGUID: 15J70s5ETuSd0CPd0sSSkw==
X-CSE-MsgGUID: BziI1bevSqWKWhaWcsmzdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86858784"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="86858784"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 08:16:28 -0800
X-CSE-ConnectionGUID: k6NbPU3hRJWEbEDA/DzbbA==
X-CSE-MsgGUID: 1rf8IIGeSLm+Xr432jY6xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="203672977"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 08:16:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:16:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 08:16:28 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:16:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCL5Fs1MK5n5GPukzhqxcRvZlPVHaNHgkU8iY0qO731tAwOccI/lDcIPzHYeEW1djAxaeEUsx4Tqz3fCDcryIx7qu2E7V21W/jhrNAnbHy/oMH8mcH1ruiAW6C0wQAY2AkatUqqWXNJZaRn0oE+ug9r1UsXFN/mIh8j5ZvtndpCc/Y+6/dCgKuB2AV3dzXtIv+bwPTgnaf5F3MtwrpixpH+2iMta6utV40h+wwbUNhJp59LLCc9WDlEpiGwAe415+SJdy1lEMh2JqQdG8pfMNVPQGQTsWNqN+d6WhnpT76Wts2x97YSaV8/xFnushqoXnw4aIJkdXNp7byz0uKGMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp8/V/2x2gNdaL0pN+Dse2EjMpOzQeRdyB7MP7DN2OM=;
 b=IQjiT3sdnAy2wA7Fm+caVAbTAURIpMNHNFiVKiTuKN4iJ/TwZvscyMMRp+8vIJ3SPhWUXZXCMZOGEQziz0cXpJeOhRrvgGHesuU9KO8cAXRRyI5ARTTsGrppfwujOT4MtsOpHubR/UtvZiJhrivvy8FMjFabdxANTNKnr30YNmvJgkmQPXe96Xnw/KTfjFIzb8ZGvtcEC0YJjiiVXejYmQC4CSDuPvpzM37dwPjympBWTw/s+TNMeOMUZOAzcc6HkpfavkPFvnBx/OKMIDgkaQNS9Qq05Nxayo/MUDZ+lr3Y3Cz1DJyUQMqBZPuBS87szXqPxf3Y0HIW39s0RIvjZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7251.namprd11.prod.outlook.com (2603:10b6:610:147::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:16:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 8 Jan 2026
 16:16:19 +0000
Date: Thu, 8 Jan 2026 08:16:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/7] drm/xe: Do not dereference ggtt_node in xe_bo.c
Message-ID: <aV/YURf2F1PPaSjJ@lstrano-desk.jf.intel.com>
References: <20260108101014.579906-9-dev@lankhorst.se>
 <20260108101014.579906-14-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260108101014.579906-14-dev@lankhorst.se>
X-ClientProxiedBy: SJ0PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d96503-98f9-480d-c702-08de4ed14219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I0gCbXcuG82eY20SoXuGsQblXxquKKyHZJtv8dVTtvYyMffBe+m5osmUupJC?=
 =?us-ascii?Q?7dnpqkJY4BpPYUB+Er1Pkz+GwkfUP0BFiJK/9H8vn3e84M/j3ttEdQJI0rVr?=
 =?us-ascii?Q?8QFFihjlImozo6upCpNkEkVwjgW1U3FpLfgkcUa5FNcWTw7j8hkjGSoTX7e6?=
 =?us-ascii?Q?igObe2ci1iE+HAcw/YV6RK7Fh/y88vkfQ1hVzwumKz2kSlpMjngesXctT8Rv?=
 =?us-ascii?Q?glNNMPvGIMatF0gw5Yr2+W62QDHyIkEq01yDgNPW1Tzqc1Bhm2Jw6xYutgXg?=
 =?us-ascii?Q?wEwb7+vpdBbZx789dOEDyJVbD861EoncpsI93CQhOJtW+dSgAUZ8fr1/q7wZ?=
 =?us-ascii?Q?cbYnV1QU+QLdKwA0CKR4nT+9DZEsuef6edG0M+WcmtkbNEYDEfVPr2U9MRCH?=
 =?us-ascii?Q?UB61eqUVO1Zf7N2Wc7Waju+Eh++vJbItG5EycXDC5sZWqTDu2krFmEddf7jW?=
 =?us-ascii?Q?Uf5zxH3tPRFQafK2HDe7uVLwYWmjymvdQKjfKZI4eI88VwJXAoSKwbEIsFR1?=
 =?us-ascii?Q?rruVxVmX1WTsgVaNoC1robUHljJP3VDGdEUa4aExIC44XBmcb0z7VkdHmxwX?=
 =?us-ascii?Q?Uy1K/WQAztTiCg6oAFHhdt4+vN9IVpyIhbLsfLv5p+CsnKFpjQLd8x7eLwbc?=
 =?us-ascii?Q?P3cIcVH7EodYS+hrKbgpRHEhb6asA8Lg1TdtUaoNtlw37Ftage3F0pxcl56E?=
 =?us-ascii?Q?4tJpYL2thMtqenpGplgbWLazHy2fNN4+N48rePOhJ+pEIrF/QHFchY6vSCiZ?=
 =?us-ascii?Q?7W35WCut0vChR2Nn49U6OcfcveNN5LymLyXZmwKTeMxMrA4xkhEUEG4l8GMZ?=
 =?us-ascii?Q?BZuctqtJvpv9i1Uvd3u/gGj/4lRfHo1E7u8Hy/cB6zB2iN7UhmmhhxlnWQ+U?=
 =?us-ascii?Q?ZhHupPbP5i63qW7WPVxJfaKf7TmEAipSy4Cd/LPV8rsrkO7xP753PqQ1jO4+?=
 =?us-ascii?Q?vpCXyeMANJ7JYPbVupHqV2+DwhuHEnEaZTuR/yBvY4GQSVyHvD2E2FnPYC+J?=
 =?us-ascii?Q?MgmfF7KTgC/JjHG4F/2wC2rJEaLy0arY8TMxAvNO6YAg++DCf5E7VD+FPmvk?=
 =?us-ascii?Q?y0rxeVxLQLcKS9UGHE8HF1cC0x/fZafrlNVbvEl7u1jPbIUSckPKF7rW3ksE?=
 =?us-ascii?Q?88KqlCipduuwLD1AlEuiatgmzSMkZIYwLzVqlaPbTrqW/Z5Vsc69fJ+cff0C?=
 =?us-ascii?Q?RMPSufTVxu+zjdULxLt6F/U6Z7WcnYV8uaghTQMwZG/Pv4peJFg9PhXK+2QD?=
 =?us-ascii?Q?kVXK4H2LTWMPpe1CfrCeHba1ZEBfvLees2cnU8nhQuZRrjpnCh7iPua/YfjA?=
 =?us-ascii?Q?3I5JJCs+UPOtB4jVzG9TKe7Sb1A+07DkXnkbrLqYDw+LE2n5OxqChcBMj4gQ?=
 =?us-ascii?Q?sHACnIsghu3iuKlM3F1+/ys/e+lHdq9acbve60q6QXTM/8RjPUw3ChrZta8Q?=
 =?us-ascii?Q?IZN76onEhog5AaoYLsMwVTUNDUmjbhu2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ddjU5ydbdsb17eNZowplcZ/gY5iL7Y+CoFIsjyQBK56m9htC7ogFvLl7fUC?=
 =?us-ascii?Q?yPfj6+3zjuzZa//yonLSEak4j4Fcsm5Gvuu12COaY+0zVTr/Z58l1zkDacZq?=
 =?us-ascii?Q?78efAjaYOTXQKwFSBfTX8ScJuXyxzR/4dZIYz5LKTkuY+ZuG/9eMALThg+w0?=
 =?us-ascii?Q?aTSNEnHS0L1kuzxgzDZelV1CUqWjznU3itFiDFbqp8Olox8+hN//1Aq2Eeiz?=
 =?us-ascii?Q?Q48Y1Jv2MAiNcibSukgAjAgs47BAoJPDGzF4iBodRY1TktTJIERvRRth2fd8?=
 =?us-ascii?Q?tE6vYAFexHkT/jB/9wA7zYlAG5iadbIDKJHdyShddwxaeVYwQDHP2Zl0lml0?=
 =?us-ascii?Q?pa9VaW68LEZvSniyCYHH/fRnpEpg9rbd+HOre8cix18aA529CV5mRV5Q+uUe?=
 =?us-ascii?Q?CAfXIxi7kZPNIpsZUrRsUF2KJSLeRiSYpB2Tu2PJoMAJUvVMr0PkYU8E5sp3?=
 =?us-ascii?Q?ZTLmIl6+8UaqVMoKdwI/34Ka2GAhOTlV5cG3DJEflz9M0Cw6+NDeIaouacQq?=
 =?us-ascii?Q?7VpOrEoGliMgptxSlnnyESwNYguFHb56l4tbWFNFB7udiFPR6497f43S39ZJ?=
 =?us-ascii?Q?JUOK5RnBJItQdsmBI3zmlUVzjZi1rLQRZfPchrfeBkxelAdM6wOLD6s6+PXn?=
 =?us-ascii?Q?Aj49k3Dpc0TzFp6/B8lQwJlhgwCoqvd97L5HFXH18yB9Z7sulyIH6MmpVicm?=
 =?us-ascii?Q?piLQExCsVxkNUtxFcX7APl/2sYNYcO8I2/4aIwpjhj4+66an7NLpoKR014Ru?=
 =?us-ascii?Q?0MXN61hv8OYB9pvOLHdSYvITwLKICz6ZD/6GrEyUHVbpdfH2Z7Nnw0diEb6b?=
 =?us-ascii?Q?PyMmNPq5En6xgSgBQSr10CPwytOKmXFLyhwlsecLy+hb89l6Zhlq3rTIsGUD?=
 =?us-ascii?Q?yHiNnARlG8jJV9jZmBR+gfpJ80P2Dwcd+OivnCUFwCV3wnUwU8WmsRj1YZwv?=
 =?us-ascii?Q?5IfMACNNd+iEawz4mSE4/ZX/W6dF93f3CkXtrQNZIy0347D0GqZFNhblIRMq?=
 =?us-ascii?Q?SKjfTVY883gAJQCTrJK9GwM2u7mqeU5bjj/UNlH772/+HNsxamBMDi9Bzck6?=
 =?us-ascii?Q?Rwj9L6Pb7+XFm0dsM4GCWVCBPNa+bPLKDgF87ZpuIzGzTzzNrJwOj2pou0Fy?=
 =?us-ascii?Q?gLGHYPpms5ZhjflMtC60TUwG32u02JF+fc9FrWdfyu41HZ6sE7s0PwD/XxJE?=
 =?us-ascii?Q?0qgG84R4pjbS6oYvaTPls2Hp2dqdzywZ8EvCYFkIlbCeWG2GC2THWOoSGt9b?=
 =?us-ascii?Q?hKzmmOSkUxYbAAGPBjpclcMmPUxXpjhiQPmbAjhudihqn9px6gxked8vBuAy?=
 =?us-ascii?Q?d1epjmHKAapf05T3GuSmhZnAHMZJw7bnboPLY+Bm1A0O8/IGyIAlI13gFSIq?=
 =?us-ascii?Q?eOIm2rLxAMKvjA7U8oDy0gzunsXdChi9lcYcXctafI9mLZDft9dPodBUHMl6?=
 =?us-ascii?Q?HsmT4JCztl3sz66onwrR/aWqzztcYfqM+av39R9NLM7UnX/m2YaAjC9Uzi42?=
 =?us-ascii?Q?PF0RfbPlAMB6uZc01L2cIX5gEpBo49p1L+SL/W7Wu7ZbPCs1WmR3205EeVuN?=
 =?us-ascii?Q?58z4AfZ8ckjrfOq2+UlMc1jE/a7ic/4VPez8yRaCL9stktoP33GR8c7v17km?=
 =?us-ascii?Q?C3mSTn8SPbWie0eweShUFQZUDcqkw2kqgJMVQB1GSarNT9aZMJ7OGcHs3nj1?=
 =?us-ascii?Q?kp+4KfQOv5FlZHEhgO9yebtiR7HA+zK0rMg8nI+5ls74dVViaSO/whNpDHbj?=
 =?us-ascii?Q?ZjXLwo7k+BEQYKem7e6aZgg9aZ/3eXo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d96503-98f9-480d-c702-08de4ed14219
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:16:19.8392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWStkC4u5J7rMgQZLsN/7FttwmuJuydPZ7KPAVzTDzpPtjVgy3WqvFlxNrBs2fLV58ENS1oh+OWmJTB4lSbp1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7251
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

On Thu, Jan 08, 2026 at 11:10:20AM +0100, Maarten Lankhorst wrote:
> A careful inspection of __xe_ggtt_insert_bo_at() shows that
> the ggtt_node can always be seen as inserted from xe_bo.c
> due to the way error handling is performed.
> 
> The checks are also a little bit too paranoid, since we
> never create a bo with ggtt_node[id] initialised but not
> inserted into the GGTT, which can be seen by looking at
> __xe_ggtt_insert_bo_at()
> 
> Additionally, the size of the GGTT is never bigger than 4 GB,
> so adding a check at that level is incorrect.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8b6474cd3eaf2..21e7a738cfed8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1709,7 +1709,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
>  
>  	for_each_tile(tile, xe, id)
> -		if (bo->ggtt_node[id] && bo->ggtt_node[id]->base.size)
> +		if (bo->ggtt_node[id])
>  			xe_ggtt_remove_bo(tile->mem.ggtt, bo);
>  
>  #ifdef CONFIG_PROC_FS
> @@ -3603,8 +3603,8 @@ void xe_bo_put(struct xe_bo *bo)
>  			might_lock(&bo->client->bos_lock);
>  #endif
>  		for_each_tile(tile, xe_bo_device(bo), id)
> -			if (bo->ggtt_node[id] && bo->ggtt_node[id]->ggtt)
> -				xe_ggtt_might_lock(bo->ggtt_node[id]->ggtt);
> +			if (bo->ggtt_node[id])
> +				xe_ggtt_might_lock(tile->mem.ggtt);
>  		drm_gem_object_put(&bo->ttm.base);
>  	}
>  }
> -- 
> 2.51.0
> 
