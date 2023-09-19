Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF2CCD5BD1
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567A210E124;
	Tue, 19 Sep 2023 14:43:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDCE10E124
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695134607; x=1726670607;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XonQ0bAGkYb8is8yNaakMPdru3uZRWtEqEzEP6oGuHw=;
 b=TlKJu/Rp8cV25I/iyA1qlx5MBPSfD+CyWBC+u7l75hDbe/86shJktgGj
 9ENE8BZPhGMMXLB2lwISuieQLG4vrhYTQn3a/sVtkr24WHsLhDvvEOXpF
 ieZN6dFpcqSXye/KX7u6/kieaJ7yBUtDaXsKlfYWFUQ/gJXw19eRYezE5
 1QWAee8U3B9+0ODTVXCuINw9hFodP2s8acMZ/ahfAIGyvBBoRdSwmLdcO
 d1nmwOTJbl+OIGmrKB3nuN4vdEn5qobRxgVbbQdl8v7i4KNRN3w5XvRb2
 cDlx81KclnQF6WHXUHEY7VbgGRkjPzHLS9sJPXPUvgT2sPpas7gSwk5zN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="359355227"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="359355227"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836451371"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="836451371"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:43:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:43:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:43:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:43:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:43:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnlgchKnf/Mx9zdZkZkhd+nb+ohE9LadPYfiY0MXn5N++ys6csj8qcAs2795z9lN1WdbGiylCfTQsaJA//RC5O/Sbg2VHYa6NzmOyFLMXDYVRMZf3XDYKoMQPeXUrKl6wEw84F1zUE25WHWN9euHVzVXxMKUJcn0HtjyfqaYy8oRiM+h8phfZVTx5dUHgtLHu+3FQJLPW0GrEW++W+qLfmjdaKE2G7Z8rnqrRaLQYzTGnDBEVG4ygIMEl4GOv9aHva9jgsb9RCU+xP+tuoSnKgmlijtIEcZLjF3zYo/XpoI0T6F85ornxVeZKP5xSy+IcwCo5cIthhSg1f50oxPoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evpMSDbR37seWgktp9fK90eRKLDFMC5KGVvdLQC2OAU=;
 b=afYvuK4upUvGMspE/rAweJG+1hxM2M2PRJUPfzATe0KAzZ64SoEVeh3s4A9VWM2MAK1s/q5685O7ZADZf59xMXW0V7Npy/F9QBfVywlbz7y+7NSOlP/NsELAgAB/uBlCQBu6v1I6Ds8KasAR7ZixzX2qIyIdTRb00HfeOSufp3A8y/DdQiDzVvhO6/xJaI/1S5SGg8FW40XZtZ+g55q3+rO5rS7v9ioEiaHdqPTZYL8NAhitIfIJm04bnpBMn9hNL9TC2/Gmaz1VdtVM2D46Xr9bxZIls1Rg0Ju3krADGUGHs4jmk3ME0RKHwF1coZAverHDm/VE+wOP5ZnEjEoO9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:43:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 14:43:10 +0000
Date: Tue, 19 Sep 2023 14:41:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQmzN1Z8YsKTYxli@DUT025-TGLU.fm.intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
 <20230919142504.91652-6-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919142504.91652-6-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:a03:333::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6bcb19-1f7f-40f1-1d9f-08dbb91ebee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TaVHOoZEIB8mRKzEvK8P6VajquX0tjqbFq/YgTLUGbFkz/Ie3fbkkBnTehjs0nFuHmFG9gLsustL6mAMzuLVHBZflOWKGglEyHMPoWN+nuPFqnbBuBDkjU01z28gOZYmlDa5Y5mgQbv392M4+uoQbTyAyi7RVTUupOkvF1hMuyd1daMnIvzBPGOOtsbZY3EnUXkhyaax/6VhlgrvIbp6zlJ521egoGLwaKxszNKlYEyxxRZOCZ9wQA57M+qk27v+N6nW4vnLxM0ZxRrJ34rXsaYaCDCQBrLAxOCL2PvNI8M5fOJoummZJCmDpEnTEPiJaGJQlJKV47ZLCWtjNYCBmFN3FBHZ/IXoR7ceRtjLV5FAyEwkv+mDoKoJFkLG/Bb7Ge1AbT1kZFO01OciRR3/4G6wXfv15BgMx2GRCRQYlwWgKL6Rgt+6dsdVOCMyzjBK0xLpiK7I/lvMmov1hISbvCL2meX1DzCy3EX6fOJwiBvNaNDVuKdGCCkIDbl8xQ4RwmPkIF2Psqeh5syutuuZAhFWy5lnAVsGt4fsVDxeKrg8l1A7B0XEfdRJ0QguB2yK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199024)(186009)(1800799009)(26005)(107886003)(83380400001)(66946007)(5660300002)(316002)(66476007)(66556008)(8936002)(44832011)(41300700001)(2906002)(8676002)(6862004)(4326008)(86362001)(6636002)(38100700002)(478600001)(6486002)(6506007)(6512007)(82960400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KKBqwtcT2dL41/jdDGgAZa+onKsw0kC2pGj3VAj1tvFqJJNYPECETIAwcj4C?=
 =?us-ascii?Q?+q7k206wO4FjSgrZU2iTBxKxdFJwU4w+bkOD6yHzLEb74aMA97LkWRFnpjwV?=
 =?us-ascii?Q?Xi1iOPVciY5Px20dApJbVrQmEwo+DaGKgVfvCnT0/ZqWuXxpsmFnNEjZBGAS?=
 =?us-ascii?Q?09wU7Z51eKSc3I9PwZ1/xzGJ/M5Fmqag0ZsQnzSAAzEQPFEi5J0MvAPpFo9c?=
 =?us-ascii?Q?3p78lHFe2ZUKlSGVVWF2CsqKvfIDoegCtZ+WGnGyfvEdoN1MHqUejgqyD/q6?=
 =?us-ascii?Q?YebrQNAQ16Pr61ZE2vQD3SZWvmYVoLyApj88cUELbSCLdvyT+MGgFIYMMvz/?=
 =?us-ascii?Q?Y2tYzpvDpxYVOvdu47fzaUn80fLiuGG2YP2XMTW39VReZoYvovCPIxlL8Oh1?=
 =?us-ascii?Q?D7NuUjW2lTmzS/25eLHyX/vT88iVIZt3EBqIVksV3+439OyR0Hb+0nUrIq1m?=
 =?us-ascii?Q?erh5uEEVmE3OKI6sNx+I6i4DnhWpeG746w8x5zSXuv9Lj5OQOTB82oBB4RfK?=
 =?us-ascii?Q?PBtjs3cicOs4VYhloLjS4E69mU19TXLH11Qa/6tegC8FFSNpjDlYaLYYuGdM?=
 =?us-ascii?Q?G7hjZeJEFdGg7W2SKNZp/jZbJsaM4ujqbR3ogeTlUH6oxC0ra3nLtozZWho1?=
 =?us-ascii?Q?GczD5Xd5neJ2VFiQgk1JIzcu3o1u9ILQvqOnJ1bu6KEAqoRQX8C66d4h/AYV?=
 =?us-ascii?Q?BjOJJzt8OnuDhBuHrqDhr0dS9OPlT5Vo52qxF1QLhJ3V6dZvVjsOjzi4HnZ2?=
 =?us-ascii?Q?0L+tRO06ge6cjQSpsz7IYcLli9tQW4f5OfM9J5ej03QfOQNUOyem6yat5l5N?=
 =?us-ascii?Q?nTKudnS7W6BmF7X7w94StsB7VcbAuraGaUj7UONL5O0wmTNrV38ut9pgXy4r?=
 =?us-ascii?Q?fNpI5tUZZUm2v5O6BQYo65pxgzq6uwx2X6B29gXxVmqNETTIP4+WZFcQ/HoQ?=
 =?us-ascii?Q?yVaDpJUMv7BF9vAr4a+Y7nJemivOTbeoiZmgtK8Fqz8KRQQdtUW3hT2djxJN?=
 =?us-ascii?Q?fwkx5b04ZxJj/VdpakLLDpNqVnwBTsnZrbHuTLuP0qMUALXN4PCzxBdSR812?=
 =?us-ascii?Q?bhMhJSRer4Lc4v05KEYVssOCHl2yn529DMSYUyPiTSrkKJJv8FEmnRCTAep1?=
 =?us-ascii?Q?JV+oyBwKlkH/OedRGhvZo7fegcNlXC44/1z8vbGqbnW8K41PZTj0xaleC7Mh?=
 =?us-ascii?Q?nVBaeLi7onQUqZF985/0M725ZQXDCMg2yRq7b/WtNyvRqTU/sYsY/r8YG7lp?=
 =?us-ascii?Q?x/pCo7nEaeRbwKQqjA/LUug4mNhLkXwwdVZYJFoDc0vXxo02pnC4O4YmV+jc?=
 =?us-ascii?Q?HUXGSRvMFEWTmsiLCaAtVvxWbbP2JuLnlo8TG4vAJws6kCigcKbmxfTOqY1c?=
 =?us-ascii?Q?2d0wtzBqIOteWgOorF7xGMsLMGt20BKxZjLKtTdqlJc8Z404KTIM44Tg8pMV?=
 =?us-ascii?Q?YzwNv/funLlhVvQhhevyJJ0KvWuxs/e3+ktSMp+UvfTLJdpQzLjxqTpPJRX/?=
 =?us-ascii?Q?Im8eLYtQGZ/A1c6y85MUaoZ1AzjBnlag2r+wyBy4i0B1ZRChzLtCJ0q4Ql+I?=
 =?us-ascii?Q?Tekbyhe0LYFFxgIC2ZCsGXV8U1lyBo2GjHD0nLJOm7Pry1/Q6cW2+sm8DYmJ?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6bcb19-1f7f-40f1-1d9f-08dbb91ebee9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:43:10.7552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHjaGXo96oboXvvHepztDEoD26YkQXPX1q2phsr7qOHo1J7lnTiOhZfno4Gw9mfOZDSo8vlbYB5THMqPwd2AVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/17] drm/xe/vm: Remove VM_BIND_OP macro
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

On Tue, Sep 19, 2023 at 10:24:52AM -0400, Rodrigo Vivi wrote:
> From: Francois Dugast <francois.dugast@intel.com>
> 
> This macro was necessary when bind operations were shifted but this
> is no longer the case, so removing to simplify code.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 42 +++++++++++++++++---------------------
>  1 file changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7579c9537bfa..ab132b88c135 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2134,8 +2134,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>  	}
>  }
>  
> -#define VM_BIND_OP(op)	(op & 0xffff)
> -
>  struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
>  {
>  	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> @@ -2160,7 +2158,7 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	lockdep_assert_held(&vm->lock);
>  
> -	switch (VM_BIND_OP(op)) {
> +	switch (op) {
>  	case XE_VM_BIND_OP_MAP:
>  	case XE_VM_BIND_OP_MAP_USERPTR:
>  		vma = xe_vm_find_overlapping_vma(vm, addr, range);
> @@ -2269,10 +2267,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	vm_dbg(&vm->xe->drm,
>  	       "op=%d, addr=0x%016llx, range=0x%016llx, bo_offset_or_userptr=0x%016llx",
> -	       VM_BIND_OP(operation), (ULL)addr, (ULL)range,
> +	       operation, (ULL)addr, (ULL)range,
>  	       (ULL)bo_offset_or_userptr);
>  
> -	switch (VM_BIND_OP(operation)) {
> +	switch (operation) {
>  	case XE_VM_BIND_OP_MAP:
>  	case XE_VM_BIND_OP_MAP_USERPTR:
>  		ops = drm_gpuva_sm_map_ops_create(&vm->mgr, addr, range,
> @@ -3110,50 +3108,48 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  			*async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
>  		} else if (XE_IOCTL_DBG(xe, !*async) ||
>  			   XE_IOCTL_DBG(xe, !(flags & XE_VM_BIND_FLAG_ASYNC)) ||
> -			   XE_IOCTL_DBG(xe, VM_BIND_OP(op) ==
> -					XE_VM_BIND_OP_RESTART)) {
> +			   XE_IOCTL_DBG(xe, op == XE_VM_BIND_OP_RESTART)) {
>  			err = -EINVAL;
>  			goto free_bind_ops;
>  		}
>  
>  		if (XE_IOCTL_DBG(xe, !*async &&
> -				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL)) {
> +				 op == XE_VM_BIND_OP_UNMAP_ALL)) {
>  			err = -EINVAL;
>  			goto free_bind_ops;
>  		}
>  
>  		if (XE_IOCTL_DBG(xe, !*async &&
> -				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH)) {
> +				 op == XE_VM_BIND_OP_PREFETCH)) {
>  			err = -EINVAL;
>  			goto free_bind_ops;
>  		}
>  
> -		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
> -				 XE_VM_BIND_OP_PREFETCH) ||
> +		if (XE_IOCTL_DBG(xe, op > XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
>  		    XE_IOCTL_DBG(xe, obj && is_null) ||
>  		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
> -		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
> +		    XE_IOCTL_DBG(xe, op != XE_VM_BIND_OP_MAP &&
>  				 is_null) ||
>  		    XE_IOCTL_DBG(xe, !obj &&
> -				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP &&
> +				 op == XE_VM_BIND_OP_MAP &&
>  				 !is_null) ||
>  		    XE_IOCTL_DBG(xe, !obj &&
> -				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
> +				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
>  		    XE_IOCTL_DBG(xe, addr &&
> -				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
> +				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
>  		    XE_IOCTL_DBG(xe, range &&
> -				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
> +				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
>  		    XE_IOCTL_DBG(xe, obj &&
> -				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR) ||
> +				 op == XE_VM_BIND_OP_MAP_USERPTR) ||
>  		    XE_IOCTL_DBG(xe, obj &&
> -				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH) ||
> +				 op == XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, region &&
> -				 VM_BIND_OP(op) != XE_VM_BIND_OP_PREFETCH) ||
> +				 op != XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, !(BIT(region) &
>  				       xe->info.mem_region_mask)) ||
>  		    XE_IOCTL_DBG(xe, obj &&
> -				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP)) {
> +				 op == XE_VM_BIND_OP_UNMAP)) {
>  			err = -EINVAL;
>  			goto free_bind_ops;
>  		}
> @@ -3161,9 +3157,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
>  		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
>  		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
> -		    XE_IOCTL_DBG(xe, !range && VM_BIND_OP(op) !=
> +		    XE_IOCTL_DBG(xe, !range && op !=
>  				 XE_VM_BIND_OP_RESTART &&
> -				 VM_BIND_OP(op) != XE_VM_BIND_OP_UNMAP_ALL)) {
> +				 op != XE_VM_BIND_OP_UNMAP_ALL)) {
>  			err = -EINVAL;
>  			goto free_bind_ops;
>  		}
> @@ -3227,7 +3223,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		goto release_vm_lock;
>  	}
>  
> -	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
> +	if (bind_ops[0].op == XE_VM_BIND_OP_RESTART) {
>  		if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
>  			err = -EOPNOTSUPP;
>  		if (XE_IOCTL_DBG(xe, !err && args->num_syncs))
> -- 
> 2.41.0
> 
