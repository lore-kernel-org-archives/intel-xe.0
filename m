Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0B0C77B6C
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 21:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0822110E354;
	Thu,  6 Apr 2023 21:36:34 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7B610E354
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 21:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680816992; x=1712352992;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2P8iGNBFy3637Y/iuXjStSEp2DDcReCLg5DYA4agIrM=;
 b=GqyeA4aMbIQr84hLivAwnRudicFssCBOV8LrsAoNQLg50BKysvnwOVFw
 SXMpuFwsYo7Iqb2YDqJm1dvhT8782/EC2HkSqMR9Wj/NvCYdXYJ+ie/lD
 euFVbU7uF7vDBcHG2CQ9eId2/9MkEe4O0yfF0sX9JrPTXxunGoxF0LHVF
 bTvon6X14NjgBY5Ee8PWdGOqNTAsQ/K2UO6imfHUVdQvbFz+0mdOZJvis
 DjDxgViD0eLpmW/qC7jCwZtQH9l4Cglp0zN5hv6/oKBdTKikU8LYxcZMF
 gfZGT0ns7yIKXRRNQsqPI4PBuob9FGkfCC79UbNLuJE3fvO8QtvwfxHRL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341595020"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="341595020"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 14:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776625146"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="776625146"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 14:36:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 14:36:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 14:36:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 14:36:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyVj2kjE91utPLiCEAqa1kACusKYbVqilgTnFAtNg2UDZZjbGgITGUe4Gr7nJHxs9JBxJV5w6a7+Kv3SbaI0CmzHja2dBTUw9WODg6WNrASaqiyHE0yLNiUz9SaQ8YSpglDJbalxRes+vPGsrgrP+RcmfeM3efIYYwC6U1EK0qXfwy2eRHcmky32VuTTFb+t7u0Uosc2sl5WdwQQiLzfBbAeQ+TE2HEO9Ee4RK1au+38tv/UqRiGWPZpgd8u0Iw/DKxZyIw4jz+bVm84Yf+Sm+/kL4CKgh5IBcZBuzPjoj18y82E0YlCgE1cxKN0iCRXD689J9xfLFDMn4uCxiSjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2W82ZmUF31BYHrbpVqSFY7g76AOykcemU/UOmvSkJQ=;
 b=SLp+ZAj9wM9Y9zWyYN6oxrPixt+7XqWtRrCDHmiE3ctoPwnDhuJ7uPZtEFaoQYmsxNiRemwM4nIK9YodqJk4+I8fAZuqTwuuh70+4ODEJnTmestadzmDHzU82FD05XwGn4TUHqfD+xatXOe5npl2XpRXG1+Ml60gXFs7a+Yy2Edi9/UTKRLQE+kTxpZyf4a/h+yHtHFACHg7p1y1/BmWp9DvjgYbacobUKfFm6s7wALlWZ1ZNQyO+td6FlS8oRV5j5jz/iu0hoJRnhNXeIY7Pqibncu36u4QHc4VM4YW3oneB3ufvcDJKZoSDXMXh19/xMqN3/Aaxbv8RaoLLZi7OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7877.namprd11.prod.outlook.com (2603:10b6:8:f4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.30; Thu, 6 Apr 2023 21:36:29 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 21:36:28 +0000
Date: Thu, 6 Apr 2023 14:36:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230406213625.GN4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230406204841.18774-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230406204841.18774-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca3b381-3429-4a54-c7b1-08db36e6fb03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ubP1qE4um4ridRSjwSQCNyJcQgNR3R/scSikd0n90L4wdxuIgdRuUIOdB6WHtqx7+C55V0c3bzN+MbPUrwIEYJMiZgJshgbBV/BseXG3MAib8vr8otlhIlEYqiXeaIAVqFdv0fvVfMZBkWTeUG95A6vjzkOM1BmhE08EuHgdThkTR1DjDvZ+wjN8iUdvAImZPfPIZz/zQO/vZf38UJ56ZX1ndr/CEDqnx9FsmT23eVbQDkaCpWQa9wf6rY2igenOSi3DpO0HYdQ+6LNb8I/ZMg8lfJ4us/672fKI1ZqeADhhjFxRNu2zEccEwrl+RTyBQW9j0eKCyd9V2ryQ3U+F3xFTy8A6ep9RgiuqtGjAgzy32Vtx3AHQ/tkUDXILMGqAsTdMc3Ckchx2aZV4htkpQRswyiqsPqMWxoP9G0UATPZ9gjdzpZvpHJktGAmQU4YFVGAqdt6mtZmXuL1L4PYXVl4MNKcEUgrQSvqbn2UfpTgOURVHCYADEYMUJEPKCmaAiOut95MmXUmhiT7XDIBySQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(45080400002)(6636002)(478600001)(86362001)(6506007)(6486002)(6512007)(1076003)(6666004)(316002)(186003)(26005)(33656002)(4326008)(66476007)(66556008)(8676002)(66946007)(38100700002)(82960400001)(83380400001)(5660300002)(966005)(41300700001)(2906002)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TSacFlN8okpAFKgw4LIsRhrtcs2SjxSkz+Tq++fB/vSWs7JhhHNdBs5gMk9W?=
 =?us-ascii?Q?b5hhn0f0cJE8yu9RUROfegHNRuuhbx5UC1fRjrcLv4tkzBMAFghe4j7ieXsm?=
 =?us-ascii?Q?hEutMl4FIm7XgWta6PrLjxundFYcHxsCZfsqrPNCIljpLG8cFxMSnL4TWzC7?=
 =?us-ascii?Q?TQOthhspAJGgcYvrMN1ZQTBzoGQ/gB48xxymINdGR5lRjseywo5r0kfw0nU9?=
 =?us-ascii?Q?kTPr3sUNg1XDtrx5kd1WYM5Lk+0fTa/LZtjMj5xk81z7BeOYn5vYg/oT1JVa?=
 =?us-ascii?Q?YUzbZIz1qvBphbPV51CuakXfrsSsgUo4mP2nTElF2L2ggN7wGJeu6aAlO/Jh?=
 =?us-ascii?Q?xCD2fc/gQphLfTM604O6iFuTJxdr9JbtQdzGsOQZGCFHC4dlRd+5erbd3Sik?=
 =?us-ascii?Q?8CL7mXTcrzD9gXprWSz0CqnjxdpLJ0TpdJugSpeNm3vdzh0xGhWfwxJattsl?=
 =?us-ascii?Q?c6KwQ6tncFfFb8SDnAruSgBY16oV0VTe1fSn36Qy2OdGT5XPS82cYmb2ZiD/?=
 =?us-ascii?Q?jUoGCkxaM5hqyuxM7cigr5ZWrJexlnARKRPBq6tE9iP7z2YM4GxSn1VXbRG/?=
 =?us-ascii?Q?dYFaSkZMXTI/ZHoqhJZaXvXXqz28CB3V7KzIl+fCvlu2FT31e9JOccTVPYFm?=
 =?us-ascii?Q?RkWpOHig/KN2RJzx/1cio0Mjyixd+mZB3ZOi/rHn+Up5F+2sztNblXZIpNty?=
 =?us-ascii?Q?GjUhx0ViVEDthI/+EkkzlDplXzR6P0KEdfMtk4ipHpmAqp5eVBbA6Aul4Gq7?=
 =?us-ascii?Q?nnSYa48rVJEloHfJxrjbN7UX+lkQR18eVi63DssEZf4OGkzcZYqk00J3vr8t?=
 =?us-ascii?Q?WcYiEeIpxXAUx2QomPvt69qgR1xAEAnv4LGGTbhIZrX6quL8dXgi4glxvX9g?=
 =?us-ascii?Q?5JBc5FQARnrOCKsL+nKUuI6HTcMm6RToB8744otEBnZIqH7T/82rlWlv5eBQ?=
 =?us-ascii?Q?lXLvlI1CzbwZzC4SWIMdWrvM3BNKz2zTUwzBuqBREtaPnb7sr9oFbq26xwKa?=
 =?us-ascii?Q?ItBS6lDRJS8i7Br7w/24GS84iE9IcrsQIR63N/T8UW0U/fN5Er7UkzIPtHw4?=
 =?us-ascii?Q?sHuEIGVkTJ7US9WUydd25EhI7sCIktX6/erSsj27rWdYafLzCTqBUsrFBUr7?=
 =?us-ascii?Q?09CYidIwrT5ieUW1/BgOjXT4K27ixxEOeXw4T1j6krcYCwYc71vj3q5vC+38?=
 =?us-ascii?Q?PVIqRaHtGvQPcRsVaWeHDAMoYnPtK5r3ePGqCn9BxMEoc4Un4rw/7WlSkiYq?=
 =?us-ascii?Q?BrGBffQR3I7KVrwNOGlPXP+5UDnqTONZUtcPdq27cy1gMldtImHbW6mxa4gF?=
 =?us-ascii?Q?AWhS9OUnURpUtwC/OG/Y2H3fPjwcrQbz78JRWKfA4kMwnFBNtxsDcwQscXNl?=
 =?us-ascii?Q?puUYHsF1Zb95d1afUSLdMjcnwGZ5lUmSyr31pXbwQepWaAFmcxKF9z7Qe83q?=
 =?us-ascii?Q?bs0sYNXNXdbFZa/yVxdIs5OhqC95KKJfya7gqUyr/0NXAQani8yQ6CzCpqNW?=
 =?us-ascii?Q?ANAXThRBCUPKCHJdJTJudRcE8UOg42fKi4fqogUnevzANHIwQrdcRgSKDUcT?=
 =?us-ascii?Q?RH1YlA9MYoiSxTmPFvCrSDRG4VR95MhsffpQeyqb6x/1RHoT8cXL2wSHFyHg?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca3b381-3429-4a54-c7b1-08db36e6fb03
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 21:36:28.6193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4uxiHJ9ljbaZB5CKpGrmyht43YIN6Ml8NiCTx8ecVibc2UT/G4AMVBUT/I9Qj3m62z1inE/N/eGcxcEcN813iGsHVrJ1/4WVv5SjZw0PYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7877
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] drm/xe: Revert coalescing of GGTT
 invalidations
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

On Thu, Apr 06, 2023 at 01:48:39PM -0700, Niranjana Vishwanathapura wrote:
> Causing a bunch of hangs driver load and in user space.
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232
> 

Tested-by: Matt Roper <matthew.d.roper@intel.com>  # ADL-P

Previously ADL-P was failing driver load about 50% of the time with the
signature in the gitlab issue; with this series, I can load 30-40 times
in a row without issue.

If I load/unload in a loop enough times (usually 40-50 times), I do
encounter a different problem, but I suspect this is a distinct issue
that's just being uncovered now; it probably isn't caused by these
patches:

[Thu Apr  6 21:32:02 2023] xe 0000:00:02.0: [drm:xe_guc_ct_enable [xe]] GuC CT communication channel enabled                              [5/46010]
[Thu Apr  6 21:32:02 2023] BUG: kernel NULL pointer dereference, address: 0000000000000000
[Thu Apr  6 21:32:02 2023] #PF: supervisor read access in kernel mode                                                                              
[Thu Apr  6 21:32:02 2023] #PF: error_code(0x0000) - not-present page                                                                              
[Thu Apr  6 21:32:02 2023] PGD 0 P4D 0                                                                                                             
[Thu Apr  6 21:32:02 2023] Oops: 0000 [#1] PREEMPT SMP NOPTI                                                                                       
[Thu Apr  6 21:32:02 2023] CPU: 9 PID: 10370 Comm: kworker/u32:2 Tainted: G        W          6.3.0-rc4-CI_DRM_12746-g6ce36b596fa7+ #499           
[Thu Apr  6 21:32:02 2023] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P LP4x RVP, BIOS ADLPFWI1.R00.3323.A00.2208030835 
08/03/2022
[Thu Apr  6 21:32:02 2023] Workqueue: events_unbound g2h_worker_func [xe] 
[Thu Apr  6 21:32:02 2023] RIP: 0010:__wake_up_common+0x5b/0x1b0
[Thu Apr  6 21:32:02 2023] Code: 85 0a 01 00 00 4d 85 e4 74 0b 41 f6 04 24 04 0f 85 a3 00 00 00 48 8b 43 40 4c 8d 40 e8 48 83 c3 40 49 8d 40 18 48 
39 c3 74 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
[Thu Apr  6 21:32:02 2023] RSP: 0018:ffffc900018dfd20 EFLAGS: 00010086
[Thu Apr  6 21:32:02 2023] RAX: 0000000000000000 RBX: ffffc9000182fad8 RCX: 0000000000000000
[Thu Apr  6 21:32:02 2023] RDX: 00000000ffffffff RSI: ffffffff823cc0f8 RDI: ffffffff823ec02c
[Thu Apr  6 21:32:02 2023] RBP: 0000000000000246 R08: ffffffffffffffe8 R09: ffffc900018dfd78
[Thu Apr  6 21:32:02 2023] R10: 0000000000000001 R11: 0000000000000000 R12: ffffc900018dfd78
[Thu Apr  6 21:32:02 2023] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[Thu Apr  6 21:32:02 2023] FS:  0000000000000000(0000) GS:ffff88849f880000(0000) knlGS:0000000000000000
[Thu Apr  6 21:32:02 2023] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Thu Apr  6 21:32:02 2023] CR2: 0000000000000000 CR3: 0000000006640002 CR4: 0000000000f70ee0
[Thu Apr  6 21:32:02 2023] PKRU: 55555554
[Thu Apr  6 21:32:02 2023] Call Trace:
[Thu Apr  6 21:32:02 2023]  <TASK>
[Thu Apr  6 21:32:02 2023]  __wake_up_common_lock+0x81/0xd0
[Thu Apr  6 21:32:02 2023]  dequeue_one_g2h+0x15d/0x460 [xe]
[Thu Apr  6 21:32:02 2023]  g2h_worker_func+0x5e/0xe0 [xe]
[Thu Apr  6 21:32:02 2023]  process_one_work+0x287/0x520
[Thu Apr  6 21:32:02 2023]  worker_thread+0x53/0x3a0
[Thu Apr  6 21:32:02 2023]  ? __pfx_worker_thread+0x10/0x10
[Thu Apr  6 21:32:02 2023]  kthread+0xf6/0x120
[Thu Apr  6 21:32:02 2023]  ? __pfx_kthread+0x10/0x10
[Thu Apr  6 21:32:02 2023]  ret_from_fork+0x29/0x50
[Thu Apr  6 21:32:02 2023]  </TASK>
[Thu Apr  6 21:32:02 2023] Modules linked in: xe(+) drm_ttm_helper gpu_sched drm_suballoc_helper i2c_algo_bit drm_buddy video ttm drm_display_helpe
r drm_kms_helper syscopyarea sysfillrect sysimgblt fuse x86_pkg_temp_thermal coretemp kvm_intel mei_pxp mei_hdcp kvm irqbypass wmi_bmof mei_me mei 
e1000e crct10dif_pclmul crc32_pclmul ptp ghash_clmulni_intel i2c_i801 i2c_smbus pps_core intel_lpss_pci wmi [last unloaded: ttm]
[Thu Apr  6 21:32:02 2023] CR2: 0000000000000000
[Thu Apr  6 21:32:02 2023] ---[ end trace 0000000000000000 ]---


Matt

> Benefit is rather small too, so revert it to stablize the stack.
> 
> Reverts below changes
> drm/xe: Pad GGTT mapping with an extra page pointing to scratch
> drm/xe: Coalesce GGTT invalidations
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> Niranjana Vishwanathapura (2):
>   Revert "drm/xe: Pad GGTT mapping with an extra page pointing to
>     scratch"
>   Revert "drm/xe: Coalesce GGTT invalidations"
> 
>  drivers/gpu/drm/xe/xe_bo.c         |  1 -
>  drivers/gpu/drm/xe/xe_bo.h         |  1 +
>  drivers/gpu/drm/xe/xe_bo_types.h   |  4 +---
>  drivers/gpu/drm/xe/xe_ggtt.c       | 35 +++++++-----------------------
>  drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
>  5 files changed, 10 insertions(+), 33 deletions(-)
> 
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
