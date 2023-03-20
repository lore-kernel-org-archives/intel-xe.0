Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F004AC6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 17:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81D110E07D;
	Mon, 20 Mar 2023 17:07:57 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4D510E07D
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679332076; x=1710868076;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VKFjOzzP1lVEL3AlIkuOTk7mRec+VMM/rM3BpXTNe8E=;
 b=hzqNTkk+7oy5Qt4zKwXCVy81g5j6wk5VcyFqlWVE9DB+KIWKoZrgkj6o
 bjresC73nfc4KsWJitnbUCKsXq5D2YJ0nbekGj21PJSTyrq5MPCJwuMdM
 CbpXr4Uxd4t0aHtGdenz+GW2CfjmKHq1lPPWd6IzIeAhDM4SDJvhjf62s
 6Um+7hDxs6NfozUox0upp5hzGtVc8EiVZow0rPd5ejXfaj5TSH1Jr4Woe
 kn4MrxekS1o27K2bgLnulgxLacvaVFnn9KEJ/GcrzfOlMxztb4t3NLBR3
 CF4XHC1aOxkIdW1Kp4Jl3RaYspzfCbp3bQJof19OXdJ7X/RuqpiA5cytm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="338747442"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="338747442"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 10:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="750195016"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="750195016"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 20 Mar 2023 10:07:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 10:07:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 10:07:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 10:07:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 10:07:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1xtjCr+9qyv7lCNeWh+NK6TDVs0AOZZ2rnQkcuEyDjkWQ2OQBphl3ViP4mQQQ9aIN3BOP07rYO1lfjfApnN0M0oB6ki9H8J8Jn/AmhHpL0QUqwB98QlsIDW9vBOBIcryjMJWw8QrYT6onu6OvUHwzqAcEicy2ammB4nvctq4Gt8cErOzsg2eyZS3WRtJyN3O4fFUq2jibPgxDNl+bE+YU4IaHXKZnsaHNrBOA2IW4xy2Q6pDkAXqxSUEwrvoPzBn0G1uQtUSH2QXI5NoS+KMIYedPLcqSXjh5mOD5wYm+e8VaOIzrUdZV3uJdqL3oCs3gvy8v/Cpf1zhue3vS3PgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNAiYq86s4EeknX1SWmQYL1WM6nmp1AvHamFRQIaVYw=;
 b=gGOh6ZowyAlV0wAFpY8TH+Phtrna9BmFxkV+GiWHTPcYq62jYTyeXPAP0Fgr6TP6BNR1rB+HfEYqX2eZkjb4FmLxnYVNDtt3HcFzZnwM2YxSVXlt3bik4vumovqAB0g1srNDH3hQRYO6Ov9UZdGArcFyYkj1rfJTTvKJAFxYxeTH8gocHV3geOexsIbiPjyQ9+ClNu8uzMpBo3VJ2MSHuy+aNO6IDX1Uqjh2QVKPLnlWuV63v8+v4iIE9HF7ZuMgbLk+rRJoyZkRtzS9h9C57l2rDQVTDlnJWaeeoXs47mmF1KHoqaX7eGs9SlL6BXr2pE7+84gePcWmq/lFEc4mcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 17:07:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.025; Mon, 20 Mar 2023
 17:07:39 +0000
Date: Mon, 20 Mar 2023 17:06:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZBiSra5c1+C7HKKb@DUT025-TGLU.fm.intel.com>
References: <20230318030643.557464-1-matthew.brost@intel.com>
 <f88d75ac-0979-b0d6-e23b-da60fb46f1f9@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f88d75ac-0979-b0d6-e23b-da60fb46f1f9@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0222.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 83eecccd-af65-4806-8451-08db29659c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fPZGCMD9UYAH9c9Vjl5bw3qlmpNoWigqTAOlBrVaOrGknT0Kh4a+5S0y7HIipr40P5eRsLJ2+HK4vPy1O2tXyxcKKN74PaBc/W/nFQj1A1V/WWcXbI+SS0M1t7jxiklQsipjaql/yBPFJrcOHNSbPbcpy3hDRzrXpeqCLxqeIqwl7xS/UfTFxveKaPkbVLYS3fh75KKAHoH/dwp0SsOFzqVTZyrvbwBstDz9bXPTxKr1akHm7I4ATxWBz/UCP46obL3WwGUj9SVLQHQvQp8sGe1VVhDG8BRq8S0cyg+xrdvchmVGfmh8bL++tgP7p9pcdcjuCAsbME+jq/HcHj0JWycR4gME4EU3RimLPM9CkhGLUwSSED6CJg8BMqXVPeFN3w0xHAjrtzhAdO5DrlTVvtHEP7oimBq2i/zXof1PdrCL9pUu/+ZwgLr/Fv9Hv/aoehpT02IQoVoZCodFA2v293uH/9rN9I+0XYqr6qjzj/KBOdaZ9QYj1kJdQaZSdG3UoVRBtJiGxf/HMR6QykBHDr6ikEfSBLbOrM2Sys94fZVwoNUXC78xM3PMb6RJpejQmxWAgvb0sLNkKM/nhRQkclIUdF7awooEDUMjsQ9UfCPOdvBgoI9qKI056NZNMChNuM0d0/tFZIkQuh0PYDA554cI0qa+4qY41wXxgPrrp9CGbc0ZxLZBZVuT4lsvhgBv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199018)(44832011)(41300700001)(8936002)(4326008)(8676002)(2906002)(6916009)(66476007)(66556008)(66946007)(5660300002)(316002)(86362001)(478600001)(6486002)(6666004)(6512007)(6506007)(53546011)(26005)(186003)(38100700002)(83380400001)(82960400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pSfmLMdpgUK3Oe8ZBisOv0i3i3Le7ZA/xLWSTl7jeRY2sEWh0ijEJfhdFlsx?=
 =?us-ascii?Q?AaJOJEb0zf9D5gQhlV+eMJ9+M5ocbBsFR8urW/ji42avM6V4oRyfS/OeKMDZ?=
 =?us-ascii?Q?EUW/PQA3FW2TS+bRJQUgBX0Gr0ZCydma6/0Lcu/Myz+GKUGUwHabaTW5NSDe?=
 =?us-ascii?Q?4n+54ciNuy2gu0HGGsRbIvSkklLigF9zYNGAdl+Ztd0MjgAszNfErOikY/3V?=
 =?us-ascii?Q?ywmLNFQZV2oolanLIFMmxdbUqll8LinISMKnv2Eaq3FIbiil+DiyG373llCY?=
 =?us-ascii?Q?SZBRMWwVNo257uVmhmyokP5rjnFFeplleu0crnJm8TMVtn0xEGgZRnD2e4or?=
 =?us-ascii?Q?LjRSJGDPwF0E0ZkvEgSfEi1XnefZI9kf/pgwnbzndDxmu/pK5y9a5Sv0xHiF?=
 =?us-ascii?Q?5GBmbA8pmfjFkroGSQ2r0FwiK32u8DUyDox+ztG02x4PExqzwcFbS9CORPqY?=
 =?us-ascii?Q?BQCggn0SVO3S9JEUds7+TPt/V8kALdQdZbsV3GVNG/ZGKyjvUzU1qQw784tx?=
 =?us-ascii?Q?59JUVnw2YCugCAER1sf5JhNxhn4BNP3SsSjFJBEZy1fTiUSZ7Ih4ZztJKsvx?=
 =?us-ascii?Q?e8MUmAgnLl+NXyRFJjNtTVSSyQJnZoZr9oK1R766pSnJ9+b/rhpElUSm6owN?=
 =?us-ascii?Q?lLset1Y586Dl1PYV+M+V2dm3tfyLO9gDQhocC772ep7LjI7qqAskFzoigRZX?=
 =?us-ascii?Q?73JeyAlEiWjt0Xt/eRwF2VIcKxvkw6H7N4SJ7crBT776ICWoB0Rw0F5KEo61?=
 =?us-ascii?Q?Pvm5qBVG4c2j4I75EUij6B8YUB5D9Zm04cLerrTxb88c6cIhiZhCeV0bIMyN?=
 =?us-ascii?Q?+E5qCzBPqQmYL0L61ikKytNko8ixbIXLC0VDTmeWCJBa63j+AKuqKqdhSi+B?=
 =?us-ascii?Q?WNZcbooma1szsfEp0cx+NKkhwWdeyupuoFTN+5o3XVl9VRSYRSr9phvIcmW8?=
 =?us-ascii?Q?VHWfVyDYsq29GYAGBo5oYwht10Lm9a2qkI6kHh2Qf9nXnTYM12uf54s/vU22?=
 =?us-ascii?Q?R0l4shpsRz0qTE8O3uiK+xjllVkoFDaCcmgh2THzlFIsbfofDNxCHVto2HpU?=
 =?us-ascii?Q?LIPETnFeP686uuZquT7Eak5rYnYrkDGMPRC2RBHdRXe6Vo3FE+C55sOokR8l?=
 =?us-ascii?Q?ZBxZPp3SlrCoXQWd9XZcYXwKdiYMwB4dWtHQg71Mz6LqDnHmDGwIyUaTrxT/?=
 =?us-ascii?Q?VVRyPEjsOhw6ZKkWEG5ru6irQNvG5UAu4sRoQVWRKEPelgqTrpGm/7uxUln4?=
 =?us-ascii?Q?Lfts/iPZDEqx5sqn7PpjA72dS6oFaLZufLyOp8v234kA2gZ+kJep8+6TPIfT?=
 =?us-ascii?Q?RcDlbkZ1hcXVkpW7ujSlo3PI3iCJGakBcpP6F0WqHJIBJT0Jz9o2bwca44X3?=
 =?us-ascii?Q?f4ghmJrOqfsubitaFPzdNOJ/9O0OWxflT5PTi6TwRUXFOjc3iBwDWhJny4fN?=
 =?us-ascii?Q?rodfmrO9AfIfSBBMgQfdu3q0eFh0gLs9a0jpKzpJiivJbM+WGhjDBKcK8kQF?=
 =?us-ascii?Q?wWY0Gq6I+08jEQuuQWvuSvcGL7YKTQCrTufVbWCYYt3yvIHck/cueCHBNS2d?=
 =?us-ascii?Q?LgmzeiIyMWEAZBd0P3uGEUOhXz+BN77OI7vMxU0uVxZ+1eFVDC7QQx93/Mvc?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eecccd-af65-4806-8451-08db29659c4a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 17:07:39.5496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAFRnSQV7KL1FraBwu4Z505iNmN6R+tfLbo/ZZBWK4cpWiQ5UUhSe+OfQtozFSM3Tl4VvvwVY1CJT0n98EW/Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8017
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drn/xe: Drop usm lock around ASID xarray
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

On Mon, Mar 20, 2023 at 12:42:14PM +0100, Maarten Lankhorst wrote:
> Hey,
> 
> The removal of usm.lock looks sane, but that leaves usm.lock guarding
> num_vm_in_fault_mode and num_vm_in_non_fault_mode.
> 
> This is fine, but there is a time-of-check vs time-of-use bug exposed.
> 
> I suggest removing the checks from xe_vm_create_ioctl, and move them to
> inside xe_vm_create only.
> 

Let me do that in a follow up patch today.

Matt

> Cheers,
> 
> ~Maarten
> 
> On 2023-03-18 04:06, Matthew Brost wrote:
> > Xarray's have their own locking, usm lock not needed.
> > 
> > Fixes lockdep splat on PVC:
> > [ 4204.407687] ======================================================
> > [ 4204.413872] WARNING: possible circular locking dependency detected
> > [ 4204.420053] 6.1.0-xe+ #78 Not tainted
> > [ 4204.423723] ------------------------------------------------------
> > [ 4204.429894] xe_exec_basic/1790 is trying to acquire lock:
> > [ 4204.435294] ffffffff8255d760 (fs_reclaim){+.+.}-{0:0}, at: xe_vm_create_ioctl+0x1c5/0x260 [xe]
> > [ 4204.443932]
> >                 but task is already holding lock:
> > [ 4204.449758] ffff888147c31e70 (lock#8){+.+.}-{3:3}, at: xe_vm_create_ioctl+0x1bb/0x260 [xe]
> > [ 4204.458032]
> >                 which lock already depends on the new lock.
> > 
> > [ 4204.466195]
> >                 the existing dependency chain (in reverse order) is:
> > [ 4204.473665]
> >                 -> #2 (lock#8){+.+.}-{3:3}:
> > [ 4204.478977]        __mutex_lock+0x9e/0x9d0
> > [ 4204.483078]        xe_device_mem_access_get+0x1f/0xa0 [xe]
> > [ 4204.488572]        guc_ct_send_locked+0x143/0x700 [xe]
> > [ 4204.493719]        xe_guc_ct_send+0x3e/0x80 [xe]
> > [ 4204.498347]        __register_engine+0x64/0x90 [xe]
> > [ 4204.503233]        guc_engine_run_job+0x822/0x940 [xe]
> > [ 4204.508380]        drm_sched_main+0x220/0x6e0 [gpu_sched]
> > [ 4204.513780]        process_one_work+0x263/0x580
> > [ 4204.518312]        worker_thread+0x4d/0x3b0
> > [ 4204.522489]        kthread+0xeb/0x120
> > [ 4204.526153]        ret_from_fork+0x1f/0x30
> > [ 4204.530263]
> >                 -> #1 (&ct->lock){+.+.}-{3:3}:
> > [ 4204.535835]        xe_guc_ct_init+0x14c/0x1f0 [xe]
> > [ 4204.540634]        xe_guc_init+0x59/0x350 [xe]
> > [ 4204.545089]        xe_uc_init+0x20/0x70 [xe]
> > [ 4204.549371]        xe_gt_init+0x161/0x3b0 [xe]
> > [ 4204.553826]        xe_device_probe+0x1ea/0x250 [xe]
> > [ 4204.558712]        xe_pci_probe+0x354/0x470 [xe]
> > [ 4204.563340]        pci_device_probe+0xa2/0x150
> > [ 4204.567785]        really_probe+0xd9/0x390
> > [ 4204.571884]        __driver_probe_device+0x73/0x170
> > [ 4204.576755]        driver_probe_device+0x19/0x90
> > [ 4204.581372]        __driver_attach+0x9a/0x1f0
> > [ 4204.585724]        bus_for_each_dev+0x73/0xc0
> > [ 4204.590084]        bus_add_driver+0x1a7/0x200
> > [ 4204.594441]        driver_register+0x8a/0xf0
> > [ 4204.598704]        do_one_initcall+0x53/0x2f0
> > [ 4204.603056]        do_init_module+0x46/0x1c0
> > [ 4204.607328]        __do_sys_finit_module+0xb4/0x130
> > [ 4204.612207]        do_syscall_64+0x38/0x90
> > [ 4204.616305]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > [ 4204.621878]
> >                 -> #0 (fs_reclaim){+.+.}-{0:0}:
> > [ 4204.627538]        __lock_acquire+0x1538/0x26e0
> > [ 4204.632070]        lock_acquire+0xd2/0x310
> > [ 4204.636169]        fs_reclaim_acquire+0xa0/0xd0
> > [ 4204.640701]        xe_vm_create_ioctl+0x1c5/0x260 [xe]
> > [ 4204.645849]        drm_ioctl_kernel+0xb0/0x140
> > [ 4204.650293]        drm_ioctl+0x200/0x3d0
> > [ 4204.654212]        __x64_sys_ioctl+0x85/0xb0
> > [ 4204.658482]        do_syscall_64+0x38/0x90
> > [ 4204.662573]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > [ 4204.668146]
> >                 other info that might help us debug this:
> > 
> > [ 4204.676145] Chain exists of:
> >                   fs_reclaim --> &ct->lock --> lock#8
> > 
> > [ 4204.685182]  Possible unsafe locking scenario:
> > 
> > [ 4204.691094]        CPU0                    CPU1
> > [ 4204.695623]        ----                    ----
> > [ 4204.700147]   lock(lock#8);
> > [ 4204.702939]                                lock(&ct->lock);
> > [ 4204.708501]                                lock(lock#8);
> > [ 4204.713805]   lock(fs_reclaim);
> > [ 4204.716943]
> >                  *** DEADLOCK ***
> > 
> > [ 4204.722852] 1 lock held by xe_exec_basic/1790:
> > [ 4204.727288]  #0: ffff888147c31e70 (lock#8){+.+.}-{3:3}, at: xe_vm_create_ioctl+0x1bb/0x260 [xe]
> > [ 4204.735988]
> >                 stack backtrace:
> > [ 4204.740341] CPU: 8 PID: 1790 Comm: xe_exec_basic Not tainted 6.1.0-xe+ #78
> > [ 4204.747214] Hardware name: Intel Corporation WilsonCity/WilsonCity, BIOS WLYDCRB1.SYS.0021.P16.2105280638 05/28/2021
> > [ 4204.757733] Call Trace:
> > [ 4204.760176]  <TASK>
> > [ 4204.762273]  dump_stack_lvl+0x57/0x81
> > [ 4204.765931]  check_noncircular+0x131/0x150
> > [ 4204.770030]  __lock_acquire+0x1538/0x26e0
> > [ 4204.774034]  lock_acquire+0xd2/0x310
> > [ 4204.777612]  ? xe_vm_create_ioctl+0x1c5/0x260 [xe]
> > [ 4204.782414]  ? xe_vm_create_ioctl+0x1bb/0x260 [xe]
> > [ 4204.787214]  fs_reclaim_acquire+0xa0/0xd0
> > [ 4204.791216]  ? xe_vm_create_ioctl+0x1c5/0x260 [xe]
> > [ 4204.796018]  xe_vm_create_ioctl+0x1c5/0x260 [xe]
> > [ 4204.800648]  ? xe_vm_create+0xab0/0xab0 [xe]
> > [ 4204.804926]  drm_ioctl_kernel+0xb0/0x140
> > [ 4204.808843]  drm_ioctl+0x200/0x3d0
> > [ 4204.812240]  ? xe_vm_create+0xab0/0xab0 [xe]
> > [ 4204.816523]  ? find_held_lock+0x2b/0x80
> > [ 4204.820362]  __x64_sys_ioctl+0x85/0xb0
> > [ 4204.824114]  do_syscall_64+0x38/0x90
> > [ 4204.827692]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > [ 4204.832745] RIP: 0033:0x7fd2ad5f950b
> > [ 4204.836325] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
> > [ 4204.855066] RSP: 002b:00007fff4e3099b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > [ 4204.862623] RAX: ffffffffffffffda RBX: 00007fff4e3099f0 RCX: 00007fd2ad5f950b
> > [ 4204.869746] RDX: 00007fff4e3099f0 RSI: 00000000c0206443 RDI: 0000000000000003
> > [ 4204.876872] RBP: 00000000c0206443 R08: 0000000000000001 R09: 0000000000000000
> > [ 4204.883994] R10: 0000000000000008 R11: 0000000000000246 R12: 00007fff4e309b14
> > [ 4204.891117] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000000000
> > [ 4204.898243]  </TASK>
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c | 4 ----
> >   drivers/gpu/drm/xe/xe_vm.c           | 4 ----
> >   2 files changed, 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index d7bf6b0a0697..76ec40567a78 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -119,11 +119,9 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >   	bool atomic;
> >   	/* ASID to VM */
> > -	mutex_lock(&xe->usm.lock);
> >   	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
> >   	if (vm)
> >   		xe_vm_get(vm);
> > -	mutex_unlock(&xe->usm.lock);
> >   	if (!vm || !xe_vm_in_fault_mode(vm))
> >   		return -EINVAL;
> > @@ -507,11 +505,9 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> >   		return -EINVAL;
> >   	/* ASID to VM */
> > -	mutex_lock(&xe->usm.lock);
> >   	vm = xa_load(&xe->usm.asid_to_vm, acc->asid);
> >   	if (vm)
> >   		xe_vm_get(vm);
> > -	mutex_unlock(&xe->usm.lock);
> >   	if (!vm || !xe_vm_in_fault_mode(vm))
> >   		return -EINVAL;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index ab036a51d17e..e7674612a57e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1377,10 +1377,8 @@ static void vm_destroy_work_func(struct work_struct *w)
> >   		xe_pm_runtime_put(xe);
> >   		if (xe->info.has_asid) {
> > -			mutex_lock(&xe->usm.lock);
> >   			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
> >   			XE_WARN_ON(lookup != vm);
> > -			mutex_unlock(&xe->usm.lock);
> >   		}
> >   	}
> > @@ -1887,11 +1885,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> >   	}
> >   	if (xe->info.has_asid) {
> > -		mutex_lock(&xe->usm.lock);
> >   		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
> >   				      XA_LIMIT(0, XE_MAX_ASID - 1),
> >   				      &xe->usm.next_asid, GFP_KERNEL);
> > -		mutex_unlock(&xe->usm.lock);
> >   		if (err) {
> >   			xe_vm_close_and_put(vm);
> >   			return err;
