Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1887C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 20:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EC710E9E9;
	Tue, 28 Mar 2023 20:14:30 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F1410E9E8
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 20:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680034468; x=1711570468;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KM1ENFHfZTZJVSXmO12N4NCxEV+chWvinljBFoNqjBM=;
 b=MBMpc2DmUDmqC7cJwijpLryx8iAiH7TwTbYtDCqHtMqzJ2y/ycR58uLv
 W6ZSNrgXv5sAquUBwJ+2iBzlQQjHpdKdQcYvR10lEC7dDn01ayTRtXg1c
 33Rb2N1sHo7LN7lFFu9e2Hsxk8TaaaQgJ/THNiGbnPCCyBa5t+uh2A/DK
 Nbq2kcFzTWHUFFhd21i+nEUZs1X6/9yCLJoxEzAiwYEN6hzW5opAoFXf0
 S/VzDYqQZSyLCQMmqeBSGXtA3YJRTKZgEAfWaMgB9DMk9GF9Fm3reFl4A
 +XhbK9KjXhmXyHFNEy7UCI9hs6UtyPr+s91zbMuQr+ozSYEChMiJZoHH+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="320334979"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="320334979"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 13:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="1013701668"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="1013701668"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 28 Mar 2023 13:14:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 13:14:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 13:14:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 13:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsFeSchJQ9SYLRVkg2Ge4OixvFw6XCuhlK4eFffKnxrfkZCKgwH4Dde83x2w+B98RG7K7j8xirDr9S85/wHFfQA9RoxmRqYGKfIe+3XZAp6Ef03z7OjdtP6P8+EMQCqgYwc02asz0JrXbWBWF5iVxyBol1FxzqI6yfh4GA67e9V0ywrG720i34vkhGtSxDI+gB3KinPaolZ1C2iaopbfVHV9U2B6F+/6NsykK15Yk4OvzZ4NnZu71tMdWgjjXAJF3VodFrl6N8tO+bGTJJOTGn6Kievdmch1o7NaqHQRGW2GJcSW2+i8/rZvE1tumql9v7PUNCzbmLHTwoKQNNFc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQ2Phi5KM1Iw0sMy7NKGkFjY98w2El/ttdjrJTVx7V8=;
 b=nzmtYAoVudLc6Wjfa37GVHJSbY0QmcCeu5S5XezuC+436xEkAZovL9zx7+SJKIrUpfJnOYwNPl/iI05jjIEOkg3baQf7m/HZXTVvJFCKYnCnGQAjeslHUEv5mGJY8q5JwucHCM+Lno1C5/KOo2Tro1XExcjOP1dWYUPea4z7PU78/O4fkh+GU8DYuXtAwRorjr/LQYFiCUPgXK+xObNjZ4tgrcB6A/3YPbCVX8H6mLZPh8fnx0mO9S3m8cBDsrguBtqJuAcfApccFNgF1l6FHqnpOYuAwpO+2vSAZUjNLqae04E2LFhAWCtYpn6M01ct+kslIHTVSMpqud8+TlZwfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.33; Tue, 28 Mar 2023 20:14:21 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 20:14:20 +0000
Date: Tue, 28 Mar 2023 13:14:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230328201412.GK4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230328195822.1941865-1-matthew.brost@intel.com>
 <20230328195822.1941865-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230328195822.1941865-2-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::41) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL1PR11MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7734bd-152e-4182-4772-08db2fc903c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ulgVBR6LI+RAD/+YqeWMYpD3v4jWJm0Y0GHmAhYJllx+L2Uz9qRlxrkEDJAEf+wqN5cYZoxKqUu0y/IgPMJY26uSldn3zAMIlUbaNBasRqhgro6MYrReWLZWfYhFWgNeammSKC/hxeViNRokPJQ2Yxgn9JD20IRxGxWgTuqypfTS4zLpXdq7kBbXdYaSGvRaRLeopM5WjusYt+eeKsoBXxdKw1YI/JPmGEAW2R5pK7yhdoOZtGZOtPWTgd8BSUfzZa4C5PSe3hwXS59dOpro9v7v2g91g91YWSStpiOT/L0NN7Tc3Zur9BzhrJZct9oR3hrjAh6iA98CpGQHZffnmCwpP/Yl7mZD1/t6aOpcIsVxN1r9q1oL8wExkF6gsDNtY9r2ZHdOkFOpysXatDiWR0IMW95UBR2XDFtnmXqXNcCWTtChE3Una+xG20lxjND8TNOkpvTpFwcFAM2tnzYkBeszYDLdcUxbHlqz9XsOVt3zWIh+a21BXpQWKu44QxjsMF/G1Plt8gmR1/GjxUKO/NmV0I1Fg0MFYUdMSSbUDC50b/BUMz8MYkM6YRj7gHuz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199021)(6486002)(478600001)(316002)(6636002)(26005)(33656002)(2906002)(1076003)(6506007)(6512007)(38100700002)(15650500001)(83380400001)(186003)(86362001)(6666004)(41300700001)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(82960400001)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aMmpgIXLWyHoTFVR6zgPZHwvjaXz8ZM10/5h/VXkSsRmSL1IbovMtlshdU7O?=
 =?us-ascii?Q?F/l5cx9uxNyyBLMoC4k26nzQhRozE1zO+W+JqcshHn6EidM6ELTegVr4qo/a?=
 =?us-ascii?Q?lr59XY4E0fjUqoYRgq8UM9qezLNlO4RUTZErn8d422vS6qEBToaHlvhfxQns?=
 =?us-ascii?Q?4LfYf3zcQvgyAgK5XiXgL7UnW08pVltpUPXwQkXlNGnFWSEqqnReQEkHre9A?=
 =?us-ascii?Q?bIEJkKil1q2iffhsCFQD2YUeFqiINAIe6xNsIUqi5AtSFlrXoDpASSNgU96W?=
 =?us-ascii?Q?PHdiDSQtNq7Frxv//pp0bw1qHo93h6hn+V+lH1vcPb/1/nLtygn/7E0f64Im?=
 =?us-ascii?Q?n2AsD1yFcotw2lknoedmoaI6/Hiv4/Mc+hshSBtvkhMegYuHhcnezVajUyZe?=
 =?us-ascii?Q?+TLDUNg6QRvFyprQ3PxkOrxDyKTMohI/ge5UcOnQ1+ypISN4OI8/AwaFXOQz?=
 =?us-ascii?Q?Alo2X/ci7o0UpBncBJAfEUK3A2nslObM8EZmFP916Hnw6pYcPVv2ZFOSte5L?=
 =?us-ascii?Q?iArggwa8UfbRPg8tiAb2IZHZW86nFaRO5O/F0nk1S+bH2GvYoWScWvXfFXQ1?=
 =?us-ascii?Q?fbnyHWuVCTTXfyMPvSPacbIoTeQC6Qh9KObOwHHIqIUCMIQdhYwPlpgrx9OW?=
 =?us-ascii?Q?sA6ozMl25y4Lf/YK7lq1Me4GS6Mx+erewdhQXWSiIAyiHUZl67Nm70X+YmBF?=
 =?us-ascii?Q?qj1D0iiC89A8TOCbC0Os9+771kdxbO+ML6m2mG4HsAFtUYpBxJonDW2CtfxV?=
 =?us-ascii?Q?I5Bd2YzJGb/rvmdRA7boxaKA8HbJPCWAdIz43nXPS2ROVn4VWc3Ea+oqcxZ6?=
 =?us-ascii?Q?HFwCenmXTRnnUn2uWCPl/UfXiOgnisDb7DIodSRSr/6bUdgPVt9NPlu1EqJe?=
 =?us-ascii?Q?CJoVM/DEWX3xkskhu5XxOaZ/fYhf6BH6dD0pGqHJNdPq3+n1f/ta6F81ahBG?=
 =?us-ascii?Q?Pm9OKQAUtRrNQSj0l71B+9lkVNsJ5RnL6SjtWka7xccJLHFdb0EXdnPhIs4X?=
 =?us-ascii?Q?sNTQyTIqcNMIvl8daqxgXQw5dLiZqI9ld5P3jsGijHHAL42zn5hZ2pr0tKdS?=
 =?us-ascii?Q?M2ijStoIhvGguFO5St3nSeeKZKipcgQY/k6sIniYapz1oCei0IIoaWUWu5g7?=
 =?us-ascii?Q?CH+zxXweZLcC/8eP4mpW+BQCGbY8mMmZXVZhSENdaTx8cCc4UIH5M/ZYlDtx?=
 =?us-ascii?Q?lqk5bPbqOg8tGr0Fw1ypTE++yoj+ny+eqk8+H+YSf4nMNx/G2nMki1z03D89?=
 =?us-ascii?Q?LCseP3+O7/mjDuCXu8yV1sY/LBrUeWQPw/KyBmYjqUK0/7X/S2s3rXJGWW1R?=
 =?us-ascii?Q?F4iR23pkiHJBgbz2nebtyBkymIsgt1b85sxVAU4FjD8J1T/Sc1JYI5xqel1X?=
 =?us-ascii?Q?wX9pcyCymbq51Cx0kN6qlts4xHXXnNmM/Nr+mkwWsyA7TkqL9vxI0v79onG4?=
 =?us-ascii?Q?UiJeilEzQhFLo8Defar4j0UbVLa2d7DStb5WLucR/G571az0ZrIIfOXQ4m5N?=
 =?us-ascii?Q?2yWEcEJETWnibDBUVN9upB7Z/gFcbNrYrjaEDaML0+6FZFtqN7AJp0YkLE6T?=
 =?us-ascii?Q?acb/CKu87Si00klajSdd7dDreVWwGNuStiaR07hR8VmHW08ril/KaA/EtQVX?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7734bd-152e-4182-4772-08db2fc903c4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 20:14:20.3885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNw9WuQhEqEAwO+Un1sNDy8km/OAyG9eEhGoLzrKGd6h1cslAbPEL3WehVHlH2V4bcDZ+nnhmrqq27DkJ20fHnoyunO2FLYp5PYHmim41BA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5351
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Better error messages for
 xe_gt_record_default_lrcs
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 12:58:21PM -0700, Matthew Brost wrote:
> Add some error messages describing the problem when
> xe_gt_record_default_lrcs fails.

You could potentially use hwe->name instead of the class and instance
fields, but in general

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

I've been using a pretty similar patch locally and I've found the errors
for gitlab#232 to usually happen during emit_wa_job on one of the later
engines on the engine list (but not always on the same engine each
time).


Matt

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6322e0689a9e..724ba2be5d3d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_gt_topology.h"
> +#include "xe_guc_engine_types.h"
>  #include "xe_hw_fence.h"
>  #include "xe_irq.h"
>  #include "xe_lrc.h"
> @@ -257,30 +258,46 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  				     hwe, ENGINE_FLAG_WA);
>  		if (IS_ERR(e)) {
>  			err = PTR_ERR(e);
> +			drm_err(&xe->drm, "gt%d, hwe %d:%d, xe_engine_create,e failed=%d",
> +				gt->info.id, hwe->class, hwe->instance, err);
>  			goto put_vm;
>  		}
>  
>  		/* Prime golden LRC with known good state */
>  		err = emit_wa_job(gt, e);
> -		if (err)
> +		if (err) {
> +			drm_err(&xe->drm, "gt%d, hwe %d:%d, guc_id=%d, emit_wa_job,e failed=%d",
> +				gt->info.id, hwe->class, hwe->instance,
> +				e->guc->id, err);
>  			goto put_engine;
> +		}
>  
>  		nop_e = xe_engine_create(xe, vm, BIT(hwe->logical_instance),
>  					 1, hwe, ENGINE_FLAG_WA);
>  		if (IS_ERR(nop_e)) {
>  			err = PTR_ERR(nop_e);
> +			drm_err(&xe->drm, "gt%d, hwe %d:%d, xe_engine_create,nop_e failed=%d",
> +				gt->info.id, hwe->class, hwe->instance, err);
>  			goto put_engine;
>  		}
>  
>  		/* Switch to different LRC */
>  		err = emit_nop_job(gt, nop_e);
> -		if (err)
> +		if (err) {
> +			drm_err(&xe->drm, "gt%d, hwe %d:%d, guc_id=%d, emit_nop_job,nop_e failed=%d",
> +				gt->info.id, hwe->class, hwe->instance,
> +				nop_e->guc->id, err);
>  			goto put_nop_e;
> +		}
>  
>  		/* Reload golden LRC to record the effect of any indirect W/A */
>  		err = emit_nop_job(gt, e);
> -		if (err)
> +		if (err) {
> +			drm_err(&xe->drm, "gt%d, hwe %d:%d, guc_id=%d, emit_nop_job,e failed=%d",
> +				gt->info.id, hwe->class, hwe->instance,
> +				e->guc->id, err);
>  			goto put_nop_e;
> +		}
>  
>  		xe_map_memcpy_from(xe, default_lrc,
>  				   &e->lrc[0].bo->vmap,
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
