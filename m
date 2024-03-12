Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B199C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 23:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEAB10EE6D;
	Tue, 12 Mar 2024 23:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3OZfJZ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D5F10EE6D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 23:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710284864; x=1741820864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=75b1ymNx3kJIdWVlNz9NvOTInQ0WmDXEUkB1/FPYeXw=;
 b=W3OZfJZ0aYExB6CoMFqMo9+kmVDdi4BVRVYnHU0JYd2IUsTaL0vZA3hd
 9/Zgi12jwOFmdsOiz5Lqxl3ivHRUkVbRsgBmij9iruD+pRr8Aw9Bfi9jT
 ThZWjgMbjHPwFr8Lu/zoD+FHjP8DVonkbdqfOYaRHOn+KCUKqUywN2PMF
 HxPtbiFOv509cVSeUP++lu66H03LQNE3/a4GGFtUr1mlnW9vg/87u8MYs
 gf7rSJdzn4FlLlvcuGmwpFhLPOyv2ZcApTsUUe3xzl4t4TKaFWtYcncJt
 HNMIZtGY99BZjSvl4UatoANWmjhH2ulEZ6PuHHBTtk1v63zDTR5/2Ha2l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5195261"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5195261"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 16:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16348124"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 16:07:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 16:07:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 16:07:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 16:07:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 16:07:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN30vFkz5Wl5zBCHu3leJqgJSK3BJ7pC5ut8gT2l5WxvrmO9Z1aZsEbTIwL5NFAyvMk2ZEREvJMAS7IlYVDRyo323Kz/vcVe57WxUI5QaJvqQLsUTrt0eCkl9dE2sdkUT9/rVbOPMqqCkcb9QQLOgcO9Bdb3OezoL4X604hXhtDfiPrlQt+toFYazddMGlonkPLZ7PjgtP13wnaVq6pDtZ6AT2APNa5EiD16NDXOl8uXoi2bdu3fuGRUOPiHPVGhCB+S421Z5GQ1UE8VSWE3b5ePzkuG115zCxjNTy7b1l/D0lG5diT+YNAuW0NWSby+CpB0u2h1RPz2OmN3971mcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7i8OYg0jpzJqS05UvfE3pslOlXY6Iws4YPqdOkF3ZY=;
 b=KE7FYfOVDu0leWRF24bLr3GQqK8Cf4wbop+71wglOUPPvUPpTIvA6KwAsHScoJjOHVNppWrELcgtoE7+2fzXS1AzHCaEapNzoYfbMw/QkXy8UdfBj6rFUWDHI3BvCEGlUAOI2fpUHo12JFNGkGV43urn1SrtVpu4fDqHvxPHso61qm5gP+UP5KQODpN44WguEeVHQL9koPNfZO/IiRTEUVYEkSvL20kteRLWMDHHnLicnCGgJsNxnMCGNlaOSrutN/7NzNoHAAO0kQv7iHyS6BHodjGbFmALnDZjhHU/jvecUedE2GwB9sBRA373RXmXYjRezmLTGM7YhVDzW/Ip7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 23:07:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 23:07:17 +0000
Date: Tue, 12 Mar 2024 16:07:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe: Always check force_wake_get return code
Message-ID: <20240312230715.GO718896@mdroper-desk1.amr.corp.intel.com>
References: <20240312194256.965685-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240312194256.965685-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY5PR20CA0010.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4723:EE_
X-MS-Office365-Filtering-Correlation-Id: 099ca8a2-4a7f-4436-0ec8-08dc42e929ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A83lG8uLyLLyWnNfjBZAtPgB0Bqb3rhNDGm7x2EvNLIJi4y9FnPeBlXbA4SZaZ5NDUUNZAeE0UM14PiPHf+tbj0JxAw/IHFaCs5D/UkezAJ5xUpakqdlE/MNYAJzAr8w0F+UUMWVbZZfiwW1h/7PIyWf1bdAtggx+UJCLA7T8VhgblrRRkm0n3cNdW+lUKxvV/cRAg6WVScPqLxAgOzX+Jtv9OITL5hlmNPGhQgAQvEfQ7amY4Rn5RIhGe9Gig0gOOdySroSjowhnoC08wLJGMhmO1WcKNLHe1my5WIHzgIY1QQAZR2e7fCn7WHQXF7+0S1g26vNRSJv2yA+VV9Je+0+I+xmJ0+Z1fsCfQO2T8ZWSQfOziaKxDoMOYVLKUdvhrVyrmJ+BeVXRPnp1SKGy8xbeB/mMst4xpv114NMQNLuS5l4L7a7Nqxo1VddyzS2oI2Mr9A6PrW3FZaMyaSy5xx69MBneJvOsMghDEonx+6oWRnA0O5F26S0ygD7rq02b3moJFcVOOSTbBhPdVsER0+89sPUfrYMGWllNrHCDQfdN+U5Uw0C03m1t/eqByIEmfOLDPlabv2gOxm0BHZ/DA3/d30ng1oXg/xrAuoKg5uNTvDrMfImY2duRbUqCfAlbhr08UDFU6fv8tflX8PNgDTNz0Wla9RfsW5Tic8WMew=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A1cAL76tXyDEpcSXpvAQXmzVxjnhzKWEwiY1l61GYfR8gyoef0tu0lWpq5cf?=
 =?us-ascii?Q?4XWqzVN1qv//OJOGGQ7cVAsUiVkzzXWRLQ8nL0xCUN1MW6qvSkqK8u3a1aRC?=
 =?us-ascii?Q?dbQHTEqSEqLxfo0LMVc+dhpcrWeqg3MaVe2srLeGXz00fe2/agtajVUQ9TE6?=
 =?us-ascii?Q?8k+TrprlQHr7QmqDrJEYMwLCf1uggebN/0W1TzPVPmvk8/ba7RN7OdIGmeYq?=
 =?us-ascii?Q?cmpDontjyql0WG8eg/RurgXC5Rya7qqQmmv39WvCeUJQj3FXhheVRQPEng1P?=
 =?us-ascii?Q?sVSfwOoDyod3YPVZBIj/xmWajJc736Njka01RQQMfHMJTPIH2iM/GRlF9O+C?=
 =?us-ascii?Q?MRd0FSdJ6C6PDMVq0G8zkeijPh8N4V6FViYAKjZGAX14app66QskUPVgGl9m?=
 =?us-ascii?Q?VUnfdB5x8CQE1QSgqUEIYEKsJA2NRMMHRVBSt7aC+GCKkYm//EyD9CFk92Em?=
 =?us-ascii?Q?eGfbFTZeayZLdGhhc98KYxUeeuyO4BhzSJNoG3OReFrvOqhGUrmzyWJNVJtV?=
 =?us-ascii?Q?hFML8Q0d2sVdUQcS1EpUnG8h+OS7zqdAqa1CDtYLfDeOPUJb8O7r5ad6C/ys?=
 =?us-ascii?Q?LhWdpoUG/mYIvC9NLRVqAkXWQxQCjGiijJ/M2hrY23Bbvy2nQLudkS/EH1Wd?=
 =?us-ascii?Q?jSue+nfitKX5OScE2CCQRRloju9uYmX9KC+m8N2/qGkjJS5GvXCtlw1WUnBu?=
 =?us-ascii?Q?yTazYvFVwgkSKmAboBptXtVMZhgx4Gdqr5QRE28MlGZQ276Sq72kruJ696g0?=
 =?us-ascii?Q?G6Y7qOSOjeoGA7bhytCMzpjUfhjI5rC1OV2AvvwsgOizwceY/WiX35gisNGw?=
 =?us-ascii?Q?IepHGN3B7T31L8if29McngwduWpMNGABxcQuHZ4Sih6gPl3oJO8TlwIVhcn3?=
 =?us-ascii?Q?cy28amWTTqy6qRwXSDFDm28pdQZ0WITPGpjtb3zf3Q1ZFFEmSe+oUb2i/cjb?=
 =?us-ascii?Q?DmORHqvX/a/QHN9RBf5AOToQrBBOGa4Qp8CHrtz8IhYkOG1p132zWAkJpIuz?=
 =?us-ascii?Q?iS0BPiZ+zp8YxLmnbSri/ZdbtEDYBdybtZaxp4ZqA+Q5xQBKKscH2pKN5Jpo?=
 =?us-ascii?Q?pkH/2fF7xNEoo48CxG+QcxAFmzvubKSjd4cP1tfsTbpC/3xAjIWVALbfUcpp?=
 =?us-ascii?Q?3Qia8ql2TPvZPUGRMPDOo1utCizNfsGP2aDv5cwMnXDHzzYmBjz96tBwbhzr?=
 =?us-ascii?Q?i/ydJq5+GlWJzguQz5AvFZmOZ0Reoo2AKDQ+DEqcPYzYEvTLVY0NDgj1Kbjn?=
 =?us-ascii?Q?ZZ9XG1D1zl85fE6kF7BccoHz3PT467rdgPyMsfP2nU/8b1thDSJ37KkEIksg?=
 =?us-ascii?Q?c6ssSdY8aa05Ib2NJnziwbl/JZueT+2Nnfg9dP764p4bc9oxS4xOUDbOUatJ?=
 =?us-ascii?Q?xeHJkFcV0lpHrUspPVPXK2Iwdxz1r4DqFHHa8wYlBmetIkBDMV+05f9ZX7yO?=
 =?us-ascii?Q?HMkjxT0nUqRkZG2nBf0TJ74N7ePfy1jpe5VxcKWgvUAhV6kg/u7RFjJhMTCd?=
 =?us-ascii?Q?c+Nvz6CFvnEr8Fj7VgzD2Y6fmhE7Boq5hOHn6lTk0zUOlizBq0XfOIo4GE+l?=
 =?us-ascii?Q?mP0hV7ZhEX3GQ+XXpWoRefsAg/6shTzwUsC6oYgGczgvcJG2gJGKQlO88CBK?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 099ca8a2-4a7f-4436-0ec8-08dc42e929ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 23:07:17.9090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3p0iANC6kQnZfjzzZJ+OByT1EihvHnCK0Nfp0mv3HQTyWMcEbryOyU3MvoCGCIpoYg8jNnkKxJQ06NaQLPcpXIh8nCVGUCcbff7u3l37iRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
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

On Tue, Mar 12, 2024 at 12:42:56PM -0700, Daniele Ceraolo Spurio wrote:
> A force_wake_get failure means that the HW might not be awake for the
> access we're doing; this can lead to an immediate error or it can be a
> more subtle problem (e.g. a register read might return an incorrect
> value that is still valid, leading the driver to make a wrong choice
> instead of flagging an error).
> We avoid an error from the force_wake function because callers might
> handle or tolerate the error, but this only works if all callers
> are checking the error code. The majority already do, but a few are not.
> These are mainly falling into 3 categories, which are each handled
> differently:
> 
> 1) error capture: in this case we want to continue the capture, but we
>    log an info message in dmesg to notify the user that the capture
>    might have incorrect data.
> 
> 2) ioctl: in this case we return a -EIO error to userspace
> 
> 3) unabortable actions: these are scenarios where we can't simply abort
>    and retry and so it's better to just try it anyway because there is a
>    chance the HW is awake even with the failure. In this case we throw a
>    warning so we know there was a forcewake problem if something fails
>    down the line.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c         | 9 +++++++--
>  drivers/gpu/drm/xe/xe_gsc.c                 | 2 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
>  drivers/gpu/drm/xe/xe_guc.c                 | 2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 4 +++-
>  drivers/gpu/drm/xe/xe_query.c               | 3 ++-
>  7 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 0fcd30680323..7d3aa6bd3524 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -13,6 +13,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_hw_engine.h"
> @@ -64,7 +65,9 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>  {
>  	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
>  
> -	xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> +	/* keep going if fw fails as we still want to save the memory and SW data */
> +	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>  	xe_vm_snapshot_capture_delayed(ss->vm);
>  	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>  	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> @@ -180,7 +183,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  		}
>  	}
>  
> -	xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> +	/* keep going if fw fails as we still want to save the memory and SW data */
> +	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>  
>  	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
>  	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(job);
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index d9aa815a5bc2..902c52d95a8a 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -287,7 +287,7 @@ static void gsc_work(struct work_struct *work)
>  	spin_unlock_irq(&gsc->lock);
>  
>  	xe_pm_runtime_get(xe);
> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));

Should this use xe_gt_WARN_ON() instead to make it GT-specific?  Same
for the other cases later where it's even more important to know which
specific GT is misbehaving.

Aside from that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  	if (actions & GSC_ACTION_FW_LOAD) {
>  		ret = gsc_upload_and_init(gsc);
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index a3c4ffba679d..7f1ac02b96c6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -247,7 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  
>  		xe_gt_tlb_invalidation_wait(gt, seqno);
>  	} else if (xe_device_uc_enabled(xe)) {
> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>  					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index caa86ccbe9e7..32b6da891f72 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -251,7 +251,7 @@ static void guc_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc *guc = arg;
>  
> -	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL));
>  	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
>  	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index f4b031b8d9de..b4b39bfcb5d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -927,7 +927,7 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>  		return;
>  	}
>  
> -	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 19efdb2f881f..d7462969af1e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -833,7 +833,9 @@ static void simple_error_capture(struct xe_exec_queue *q)
>  			}
>  		}
>  
> -		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> +		if (xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL))
> +			xe_gt_info(guc_to_gt(guc),
> +				   "failed to get forcewake for error capture");
>  		xe_guc_ct_print(&guc->ct, &p, true);
>  		guc_exec_queue_print(q, &p);
>  		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index a6a20a6dd360..3975f99fdca5 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -147,7 +147,8 @@ query_engine_cycles(struct xe_device *xe,
>  	if (!hwe)
>  		return -EINVAL;
>  
> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
> +		return -EIO;
>  
>  	__read_timestamps(gt,
>  			  RING_TIMESTAMP(hwe->mmio_base),
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
