Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B88EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 15:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B8D10E14C;
	Thu, 20 Jul 2023 15:49:02 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0070F10E14C
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 15:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689868141; x=1721404141;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dgZ3yvT6xoMjK2kxNi8KYjJVQh+IvnsL9645Mk02EiI=;
 b=KMgmIumuhw/C+BIPYIpaCCijutgU3B/M/tgsKPq4SoG/sdnjgXL8hpww
 uxJnstNA4fWHjPkLErNXX0mggH02zRChc8Vord+XaXXvpuJPDLYMdMqB0
 ErTmmEMZB3R5/hnckGu/D2e+0RWkCCArmKu4NkP4moRRBU9uHHlJ0himF
 n0VFzxyNv6Zw1XOiPVVmnwkM/hKDKGqGgQB5QcNyvmQiHuF/ZaFU5IrpZ
 fLBlQizlmBabsIfqPVif46QFs97PaSqikGxMEWZr3f24Bsw6BCDRMg8Sd
 EpHXC+69ysF9JmLYQZZcXDWlMOeanAZLrGGGjxozlylJZ+QsuKKRVzYHs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="432999619"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="432999619"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="971069710"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="971069710"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2023 08:49:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 08:48:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 08:48:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 08:48:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 08:48:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afNcCm0aExBgIYiY7h4JDtHwMByyST9OTTLNhxce1v90UFfg2ugUFyjSYwD0heONohaQ55uCz/siz/DFizGgJZRrN93wpXYDIiAYWquRT30Ts75eYFtWldzeYCX4lWOgdvo+UKoKqo21Lh+VNhSGAyqo/HikDl83UaXdA+0HOjtMfRZO/SWTGFT1RusI8pLr5hNxwsFzyEXrBwUn8np5uFAjzYIBl1ye1r2RAN4Ac9x+y+Z+a9blWmTsyg6xFiY8nnYrzqeaccTgFjRaJOQwFJlHEizcbsrJEbkGh28Xa9RkLwDDDxdSHRdj2uhWPDMJ0HjA0AgGG/H2K1wM5AeN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sp1Vl+4oqlWS9o1ykYofFJ/nPoHaaGZpDgNmua0MxRs=;
 b=O4hENdmyvHFrwa3An0CkLs+KXafAKeuhp7+kU1uQmXgdVb+dGIDW72nfmm8Lbx6b4YU3F66p1KMAGtBC6i+a2ZtZm9wDYLVXOsnfzdFl/DpRDl/ddoI/FI+BMcmELmJjpfi2CjcOy8dmuEOUAiEGAfrD6uDZwWcoD7ul5BBZ/p96tWaw6NEQl96AtsaG6bMPcVjZG273SRwHikYb26itFN0+bauH6nzNxmKU0mi/pL+YSoYXKrQIvUuCY50q7R+N9eNMA1uKgZHQZZZhQ9RqHiAr50cI0rP8WcQZA2uKaNbWwdozOM0mdDSQ64ffps2sm/ei+L1YHRJ2NKCFinV/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7810.namprd11.prod.outlook.com (2603:10b6:208:3f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Thu, 20 Jul
 2023 15:48:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 15:48:57 +0000
Date: Thu, 20 Jul 2023 11:48:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLlXZVHuI7M44k/a@intel.com>
References: <20230720041057.112903-1-matthew.brost@intel.com>
 <20230720041057.112903-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720041057.112903-5-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: bfeb646e-cfea-4d5b-33be-08db8938d3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVR5u3NasZoewyPeVpKhfkJ5Qe0I+PxIFEoeQrIWoJxB2QPpR6Xy1PATRHFCKMflBBU2URnTr3JetNF+niDVBewDhIoZP+StqTeTyUeqAwIQWawsHfbIevJ5Vx48awY1Aooqg7jMQ9jEvCZDq5QVDzroIqZp8asW26cazBhhWHCN/c5rFDYbiT7wku3+NTW1IZ5YX8/I1L3UYvHGuZpl6jEWBfUmXwpOJ+IfPO/xT3v+cgFg2svZRHNPCZdUa0K3Y+EdoC+tDYH0LSfq7ANrvLWWlQIJyczKAzwkeo0GIhBqt1Qaz300HgtfpesB3nj52+lhy8d62tEiwlJeFlOqGS4WWj2ZXFkPtDTXQMpaJnyuBoNhLRx2piB5RBgU81eJiwqlWKOA4QBpBB+Q6rQUkNq/6StN1WLgSqNTigsw7tf4e4PFamM7imia8DgR1qy/bb44uje93yj0w8NVeEBqOyC2Km1LVlChav3IXYzlPSaijTWwsG6O+TgWv+TZdWWTHxbHtsOMTiS15njlHaQspfAbaOhXRcPLRFyF4m5GII2RrRsZTSCYCyY2bYQiLz6d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199021)(82960400001)(6506007)(38100700002)(186003)(26005)(83380400001)(478600001)(37006003)(6486002)(8936002)(6512007)(41300700001)(8676002)(6862004)(66556008)(2906002)(66946007)(6636002)(4326008)(6666004)(36756003)(5660300002)(2616005)(316002)(44832011)(66476007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j9JD6UI5mJszxI9W6Gjhb/b7h/RY66XiTHAQCrpICk7eH9sYzYNI7LxjEaBZ?=
 =?us-ascii?Q?sQedY7UOZbgJVlUvjo0mhGd7DmhwmPsjzJURt825ya6S9/s7g2kWGwKSUfeW?=
 =?us-ascii?Q?oV4BFsG/mgP6bNPrmtjjdBB8sEuv7+as8JNmjTLQdjYlSCJLx39aLA7aS1tf?=
 =?us-ascii?Q?n8e8KROv8/jEZwRFnqv81/QuPhiHiREaxsPDw+92hGe04pUtkpGDH9IYWZGU?=
 =?us-ascii?Q?xLG/8mU4lzxt35qD9ulrliYJj8GzCFzhRX5rNlCNaqJcqShmU7EDwAdJ2NZj?=
 =?us-ascii?Q?6YESmEnjcL6NgZFjyFIINHppbNu+VTYqWvGFtY74fy9KdUxknZuS83NxQN+y?=
 =?us-ascii?Q?Qbm1sEcqzWklcKGV9VSXrScvPDrSG6p4fl2Q076GM661tMbJtf1J6kQRdgIk?=
 =?us-ascii?Q?LqdGArnR3hjCcCauhFV7X+cu5F47T5LxecGT+qZg3hWtlEuZXBmIkY3h3HUE?=
 =?us-ascii?Q?k664+fp0qcRpwt3elQLGEeobBpArfYoTHV+u7OujhguTmjpoqOSAMYb0Ffbm?=
 =?us-ascii?Q?LY69ssDIc6J9pD1cm/UGrZNruq5/Jby+lezyH3+V3gcNnz1UzaZy9n9urBNZ?=
 =?us-ascii?Q?x8D08RHrC41nkxXBPG+mPRaQnEIOyRGiO88gbDSaEZsLLgo5LiuDrueGM4em?=
 =?us-ascii?Q?lTOduErnNlsjE3Qgxjh47sQjATqlvq1cKhYRkHo1+xiiqhQie9ppN9iE0DBR?=
 =?us-ascii?Q?mB/LlpjXF6hxvK2QGanlffOi8IOCWiRZwtOSloVquPrWrFfVBZ9B8tiHiuxz?=
 =?us-ascii?Q?fTiMchrQKc6OFx3/k4ler7jCSdGVeaPupQl+G1As2jQ6IneEF1DdqhHF/UJb?=
 =?us-ascii?Q?HrXibJ1bNoVBtgHZRKAikou+MMVfsC1ogyg4aoYzTP2/JpuRuMHD9quR5a5A?=
 =?us-ascii?Q?c6MpMJRzWAkhK8+y552919fWjf8YuvKHkQwTM2vXEALBL/1HjNTg5uJDlU8L?=
 =?us-ascii?Q?NiqLwkj4HYia/l1FfRCwiY+fCn3pv5PetGlNDdWBE2Q1ZXNO/ccw29yWL3gA?=
 =?us-ascii?Q?v6ea4ViBNCAHx6wKxI1gU1MxNP17vsJgeXGFhQVfawAPZUOzoS6IEynoqOym?=
 =?us-ascii?Q?A5a6t1l7vDZ5mcdFkgZFvZpfowvwMlIxvYeuHHcJTQf08hGzm0S4wEpSpx6Z?=
 =?us-ascii?Q?/SrDInacsW2jUOo+6q0DGugHcq/rZvdMx1mOxyiUoLEw/9kSFYcWK6rurWm9?=
 =?us-ascii?Q?8/i5rrsmtJ9j3yMH9XZFXBe9oNzJ1vS3qn0jizooqn7mTOCBlbp3UGjt4Qd7?=
 =?us-ascii?Q?Qt9p/hUc3OdpcYs1fZ98SK1Ao/4eXVU9arQiwQ1jKZ9Fxyvf430Yg1Yo3Nnq?=
 =?us-ascii?Q?9cygnYrJrlTG8QDP+7n9ap16KV1Jyp5DeSzAKrUAtiM/nPT/izOscc1HR7TK?=
 =?us-ascii?Q?1JSV1i+HC1iaweUOsjIeY3NB9nYep2F4iTp5iRjS2vO9BMST8n2HlPdqn5z4?=
 =?us-ascii?Q?AR93pK9ZRtancSBc9Kvr5x/rd1ssqpJ37aVgyJg/z2/QUsNNhQQwfYVwb1Eb?=
 =?us-ascii?Q?EM56/dTodZ5HBfWnvc5qej3OUzWkychW+e7kVoIl0wqOn7KcHwEisrc4sJW8?=
 =?us-ascii?Q?OjIXsg/01qkgGqV3AERRI+XE2FNeUMhgkQek3Rxp6bsEAOi7vCmrL2oxr3B5?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfeb646e-cfea-4d5b-33be-08db8938d3e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 15:48:57.3063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8v2EYG8S5lhn9m8mvRNPfP+tJPAGKW02nn4AF2dJArqppYpuiagfFIgwSECYdzvq0OYHCz4m2+ELz8JAcyfPLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7810
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/6] drm/xe: Change tile masks from u64 to
 u8
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

On Wed, Jul 19, 2023 at 09:10:55PM -0700, Matthew Brost wrote:
> This will save us a few bytes in the xe_vma structure.
> 
> v2: Use hweight8 rather than hweight_long (Rodrigo)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 12 ++++++------
>  drivers/gpu/drm/xe/xe_vm_types.h | 28 ++++++++++++++--------------
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1ed3bc2541f2..92d97d347a44 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -871,7 +871,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    u64 start, u64 end,
>  				    bool read_only,
>  				    bool is_null,
> -				    u64 tile_mask)
> +				    u8 tile_mask)
>  {
>  	struct xe_vma *vma;
>  	struct xe_tile *tile;
> @@ -1574,7 +1574,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
>  	struct dma_fence_array *cf = NULL;
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	int cur_fence = 0, i;
> -	int number_tiles = hweight_long(vma->tile_present);
> +	int number_tiles = hweight8(vma->tile_present);
>  	int err;
>  	u8 id;
>  
> @@ -1649,7 +1649,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
>  	struct dma_fence_array *cf = NULL;
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	int cur_fence = 0, i;
> -	int number_tiles = hweight_long(vma->tile_mask);
> +	int number_tiles = hweight8(vma->tile_mask);
>  	int err;
>  	u8 id;
>  
> @@ -2245,7 +2245,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  static struct drm_gpuva_ops *
>  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> -			 u32 operation, u64 tile_mask, u32 region)
> +			 u32 operation, u8 tile_mask, u32 region)
>  {
>  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
>  	struct ww_acquire_ctx ww;
> @@ -2342,7 +2342,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  }
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> -			      u64 tile_mask, bool read_only, bool is_null)
> +			      u8 tile_mask, bool read_only, bool is_null)
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>  	struct xe_vma *vma;
> @@ -3327,7 +3327,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u64 addr = bind_ops[i].addr;
>  		u32 op = bind_ops[i].op;
>  		u64 obj_offset = bind_ops[i].obj_offset;
> -		u64 tile_mask = bind_ops[i].tile_mask;
> +		u8 tile_mask = bind_ops[i].tile_mask;
>  		u32 region = bind_ops[i].region;
>  
>  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index f1f3b619d996..268d2475f2ae 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -37,18 +37,6 @@ struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
>  	struct drm_gpuva gpuva;
>  
> -	/** @tile_mask: Tile mask of where to create binding for this VMA */
> -	u64 tile_mask;
> -
> -	/**
> -	 * @tile_present: GT mask of binding are present for this VMA.
> -	 * protected by vm->lock, vm->resv and for userptrs,
> -	 * vm->userptr.notifier_lock for writing. Needs either for reading,
> -	 * but if reading is done under the vm->lock only, it needs to be held
> -	 * in write mode.
> -	 */
> -	u64 tile_present;
> -
>  	/** @combined_links: links into lists which are mutually exclusive */
>  	union {
>  		/**
> @@ -106,9 +94,21 @@ struct xe_vma {
>  	/** @usm: unified shared memory state */
>  	struct {
>  		/** @tile_invalidated: VMA has been invalidated */
> -		u64 tile_invalidated;
> +		u8 tile_invalidated;
>  	} usm;
>  
> +	/** @tile_mask: Tile mask of where to create binding for this VMA */
> +	u8 tile_mask;
> +
> +	/**
> +	 * @tile_present: GT mask of binding are present for this VMA.
> +	 * protected by vm->lock, vm->resv and for userptrs,
> +	 * vm->userptr.notifier_lock for writing. Needs either for reading,
> +	 * but if reading is done under the vm->lock only, it needs to be held
> +	 * in write mode.
> +	 */
> +	u8 tile_present;
> +
>  	struct {
>  		struct list_head rebind_link;
>  	} notifier;
> @@ -395,7 +395,7 @@ struct xe_vma_op {
>  	 */
>  	struct async_op_fence *fence;
>  	/** @tile_mask: gt mask for this operation */
> -	u64 tile_mask;
> +	u8 tile_mask;
>  	/** @flags: operation flags */
>  	enum xe_vma_op_flags flags;
>  
> -- 
> 2.34.1
> 
