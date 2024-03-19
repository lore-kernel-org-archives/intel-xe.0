Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15BEC54E71
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 23:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5531810FCB4;
	Tue, 19 Mar 2024 23:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNlKTX4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204DF10FCB4
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 23:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710892584; x=1742428584;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YEnPXH/jBkau3ochnFb7FwhYvkps1v6UrMYnFHX5fI4=;
 b=iNlKTX4Vu0bbstGaOvuBeY/JJOKzxLoNMZzghNh7W5Fzhp4dtaUNfagd
 rGBQpHAQI+X7iP07i46/ZN4WLBbE3S7XEAXP6rQLvBbk12q4udFYpVTHY
 dAOmcG8YspENb+uRJXd9SGlMjk+nXMWRm60YsL/uOlb1xbNshNfmrOTlj
 KZ7cyaeTP8Sfnky9uaXMppLaAkzof8AZWLCowm7FPA6ijWPTxTwb2xVS7
 2lscRuRBfMXz58D+L6wq4adp8prJNldJWPQgr1WhAiqKdYkys1Tv+rMJ4
 p2S/J7z3H9r34ltuaE8dyCPAR+ErHMIdx9HB0EjXjOv+A2Q4tuNiiLEZC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5971812"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="5971812"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 16:56:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="18696824"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 16:56:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 16:56:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 16:56:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 16:56:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 16:56:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9iI1NuYs4f6TterFpEaODtX/sLvRPw6Ywb0bMlZxATE4iKfC4cRYv8VbOaKrKS/J/kXNBs7DUl2Y+7y3O/Oa2dihJ7aBfN9RbFiLBP5texcwJKkuavVrPp9arioABoG3TtZ0yKR1AB5OwG7qSUJWp8B6t1D5KBtyJtc68+TJ8oQqHPKTn8Ff3wnD63n0HOj3bN7s9ywxZsRe4Wgkgb7uhO4aKfCF1B3x3VmYFj0OVQ9dZA+jwYyOO+wHnUKDkhY3CvFKZbo4dvJLw0Fal3zZMGhs4ybW/Y0jDussVnu6yx7fziyAWxJBQF7XX8vMyq9MVBf8+TWxFZ3wlGyFNKWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdCgpUBIlZP8bWdQux0ZixgKdW3YLv0FkXX64D8FEBI=;
 b=b652lwC/28LzTTI6BeAzEcPsl7R56gMZ6iakBFWVYoMRe7fDxsJjtE3SykvPMyZcmcZg4Fadwh2f8RKYcbP9ofpdvRqAjDiYv2QbU0hs/JBzf7G6Qr3i789mhQsTBnM8qA/YwPS29rN2sfrC/WTJcjMFO0+023IqO9oXKA5m81r86/8lfOLRtd2znC0m7jpxa8YUT/SDnyxs/5rc5KU6OyO3lauK+cimhKD+aXdnE5Gps7KRqSmAjWXop/zSWgmEfKLc0+qkUuF0X9PblUm0InXPVPyCk+DHPqInyL8gsgnvec4c22L963vaDyYC1tyzfJnputpZhncxT9RN+gU9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5034.namprd11.prod.outlook.com (2603:10b6:806:f8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Tue, 19 Mar
 2024 23:56:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 23:56:17 +0000
Date: Tue, 19 Mar 2024 23:54:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Separate out sched/deregister_done handling
Message-ID: <ZfolrobherEHBYb9@DUT025-TGLU.fm.intel.com>
References: <20240319184153.16667-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240319184153.16667-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4969a2-b905-4890-f7e3-08dc48702a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OxwwSmKnD1ElsoGohu/dzVf4p9m6HCag4qL3kEY/MwloIDfpnmnBigaWikDVtIf1VcVpK+tYlubWG6AfrZeSxd0fsVx9GN94RrL98Kf8fj1xx5UhDR6vph/TP0/H90h0CJK2r26hH5PsSVFh7W78dsWUgxzi7maqiV/JXqTpH/WWHZhNQf5aJH8h1DLEw2Iuvt38JuKcs2tkMp43xpcGxT5r+qxjYgMwl/bIjDz1HbwrGpNNOq0yMOvONlRxsKKybd2Bh8XMYsqLb14dfCkJL8pjKGp6X+J+jtWUo4QXPhsRE8u4iyYdu6gcHndi1uWI/lRHMSoXOHHYnQBXOyS8tQbCkZESwmEjCBiCMYWyf/5tL/0xwPbgpgO6Yyd/28MfkB2bVnivrj13RUTFp4rt3DJFJ1ZYBjcXoSQ/BmN0tLDN6Z+5Iip3iZdL5No/fGngoRD60tzDwpUv3NGRjJzJTiK3QOrgleG/3qLg+m7juNZ1U2gt1t/0eyxHncd7SCuDoKV6OhoGkvg5Tm1i9nHklREuHnU1okZjqn5PkwFyeCvuRbK3vbfxBFO+ffw6KFFE6lWqvwPEwhobvoKCO/68uo20DQUMFA/kXhpa/3OBG8kJXeX1hyHajcOt/wlhJ05+nyvZfu+gWXLfwdoF4SFmjXs9GulMjBL4sddY/sbfkv8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2w8IWmUfyovWPlV0fD0l19J3ukaqa5dZd5tjhsFia1WWy9wX+OgVxyMJ92n+?=
 =?us-ascii?Q?xIJQPXKUHrLJfmVpRogzWAO7Gg9Xig3IYxkPfYBFBhfujUQ2JJ6sgZsgsksg?=
 =?us-ascii?Q?L2isc7NOZPinLSObNKJ+1cO78O4R2Z8b+MqWlRoIujaN8qyqbDfuvIxHhM5m?=
 =?us-ascii?Q?mRKMgNpmlPnqJwt9E1SlJiDfqbUt2A7kuPCJh/OEJEZQoScErZLp+L3kH+zL?=
 =?us-ascii?Q?Nz9LdiKgN2XtBTngC3/BMYOxMAfTRA5SzBWMCJBLOO6Pydzz4ULWn7cpSDBE?=
 =?us-ascii?Q?xl8YQlaULbWa9vvZWuOmTdb0xtf6b5W5cMrWkLnbHVIIzZ9ku1CDINadC3rc?=
 =?us-ascii?Q?2aQ/0d+xOsS5WfblUjw7JdiMMi3ZPDpRvX28SHBMq/eUZryCofsoLRYhRFTm?=
 =?us-ascii?Q?14yS7mTYlDYxOQ/Hg8RQ+hbCPz8T/6Sx/eVEIXcczRSiiv78g2/yPd+BGHG0?=
 =?us-ascii?Q?a/yUiOCjBPBJH7jSnW7HI1tkXiAPv0xf/Wy34ztoIPTOcfc0/VBAzMdvSWh3?=
 =?us-ascii?Q?O6cpGfA3Rsikw02AB4uc0fojqN1G01dOTVczlW8FpgaDS81K83vxRt1w+wN3?=
 =?us-ascii?Q?gEpxj99beHo7xbx82omrhNrFX5lqUawy85FE8PxFxP2KIMhkpJpHD0YwqiGD?=
 =?us-ascii?Q?g21f37LahnkXsoChVcVUhwNK1RtaOH+cXOXwMtg94tlj5EVVNcgB0YTmYRWZ?=
 =?us-ascii?Q?bICpdTu+I+3490nBOYWDnmGpSnxpEXMWkzxyyAytdkKVZZeUtdP6q1LcJ64R?=
 =?us-ascii?Q?voRrMCeVoDuHMkKJlj2ZVcvAVLfpPggTPY/GurSJi1e5T6FileTmpreqoXI/?=
 =?us-ascii?Q?3XHsnqW36d2IcVBT4s2yq2JJdzHzkl5F5doqySvnec9Nn3XHw5U0SoaNNLA5?=
 =?us-ascii?Q?BR++vPd/Oc6OcyGRsQzAb9i9YXWW/UxtLZxf80RwgEOBNgJ6/Fyn7SzLpgM4?=
 =?us-ascii?Q?se4h6sWohPBPvtgCjuQmTkdeBtfPuJsUWa8yhRAwrXo77AIZ/d4p5pi0ygwx?=
 =?us-ascii?Q?bKGZPDFTT4Rk7jtv8awa+ELPbTi8FFiNB1U/PqZI0KYe9rDWN0J0XHc5cGbW?=
 =?us-ascii?Q?MWehg9o9Fh+4V6BC5Jc7oFNXyqF3u+cEsptITCHBGwwtmbDTHEloc1eMSXHe?=
 =?us-ascii?Q?l6YAzV0hCkb/jZWN1NieZu8IpbdqZIrTDjPsg/Hp5H2lolvQQfeT2zpvuc7X?=
 =?us-ascii?Q?brCHZ22zXP+B90/QPnk2EXgk+gWzaHOtnC1Xbk2BNFI/a0BnN8ELxdJ+6qJ4?=
 =?us-ascii?Q?U1itz048CzdGiVUcismwb+pWOPUQhH3jC80ASQcz+6BFwEdiJnK63j2XOwIM?=
 =?us-ascii?Q?Nret45Ex6XQKD0hEOpFkBWWMbwKQJ+NVTcSHONLs+kM4fEvO7svJTYD/GmET?=
 =?us-ascii?Q?qEzrhM/ZeG2UWRO7F91eN8Na+foKWN9MjAnu2vsMohSdncY9lXl+l9D0jPm1?=
 =?us-ascii?Q?1H58IPwxyRAvrphpjEVfYbQrOTXe4Mz0fua82kiyf5u5FdEi4TRdEMM/NJC7?=
 =?us-ascii?Q?BjkkOHLLxFfh/kt7q1eFzzN29wO4jfMPowbiUFUDBWoHgPO/KKbnHPZFC7Hv?=
 =?us-ascii?Q?VIR4BqwAYS/V+GD7y8rD+mCN4cBmLQKFHw8pUObGcTRsEp1oTyuY0UNpfzvL?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4969a2-b905-4890-f7e3-08dc48702a9a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 23:56:16.9558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBsW+SCkWQZvizKmqSMV9T0BD5Vh6b+GSreHWhhUq25pq7XU+IIsOE0oqMXfu6uugwbt/PeIeMhScEusk/HF0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5034
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

On Tue, Mar 19, 2024 at 11:41:53AM -0700, Niranjana Vishwanathapura wrote:
> Abstract out the core part of sched_done and deregister_done handlers
> to separate functions to decouple them from any protocol error handling
> part and make them more readable.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Good clean up.
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 64 +++++++++++++++++-------------
>  1 file changed, 37 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 82c955a2a15c..4a2b8e6b81b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1574,28 +1574,8 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
>  }
>  
> -int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
> -	struct xe_device *xe = guc_to_xe(guc);
> -	struct xe_exec_queue *q;
> -	u32 guc_id = msg[0];
> -
> -	if (unlikely(len < 2)) {
> -		drm_err(&xe->drm, "Invalid length %u", len);
> -		return -EPROTO;
> -	}
> -
> -	q = g2h_exec_queue_lookup(guc, guc_id);
> -	if (unlikely(!q))
> -		return -EPROTO;
> -
> -	if (unlikely(!exec_queue_pending_enable(q) &&
> -		     !exec_queue_pending_disable(q))) {
> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> -			atomic_read(&q->guc->state));
> -		return -EPROTO;
> -	}
> -
>  	trace_xe_exec_queue_scheduling_done(q);
>  
>  	if (exec_queue_pending_enable(q)) {
> @@ -1615,17 +1595,15 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  			deregister_exec_queue(guc, q);
>  		}
>  	}
> -
> -	return 0;
>  }
>  
> -int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_exec_queue *q;
>  	u32 guc_id = msg[0];
>  
> -	if (unlikely(len < 1)) {
> +	if (unlikely(len < 2)) {
>  		drm_err(&xe->drm, "Invalid length %u", len);
>  		return -EPROTO;
>  	}
> @@ -1634,13 +1612,20 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
> -	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
> +	if (unlikely(!exec_queue_pending_enable(q) &&
> +		     !exec_queue_pending_disable(q))) {
>  		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
>  			atomic_read(&q->guc->state));
>  		return -EPROTO;
>  	}
>  
> +	handle_sched_done(guc, q);
> +
> +	return 0;
> +}
> +
> +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
>  	trace_xe_exec_queue_deregister_done(q);
>  
>  	clear_exec_queue_registered(q);
> @@ -1649,6 +1634,31 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  		xe_exec_queue_put(q);
>  	else
>  		__guc_exec_queue_fini(guc, q);
> +}
> +
> +int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_exec_queue *q;
> +	u32 guc_id = msg[0];
> +
> +	if (unlikely(len < 1)) {
> +		drm_err(&xe->drm, "Invalid length %u", len);
> +		return -EPROTO;
> +	}
> +
> +	q = g2h_exec_queue_lookup(guc, guc_id);
> +	if (unlikely(!q))
> +		return -EPROTO;
> +
> +	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
> +	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
> +		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> +			atomic_read(&q->guc->state));
> +		return -EPROTO;
> +	}
> +
> +	handle_deregister_done(guc, q);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
