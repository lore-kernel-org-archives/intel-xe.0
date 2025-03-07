Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CA9C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 06:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B592210EAD3;
	Fri,  7 Mar 2025 06:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gigP5Vqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D56510EAD3
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 06:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741327289; x=1772863289;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LegV4GFiRLwb3gkdVJ7ucyeSWVU1krMHUGW9J6uOdsE=;
 b=gigP5VqdipDZFD0dZsJYEYEybmYhnjxi/+AE3oZR6rF4UEmlR3H49QFP
 j8Ydtx3IZ9YEYUIrKm2dxKQ/7Y0AbovfjFmVpwrgsMajGBXV5mrLQBGc5
 tlE5RYzB8lyDZAPaf/DWFMJDb9TlTMI7puq0YpU/PEX8rTUUyLNaW1Agt
 N6TIwDa8Zrv7fxj7rgPAXxYbPqHi9c2rT5Knaa6ZhvaLSlY3rr609NqSv
 keIumn/xjDiLNL2kr0wUS/XMbTjNd5LQ0hR8wDVx/Wnx54YDiunvAbM7e
 BBvmyD6t7r/irxruVkzJcvqWcCdW/4cqSVcFt929pmIKVa4bUNK1Fxmp5 A==;
X-CSE-ConnectionGUID: vZfFt6BNQimlfzHkx8SeOw==
X-CSE-MsgGUID: IOMnMbEYQJCGWBpw/NawEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64808262"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="64808262"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 22:01:28 -0800
X-CSE-ConnectionGUID: 7XCNLSWMSbCInqrTgGPa0w==
X-CSE-MsgGUID: mD71D14XRQ+MN5JQeY109g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="119238576"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 22:01:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 22:01:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 22:01:27 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 22:01:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uwc+3cDw1P1xclym9HLJTAtRO46WoMAV5D4dwD8w1uOEgZ5b7dBQtLu1ga50UQLPpTwiuIIHHlNVpZL89yqr2FPzNJ0H+HlzwcCsqrgHS5Hnj+XJgp1qWAEaFyg18zGIRgDQzuTg/kLwdJly21y4xiRjaC0X2S/mro6DGB6HMCFJkPD5yMRtddXf3ENYDA6LMPj0ZnSl1XsD8x+c7TojPtirVTw93KNEiQ+Gvicfj5A/PxLiIxIcm1WuxWz8C8xb6KyuGAeyDMq2yQmpjUQ9J58l60FFW84Dyn1T3XEmP4GlZuQ55t2aotp+dUqNrh8gpQBE/R7Dh39eIKIknsPVkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpgy1LgwPTQxIPEICSyArhg3A/gtQ4P5pADFAMx3op4=;
 b=Q4tD2MclHVCZWxkFs7UlyV6OEXG8KPEabP+sMpLPQaCzpcXgcXMRNu5gVHB0+xJasLgvQofqJhGPEGorbkwc8B5zMK82s2p0QqwpaM3Wk9V8A41qCICHrQ06lyi0TLH10lBtGhNfuNQ17kvpO51B6SuWx67OSQLlXRQYl9sffjTl2bZq+JdjgIH+VQljwN3/HVbbTsfX8Go173su4ZK/vD3kUR/DwVDIZMLfu7eFmpCZl6q+XOYvj1c7ogV3+9ksL7ZtMZXJ0s8lZTA3czCbEqcg8kYfRUmkrGi6G4Jg2qFsragBRcLIbghL7bwzIcQqR3bM4JZt6YBIE8pIuYwctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Fri, 7 Mar
 2025 06:01:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 06:01:22 +0000
Date: Thu, 6 Mar 2025 22:02:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Release gud ids before cancelling work
Message-ID: <Z8qL9RW3DCzkS0q9@lstrano-desk.jf.intel.com>
References: <20250306131211.975503-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250306131211.975503-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW2PR16CA0066.namprd16.prod.outlook.com
 (2603:10b6:907:1::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a614fe5-9f8a-4895-52c7-08dd5d3d7c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eiWtF2sPw/rwVcHWk+xNSlKo9cXFMSPnVuTo8RrNdtRjOrbZcNoxraTbdKyD?=
 =?us-ascii?Q?yzVDighlIIpMqgrQOwBYMf6ooM45vwCTBD/ECw4+OIf87l+2K2d9UeR+VKYJ?=
 =?us-ascii?Q?/u1VawZPyhgyUD+8O8JwSSkjuw9Y8zLOTHam9C6DESh8qSCb71TA2pYDGlrv?=
 =?us-ascii?Q?QjbFHnwxRmfYKrGTVeBQx7BwATAF/yDk5FbLXBfYSCRWZQV11KuVMwOeqqn8?=
 =?us-ascii?Q?ly1Hj7eL1JVF0uLCzunhpCcuftHTGq17A+OcWmauTjfC+BpBGD2Ouy1iB/pa?=
 =?us-ascii?Q?H6pkV0bioOMHbYkWux/RB7XCeT1cqqHWH6TRxj8/D/DqF0PRWMWkhB4jB7Ri?=
 =?us-ascii?Q?WCnCrysppzKyX4Ewo+a/yZfTAEe607T+2b8VaU5v5df9fgBydOeHcVtTwmWo?=
 =?us-ascii?Q?OPWMgnmMH7rdmuFVI3VKj7rvc5zmJC80KgSInc4jF0NHgk4wzTgSKCEuopCt?=
 =?us-ascii?Q?fsLSz1xNAv05GwkK7zaoU8FkdsnaQ/DMjLyt14nJaP4EnC9gNRT8odxnhklp?=
 =?us-ascii?Q?7ncLCJ5LD7y1C8+BPePI4A0/8BHBkkbwCVl0QFG1IBTMMUZlAoyh/BjgUgbc?=
 =?us-ascii?Q?pBuceGqQ5/KdYLwtlf8ovIVyQKQUuL9O7FXsdoInjXvsGrCCban/S0RPNegG?=
 =?us-ascii?Q?imCN/qjy0BHT1WkQKI3usXQ1OuVI3k8/24e25cyThwF1+8pCZyJbtq3FOrCr?=
 =?us-ascii?Q?wnvOzMAuauKZ3tQ7U4nuHDky1ubqizbHuPZr3JQkwEaPAyOwFaY3Tc5yG4rz?=
 =?us-ascii?Q?Gn+hXc6+BYeDGz4uSbRX+//X5TeNx4UbqF3g3I1T/+1/5VeqUHg1Z8ekN+XO?=
 =?us-ascii?Q?IoQQHyZ2yzLvpkBzFZjoqThNh5FqpsyH/mp4UD05Pomh8tYLGCVTq694iVY3?=
 =?us-ascii?Q?mblVbMpLZvedHpjLqEkU+YRQ9KjyngnjFRaiNFUO8yWVVbHIKa2SyedXKyfD?=
 =?us-ascii?Q?awYTx9e8rABmv9cxGypm3ejBkYR/yTh6zDFbT36IFXZXeqTEh/ZgEQTUEJNK?=
 =?us-ascii?Q?tEu31B+lvIyHkO3+niYuwxHDi4ArvBacmPYLOfvPe+kNORsFGEvFDAWU2dQY?=
 =?us-ascii?Q?suL/AZxQK9iWxWW9qsvN/VKzxkCjl/EGu1CF8iu+pAfUict0bYhPO2XFaUsF?=
 =?us-ascii?Q?vT0UWQljPhMBPtKMWz+M3s73t2Y9SnWrehN43tUef7d6zHYj72YbKR6f9+9P?=
 =?us-ascii?Q?H9Y9jmSD6XrOkfb1Dz1f3Y2I55zHTLCwIXHhaJVUovpSX7UtgPNO9MvpobWY?=
 =?us-ascii?Q?+ro35wmxgFu4gyJeqVmkGMS9/Hj9dT5gRf0TQNBNvH475yUfcGyC8X8RFHjp?=
 =?us-ascii?Q?xRRPVm8z7hxzQmUBQYbbbB59kaUeG3T7GwXhOrGV373UAw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zXFRiq0U96s6uvkLZCmlxHoBR9EJ66lGXqZ6ZOBAcavH/fjKcJffXD6qmFAe?=
 =?us-ascii?Q?SR7lL8Dzf92fU1HP9o3RCgZXMEqzhdUaP+S2e2efTzNSn0+GJTeYFF+bRqaw?=
 =?us-ascii?Q?i2h1iPhIpvlYVysFC1mznft+nz9TXhl6qm3iguEAQo16bSOmtY6PFPUXnzUO?=
 =?us-ascii?Q?IQzYeNyuyJu1D51l56XpoCaPkjBAGr+nLu7uQup63LYcEMcGCTeJVVoFsnMu?=
 =?us-ascii?Q?Tx0E/LsEe+hgGToq3fUgXcA58V1nX6FqApvciWbQ4uhaNJv3jZh2zmRrsg/v?=
 =?us-ascii?Q?415Qz4BtlfphpR5A9+yuUQeObeC01A6xtRNvrqhYD8XSrfMkOQaLgN9Bn7jD?=
 =?us-ascii?Q?APV9t57aXJXC/qIzpO9GrvLdIbaz67f3y8I73HfaL4E6iI6fWSchLXuqGwT+?=
 =?us-ascii?Q?5uvNMBTxJhDIjgtzKdZx6tyhIWWLEbSrRLyxvhO2l/mfL/CwrCp9BGApnbz2?=
 =?us-ascii?Q?+Hlcp6K4jdHtJBgxG3SoRIFGagvduGeoZAod7kvqilCqEFGD/mt7xTWdhMI5?=
 =?us-ascii?Q?wl9rj/9OqrRO5Z5/N28UqyoJtTRXNdM6CpHe/7aAGeBBzzqMISytKmQ3qKQx?=
 =?us-ascii?Q?5AXe/vrHDgjnX/AoUDwlqdIUYAqS8LrukXFs+PewkIBWmZx08bXIuDZohbSz?=
 =?us-ascii?Q?lNIn5hUq6OCYHlKesmHj8J4aDJIU2QHiSL15nAOn3TM1hHPCXEn6YxJpcx8t?=
 =?us-ascii?Q?UW4YKd3bZ36XJal93mxKZeYtDUedG8oyeWda6a//MTFl557i+BWBwrgpeWLG?=
 =?us-ascii?Q?c226FpQRmGavQw6VTADNFdMApw2G2mzRyMLzSNU/fKsq2wEVYfXUL80CQ30s?=
 =?us-ascii?Q?WCw0XUzJCXla/rywMeIrRjPBja5EOZyN3IrNsAn4LYsHsdTMwgbejCFCTNBY?=
 =?us-ascii?Q?YDNGn+J1PzMa0U7RoU3mBdBnzehLYZ0QkPZxuIv5Eg3bouUR0c/2bVJjNtDR?=
 =?us-ascii?Q?vgfm6kejesIAXuF78Tds4IKhgAko9YHlW7kPPtLTz13YJ4yUrt19bbhROgxG?=
 =?us-ascii?Q?ZybYJT4GVQ/OXeSOmL2Pmh0VHorcAbUAL0cRY6aW9VjtoNSSF3cGBRCRH5OY?=
 =?us-ascii?Q?9uJoMXn/3XBHgnr/ZMV+dWygr3SAiVXGTrUY4KnRpDfqtOKYpqh4lmgM35Uv?=
 =?us-ascii?Q?jWqB3dPyqkSYZVFFZ5kR/Y2SWEZavZ4y2tvXXB7mkp6AP9zUUYU4W5+Yz34E?=
 =?us-ascii?Q?2WROwbzpVSOrjwG/PtITDSyS3zpeDASwU2Ujok4h2IBg0nR5VWlpexXbGFqa?=
 =?us-ascii?Q?I1le2EqbFfG+9xkjSMZ3/yJ9UXvqevN0O0UC/DdcCNfOwGH6rYkXij56jMvk?=
 =?us-ascii?Q?ys7Fq+ZH/dct/MLeh+sdRGaSc+1wQ0awuPDBlmXLWBmoWOQk/1KQ0D8Uh9J+?=
 =?us-ascii?Q?qDlk9z/0wqts2pgMvC2VVlv4AkDpzsGkfTzrAPSJin4c0b2OXni3lSkBF3jy?=
 =?us-ascii?Q?7hNfTXRFahkyMJhINvFk1MS5MJyARJHBMx9VadoFYix5JH4WdUY3/wohjkqK?=
 =?us-ascii?Q?zOnhwSEeqVLmGV1WugcevGVEo3Cpc3dxFIz8q9YbTo8O4FBd3i0vh6aaSO/P?=
 =?us-ascii?Q?jzQ2FEYLVydCxAzew/c2rxAOC2tCO0OfX5BPTyUw8eR/tqmAq8honjx7XjK+?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a614fe5-9f8a-4895-52c7-08dd5d3d7c88
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 06:01:22.1752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QoQ3FJez6TCaUp1wmzgR/g0YQ3iJhL91hKRclAvVsrpZUw2m65n/yHrA3aUb8GaxNxPIXpxJOLMl+MFonXZm9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8049
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

On Thu, Mar 06, 2025 at 06:42:11PM +0530, Tejas Upadhyay wrote:
> A GT resets can be occurring in parallel while cancelling
> work in async call  which can requeue these workers.
> to avoid that, lets first release guc ids and then cancel
> work so they don't requeued.
> 

Suggested-by: Matthew Brost <matthew.brost@intel.com>

> Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
> Fixes: 18fbd567e75f ("drm/xe: cancel pending job timer before freeing scheduler")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Were you able to verify this fixes [1]?

Regardless pretty sure this change is correct and required:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2561-3de9463a46e57221df6a0b5f2f5b7f33207d76f7/re-lnl-4/igt@xe_exec_reset@cm-gt-reset.html

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b95934055f72..31bc2022bfc2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1254,11 +1254,11 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
>  	xe_pm_runtime_get(guc_to_xe(guc));
>  	trace_xe_exec_queue_destroy(q);
>  
> +	release_guc_id(guc, q);
>  	if (xe_exec_queue_is_lr(q))
>  		cancel_work_sync(&ge->lr_tdr);
>  	/* Confirm no work left behind accessing device structures */
>  	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> -	release_guc_id(guc, q);
>  	xe_sched_entity_fini(&ge->entity);
>  	xe_sched_fini(&ge->sched);
>  
> -- 
> 2.34.1
> 
