Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F388C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 16:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32EE10FBC6;
	Thu, 14 Mar 2024 16:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8l6SE8J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BA510FBCB
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710432988; x=1741968988;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UfU227YbA00qk08q5opHy9/BPr1ETaJuZB7odayEKZk=;
 b=T8l6SE8JRpLe21rI6vy4SG2D8Drl1oo4t3D+qOlOg+M8kvpcvVxKM73j
 0grV3Jtr7ufyKM756M4RPEyTcHODoriKbf3CzmyTtfYl27QVUlZcJQR3v
 zY/RLVYfFhkm0E57Mj80tDc8D2h9litc/0+sxr+Gl92L5YGDaiAUNSIAn
 cXJSy5SRIwvGembl9fmgckn5zQYkJ7z2yubFN6US118natD1qNr4Xhdmf
 wqsVDIG9M7tmT29LYEP2EsmrwVKsH0BxAy3+1v3GUfNFki/GbpD68AdG0
 EL3HKnfKPhjahN87grfAMbmRBRSOwERZVXTlwcHg6/PRVgWFsERO/3pII A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22722975"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="22722975"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12925424"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 09:16:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 09:16:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 09:16:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 09:16:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 09:16:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1fmTKdRShe8k4e6jjDHYMrdKPnBC0Ka9hpwMTvgVcz+ZbYp7ippt4t6F0BNIgAbwxy2y3eWbnGlqcBLfnHr8wvqKDILucsprWcDduYoVcwNUVfA1K0uofkMxiCqJlf8w84c2JPdZB6uaT2BXzMT0jQZPGKnw1gG2GeL775eBt0g/j4QL3YsKhN+afOZ8Prj7dedWJ01uqT8TMiU0mPK3jE29q6x1Uursps+eXB709LViz9PoIfAjPmz0qnnSc6Mrrpu6SmvT9oj7GYTBTRObJaDMjFN579yZS/MHSwJ6UXDo2+SO4jXrUPVEP3aWi15Wl1vl41X+zBBtrbiTs+JRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgom6Dul4BBlOVGr9ffmAlaUdsQ8l6zz2lHp8tzcdzE=;
 b=YzccLufgut5/BWgwxDwlznba0Pk+r0/7x2MRNnx6h/dRhFVEzUrUVppQMDiXNZ9TeXLeFYmkVAv9Aes3a7wJmyVqWk0Zld/IhMz11EooaChANq2SRfMg9gyI1vpJ9tJ1wnya8Jt9TVGWJ0xnKFZUfDlMkWvXhvv6k6vaClAFF4cegd3hYGgqn3sQPVFumYIHxELuVGElnDNU5EAbN9Jy0K+oVhl5XYfPmP3+MK4Q4T+GMknRaB2kzOQQW9sV9W+rKQXhCmV1ZUqSLk7BdYAJA1oAXHunXymbjPzHJXpp2OhHJt9fn9Wk5Y/WSWKR45HYLkkwn8i5mhDljxcjLgLBrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8708.namprd11.prod.outlook.com (2603:10b6:610:1be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 16:16:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 16:16:19 +0000
Date: Thu, 14 Mar 2024 16:15:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc_submit: use jiffies for job timeout
Message-ID: <ZfMinTEgneXnOR5w@DUT025-TGLU.fm.intel.com>
References: <20240314121554.223229-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240314121554.223229-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: e28890e4-b3b5-4cdd-2dbf-08dc44421554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9MNh90WE3DvJkQutMz4Un8RCk97E3H0pWtDOyeTWgQN2Eo0HJiD/Tcl0MpDiGRBGCuj/GBtbji1VQoMAMM3KSNCQLPo/96fVdD6q4qzgY7AI16w5Q453PNGcw2koZqidPd1iXV0EKfYcfwggRpfDX45yEI1/zW6l4w6B4lrOh/XooucsxGuf3Kzjl6wNJoo2HTvSBLTzfFHeq0kbF57mXuI8J6YcNSp8jnYxlXB/7Kl+de4exP829QY3j9nkly02vEVgNMIYdGXaYCvcYEXtjzvAzu2oDQXOoC6ZSM56DHDCWnlFX5xhUu1bBuK8HQxp0Lj9j7821VUkudl/zS+tOPfEt5V90u2+abNH9xmLQFccnvMBtIgP2hSKcT5EJ7wOgYPhbjSoO2upQFN01wA4pupwt7x4AFNQNMpZEdjkApaJjpdiG+VZgtX2AtbYNdcWafay34JH1BA5D3qvnifh9O6z3+VPLRAc43ZGrTfAxyvHFT0Vl9tWyZyMkIgizKbv07aB6Fuo2qUI5TXjqhd57GX43uVJIYqfVS+fZ/BvA6KjETL900IBER3wa4xhhwCwQcVObGDaXjMLhwR6zCE/+B9G0jdV7YPVLhClGRWkyVWxcKpgzap0U62ATBnTYJHjJS85XkNaEDjWo91hsIpoK84cM9DtRzzI0U7pV04q1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l+5urNCSq6VzzNZaBponhFr2oh0pM3URAvZDS4XkHSrziH9jhI6ZS5YDFObs?=
 =?us-ascii?Q?MFr1UWhnoX7RI/tE6NgfImcDz4kjngf8pSN2T/18bP+V9Sjl6c5O0wpx1Hsl?=
 =?us-ascii?Q?6+e1jtUOhmtABO00FRRw1JHl8l/wOmBLymTJa7MLiLYMQq4se00fBX7hDFNM?=
 =?us-ascii?Q?zedctukSvMNRh/9+SZaoXvhaLJnTai/8WNMuvlrmo2rnBYxD5TSb82eF0ymZ?=
 =?us-ascii?Q?/O6r9w/cBKfha6AHwv4q/B7EYU/p0EedKjnWwViF9NJLC4/nqj0Kw+7Zk99U?=
 =?us-ascii?Q?ttzcs3+AfRXFaETSPQ6iSXeLErRRejIPFbfXw4qTSAVFDy+YO4zzqTpOPkg3?=
 =?us-ascii?Q?hyU94gOVGQ3G1u4qihSbSs8kKS9HzR1Ib3OA/apHLT2UERybWVz8YLvzipGI?=
 =?us-ascii?Q?76z9zLIg63FphSZl76hYNxSuwYLxfD8ngHvTcgVVvs2et6MX+SoHfYU8MwkR?=
 =?us-ascii?Q?Cv0ujHwYIGvKU2Lwi9132b9WOMnEcn3qDYIlNbVUq43dnR+WBlc0dPPPDbo4?=
 =?us-ascii?Q?1/zZJhGsvcnTbuHAaeAFqtrDCjAHdPDkRxH5weU9DVS8RlzhOTAtKs9MJcaA?=
 =?us-ascii?Q?2spMZH0dgl/KjfG+iqLzuqkH5cz29/9Uc2mGIiZXwp612AghoRoLipbV7mB7?=
 =?us-ascii?Q?32qvU22gEDngokDLXNswpvQgkLu0yW+1sNHjxejK1dvATEgFuuUD5gr/rC4s?=
 =?us-ascii?Q?wsYSXTsSHopS4P7E990WUfX5FtoDa3GiRLGtjAz8cyFiJcuxGCHYxJ3FqwTG?=
 =?us-ascii?Q?X7HSIk79f+5N/6/PVY7CpSu6w11q/OztT0EtsGM++fs1ndsXQoGeUxZCHiIs?=
 =?us-ascii?Q?e5DmXTbvPh2A59xVbCFYsRXwt0RjhBb8cXkYPM10kEen/CBVplRgJ1StID6f?=
 =?us-ascii?Q?eZtuowxlbI8zL2nK5gFeLwh8MhbJ4oHw+ViMgMKVqtEIZD2UrCtIcqE36HdU?=
 =?us-ascii?Q?u3fcaVfJpu6hF9joackXjNgmtPaozLcTaWj+GAripqIBc7Wg0etUjd74baWY?=
 =?us-ascii?Q?SmxCgDaXu8o/z+7Y03M0ZkQQ/enWz1Jp431epl5+TMcx+xvBdQG048pbRvYa?=
 =?us-ascii?Q?MUMWRD1SHeHw74godKWwU2at952YnjB7txWb015sfloPKIHYDUzE/yUbUESf?=
 =?us-ascii?Q?9HsuXwtE3/u7KKDJxCfxyTYmK9lp0EeJL+qWr4KSjyFT0oiQ7VNHOo+CUgO9?=
 =?us-ascii?Q?f0uTNnZc9tTsqX+VhOsjoSJIBaXaSw0hjELfUDqEBnEVyw/WReQ+TNqkEIoJ?=
 =?us-ascii?Q?A85XYxAqLdftCcLVtfYjtEii7PscrCq+KzzLBQB3TCVxzaZbqXwz3cyg+G4B?=
 =?us-ascii?Q?FMBIdmE12C1kowKebMOYUppLwbCADZ08VVTVR3mnWWbBUKxdOK24UGeqOVkJ?=
 =?us-ascii?Q?rNRvL7/P4qSA0tVLHyxjdRyk4XhibGXJNVIYtZ6Lj53+dJiN5YXmTIJDZNqC?=
 =?us-ascii?Q?Qj3ckLOtmYgdlYi2k8xHtC8OlM1paFpNcTKhDQF06hjvr/OjVXIZC4bjGUeq?=
 =?us-ascii?Q?0D/XF1WEKNneh2lyYcNZ7itMIm1Ta/OedTFChz4Gobf+V1yS/5zTLhHa1mmW?=
 =?us-ascii?Q?9IxCXIHWLwhnDL0r7OsGxFfBYW88LDghpm8Kr05f3aJ0msbIWZ45kEUXvYc7?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e28890e4-b3b5-4cdd-2dbf-08dc44421554
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 16:16:19.7346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vsdYkbZI6k0oxTgiJk2JYpPtiJNVM65/pxeiplhTP73PSPWThtmo2rrRRXHXmyeCsHHAPk8XsNFFENOCzg0Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8708
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

On Thu, Mar 14, 2024 at 12:15:55PM +0000, Matthew Auld wrote:
> drm_sched_init() expects jiffies for the timeout, but here we are
> passing the timeout in ms. Convert to jiffies instead.
> 
> Fixes: eef55700f302 ("drm/xe: Add sysfs for default engine scheduler properties")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 19efdb2f881f..82c955a2a15c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1226,7 +1226,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	init_waitqueue_head(&ge->suspend_wait);
>  
>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> -		  q->sched_props.job_timeout_ms;
> +		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>  			    get_submit_wq(guc),
>  			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
> -- 
> 2.44.0
> 
