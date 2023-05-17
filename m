Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ED1C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 23:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1392210E4BB;
	Wed, 17 May 2023 23:09:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C6910E2E7
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 23:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684364968; x=1715900968;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oXJ/ocvi895Tept/ZxC04wEPglD/ZErxh7CDpmzxbyA=;
 b=QS5OSA51jRBs7wEcqpEv7Vu79O+MijY2d63pjykGSCTZFZa3/1ObFf8D
 YS2ckWqEOgZ1mFwxv839FOIkbDR20FfL69d2XzJj5Dc3gB3m2HSbtCBOF
 7lgxJtna6S3s6b84vEZHR3sHqAgSgWNNaKHuaA0AN3RYva4uo8sW4tzxv
 wcOxD3wN+i1hguTgzKHKe3uyt7p6wdz89X0ITZPJ2Unogix0GPP54SdEE
 PPKoIEe5eiu1fX5zqk5acD3m5l5ayp4M4J1MeDDBsrOguFH5YejIsyW4M
 UW3jrCrGCB6OyYS1gsWmIC397Zebuoxx+Xw8HiPlaaIRZBOmgJVAR/i0q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="380102702"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="380102702"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 16:09:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="652396363"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="652396363"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 17 May 2023 16:09:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 16:09:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 16:09:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 16:09:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oghZujm+UOoA6tUsrTCDKDURJGvirFJtoE2w3NewnS3iTdhQYZVGF6K7IgOeqBUv+YsGA8SE+rIpTdEIRT0JUq9yzPjlFg3zew9ODp5PKh5tps8EIQxTbEqT0vpTgkYGXgP2qLhOzCCF1z+ocaJbFpVbsUVzPPx0AiQtDhKgTjAWp2DPvPPehIsX08lvCR9TRUYKxteEiKAYfZFaLocd/S6QtQcqahUKxi1nuTGAKbfMWDcZSUTiWR3+EkdVE3mTa7JpfQa9PwFfNrV2m2mvm90esLPk8lRgJ/wpRK/EVcpS0yQBrUprZpn02NC1okV2pYXb2owu1QAG/dZHcaOYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0csPKsnqGnc0ilZA9eNlcida/j2hCdIvO1/SAh46/e0=;
 b=HJkpbUqoej1hP0kMaYzIEB+pWCevT6hCLTsPDfcmfWNK3l1n4vHvsxlw+VOvsfqfJ1G95oKimM+4xl4fGS9rZvPylyT2neLeTsHkhJdNS3Hgs9xjH2BUXGJuvWHQxX+iMycZ70VbtYHXN1ikdoZrsy2ejkG2SnHHgarpEW1PfolIb3ln1NATcMCa7o/Cu2YXn6KWmOVt18Ift5bvJX8XaAzNhsy9QxC4lBus73nrhC2ttntaA8vZ+WzVQ+kqyPlnSASwiqiQWnWc7+tXAUTktqmts0djL6k3ycXl9WNRi32lMGtohkK7t1vJDYyter6rYmR/27LCRghMwc+tTy+Hsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5360.namprd11.prod.outlook.com (2603:10b6:5:397::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17; Wed, 17 May 2023 23:09:23 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 23:09:23 +0000
Date: Wed, 17 May 2023 16:09:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230517230919.GZ10045@mdroper-desk1.amr.corp.intel.com>
References: <20230511165636.1772-1-michal.wajdeczko@intel.com>
 <20230511165636.1772-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230511165636.1772-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5360:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b37a6c-489d-4490-ea87-08db572bc05c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GbfC8hm9tpCrX/CoE9QOm4uFV3Y2WFwyHDQ0nDLNzrDtuSlrkvtJ2hfH9QZ5Ob5f1eGnVislfoWT2uRrAMNlu4IfbMrhrNjlrde+cyln1aIzhn4ZpgNBw21Aua5jHQpr1ebfzTxvvELViHBOIBO1VUBACQt58uHV0fMlwGQ9Q6P3CMyef9t6N0vRCYw7sZPFVPKcj9UG3YvsnC5MiuW/CNmPU2o6dV0qhWIQM4hSnojBcqVK39vpi/NsW2tUAvGcC0IqU+aXGLUAVJih8TpKdp8BgsFxR9jTauttXrBUjo+0vl3yGQqBU0Kgwad/odC0Di5drsHUP0GxPxHAtapn94SKYB0j310nQMUnRQZ1qc/O5yA8yBnofBGNG5hgq3HHXIyvXbZgVNzLcrkDadA/P8RNzPKRfsNe0yc+W5iXvdFlp2xBswORxqQMEV38UGOk5iCKY/HprZQ+isX24kVCNsNiBCYauUDivUHU78lL3TfRQ6sSt983+RxI3/Ca3BEc/tJrIA2mCoTauUUOnGd8jb4Rfw57DvZo9QMNyOEIiLrNmXp1BmG4rAfWpBh/cILa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(8936002)(6862004)(8676002)(26005)(6512007)(6506007)(1076003)(186003)(86362001)(107886003)(82960400001)(38100700002)(66946007)(5660300002)(66556008)(6666004)(41300700001)(478600001)(4326008)(33656002)(6486002)(316002)(83380400001)(6636002)(66476007)(2906002)(15650500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hls1EFIRMg2hf7H7pnZEsrHkBFkKg139xOPPgyvKlo5WhmO9gKufOPN7V93B?=
 =?us-ascii?Q?ZDey/8bpr6TYD6xsBMx8VHzai5qi5dyapOvdc/pOx4o8enSrMLMAXXpMJKNK?=
 =?us-ascii?Q?qTSo8sm1QEiL1mqvpJ1oa/d/guq/i/EMLnpuduSlw02c5u0+OvdQGIlZ2M9e?=
 =?us-ascii?Q?LDtjSC9BK2wqcJV0+gFfiwjHoCmBiHs/a8hCTkjF0Rux/Nzmm6ItEplrqbzY?=
 =?us-ascii?Q?ERZfmYiAGtPZllP65dN5FwSu4Gan9h8JVvpYPaI0+e3ELgicuwNJn+z635cS?=
 =?us-ascii?Q?EdtNslx28/i3VjXMOL69g56t/hCdsEf79oJm60oEvYrZk9RHcH7fkumObrR3?=
 =?us-ascii?Q?KJTp4G23mrux8dr9V8fMZFXLzSTBRX/QZYGMAqL+ACJIf0y7e8UdyD+USVie?=
 =?us-ascii?Q?9VziQkh7u4wxaXglou/m3vgy4oUGj9O8KYg4jPROwmY80HYuQ0PXw2Awk097?=
 =?us-ascii?Q?XkuPgo2dY8Nor1nAY4GRdbdfmCljCpFf2la6NKMzsDSxuQjWEfUGYHiT0ygq?=
 =?us-ascii?Q?KsOIEpc/X4QykltZTc6TNOLdomYd1XC/bcenWk40fz4kNEG0JcQUL7TVJ53n?=
 =?us-ascii?Q?ksU2zkIoY48gp4yL39x2lOsocEGI9xAu4Rc6oopW+fi8WCMq9QP8cwnVWJip?=
 =?us-ascii?Q?Xg8cn1RqjA21j/vMyWcxxuIghX4KiWNH8kp3nGC3xStUKUVslWkx37D7QIKS?=
 =?us-ascii?Q?S4hRNrO4qWpfnC21nY2n2lZuCGZZn0faPCtT9KOp4UoGZhKLp46OMCN6KXB6?=
 =?us-ascii?Q?QfL5IqdosMnEW/nKEnOOGGjqZrOu9kcbww0AxcDYwdqVhNIpSz9GE4aWdLS9?=
 =?us-ascii?Q?XAJ+bNHzQPRupdIzhTWZdPgqv/nu6ftz/Misfby6Dwt3sUEvO2slGmRHNHt3?=
 =?us-ascii?Q?4lhlbiWCNAoViDHIKFLW3cqgZg/4EEZ0ZmJXZux9UxYb7ISN1hlf45JsduCq?=
 =?us-ascii?Q?dIUYWTr1U33/DMdtv98cnmqpuBOB98aIakPiKCz9Is51rJgSt7rwY0AeGgAW?=
 =?us-ascii?Q?rwofJSLrSDG+H7CBEOWTnT7J0UqyVrRsKwMFTua83cNSv4yHXhHbzOrcZWDU?=
 =?us-ascii?Q?pvNBwnZEQyROYfhLBv11CJsS1qKq+ofpY5ja0z5KeorZc4VXribIeBmjqSHJ?=
 =?us-ascii?Q?vKTzj5It/+gaPKp4JOBOLfl8Meq3VyOQl8+gH4qR5MCwIGTYSP5KgR4Z8OMC?=
 =?us-ascii?Q?YZF5SO5lEm4q8r82q17L3JMIXpf9LRaGVwA3SRitNwnQBqvYHP0lTzG0YLiJ?=
 =?us-ascii?Q?YaMy2mdVuw2KsjLu512VeP03Af9WISgLN8V4lxb27S28b4Xo3fwxTf4rNFDO?=
 =?us-ascii?Q?eo38YIhamvZCEUini0CZoT3JFnQv2sURaYWzEpqXVdfyqxWobJ3Dw+tGHKG2?=
 =?us-ascii?Q?YvtSZqJOMX2Z5KI6idwwNvg500huAVOYToP/hIiYT/8jmFAfxe/xZPOxnEhh?=
 =?us-ascii?Q?eq/AeVoV6Evs0ShgKDziaPeBIjkw2ZCDUJCtvAxU/SjKZDpOxrX56yw7+jvg?=
 =?us-ascii?Q?TSvmU4tAX6hV9R5ZxdZlfCPbWUfupO2Rhkrtvoq4+9wiFey/+pSFHpoAvU6x?=
 =?us-ascii?Q?RhE5HIGn8NP2FnyF4C1Z3RdC6vfle12okHhQFj4olnem6qY+B6G5Qe2ve8kb?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b37a6c-489d-4490-ea87-08db572bc05c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 23:09:23.0030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5+GlZmIvFyGlLCw/SgBDx9mmTQeO2ENhsrgVOpHGdH6TqlikPg+j8Rv25qJEvsw8IeO2ur1RDTxssswRedGpFXkM/poM99tPiaLqFTbXnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5360
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe: Use GT oriented log messages
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

On Thu, May 11, 2023 at 06:56:36PM +0200, Michal Wajdeczko wrote:
> Replace generic log messages with ones dedicated for the GT.

It looks like you also changed a few %d error codes to
%pe symbolic error names as part of this patch, although you didn't do
so in all of the places you could have.  So if that was intentional, it
might be worth including one extra sentence here noting it (and maybe
convert the other places too for consistency?).


Matt

> 
> v2: rebased
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 49 +++++++++++++++++---------------------
>  1 file changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index cbe063a40aca..cb06c4a43d02 100644
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
> +			xe_gt_err(gt, "hwe %s, xe_engine_create,e failed=%d",
> +				  hwe->name, err);
>  			goto put_vm;
>  		}
>  
>  		/* Prime golden LRC with known good state */
>  		err = emit_wa_job(gt, e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_wa_job,e failed=%d",
> -				gt->info.id, hwe->name, e->guc->id, err);
> +			xe_gt_err(gt, "hwe %s, guc_id=%d, emit_wa_job,e failed=%d",
> +				  hwe->name, e->guc->id, err);
>  			goto put_engine;
>  		}
>  
> @@ -256,24 +257,24 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  					 1, hwe, ENGINE_FLAG_WA);
>  		if (IS_ERR(nop_e)) {
>  			err = PTR_ERR(nop_e);
> -			drm_err(&xe->drm, "gt%d, hwe %s, xe_engine_create,nop_e failed=%d",
> -				gt->info.id, hwe->name, err);
> +			xe_gt_err(gt, "hwe %s, xe_engine_create,nop_e failed=%d",
> +				  hwe->name, err);
>  			goto put_engine;
>  		}
>  
>  		/* Switch to different LRC */
>  		err = emit_nop_job(gt, nop_e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,nop_e failed=%d",
> -				gt->info.id, hwe->name, nop_e->guc->id, err);
> +			xe_gt_err(gt, "hwe %s, guc_id=%d, emit_nop_job,nop_e failed=%d",
> +				  hwe->name, nop_e->guc->id, err);
>  			goto put_nop_e;
>  		}
>  
>  		/* Reload golden LRC to record the effect of any indirect W/A */
>  		err = emit_nop_job(gt, e);
>  		if (err) {
> -			drm_err(&xe->drm, "gt%d, hwe %s, guc_id=%d, emit_nop_job,e failed=%d",
> -				gt->info.id, hwe->name, e->guc->id, err);
> +			xe_gt_err(gt, "hwe %s, guc_id=%d, emit_nop_job,e failed=%d",
> +				  hwe->name, e->guc->id, err);
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
