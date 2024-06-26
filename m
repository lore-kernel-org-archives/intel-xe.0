Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31989C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 21:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20FA10E9B7;
	Wed, 26 Jun 2024 21:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oaq79cvc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DB210E9B7
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 21:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719438993; x=1750974993;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T/56R0+sPQJhFixpCopnVJ4RrzpnVxfBxRaPqPJcvqc=;
 b=Oaq79cvcrq6xN97NDr15PHumwofYP18/0vS9d/uafg7HGz2zbl/O4RZQ
 KldqLY0rC+CZSiIpL2TTaHBuyxumJv2Svavs1I782Tz2XshqZVE+Il83J
 Lohy4kniNdpmRjzexCc96Yui2guUF7tDu8jr3afO8p+0Uat4vGVcOW+i5
 fPC9zVJfFUFfIgmINWNiHTuwQEQ3bDODPtzeSUifKGYVH8TNnpUnW18cK
 eCCeXAN2uyGSNQsCKZMDootRNtUNe+DciKguIl/Von1PmR/k8jdI4RZMn
 0EJdTkzb4APKIPCSDR5pNtBxMHxqA4VUnI/S/PD2roPok/0mPkd+Tqr0T w==;
X-CSE-ConnectionGUID: qejJoZn1QW2BY68iJDIn9w==
X-CSE-MsgGUID: IbcYZDrCS0iv6RwWgps98g==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16376813"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="16376813"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:56:23 -0700
X-CSE-ConnectionGUID: bHZEAtFLQvKbCvOW/F6Stg==
X-CSE-MsgGUID: IxIAV/nLRVap7g28vP1umg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="44793263"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 14:56:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 14:56:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 14:56:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 14:56:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 14:56:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIwcEwpxj1U9xf9seL7johjd17YMAPa2ceW07Gy++IRjJvv6dIcXg9A1CVCQooI9IKLWf1+/w3TuYdJyet1QtVlJqwlgQ/KlIwgmAGQmF2hPxcBclqBXe7SRF5O384JPbZIm72bRraPEtjthOdEj4/gienkJOdA9fNAWM4gu/zrqXmT+8sbHjw/tBawkOAedfPwhP5gEiPccQvx77/CQOT8pY2HoJ9wtv4dT+J3VhG5+Ka5o03LLWi6NjYbbY1O/AgcG1V0NhLopAnGM9l4eFLpLI+/rsaeOdMVpKxDFf5WUsffJv2NA3VSpwQ2V6QL+RkxzvMk4Zd5RafZ5QAHv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IToe3VG6yVQ5wIrURlEyZnvTwJkFEpL3bqyZwszmJBA=;
 b=WE1C/b3MlUSuFYitbEQGiZDyjCYQz0tlueT/o6I3BbKZdAF5FTMy/TO9Jt2xWOXlXClGqEiOW+NQkvUBV66WrCixUnV54LVTJbxsU6YZDDNiIYUh1G6OVlRZ0I+3sqScbcce1eplHr33AuztVBV6NVyQ5BpDVuRpa3y1mc5a+AGPQwqNnRS4KPGdhNusamzuDQTgaP+yjEZHWdVHvIyOk2sIbDiLTky3pJsX8ZEteMOIbwzXBk2Ssvk3d2NiL4VaTo8MXIshM46jAz3KWIyEFLvMoId6i1sgwQCFVdSFR/GghPRN7ZFBos/UTKbb1FmgdorUDyHORfS2E4+qgsINHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 21:56:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 21:56:19 +0000
Date: Wed, 26 Jun 2024 21:55:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3] drm/xe/guc: Configure TLB timeout based on CT buffer
 size
Message-ID: <ZnyOWpB+nodTF5CS@DUT025-TGLU.fm.intel.com>
References: <20240626150109.10878-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240626150109.10878-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM3PR11MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2754ee-48ca-4f2a-1a5a-08dc962acf30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GRAOODUUNf9gfteEjdkKv5sHwfOqi2YD6o38qQ+S80P5sXwtSZiZ8R6QHjWc?=
 =?us-ascii?Q?rVL1d3ANiKWjPmXnZKE07BibRJcnm2QU7ooCbE7Z6F55+FJ65OPlIMbtKTjT?=
 =?us-ascii?Q?lKnoXcBNj6fKkJRJONnViQGBhgrPHIJWHtWIw3Bof88C/ZTuNSIhkzpQjxSH?=
 =?us-ascii?Q?92cANBMUKIcYT+zrP4SS29MFEIkNLiUQ4GhxEIza3aheljmE7BKd4iztoj65?=
 =?us-ascii?Q?DrO1fZqh0lV/idBtQ4LYunLBd0/PRj2UwirJOdsUYdD/BmejhiJN4GgFiVXo?=
 =?us-ascii?Q?c547/bj+4zaSG/H/qmJSgGpscempRDaKOAc2u/pMRXqowwPxMtyNspPHd/Xw?=
 =?us-ascii?Q?S2ESXAb+kbRvdZzfTRZjH3OSECbzLtBIcNxoiUKEQ5G/xghLPvpAWAEPfF8W?=
 =?us-ascii?Q?/HGfW+2kvumfGBlRug1VSgbxCH2H39oVlkR/3l5BIUi/oRtgsL+RuxTOdKf1?=
 =?us-ascii?Q?JgxKgYBpDEOICjTMYw2VEhF+xv/6LIQ1BiQBno5jS6EF6uesNVQRV+Pf7IiP?=
 =?us-ascii?Q?nz3mduFlr1+phV7rEB2YZRN1lVgpePQMbEm56SMwpZQqj1SPJiYKWF5XjFFA?=
 =?us-ascii?Q?zHdlZRh+lAsPBqqtPXoCvn24XJ3UmkoRElif6sTPP1z8AIKQSlUbZUYAPE7c?=
 =?us-ascii?Q?mjSfhiR75ozuxw7Roy3xrWlJMLOih4DysBY6KqEEpQpAFCMpOt/BkTgOxQb3?=
 =?us-ascii?Q?VfvWOtQ3epaXZup22fDPFGbLmQjcB9KZmacJls8/rnfTilEXJQqNNmG8Kiow?=
 =?us-ascii?Q?AfUEuzmweg5BzymfikD0UzI/kDHsS90MKvIoVuiOlqXlWthwJGaZocwKuetS?=
 =?us-ascii?Q?isClIIbgC9b3pt+fxngKli48da/z3G5oiOR65NnMe9Kdydf5fiaqTsN6YtJj?=
 =?us-ascii?Q?jhU9i0efXsEaKVZ1s5g2w/KPjX/e2nWeo6S9k3tWZ7GQgsZRsRPCmudDyscH?=
 =?us-ascii?Q?wVBfs3j5JagP9l677uSpgOXfelpdVXGZeTm8SH4HakTv3avI17DJNPRHri4H?=
 =?us-ascii?Q?EtYojhVKlhKfmsC4eGflhQsa4/9n32PnhjcRxdezbKUzju/M/1pzmeE+7igQ?=
 =?us-ascii?Q?rxmJ2kv9qgEI5uyWWmiHiBmP1fb5LL0OBIds1+/mmZiO1wNQbGRvmkRrBemG?=
 =?us-ascii?Q?kZcK3Oqr7bSlFepQ5ihkSwtMGPUlkRCToSegHPijpJEUxbZgP8XGIyYwQydy?=
 =?us-ascii?Q?45AoCUjJfWjrSmK8NEanI6IcT6jJYfXOUUuOmE9Qbg7nW0w5I16NXj2eJTnr?=
 =?us-ascii?Q?ofES4I7eOmii5TF2Y6Ef?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AIU+WjY122du75iQdhwj94qJwBjnv+4xBKgfdobuqkmEdrNIogP451sU6aPO?=
 =?us-ascii?Q?FiyU//i+V6jmuE4Rqjk/H+YdGUa8iVZtwcjTtELrkQKrX5A5raLUDlgJQVLa?=
 =?us-ascii?Q?9pRt4iv0uNE06guwIAvIdbbix9dLSt4LhRYoNMJIY1EZJ3kAZR/JLgrqJmLk?=
 =?us-ascii?Q?j97fbxQlH5KTtuo0bczkO4ZY5dqx+WAFNY9J8lyYyvxxViakgCTaLBf7HLlw?=
 =?us-ascii?Q?8+HSM1oFdgt8ewkcFE7IqKWZVE6rF1vOmwq8SNIJQGzQJ137afX2JJ2mgaIU?=
 =?us-ascii?Q?sFCWs0lqcG13YE39T3odhOIM5vD10FEnOAw0fRp1NiLbVvli16VGIjUavriB?=
 =?us-ascii?Q?/fkOWA35LCAWEGHANTfGqR9ckEvUBY5+avGrmumcdQBqcZ04hGVBflx7eXyE?=
 =?us-ascii?Q?On4Ewu6aG0h9gRglXzKhs+KQVPoNdx2SJvkcBsqcUeOMUk99X15cuZ1c6t60?=
 =?us-ascii?Q?nzL/Usg1zXsfUYlnAGt6QPTuPYP9KG6+nmQG9J0nApxzDfpBa++Pw30N8PWD?=
 =?us-ascii?Q?rpyaVxRpr/zUg8in9D7qWN5kzO16kyrb7iRgX7ulOFDVEt+Sh/m+T+aCq5Ye?=
 =?us-ascii?Q?GS+YCsjH5J7PyMn666gP5aOGr/gg0SekwnTt9A82RN4gi5mNCj5/QvKiFvTB?=
 =?us-ascii?Q?0WLQudHp3MgAwj3P1GMNMRGaiwd8+cCJHyRZx696Mv3FJZZ6X7XWmxbDrXS1?=
 =?us-ascii?Q?TnqDo5Ibn9Bn+wREw+DMA3bpwHf25+71ViRvdybSLLIvgp3gH+64YEkpRV1f?=
 =?us-ascii?Q?v5hjBnijJdtZ1+1bKwrWMKmwforuaVa89tCWEevJHmCAmxw7piIc7bYzfF5Y?=
 =?us-ascii?Q?SDFFowzORPusCCBw3gep8ZrE+dJk69J93NBf6DTZDM6jG+cCnRWnotUcRV2O?=
 =?us-ascii?Q?B7sKOSP9rz4NEZcPT5JKbjsLmKbiTCCqvUwsFTaD4unIKHp9RevRm2tRNHy8?=
 =?us-ascii?Q?xuMr8MD1C8riXeRtcmnHlTDZKkRPENH6XF5mwp6wYqSdmLbJIYJ0R5i5z1BW?=
 =?us-ascii?Q?2WmNhAOFy8flrk16m4uscvpAwVq2h9npzE3xRcCT+UbER+Y/NhmBVbIm8xVQ?=
 =?us-ascii?Q?ruakv6R+/IhH/3NybWr6l2XIGJLlMcyLEUAsiC9iwdZPFCDnZZfpIQwCU1K1?=
 =?us-ascii?Q?mlY4oj34V2LBy2T/v4AUvLm6riHoxLI14XwnekmMAdDH+YSspKal0G3j1dm2?=
 =?us-ascii?Q?YKKq3aZ6aPyL4TR3u9cAcWNvLa8cj1suXcAFKDSMryJnfxylmwU7CexaBq4n?=
 =?us-ascii?Q?qYDBet7q84iBjk3jc9b9OGmRHJX48cHkzNkNCcFrZavntV2vc7kb/KBV6DJi?=
 =?us-ascii?Q?QvSCq3jVnp8LqGvDYt5Kb3IDHQq/OzDVk3izFg8MoPK/vCX0UawkrpOBtu1L?=
 =?us-ascii?Q?EZb5HxhNKdTsrvNilGGNHgXdFP9Cyq56j6zlduxPhfPa/1OMU+29QhUazTmd?=
 =?us-ascii?Q?otXluv7Vf4bfcCG4ZF7oykAnqmLjdge2HJTJ/5o+Kfbn8yBumyj0ZnmBPKra?=
 =?us-ascii?Q?ymN7G/DskBGBkMXGLWaNvsohAw60oLvEJLwqu1wHzj3NPIdc2NqGB+KJTu6/?=
 =?us-ascii?Q?4ofRgNAZUgj+L0RPGFbjQ2jb5x0y5GVOPW9Wh1CXNRngc9ENVnK5KeIQ8EOs?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2754ee-48ca-4f2a-1a5a-08dc962acf30
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 21:56:19.0008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YG2bg2MUkVf9C1oFdw+cfnvC/sddpahRsQvaf1+Iao7Qtb1JtKIZNkd269Y2U2s2EDdc3gv4NXSv2qk3LrRthw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8758
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

On Wed, Jun 26, 2024 at 05:01:09PM +0200, Nirmoy Das wrote:
> GuC TLB invalidation depends on GuC to process the request from the CT
> queue and then the real time to invalidate TLB. Add a function to return
> overestimated possible time a TLB inval H2G might take which can be used
> as timeout value for TLB invalidation wait time.
> 
> v3: Pass CT to xe_guc_ct_queue_proc_time_jiffies() (Michal)
>     Add tlb_timeout_jiffies() that replaces TLB_TIMEOUT(Michal)
> v2: Address reviews from Michal.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
> Cc: Matthew Brost <matthew.brost@intel.com>

Since this is under review by other, I'll leave the RB to them:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 30 +++++++++++++++------
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 16 +++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
>  3 files changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index e1f1ccb01143..d509b72a6d89 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -17,7 +17,22 @@
>  #include "xe_trace.h"
>  #include "regs/xe_guc_regs.h"
>  
> -#define TLB_TIMEOUT	(HZ / 4)
> +/**
> + * TLB inval depends on pending commands in the CT queue and then the real
> + * invalidation time. Double up the time to process full CT queue
> + * just to be on the safe side.
> + */
> +static long tlb_timeout_jiffies(struct xe_gt *gt)
> +{
> +	/* this reflects what HW/GuC needs to process TLB inv request */
> +	const long hw_tlb_timeout = HZ / 4;
> +
> +	/* this estimates actual delay caused by the CTB transport */
> +	long delay = xe_guc_ct_queue_proc_time_jiffies(&gt->uc.guc.ct);
> +
> +	return hw_tlb_timeout + 2 * delay;
> +}
> +
>  
>  static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  {
> @@ -32,7 +47,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  		s64 since_inval_ms = ktime_ms_delta(ktime_get(),
>  						    fence->invalidation_time);
>  
> -		if (msecs_to_jiffies(since_inval_ms) < TLB_TIMEOUT)
> +		if (msecs_to_jiffies(since_inval_ms) < tlb_timeout_jiffies(gt))
>  			break;
>  
>  		trace_xe_gt_tlb_invalidation_fence_timeout(xe, fence);
> @@ -47,7 +62,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  	if (!list_empty(&gt->tlb_invalidation.pending_fences))
>  		queue_delayed_work(system_wq,
>  				   &gt->tlb_invalidation.fence_tdr,
> -				   TLB_TIMEOUT);
> +				   tlb_timeout_jiffies(gt));
>  	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>  }
>  
> @@ -183,7 +198,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  			if (list_is_singular(&gt->tlb_invalidation.pending_fences))
>  				queue_delayed_work(system_wq,
>  						   &gt->tlb_invalidation.fence_tdr,
> -						   TLB_TIMEOUT);
> +						   tlb_timeout_jiffies(gt));
>  		}
>  		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>  	} else if (ret < 0 && fence) {
> @@ -390,8 +405,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   * @gt: graphics tile
>   * @seqno: seqno to wait which was returned from xe_gt_tlb_invalidation
>   *
> - * Wait for 200ms for a TLB invalidation to complete, in practice we always
> - * should receive the TLB invalidation within 200ms.
> + * Wait for tlb_timeout_jiffies() for a TLB invalidation to complete.
>   *
>   * Return: 0 on success, -ETIME on TLB invalidation timeout
>   */
> @@ -410,7 +424,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  	 */
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 tlb_invalidation_seqno_past(gt, seqno),
> -				 TLB_TIMEOUT);
> +				 tlb_timeout_jiffies(gt));
>  	if (!ret) {
>  		struct drm_printer p = xe_gt_err_printer(gt);
>  
> @@ -486,7 +500,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (!list_empty(&gt->tlb_invalidation.pending_fences))
>  		mod_delayed_work(system_wq,
>  				 &gt->tlb_invalidation.fence_tdr,
> -				 TLB_TIMEOUT);
> +				 tlb_timeout_jiffies(gt));
>  	else
>  		cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 873d1bcbedd7..df95b0e878ad 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -112,6 +112,22 @@ ct_to_xe(struct xe_guc_ct *ct)
>  #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>  #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
>  
> +/**
> + * xe_guc_ct_queue_proc_time_jiffies - Return maximum time to process a full
> + * CT command queue
> + * @ct: the &xe_guc_ct. Unused at this moment but will be used in the future.
> + *
> + * Observation is that A 4KiB buffer full of commands takes a little over a
> + * second to process. Use that to calculate maximum time to process a full CT
> + * command queue.
> + *
> + * Return: Maximum time to process a full CT queue in jiffies.
> + */
> +long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
> +{
> +	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_4K;
> +}
> +
>  static size_t guc_ct_size(void)
>  {
>  	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 105bb8e99a8d..190202fce2d0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
>  }
>  
> +long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
> +
>  #endif
> -- 
> 2.42.0
> 
