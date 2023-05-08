Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9435C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 01:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7BA10E08F;
	Mon,  8 May 2023 01:22:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EBC10E08F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 01:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683508924; x=1715044924;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bx1RO6n+A9M2ted1YCgryxEb6XfsG8mjOtw60IbdTAw=;
 b=Vexrngbkp25pBrpXAOEZIf5/ZUeem3bJ+zNuYWri8jZlRAecF3HkqSft
 CG1OKW6IJRCFhhSWr7oHblY0INFFipvwAEMomBL1KNQ7tMikRn0c9/2Fi
 JDInB9+KXPBmXqYTzRd+7OC8AZNOB3r24AJ55fLq6edfmEjp0i4FRgvQL
 gIZOHOt0hJ+4IEW1ctWX3JMjGz6sYH5bvc5zHuXaMfynpjSmnin5D4bRN
 ATs7fCVyIDmSxdJxMNo1Rc2fElNrUn/C22hG0LtIykRLyP8bDCrxS3fnG
 +K7uQY5Axzk0/zfxK1QHY/+O7b8TX/dPBwvfUP33hkRsP2E5dK6ms0G7N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="435848342"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="435848342"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 18:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="822484706"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="822484706"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 07 May 2023 18:22:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:22:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 7 May 2023 18:22:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 7 May 2023 18:22:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzYLvEt17h5GHldYlb86EnPmldiYAcqwdlPbDqWHlIWF+9qhAJo+OWgT2Ta+uoOa46o+s0zCQej+M1xoy4ouZwRSomYXWR8/CdOC02/fvxXlC3/PPTBdv4h490VeuLNoXaX9gNXSb+67k+2OS7yaIkJzc9H1Om+dmeck8DRyhZPrvSkrPX6YagcJ5vemTVuduDTCNy3OnD4EIDaK8uswiaDGAouElH5GAkB8sd4Zq+w1d7KKwDOr5sfinMXzpsOO4CDrMIQqZP3gPwee2+pJqn48s6lTOA7K/uh9jwbSK9IR5VlZBrrgwafpci2v+YC4isDsdn+g966IQtx5KLumPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPpinQ4BLpzsW3tmbTfIn6IEt4V96e6eRZDOvoa37Jc=;
 b=DPIHixbMzsNRY5z9cWAsNJDny2ibDiFtid5WiqLyjqTp5BCk77buhBpuzqS30+Yk4A6oA1zGpFPUvbFDfiT1eM2p5BV8pACugJKGYcOh4zl4pWwR5WFO6nn9s4iCVRsZ+MyOrkW5pCzCL0sOixLC1cpf3944MKn6HrH1vqd4jfitd3levGT7DjMH2dl14uhm/k8/w+WBiIWP0gr90em2n9CF/4kNfVvKNRCxb4cEN9MVZj68IdyXiz25vJ9tEDBOa7qhFchPoYuGhZLtNUpA+OL+6x8JY6mCOK3358HkQonyecKI0YTYr35ZolYL4k8swhQcMqthFrdxWdfKcDZzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 01:21:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 01:21:54 +0000
Date: Mon, 8 May 2023 01:21:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <ZFhOllLfnhLWvBhr@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-21-matthew.brost@intel.com>
 <ZFVa3vSr93uMGhDi@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFVa3vSr93uMGhDi@rdvivi-mobl4>
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 912e839d-e5a3-4615-b24a-08db4f629ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yUSfWg1ChKzPGJkZfpIRQHX67VWwIolTd1LpSYqeRC+wOg9lro+M4+tCOvrIFlNX3yhLeM+CHuR/qCUPjENKnix6UJMy+0LAE4e+yrCtEmvV+26rEhrgZpxexIRmjHD+mXm3falXNYRuKic6C9i6SXBT7VbQWfyuYortNnLtVlm7ymz9DZIs3IWZ4bTgjCRPR3/kK9SCVaxSu8BUpMujbmpz1ND4UbrzchsiKHLXSSCsD7QM/eLitD62G33qrkQDL9qJTtkdmCjDfjpodByH/VjrjF5fN2In4b6HCgLrt+Q0Ocl+LfZspXOGj9tPPnsoVHk7bUn9nc4HPpe85gIET6gNJxPCrKwGXm88RR+LZ6AXkfs0MaoeEWj00DU26epm3+MLNJPVp9NVBurErsBRAjh+0ObfUGE4fvWN/a+t2TwSk0o+kU+ixjHZ0KsShW2rChFL0bHwm4OqVCuNyvWpiUWWERIFxd4aL5NW61/dNPMHeDU2jvDSiGurDraM9y5kh44PUxOZVyjeJTHebQ+QIxpiLLe0PFN3S/nw5T9g4mJT6r/ZtMkhrZjRAfYSxOYy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(86362001)(316002)(66946007)(66556008)(66476007)(6916009)(4326008)(6486002)(478600001)(6666004)(8676002)(8936002)(5660300002)(2906002)(44832011)(41300700001)(82960400001)(38100700002)(186003)(6512007)(6506007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P3J0FoUSnet0O7ouwAyfjOiCeDr/FcA7RzABfiPhb5PLtUITvDk7JqSN+tWZ?=
 =?us-ascii?Q?/tcX1HM0yYl6Be0XYvtmf+OpF9mezpTWnxE6ImAQZUBF9mefO4CgqAmdIBCP?=
 =?us-ascii?Q?tPuJ/iz8Bch7EyM9t0KHh/EFTXHntvTYisD4QqtwOFH3zMtIHdk7ZfiMrcma?=
 =?us-ascii?Q?7wyclweBbfa/xTzzIlYu57ZiqpHoKytyDcL/NS90g8MWal32XkPaaqMlV9bK?=
 =?us-ascii?Q?MU7Kezqzo+mHkO/k/0i7CLtVqLMafi5JhqYS9bXJdo9FOIZ/eXPRMMlWGlNj?=
 =?us-ascii?Q?yb7ddfpEPb9kUwjawTe4RFbex9P3qSN6H0ktXcv447RffP5wLpLo8MwRHrin?=
 =?us-ascii?Q?yaWIO+XCcugPiegT9K09pjHzWWHL+uyuS67AVmLedCyE97osrMWxrIMMhX44?=
 =?us-ascii?Q?eg8sm3qknoVEfoo6GxtLILEx4VwabtR8wnljmxMmSwbv2kXIo0UMv4n/L6Hn?=
 =?us-ascii?Q?39aP4b7IaHEFExy5X6pEALAmlZ56s1Ct5XF1IP9H9AjLjkS8LrOUdeWV913q?=
 =?us-ascii?Q?WdtBW53iB/0RMKVswPYb4i4Ux4sBIlKe+ITNPI2Yjky5/tKrLXSaLxaoLFNp?=
 =?us-ascii?Q?MVuC5Mg19J0iX2EfIfWWUc9gF3XkyuVy5iyQ2OFlNgspgcyp/TyFqkW2csI5?=
 =?us-ascii?Q?PQYRzSOi0M1D9N33fnt71+mQq64zDdOYqMmSrrJDrdw6usmmyI7jiG4nTV9E?=
 =?us-ascii?Q?lKPxGI5Py3yUUZwMVAWQaAd9rz0BfrzURCiq3WeApvPPwxoEiDN1/k93RES6?=
 =?us-ascii?Q?FPcvvFFy5jrgYnC/7EwwXMTAJ66Sg1AOpfidx6w7AZhwWAbxhjpcAVt6c+YS?=
 =?us-ascii?Q?jOYT3MAsnhDuPqANcnT29Sw0hJ1tfgbUw+esiESwswWwDB3RAgyaT35A0WBc?=
 =?us-ascii?Q?kr3VcJtjnvSrrdYN2w+3huTQYJv1aIqTfcaUluptQ29ripA5B0UWcixULcBT?=
 =?us-ascii?Q?qm7Tic8/K2sjEBpXgKUB6JHl8c2bs7VS1pXYNJKJFgj3TBBUJE1Wz1QoGzuh?=
 =?us-ascii?Q?rRjicZqIHtbi0k1hARVTRzK3hXMo8lWWW7qhd6S14Gm9haadTrTJgbThrKam?=
 =?us-ascii?Q?zI293gFUTdXX2g4zuWpW6xQof8B2VbIT3Dju9jpuAXV5K022/OiWnxSs8lnz?=
 =?us-ascii?Q?Dnv+mbq+RgRUJgYEaWcEhnoLQWoJ4wJTxcZzcj+l19fPu5Uke8hvmJLE7zfR?=
 =?us-ascii?Q?Lw6XoKV5nKLvluB/C0cuVMnh7SE9kPhz6C+oqDCi6cTm9/CdcgyoY4O9f93m?=
 =?us-ascii?Q?WuK/5YIx5gXZAJNqfXrYGreSTkk3J7+hzzOpdLcutlVB5wLk8KIWGwEpT1aZ?=
 =?us-ascii?Q?eCWqtNAZ1WTLEVDPoXqItSOqYcfMoPdnjCcCjcJNHVfnXnPtyZ9prPKXPfdV?=
 =?us-ascii?Q?k4DY8Air/UjDvD6jIZgKxxz0enqTKRp4lkwRqgeLBA2X3Fq58hDYcHKHiGWK?=
 =?us-ascii?Q?XHlPEmu+HCa5VnvGiqhaOQftYk0sUf16nRaPzPmXOY0VEztuWEL1ApL9yCay?=
 =?us-ascii?Q?jI5eLDulk/QwSK2ER5vkduTNjSji7l5XauAyGx0bd2HkCHqF/7eQlxDlL9Ry?=
 =?us-ascii?Q?dOdaLuIAe4sf11gtH91IxlEtmTTnAoF3V7NAt1Ri43VGXqMdKhlMKNmn+U9u?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 912e839d-e5a3-4615-b24a-08db4f629ba2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 01:21:54.1066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJILoOSyh3xTxj30AtIFiyY4WUDJJQaQZbBHGx68q0vLD8iWHhnsKa1oAu61ckgY0kHS2uN3L4Dz1oV15oUhQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 20/31] drm/xe: Optimize size of xe_vma
 allocation
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

On Fri, May 05, 2023 at 03:37:02PM -0400, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:16PM -0700, Matthew Brost wrote:
> > Reduce gt_mask to a u8 from a u64, only allocate userptr state if VMA is
> > a userptr, and union of destroy callback and worker.
> 
> too many different things in one patch. could you please split the patch?
> 

Yes, will do.

Matt

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c       | 14 +++--
> >  drivers/gpu/drm/xe/xe_vm_types.h | 88 +++++++++++++++++---------------
> >  2 files changed, 57 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index e5f2fffb2aec..e8d9939ee535 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -814,7 +814,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  				    u64 bo_offset_or_userptr,
> >  				    u64 start, u64 end,
> >  				    bool read_only, bool null,
> > -				    u64 gt_mask)
> > +				    u8 gt_mask)
> >  {
> >  	struct xe_vma *vma;
> >  	struct xe_gt *gt;
> > @@ -823,7 +823,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  	XE_BUG_ON(start >= end);
> >  	XE_BUG_ON(end >= vm->size);
> >  
> > -	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
> > +	if (!bo && !null)	/* userptr */
> > +		vma = kzalloc(sizeof(*vma), GFP_KERNEL);
> > +	else
> > +		vma = kzalloc(sizeof(*vma) - sizeof(struct xe_userptr),
> > +			      GFP_KERNEL);
> >  	if (!vma) {
> >  		vma = ERR_PTR(-ENOMEM);
> >  		return vma;
> > @@ -2149,7 +2153,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
> >  static struct drm_gpuva_ops *
> >  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >  			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> > -			 u32 operation, u64 gt_mask, u32 region)
> > +			 u32 operation, u8 gt_mask, u32 region)
> >  {
> >  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
> >  	struct ww_acquire_ctx ww;
> > @@ -2234,7 +2238,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >  }
> >  
> >  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > -			      u64 gt_mask, bool read_only, bool null)
> > +			      u8 gt_mask, bool read_only, bool null)
> >  {
> >  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
> >  	struct xe_vma *vma;
> > @@ -3217,8 +3221,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		u64 addr = bind_ops[i].addr;
> >  		u32 op = bind_ops[i].op;
> >  		u64 obj_offset = bind_ops[i].obj_offset;
> > -		u64 gt_mask = bind_ops[i].gt_mask;
> >  		u32 region = bind_ops[i].region;
> > +		u8 gt_mask = bind_ops[i].gt_mask;
> >  
> >  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> >  						  addr, range, op, gt_mask,
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 22def5483c12..df4797ec4d7f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -34,22 +34,34 @@ struct xe_vm;
> >  #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 7)
> >  #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 8)
> >  
> > +/** struct xe_userptr - User pointer */
> > +struct xe_userptr {
> > +	/**
> > +	 * @notifier: MMU notifier for user pointer (invalidation call back)
> > +	 */
> > +	struct mmu_interval_notifier notifier;
> > +	/** @sgt: storage for a scatter gather table */
> > +	struct sg_table sgt;
> > +	/** @sg: allocated scatter gather table */
> > +	struct sg_table *sg;
> > +	/** @notifier_seq: notifier sequence number */
> > +	unsigned long notifier_seq;
> > +	/**
> > +	 * @initial_bind: user pointer has been bound at least once.
> > +	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
> > +	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
> > +	 */
> > +	bool initial_bind;
> > +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> > +	u32 divisor;
> > +#endif
> > +};
> > +
> > +/** xe_vma - Virtual memory address */
> >  struct xe_vma {
> >  	/** @gpuva: Base GPUVA object */
> >  	struct drm_gpuva gpuva;
> >  
> > -	/** @gt_mask: GT mask of where to create binding for this VMA */
> > -	u64 gt_mask;
> > -
> > -	/**
> > -	 * @gt_present: GT mask of binding are present for this VMA.
> > -	 * protected by vm->lock, vm->resv and for userptrs,
> > -	 * vm->userptr.notifier_lock for writing. Needs either for reading,
> > -	 * but if reading is done under the vm->lock only, it needs to be held
> > -	 * in write mode.
> > -	 */
> > -	u64 gt_present;
> > -
> >  	union {
> >  		/** @userptr_link: link into VM repin list if userptr */
> >  		struct list_head userptr_link;
> > @@ -77,16 +89,29 @@ struct xe_vma {
> >  		} notifier;
> >  	};
> >  
> > -	/** @destroy_cb: callback to destroy VMA when unbind job is done */
> > -	struct dma_fence_cb destroy_cb;
> > +	union {
> > +		/** @destroy_cb: callback to destroy VMA when unbind job is done */
> > +		struct dma_fence_cb destroy_cb;
> > +		/** @destroy_work: worker to destroy this BO */
> > +		struct work_struct destroy_work;
> > +	};
> >  
> > -	/** @destroy_work: worker to destroy this BO */
> > -	struct work_struct destroy_work;
> > +	/** @gt_mask: GT mask of where to create binding for this VMA */
> > +	u8 gt_mask;
> > +
> > +	/**
> > +	 * @gt_present: GT mask of binding are present for this VMA.
> > +	 * protected by vm->lock, vm->resv and for userptrs,
> > +	 * vm->userptr.notifier_lock for writing. Needs either for reading,
> > +	 * but if reading is done under the vm->lock only, it needs to be held
> > +	 * in write mode.
> > +	 */
> > +	u8 gt_present;
> >  
> >  	/** @usm: unified shared memory state */
> >  	struct {
> >  		/** @gt_invalidated: VMA has been invalidated */
> > -		u64 gt_invalidated;
> > +		u8 gt_invalidated;
> >  	} usm;
> >  
> >  	struct {
> > @@ -97,28 +122,11 @@ struct xe_vma {
> >  		struct list_head link;
> >  	} extobj;
> >  
> > -	/** @userptr: user pointer state */
> > -	struct {
> > -		/**
> > -		 * @notifier: MMU notifier for user pointer (invalidation call back)
> > -		 */
> > -		struct mmu_interval_notifier notifier;
> > -		/** @sgt: storage for a scatter gather table */
> > -		struct sg_table sgt;
> > -		/** @sg: allocated scatter gather table */
> > -		struct sg_table *sg;
> > -		/** @notifier_seq: notifier sequence number */
> > -		unsigned long notifier_seq;
> > -		/**
> > -		 * @initial_bind: user pointer has been bound at least once.
> > -		 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
> > -		 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
> > -		 */
> > -		bool initial_bind;
> > -#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> > -		u32 divisor;
> > -#endif
> > -	} userptr;
> > +	/**
> > +	 * @userptr: user pointer state, only allocated for VMAs that are
> > +	 * user pointers
> > +	 */
> > +	struct xe_userptr userptr;
> >  };
> >  
> >  struct xe_device;
> > @@ -387,7 +395,7 @@ struct xe_vma_op {
> >  	 */
> >  	struct async_op_fence *fence;
> >  	/** @gt_mask: gt mask for this operation */
> > -	u64 gt_mask;
> > +	u8 gt_mask;
> >  	/** @flags: operation flags */
> >  	enum xe_vma_op_flags flags;
> >  
> > -- 
> > 2.34.1
> > 
