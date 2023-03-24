Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C74CC6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 07:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3B910E50C;
	Fri, 24 Mar 2023 07:20:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A240010E50C
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 07:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679642398; x=1711178398;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JnKOM8rwMCaBQnNCBtytQl8N8j+9ur77fkcDrBNNOwg=;
 b=jr3irf3ERYKM4QDARoJVNN5Bd8gwkqwYceoKfDMaHO2XHA8RivAC0A8B
 iwA4kXXK66xla2PT9PcvqE7E/7Q57ZVFxYZzX3v1GWXH+elSP+SSdZYcf
 55JiYwg1hux/lwWTU5vuHNQXTetgQwWz9kUbx2uOoa8kXI2q/GYKja8jD
 /vzeBsiucv0757pR+fczBw115VgLIq6FA9JYUBP4Pb6CgmMfsQ/04gp+x
 kjgKUfPWmBOpHouVfOyuZ5Fhjq8sRaVFA6/yoy6StHXIacapBQ2Rzvk2X
 SrJVJ6nk6Llkm8l0Y2YtSUX0bh+KpPwiOi3ZzpPjD2jWvuvcEUa41xHZO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320106710"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="320106710"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 00:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659956162"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="659956162"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 24 Mar 2023 00:19:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 00:19:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 00:19:57 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 00:19:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TD/B1BzLgz7j/evA4RGVQLTkSOPhQF47B9c7mwHIYNmOeDS4iO5VFk+379KqCBwdisSZZ+9vnFJ/EDilbC6pQHkZcHhz1G9pPBRZnI60ZCGBzgMrEA7hI73vkJA3vRJnI2oRj0uqql7rnWL+9jaNUft0ipXQIcIf8kLox90ur801Xi7tZiNbnSnehGGCvNug84OolMQYTLk9mDyQEw9oKaepiFYebPhX4E0EBM54mIuFDLiUn8D/Vl7E5AJYP5040wEHO4ssQvErwYkhD+hyVVjRMu3EyY/jilYDK8/E1zu9KXxkIyejtast2eTgk/ukgY2mc/zrSdVHJtQb9nyBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7KLuYFHVeusV4it0L5oasX8tSjDYhbfwFafmBICYwA=;
 b=Fpq1a7O4ESg8HPsBpRNX0j84ot4uhBYbeRbtZ39hEkGj/PEGvcKtQ1PX+AoRW1vDDeGGuj8kVYdfi15yLUbFjRGyX27OnR0k3QwOUF8HuaY80tgppZd3bHU+Y/WqKMUg5mJL9j7VXShxQ6zKJsB4Hg2bOQ/K+OVgh93p6tylqdGJvFXjMvTphQdRtPTKrViQ83yb5crY613XLHpFChTc2GxwrRUgGUsB7GljG8yDCcZgjTXI/VnfEaG8RchxJa+A7icZAn5dQXBD68tp6P67psc6dzPMiG2thiJ/+YpUsng+qXSJe4eFHEkmqQBHdlnEm0u/ZFpQ5RajcvY/xtFwng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 07:19:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 07:19:54 +0000
Date: Fri, 24 Mar 2023 07:19:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZB1O9TibD2qY7pzE@DUT025-TGLU.fm.intel.com>
References: <20230321234217.692726-1-matthew.brost@intel.com>
 <20230321234217.692726-2-matthew.brost@intel.com>
 <ZB1Al4yra5UhxEGC@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZB1Al4yra5UhxEGC@nvishwa1-DESK>
X-ClientProxiedBy: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 299507de-c1e2-4a85-57a3-08db2c382a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqsFILqLzjvjj8+TaWHi4YEo3ziORa+3j7sUL0MYtym4MVBbTw5y1jAHQtA8NUuwC5+C8FYMdTRE/vlix1lCMGfIyEMvyTJ0yObfHH6ypMa+0ijMQwXuHJgYPGP33mDO/WhX4v8UfVuhbeWqxf1QBv+CP9kGwjXocoEUTrkmJYsy1Vm4Ze9rUjBaTtqkfpAjpMvyfsx1AFSjf66Z8agu/vzGTofE0VsWn5VfldCaL1T7RVXMRxbjeCD6b4GXy2KBmVSDOqHR9NUnXLw3v6qUajp31Mz3J8bpuN2CUfo84e4GGPs0CUtRPCrQvPIwThPVKfg4GztW9udMwq6ZzhQ9zf/LIvE/dNtsvZe3Ffxr1j1ov1WpGhRBafhngKvJdRPj3+5cdW79d7k8UOgXJJGJQz0cMUu4FSrywa9yMFKcKTnqP2RA+xghmlMDTzoeQMkXP1qTij9VukxX78zwm/joKwcsrVWxJ+oEvdb4/RPVfgnL/UIVfykQDRSB/r0d/HMq4gk9MmPK76RvEMPLJXh7nAgJoRIegif4Ha72RZxf6NH4zZ9/fFpWFcI+8fE65sFHByLRer3CyVJWtPT+hgtoeHaasFoEKIoeOs+NhFyaCRZo1H7/6LvicAqHgBpPeilyvNIXwV1nB3miAiCNsfpX+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(66476007)(8676002)(66556008)(66946007)(4326008)(6636002)(41300700001)(5660300002)(44832011)(82960400001)(316002)(6862004)(6512007)(26005)(6666004)(6506007)(8936002)(186003)(478600001)(83380400001)(6486002)(86362001)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+pazc/kfB8BLDHeisCcxahEVQ8Ga/nFljCtbfQ4+dxdeHarjobbkn51Qgeva?=
 =?us-ascii?Q?dWq6NxTFRcJ1uQl6EhFl2BU0PnKUyebNA2X12D+QHw7wK3UBl6HP4Vb4JDCt?=
 =?us-ascii?Q?+zLMx8dLhcSJmJDHw0mepAYznHQ0V9+KBh/b8EyjxvxH2mFJ6WetoVtzzJ61?=
 =?us-ascii?Q?Yy44JQBkqOiAw1H28KLUGNebkb6Wq9cNld4rqPilAgvXe9tKnKZPJlNZ2QpQ?=
 =?us-ascii?Q?FuEhThxPcB9QrA+6v+P4k9FCZKekd18vxjDyIQL2sRJ/XImEL9lwM3+etk0P?=
 =?us-ascii?Q?MJCqPTlRwA6DlTGc7VAokX6bhPOuBygG3uEOdIfYhHeoIH1KG9Zmw9aHn4IE?=
 =?us-ascii?Q?n4/0fEOvRgZHbnbyLtPVzAnMlASwc/7YJpcCbGbo33pmEelZ0lWWP8+tnMDy?=
 =?us-ascii?Q?nPsNU+y0vTQmQTM9cGcqCaDccpUgAFrMQay6fOvhAP4JcSd+fdU0KaFJMFCI?=
 =?us-ascii?Q?kqrjObBw6eGDTRb7aYuowZEWagL53v0c7a1ArkgZVSQwlyktv4UyP75WYBk2?=
 =?us-ascii?Q?HRMg//29nJ3oSZIlkl00QhsAUsM5NyQlbWszqpslvMMkyT8QW0LSaWh1m6DZ?=
 =?us-ascii?Q?KrHYMCpHQWn5gMcEuLsHi9di+aCojB7NuK2/qrfB8Ft/xal9GbLn/PBHC+Qg?=
 =?us-ascii?Q?ayraCVZG/XLk10i2/gWpipKvEssiXEVrPkuQJkAoDkazNGBb3GmIITE7FctS?=
 =?us-ascii?Q?jdHWnQ0E9pDkzLes9nRyWE+BnqVXdUGZZvkXmJUGvUyUl+TIHrXumT4j3er8?=
 =?us-ascii?Q?KWi1GFW6qBsRr/b+3Oyidkqj7PPwLszWTagVxRvTBn3b6fUy1pdPgzNg0R+7?=
 =?us-ascii?Q?6fKb6OsxnjRmIglSRt9tiKWDM1NhdvuVt14BIblRqx6zdoX2OUlUC1/fV2qJ?=
 =?us-ascii?Q?O+T7GQ55FTynidkryhyZJ1TdwQL/pbf3M44cpSiM4Dag2CuGCkSu6gQiKrBc?=
 =?us-ascii?Q?Bdw7tAOx6r97tPSbPCqCuVLZNPde/nwwU9HXMK5IhgoNYx/hy4sL9aS0UQSp?=
 =?us-ascii?Q?XjckkntfkADvo/hItHEOa6/bxCgsOTfu1RDGpKSBXFnthdpYzNmWgC4J64QA?=
 =?us-ascii?Q?20Uy+oWEcWKpnBPj5eQgSnHnQVNae20txg1ZkuRoyjnv19WC9nYUqgjGIOKH?=
 =?us-ascii?Q?9pC84vdOlwjn83J8tOQbgnW9SSrP6LmRmIZQA/xio1YCUY0zkwvCFZruBomW?=
 =?us-ascii?Q?oANHrFD3YzMKltSmJen54of1ij3rVnJJQOXxiFL9L7o+vN2bRB9rwJxLphMG?=
 =?us-ascii?Q?8WsmWeAWT7FSKTnnS9QUbVUQp9suPm/ub9FkKbL2/ozgkiRxiaIOuFO0lP5Z?=
 =?us-ascii?Q?l26FJmtxr8BOjX95nWlm9outIJeEgSIAFn+12jFD7QnzcZoYkCXIhnz8QX4y?=
 =?us-ascii?Q?ewcL2SrBUTvnASd5kNj34naSOKLfEnld9pZzPfYk0FSvgRSmKdFwpFmxz+GV?=
 =?us-ascii?Q?I+xXaRc6IR8rsE2irtrkhRW31/aAJuw24E7FMVzeemu2JNwr3r7Z1CQzvJ8z?=
 =?us-ascii?Q?jOkqXma6hTDWti24VxXrIlJhubHYn63Tmz3JS3LwW5Cit1YIFTEBudKgsSwe?=
 =?us-ascii?Q?3je1LpEv+zN5/SZSsu7A9pzHugSBqp02V1GGfRoortuzy6hC6pDBO4qLwPj+?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 299507de-c1e2-4a85-57a3-08db2c382a7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 07:19:54.6708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5WwWEL0bMteB1FMGTyBWRiclHElpyPAp8jVwa7EW70ki7SkFesuMZXot5NG7XevAnh5Hvq71nr8Q9yNmUWhtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drn/xe: Drop usm lock around ASID xarray
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

On Thu, Mar 23, 2023 at 11:17:59PM -0700, Niranjana Vishwanathapura wrote:
> On Tue, Mar 21, 2023 at 04:42:16PM -0700, Matthew Brost wrote:
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
> >               but task is already holding lock:
> > [ 4204.449758] ffff888147c31e70 (lock#8){+.+.}-{3:3}, at: xe_vm_create_ioctl+0x1bb/0x260 [xe]
> > [ 4204.458032]
> >               which lock already depends on the new lock.
> > 
> > [ 4204.466195]
> >               the existing dependency chain (in reverse order) is:
> > [ 4204.473665]
> >               -> #2 (lock#8){+.+.}-{3:3}:
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
> >               -> #1 (&ct->lock){+.+.}-{3:3}:
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
> >               -> #0 (fs_reclaim){+.+.}-{0:0}:
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
> >               other info that might help us debug this:
> > 
> > [ 4204.676145] Chain exists of:
> >                 fs_reclaim --> &ct->lock --> lock#8
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
> >                *** DEADLOCK ***
> > 
> > [ 4204.722852] 1 lock held by xe_exec_basic/1790:
> > [ 4204.727288]  #0: ffff888147c31e70 (lock#8){+.+.}-{3:3}, at: xe_vm_create_ioctl+0x1bb/0x260 [xe]
> > [ 4204.735988]
> >               stack backtrace:
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
> 
> Are we sure this patch fixes the above splat?
> I am not seeing the above splat after the below fix.
> 'drm/xe: Use atomic instead of mutex for xe_device_mem_access_ongoing'
> 

By baseline with this splat didn't include that patch. Let me try this
again and adjust the commit message as needed.

> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt_pagefault.c | 4 ----
> > drivers/gpu/drm/xe/xe_vm.c           | 4 ----
> > 2 files changed, 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index d7bf6b0a0697..76ec40567a78 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -119,11 +119,9 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > 	bool atomic;
> > 
> > 	/* ASID to VM */
> > -	mutex_lock(&xe->usm.lock);
> > 	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
> > 	if (vm)
> > 		xe_vm_get(vm);
> > -	mutex_unlock(&xe->usm.lock);
> 
> I am seeing there are other xarrays like xref->engine.xa and xref->vm.xa
> which do use locking around them. Perhaps we need make this a separate
> patch and address them as well?
> 

Yep we should fix those too as I believe I added this mutex because I
referenced xref->engine.xa and xref->vm.xa. Will include patches for
those in the next rev.

Matt

> Niranjana
> 
> > 	if (!vm || !xe_vm_in_fault_mode(vm))
> > 		return -EINVAL;
> > 
> > @@ -507,11 +505,9 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> > 		return -EINVAL;
> > 
> > 	/* ASID to VM */
> > -	mutex_lock(&xe->usm.lock);
> > 	vm = xa_load(&xe->usm.asid_to_vm, acc->asid);
> > 	if (vm)
> > 		xe_vm_get(vm);
> > -	mutex_unlock(&xe->usm.lock);
> > 	if (!vm || !xe_vm_in_fault_mode(vm))
> > 		return -EINVAL;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index ab036a51d17e..e7674612a57e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1377,10 +1377,8 @@ static void vm_destroy_work_func(struct work_struct *w)
> > 		xe_pm_runtime_put(xe);
> > 
> > 		if (xe->info.has_asid) {
> > -			mutex_lock(&xe->usm.lock);
> > 			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
> > 			XE_WARN_ON(lookup != vm);
> > -			mutex_unlock(&xe->usm.lock);
> > 		}
> > 	}
> > 
> > @@ -1887,11 +1885,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > 	}
> > 
> > 	if (xe->info.has_asid) {
> > -		mutex_lock(&xe->usm.lock);
> > 		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
> > 				      XA_LIMIT(0, XE_MAX_ASID - 1),
> > 				      &xe->usm.next_asid, GFP_KERNEL);
> > -		mutex_unlock(&xe->usm.lock);
> > 		if (err) {
> > 			xe_vm_close_and_put(vm);
> > 			return err;
> > -- 
> > 2.34.1
> > 
