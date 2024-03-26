Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEC1C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 19:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0684310F205;
	Tue, 26 Mar 2024 19:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iL7OTo9Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3209810F205
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 19:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711480007; x=1743016007;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/9RLObUEhiwDcdNSSHAYKenSEl+Pr2yqIIEsI89OnOo=;
 b=iL7OTo9ZXG740ptUFR4CGiKDnGvU4KUNpeyliHbBqRJ6U7kQogs+KF/+
 9raYTP+KMbrGudYS53sfnFtVPky6b7TbrHk0qJnVPOBIGr8D6OAlOkCIf
 WYA3+U8pes2qzj1KeIdMHbWZ6g2+KlAbRQ8xu3LVck1pJBeoCYvCZp7sq
 HebIPmP5yZ/Pkr0VCJlXPn+6Z7bVaiQbAJj1UNgp7mFcV4o9rnjshwFG2
 ThTzpdUUI87EKoZBBWbO5feU3fIu8xxltPZ/C5qQqdWTJ68GMTDRXw5Bz
 34+NHFhysHYlA5dqadjvWwUTctCafI45fuLF1sW+z43TxnlD6ll3/7fWN g==;
X-CSE-ConnectionGUID: t8/ZgIpJQdO+MX7ZwDButg==
X-CSE-MsgGUID: 6otPTDH5RJqw6d4f9OQEQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17184503"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17184503"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 12:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="47228896"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 12:06:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 12:06:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 12:06:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 12:06:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8q6tvBpdlq7HmQfrNdCKkK8Bnx6azBRamPdTiKNkVCyWQAESOWou/ASZf0/MQZLYEl/R3O7/jnWUAMluGIkxM2B+3tpo766IyykDP2732ciuDDbG+OCWMjtNSJ5XEfgai6liO/E0qL47NRxtMsXWSodJ+zdOUnVKcjdSsiapZku0hfKtCJWPWz8IBsIGaF7x4f75W8i6tGktdyXVVUQIj6tDdcAab7IVBj5YSKVnPHOg7n6T8JrJ+j8dGpDh9OlaWcBC7YOc7YACilGJMg68OogzzftBz+IuMXrLJLZAMB9NSV97sziuuPaP9X/IyjGJfFWIfBLj96B0CFnzk112A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBH5aCpGDuPKKWV28/Wl6EpzOrH5b4RmRDyLN/jcnAY=;
 b=cQa+abmNbV04xxcRnmw2aTsQ78ldw9e4EP6czlb/nkPvitM5+KzRSNFiktX98eS28REDbl0ZVe2DoMa9WCa66ebMvwFONz54tdGq+4+1vZ4cT6Mz0qe8DBPYlPofJYG4BHAe3gM4emjDB4cN5AUiSyFeZQTdhpp8WzaQuA5YHU+6oJt9D2xVEVa/Z2xLpmUif9zudWCG/wdb0BwctOWaN0S3dtS8Uj2vAqmY/G9Y5rUmYr4AdIrhpCQO8J928v4DYLPaeRjsLmpIS0dgfQNOcG4SHBWehItzAEbCABgy3oA+7fZVjxwj9E7QpLygc4YT/E4Tl9WArjY4ZwLJvf0V9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7074.namprd11.prod.outlook.com (2603:10b6:510:20d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 19:06:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 19:06:42 +0000
Date: Tue, 26 Mar 2024 19:05:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 15/30] drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Message-ID: <ZgMcfJT5UCcTgMl8@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-16-matthew.brost@intel.com>
 <SA1PR11MB6991BD0E93816DCB264C00DA92362@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991BD0E93816DCB264C00DA92362@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7074:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPqaLG5uUMvBKNQMBp65EzYpX3ehH6MTx/FB5RZJiFsTg67xaSj12AJW568EPd61jE5Bz30yGr573ISxjJCKOO5CeA7vvg3l7UesBYeHgUQD4ieouQHwdeCHMEv/sE0R4z+6oNsX9qleDtNEYnukq/3YyZqvnZqqrPaK4Q3SFu+wn0GyKLkxMtis5iA/j8VXCTspFHdzBot7lkLPSQyW8KwZa8SSjy6MPZ72j8xQUi/mTzUGlOZ07SKr2fkekUGbnVH6Yqi6IQVBzpmL4qxRzwErU/YHxe7rzeryWx1YYWETTwBBggLnZbw5qnsaAQNIa/1zJGSBJHVwuR/lxQ98n5rChqEcXV1Tl9N+w5zBbnb0jL93beQHeq3HmhqIfhuV0BbOwQIB6bhf/IVkzYbJDWtFmqjDGGtbRrRwy/IhGZ8zmC2CGNrlFsHCPLUzxIjgvKft9n6wnmovQ05RnIglINC2GcsJMtXVtsA4QdYAcvRDU9fq7q4g4CPoBAkU+HtF5oi9WeZTMFWVhLqBBpiMBlHL6pfsoOJEO2iResbAl7B776xlKbR/2BHJo9YQi5kE+uLB2F0beS7/WWRDVV8XjaONUk+VapOMYTmTGVBP9r1C+YRNRd8sWMOqRMjDFHZ4xZpIydG3Wlek5Gngg+ETtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FAd4R4MmMtYvAa+hdH1WaJ/OKrukbCUfOO8ALARZ451X/UBLCMkdcznzREOi?=
 =?us-ascii?Q?0aKoq3JYMYX+Ssrgg8PTDZXeM6omHwlQj/Dy9yVoaVSWfxkEinknKjamg6aZ?=
 =?us-ascii?Q?ZKVCQH2S54c+V/Y08e4SGCR2A6zRcKXVXMz5d1RHYzSAiUcTor0OTWxQOyY4?=
 =?us-ascii?Q?9wehQ5I3aMflG0veOGElGHcl6vjTG0y5iej6W+Db3os5TIUyku67lxglwaTW?=
 =?us-ascii?Q?dg215PNZfVxwU1LKSgMExxhzMPp1xCtng+Ru/FDd8aYUxCted9pFS0KMQVOw?=
 =?us-ascii?Q?BenWAPIygvjQDFlZDeF37JFe4eAI5eJ4hO7P7qjLUBS5IXUngifJDxRU/S+h?=
 =?us-ascii?Q?lNvFKzlfcEqqs6MaDLyISLTgiXDt93bnnB67sTGehX+qpxS3k4/RMnNkSokP?=
 =?us-ascii?Q?DZMnEGgwf8RUsnS/oXu6WntSGmkru+cp/J6HtsDCwL4hxaxP0K1WywMMDcSz?=
 =?us-ascii?Q?UDFZtyAvFTjPOgu3WAt0brVD0RHP5JVnhOx2rKUnYDAPp6FSoyem7Equhqpc?=
 =?us-ascii?Q?xX1XXtwLGx3dcemtYW28jkbAx3COJFSmRHzzunbTeq8xuj4ZIGGo6u1SySkb?=
 =?us-ascii?Q?YuVQrwwHuQosP5yFOlUKt35Rhsqk1wIe3xlp/jxNdVnB71RNM37faeuRPIwJ?=
 =?us-ascii?Q?NY3H449Wc9+NmbNhd9Sy5ckGvtF2t6WfXMHmIvYcHZOxRv3B3F8KbEj+jIU6?=
 =?us-ascii?Q?7BpIeKl/YJ2iEIQsRNBR6OPB23BkmH8Tp5/6bi04jAuVtSAYDKROEAhbeurd?=
 =?us-ascii?Q?30/krTwKptvDLVaa5Yr99TZz91nahY9ui//5Meq57oo6H3BzS3vMYzW21kg4?=
 =?us-ascii?Q?a2u1/bBwdv4tMD+GHa0bMPnCRUEZmRCVT3e9B1QsBStf5WtZeHUnf65DSoQ/?=
 =?us-ascii?Q?vY9Du9KN0FeFYUjHdvtDG/zYhJFCAocLS/BvA/+n9q/Y3FBIL2gmuLzjZNeX?=
 =?us-ascii?Q?C4L1KKLEWBKvza/Yd8CXp6aIZNIp3IwCONLo9vQwFlxzVBVgO6Rm4MxcKUVr?=
 =?us-ascii?Q?vWCH0zx2ahx+trZZNeMAmuZg/X8tpBe1My+7/dtPvRcRvKIBUSjwT64PvHni?=
 =?us-ascii?Q?ULDNDfB/T9HaIL6N7BIxXEiADZkbM3yH/8CEdmkIpmdKtKP51oBKXi4bRf6M?=
 =?us-ascii?Q?vGSkBKOwPW3AkOh0R/ZW2lwgRCdel7XmgCrnAqSjLTzX7XulSv2i4viZd71e?=
 =?us-ascii?Q?OE08hzdckx87CfMtBZ8uTSkKcU8IYUblxasrb3tC3bx9IQliCdL+iwB3ZtI9?=
 =?us-ascii?Q?oWN+osWgY8YdrejRH+HpNOEln3UoCv33xjEH0+OqB0h4HKooeBEVN62NxbCm?=
 =?us-ascii?Q?dK2s8aFfP8gOCbA5eE6hxD1d5RbrBDZg9ZFSaC4oIIPl4xXaZ/h3eX23ePuy?=
 =?us-ascii?Q?VqiZD29cXWUjorPRKca3+f/wI7TrrxO7EQODud1WAUi9GkW0h0HsgbPKBkuB?=
 =?us-ascii?Q?5GNwBC2V1J0NaSrOYFGmloOMWDqM52kibFu+PTvGC/51bGXENX5YvCzwkz+9?=
 =?us-ascii?Q?7JnRMqrLpwxtJjxNR9WBKv93pQj0K9B1wdRPbs7yOdwhfR866NRo7s4z1heo?=
 =?us-ascii?Q?0nBIhTcfRtUMCUGvl8mW85wqGm8+1PwajSmd7+vWDWjGuCux61u9pjqL2Bm3?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c66edac-d63c-4530-e58b-08dc4dc7dfae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 19:06:42.8094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4oy0484oaJ9Z1bO/YQYDZUge4LkumYRpMm+x0JH16hfE2cevKZbLxOQg9rMce1K29nudTM9eXWVPuJnnYJ1+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7074
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

On Mon, Mar 25, 2024 at 03:58:10PM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 15/30] drm/xe: Add xe_vm_pgtable_update_op to
> > xe_vma_ops
> > 
> > Will help with the converstion to 1 job per VM bind IOCTL. Allocation
> > only implemented in this patch.
> 
> 
> Can you explain why you need to introduce pt_update_op? this patch seems only allocate some slot for pt_update_op but they are not really used for page table update. I will keep looking the rest of this series. 
> 
> I also don't get why this helps 1job/bind ioctl.
> 

Each VMA operations is converted into 0-3 PT per ops tile. i.e. a MAP VMA
operations with immediate clear generates 0 PT ops, a REMAP VMA with
both prev & next generates 3 PT ops. PT ops work on the internal / GPU
PT state compared to VMA ops which operate on the internal GPUVM state.

The flow roughly is:

generate VMA ops from IOCTL input
convert all VMA ops to PT ops, prep and stage PT ops
run PT ops as an atomic unit (1 job)
commit PT ops
commit VMA ops

If at any point a failure occurs before the commit step the PT ops can
be unwound.

Likewise when a failure occurs the VMA ops are unwound too, this is just
layer above the PT ops.

In the end if an errors at point in the IOCTL the original GPUVM and PT
state is restored. This compared to serial execution on tip where is an
error occurs we just kill the VM.

Does this make sense?

Matt

> 
> Oak
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt_types.h | 12 ++++++
> >  drivers/gpu/drm/xe/xe_vm.c       | 66 +++++++++++++++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++
> >  3 files changed, 81 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > b/drivers/gpu/drm/xe/xe_pt_types.h
> > index cee70cb0f014..2093150f461e 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > @@ -74,4 +74,16 @@ struct xe_vm_pgtable_update {
> >  	u32 flags;
> >  };
> > 
> > +/** struct xe_vm_pgtable_update_op - Page table update operation */
> > +struct xe_vm_pgtable_update_op {
> > +	/** @entries: entries to update for this operation */
> > +	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
> > +	/** @num_entries: number of entries for this update operation */
> > +	u32 num_entries;
> > +	/** @bind: is a bind */
> > +	bool bind;
> > +	/** @rebind: is a rebind */
> > +	bool rebind;
> > +};
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 5b93c71fc5e9..72e9bdab79d5 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1319,6 +1319,42 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops,
> > struct xe_vm *vm,
> >  	vops->num_syncs = num_syncs;
> >  }
> > 
> > +static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
> > +		if (!vops->pt_update_ops[i].num_ops)
> > +			continue;
> > +
> > +		vops->pt_update_ops[i].ops =
> > +			kmalloc_array(vops->pt_update_ops[i].num_ops,
> > +				      sizeof(*vops->pt_update_ops[i].ops),
> > +				      GFP_KERNEL);
> > +		if (!vops->pt_update_ops[i].ops)
> > +			return -ENOMEM;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void xe_vma_ops_fini(struct xe_vma_ops *vops)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> > +		kfree(vops->pt_update_ops[i].ops);
> > +}
> > +
> > +static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8
> > tile_mask)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> > +		if (BIT(i) & tile_mask)
> > +			++vops->pt_update_ops[i].num_ops;
> > +}
> > +
> >  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> >  {
> >  	struct drm_gem_object *vm_resv_obj;
> > @@ -1343,6 +1379,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> > u32 flags)
> >  	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0);
> >  	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
> >  	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
> > +	for (id = 0; id < XE_MAX_TILES_PER_DEVICE; ++id)
> > +		vm->dummy_ops.vops.pt_update_ops[id].num_ops = 1;
> > +	err = xe_vma_ops_alloc(&vm->dummy_ops.vops);
> > +	if (err)
> > +		goto err_free;
> > 
> >  	INIT_LIST_HEAD(&vm->rebind_list);
> > 
> > @@ -1468,12 +1509,14 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> > u32 flags)
> >  	return ERR_PTR(err);
> > 
> >  err_no_resv:
> > -	mutex_destroy(&vm->snap_mutex);
> > +	if (!(flags & XE_VM_FLAG_MIGRATION))
> > +		xe_device_mem_access_put(xe);
> >  	for_each_tile(tile, xe, id)
> >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> > +err_free:
> > +	mutex_destroy(&vm->snap_mutex);
> > +	xe_vma_ops_fini(&vm->dummy_ops.vops);
> >  	kfree(vm);
> > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > -		xe_device_mem_access_put(xe);
> >  	return ERR_PTR(err);
> >  }
> > 
> > @@ -1611,6 +1654,7 @@ static void vm_destroy_work_func(struct work_struct
> > *w)
> > 
> >  	trace_xe_vm_free(vm);
> >  	dma_fence_put(vm->rebind_fence);
> > +	xe_vma_ops_fini(&vm->dummy_ops.vops);
> >  	kfree(vm);
> >  }
> > 
> > @@ -2284,7 +2328,6 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct
> > xe_vma_op *op)
> >  	return err;
> >  }
> > 
> > -
> >  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> >  				   struct drm_gpuva_ops *ops,
> >  				   struct xe_sync_entry *syncs, u32 num_syncs,
> > @@ -2334,6 +2377,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm,
> > struct xe_exec_queue *q,
> >  				return PTR_ERR(vma);
> > 
> >  			op->map.vma = vma;
> > +			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
> > +				xe_vma_ops_incr_pt_update_ops(vops,
> > +							      op->tile_mask);
> >  			break;
> >  		}
> >  		case DRM_GPUVA_OP_REMAP:
> > @@ -2378,6 +2424,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm,
> > struct xe_exec_queue *q,
> >  					vm_dbg(&xe->drm, "REMAP:SKIP_PREV:
> > addr=0x%016llx, range=0x%016llx",
> >  					       (ULL)op->remap.start,
> >  					       (ULL)op->remap.range);
> > +				} else {
> > +					xe_vma_ops_incr_pt_update_ops(vops,
> > op->tile_mask);
> >  				}
> >  			}
> > 
> > @@ -2414,13 +2462,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> > *vm, struct xe_exec_queue *q,
> >  					vm_dbg(&xe->drm, "REMAP:SKIP_NEXT:
> > addr=0x%016llx, range=0x%016llx",
> >  					       (ULL)op->remap.start,
> >  					       (ULL)op->remap.range);
> > +				} else {
> > +					xe_vma_ops_incr_pt_update_ops(vops,
> > op->tile_mask);
> >  				}
> >  			}
> > +			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> >  			break;
> >  		}
> >  		case DRM_GPUVA_OP_UNMAP:
> >  		case DRM_GPUVA_OP_PREFETCH:
> > -			/* Nothing to do */
> > +			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> >  			break;
> >  		default:
> >  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > @@ -3243,11 +3294,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  		goto unwind_ops;
> >  	}
> > 
> > +	err = xe_vma_ops_alloc(&vops);
> > +	if (err)
> > +		goto unwind_ops;
> > +
> >  	err = vm_bind_ioctl_ops_execute(vm, &vops);
> > 
> >  unwind_ops:
> >  	if (err && err != -ENODATA)
> >  		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > +	xe_vma_ops_fini(&vops);
> >  	for (i = args->num_binds - 1; i >= 0; --i)
> >  		if (ops[i])
> >  			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index f6ea4df64e79..f5d740dcbba3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -22,6 +22,7 @@ struct xe_device;
> >  struct xe_sync_entry;
> >  struct xe_user_fence;
> >  struct xe_vm;
> > +struct xe_vm_pgtable_update_op;
> > 
> >  #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
> >  #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
> > @@ -219,6 +220,13 @@ struct xe_vma_ops {
> >  	struct xe_sync_entry *syncs;
> >  	/** @num_syncs: number of syncs */
> >  	u32 num_syncs;
> > +	/** @pt_update_ops: page table update operations */
> > +	struct {
> > +		/** @ops: operations */
> > +		struct xe_vm_pgtable_update_op *ops;
> > +		/** @num_ops: number of operations */
> > +		u32 num_ops;
> > +	} pt_update_ops[XE_MAX_TILES_PER_DEVICE];
> >  };
> > 
> >  struct xe_vm {
> > --
> > 2.34.1
> 
