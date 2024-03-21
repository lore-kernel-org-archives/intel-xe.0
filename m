Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9637C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 20:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975791120AC;
	Thu, 21 Mar 2024 20:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fc1to22B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E025F1120AC
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 20:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711051893; x=1742587893;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q9Ff7bfYdguP8oPezKDYAuyy/lKgDkuCmtGTMJENrwM=;
 b=Fc1to22Bbh2gZrMTm9SLVOGWHtlm5oL+S8VgWC5UFR8KmgRwH0o7Gl53
 C5PF8df8IlNjRCFVaOpzrBDlEmzFYZneYzk7jsBekmbS8C+i5Yphmew1W
 gUvt9yqxjXMQbpz0n1YjeZm1sRXccQrGcjbj6QrZ0ZEPWjEaQdiR2XR/N
 QpVi+Lj5OKUP7U6d4YBvFzXJ2XPip6MPqHQEXKWL+3vv0S6DpvoFlKXyl
 UVBSsn1/SpD5pkIyU3m9Djv8A/lBmRmQyd+freR+6DiSeXtnqtH/1JLBE
 YSENMFT0Yfan+NmLDZ2ZQi/XtLA8RrgLZM8i2/zwh81LExrXjUArDOCSa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23524537"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="23524537"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 13:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="15052380"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 13:11:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 13:11:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 13:11:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 13:11:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fea+AuGA4Elki70bqb7pBaFrzB5xaysPt77PLcJJFCCZDAoIoxgGmJwKEeekkhAtHscrM6hpEpVF/AKp3+v8b0LqOXFhjxiNT4I8w2EKQWaGvFbxDI0iPfSdssaqcawrC8xjnOASkMgC4bhC4XVTrsrTUid7Jfp066O67YWczR1Y7KqEa45jDI+POACoodm0Rul7v+4iz6eH92ZODJHrgnhY7BXxF08AGo3ceClTpu50w1EeVtwuMN9KlDdo7b9hheN2sED+J46WMBWXgW3JOeKrXZdSCC+7OswC/+WN0i3sNhSXsdktOvi+n1XjFgynTnC/NQbdRvskewMbKhICTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEif7soWHhZhT85/yIFutPGdJjVKb6n0eA5QhAStNGo=;
 b=lzZg8V4DM1w33CYYVp24qc73NVHKXwL/MegVDl7xkk+ax6HK0SI60VPcoD/YI/MamI6/szEviie0CorYCSe9l0R1UasG2tbJrCPNibCnej61P4Ca9lifTuVqFv3fYwkjIq4d7Uj5SBEmBgWMeot3fK9Yb2jgSfINlY9pV55EvmI3KbOyovpRxXqtEl7qWf02F2uc9ugRrOvnmBnH47ECx2VkMmT53dBZ+GcO9cZ2GQB6YKUzXOZ49xR1OClp190kXHD19NftJT6Zv/rkMsciS/PtLkDxP9Fo0CMmR85JkBX8y81Csf9auv+OGUvnuhRVq3QFtdKewv5DU5DvSZEU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Thu, 21 Mar
 2024 20:11:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 20:11:29 +0000
Date: Thu, 21 Mar 2024 20:10:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 3/7] drm/xe: Reserve fences where needed
Message-ID: <ZfyUUOYtnOwz56sB@DUT025-TGLU.fm.intel.com>
References: <20240321113720.120865-1-thomas.hellstrom@linux.intel.com>
 <20240321113720.120865-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240321113720.120865-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a03:505::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f98997-3896-4d8d-2125-08dc49e3187e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sVvvIfE62HI2BPsiv4yNZfHjB6de7752N/W5fbGbfceWO2gYpcxfpZkewybKITv2x7APHFmtksj9qRlcD8eZP1YBnChEUOhEmqCSIWnlX/pCoJVRiDwVMDx5oX+Yy0rFyUoDRFxxF0c+IuxP3Ruv7TB8TNvIMfuN+qR2ewX0T8c9VMmEeCvox647I9KvC+OEnJDIS1V58OSaSvHPYmzNiGNvbHu6CAZJvhH7jqHkYnqkOy1tLpe2517UIKNSh18SpELPyu5Jf564WgVjPoomUSFYIH1KFrlp6LumZHSP1jdaG1K6WEdeAxVnO0S690G2o4blQ3d8kBuViIEwj0N+vLJbuOWovlXtEG+w38p6m7N5oSTjfnyfgBP6PYnePSuXIKu+N+t5fsZLvxpE7ggbpks2/uuSa+vfjJG0xvLsRjAMTRro3RUEFO/4xyIVu+4O1y8EdpgOuIUgtMaWaT6qfFj8zAfpS+LUjfnWwNgSUqbyGWs2cd3hx8Pwk1UbuDexPUDHJEqitFFrj++unBQupsUQhadZcOAY6DfqYsWPWL7Y+lPCmgBjrgxEsxHtmlajUlYZuuTFfcQnasO0ekAwpWmRR4NPaK6kr7rUqd53Txo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7g7ga9RZEG3Uj2uE0MwrbHpbJ/mE9KJEvjqjCWM5/UPDzfDU4t4sG1qsma?=
 =?iso-8859-1?Q?vCuLGRPlHH4XY420gu2aloQZ00QFBI03WCJDhHNfIpCopVs/VfA9DovYI6?=
 =?iso-8859-1?Q?Oq/Ueymnwve6TYLBc+Ytt+nO80WocDi5w/hwweqy20ahXMCRa7NLINgMCr?=
 =?iso-8859-1?Q?PFKYNjQ14ZxJY6ai3rvPDPaJqFioDFO/uIMc2scqo5eWBPFlns12CWj0zu?=
 =?iso-8859-1?Q?Um/D4zooMyxOnccJhL/rSJiQ5ZYl2dALiYt3vs0R+ljPS7M3s1pWxwKUYq?=
 =?iso-8859-1?Q?noRCOe8NLVE1k47DhRjq8LCS85ElKonsUB5O7Ow6icklfm8SzuUE0dvWUi?=
 =?iso-8859-1?Q?l220OkWqATCfifjbIwSa1AoK664rZY8UZ+kxx0vXQ/2t+2RUGF5DtdjBmv?=
 =?iso-8859-1?Q?nDJ+6n+R6VT6J1EfLZasMQ0shW01/D/0bOjPnF9fm8PeKIR8YrE5C96zsa?=
 =?iso-8859-1?Q?xyySz3lK2lsPb2DQaoidw9KLAp1s4IH9flzSxKNxoyebYBNdwSCAbwkNXE?=
 =?iso-8859-1?Q?MV95Kt291igaGyndLqTye2SlRB4jJIJjpWwM5D7gg3+QRsDQ6e2huPLNT9?=
 =?iso-8859-1?Q?bQYjKzbTkvdxAeoGHQrehzHNLsMehqB+xFpBRyGSruwiHugCZiR2Z7IIEL?=
 =?iso-8859-1?Q?dkjHvLDtN5hFUVmIvBD+Hq8W0eHNM+PNsPaLhHkJV1UaEarI/ptfQG0lRZ?=
 =?iso-8859-1?Q?3fyIW1LTZa/bBvLW1mW4Tp8i0IJ7Boo1hBBVngqwVu5w9CEwNqSNsitXKP?=
 =?iso-8859-1?Q?XZ95f2VT+GSWU1bwp88qO0uZyNKqtsCG/gSxK4Om4yXHjllK1LvTotzXMY?=
 =?iso-8859-1?Q?6aPkb1EaxWzkOq+pRJrBVblxkOWAIF7Wk4B450UVC4vVt/+upFts67wgTJ?=
 =?iso-8859-1?Q?6e1ytXKqkp1OuZCXrHDAmvXSs+H3S4sTr1gjAQKDaobAPB4H7ck74Hd+wy?=
 =?iso-8859-1?Q?YwxWpwwpI/ycZoX3rV9R9M5SGm8if3OT03R66vDHuIiEizXufgaN691JzR?=
 =?iso-8859-1?Q?C71rSFa866XKR6K2dxG4J+PzgnRHtEIPXjh6mLdl9YVPT8dj+3SREMIzul?=
 =?iso-8859-1?Q?UWuq1WtFP5xrR6+8am5MLV9HZZYEOwLNuEeykgyRPPAB4Bpp1Mtmu0aPH9?=
 =?iso-8859-1?Q?gY5G6NIk6Jb1IydiqmUX7Ax3PYPrwhc9cxOHW05YvqC1sGh0zDCmCdK+wb?=
 =?iso-8859-1?Q?pw+kN+DS1z1MNY3MBqOEn0xkiwS3alA9cITR1RP5MBE3ETxLaj12mSO+Qd?=
 =?iso-8859-1?Q?r5HBpCpsYgULIAw8uSR/MfNhyDQPDMr6Wh8h+dm+HMQUl4FgRC/1BfybQx?=
 =?iso-8859-1?Q?39glPkJlaCGtd6YNu/T6TlW/D0rUkxmNr4qm2OIe1izCc6BWR9RKHHVoHP?=
 =?iso-8859-1?Q?obylrDbnyGHVciRz1f4AKLFu7iub/XnP7485xx7Dq40NCTA4xjF6joO4Qw?=
 =?iso-8859-1?Q?hVSaMcDSgu4Jv5+iG4jjtJ2h44l/MCNJwIkW0wvJFeukxbtLHg05UTmk34?=
 =?iso-8859-1?Q?nrThXz+3xBFsDrcks2BsJo9fVcJJdPdcU6F65EwDtZ2AHunr2FUjA6ltmk?=
 =?iso-8859-1?Q?h1sza49QXNAoGHOglAIo9ynMRRCWuQ4EqhTaCPaoBBfmRI2ED6vJQBzmfg?=
 =?iso-8859-1?Q?XomGxrjJYjmJSNWTKCMdm2+8PnX/CTnzZYCMy390Ad7UZprvsXgOQ2gA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f98997-3896-4d8d-2125-08dc49e3187e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 20:11:29.8416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBG9K0VH4QWTOO8Lz6+IIenT8bzMHpBoEMRfHW7EFrFnIZ2/gEDroAhO4OOY0cFcFZ94nJG/bvcYIgmUu+qdcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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

On Thu, Mar 21, 2024 at 12:37:15PM +0100, Thomas Hellström wrote:
> Reserve fence slots where actually needed rather than trying to
> predict how many fence slots will be needed over a complete
> wound-wait transaction.
> 

You include this patch twice in the series.

> Fixes: 29f424eb8702 ("drm/xe/exec: move fence reservation")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c         | 27 +---------------
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  3 +-
>  drivers/gpu/drm/xe/xe_pt.c           | 14 ++++++++
>  drivers/gpu/drm/xe/xe_vm.c           | 48 +++++++++++++---------------
>  drivers/gpu/drm/xe/xe_vm.h           |  3 +-
>  5 files changed, 40 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 7692ebfe7d47..511d23426a5e 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -96,41 +96,16 @@
>  
>  static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
>  {
> -	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
>  	struct drm_gem_object *obj;
>  	unsigned long index;
> -	int num_fences;
>  	int ret;
>  
>  	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
>  	if (ret)
>  		return ret;
>  
> -	/*
> -	 * 1 fence slot for the final submit, and 1 more for every per-tile for
> -	 * GPU bind and 1 extra for CPU bind. Note that there are potentially
> -	 * many vma per object/dma-resv, however the fence slot will just be
> -	 * re-used, since they are largely the same timeline and the seqno
> -	 * should be in order. In the case of CPU bind there is dummy fence used
> -	 * for all CPU binds, so no need to have a per-tile slot for that.
> -	 */
> -	num_fences = 1 + 1 + vm->xe->info.tile_count;
> -
> -	/*
> -	 * We don't know upfront exactly how many fence slots we will need at
> -	 * the start of the exec, since the TTM bo_validate above can consume
> -	 * numerous fence slots. Also due to how the dma_resv_reserve_fences()
> -	 * works it only ensures that at least that many fence slots are
> -	 * available i.e if there are already 10 slots available and we reserve
> -	 * two more, it can just noop without reserving anything.  With this it
> -	 * is quite possible that TTM steals some of the fence slots and then
> -	 * when it comes time to do the vma binding and final exec stage we are
> -	 * lacking enough fence slots, leading to some nasty BUG_ON() when
> -	 * adding the fences. Hence just add our own fences here, after the
> -	 * validate stage.
> -	 */
>  	drm_exec_for_each_locked_object(&vm_exec->exec, index, obj) {
> -		ret = dma_resv_reserve_fences(obj->resv, num_fences);
> +		ret = dma_resv_reserve_fences(obj->resv, 1);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 241c294270d9..fa9e9853c53b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -100,10 +100,9 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	struct xe_vm *vm = xe_vma_vm(vma);
> -	unsigned int num_shared = 2; /* slots for bind + move */
>  	int err;
>  
> -	err = xe_vm_prepare_vma(exec, vma, num_shared);
> +	err = xe_vm_lock_vma(exec, vma);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 109c26e5689e..7add08b2954e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1235,6 +1235,13 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>  	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries);
>  	if (err)
>  		goto err;
> +
> +	err = dma_resv_reserve_fences(xe_vm_resv(vm), 1);
> +	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +		err = dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv, 1);
> +	if (err)
> +		goto err;
> +

Again not a huge fan of updating __xe_pt_bind_vma / __xe_pt_unbind_vma
here because these are going away [1] but again conceptually this is
more or less correct the place.

[1] https://patchwork.freedesktop.org/series/125608/

>  	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
>  
>  	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
> @@ -1576,6 +1583,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  	struct dma_fence *fence = NULL;
>  	struct invalidation_fence *ifence;
>  	struct xe_range_fence *rfence;
> +	int err;
>  
>  	LLIST_HEAD(deferred);
>  
> @@ -1593,6 +1601,12 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
>  				   num_entries);
>  
> +	err = dma_resv_reserve_fences(xe_vm_resv(vm), 1);
> +	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +		err = dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv, 1);
> +	if (err)
> +		return ERR_PTR(err);
> +
>  	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>  	if (!ifence)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 80d43d75b1da..cff8db605743 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -485,14 +485,11 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
>  static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  				 bool *done)
>  {
> +	struct drm_gem_object *obj;
> +	unsigned long index;
>  	int err;
>  
> -	/*
> -	 * 1 fence for each preempt fence plus a fence for each tile from a
> -	 * possible rebind
> -	 */
> -	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, vm->preempt.num_exec_queues +
> -				   vm->xe->info.tile_count);
> +	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, 0);
>  	if (err)
>  		return err;
>  
> @@ -507,7 +504,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  		return 0;
>  	}
>  
> -	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, vm->preempt.num_exec_queues);
> +	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, 0);

I think this needs to be 1 as drm_gpuvm_validate needs a fence slot,
right?

>  	if (err)
>  		return err;
>  
> @@ -515,7 +512,17 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  	if (err)
>  		return err;
>  
> -	return drm_gpuvm_validate(&vm->gpuvm, exec);
> +	err = drm_gpuvm_validate(&vm->gpuvm, exec);
> +	if (err)
> +		return err;
> +
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		err = dma_resv_reserve_fences(obj->resv, vm->preempt.num_exec_queues);

What if we only have external BOs? Do we allocate slots in the VM
dma-resv slot with this loop?

Also what is the behavior of?

dma_resv_reserve_fences(obj, 1);
dma_resv_reserve_fences(obj, 1);

Do we have 2 slots now? e.g. to calls to reserve slots accumulate?

Lastly, strickly speaking I don't we need to patch in this series, do
we? It doesn't appaer to being fixing anything unless I'm missing
something.

Matt

> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
>  }
>  
>  static void preempt_rebind_work_func(struct work_struct *w)
> @@ -1004,35 +1011,26 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  }
>  
>  /**
> - * xe_vm_prepare_vma() - drm_exec utility to lock a vma
> + * xe_vm_lock_vma() - drm_exec utility to lock a vma
>   * @exec: The drm_exec object we're currently locking for.
>   * @vma: The vma for witch we want to lock the vm resv and any attached
>   * object's resv.
> - * @num_shared: The number of dma-fence slots to pre-allocate in the
> - * objects' reservation objects.
>   *
>   * Return: 0 on success, negative error code on error. In particular
>   * may return -EDEADLK on WW transaction contention and -EINTR if
>   * an interruptible wait is terminated by a signal.
>   */
> -int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
> -		      unsigned int num_shared)
> +int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	int err;
>  
>  	XE_WARN_ON(!vm);
> -	if (num_shared)
> -		err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
> -	else
> -		err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
> -	if (!err && bo && !bo->vm) {
> -		if (num_shared)
> -			err = drm_exec_prepare_obj(exec, &bo->ttm.base, num_shared);
> -		else
> -			err = drm_exec_lock_obj(exec, &bo->ttm.base);
> -	}
> +
> +	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
> +	if (!err && bo && !bo->vm)
> +		err = drm_exec_lock_obj(exec, &bo->ttm.base);
>  
>  	return err;
>  }
> @@ -1044,7 +1042,7 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>  
>  	drm_exec_init(&exec, 0, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		err = xe_vm_prepare_vma(&exec, vma, 0);
> +		err = xe_vm_lock_vma(&exec, vma);
>  		drm_exec_retry_on_contention(&exec);
>  		if (XE_WARN_ON(err))
>  			break;
> @@ -2511,7 +2509,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> -	err = xe_vm_prepare_vma(exec, vma, 1);
> +	err = xe_vm_lock_vma(exec, vma);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6df1f1c7f85d..47f3960120a0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -242,8 +242,7 @@ bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
>  
>  int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
>  
> -int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
> -		      unsigned int num_shared);
> +int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>  
>  /**
>   * xe_vm_resv() - Return's the vm's reservation object
> -- 
> 2.44.0
> 
