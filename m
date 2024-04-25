Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0FFC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 16:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59FE11A5E0;
	Thu, 25 Apr 2024 16:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfE3i+tl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E016811A5E1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 16:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714062222; x=1745598222;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cn0iybP6Sg3hXm4uAqy/E9xfVpiAFzm0jSioTcI+j/o=;
 b=FfE3i+tlrDYQnEuWlfk0jotkv4NSJSn+k20F+PWk/568GO+RLbe4z9Mg
 mwrGDHQmMIp4MQTtBxGl0yKJv4joFleKYc9w6j5geia9OhRgJV2fTiHVc
 GEomSyjZIDCaaRx6SG0AEu7hgltyYIMyjkOc0RL1Cc4tkPeNCJagCGMCU
 sz+nZi5SOYnmCZD3Y6dgFTowCEHGeNMCYlAEIoWDb+jFpqxVxG3uFefSb
 UlGpFNsenM1RrG6tqAxqKJjmsCuJdSaHKu/ObRCkk+9b+SBLEXh3Zrea9
 sBNnzACLaIrfXZwYyDXVfTYiwsbtRGl+oPww0Utg0jjZf3SutG1iy2n06 A==;
X-CSE-ConnectionGUID: Jn+abdjTTwSCJ8Fk+naDYQ==
X-CSE-MsgGUID: oxV5zPsLTwWa8+XpWbJc+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9923369"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9923369"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 09:23:41 -0700
X-CSE-ConnectionGUID: Z/qoIzMbSfGfDu3VFcKV0g==
X-CSE-MsgGUID: rixJ+jpSQWeVKfZTnrGxyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25080367"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 09:23:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 09:23:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 09:23:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 09:23:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 09:23:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVlGHwWS4e1D2Gvwmypf7GNQi39+wnWJXORVPRe6PsWOLYe7H3Ddr1N6/6fj76viDj8PjoF5Aoa/W6L6+WXqhIjRfAObSNI2opsZpuKnZ0kwPqTJHntdE3gjt+59hAsVIqZZIZCgeGQ1wk9yCMqak4KjamCT8XWThshq08n6ye+47cczZmQoJw3ceM8UoGlunIFo+DbtY1B+8BfPAgLc0Deo+MFNtH9VVDmHBnXWAmhlJIVmQYOPkDPAX7TXPfzWYxYZUcv8pXYPBz93lyqcsyswDOsSEIUbW2H4ITmG+JdtRsbRR6JRkTJJ0d79XWc8yzXWvG4ixY85+hViPKrCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21OZdoSdL3P9MyxtWi+zKP7iO4cttzyc+c2HvQLvGpU=;
 b=RgXgawtcsQ3c5wCBEtwPxitSGHmOrY1pJYQa2UeTOZUsiDUqAEBnCz42pzX1XrkwFQLv1Lv+DWxcYG/KEHwvR1xnrg7+1TnSt+QQO3nJ4kw47JPy/V0yShUPqDG4creXwTsQto9IsZge+JrPoT6nqiznE7vHPPX7ntvL2t9WxsbHfhUetTcVYuCMyjWPxy5BYVORxgmVpJkpSFfgoEoa3TxoQM5ZOre5+G4kIctLL+e8uHg5VlQeku86cQ7nMSFCAykVmDd3lGNwDjbXEJ0Ezh4hdSkCfUblqqTtZmyyBWhlJmsdavhudb9ZdfuF7RFGTfcslE/oyaj4fK25CXCy9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7588.namprd11.prod.outlook.com (2603:10b6:510:28b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Thu, 25 Apr
 2024 16:23:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 16:23:38 +0000
Date: Thu, 25 Apr 2024 16:23:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: skip error capture when exec queue is killed
Message-ID: <ZiqDf8xAFFssvImq@DUT025-TGLU.fm.intel.com>
References: <20240425122931.1851837-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240425122931.1851837-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:74::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: fd093d75-2a05-4778-7e7e-08dc65441065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3gyjXJt4uhiremaKrBUzN9wjum12xbQqOaLzzZh104OufxREcUmKkxnxs6on?=
 =?us-ascii?Q?wDZJc0GQpNzd3i1s09e15aWyqdcqsHCH2cjZxKOht8gv/F+2vTIkH+U8wiUd?=
 =?us-ascii?Q?RLywJdC9QdKaYU5uHEEtgo4ydsHVfi+GeiVMbNunNrfZRvneMe7LS1d4+CdB?=
 =?us-ascii?Q?MRakJ72Zm+MCrKPiC5zzpJchTxSXl6ZlrL40m91e/RkCvfdG778V62gXP8g8?=
 =?us-ascii?Q?9xkToBV9ABO5s85138Q/ZZczpTje1lMrdKlzyHBJPJHkwj8Yhg1xbp9UIRQ1?=
 =?us-ascii?Q?kulfUFlxrlhHnwpyyKrmgKrTZngTk5V5UR8LTVvZmKRt78dCEQCTtZVnCnwR?=
 =?us-ascii?Q?fzucpyv1zzoD8hVSThhcftTq6G6JGfaTcxl7UGgybcVZw+wq9MPeqiYdYWe9?=
 =?us-ascii?Q?wBV47Qw73Bbrz7EWzlhsdr94XFylNpB6x3YXfWUHBkSc6dOZKXCG3THqTu5P?=
 =?us-ascii?Q?q6XxWOEjFGv5mZjnPLTZPmIi3f1uG99MA82FFghNV28zw7vNUAR+SUBcr/zM?=
 =?us-ascii?Q?aTFgRyUYepmkBTP4AdXJBtKXik4Kfj3U9HqrB2qIPV8OEBbe46IB0oNb34hD?=
 =?us-ascii?Q?PWTc8Pb2cf9eJiJa/EULZbVxn3gl9RM3M7XG1XEF6/w/Fu6VPYGuVHpqVuBj?=
 =?us-ascii?Q?Y8nOoxtOPAoXblcV8nSnM95dZ7/ZHaycYxkzAFNVg/qDLALBUVHvcVdrugCw?=
 =?us-ascii?Q?QY+moLTaojuNiVynq9L+PlFNWOOoFjhEU6MxYjmQcqdvaczNK+hl0xnQ7Eqa?=
 =?us-ascii?Q?a0M1vuMEjvWKbnR9uS3tNj0sulegbhBCuzx6825nGLzsNwVWvUJ4ihjMqKjw?=
 =?us-ascii?Q?N+ZdpN/AFeZcoWriGZ1fSP7AvJ1Q+KC1bKfjKVIGMRmwylijtkR4yI3cL8mk?=
 =?us-ascii?Q?OWwdty9HSZ4a/rTE9++ZebVnqmheFEmyIe1z8l6midnvQBqp+Yl4/dKUoXrP?=
 =?us-ascii?Q?1Qb7nKBG/GjD/Yx0KzdatSP7/h3MQqxxzeGHPi7pRm34+cVEZoHqon+CEjmX?=
 =?us-ascii?Q?uhYwyH3prddYBtJ/rlkxeZVrvpJJn1ZWn7H4AyA9G4LpG1B5vewRUbD1pktf?=
 =?us-ascii?Q?SNQbf7ai8M2sdPydEFSPr2vxog5OutXH8Nu1D7d+GWsDOGzJocrAdDetT74x?=
 =?us-ascii?Q?hAOYA7ILMBn71aH3vrUKGxYgqkezIWW1B1QlSZM1T02AsSAUXRE6xFMc8G0e?=
 =?us-ascii?Q?T4RDU9koyThrte+eTFHGzP0LHdkpVrGCMYlRT62dve83jHbHUB8YsKlaZZFy?=
 =?us-ascii?Q?JjiCFEmH/cjfBY53XUxy8xOcZNibsRLk/ZgK7wJl3A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q3IBawHdn7e9AifhcY1QTqm6c/OWd3yoaFOasePi66hs00A/Hpq9Dv0vzZNU?=
 =?us-ascii?Q?rFhLh5KdHfL2HaFtWx8Le8TqArqqeGGwH1B+ziMDZWOYg7Wd/dbgy3k2vIV/?=
 =?us-ascii?Q?LWEb0GPO/Zu4pwlQGf68yopHlAjobeCdypnuegza8zD5mcqGuiYYvUGnmCco?=
 =?us-ascii?Q?I3x1HO4Nz1R35qMjYh9LuwPI/+rFLKNLHr3k2v/pw9ExHOeE/AiFei/qkAid?=
 =?us-ascii?Q?hLDy5ZcXaBotyfp51mES9ojlh8spgi+k3yST3ddhCVzjqWIUvOQFeeqip7xR?=
 =?us-ascii?Q?Cua0y8NZ1bx8FrPyEIqWEr1L4BNnMNOphoD7NWGSHKoWBDslwBhlU+Qdys3G?=
 =?us-ascii?Q?OftffXJU110MpQis94N65ZPkNP7ZrqixVRQ8ed2s9G6S9yRLaGAsO+2o5cdA?=
 =?us-ascii?Q?DgWO+E7XV1bik1hxXeN5UjChIUPvgy5EI/RUh/NqCPjq5U+usz3znBrlhytV?=
 =?us-ascii?Q?NSlCiK2fvSv4Up5FhFuiA5r3x7bvBc6CBLFWPkVeqOwjjjA3oxg6ELEk5/g/?=
 =?us-ascii?Q?iXlp2Jxzh3cKrObKw/me9Yf3gUgLtosv2a2JxKLoAawXuHm61nafPDjqVFnX?=
 =?us-ascii?Q?av7bgH3I/QXYUMeV5+rUYdaIHdaa41jXzRijRCUkJHQMPDzKwl6J87v9e3em?=
 =?us-ascii?Q?E+90C45UKE0bbHQRpGTFHQ7lBX7WwD8xw9XRIagLCUJ6XAqGw4ijtuYKbqbN?=
 =?us-ascii?Q?bhuu+gE68xYwLmU6EyJPIf+NMLAy4+P7coHooOfiFWFxULMfyvBUrhipa2q7?=
 =?us-ascii?Q?w+SxsespIkEaWd/2i1OJ72ridfCywSqUr6iTG6Ad7kGJfAFQqV1zUHVM3b8+?=
 =?us-ascii?Q?JmN+CnC6lIopt1jE8jE64x12LqFB7jUcI4oBFwUS+jKFO6mg0DT6mk7XcyE1?=
 =?us-ascii?Q?sO37c8uRQTk1WJOI9t3DUBkjxYYi+pg1e4IQABkdZbmCxM02/CGDbEPEhYSH?=
 =?us-ascii?Q?uwWB5MUk+ots+q/DOp3lltVoc84B7Jfc087WM4cSGlwbRhDwBSlrI0xdKmcg?=
 =?us-ascii?Q?yaJtFK7hcgCP4dGfysUSUREnZPq2QdRxEeuCp/QAtRePRa5Kii2zd1z6iYY9?=
 =?us-ascii?Q?ek7bYG2G0ShXsq9kPxpodV+K7J5epEZ8ekodZSXOus0VcxN522z/y7e+QaBb?=
 =?us-ascii?Q?Z6lQ1B7aLGr1Vv10EBrlb8DOXxyrzUxHY169ZIShQ4jnR3PeZUpHCbRMY9Tn?=
 =?us-ascii?Q?bErL2JrDdQSjwbsGYALpskT719PWtT4LlM7VVn2+sx0fLh9Dhl6qExI+g6uK?=
 =?us-ascii?Q?U/hhF/alh2hDh/Qz3p3OJxCZODxn7RCn1Y/4RtJSWRjjj26g51vUK1N7q2le?=
 =?us-ascii?Q?o/2l0oiJBC9MnZSb4C/KwdAnCARs9wx6MRC16BKtNcF8qQWudPCERme8R5ZY?=
 =?us-ascii?Q?RY99nAPZYTHmyZ5yrjUqp3FyhAS6tTC5Fj/qiaNfxcIsMGDlkrL/J3gQu7s1?=
 =?us-ascii?Q?MGqvTjqXiY6dvjrLSqx5pJZGgAx0YYbx5dyZRqaVHTsPN2y5NYE3wxFFphIZ?=
 =?us-ascii?Q?aSr57bJqdE43P9jvFsX2v/exkghu24tPze0FK+0B1gt51GOO5/9ZQS9MgeNd?=
 =?us-ascii?Q?kiMHBWU3sqT5ehTZNr+JwjeMwVLjv3atQPJ9iZMr7zwgTTcBbJ4uSWGZeJWV?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd093d75-2a05-4778-7e7e-08dc65441065
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 16:23:38.8476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2noQIMWHFWHswMTOUgXjof2p4rnXRqhSvsMFJ+R2Efa21jrCvZnIiRlOnA3xzQ0U/0oKpWAa4q0/rR1ZWnQnxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7588
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

On Thu, Apr 25, 2024 at 05:59:31PM +0530, Tejas Upadhyay wrote:
> When user closes exec queue soon after job submission,
> we are generating error coredump. Instead check if
> exec queue is killed during job timeout then skip
> error coredump capture, just free the job and return
> proper scheduler state.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 93e1ee183e4a..376a2c04e899 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -971,7 +971,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * TDR has fired before free job worker. Common if exec queue
>  	 * immediately closed after last fence signaled.
>  	 */
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> +	if (exec_queue_killed(q) || 

You still need to timeout the job if the DMA_FENCE_FLAG_SIGNALED_BIT is
clear otherwise will never signal.

So it should be something like this:

-       simple_error_capture(q);
-       xe_devcoredump(job);
+       if (!exec_queue_killed(q)) {
+               simple_error_capture(q);
+               xe_devcoredump(job);
+       }

I think I've convinced myself skipping error the capture if correct in
this case. e.g. If a user ctrl-c an app, we shouldn't do an job capture
on the jobs which the KMD kills.

@Rodrigo, @Jose, Thoughts? I know both you when done a bit of work here.

Matt

> +	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
>  		guc_exec_queue_free_job(drm_job);
>  
>  		return DRM_GPU_SCHED_STAT_NOMINAL;
> -- 
> 2.25.1
> 
