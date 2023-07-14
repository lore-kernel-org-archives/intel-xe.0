Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE9BEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 03:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AE810E101;
	Fri, 14 Jul 2023 03:47:56 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3E310E101
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 03:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689306475; x=1720842475;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XpTcE6SPH1cqA1rB+Uf77NWzIAUcZcmF4FsmiUdlA6I=;
 b=BdAuRSzBlVHfynTBDLfjp6PZtDWupHCek631vgfpXoDdE70n45y9ghEG
 CyOnABVq0Z0DubCsU/MlUwsZiS9fZ15G4u1ygrMlqpNJh+vLT3fjX9RiS
 X+CUNJmbiqR6/Xbm50BKdxkuS40HVr2xWTiKumaUwjgzWYz95ynv10rkx
 zMPavvCuNzCOBAyVCAeHtRANsG0zO7SLOgARaP/Y0J0I1bBX91RvpMTuG
 1Ygm+2/VA2np+LEFDS1X98jD7YLc/23jmF3x6qIZrybitfz6Xqf8HHI52
 /iU0EvG7lqlUxnM7lo8UeJjKeOP+NMvayPtt19oCoxjdn23ij51qaqSD7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362847376"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="362847376"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 20:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="716183437"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="716183437"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 13 Jul 2023 20:47:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 20:47:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 20:47:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 20:47:47 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 20:47:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpF8t78F69EX1tfilNkos48XY7NSlPuAXjCvxlYEzyeNKlVuuU6BNxCHTw+Pf3p3DCR+CKdEZKUDsjRQyW92sngepVDWQInFHlDZ9x3ihHphA0nAoKu9S5lVPmvH0zZIgqfMeqwei7a9xzTkBNLSnznj/WMRUsfzhGNCc4WDoPzvlx/dAIw8XV74vl+IVypxJQqYnbc8fdY1OVVsUzTxyTFZVWR2hOHqDn1YWperXnxsftcqhZ1WhTk1MzITHM62jqjTLq+rVAlN36/Y0JcfnjNjmnAxESfJtSPET041dQR1h0WSOR9ipvNgkKpzUmC0LHnvUi32AZI/xj5luyed2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZ0X1wpW/ps5uVHK5dvVODGW+XJs6r8DxbPdUWDlHtA=;
 b=nhrSL5RJIZNmowL30/djM9OfJYhCTTaG06Bq6CxjQM3IXWaBWsGYAaSFky6Eot3GL4AiYEfCtvcubUIy5mUCyYPH6pjxyuPjinWee1/oV1exYmGF32tYlGwDAfb0EzktTAjroxecsBRXoL9vMG5/CNrt3lfCZ37+g9jg5dYEVLm+PPjfRI7CvBwkkjvvEppuvRbX3DUDeLunzmQvU3BGle4F5DwtjreZR7BqP41trrAZBniLJhbqTWtSaRNIdCKC1SIs04qzUYSK+7NdfG3wTiERqr1mveZTChqHNYom8+Z46oVts0iOkEaEVDWMFur6oe/AO3Oc+Fh6WP/3Si9akw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5448.namprd11.prod.outlook.com (2603:10b6:208:319::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 03:47:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 03:47:45 +0000
Date: Fri, 14 Jul 2023 03:46:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZLDFMC0cTNGmQMSC@DUT025-TGLU>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-4-matthew.brost@intel.com>
 <ZLBc22IiE8KZeysE@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZLBc22IiE8KZeysE@intel.com>
X-ClientProxiedBy: BY3PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5448:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4a3225-d031-4c2d-8d92-08db841d1548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SYvT++ISenEVX4wyKmVs5UQwN284FmTu3oIXxvjbFqE1GuQzCBHq/RZkSzgMhIQlXynEbvHXBtTuuNq8poloLmJLsGVB+FIfHcqJorJU8CSv7gjfIwd8A/MSr21bpcJmWZ5ZBBpBPotHkQnk7ShTY52vIV4I0UyNSsCafAjeB+seKudvymbBrBZoz320FoZh6lR8Da3HLBp0LEpxSSQ46akWZ3TDd2BZTTleXOgVClyVm5tehBF7baKPZqQcTHmkqRiIdp/bvBspKw5KZe4EJjlcA2ps6e2fgRXHM8sD2zl2/7fJzNwzSYfi++9n5PHR6K8cXqIzQeF4zb0Rv9bIczDcCKaAd6djRIlTeFfUCDkYAL8YrQ2Y0coZq4B6OKai3e2pUvNQrjz9S9kEXphVS8JmoX5Emiflg1gJHwChR8ib1m41jB2PPKGxIEFKNPsjxwZub17jSV6b2WUlD60q4n53KdJelxhEiD1mivwpc38Gux31GCIVARocL8SrqM6aebzrmxEPkTEOSASLRRdjEGIema9vOf4XPZ50LG/to8YN/9WZNtJ3zxJWt0KV/8Xl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(8936002)(6862004)(8676002)(316002)(5660300002)(44832011)(4326008)(66946007)(66556008)(41300700001)(6486002)(6666004)(478600001)(2906002)(6512007)(26005)(9686003)(6506007)(186003)(83380400001)(66476007)(6636002)(33716001)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gpvvAwnuA1KIkw/fz4icRKZYhWI065hG4baZ2Lp1XbxzxXr1JhnNrVlyuoVA?=
 =?us-ascii?Q?mAKm83UJaLBc7k4gXcqfsP/aPa6L7FWQwRw7DEGSc1eWBm3o7FSO6cx/uQbV?=
 =?us-ascii?Q?igajC4ncGDx/2mXsXIhXDUshYA0kvHh8n4xTCsL3hNytrxhIlQc08fcYENi/?=
 =?us-ascii?Q?7+ZPyqlcPKRWq7ohFBhv8OnTAglROy9RaZuOj18zJndx9psAoWRd7vocExEq?=
 =?us-ascii?Q?Yg41uvrP5DXnk4s+Pxya6jm8rVdjzyl5Cfu9SGkOWkfFpgyGm4/L6l8qQqi0?=
 =?us-ascii?Q?hBoBBY8kq/XEMy7UqbmMJPy3LmTncySTSd04TD8ll459jeRdKtjxt98ZcyPN?=
 =?us-ascii?Q?YYANgVaJR0IJkEOTxF1ejthaU/e09HuMk/8Cx8Y79wFzW4crii/6MzK0843b?=
 =?us-ascii?Q?PgbrnCT2iYY/hfBa0h97MMDBw7a20/SD3IlRzyNlXnGuVpDZxEkK75kHeSoO?=
 =?us-ascii?Q?0zhupciG8MXV0QXm9yMjk4Jgw9iRHtU00dBTyt7UduRsERUze1IwfnfsoKWB?=
 =?us-ascii?Q?IdXo7IAUOLOL/N+B0ah3MihK/pxRVswX1Vf8IqtLeFKTSG5wIzfsncvIRhbH?=
 =?us-ascii?Q?8diFRZIyewCJEzCNcRBciMcemVX+v+29heFSkzeFhFvvh6NdZO7wAKu3qxaV?=
 =?us-ascii?Q?pyDg+5J7hCMV1pPDxa/scOTIXcDHn3SDHriN7lyVafL2fcaUcrsGzaYNWf4T?=
 =?us-ascii?Q?ksu7Wvmd/5bGz28dLRJPtRDWB8L9d+P0EPuZoetUJUyxhQoiNfcuqZ5uAYS+?=
 =?us-ascii?Q?pRvPUjiyVHSlXno0KslwcjcwEXDYN3kR1yjzGFpQoLZgKOID2YWDS+pkagbT?=
 =?us-ascii?Q?XAqsunc7VZtuBsVlWqTxW7hRuS0dO4mnur47NZLH/CqzZAcpWdOSI4mwr58u?=
 =?us-ascii?Q?ukcbDtJja5f/MySi0GIEOuxkeF3YNGmtl+sYKTlxpjhXCKv5hahS1ovCMWzg?=
 =?us-ascii?Q?AIyEJ2MV4R7UihnboYsYg2klhB1NIJ7VTAU09p3zCM39oryB5ThF7ogJ07EZ?=
 =?us-ascii?Q?ost6iqa1O56JKKT4EE0ZBeL8ZTOzR4N8jsTVGQ3pBtq5vw5SbXqarxr38VnB?=
 =?us-ascii?Q?iJWA8rOsRIL+mi8uFdYJ6LfwpVYbnfzc1FGJBOwjCA5PKZyysiSxs6ZJ6snF?=
 =?us-ascii?Q?BmyJJjoyZZH81BMxKdfHfamS/ptw1v4kX024I1LE6F/6R+3/klA7NgFC+1CA?=
 =?us-ascii?Q?TeGys0XLc+EmSjYbxjhgNyVyegObRENATXx0Xkbt79lDqiYtbP619t7qmU+b?=
 =?us-ascii?Q?c6LEbcty4L9mAynyqG5bSSAge+D/Qo0Ks0JbTsI5OzedBkbwtm8rJHxsWr2w?=
 =?us-ascii?Q?zurlr3MkaIJjWge1roOdHJIl5eiWiDSZbx1QmhV00eYZjQjOGtcw7XHX2BXg?=
 =?us-ascii?Q?ZUQ7jby2COrrXWXMK4X5BSakDV5YOpsKSVrvuuFHMes99L0Z3byFqVw8Iwts?=
 =?us-ascii?Q?vA0Kz08kW7PRbnHk/KjKLM0p9XhZoxk98PzfGe7qie7AO3SWEGo5dZD8h8Wn?=
 =?us-ascii?Q?bUvcxtlbVuvlyqGOxrMaTqCDxeIGBKvFfwGqLsdCaEzEvI58y0S0rtVbFzJH?=
 =?us-ascii?Q?anQ9S64HnZtEyVnEooW9RN9nnYusfI/zo0umXKRJ705bVzuzf1xIM0mV29s/?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4a3225-d031-4c2d-8d92-08db841d1548
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 03:47:45.1204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4LstFXSWJySN4tVYd3+VbtMi6IgQDr32/Zg0KdZVQ/c/ht8a81n48/aFTyXRIWuHFHrWcy39oIvvXekqZ+s6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5448
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/5] drm/xe: Change tile masks from u64 to u8
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

On Thu, Jul 13, 2023 at 04:21:47PM -0400, Rodrigo Vivi wrote:
> On Tue, Jul 11, 2023 at 02:27:46PM -0700, Matthew Brost wrote:
> > This will save us a few bytes in the xe_vma structure.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c       |  8 ++++----
> >  drivers/gpu/drm/xe/xe_vm_types.h | 28 ++++++++++++++--------------
> >  2 files changed, 18 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index b2847be6de6a..762aefa75ed4 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -871,7 +871,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  				    u64 start, u64 end,
> >  				    bool read_only,
> >  				    bool is_null,
> > -				    u64 tile_mask)
> > +				    u8 tile_mask)
> >  {
> >  	struct xe_vma *vma;
> >  	struct xe_tile *tile;
> > @@ -2246,7 +2246,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
> >  static struct drm_gpuva_ops *
> >  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >  			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> > -			 u32 operation, u64 tile_mask, u32 region)
> > +			 u32 operation, u8 tile_mask, u32 region)
> >  {
> >  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
> >  	struct ww_acquire_ctx ww;
> > @@ -2343,7 +2343,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >  }
> >  
> >  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > -			      u64 tile_mask, bool read_only, bool is_null)
> > +			      u8 tile_mask, bool read_only, bool is_null)
> >  {
> >  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
> >  	struct xe_vma *vma;
> > @@ -3323,7 +3323,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		u64 addr = bind_ops[i].addr;
> >  		u32 op = bind_ops[i].op;
> >  		u64 obj_offset = bind_ops[i].obj_offset;
> > -		u64 tile_mask = bind_ops[i].tile_mask;
> > +		u8 tile_mask = bind_ops[i].tile_mask;
> >  		u32 region = bind_ops[i].region;
> >  
> >  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 84bf1620214c..2a8691a48c55 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -37,18 +37,6 @@ struct xe_vma {
> >  	/** @gpuva: Base GPUVA object */
> >  	struct drm_gpuva gpuva;
> >  
> > -	/** @tile_mask: Tile mask of where to create binding for this VMA */
> > -	u64 tile_mask;
> > -
> > -	/**
> > -	 * @tile_present: GT mask of binding are present for this VMA.
> > -	 * protected by vm->lock, vm->resv and for userptrs,
> > -	 * vm->userptr.notifier_lock for writing. Needs either for reading,
> > -	 * but if reading is done under the vm->lock only, it needs to be held
> > -	 * in write mode.
> > -	 */
> > -	u64 tile_present;
> > -
> >  	/** @combined_links: links into lists which are mutually exclusive */
> >  	union {
> >  		/** @userptr: link into VM repin list if userptr */
> > @@ -97,9 +85,21 @@ struct xe_vma {
> >  	/** @usm: unified shared memory state */
> >  	struct {
> >  		/** @tile_invalidated: VMA has been invalidated */
> > -		u64 tile_invalidated;
> > +		u8 tile_invalidated;
> >  	} usm;
> >  
> > +	/** @tile_mask: Tile mask of where to create binding for this VMA */
> > +	u8 tile_mask;
> > +
> > +	/**
> > +	 * @tile_present: GT mask of binding are present for this VMA.
> > +	 * protected by vm->lock, vm->resv and for userptrs,
> > +	 * vm->userptr.notifier_lock for writing. Needs either for reading,
> > +	 * but if reading is done under the vm->lock only, it needs to be held
> > +	 * in write mode.
> > +	 */
> > +	u8 tile_present;
> > +
> >  	struct {
> >  		struct list_head rebind_link;
> >  	} notifier;
> > @@ -386,7 +386,7 @@ struct xe_vma_op {
> >  	 */
> >  	struct async_op_fence *fence;
> >  	/** @tile_mask: gt mask for this operation */
> > -	u64 tile_mask;
> > +	u8 tile_mask;
> 
> I'm seeing us to use hweight_long on this tile_mask...
> 

Will change to hweight8.

Matt

> >  	/** @flags: operation flags */
> >  	enum xe_vma_op_flags flags;
> >  
> > -- 
> > 2.34.1
> > 
