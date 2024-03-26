Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF112C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 18:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC7810EB65;
	Tue, 26 Mar 2024 18:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnjm5fXs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A311A10EB65
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 18:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711479502; x=1743015502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=myI8oQwDWmzjuI6Wjiwb4NrA2opquGpOrrBEEvwO+vY=;
 b=fnjm5fXsQHNydEl85jyxYNyZW2MMt59IVm0HJYNkx4cp81ZHNU0EAnrC
 g9O4v9hLgnRjVu52X2sADJ7Bg98RInjSyU8TMnyI1LWUXC9LS47HR0QqS
 /8PouIBScIoDmar8Wf4MgtOZbZlnzDzZeSz2Ws5oGn4QtmqHrBxihxCWT
 XWUg3y5Whlnq/k5UqxPHJV0OeGMoqU/OwYs+iE3AZUX6y21H31GXyujDy
 dy4obV2KiPy7ZL585kAvtpycSh6ocdqca4B/+xtfFC5knMk793j/s25nY
 bCWZs/RylvfDd941wjbtCxQOgQWR6JUehPnbBwInTiqWUY4fBimlsPPOV Q==;
X-CSE-ConnectionGUID: dKpok+crRC+vkTrwaHl4NA==
X-CSE-MsgGUID: No4RV6YCTj6AWWsaoOsjTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="31992155"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="31992155"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 11:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16013394"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 11:58:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 11:58:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 11:58:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 11:58:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DID3vTbyUcQ+I+c4r/q3qc2B+mGy85Dk7u4ozfENjifJMhGmNEUyu1NJlipyXhWruGJlUBUqSiyRpVVX93rQK3UlAix9+7uA2JVATrDw9CKaZeJ9dXb3Kop+4PqHCuYuh/8q/GwmNSjqSipolblLtIuigmVXp0og8bRmPLYk+lZPgjWRsH5pz3vmRayQ2eX8vDsKjEBbULZhR0hLPBnc5qC68DdE0t01PuyTd41EYVjDZkP+xauVl7kii5yvsCU2uS8FsCcO8Bd0HLl+l7LbxLIbRYWAcxb9CCsrsh6ZqNZhJwhiih7j7Km8u9DcsP10vDyhb03/ZmJZhue2VwMYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcWDtCjGtOo2WkeLnvcdgxz2FvfixV9nRSdcHMJOECY=;
 b=Xky2S/sHIA51TsCeC9NB29UgaFFOZLCr2l/brdOyg4zlZLIFgBqrg8bLYji4Pakr/cUic4qQE5poJeAYQ6BdLY/gr3/WsvqC8YRAUCePITCn/ROwI1DvS17Id5lKD9qa4N5gCvF1UFKnbO8PKpv+F7Yy58arXIN+x3K1mz5LTT1QYg4aLsBu92FJgOWZFVboZbWMgzySOH9eD1UIhgjjGnR27bE3tiYzA4uJ7Pii2Gt4TTmrtP0v1yKzNocx+ywYKQknbrK4bqEG5aWtlozvNeiArK1MstIfUZ3v7lh/KM3B7bmNK5+ccm2WpMTp4/lHTd7cysWwqOOf1RZytSdKWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 18:58:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 18:58:18 +0000
Date: Tue, 26 Mar 2024 18:57:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 14/30] drm/xe: Add xe_gt_tlb_invalidation_range and
 convert PT layer to use this
Message-ID: <ZgMahAA1Xm1/5Hu1@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-15-matthew.brost@intel.com>
 <SA1PR11MB69914DBB81E68E590F33511492362@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69914DBB81E68E590F33511492362@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4533:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LZpF97ampJsczAazyiFgwonRudzbP7JuGqDob+f0b++Wf8nAJjFxyt/aMY3u1IThNoRKuWfbksW4a4C2cw93lP9EPtU2eK38nKQqKLdaEqSh695EfTAGxEFFCg1eikmknOB1LVbMrQeY6WjjdXui8Va7zSE7CPAht0P9Fh5BONVy7nUzgCltv4Gl24fd+dU7grwDikqlfMURMAOzTBpBsyIcggYA+9HQW8t0qijsbfGSZVcwyIPyd7cxaQLB8nQqEb/WcLIWcqyWBfK9nI03bUwElTPq5DMnX8H8zKoH91X8waFaiqi3fZtE/jjBOcltguHWdALL5o4q9terjeadRZQjm7S1lz8KDixR3KuleC6okzcDJTGDmA9kNHo/Ln/zxscM+OxYc1t+y1bgvrHh2h4EHOLbBphYT3oikgeKBxNsqgoorAvAgvL6Y66MTlxxAb2x9Ak+zhg7rnzonTfEc1qR5m7HqnKtmds/AeuF6rUTvZdVD0XvdTRYN+15p5ljIOVyBVEVrzayno6X5H75PsbnQhmFJSTNaNZWUFrNwXfpez/L2Bgcgb7r/R4OYHnSWMmrlkmAb7KbJ9lWyscnpCaJ2Sc/Y1f/p7Pi/X4BT2WoEskmSaoF+lWGWLggb/CO1yoTWQ5FWxqyEBig8nlFdpeaT3CwPQOQhMI0RwIWMl8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?POhad4vCiCinSJgr+oP3aF1i+GYkUqIszTtjK3/k28AhNT4J8O7+otM5Dfg+?=
 =?us-ascii?Q?7hGXNLyOML43etCOVFI1NAeuGONK6h5dA2IU7mERt1R1tLIBvOyMohiXPb/H?=
 =?us-ascii?Q?PNeJsE52ITZccZiEwZe3ZXgHPkg2fZIrYk93Iutv9XudMM+Mkn87FgZk1HAv?=
 =?us-ascii?Q?E6pobGhKz+zH/9rALYmDDe3hq1q7pJDzKdWH+CXXwjP4efYMqoij28P00eQj?=
 =?us-ascii?Q?dVYjiT749VD9ecJyN8n7PSYdyapVAlUprfbPZvXi1O+i4rXHzkePEcOIsvn4?=
 =?us-ascii?Q?t6BUs3961/ZnlUXZFAImMNTZvDoPjx89ahtVBjz3Jtrxi9hSl6FMaeS+2mWr?=
 =?us-ascii?Q?o5GKucUjfoUAE8joi6hrDU/74JZ4yvxTkvcIQIXdjlF00eMXDubC0DFUNKZK?=
 =?us-ascii?Q?kkpm6VrnODF+oStAzvgBlNa4ApZqxjCBF1XbjIVSqIVGe6qeL+p6dmxywxSF?=
 =?us-ascii?Q?8Yedo21Gy25L48rtZ41SN66bcnR4MBCi84SKi5fSR2ZPKIcJTdu81RXstQxX?=
 =?us-ascii?Q?iDpGPSsSnkbsHYQ2PR84QWsKlHmK6gvkwButx3bnSRTnVOZut+MAdI4Rpj6v?=
 =?us-ascii?Q?vj3fRx7MQ7L6eVYgSt7juAo8qlQH4Pbm9sMcAcS0WYA0ZMmrQw5XusnCWCVU?=
 =?us-ascii?Q?TX6r+bMWTedscdI66gxBwzjTCPad4MqqICIjnnQl00Tk8g6LQwWkuSKFpjFh?=
 =?us-ascii?Q?S0no0rAeZDbN71DkGvCEb+89h3bntcwFId2Mpit7p2EVnm0Jiw3WkMTbSrvc?=
 =?us-ascii?Q?qFpy5boa3Figat694qCFGwg/X2Ba27JqNtqKxjw4y4kIdvc/PNaB+Jaz5uh+?=
 =?us-ascii?Q?yjFOYbyK/j7h06jIdsNTf1HNpCK/2vjnOFSuUItZCt5QI9oYxmduxwWIo8uE?=
 =?us-ascii?Q?b8vS3bDLAPSHHSOM0Jkq6chVq2EQCL/3yrmxwqc0HWT6nAujm1XcAFsCnnEu?=
 =?us-ascii?Q?k04bG5ZAgzhylf1q/zIzzgCoxgosxmM32ARh1Z7QDzaR6p9VDLju4fdbM5A6?=
 =?us-ascii?Q?+HfJugDd6/sHnlYGNFlpwgrTGei4XP7Tz8jntk8gU81EyXIHyEdrWT/B9OvL?=
 =?us-ascii?Q?XQS25VWMv+ETaM2aCniO6d6zeZrcpT1K2FcopahpeB+65pdgiWPo9+F8gbAM?=
 =?us-ascii?Q?WDlCz2s/cGbJ2IMFVAsNGcbZwjKcdrUVnyRA7opiNj01kzujL3CVSUujPC28?=
 =?us-ascii?Q?5JvnT+V+cy/TufaPTopQepQyrEoiyYWdsauiJvUXTLDpcndmZVQChGdxRPax?=
 =?us-ascii?Q?cqz7MH1piDfYdVnVvVWKkujtLoisxvxdkeu/4vLukyD42UFZH/Cl5+wf/w9v?=
 =?us-ascii?Q?F5L97FraxAHlbhxlPAf5Zl+igmL7c5D2DEsL+k53OpM5vSfCeAnZmPJcrtom?=
 =?us-ascii?Q?7or8XS8p9z5eOEr+bvLsdk0ijbkB1mUjWgFXmyQxFQwPo+aFeUKQQazIbNzG?=
 =?us-ascii?Q?JiL4IKyhKvYLsdYqxmsd9BHJDQq+iu+BCqJWxWR7+0O7R+Vtnrtklj7RUfZN?=
 =?us-ascii?Q?0Pyi1oD0clEs/d6d/jlmUeDJPqNIZ0wrklme7NoWVRULjWfwse6Ya5alS3Wa?=
 =?us-ascii?Q?eE2PctKrVeKct/RGvRRRxsBdjvXQjtaz0CGY6UJOn8hiOB867C6JvDi2mCfR?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c77cf05e-ea31-4d7d-74e9-08dc4dc6b2b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 18:58:17.8585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vgz4pCPJuNxGR/Pt+2+Z6X7AdKBK131hRg5uS99d+9fVzLRIZxOWiUCxPh40pqG3h47sWaspZYg7KVBzpWdtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
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

On Mon, Mar 25, 2024 at 03:35:16PM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> Patch looks good to me. See one question inline
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 14/30] drm/xe: Add xe_gt_tlb_invalidation_range and
> > convert PT layer to use this
> > 
> > xe_gt_tlb_invalidation_range accepts a start and end address rather than
> > a VMA. This will enable multiple VMAs to be invalidated in a single
> > invalidation. Update the PT layer to use this new function.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 59 +++++++++++++++------
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  3 ++
> >  drivers/gpu/drm/xe/xe_pt.c                  | 25 ++++++---
> >  3 files changed, 65 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index a3c4ffba679d..ac2bf86de39a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -264,11 +264,15 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> >  }
> > 
> >  /**
> > - * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
> > + * xe_gt_tlb_invalidation_range - Issue a TLB invalidation on this GT for an
> > + * address range
> > + *
> >   * @gt: graphics tile
> >   * @fence: invalidation fence which will be signal on TLB invalidation
> >   * completion, can be NULL
> > - * @vma: VMA to invalidate
> > + * @start: start address
> > + * @end: end address
> > + * @asid: address space id
> >   *
> >   * Issue a range based TLB invalidation if supported, if not fallback to a full
> >   * TLB invalidation. Completion of TLB is asynchronous and caller can either use
> > @@ -278,17 +282,15 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> >   * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
> >   * negative error code on error.
> >   */
> > -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> > -			       struct xe_gt_tlb_invalidation_fence *fence,
> > -			       struct xe_vma *vma)
> > +int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> > +				 struct xe_gt_tlb_invalidation_fence *fence,
> > +				 u64 start, u64 end, u32 asid)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  #define MAX_TLB_INVALIDATION_LEN	7
> >  	u32 action[MAX_TLB_INVALIDATION_LEN];
> >  	int len = 0;
> > 
> > -	xe_gt_assert(gt, vma);
> > -
> >  	/* Execlists not supported */
> >  	if (gt_to_xe(gt)->info.force_execlist) {
> >  		if (fence)
> > @@ -302,8 +304,8 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >  	if (!xe->info.has_range_tlb_invalidation) {
> >  		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> >  	} else {
> > -		u64 start = xe_vma_start(vma);
> > -		u64 length = xe_vma_size(vma);
> > +		u64 orig_start = start;
> > +		u64 length = end - start;
> >  		u64 align, end;
> > 
> >  		if (length < SZ_4K)
> > @@ -316,12 +318,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >  		 * address mask covering the required range.
> >  		 */
> >  		align = roundup_pow_of_two(length);
> > -		start = ALIGN_DOWN(xe_vma_start(vma), align);
> > -		end = ALIGN(xe_vma_end(vma), align);
> > +		start = ALIGN_DOWN(start, align);
> > +		end = ALIGN(end, align);
> >  		length = align;
> >  		while (start + length < end) {
> >  			length <<= 1;
> > -			start = ALIGN_DOWN(xe_vma_start(vma), length);
> > +			start = ALIGN_DOWN(orig_start, length);
> >  		}
> > 
> >  		/*
> > @@ -330,16 +332,17 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >  		 */
> >  		if (length >= SZ_2M) {
> >  			length = max_t(u64, SZ_16M, length);
> > -			start = ALIGN_DOWN(xe_vma_start(vma), length);
> > +			start = ALIGN_DOWN(orig_start, length);
> >  		}
> > 
> >  		xe_gt_assert(gt, length >= SZ_4K);
> >  		xe_gt_assert(gt, is_power_of_2(length));
> > -		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
> > ilog2(SZ_2M) + 1)));
> > +		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
> > +						    ilog2(SZ_2M) + 1)));
> >  		xe_gt_assert(gt, IS_ALIGNED(start, length));
> > 
> >  		action[len++] =
> > MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> > -		action[len++] = xe_vma_vm(vma)->usm.asid;
> > +		action[len++] = asid;
> >  		action[len++] = lower_32_bits(start);
> >  		action[len++] = upper_32_bits(start);
> >  		action[len++] = ilog2(length) - ilog2(SZ_4K);
> > @@ -350,6 +353,32 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >  	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
> >  }
> > 
> > +/**
> > + * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
> > + * @gt: graphics tile
> > + * @fence: invalidation fence which will be signal on TLB invalidation
> > + * completion, can be NULL
> > + * @vma: VMA to invalidate
> > + *
> > + * Issue a range based TLB invalidation if supported, if not fallback to a full
> > + * TLB invalidation. Completion of TLB is asynchronous and caller can either use
> > + * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
> > + * completion.
> > + *
> > + * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
> > + * negative error code on error.
> > + */
> > +int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> > +			       struct xe_gt_tlb_invalidation_fence *fence,
> > +			       struct xe_vma *vma)
> > +{
> > +	xe_gt_assert(gt, vma);
> > +
> > +	return xe_gt_tlb_invalidation_range(gt, fence, xe_vma_start(vma),
> > +					    xe_vma_end(vma),
> > +					    xe_vma_vm(vma)->usm.asid);
> > +}
> > +
> >  /**
> >   * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
> >   * @gt: graphics tile
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > index fbb743d80d2c..bf3bebd9f985 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > @@ -20,6 +20,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> >  int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >  			       struct xe_gt_tlb_invalidation_fence *fence,
> >  			       struct xe_vma *vma);
> > +int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> > +				 struct xe_gt_tlb_invalidation_fence *fence,
> > +				 u64 start, u64 end, u32 asid);
> >  int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
> >  int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32
> > len);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 7f54bc3e389d..110d6917089b 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1074,10 +1074,12 @@ static const struct xe_migrate_pt_update_ops
> > userptr_bind_ops = {
> >  struct invalidation_fence {
> >  	struct xe_gt_tlb_invalidation_fence base;
> >  	struct xe_gt *gt;
> > -	struct xe_vma *vma;
> >  	struct dma_fence *fence;
> >  	struct dma_fence_cb cb;
> >  	struct work_struct work;
> > +	u64 start;
> > +	u64 end;
> > +	u32 asid;
> 
> 
> I didn't see start/end/asid is used anywhere else, except in the below fence_init function... do we really need those members?
> 

Yes, see below.

> Oak
> 
> >  };
> > 
> >  static const char *
> > @@ -1120,13 +1122,14 @@ static void invalidation_fence_work_func(struct
> > work_struct *w)
> >  		container_of(w, struct invalidation_fence, work);
> > 
> >  	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
> > -	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
> > +	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence->start,
> > +				     ifence->end, ifence->asid);

They are used right here ^^^

Matt

> >  }
> > 
> >  static int invalidation_fence_init(struct xe_gt *gt,
> >  				   struct invalidation_fence *ifence,
> >  				   struct dma_fence *fence,
> > -				   struct xe_vma *vma)
> > +				   u64 start, u64 end, u32 asid)
> >  {
> >  	int ret;
> > 
> > @@ -1144,7 +1147,9 @@ static int invalidation_fence_init(struct xe_gt *gt,
> >  	dma_fence_get(&ifence->base.base);	/* Ref for caller */
> >  	ifence->fence = fence;
> >  	ifence->gt = gt;
> > -	ifence->vma = vma;
> > +	ifence->start = start;
> > +	ifence->end = end;
> > +	ifence->asid = asid;
> > 
> >  	INIT_WORK(&ifence->work, invalidation_fence_work_func);
> >  	ret = dma_fence_add_callback(fence, &ifence->cb,
> > invalidation_fence_cb);
> > @@ -1286,8 +1291,11 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma
> > *vma, struct xe_exec_queue
> > 
> >  		/* TLB invalidation must be done before signaling rebind */
> >  		if (ifence) {
> > -			int err = invalidation_fence_init(tile->primary_gt, ifence,
> > fence,
> > -							  vma);
> > +			int err = invalidation_fence_init(tile->primary_gt,
> > +							  ifence, fence,
> > +							  xe_vma_start(vma),
> > +							  xe_vma_end(vma),
> > +							  xe_vma_vm(vma)-
> > >usm.asid);
> >  			if (err) {
> >  				dma_fence_put(fence);
> >  				kfree(ifence);
> > @@ -1625,7 +1633,10 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct
> > xe_vma *vma, struct xe_exec_queu
> >  			dma_fence_wait(fence, false);
> > 
> >  		/* TLB invalidation must be done before signaling unbind */
> > -		err = invalidation_fence_init(tile->primary_gt, ifence, fence,
> > vma);
> > +		err = invalidation_fence_init(tile->primary_gt, ifence, fence,
> > +					      xe_vma_start(vma),
> > +					      xe_vma_end(vma),
> > +					      xe_vma_vm(vma)->usm.asid);
> >  		if (err) {
> >  			dma_fence_put(fence);
> >  			kfree(ifence);
> > --
> > 2.34.1
> 
