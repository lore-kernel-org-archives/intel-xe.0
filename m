Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE40C05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 19:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244CD10E0C9;
	Fri,  3 Feb 2023 19:56:23 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E2B10E0C9
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 19:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675454181; x=1706990181;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=cwSI2g4LG7jR+tbwiwXjWu7qQ0QRlhK77xTFrIB5pEE=;
 b=eIeI6fBSKKs+8+/LoZrlBZfXMOf05cY/a8brPxLHj+mn4Z3WDmDXeUxd
 0lVWsiK3lvxwKWkvQZWYgGnhkG+gkxmJVivsqF1825aAbAc6vXc0mTPOQ
 hAnYCTNMyjk/Hm+230VXEN6ymxb8YGoMhSBgxrIId0DAkEVa/zO5clYjO
 NqqhXRgOuUC+oY0X9+oW7Omc2uWzWJ8pAKAHh+x61ouMA1n+vkVlvYUq3
 F9T2BBYzo55DSTJrrGyfoClpYN9KHWK3CvA8tDGsLMdPdnpH8N+v729iR
 /rjw6FWn4fqp3p1WpN7TX/NsTn6Q14p1Rm//yvEIej3ujGxLRV9B9j1xU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330129956"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="330129956"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 11:56:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="615813776"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="615813776"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 03 Feb 2023 11:56:17 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 11:56:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 11:56:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 11:56:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 11:56:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZyi7tCILPAXiVyB//H/MGve0snJiBJaGcLf/rTr/aq+HsItAqVQymORbdD/eREZfsbpb7bbA1lQqEcC9tSeE7ly/1JG9wayD65fMXbF7K1m9dhlDXLDILsxdeSD2PkHImyIoYBaX8ACZFdCB0dmitv+u3hitmf4ONSvGaJjrezDygPMfLKcFYBtM+Ze59gi+UV6anzjSn46G5Kioo4CtJBdgxl+ZGH6XGzoqGblMvA2D9ms/FKFfqj/TYgz0Sqcy06A93XS40WcJ8kzuzHSJwCjGUTXhI092XOkfAkzq4Vedh4dkilO1/i1tUTB8ZjuBaEH7cf/baZw4GXZ8zlp4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xKbT4Pjffxuw1cH2NLHZl2kfhG8a0F80FZJrOc/Xt4=;
 b=hGW9dM2nK7hMVQCx31tdZReeVK4MVaWLaUIfLuzOSBoJgB8q00lJSedjFv5yi1VBokNVqOvYS1ddU0BiVS5rCAE0mF9d80y05CBmQM3YpEd0ghXGp/5l3jTt/y1wUZH+iZzi3fZ5iY7Ex1QfqFagWMwKyLiLRyPSMbuK7ACGiKpCPqLyt9r2BMGizK1oD3VeA5dSzDMIFWkidFnLJtivJaBNShFLt3Ei2tAODHoc3wT0zvBoUSfV3cVIeVR5pbnRRZTPxdDKlKVbqkzHw48I0gZSOASKxRxZY7dhiznoUvTdRoos5M/byz0SStf3AzzAjb0axu1RC4bigNIWExMWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.23; Fri, 3 Feb
 2023 19:56:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 19:56:12 +0000
Date: Fri, 3 Feb 2023 14:56:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <philippe.lecluse@intel.com>,
 <mchehab@kernel.org>
Message-ID: <Y91m2FDhTmRIPcRf@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-28-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230112222538.2000142-28-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR11CA0096.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 49e6a26b-870a-4ec8-448e-08db0620b37f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u190Pj8mGVoyUN7R9QsCUM9f9dUmpw6PgZsExd+nnJA8I1/80T31DfUd3/fW8V1YYOg8rXBvreAVsgjwvXz3KYP/H6lkCnFY3pw5sPv3wtMk3jwLB7o3nzdqH0ZH/tgqh9lw1XuDRbNMZxR9ZwRYH8KZc7DkZOpuacZuSCAvZuxMkd+XK5lmdxX7PBbLCkAA9A4Y6m4G2eGKnI1k96YZK3sv+alOLWX1xh10cTk42dZOZ+4CG0F7EHxdsBr1mIWIzL1EU7+Fg36Lb+/oFJdBCZs0niWRwkUTlGG6IfeH8+VGpv44KFmyoCRaQ6fDPSIaMV3bjq4fw25KF8me3aGxvF4tEEp+DLfhjc+oRV8h1NS7a1YlVWoMDyD+ptv2F+5NKX0BEcuzUiv3FwdhqrIkcKHNUU1i3umv/bkA9ybnFJd12G+/OAHjfTXvxV2XKULne+flmrg00DhRBGCNZLLwIeEapXLZBkPxEHQTW59MDku+PQ2T3dMwsjbxqLJB+DYI4GhenIzTRwflRs7/vPcipkFLpWs1vR0UGQC6IqjItepNp8pPIlNLTSwz3VI8809Gryld2T8VwDCj2NhZK06Bq6EOVhBs7AiljQ3/304SZIh0oSlQFo3ox8cdkTl+8mgMHw+RDnv5mM/RcshHTRylRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199018)(38100700002)(2616005)(6486002)(6666004)(36756003)(478600001)(86362001)(82960400001)(26005)(8936002)(41300700001)(83380400001)(44832011)(6512007)(66476007)(186003)(66556008)(5660300002)(6506007)(8676002)(66946007)(316002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A93zDGD/PqA/tajtwszLyhL6Fu1ApfzH9zZLbZcj350lk/fchFuYksUPe1PD?=
 =?us-ascii?Q?QRe00BOfwn0MN0vcHKavetx8Nl/iCtH6XjpwbAlyRtuRoWX2zrpPaOtH3Pv3?=
 =?us-ascii?Q?Ri1jpZiK4q1pHo3VMKEp/B3vUMhjoWKZLmF0wv/TU8HyVPKyhbTtzepo6UZA?=
 =?us-ascii?Q?8B8K3CRspA5ggH5GRazVDeDaAnv5ady612UxSwSufWUsBlHbmsw916Y3h8Td?=
 =?us-ascii?Q?ji4PtDycz48OI0GFTRfiIv1LBNNpliymcStmLdXELj1sQJnCuZYGyuLvAwNE?=
 =?us-ascii?Q?BG8tNO4wu3Vmv8e2H/W4ugSflvHr2ujS2tl89LIvfGwkuUhTHIT8tiuNzSGt?=
 =?us-ascii?Q?LS7bIuhNjBrv4dpJ62RmeyuivWDt1M2BUZoWyjVXJ5G+1Bpmon+tCkuQOLy1?=
 =?us-ascii?Q?bvFw1tHtRJHokeC2MgtcVr+y9IHVS5VnwcjEjmmXVm0MMJx3Y4D8LJC8Vt4n?=
 =?us-ascii?Q?aZt24zj1jZyaCqmYCfACp8YYtzRbtauM0mHC8WQhxrIyxb49AJgdQfP50ggS?=
 =?us-ascii?Q?WP4n9VNgTnmsgitazct4z9mp/ACkGe2Sgvt+3U3bbQpj0jhs9OUAMneW/RW1?=
 =?us-ascii?Q?aTftCYpQYHNW/P9dI45lf4abq5Wa1XhGi4h5Z2KkgNfdS7qsX8xV/w890ylL?=
 =?us-ascii?Q?YMTks92DMvIrbjePx8UJYSXELBFz1cdkI6OCUIfwcxq/gygBt7va/AVbyxDZ?=
 =?us-ascii?Q?LYxBV1J2eBJ2zj+/fcVH/ZYuXq9r+5Dmbx/MdsO33tFEsxR019jdke/Z2jV8?=
 =?us-ascii?Q?CGXfYQKLalWg0o+dUcVN64MpavycjL/JiaxiTbjax6Dd7euDZSHPGNh/NQwT?=
 =?us-ascii?Q?uErV2eHhdzXVL2uHhadHSi7Yo5XIHIMlRTCjzCHO3aOnALqYEfmQKTKvCLc5?=
 =?us-ascii?Q?aGWHHiN6+kWaCQe0mnLLAVV+u286snDM5ifMcvD5c8uiG+u8DbCnHJNYuRQQ?=
 =?us-ascii?Q?XYQefGRHYhsaMmQWsB7SVeP/+0hBZbgUI8jsHkE3Ctr4VHzSPdoPu0NC4BV3?=
 =?us-ascii?Q?rtI8g+/6y4C9Px+BlffJ1XDq7fwhz8J+inEgXf16QEK+wsbyIx6T5bSc8aWW?=
 =?us-ascii?Q?7fDFH/aBXzw6P8kGwW+Ws0e+ogDOUQoXjpy85J8KZynJZA5z3Dtvod9b1mGi?=
 =?us-ascii?Q?/tDdYH+XLYgHS4RZQ4oRZspab3kXUTRnNBRw2/fE4TwjLFS/e+y1uoMODhu7?=
 =?us-ascii?Q?7HGv17NhhZOdrIK+DfKJaiUA32rH3/sAqDamhMWkR8yWpk9IvP7fvV7ZodFG?=
 =?us-ascii?Q?DEHDCdKGPoX5csAPxMDFnGZXEhXzF//JEM2UzOO16OQyARGQXUcB3zNlDJRM?=
 =?us-ascii?Q?YD0dTv/StaCIm18Q/4kEVTovmEehc6QpFXH3mLuU4niaVzNTWlvAKS0GFUiQ?=
 =?us-ascii?Q?H8ffRM9uWYV3KUnoNCk+oOfjtHu+JT/7WrkhoLURJ1ZelW0D84nZGkUU4/LU?=
 =?us-ascii?Q?70oVkexuLupfB1bQ/5fnH4gllPQbHQTJRzweP5emCMOF6nJeM4DMgrV/kZhd?=
 =?us-ascii?Q?J831dzcOvhATzRn+QBi936WBK79WQt8CpAeb1cmd1rh9CAYxN5Bseje5IyWA?=
 =?us-ascii?Q?qV62o/P7Q0nmseQCNoU+kNXmeb07XxJREOspJ9Zjp8Z1jLiuU1yr/0AxjGDl?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e6a26b-870a-4ec8-448e-08db0620b37f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 19:56:12.6364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /llkK2sIRAIRHuZxOvG8FH+yj5M7Uqa81tXuiaKfJ4GHXHleobeGYVnb1GTFotYwF4vf1WVv2o+D72DI+Y7cRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 27/37] drm/xe: Ensure VMA not userptr before
 calling xe_bo_is_stolen
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

On Thu, Jan 12, 2023 at 05:25:28PM -0500, Rodrigo Vivi wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Fix the below splat:
> 
> [  142.510525] [IGT] xe_exec_basic: starting subtest once-userptr
> [  142.511339] BUG: kernel NULL pointer dereference, address: 0000000000000228
> [  142.518311] #PF: supervisor read access in kernel mode
> [  142.523458] #PF: error_code(0x0000) - not-present page
> [  142.528604] PGD 0 P4D 0
> [  142.531153] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [  142.535518] CPU: 4 PID: 1199 Comm: kworker/u16:8 Not tainted 6.1.0-rc1-xe+ #1
> [  142.542656] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
> [  142.556033] Workqueue: events_unbound async_op_work_func [xe]
> [  142.561810] RIP: 0010:xe_bo_is_stolen+0x0/0x20 [xe]
> [  142.566709] Code: 20 c8 75 05 83 fa 07 74 05 c3 cc cc cc cc 48 8b 87 08 02 00 00 0f b6 80 2c ff ff ff c3 cc cc cc cc 66 0f 1f 84 00 00 00 00 00 <48> 8b 87 28 02 00 00 83 78 10 07 0f 94 c0 c3 cc cc cc cc 66 66 2e
> [  142.585447] RSP: 0018:ffffc900019eb888 EFLAGS: 00010246
> [  142.590678] RAX: 0000000000000002 RBX: 0000000000000000 RCX: ffff88813f6a2108
> [  142.597821] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [  142.604962] RBP: ffffc900019ebbc0 R08: 0000000000000001 R09: 0000000000000000
> [  142.612101] R10: 0000000000000001 R11: 0000000000000001 R12: ffff88814107d600
> [  142.619242] R13: ffffc900019eba20 R14: ffff888140442000 R15: 0000000000000000
> [  142.626378] FS:  0000000000000000(0000) GS:ffff88849fa00000(0000) knlGS:0000000000000000
> [  142.634468] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  142.640219] CR2: 0000000000000228 CR3: 000000010a4c0006 CR4: 0000000000770ee0
> [  142.647361] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  142.654505] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  142.661639] PKRU: 55555554
> [  142.664367] Call Trace:
> [  142.666830]  <TASK>
> [  142.668947]  __xe_pt_bind_vma+0x1a1/0xa50 [xe]
> [  142.673417]  ? unwind_next_frame+0x187/0x770
> [  142.677699]  ? __thaw_task+0xc0/0xc0
> [  142.681293]  ? __lock_acquire+0x5e4/0x26e0
> [  142.685409]  ? lockdep_hardirqs_on+0xbf/0x140
> [  142.689779]  ? lock_acquire+0xd2/0x310
> [  142.693548]  ? mark_held_locks+0x49/0x80
> [  142.697485]  ? xe_vm_bind_vma+0xf1/0x3d0 [xe]
> [  142.701866]  xe_vm_bind_vma+0xf1/0x3d0 [xe]
> [  142.706082]  xe_vm_bind+0x76/0x140 [xe]
> [  142.709944]  vm_bind_ioctl+0x26f/0xb40 [xe]
> [  142.714161]  ? async_op_work_func+0x20c/0x450 [xe]
> [  142.718974]  async_op_work_func+0x20c/0x450 [xe]
> [  142.723620]  process_one_work+0x263/0x580
> [  142.727645]  ? process_one_work+0x580/0x580
> [  142.731839]  worker_thread+0x4d/0x3b0
> [  142.735518]  ? process_one_work+0x580/0x580
> [  142.739714]  kthread+0xeb/0x120
> [  142.742872]  ? kthread_complete_and_exit+0x20/0x20
> [  142.747671]  ret_from_fork+0x1f/0x30
> [  142.751264]  </TASK>
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index c8b3b1975098..9e07ad41a007 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -758,7 +758,7 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
>  		else
>  			xe_walk.cache = XE_CACHE_WB;
>  	}
> -	if (xe_bo_is_stolen(bo))
> +	if (!xe_vma_is_userptr(vma) && xe_bo_is_stolen(bo))
>  		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
>  
>  	xe_bo_assert_held(bo);
> -- 
> 2.38.1
> 
