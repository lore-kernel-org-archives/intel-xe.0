Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFA8C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C083610E69B;
	Thu, 20 Mar 2025 21:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1fmDaz3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6CF10E69B
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 21:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742505951; x=1774041951;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fCyEMko7jaOTfsunS7lE1kKB/54vcZmJe0lVTG5xqhU=;
 b=j1fmDaz3z0y8wXR4WUavzsVSNeR2v+JlpWVZyb4xienvTnNX5mqUWOuK
 awRdLKg2jwp14X9sMgLXGSOs7wtpISWkTS4JFIYp3TZM7DGoSqROrIrAN
 gC+mXvu/GCE76h9LGwmdyX00fp0EuRuGhCxJSlD9EiDEikscWJkLxr964
 BRIDfVS8LsQ0JB4a17C7eloFiQHGLRZVE9ONlnoms71pPrnz8x0D3fMhK
 em3MPZ/VAn+MO70Mnu9ZcxIFCBFOwSEakwShIWHxnVj4j6jqiI3bNk3a2
 KnHnhC5pS0D2bNwdnYqRMUqwWL0DeIUBMi0RkK+Xcg0bRr40Z6gsAEyA5 g==;
X-CSE-ConnectionGUID: DDZnkkS/SOW6+1kuiqbjlg==
X-CSE-MsgGUID: +XVfAujISN+u8hCxyNEbSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43640245"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43640245"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:25:51 -0700
X-CSE-ConnectionGUID: qbzabh4lS9yCTvTtdnWTNg==
X-CSE-MsgGUID: YyrFhPS9Sbigo1Ax1HTVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128329162"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 14:25:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 14:25:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 14:25:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 14:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbxcy0gHgmWF0f/cVaa0xmqNWAXjHuyGF+dSOtPuvcst2xCOeprpzPusYyV9ytNyudWIuTe6BFtWvUXAVZwn+pVOeGwiAZPbNaN6DNlAGt74FTimI0YSeTaeokhejpHbmB5fa5fRm7Qi+lfX4Uj4My2EUMngSM/yLPTXTdR7TaVLEStKwWs4ElI3Prp09BRqi9ABPIbfEhC2sfePDN0gpAs9ifhfyDDwfFwVbvNt9B9OJS7FEM1czypbibzZZ8XPrux7vFTJGtJU//EQ6bjDqfsEShy31krJgO3SOBWsjvn1DAkSPtVXbBYXbS+yj/se9aI317CWA8qls6F6mTxTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WERMG61O4fYGAczEgVIry/rIRVuFf83oTqmQ149tM+c=;
 b=I4VuWjQwmLUGAv0xR/8LlgEUh9fkciISvIuT7QAtqYy3Y1ayPtC7d2GtXAMY24fRuNjEqoIP57TiK99HWPOiOkY9LyNXfDFW2f0Jxu+hU1MWkLmqx8a7IW8qc7K5VlSZTro6Cmk02iV/EI3VJywPN63kwXYMKNsh+05JZZ/tXNQKNMa9SsvmzrcxSAH3ntXNo/bLnOQ7qTPt6bJI+yqEwaKoXLmq8YZ/subl++JTYAYnqFRqLGfImxyPhfFg+P9ktwQXtTP2elrvsTufh2xLpIGOrzeBmC+Bx3BdJgWRTSWnToF88V8ElBdBziaw4QBAa91FkvZS3AK2necm3P+BZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 21:25:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 21:25:18 +0000
Date: Thu, 20 Mar 2025 14:26:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/migrate: Allow xe_migrate_vram() also on
 non-pagefault capable devices
Message-ID: <Z9yIBITH3G1V8tHq@lstrano-desk.jf.intel.com>
References: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
 <20250317104132.8200-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317104132.8200-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:303:dd::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ce0f14-b0c1-4415-4e81-08dd67f5b679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8tRvmXJqRDZd+w8x6ZGN/onrJgFTgtQ3A4SLY1Foh4CbSpMiNRao6OVo9s?=
 =?iso-8859-1?Q?J4np9nELYbgv0EFbDmAmbkgkm+mEuFdeCQci4B3m8FO9rEt0FipeD3vx20?=
 =?iso-8859-1?Q?blK/1+mSVdfmYhn2Wn66MQFMRi8bb8SnBbkul1Yr7XV4nm2+soZiw27AYU?=
 =?iso-8859-1?Q?1Uxyd1Rldt/O+opl5c5SmYMAxW/0smqrt27JKAcbNSyDt817XF572yZFYD?=
 =?iso-8859-1?Q?o4yr3hqQUHoSqUip+enF0mX16jyr0hxLCIJBLU1s/zkzqE2mhPihXPw9Jt?=
 =?iso-8859-1?Q?3LIIth+5WOxrik+5VElNTZfsTEo4+aQxgJDJsVadOnfuR7YYwx7420pJNR?=
 =?iso-8859-1?Q?B9HazkPK1D+ai/2ucfQmleWI0dN85L3h6lPO226jyVX2Yupkz/F7lVY9St?=
 =?iso-8859-1?Q?NhINZ//wqmAE5bFXcnXCYOHXVD6TGpdWKp+2Th1+IPBLmTnA0AMMZsM+84?=
 =?iso-8859-1?Q?Jg+M9KHk2/q21vquY/SFYnpaiCMwJNCh/irYTn9KOHl5HD1lmqOEQOaC8n?=
 =?iso-8859-1?Q?SwJlP9oiFhUw9myy6xISZtkFPQjyR5k3H20OmH46bV6wy0pctCEVD0VTPV?=
 =?iso-8859-1?Q?Ho/XuBDyelyESmub4u157leA6dwHEZRDppbz/kaf1U0mkba8gsA6PblQVV?=
 =?iso-8859-1?Q?qwk/JSlkMvL1Y6lHd55FQV+YE6iDJYhAAie1MUrXooZCN/iK8fcZpgqs+5?=
 =?iso-8859-1?Q?Ivcimqzwix9iePvmtYVTt9/r9fn1wQw0NTKxQNwelzxMCyDXisvDoQE0TZ?=
 =?iso-8859-1?Q?XgJqMXGQ4dbTupoUXNHA1lG5vziuWPSjqXscTutLUSCkeR6Q5GDNkX7EMD?=
 =?iso-8859-1?Q?36wtH9tJn9xZViVimw0arQNSw0vtVCqS2Qwe3XJk9rtQELr1qeyeiUKSBB?=
 =?iso-8859-1?Q?LeS8jO1ihspX8cU2lsGTBDKwJ4ceEoQiAc+IQ69MgxADY3in9Ci4x2A8Dy?=
 =?iso-8859-1?Q?QpvuSSq+gyFEmo9nCdagwZB5pCkBjJd67UjMoDEXfdPEfRtOF3hjz/VQWk?=
 =?iso-8859-1?Q?j5Sd85fDm9eJXAaPzcltVxFuRdhF3N2UxjdJPAiT80Uz6pOafU2Ur+TWqx?=
 =?iso-8859-1?Q?sMKOsQINRu/PSosnttfWN/8IcBS6Cz6iD2bcAC/gaaQxePX6x2EPn3Ibdo?=
 =?iso-8859-1?Q?26E3UhvvAJzglqfqstmLwPaF5AEuYfX9ZMl0r112PXEzbcFirK94SbcJTT?=
 =?iso-8859-1?Q?4MI65mduKiudJFlS0FAm2VoCo3l3UK04r00kqgF0w1uz/FmN/pZ4wzhy+D?=
 =?iso-8859-1?Q?I0aQSpDisbyR3DB05xIY8eS0HtIpP3kPf2CdilC9PCf3VWncHFm+THpYH7?=
 =?iso-8859-1?Q?nhoylF+Cpoe/Ol75VNGTGg5R9NrSlhOXzS28+t7SdZ1c5nBTzxhQ3Elh82?=
 =?iso-8859-1?Q?QIyHeURzKxKa2WZwpCXjM1388R4/yOKHZI19F4biqOzNTGRzLCT2Sjswna?=
 =?iso-8859-1?Q?7/TFc9DrFPANsppr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WuHK5SjmZNbZtUnfs0OrVnsvUIWHahKaJru9ZWUYocl6Ek4oX7l23sOXNB?=
 =?iso-8859-1?Q?nxFZyBrQteLxIonhzYIazbgu5+FMVyoRmdnpVkuECYKFWeYJtNzOsb5R/G?=
 =?iso-8859-1?Q?DT0HfN6k0apc9iIpYrrFd5g1+ilIIhv8N9mV4BFx2VoTITIlWMuhG4Xsqf?=
 =?iso-8859-1?Q?FTkszpkQxRt2yBZLm9Dv3Ftwk3lhaLJ7NJ83V11Rj5ShJdxFqRRk4nGH7K?=
 =?iso-8859-1?Q?9z8GX03vbvO8gvqjnRd75gcqOVA8at0CDe1p66Z/p+BPu/rO13zYPtDX5C?=
 =?iso-8859-1?Q?dsO3ka2pTsrL3Qcvsns4b59DBmn4uKKxSOaQrZwDuZzHNEXM/DsTjFd8is?=
 =?iso-8859-1?Q?6wao79n+UmliBQxo34w7gk/k82UiJWaa8lmDyRuWACxuxxvPzRs4cBWhfF?=
 =?iso-8859-1?Q?xS0MSy6r5E0hcg/9dTAMfvuWXgZ3yJMXiFcbGYTrfrUCrrsUx1CGQ/mLvi?=
 =?iso-8859-1?Q?vAumO7Y3p7OKWRWiasCAyo4aqONxGeo+zm3RULhKykb+NeTp+ExsVeZP5o?=
 =?iso-8859-1?Q?mzEbXL5oAtoZu+qDwlBX0jP4dFKjj+tyVF/ER4e3BNbuAzOfLsVAqUtjNf?=
 =?iso-8859-1?Q?bsxWQhoMiZgh03f9JdrLdJKwI325K58y5jTUVcSgqyyAMWqQIy01EEY9Il?=
 =?iso-8859-1?Q?wMNksi9oOCZy2BnuiOg8EJt0aUku47T5IVeB+BalSYok3Sk2CPvu3r4BJf?=
 =?iso-8859-1?Q?BFKNpGwfauLYotEOnRdqZIoaO117mQCBMb3wkHYtDqJ33F4yrHNX08D9jr?=
 =?iso-8859-1?Q?UKpBBqUhQe3H153ZKaJ8eBpJR1IB1FPs63wLXChRb+5UQDVZIcRsispaSq?=
 =?iso-8859-1?Q?MoUCHPQUjsArWnEt+kC5VuZ6TzW0laVVRCG30hmKZaczWU2J2yuF9vxH2e?=
 =?iso-8859-1?Q?3MysregNvuF/MzY0oceItgprZVA9GrrrtVn2pOohOgDdo6Dq9lDAPvOesu?=
 =?iso-8859-1?Q?1oCtSaksS3EoOMzaim5PHU9McNDnT2U2rplGtCfgtj+e5NhSk0nBfEjLww?=
 =?iso-8859-1?Q?EqpQQ/Wgxy1FUt1nNeoD+OIOGXeRfiAEFKDIhytqzdAYCKbILgYyVJhhvo?=
 =?iso-8859-1?Q?zKPhjAUOHqvSJO/h3KYVfe9lc4JeAqm51Gr3x92eW7GKmHAY4l144FJiOP?=
 =?iso-8859-1?Q?O3c+eb3/OMvgq/aY7XhRo87iqKxPXKY2C/B4Fpej6Yy05N6Yx6lsnD0/x7?=
 =?iso-8859-1?Q?0vRuZUoMApH+w0U5cueSVFVcIqWABU7DDxM4FCdtAzmLXmhuGRW9dYn1wu?=
 =?iso-8859-1?Q?PhM1D8Q2L6XJUX34s6HBKtI7dN6l3T3XwW9gxjbqRnqAtUy0KihMBMzDGx?=
 =?iso-8859-1?Q?QjkhMfzzwniQkuG0sOeIt1C6e3amP8kitGtQgJ6ATngGS4jEoxOtU1Jjdq?=
 =?iso-8859-1?Q?ZNvqUeZPF/gGYI5NF8JOKNuXarEuW5lfmJJ2PeaX5jm7DmyYQEyuhlKGqO?=
 =?iso-8859-1?Q?RhEB8RIfixIx3ETsS3G/UuAEgCgr2AO1Lvn4XHcLnLcV61UjEd+I5LIJkc?=
 =?iso-8859-1?Q?F04B1QIyK+Do5Rq4A5IgV23Idpun8Rs0PetSGkdrFInnSa6VHV1m+Kgp2h?=
 =?iso-8859-1?Q?+AKW5yC2pJUzyl1bbY+ijjIsTnybZR9ebVDw7NC6hDFivTmpsZZzWvMC36?=
 =?iso-8859-1?Q?2JOho0UHZFxQOJrvqJRs92MM6Em0KbDVcDROc0cYfXW1QERuy3yaLtQA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ce0f14-b0c1-4415-4e81-08dd67f5b679
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 21:25:18.4213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ik5JhShPy9LUDRRiCjVYZPgoyDEny23xuhNel3QpPvHENbB9ziWdoj3j18/jyn/I+Adaefjmm6JBdiaWWMB8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
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

On Mon, Mar 17, 2025 at 11:41:31AM +0100, Thomas Hellström wrote:
> The drm_pagemap functionality does not depend on the device having
> recoverable pagefaults available. So allow xe_migrate_vram() also for
> such devices. Even if this will have little use in practice, it's
> beneficial for testin multi-device SVM, since a memory provider could
> be a non-pagefault capable gpu.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index d364c9f458e7..f17234533504 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1609,6 +1609,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  {
>  	struct xe_gt *gt = m->tile->primary_gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> +	bool use_usm_batch = xe->info.has_usm;
>  	struct dma_fence *fence = NULL;
>  	u32 batch_size = 2;
>  	u64 src_L0_ofs, dst_L0_ofs;
> @@ -1625,7 +1626,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  	batch_size += pte_update_cmd_size(round_update_size);
>  	batch_size += EMIT_COPY_DW;
>  
> -	bb = xe_bb_new(gt, batch_size, true);
> +	bb = xe_bb_new(gt, batch_size, use_usm_batch);
>  	if (IS_ERR(bb)) {
>  		err = PTR_ERR(bb);
>  		return ERR_PTR(err);
> @@ -1650,7 +1651,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  		  XE_PAGE_SIZE);
>  
>  	job = xe_bb_create_migration_job(m->q, bb,
> -					 xe_migrate_batch_base(m, true),
> +					 xe_migrate_batch_base(m, use_usm_batch),
>  					 update_idx);
>  	if (IS_ERR(job)) {
>  		err = PTR_ERR(job);
> -- 
> 2.48.1
> 
