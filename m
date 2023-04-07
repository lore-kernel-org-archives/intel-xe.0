Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8A3C76196
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 23:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB9F10ED48;
	Fri,  7 Apr 2023 23:46:29 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E514110ED48
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 23:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680911186; x=1712447186;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=igiW2yTWdJCaD6F+gnqIMkADL4Kx1s3jWka+efoeSfs=;
 b=lBBk2+T4CJtNjNZY12Fw7CEeVT4JTn6Y+bJFaAw/J7+eRnfeljRsnhHd
 riPRHQ251g4FjAgLtoCwaxuvB6xxVTqIcL2p32Zeq8lropr3+SfYnnGFH
 ESt3zslqLjoNgnuofspUva1EqofaCBgec+C7NZr0m/SgAoLsyOOojH7IL
 YOjvf6i7A3xkkZY4ZA7WJHTnNx7SYKw2KDCakixqeGEUQeEXZG3lsjmuV
 eQtCyqcDPwrHJF8NfgJCHomtdyQ4yAcuDQnWJ0xwJ3lh13hU43gRhraOA
 uAqBx0Bh+cDTYxqW7HsZsrJf/VMxjehZEuanPqxScfLFsag5JQMb+908E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341838721"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; d="scan'208";a="341838721"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 16:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="752172602"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; d="scan'208";a="752172602"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 07 Apr 2023 16:46:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 16:46:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 16:46:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 16:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WI211dnVfbpKCiOX/JtnnHPwNwXC+oLVtUNMV/v0FSc26ZKefJoRwmaL30aFNolfmjZkdNKA3EFDlh0QWTR/cbRQ9hlsLFC3aLpuWMK6rz4ccKM+UyRk6n+W2ZxQMeytrHQBNmxJ3NC+aeobs9VEWuy8FwkGa2fMtAtVPLF1jW8uveDV9u6O7pL5HOkt+8oTiz0qpGDM40rHoOvDQ0DH1FF5gA63nHZUG9HdgfvMXoMv6ZbB8fAOgBm02Yagf88MYO3YepFVPNDbBET5NpeJgopN3B5qxhPQh6LqetQOc2TxySYu0QfundWPJtpiCOmkkLgCfJkV/njnmCUiwjNPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nf4cWrxSJf2G2U9fLkGpeHO0AbDZR0n+KHL5ECQLUFY=;
 b=c5sB7HJjsszU6WWB8of73lYgw1XRvFWoLRagmUr8LZaxsqV32UD9/NqqCfmLy/hflLnQzrXJVqIZWEN+iE4k39UsUM0rRCPY9E/NN4AErR9MX0erN8aM7NA+jwtSphRba1PFiVqFNAFyUO8BahOzzE0EfVaMFi9Oqx5do96fvF4UjGPOs/BtPelJIyzq9fEADmvPundqNIKn9f1vCcd/6Rh0d8gc/05c7WLPK1d4eyeoVMj+pTxvUKtGfufKrQhJLjaux/1qj3HPeYU7fiiNgA5mGMDX+Nri5ZGX6eyCGRWA1oWp2RU6qOBHp3/jMnASAWMZUGYYvC14X4mfZ4QVug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6673.namprd11.prod.outlook.com (2603:10b6:510:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 23:46:01 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6277.033; Fri, 7 Apr 2023
 23:46:01 +0000
Date: Fri, 7 Apr 2023 16:45:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230407234558.GS4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230407211231.10137-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230407211231.10137-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY5PR17CA0014.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b30e8c-d2b3-4941-b978-08db37c23e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YkXPd/dU4BZDLZvQrPgv1IplFDpQiaNZXhuTm4KMkxZAFUFJVwLGKirhyFbAmqKCPLRSDwkW6z6q99WgYCk0W/CFePj9eIQDv063hQqzKvmlnRrseu71kDrLdDvEauGn8vROY/BrrOVfqgfn/wGBoDPgPMoxN5GK7UwOXyZrPmtkq+jh++zx9L+NxF3AUW+VCtwlySK+FwoS4NGL+8I7H0FDbYd1D+qsd2nj2anC7OwaMALDAyAbXHBPREaIn9Ka1Hd2dvDElgYZR0U6SbXbIs6cYtQAZ7HgrumXl/RABct2BTZQXM8pRVkIpEUn4J2XiPn2iZ7B3RB6NFlSRMc6qaebgzvkZ7kYNwu8Ba+0F9C98M35Fsnulo22V4Yibx4z5UO+BDu0Fx+jjhqsN02Mn8xL0PtaH+E90nFcxuCDgn7mLVPOB9gAIC7qmKU9pW9fiXupV8/JND0ABRW+EwVu8Ey0wWorwDRUKQvh7Nq8nWD4jCLX7I1lZNl4jLuzfVXLF1FD0MX9l2WbxYENiQIvxdpFxcEm1QDbhbOxK0gm0ymQ+Ce6JKMwPIgLCP2B8Upd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(41300700001)(8676002)(4326008)(66476007)(82960400001)(66556008)(316002)(2906002)(38100700002)(5660300002)(83380400001)(8936002)(6862004)(6666004)(26005)(6512007)(186003)(1076003)(6506007)(6486002)(478600001)(66946007)(6636002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4IC76hH7UcKUPorrGgmfRH+bNq391vrw9968taIUVUEaQ8bv78jKBRd9ncHK?=
 =?us-ascii?Q?b90USaGTkgEGn3XHiiKrey/rYzgw9kjLrFw2jei7MdXQgMOX1yfJNMuC9JzS?=
 =?us-ascii?Q?UZ/3I6j+vuAQNa6dgrWz1cOuxrWw5GUdtm5nN8h3/wi4TEHby56ABGN3dBl5?=
 =?us-ascii?Q?cReXyMUHY2aols9CQ6J/bNQBMsRIXz3DEPRDNg8iYagXTFCOm7YSGYh8ZsAd?=
 =?us-ascii?Q?XWxv3Pi4h+zcTL9k0ZkdC8e2hLKXxjJ2lPEsQw/DSmwSmW4vdxHyJxJWpH7Z?=
 =?us-ascii?Q?39tWYaIMi8e/eJeBoSl4BzhFq1crw0H1SeU48VX81uZakZ6v3z/ebFZHNZ5L?=
 =?us-ascii?Q?QxKAQhQDc8aOnzJdnkTCV1kJA/0yCUvcS/qcZad38c6dw+6aL4mD/i6C3CN8?=
 =?us-ascii?Q?8Ui3IQP4uWkhSSBf2+La52TA9NU6muZcNFq+ZLejy/GARifwZikL35wXJdVN?=
 =?us-ascii?Q?cMcX8AA1r6yZ7u9CLttekX35N9aPoCkphu6Ku3tl7CSy3sBXgl+TNFLYaBsZ?=
 =?us-ascii?Q?dTJ0IUzae96u7+e61qmLUT2ocJtYTci5ROvVHBXwdQUO71+g/S53z8ud96uP?=
 =?us-ascii?Q?EyWYGPFYNRtvR7NLYev+CyO+4uVUuidpqpUwO6YgCWygN1ADvEUfiUOMRzKo?=
 =?us-ascii?Q?erV/V++u/tsE3tXYTCGyLHsQ4vwtxDxwpULJvjio6eZJ5KI3CFiLyjG3NuAY?=
 =?us-ascii?Q?B25JT2pnQcWEh+ONWnTHp9bD2xvTEgRgI8DM3pJVP3v2A4xzokLsloLTFsey?=
 =?us-ascii?Q?kD9HvoFt2fFVjNf1YvmUd2NtzkEu2pTh0BT4i2hLx2FyI8uUNXrhzrMbNytz?=
 =?us-ascii?Q?J6G6tsS4pqPdbOAC2iDMlWSzbJdoM2KHLdwhzbs7Vn7uQW1bS32+fTu0eG0m?=
 =?us-ascii?Q?BQPM8ckArNhg/VO04M06/G4dBsrB3M8Vt4WLvySIdERlmgueas8yCghSeL2e?=
 =?us-ascii?Q?CK76P1AEf6Mm8wCcTGGB2FZxj58xHDp/yBqD9MWG6O4zHxg27G1v0QjTB7+Q?=
 =?us-ascii?Q?5SwFi5pDKwNIhGbZMSyi3mD4tk7dIp+mG37cpMUi+9q7/w8g/4gZwgxWpOBx?=
 =?us-ascii?Q?XtZ+TmxIKN8IqTvwsUmyNzkrp17mp+TM4KaJu6TG7JIDJ2zTNvTy9uoG5lyB?=
 =?us-ascii?Q?WNc6k8iKf3nCfxhfdeoKRRLwTjizAcic3xhxrKGwlznmw+95Ri+K2jzBC64x?=
 =?us-ascii?Q?yuWjaqWGcdGeGVi3J/Aqb1Qx52vy/l1+PZTjNTCYl0LReAfVxkAHvMNyGwZ4?=
 =?us-ascii?Q?3fdnQq0ZcKVjhBVxW+TZ1L6X+TfG42ISYC0+9xyQPGht76qOmTn8chP3czUl?=
 =?us-ascii?Q?5wFfQ0fbIoJ4wTCUCRrfbacEX+uvjFtEMXDxpg/Qjf1HbUdTcacxkTWZllFN?=
 =?us-ascii?Q?q0CqtSuhkipZ1q+BGu26HMKIvDnb3M/fabQw1nzcAze/SrsQiLeF7WAwAsKF?=
 =?us-ascii?Q?RnG3PMC/zUaRJVP2WJjtSRtwQXTj0A5qf54YIUlvF8Hj7SAfwBdXk70Qq2IE?=
 =?us-ascii?Q?4LI7T9PmwZuJo+979UP1KpPxFKVVth9Y1/OMDbqSVfNhExPJIILAyQaXoDEN?=
 =?us-ascii?Q?h0fMXqrLOmIwnhXZW1Bf8SEm6cYIUJg7bLlis3EI2dt2aWPDGbZEL9l661en?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b30e8c-d2b3-4941-b978-08db37c23e3b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 23:46:01.1848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2cHhn2ZCtaN5Mg2JLcazJhkxajYqOt8kbhoJD4P6GMWtpai6zwDMmRyiwQLnb4fMyj2nWg00tJMJ8g6cBpjW1Vp6GIKKKnqIMfquDgRbsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6673
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix memory use after free
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

On Fri, Apr 07, 2023 at 02:12:31PM -0700, Niranjana Vishwanathapura wrote:
> The wait_event_timeout() on g2h_fence.wq which is declared on
> stack can return before the wake_up() gets called, resulting in a
> stack out of bound access when wake_up() accesses the g2h_fene.wq.
> 
> Do not declare g2h_fence related wait_queue_head_t on stack.
> 
> Fixes the below KASAN BUG and associated kernel crashes.
> 
> BUG: KASAN: stack-out-of-bounds in do_raw_spin_lock+0x6f/0x1e0
> Read of size 4 at addr ffff88826252f4ac by task kworker/u128:5/467
> 
> CPU: 25 PID: 467 Comm: kworker/u128:5 Tainted: G  U 6.3.0-rc4-xe #1
> Workqueue: events_unbound g2h_worker_func [xe]
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x64/0xb0
>  print_report+0xc2/0x600
>  kasan_report+0x96/0xc0
>  do_raw_spin_lock+0x6f/0x1e0
>  _raw_spin_lock_irqsave+0x47/0x60
>  __wake_up_common_lock+0xc0/0x150
>  dequeue_one_g2h+0x20f/0x6a0 [xe]
>  g2h_worker_func+0xa9/0x180 [xe]
>  process_one_work+0x527/0x990
>  worker_thread+0x2d1/0x640
>  kthread+0x174/0x1b0
>  ret_from_fork+0x29/0x50
>  </TASK>
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Tested-by: Matt Roper <matthew.d.roper@intel.com>

Seems to solve the occasional NULL derefs I was seeing on ~2.5% of my
driver load attempts.


Matt

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 7 +++----
>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 ++
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5e00b75d3ca2..9055ff133a7c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -23,7 +23,6 @@
>  
>  /* Used when a CT send wants to block and / or receive data */
>  struct g2h_fence {
> -	wait_queue_head_t wq;
>  	u32 *response_buffer;
>  	u32 seqno;
>  	u16 response_len;
> @@ -142,6 +141,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	ct->fence_context = dma_fence_context_alloc(1);
>  	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>  	init_waitqueue_head(&ct->wq);
> +	init_waitqueue_head(&ct->g2h_fence_wq);
>  
>  	primelockdep(ct);
>  
> @@ -484,7 +484,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  			void *ptr;
>  
>  			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
> -			init_waitqueue_head(&g2h_fence->wq);
>  			ptr = xa_store(&ct->fence_lookup,
>  				       g2h_fence->seqno,
>  				       g2h_fence, GFP_ATOMIC);
> @@ -709,7 +708,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		return ret;
>  	}
>  
> -	ret = wait_event_timeout(g2h_fence.wq, g2h_fence.done, HZ);
> +	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>  	if (!ret) {
>  		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
>  			g2h_fence.seqno, action[0]);
> @@ -801,7 +800,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	g2h_fence->done = true;
>  	smp_mb();
>  
> -	wake_up(&g2h_fence->wq);
> +	wake_up_all(&ct->g2h_fence_wq);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index e0f9063e9b65..fd27dacf00c5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -74,6 +74,8 @@ struct xe_guc_ct {
>  	struct xarray fence_lookup;
>  	/** @wq: wait queue used for reliable CT sends and freeing G2H credits */
>  	wait_queue_head_t wq;
> +	/** @g2h_fence_wq: wait queue used for G2H fencing */
> +	wait_queue_head_t g2h_fence_wq;
>  #ifdef XE_GUC_CT_SELFTEST
>  	/** @suppress_irq_handler: force flow control to sender */
>  	bool suppress_irq_handler;
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
