Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F56CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 16:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D001610EC73;
	Fri, 17 Oct 2025 16:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1p2v8gH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB1B10EC73
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760717079; x=1792253079;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9Y786UHfnWwrbyTxJuvcn5Yo3pricWriXOs7pQfVPXI=;
 b=Z1p2v8gHnPGaFRPVBpYA9mEttGQEfth2RohBimsimgQrdKbvf5OVfDBx
 U1dqnediGvv9n2QJYQvohH+m/v89p4ZiZ8XF5WQPF2W/CTOfRf7ks1P3F
 mMZCAPfRLsqR1phVCxnSvK4BR9ZVRPXrhZ2L/AZfmv1c+4U0pbCVmOEi+
 wNPU8ez3r9Igx61qSQk5LxKA7eI0s0XLRnTuC3OoBnH7/YyzSrmLq8xop
 yyDMAhwJ326+ZtCiz3carIk5b/yDlbok0az1+CkDnjZb43shK0679H6rw
 7Aig61cIP6pNLF/ayoYNQrkFfuBhwq3548dl5xcCK5gP/UW22LRYCPEVZ Q==;
X-CSE-ConnectionGUID: +bktE5fXS1amio4R6AgcAA==
X-CSE-MsgGUID: vAscPIyRSnq0O161li5ciA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62140904"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="62140904"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:04:30 -0700
X-CSE-ConnectionGUID: QUFGYDn2Saad3Ouu/NuaDw==
X-CSE-MsgGUID: sghsJzHbS7es6dlYeB20+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="181951935"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:04:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 09:04:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 09:04:28 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 09:03:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VU2wptPhgqVbhpk02zEugTsvNuvuFK1EzuNJWAy+etOQkmF/9eNezhVHImPLNALvXjcmIsjJGcyI8W1PARC3IVetRyPqmCsxTHF+7NJRyBDEFngMy2wYLL/v4veww9yDd3OAskjloxBzTA5qcZePzQpXUJgv9dDX48U1lNWE0AMRX5wFoeQ+VAqvWUGfiNIzOEROx1pBVTUpoZAROOM2G8VXNH9O/eLjFoHslBd92FKn739kSccgfToudFwtE8jDxLncxxQGhEwMtFsB7Lv+EydWxrTh/SZ2FLNMjXnqIzmdUl0pGxWyZvJn78OAt20w1fbGNzFpXgaJo9wH0iOUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQZxvgkY2UiWO+89hNx8gaM3cPx3IELES8+Ax7adlPc=;
 b=bOb9+4Oj7fDmz6Cp9ng5y5EHGyphPWovpkk4lICxvdM50AE6Z1L+rTl5+cODjwboIrzP+tDAXcb8sGSDTc+picKmzZxuHQD1axTS6P1QZEKDCVJe5RTGvOHIbpwUlWlAfYtIXdjMQ+WHYbaaJ3zUQO3C8E6yssK9b1KpLn+6WOeWjh9RQK4ibkXYk5Y/hCZoH/feBomppKWgrr/segzT6uuL8+YmNgwUHXwz7/w6Sy18kGBCEkX+mYxZOuwtEOeQDV12CaJP4RiQDp4dSnq2gnjiKb+AeCJvfXLot5DyjcqqDwxPScgIgDK08ZXfv9A8Jx5lZbGU9QvdQzcJ6Vg2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7778.namprd11.prod.outlook.com (2603:10b6:930:76::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 16:03:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 16:03:48 +0000
Date: Fri, 17 Oct 2025 09:03:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 18/24] drm/xe/irq: Split irq mask per engine class
Message-ID: <20251017160345.GR5409@mdroper-desk1.amr.corp.intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-18-3dd173a3097a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251016-xe3p-v3-18-3dd173a3097a@intel.com>
X-ClientProxiedBy: BYAPR11CA0088.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b2d1a9-31f9-44af-8a72-08de0d96c1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cq9ci9tyL/LiuWfoApmHiChJTEceUBbxAzImESXRG7eLkb7+ZWsOmJTgkH2+?=
 =?us-ascii?Q?TYteRr78VQ0BIVUAXeRBM9skLd8TFFsBl5PJ8/YhnfM/8z8GMhH1twK5P5P7?=
 =?us-ascii?Q?uJIuQqgx7pmPnjaAaC2cEChupdfvtvJN1Ac0LG89SYWYu9GmN6wFk9/HvEis?=
 =?us-ascii?Q?G5VdVB6sv863GuG25lLk/F0gngFim5Hq8227jlneNGKTaUqz4kTg31eTQyi/?=
 =?us-ascii?Q?2octnm8L8YBDgccN4LLu9/J6Z299qcuxnCDqQ4fzzpv4c7fDpf8XQ6cTBeNc?=
 =?us-ascii?Q?mVHF0SB7lEPzdirjnUykBpqSMf/9RNpbBq86PjNkIHVY98fmql2lglm2YR4M?=
 =?us-ascii?Q?cakyB6qZMX/SPcv7ZtQ3OrgJeCmKUcz3T9LbzL1k40wXg4AWV/MsLyn3/zNX?=
 =?us-ascii?Q?6rowrZi8hHUMPUqrw7JGo0ZaZsBoaI+GoL5g2r2Vxb+mHYdSOBBZggex21ZP?=
 =?us-ascii?Q?OmVGaYyUQ+lhN6LINrlWAHIjABuxGnlrpnLVJYIZMk6ff0lm9caPtjbynlfu?=
 =?us-ascii?Q?b6Y8JuIL4/13O1uDRApZb6anRUVrlsfX0NjpvCREE9mqtfzLQymrbJFfM6sg?=
 =?us-ascii?Q?L60ECo/Kavxkb+3363T8wGY+y3VPto9XWGUiJ66+oQSs5IhftNtNo+8Fw3V4?=
 =?us-ascii?Q?gua7eSzsOuhEHrwtXfUcJM3Crim62FetVDdWyhBelukKknAltMuYYh0kEGBL?=
 =?us-ascii?Q?8Am/4+zR0Y7rvjPT47oX97bU+qyBklRvQl/IYpZwDE3APIn6YcVNWARtU7nm?=
 =?us-ascii?Q?IdrsSRHW9zmpvWOwDaomCa2Xo3pf/DLL+C7SbRTQsDlM81IqQi6gcFyfHyX5?=
 =?us-ascii?Q?WyM56Cq9Lqm6T2rHHNfvP9GV2+E7QHs4vJEpUSGvftg0uME4YMB4iB+KYu6N?=
 =?us-ascii?Q?DOzHgF11A8JHo8vEzuBm+cu0X3CXsAJWa7tAr6mHnlH3SFJ8OH++d8D2EL2B?=
 =?us-ascii?Q?3JzBPFWnL6p9vAfNmst4uuZpx9q5ZUXbS5WAFMZ6iGJSWcrMGyVhh/GjrGiN?=
 =?us-ascii?Q?9uVyxFZ7lpo4l7DoS0uSCfrBzXupOwijut8le5UQBWOAjKTd8ZdGD9o/MSmD?=
 =?us-ascii?Q?denAQoG0lV6AO9kQsVeg0LNltzLvKApzFVyUsvgHVU94p5zJKXBTwXz6QPJv?=
 =?us-ascii?Q?+k9mT7LByRfBrm/I7yk8H/vI0vdUhJDYRMm42q9A4vpcLWJsq0vgCK/QxJ8k?=
 =?us-ascii?Q?QMF5TDihhhclf1vcyuxp2kAMOeA9pxRiR0Qv+oJnlztZZwz8C5+Dv3hwQSDr?=
 =?us-ascii?Q?2ZtV39VcZERWwvJGVXihWlE/9fyMl+sVpOD1IU9EO0LFWWfe6pzsGBPCVnng?=
 =?us-ascii?Q?VoASNSDWJJoYOUsYXPcdtVlw1tUcuAp4Skhd08b/Ssm7YgqoAjKUXJiOmfyA?=
 =?us-ascii?Q?oJwLLC0L0Uiwm7+mHz0YmT+WJUrpd63JQBl2/B7WgQeUTRt6z4wXXvy7iPsZ?=
 =?us-ascii?Q?Rzq1YkS3sSvL8rCuKlYyUcbQVyB2DZ73?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ay4eVgCcz+Veu/m6AjtGA6f1Ve9xbZCVoWfRf6BSRNjqbgx4/jkha/XeUEtF?=
 =?us-ascii?Q?+O3/3wMHBC7Y1olwrgCxBDPbwtL1dY+rvYr4yYoDKFoCK3VyL1RTHBfiGcoX?=
 =?us-ascii?Q?g27OzTPXDSsT71XzIXXUs8/GOFKPh7kKWKQk0UCukso75hzT7uKQwDbDXs15?=
 =?us-ascii?Q?JJGiLzGfYJaA7xgPcz8rKUQM2xy4RJILk8TBHx3GVuGHPLtgO8SMXCQJY0vA?=
 =?us-ascii?Q?yBz8MCJixLKGCGCgJ5jfAD0tFUaEy6yEPFr49y3eiFJfDZXo58uaO8SrlkaG?=
 =?us-ascii?Q?8geegahibjas+gD7mq8jRfvYTsyPnvMaL4QIPhVMIgMPvwcFqoJiLS18dFaM?=
 =?us-ascii?Q?MQRR861RBQZ7gb4htWg9PQTVaZXqcT7PtiYoVtYtc3fkmpDNUPEBTIVcOccW?=
 =?us-ascii?Q?0c7ALtV++O2xENGqm9+DaN3HvRvn8cZQMVbhBQwsGyT+x8YSJkHXeoVyV4+d?=
 =?us-ascii?Q?DSrukZIP7eX+6nqeYKIBG5csTpPBPmItw+cOE8c6Uviief9Tr2+lLOlVwigW?=
 =?us-ascii?Q?siYl1UfjedA8BCeQHeL17BE03fc+Stq6SarlaBmPfvupJwizh2qSZ4CzMOy2?=
 =?us-ascii?Q?OHRmzgkP9NULQa0X8573NF60jIQ3IB0h/+pTSywRP0y4UnQ9exWd1Ewzslmf?=
 =?us-ascii?Q?v6knbgKdLyp99B8XKC9TMeYZnzrPTSXe4ZmF+kFRLDKjRjYvq5RrxMkPXTJj?=
 =?us-ascii?Q?i2nuqCIPum7+bpc3wsvcV3bupITPPgHOCjNtr7TkchQazSI4XpxcNNswLTHo?=
 =?us-ascii?Q?/mKqFAmOZkuJ9EqfEneAvIErfinb+BiXGhjrL+0XGRX5mYpxOjNat5mP016A?=
 =?us-ascii?Q?a1NcW9MVfbmP1icZ5eubkUbt2EwSMTBFbwuyxuU5mgWCemdmXLpEx8f/YChG?=
 =?us-ascii?Q?lKOgJCk+YlEy8rhvicQJJbLxpm69n1nDI4H1x+JkVewIMqO9wITBBboxp1r7?=
 =?us-ascii?Q?oRfyuinBdNas7zJxLdCq6Lqx13LUdcmwrv5ubWxu9QZh0xkCdDsycvx36sEV?=
 =?us-ascii?Q?TDi1arS4Liq5rb80Pg40QlVZ6jHEyd0p0gf6lpJ8dRLs9cHrx6D549qUuFrt?=
 =?us-ascii?Q?W9gEcjGTiGpKPM5qs9h9EJKuEjncwC/MFdLksh40iglJqD9reEhmu5JJhT8D?=
 =?us-ascii?Q?ZjbXa+mJIfe/Zmcvn/DYLT8r4SuPNC6H4/PnP9NUC/F+XkImmyFAhcNPcOcb?=
 =?us-ascii?Q?jpphjDab60dfNkwD3hpgnfq6na5XoPM8Shh9xWZ2iUy6TwypfdoM2gP6GdgY?=
 =?us-ascii?Q?zWIOKu+9AqDIugoz4QCer+D120i+RKOZTcWN5rAaEK7INVzu4rndKvR1zOrZ?=
 =?us-ascii?Q?KaxkjvDluhRnHNWmDkz9RJUpbw44bszStNjMzAk0vZVhP19NMUz/sVhhV2bV?=
 =?us-ascii?Q?KNWmd7GNxNCt1vs4EnOtj7twgsirU+mgYxa6zOOeY5RqOiPVIacz2zr6RxWV?=
 =?us-ascii?Q?6CBH3tp82+dGnZpOw7EfFdbXniQZKZwvzrzRDxEuj0Q1dRlCcnL95KlaDsjM?=
 =?us-ascii?Q?ytSztgmzaWOpgjUSXw9bfOl2uIAAkPlE1PpBKmkfvJKdoyORpCN86zfzzQDL?=
 =?us-ascii?Q?ReUo5M3AKIJEfe9MKgQn82faTkHeRXybWHt9SY0p53k0vwPRTqIPvBBxjR7V?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b2d1a9-31f9-44af-8a72-08de0d96c1a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 16:03:48.0075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLucaCfXtec+OFDCsQD+0ZSk9uW54UjmBZJBnAOCVKWkfSqRQxTElyuLHdeIOYxm7k0/Z2pQ3P47K0zILAtknwbds/t0nhzl+zyN3RLSqSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7778
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

On Thu, Oct 16, 2025 at 07:26:37PM -0700, Lucas De Marchi wrote:
> Each engine class has a different bitfield structure in the hw. We've
> been just using a common mask for all of them, but this means that we
> could inadvertently set a wrong bit in one class while enabling
> something in another. Split them to make it more future proof.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v2: Fix copy paste mistake: s/vcs/vecs/ (Matt Roper)
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 73 +++++++++++++++++++++++++++++----------------
>  1 file changed, 47 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 9c3a85c4585ed..142f422a5d97e 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -139,25 +139,28 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_mmio *mmio = &gt->mmio;
> -	u32 irqs, dmask, smask;
> -	u32 gsc_mask = 0;
> -	u32 heci_mask = 0;
> +	u32 common_mask, val, gsc_mask = 0, heci_mask = 0,
> +	    rcs_mask = 0, bcs_mask = 0, vcs_mask = 0, vecs_mask = 0,
> +	    ccs_mask = 0;
>  
>  	if (xe_device_uses_memirq(xe))
>  		return;
>  
>  	if (xe_device_uc_enabled(xe)) {
> -		irqs = GT_RENDER_USER_INTERRUPT |
> -			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
> +		common_mask = GT_RENDER_USER_INTERRUPT |
> +			      GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
>  	} else {
> -		irqs = GT_RENDER_USER_INTERRUPT |
> -		       GT_CS_MASTER_ERROR_INTERRUPT |
> -		       GT_CONTEXT_SWITCH_INTERRUPT |
> -		       GT_WAIT_SEMAPHORE_INTERRUPT;
> +		common_mask = GT_RENDER_USER_INTERRUPT |
> +			      GT_CS_MASTER_ERROR_INTERRUPT |
> +			      GT_CONTEXT_SWITCH_INTERRUPT |
> +			      GT_WAIT_SEMAPHORE_INTERRUPT;
>  	}
>  
> -	dmask = irqs << 16 | irqs;
> -	smask = irqs << 16;
> +	rcs_mask |= common_mask;
> +	bcs_mask |= common_mask;
> +	vcs_mask |= common_mask;
> +	vecs_mask |= common_mask;
> +	ccs_mask |= common_mask;
>  
>  	if (xe_gt_is_main_type(gt)) {
>  		/*
> @@ -169,44 +172,62 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  		u32 bcs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
>  
>  		/* Enable interrupts for each engine class */
> -		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
> +		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE,
> +				REG_FIELD_PREP(ENGINE1_MASK, rcs_mask) |
> +				REG_FIELD_PREP(ENGINE0_MASK, bcs_mask));
>  		if (ccs_fuse_mask)
> -			xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
> +			xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE,
> +					REG_FIELD_PREP(ENGINE1_MASK, ccs_mask));
>  
>  		/* Unmask interrupts for each engine instance */
> -		xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
> -		xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
> +		val = ~REG_FIELD_PREP(ENGINE1_MASK, rcs_mask);
> +		xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, val);
> +		val = ~REG_FIELD_PREP(ENGINE1_MASK, bcs_mask);
> +		xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, val);
> +
> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, bcs_mask) |
> +			REG_FIELD_PREP(ENGINE0_MASK, bcs_mask));
>  		if (bcs_fuse_mask & (BIT(1)|BIT(2)))
> -			xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, val);
>  		if (bcs_fuse_mask & (BIT(3)|BIT(4)))
> -			xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, val);
>  		if (bcs_fuse_mask & (BIT(5)|BIT(6)))
> -			xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, val);
>  		if (bcs_fuse_mask & (BIT(7)|BIT(8)))
> -			xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, val);
> +
> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, ccs_mask) |
> +			REG_FIELD_PREP(ENGINE0_MASK, ccs_mask));
>  		if (ccs_fuse_mask & (BIT(0)|BIT(1)))
> -			xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, val);
>  		if (ccs_fuse_mask & (BIT(2)|BIT(3)))
> -			xe_mmio_write32(mmio, CCS2_CCS3_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, CCS2_CCS3_INTR_MASK, val);
>  	}
>  
>  	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
>  		u32 other_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER);
>  
>  		/* Enable interrupts for each engine class */
> -		xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
> +		xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE,
> +				REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
> +				REG_FIELD_PREP(ENGINE0_MASK, vecs_mask));
>  
>  		/* Unmask interrupts for each engine instance */
> -		xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
> -		xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
> -		xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
> +			REG_FIELD_PREP(ENGINE0_MASK, vcs_mask));
> +		xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, val);
> +		xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, val);
> +
> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vecs_mask) |
> +			REG_FIELD_PREP(ENGINE0_MASK, vecs_mask));
> +		xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, val);
>  
>  		/*
>  		 * the heci2 interrupt is enabled via the same register as the
>  		 * GSCCS interrupts, but it has its own mask register.
>  		 */
>  		if (other_fuse_mask) {
> -			gsc_mask = irqs | GSC_ER_COMPLETE;
> +			gsc_mask = common_mask | GSC_ER_COMPLETE;
>  			heci_mask = GSC_IRQ_INTF(1);
>  		} else if (xe->info.has_heci_gscfi) {
>  			gsc_mask = GSC_IRQ_INTF(1);
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
