Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A986C05027
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 16:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D6010F05D;
	Fri, 17 Feb 2023 16:22:54 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3106510F05D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676650971; x=1708186971;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=23KenqW8XOpJj7pvKgJ+oAVmGCyM64nkhQCoWMk1F94=;
 b=SevZow4OzM7RB/RBKRuX9w0YDhycQDxWBBe2yh8aAcGAMxKdJuWW834b
 itTr3HTwUL7D4EtbObhynAWF9UGLN3yWTE80dgO1cP2JjpyU33mlKbg2O
 PLnBdP53E22TKGtVrofy4N2oWM66E+r4UG4W9Z9lCBmVyB3f3iEMl1Sn5
 SWp7+k8KRxt3ol21SBanEE1ml+AkEV6lCU2zh/A4EGOkYeSXkTECmqe9C
 VReS4G4b7ZpeMYbQUrqLbYnnoTEdpYAAo2LeMm8Obd/ps6PcU35XH4pth
 eUfFelL6LMGpsnQf7i6Y9z06a9KiGR2s4u+3QbijEKyNJN3FiSvRLFGBL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="394498224"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="394498224"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 08:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="672636019"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="672636019"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 17 Feb 2023 08:22:48 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 08:22:48 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 08:22:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 08:22:47 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 08:22:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdwdYOL3qM1z/lS9uLx2sVFI93pOch/Ka05lbiUERQ6OzpbjlBT3UqBo2/0xxum8RpmCJGRhgW3uwRnmb6hzgOnb/jEZlEtwIgHEeU4WFyW9d08UhYK3YTh4twMoNVJc1g0M187fzLQrucTNTnHjVElXVrg7qw2EBAM8gbM7PmfGPilKzscPLJNsZvArMNCLIt4938iuuzzdf2cJuQbfGy544Tk9z/E6RIzDmBd7RApai475BLPCjJjGG0eV9ph2iA2OD/RSmke90GK8t7qMqiJtRMzunZCgHhG1kiBNoSAx6nnoJfwctqoxFgu1dfA3nJIvBrCvMHDqi5eO4uutSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbVZTTGS2wXg8KVG1POVHiBCylKAkO8xfMVFOSHRYbw=;
 b=YCMIY6BeTDVtO2Pxj0OP/un664B6VDtwwXF0h4XCfVMjmatzWSibX59AJvlbmDo4LYsTDdV4ZZ3JlEi5WM4PQbsarMHmbRLXuMg/LTPfirwDX7E8++PGXPvsdicYTINlM6pu7DUZ/ONTspJ1cR0fc2OFCTb35UpyOP5sdQZhAsVKaZkgcQLygSeoau/6pOfAmzq4KAtoKmml2HUvkdJCuMOtAHGOznhkQ3482Bvea84qbEQgvHLtoHIvshhEZpFVUcGkexplxfdiRI011P3Kj853WBRItUGK9jsUYynLP3xYBTdQwvnNXsRLodjUIbd+B/JSj+Pt/dUx0DxLz/8d8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 16:22:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 16:22:45 +0000
Date: Fri, 17 Feb 2023 11:22:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <Y++p0PVsTCn7DF2y@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
 <20230203202409.577032-7-rodrigo.vivi@intel.com>
 <Y+rGAG5HWN5pcvVM@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y+rGAG5HWN5pcvVM@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0115.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5372:EE_
X-MS-Office365-Filtering-Correlation-Id: bd197b99-613a-47d2-143f-08db11033388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CwJgqy6YKo2aJfWRtFE/GXCuQMrUbuAi9B7nKVsB6QQECU7zOPEPL3DX3On5FKKAC7BsC5QoEwnxRwP5aaOsPfztG7HwrI5JdTRFmTlagAJNMR8K5Pii8qIi0bOEQ2z/EEZAvIX99jVer1rB3opDqxF+bKmphbtg0j5NGl4siXOPlCIFt6sepM1N6m1inzIFrOe0bUHbIDIim7j4alz8XMoDVwncU3+28cDj1NN+sl8EbK4Hm8BK1IH6PWb8cOmSsqFWaONL54v+ES4+sHFG+OZtu9kqrmqxIvDbvOVQswfonz/2i4xULbnHHyv4OPYkslwhZQgEGsU4pAexemdM1ZMD8IwYAIL4ZwijFteoNqYPuqkvd7K47Q3BUO1bA6tynUDXdcrJrxhdHjuVWvdGWXdz6GuRVgjWPB4pcUlm6e9gTaTEoFf0wM2RW0BWEym0z7lAlqZcc7CcXRPD6jUkHYA27sBltHANhedWq9767L53GEaYCeyBRX9q9hTq6AQrZUoPLkLRy0hwYGK3AjyAuoaS/SOkFEMUjEiBJWx+zg3bT33575ZVfxV1HRu2l3D0bRyM6Nf8gspeeDrNc9tsb6Tc6JIA+usa+0b3YHfjMXU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199018)(44832011)(86362001)(82960400001)(2906002)(38100700002)(966005)(6512007)(6506007)(6636002)(26005)(478600001)(186003)(36756003)(66476007)(8676002)(83380400001)(66556008)(66946007)(4326008)(316002)(37006003)(6486002)(6666004)(107886003)(41300700001)(2616005)(8936002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XhbEcfSWM7WQCz3eDNoMxNLmMBLY+04vchOPs8CMQw10z5xbZzBk5+yXwnUk?=
 =?us-ascii?Q?J1p+8p+ChmMHUiiCDhtom2KiMnrJ2Re8ND6XJrN7p8n57LBqFOhtujNUs+rp?=
 =?us-ascii?Q?ysWZ1HstR5gguRkpeY6qyNzwMlu7Zy1LAlBCiga+LLPNYMITuE41X5iKp5Id?=
 =?us-ascii?Q?Id2U3Dn0NEHHlfQOw/oMhULRDooNveiCf68AZNZQi498ntMObr9aHbiSLNXf?=
 =?us-ascii?Q?sB0+oCpgMiYODTV3nGMX9Ewwz8gRnQKhi+1QB2ciNAoJZtwNeHar10wmIUCy?=
 =?us-ascii?Q?k9d9i0O53/wMgB622Rbw91M0pufqW19jYEquCTAGhDXOKhugUFssJ4Dm4QTR?=
 =?us-ascii?Q?QceEXmEZll3I+4L2aByPSqssRLfOvRCMuiq+H9/qD9wiRhBNyfL0zvI5fqDe?=
 =?us-ascii?Q?nmhB+KIysSDYoA7jyCEDhkHjYAc7IexN2AdjtyuKgepXTN3OwLFjZjxrhcBt?=
 =?us-ascii?Q?EmYR80iuIpop/+0rzznfVRzT0j1sZ/bOzvJTmISdEwrKwwFUkZY3hIA3eQCu?=
 =?us-ascii?Q?y59oCCCDOmACMoG6pR1/9Cwnf6TifapS7oiJYTB0h+Edi+lKDtqepfB3UxX9?=
 =?us-ascii?Q?Rjuwi7eWtP5JwzeckwijWDwbP1A4fugexibxsRVh6hk4L1PColIME+k6gOcD?=
 =?us-ascii?Q?2AKXtYzkWE/veFJad67N9rS1rgcG7Tcf+qBMPNavoPxcbz/4ROmeLbzltvJv?=
 =?us-ascii?Q?WlREsG5sV5dXm5jgrYk5ngkoE7gMUDRv9jcou7qYT9sQapB+b3VRJBEC3PhM?=
 =?us-ascii?Q?tHinO5I5AL1BA7blFhWsswfKLVNNhDdcpnJRPnLZU8E4VtYFfq34Zavno31K?=
 =?us-ascii?Q?WAnJEC2sYSt5WNsuIJLL4jFt+Cu+LDfej7OADx0W2iCQRO6eDG4CKiGCMb0n?=
 =?us-ascii?Q?yQB/jxtA2/twhH8TYqEXGA976CVPxOHfHsfyEGuuJZCx8gcgDqSWaolD8qKs?=
 =?us-ascii?Q?S4Ko4UC7x0x4f53jG0BKndLE3A+9NhGQwPg9FFyo9EBCAL7/smoNh97L1jC4?=
 =?us-ascii?Q?iWTYRjg6/WinUKIfePrejpGPnY0x0nI9vmtwNQCEGBLWJKCcDYBWYHFggRO5?=
 =?us-ascii?Q?PS9SA2tmLNGs+ggRzJU9lUDqT2JfnSqF6QpDVtcb99I0st/m6WaOG/mucPjv?=
 =?us-ascii?Q?dc3tvMLU3FZJtjCfjtXdB+m/qznDYCDq5dzES8c7nd7XpRxCpcgupTEZZeLv?=
 =?us-ascii?Q?Rkc/B8N4zotybBEXnYT5UyTnMvZdZrJDJrQIjFcDQNIX+XBgBQO62YJEp+Pw?=
 =?us-ascii?Q?NrduaAtbNG3VlZ/w7cNV8Iaiw+KfbbSYd4Jt13p7vY19Gfw+cW9pJqG84A4A?=
 =?us-ascii?Q?aOLYg5aSXekCOsPMR0PfXHweojV5EEq6GKMeAHa2w8eiLCQVgyCJ1wxIgtVn?=
 =?us-ascii?Q?7/vKrnogEyqn2jGPrEhZ4rSHw0dbrFj0JGyEBBmIZLt2iXRBYphgsOYBk6ks?=
 =?us-ascii?Q?5BEFKcAswHOs5AGwCJZzk0RDJGr8Wu2DDZ7ojkHAH8waVMcCLoXumdxZ6ezE?=
 =?us-ascii?Q?Ysj4QpqXOUI+Xow6H+HvlgRQKi4tSz+10kFt+FcbFUjU4USLNvSEwc9RSZDV?=
 =?us-ascii?Q?TK249dHtC42lIQu0naJ+XMPMdPQVaM9vDIgNOpqva240OwYZH5/YgoBXx6S0?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd197b99-613a-47d2-143f-08db11033388
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 16:22:45.4092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdKL26EAyCA2c8c/L1SXAjoI+SW6+AArhQM2Ls2zpaKY4zLrO0Az/9wgRuZaX6NRJhfW5Fkj+c3qL0AKvkOl0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5372
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/22] drm/xe: Kernel doc GT TLB invalidations
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

On Mon, Feb 13, 2023 at 03:21:36PM -0800, Matt Roper wrote:
> On Fri, Feb 03, 2023 at 03:23:53PM -0500, Rodrigo Vivi wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> > 
> > Document all exported functions.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 52 ++++++++++++++++++++-
> >  1 file changed, 51 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 23094d364583..1cb4d3a6bc57 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -14,6 +14,15 @@ guc_to_gt(struct xe_guc *guc)
> >  	return container_of(guc, struct xe_gt, uc.guc);
> >  }
> >  
> > +/**
> > + * xe_gt_tlb_invalidation_init - Initialize GT TLB invalidation state
> > + * @gt: graphics tile
> > + *
> > + * Initialize GT TLB invalidation state, purely software initialization, should
> > + * be called once during driver load.
> > + *
> > + * Return: 0 on success, negative error code on error.
> > + */
> >  int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
> >  {
> >  	gt->tlb_invalidation.seqno = 1;
> > @@ -24,7 +33,13 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
> >  	return 0;
> >  }
> >  
> > -void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
> > +/**
> > + * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
> 
> The description here is confusing.  We're not really "initializing"
> anything here.
> 
> > + * @gt: graphics tile
> > + *
> > + * Signal any pending invalidation fences, should be called during a GT reset
> 
> Is it confirmed that a GDRST-initiated reset implicitly invalidates all
> the engine TLBs (and thus just signalling all the fences is sufficient)?
> Or does the GuC take care of this itself while it is being
> (re)initialized?  I know there are a lot of parts of the GT that don't
> actually get reset when requesting GRDOM_FULL, but it's never been very
> well documented exactly what those are.

Since I'm trying to avoid more rebases with these already reviewed and
merged patches, I created an issue to track the changes needed and to
ensure that you get the answers here:

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/212

> 
> 
> Matt
> 
> > + */
> > + void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
> >  {
> >  	struct xe_gt_tlb_invalidation_fence *fence, *next;
> >  
> > @@ -82,6 +97,19 @@ static int send_tlb_invalidation(struct xe_guc *guc,
> >  	return ret;
> >  }
> >  
> > +/**
> > + * xe_gt_tlb_invalidation - Issue a TLB invalidation on this GT
> > + * @gt: graphics tile
> > + * @fence: invalidation fence which will be signal on TLB invalidation
> > + * completion, can be NULL
> > + *
> > + * Issue a full TLB invalidation on the GT. Completion of TLB is asynchronous
> > + * and caller can either use the invalidation fence or seqno +
> > + * xe_gt_tlb_invalidation_wait to wait for completion.
> > + *
> > + * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
> > + * negative error code on error.
> > + */
> >  int xe_gt_tlb_invalidation(struct xe_gt *gt,
> >  			   struct xe_gt_tlb_invalidation_fence *fence)
> >  {
> > @@ -100,6 +128,16 @@ static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
> >  	return false;
> >  }
> >  
> > +/**
> > + * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
> > + * @gt: graphics tile
> > + * @seqno: seqno to wait which was returned from xe_gt_tlb_invalidation
> > + *
> > + * Wait for 200ms for a TLB invalidation to complete, in practice we always
> > + * should receive the TLB invalidation within 200ms.
> > + *
> > + * Return: 0 on success, -ETIME on TLB invalidation timeout
> > + */
> >  int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > @@ -122,6 +160,18 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
> >  	return 0;
> >  }
> >  
> > +/**
> > + * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
> > + * @guc: guc
> > + * @msg: message indicating TLB invalidation done
> > + * @len: length of message
> > + *
> > + * Parse seqno of TLB invalidation, wake any waiters for seqno, and signal any
> > + * invalidation fences for seqno. Algorithm for this depends on seqno being
> > + * received in-order and asserts this assumption.
> > + *
> > + * Return: 0 on success, -EPROTO for malformed messages.
> > + */
> >  int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  {
> >  	struct xe_gt *gt = guc_to_gt(guc);
> > -- 
> > 2.39.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
