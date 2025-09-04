Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C890CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 20:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE5E10EAD7;
	Thu,  4 Sep 2025 20:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKOlRX6O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C1D10EAD7
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 20:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757017899; x=1788553899;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ihjJWyJpI2r0z3DBw86ZIeW2tj8aKL2JkDxBsi+oSxA=;
 b=TKOlRX6OdzfuHjZzUPzQR3OthcK5eqgWl88BK1d+UxQHggkmzGafZEz8
 qwXyIHzoT1coVCDwwJWzc0kaUQJloQATNF64d7jf2Vgp9eZdNzIPANV7o
 0tWaAj+KYGxctXVOXv3fleUqJ1v65RS22r3GLT2RQvfjdyrGGtI3vydt2
 vT3jro03J0MRbX+ITnhUaRut6psOx+8DLjLKesiO7ArApQQ2sBZ1ZEMT1
 3LnP6GeNUxG4ksQI5vI3xg2hga2DevbyDX645tSWFY4jioo0Fl4F/Rvs3
 sTjV2NO0YRvycwbnTZY3nBZz/7WFXjZHtnwJyA4oiTGd4qIL7vUbEmfX2 Q==;
X-CSE-ConnectionGUID: dTkUEMmLQeKngFJqTMN7cA==
X-CSE-MsgGUID: u1tISWhaRJKTBsHw+iM93g==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76976195"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="76976195"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:31:39 -0700
X-CSE-ConnectionGUID: Kj9xqu45RjWzcnBHyNhmVQ==
X-CSE-MsgGUID: A4cTIwzGT7SIG9Ch8RFfKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="195649169"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:31:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:31:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 13:31:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:31:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKCQY773J/OY+4dvlUJgLV23380JKvfsqcfoM+Wqc/6oglTihoiRAFx2jfS+51a1bxUCTDJNtmn5/HSg9H+g3/izwowl6g2hCxEzvJuOHdiEmUlD7xW/flYn+8ufsK0Z422RL+a9mgYiu2v0t/x6bvtEW28b0UFi6SiADekP/Bu53++bYvUT3qJ+M+8tkjg784z75A6DgfP2lm8HgbOeSIyyzS3zTYg/T8ScNUX+kgh98bsR8CkByTT7iQYQHImqu5Hu9ZPjnqwqqsjNTVorzm62zQ36goSx/XHuLJ0HGjFpAJmOfWXawWMhwCXJ4yebaCTpIYgfAy5Ap5I8vFvgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgimz/9y1enw45oUkhDXu0+HQzeoZAFgEVcPfIZvvuM=;
 b=rCDHLlvC37hVvcP/vtGU77nXsrKk00mIwTQB4j/d1Hqch6YcvCATyyYOzlvqiNmJGRVxlJZj0RVvkhlV7A76iPn0LEtILEX2nZx8g+8yJXdc3HFWrQk60MhYftcOayW3qnGIjn4pNAZ3tYCNBzoMTHleDA/CSJdCj/LK3sZkKqnGdZ0og7FquyaVMdNGAwXolKKVy6hyIzvCPzm99Zn/2UBjqUSDuITR4HxHxbFGW0kbv9Lek/zAs8nFVU7JT52C1o66d3ge6DJwDlMOkkrSV5GIS4QzBl8Synk8VYKUsEKxe/4KejD82+J1O3hMiFnBg22ZzbFc6CfjpQZ3LiNomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7450.namprd11.prod.outlook.com (2603:10b6:510:27e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:31:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.018; Thu, 4 Sep 2025
 20:31:35 +0000
Date: Thu, 4 Sep 2025 13:31:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH 5/5] drm/xe/bo: Add xe_bo_has_valid_ccs_bb helper
Message-ID: <aLn3JeNtxbJ6fD4C@lstrano-desk.jf.intel.com>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
 <20250904192918.7346-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250904192918.7346-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:303:b6::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f19653-fdb8-4916-3627-08ddebf20af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DGTQA/loScXcfFxJsdm6aNVMk7QI99d4LxYlXnI1P1OSMEjsERSoil4tZHBr?=
 =?us-ascii?Q?b38GO+xPMi4oh401PDIteD8P8/+jNGKsIU99wzX+gphFzIwAOR4Zi2SBpDml?=
 =?us-ascii?Q?zrNWHG5mNMhftq/S6LxYGyaPO86ss+BHVv3hNMUAX/HR63SgOu//I87MDl+f?=
 =?us-ascii?Q?KYIOJC9EZvzP64s4zdUBa7uVBVKMyaNYls+3mo+FNbrodE2tErIdLsQHnPA2?=
 =?us-ascii?Q?dZydK55V8XemHHJ2lRZdesfiel+12OWDhq7wIBP+WHTkJW1q1VTFcBg0+ahQ?=
 =?us-ascii?Q?8ecPNu9Zf5+eMzfIfAXwP7va2fap2/1fekCQhDSwLOShk4DF2BR1fDDciTyo?=
 =?us-ascii?Q?js1CiAXjKE63WuMexf61NACoNlE0FHsXRpSvBtYEZiuTwzwl8krRSME9MiuN?=
 =?us-ascii?Q?rj3YYGdp3geT6rnSs1O/jYl8nwKfcOJyM8BM+klVwsfArGSWbr6Ih32PI4yK?=
 =?us-ascii?Q?rPaeDUejzFnC1/4vJRYXadAe9Yp/T4VRuclGV6r2Lx+AMEqOtLlcS1GtfVMl?=
 =?us-ascii?Q?i9lWPOiSBq47OzT8Ta/ML4QC4pSXBjhfiqLHDop+rTCIjX85rp0CUDTSLvns?=
 =?us-ascii?Q?vqMJV9RoFUm14BS4Z4BbOxjzByy0f5FcrHH2lSVDDqsiiVL6mMadCqiO6eJ0?=
 =?us-ascii?Q?+qV+2l5WVyvIT9ACKGShYsMM0R3NdOBouWd6vs6+Qyfff4Us07M7sXsGRgRd?=
 =?us-ascii?Q?PYVdrsAROUXx4wMaavxXKWpv4OUjuDsN2HEzd1bfZdUycOtsqB89Zz8QGnei?=
 =?us-ascii?Q?LFAhol1y5Xxk/OUAZZ0VZvG65INI3XEFv+0u+RBgTeTtVP3Qob1hy8ZrWlo5?=
 =?us-ascii?Q?DIphWtuoynbBd14q3l/Nc5qhyjD81Oed3NPqijfyWmziYNwqlOd6Tjn2g0UC?=
 =?us-ascii?Q?IJP6OQUAmGe9zY+/wv/d2B2TaopfibibKl1yVL93rpBZ2+H+S8PXrLmN67qx?=
 =?us-ascii?Q?yuMKxo740tzTbYSRzCPd0YZblKO5fZMc/rewCuXqm9BBSPXAXMPt+Q1q/XCX?=
 =?us-ascii?Q?bfaS3fwPdPbGUAI1KhIw52WS7r1XXs78yEgLn5McFaP7ANBBamqYwqMwuy5r?=
 =?us-ascii?Q?FGO/NNVpxKZ8O0A/BYWPYK35bZt8Jz6Fh75F0Mr/cdo/2FnvUjGNzBlQf85B?=
 =?us-ascii?Q?Xk2pCI4xONxmXneG/VP2r9Ixv//NJmNo8YgN0wBzj9owT64p4wXzyjKszJ5w?=
 =?us-ascii?Q?DjtW+DEnhZwrwjqyUIp3rVK+SMB3S1QV3XBCJwPbbvh3JY/55tHvTQIlFrKj?=
 =?us-ascii?Q?pYvyqzDBm2JSzC028JvFAs71tKW23JTlGB4nD8kVT4yxlqrX20ew7Oba1nuO?=
 =?us-ascii?Q?i6HcyCFoje2Sa6riIWxdMF7HVC0FcHTFBvwsSuvnP81sqSpP2Bulkioaoieb?=
 =?us-ascii?Q?KB2ek/2jA1eL6BmDNHaOUuDrKfU2UPaJRF6y68uDXm4c8YB+bYbppGahqrza?=
 =?us-ascii?Q?I1/U3tPouXg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ocawYo1mhK9yTnoHSsIrTTFVR+PMHQWSx1yGBFB75SWEFhpbgRXrgevfyKTB?=
 =?us-ascii?Q?a7EslNu7XY6pHGJxXKFfAwB0MKPJ+XVabiUQrBBcdUuA5xLnBZnhDMmQFYvC?=
 =?us-ascii?Q?0trHvjv5hkFkLoGZI1m2WK1YqWLZNO75lZO2EG/rxhi2muc5fjb5vagHp60h?=
 =?us-ascii?Q?iyCIyTmMOO/QZOo+peA6+Vkn9ZGqCAY3FFL94nNW+6C4l2GqxcbZanqK+YhI?=
 =?us-ascii?Q?/DdJr4yrnazdcgHziH0zDze61cb6mCpRAQNB0CsXwPqIuNdsVwEbJdZVZy+v?=
 =?us-ascii?Q?X5SlXjLFE3M4f0tKRjNbcw9EZ0dsOPdK8Yx5QDbXIniaABCeNzWL0Qcsky/7?=
 =?us-ascii?Q?U1xcySNDUAcqoXhGYRbTVy9nDUSAWTxO1YOJbhQpYD7JU7OUETVTSlVze/ml?=
 =?us-ascii?Q?mah6ce+Knwx13pFyxUn2pLUsur2PjZpu+D/Grkad/mB0t5jP++cPsr7XAM2u?=
 =?us-ascii?Q?xjvjcP7o/qpQAYJ/DKZWRIYs1A9aDP27XsbUxFiN/nAnYT+7kw6hdgjlL5r6?=
 =?us-ascii?Q?TYQjEVqRbsNtuX+QkXsiPjxdqL3FVCT5D8ULVhLzOIwfmHjwjHfhErJzagzh?=
 =?us-ascii?Q?wPw1mwTFgYoB+mnuZJlRDUtK67jFgVJyBg7c7IUMm33yOgxEx9aoXaoFnY5N?=
 =?us-ascii?Q?8cUNZzAQk9tRaTcBVa5aN6O1rDWwxCN9gXrRWXL9AFOw3T2/K3kkHKqz6nA1?=
 =?us-ascii?Q?YMBOMPqXEV3dbwBdfLio7iMB01unBttLkIl8Jlq4xIf1WGl6n68WWHcA5RZc?=
 =?us-ascii?Q?bWuzBiljlVf7XFS1d53rD44pKD7sKkD6il45iksmHfk4byzILhhsSIf2hte/?=
 =?us-ascii?Q?Osh4fBUDWEvWuCtnelfYYMtw0MTrFAn4pJCezBkoGBglaKdhOhdC92fxLdmN?=
 =?us-ascii?Q?1zH7M2jlekjr797zx1sy5Fbr3O2ekCm8Sl+YdJEI/vj25Tje5/C/9PPemTYA?=
 =?us-ascii?Q?AkA1UBX/6ZQiQ5gW/0x0RFEv3K/+8fgO7y8OFNUk+07wAUfrmWKCXy6vwwDR?=
 =?us-ascii?Q?v+3xwwdvzZZyzGFCucZy7eWpiAtJgPYNgIoWcQmgHrFCIZourGS8q5VZxxFD?=
 =?us-ascii?Q?G33pEP2I3dDvK0fXSIzYSLpwue+8a0/ROPfoAUFHTZZUy9JvB1POEP1w460C?=
 =?us-ascii?Q?GpYD1YiAXw+/Lz1XSMgWW4TO8580uHe7WgOnUCbfNUJfiuZa74oxdPWYCIBl?=
 =?us-ascii?Q?pM4MPCvW2RJcGD5HNjvsC8/9DROeZVnLGHiMjuSxRJxfO64ztuZmkzmC3c2P?=
 =?us-ascii?Q?6DYfEqqGTUmgA62dGhus7wpeWOghyLtp4+U2xMRcE7TO10la/wDCyw8sPx1S?=
 =?us-ascii?Q?odHbu3CCoPYolyR6h1gTjuUdZ+G64pioZ72I0oWqyhuWvPc8lPQP6ZBB9vRh?=
 =?us-ascii?Q?GcDvbiLJqjJk/sebgIO8nW1P4P55cUnTLuDbsLqKFFotzQma2YpmkeKz9iuL?=
 =?us-ascii?Q?5esBYlDice5hLuCK25AbKCbgOrxx2YUZnUlS+TKMCx6nIm3gNx/EVo4pJ5DM?=
 =?us-ascii?Q?eLRFzYt0nRiro2EVT/dB8OH4pIGU9fwTuRJY8Dh1I2TiKt+N9g8gamjRVFFQ?=
 =?us-ascii?Q?p8VS3ZUvhW3XmJqAVmiTRTQYXw+wBHuVpNFn4pscPLcUtYvfPPUKc1Yovt16?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f19653-fdb8-4916-3627-08ddebf20af5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 20:31:35.5937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCVShCHZa8aJf0wthN1ChZIcps/75TMemKlOOzEquOrplRz0z1rNFKdhepLVg72gx8dXn/9a6isJjyKeqGtD/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7450
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

On Thu, Sep 04, 2025 at 09:29:17PM +0200, Michal Wajdeczko wrote:
> This will allow as to drop ugly IS_VF_CCS_BB_VALID macro.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.h                 | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  2 +-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  8 --------
>  3 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8cce413b5235..5e666fc2d00b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -315,6 +315,21 @@ static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
>  	return PAGE_ALIGN(xe_bo_size(bo));
>  }
>  
> +/**
> + * xe_bo_has_valid_ccs_bb - Check if CCS's BBs were setup for the BO.
> + * @bo: the &xe_bo to check
> + *
> + * The CCS's BBs should only be setup by the driver VF, but it is safe
> + * to call this function also by non-VF driver.
> + *
> + * Return: true iff the CCS's BBs are setup, false otherwise.
> + */
> +static inline bool xe_bo_has_valid_ccs_bb(struct xe_bo *bo)
> +{
> +	return bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] &&
> +	       bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX];
> +}
> +
>  static inline bool xe_bo_has_pages(struct xe_bo *bo)
>  {
>  	if ((bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm)) ||
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 30aea958a337..eb8436e44ca4 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -363,7 +363,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>  
>  	xe_assert(xe, IS_VF_CCS_READY(xe));
>  
> -	if (!IS_VF_CCS_BB_VALID(xe, bo))
> +	if (!xe_bo_has_valid_ccs_bb(bo))
>  		return 0;
>  
>  	for_each_ccs_rw_ctx(ctx_id) {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 79092e386c4a..4d3c10907135 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -15,14 +15,6 @@ enum xe_sriov_vf_ccs_rw_ctxs {
>  	XE_SRIOV_VF_CCS_CTX_COUNT
>  };
>  
> -#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
> -		struct xe_device *___xe = (xe); \
> -		struct xe_bo *___bo = (bo); \
> -		IS_SRIOV_VF(___xe) && \
> -		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
> -		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
> -		})
> -
>  struct xe_migrate;
>  struct xe_sa_manager;
>  
> -- 
> 2.47.1
> 
