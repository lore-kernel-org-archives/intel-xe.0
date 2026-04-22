Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0366F94CBC
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 02:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E60410E10F;
	Wed, 22 Apr 2026 02:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilOzwOjx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4638810E10F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 02:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776825661; x=1808361661;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uoGS0SIytRLeREZzbVDLudlDEIzgyk37Bk0eyuDo0Cw=;
 b=ilOzwOjxJ35ButC8AlJu+ZDHlsBklHIoGkFZgNBXKmffns1zL9VwiGPe
 wuWRxrKYYDjo65zj+ry80LqFys+LVPdw2hueUfXESTvAFPZYJ4cNn4CIJ
 Wvu8uaBCIbk5r6sIU6hHBSNGSqNeJZOJl95ISpILCE69gLshGZOIGaopB
 3H68e+ZmXGhT8t/rK4+3mhrAVwkpstxoOO5TiBmcePpTjW1bxJlo3WbJK
 VDnrfF3H3yESGnQPTj/w0PYpAYgnjTuSoknwfRRDZ+quSTYiCjpKxgIJc
 e0m1pJZQuZ7HKWny1lOMdM6uAYjxgPNvmTht2uoe3e7kV+GcWGAHbSrc+ A==;
X-CSE-ConnectionGUID: 7jrVMPjpTQ2txafqpYlzGw==
X-CSE-MsgGUID: Gwww7zGqT7m69uzTcy0SrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77646841"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="77646841"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 19:41:00 -0700
X-CSE-ConnectionGUID: 1FyA/FyhSdCNfZaZqOAOQg==
X-CSE-MsgGUID: 1xbtyr+NSCqNR9+YrRX6Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="231333389"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 19:40:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 19:40:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 19:40:59 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 19:40:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATsDmU6vAAizGZejcQuGf/NuyNo6N+ZUO2PB8BaprkQfxaNEuxIsz07gQbTQxETjZHiop/vEN2YtPMAQUVAGOujLd3oO6cGJDhV0e46ENnLMPmXB5YIjBnCZE7bqomT6nNZRD1gAlQZ9pe1BGbB6OcqgVqIRDLQN6tWNagpSXnrTU8s0d6ciCWPjWmJl6Yj+eeRdDZEM6qv8cnMk+Ock7xkt3zGRvL1aQ6MhS1753a0vv+tnPNJr3loSfLlSY1dXx2gf79UHYAcyyqumvo0sZ9gblBbL8GXtHE4JRV/tH0OO2h+029PF3tjSZoyNlaegi+/RdDLJdkYhmPptnk948Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yahoOeXCq0KEMIfPIrdrE8wLeSGO28WhkJLx5ezasvg=;
 b=lC1H4vXY4Jz+mWeNVfiilHvCFf4421RJQfHKX2kTYW+3vJJQmf+qh3lcgAk9ni8KgLzLQw3E0DWlIMDE/Q3+9hMaLvNXuVcJj7NI/bB1CwLQvAf0OawF8py2xZriwWA1dPW98E/YwqGHVaOWb10ILlKfQlLICsyXaB3yUrf3GvxopWThRc54K3GQwxI7Y849KKkvWnuUJto2MivHJH+V8lWsOmPbUoIvsqbMZLxpO3WfamEAjwrF9tdLfc6o5/vzvhTE7Svs1o/M98UeVdhVnqjW6OLQNTtM3uT30JIWNyLv3fc1cWV9U+OxpO2eegVlQGic5lolSpmtp0ANxM54hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB9750.namprd11.prod.outlook.com (2603:10b6:510:397::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 02:40:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 02:40:57 +0000
Date: Tue, 21 Apr 2026 19:40:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Roper Matthew D <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Message-ID: <aeg1NgXPg+y8E7Ho@gsse-cloud1.jf.intel.com>
References: <20260418000349.1398567-1-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260418000349.1398567-1-fei.yang@intel.com>
X-ClientProxiedBy: MW4PR04CA0153.namprd04.prod.outlook.com
 (2603:10b6:303:85::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB9750:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ec2972-cd15-4b66-8059-08dea01894c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: CAYjhC/yrX8RKE2y5SMyngCt8zHDQBFOeD1TGsDYsV/Wry6rvXLBwx8Ycujk+ScHTkqZbIrjSzxJD1DCyYyLtPq15t1Px1Xua1upW1x4zYSPkMuZR2oF4mmAigIjXfNNbOnM/VVwZyxttTrTBRbxkKJ1y89HXVg4MQlqxF1bZMO4lq7rcTzozfceWnDYCREISlAJtRuwwAgG7yU0dFSvr1pbMZ+I7+06Yb4wmt48yRC6aJH0pPia5haEhC0081YtjOOTf6gTTEL2SwS5LvWBeqQBJQ/oaWrEUEwjKqNm0P1n/rGZYSUBmOePiKU9TyvEhSzoxNd4iYAv//PgAqFcajXCJF2reaKdWgrnQph8bo0lCcxJrJRavlHKOyyyPeMRxFgHJUG5DWtJFruEG/wFFUfz2K/a4Ven8c5fhSVakZlfhrlUWnZVd/lSBqr9aD0rA0Ey5nWV1Kt0DcxHI1UAe/EaU3FjUtM1QvZtNPom6M/hwBsiDQslzaCJ2QdxZa1InnSn0GorKzdpLOi+oDlb6GoPY5FvFxdmRN+MWPcBa6GOAW51MxwvoREdZCnPrVe85AJSIpcjizsVn3t3zm7YXPABBdZ0BXm0rjA0gTT4fSjJGd38sfIJ2wlczzV0SKcLNAP9j9Lp+ygSuvkcQiKGb1kiJj3dp7bKPw1yhWTOyd7CvewgV6acFWjGQHKYr3Fl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3bdLwx9R28XEGRAKoDcn8Ggrf6PfM/AhY7SUy8z4a3LxkpwB5pElGZkV9Xyr?=
 =?us-ascii?Q?0zcc5uWksMotBfn/HtaFpsMKTVXXrCPRVuVmV0ON62fV9Z+4mLnlLkPvv+vk?=
 =?us-ascii?Q?ri9MZaCOoxH4Pv2yRmkNbNwMzgtVmQ9Gf9g6/UZ5a+yMQP0OnhIaWEZw5OoL?=
 =?us-ascii?Q?qrnIz1PVx7f6X2TU1w7lVjeFOoKYk+73wMjG5sG+ZykVLQjh/Xtz7drIlJDG?=
 =?us-ascii?Q?K3CN5FBWHazhHPWT4XHGe5BRq135g6G9+hzX7I0EPArztCMy3aFbdI6glA6I?=
 =?us-ascii?Q?VgSkYymik6Oqoyidt5SYkwHYSqJT4zmQIm/C+1BxhYdO3Nh60quZLY/TdaAZ?=
 =?us-ascii?Q?Vqybz+SmT5eHd0MvU1nYnCQd/leMkXzgI/bwuGHaJNPJuWp8eQTzBEzhD3mi?=
 =?us-ascii?Q?t7Y//3VNYYTN5679Nz2kQY8Iyat9s2l5a+1ETGuMhTTOxzBTpghvGKbGOirM?=
 =?us-ascii?Q?jYj80Dy6CKYnQqNNbMILm2zqUqJErIuk0lPfDkwxZKdvsXx3sJ1IZwXv+575?=
 =?us-ascii?Q?TP5lLJ1JlIl4BANYASQZYfwWmSfOwG7EhXd3Lr4UiNOQbNu4N5fHxLGJG4Qb?=
 =?us-ascii?Q?0MNnOriliIeQnVFe0mHYem7X80Q/zT5z3Wk/Fo58JzrhLwych9lB9r+qy4k2?=
 =?us-ascii?Q?S1XOw2W3BaPx0hABpZmJUvTUjV0R+llOGJiNMfayZc3Kd+rYAS5BrRJ+X26u?=
 =?us-ascii?Q?TWUxuhFZhXnC2DPzuuX5KSzivNjv/0YuzJtli3Uls+GwUp6uyqbIfTCX4cNA?=
 =?us-ascii?Q?CDomn3r1N+M4OS3mR3a8U8blEC+L0ghcCWCx4X64Dah+IIsNaLA8h5Fyrm3z?=
 =?us-ascii?Q?eWCFhBhpuXALTTsX6bbxiXN9x7Wd3Ozyoeu/DS37WwkxcUujKzFAIB6WkRe8?=
 =?us-ascii?Q?dinf3kNv6hTdVuSUVQ7GSaKZEwBurdseWzbiPmoMz1kwdTMxIbt9UnfYpC03?=
 =?us-ascii?Q?Mqy8w8xeebK1YaqNK3mTJpWWfXV285OvZU4THrdUeGsCfqf8PIDs+tJw+vkb?=
 =?us-ascii?Q?Sa77+9d5hujWZxdjw+/mtGLO9BQtZwGMXnLNJsBJq4YNuVjIhHjGzNI2fgE4?=
 =?us-ascii?Q?ezRfRtaTqZLKKgQjDf9NX2npRk19/OjF4tNeVl0lvMghwuN7SrV3GooCu0V5?=
 =?us-ascii?Q?/bLKxk/8BoWYmQ18Y+MckjN46sERaKzOKm/0rXAFr3NvrD07KOLDhp6F0D7c?=
 =?us-ascii?Q?/handig+nG/Qb6NX5OSIMfV7NgWKAIgIDfHp0xT/ixCaPRran49FWTyi28kK?=
 =?us-ascii?Q?4LZl4UIDtBloSuQSOb/v5ZY25a9LqbXZq7YgDoil/IXEOQ3FXBJIjtTOia8y?=
 =?us-ascii?Q?X7WCpYxRYmbvTM+ukiwYRC/q9QjmRKll0mrj/80svrmRFO2ckhJVJtaWBNhk?=
 =?us-ascii?Q?qHIk9GFC45Yd3T268lGYhgd3jZqxKfYS1i8oAFqD9NkNrH98qFbJbD9WDWHo?=
 =?us-ascii?Q?yaKcj+FzF/lzQCUES+h2+hft+tIZP14irdtmaqoE3ZWn3tShl0g41eUs7rbt?=
 =?us-ascii?Q?ygGF1Rf7JQJqT8BsE9ZBqdlxh586MhJt90C6NRtrF5e7Qvf8KtZbY6sfwzYB?=
 =?us-ascii?Q?YyS94hGWTvgVpEfndANQEWOhV+UPgwWFzH+ffzujmWOSxbu7zTA5WHIy2wT2?=
 =?us-ascii?Q?Ez13z02NaSsl3HAC5aP+oBZxYj8DxzvRJ96/0TO7EthI+3FN/P3lamCt3ta9?=
 =?us-ascii?Q?V0S0j/7V7SgnfvjVLADzg3WTIYlI7tm7lAZgrPwc5ZOhIvIOcu/Yxq2rvN5m?=
 =?us-ascii?Q?Rkx6TRTeYA=3D=3D?=
X-Exchange-RoutingPolicyChecked: IouvsGTNAGFh59Rke000nanYmxuCh20LOu/37Wm9xcWghK0EyXpGeulcMgDnrnyh78vE79mztwmT9QGV1jA9mUbvwpNQWdrTpd7/bNpCLqaSp2ymvtWxheODyCHoXUlTQeAvX8RvVOTIS2lU6CnxcLEIoi2ZAX7o/kH47QFxnoxLxfK6oFTZjW4vA5Qjq2xKsY83c6xuhtJtYch9o9aRM48mLMS5IuvQkjQhGhVlryZ/XY/08ZSdCRl1idHVsMRHz/0rAQia4sNRCsx4DVHoGj3YNAhVeI9p+IPv85Apj5sJpdHauza4WZKm1HjpOuj6G2OaM0x8GiYRPciwE+Snfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ec2972-cd15-4b66-8059-08dea01894c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 02:40:57.1874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LK/tQZAocTSyu0qAIzpt3/eYQ64h6YlPcHvQBcTYHuxcVIx/V7Zh3ZihJ2/pACTuSiDnpl2tE6MoAiMKHvMzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9750
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

On Fri, Apr 17, 2026 at 05:03:49PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Hardware requires the software to poll the valid bit and make sure
> it's cleared before issuing a new TLB invalidation request.
> We also need to avoid racing against GuC on TLB invalidations. In
> order to achieve that, add a mutex to serialize TLB invalidation
> request, and whenever KMD initiates TLB invalidation, make sure
> we poll for the clearance of the valid bit before and after issuing
> TLB invalidation request.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Roper Matthew D <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c            |  8 +++-
>  drivers/gpu/drm/xe/xe_gt_types.h      |  7 +++
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 63 +++++++++++++++++++++++++--
>  3 files changed, 73 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 8a31c963c372..186b1c10334b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -486,15 +486,16 @@ static void wa_14026539277(struct xe_gt *gt)
>  
>  int xe_gt_init_early(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	if (IS_SRIOV_PF(gt_to_xe(gt))) {
> +	if (IS_SRIOV_PF(xe)) {
>  		err = xe_gt_sriov_pf_init_early(gt);
>  		if (err)
>  			return err;
>  	}
>  
> -	if (IS_SRIOV_VF(gt_to_xe(gt))) {
> +	if (IS_SRIOV_VF(xe)) {
>  		err = xe_gt_sriov_vf_init_early(gt);
>  		if (err)
>  			return err;
> @@ -514,6 +515,9 @@ int xe_gt_init_early(struct xe_gt *gt)
>  
>  	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>  	spin_lock_init(&gt->global_invl_lock);
> +	err = drmm_mutex_init(&xe->drm, &gt->ggtt_tlb_invl_lock);
> +	if (err)
> +		return err;
>  
>  	err = xe_gt_tlb_inval_init_early(gt);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7351aadd238e..3dd07d75d195 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -324,6 +324,13 @@ struct xe_gt {
>  	 */
>  	spinlock_t global_invl_lock;
>  
> +	/**
> +	 * @ggtt_tlb_invl_lock: prevents back to back TLB invalidation
> +	 *    by serializing TLB invalidation requests with polling for
> +	 *    the valid bit enforced in between
> +	 */
> +	struct mutex ggtt_tlb_invl_lock;
> +
>  	/** @wa_active: keep track of active workarounds */
>  	struct {
>  		/** @wa_active.gt: bitmap with active GT workarounds */
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index ced58f46f846..2062f990e9de 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -63,7 +63,9 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  	struct xe_guc *guc = tlb_inval->private;
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_device *xe = guc_to_xe(guc);
> +	int ret = -ECANCELED;
>  
> +	mutex_lock(&gt->ggtt_tlb_invl_lock);

We already have a ggtt mutex and TLB invalidation mutex held here, this
is not the part of the code which needs extra protection.

>  	/*
>  	 * Returning -ECANCELED in this function is squashed at the caller and
>  	 * signals waiters.
> @@ -76,26 +78,81 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  			MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
>  		};
>  
> -		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
> +		ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
> +		goto out;
>  	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
>  		struct xe_mmio *mmio = &gt->mmio;
>  
>  		if (IS_SRIOV_VF(xe))
> -			return -ECANCELED;
> +			goto out;
> +
> +		/*
> +		 * If there are pending GuC TLB invalidation requests
> +		 * KMD requests should be avoided
> +		 */
> +		if (!list_empty(&gt->tlb_inval.pending_fences))
> +			goto out;

The above is not safe without tlb_inval->pending_lock. This should also
be moved into xe_tlb_inval layer function.

>  
>  		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {

The MMIO access does need protection. In practice, we already have
locking via the GGTT lock, and this is currently the only place where we
program these MMIO registers in the KMD. However, what happens if we
need to program the GAM port somewhere else in the future?

This is why I think the MMIO code should be broken out into a gam_port
component with its own locking around MMIO access. i.e., A much-simplified
version of xe_gam_port.c in [1]. It may be a bit overkill, but it would
provide a clean, reusable layer, and with clear ownership of the MMIO
port.

Matt

[1] https://patchwork.freedesktop.org/patch/707237/?series=162171&rev=1

> +			/*
> +			 * In case of any failure causing CT to be disabled,
> +			 * KMD needs to make sure there is no pending TLB
> +			 * invalidation issued by GuC before sending more TLB
> +			 * request through mmio. Wait 1-second for the valid
> +			 * bit to be cleared, otherwise cancel the request.
> +			 */
> +			ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0,
> +					     PVC_GUC_TLB_INV_DESC0_VALID,
> +					     0, 1000 * USEC_PER_MSEC, NULL, true);
> +			if (ret) {
> +				ret = -ECANCELED;
> +				drm_dbg(&xe->drm, "Pending TLB INV not completed\n");
> +				goto out;
> +			}
> +
>  			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
>  					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
>  			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
>  					PVC_GUC_TLB_INV_DESC0_VALID);
> +
> +			/*
> +			 * In case the CT is recovered, make sure there is no
> +			 * pending TLB invalidation request before GuC takes over
> +			 */
> +			ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0,
> +					     PVC_GUC_TLB_INV_DESC0_VALID,
> +					     0, 1000 * USEC_PER_MSEC, NULL, true);
> +			if (ret)
> +				drm_dbg(&xe->drm, "TLB INV not completed\n");
> +			ret = -ECANCELED;
>  		} else {
> +			/* See comments in the if clause above */
> +			ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR,
> +					     GUC_TLB_INV_CR_INVALIDATE,
> +					     0, 1000 * USEC_PER_MSEC, NULL, true);
> +			if (ret) {
> +				ret = -ECANCELED;
> +				drm_dbg(&xe->drm, "Pending TLB INV not completed\n");
> +				goto out;
> +			}
> +
>  			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
>  					GUC_TLB_INV_CR_INVALIDATE);
> +
> +			/* See comments in the if clause above */
> +			ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR,
> +					     GUC_TLB_INV_CR_INVALIDATE,
> +					     0, 1000 * USEC_PER_MSEC, NULL, true);
> +			if (ret)
> +				drm_dbg(&xe->drm, "TLB INV not completed\n");
> +			ret = -ECANCELED;
>  		}
>  	}
>  
> -	return -ECANCELED;
> +out:
> +	mutex_unlock(&gt->ggtt_tlb_invl_lock);
> +	return ret;
>  }
>  
>  static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> -- 
> 2.43.0
> 
