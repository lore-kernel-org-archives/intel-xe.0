Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D195AC531DF
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF7910E7FB;
	Tue, 20 Aug 2024 17:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEVAK9Zs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFAD10E7FB
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724175189; x=1755711189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oLl23sosL3oBg+epePzn+RFGD0LMjBdB3MJDBzozMxY=;
 b=kEVAK9Zset/mRfU6FmC53u2STHQYRYLa+OT4woLUz9uUw+4iukPC75U3
 y4nFh7nfReCPS7+Xpud9wzOHE7Zfmk3kCGQuEGwVdp5S1sYEtTLhlqws1
 75hdhtQqx1xmccf3qW68+VoN05shK997nVd5x/3vIAjHAc6ZhP+ICwjVL
 eGjeLwnUSk8CpUdZuf3gEwfGRAQQcHVCBM/WIs80yX6WaUgs+GJVtZCG6
 xf1yQ2YyOBtTcR4rgHCfkFgCMp0jcKfoIME27sniJc3snxrzZC/nfGjNi
 Cf0S1VCFQrQv2lma9XxsW3XkieryjRj6Ch4tB6kj2c/qnduigKcaqW0rJ A==;
X-CSE-ConnectionGUID: b5ETemGaT5mrIrT8eqwJiQ==
X-CSE-MsgGUID: mFqUmJi1S9eTxW44MVWZFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26249459"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26249459"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:33:09 -0700
X-CSE-ConnectionGUID: f1Z/U0JzSYuut9RdWyC5Nw==
X-CSE-MsgGUID: X5KjavkAQL2QcJbeVjvIlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65763294"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 10:33:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 10:33:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 10:33:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 10:33:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnjiSQ60cppuVpzMQYIHY43DSFbW7II9hJZluS1m/8+vKfitC3iG6flkwptsJs/ld89yqqdarQyKQo6d5ADvJu6d9i0FhsOegqiYQ9yvSN5ibfdwy3ZuZGcuYYPi+6WFv/Kj//96TmnHlvSGiL0PgnHy6zpsuseyPzlxFz8FmeMyvI16YwZYkPqBk5VwCYaSHHC8ywqHz6djJ9uavOu55h5LdiYXX5Cuu4Zr1gJ8qKdkOEug8jVf3nHyVLxMDocewpA2DUKbh2vkMbYrDGAjjJsFcYkmlGvuHKteGk3IGrZ72hQYVi+CzqwZJh3lb/6lEsoCSnvmeFxKe7xT/cvpFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYik8TtUoha3sFS/vWjDtOysYC1hreisMcHnWZeGY7A=;
 b=MUbtue0xpIIXOM5LK9LO96HBvE6lFn4e/KbVb500eIpy8MbSgLKv6Y2fbhvh1vhakhBvVpmqjlp0OGp7kfmWI5NqN+bGqGIjyZ8xDuQO9gg6pVMuWfl0ZapV0l/mPMIN90OMJYx+CE4xh/fVuOHHWWRmaOOM1Wi2NZdUzHt0W6lWbRag1SWpDq4AOwCmfzuztPGynMr6oPzvyJoAijaA+8VJjHkKrFMpKfFb70eiuelCyH1E4OJLfDE1Xc0MsubhHJ0ComKSXYzLwl3uQ/XvBVgk+qweEJAhSi5yCFc1cej8/mMvP+YWjWvqhzHyVm/4o9D5YjYcFWz34ntbPDwfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 17:33:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 20 Aug 2024
 17:33:00 +0000
Date: Tue, 20 Aug 2024 17:31:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4] drm/xe: Invalidate media_gt TLBs
Message-ID: <ZsTS/VElKHBXmNl4@DUT025-TGLU.fm.intel.com>
References: <20240820160129.986889-1-matthew.brost@intel.com>
 <20240820172254.GL5091@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240820172254.GL5091@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:a03:333::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 373e4631-6e1d-41cf-4132-08dcc13e232a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TCnsH6OKmKxDoK2J3UD2xCh0eYDa7X5I4E5HwztmTE3F+4bsMBTCS2Yf+74e?=
 =?us-ascii?Q?8oh6t/BXqApaDFomPirBDyEmIHgjF+vIyeW9NDrk+ZNdHHnKiQlhHMIo2TRn?=
 =?us-ascii?Q?8zbdmk64/PNV4niC3dxrPvQRA7eEdbNgOJMVxnXBgPvTrUbB1VhVBruSU71R?=
 =?us-ascii?Q?s+Kch41FnzzwOK3ANoBbxlGFIzA68uFv2pvuZBBd9ivKISzkbr5mkRb6ZYmi?=
 =?us-ascii?Q?AI6jarcbdvL9S4dl1kT1qnyJDTKG0uzPJzzGsS40znnj6i5nuOimQ9YEAxuA?=
 =?us-ascii?Q?LZVqNHEEJifiSqAc0lz70rknHkk0843z1YKcYmyQDNenAUNZS2YgUvfjSg/N?=
 =?us-ascii?Q?SFR9Q1HEQZbCY6SlyeAt88PJMKim9osYIhSnzAlYsw1BuHGbRYjN8JqsRCop?=
 =?us-ascii?Q?ulQKqoChIvRjvfm7QgKaKur0WYtIbyYRlWiIbtEhX3+MkM1wvC2JG6GO9Zyt?=
 =?us-ascii?Q?zGC6pe3B0S80fETyWpgULCduI7XOAnf+5Qn8nNR4AZVSuvbErLIITILgb40b?=
 =?us-ascii?Q?cxe7wsl0x/DnaFzRfy2bErKL4u9JQdWuu3YfuL4YY0tXdqGuP8JEBfH7tzJn?=
 =?us-ascii?Q?0zSKblsK1B7kKxpDcK8U52e8pAbmdZijROF6h+CWDTUMHaDheeIlyAVLVVoB?=
 =?us-ascii?Q?3S/Gvbo2crjQm97KWQu2yEqBL4yTortimlHKpjIDh7vKWEiB7tbAmg1HZaBE?=
 =?us-ascii?Q?PbqvOO8YuZ1zOz0YYCA7mOJJS21yFvBVus4Y4hrJATmjMOku7v8iHK2OdCAO?=
 =?us-ascii?Q?Sx69XKX2EcwmlKw1LnGozJ+e12Ga5XCiU2VnYBzm82yHo49ywO62hFAgNddW?=
 =?us-ascii?Q?cmYHTxc+vFvpIlni5muH4bDlUwrZHQ+uy1jTG0IHVBj2gr6FuBth2szN9rEc?=
 =?us-ascii?Q?u8EW2m7RDYbuGr4aUDqiVIaJqT6F8nqkd20/rOC9U6kJuU0e7JN6AmRrLcf6?=
 =?us-ascii?Q?6Xi6VgJhTkgj18HOhZzqKudZm0kVYrn4CX5dh+X1wECTMb8KMWNqi1daWF9e?=
 =?us-ascii?Q?lOdBsyPkVjK/ixG+KnhY7ja/x44YIkcbizYV8ovzFFyl5b4LP4p9CjDSKVp5?=
 =?us-ascii?Q?0s8bmMNbY0hzdYH3FofpX6UlOQ5m5BsKeMN93W+5DLThqmGSAj0eYIwPhhIQ?=
 =?us-ascii?Q?ih6CcYoVx5L5fQAXUHKJdYXfmwJHfpYCDQVqqqwyuSJdH0VDCQF/pF2uXWWd?=
 =?us-ascii?Q?SZKBjFbd2zeSbWMJCvQr3gNEwsWRXSQ39QMvlTzuidJz3jT736s1QFgb91+K?=
 =?us-ascii?Q?8TRC0AVbF92U7j7XltV5Dn6CoLsGwh4MSGjXpSw+MoZf5rv/lCK9mY5Rb9++?=
 =?us-ascii?Q?XZFO8T7htOi8zUThEA8M4qeF7cnsK2oB5vMWC+eZZ7PUNA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gF9OV+rE9OcWQJFY0qwYO40tiI1sTB7BsgOjEFi7BLT7lrTUxVIT2KdZBLaz?=
 =?us-ascii?Q?bOaZdTV7zkXEZFBOhXHitNkCT7eGH2DbvV53/NPFURY+Q4uQcdfVdy8HuKME?=
 =?us-ascii?Q?ggYfki1zi//gvOKyIk9kyEe7dAabbmzLSEqcYo9wHC15QNjlYfNglJfjx8il?=
 =?us-ascii?Q?tX4F6So4vVLmoGPFx+1BLIuyHIcIEy+JsyxZTauy7LNnOCs2mN6htEfgxV6r?=
 =?us-ascii?Q?r1OblIn2M5WeUmR+gMTcOP3jLFYuNoyr4gqDgKTbUI+0C/FMNAzFWzFMzrAw?=
 =?us-ascii?Q?fkcRmvJm7XWPleuy6+nKn1v4KGrAn7BHvxbUIsGOdDLbrStPVd34I1mxE0ah?=
 =?us-ascii?Q?7RQjchDv/bVMUrPRbHDpE91vSys8fGKiBEWoZIVTMsEeZYlTAge7HMFHubGB?=
 =?us-ascii?Q?eijRBJJ1vaKmIT9tkT1Bj1FwzGUGrz2FZJAneLT/7SFsEGX0qX9mHfzfuIk7?=
 =?us-ascii?Q?Qg+QnPE028/rU9jFALcrylllRuMDJnHrdUD7PlufEuPDDQHZcE6yf23BQYDW?=
 =?us-ascii?Q?evXeVYL+QhUwy1iPJO3PLFk6P9BjCf/pEx4Qy2MW1ufq5c8FRlZHaQB1qLaW?=
 =?us-ascii?Q?b0xuJRfHeRP3mwiBYuyoXt7+8CjPFzCStyNOPUeOs+K0euE+kLytW+t7Q0LS?=
 =?us-ascii?Q?BscUR3fyXfnzi9OFxWw0DOy39EQoDDUTtHq6PCsGkQiw7KXi+TlflhMPZWdv?=
 =?us-ascii?Q?Hu8DCA6C6WFDCDZH6i5PpX+0bIoWRIS9oR0iTV7qjHRIfXZ/fCe9vh1ywidV?=
 =?us-ascii?Q?/BLQifGVTJmv2JToCpVhqfvbpKkVMl4kNdvd7hCi40jCbqtlmRE8zYig1S7g?=
 =?us-ascii?Q?d5U8IwY7TDZhMSu7AUuYbIm4KAGtVR3KuWqikqJoZeZlsIML2M4SVSTytO0X?=
 =?us-ascii?Q?kjpkcVlRsTwezHb+ZvcgR7B91ZaX3SGaO89W9Uxmzp2piXUOc4f06nQ++I35?=
 =?us-ascii?Q?Xr5UVSvSJV9/EqFGKRBKmEC9RjaTsAOz5eqZSFIE1fKKtVWSRsPeM5uiA8Fw?=
 =?us-ascii?Q?Q1vKFl5BsTz3HcGQTsattHueG0aLV6QZAyLpJay5t6QoTs6i3RwKr0Hz6WH/?=
 =?us-ascii?Q?bPgJa2K+0QmHTaRWUnGsj/CPgLdVVAZ9zYDxQgwG5zOIeU3kWVHiW08c840x?=
 =?us-ascii?Q?jsPorX8+tJgBzGLIQmOvHdzZHn2iyEOWY11e3bTBJusj6SWWWFGVQK7rEqIP?=
 =?us-ascii?Q?KnnAHzbOyvjp8yehfn3eOHhZL5qjvMzAiTXiIpbcAxpsBbVkmSGRp66Rutz9?=
 =?us-ascii?Q?R7dTqL8OgGtP9VKp9bDJ/yfmaqXP1QIchOBZOK6tgtR2m8pZ6eqcYmvtgFRq?=
 =?us-ascii?Q?lP44ZSLMNuTB3L83+W8ylQjtlW1Eh/RHOKVWXqWGPCcXaGjN/h7hkBID5V5p?=
 =?us-ascii?Q?j8pEIB0Tx6wjBUb9EpkjXpDwnrMNMnoQDq0hLEYXv1MIzuPvHhQkTvf5ARMG?=
 =?us-ascii?Q?cZXlJrGEc64nI79A3PZVegqEcHxv/bVmeNXMMBQ1002Wxq6iV/b5IbRfpinI?=
 =?us-ascii?Q?SZIz+U18MOyuXDngg1iyKJJCG4fDF7E9kQOb4d1bS2zJF3I5La+5HS57gg8u?=
 =?us-ascii?Q?jj6pO2pulivzN8d837U/ruPCKsSISEgNWUwmvDNXzL7ngzy2/XTGsfu5VKK8?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 373e4631-6e1d-41cf-4132-08dcc13e232a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 17:33:00.3131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvtRvgnhvXHr3DKMY12WoXSSc6OuWdOQxJhlKdc4SyBqsLQEzV6Hmeq10GYB3f3txiQOlT6y4ZkziiNuVBbszA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6978
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

On Tue, Aug 20, 2024 at 10:22:54AM -0700, Matt Roper wrote:
> On Tue, Aug 20, 2024 at 09:01:29AM -0700, Matthew Brost wrote:
> > Testing on LNL has shown media TLBs need to be invalidated via the GuC,
> > update xe_vm_invalidate_vma appropriately.
> > 
> > v2: Fix 2 tile case
> > v3: Include missing local changm
> > 
> > Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
> 
> Is this the right Fixes line?  This may have been discovered in testing

I was struggling with the fixes tag. Just picked a LNL one as yes I
discovered this bug on LNL working on SVM.

> on LNL, but presumably the fix applies to MTL as well since we also have
> a standalone media GT there too, and we've had MTL support in the driver
> since before LNL was added.
> 

Forgot about MTL, yes this will apply to MTL too.

> Of course both platforms are under force_probe at the moment (and MTL
> will be forever since it's officially supported by i915 instead of Xe),
> so it probably doesn't really matter too much for backporting purposes
> and such.

Yea this patch will be pain to backport as it is built on top a recent
change to TLB invalidations. Maybe we just drop it as these are under
force probe so not a huge deal if it is not fixed.

Matt

> 
> 
> Matt
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 37 ++++++++++++++++++++++++-------------
> >  1 file changed, 24 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index d1bfd0b6e955..4cc13eddb6b3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3158,9 +3158,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  {
> >  	struct xe_device *xe = xe_vma_vm(vma)->xe;
> >  	struct xe_tile *tile;
> > -	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE];
> > -	u32 tile_needs_invalidate = 0;
> > +	struct xe_gt_tlb_invalidation_fence
> > +		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> >  	u8 id;
> > +	u32 fence_id = 0;
> >  	int ret = 0;
> >  
> >  	xe_assert(xe, !xe_vma_is_null(vma));
> > @@ -3188,27 +3189,37 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  		if (xe_pt_zap_ptes(tile, vma)) {
> >  			xe_device_wmb(xe);
> >  			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> > -							  &fence[id], true);
> > +							  &fence[fence_id],
> > +							  true);
> >  
> > -			/*
> > -			 * FIXME: We potentially need to invalidate multiple
> > -			 * GTs within the tile
> > -			 */
> >  			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
> > -							 &fence[id], vma);
> > +							 &fence[fence_id], vma);
> >  			if (ret < 0) {
> > -				xe_gt_tlb_invalidation_fence_fini(&fence[id]);
> > +				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
> >  				goto wait;
> >  			}
> > +			++fence_id;
> >  
> > -			tile_needs_invalidate |= BIT(id);
> > +			if (!tile->media_gt)
> > +				continue;
> > +
> > +			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> > +							  &fence[fence_id],
> > +							  true);
> > +
> > +			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
> > +							 &fence[fence_id], vma);
> > +			if (ret < 0) {
> > +				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
> > +				goto wait;
> > +			}
> > +			++fence_id;
> >  		}
> >  	}
> >  
> >  wait:
> > -	for_each_tile(tile, xe, id)
> > -		if (tile_needs_invalidate & BIT(id))
> > -			xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> > +	for (id = 0; id < fence_id; ++id)
> > +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> >  
> >  	vma->tile_invalidated = vma->tile_mask;
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
