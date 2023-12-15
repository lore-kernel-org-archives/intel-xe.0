Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E95C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EB110EA9C;
	Fri, 15 Dec 2023 22:56:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00F810EA9C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702681006; x=1734217006;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vkcLzEpl8RM4aMGvRveFweegha2f+hXnLLoh3WFZ9vM=;
 b=HSa4kMCFbftuJWaTBmS13ff8vUHzLyax1h7iHQSNBTKDqt9vkmd3nKdp
 Vm3HPYqBsUtH0vxCmqPBvkiRYWvZzhqJS0aLUS2Vw6x3tVXLPDImoCyOE
 CuZd3xRZ3QpPCQ2I7Rrlmn59CzfYHwzK+9LYDi6lvKbLjKt5wcIfaPQRQ
 /1jN9GSjJuAxYVb5dT0atg6fYItXLfuSBe0jFGnEwiXpiq76x/lw4bjpD
 oghllLoSRvjdQOKmWwJGXPwOBs2x94sFxyxnuXa8z+I5AepuOxdvQ7awy
 NeSeTPQHvBi+Z2jUh3n1ao48z5GsFy+yhSscMm1mdmjAXF7zHpeL7tTYJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="14023441"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="14023441"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="918596416"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="918596416"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:56:44 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:56:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:56:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:56:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:56:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWkOm0LJqQ0NMX3sjc2z0FfNWSBEfBjc+IDj4HszTdBW2M9h2kYs6xsoVtx1nGtHLSTqHTkDZ5FKlimsY8Jj+R1komFH2KKmEhYbVynpIQYL0lraEjgZmbyymtD0A/KLT+qS4WqAOfLW+pL2eFiMNws1Ek7TeFLnMIdqBwlV+Fq/KLYTEW6ch7leNu/5RFPITEbCq1cPs2Qyg9V5FnYBx17kwyzNPE/kr17LHrC1TvPHhs/+bE9KanFTgO4J6TqI9DLGhTfa72PTBNSzCCwU63IXdqibk71Aj/hPqMO/W/L51nXxfLZ8RWNIVfnqOJU3AWEBj9Ljss2tIeBQY26cLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUA5NBgO46Zakmj1PBVpT9NBWytD1V1T0IcUrE/P5Jg=;
 b=ZOmfRO5+tjVqGTpJM4t8UGkLFCl/bs6SZELSrxRm5KvOsPh0ZiCU/admKc3YvWP7T2ZVwt6JB65jzIricdHMHFZ8IM+Cz8/Fj2Ez9ZLHnXeKBrU92zQJdFUTJA5JCAiCaB823OOYcsc4ojmHkIQS6+tquXexW4kWQmCIlEcDX1Kd5CdA7V17X4ahX6c7hvipn9ghNl/yE/aDuF/hncjEh+m7Yk5l4RAIfj8buzHfNLe3q2Nrf3VrQCvKWmwQ3HXDmXuhjIBArg8IdwpD22imojIHW0xJCIVLIAOcMz/fHwVxIC5dcf2/gq1PyDQvf7ExCxT76rPnUECpWJg5Oa3Pyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.29; Fri, 15 Dec
 2023 22:56:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 22:56:40 +0000
Date: Fri, 15 Dec 2023 22:55:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix UBSAN splat in add_preempt_fences()
Message-ID: <ZXzZaFIlaSXO2JfM@DUT025-TGLU.fm.intel.com>
References: <20231215211245.718686-1-matthew.brost@intel.com>
 <ZXzFWbt8LTgDOHG7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZXzFWbt8LTgDOHG7@intel.com>
X-ClientProxiedBy: BY5PR16CA0017.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b587d78-fefb-4a6a-9a56-08dbfdc11992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1WLWsErK7/LFOfRXrwmcvnthsGd8B3AZqh/WIdXuJWZAjxBZ2cjbYmiUK3NshddACRaBQwkDKeQvgU7jExVdu10U7KHSG86YKP+gxOc2B9nGVEV5qkAGFdxmWPopd9/LiDEXyXrM36gxv51FvNdFdQqSfF5pa9rabUw+KjJupxgzvjsEJc1oKSTCwa0JDn4694ywfHsu/1DAjpamMukBCkjy7/XQT6O53NI9CYmb6kinFpAbDwunKUXGTECAt4zrq/tJflNThbREl929p08C7g6FN2uvnH1yhnpb3Uo/elaMVMcpdkwFtZZ+gH+SaOxh7kCAx6uWJAgZYPA/LDxFZQFJTcY6cHrQSVM/jKyzxLnreVHo/dPIazCcrJ0c6kOgegf6ksY9KBKcreXLF2RzVUp4Iu3w8i2TiMdavNFnwm7gVc3gdOLkw9DZjkUQfsmB+cRG8olFh22SwPbJdaToacCPd17N2JQuUBT4VSjrer2mN1NXwXGWKkWfWUjEufORS714/ZcBOgYTLIOsGJgmMsrx4qDdBph9/BXn5pn5/vJmRITML2pee53g0dhOT7NJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(44832011)(8936002)(316002)(66476007)(66556008)(66946007)(6636002)(6506007)(6486002)(4326008)(6862004)(8676002)(5660300002)(478600001)(6666004)(86362001)(41300700001)(83380400001)(2906002)(26005)(6512007)(107886003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?feYd+pCL13DXtV3s2woI8iuN20U8fV5Hj8lRpuhXRSsC2gUnVJSMJZXQVUSm?=
 =?us-ascii?Q?4qDhuQqo2Z807YslcahKPvxMwtcGCy8JAfgUjhB2kMiQWXsWMsR7s8VUtDCc?=
 =?us-ascii?Q?AqS8xZjGNTW3qkRzErGKrUpdY1JKDP5Jl6YwTgQMIe2gqVLP0OqnGJk2Kje+?=
 =?us-ascii?Q?oFFCvfE7reCXU1Gu4EC0hTFYFQLLQRJKbt7/mN/AHfCWfTrP8jKpXa3im6ln?=
 =?us-ascii?Q?YJ+1r9LLo9N8uWEtyH1CTmqHXx3ZaNYz/KKacDQwwJlE3gN/jqIR/PxH2Fob?=
 =?us-ascii?Q?Bv30F4XVoZZH9cVlqvdrl6vzRrKdML8bHZwXWSlLaZLnPVTh3CAyO0G0CwBG?=
 =?us-ascii?Q?Rx8GjmhShsPAAfZzYXVW1I4vq2ft41uPnU6k8cNTOwL4MZbjRZqvlUrIcNm/?=
 =?us-ascii?Q?WMFmg7oQiofRqZ8Yr/HvNo6yMlrlM6HOCNrX4HQsHeX1kmpedbcP2PdIgbOZ?=
 =?us-ascii?Q?z4FAJmE29wnpTsankt4inuKvRqXAz0cGKHj62CrbW3tOAFcFR7Xhi4tIfjg+?=
 =?us-ascii?Q?bGI/1rv8NNhPXJ+kZWW9MCA9+AIh6es2TK42rZGXhcKn4IO6KMVJRCjETQsn?=
 =?us-ascii?Q?BPLFyIltzYobpjFjtw247MZoQcrrgqPFXfKSdm3MZN01bL1z4M/t/W+ceIQY?=
 =?us-ascii?Q?vOnJOb1etk7v9LdTYeCxJ8TE4N4MVugWYD89C0YRdIvCB+4c2eTkBJwu733n?=
 =?us-ascii?Q?a9kOGLVePHnfaQtdepNMopCjTHZi3UFTOnfJ0H7VS+//8aDIfUo14GgoFTee?=
 =?us-ascii?Q?bZkXJ1wEIL7TRzspA2yTHJ3zhcfKuYLXyMFZh2/Y6S7NFQa1XJXidmGiMnu8?=
 =?us-ascii?Q?Rf7SUr1NGATUyxlbd4z5YLxqUQtnR51L9/5DWZTZx13IZrjuHDQU085/De06?=
 =?us-ascii?Q?796JTACCk3A7P+hIaFC8aXZX2l0fjPhvD6mihVc1uilJ7N48wxFIB76jFKj3?=
 =?us-ascii?Q?Es2NyJWxw9Bqy9XphOZIj+daT/O/oLXm3yszU4PxwmO37gpgM9YbExV29Sni?=
 =?us-ascii?Q?tusQ5Ehz3l7OQ0sZyv6AWuAvd2SA1YTgJOiYOqndR0AiFBMLT4C+pbjXSGiV?=
 =?us-ascii?Q?ibWWCyqkTzLbkQpGYvN1opWLnndvmtijxb9Suwqd2zMki0z8FNR0cQDdQEu9?=
 =?us-ascii?Q?qFTjgTPyNWLXrIbbV1LQxXs6HoXOAaUTXhTh/2iGS3UQBibP1+GF8qxAzdBD?=
 =?us-ascii?Q?PlHlEYXGhEhIE4AbacYfUhGXC+c+EriNjkloYfdxbWeEl03RQW2itBxcbfdt?=
 =?us-ascii?Q?Z+399/pp2hZtQWbedJ6lB+x75rSUyaEikSZV5qMvEV3NDIIqSx0TKgNOvMpM?=
 =?us-ascii?Q?vf4rkMX17BTSo6RiFD9NEDC7CXoppVX0h5qGb9DPy7gzpa73sLmJKgrIld9M?=
 =?us-ascii?Q?OmCFM+Tr/4Jtsm8KZ6cEkp8R0aLYFGkre+lxSOzjPywVTZIv2nyixrJA4Zxi?=
 =?us-ascii?Q?yegXXSf6Hg/LGwuNGZvDy0rCuU1DwmH+zswLFzll6dJJ9x3F9u+RWVIDekWg?=
 =?us-ascii?Q?KLzbg6eAUrBs8zLxBBfBWb+RWq5XXY2agtWtoI/NLquxtfeGnCGtGiOlI+30?=
 =?us-ascii?Q?dUzQUiBeJudtAtOyEGOttrhaLpeJ1YifJu08la40heRh4DbJjhTXeLVjhUbL?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b587d78-fefb-4a6a-9a56-08dbfdc11992
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:56:40.3697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IaIbYQIlpaTwoaVBDarZU9c3zjr3t0Vz/n3eGoiYjPx+jdL4OIareWtScO2FSrgPdjLgdO1V7JEOHqzWUnt2rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 04:30:01PM -0500, Rodrigo Vivi wrote:
> On Fri, Dec 15, 2023 at 01:12:45PM -0800, Matthew Brost wrote:
> > add_preempt_fences() calls dma_resv_reserve_fences() with num_fences ==
> > 0 resulting in the below UBSAN splat. Short circuit add_preempt_fences()
> > if num_fences == 0.
> > 
> > [   58.652241] ================================================================================
> > [   58.660736] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
> > [   58.667281] shift exponent 64 is too large for 64-bit type 'long unsigned int'
> > [   58.674539] CPU: 2 PID: 1170 Comm: xe_gpgpu_fill Not tainted 6.6.0-rc3-guc+ #630
> > [   58.674545] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
> > [   58.674547] Call Trace:
> > [   58.674548]  <TASK>
> > [   58.674550]  dump_stack_lvl+0x92/0xb0
> > [   58.674555]  __ubsan_handle_shift_out_of_bounds+0x15a/0x300
> > [   58.674559]  ? rcu_is_watching+0x12/0x60
> > [   58.674564]  ? software_resume+0x141/0x210
> > [   58.674575]  ? new_vma+0x44b/0x600 [xe]
> > [   58.674606]  dma_resv_reserve_fences.cold+0x40/0x66
> > [   58.674612]  new_vma+0x4b3/0x600 [xe]
> > [   58.674638]  xe_vm_bind_ioctl+0xffd/0x1e00 [xe]
> > [   58.674663]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> > [   58.674680]  drm_ioctl_kernel+0xc1/0x170
> > [   58.674686]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> > [   58.674703]  drm_ioctl+0x247/0x4c0
> > [   58.674709]  ? find_held_lock+0x2b/0x80
> > [   58.674716]  __x64_sys_ioctl+0x8c/0xb0
> > [   58.674720]  do_syscall_64+0x3c/0x90
> > [   58.674723]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> > [   58.674727] RIP: 0033:0x7fce4bd1aaff
> > [   58.674730] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
> > [   58.674731] RSP: 002b:00007ffc57434050 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > [   58.674734] RAX: ffffffffffffffda RBX: 00007ffc574340e0 RCX: 00007fce4bd1aaff
> > [   58.674736] RDX: 00007ffc574340e0 RSI: 0000000040886445 RDI: 0000000000000003
> > [   58.674737] RBP: 0000000040886445 R08: 0000000000000002 R09: 00007ffc574341b0
> > [   58.674739] R10: 000055de43eb3780 R11: 0000000000000246 R12: 00007ffc574340e0
> > [   58.674740] R13: 0000000000000003 R14: 00007ffc574341b0 R15: 0000000000000001
> > [   58.674747]  </TASK>
> > [   58.674748] ================================================================================
> 
> Can we pin-point which commit introduced this?
> we need to start using more the 'Fixes:' tags.
> (Although while we are really not in tree we still have a chance of rebasing and having to adjust
> the tags once again)
> 

Yes, so add this?

Fixes: 099192666a18 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 322c1eccecca..6406370b2625 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -283,6 +283,9 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
> >  	if (err)
> >  		return err;
> >  
> > +	if (!vm->preempt.num_exec_queues)
> > +		goto out_unlock;
> > +
> >  	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_exec_queues);
> >  	if (err)
> >  		goto out_unlock;
> > -- 
> > 2.34.1
> > 
