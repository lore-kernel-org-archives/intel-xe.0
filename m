Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C078C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 20:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A45110E78C;
	Thu, 13 Jul 2023 20:21:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB8510E080
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 20:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689279716; x=1720815716;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R1gqyhyug/TyinT8kKXNpZ63H1vGeFBY41/3DEgx36A=;
 b=ifw8S2oyAWRkiX3cJH4LzRm1s4BTAcd19ZwrincnQqWb2W+FqLZ9DE4M
 MzyCS/nkmDOJybiiOMHIqVwQO4MX26t1d412L9v9AHeBbzy5YYKNO/cey
 9gU+d+D+sqgFXRjBCgMwFdxV2oRRXoYM9ZozRYVOvrei5HwPaTqrNt5Hr
 mO+2mvV6efUpu+KydMJR9Wgudh8eTp5icOHagIKytxp7QwJvZDuPompNE
 ptO2EEzS5A8zYSo6HCaD6vmmAIXxA1hM2guDZXKyklcNLvnSmECDJVzf4
 TY/4TCt5uYqlKuPTbfQgxaNlD/I5wvslvnIX8C6V/LtqBQylUdFO0zUwE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364181559"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="364181559"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 13:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722125309"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="722125309"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 13 Jul 2023 13:21:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:21:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:21:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 13:21:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 13:21:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlXiqHR/ThcrkjyILUbSUoBZdegl9esHkyXzjIgw7EEXbOsx7Mgs073aqgLXyR99/TpYmvIAJYhbRmDvfExHv2t+8PaQIzH4mGcPuTgNUawSd+Uqb15XL8w1Vkr2kC+5b+dodujd839EMIuYAEHKatzTfWfwOIW1ovPPKZhw4cp9R1j/v50bw52w+qVnB4/8q3IQ5Mh5etAAE9WvOJCz0133f9jLsdi/YRnHELHwwS2NyzNEztUnLOT6EhbzUoPvstcKj6ZQyyBR7JKJWV2Fz5sIFlsfAR9OY3tYKnaalI6s0l/jWaayG+BAXMYbP4mzPidmNq6GYRLLcQNPf3ZpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Gm1IcEW2wPdeGqZDOeb8Mw9wbgydId2daQf0X7xnrc=;
 b=As9DtAE5NbG0RtMUW0q4xn5Lr8J1WbKkw38vrW8ghkgNwKnEdEQOQ7wPtthDUTpBLGCcQ7Xq5y9WxbJByMmsri7gzKwZlB3l/8tZaLFfiHAbOWB4xH8eEQPiUYj1fryqn4PMxRXxNUN+Um+6a5rtM/V/HQh/ZoR1/JSAKd9Ul9tYpEBZmGkq4V61K+G2R2l0xM7Go7bCOIRGQpWYGqAI+T6rbJytWsHv7UfVfLUOGo/xW8pn2GcpblX0tLG2FY7PkVpBJ3oUmwI+j0plRmgrTfqPt4boEniiWTK8aNwT1gqFW12hnvJaXs2x+GLgLgSnyllQBm8fOewXJHAeNejiJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Thu, 13 Jul
 2023 20:21:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Thu, 13 Jul 2023
 20:21:51 +0000
Date: Thu, 13 Jul 2023 16:21:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLBc22IiE8KZeysE@intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230711212748.2029455-4-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 9663a3ae-9c20-438d-f86a-08db83deca8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IV2qMXgSMtMCLRCj5aFbtO43YsCdnz/NwneTE1LVQgxE/q2xqNI7VHwrvWvid0OAKKfX1aZWX020Hc3U5gWGI7iGB3Qn1ZzujbO3xSqpA5+LLiYBIpPPgHp0P8KBJu+FtqIvbLYNoWuJZFpQ7dXVa/OhJOFOMkiwxfLrVOgS6filWrs7DpNnI7iLppcyX+QhPKoVaMWGWBw8ylbPNoum2lb5ARhq5MpoFhtrvNYSyQAEYsqcHZU5dXK26abCVeSQSBGLD9Ocu2Vn2z95SCTVPKdGtJ6jJTnd/HgpPa9FT+BoKd2fmUkbW7hljI885jxizwW5v8H107WBgOWku3NSScWhjZ3U0jmCLFh5c/7mwInIRw7N/uRdJ+v+okezgng0by/idM0jrNLxNytsbcZsZFwFdiJzwv4+6la8HKhGB+jcC1G5faYaUO8ygi+t833LfQH3gkHzgdWvXFAotbzRlDKNdLDR1G6GzRIxhSXE7/jgCCohZb50fjSRcFX6/jwd7T9YU57DBaN+lMOFQDQRTFEt0CRj3DAzsH3zdx5SqELTVP42ugdu/uzCYPZ5zGxA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199021)(478600001)(6666004)(6486002)(37006003)(6506007)(186003)(26005)(6512007)(2906002)(66476007)(66946007)(41300700001)(8936002)(316002)(5660300002)(44832011)(4326008)(6636002)(6862004)(66556008)(38100700002)(8676002)(82960400001)(86362001)(36756003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lUib7GUn0HU+Cz+ZSfAFXRBezz/O8/fQUbqdTsLuzJFBGtnTaPOci7C2C15X?=
 =?us-ascii?Q?n8IJKngi1uT/RPs7PDtR27KBznx6DBmdWq/mCBSVHu0f+oYpZFrHLNgqUQ7y?=
 =?us-ascii?Q?0ucHGTUNijLpWjS0B5gu+uk9X+YheEJAHyd7iW3Y2MNWUxZZmeNnzaihqHL+?=
 =?us-ascii?Q?WFZCbPcpb4RX7SHH8bRvh4mrkuVFIo5wXmdRJsARpcWH8cfRmXoFwJSvh+kh?=
 =?us-ascii?Q?x5si0CoxVvPsrIRmXLWK3qeKFN+eela0IJhrgcGmCnjDD7FaYYHS5G6FcSo2?=
 =?us-ascii?Q?cPMYWUW7ttAAuG8KTTWv/VHwlVbAboCzoaBOhOWEBqu6GDQlr7yQvHV+X6SH?=
 =?us-ascii?Q?WS085FlV4d5A4G2eoUNAi7GeyOKwQ4gsxutbY6pfm8HqkMLYYWrf9LPROqy7?=
 =?us-ascii?Q?rqlqx83ko8p633W9EwhNhcGcyYiZZAYQpOYgMuaWUBwv95qGQgoujvGS8ffY?=
 =?us-ascii?Q?s1dcoY44ixGxaRhHpI1nI6nkn8GC10tOL6KoMrlUgu8BPfv+Gl6FqC6fFEiZ?=
 =?us-ascii?Q?ZSnLLGgSgmri0jBQqkzFio3d0qEkUhhMWdydh/x+zGggHQ3Ks48sPRUfed2Z?=
 =?us-ascii?Q?Gcbv8txasKK5QUiGe1P8PUppyyqFidfqMCStLodCcMMMcky5FVTma8DbrMV0?=
 =?us-ascii?Q?UJcpJ+hy+TD6Nhv7/CmDavo2RPrMO3rfUkHoFoG11309ReWoiHlNFajbgmZM?=
 =?us-ascii?Q?u7xeMBV4rTfv2/vm5s3eeCKWvtzJZoxD+KOgs+3DNIpqi3HM3l+Bhs/Wgy3i?=
 =?us-ascii?Q?WX/FFeARLHyZShXwHtc3i5O1e4CuKSZ5T99pk5KN/3/t4ZWcgoYqGrRVFFkR?=
 =?us-ascii?Q?ILiO0za/GmLWN+KpS6eDT7/T1BgozZrgGP1kr/Q00PZ3ZP7MjtvyHHsHwoSS?=
 =?us-ascii?Q?ZhkV+c1vh8RpPZlHcE3oJsj5vABOz6vd+v3Bel03taxcXhgQw8yoZ1Ue1h6q?=
 =?us-ascii?Q?Zg/QKMEg1MxKGP+MENfPQCd0vwjIXXI5VoWPbEbrubfR0Wgf8odiI658XdiQ?=
 =?us-ascii?Q?7YPFzlQ++dsAAhwkWXmlAeyE/oMRzjYHkAUWMqzU43FnHgnnUIGv7qX4/8Hc?=
 =?us-ascii?Q?5wGviTrlIoRmTm8w980qGYI2PuAHepmZhpXMmQ/rVDAQlZ7av+hRl6817EBm?=
 =?us-ascii?Q?95KTSDia7KI74MKWGna4Snp2hO4aPqPhx3CrybDLdFMcEfXWFD1VV7IIEaNS?=
 =?us-ascii?Q?p7X6NYG5n8eiHRsuQniavPMYcQ8bc6HwuoLC+jlxOjbw9PD3EgBXogAmREk1?=
 =?us-ascii?Q?NDO6LRnWeCxaM9XKxiXITDgzVVCnI8YY8kIy8J9eTB66UKYe6ahypWGt2wSZ?=
 =?us-ascii?Q?gEaNv1VSxsAhDgvPpamvsTDVISTYCCKbhhWOQXUod9MmGPuSPAd7c5xiMU56?=
 =?us-ascii?Q?ccXEL69H0wi/kW2SjEchTKeziwDBcVZE4+x65x4XrQuKOg+sMfKl1u9T5jvr?=
 =?us-ascii?Q?qJ18sf5MeDDsB92vh9j0KJBIin0cPDue23294JY9a6hZHulm0+2t+atejgz/?=
 =?us-ascii?Q?KtVlOS47KTMitB5ArSJhyANAvJ0/fy+c3oDzRkGFKSTk7HLR4GfsX4icchBW?=
 =?us-ascii?Q?Q0Lc/Gat3cFQGk8nIanQd1yRXF7Lu2wthivXf9gF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9663a3ae-9c20-438d-f86a-08db83deca8e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 20:21:51.0749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0bK364ou3FLwxsFo02NPgOf7RXPsmYKa4SkA6eB212P48JU9ORjsV/v/6xYpYy52qCkwv8k5tzOR+9wz8ETxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
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

On Tue, Jul 11, 2023 at 02:27:46PM -0700, Matthew Brost wrote:
> This will save us a few bytes in the xe_vma structure.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       |  8 ++++----
>  drivers/gpu/drm/xe/xe_vm_types.h | 28 ++++++++++++++--------------
>  2 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b2847be6de6a..762aefa75ed4 100644
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
> @@ -2246,7 +2246,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  static struct drm_gpuva_ops *
>  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> -			 u32 operation, u64 tile_mask, u32 region)
> +			 u32 operation, u8 tile_mask, u32 region)
>  {
>  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
>  	struct ww_acquire_ctx ww;
> @@ -2343,7 +2343,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  }
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> -			      u64 tile_mask, bool read_only, bool is_null)
> +			      u8 tile_mask, bool read_only, bool is_null)
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>  	struct xe_vma *vma;
> @@ -3323,7 +3323,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u64 addr = bind_ops[i].addr;
>  		u32 op = bind_ops[i].op;
>  		u64 obj_offset = bind_ops[i].obj_offset;
> -		u64 tile_mask = bind_ops[i].tile_mask;
> +		u8 tile_mask = bind_ops[i].tile_mask;
>  		u32 region = bind_ops[i].region;
>  
>  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 84bf1620214c..2a8691a48c55 100644
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
>  		/** @userptr: link into VM repin list if userptr */
> @@ -97,9 +85,21 @@ struct xe_vma {
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
> @@ -386,7 +386,7 @@ struct xe_vma_op {
>  	 */
>  	struct async_op_fence *fence;
>  	/** @tile_mask: gt mask for this operation */
> -	u64 tile_mask;
> +	u8 tile_mask;

I'm seeing us to use hweight_long on this tile_mask...

>  	/** @flags: operation flags */
>  	enum xe_vma_op_flags flags;
>  
> -- 
> 2.34.1
> 
