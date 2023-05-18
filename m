Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72713C7EE23
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 18:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425E510E0CE;
	Thu, 18 May 2023 18:05:57 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58F810E0CE
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 18:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684433154; x=1715969154;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=04q0U7uUDSDojqnNQ1ybNjFvJHoeaAjWn70iuJZGSVA=;
 b=K2XZfXpX7KRTl73xU6a65ggPBpF5XEukH4p3whoYGxRvkmcjiGXJcVgk
 Vq3xHsHJGkeS+Xr2Ku+4NX23xTeeKWTqpUdQeefQ7AdAaAy8O68g2jWOp
 J7DWa5gmM6CWLstICPrFMswR1vUs4E+AcAdWXl+m0KpMzkKdsnlKvFCib
 vEVabC4J+SvFTobBDqAo7ojJvIH7FAh3CAdMcoZZr/+/Fk6U8dKYKOdPn
 SoFzxmr9B745+VKhWAOnYqD09ozqaBPtb/NJQYmyrRAPSosl8cUBpNotL
 R7fBRnGQ5ggYpSCEymEKXFCNtp7h/zAn83eS/1ceyEX3VGxK5StWF5hrx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="350984657"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="350984657"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 11:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="948780043"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="948780043"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 18 May 2023 11:05:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:05:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 11:05:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 11:05:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMm2p57+lzbmu6TneZqAWG/0tCAWKn5DcWzzzIVHBjKK9U0E2cyP5NmCeqPla7zgA0epZc8Rbe/mTXGZNdSjQk0PP/o9s0AKnNl2TcxiYlv8IZ3nuc4g9hsiBr0dyP+NZIe4HyJgkNxazHg2g7LKBNGpl9FgOhViRMnTJn6JnVI6R53bO44gl50qLO5Gr7LAI44w2gZMVdTF8sjmXAQUmfZxSlN84yISONWKp1Ma6blBfoASICEaDKLSI0JjxZ6zfbN5Fsr6cUUZAbabGWHvDDNqQIU67BJ6R+tpByOPRklAcbOMo/0Y2dFz3hcf5Qy04BhfwmNd75hhBhkGE0DejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJL6RZqVjYb4n4QwSXYn7BpNYIZeA2N8oEKKHhbloMw=;
 b=X89Ea6PcF3ixoHux8om/ApwapMM6j+WoZ+hd9N9OKVLsk3QvwjuGRDlB4NUdFisn+PXFVbc/QIKnreb3o6dA8RoN8V2Wv1rNag+gOWNQr5om5RZrphzCC0CLk1/1BSIJAoF75fuBB8IdTbrcsZty2WoHkD5d2GVsfrkGQmZICnUmfxTLLTPi7rgRZtlleCABz7ElFdIjv6jTZbFEEq+hr/KgtEzh+eJL1zkUofcalCuhCV8k78eOpHo19Xnrqvn/0mWvwtAhB8bpPHp6JMjTIkNjB/NuITtd7DM5tdis+mgJVJ6LOU2SwAoSHTDspt6FBVAow/CY0sw4RqKKGp6W/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6265.namprd11.prod.outlook.com (2603:10b6:208:3e7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.33; Thu, 18 May 2023 18:05:49 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 18:05:49 +0000
Date: Thu, 18 May 2023 11:05:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230518180545.GC10045@mdroper-desk1.amr.corp.intel.com>
References: <20230518134128.1072-1-michal.wajdeczko@intel.com>
 <20230518134128.1072-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230518134128.1072-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: badaa89e-427b-4f84-144f-08db57ca828c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bb+CcJO8BZzi2+ZfrxthCBMJRnSglBoj4Rv6hBQjbr3jfzS7RxzG2jhc5WH/KlsWnHMBWlHn4BppL99bdrGMW0NJwVixbFvhpLm1C0UsuPslntxMcsp4Ta6C8R62hgXPnallgWZq9LKGc4MGeN3WX3+FgAx7CANjLliIrihK1ynAzDkBJEZsnBSjiNJAS9vhmWTKqZsoGnId9BA8f8h9DwiDK3Z1qRFfrfSs3WWyvHU+HFP6fos87TtVd1Mn2tOi8X+DQ7k+rb0G+abnBwzS/ITNGm1gHEkhPlGafHnwGR9UmX6/UBz5cimIw1cJ4/ytt/ndcyFFNxVtKpiMAkWxx9YLZMKBA9iTy3zC/Ye7JzYSDANhR6WryxlwpF26UdN5UA0N/17/y35lrmYCIPYT/taoF1MV9aD4LcHSVS3+dm2OKnds83naByZvS9LQmbL3o/IxWemCX40lQE3VkZzVloIE7P1R+vU6oBRFxjYkScb32FYrLf5msFOh+MZAn+C0sLO0L+M7y2ZZ5lIDWdXFtO8QgHs186aWtr5FsBi+xd+l1YOH9uKqpKf41jxsp4Si
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199021)(66476007)(6486002)(66556008)(66946007)(6506007)(6512007)(107886003)(6666004)(316002)(6636002)(4326008)(478600001)(41300700001)(5660300002)(83380400001)(186003)(26005)(8936002)(1076003)(6862004)(8676002)(15650500001)(2906002)(38100700002)(33656002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n9PMPfZeV9yg6lM5q9G+1k26zgLQA6RcVekqrEpnPmoagBubsHcRSQ/wkYer?=
 =?us-ascii?Q?2/5dwM/0AmlNEha2r8yJYp/fn/uTf4r0PeQTXv9pkyPS0hkFPM2WJrtS+KCD?=
 =?us-ascii?Q?Iu5HgPYHfhNZbxYeKMx2p40Rat2waWMm0e0OrZsmjMJ8tIE15oU09ihWRVoR?=
 =?us-ascii?Q?dOoEuu9x1fANG8q+Nr9KI0R5AZl3WuH6q2tku3NW9m+rMeQh3Xd2QHlEptbX?=
 =?us-ascii?Q?s/kZj7QJqldVWYnSOS+5PfDaJi+otcOY+mGTAAbA4rhJO+cybKPaEZWSomux?=
 =?us-ascii?Q?gR6aUEeMsso0iyCMA6CtgtcLsynR20KmyKzZsyquNQ/n2+2QtWycw88O7o2q?=
 =?us-ascii?Q?NGJpD3gR0ZKBTvLTrAYZNw02LcKYAZvs8uq5zS8A/PMySnufqy59nVQcR8VY?=
 =?us-ascii?Q?zu8f2LH+Z1BpYljQxBVBIQYPpEVpn/a1tIsNYdkdPbj3cK2YP+0qXuQEF3sj?=
 =?us-ascii?Q?UoRB4Xlph7pmASjbeXZfWFyKI86sX085Jx0BFl1FXhmxjvaJqGFUnCEGSfF0?=
 =?us-ascii?Q?l30yMRtzRV8vY15oQdIJFFSNc2Qq8VQkcgA6h5ncxZLDHgrrOAQl1ERvYtKm?=
 =?us-ascii?Q?Zy4WAydbZT1LcMrM47EWy5PTTrPERgbvzmBeef5RpWkdlKsmoCrCyHQOTGnI?=
 =?us-ascii?Q?g/q2KaGdyS+PuCHbBWsquGa+Yq+u5WG1zVX/OsNL9L/byaJ68eXcA0TwB1MI?=
 =?us-ascii?Q?ybbBz1JEYCcodeqEFDk16YIRKdxyMgWdDxJA4DfD0IUsg1nvsOMsZiVJQbvW?=
 =?us-ascii?Q?TEf6uUgNQVH2fhAKFMKbDnSOH03SehGqhCelHRii6ARSFOR9YITE7PK9ap8W?=
 =?us-ascii?Q?R4YJuOyPRoj0gKA+XBrbS6ibGXtcxZ9Dcop9QazizQ61VqYNKfoioLovUB4/?=
 =?us-ascii?Q?zxvNPF3AYM0DdOxuJGDb1s5838ZeWB1tROW2Jb9kybjQSU5mL7viOMrhIf1P?=
 =?us-ascii?Q?Ax18uXjuGassbkeCOuJyvx9mS8AHerK5QpJihird8GBpiaND6BLl7kfVc3W/?=
 =?us-ascii?Q?yBA8K8EBM4RDKMuEnM1YY2JMZjLreCOzCiOmhBtUftFNEgDG3pYqkikbQWzC?=
 =?us-ascii?Q?LOznAjRiscZGZUaAMYdjrsRfu6mkk7/dYg5EuB2rTu3ys3ZKXFosMCm9MZc2?=
 =?us-ascii?Q?zNulJRnYa5RKUBoIfOCv02FXidVIjlSL9cttXuGK8QfHrjKRdLzilb5K+bXq?=
 =?us-ascii?Q?rR3ND78a5ZicwVKt2kKt7QrMGxPBj7gy1UF+vSig6MQ7ZIbUG/+HVLsjJ6/j?=
 =?us-ascii?Q?ODVDJW/6Gx4VhDwZJwfpFdcp2aVdzhrCSot5Tck18m6ASyPp0kTcAvWyFPq7?=
 =?us-ascii?Q?hxeJdBi+7FDulxXZ7a938VvVCW5O2q06LvsbHaPAl0MewlBxp13RSbiypUwI?=
 =?us-ascii?Q?gI/fpKz4zDbjN5EPtvk+odPfDLXMMkmY29c6Veu9FqGv4682nquRNiTiG9OQ?=
 =?us-ascii?Q?cmCa8qcfqrrzlhjuKJH7PCr43eB0s7D9V3GJXxJR8xaqZjwftC622Yw0xQel?=
 =?us-ascii?Q?s9X8zeWieB/LwXoDhyqMC73GTLGnYkgseXoNBROgSWUUPszcG3k3GM7Kf8DH?=
 =?us-ascii?Q?pYd7SCQN4n4724ZFyDmwhabQoZevNWfjYUv4u/QZmZajFRFwf80Ng3Vd/8pk?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: badaa89e-427b-4f84-144f-08db57ca828c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 18:05:49.1263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJF4EwWwouvNSo05kOxaDA99sOhFDvfQyVVr/hBJJH4TGBTA53i60XyH0KJnuayxRNo/AnfPUWi7m60ynBJhT2UFoquog2urJM2uNY2yEYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6265
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/2] drm/xe: Use GT oriented log messages
 in xe_gt.c
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 18, 2023 at 03:41:28PM +0200, Michal Wajdeczko wrote:
> Replace generic log messages with ones dedicated for the GT.
> While around replace errno logs from plain %d to pretty %pe.
> 
> v2: rebased
> v3: unify errno logs
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 49 +++++++++++++++++---------------------
>  1 file changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index cbe063a40aca..80d42c7c7cfa 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -20,6 +20,7 @@
>  #include "xe_gt_clock.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_pagefault.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_gt_topology.h"
> @@ -239,16 +240,16 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  				     hwe, ENGINE_FLAG_WA);
>  		if (IS_ERR(e)) {
>  			err = PTR_ERR(e);
> -			drm_err(&xe->drm, "gt%d, hwe %s, xe_engine_create,e failed=%d",
> -				gt->info.id, hwe->name, err);
> +			xe_gt_err(gt, "hwe %s: xe_engine_create failed (%pe)\n",
> +				  hwe->name, e);
>  			goto put_vm;
>  		}
>  
>  		/* Prime golden LRC with known good state */
>  		err = emit_wa_job(gt, e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_wa_job,e failed=%d",
> -				gt->info.id, hwe->name, e->guc->id, err);
> +			xe_gt_err(gt, "hwe %s: emit_wa_job failed (%pe) guc_id=%u\n",
> +				  hwe->name, ERR_PTR(err), e->guc->id);
>  			goto put_engine;
>  		}
>  
> @@ -256,24 +257,24 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  					 1, hwe, ENGINE_FLAG_WA);
>  		if (IS_ERR(nop_e)) {
>  			err = PTR_ERR(nop_e);
> -			drm_err(&xe->drm, "gt%d, hwe %s, xe_engine_create,nop_e failed=%d",
> -				gt->info.id, hwe->name, err);
> +			xe_gt_err(gt, "hwe %s: nop xe_engine_create failed (%pe)\n",
> +				  hwe->name, nop_e);
>  			goto put_engine;
>  		}
>  
>  		/* Switch to different LRC */
>  		err = emit_nop_job(gt, nop_e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,nop_e failed=%d",
> -				gt->info.id, hwe->name, nop_e->guc->id, err);
> +			xe_gt_err(gt, "hwe %s: nop emit_nop_job failed (%pe) guc_id=%u\n",
> +				  hwe->name, ERR_PTR(err), nop_e->guc->id);
>  			goto put_nop_e;
>  		}
>  
>  		/* Reload golden LRC to record the effect of any indirect W/A */
>  		err = emit_nop_job(gt, e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,e failed=%d",
> -				gt->info.id, hwe->name, e->guc->id, err);
> +			xe_gt_err(gt, "hwe %s: emit_nop_job failed (%pe) guc_id=%u\n",
> +				  hwe->name, ERR_PTR(err), e->guc->id);
>  			goto put_nop_e;
>  		}
>  
> @@ -541,15 +542,14 @@ int xe_gt_init(struct xe_gt *gt)
>  
>  static int do_gt_reset(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
>  	err = xe_mmio_wait32(gt, GDRST, 0, GRDOM_FULL, 5000,
>  			     NULL, false);
>  	if (err)
> -		drm_err(&xe->drm,
> -			"GT reset failed to clear GEN11_GRDOM_FULL\n");
> +		xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
> +			  ERR_PTR(err));
>  
>  	return err;
>  }
> @@ -592,14 +592,13 @@ static int do_gt_restart(struct xe_gt *gt)
>  
>  static int gt_reset(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	/* We only support GT resets with GuC submission */
>  	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
>  		return -ENODEV;
>  
> -	drm_info(&xe->drm, "GT reset started\n");
> +	xe_gt_info(gt, "reset started\n");
>  
>  	xe_gt_sanitize(gt);
>  
> @@ -628,7 +627,7 @@ static int gt_reset(struct xe_gt *gt)
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	XE_WARN_ON(err);
>  
> -	drm_info(&xe->drm, "GT reset done\n");
> +	xe_gt_info(gt, "reset done\n");
>  
>  	return 0;
>  
> @@ -637,7 +636,7 @@ static int gt_reset(struct xe_gt *gt)
>  err_msg:
>  	XE_WARN_ON(xe_uc_start(&gt->uc));
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
> +	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>  
>  	return err;
>  }
> @@ -651,15 +650,13 @@ static void gt_reset_worker(struct work_struct *w)
>  
>  void xe_gt_reset_async(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	drm_info(&xe->drm, "Try GT reset\n");
> +	xe_gt_info(gt, "trying reset\n");
>  
>  	/* Don't do a reset while one is already in flight */
>  	if (xe_uc_reset_prepare(&gt->uc))
>  		return;
>  
> -	drm_info(&xe->drm, "Doing GT reset\n");
> +	xe_gt_info(gt, "reset queued\n");
>  	queue_work(gt->ordered_wq, &gt->reset.worker);
>  }
>  
> @@ -676,7 +673,6 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>  
>  int xe_gt_suspend(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	/* For now suspend/resume is only allowed with GuC */
> @@ -696,7 +692,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>  
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -	drm_info(&xe->drm, "GT suspended\n");
> +	xe_gt_info(gt, "suspended\n");
>  
>  	return 0;
>  
> @@ -704,14 +700,13 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  err_msg:
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	drm_err(&xe->drm, "GT suspend failed: %d\n", err);
> +	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>  
>  	return err;
>  }
>  
>  int xe_gt_resume(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_device_mem_access_get(gt_to_xe(gt));
> @@ -725,7 +720,7 @@ int xe_gt_resume(struct xe_gt *gt)
>  
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -	drm_info(&xe->drm, "GT resumed\n");
> +	xe_gt_info(gt, "resumed\n");
>  
>  	return 0;
>  
> @@ -733,7 +728,7 @@ int xe_gt_resume(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  err_msg:
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	drm_err(&xe->drm, "GT resume failed: %d\n", err);
> +	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>  
>  	return err;
>  }
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
