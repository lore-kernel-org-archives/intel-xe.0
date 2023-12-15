Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F1EC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02B310EAC1;
	Fri, 15 Dec 2023 22:52:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590C610EAC1
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702680725; x=1734216725;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kqheoPgRUBLTW2CeWQ7Q5n47XOxyCi1u4k98vSssILo=;
 b=d+9aNDf0hBloTluWyTPzpD1wBibQzgGMyZjoXBxUauZ0QFJnzxyr976U
 mfCi5rFJhw1hqB9uk8OFSG7SAphX0MGFGJB+UFb0YTxaqeJgkWEYAgZuv
 Wog4/H59Q/cH9drTUt8p0IVEJ/Q/3WGKmFth/uDkTntiMU4YE7Qlul8pv
 LjAvaaJ+rQWXDebLHCP3lT+ixb8lrTc32IUIiBDEaUoWyQh/y/j3graAO
 qvva/ofBO+NeAZDTt1614Zy+d600wrvV43LrKBh7n/W8c8W91EZj19MHQ
 zRvHWthQLynUphu7NxT7nHShlUJyXH8X/W98O4Ef4awuhxsslv6yrp9rh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2176182"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2176182"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:52:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="948114556"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="948114556"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:52:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:52:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:52:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:52:03 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:52:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7nlt3ylDqALWGMP7D8sgBEHesEnzv+FQ0M25Vucj6vY3H1DARvmzsiikKOllG5Mr4iAffeK99h2pcD3lsm7tycEPZyxWXOixDJmfNU9RzOqZgVTezUc8bsZNW3SVAC2Z92MBJeA5Jua9DAt7Ion1/Tm0O3PmXpdxGAiNtDGKvLpc6DG5cMCMfCw5Dl+fanguzcpFXr1CDbuUCr6UnxopQBRYQVeIDeJVysglH0xY+DqKVHuEffNRUCoTg57Ry0WMkenNojUndQDRLkgkJhh67Z7Gh43xtD/vbn/8Vc1d2yOhNJLVIAE5DzSnfCk/K3NVvG1iB1d3paBrtgLdd9GEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cf6dLs6n+SJL2NwHMUvwmEwf1V2Rzxv0knTJIYvi6eU=;
 b=cWF4h3iEP/RgVNxpvIxgjxUwtqkZWJoOWthrZUTnIrnmZdNKfVq/Ynk4Ls3hTf1sW1SC7e1pMeLWI0an30AEz4jbHa5+rj+OIbNDbY7p5RRhw7QuvaoTCk/OHtoI83M9cGFGS6QNji39V8D7aXIamns+56Ubh0riLRYX0bZTy7Zzku48G6SP2X86nGO66VX/wYHTwJsjJbIkrmYx25NF4P6d9AnbXVL3zTKbQjecjbnYpbhveaVsgS4CqKUvO5StUIXpdmSvYJ5ZrXX4LJsi0lSnLYn9jhkz1ie7luabr/XlEQeZypA+cpEMSJrKyHucO4Rs0fcPdbAM8xjnQgB4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4630.namprd11.prod.outlook.com (2603:10b6:208:24e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 22:52:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 22:52:01 +0000
Date: Fri, 15 Dec 2023 22:50:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix UBSAN splat in add_preempt_fences()
Message-ID: <ZXzYUOKz3rgmZq7I@DUT025-TGLU.fm.intel.com>
References: <20231215211245.718686-1-matthew.brost@intel.com>
 <t3be4vndhfhtc453ftbv2ru3mqrgg6tpdwksmlipe5mvxhhzhs@ogfrvotddgzq>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <t3be4vndhfhtc453ftbv2ru3mqrgg6tpdwksmlipe5mvxhhzhs@ogfrvotddgzq>
X-ClientProxiedBy: SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4630:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c8b97d-0bc8-4f28-b894-08dbfdc07300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7i46plf4ExmetXYfgyOFbesp/Oek5cwTNxdGPXZgJX4WX/UA682mt225HblSKdlTNs0uq0o0CLaeukLsOQf9oBqT6SpEiiUhMyIyFJFky86Xa7D54qUFKqO2Bn5hN+DeScFuBWWqT0kVFOxojKiEOmoMm0/HBKJYygSfwLEiM1CE0/6HDnnM7jUl35gu5EG7N+egCx4faLNUPNtTEu39wFbvhMSBN6HunY9DUWk7MbftRk0i6oivbCN1w/yL/Qv50fod9vLRxjN48yODq2tkzicTtCJV+x+L8PXGqjY5hYMaiAZZZW7a8d3rBmyqPpDRyFiqEc/GsTStIjWoc5yTK7hyvSBVX8DYDBzsNfSIrytQcpqMJroFlQYgzhcGb2bVulKswRDd7U8rjSGlQgCkVjGQmjmBLv9OuVXhroUu/H0FOV3a8LnOkWKlf6UtLs1OGtmb+f5t+mi1ppEaAvJAUR5xkGWH/WPYsB+U+ZzbCWwHKjLyLpVlcDnLpkD7ZL22f6r2r9wiQOl/+rjqkrr6GAWV9rSPTZnyOzV+v4mpRY0/zLYFjnDmtRdcDQUsB8tt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(26005)(6506007)(82960400001)(86362001)(38100700002)(83380400001)(6862004)(4326008)(5660300002)(44832011)(6512007)(6666004)(6636002)(316002)(66946007)(8676002)(6486002)(8936002)(66556008)(66476007)(2906002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SxAzJaqU2i+UR00iZ2ppM0LNKI3XrBOzzyehmDATgBemkBvWUc99Pty3dXsh?=
 =?us-ascii?Q?0ksJKcRS4Ff0rGlybUiIsPjpEJAQBjVfSQnhpFeoq43jirKhnLopcPm7xfKh?=
 =?us-ascii?Q?0cssnuQ8mofmHR8UNOVXKlOGKmeo574EotZleZKD7Barn4onwZdDAnNyG1aN?=
 =?us-ascii?Q?LgnSTmO5wu+VYf46XDuR9JkvjUm0r1xQbB/0+61kT/sTDBtvNqPu/K3dNEFH?=
 =?us-ascii?Q?AFSnx+cAj3zIpI0Wv1sVMp0nbvlY6V9gPdiKRk9rKLioEbkbBtovsbL8LySR?=
 =?us-ascii?Q?lLIfJKJ0u5UKkvRiPkrHRtSFCYKk+Xz92LnikN02CAiTBesl6BSnOZIW/8hW?=
 =?us-ascii?Q?ZxK/YYdJjbtytgsVVcj+h615YFj2eE33fwLRe+Gxz80Rk2mg3BiIum10bqgw?=
 =?us-ascii?Q?63izVSMQB8O2WWTyH/J5ZG8tbu+4w5+pt+VyY1lKdORrEZfJUZYVm5lGQOU1?=
 =?us-ascii?Q?/xT6KOH+hsyajKJlZ9wIjH4iV8clrCMDGxL8o7q4gBetEj2anR3jNzpL8Le1?=
 =?us-ascii?Q?GM3jq6omf1keKec6+PUxJzBHG92gDpMx/9cYqXHS82/fJ3mEkDntB37ldWlW?=
 =?us-ascii?Q?SYWwsG1T6ARlTGamsU6dm/y35C5Fx318X3icXet9f5Q8x/2rLNBYhVMR5Vo2?=
 =?us-ascii?Q?AXEptk5VsVTuyg+5PpHtzeCzrdevTZuxH1lvByW5Q4B7nGMM+Y/rONrkRdfL?=
 =?us-ascii?Q?IkbFhDqsX43BMRJFJ7ju320ycNpYZXP+kD+G1/aELn1HIlUiueszLLuHzU5a?=
 =?us-ascii?Q?e16JDfbAYDGsQjKQRmIBftfb7iVtFV88J4QS916EZYJs/M43Z1twlVr1do90?=
 =?us-ascii?Q?u1SHYtwA+nVu+MM1B15n8V4uPnQtNWgS1YvCaG5J7r1N8WM8tx4jjkok479L?=
 =?us-ascii?Q?StuMVnft6EDzt0KLnJC+9bVljYHJbnfyBd5sZcDSDGglJiFfKywuSPeGa/Vr?=
 =?us-ascii?Q?OlI/qbaWCyVW8orDQYiBQEnKwzQdcoRLoX+z5Ks6ws9Q8vRnKOis8wEUSW/y?=
 =?us-ascii?Q?O8rBQjLerZHVCgMXvbIg87Yjkn29KjWVZv5GYCddb6x10gRLvnuHXf5IE8Va?=
 =?us-ascii?Q?W3lxmr6Zd6TjQQM/WWL0i4J+9JRZvdcIP7AJHWP/Ppow1ZUQgdoBaLMjzeM8?=
 =?us-ascii?Q?Uri6lKER6SQK/MTZ7cvTtgoK7/dmmMD63OQjKblEQoNrRiJ9wrZwxUYOUsOW?=
 =?us-ascii?Q?EWLbZnKKWbVWARnfev8IzxrtJ1F/rO3PgAj9tGKK90+lk6Tjhh2Gw/JxVyqu?=
 =?us-ascii?Q?ZUt88lTEKb3v4WKuVL31/3c4NgYSonovUJmwDozjn9m5A3K088Gdsbz3V2jP?=
 =?us-ascii?Q?g2mgW0BbYysxIm7Bvoc3q2qKvgI1GY+xPzq9KeE3TkBaA07soI2YhC4muWkH?=
 =?us-ascii?Q?Z5xP3ZcpKsIftUINXxjbO7huXFKLS9lGjrqgZ9pRk/C56SMwp2zo0ngz+ftt?=
 =?us-ascii?Q?JUKBCh9SvoQWUKHwh8TL4o+9vX9Ek3LZVSBsdyfifts6XsR5ZUMA/crBxrkl?=
 =?us-ascii?Q?emTBsmAuu2RbY8g+zhBC5wUG26KKj44x6eTtWlCBrsMSvvyzIyzE18OMIGFM?=
 =?us-ascii?Q?wLVVh7A7s6ay+8/R+wMpxZiwEHEUlvOaCy/bEavaJ90QFgp20QC6OmcR1ojG?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c8b97d-0bc8-4f28-b894-08dbfdc07300
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:52:00.9477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xxqHI8ig2gRwt6tkN6L4zfFBE58cPlTqRZmIXBQlWigdhGe+8l6ZNqZksmdk+figkcE0fdtzufMyEQN7kbjFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4630
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 03:27:39PM -0600, Lucas De Marchi wrote:
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
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_vm.c | 3 +++
> > 1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 322c1eccecca..6406370b2625 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -283,6 +283,9 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
> > 	if (err)
> > 		return err;
> > 
> > +	if (!vm->preempt.num_exec_queues)
> > +		goto out_unlock;
> 
> any reason to lock/unlock bo if we are going to return 0 without looking
> into the bo?
> 

Realized this could be moved after sending this patch out, will adjust in next rev.

Matt

> Lucas De Marchi
> 
> > +
> > 	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_exec_queues);
> > 	if (err)
> > 		goto out_unlock;
> > -- 
> > 2.34.1
> > 
