Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFF3CE79A9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 20:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1849410E28D;
	Tue, 19 Sep 2023 20:41:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E524D10E28D
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 20:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695156081; x=1726692081;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3ImqGwEPlXYxPI43yNldDZNqt+OxZGSSJ1f2x8BYV58=;
 b=SdptQpibjGsOjyQC49RHIHMvUDdLjdUn2uWJLbUxDgrvAjEE8Kdf17Ib
 trVzk+bujKQ44DqCZpQVh/BtglxkobeJNVnfEeWV948oKTdEumPh4QI9j
 wlxVAj0sbCEtjfkX2yYmwwZ71OzP8Wazshn193fl9C3I6sSfTIMTJB3Sd
 MPKmmtNz1juVucnBe+jq6QsMRSf4iA1SfYJVGAWNc9JNPuUO0wGgwsree
 6gMaaY0po+RinEJAQAofgoVJTgkmwSnWprapNP8UhX3AhHoJK+MobdfiL
 T1noVv3doYvjG/yO+8HMnP0DEfbpAncb8IZ+WVcOwC99tujdjg30c2+3e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410978052"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410978052"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 13:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="746364392"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="746364392"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 13:41:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 13:41:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 13:41:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 13:41:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 13:41:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeNvCB9/tZZzTTdJmDNGp6HoUAaPwx6V1vgrDNOtHOCzPdEpuwODhf4hibhiO5dWJsXeTYyW40Bb4KQQQUvQisYX6jAi13S3p87bs0XsBorWu4WpEnCp3uht53Ck//4GWkaOMaaK3UYWqCRG9qmZLynkmFFTu2AYX276Y7V4VoNxi0hIIMArx1GBjevjb55vYnkEz+Bo9obr+o+RVr2FP3SLhqZa9RMFuOC6C3h1CzSHrXilvorx1vTeSfJs5XRNytGkn29QbQF9dAvs7wfGdrCNodHlYzOxDEtAHYX4YIawYxLf9tsF1PS/vJzV9miNDHTuX7anHid8mmk4DgbYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fveVY2f21NIsaB3LRRxhIblTdJ0kNecvqyIziKdUFb0=;
 b=UGac1EXFD+VqVNk9lYoh86Ary1Y9cU2IUOAdcONygJA9hXSZX1d09yv8Ro4IUU84r3p6R0Y5vmUn7o8N2BijFPzbIQeY0z3AsvA6+Vqq/0iZUNbStilI8XvFtw19XQVmeElIpCu0QRjRwx3wC4SIGjdTCa+LJQvGyLChP66t14axy4Qfrt6sIirUoOFIUIcM/+aATduMMl/dler8PC521Vh/m0lXzJ3imucy+toBLjK/L5RMUy+Yll5FA7+CY5ktiz+CFmjTyR6pmwlWbrerimA93wFMZTsTUJDO5AvHzYWot97iHjGAct49kR8TzUInazbCqaQrGVWbJJOJJgCtnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 20:40:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 20:40:56 +0000
Date: Tue, 19 Sep 2023 20:39:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQoHFKaBYRYXh1rf@DUT025-TGLU.fm.intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
 <20230919142504.91652-5-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919142504.91652-5-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 2285e694-dfc3-43d9-3c25-08dbb950b94d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f2LlckG7C2hK3X4c/a6705WM9tW8l1S2IO1O4AKDm0kRCrPVfOLibkzyzenlhtsSAlzkk+gYphSkEgiI1hLlEsWIOcY0woCLX5S4IiAvrQx1ru0ppROvQwKiKe/Np/2gH1k98lkR3rzrqxFqBGGGH0aM8MdWOfgXMZuDRRj601tltnEj9UHa/n0Yl0PYM7ERO8+JOt+anEAqZhU7tE2QkDci/3W6v35OFwzpU1oYSH9eiVOsrVVkga8HflOaQx8d36dc7urgIuLRvBWAiawWhuH8GCM2YqjMXXvRqzHgnn7rxfX4ukps6j1LUjpeHG8o5hps4130JJS8Tw8hF4X5poF7UwfB+cNpnqg6pI9RDZ+mgypnwB8bOrDrtFgrFUxlK8Ry4P/k/S0KT+MgQNjVHpdcCmNDsLiGp2bILY5ADCPvjsAZdNJn/qGI1Ahpp6dxsudpALDThbRcUyplrRuu2BAShKcZdj8lGiW0YvxCMSITcUtQOblN2lalzOusiUsuc0kK4GU564p2OaI9iGmatbNN4+Dogc9zCGXOhiTKhBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(186009)(451199024)(1800799009)(316002)(66556008)(6636002)(66476007)(66946007)(478600001)(966005)(38100700002)(2906002)(8676002)(4326008)(8936002)(6862004)(41300700001)(44832011)(5660300002)(83380400001)(86362001)(6512007)(82960400001)(6666004)(6486002)(6506007)(107886003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S5a6e/qNFZUtVlKquNUOe8A1PyRozr6ANXYk10JPbJdd5lR4YQhrFQTFoe6B?=
 =?us-ascii?Q?ZPFUQFfuqjn6iagFrQhjXpKc+vYAxGQJnEJNgXx2I9RdwnrFOu18NJE8VHmY?=
 =?us-ascii?Q?l7UQq5SFBbsm77e+xzxH31hadhKO6GID18eBFjPstmedK0NgjUTUsD+2/A/z?=
 =?us-ascii?Q?qgGuL2EnKi6ITrFF0MnUxg/42r6t9o5ljAq2bAgPkFdyjE/xM7JBdTtrCk8R?=
 =?us-ascii?Q?wo8fQX0wor1V7eZ/FjhnJXkSwYfQZIzlddDD9R7W9GseJfGqevophssz9daP?=
 =?us-ascii?Q?z3VlXq8JCytQSQPf+rGXn00SbyT8hMltbCS5VSEEVUqldXTsa065mxIg/Bu9?=
 =?us-ascii?Q?KEadIxqGYh0c3rm5pDXcoRJaqsi4YVQmKPKe17QxtJbaFnhQx9X6wqTtpjLr?=
 =?us-ascii?Q?9/5LdwKBnbW9/+F246BIdgDBnAkTPWGBaMLJ2fhgGeTZfUsAkrC+uZudXh/P?=
 =?us-ascii?Q?OxrYYCBXpo4ly1VBVIxc+Hnp33UPpUZ4k3Qowpuain0d+6W1bytOgmQvGg5V?=
 =?us-ascii?Q?/2E2DGe/9S4aop7XQerhoL3C34LFBml2i4OrE7U9axx41K8r2EvNqbYDlGbN?=
 =?us-ascii?Q?+vg642s2W3jPCVm8N35DAwE7aLYRy+j8FVJM5CzU3R6B3owUVZDelbjqflWN?=
 =?us-ascii?Q?rY27stowpA9nlK2KCOqrTJ36ADcmIvnP7kSiX5S4OWO2W5lZPUUC+bERnA13?=
 =?us-ascii?Q?kR7xv2V/kbk6ixO8lzlCYSJgjSOpXKVCRoiKpOMT8DLKYxYE2tnTXcEDu+zH?=
 =?us-ascii?Q?7bctR2495kMqBTFqZjgH7eh50XStYjWznfPZf8Io8H++AmAKxyyaCDCJin+a?=
 =?us-ascii?Q?siLoMdCN4TKs7Llv1BE0SckmwucLqaVMU1nTZYFyqpRlbSXklslxrMWRcjur?=
 =?us-ascii?Q?H6+6M/9HnfNMt9/d1zVTKvqPACBAMhEDWcDj8oWwTO9dHCZbZTggy+RkPWMf?=
 =?us-ascii?Q?alnEdiyrziVlPbcuYcx9omgqRdS/et282+xPZ6RVswM0wh9FRGy4fU/vOmsv?=
 =?us-ascii?Q?ZuPnEMKcBIhKqnpeWrWOcHcvX/01Ibb9BIUhledKhEwIrjwEBD4rzx7jou6y?=
 =?us-ascii?Q?913tVu3CYL1a5JCp9GuI50KK3eyuYfBxIDw4k5dno6SN1o6olyH1QKqFHR0F?=
 =?us-ascii?Q?06QQa2IiEF+kBCZjEJ0D+Ub402is57FWqCT23Leuz/lF4ib8JSNUgw3cUCXI?=
 =?us-ascii?Q?nkUD5hOKx13lFjFBZsPOLUHZ7HmfixTEfKZkEtThmXFTy4UCUvxwqTH9ZxAq?=
 =?us-ascii?Q?S9esJoHTLlLMAvBI6UM/jzhauiqu8dsM31F+n9i9Gqsod+l4kb+jq6nPDBMr?=
 =?us-ascii?Q?3l9ZgcpKZY78OWx+Z18cvOwFDBEDb9e5nJM4sIlbt1Ckgp7jI4sWZi9tm3ZI?=
 =?us-ascii?Q?yELB+h89gIEtNDwsAmdgzW6EDl1RlNFd1/DM6/MenPGnqZKmXB5ffjvMChUv?=
 =?us-ascii?Q?hD8afQEQZJ3uPR2y9Cwzz0TE6J2R3DKl6CleD8iYS+F9kwwv0T9weTTtbf3d?=
 =?us-ascii?Q?YWiiPWyzv4XB7RAuP/ud2pJYjcsCzmlnCpqOkQzNS91b4vB16snBpPSG0iOX?=
 =?us-ascii?Q?DysaAjOxuAm2KDoT2gG1UstXw/Ejd9xlo6zI/iwHNyLXBRY9bHhkWuKp8nDY?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2285e694-dfc3-43d9-3c25-08dbb950b94d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 20:40:56.2331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+6bYfpEi3RabBY/SltV3vA1yrtGv+VjbijnUTeDUX6KIV+SaUe9sqECWmsCha/bwvECy4T/orzsfxehCPxPKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/17] drm/xe/uapi: Separate VM_BIND's
 operation and flag
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com, carl.zhang@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 10:24:51AM -0400, Rodrigo Vivi wrote:
> From: Francois Dugast <francois.dugast@intel.com>
> 
> Use different members in the drm_xe_vm_bind_op for op and for flags as
> it is done in other structures.
> 
> Type is left to u32 to leave enough room for future operations and flags.
> 
> v2: Remove the XE_VM_BIND_* flags shift (Rodrigo Vivi)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/303
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

This patch LGTM but noticed in xe_drm.h we probably should do this:

s/define XE_/define DRM_XE_/

As I said this patch is fine though, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 29 ++++++++++++++++-------------
>  include/uapi/drm/xe_drm.h  | 14 ++++++++------
>  2 files changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2b225c0692a6..7579c9537bfa 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2152,11 +2152,11 @@ static void vm_set_async_error(struct xe_vm *vm, int err)
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
> @@ -2257,7 +2257,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  static struct drm_gpuva_ops *
>  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> -			 u32 operation, u8 tile_mask, u32 region)
> +			 u32 operation, u32 flags, u8 tile_mask, u32 region)
>  {
>  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
>  	struct drm_gpuva_ops *ops;
> @@ -2285,10 +2285,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
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
> @@ -3100,15 +3100,16 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
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
> @@ -3129,7 +3130,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  
>  		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
>  				 XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe, op & ~SUPPORTED_FLAGS) ||
> +		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
>  		    XE_IOCTL_DBG(xe, obj && is_null) ||
>  		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
>  		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
> @@ -3344,8 +3345,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
> @@ -3354,13 +3356,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
> index 3e249f197d90..59e9f2f87074 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -663,8 +663,10 @@ struct drm_xe_vm_bind_op {
>  #define XE_VM_BIND_OP_RESTART		0x3
>  #define XE_VM_BIND_OP_UNMAP_ALL		0x4
>  #define XE_VM_BIND_OP_PREFETCH		0x5
> +	/** @op: Bind operation to perform */
> +	__u32 op;
>  
> -#define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
> +#define XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
>  	/*
>  	 * A bind ops completions are always async, hence the support for out
>  	 * sync. This flag indicates the allocation of the memory for new page
> @@ -689,12 +691,12 @@ struct drm_xe_vm_bind_op {
>  	 * configured in the VM and must be set if the VM is configured with
>  	 * DRM_XE_VM_CREATE_ASYNC_BIND_OPS and not in an error state.
>  	 */
> -#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
> +#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 1)
>  	/*
>  	 * Valid on a faulting VM only, do the MAP operation immediately rather
>  	 * than deferring the MAP to the page fault handler.
>  	 */
> -#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
> +#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
>  	/*
>  	 * When the NULL flag is set, the page tables are setup with a special
>  	 * bit which indicates writes are dropped and all reads return zero.  In
> @@ -702,9 +704,9 @@ struct drm_xe_vm_bind_op {
>  	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
>  	 * intended to implement VK sparse bindings.
>  	 */
> -#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
> -	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
> -	__u32 op;
> +#define XE_VM_BIND_FLAG_NULL		(0x1 << 3)
> +	/** @flags: Bind flags */
> +	__u32 flags;
>  
>  	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
>  	__u32 region;
> -- 
> 2.41.0
> 
