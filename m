Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB63CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 16:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8714C10F84E;
	Wed, 10 Apr 2024 16:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPAUszOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219A010F84E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712766363; x=1744302363;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uQ5uifBlqTxsTufRiOdiB6KVhQAi1eAr8IiuHxnTW0o=;
 b=kPAUszOcdZuY+oYklyDiSE9vaY8zTwchjkS19I7Mwh9986KIpTUw85UD
 pC6NAko4bsFFuzEfS2RbXP52029V67hGtf3B4yD20CUIgbxuqqIkSqcAG
 Lg8Jxtlgfy+NtmS/aL5GJTlNLoyTHKsrRt6p7Uy80AxvNSetGPDNftCeh
 c0cZenuyulPmtqygSsYQEm3s6Hw4B5pFIKwxIjjOFK+W3od6OQAuSstIh
 5yz64m6ZDdOTO0GKotldDC4FG6FPAnHuCzaZXQJ+3b+WyxdPRo+DOBeIo
 vJt5B0+VFE0n0jakESWo8IS8/1q3rJx30U93wHD3Np6Lkg7N6zLohhOqC w==;
X-CSE-ConnectionGUID: 5QsTHu4ZTF6bV7LS+aKctg==
X-CSE-MsgGUID: secFFNa3S/i2mTRaX2MA/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18701855"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18701855"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 09:26:01 -0700
X-CSE-ConnectionGUID: o1Uu2JhuSiu+tqOfw+K85Q==
X-CSE-MsgGUID: Wf9wLZeCRtCnJwZ3nfoG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25099728"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 09:26:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 09:25:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 09:25:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 09:25:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 09:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDoNFmKtX2MFs5PCdi+QOp2pAjaMraIH08SMOeH35rzYQnOn7zbDwm698y8O6KZTtgNYm9w9lViRsAEjxDVnRVmyH5DDEdq5EoSBBQjwmfkNP5IlhF71KT+FDjsJvMlAXY8lVWf9tS3z6aZfk/uYAnK7pQQKFXpJ5PYw2dEiZZBriXdQQy+whb9igzOUaGvftDSr5BCmnkemH+ud5TnOY1nt73RTb27oLY2bDpAOz+gWGza9cAhQTPSxe5VW97yVTp7gr5lKtA7OANe3F5++ICsbi9A5NeUYacr4QLng+mPpy6sLOa7uAx1RjbW7mx7mN/ecW3hHYoud+yf4npx+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daezdtzSk3dL5X+hzM0xYfzd+CGl7VI5ey2/HJC8aGU=;
 b=JUc9EYanjStx9esYAaOeuMQaAK82XqyLQVdmnqGbA4GmOn7dW9Q4fcIOXVfD46MnoWoNkgKETHQ4hx9f0YmGo0Dib1gHUUWg71vHzwABnP8Jn77yFaoujlYr1ZiJwSKcBA7WeEqNmFEVhRF84YrZPy5tbTHW8pS0Gp56JCtR78KqxANK1AH+YpwXrP81FL3Sv3Pq5l+CS/9kpCsqPxwGLSFc8X9DZIIf7gC5ieiyVx+Azg1cKIh5PdLxwTCywJvyPR4y8hRQDDixjwDI/VYDpdFM1ZhlrZqoxC1iAplXa4Ih914qYVKMUPCPrtBcjcnYRv6ld+ONPx6IXoTxCj9U5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5893.namprd11.prod.outlook.com (2603:10b6:a03:429::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 16:25:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 16:25:54 +0000
Date: Wed, 10 Apr 2024 16:24:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/guc: Prefer GT oriented asserts in CTB code
Message-ID: <Zha9UMBumnIRk1cK@DUT025-TGLU.fm.intel.com>
References: <20240404193647.759-1-michal.wajdeczko@intel.com>
 <20240404193647.759-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240404193647.759-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5893:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xTut1k5z4ejk/dYrotNzb6++XUYzLB0Wygo9iRavfIYZ3zFr9bLRD3eSW2XfcvwwXgG45eiFBR26f5q6eJsmt6tYW89dUsrtDL+aUhlfOjBuvpwDXYEafWIE2Wtw2tsN2sH0hpu1xWTZQH2Zz5vwwvK1G2I5BInCNd+QGpghHIoZFd9JYy2EvxSPbZnR2Y+9mK3bxhlb8m71vCQzL4kF/aN/+nKo1R1uv4nK7A4FyoOyu5m8tLKRGJBqFMo5qMKVKhSLZyzBwg/xkNQ2wVPa/F9WPovbgQA9IIBIHxYU3B3zVG++hvRf6qZ/FwAIGm3h9WS5eJjiQnlAbWb14NA6WSaxwhU+wxUsXFpw6VruH7Swpn36nSQMEi0XR9N18GPVMznaFWqwY9W7ePsNmG3xAbgNZKeeykxZ16ZrWTvC2mFpTp7lYIVDgtbPxupCdQzAAfLZpEXIO4y4Vp50hC94He/Fhn72InVEdu6RGuHmgVPz8X3301Mf8Kx5em2PzqH+o9ak5mUVNJ0yFAUuNXaIZt53NVt2x/l79roQlUuf+Y43KCRus7xhTufKzIroC6I0VG31r+ToMhTONwAP1DETriGtwQmtlne9FF0Ncu5kkaZYqgc6Tf1RMaj2hyPGqjzinJNR+i/0c6fJPia23y7VQtAJSIBY0zDzIIb4aSm5doA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pIRiyIYgkWYGIO5FE4L5GpbjVdtaDQz9G4jAIJP31Xuo2wYOhLGnVMImHgFa?=
 =?us-ascii?Q?6ggw+yoZRofmMqiSPSOEyT67Ss8t0JwCtjVYzXW9HzUpH3lghftHgK7jubi5?=
 =?us-ascii?Q?kUF+3xdvo1WK+2iDzyniLw25Udl5s81qdFOJEt6aJKW0u6LML7NLcMp4yKwc?=
 =?us-ascii?Q?3q2S/eOSlUYp4MEGxU+SQbZxWLPiONqGMUrECyOc92gr5yaCC+yU+yLfd0jR?=
 =?us-ascii?Q?A05yO9ETlANZxzK6vdRIBof+6IucPdu5sAI4tZfv7wdHr/SKNFIzBBcBe2us?=
 =?us-ascii?Q?WgMjW5u6sqX/qH/jj2DSysFMCbORXVOmBWCsIGIkD5aZpg5qtHvDdG/ht01B?=
 =?us-ascii?Q?434wZ8Zl9tMLRnXMeFwZ4ZnYCn6frTQ1q0OljEZHCkETx1/GCaGUQRDCRwmP?=
 =?us-ascii?Q?6cUNL2SJINLpA7qUc/gxEAqSf+oBTQ7uCtqNf8XMoQvdqtNa0LAmr43Q5TPI?=
 =?us-ascii?Q?n6SK90+8XZyvlPkL10zpdqIruBwG7ZqqEnORxhQIqF53ORPx4jEh4BJeejuj?=
 =?us-ascii?Q?dIWBEHeF+S9TBX8yzexzJ/iG20aRnN+ULCDhx+E+0+lrBKh0NEkyAJ1mFZ7Q?=
 =?us-ascii?Q?vyEwDuyDZIdTGmEGT7GQrArUQo+9LO4RXHcdoYmf1vMrpCU5oJg0X91w+eK6?=
 =?us-ascii?Q?DGIIFkIcDJVro4jV9DfpdkgjJqv/HdTMkswsqICxHdGERllAJaCKrNxkoTi2?=
 =?us-ascii?Q?Wp8UE8pnRHUgyhDoUKuPnm3leswjc453VRpKcBkbO3iJKxisDJpn9kJWmXkP?=
 =?us-ascii?Q?YBry4Asg2hcq7+fVcO9JiWFnVrtnFf+m6M5MBlrbIK4hFVQjnhc8taRzMKVq?=
 =?us-ascii?Q?s8T/oSSxWaPjO+GukUn8f8pKj3Gx/gZVy2p4vDH+LviId8M6VTb4waVcGb4m?=
 =?us-ascii?Q?yxdLE1w605tguRLXnSCUsp8d5foL6ug5czsXPj9MbeVJS3mE1s38BLK8pFh+?=
 =?us-ascii?Q?Bm4iNE+EOGcTkbbbHYwPezJ79+/XfbsUsqbMjwv87OdIBuU6T8JnmsdqpJxu?=
 =?us-ascii?Q?b/ayTf7tbhK5PuviBWo1zkMQdSAlZo0UBDK0sfIIboPR6WVGOfpAXTykBw7p?=
 =?us-ascii?Q?luF0jDhDe/x4A0P4jcPCelaoWZqSfXqRNaa4UbWldLh8YYpvXorhP/7lnH0S?=
 =?us-ascii?Q?vUXB6mgyGXwxhMJ81S4VGlE6skBMHYEGTosB36dB3rtWfUML8TpwmkDucxG1?=
 =?us-ascii?Q?yFDk5pPvOoltSSBg2ZsroHaj78mQEVyqp7kWoX0UUaCIMDC1NUBwOSeqCT0L?=
 =?us-ascii?Q?crpDupSUkZbXkYOqV+A8MhwfKa+jifxr0hy+DDMWEK8gA9tQSCffCWBQWliX?=
 =?us-ascii?Q?BR6wG4eo0g+TGaa66/YnmXM9DM4aFlscP3g4yhBAVkEQ77+9B4Th0engk7Wt?=
 =?us-ascii?Q?PffrAZdev1ZwVLjAF+yE06bGX3e8Mz/7WXxvIrxCSeUb3cPl5sHV4/p2vuNf?=
 =?us-ascii?Q?XxttESETED6qt49xbTv9ziuw+8rST9XBIpjTbqtQA6GaC3dom9Q3Q4OvtWQ2?=
 =?us-ascii?Q?oXHNBYDc6OY2x1UqmY1Pxe9eNzsCaKoNxwcrcPMhxEDd01AfM9MLNxjM10L+?=
 =?us-ascii?Q?rc3lMkaIlCdQ+cWcot4Sh2qNSJxyYZc+dJicTcW4cTo5EpHO/U68ZVsSEYDF?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 730e253f-c4c6-4211-db77-08dc597ae51a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 16:25:54.5498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDn4K8az+wTT9eCEkuD3yPwL4Xn6hpvyepMz1tLjdB/oSQZ2hoLDVc6AzbdpRUpNlWspHlxlGx/950EMb+9Kig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5893
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

On Thu, Apr 04, 2024 at 09:36:46PM +0200, Michal Wajdeczko wrote:
> GuC CTB is related to the GT, so best to use xe_gt_assert().
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 44 +++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 74acc4784a37..06952b0480f7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -144,7 +144,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	struct xe_bo *bo;
>  	int err;
>  
> -	xe_assert(xe, !(guc_ct_size() % PAGE_SIZE));
> +	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
>  
>  	spin_lock_init(&ct->fast_lock);
>  	xa_init(&ct->fence_lookup);
> @@ -171,7 +171,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	if (err)
>  		return err;
>  
> -	xe_assert(xe, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
> +	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>  	ct->state = XE_GUC_CT_STATE_DISABLED;
>  	return 0;
>  }
> @@ -321,7 +321,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	int err;
>  
> -	xe_assert(xe, !xe_guc_ct_enabled(ct));
> +	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
>  
>  	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
>  	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> @@ -428,7 +428,7 @@ static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
>  
>  static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>  {
> -	xe_assert(ct_to_xe(ct), g2h_len <= ct->ctbs.g2h.info.space);
> +	xe_gt_assert(ct_to_gt(ct), g2h_len <= ct->ctbs.g2h.info.space);
>  
>  	if (g2h_len) {
>  		lockdep_assert_held(&ct->fast_lock);
> @@ -441,8 +441,8 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>  static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>  {
>  	lockdep_assert_held(&ct->fast_lock);
> -	xe_assert(ct_to_xe(ct), ct->ctbs.g2h.info.space + g2h_len <=
> -		  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
> +	xe_gt_assert(ct_to_gt(ct), ct->ctbs.g2h.info.space + g2h_len <=
> +		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
>  
>  	ct->ctbs.g2h.info.space += g2h_len;
>  	--ct->g2h_outstanding;
> @@ -461,6 +461,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		     u32 ct_fence_value, bool want_response)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_gt *gt = ct_to_gt(ct);
>  	struct guc_ctb *h2g = &ct->ctbs.h2g;
>  	u32 cmd[H2G_CT_HEADERS];
>  	u32 tail = h2g->info.tail;
> @@ -471,8 +472,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	full_len = len + GUC_CTB_HDR_LEN;
>  
>  	lockdep_assert_held(&ct->lock);
> -	xe_assert(xe, full_len <= GUC_CTB_MSG_MAX_LEN);
> -	xe_assert(xe, tail <= h2g->info.size);
> +	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
> +	xe_gt_assert(gt, tail <= h2g->info.size);
>  
>  	/* Command will wrap, zero fill (NOPs), return and check credits again */
>  	if (tail + full_len > h2g->info.size) {
> @@ -521,7 +522,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	/* Update descriptor */
>  	desc_write(xe, h2g, tail, h2g->info.tail);
>  
> -	trace_xe_guc_ctb_h2g(ct_to_gt(ct)->info.id, *(action - 1), full_len,
> +	trace_xe_guc_ctb_h2g(gt->info.id, *(action - 1), full_len,
>  			     desc_read(xe, h2g, head), h2g->info.tail);
>  
>  	return 0;
> @@ -550,15 +551,15 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  				u32 len, u32 g2h_len, u32 num_g2h,
>  				struct g2h_fence *g2h_fence)
>  {
> -	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
>  	u16 seqno;
>  	int ret;
>  
> -	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
> -	xe_assert(xe, !g2h_len || !g2h_fence);
> -	xe_assert(xe, !num_g2h || !g2h_fence);
> -	xe_assert(xe, !g2h_len || num_g2h);
> -	xe_assert(xe, g2h_len || !num_g2h);
> +	xe_gt_assert(gt, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
> +	xe_gt_assert(gt, !g2h_len || !g2h_fence);
> +	xe_gt_assert(gt, !num_g2h || !g2h_fence);
> +	xe_gt_assert(gt, !g2h_len || num_g2h);
> +	xe_gt_assert(gt, g2h_len || !num_g2h);
>  	lockdep_assert_held(&ct->lock);
>  
>  	if (unlikely(ct->ctbs.h2g.info.broken)) {
> @@ -576,7 +577,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		goto out;
>  	}
>  
> -	xe_assert(xe, xe_guc_ct_enabled(ct));
> +	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>  
>  	if (g2h_fence) {
>  		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
> @@ -639,7 +640,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	unsigned int sleep_period_ms = 1;
>  	int ret;
>  
> -	xe_assert(ct_to_xe(ct), !g2h_len || !g2h_fence);
> +	xe_gt_assert(gt, !g2h_len || !g2h_fence);
>  	lockdep_assert_held(&ct->lock);
>  	xe_device_assert_mem_access(ct_to_xe(ct));
>  
> @@ -709,7 +710,7 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  {
>  	int ret;
>  
> -	xe_assert(ct_to_xe(ct), !g2h_len || !g2h_fence);
> +	xe_gt_assert(ct_to_gt(ct), !g2h_len || !g2h_fence);
>  
>  	mutex_lock(&ct->lock);
>  	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> @@ -901,7 +902,6 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt =  ct_to_gt(ct);
> -	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *hxg = msg_to_hxg(msg);
>  	u32 hxg_len = msg_len_to_hxg_len(len);
>  	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, msg[0]);
> @@ -939,7 +939,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		return 0;
>  	}
>  
> -	xe_assert(xe, fence == g2h_fence->seqno);
> +	xe_gt_assert(gt, fence == g2h_fence->seqno);
>  
>  	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>  		g2h_fence->fail = true;
> @@ -1087,7 +1087,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	u32 action;
>  	u32 *hxg;
>  
> -	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
> +	xe_gt_assert(gt, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
>  	lockdep_assert_held(&ct->fast_lock);
>  
>  	if (ct->state == XE_GUC_CT_STATE_DISABLED)
> @@ -1099,7 +1099,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	if (g2h->info.broken)
>  		return -EPIPE;
>  
> -	xe_assert(xe, xe_guc_ct_enabled(ct));
> +	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>  
>  	/* Calculate DW available to read */
>  	tail = desc_read(xe, g2h, tail);
> -- 
> 2.43.0
> 
