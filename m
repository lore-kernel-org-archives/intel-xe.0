Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8EAEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 03:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE3C10E124;
	Thu, 15 Jun 2023 03:44:36 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F6810E10F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 03:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686800673; x=1718336673;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9QwOj8E/TKHA1r7PCaUDWLn85C+93wz2TvfAlK4xMKo=;
 b=HScYzNfxJSqdY379sU8z5mJP5aiF0mNHH2d+rtcErizjFGo/rlfJR1pG
 /JS0Ei8W0r7UFdQ6fy6HUrAo2SpAU6K8GpMBwxZevlx5YHrFWU+FLk3oZ
 EsgZfgK0NSwP6eJLj/78Qd3RBXlCLcehQk8JE8pqET/MXJJmPpCP5l/IH
 nAo2RpP2jMYgAz4NDWakG3plmy9I8NjAwJTIHM1BEPWtxt0gyW85BoVx0
 2ouncnf/W/XcxRG8CE1ByprJftWconTWJSTo53Z9jFwrz/BnT5bmxPLBX
 0xkLt/Qew5CZT57oDYlfakOLFnFAWOh3cAEDtUlVEUJNgfhi7Ex2JDatp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343503216"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="343503216"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 20:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="706477949"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="706477949"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 14 Jun 2023 20:44:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 20:44:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 20:44:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 20:44:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 20:44:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo/8KBwINdAjkOHep9nN2bXyLDE8T3KfN+/5fvVwH3B0rxiSUqgJuvKG1TrHTIMp+B3SO8hkA73ctWYooO8XPCzL3vZLTye4L3M+PDBefRAWO801TZpL0Fi4Qyd3V3Hw6pH93TQkqF6crUixUXtHqZlgGQkJ9T616iK1vgtuzGfLt5qCysByY9K3gf7kquE36IWe5X68xJcmP0/guGoUzuFqVp/FjOkIJpI3V3b43Hqkt0wgC7WnO3CAteq6hj0oe4Q24875MRGMeF22+3VdB1ahB1bFhGReNAg5MNsSggU1ZBbuIMcp1ae9tGMBq66joiU6SE+ZessNzirhfdGZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKD15m5aR8/JlNCZpYlUBaxjqDyifkB3EPpmH8+2Lsg=;
 b=MC2H52SsCQqkMrrdkBIyO4KPtacorlj76mxswfjPoyDsMi0FOGDOraA08AqIXILZ00GHI6QcJvpr9WvlsEz4jN9IgOT/xm/NJDWAiCT4M+NnTCW0aUbcuTGwPZgvPRdZFvLQM8BT5P4+TSzxW7m5ltlZj30Y/9LWVqRlr0TxLtFm0bbJUDQHOHJF1QNsO2K9hnq0blFJRu+/GJCQefHp0P8CN4m2LOJfZ/OLKcqmTjPBLAEkqcjDDxk931e+v4b2fTFwK0Omgh55so7GfdxNmf87bvyro3i4T28YvItQfZ2kugpRoXW+y19WY9ZgrUBo2FbLasuGXHMqhKS9ngNMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 03:44:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 03:44:07 +0000
Date: Thu, 15 Jun 2023 03:43:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Message-ID: <ZIqI0A0IJgsl81xP@DUT025-TGLU.fm.intel.com>
References: <20230608050333.37581-1-matthew.brost@intel.com>
 <20230608050333.37581-4-matthew.brost@intel.com>
 <67f61af0e3986521ca53546535f027a38a30a9ee.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <67f61af0e3986521ca53546535f027a38a30a9ee.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: b1910fa6-0e97-4ccb-cf45-08db6d52c55c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: unAFzXNMXGe641v1jzs94MQhgIeCIKF3IxRdzPT8kT+xhfjkXzLeSCmfwFSZLmI2/xRWOnA8785W7FQJMERh1HSEkVS9gRahEKEPAe1/R6z1bgDnglrl305lIAWm59rVPPs8SIxqt9skxTbZITHkDdVmJe/zETMC28TpZ0ximxCqjfgWi7+ZQpKWVuPvtzgMfR3ebGZJZp+AYIkxbO/GCZVXljmLKWAAsBQLVqocmaFbdlAPztOmaOf4b6lNiuwGljBPIGjRf2PHe2qbw2f9gYF/QQj+8yRO6q/oHGjdscVh8vPZo9kGesxV8PfSgh7W5gmu68CqcjwFIt0NsPL7cgblYBn9wkfMivF/I54n8eytERZaH9A4LOVxoEbilV4tCdsTomGc+13/vyWb+JWwCrOZDTYObnqLtE6FxOc83dC4XB8DGusUMCMlQxk8nkfI4iuJQmKajWaJjrTE0MTymZJmtXckJAqp8ZvFEwRpVd0ONoNP2b70M3qj++Fd6YQwHh356S963l25OjFLpvxe6P7eB1aVYSPUtShcxADJz6fO19AldhGxRNhA7C7h7p/S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(6486002)(6666004)(86362001)(83380400001)(38100700002)(82960400001)(6512007)(6506007)(26005)(186003)(30864003)(5660300002)(2906002)(66946007)(6862004)(44832011)(41300700001)(8676002)(8936002)(6636002)(316002)(66556008)(4326008)(66476007)(45080400002)(478600001)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gt8Z1+9MFtLJp4FDWK+S0fjfQVgfbkmMUwnC1kYZkvf61sijz0UH1LiLCM?=
 =?iso-8859-1?Q?06JLPX2PGQaQDwdDxgBVHIKptt5vxmwbzNXJTGv+q89yRzK9vpnbKBp/O+?=
 =?iso-8859-1?Q?obYXPnt67WtyrXziZtCvEUpD2CJM9P87gcz48Fn0bKhme3Wo6eeHrqwi8H?=
 =?iso-8859-1?Q?84/13mIJrw9CZ4P990ICGg7tqjpAlzTT7J2GloAmZWaRo7Phx6Qj11RRy5?=
 =?iso-8859-1?Q?VPXpSMD5NokoTsYC5YK4Ga6DRQoBNEog/lVJUYUr/7bY8g6uPe9bTKDpSR?=
 =?iso-8859-1?Q?Env7e/goXD3FA2MsMXmjiMKd78Ayp3kkt3rs3DZ2Gm165XfjS1L4GIGmgd?=
 =?iso-8859-1?Q?+nmypsT29HV2WbnO1zNsq2qY21meU6p4xH6RJ7YTh6s1/i450VmQh05GVq?=
 =?iso-8859-1?Q?2dQoSyorzP6Ma2/vfxhkPgHcC9iF1tvtJ/B0u19FskWydRz76THeft5A36?=
 =?iso-8859-1?Q?/15Luc27fNj6FBE9t6kjyjbR4hB/kmIrQ0XpqdnnUXpS6MzB9Cuqnybeky?=
 =?iso-8859-1?Q?rQX0cXzJ4lq2w/EKm8+uNjobVEEGDHXAE15aOMDstF5S4N8Pz0jTsC6daN?=
 =?iso-8859-1?Q?i+mHq+AzIwZ5Oc378rqtWLrPCwqLQ2B0iQI5UuaSNKfXwrzxiOvDLlz5Jz?=
 =?iso-8859-1?Q?bkZGVNN2IwuERtGm1FjO6+oZS9heD8ywGE465PCPhI3VlsoCzaoot5CnxG?=
 =?iso-8859-1?Q?QrlW6SY/vUFpcLt0eKh2S1O1nf6l8Su89vVc/KaW/W+ZA67Bkmws8sG+EK?=
 =?iso-8859-1?Q?UUfEjf3v2HQ0s0R0hDa0qEsp1chT+3qMajez4oxtHswD39BZBm2hoHxbce?=
 =?iso-8859-1?Q?MTFYQvVagG1QazzKM2UIxEk1fD+DWQC2iGv6TouOVXm1TQK/LLkZ7OUV/7?=
 =?iso-8859-1?Q?kAwaD+j4KikOj7TlqzPVP2KaWSJ6fqMAOSE3Rwdk4MAkTPs9EIxc0VnK0O?=
 =?iso-8859-1?Q?L2Ic6KG4Kq0gtyknDvsHORizm+H4QjuP+2Wt/JEX0kVc8UO3T7uKFx5DLt?=
 =?iso-8859-1?Q?EmPwKwR5wWiLooqoImr1fKDrz96fSf2+nqIAU0jlvtzbItmOxcwzpBYrUT?=
 =?iso-8859-1?Q?qVgrg1Ik+UCCNouH6jfTkps2zswfoIChVjWvXU0w/kdKu10o6SqrCssi18?=
 =?iso-8859-1?Q?wpfVNxFbKrn662bT4P53WllaWman5zj4b5Cfmcju8+5fVihrQHD6EmErkl?=
 =?iso-8859-1?Q?Uk6havk4cP8nL3BWUqMiZpNAcjdCeNq35V1770SvIAMIy9d8/vMSwP0+V0?=
 =?iso-8859-1?Q?gO/PGkifFO9Fa/RIB2Vq61qWM7lOrGXNSFLwxuqUGWD5/3tv9Rs4R5NuvN?=
 =?iso-8859-1?Q?ZlifjYDORi2dsQlTNudeVfLk8Y15+a4+u5a92LFzWDHh1+a2ku+g3u2FYG?=
 =?iso-8859-1?Q?xlbfGYZeSIu/U7oTjVvvJU2iT7pHq1Y+EtOI8TDEkMRgFbgYw4WfsfHVcQ?=
 =?iso-8859-1?Q?ccH4/gccgwPX8MZ0oIwrJAFIsIo7ntnQDu6GtR1nv+hQBC8cNjbR25go6u?=
 =?iso-8859-1?Q?lTjlaQc0jakuq0g85/qKcEamTcd8/b6C69+QDDpUXXgvUBppNiY74+Ki08?=
 =?iso-8859-1?Q?KKkIKD1H+U2UZMP65Zs2EcuwC7iI8/wzdvDH9hTDZjB1F6s+958mAkzYp9?=
 =?iso-8859-1?Q?tnpP3WTOgXIyWGkYM6iPJ2/5Sv6uAuKvlYOHNqbfLeY46uG2lmcwAJrA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1910fa6-0e97-4ccb-cf45-08db6d52c55c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 03:44:07.2498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZDRRwKxoxjwe/6tN5JlYda/tKpUpDWTt2Hzfq8bLZvkoY1HAMKRmE05o9hr6jP/Qt55tFCvkWLVczpR13xq4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: NULL binding implementation
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jun 14, 2023 at 12:48:38PM -0600, Zanoni, Paulo R wrote:
> On Wed, 2023-06-07 at 22:03 -0700, Matthew Brost wrote:
> > Add uAPI and implementation for NULL bindings. A NULL binding is define=
d
> > as writes dropped and read zero. A single bit in the uAPI has been adde=
d
> > which results in a single bit in the PTEs being set.
> >=20
> > NULL bindings are indended to be used to implement VK sparse bindings,
> > in particular residencyNonResidentStrict property.
>=20
> I tried to test this on my Mesa Sparse branch, and I'm getting BUG()s.
> The interesting thing about this is that multiple BUG()s are competing
> to appear on dmesg at the same time. Perhaps there's some kind of race
> condition here? I'd happily try experimental patches for this.
>=20

I see the problem, will fix. Thanks.

Matt

> [  582.816170] ------------[ cut here ]------------
> [  582.816170] ------------[ cut here ]------------
> [  582.816172] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:67!
> [  582.816173] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:67!
> [  582.816180] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> [  582.816183] CPU: 0 PID: 18152 Comm: deqp-vk Tainted: G        W       =
   6.3.0pz+ #90
> [  582.816185] Hardware name: ASUSTeK COMPUTER INC. ZenBook UX325EA_UX325=
EA/UX325EA, BIOS UX325EA.316 06/10/2022
> [  582.816186] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  582.816245] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  582.816246] RSP: 0018:ffffa6170f3c7a40 EFLAGS: 00010202
> [  582.816248] RAX: ffff8a3d28398000 RBX: ffff8a3da44cce00 RCX: 000000000=
0000002
> [  582.816249] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3da=
44cee00
> [  582.816250] RBP: ffff8a3cd4e5f400 R08: ffff8a3da44cee60 R09: 000000000=
0000001
> [  582.816251] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  582.816252] R13: 0000000000020000 R14: ffff8a3da44cee00 R15: ffff8a3da=
44cee00
> [  582.816253] FS:  00007f9088034740(0000) GS:ffff8a4060400000(0000) knlG=
S:0000000000000000
> [  582.816254] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  582.816256] CR2: 000055c1f75fc1a4 CR3: 000000013c396002 CR4: 000000000=
0770ef0
> [  582.816257] PKRU: 55555554
> [  582.816258] Call Trace:
> [  582.816260]  <TASK>
> [  582.816262]  ? xe_vma_create+0x59/0x2d0 [xe]
> [  582.816304]  vm_bind_ioctl_lookup_vma+0xc21/0xef0 [xe]
> [  582.816345]  ? update_load_avg+0x7e/0x780
> [  582.816348]  ? __cgroup_account_cputime+0x4c/0x70
> [  582.816351]  ? __vm_bind_ioctl_lookup_vma.constprop.0+0x8f/0x150 [xe]
> [  582.816391]  ? psi_group_change+0x152/0x3d0
> [  582.816394]  ? select_task_rq_fair+0x174/0x1720
> [  582.816396]  ? _raw_spin_lock_irqsave+0x23/0x50
> [  582.816399]  ? lock_timer_base+0x61/0x80
> [  582.816401]  ? preempt_count_add+0x6a/0xa0
> [  582.816404]  ? _raw_spin_unlock+0x15/0x30
> [  582.816406]  ? drm_syncobj_find+0x49/0x80 [drm]
> [  582.816434]  ? xe_sync_entry_parse+0xcd/0x640 [xe]
> [  582.816473]  xe_vm_bind_ioctl+0x122a/0x2430 [xe]
> [  582.816514]  ? tomoyo_init_request_info+0x95/0xc0
> [  582.816516]  ? tomoyo_path_number_perm+0x68/0x1d0
> [  582.816519]  ? drm_syncobj_get_handle+0x74/0x100 [drm]
> [  582.816540]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  582.816581]  drm_ioctl_kernel+0xbe/0x160 [drm]
> [  582.816606]  drm_ioctl+0x24c/0x490 [drm]
> [  582.816628]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  582.816669]  __x64_sys_ioctl+0x8d/0xd0
> [  582.816672]  do_syscall_64+0x37/0x90
> [  582.816674]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  582.816678] RIP: 0033:0x7f9087d1cafb
> [  582.816679] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [  582.816681] RSP: 002b:00007ffd011743e0 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [  582.816682] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f908=
7d1cafb
> [  582.816683] RDX: 00007ffd011744c0 RSI: 0000000040786445 RDI: 000000000=
000000e
> [  582.816684] RBP: 00007ffd01174470 R08: 0000000000000000 R09: 000000000=
0000078
> [  582.816685] R10: 00007ffd011721e3 R11: 0000000000000246 R12: 000000000=
0000000
> [  582.816686] R13: 00007ffd011763a8 R14: 0000000000000000 R15: 00007f908=
847c020
> [  582.816687]  </TASK>
> [  582.816687] Modules linked in: ccm rfcomm cmac algif_hash algif_skciph=
er af_alg qrtr bnep nls_ascii nls_cp437 vfat fat snd_ctl_led snd_soc_skl_hd=
a_dsp snd_soc_intel_hda_dsp_common snd_soc_hdac_hdmi snd_sof_probes snd_soc=
_dmic joydev snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic=
 btusb btrtl btbcm btintel btmtk snd_sof_pci_intel_tgl snd_sof_intel_hda_co=
mmon x86_pkg_temp_thermal intel_powerclamp coretemp snd_soc_acpi_intel_matc=
h snd_soc_hdac_hda snd_sof_pci kvm_intel snd_sof_xtensa_dsp iwlmvm bluetoot=
h snd_sof_intel_hda kvm mac80211 snd_sof snd_sof_utils snd_hda_ext_core snd=
_soc_acpi libarc4 irqbypass crc32_pclmul snd_soc_core jitterentropy_rng gha=
sh_clmulni_intel snd_compress iwlwifi sha512_ssse3 snd_hda_intel sha512_gen=
eric snd_intel_dspcfg mei_hdcp intel_rapl_msr ctr snd_hda_codec uvcvideo cf=
g80211 asus_nb_wmi drbg aesni_intel videobuf2_vmalloc videobuf2_memops asus=
_wmi snd_hwdep uvc ansi_cprng videobuf2_v4l2 crypto_simd ledtrig_audio cryp=
td ecdh_generic sparse_keymap snd_hda_core ecc platform_profile
> [  582.816717]  iTCO_wdt videodev snd_pcm intel_pmc_bxt intel_cstate iTCO=
_vendor_support intel_uncore videobuf2_common mc pcspkr watchdog processor_=
thermal_device_pci_legacy snd_timer mei_me wmi_bmof intel_soc_dts_iosf snd =
processor_thermal_device ucsi_acpi mei soundcore processor_thermal_rfim typ=
ec_ucsi processor_thermal_mbox rfkill processor_thermal_rapl roles typec in=
tel_rapl_common int3403_thermal battery int340x_thermal_zone int3400_therma=
l intel_pmc_core button acpi_thermal_rel acpi_tad acpi_pad evdev hid_multit=
ouch serio_raw msr parport_pc ppdev lp parport fuse efi_pstore configfs efi=
varfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 r81=
52 mii nvme nvme_core t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_gene=
ric xe hid_generic drm_ttm_helper ttm i2c_algo_bit gpu_sched drm_buddy drm_=
suballoc_helper drm_display_helper drm_kms_helper rtsx_pci_sdmmc xhci_pci m=
mc_core xhci_hcd crct10dif_pclmul drm crct10dif_common crc32c_intel usbcore=
 rtsx_pci i2c_i801 intel_lpss_pci cec i2c_smbus i2c_hid_acpi
> [  582.816749]  intel_lpss rc_core i2c_hid idma64 vmd usb_common hid vide=
o wmi
> [  582.816754] ---[ end trace 0000000000000000 ]---
> [  582.816755] invalid opcode: 0000 [#2] PREEMPT SMP NOPTI
> [  582.816757] CPU: 1 PID: 18149 Comm: deqp-vk Tainted: G      D W       =
   6.3.0pz+ #90
> [  582.816759] Hardware name: ASUSTeK COMPUTER INC. ZenBook UX325EA_UX325=
EA/UX325EA, BIOS UX325EA.316 06/10/2022
> [  582.816760] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  582.816809] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  582.816811] RSP: 0018:ffffa6170f327a40 EFLAGS: 00010202
> [  582.816812] RAX: ffff8a3cc48d5f40 RBX: ffff8a3dfe41d200 RCX: 000000000=
0000002
> [  582.816813] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3df=
e6c9200
> [  582.816814] RBP: ffff8a3f0c6c6400 R08: ffff8a3dfe6c9260 R09: 000000000=
0000001
> [  582.816815] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  582.816816] R13: 0000000000020000 R14: ffff8a3dfe6c9200 R15: ffff8a3df=
e6c9200
> [  582.816817] FS:  00007f0c7e81f740(0000) GS:ffff8a4060440000(0000) knlG=
S:0000000000000000
> [  582.816818] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  582.816819] CR2: 000055e47877c1a4 CR3: 000000013c2a2005 CR4: 000000000=
0770ee0
> [  582.816820] PKRU: 55555554
> [  582.816821] Call Trace:
> [  582.816822]  <TASK>
> [  582.816824]  ? xe_vma_create+0x59/0x2d0 [xe]
> [  582.816865]  vm_bind_ioctl_lookup_vma+0xc21/0xef0 [xe]
> [  582.816906]  ? update_load_avg+0x7e/0x780
> [  582.816908]  ? __cgroup_account_cputime+0x4c/0x70
> [  582.816910]  ? __vm_bind_ioctl_lookup_vma.constprop.0+0x8f/0x150 [xe]
> [  582.816950]  ? psi_group_change+0x152/0x3d0
> [  582.816952]  ? select_task_rq_fair+0x174/0x1720
> [  582.816954]  ? _raw_spin_lock_irqsave+0x23/0x50
> [  582.816957]  ? _raw_spin_lock_irqsave+0x23/0x50
> [  582.816959]  ? preempt_count_add+0x6a/0xa0
> [  582.816961]  ? _raw_spin_unlock+0x15/0x30
> [  582.816963]  ? drm_syncobj_find+0x49/0x80 [drm]
> [  582.816986]  ? xe_sync_entry_parse+0xcd/0x640 [xe]
> [  582.817027]  xe_vm_bind_ioctl+0x122a/0x2430 [xe]
> [  582.817068]  ? tomoyo_init_request_info+0x95/0xc0
> [  582.817070]  ? tomoyo_path_number_perm+0x68/0x1d0
> [  582.817072]  ? drm_syncobj_get_handle+0x74/0x100 [drm]
> [  582.817094]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  582.817135]  drm_ioctl_kernel+0xbe/0x160 [drm]
> [  582.817160]  drm_ioctl+0x24c/0x490 [drm]
> [  582.817183]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  582.817234]  __x64_sys_ioctl+0x8d/0xd0
> [  582.817237]  do_syscall_64+0x37/0x90
> [  582.817240]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  582.817243] RIP: 0033:0x7f0c7e43dafb
> [  582.817245] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [  582.817246] RSP: 002b:00007ffcbf6e36e0 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [  582.817248] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f0c7=
e43dafb
> [  582.817249] RDX: 00007ffcbf6e37c0 RSI: 0000000040786445 RDI: 000000000=
000000e
> [  582.817250] RBP: 00007ffcbf6e3770 R08: 0000000000000000 R09: 000000000=
0000078
> [  582.817251] R10: 00007ffcbf6e14e3 R11: 0000000000000246 R12: 000000000=
0000000
> [  582.817252] R13: 00007ffcbf6e56a8 R14: 0000000000000000 R15: 00007f0c7=
eb13020
> [  582.817253]  </TASK>
> [  582.817254] Modules linked in: ccm rfcomm cmac algif_hash algif_skciph=
er af_alg qrtr bnep nls_ascii nls_cp437 vfat fat snd_ctl_led snd_soc_skl_hd=
a_dsp snd_soc_intel_hda_dsp_common snd_soc_hdac_hdmi snd_sof_probes snd_soc=
_dmic joydev snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic=
 btusb btrtl btbcm btintel btmtk snd_sof_pci_intel_tgl snd_sof_intel_hda_co=
mmon x86_pkg_temp_thermal intel_powerclamp coretemp snd_soc_acpi_intel_matc=
h snd_soc_hdac_hda snd_sof_pci kvm_intel snd_sof_xtensa_dsp iwlmvm bluetoot=
h snd_sof_intel_hda kvm mac80211 snd_sof snd_sof_utils snd_hda_ext_core snd=
_soc_acpi libarc4 irqbypass crc32_pclmul snd_soc_core jitterentropy_rng gha=
sh_clmulni_intel snd_compress iwlwifi sha512_ssse3 snd_hda_intel sha512_gen=
eric snd_intel_dspcfg mei_hdcp intel_rapl_msr ctr snd_hda_codec uvcvideo cf=
g80211 asus_nb_wmi drbg aesni_intel videobuf2_vmalloc videobuf2_memops asus=
_wmi snd_hwdep uvc ansi_cprng videobuf2_v4l2 crypto_simd ledtrig_audio cryp=
td ecdh_generic sparse_keymap snd_hda_core ecc platform_profile
> [  582.817288]  iTCO_wdt videodev snd_pcm intel_pmc_bxt intel_cstate iTCO=
_vendor_support intel_uncore videobuf2_common mc pcspkr watchdog processor_=
thermal_device_pci_legacy snd_timer mei_me wmi_bmof intel_soc_dts_iosf snd =
processor_thermal_device ucsi_acpi mei soundcore processor_thermal_rfim typ=
ec_ucsi processor_thermal_mbox rfkill processor_thermal_rapl roles typec in=
tel_rapl_common int3403_thermal battery int340x_thermal_zone int3400_therma=
l intel_pmc_core button acpi_thermal_rel acpi_tad acpi_pad evdev hid_multit=
ouch serio_raw msr parport_pc ppdev lp parport fuse efi_pstore configfs efi=
varfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 r81=
52 mii nvme nvme_core t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_gene=
ric xe hid_generic drm_ttm_helper ttm i2c_algo_bit gpu_sched drm_buddy drm_=
suballoc_helper drm_display_helper drm_kms_helper rtsx_pci_sdmmc xhci_pci m=
mc_core xhci_hcd crct10dif_pclmul drm crct10dif_common crc32c_intel usbcore=
 rtsx_pci i2c_i801 intel_lpss_pci cec i2c_smbus i2c_hid_acpi
> [  582.817324]  intel_lpss rc_core i2c_hid idma64 vmd usb_common hid vide=
o wmi
> [  582.817341] ---[ end trace 0000000000000000 ]---
> [  583.825648] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  583.825739] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  583.825741] RSP: 0018:ffffa6170f3c7a40 EFLAGS: 00010202
> [  583.825744] RAX: ffff8a3d28398000 RBX: ffff8a3da44cce00 RCX: 000000000=
0000002
> [  583.825746] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3da=
44cee00
> [  583.825748] RBP: ffff8a3cd4e5f400 R08: ffff8a3da44cee60 R09: 000000000=
0000001
> [  583.825749] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  583.825750] R13: 0000000000020000 R14: ffff8a3da44cee00 R15: ffff8a3da=
44cee00
> [  583.825752] FS:  00007f9088034740(0000) GS:ffff8a4060400000(0000) knlG=
S:0000000000000000
> [  583.825754] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  583.825756] CR2: 000055c1f75fc1a4 CR3: 000000013c396002 CR4: 000000000=
0770ef0
> [  583.825757] PKRU: 55555554
> [  584.824359] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  584.824440] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  584.824442] RSP: 0018:ffffa6170f3c7a40 EFLAGS: 00010202
> [  584.824445] RAX: ffff8a3d28398000 RBX: ffff8a3da44cce00 RCX: 000000000=
0000002
> [  584.824446] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3da=
44cee00
> [  584.824448] RBP: ffff8a3cd4e5f400 R08: ffff8a3da44cee60 R09: 000000000=
0000001
> [  584.824449] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  584.824450] R13: 0000000000020000 R14: ffff8a3da44cee00 R15: ffff8a3da=
44cee00
> [  584.824451] FS:  00007f0c7e81f740(0000) GS:ffff8a4060440000(0000) knlG=
S:0000000000000000
> [  584.824453] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  584.824454] CR2: 000055e47877c1a4 CR3: 000000013c2a2005 CR4: 000000000=
0770ee0
> [  584.824456] PKRU: 55555554
> [  584.923394] ------------[ cut here ]------------
> [  584.923398] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:67!
> [  584.923413] invalid opcode: 0000 [#3] PREEMPT SMP NOPTI
> [  584.923416] CPU: 5 PID: 18148 Comm: deqp-vk Tainted: G      D W       =
   6.3.0pz+ #90
> [  584.923418] Hardware name: ASUSTeK COMPUTER INC. ZenBook UX325EA_UX325=
EA/UX325EA, BIOS UX325EA.316 06/10/2022
> [  584.923420] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  584.923492] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  584.923494] RSP: 0018:ffffa6170f3afa40 EFLAGS: 00010202
> [  584.923497] RAX: ffff8a3cc8455f40 RBX: ffff8a3dfe6ad200 RCX: 000000000=
0000002
> [  584.923499] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3df=
e6af800
> [  584.923500] RBP: ffff8a3f0c74e000 R08: ffff8a3dfe6af860 R09: 000000000=
0000001
> [  584.923501] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  584.923502] R13: 0000000000020000 R14: ffff8a3dfe6af800 R15: ffff8a3df=
e6af800
> [  584.923503] FS:  00007f6e7e01c740(0000) GS:ffff8a4060540000(0000) knlG=
S:0000000000000000
> [  584.923504] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  584.923505] CR2: 00005639e8e701a4 CR3: 000000018b27c003 CR4: 000000000=
0770ee0
> [  584.923507] PKRU: 55555554
> [  584.923508] Call Trace:
> [  584.923511]  <TASK>
> [  584.923513]  ? xe_vma_create+0x59/0x2d0 [xe]
> [  584.923569]  vm_bind_ioctl_lookup_vma+0xc21/0xef0 [xe]
> [  584.923610]  ? update_load_avg+0x7e/0x780
> [  584.923613]  ? __cgroup_account_cputime+0x4c/0x70
> [  584.923616]  ? __vm_bind_ioctl_lookup_vma.constprop.0+0x8f/0x150 [xe]
> [  584.923655]  ? psi_group_change+0x152/0x3d0
> [  584.923658]  ? select_task_rq_fair+0x174/0x1720
> [  584.923660]  ? _raw_spin_lock_irqsave+0x23/0x50
> [  584.923663]  ? lock_timer_base+0x61/0x80
> [  584.923665]  ? preempt_count_add+0x6a/0xa0
> [  584.923667]  ? _raw_spin_unlock+0x15/0x30
> [  584.923670]  ? drm_syncobj_find+0x49/0x80 [drm]
> [  584.923697]  ? xe_sync_entry_parse+0xcd/0x640 [xe]
> [  584.923737]  xe_vm_bind_ioctl+0x122a/0x2430 [xe]
> [  584.923776]  ? tomoyo_init_request_info+0x95/0xc0
> [  584.923780]  ? tomoyo_path_number_perm+0x68/0x1d0
> [  584.923782]  ? drm_syncobj_get_handle+0x74/0x100 [drm]
> [  584.923803]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  584.923842]  drm_ioctl_kernel+0xbe/0x160 [drm]
> [  584.923870]  drm_ioctl+0x24c/0x490 [drm]
> [  584.923893]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  584.923938]  __x64_sys_ioctl+0x8d/0xd0
> [  584.923942]  do_syscall_64+0x37/0x90
> [  584.923944]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  584.923948] RIP: 0033:0x7f6e7dc3dafb
> [  584.923949] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [  584.923951] RSP: 002b:00007ffcc1247030 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [  584.923952] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f6e7=
dc3dafb
> [  584.923953] RDX: 00007ffcc1247110 RSI: 0000000040786445 RDI: 000000000=
000000e
> [  584.923954] RBP: 00007ffcc12470c0 R08: 0000000000000000 R09: 000000000=
0000078
> [  584.923955] R10: 00007ffcc1244e33 R11: 0000000000000246 R12: 000000000=
0000000
> [  584.923956] R13: 00007ffcc1248ff8 R14: 0000000000000000 R15: 00007f6e7=
e378020
> [  584.923957]  </TASK>
> [  584.923958] Modules linked in: ccm rfcomm cmac algif_hash algif_skciph=
er af_alg qrtr bnep nls_ascii nls_cp437 vfat fat snd_ctl_led snd_soc_skl_hd=
a_dsp snd_soc_intel_hda_dsp_common snd_soc_hdac_hdmi snd_sof_probes snd_soc=
_dmic joydev snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic=
 btusb btrtl btbcm btintel btmtk snd_sof_pci_intel_tgl snd_sof_intel_hda_co=
mmon x86_pkg_temp_thermal intel_powerclamp coretemp snd_soc_acpi_intel_matc=
h snd_soc_hdac_hda snd_sof_pci kvm_intel snd_sof_xtensa_dsp iwlmvm bluetoot=
h snd_sof_intel_hda kvm mac80211 snd_sof snd_sof_utils snd_hda_ext_core snd=
_soc_acpi libarc4 irqbypass crc32_pclmul snd_soc_core jitterentropy_rng gha=
sh_clmulni_intel snd_compress iwlwifi sha512_ssse3 snd_hda_intel sha512_gen=
eric snd_intel_dspcfg mei_hdcp intel_rapl_msr ctr snd_hda_codec uvcvideo cf=
g80211 asus_nb_wmi drbg aesni_intel videobuf2_vmalloc videobuf2_memops asus=
_wmi snd_hwdep uvc ansi_cprng videobuf2_v4l2 crypto_simd ledtrig_audio cryp=
td ecdh_generic sparse_keymap snd_hda_core ecc platform_profile
> [  584.923991]  iTCO_wdt videodev snd_pcm intel_pmc_bxt intel_cstate iTCO=
_vendor_support intel_uncore videobuf2_common mc pcspkr watchdog processor_=
thermal_device_pci_legacy snd_timer mei_me wmi_bmof intel_soc_dts_iosf snd =
processor_thermal_device ucsi_acpi mei soundcore processor_thermal_rfim typ=
ec_ucsi processor_thermal_mbox rfkill processor_thermal_rapl roles typec in=
tel_rapl_common int3403_thermal battery int340x_thermal_zone int3400_therma=
l intel_pmc_core button acpi_thermal_rel acpi_tad acpi_pad evdev hid_multit=
ouch serio_raw msr parport_pc ppdev lp parport fuse efi_pstore configfs efi=
varfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 r81=
52 mii nvme nvme_core t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_gene=
ric xe hid_generic drm_ttm_helper ttm i2c_algo_bit gpu_sched drm_buddy drm_=
suballoc_helper drm_display_helper drm_kms_helper rtsx_pci_sdmmc xhci_pci m=
mc_core xhci_hcd crct10dif_pclmul drm crct10dif_common crc32c_intel usbcore=
 rtsx_pci i2c_i801 intel_lpss_pci cec i2c_smbus i2c_hid_acpi
> [  584.924025]  intel_lpss rc_core i2c_hid idma64 vmd usb_common hid vide=
o wmi
> [  584.924031] ---[ end trace 0000000000000000 ]---
> [  586.008597] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  586.008679] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  586.008681] RSP: 0018:ffffa6170f3c7a40 EFLAGS: 00010202
> [  586.008684] RAX: ffff8a3d28398000 RBX: ffff8a3da44cce00 RCX: 000000000=
0000002
> [  586.008685] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3da=
44cee00
> [  586.008687] RBP: ffff8a3cd4e5f400 R08: ffff8a3da44cee60 R09: 000000000=
0000001
> [  586.008688] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  586.008689] R13: 0000000000020000 R14: ffff8a3da44cee00 R15: ffff8a3da=
44cee00
> [  586.008691] FS:  00007f6e7e01c740(0000) GS:ffff8a4060540000(0000) knlG=
S:0000000000000000
> [  586.008692] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  586.008694] CR2: 00005639e8e701a4 CR3: 000000018b27c003 CR4: 000000000=
0770ee0
> [  586.008695] PKRU: 55555554
> [  586.010521] ------------[ cut here ]------------
> [  586.010524] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:67!
> [  586.010531] invalid opcode: 0000 [#4] PREEMPT SMP NOPTI
> [  586.010534] CPU: 6 PID: 18150 Comm: deqp-vk Tainted: G      D W       =
   6.3.0pz+ #90
> [  586.010537] Hardware name: ASUSTeK COMPUTER INC. ZenBook UX325EA_UX325=
EA/UX325EA, BIOS UX325EA.316 06/10/2022
> [  586.010538] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  586.010616] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  586.010618] RSP: 0018:ffffa6170f3b7a40 EFLAGS: 00010202
> [  586.010621] RAX: ffff8a3d273b5f40 RBX: ffff8a3f0c45d000 RCX: 000000000=
0000002
> [  586.010622] RDX: 0000000000000013 RSI: ffff8a3cc1f14000 RDI: ffff8a3f0=
c483000
> [  586.010623] RBP: ffff8a3d20083800 R08: ffff8a3f0c483060 R09: 000000000=
0000001
> [  586.010625] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  586.010626] R13: 0000000000020000 R14: ffff8a3f0c483000 R15: ffff8a3f0=
c483000
> [  586.010627] FS:  00007ff676bb2740(0000) GS:ffff8a4060580000(0000) knlG=
S:0000000000000000
> [  586.010628] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  586.010630] CR2: 000056437f23d1a4 CR3: 00000002c5f46002 CR4: 000000000=
0770ee0
> [  586.010632] PKRU: 55555554
> [  586.010632] Call Trace:
> [  586.010635]  <TASK>
> [  586.010638]  ? xe_vma_create+0x59/0x2d0 [xe]
> [  586.010702]  vm_bind_ioctl_lookup_vma+0xc21/0xef0 [xe]
> [  586.010764]  ? update_load_avg+0x7e/0x780
> [  586.010768]  ? __cgroup_account_cputime+0x4c/0x70
> [  586.010772]  ? __vm_bind_ioctl_lookup_vma.constprop.0+0x8f/0x150 [xe]
> [  586.010833]  ? psi_group_change+0x152/0x3d0
> [  586.010837]  ? select_task_rq_fair+0x174/0x1720
> [  586.010840]  ? _raw_spin_lock_irqsave+0x23/0x50
> [  586.010844]  ? lock_timer_base+0x61/0x80
> [  586.010846]  ? preempt_count_add+0x6a/0xa0
> [  586.010849]  ? _raw_spin_unlock+0x15/0x30
> [  586.010852]  ? drm_syncobj_find+0x49/0x80 [drm]
> [  586.010889]  ? xe_sync_entry_parse+0xcd/0x640 [xe]
> [  586.010955]  xe_vm_bind_ioctl+0x122a/0x2430 [xe]
> [  586.011018]  ? tomoyo_init_request_info+0x95/0xc0
> [  586.011022]  ? tomoyo_path_number_perm+0x68/0x1d0
> [  586.011024]  ? drm_syncobj_get_handle+0x74/0x100 [drm]
> [  586.011064]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  586.011124]  drm_ioctl_kernel+0xbe/0x160 [drm]
> [  586.011161]  drm_ioctl+0x24c/0x490 [drm]
> [  586.011193]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  586.011261]  __x64_sys_ioctl+0x8d/0xd0
> [  586.011265]  do_syscall_64+0x37/0x90
> [  586.011268]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  586.011272] RIP: 0033:0x7ff676d1cafb
> [  586.011275] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [  586.011276] RSP: 002b:00007ffeacdccf10 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [  586.011279] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ff67=
6d1cafb
> [  586.011280] RDX: 00007ffeacdccff0 RSI: 0000000040786445 RDI: 000000000=
000000e
> [  586.011281] RBP: 00007ffeacdccfa0 R08: 0000000000000000 R09: 000000000=
0000078
> [  586.011283] R10: 00007ffeacdcad13 R11: 0000000000000246 R12: 000000000=
0000000
> [  586.011284] R13: 00007ffeacdceed8 R14: 0000000000000000 R15: 00007ff67=
74af020
> [  586.011286]  </TASK>
> [  586.011287] Modules linked in: ccm rfcomm cmac algif_hash algif_skciph=
er af_alg qrtr bnep nls_ascii nls_cp437 vfat fat snd_ctl_led snd_soc_skl_hd=
a_dsp snd_soc_intel_hda_dsp_common snd_soc_hdac_hdmi snd_sof_probes snd_soc=
_dmic joydev snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic=
 btusb btrtl btbcm btintel btmtk snd_sof_pci_intel_tgl snd_sof_intel_hda_co=
mmon x86_pkg_temp_thermal intel_powerclamp coretemp snd_soc_acpi_intel_matc=
h snd_soc_hdac_hda snd_sof_pci kvm_intel snd_sof_xtensa_dsp iwlmvm bluetoot=
h snd_sof_intel_hda kvm mac80211 snd_sof snd_sof_utils snd_hda_ext_core snd=
_soc_acpi libarc4 irqbypass crc32_pclmul snd_soc_core jitterentropy_rng gha=
sh_clmulni_intel snd_compress iwlwifi sha512_ssse3 snd_hda_intel sha512_gen=
eric snd_intel_dspcfg mei_hdcp intel_rapl_msr ctr snd_hda_codec uvcvideo cf=
g80211 asus_nb_wmi drbg aesni_intel videobuf2_vmalloc videobuf2_memops asus=
_wmi snd_hwdep uvc ansi_cprng videobuf2_v4l2 crypto_simd ledtrig_audio cryp=
td ecdh_generic sparse_keymap snd_hda_core ecc platform_profile
> [  586.011337]  iTCO_wdt videodev snd_pcm intel_pmc_bxt intel_cstate iTCO=
_vendor_support intel_uncore videobuf2_common mc pcspkr watchdog processor_=
thermal_device_pci_legacy snd_timer mei_me wmi_bmof intel_soc_dts_iosf snd =
processor_thermal_device ucsi_acpi mei soundcore processor_thermal_rfim typ=
ec_ucsi processor_thermal_mbox rfkill processor_thermal_rapl roles typec in=
tel_rapl_common int3403_thermal battery int340x_thermal_zone int3400_therma=
l intel_pmc_core button acpi_thermal_rel acpi_tad acpi_pad evdev hid_multit=
ouch serio_raw msr parport_pc ppdev lp parport fuse efi_pstore configfs efi=
varfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 r81=
52 mii nvme nvme_core t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_gene=
ric xe hid_generic drm_ttm_helper ttm i2c_algo_bit gpu_sched drm_buddy drm_=
suballoc_helper drm_display_helper drm_kms_helper rtsx_pci_sdmmc xhci_pci m=
mc_core xhci_hcd crct10dif_pclmul drm crct10dif_common crc32c_intel usbcore=
 rtsx_pci i2c_i801 intel_lpss_pci cec i2c_smbus i2c_hid_acpi
> [  586.011390]  intel_lpss rc_core i2c_hid idma64 vmd usb_common hid vide=
o wmi
> [  586.011398] ---[ end trace 0000000000000000 ]---
> [  586.137384] ------------[ cut here ]------------
> [  586.137390] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:67!
> [  586.137397] invalid opcode: 0000 [#5] PREEMPT SMP NOPTI
> [  586.137401] CPU: 7 PID: 18153 Comm: deqp-vk Tainted: G      D W       =
   6.3.0pz+ #90
> [  586.137404] Hardware name: ASUSTeK COMPUTER INC. ZenBook UX325EA_UX325=
EA/UX325EA, BIOS UX325EA.316 06/10/2022
> [  586.137406] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  586.137488] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  586.137490] RSP: 0018:ffffa6170f3cfa40 EFLAGS: 00010202
> [  586.137493] RAX: ffff8a3d41f75f40 RBX: ffff8a3f0c24de00 RCX: 000000000=
0000002
> [  586.137495] RDX: 0000000000000013 RSI: ffff8a3cc1f14000 RDI: ffff8a3f0=
c24c000
> [  586.137496] RBP: ffff8a3cc6177c00 R08: ffff8a3f0c24c060 R09: 000000000=
0000001
> [  586.137498] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  586.137499] R13: 0000000000020000 R14: ffff8a3f0c24c000 R15: ffff8a3f0=
c24c000
> [  586.137501] FS:  00007fc966258740(0000) GS:ffff8a40605c0000(0000) knlG=
S:0000000000000000
> [  586.137503] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  586.137504] CR2: 00007fc963c90a9a CR3: 00000002c5ca6001 CR4: 000000000=
0770ee0
> [  586.137506] PKRU: 55555554
> [  586.137507] Call Trace:
> [  586.137510]  <TASK>
> [  586.137513]  ? xe_vma_create+0x59/0x2d0 [xe]
> [  586.137576]  vm_bind_ioctl_lookup_vma+0xc21/0xef0 [xe]
> [  586.137638]  ? update_load_avg+0x7e/0x780
> [  586.137642]  ? __cgroup_account_cputime+0x4c/0x70
> [  586.137646]  ? __vm_bind_ioctl_lookup_vma.constprop.0+0x8f/0x150 [xe]
> [  586.137705]  ? psi_group_change+0x152/0x3d0
> [  586.137710]  ? select_task_rq_fair+0x174/0x1720
> [  586.137713]  ? _raw_spin_lock_irqsave+0x23/0x50
> [  586.137717]  ? lock_timer_base+0x61/0x80
> [  586.137720]  ? preempt_count_add+0x6a/0xa0
> [  586.137723]  ? _raw_spin_unlock+0x15/0x30
> [  586.137726]  ? drm_syncobj_find+0x49/0x80 [drm]
> [  586.137765]  ? xe_sync_entry_parse+0xcd/0x640 [xe]
> [  586.137826]  xe_vm_bind_ioctl+0x122a/0x2430 [xe]
> [  586.137887]  ? tomoyo_init_request_info+0x95/0xc0
> [  586.137891]  ? tomoyo_path_number_perm+0x68/0x1d0
> [  586.137894]  ? drm_syncobj_get_handle+0x74/0x100 [drm]
> [  586.137925]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  586.137985]  drm_ioctl_kernel+0xbe/0x160 [drm]
> [  586.138017]  drm_ioctl+0x24c/0x490 [drm]
> [  586.138047]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  586.138107]  __x64_sys_ioctl+0x8d/0xd0
> [  586.138112]  do_syscall_64+0x37/0x90
> [  586.138115]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  586.138119] RIP: 0033:0x7fc96643dafb
> [  586.138122] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [  586.138124] RSP: 002b:00007ffc7383a720 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [  586.138127] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fc96=
643dafb
> [  586.138128] RDX: 00007ffc7383a800 RSI: 0000000040786445 RDI: 000000000=
000000e
> [  586.138130] RBP: 00007ffc7383a7b0 R08: 0000000000000000 R09: 000000000=
0000078
> [  586.138131] R10: 00007ffc73838523 R11: 0000000000000246 R12: 000000000=
0000000
> [  586.138132] R13: 00007ffc7383c6e8 R14: 0000000000000000 R15: 00007fc96=
6b56020
> [  586.138135]  </TASK>
> [  586.138136] Modules linked in: ccm rfcomm cmac algif_hash algif_skciph=
er af_alg qrtr bnep nls_ascii nls_cp437 vfat fat snd_ctl_led snd_soc_skl_hd=
a_dsp snd_soc_intel_hda_dsp_common snd_soc_hdac_hdmi snd_sof_probes snd_soc=
_dmic joydev snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic=
 btusb btrtl btbcm btintel btmtk snd_sof_pci_intel_tgl snd_sof_intel_hda_co=
mmon x86_pkg_temp_thermal intel_powerclamp coretemp snd_soc_acpi_intel_matc=
h snd_soc_hdac_hda snd_sof_pci kvm_intel snd_sof_xtensa_dsp iwlmvm bluetoot=
h snd_sof_intel_hda kvm mac80211 snd_sof snd_sof_utils snd_hda_ext_core snd=
_soc_acpi libarc4 irqbypass crc32_pclmul snd_soc_core jitterentropy_rng gha=
sh_clmulni_intel snd_compress iwlwifi sha512_ssse3 snd_hda_intel sha512_gen=
eric snd_intel_dspcfg mei_hdcp intel_rapl_msr ctr snd_hda_codec uvcvideo cf=
g80211 asus_nb_wmi drbg aesni_intel videobuf2_vmalloc videobuf2_memops asus=
_wmi snd_hwdep uvc ansi_cprng videobuf2_v4l2 crypto_simd ledtrig_audio cryp=
td ecdh_generic sparse_keymap snd_hda_core ecc platform_profile
> [  586.138183]  iTCO_wdt videodev snd_pcm intel_pmc_bxt intel_cstate iTCO=
_vendor_support intel_uncore videobuf2_common mc pcspkr watchdog processor_=
thermal_device_pci_legacy snd_timer mei_me wmi_bmof intel_soc_dts_iosf snd =
processor_thermal_device ucsi_acpi mei soundcore processor_thermal_rfim typ=
ec_ucsi processor_thermal_mbox rfkill processor_thermal_rapl roles typec in=
tel_rapl_common int3403_thermal battery int340x_thermal_zone int3400_therma=
l intel_pmc_core button acpi_thermal_rel acpi_tad acpi_pad evdev hid_multit=
ouch serio_raw msr parport_pc ppdev lp parport fuse efi_pstore configfs efi=
varfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 r81=
52 mii nvme nvme_core t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_gene=
ric xe hid_generic drm_ttm_helper ttm i2c_algo_bit gpu_sched drm_buddy drm_=
suballoc_helper drm_display_helper drm_kms_helper rtsx_pci_sdmmc xhci_pci m=
mc_core xhci_hcd crct10dif_pclmul drm crct10dif_common crc32c_intel usbcore=
 rtsx_pci i2c_i801 intel_lpss_pci cec i2c_smbus i2c_hid_acpi
> [  586.138236]  intel_lpss rc_core i2c_hid idma64 vmd usb_common hid vide=
o wmi
> [  586.138245] ---[ end trace 0000000000000000 ]---
> [  586.203830] ------------[ cut here ]------------
> [  586.203834] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:67!
> [  586.203841] invalid opcode: 0000 [#6] PREEMPT SMP NOPTI
> [  586.203844] CPU: 3 PID: 18151 Comm: deqp-vk Tainted: G      D W       =
   6.3.0pz+ #90
> [  586.203846] Hardware name: ASUSTeK COMPUTER INC. ZenBook UX325EA_UX325=
EA/UX325EA, BIOS UX325EA.316 06/10/2022
> [  586.203848] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  586.203920] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  586.203921] RSP: 0018:ffffa6170f3bfa40 EFLAGS: 00010202
> [  586.203924] RAX: ffff8a3cc6cedf40 RBX: ffff8a3e36f7be00 RCX: 000000000=
0000002
> [  586.203925] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3e3=
6f7a400
> [  586.203926] RBP: ffff8a3eed3e9000 R08: ffff8a3e36f7a460 R09: 000000000=
0000001
> [  586.203927] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  586.203928] R13: 0000000000020000 R14: ffff8a3e36f7a400 R15: ffff8a3e3=
6f7a400
> [  586.203929] FS:  00007ff5022c2740(0000) GS:ffff8a40604c0000(0000) knlG=
S:0000000000000000
> [  586.203930] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  586.203931] CR2: 00005637548a21a4 CR3: 0000000487fe8003 CR4: 000000000=
0770ee0
> [  586.203933] PKRU: 55555554
> [  586.203933] Call Trace:
> [  586.203936]  <TASK>
> [  586.203938]  ? xe_vma_create+0x59/0x2d0 [xe]
> [  586.203985]  vm_bind_ioctl_lookup_vma+0xc21/0xef0 [xe]
> [  586.204031]  ? update_load_avg+0x7e/0x780
> [  586.204035]  ? __cgroup_account_cputime+0x4c/0x70
> [  586.204038]  ? __vm_bind_ioctl_lookup_vma.constprop.0+0x8f/0x150 [xe]
> [  586.204081]  ? psi_group_change+0x152/0x3d0
> [  586.204084]  ? select_task_rq_fair+0x174/0x1720
> [  586.204087]  ? _raw_spin_lock_irqsave+0x23/0x50
> [  586.204090]  ? lock_timer_base+0x61/0x80
> [  586.204092]  ? preempt_count_add+0x6a/0xa0
> [  586.204095]  ? _raw_spin_unlock+0x15/0x30
> [  586.204098]  ? drm_syncobj_find+0x49/0x80 [drm]
> [  586.204131]  ? xe_sync_entry_parse+0xcd/0x640 [xe]
> [  586.204176]  xe_vm_bind_ioctl+0x122a/0x2430 [xe]
> [  586.204220]  ? tomoyo_init_request_info+0x95/0xc0
> [  586.204224]  ? tomoyo_path_number_perm+0x68/0x1d0
> [  586.204226]  ? drm_syncobj_get_handle+0x74/0x100 [drm]
> [  586.204249]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  586.266200]  drm_ioctl_kernel+0xbe/0x160 [drm]
> [  586.266241]  drm_ioctl+0x24c/0x490 [drm]
> [  586.266273]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  586.266332]  __x64_sys_ioctl+0x8d/0xd0
> [  586.266336]  do_syscall_64+0x37/0x90
> [  586.266340]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  586.266345] RIP: 0033:0x7ff5024fcafb
> [  586.266348] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [  586.266350] RSP: 002b:00007ffdca7cde00 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [  586.266353] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ff50=
24fcafb
> [  586.266354] RDX: 00007ffdca7cdee0 RSI: 0000000040786445 RDI: 000000000=
000000e
> [  586.266355] RBP: 00007ffdca7cde90 R08: 0000000000000000 R09: 000000000=
0000078
> [  586.266357] R10: 00007ffdca7cbc03 R11: 0000000000000246 R12: 000000000=
0000000
> [  586.266358] R13: 00007ffdca7cfdc8 R14: 0000000000000000 R15: 00007ff50=
2bc0020
> [  586.266361]  </TASK>
> [  586.266362] Modules linked in: ccm rfcomm cmac algif_hash algif_skciph=
er af_alg qrtr bnep nls_ascii nls_cp437 vfat fat snd_ctl_led snd_soc_skl_hd=
a_dsp snd_soc_intel_hda_dsp_common snd_soc_hdac_hdmi snd_sof_probes snd_soc=
_dmic joydev snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic=
 btusb btrtl btbcm btintel btmtk snd_sof_pci_intel_tgl snd_sof_intel_hda_co=
mmon x86_pkg_temp_thermal intel_powerclamp coretemp snd_soc_acpi_intel_matc=
h snd_soc_hdac_hda snd_sof_pci kvm_intel snd_sof_xtensa_dsp iwlmvm bluetoot=
h snd_sof_intel_hda kvm mac80211 snd_sof snd_sof_utils snd_hda_ext_core snd=
_soc_acpi libarc4 irqbypass crc32_pclmul snd_soc_core jitterentropy_rng gha=
sh_clmulni_intel snd_compress iwlwifi sha512_ssse3 snd_hda_intel sha512_gen=
eric snd_intel_dspcfg mei_hdcp intel_rapl_msr ctr snd_hda_codec uvcvideo cf=
g80211 asus_nb_wmi drbg aesni_intel videobuf2_vmalloc videobuf2_memops asus=
_wmi snd_hwdep uvc ansi_cprng videobuf2_v4l2 crypto_simd ledtrig_audio cryp=
td ecdh_generic sparse_keymap snd_hda_core ecc platform_profile
> [  586.266414]  iTCO_wdt videodev snd_pcm intel_pmc_bxt intel_cstate iTCO=
_vendor_support intel_uncore videobuf2_common mc pcspkr watchdog processor_=
thermal_device_pci_legacy snd_timer mei_me wmi_bmof intel_soc_dts_iosf snd =
processor_thermal_device ucsi_acpi mei soundcore processor_thermal_rfim typ=
ec_ucsi processor_thermal_mbox rfkill processor_thermal_rapl roles typec in=
tel_rapl_common int3403_thermal battery int340x_thermal_zone int3400_therma=
l intel_pmc_core button acpi_thermal_rel acpi_tad acpi_pad evdev hid_multit=
ouch serio_raw msr parport_pc ppdev lp parport fuse efi_pstore configfs efi=
varfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 r81=
52 mii nvme nvme_core t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_gene=
ric xe hid_generic drm_ttm_helper ttm i2c_algo_bit gpu_sched drm_buddy drm_=
suballoc_helper drm_display_helper drm_kms_helper rtsx_pci_sdmmc xhci_pci m=
mc_core xhci_hcd crct10dif_pclmul drm crct10dif_common crc32c_intel usbcore=
 rtsx_pci i2c_i801 intel_lpss_pci cec i2c_smbus i2c_hid_acpi
> [  586.266469]  intel_lpss rc_core i2c_hid idma64 vmd usb_common hid vide=
o wmi
> [  586.266495] ---[ end trace 0000000000000000 ]---
> [  586.961460] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  586.961541] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  586.961542] RSP: 0018:ffffa6170f3c7a40 EFLAGS: 00010202
> [  586.961545] RAX: ffff8a3d28398000 RBX: ffff8a3da44cce00 RCX: 000000000=
0000002
> [  586.961546] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3da=
44cee00
> [  586.961548] RBP: ffff8a3cd4e5f400 R08: ffff8a3da44cee60 R09: 000000000=
0000001
> [  586.961549] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  586.961550] R13: 0000000000020000 R14: ffff8a3da44cee00 R15: ffff8a3da=
44cee00
> [  586.961551] FS:  00007ff676bb2740(0000) GS:ffff8a4060580000(0000) knlG=
S:0000000000000000
> [  586.961552] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  586.961553] CR2: 000056437f23d1a4 CR3: 00000002c5f46002 CR4: 000000000=
0770ee0
> [  586.961555] PKRU: 55555554
> [  587.916215] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  587.916313] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  587.916316] RSP: 0018:ffffa6170f3c7a40 EFLAGS: 00010202
> [  587.916318] RAX: ffff8a3d28398000 RBX: ffff8a3da44cce00 RCX: 000000000=
0000002
> [  587.916321] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3da=
44cee00
> [  587.916322] RBP: ffff8a3cd4e5f400 R08: ffff8a3da44cee60 R09: 000000000=
0000001
> [  587.916323] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  587.916325] R13: 0000000000020000 R14: ffff8a3da44cee00 R15: ffff8a3da=
44cee00
> [  587.916326] FS:  00007fc966258740(0000) GS:ffff8a40605c0000(0000) knlG=
S:0000000000000000
> [  587.916328] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  587.916330] CR2: 00007fc963c90a9a CR3: 00000002c5ca6001 CR4: 000000000=
0770ee0
> [  587.916331] PKRU: 55555554
> [  588.857849] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  588.857933] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  588.857935] RSP: 0018:ffffa6170f3c7a40 EFLAGS: 00010202
> [  588.857937] RAX: ffff8a3d28398000 RBX: ffff8a3da44cce00 RCX: 000000000=
0000002
> [  588.857938] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3da=
44cee00
> [  588.857939] RBP: ffff8a3cd4e5f400 R08: ffff8a3da44cee60 R09: 000000000=
0000001
> [  588.857940] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  588.857941] R13: 0000000000020000 R14: ffff8a3da44cee00 R15: ffff8a3da=
44cee00
> [  588.857942] FS:  00007ff5022c2740(0000) GS:ffff8a40604c0000(0000) knlG=
S:0000000000000000
> [  588.857943] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  588.857944] CR2: 00005637548a21a4 CR3: 0000000487fe8003 CR4: 000000000=
0770ee0
> [  588.857960] PKRU: 55555554
> [  702.893558] ------------[ cut here ]------------
> [  702.893562] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:67!
> [  702.893568] invalid opcode: 0000 [#7] PREEMPT SMP NOPTI
> [  702.893571] CPU: 1 PID: 18205 Comm: deqp-vk Tainted: G      D W       =
   6.3.0pz+ #90
> [  702.893572] Hardware name: ASUSTeK COMPUTER INC. ZenBook UX325EA_UX325=
EA/UX325EA, BIOS UX325EA.316 06/10/2022
> [  702.893573] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  702.893631] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  702.893632] RSP: 0018:ffffa6170f5d3a40 EFLAGS: 00010202
> [  702.893634] RAX: ffff8a3cdb7d3f80 RBX: ffff8a3e36fc2e00 RCX: 000000000=
0000002
> [  702.893635] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3e3=
6fc0e00
> [  702.893636] RBP: ffff8a4047e6d800 R08: ffff8a3e36fc0e60 R09: 000000000=
0000001
> [  702.893637] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  702.893638] R13: 0000000000020000 R14: ffff8a3e36fc0e00 R15: ffff8a3e3=
6fc0e00
> [  702.893639] FS:  00007f5c1292f740(0000) GS:ffff8a4060440000(0000) knlG=
S:0000000000000000
> [  702.893640] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  702.893641] CR2: 00007f5c0f107000 CR3: 000000015c374005 CR4: 000000000=
0770ee0
> [  702.893642] PKRU: 55555554
> [  702.893643] Call Trace:
> [  702.893645]  <TASK>
> [  702.893647]  ? xe_vma_create+0x59/0x2d0 [xe]
> [  702.893689]  vm_bind_ioctl_lookup_vma+0xc21/0xef0 [xe]
> [  702.893730]  ? update_load_avg+0x7e/0x780
> [  702.893733]  ? __vm_bind_ioctl_lookup_vma.constprop.0+0x8f/0x150 [xe]
> [  702.893771]  ? ___slab_alloc+0x4d5/0x9a0
> [  702.893774]  ? xe_vm_bind_ioctl+0xf96/0x2430 [xe]
> [  702.893812]  ? xe_vm_bind_ioctl+0xf96/0x2430 [xe]
> [  702.893849]  ? preempt_count_add+0x6a/0xa0
> [  702.893852]  ? _raw_spin_unlock+0x15/0x30
> [  702.893855]  ? drm_syncobj_find+0x49/0x80 [drm]
> [  702.893883]  ? xe_sync_entry_parse+0xcd/0x640 [xe]
> [  702.893922]  xe_vm_bind_ioctl+0x122a/0x2430 [xe]
> [  702.893961]  ? tomoyo_init_request_info+0x95/0xc0
> [  702.893963]  ? tomoyo_path_number_perm+0x68/0x1d0
> [  702.893965]  ? drm_syncobj_get_handle+0x74/0x100 [drm]
> [  702.893986]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  702.894024]  drm_ioctl_kernel+0xbe/0x160 [drm]
> [  702.894049]  drm_ioctl+0x24c/0x490 [drm]
> [  702.894070]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  702.894109]  __x64_sys_ioctl+0x8d/0xd0
> [  702.894112]  do_syscall_64+0x37/0x90
> [  702.894114]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  702.894118] RIP: 0033:0x7f5c12b1cafb
> [  702.894119] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [  702.894121] RSP: 002b:00007ffe4ff4caf0 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [  702.894122] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f5c1=
2b1cafb
> [  702.894123] RDX: 00007ffe4ff4cbd0 RSI: 0000000040786445 RDI: 000000000=
000000e
> [  702.894124] RBP: 00007ffe4ff4cb80 R08: 0000000000000000 R09: 000000000=
0000078
> [  702.894125] R10: 00007ffe4ff4a8f3 R11: 0000000000000246 R12: 000000000=
0000000
> [  702.894125] R13: 00007ffe4ff4eab8 R14: 0000000000000000 R15: 00007f5c1=
322b020
> [  702.894127]  </TASK>
> [  702.894127] Modules linked in: ccm rfcomm cmac algif_hash algif_skciph=
er af_alg qrtr bnep nls_ascii nls_cp437 vfat fat snd_ctl_led snd_soc_skl_hd=
a_dsp snd_soc_intel_hda_dsp_common snd_soc_hdac_hdmi snd_sof_probes snd_soc=
_dmic joydev snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic=
 btusb btrtl btbcm btintel btmtk snd_sof_pci_intel_tgl snd_sof_intel_hda_co=
mmon x86_pkg_temp_thermal intel_powerclamp coretemp snd_soc_acpi_intel_matc=
h snd_soc_hdac_hda snd_sof_pci kvm_intel snd_sof_xtensa_dsp iwlmvm bluetoot=
h snd_sof_intel_hda kvm mac80211 snd_sof snd_sof_utils snd_hda_ext_core snd=
_soc_acpi libarc4 irqbypass crc32_pclmul snd_soc_core jitterentropy_rng gha=
sh_clmulni_intel snd_compress iwlwifi sha512_ssse3 snd_hda_intel sha512_gen=
eric snd_intel_dspcfg mei_hdcp intel_rapl_msr ctr snd_hda_codec uvcvideo cf=
g80211 asus_nb_wmi drbg aesni_intel videobuf2_vmalloc videobuf2_memops asus=
_wmi snd_hwdep uvc ansi_cprng videobuf2_v4l2 crypto_simd ledtrig_audio cryp=
td ecdh_generic sparse_keymap snd_hda_core ecc platform_profile
> [  702.894157]  iTCO_wdt videodev snd_pcm intel_pmc_bxt intel_cstate iTCO=
_vendor_support intel_uncore videobuf2_common mc pcspkr watchdog processor_=
thermal_device_pci_legacy snd_timer mei_me wmi_bmof intel_soc_dts_iosf snd =
processor_thermal_device ucsi_acpi mei soundcore processor_thermal_rfim typ=
ec_ucsi processor_thermal_mbox rfkill processor_thermal_rapl roles typec in=
tel_rapl_common int3403_thermal battery int340x_thermal_zone int3400_therma=
l intel_pmc_core button acpi_thermal_rel acpi_tad acpi_pad evdev hid_multit=
ouch serio_raw msr parport_pc ppdev lp parport fuse efi_pstore configfs efi=
varfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 r81=
52 mii nvme nvme_core t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_gene=
ric xe hid_generic drm_ttm_helper ttm i2c_algo_bit gpu_sched drm_buddy drm_=
suballoc_helper drm_display_helper drm_kms_helper rtsx_pci_sdmmc xhci_pci m=
mc_core xhci_hcd crct10dif_pclmul drm crct10dif_common crc32c_intel usbcore=
 rtsx_pci i2c_i801 intel_lpss_pci cec i2c_smbus i2c_hid_acpi
> [  702.894189]  intel_lpss rc_core i2c_hid idma64 vmd usb_common hid vide=
o wmi
> [  702.894194] ---[ end trace 0000000000000000 ]---
> [  703.331800] ------------[ cut here ]------------
> [  703.331804] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:67!
> [  703.331810] invalid opcode: 0000 [#8] PREEMPT SMP NOPTI
> [  703.331813] CPU: 7 PID: 18207 Comm: deqp-vk Tainted: G      D W       =
   6.3.0pz+ #90
> [  703.331815] Hardware name: ASUSTeK COMPUTER INC. ZenBook UX325EA_UX325=
EA/UX325EA, BIOS UX325EA.316 06/10/2022
> [  703.331816] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  703.331874] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  703.331876] RSP: 0018:ffffa6170f5e3a40 EFLAGS: 00010202
> [  703.331878] RAX: ffff8a3d20bd9fc0 RBX: ffff8a3e36f88400 RCX: 000000000=
0000002
> [  703.331879] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3ec=
d756200
> [  703.331880] RBP: ffff8a3eb86d6400 R08: ffff8a3ecd756260 R09: 000000000=
0000001
> [  703.331881] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  703.331881] R13: 0000000000020000 R14: ffff8a3ecd756200 R15: ffff8a3ec=
d756200
> [  703.331882] FS:  00007f924fc1d740(0000) GS:ffff8a40605c0000(0000) knlG=
S:0000000000000000
> [  703.331884] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  703.331885] CR2: 00007f9240000020 CR3: 00000002c5ee6001 CR4: 000000000=
0770ee0
> [  703.331886] PKRU: 55555554
> [  703.331887] Call Trace:
> [  703.331889]  <TASK>
> [  703.331891]  ? xe_vma_create+0x59/0x2d0 [xe]
> [  703.331933]  vm_bind_ioctl_lookup_vma+0xc21/0xef0 [xe]
> [  703.331974]  ? __vm_bind_ioctl_lookup_vma.constprop.0+0x8f/0x150 [xe]
> [  703.332010]  ? _raw_spin_lock+0x13/0x40
> [  703.332014]  ? psi_group_change+0x152/0x3d0
> [  703.332018]  ? select_task_rq_fair+0x174/0x1720
> [  703.332021]  ? _raw_spin_lock_irqsave+0x23/0x50
> [  703.332023]  ? preempt_count_add+0x6a/0xa0
> [  703.332025]  ? _raw_spin_unlock+0x15/0x30
> [  703.332028]  ? drm_syncobj_find+0x49/0x80 [drm]
> [  703.332055]  ? xe_sync_entry_parse+0xcd/0x640 [xe]
> [  703.332095]  xe_vm_bind_ioctl+0x122a/0x2430 [xe]
> [  703.332134]  ? tomoyo_init_request_info+0x95/0xc0
> [  703.332137]  ? tomoyo_path_number_perm+0x68/0x1d0
> [  703.332139]  ? drm_syncobj_get_handle+0x74/0x100 [drm]
> [  703.332160]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  703.332198]  drm_ioctl_kernel+0xbe/0x160 [drm]
> [  703.332222]  drm_ioctl+0x24c/0x490 [drm]
> [  703.332244]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  703.332283]  __x64_sys_ioctl+0x8d/0xd0
> [  703.332286]  do_syscall_64+0x37/0x90
> [  703.332288]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  703.332291] RIP: 0033:0x7f924f83dafb
> [  703.332293] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <=
89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [  703.332294] RSP: 002b:00007ffce8a0d910 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
> [  703.332295] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f924=
f83dafb
> [  703.332296] RDX: 00007ffce8a0d9f0 RSI: 0000000040786445 RDI: 000000000=
000000e
> [  703.332297] RBP: 00007ffce8a0d9a0 R08: 0000000000000000 R09: 000000000=
0000078
> [  703.332298] R10: 00007ffce8a0b713 R11: 0000000000000246 R12: 000000000=
0000000
> [  703.332299] R13: 00007ffce8a0f8d8 R14: 0000000000000000 R15: 00007f924=
ff11020
> [  703.332300]  </TASK>
> [  703.332301] Modules linked in: ccm rfcomm cmac algif_hash algif_skciph=
er af_alg qrtr bnep nls_ascii nls_cp437 vfat fat snd_ctl_led snd_soc_skl_hd=
a_dsp snd_soc_intel_hda_dsp_common snd_soc_hdac_hdmi snd_sof_probes snd_soc=
_dmic joydev snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic=
 btusb btrtl btbcm btintel btmtk snd_sof_pci_intel_tgl snd_sof_intel_hda_co=
mmon x86_pkg_temp_thermal intel_powerclamp coretemp snd_soc_acpi_intel_matc=
h snd_soc_hdac_hda snd_sof_pci kvm_intel snd_sof_xtensa_dsp iwlmvm bluetoot=
h snd_sof_intel_hda kvm mac80211 snd_sof snd_sof_utils snd_hda_ext_core snd=
_soc_acpi libarc4 irqbypass crc32_pclmul snd_soc_core jitterentropy_rng gha=
sh_clmulni_intel snd_compress iwlwifi sha512_ssse3 snd_hda_intel sha512_gen=
eric snd_intel_dspcfg mei_hdcp intel_rapl_msr ctr snd_hda_codec uvcvideo cf=
g80211 asus_nb_wmi drbg aesni_intel videobuf2_vmalloc videobuf2_memops asus=
_wmi snd_hwdep uvc ansi_cprng videobuf2_v4l2 crypto_simd ledtrig_audio cryp=
td ecdh_generic sparse_keymap snd_hda_core ecc platform_profile
> [  703.332330]  iTCO_wdt videodev snd_pcm intel_pmc_bxt intel_cstate iTCO=
_vendor_support intel_uncore videobuf2_common mc pcspkr watchdog processor_=
thermal_device_pci_legacy snd_timer mei_me wmi_bmof intel_soc_dts_iosf snd =
processor_thermal_device ucsi_acpi mei soundcore processor_thermal_rfim typ=
ec_ucsi processor_thermal_mbox rfkill processor_thermal_rapl roles typec in=
tel_rapl_common int3403_thermal battery int340x_thermal_zone int3400_therma=
l intel_pmc_core button acpi_thermal_rel acpi_tad acpi_pad evdev hid_multit=
ouch serio_raw msr parport_pc ppdev lp parport fuse efi_pstore configfs efi=
varfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 r81=
52 mii nvme nvme_core t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_gene=
ric xe hid_generic drm_ttm_helper ttm i2c_algo_bit gpu_sched drm_buddy drm_=
suballoc_helper drm_display_helper drm_kms_helper rtsx_pci_sdmmc xhci_pci m=
mc_core xhci_hcd crct10dif_pclmul drm crct10dif_common crc32c_intel usbcore=
 rtsx_pci i2c_i801 intel_lpss_pci cec i2c_smbus i2c_hid_acpi
> [  703.332362]  intel_lpss rc_core i2c_hid idma64 vmd usb_common hid vide=
o wmi
> [  703.332367] ---[ end trace 0000000000000000 ]---
> [  703.934202] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  703.934284] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  703.934287] RSP: 0018:ffffa6170f3c7a40 EFLAGS: 00010202
> [  703.934290] RAX: ffff8a3d28398000 RBX: ffff8a3da44cce00 RCX: 000000000=
0000002
> [  703.934292] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3da=
44cee00
> [  703.934293] RBP: ffff8a3cd4e5f400 R08: ffff8a3da44cee60 R09: 000000000=
0000001
> [  703.934295] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  703.934296] R13: 0000000000020000 R14: ffff8a3da44cee00 R15: ffff8a3da=
44cee00
> [  703.934298] FS:  00007f5c1292f740(0000) GS:ffff8a4060440000(0000) knlG=
S:0000000000000000
> [  703.934300] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  703.934301] CR2: 00007f5c0f107000 CR3: 000000015c374005 CR4: 000000000=
0770ee0
> [  703.934314] PKRU: 55555554
> [  704.939954] RIP: 0010:xe_vma_userptr_pin_pages+0x23/0x400 [xe]
> [  704.940023] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 41 57 41 56 41 5=
5 41 54 55 53 65 48 8b 04 25 c0 13 03 00 48 83 ec 40 48 83 7f 38 00 74 02 <=
0f> 0b 8b 4f 30 49 89 fe f6 c1 02 75 f3 48 8b 57 18 48 8b 80 e0 08
> [  704.940025] RSP: 0018:ffffa6170f3c7a40 EFLAGS: 00010202
> [  704.940027] RAX: ffff8a3d28398000 RBX: ffff8a3da44cce00 RCX: 000000000=
0000002
> [  704.940028] RDX: 0000000000000017 RSI: ffff8a3cc1f14000 RDI: ffff8a3da=
44cee00
> [  704.940029] RBP: ffff8a3cd4e5f400 R08: ffff8a3da44cee60 R09: 000000000=
0000001
> [  704.940030] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [  704.940030] R13: 0000000000020000 R14: ffff8a3da44cee00 R15: ffff8a3da=
44cee00
> [  704.940031] FS:  00007f924fc1d740(0000) GS:ffff8a40605c0000(0000) knlG=
S:0000000000000000
> [  704.940032] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  704.940033] CR2: 00007f9240000020 CR3: 00000002c5ee6001 CR4: 000000000=
0770ee0
> [  704.940035] PKRU: 55555554
> [  705.036071] ------------[ cut here ]------------
>=20
>=20
>=20
> Suggested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =A0drivers/gpu/drm/xe/xe_bo.h           |  1 +
> =A0drivers/gpu/drm/xe/xe_exec.c         |  2 +
> =A0drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 +-
> =A0drivers/gpu/drm/xe/xe_pt.c           | 71 +++++++++++++++------
> =A0drivers/gpu/drm/xe/xe_vm.c           | 95 ++++++++++++++++++----------
> =A0drivers/gpu/drm/xe/xe_vm.h           | 12 +++-
> =A0drivers/gpu/drm/xe/xe_vm_types.h     |  1 +
> =A0include/uapi/drm/xe_drm.h            |  8 +++
> =A08 files changed, 138 insertions(+), 56 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index dd3d448fee0b..3a148cc6e811 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -61,6 +61,7 @@
> =A0#define XE_PPGTT_PTE_LM			BIT_ULL(11)
> =A0#define XE_PDE_64K			BIT_ULL(6)
> =A0#define XE_PTE_PS64			BIT_ULL(8)
> +#define XE_PTE_NULL			BIT_ULL(9)
> =A0
>=20
>=20
>=20
> =A0#define XE_PAGE_PRESENT			BIT_ULL(0)
> =A0#define XE_PAGE_RW			BIT_ULL(1)
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index e44076ee2e11..4f7694a29348 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -120,6 +120,8 @@ static int xe_exec_begin(struct xe_engine *e, struct =
ww_acquire_ctx *ww,
> =A0	 * to a location where the GPU can access it).
> =A0	 */
> =A0	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> +		XE_WARN_ON(xe_vma_is_null(vma));
> +
> =A0		if (xe_vma_is_userptr(vma))
> =A0			continue;
> =A0
>=20
>=20
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe=
_gt_pagefault.c
> index 73db7f7c0381..6faebd02f3fb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -533,8 +533,8 @@ static int handle_acc(struct xe_gt *gt, struct acc *a=
cc)
> =A0
>=20
>=20
>=20
> =A0	trace_xe_vma_acc(vma);
> =A0
>=20
>=20
>=20
> -	/* Userptr can't be migrated, nothing to do */
> -	if (xe_vma_is_userptr(vma))
> +	/* Userptr or null can't be migrated, nothing to do */
> +	if (xe_vma_has_no_bo(vma))
> =A0		goto unlock_vm;
> =A0
>=20
>=20
>=20
> =A0	/* Lock VM and BOs dma-resv */
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 39ec94549439..265ee45bee5c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -81,7 +81,9 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
> =A0static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
> =A0			   size_t page_size, bool *is_vram)
> =A0{
> -	if (xe_vma_is_userptr(vma)) {
> +	if (xe_vma_is_null(vma)) {
> +		return 0;
> +	} else if (xe_vma_is_userptr(vma)) {
> =A0		struct xe_res_cursor cur;
> =A0		u64 page;
> =A0
>=20
>=20
>=20
> @@ -559,6 +561,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 nex=
t, unsigned int level,
> =A0	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
> =A0		return false;
> =A0
>=20
>=20
>=20
> +	/* null VMA's do not have dma adresses */
> +	if (xe_walk->pte_flags & XE_PTE_FLAG_NULL)
> +		return true;
> +
> =A0	/* Is the DMA address huge PTE size aligned? */
> =A0	size =3D next - addr;
> =A0	dma =3D addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> @@ -575,6 +581,10 @@ xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stag=
e_bind_walk *xe_walk)
> =A0{
> =A0	struct xe_res_cursor curs =3D *xe_walk->curs;
> =A0
>=20
>=20
>=20
> +	/* null VMA's do not have dma adresses */
> +	if (xe_walk->pte_flags & XE_PTE_FLAG_NULL)
> +		return true;
> +
> =A0	if (!IS_ALIGNED(addr, SZ_64K))
> =A0		return false;
> =A0
>=20
>=20
>=20
> @@ -631,12 +641,29 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff=
_t offset,
> =A0	/* Is this a leaf entry ?*/
> =A0	if (level =3D=3D 0 || xe_pt_hugepte_possible(addr, next, level, xe_wa=
lk)) {
> =A0		struct xe_res_cursor *curs =3D xe_walk->curs;
> +		u64 pte =3D 0;
> +		bool is_null =3D xe_walk->pte_flags & XE_PTE_FLAG_NULL;
> =A0
>=20
>=20
>=20
> =A0		XE_WARN_ON(xe_walk->va_curs_start !=3D addr);
> =A0
>=20
>=20
>=20
> -		pte =3D __gen8_pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
> -					xe_walk->cache, xe_walk->pte_flags,
> -					level);
> +		if (is_null) {
> +			pte |=3D XE_PAGE_PRESENT | XE_PAGE_RW;
> +			if (xe_walk->pte_flags & XE_PTE_FLAG_READ_ONLY)
> +				pte &=3D ~XE_PAGE_RW;
> +
> +			if (level =3D=3D 1)
> +				pte |=3D XE_PDE_PS_2M;
> +			else if (level =3D=3D 2)
> +				pte |=3D XE_PDPE_PS_1G;
> +
> +			pte |=3D XE_PTE_NULL;
> +		} else {
> +			pte =3D __gen8_pte_encode(xe_res_dma(curs) +
> +						xe_walk->dma_offset,
> +						xe_walk->cache,
> +						xe_walk->pte_flags,
> +						level);
> +		}
> =A0		pte |=3D xe_walk->default_pte;
> =A0
>=20
>=20
>=20
> =A0		/*
> @@ -654,7 +681,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t=
 offset,
> =A0		if (unlikely(ret))
> =A0			return ret;
> =A0
>=20
>=20
>=20
> -		xe_res_next(curs, next - addr);
> +		if (!is_null)
> +			xe_res_next(curs, next - addr);
> =A0		xe_walk->va_curs_start =3D next;
> =A0		*action =3D ACTION_CONTINUE;
> =A0
>=20
>=20
>=20
> @@ -761,24 +789,29 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vm=
a *vma,
> =A0		xe_walk.dma_offset =3D vram_region_gpu_offset(bo->ttm.resource);
> =A0		xe_walk.cache =3D XE_CACHE_WB;
> =A0	} else {
> -		if (!xe_vma_is_userptr(vma) && bo->flags & XE_BO_SCANOUT_BIT)
> +		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
> =A0			xe_walk.cache =3D XE_CACHE_WT;
> =A0		else
> =A0			xe_walk.cache =3D XE_CACHE_WB;
> =A0	}
> -	if (!xe_vma_is_userptr(vma) && xe_bo_is_stolen(bo))
> +	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
> =A0		xe_walk.dma_offset =3D xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
> =A0
>=20
>=20
>=20
> =A0	xe_bo_assert_held(bo);
> -	if (xe_vma_is_userptr(vma))
> -		xe_res_first_sg(vma->userptr.sg, 0, vma->end - vma->start + 1,
> -				&curs);
> -	else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
> -		xe_res_first(bo->ttm.resource, vma->bo_offset,
> -			     vma->end - vma->start + 1, &curs);
> -	else
> -		xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
> -				vma->end - vma->start + 1, &curs);
> +
> +	if (!xe_vma_is_null(vma)) {
> +		if (xe_vma_is_userptr(vma))
> +			xe_res_first_sg(vma->userptr.sg, 0,
> +					vma->end - vma->start + 1, &curs);
> +		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
> +			xe_res_first(bo->ttm.resource, vma->bo_offset,
> +				     vma->end - vma->start + 1, &curs);
> +		else
> +			xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
> +					vma->end - vma->start + 1, &curs);
> +	} else {
> +		curs.size =3D vma->end - vma->start + 1;
> +	}
> =A0
>=20
>=20
>=20
> =A0	ret =3D xe_pt_walk_range(&pt->base, pt->level, vma->start, vma->end +=
 1,
> =A0				&xe_walk.base);
> @@ -967,7 +1000,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma =
*vma)
> =A0
>=20
>=20
>=20
> =A0	if (xe_vma_is_userptr(vma))
> =A0		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> -	else
> +	else if (!xe_vma_is_null(vma))
> =A0		dma_resv_assert_held(vma->bo->ttm.base.resv);
> =A0
>=20
>=20
>=20
> =A0	dma_resv_assert_held(&vm->resv);
> @@ -1330,7 +1363,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vm=
a *vma, struct xe_engine *e,
> =A0				   DMA_RESV_USAGE_KERNEL :
> =A0				   DMA_RESV_USAGE_BOOKKEEP);
> =A0
>=20
>=20
>=20
> -		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
> +		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
> =A0			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
> =A0					   DMA_RESV_USAGE_BOOKKEEP);
> =A0		xe_pt_commit_bind(vma, entries, num_entries, rebind,
> @@ -1647,7 +1680,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_=
vma *vma, struct xe_engine *e
> =A0				   DMA_RESV_USAGE_BOOKKEEP);
> =A0
>=20
>=20
>=20
> =A0		/* This fence will be installed by caller when doing eviction */
> -		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
> +		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
> =A0			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
> =A0					   DMA_RESV_USAGE_BOOKKEEP);
> =A0		xe_pt_commit_unbind(vma, entries, num_entries,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 94fc9c330235..f7629db275f9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -590,7 +590,7 @@ static void preempt_rebind_work_func(struct work_stru=
ct *w)
> =A0		goto out_unlock;
> =A0
>=20
>=20
>=20
> =A0	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> -		if (xe_vma_is_userptr(vma) || vma->destroyed)
> +		if (xe_vma_has_no_bo(vma) || vma->destroyed)
> =A0			continue;
> =A0
>=20
>=20
>=20
> =A0		err =3D xe_bo_validate(vma->bo, vm, false);
> @@ -843,6 +843,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> =A0				    u64 bo_offset_or_userptr,
> =A0				    u64 start, u64 end,
> =A0				    bool read_only,
> +				    bool is_null,
> =A0				    u64 tile_mask)
> =A0{
> =A0	struct xe_vma *vma;
> @@ -868,8 +869,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm=
,
> =A0	vma->vm =3D vm;
> =A0	vma->start =3D start;
> =A0	vma->end =3D end;
> +	vma->pte_flags =3D 0;
> =A0	if (read_only)
> -		vma->pte_flags =3D XE_PTE_FLAG_READ_ONLY;
> +		vma->pte_flags |=3D XE_PTE_FLAG_READ_ONLY;
> +	if (is_null)
> +		vma->pte_flags |=3D XE_PTE_FLAG_NULL;
> =A0
>=20
>=20
>=20
> =A0	if (tile_mask) {
> =A0		vma->tile_mask =3D tile_mask;
> @@ -886,23 +890,26 @@ static struct xe_vma *xe_vma_create(struct xe_vm *v=
m,
> =A0		vma->bo_offset =3D bo_offset_or_userptr;
> =A0		vma->bo =3D xe_bo_get(bo);
> =A0		list_add_tail(&vma->bo_link, &bo->vmas);
> -	} else /* userptr */ {
> -		u64 size =3D end - start + 1;
> -		int err;
> +	} else /* userptr or null */ {
> +		if (!is_null) {
> +			u64 size =3D end - start + 1;
> +			int err;
> =A0
>=20
>=20
>=20
> -		vma->userptr.ptr =3D bo_offset_or_userptr;
> +			vma->userptr.ptr =3D bo_offset_or_userptr;
> =A0
>=20
>=20
>=20
> -		err =3D mmu_interval_notifier_insert(&vma->userptr.notifier,
> -						   current->mm,
> -						   vma->userptr.ptr, size,
> -						   &vma_userptr_notifier_ops);
> -		if (err) {
> -			kfree(vma);
> -			vma =3D ERR_PTR(err);
> -			return vma;
> +			err =3D mmu_interval_notifier_insert(&vma->userptr.notifier,
> +							   current->mm,
> +							   vma->userptr.ptr, size,
> +							   &vma_userptr_notifier_ops);
> +			if (err) {
> +				kfree(vma);
> +				vma =3D ERR_PTR(err);
> +				return vma;
> +			}
> +
> +			vma->userptr.notifier_seq =3D LONG_MAX;
> =A0		}
> =A0
>=20
>=20
>=20
> -		vma->userptr.notifier_seq =3D LONG_MAX;
> =A0		xe_vm_get(vm);
> =A0	}
> =A0
>=20
>=20
>=20
> @@ -942,6 +949,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
> =A0		 */
> =A0		mmu_interval_notifier_remove(&vma->userptr.notifier);
> =A0		xe_vm_put(vm);
> +	} else if (xe_vma_is_null(vma)) {
> +		xe_vm_put(vm);
> =A0	} else {
> =A0		xe_bo_put(vma->bo);
> =A0	}
> @@ -1024,7 +1033,7 @@ static void xe_vma_destroy(struct xe_vma *vma, stru=
ct dma_fence *fence)
> =A0		list_del_init(&vma->userptr.invalidate_link);
> =A0		spin_unlock(&vm->userptr.invalidated_lock);
> =A0		list_del(&vma->userptr_link);
> -	} else {
> +	} else if (!xe_vma_is_null(vma)) {
> =A0		xe_bo_assert_held(vma->bo);
> =A0		list_del(&vma->bo_link);
> =A0
>=20
>=20
>=20
> @@ -1391,7 +1400,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> =A0	while (vm->vmas.rb_node) {
> =A0		struct xe_vma *vma =3D to_xe_vma(vm->vmas.rb_node);
> =A0
>=20
>=20
>=20
> -		if (xe_vma_is_userptr(vma)) {
> +		if (xe_vma_has_no_bo(vma)) {
> =A0			down_read(&vm->userptr.notifier_lock);
> =A0			vma->destroyed =3D true;
> =A0			up_read(&vm->userptr.notifier_lock);
> @@ -1400,7 +1409,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> =A0		rb_erase(&vma->vm_node, &vm->vmas);
> =A0
>=20
>=20
>=20
> =A0		/* easy case, remove from VMA? */
> -		if (xe_vma_is_userptr(vma) || vma->bo->vm) {
> +		if (xe_vma_has_no_bo(vma) || vma->bo->vm) {
> =A0			xe_vma_destroy(vma, NULL);
> =A0			continue;
> =A0		}
> @@ -2034,7 +2043,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct =
xe_vma *vma,
> =A0
>=20
>=20
>=20
> =A0	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
> =A0
>=20
>=20
>=20
> -	if (!xe_vma_is_userptr(vma)) {
> +	if (!xe_vma_has_no_bo(vma)) {
> =A0		err =3D xe_bo_migrate(vma->bo, region_to_mem_type[region]);
> =A0		if (err)
> =A0			return err;
> @@ -2643,6 +2652,8 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct =
xe_vm *vm,
> =A0					  lookup->start - 1,
> =A0					  (first->pte_flags &
> =A0					   XE_PTE_FLAG_READ_ONLY),
> +					  (first->pte_flags &
> +					   XE_PTE_FLAG_NULL),
> =A0					  first->tile_mask);
> =A0		if (first->bo)
> =A0			xe_bo_unlock(first->bo, &ww);
> @@ -2675,6 +2686,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct =
xe_vm *vm,
> =A0					 last->end,
> =A0					 (last->pte_flags &
> =A0					  XE_PTE_FLAG_READ_ONLY),
> +					 (last->pte_flags & XE_PTE_FLAG_NULL),
> =A0					 last->tile_mask);
> =A0		if (last->bo)
> =A0			xe_bo_unlock(last->bo, &ww);
> @@ -2742,7 +2754,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struc=
t xe_vm *vm,
> =A0		      *next;
> =A0	struct rb_node *node;
> =A0
>=20
>=20
>=20
> -	if (!xe_vma_is_userptr(vma)) {
> +	if (!xe_vma_has_no_bo(vma)) {
> =A0		if (!xe_bo_can_migrate(vma->bo, region_to_mem_type[region]))
> =A0			return ERR_PTR(-EINVAL);
> =A0	}
> @@ -2751,7 +2763,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struc=
t xe_vm *vm,
> =A0	while ((node =3D rb_next(node))) {
> =A0		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> =A0			__vma =3D to_xe_vma(node);
> -			if (!xe_vma_is_userptr(__vma)) {
> +			if (!xe_vma_has_no_bo(__vma)) {
> =A0				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
> =A0					goto flush_list;
> =A0			}
> @@ -2765,7 +2777,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struc=
t xe_vm *vm,
> =A0	while ((node =3D rb_prev(node))) {
> =A0		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> =A0			__vma =3D to_xe_vma(node);
> -			if (!xe_vma_is_userptr(__vma)) {
> +			if (!xe_vma_has_no_bo(__vma)) {
> =A0				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
> =A0					goto flush_list;
> =A0			}
> @@ -2824,21 +2836,23 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(st=
ruct xe_vm *vm,
> =A0
>=20
>=20
>=20
> =A0	switch (VM_BIND_OP(op)) {
> =A0	case XE_VM_BIND_OP_MAP:
> -		XE_BUG_ON(!bo);
> -
> -		err =3D xe_bo_lock(bo, &ww, 0, true);
> -		if (err)
> -			return ERR_PTR(err);
> +		if (bo) {
> +			err =3D xe_bo_lock(bo, &ww, 0, true);
> +			if (err)
> +				return ERR_PTR(err);
> +		}
> =A0		vma =3D xe_vma_create(vm, bo, bo_offset_or_userptr, addr,
> =A0				    addr + range - 1,
> =A0				    op & XE_VM_BIND_FLAG_READONLY,
> +				    op & XE_VM_BIND_FLAG_NULL,
> =A0				    tile_mask);
> -		xe_bo_unlock(bo, &ww);
> +		if (bo)
> +			xe_bo_unlock(bo, &ww);
> =A0		if (!vma)
> =A0			return ERR_PTR(-ENOMEM);
> =A0
>=20
>=20
>=20
> =A0		xe_vm_insert_vma(vm, vma);
> -		if (!bo->vm) {
> +		if (bo && !bo->vm) {
> =A0			vm_insert_extobj(vm, vma);
> =A0			err =3D add_preempt_fences(vm, bo);
> =A0			if (err) {
> @@ -2872,6 +2886,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(stru=
ct xe_vm *vm,
> =A0		vma =3D xe_vma_create(vm, NULL, bo_offset_or_userptr, addr,
> =A0				    addr + range - 1,
> =A0				    op & XE_VM_BIND_FLAG_READONLY,
> +				    op & XE_VM_BIND_FLAG_NULL,
> =A0				    tile_mask);
> =A0		if (!vma)
> =A0			return ERR_PTR(-ENOMEM);
> @@ -2897,11 +2912,12 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(st=
ruct xe_vm *vm,
> =A0#ifdef TEST_VM_ASYNC_OPS_ERROR
> =A0#define SUPPORTED_FLAGS	\
> =A0	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
> -	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
> +	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
> +	 XE_VM_BIND_FLAG_NULL | 0xffff)
> =A0#else
> =A0#define SUPPORTED_FLAGS	\
> =A0	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
> -	 XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
> +	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | 0xffff)
> =A0#endif
> =A0#define XE_64K_PAGE_MASK 0xffffull
> =A0
>=20
>=20
>=20
> @@ -2949,6 +2965,7 @@ static int vm_bind_ioctl_check_args(struct xe_devic=
e *xe,
> =A0		u32 obj =3D (*bind_ops)[i].obj;
> =A0		u64 obj_offset =3D (*bind_ops)[i].obj_offset;
> =A0		u32 region =3D (*bind_ops)[i].region;
> +		bool is_null =3D op &  XE_VM_BIND_FLAG_NULL;
> =A0
>=20
>=20
>=20
> =A0		if (XE_IOCTL_ERR(xe, (*bind_ops)[i].pad) ||
> =A0		    XE_IOCTL_ERR(xe, (*bind_ops)[i].reserved[0] ||
> @@ -2982,8 +2999,13 @@ static int vm_bind_ioctl_check_args(struct xe_devi=
ce *xe,
> =A0		if (XE_IOCTL_ERR(xe, VM_BIND_OP(op) >
> =A0				 XE_VM_BIND_OP_PREFETCH) ||
> =A0		    XE_IOCTL_ERR(xe, op & ~SUPPORTED_FLAGS) ||
> +		    XE_IOCTL_ERR(xe, obj && is_null) ||
> +		    XE_IOCTL_ERR(xe, obj_offset && is_null) ||
> +		    XE_IOCTL_ERR(xe, VM_BIND_OP(op) !=3D XE_VM_BIND_OP_MAP &&
> +				 is_null) ||
> =A0		    XE_IOCTL_ERR(xe, !obj &&
> -				 VM_BIND_OP(op) =3D=3D XE_VM_BIND_OP_MAP) ||
> +				 VM_BIND_OP(op) =3D=3D XE_VM_BIND_OP_MAP &&
> +				 !is_null) ||
> =A0		    XE_IOCTL_ERR(xe, !obj &&
> =A0				 VM_BIND_OP(op) =3D=3D XE_VM_BIND_OP_UNMAP_ALL) ||
> =A0		    XE_IOCTL_ERR(xe, addr &&
> @@ -3389,6 +3411,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =A0	int ret;
> =A0
>=20
>=20
>=20
> =A0	XE_BUG_ON(!xe_vm_in_fault_mode(vma->vm));
> +	XE_WARN_ON(xe_vma_is_null(vma));
> =A0	trace_xe_vma_usm_invalidate(vma);
> =A0
>=20
>=20
>=20
> =A0	/* Check that we don't race with page-table updates */
> @@ -3451,8 +3474,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe=
_vm *vm, int gt_id)
> =A0	for (node =3D rb_first(&vm->vmas); node; node =3D rb_next(node)) {
> =A0		struct xe_vma *vma =3D to_xe_vma(node);
> =A0		bool is_userptr =3D xe_vma_is_userptr(vma);
> +		bool is_null =3D xe_vma_is_null(vma);
> =A0
>=20
>=20
>=20
> -		if (is_userptr) {
> +		if (is_null) {
> +			addr =3D 0;
> +		} else if (is_userptr) {
> =A0			struct xe_res_cursor cur;
> =A0
>=20
>=20
>=20
> =A0			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE,
> @@ -3463,7 +3489,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_=
vm *vm, int gt_id)
> =A0		}
> =A0		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
> =A0			   vma->start, vma->end, vma->end - vma->start + 1ull,
> -			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
> +			   addr, is_null ? "NULL" : is_userptr ? "USR" :
> +			   is_vram ? "VRAM" : "SYS");
> =A0	}
> =A0	up_read(&vm->lock);
> =A0
>=20
>=20
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 372f26153209..38731e200813 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -115,11 +115,21 @@ static inline void xe_vm_reactivate_rebind(struct x=
e_vm *vm)
> =A0	}
> =A0}
> =A0
>=20
>=20
>=20
> -static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> +static inline bool xe_vma_is_null(struct xe_vma *vma)
> +{
> +	return vma->pte_flags & XE_PTE_FLAG_NULL;
> +}
> +
> +static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
> =A0{
> =A0	return !vma->bo;
> =A0}
> =A0
>=20
>=20
>=20
> +static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> +{
> +	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
> +}
> +
> =A0int xe_vma_userptr_pin_pages(struct xe_vma *vma);
> =A0
>=20
>=20
>=20
> =A0int xe_vma_userptr_check_repin(struct xe_vma *vma);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_=
types.h
> index 6daddd29d416..f775bafe4619 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -31,6 +31,7 @@ struct xe_vma {
> =A0	u64 end;
> =A0	/** @pte_flags: pte flags for this VMA */
> =A0#define XE_PTE_FLAG_READ_ONLY		BIT(0)
> +#define XE_PTE_FLAG_NULL		BIT(1)
> =A0	u32 pte_flags;
> =A0
>=20
>=20
>=20
> =A0	/** @bo: BO if not a userptr, must be NULL is userptr */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0ebc50beb5e5..39a1ce89732f 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -456,6 +456,14 @@ struct drm_xe_vm_bind_op {
> =A0	 * than differing the MAP to the page fault handler.
> =A0	 */
> =A0#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
> +	/*
> +	 * When the NULL flag is set, the page tables are setup with a special
> +	 * bit which indicates writes are dropped and all reads return zero.  I=
n
> +	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_MAP
> +	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
> +	 * intended to implement VK sparse bindings.
> +	 */
> +#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
> =A0
>=20
>=20
>=20
> =A0	/** @reserved: Reserved */
> =A0	__u64 reserved[2];
>=20
