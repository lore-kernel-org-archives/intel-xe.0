Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124A0C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 04:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F63910E1C6;
	Thu, 29 May 2025 04:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6azRb8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982A610E1C6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 04:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748492256; x=1780028256;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4K9to4FNbyeuzu4chfZwRIF/4xDBie/8a1Kj7xsEkgY=;
 b=c6azRb8uxojlZKTP7PQWABEEDaeqVsBE6asHQOagCpeOV0EbPishmi+q
 TvrGFzbaS2xcKFnHgzZT8RVJfASnjx45z+B/DloG0XBykBIpr9x4gko+c
 8tuGocQCPrFABlOYAS8sE5XKttmKeFwtCtyKD8rcLzxP5aoXlCtjA7O4D
 3WITB6UR6ax46lGGla8qvFhqHXkl9Q/2y1E7gDxxX2H5xZH2VV/Nuqv93
 qO/d7mH5aAYYg5gI89mVogbdLJF9CCNZ+S9kvEhJ6XLSNPcA6rvGcnMkO
 Ejo+t6gFr2EPA2fBN0ZAgcg4dKXj4dT0WBv5DlShlAbs9Ny95dk0dhu5h g==;
X-CSE-ConnectionGUID: XIO/XcdnQu6D7eHr4COdDw==
X-CSE-MsgGUID: nlPsfogEQ3yJdEVsUGb/Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54334990"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="54334990"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:17:35 -0700
X-CSE-ConnectionGUID: zGgs1fh6SQ29K/e775E5eg==
X-CSE-MsgGUID: jNlXO3ttR9GNxBJ44BlPJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="144428554"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:17:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 21:17:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 21:17:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.63)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 21:17:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tp44drdYvET6IT089Uvv57f74RcmHfwZPq4oPRa3P/sxLLXlcZMq4A7W0YBkkfpcS1RMyGtNCbeI86rGp4vi9TtJni4QepTnihlrpoSe2qDjqgQA7hekWbni59iA0MUaZPO9vgUfHZDYK6P6BfUjpAWFXPZ5eB3PUVgQv6oA3GgydK3VbNs1tz7WWfTwna74h6VX56s0f0uEdtHIU6Bfg8HTVtnvHrUfyA4BmD9HGeQ75XQoOA0gK+pV6Xqrq2+GLq0Mq625yunHi7HxDlhflvTn326ZGh74HQy26haAzfTSlcmMKy8PjHt5AL+jCoKxx8fyT2NWfo++FzMA33tFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfJgEkqJ0Oob8X/yg2uylq1yjNWR5BmAFFHGAQCdXP8=;
 b=wZ10RU78+6rjtYF0fF/jwvZhqFsG3y/GpOJvaAQ6c/RO/HlCF+YjevumgehXc6hmEp3NAi8L5G4YXBq9U/xblAt3i5RAAdKZtEq5nlIRrz9ObZbTrL8DILLQaehmaoweohyM97hJ5uFJYlnj5IOjhdLwb6+L0JzI1GmljxMckjsUDVRsJ0ZTsXfsvlOSHiI54ERHus53+LJE7Zz5HsYnCGUjWTziiijg3kgCZB4/LUdKcAAlDGPTCK6EwvfEmLmZYU0JNYGL+d7+p+92qzif6BgSFI2pgkvFweeR6fcCP8LGC+wjlsfDjZfqUhWgBoC4yDI1Fi5Lxc6ruaERYGb0Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4808.namprd11.prod.outlook.com (2603:10b6:510:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 04:16:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Thu, 29 May 2025
 04:16:50 +0000
Date: Wed, 28 May 2025 21:18:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <maarten@lankhorst.se>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Create LRC BO without VM
Message-ID: <aDfgDYLLBipJgA6f@lstrano-desk.jf.intel.com>
References: <20250529040448.2425873-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250529040448.2425873-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR04CA0252.namprd04.prod.outlook.com
 (2603:10b6:303:88::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4808:EE_
X-MS-Office365-Filtering-Correlation-Id: 592792f3-6a9e-4cb4-fbfe-08dd9e67a2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vXjP61C0G0tycVl/SVgDSHmjsZXysmmxnIYamcRZ7YTFBCPBN8OnExxWsBX+?=
 =?us-ascii?Q?Rbetd3TAh+7NPzY1u3SHmnMp3gmWYFZf1S4OZAAB9PEYOC0iKNYIfxr63Sjc?=
 =?us-ascii?Q?ki7nPJjwFmu+RX9lvUNByMRWKu3SthDzKFRAwm6E3qZcUATYsjMeCmHRmpV/?=
 =?us-ascii?Q?O8dSn5dlS2mb4ICM0qDyUyn0WsRtOk92Ks+PzKxF29KDwvd13/UBAls/AemD?=
 =?us-ascii?Q?y7QjUbh+HcDvtJIz0S5qtmfThZd+aSD+aVcoAdUXPfFEk+0yKlH6bMhGgJgu?=
 =?us-ascii?Q?B2udoj1/V8AKjPjhU0qf0bzcjSswP4LBzhyGT3AfV/xep+/yJzn/fkRarJV5?=
 =?us-ascii?Q?c2BW5DK/L6tuPaVOE/nPdG3iuZv3eCE7NCCdgH84k0sQ3XnUjSOXJ50J7IjD?=
 =?us-ascii?Q?ev2If9yHLGTtrTKXQuZZu7d3feDi3Uhio/1nsAzzK2TGLtl6M25fxAEbB0PH?=
 =?us-ascii?Q?X5csEHmB8Hws6wDWHnx20m7aWnK/8gvhFcXQRiFquIVjdk2t/TubC+yMOtST?=
 =?us-ascii?Q?T1A7LHt+Oyu4gcWfzil3ObdWTr/AvE6OkcoMu1IPnDFoN6+5LZG11lsy/UBt?=
 =?us-ascii?Q?Wce8Zoz/rKQ4hu4+VuRiQHCyAHmkOCAbEwfwKS/iCQL/2jsJrOUt/4Nk/1/4?=
 =?us-ascii?Q?mJhyO2L/NkPUDss/uyBtfb9lregcunRiB9/ypjEe108t9cOuPAV4++sfZCGb?=
 =?us-ascii?Q?KI/sUgI+++ZswZ+oWT8Ue/cDvev1fOSNhR2XV9XSRgX4+Y9F1SsHDqdtNknn?=
 =?us-ascii?Q?jvHzDLXmFpF3FYUHmjz0VhPKsERg9dpaFd6BDaJ7IVtA3NP+hxSLFQ/fhEUQ?=
 =?us-ascii?Q?RRfDFDjiOwTMd8/WLrzns+R8lh6MrCAw6KOEL4E4f4cVY62cjshU4ZAoFElc?=
 =?us-ascii?Q?Szq09neU9fb9ZHhDlJbpVa5ae7wFOl/EgyS00skNIUTbzMocx8L8oal9ONqn?=
 =?us-ascii?Q?xtJsu27cwiMM+LTegLr4sDYT5HKDACsuvteEOzGhoyORXRqufKddWwT73ObX?=
 =?us-ascii?Q?ZLEN8/w81b06OKHBIjAKdJSKg4QLF90siGZnMq+fD6PNc140bcOdleoqj3fY?=
 =?us-ascii?Q?ldy8QTkQ8S+dRlku/xtaK7QakN7m6JMJIcvpHoRvx1CHEWPwR7qFBuHGpQD8?=
 =?us-ascii?Q?vs4oGo1lWnAfAXaCpZMFiVSG2F7ZLiGLI1IRM2k00fgA8ef2s79r2IYspFnO?=
 =?us-ascii?Q?VbfCjvcjVoxrETwX1286GOzjog3txgS3KEGH330x7o6RSZIHg1s4ORd3eqjM?=
 =?us-ascii?Q?aCpgLkAJBnMRrqo1ejaLpDTOzArJLIa6ghwRt00dzRTb6KReInNz+/n+yMug?=
 =?us-ascii?Q?SL+SC2cFsuq9rr1qTHEkYExfsfOS42FIivl8uDBnMx+EqIM+SvJWUF7EecRO?=
 =?us-ascii?Q?Y8C10heCEC+zXgvNr0bhfMerRqx3kqSfTbuofoKgIdGOFj2Mty0Zu06OCgdr?=
 =?us-ascii?Q?4qx0nEqSzKM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?khkfom/2JKDi7uDXV3s7bK7n8S0jkgf6v1U0+jhGxPqfVnAGMI46MNm9ZC5A?=
 =?us-ascii?Q?vhQZbYKiaxUhXFESo0AQ569hsDyyRkMDQWq/bxgPvck3lz+cp1lpzDdd+Vki?=
 =?us-ascii?Q?cuOsynhFbdncnMzAhGNB9NzovlwZE0a40tzpnewlO+nkiS6XiMEnUIX7dRMg?=
 =?us-ascii?Q?0Yc4bNRK4NNrUC1MEotJDb3x6RPxR+tUmv7yvgHNUweupNWj3mtLD5uO3mro?=
 =?us-ascii?Q?B2t9X5pPGjqkoemUFk1ZPA5PurRze6wZIwY1i0n2bFAOwRqiN+GG/8rhJ34s?=
 =?us-ascii?Q?zUmK0wkg448nOmIR/XpLWaW+VFI8mc2TIpsu3ACQor5vPZF7YvZ9vSB/lnfB?=
 =?us-ascii?Q?ld47HcKHHDMBN3LYAlAain3t/Qur5YeuJPI+XjWewAkHuz8mlZopX21VZ/KR?=
 =?us-ascii?Q?LTNLGSpZe4EpAFKnI89AVZpujXWGxy293x3QwAjKgjF8Hv3NwGkRzeh98Lhb?=
 =?us-ascii?Q?nLvwlvtQubBt9xLBJ1P5R5gcy2InUk6XcVkE35nvgv/1gEE+2RemNkTI1MDj?=
 =?us-ascii?Q?Zm1c9MNSLv0hWrAJby6PIWPijii05ih0KDr/br+FoTpgr8z8cTZhes66unA/?=
 =?us-ascii?Q?VHBQgJHEDtUrg+/haLLoMFi+33T8QUEoPc4oQ3hCwyxguKbq3CaekTXSArwy?=
 =?us-ascii?Q?vS4CwMaCgYeE0akWIeSY8iDQy+GoTbEBFAjXgZWvk9gqu5yrRMDiFuGKMMQk?=
 =?us-ascii?Q?yI6cLTSzfiH0QbtX2xgJASQ3GP0lZnLWC9nlU7wV2ts8oEpErnnwL2ySapJz?=
 =?us-ascii?Q?8CsFZl9LHEn6Sfwk2bE5vM4HLmj60VZ1n+UDt4wXa4mDbF+75VbrsVkMa70g?=
 =?us-ascii?Q?wiXtdHqgb6EXT/vvlp97OTl8Z6m4dYOTWizjM0xospAs9qYKzilec6VQnG8q?=
 =?us-ascii?Q?2puKQa3Nm/+TqjaZe5Y5Fy1qg+bGDhtZ3l8AkRuqb3ws042Vd0qm2R8cKODu?=
 =?us-ascii?Q?Y2g5+RZMldiFEBTufAX7kARuiKirYT9jlEJzJ3ekSLUe+FsqSmAYXQ75blmw?=
 =?us-ascii?Q?6OqIUWNll6UgzihVkpAyzJUd5b5rpPOPl9prdmt7Uk4hNXBnVz6JiJQhGLiJ?=
 =?us-ascii?Q?bGHgzG4Sle4rV7hdXKEPvsybKrvT7aWS2fq5T80EltFdSaQd/P7eMZyMrzEt?=
 =?us-ascii?Q?GEcfBkD/oL+mcv4OYN515wp0/gnuHFGJ5ZXNZD4nCB9YJB89B4XwEGKvz4Qh?=
 =?us-ascii?Q?r4lNVXp4SZn0vIYyAKZGlo/rzcGqm6uAXoszWIahIap+4GIvK6CBZ4bsVXiy?=
 =?us-ascii?Q?nvLFclMaeDNmyQ+/5bfn6+SvR/M8+WBkMW7hkjwz15yhVtpACe38yqTbqmsZ?=
 =?us-ascii?Q?LC/bLWJL+e5pYiTQqh5ivBwVwRtFKMJvcyb0YP1c+kffw7BOQwT4zv4yta81?=
 =?us-ascii?Q?WfTNwTEOfuRONlaiPnxjoSMPbpcoILjVnP7kg6jSHM+wRqWyYzLRA2sl4HcS?=
 =?us-ascii?Q?4vx+lj1+zPHS0GKibNEHNh9JSwoNeq9yYS9zgvh5jGR+OcDt4wZB/eTHK41m?=
 =?us-ascii?Q?Mk/iDvDffC+u3UobyI2pPsiEB4dowLuyicYdPBjd3sGquxU19vPck5yZVhNF?=
 =?us-ascii?Q?xbpNSSX+qYgrftmtgATADjI66Px957RZmDWoDYJyrG2l/0VaJXWpZidV4yRG?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 592792f3-6a9e-4cb4-fbfe-08dd9e67a2e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 04:16:50.9274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/Sj3eBlHxbGEh7PcZ8qlwruyvXUn547+VVXOyvSd7EhSftjJvmDxbPZq5YFB73p56oc3RgqbcCmhD6R4/jDtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4808
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

On Wed, May 28, 2025 at 09:04:49PM -0700, Niranjana Vishwanathapura wrote:
> Specifying VM during lrc->bo creation requires VM's reference
> to be held for the lifetime of lrc->bo as it will use VM's dma
> reservation object. Using VM's dma reservation object for
> lrc->bo doesn't provide any advantage. Hence do not pass VM
> while creating lrc->bo.
> 
> Fixes: 264eecdba211 ("drm/xe: Decouple xe_exec_queue and xe_lrc")
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Good cleanup. I thought this through and can't reason why this would
work or any advantages of the LRC using VM's dma-resv. 

One nit, xe_lrc_finish can use xe_bo_unpin_map_no_vm on lrc->bo now.

Asssuming CI passes and the above nit fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  9 ---------
>  drivers/gpu/drm/xe/xe_lrc.c        | 18 +++---------------
>  2 files changed, 3 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index ce78cee5dec6..32c6923df7c3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -132,12 +132,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  			flags |= XE_LRC_CREATE_RUNALONE;
>  	}
>  
> -	if (vm) {
> -		err = xe_vm_lock(vm, true);
> -		if (err)
> -			return err;
> -	}
> -
>  	for (i = 0; i < q->width; ++i) {
>  		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
>  		if (IS_ERR(q->lrc[i])) {
> @@ -146,9 +140,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  		}
>  	}
>  
> -	if (vm)
> -		xe_vm_unlock(vm);
> -
>  	err = q->ops->init(q);
>  	if (err)
>  		goto err_lrc;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 61a2e87990a9..974fe509df0e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1007,7 +1007,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
>  	 * via VM bind calls.
>  	 */
> -	lrc->bo = xe_bo_create_pin_map(xe, tile, vm, lrc_size,
> +	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, lrc_size,
>  				       ttm_bo_type_kernel,
>  				       bo_flags);
>  	if (IS_ERR(lrc->bo))
> @@ -1795,9 +1795,6 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (!snapshot)
>  		return NULL;
>  
> -	if (lrc->bo->vm)
> -		xe_vm_get(lrc->bo->vm);
> -
>  	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
>  	snapshot->ring_addr = __xe_lrc_ring_ggtt_addr(lrc);
>  	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> @@ -1819,14 +1816,12 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
>  {
>  	struct xe_bo *bo;
> -	struct xe_vm *vm;
>  	struct iosys_map src;
>  
>  	if (!snapshot)
>  		return;
>  
>  	bo = snapshot->lrc_bo;
> -	vm = bo->vm;
>  	snapshot->lrc_bo = NULL;
>  
>  	snapshot->lrc_snapshot = kvmalloc(snapshot->lrc_size, GFP_KERNEL);
> @@ -1846,8 +1841,6 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
>  	xe_bo_unlock(bo);
>  put_bo:
>  	xe_bo_put(bo);
> -	if (vm)
> -		xe_vm_put(vm);
>  }
>  
>  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p)
> @@ -1900,14 +1893,9 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
>  		return;
>  
>  	kvfree(snapshot->lrc_snapshot);
> -	if (snapshot->lrc_bo) {
> -		struct xe_vm *vm;
> -
> -		vm = snapshot->lrc_bo->vm;
> +	if (snapshot->lrc_bo)
>  		xe_bo_put(snapshot->lrc_bo);
> -		if (vm)
> -			xe_vm_put(vm);
> -	}
> +
>  	kfree(snapshot);
>  }
>  
> -- 
> 2.43.0
> 
