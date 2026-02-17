Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFECE9A03B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 22:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0448972C;
	Tue, 17 Feb 2026 22:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbwhEoDe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B538972C
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 22:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771366229; x=1802902229;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=28UVKeiob3os/U0X3q6o1yXS656Rt3dMz7PkjeJR9jo=;
 b=BbwhEoDeAM0CDvP7u6ZC5HVbDtTHRywgicND4CaoQ54S6UiQsOXtVnSM
 yuvtf2LDpRBRruWJ0iTNe4YTiA6p3W+dv1CKnUC6nze1X4XN3txOIvw//
 95h8K90s5/ozefISKZ5Bw89yY91pVmrVs6wa21u9uNYYW6yytAnzdWHoK
 X7QBThTcGoHVFJjcQJrcvmHD2YJd+Yz3DQdfp5hr8EZIny4o3w41AcjMZ
 zgFrVR8IQXuSt3YeAw4GNFYPdFaHiP4cJ9j+vZ7VIs6HUKIjH6vXVyff3
 a9JBSgTeMW3X971MYGPyIULGEFLjhltfArZI+ochasNADFMyWAMFO9HBP g==;
X-CSE-ConnectionGUID: 9XNIALcjRySDCDv/FAwQvQ==
X-CSE-MsgGUID: miq3RGifRx29DJb0VYCCew==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76304645"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="76304645"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 14:10:28 -0800
X-CSE-ConnectionGUID: XCd0NrRwT9CYHApM4nlkUA==
X-CSE-MsgGUID: XI+A2FrcQwa6DuQT/1WenQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="237015096"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 14:10:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 14:10:27 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 14:10:27 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 14:10:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xe1HtbygFUJp/utcb0qqu6iRjryzKBJpAi49j7fimH6wGM1V9R1moe6KiHIa5Yxxuj/hGyV6ElLsCmUqAb6mIs/27cyHUVi+citqZOvd1Qs7SHfZtBxYTdVV2A/gQtLuuusI+kXbTY93syi3QniCUGqRUZJz6iO4m3hjzdc2iR1GzA/Wwmx2igKOK/dypZttAiLn3jAiuRGEUWXNnRHelxA9CjqxIFWT92i4PWo4+FiJ6dbaeAiy0c9GqVmHJtooCrkugCAn2DisBvVDUz6vfSUqNAo+Nq2QW0hdNbZBTM5p7G6TddZvnnbwjtG4TpPjVKWSgPZkSegIdeuL0YKCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4E4wEjVWjuqR4eolhnkEz2NTbWKBrbeGs3/gFCQntg=;
 b=DUlFCA2b5EvFmpncJ2FbbnPJTtYeZ9A01g1MRXFIbmM7141u0TPzSiOy/TOEfkAhz3cO4muDWtPClXia4oSXX/3lcySWGUraGPT555bRRF9OkIeZiE9ckX7Jm8/OzhWznwwPTBti86uvaGwnqX5iavHiyvFSrUgC/rwaKRmkTNkJk9jGDnTOxeHt1skO63UHWNQyDaxYkbDl3AT7zwFxg+PehsLWKya0Dy91l6yjaweeCq7rV+76LcN5nOtOadW3NIoUiDOGLPfq24SgN+HDr31Y3ec37w/0C7Kpijgm9A8WWS7uvz2dy7bUAYaKZUGz/X6qosy8SicFK5MwvzzFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB6494.namprd11.prod.outlook.com (2603:10b6:8:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 22:10:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 22:10:24 +0000
Date: Tue, 17 Feb 2026 14:10:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v1 3/3] drm/xe/cri: Wedge the device on hardware error
Message-ID: <20260217221022.GS4694@mdroper-desk1.amr.corp.intel.com>
References: <20260217114656.2546878-1-raag.jadav@intel.com>
 <20260217114656.2546878-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260217114656.2546878-4-raag.jadav@intel.com>
X-ClientProxiedBy: BY5PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c37d94a-0e97-4011-94ec-08de6e7159a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0htAI875965GTOavWjXYnG+c2RUbUBVAt/9SckeubvI425xheKOooWS57MrX?=
 =?us-ascii?Q?WTCgk0a7ZpECAmIelKqV8s+9+ltvz+M4dfTZq9XdltiEOOcY0sw12zslmwJY?=
 =?us-ascii?Q?GREQWidx84S64hx3LD2Dj5ZokpY8SYUDtICeqHR05tw77BlcSuoIuPHojYDV?=
 =?us-ascii?Q?JYZo1OkNkEEhXaOwKaa99ZK2apiVRTpetBAj+BONLwxRO4lfHDyy9iPb1WDH?=
 =?us-ascii?Q?v3bYLHrmZaFhfSGCfmvWEbsaw7Fsegg9a3muEdHEleLvStcATD/Ec0eFWjwN?=
 =?us-ascii?Q?03WZozTJfP5pGZNzx+fiphbX7m5B12poif22xfULC9a21x61eMKwySpwxdTt?=
 =?us-ascii?Q?1l6ysdP0zxBAHg3izjroGKOG9Djn+QBvHS/ECR/iwmC6dVBx9AOSLlgb/RjO?=
 =?us-ascii?Q?vWK7oCU6cb6GxNQ9cWVHVjT0GyDwxpXREnEbO1BirpQeRJ2WV65F07f/Eej/?=
 =?us-ascii?Q?CDU5nHkqcnr/yPKyL9vtkPUA8LXCfoE0oGVGki1tzUwWRSWDr6MECKHne/0E?=
 =?us-ascii?Q?UCxhIkVhOwaOozivOHy/VPX3Q4WxleHP1aiiBNyMjPGJmyp7Q0j96P65WSRV?=
 =?us-ascii?Q?3AM4duWixf0qPvrSs8XdXkR9beAyuXdApDgmJOu7S0jX1T2rk8lEbHGOFPst?=
 =?us-ascii?Q?nwG6qi3p2Sv+Ut0NUNWsV0ZlNgrv6/QhvICiBm+l7sS05DrZb/v7zK6vnS94?=
 =?us-ascii?Q?bzi5/MffxJ23zLY4okaKUy9+tTRpJ+SSU/l95h2lS+VBrGo21oPP3YcRA+is?=
 =?us-ascii?Q?1WVeDg8mXXrnRCVvbdygmm/qHYng4IU0TEgymnWH50NYH1WH++sN6OoMLymo?=
 =?us-ascii?Q?cWqece6mGnklPqw7GcrbxKve785uTa9VbMArPhjc6PIz6m3JuooX1GKO6RZR?=
 =?us-ascii?Q?tRaQP7di1zcfZAlF6udKkxRepATZqdHPUUWf+apWWWGa/lvnklm8VFZu7d1a?=
 =?us-ascii?Q?bNhhiPJwf1B4xyDioCUpD6Q0n9Ay5hudAK68QyoUurpoDf23ucEpJFYL8eEp?=
 =?us-ascii?Q?IFsJfJ/jL4U+ndR08m/Z+v/h33Li1dyc3gCaYrH3XOmrEo63ZMn6twiY0UZm?=
 =?us-ascii?Q?PI7KPVzNpayZC2fC1N1X7pe785V5XiOIfLFRSUnfRElZ6xDmYQ2JVzDFuLuS?=
 =?us-ascii?Q?DsVlerILM51BbzKZIYxsrHIESBcjWy649h3vpD/+FehuL1flTKAa32t896yE?=
 =?us-ascii?Q?NPB3F4kf4ERXQU3iQuGzLKZ4t64fgj35iVByjiuYsj1yYH9uYcOqJbp4WpdK?=
 =?us-ascii?Q?Du/vfA7mRo5qNuQDPGxQ+F15vnuKRdrg//y8OwgADTNhLrwCBvtDDKZ3ZpAP?=
 =?us-ascii?Q?ELeCNGg6tSVqYYIaajUfr1Su79sJ5F1cVDF9j2wZoIhCwkQKLT/BVvDG0bZD?=
 =?us-ascii?Q?yeAs4dp7FpHfDGJhmcTREJfL3HTpANRWI/xtXqbp8JLTdQeY2pFvIsgdBQlP?=
 =?us-ascii?Q?+b71HuyoaG+6RT7RxSdnbCsjTqfsasQvtuQky5/9tD0XETJi4OH1Z00jWUcX?=
 =?us-ascii?Q?i/mwc+ZgPEWrbTFmhsExdu/FgEn0N8Tuju8uAsvYcOEBGZyXW9GgWki62rDb?=
 =?us-ascii?Q?KEdl/FxREsV3SAGIdxA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZtoevWKueHuHbtc4JzNqe+ZhK+EtolWqZYA3dM6JhuhGGFHNzJSMq7Z6/UKp?=
 =?us-ascii?Q?rw3TffhYpGZ5eMjNZfEACJK1sTzKGvXjecmmRESsCuc8KNqe8kGDk+cOM+93?=
 =?us-ascii?Q?9GeL/8EUQnV0N80S6PXjxAGA21XDCfjOwTkHLwM9k+lxK8qXutj/sJg0UVp+?=
 =?us-ascii?Q?LXWKziwe9ETUUh+AsyKD2ekiYX1yV9l3wI4vvz1gz/mluVTzX32TRET0gsgZ?=
 =?us-ascii?Q?w6+YAUfz9vvrqqVONqOOYtY9JUOFuVkaG44zoCZFibF8OdPclDRyrYftTizp?=
 =?us-ascii?Q?1RjWfiGzBPPhRDm8h+qSTjLhsqcbHfEyQm8RIC6+WwS+DYcoYXF1dV5wkJiy?=
 =?us-ascii?Q?QaKlfxzHNaH0l1r0ksubkwOk61qsq+2ql4FjR6bXYOMdU2Wg5qhXF+ZNwCVY?=
 =?us-ascii?Q?xAD7DEZ99cG/tVzo3Sqv6e/+BkVqCsU9dd5pquMGCrgRrBSdA3brmzWCJRVQ?=
 =?us-ascii?Q?LTgBw0M+XkzqWRuAaTyzc/DworXGqCAU2VE/OCeZteFvhFwF7hJAZ7kdZR6P?=
 =?us-ascii?Q?eDFs1bMQfDMC7H2Pe3J5xsE6UYeUEmHxFUYXfLlcLHIVpXWcC4sXK2QApL1C?=
 =?us-ascii?Q?80pSup/7dcDyOLAH/yUngif15tFwBTfIdvcL64PY1jcvRI9ckP+REEn6ekKU?=
 =?us-ascii?Q?jXezrwpG5xoEHjWpPkTsAzrUxZ7st7uQisKMtp9BBE3Qc1NY4O6p8uE5K+K1?=
 =?us-ascii?Q?P70xDwzrn5DVEu83fc5plhd5ZkMwXzfaX11FTiIIgjEwAyRQnFzJxLyaLupt?=
 =?us-ascii?Q?KvlTiwIHJBlCjRGS0SdVqOu5A2kkRDUP4qqVcTwJCCD8ys/DkV2OPatvj8k/?=
 =?us-ascii?Q?hLMnGBnLgr789h9mT5DrrTTsfndaRyUunOphU83AOnycyq/fYaqaGWwaIdln?=
 =?us-ascii?Q?+EfkOdcGWZxkE/yj4O4MGbRJw0kYEoTTbXByZdtVxa4fQ/VYehQqfEIffdVU?=
 =?us-ascii?Q?oOvFx0PhYTfc+wId8JsoQoRvLmnWzH2myMZbMcCZb/5v+G5CHwlU/BVIV8HY?=
 =?us-ascii?Q?qfDO+95LBDdlwbKeltU4nq1wbi7JuN3+ThZlOc9lEnvPlQ1xIotREe5IbiBa?=
 =?us-ascii?Q?w34ya6KWB8BJAjBJENGj0+KX2nhjWidc5LUSxxsGwhdbFjByLUt0kuQprnHO?=
 =?us-ascii?Q?27BOop42gpAfruSOcaZtOw2FkambVtScO8nQKjMjDmumzpMTs/2Tuh56cpah?=
 =?us-ascii?Q?9exmzuBRjDU1FFjiURzcYdo4dR2q1tdLRU61utC9IgUvilwEQp0i5u3sDoht?=
 =?us-ascii?Q?nT19+196n2moQnAL76b9MD3fwvl8Bq+yiGfpo4L+wvdY5VfRcAlQ/isGLE4R?=
 =?us-ascii?Q?+n/05CANrIAQCKr99P20BFtekeqbMMBqLD0kJd0fRLb6YQjKbUX5K5Hvpukf?=
 =?us-ascii?Q?iOsnMm9HM43H6BOXtbSE1RAmk24sXKiqXkBGPpxJjDqiXhH0PBtcE8/DsX2P?=
 =?us-ascii?Q?JrBr+nA0YHuYMOWRjMOdskbSSyzSbdmstKSqObC5dktv6DPoLRqeWS6+iEOZ?=
 =?us-ascii?Q?pYUHmd5WzaU3FLHi3hDv9h58em2G7G4tsj73+vre7KyoPNDYuCtNwpiI/ALc?=
 =?us-ascii?Q?tcm4R1dr4lHC5yydg9cALt2eH7t0znNu5sNlFXKrQjW1KNmA9EJ1M9JRp8/N?=
 =?us-ascii?Q?th9LVI3h9ZVN/ECByBE6WrMO4UVFU7x2GhFyqRaLJVDXpktWy62Dir6xpC3a?=
 =?us-ascii?Q?h3up8B2i2KoboYQCqux/4RI1PvC6DjFgVItkLEsiw0KBa+KKRjoZuIOKrQth?=
 =?us-ascii?Q?0e1U101E4umTwmrUBNVbTEtjqLTSLl0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c37d94a-0e97-4011-94ec-08de6e7159a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 22:10:24.8715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRUwzc36fyZjFH9S5TJnQBK2pOwDzDFvgCpoKnjpIy1+8jEjeH6hQ0oappElDIeKA5uzLlFV4g/H9ZJ+5ipIGsMO3Oue3nTuchUxiP8vMvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6494
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

On Tue, Feb 17, 2026 at 05:16:33PM +0530, Raag Jadav wrote:
> Hardware error interrupts are routed to SGUnit only for debug cases on
> Crescent Island. Wedge the device and have it available to the user for
> debugging.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_error.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index b704eab7d3bd..b756cbe321d6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -55,11 +55,11 @@ static void hw_error_work(struct work_struct *work)
>  {
>  	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
>  	struct xe_device *xe = tile_to_xe(tile);
> -	int ret;
>  
> -	ret = xe_survivability_mode_runtime_enable(xe);
> -	if (ret)
> -		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
> +	if (xe->info.platform == XE_CRESCENTISLAND)
> +		xe_device_declare_wedged(xe);
> +	else if (xe->info.platform == XE_BATTLEMAGE)
> +		xe_survivability_mode_runtime_enable(xe);

As on the first patch, it's not clear to me why we have platform checks
here since the general idea of "wedge the device if there's a
hardware-level error" seems like a platform-agnostic concept.

Also, why the BMG platform check?  BMG might be the only platform that
could get into this function today (before your series) since it's the
only one with CSC, but that can change down the road, and I'd expect any
platform with CSC to want to do the same things on a CSC hardware error.

>  }
>  
>  static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> @@ -104,6 +104,17 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>  	unsigned long flags;
>  	u32 err_src;
>  
> +	/*
> +	 * We should never be here for CRI other than debug cases, so retain the hardware
> +	 * state and bail without clearing error registers.
> +	 */

This comment on its own is confusing because this is the general error
handler for hardware errors --- we don't want to wind up here, but if
hardware is truly dying/failing then we would.

The missing explanation is that the [new] policy is that hardware errors
will no longer be reported to the driver via IRQ (and thus won't get to
this handler) but will rather be raised as PCI AER errors and go through
some different PCI subsystem flows.  And as noted on the earlier patch,
that doesn't seem like something that should be platform-specific.  If
there's additional platform-level support needed for the PCI AER flows
to behave properly, that should still be captured as a feature flag
rather than a specific platform check (and the details should be
explained clearly so people understand the criteria that leads the flag
to be set on some platforms and not others).


Matt

> +	if (xe->info.platform == XE_CRESCENTISLAND) {
> +		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported %s error\n",
> +				    tile->id, hw_err_str);
> +		schedule_work(&tile->hw_error_work);
> +		return;
> +	}
> +
>  	if (xe->info.platform != XE_BATTLEMAGE)
>  		return;
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
