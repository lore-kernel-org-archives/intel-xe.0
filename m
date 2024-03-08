Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FC6C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 14:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13302112BAD;
	Fri,  8 Mar 2024 14:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIP4o8XN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E350F112BAD
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709909547; x=1741445547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DoIe7qMS7rcWNvO7BLPjGebecgX+FD6MErWWKVXDvds=;
 b=CIP4o8XN5rkGWkJlYBkcZrYYRptKn151g03lEseWklE0QCyY8zbj2nEO
 2zEd0JNnQaWoCpMgpuCtjykC00xc7n4fOb/RwntOv0AkIQcjFiOvhPkaD
 dyzIrWhtkO+uSAdPgnSU37XAMvIt98kRepjEgiF1BN2Zcs8OhY4KHxgJ9
 wtvX7K+3Xywl4vYJtT5kfxToj+lGarvMtWZK6dgBAVLs5jQJuxosKu6Nv
 lU1Hj00dhW0JaBJfb82Ql/hPr+O0QMJop+LmwOQNuTEnoONanpI4sAbU6
 YlUo5rpUXHPHrPfaxbD322pZUCIOPVjKwOi1WB6AHoxIRaneQRC3uJu/b Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4796903"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4796903"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 06:52:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10382518"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 06:52:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 06:52:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 06:52:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 06:52:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fn6wlWYWcYmFYKWoZ+n6NFSKjwzHUrfRwveB4PvNGLKURvoJIHEXaKOnVvHBwZVXNJlTKHDHRNfRdUgNQVI77en7hCHQJ1iSSB7DzX9Ilvgh2nr2lQfvYNcjXvNF9CoiI5r1+OpFUGa8G92LZeBKaWCiI0i7z5C8Cp4WPv2/z8Y7r21kFeDcZhUynMgPqVP97DiMaSeK82CT6BdPzEaMjkJCpd+WZd+NoR1YymQZm2Digp5/xUl190Mzlm4lhjv+XWpccDQLatkaWVPZpSshl6B5HLQJ3NAdkoBw6Lam6v87PzmHKfDSXb1KB2BVlCZlUJYmIeuzfAQYS3OWgDeffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ev2+NgZqUz+Ck9jD0wtYWFbhf5MlVqA9RR1un3hdI6w=;
 b=GiGYvuomI+7+6VUygRTmIrvTUt9XYlwRxxq47j7W9a/xTCRTtZ3ApjZQYwMZ83uDTBfth44Al37klwzVXoXeDf5ayjg6DTSqIbHMkffjSDMRInefqlYIiQI6zDbiAmBgC3IMrQBcqX8bYreblQHhDcZYC8srX5wDaKeXel7tkobWKKjPL4k4Xp1vlCwszQ+ZOwcLVc5HhMv6oUSKSoew8njbBLHLbgv6W7fYTSODLEC+hHfvfb3lpr5G6ZSuim3ieohYavZe7IWLN2Eo49XIJS1Q1v+eqCAVJ1kotTO11qvmH0PPmO8E8fPRxxP7YGvu1mLXuvg9tULuzuQXE3fcqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Fri, 8 Mar
 2024 14:52:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 14:52:22 +0000
Date: Fri, 8 Mar 2024 09:52:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/vf: Remove lmtt->ops null check in
 xe_lmtt_estimate_pt_size
Message-ID: <ZesmInDmDsLY1uPh@intel.com>
References: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
 <20240308043651.2010165-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240308043651.2010165-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a40957c-a861-43dc-7197-08dc3f7f5c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8cmdFCdKfvB+KSvD56NGss2VsYEwD5VT5XydLpuy+rMJ8I6I8ylW/lZLFbAHpF+cLQG3KFZLp+Y+Sgf0swKcKZSyjlxOjLjXGZHIJ3A388vZO/JiT7gwcFvyp6wZsOA3Z+cNtK76uVIkIAWUXDqjFt2KQnYtSNGafNK4sD3msbt3WXPBAfqQ9sfvIvslI3hVrWnVzlpvjhrsObRfq/xG54EljEs1vdc/oOUk/BkFVz53LxrbO/3ZrSzY9dRt54DImbXFNigJ4zJng0fIiMvC1h9KrpfOqnlyuN1DKGRXoxl/ORt6yNVM8FaLBs1QF1nH+6ekk4k/OqW9eJwn2EWlBX5N+1RPY4LQfZtJzLTYh64EVxg55HF7orPPa6cL3GthfH/2l6bHzemC/6enOmGd26nCBbc4LoZM2WcpLBrz3pDXFJwkZjj7XPdtg3dUfmFY2o77nCY4Wcyu/BeZVLmRATmOwVE4YygHNYIjZhbtErLnTMTNeLY4PYGVDEzX94r3LaTT14jHb0Ks3AwerR4xE5M4tfzoBQw1K+9zNbG3qMqXhlD8D7pWwB1EpMZHyWrwkZOvEyc7085ITX3LpJfZTIrUjTjuFPRQiTMttq7TOWLKC6Y7xB7VhwpA/FsUEzvwXN3R6VdH3NW4ddWSt+kNATyP8cnYdPTbq+J1UmRuWOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FOj8O43RPrGlIWfV1GekhS/cdJ1tRIewhfKDg+Eon3E800RbstermEduK4fX?=
 =?us-ascii?Q?SZEGLNJCdfB9/tI3x5F4OA9/jM2BrzenLCpPDIVJtWExWau2dMSucw13FfU0?=
 =?us-ascii?Q?vpAKFgThpWB7ymvxecXtbC8SCBD3BMlBEUfnVWlAWvFG9cxmIVHddCWcxkwN?=
 =?us-ascii?Q?660VIfvIqCkn6dcJbd+D4pvVqIz2fjJ89Bp4lk2sl5nLS70ak4NUnGBtyHVS?=
 =?us-ascii?Q?lyO7g1dnsW+wCNit+VyPHad+S9JEofyiWnmGjAedPF7h/aof1TlpzIn17wJY?=
 =?us-ascii?Q?9BFRFw8K2eRRhDztQJZQkAS9SR8bKMep23KY1Ck2wwXvt8ekALIPCBgUlU2t?=
 =?us-ascii?Q?G9gO7TAfddJz/iXuiLSbCzn+AZhBxv9v2HVAaPmOERj8VY+VHNN+S0F7A17v?=
 =?us-ascii?Q?iaSuvlJFZG7Daa/jNemDy5Or6amUFy5ZC/TLIMtemxW5kl5VTKc84MoOYkSO?=
 =?us-ascii?Q?/SABZ6AaKnnnPU01kv2dZ7CNBsqmmmy3WqQ2lnfEkXLePWPTXGBe9OEaMxAj?=
 =?us-ascii?Q?XPij7n6fxkcBxy0UwWsDm/pZB/T5t+RcDGMwd+CF34ApHUZxY7HfyQ3UyiJD?=
 =?us-ascii?Q?H3hYOML/+TcIzcA0togP8xc8fqhuaHnVnHAsSPO9SoF9OKG8sbCA4uDpcleA?=
 =?us-ascii?Q?vfE8oEpoldpljhJ8+Bq351/BRsVGPCdqzq3cpAEF7j6OUBj0YVXRo7UkNQyA?=
 =?us-ascii?Q?rkagbuHt2GDN6XkWynrotRsW5/w/vj2PcGQMouAOW54WtygBhhc7Lauyctw3?=
 =?us-ascii?Q?c/4eT5xCFOB986SpN9GP1FXnW5dpPvamEj/BtIEkUm9wvnWkzZ9au5QeSP0R?=
 =?us-ascii?Q?hhKseOanyJRxGxGezPoMynIA7loLLsMug+Imxr5TLAXVAUkgvrnJH9DnAypR?=
 =?us-ascii?Q?BJdbuBuqFT09hKZFrsaJbv0NUtcxJm4TEqk9in/KZ+QqtjiDoq3XQH4W+cWj?=
 =?us-ascii?Q?k9+6tZWbJhr/ch166OVkAp4zvOk66FrnV0linhoz3mcqEc1JJW5dVMIJHDnW?=
 =?us-ascii?Q?a2Sqg9PrQ+GwRC2mG2MF6jhEbIFXJrAS3lmci4sN/Wj/dNI96DCvcI76ckp1?=
 =?us-ascii?Q?2QoDz0Yymo+h9OlslQE39b5woNyEQ0NctnkXjp/UmaksgfzgC2G1ToBrboe8?=
 =?us-ascii?Q?LGPxnnL1fwDQbuEg3Dn6GQK4tjReqs8lHJuOeE06gb8rlOnWjE5YPfCp4N1I?=
 =?us-ascii?Q?Fmad/sn0FVj+Z9A7/DwR0wBwIHJ+7jhuHtKlk1gvSsXUbOK7wo2usyUK0Z94?=
 =?us-ascii?Q?9Lo2RHGMP9s8rGq8Ax2edzhoDBhd2JHbOI+s5zEJch7SzBcQlLkrXiHpFSTB?=
 =?us-ascii?Q?hT3VCjqNFLJjbUTt+00VEI+Z/0LuD23LQkwWxVR1irjOca73E0+eCHnU9+4c?=
 =?us-ascii?Q?Qoz8QYRoWA5RUdvX6l6pWC0PHV3q1NcS8HK6M6L+fZbdOGYWQYzKpSohXrKu?=
 =?us-ascii?Q?lBNajg5jOCmIfamuf/BUn9GG0szIbpCgCeV6Lgd+6xlL2lfrCrcHanBgs1DW?=
 =?us-ascii?Q?XFbyqyhAiPYnCE8jatSTC3aB/Cqn4dIjkTnrdTNj8xpknsBZqiyTPImL76OW?=
 =?us-ascii?Q?EdhJsmYWobqEg7JemWTht+BCyGL5RpNVI+E4WY1P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a40957c-a861-43dc-7197-08dc3f7f5c62
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 14:52:22.5102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ail3XQbBW+B+6PQCpAc3/8xhhkUPSU3UZ1CPjSjO4tCVFowy2WQYWjq9s1ov2Pk5Y9bdPWCAJHTxIpxm0W40Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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

On Fri, Mar 08, 2024 at 10:06:50AM +0530, Himal Prasad Ghimiray wrote:
> In xe_lmtt_estimate_pt_size: Pointer is checked against null but then
> dereferenced anyway. 

And what's the problem?

In the line below it access beyond this pointer, so it is a fair
case.

> Since xe_lmtt_init ensures lmtt->ops is populated
> remove the check.

With this in mind we could simply remove all the asserts in the code.

I believe that if someone introduced it here it is likely because
during some development or refactor this ended up being a problem
and want some earlier kind of warning with backtrace information.

> 
> Reported by static analyzer.

Perhaps then replace with an
if (!lmtt->ops) {
    drm_WARN(...);
    return;
}

and/or mark the tool as a false positive?!

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lmtt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 0d7c5514e092..d6d75414bb99 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -487,7 +487,6 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size)
>  
>  	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
>  	lmtt_assert(lmtt, IS_DGFX(lmtt_to_xe(lmtt)));
> -	lmtt_assert(lmtt, lmtt->ops);
>  
>  	pt_size = PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
>  			     lmtt->ops->lmtt_pte_num(level));
> -- 
> 2.25.1
> 
