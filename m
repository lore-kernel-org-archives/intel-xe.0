Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A3EC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5857B10EA35;
	Fri, 15 Dec 2023 16:43:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E375910EA35
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702658594; x=1734194594;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+pEdrdo5mqyPEezkZpayVl9sRGDCrOgZvMkg5F7BnGc=;
 b=ROW2Ane0bWmoYJ7A62TSV0lqkEbv93AgMvDoqxFN2KlUjBkHrqaY3sak
 xi0zjZlxK56CyY1ivW42A2o+hG+PEOUeLKTgafLzrsAZEn32/8qCGTqBh
 VOkMN5Gbre7Aa0cOLpPC5tYqTFBnVOBRqgWsvIkJcQT3Sbb1z4AVV5mTj
 dOcl9Kl+FcsU3iNuAo6Mz3M3Nxru5PpzYciOEAJYYrZe+kQwqHitix38f
 SL13Xi6z0AxcV/sGGBajTcBDSOAhR8ryWgvoZ2Z0Mcdp9wMMwC94CfX7Q
 HIB7lfLE1SX+u3zbfnJwXWgOOMrs8YzqV9ZPzeNmemjqEpJkk2cC9xDLq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8656293"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="8656293"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:43:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="768037751"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="768037751"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 08:43:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 08:43:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 08:43:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 08:43:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBvj7bFANBISg+Q+3OBkQRjwwhzSW0VkP5vSVUGbmM6NSBDe5wbhXf6GOQyzvy3H+zkrlWnzHLDAYGw73LeA2wPS0VCmkisATHaUdjfPm03AQG6KDt8hVKsEWsrdzZbDNz22JE7vQPD+7Ak4uy1Gc28GgE5SSpdzFrDLJrAjYodTKspDAbk8OjSlqqTFvaKtboSUc1JxsHAXdbosS+214HtpHLqdfdq5u03hkgnwzujFKdYN8xod+uTKWYxMV+7Q9lM+rvLbpX+I1F7BUg1RGaphKqtzTptS00c+x/YssYl+SAXRiH0PFWvmk1vzH3OBt8Eg+fy2w9L2KPABbEcvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRNjZmFLKNvr8Zp28kMgukzvQdmV8bhJ7ozrz9TDenk=;
 b=QQJ312UaIYsWJeABa2Jw8f45Du9E7gJgm0Yt1KYAIZl14LFfUNgKT68OCaulps+L8wahmgLbcgDvgWZF9Axyk8WNs9dFYzwEE0zAhkeDxCo1O4ArthWWa2N8nuMnmlnBbuCxo+mO8NBWfZyDaLh07hBa3pLLx2vil7C2+klHWALBQbKSsBKghiKHqPA2gnPRazgigntm7UajU+0xVeNhylXHzLApFm0cdEQyF6ZolONmdn0FqGIh6YIlT3wyQVmfUteZoYTGrxpWqJllJ6DgMcDS4meR3urrHosZVQs0z5okeYiw1/Qovqalh2mehUz9HT+xBqn9zNY91U4yXkqNQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6428.namprd11.prod.outlook.com (2603:10b6:510:1f4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.32; Fri, 15 Dec
 2023 16:43:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 16:43:08 +0000
Date: Fri, 15 Dec 2023 11:43:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH] drm/xe: Add wait for completion after gt force reset
Message-ID: <ZXyCGMbgOXZBnYYa@intel.com>
References: <20231215051541.2536859-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231215051541.2536859-1-karthik.poosa@intel.com>
X-ClientProxiedBy: BYAPR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 688922b5-b855-4b99-1540-08dbfd8ceac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ng55pqExaMY1intNTNXu9IaS/FjbbS3CJW0Xh2aqfd37rBFM1XLrOKSDQ+5PDzOYlRfXfxJ59Wy612Iy3JQPZtV1gFTl0ysFqz2E/PeTcRkgRLp0XHr1UO2c/1rj1LYCpY5BbLNTYPfsFGHFtcOqfxNJR+M8U2SMZzDL5KXqbrcYOdKyVaUa+cEggtRlAzaQ9gEftYxuUVraAOYyp24i9+Y+CFHfw8zBeUGYZxdx6AGsbuqpMaxCmTAijf6lvDNrAhJKR+s5sAb6JYbeI3tq7Nf1C3HJAJF0Rw/mB1ihNDwi4/aLGMomhrEFoTW6eopt41Pd0SlS8E55/9GNLfvHzG9C40I+MvFLvwoqf0xpjKK9a0WLClHgapOZPE7zZwINR3YwSVJbo9zTPkt6Nzs03uED5H7f/XTQMJD69o8uuBtxpXk36S/iPWDmxQPeiD2VogIldb/jBJXEX251dqMj78uWygt/fQX4mgY1he+51H1qJxTingvs8TnQJeARH9rdnGpjr55JibtrNb+mKn4SSNrumPvgB9vvBw2kagzpbjMn/vtc+s/FkCw77yXEDHyQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(316002)(26005)(66946007)(4326008)(6862004)(6636002)(8676002)(8936002)(37006003)(6666004)(5660300002)(6506007)(6512007)(82960400001)(6486002)(83380400001)(2616005)(66476007)(41300700001)(38100700002)(66556008)(44832011)(478600001)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mGKsdJ15GiKR606rZSQjMVaRXttgvU/UqvsVl452rMtXTY4dEZdNmxahTyC2?=
 =?us-ascii?Q?Vy8xNIJXin/6vxm1VT5Gf8wHXUqqC10OUKsF2CMz9s96eK+mjU4fThto6QiU?=
 =?us-ascii?Q?+N/Z3dqFUEJEm0QXpLIx+zOwWFN2a+GY9mXk1iWTSezacztcate5ilf+j0Z4?=
 =?us-ascii?Q?GeXVxLuVAoo2iJJQA8LvOdfNA7zuU47QZHvVfb3Utbi07tJRcKoZYJyzqW/7?=
 =?us-ascii?Q?owGb+W8AljVEh06EjnupoCzsgHxo615QUfnOXW9gF+ZrKv2TKZBRuMkuV69I?=
 =?us-ascii?Q?eyxLJ0wnrs8l4TL6InAeY/F8sgOwHwW6p5SimffjsdTmyDJUQG1xcHlrH5TF?=
 =?us-ascii?Q?/HqQiFWN7faikq6/JlaZCiV0xeBKsp+U9nad4GDsgO5U0ZFeLl4ekwLQpRAZ?=
 =?us-ascii?Q?LPjTEYCHhY8Bzk1bahkfOsJ/bOFVcZMm8gaqfzfLHIruHIA7FX/w+MKtnHZ0?=
 =?us-ascii?Q?4ArYNerZftoeMAJS3pKtisuJEp6gyPqh5vvzW7JqtBfjbBCA33eWvLHbTD2O?=
 =?us-ascii?Q?kj0hO8PTQxHr8Ez9zqcpy/6mTOntvxWRtk/SwD7DDV0TuCaS9K4fVX8Rf5Tt?=
 =?us-ascii?Q?scSZai1Qg4ZVQeaGD3FTCpqwgO5I+zxP2bTutAM/pgEUVpbRGnQTP6Jd2Qu8?=
 =?us-ascii?Q?lF8ZvYERCf4Gjyrsdb7aESNuv0diXasTI1+w3OGf7RddPdSsMBAKzYdk3Alw?=
 =?us-ascii?Q?j857LwmXSI3gouoijScRR9dcLfyAOQss3uzSFwFRDIBElhEmK0FUtPxFhWBm?=
 =?us-ascii?Q?ePitOgvfhFq6GTqTSFXN50eSaMvAXWpemqbzctP0AAaU2rMd9nq4vEybKl6f?=
 =?us-ascii?Q?EfXSaOAU6TnJIck470ZPoeEVKsqOfA6xcdwHUmj9E1A1xOAK4HWcc1DFXo6g?=
 =?us-ascii?Q?Yeekzqpst/RYLlr8YqwQhkOThM8H+I7Orck5KZ1W0R4pzUWwbd+2Lsp2TEdi?=
 =?us-ascii?Q?EFvSGWhr3cY3A+x0EjjKLZBXQCPbyDaLEB01U+doatDhflSpfdnN8daVj1fx?=
 =?us-ascii?Q?zztsYsLnioTf5B3zqIZzX4Z0+mPl6usT4XJJ1uUWoMZRR2LM5N/119fcezAp?=
 =?us-ascii?Q?W60B+tddWDOBUMk7Q1yV7NfRB2DwsTf7WzChD0BQ0wWy4BuRt4CtW9e64yti?=
 =?us-ascii?Q?UL7k8Zva/VaveYoCxjR5ol49Yw8sv9fIppyPWir3Ov93nOwMYGeF0IOEIPpS?=
 =?us-ascii?Q?je5yYkqLxSFf2yy7MUqW+P7Ik0sNtXZDSF29vcGznzMfqxp32IvxmKOBIpIy?=
 =?us-ascii?Q?UIgz2urrNQ1+v+SbmTmUcOakJnKTShaaLH4waZcIR3quOrZAhU4STEuYA5YG?=
 =?us-ascii?Q?HyCKGTdEavLSgyTE8n7XJ1dH41lyfXL6G5aCbzy5brzmqEQ4s05hNjFOkAVc?=
 =?us-ascii?Q?O6vPkf3uH8g2mUbfhcCSvnjZnF3EVQAwWXqNXdMIPjZGtGY9SPuRVXVNx5+I?=
 =?us-ascii?Q?xWG4hVxx/6YtEYI1799eCKe7enmQ7E546npkma9XwcHHUUL2kQpEWii3wkoX?=
 =?us-ascii?Q?Wo852VvNSQAS6VTRBZiiA1mGurmyb+09RLBbB2HFLXIY6eI70a7fvg7Z4q8O?=
 =?us-ascii?Q?ecissr+NLhBPwIPEJmAfTGMMbr/4y5FucZw/L5jT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 688922b5-b855-4b99-1540-08dbfd8ceac1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 16:43:08.2437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Va94MIwLOKUyqTKFEpdmv7GXVAsr104QR20E5y2+UGVmh/8KMuhXb0BdqATa/U64E2Osqk4Jn0bu+qiok7RiFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6428
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 10:45:41AM +0530, Karthik Poosa wrote:
> Wait for gt reset to complete before returning from force_reset
> sysfs call. Without this igt test freq_reset_multiple fails
> sporadically in case xe_guc_pc is not started.

\o/ I knew I was missing something there. Thanks for finding that out.

> 
> Testcase: igt@xe_guc_pc@freq_reset_multiple
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         |  3 +++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h   |  3 +++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index dfd9cf01a5d5..eb7552b6dfa5 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>  
>  	gt->tile = tile;
>  	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
> +	init_completion(&gt->reset_done);
>  
>  	return gt;
>  }
> @@ -647,6 +648,8 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(err);
>  
> +	complete(&gt->reset_done);
> +
>  	xe_gt_info(gt, "reset done\n");
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c4b67cf09f8f..49b30937a28b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -23,6 +23,8 @@
>  #include "xe_uc_debugfs.h"
>  #include "xe_wa.h"
>  
> +#define XE_GT_RESET_TIMEOUT_MS	(msecs_to_jiffies(5*1000))

5s seems to much, but anyway, this is a debugfs function, so, no
if 5s fail, then we do have bigger problems.

perhaps we could get the timeout as input?

anyway, it is better to have protected like this than the current
racy one that we have.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +
>  static struct xe_gt *node_to_gt(struct drm_info_node *node)
>  {
>  	return node->info_ent->data;
> @@ -58,9 +60,17 @@ static int hw_engines(struct seq_file *m, void *data)
>  static int force_reset(struct seq_file *m, void *data)
>  {
>  	struct xe_gt *gt = node_to_gt(m->private);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned long timeout;
>  
>  	xe_gt_reset_async(gt);
>  
> +	timeout = wait_for_completion_timeout(&gt->reset_done, XE_GT_RESET_TIMEOUT_MS);
> +	if (timeout == 0) {
> +		drm_err(&xe->drm, "gt reset timed out");
> +		return -ETIMEDOUT;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index f74684660475..6f2fb9e3cfea 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -358,6 +358,9 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @reset_done : Completion of GT reset */
> +	struct completion reset_done;
>  };
>  
>  #endif
> -- 
> 2.25.1
> 
