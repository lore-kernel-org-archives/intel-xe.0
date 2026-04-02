Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8C6111224A
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 01:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E92C10E1D1;
	Thu,  2 Apr 2026 01:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMxf1oLF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACDB10E1D1
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 01:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775092976; x=1806628976;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ruf3KhkK34CES38oox5jZ6TooS23gyKd9vwmlsLk3QQ=;
 b=ZMxf1oLFCXufdt/L9G7PMVcUN6A9oNoX4ayB/VMDKlTv4yfwrsIRvAku
 5EkDKdd89RsWOfbwr+WaFTvgoHosVyUvCkWcuzg1QSrwuSjokDanix69n
 bBbst9KPatjIVj+QyQ/ezQplgt0KDxFrldL1z+NsrtmxebAn7ZJmLUGSC
 I10k8Ld79mw7XLxHTrljmdhpJnoGmYIYOQDirPKmgx2hOXD1fPwWuGdp3
 1rY0gSHijxIKW72H5u6TS4FE3Ect8gsjtep8yEPityZqQXr8oZdBFMoIS
 gVljrGOl8+GiRZMGvIqqRHG0ixLRZU8HLL4RrC7BdlbgG270yznMSMzpU w==;
X-CSE-ConnectionGUID: 1BsNnt/ATN+txc+r9t5ozQ==
X-CSE-MsgGUID: 9elEHF9zSK2L05gk448ZiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87605314"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87605314"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 18:22:54 -0700
X-CSE-ConnectionGUID: Xuv1LWFrQ5qGOazMtilAAg==
X-CSE-MsgGUID: ToAO7z/sQ/OqjUDHXOBAVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="220182963"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 18:22:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 18:22:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 18:22:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 18:22:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQOfPG5ZzQICaXl2ohC9fozGDNqqNqcgoPqXjlWoZ2nyNvEVZAXHmw5arRXGAFzRwcDVCKebaJMZyh1HClxJ+fUORYqGI+oxqZe/Lo1pgod1HqgU7H5CuufQaUnPeTU0s2bIzX/KIKCIbp4N7c79HDuCRRib51dVC89wCIma2ZNtsasOhaaOBedbb6JXWwV8gg2KYNtpB7Dwpr3c39nTKXJcody/4BgOvW5XsxFmiVRomwskhxR3XwzSDT8hbIoxHEk8t4MFEy38BzbbR0wULYqumpPuJwdG54/mgJuI7sbLvcid3fnGCrJq7WWe4CFolUUU8h25VVEw/oI8S1E6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYqKLWBxVekiT2gNra2KP6emlpJEMZqzHfz8VOpwwIM=;
 b=QWi3D6vTnrG1DB9E+Cvt8hjeZJvrBmcrZp7WMhFOWHTPCesnzD5xGfdR1JyPeFhUWelN6IwBwzBCedjKtFkr+LoLmn8meSYPhMn5v85uhiRFb1QK3B2elGkW7oOAawhStbrkRPQKEzSnPHINUzhneTZg1hrmLE5yrBqULoqcfpdwXe68eswuKRZR5GqiIzgAcJzEbS0BbeqG9CbliA2sENGHst0dCrg3v8XwwFea0dSLeHc7TL1snRuIzWzXbUo0gPzpexpdRpNkVF8TTukXvxrgQbGHbgGkyNuILQSkMPJdstf1GDtaFDEc+gOrfacbpKy9ziTONQfSW9gvIbQC8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 01:22:47 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 01:22:47 +0000
Date: Wed, 1 Apr 2026 18:22:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe/mm: Add batch buffer allocation functions
 for xe_mem_pool manager
Message-ID: <ac3E4xD3IkW5JN+0@gsse-cloud1.jf.intel.com>
References: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
 <20260401161528.1990499-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401161528.1990499-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0072.namprd04.prod.outlook.com
 (2603:10b6:303:6b::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: f3097060-ea58-4a37-1cbb-08de905658f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: dT/jTYYrRgCCXdGUD0TneSN4K9LH5+qbDz5FdwN/WrmmfagjHiII/IdPR6eEN1ZwY+I0Or9q+j70d3zbszpKyG5VJHVGPZTtJcylLB0gwvrL+nsD+RBhiy/UYyy+YzaWf6adUpLMWp/Tu7DeudvRw8zjt9qP16cNII5I9vmZBKejF84B7eU4jBqnzGKgAU2DrQ8anI2XwyZAfJmty6XIDhktp7YYqso6SBnZ6g/Wk55qLE1HNKJUW1b5F93TPMLRKqqbOCMdKitCSFGilRhGJNDkd1G8RGnO1+izwl9ARDebTVyDr2hv26IogIkmvrZjBINrH4KlWbExX5+56+JXMwem+9WO0VUd/VKJghmft2q5DWhd++QBbhMoBypIdLCmDkY9t7izQq45SCY9g8hfDreh7J077R38KxNmScIlyLXusFFBpvsgg005g6mqL0mRx/1JxMgkSaUTrtGnHJAuuIRJNgyWeemkwg2X0rXeBPW9l38q1Kdk3BPWFqU0ytAFVlC2wUPl04RovrQDSFzH3WRT0d8pJyNBPiPLc31mkY62KPpM97F1rxWPcVpFXPpTln3CPLxdqnQvX54+PMgXk3Rm2mJFXCJNkIEFjsjhdQY/IrOcTMdscFbYEU7i5p7T8mF92V6UC1GjWKyrT9D/teeMmjaDjReNRZ7bBtRc0l9Yc4lYmy4rmkJa9igByrbHSB9wn6ZjS5EMDtcCtCR4iMjKxt4oOHaXS7f6ynlMQMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Cof1fEah4b2EE6bMkRt2gBJENUVfLJhEONt39PgxIow5CWMlfId2tagcxO?=
 =?iso-8859-1?Q?UlvjAKENDKZChr+lxnjPrxUfxrr84Ku9ddmCPBony2pbfuPhpXlx0VHTVy?=
 =?iso-8859-1?Q?BMJXSsz2EQtDo+3wSpqzj4a8mHqSlbvINgoMd3LMy0ldR2fAdqgE83WSmd?=
 =?iso-8859-1?Q?QP7VaTL1YO1hLnfo9HI9Lyss48T2Q1QQQj0eIfrZwiqXNWDLjW3LaBCgMo?=
 =?iso-8859-1?Q?vWRggb71bPu6KIR5PbK5qS5s8YugdAs0mXReHdxZFRkwZyx+9829JFaPBb?=
 =?iso-8859-1?Q?zjhLdOcFoB7SSCQsm2glPCxcIoMeHrTe7Yc5otJkkz1PZUVl9gymUaiONu?=
 =?iso-8859-1?Q?2+D5E8kf28TLwFfI0jrj7BnBZRfiqnl4MAQjL5RGKoogC0D3Z0OshbHmuE?=
 =?iso-8859-1?Q?sBQJIWh0OZ78foqyJu6ncURhDK6EiiMqUlkOvIPAorEX7lvf7kp5L5I47M?=
 =?iso-8859-1?Q?R7LF6s8Cn2FZNV4K9eclpaZ4cXQm4WMQkrkAg5NBWpAyqxhjG7GqZR855n?=
 =?iso-8859-1?Q?dFxiCZZNOjcIcGPkfL6TLIjsqBwvZns+zzVREDbJvkxf9r9XMfqe/mTFX4?=
 =?iso-8859-1?Q?pcC4nyc9AScGKJ65PWBYXPu/gv31ssY9rDcUt4u1fTZV9E0eujHmLZnoRx?=
 =?iso-8859-1?Q?a+ip5S0EIVG4MeRxi1vNbcLRVXlgPSV8C7cjtceWXCFeAHjpCizyVr8i82?=
 =?iso-8859-1?Q?dwYUs79k5uyG+LACVHpTyaCf3HrYvGVzkJZA6YoNzUJGcI+WS2D27eQLWA?=
 =?iso-8859-1?Q?Mwp1/3+JCfgfqZbssUuwN3qaXX7ZpP3wBG9+PWk4+e+61OSmnKEVHHniZ1?=
 =?iso-8859-1?Q?42aVp4Hti4u3REDqc/8VVwXguP7Hu27vsMaB9g4FQHOGkuojzlCyxhnVuH?=
 =?iso-8859-1?Q?cE29J0QRNQVUulOEUUR7GdAbIYAI1DXOAi2tVJpHPVBasHltWAnb1Wn8fb?=
 =?iso-8859-1?Q?NuRdHiS5fCiXGBNQCwACNwT6saDg8oxGokDLQL2TKK9QVXdb68OJ3zW3bj?=
 =?iso-8859-1?Q?I5eZRutWnxOJAKiZaCMlhWEKUYIbWSGpXzLtvsNoOH9XzTjVfFLH3+5Mic?=
 =?iso-8859-1?Q?rloedbDZ9QrkkAM2fT4rJYTM/KJ80ltxb0+Tg6aszgiMwXNDRWvW5Y6zEz?=
 =?iso-8859-1?Q?5hAM1Ipwrpfqo9fmND/ZIIFv0likpwgaLWOaVjuk+UFwynrzcVg+fMmu+p?=
 =?iso-8859-1?Q?EJ5MHysunmNGz+K0T5YMw0VPOi20mm2ETCRSfxnFwpfGYu9XFC7fCfO/v6?=
 =?iso-8859-1?Q?p7Q1lpY8V8m+/TR645Y3mq1qI7sSE2/fPNUAs+PYKcISAO3SGeZvFr8/Jm?=
 =?iso-8859-1?Q?OduYmnpLd9ojeqfrg5Tp/APekPCN6ej/f4XZh9Zi7nTWiKjryGx3tDgar1?=
 =?iso-8859-1?Q?ni4W6qXNTuS8I44ify5J/KqWgDZe+WgswvppvDJv7MHoo6PXlCbmxkJTfi?=
 =?iso-8859-1?Q?MEb3K7NLddMPGKZvjKZhrMHU+k0W67nyThr/pWOTnjqQnaaXNCwSYHpXYR?=
 =?iso-8859-1?Q?Yh0K2i93ykG2TZGh5RdIR7xhWLFz8QTvQAZNW1mUQKAF7/AesU8pcsYf9v?=
 =?iso-8859-1?Q?64kyQhCo9g2z0LytuYVfqIohSWlO3e2XjyoIbNLFkVSVZ3WdomMXH8R2TR?=
 =?iso-8859-1?Q?8wmyruL/sWwcoKX0aUx2/NGeqfEUyDvbELbd9rzpiSel3c23Bm1/w0+pDp?=
 =?iso-8859-1?Q?TxasfXNRiRJQqfHuqdupmgwZWyGDqctJ54v8OfTImYwyZtGyRpOvTvBWpv?=
 =?iso-8859-1?Q?JDZmsPEGuFvuJhTkri4AB9n6KN9KJiLDf7EPqFMcqYlyRCAB00ehPMuJKE?=
 =?iso-8859-1?Q?Cuy7EelMbZCGz2nRS7Sr8QnA/kryoo8=3D?=
X-Exchange-RoutingPolicyChecked: bQCkph7J1lJw7cLM/zsF2j1W2+b2D8ze62pOQj+zyoqEtNmb/mBvdqL1zqe9XzGAhGRklN4+xh4OQHU0CPQrGirQwiK0NB2k2vMWRbOxKoy1RiBZg+1/VNWC+VEswqXaN5Feekr3wIgkrq303SXHjjZBJFDxfK2Bc6xj3arh736Ad1XpCNAAEehC+jZr2lGnVSl6d39dVQt/fE7l0IDIgCXZXGtUnJE0mx5rzWS2ZwFC2xlJN+Llq+pjmQ4BEcKCo2FzC790Z5GF3WV8jqwiu0jwd9j813PUsfXRK1t0YGpdOpGXMrr9/VM5w79UGwnTcCYuQ5yoBwmg3gLVfnn1gQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3097060-ea58-4a37-1cbb-08de905658f1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 01:22:47.1126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwDgpwR8mehvCjxXbV601ljlX+pe7Ao7KUPwoNMQDyNzCi07HAZ2z1wiV7Fe2mpck7adeSKYTWBN/6Y1TdjhGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6609
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

On Wed, Apr 01, 2026 at 04:15:27PM +0000, Satyanarayana K V P wrote:
> New APIs xe_pool_bb_alloc(), xe_pool_bb_insert() and
> xe_pool_bb_free() are created to manage allocations from the
> xe_mem_pool manager.
> 

It seems like you could stick this entire thing in xe_mem_pool.c...

Matt

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> V2 -> V3:
> - Renamed xe_mm_suballoc to xe_mem_pool.
> 
> V1 -> V2:
> - Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
> - Removed memset from xe_drm_mm_bb_insert() (Matt).
> ---
>  drivers/gpu/drm/xe/xe_bb.c | 58 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bb.h |  6 ++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index b896b6f6615c..26e2430c0dc1 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -10,6 +10,7 @@
>  #include "xe_device_types.h"
>  #include "xe_exec_queue_types.h"
>  #include "xe_gt.h"
> +#include "xe_mem_pool.h"
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
>  #include "xe_vm_types.h"
> @@ -172,3 +173,60 @@ void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence)
>  	xe_sa_bo_free(bb->bo, fence);
>  	kfree(bb);
>  }
> +
> +/**
> + * xe_pool_bb_alloc() - Allocate a new batch buffer structure for drm_mm
> + *
> + * Allocates a new xe_pool_bb structure for use with xe_pool memory
> + * management.
> + *
> + * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
> + */
> +struct xe_mem_pool_bb *xe_pool_bb_alloc(void)
> +{
> +	struct xe_mem_pool_bb *bb = kzalloc_obj(*bb);
> +
> +	if (!bb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return bb;
> +}
> +
> +/**
> + * xe_pool_bb_insert() - Initialize a batch buffer and insert a hole
> + * @bb: Batch buffer structure to initialize
> + * @bb_pool: drm_mm manager to allocate from
> + * @dwords: Number of dwords to be allocated
> + *
> + * Initializes the batch buffer by allocating memory from the specified
> + * drm_mm manager.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_pool_bb_insert(struct xe_mem_pool_bb *bb,
> +		      struct xe_mem_pool_manager *bb_pool, u32 dwords)
> +{
> +	int err;
> +
> +	err = xe_mem_pool_insert_node(bb_pool, &bb->node, 4 * dwords);
> +	if (err)
> +		return err;
> +
> +	bb->cs = xe_mem_pool_manager_cpu_addr(bb_pool) + bb->node.start;
> +	bb->len = 0;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pool_bb_free() - Free a batch buffer allocated with drm_mm
> + * @bb: Batch buffer structure to free
> + */
> +void xe_pool_bb_free(struct xe_mem_pool_bb *bb)
> +{
> +	if (!bb)
> +		return;
> +
> +	xe_mem_pool_remove_node(&bb->node);
> +	kfree(bb);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index 231870b24c2f..638d8fc53f1a 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -12,6 +12,8 @@ struct dma_fence;
>  
>  struct xe_gt;
>  struct xe_exec_queue;
> +struct xe_mem_pool_bb;
> +struct xe_mem_pool_manager;
>  struct xe_sa_manager;
>  struct xe_sched_job;
>  
> @@ -24,5 +26,9 @@ struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
>  						struct xe_bb *bb, u64 batch_ofs,
>  						u32 second_idx);
>  void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence);
> +struct xe_mem_pool_bb *xe_pool_bb_alloc(void);
> +int xe_pool_bb_insert(struct xe_mem_pool_bb *bb,
> +		      struct xe_mem_pool_manager *bb_pool, u32 dwords);
> +void xe_pool_bb_free(struct xe_mem_pool_bb *bb);
>  
>  #endif
> -- 
> 2.43.0
> 
