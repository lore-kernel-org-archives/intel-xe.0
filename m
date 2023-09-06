Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE66EB8FDB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 14:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3D110E683;
	Wed,  6 Sep 2023 14:34:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9A610E683
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694010885; x=1725546885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y//U98zDWxyENbFxNfEKBb+avl9mBo1KJVa5Z3mbCYQ=;
 b=DSFvumm3DypAUqkKEe76/3gkauknLF2/YUMtssP8Qg+YdXToOOxEqgRc
 9wxwqFt2lvB2bIfVYF2YgbF4ybMdle2t38wdu/yoPs6I8ti3lGJ37s/vt
 yzCBr1dZfMNW4spTuc3XEyHqCk4+vZpUVynlubVtcU9E7xgAUSX0JM3i2
 nRLjXxSpk9ec6EHgbyadzdEWvmJ5PTCcdkHs8rUBsk5C9IqlJ7lTZ0N0E
 N/ttL7pJ6e52shGLAjwxZZFYIlzEa1cRj6Wtks1buegYXXjPeugAaOHbl
 NGo04ZPMy1ZHMojaxMfkslXWiRhjDtH03TSvUe63cf4sWQQ9B+Rc/ihoI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362112171"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="362112171"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 07:34:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="884732250"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="884732250"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 07:34:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 07:34:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 07:34:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 07:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjBkdDndrHjJL3LJNC2HuRqxUlOEyteQAq/hSb0vviiBKeqJ5EzyYeLIDL4lJ4UKf5ZO9dNwLOOAJChlf8B4FQdz/T5KXX9xxJ6+BjHLcGADLoxnOwAETkjlkaJjIkvcs0QB9aVrzJdyvJM9FunQiRQQOWDl9ImuRNxAoXbcEEz2KIBW7UpQ6AkJCVevWgLlTVZ3ZVeZMSsxAYw7PMDxP0yo0modLJZAzhmTgwUdzo2GqCwjmj2tkBePM+M0Nvhe/pd9RQDJ+J1Eemm2lghaPy49i3NJAaBJn1nIYjkfyeL00+iIyNPGlw02KrByEQPF1J/PMUtyLVlgkc8wcgRNqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kC8NAD3TRsmhZwvZYRfVId9WgVnfp0MXHAv+TFlKLM=;
 b=FNDVTM7sy5VbK1jLU3vQrTRSK3sEH+6NAF3VuwZBoEaemsae0tsn8xKwdDYBj3JNxu2WvWVnhS9q8P/j7qBauCKSjv1jezmcRUcnb+gE9tn7jwq1Dfy+vYI7OiP0wccxWIBWN25hCf9UU3IXfGUs0tWuB9cb//z2zLHDRHJV61BWTwucrBQameiEFPcb2zx6KFrJM+QxbVL87vnmizm86DyHIoDDUEalPxOjcZ2D1RGHsBRrek+Uqc79ZlLljiVwS6K+K27n0+v1ZhfFE/wBcakpM1x+ICdlLyNhWpfK+Z870kn+SZJFUK/1el14fA9oU7Gnr9N7XEPmIRwuQiqDZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 14:34:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 14:34:41 +0000
Date: Wed, 6 Sep 2023 10:34:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZPiN+6aGD6U5CNbf@intel.com>
References: <20230906134924.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230906134924.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcd8540-6965-4419-a457-08dbaee66636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TBfbkQvXkeWBvuzXxvwIHEcEscNnhNieQTwdMMqEJvcNsx08QM0kNZrETmGWfIrcfyc9p4w6FOl/t2k67LOCz60qYnwQTtkFXelY6HSl2+oj73jIZCRy6Oj/OiTrlKpp4QBNCSqreuWg7/7ZYDU+0KqX052zzRv5VUTml2QICx4ReMITubSrjJExeCJjjyshbfJS6L7o5GSq8CDartk4fQWae5amxe3/UTJ+rj3gLslG8qDVxzNiT7QHU6bz8xTGvzowWvpxk//UqMSv2S6pSsnFDZU1/SEKNHz97kVSc9v/iZUVLWUSoVCVOSdh7R/5/4/1G6HjQbG048wGRtt0/spQsZhKSlUYfv8OTm+B9eSiPZFJNsoHFZqMhQ1Di5e66f7PtLXXvithJiSdUSFetBzkt5Vogx4fpK7EsjJbUnC/GUPhx36LjlzreuhA/QSdN0BWmxv9GJFZcta5JBQiRFCbf+tPaUkI8Ky9uHGPNnoRtAwjp3YMO2B6Q19/dSsThjQAUj4qyNGy3VarVfjwkzP4jmP1/U5Sc//ijRA46ixZsNy2Pavx67ujKEYAFTNlj/bUvUYBzL/os4dbC+H+V1hviTP5Aq/0zM7tHAlRBw8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(1800799009)(186009)(451199024)(41300700001)(478600001)(86362001)(82960400001)(38100700002)(6666004)(2616005)(83380400001)(6512007)(26005)(6506007)(6486002)(66476007)(2906002)(36756003)(37006003)(6636002)(66946007)(66556008)(316002)(8936002)(5660300002)(4326008)(8676002)(6862004)(44832011)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GIwak65EHQcK8VVJpJ+OImucYWo9SmNQVJE+No+XUS9p5OCHIN2frBXpIs1w?=
 =?us-ascii?Q?GKFtSX+JAHqTfG95HQFTEJhKc3CZQaen5FZF0hN161gsP730WtY3SVovIJ63?=
 =?us-ascii?Q?tvTBoNq9u2bwbGvBfEAfYzEeFkfkTJvF6e82eYfCy6A3yZqw05GSJSgfxX1G?=
 =?us-ascii?Q?raKv6vnIoxIfVgHXAetWnj0RV4prN5IB3nlObJqs4J7gQMEF2CA9GJ1fCTei?=
 =?us-ascii?Q?GhAgXrJv1YIh0Qo6ZsFGA1ZlGE/sChbts+mnYiZZbSzewWVTg/3dIJJOjXIz?=
 =?us-ascii?Q?s/G/ZTxMequubC2fyAKVEU4n16M5jNB5jt0KZROdC91Wyd5rAguZrd1KlEhc?=
 =?us-ascii?Q?s/MNlRw2nolaZyVgxjWHCqZogd6irRByai0+lyTsWCzDapcgXEhpMFwIlhp+?=
 =?us-ascii?Q?AdSdEY2v1m57VWvUGyKlAoPmsTlbnDGxVXx+ic1SCg+7+Jn8l5IiJnsl6S7V?=
 =?us-ascii?Q?m/iKWGpYJZKsteKICQs5cPvfld3s24rZKgv4PTJWbxjhHo7jFJ398xGANrGd?=
 =?us-ascii?Q?h1bTLEHsBwaTXaXjzGHoI8NjTP/KWubreZ7AZpdDLztDa0Kvj4N9vwlifYQg?=
 =?us-ascii?Q?Y9ZDIyM9gLL++/KCS4ik7rT4zO+SyBzMCx+F3IUqbhO3HK/n9YR8B6ya5xtD?=
 =?us-ascii?Q?SmoL2jpzUlj7imKvOmS4T/rC++UFn93Uf9wCdXWTWFoXCAJtwUaLoWHtXBDB?=
 =?us-ascii?Q?azCU8UAnn7LRY6zV+bOmYuBIISiEOghyGD0ZWEuOkiimMWaTRta1Ks/gVCE/?=
 =?us-ascii?Q?11ff5tolTxpyuplbPT+RmX1539jRotrhbzAzKwpzrP7MBKbXfuMkh9QE7+3t?=
 =?us-ascii?Q?CixBmbNX9hwWILqIYVVAm4kTjRRqM/wF13qUGkUKN0lFmhaMTS5o9QyKECpk?=
 =?us-ascii?Q?dZcbWt/DPRBwwIMy2FlXkFwnyYvhL4b/o4M9J5QjYYhHdN8i2rEB2Yd3ZAkb?=
 =?us-ascii?Q?tq528SmXO20ukp4zerJyQDCKGapN4+xhFHbUI/UeFs2oseE0sN1RT6+uoPPz?=
 =?us-ascii?Q?nt0ONL7aSssZ5y9GvXJ8BcQ80n5t+/rKkle61tN2m8U/5oz6yzecB4ebNnlq?=
 =?us-ascii?Q?q3Z4MVDNB1rGlY+54xQPAsB7BF/agRy1Z0UTaK1+qDVXngw42Pr/NDzdFLiH?=
 =?us-ascii?Q?1GRj1e51CoTdfyihJ7afM2gsoWKgHvwYhwHjKmWZpVOiNlQLhhRzPpGEc9Pm?=
 =?us-ascii?Q?bkn+hZoiOmrvHJpZq6lUBHqCYd2LAo9K5+VoF+vR9EMLo8UCOWQmKvQEB2/Y?=
 =?us-ascii?Q?/8ITls2dVV65SNgPtBRV4UBiJF4gZm7BzllIDxFN8OzQHvdnnNqij/Rq45Bu?=
 =?us-ascii?Q?EvMLc98WUPzP7fRHAYHZzIRS+LUog68nilnar+iH0X9rA1KfYkgIQEmLY8//?=
 =?us-ascii?Q?ti0wZ+Xy+PUIHj+rqlBVcAhGucUacr67KsRm5SwNiGVrNQudvKj0ZskNniK6?=
 =?us-ascii?Q?jq4oN7x0E2VoqxXrw4g2PnaID0lwYhBk1idnuEXybgpxH8LKw5yiK4grCYtu?=
 =?us-ascii?Q?YQstQwEyqMwzmzzx/fREB7JPh3IfjnTxBRM9aNfm9DPbFkLzpLoZbnFVY6HA?=
 =?us-ascii?Q?ZNrrWu/bAnXoPNsHxsoEEqJ/bZJBrcRsQzzu8lFJyeECkxHf2SjbaPts/pw0?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcd8540-6965-4419-a457-08dbaee66636
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 14:34:40.9486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSZEyzDSiB3Z94jKuvfUK9NKau+ioVtiaKZ5cA9fWPswyb/AGZCC7E0HzwZcRtYPiB6KNG8msi6q1m2jNOzhvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Separate VM_BIND's operation
 and flag
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

On Wed, Sep 06, 2023 at 01:49:24PM +0000, Francois Dugast wrote:
> Use different members in the drm_xe_vm_bind_op for op and for flags as
> it is done in other structures.
> 
> Type is left to u32 to leave enough room for future operations and flags.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 29 ++++++++++++++++-------------
>  include/uapi/drm/xe_drm.h  |  6 ++++--
>  2 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1d9aa5c40659..d0e5974b5292 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2159,11 +2159,11 @@ static void vm_set_async_error(struct xe_vm *vm, int err)
>  }
>  
>  static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
> -				    u64 addr, u64 range, u32 op)
> +				    u64 addr, u64 range, u32 op, u32 flags)
>  {
>  	struct xe_device *xe = vm->xe;
>  	struct xe_vma *vma;
> -	bool async = !!(op & XE_VM_BIND_FLAG_ASYNC);
> +	bool async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
>  
>  	lockdep_assert_held(&vm->lock);
>  
> @@ -2264,7 +2264,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  static struct drm_gpuva_ops *
>  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> -			 u32 operation, u8 tile_mask, u32 region)
> +			 u32 operation, u32 flags, u8 tile_mask, u32 region)
>  {
>  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
>  	struct ww_acquire_ctx ww;
> @@ -2293,10 +2293,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  
>  			op->tile_mask = tile_mask;
>  			op->map.immediate =
> -				operation & XE_VM_BIND_FLAG_IMMEDIATE;
> +				flags & XE_VM_BIND_FLAG_IMMEDIATE;
>  			op->map.read_only =
> -				operation & XE_VM_BIND_FLAG_READONLY;
> -			op->map.is_null = operation & XE_VM_BIND_FLAG_NULL;
> +				flags & XE_VM_BIND_FLAG_READONLY;
> +			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
>  		}
>  		break;
>  	case XE_VM_BIND_OP_UNMAP:
> @@ -3116,15 +3116,16 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  		u64 range = (*bind_ops)[i].range;
>  		u64 addr = (*bind_ops)[i].addr;
>  		u32 op = (*bind_ops)[i].op;
> +		u32 flags = (*bind_ops)[i].flags;
>  		u32 obj = (*bind_ops)[i].obj;
>  		u64 obj_offset = (*bind_ops)[i].obj_offset;
>  		u32 region = (*bind_ops)[i].region;
> -		bool is_null = op & XE_VM_BIND_FLAG_NULL;
> +		bool is_null = flags & XE_VM_BIND_FLAG_NULL;
>  
>  		if (i == 0) {
> -			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
> +			*async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
>  		} else if (XE_IOCTL_DBG(xe, !*async) ||
> -			   XE_IOCTL_DBG(xe, !(op & XE_VM_BIND_FLAG_ASYNC)) ||
> +			   XE_IOCTL_DBG(xe, !(flags & XE_VM_BIND_FLAG_ASYNC)) ||
>  			   XE_IOCTL_DBG(xe, VM_BIND_OP(op) ==
>  					XE_VM_BIND_OP_RESTART)) {
>  			err = -EINVAL;
> @@ -3145,7 +3146,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  
>  		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
>  				 XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe, op & ~SUPPORTED_FLAGS) ||
> +		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
>  		    XE_IOCTL_DBG(xe, obj && is_null) ||
>  		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
>  		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
> @@ -3360,8 +3361,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u64 range = bind_ops[i].range;
>  		u64 addr = bind_ops[i].addr;
>  		u32 op = bind_ops[i].op;
> +		u32 flags = bind_ops[i].flags;
>  
> -		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
> +		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op, flags);
>  		if (err)
>  			goto free_syncs;
>  	}
> @@ -3370,13 +3372,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u64 range = bind_ops[i].range;
>  		u64 addr = bind_ops[i].addr;
>  		u32 op = bind_ops[i].op;
> +		u32 flags = bind_ops[i].flags;
>  		u64 obj_offset = bind_ops[i].obj_offset;
>  		u8 tile_mask = bind_ops[i].tile_mask;
>  		u32 region = bind_ops[i].region;
>  
>  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> -						  addr, range, op, tile_mask,
> -						  region);
> +						  addr, range, op, flags,
> +						  tile_mask, region);
>  		if (IS_ERR(ops[i])) {
>  			err = PTR_ERR(ops[i]);
>  			ops[i] = NULL;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 86f16d50e9cc..54123ee736b5 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -591,6 +591,8 @@ struct drm_xe_vm_bind_op {
>  #define XE_VM_BIND_OP_RESTART		0x3
>  #define XE_VM_BIND_OP_UNMAP_ALL		0x4
>  #define XE_VM_BIND_OP_PREFETCH		0x5
> +	/** @op: Bind operation to perform */
> +	__u32 op;
>  
>  #define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
>  	/*
> @@ -631,8 +633,8 @@ struct drm_xe_vm_bind_op {
>  	 * intended to implement VK sparse bindings.
>  	 */
>  #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
> -	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */

besides adding the flags, I believe it would be better if we stop shifting
the operation in the same patch.

> -	__u32 op;
> +	/** @flags: Bind flags */
> +	__u32 flags;
>  
>  	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
>  	__u32 region;
> -- 
> 2.34.1
> 
