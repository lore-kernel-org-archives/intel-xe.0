Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5948610FCAEA
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 22:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0496E10E105;
	Wed,  1 Apr 2026 22:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jw925EcO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578ED10E105
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 22:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775080993; x=1806616993;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MZ11GNvr1fCPiCGBYkgL/vlStbJsFkkGKuGlCesIE1I=;
 b=jw925EcOaq59+eG2y45/6DcRWNZvOyKTboE8ryns+m3rlOUYXC40AXOM
 CfTaNqfoK/bf36kjoStGCQQ3S6JAw1coOMS6NCjQfa+k64Rp1MVqdmlpC
 EMQbKFOi3B+peS8uoG96gltrWt4gttTIT0jTQtU8fQKU7LoBuK+2s/3y5
 xaXc6AkTEEV5S5QWFRx1T9xsA1fUP8scaTk6f4M4Q52UwbolUxw+ZYwgY
 DV5vG8iJWWLV0mNntxVtSS+g5C3UG1lBfcPGVaXsmeUE9av+xSAfaoenj
 3edS1qbLYZ5kLFS28E+9Kwd/3bZVtnwQlxPsUbqGgUlPppwcAtwyPpczd A==;
X-CSE-ConnectionGUID: 8eitUbbKTJarnmaD94GF8g==
X-CSE-MsgGUID: C/wsLiWgRf2ExgAfBGIJ0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75851419"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75851419"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:03:13 -0700
X-CSE-ConnectionGUID: ktxV5U5ERT2C1pcekcTB9g==
X-CSE-MsgGUID: lKvM10IXQ9KDhhsYLLEKIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="222438111"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:03:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:03:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 15:03:12 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cD3QvS1l0/drE8GImJB5eo7q6heW9Wju7wCnvLzxnMLeWGr4dOGej3sPosTAPSUZMpGIZLTsV4v/eGpiDIkHbarUrH41Kj+g6K8k4HcKX+pRyCoC8zfSFZDbOMTBLtMNLB8PQA/JO6ThySIStNP3BYZh8EHQ6ZDmxOTmSZ3XmGIbdTjCrEUrO/B+8bGKqBMbws+kSM85/CZf5kCd7wsufGgInW/NdkI+bd2eBqwuk4x3y7CPP0Jrzl0vtJQKAwvc1FM5smZQjNNAEnftQEh/kHPE95Zeyxh3wpWeN6od/txfCuRZyQUX7x5jH53cSok7gREkKYlzgRMmfD1WFU2adA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOFOZ3nJS63F0jnXp2ng4olgh6rSlclJGQ+2IJJXUgY=;
 b=Oqs6DMB6yLvEzAKrEOFOMUf2kkkBdFYZmsIj8+3C2XJDJJN38+DwHzDeMl6OfQXVQpV86S2xFpDcPec0S1NK3uiGo943HdI7cFT/fYa/sLbAT1H6oQXJSy7lb1WM4GeG/4TpyRih56qVfzF84eUV1fyEviQk8wUrsPjgsUIWadwVCp+JrdRyDciADkTiFy4OerN7oZwUtEziEQitBHKUzEXAXWTTKDDLefJudoCfQhgBk9Wc8G+KPcnq+HF84ZhLBsttTAwOctDTFwVs8l24dD6P0XZ2D6Z0AtNv60/zNy7/nY/oxe0UV6f+WP7g2rqMwUnYJqC5PDoKLy1v9yNMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DSWPR11MB9738.namprd11.prod.outlook.com (2603:10b6:8:353::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 22:03:10 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 22:03:09 +0000
Date: Wed, 1 Apr 2026 15:03:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 06/15] drm/xe: Extract xe_vma_lock_and_validate helper
Message-ID: <ac2WGmt5Uylv7sTq@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260318074456.2839499-7-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DSWPR11MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: 301c97c3-d432-448d-0934-08de903a7625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: xrGI81wZ7yNvxi7dWNvxCr/U4a/NTcGL6oP8cAHqmJfZEG7SDDmVi0GO3BXv2elxVUv3Vatyx/gHhIsPLKhvyBRGLxI/KL4LH8qiiUfCF7SqZ5La1Z+RYgImHNKIchZ/U8uMjqOhs8xYndbNr1YSN5rfIJjK8YUbVAMxfMny9aKaTSzIY3QSrLer0u/YlLoBxgqiRBpAC99iYfH2VGFudlz7oxxjW3QfNoTGI737cyms09RCn4Mi39RIJPbpROCAl4CU9nY7hTAzsli0FZ9tz6pz2GrgEepvFru/g1WqHxjbftwsYS07owkvRMSdvt2pcBn8FsZuREk1Zsp5NUomVnByKROKLwgHZy00GXU/V0ovKpG600+kP0xu2BvjyC0ZAmZcww92zsaYFm4YmvQ4KsAwVJZQgCMtHEmSxETutiyNevz7gt9yqUjjSAZKBnzPWFtjobE4kpsIpzI9RfPqwzeRvEpkbTdBDYlh9HnTnSm1hPibw7JJFmpbQvFX7jMh/YdR6XV9Zyrkiaopy+jNXQNqI0LXcewIMboKQxz1CEzxuJA3x92gHUPvrw3SqnBHMag7ve2ILvH26FkAlK1EwDDUi0ex1DNXY/PodE1GC36RZJk5s7vnnw33+IR1YKESIwqI9Sq1QC7W76H87R/6WhR/HNhyNdU80O6vOwsCx9EIqtwbAemDUuyJ/z9YDI1JBCggDFnTmP1qsmR06SdLvxiSg9/ci8w0jME+glaDkT4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z8VLONCrHe6takWcP2EpEqFJVJNu/gumGb2XxbIdaDaOypAXpydcGrkpm7Hw?=
 =?us-ascii?Q?a2zp9YrOY3GZeFWt9YF+n0lBMu7iwfeq7BQWKOQX30QbEWgqS17do+nArH+6?=
 =?us-ascii?Q?MCNR5RaVDPoKXi+WY/Ud/MoP3lF5CmijwtOaUAA70Bxhcy/RdDjan3DGkNz8?=
 =?us-ascii?Q?ViblPWYIHriVOqiTYctwt4UuRvz/lvuxmF7NbBza6YBxSUUq43dFaDxxOnGl?=
 =?us-ascii?Q?aDich87FxKgLMMxDmHRn2hHLcIa5wsJsfaIrepD+xXvpzm6VID9iZ1BnheRc?=
 =?us-ascii?Q?1H2+tnRuSzc0YXQSEPrtW5p/fkFoQGc/a0UTYM3yjRBjwlum26V72d2qmlTi?=
 =?us-ascii?Q?ST1kAsnOqBvEvXzmyYKuH//h58uSnxJMKXHvuEVdGsglBaFvgB7neQzBXJsV?=
 =?us-ascii?Q?mo1YibgmLAQ0bSb2mxgEz0M2mJJNpqyocxPEsvJn0VEOLRjUYql9JhNrR7o9?=
 =?us-ascii?Q?Y20O31AwU0zoeJ0I9M4i755HyS7t+z7G7EKtbIttWgg6rmhO5X7svxdliLr2?=
 =?us-ascii?Q?+acD7B19XhJiFgA5liX62MfuMXH0tL6xQIAu6VvUu/w+mnZIOR1fVYBD6Qnv?=
 =?us-ascii?Q?UjVxm0ieDdmJwJ39ZzXdiTEKRYMO+AMyq7fGD9XygGwDTEPEWszQfIMx4RmO?=
 =?us-ascii?Q?QAwiOL0puVrhwMKoSeLjGCz/lKu9Ksbqg/7fcngvm+K7Ime9XDl6FADLIA4x?=
 =?us-ascii?Q?sh+xsEv9ggfC8Qg4fHIUV/ZR/K0aWOwZkKBPoWXGyTu9LREEY8sWFv1hJ5lX?=
 =?us-ascii?Q?r5Y8zixaRF9xs+93w60t7amI521YGsvyD6AojvnX6uIRF9oO6oRhVYwEb3e1?=
 =?us-ascii?Q?HdmQzQYHxT6WWM2+e+c7giTN5t0KPlIoz1dzryY0h5x6TQZA6xT3MU4z4my8?=
 =?us-ascii?Q?X+dha9X+0H/Jc5jSgLQTAP38ZSXQtMgcHQEPJK633uyov/I2NJ2Pd7JqEawQ?=
 =?us-ascii?Q?ntie14SbcSMzfiDWjGAK63Cm2bugT+IM7RigoOlom6L+nYFZmQ5Ln6+a6v2v?=
 =?us-ascii?Q?/+Vm/os2uldcOyF7l9f1lxATUoy9WbnzhLggJiVCHxp22x+9wpgr4+NNJ++y?=
 =?us-ascii?Q?x7qxi4JuR0W6KkUJzPubqbx9jHSJIaTSz98cCWc7TVgXjwpl1I7AHnQ6UoU5?=
 =?us-ascii?Q?vxWfzrwkvwJWtq1co/cB/Jgx7xOcYstG21ScWTbbc2Iz7ShJHX86rG9/YSG0?=
 =?us-ascii?Q?dmwd1MxKmB5jwBFMr/L5Yne28QYqfbdB9Yd+DBmalHmGuSBflOPf1nnX2ODZ?=
 =?us-ascii?Q?plgJldl5HrePA1ELbRvlVtFCdTSKK+BYljzcJz04BBLL97q96j3eRvnjBLK7?=
 =?us-ascii?Q?8VRmY55qYP+UB2xqKTfSIFuPBhrkC9YqH2sUS2OQRHP/RBpvCy/vAn/894di?=
 =?us-ascii?Q?H3cVYiizBBobtRvFgzQxxnqeiqPI/RXXpxZdrO4SoRhz0Gs5jgoKj2qX6GIy?=
 =?us-ascii?Q?S4+3DfyZTMU8dzSx/aj7aNNX4Sifhen1f9LpF1Sx0ExMG3Mt2QhLEjI5Sz1x?=
 =?us-ascii?Q?hfBqREzygvn+OTJjKreIfM7ST/U8ZQ1zQENghFazJjljQblakzMVhiwPXOpE?=
 =?us-ascii?Q?56+D3rlYnJcdJe6kCZydoPE1oEjhFCjam6W6txyHOyj7Knl9Ogrif3pHy8nh?=
 =?us-ascii?Q?1K+/1+ppPtHb/cBxn12iNO26LttFeE728vsyeIzt+ruIrBfO0DPGWRPXWGUp?=
 =?us-ascii?Q?uw0NS4iRbpsbLP6dF+gXA7DGjp6lLo1zkI6arOaIxpvS6zKp633+tJa5tkyd?=
 =?us-ascii?Q?zsKxoTRmqX8AE67smZdAFBe4z/BZw78=3D?=
X-Exchange-RoutingPolicyChecked: QcNfc7QlrTGsJfqhfosjBVtkUb3tmcDh3EAUFo7858I3Zrb1WVuJQs+3RVsYb/23r/OBSVH4Cu/zfSCsgpH8t3zMlWiwdh87nUmbCmSIQbhTOpnKdxQCSPP1e+KslvNU4wdz8eUb3w8vaZiGGCQdc6eUWpk5xS+VnXQQoB6rECke4r/iqVuwFFDama0/pFeoVED1ZyeUnNXX9yAxUbWQvxYVfHkxlD3GZyziNCUmTPSJkmpg62dUh7oOQAcuEOtmUhXX5a8kHBUQQZLdckZT35YurrclEJjekkjTmfbGKcueRCVBWrAQqv0WX6yN9Kf+zPXCHvxeZDiiAy6J8FmP+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 301c97c3-d432-448d-0934-08de903a7625
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:03:09.8904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQq/AbKicZwOaOGZXoaj0SI5gFwNAaHt3xyq2kgyL5gqkycqo0bZb6JWH5Jnyz7MDs0e7kPvbSfriQqeNmDZJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9738
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

On Wed, Mar 18, 2026 at 01:14:47PM +0530, Himal Prasad Ghimiray wrote:
> Move xe_pagefault_begin to xe_vm.c as xe_vma_lock_and_validate for reuse
> in access counter processing.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 22 ++--------------------
>  drivers/gpu/drm/xe/xe_vm.c        | 31 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h        |  3 +++
>  3 files changed, 36 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 67dd07927684..8c159e3512ee 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -45,24 +45,6 @@ static int xe_pagefault_entry_size(void)
>  	return roundup_pow_of_two(sizeof(struct xe_pagefault));
>  }
>  
> -static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
> -			      struct xe_vram_region *vram, bool need_vram_move)
> -{
> -	struct xe_bo *bo = xe_vma_bo(vma);
> -	struct xe_vm *vm = xe_vma_vm(vma);
> -	int err;
> -
> -	err = xe_vm_lock_vma(exec, vma);
> -	if (err)
> -		return err;
> -
> -	if (!bo)
> -		return 0;
> -
> -	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
> -		xe_bo_validate(bo, vm, true, exec);
> -}
> -
>  static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>  				   bool atomic)
>  {
> @@ -103,8 +85,8 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>  	/* Lock VM and BOs dma-resv */
>  	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
>  	drm_exec_until_all_locked(&exec) {
> -		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
> -					 needs_vram == 1);
> +		err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram,
> +					       needs_vram == 1);
>  		drm_exec_retry_on_contention(&exec);
>  		xe_validation_retry_on_oom(&ctx, &err);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5572e12c2a7e..659504ec5a13 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1170,6 +1170,37 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
>  	return err;
>  }
>  
> +/**
> + * xe_vma_lock_and_validate - Lock Vma and Validate bo location
> + * @exec: drm execution context
> + * @vma: VMA to prepare
> + * @vram: target VRAM region
> + * @need_vram_move: true if BO must be moved to VRAM
> + *
> + * Locks the VMA and its associated BO, then ensures the BO is in the correct
> + * memory location for GPU access. If need_vram_move is true, migrates the BO
> + * to VRAM; otherwise validates it in its current location.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
> +			     struct xe_vram_region *vram, bool need_vram_move)
> +{
> +	struct xe_bo *bo = xe_vma_bo(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	int err;
> +
> +	err = xe_vm_lock_vma(exec, vma);
> +	if (err)
> +		return err;
> +
> +	if (!bo)
> +		return 0;
> +
> +	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
> +		xe_bo_validate(bo, vm, true, exec);
> +}
> +
>  static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>  {
>  	struct xe_device *xe = xe_vma_vm(vma)->xe;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 0bc7ed23eeae..127cecfcb80b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -271,6 +271,9 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
>  
>  int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>  
> +int xe_vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
> +			     struct xe_vram_region *vram, bool need_vram_move);
> +
>  int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>  			  unsigned int num_fences);
>  
> -- 
> 2.34.1
> 
