Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84963C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 20:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3557D10E080;
	Thu, 13 Jul 2023 20:31:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8944B10E080
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 20:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689280273; x=1720816273;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0JRW7NrmtgNedvIqwbiLllvjJP2sqlpyNGfizYpK264=;
 b=XtvqcWoj7LiyABy3x1SoXJTUie5LsYVga1pJQd/NPDn/u1ix1GNOpQYy
 qUlcErF91ixkCmS0Dp4ePLMkN2jAjLvVxXfFJyWbbrp8mhtBIq+gVMwMx
 qU5cCL6qf+YYUotWyMSewbEJzRmyVeltzfAnNXEiMaLCudzi8j5R8QpKW
 Xb2Xj2yKfpU0Cr6SgGh3D0mG0h6YbXnb2rYKmI8z63kSPAJO5lRzrs/EE
 m6PaiNL08zOukW6YMgVAqv1mUm6mXC7/7fNyaXCFp1RH0EV2zZqr7VrhZ
 7MPxeIigs+7KYimSN9uAwbxsHiLEhqjs4HO+buK3DPoK0GeGR5Z+0XxRf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="365345430"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="365345430"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 13:31:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792189476"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="792189476"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 13:31:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:31:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 13:31:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 13:31:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT3FU9MyI4+49sySipV3Y4bLI+9VDlApXUVZGuV75uLblPfTCrG+YeBi9cVkGrl+cbaLUIkrknBupu4K4rP/kbr/ru0qNaiNSq4jbw/zxdahEtxOKpl+QrOAcqSr5xXivN3y9D2F13wa1ovPiqJGOlPi2snOFbrP951QRQAJNe8Z6bZ5SZaT7jWM2U6HhyB3BsMHDIrhcnh2YnvFzyMn4au2pCx0kXBxTiyuarTHPWzgNFKOFR9v7RTSSiUdEEsxqSwehS/S9Gci4GA8BObwioNvZkA2WfM6MwqNSvNTXHwLC9j7T19qqEr+lJxAYikYiUF6S54vxfp50NDIRQgC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UH+82T97pIU24TLtA/xLfh2lqr8UDhBeYkLTPKnozU=;
 b=EdtRcospWULbKdhMz6BeWom07ySqFQgUQhq9QF4bDUBgyDwuRqRVqfctgwD1RvyRGr05v6/JKrXrEsBMIMMe6htQHQi5bHRw2bN4WtL16C/0znS5KqxQtlnXLY3SK+5OJiaqdJlePqLG2Ud0x/eWcxDJxvpOZnBLNbm2zAlD1GHKCINoBZyaK6c8R9m00ZHjw6UlKnbh+S+Y3oW5cJOEHQV0j6pd2f8us7tmJbapd2CJo1N2sLS2HDTcLiXnVAqD+05C7XOVX60ifzsPeFycU84Yjp5b8rwSw2HynUCMeverWu2bJeC9WljEk3Qr7CRXu9wvQoMR+a1e6KZ2WCoumQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Thu, 13 Jul
 2023 20:31:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Thu, 13 Jul 2023
 20:31:02 +0000
Date: Thu, 13 Jul 2023 16:30:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZLBfAjQ2dqm4fg9o@intel.com>
References: <20230713053832.1386402-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713053832.1386402-1-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR07CA0103.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: f99db17f-7d4d-4398-5f30-08db83e0130d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYosa4sPefJbJ6GAsG38O973QQ+f3rj8RX927gS+yu+cgMg3ncoIXUlgNfCrNzqtxqKiaLKvtJSmFFrYRq7j5lmai1B9fjTn85Kv0fjLRwHt0E/Xb7Q/TjDGsADgkeKrGzOmg+3YeZ+csdlZXlChUeK35rJqDXQeO7w8IMSb0eKPgTGcWG1xeD/X8HyuXuoVf+6dQnXApckK4nCpbuamwL1D6FY6RM3WBeimjAYabaikq+zxa0sdKYXqXr5ZhoXuPayo4fQ7+1/2hnZmgHWv8ed8aaa8wMFluauT4PJ9tZnHWFXvpympUPOdtSs/e6j4qyaf0R7X5zLkhwDslkaI+5R4+iW6kH0/G5o78bNY0ywIB2uIsWQLiL//TjKDzUOx+KidiklyZVB5AP5HU8t8/OAVMfc8AwISIDGmNuaBSuLYdWZeTc0c0YutB0mYKW7z5QaT1zSN0BJob/QzAT21qktI4LP9V/cldH/ytK4kZTUjXSrN4uOuhMQPFcWIryUr7oZvaZXsbBYWAMHK7sM4Qhy8Xj7OrRu7ppAQgYLphdOKrynX3n8YVkqBuREsq07K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199021)(36756003)(86362001)(38100700002)(82960400001)(478600001)(6666004)(41300700001)(37006003)(8676002)(6486002)(6862004)(6512007)(15650500001)(44832011)(5660300002)(2906002)(4326008)(316002)(6636002)(66946007)(66556008)(66476007)(8936002)(2616005)(26005)(186003)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nYr+J7p/lF/OrJeIWnu6q7s6gilBHAQGZ+YT5S9WwCyVlClGpIDN4za9x6vp?=
 =?us-ascii?Q?NSsDkoU9qgkJkWHewMn0y98z5DsPqHquELIRZBXMIjvMCrptEmKDmstcyrZe?=
 =?us-ascii?Q?8c4M40NtciBEyy3sWV/DWZ7UWcCxdSPeU/yOuk6ayiBmJkO7xeubu+0Y7Eex?=
 =?us-ascii?Q?UPOasuYv1fI6b1LhJKnDVOvR+1GKmaSRU45XyMqvgIjZkJMdY3WlvBDw5n0p?=
 =?us-ascii?Q?so6FnK+vyPzGvBZcPqHqEa5/uwLfQBmS4mdalHaehPodJjvfDgf7R7iKKjj1?=
 =?us-ascii?Q?pO2O7FdylyQNIOnY16v8RrHcDS/KzU0kYWaaKpOHuy77xGArq0Wl9pMyXXNp?=
 =?us-ascii?Q?rmY/vRZSXT8swmgCseiMw5DRbAtPJTYnhLPSz7VxKiLIApPxCS54F8Ka4yH4?=
 =?us-ascii?Q?W1LHHmj16inw7TFtGJiSutInLC/R9mqbUO0f50U1AnuPNk+Ktg8UOkkbG2tL?=
 =?us-ascii?Q?ooFG0k5L/hzmUB+abNeUn1+padyVsbdcCYY49HnsqiZ7qGl7MrZVA+AW5G/w?=
 =?us-ascii?Q?HJpBDREmj4o94W58PF1PJHzEeI4l3AEiiAPR0HWyzKjlXNqZHynxUybbfcUi?=
 =?us-ascii?Q?tt6XNKeNS1r+pJ+nQP6gDd7eL1pEL5T8h/S0/ZdEPkqG3FJTHk3NP7QH88d7?=
 =?us-ascii?Q?Jazw8W29oNsHpteAriU9JRFOTjaof9OA4pGuzzN5N3enzFoMlqQ2fDnCCK2B?=
 =?us-ascii?Q?TCKGyQ+sckOkwsdvi8/SqZw4PlUpRWeO55qi6MO6AtUAuhGqt5a5iQYx2cXU?=
 =?us-ascii?Q?i/Iyincto2I7PsysgPcUdS+hN37iAuz58WtvPl9HjJOWSwQ0xh0NEBpDyepY?=
 =?us-ascii?Q?mmiqZPunNzkMMeFZv0SwKcxzRdnSLgvi0SgrPh7v/K82Px6Vm9s0A+2KSM/D?=
 =?us-ascii?Q?XIfgPkXJzZZGkZN8rt16IRrDYDWSXDdHQlEcgqsr4/tAcizUjV8NAZC6EGt3?=
 =?us-ascii?Q?qIAZa5EkWygOVI0iITRX0LzNOx8fyI9UwpL5PGkHf4rUNx5awp1U34XWiR1t?=
 =?us-ascii?Q?S+bBMun5xGN8v7Dl1FhVIS3pQ4vYDzMdaPneyQVa2nfkM6+Q5HgqbofH6crw?=
 =?us-ascii?Q?x/mZwQNl97QlpstaCDGfTHOVQZ0BDEZRgL0v4FZga3ZZKqNTSpHu3ExL9VHL?=
 =?us-ascii?Q?/Uy5iRD7erXj87ELh8XGcL9Cj/n7ZXv5Rnho9p7jonBi2nO7av5twCTvWozL?=
 =?us-ascii?Q?mn5hhrKZNSjKgPtBXYi53/u6y2DdWV9cNQp8CkpggBe6oE0mCaASf60F7+Xk?=
 =?us-ascii?Q?l9zTeFRtECMunFoeu9Wt0XLLOOmEPV0LvUv3VJRV42FnN/+1WDqlAapBeZ+m?=
 =?us-ascii?Q?SDaiA9s3Rp1Jjtm9Av54p7QYa0FFaNm0ruLb5PgCbRE1OCUjSen9wbWT20Kl?=
 =?us-ascii?Q?qdxRcg5Bh7qlYOkOX51vbSxsNU9JvVCyP7+IgRiUyzLhorv4DUi12zYDexMr?=
 =?us-ascii?Q?IcdJRdCqJuZUCSHpPX6ZhnMhTEFFfWgqmRGmhk5cVMlKUAA80bMdqgMQvIEJ?=
 =?us-ascii?Q?XQnmbJNmFhPlYtgF8z4Tas8TNMF+cv5jSm2kW3pDEW+7vn4zniSv3l7tCLe3?=
 =?us-ascii?Q?THSE547cTW3E85O5vJ9Y4D0zq8v5tRNROTeeXEi5p5JDDWEhwVDFikPjol4i?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f99db17f-7d4d-4398-5f30-08db83e0130d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 20:31:02.2179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMYkcA8qrzpK/LrQyaxoJOMgthCPUhESD9oDGYn5CC7canxJmYnJg8IJXn/WWU+xzCDloXE1xzzJHaaIoPRbqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: remove gucrc disable from suspend
 path
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

On Thu, Jul 13, 2023 at 11:08:32AM +0530, Riana Tauro wrote:
> Currently GuCRC is disabled in suspend path for xe.
> Rc6 is a prerequiste to enable s0ix and
> should not be disabled for s2idle. There is no requirement
> to disable GuCRC for S3+.
> 
> Remove it from xe_guc_pc_stop, thus removing from suspend path.
> Retain the call in other places where xe_guc_pc_stop is
> called.
> 
> v2: Fix cosmetic review comments (Rodrigo)

it is actually documentation result that changes here, and
we should care about the documentation. They are not just
cosmetic comments...

anyway, I'm not sure why I have not stated that earlier:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

:)

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c     |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c | 17 +++++++++++------
>  drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
>  drivers/gpu/drm/xe/xe_uc.h     |  1 +
>  5 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bc76678a8276..d3a2bd3db12f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -517,6 +517,7 @@ static int gt_reset(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> +	xe_uc_gucrc_disable(&gt->uc);
>  	xe_uc_stop_prepare(&gt->uc);
>  	xe_gt_pagefault_reset(gt);
>  	xe_gt_tlb_invalidation_reset(gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3093cfeff0c2..9a7fae727dfa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -730,7 +730,15 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -static int pc_gucrc_disable(struct xe_guc_pc *pc)
> +/**
> + * xe_guc_pc_gucrc_disable - Disable GuC RC
> + * @pc: Xe_GuC_PC instance
> + *
> + * Disables GuC RC by taking control of RC6 back from GuC.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	int ret;
> @@ -827,7 +835,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  		goto out;
>  
>  	if (xe->info.platform == XE_PVC) {
> -		pc_gucrc_disable(pc);
> +		xe_guc_pc_gucrc_disable(pc);
>  		ret = 0;
>  		goto out;
>  	}
> @@ -850,10 +858,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  
>  	xe_device_mem_access_get(pc_to_xe(pc));
>  
> -	ret = pc_gucrc_disable(pc);
> -	if (ret)
> -		goto out;
> -
>  	mutex_lock(&pc->freq_lock);
>  	pc->freq_ready = false;
>  	mutex_unlock(&pc->freq_lock);
> @@ -876,6 +880,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc_pc *pc = arg;
>  
> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
>  	xe_bo_unpin_map_no_vm(pc->bo);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 370353a40a17..81833a53b3c9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -11,6 +11,7 @@
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  
>  enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 70eabf567156..f8cbd292d6d0 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -176,6 +176,11 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>  	return xe_guc_reset_prepare(&uc->guc);
>  }
>  
> +void xe_uc_gucrc_disable(struct xe_uc *uc)
> +{
> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> +}
> +
>  void xe_uc_stop_prepare(struct xe_uc *uc)
>  {
>  	xe_guc_stop_prepare(&uc->guc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index d6efc9ef00d3..42219b361df5 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_hw(struct xe_uc *uc);
> +void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  int xe_uc_stop(struct xe_uc *uc);
> -- 
> 2.40.0
> 
