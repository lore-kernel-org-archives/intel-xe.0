Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9A3C77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 15:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7766110E08B;
	Thu,  1 Jun 2023 15:10:40 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8764610E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685632237; x=1717168237;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YzRNRmvU6YBluolMxn3p3JK9mwp5YayIso1irb7NJE4=;
 b=MfDaj9x6ua9ch5jWGzhNpfl9GSMrwuB87ZoNkNm4wuZHzNwtI84CJp0U
 swoGcWTQTfOvtLp0LAj34Ob0VuxFcmVGesWdNJ+6XO9W/zX38uy5i6W/S
 4r+Z+OVs0BUJo2k4qgn0D7z/T9ZVi65XGPo24zc3uvgctkIoUxFfdWaAl
 FIUS7YN1qyI/iI7LzgiFQwbZCJdLZ/gHgETDJTuXNE0ep4UZwBtmiXdB6
 Rng8zY7c0kFs7PWf1nnDozH9Pb2l2Hvw4GuTC2dUBGW7uUmblylcmcC3P
 pPN/qLBbqUWMC6sK5sojuwHvlZs6rFl/AtD/zILbZNFvDnWQtG84JN8QZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354439047"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="354439047"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772462491"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="772462491"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 01 Jun 2023 08:08:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:08:11 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:08:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 08:08:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 08:08:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdGl6NRrLApCBPv+K0n28lYnaiZXNQVZjB8zmxnFzgTLZzy6NY++bH7a4+zl7/H/xxoGg839JH6GMqDv2niIMMH7EbTkaTc45jBQPt9Fg9n/XtJwbNNxjIqCM5R9QRY7k/0kHCALAno1KpQokP9s1ZcfY7zx+qggWbxfkS1jYhRygyvuW6X74rWk3ZZ6qwNxstfwi1UQOE9MDITQHZzRvBT/Ks/NzxvHvFcn3L6H7SQegL4GOdjrJjJSI71wC7r/ccHtGCL2kIAriCjzJnSTSG0dcxaf1JVrfsaTtqyZxkZRmaDrmQg4YjJ8uLNFnX1YwxqR6b6uXqcyN+b5C1KabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rz9+KvZ9CdElCKSKjhqW7uvMCZ7PzitntF7GIJ+XXHo=;
 b=huL5Lx/qWvJdg+DSlbPEW3+T+KsvZd0LtwY+YV2SLRKjxH2Vk+8T6V6B8xF4t8DwC0voHbNCKBhRsmzHskR7DTM+kiMUG43VLXvIj8jaLeXUVfxfgLlf6fCmYDOxRD5cbo1WwFdIwh3Ov5ERr1Z6MDK5HBJas2oatE7h/L+BeloZjJMMSBELW2xaRAul+GSr2uLzyeUtsqacucocV1Mw2curEeCgobnJyaLy48sldwkpYADEzMG74UYp+IdoL2DcQDNyPPhUTBHYGZh+BTFXYS4OK1E7LIuOd2ZNtzb3KxYAAdoBR2B6GAyUIJMT6+9WY+N7JnSGZPXyI/9NdZ9JCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4781.namprd11.prod.outlook.com (2603:10b6:a03:2d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 15:08:08 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 15:08:08 +0000
Date: Thu, 1 Jun 2023 08:08:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20230601150805.GF6953@mdroper-desk1.amr.corp.intel.com>
References: <20230529195607.74755-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230529195607.74755-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4781:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c916643-9a6a-4acf-61b8-08db62b201f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7SkENRurAFgku6p4qJC22oRB1NqsR5g+Mg56aWV2OXx4dBw8L5bVgxZo7dk0ivSJBMvE8p8yLixZbyFnH9UMKZyyLG5odIqH3ZrED064orm8K6gfekPVd8vGKRbvsFh8WaQP7ZTUplClnJ9aOigA/bIoZxcle+NWQOVap9VuKne4AKTypF2fViEAt5m2PJ9tPcxOeyv49fhBY0ClkFR0YOxu5xemwG0vHNnMYXhlEXDY0lXG6J6BCjOQKF4iGxaPP+KeIRUMkGRau4gw5xFYii2hKV5XNlU4UkNKK3UOyVYVhBPb3rnpr7sYxzqM4D9cFaZvI5ha6kBGy2m9IuhiyT9MRwzspWLr1dj8mBGZopJ9yESpxNftz8ZvgEmDmfSImYQvXO+l9R3L4U/EE+YJKmJMK5YD5gz1d7rJsOmK3MkUXCOB595WghUy/8q9DbfVm07cpaRCYLF/MQxHjouQ6U7KhDCcGSUbQXJOJG3L65gJlvxabG2bd+LFsda8BlNeMaW34/MGXvh5eK1h8jqN9SamvwQwdhi3qWLHyQ4jLWhAIUK5BK9IpkgiTo0PxQ/v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199021)(316002)(83380400001)(2906002)(26005)(1076003)(6512007)(6506007)(6486002)(8676002)(6862004)(8936002)(38100700002)(41300700001)(6636002)(4326008)(66946007)(66556008)(82960400001)(5660300002)(66476007)(186003)(86362001)(33656002)(6666004)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uE8+X/68j4KD4PGblKUg+vcwNL+Y+8Dmg1akTReYqL2Dh5Xn18Rxx4Qoh0?=
 =?iso-8859-1?Q?jtYObq3v8N3ORlYiSniokpIbVHkx3HN+zcppe0Xfh3UWuy/i8hoL9hdHu3?=
 =?iso-8859-1?Q?ueLFNVNO6HE0G1LsJPUS5hoPyNrVcaCFDEYK8hyQrhJMVyXxUkI8Y1zjmD?=
 =?iso-8859-1?Q?KeQoE+dlP9OpNrfidBOlG1WIRv2vX524rm8o9iENAFRMhEJJ7d4rvsD//o?=
 =?iso-8859-1?Q?LD6s7HvqEB99WUoZ9AFy4ovxsbsv3kl0AM8jnhqJTq/jh6DNwXKXZSOtnY?=
 =?iso-8859-1?Q?/sD/1Y/olrEdwUHBXWli7lVYzKQ3wr6ixQg2ig8KPMRHa5IW4mlPPbLOPf?=
 =?iso-8859-1?Q?qp0jNeX+AT9TyCQOnntSfAg3J7l13+tmIfpMrTK+KJMv/22g5IdH1reSFh?=
 =?iso-8859-1?Q?kw9O3OM8AxpTbvSFwEy+dqVMP+d5fAzr1iQunZlyxcPWfpGSl9YJ560DVi?=
 =?iso-8859-1?Q?ZD7XJkLVYllJmkO9z3jDpjUqLeh9Zjd/PrDnCnckXbr7d7jes7wL2Zgagk?=
 =?iso-8859-1?Q?A/P31O7d+I3xFRtxl64uBNOw9vNLHludrBEGyhRx5hf6Z0HaOv+J/fS5VT?=
 =?iso-8859-1?Q?J3X5zDgxm8Tes4Ot/kfAyfx0/JFLwJjrP2DRa+hVDG+iB/hudJztnRN3a8?=
 =?iso-8859-1?Q?vcCoLZ50GQUmOyNlO85YcL9m2/Mnpi5Z1s9A0j6l/32CXPliOF8A4dRcFG?=
 =?iso-8859-1?Q?l6009nqSic1woqIcwHY3nVG04LckNuS6Q5iAEyV+B0mNrriwA7ahfjyxbz?=
 =?iso-8859-1?Q?aO9AuqTGf10GvoVUYpRH9lfrD5NjpcANLPKzOKo3JzMrIBnqw7crIQSlVM?=
 =?iso-8859-1?Q?VlOnP7EFKNkO5mpmukGSgVjZ2WJibfPH/ErqQXfSM1yHJYiPBFCiszf8zQ?=
 =?iso-8859-1?Q?TSBrB1WxKgd2l6xvTjbI7fxMDvRIQMZvBbEv46EGlA4vegFIgW6oCogqJ3?=
 =?iso-8859-1?Q?7CCkP0O0Rj8Ug2AnOHIH67bx41tGQFk/iQQR5LErxUZwW4VTW/bE9PN/OE?=
 =?iso-8859-1?Q?NBn/VfwVMByYK97W8Fe4Nfn2zZlMjyUrzEJpB9ZFV19rpzv2i422OGs8I+?=
 =?iso-8859-1?Q?yu5kskZDacj0lKqk3L6UEfX64ii5I4xL5nhezTmI03Di5EyhyaCeaHzxfW?=
 =?iso-8859-1?Q?vDtb7kJOnrxI6YwRoesfS4hiBPNI7WzTFeMRXKPd/+5GJnas+roLV9vEXW?=
 =?iso-8859-1?Q?ONTG/r2hEr9Oi53X0I9q+FHhnON4OkSMxTjPRjnkdQymRgAGMMy4m1FAQh?=
 =?iso-8859-1?Q?h9hOZXzFdIfSohTfv8LLReyDWJQ6LrCd7EldZcQk8dLhqx/FWR9ABAuyAD?=
 =?iso-8859-1?Q?tfL93OarSkIynTYhEIC/jZJ4I/hih3+1uazl9AoFg37uJP3eZoRHEnhDzT?=
 =?iso-8859-1?Q?aMbN1nn+pA1J9DRdQ5YF7onzHBXtx7oEslvT2NUGfKkrcXDfSghwZTRti2?=
 =?iso-8859-1?Q?cjgwdTo96KntTNh0xcHHfJA+CSqhFhk5NBHl5iup23vmMcKfVeYcfleXSW?=
 =?iso-8859-1?Q?YMsfjiatymJVpuzul85ZU+l6V4rgcij8ITA3z+hJUuaWdmKwCq24b872P1?=
 =?iso-8859-1?Q?ot9PasnoEMMy+0vt7Cl9v0jBF5iyKwSecyyF3zQOAGJGejnjJKTlrpVDW/?=
 =?iso-8859-1?Q?tk71LSPWUXTSKMDl7MhVSiNu+YN2rJZf4bbsl/zsfCAUM0oO5LKQ1OpQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c916643-9a6a-4acf-61b8-08db62b201f0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:08:08.1675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoSCUGomqsh7RWR4uOVx7vqkNhXC4lzLfaCeFRuEJzbcBsWZhPMzE0acjUyz+BjFWvx6dID522h7j0eBBPb3eSqu3AIT8p/O6y151rmLO2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4781
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Replace PVC check by engine type
 check
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

On Mon, May 29, 2023 at 12:56:07PM -0700, José Roberto de Souza wrote:
> __emit_job_gen12_render_compute() masks some PIPE_CONTROL bits that
> do not exist in platforms without render engine.
> So here replacing the PVC check by something more generic that will
> support any future platforms without render engine.
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index d2fa0b4c8bcc0..b79dafbe7c4f8 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -249,11 +249,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	u32 ppgtt_flag = get_ppgtt_flag(job);
>  	struct xe_gt *gt = job->engine->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> -	bool pvc = xe->info.platform == XE_PVC;
> +	bool lacks_render = !(xe->gt[0].info.engine_mask & XE_HW_ENGINE_RCS_MASK);

Is there a specific need to check xe->gt[0] rather than the gt pointer
we already have?  This function will only get called on a primary GT
(since media GTs don't have render/compute engines), so it seems like
checking the current tile's primary would have been fine?


Matt

>  	u32 mask_flags = 0;
>  
>  	dw[i++] = preparser_disable(true);
> -	if (pvc)
> +	if (lacks_render)
>  		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
>  	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
>  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
> @@ -275,7 +275,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  						job->user_fence.value,
>  						dw, i);
>  
> -	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, pvc, dw, i);
> +	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
>  
>  	i = emit_user_interrupt(dw, i);
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
