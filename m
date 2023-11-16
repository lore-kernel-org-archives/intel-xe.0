Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473EBC47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 19:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1095D10E690;
	Thu, 16 Nov 2023 19:48:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8095C10E690
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 19:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700164089; x=1731700089;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9WfYfjSH0j55cWxHksz7ukWgU1MonvCbPPCcyF/8El8=;
 b=iDAfSiWg1Jom5n5kYGL2x2aFNv4HpQAGN9IY+6QGbDsiZHhwPTs2x+pe
 OpIkTPfyWK9IXJvoqDe2/KkB+FgG8mfaoY2Vdv3zqc6aVoctHGhYsre1H
 PoVFjilWV6/xn0tyYftKzZzU4TtPcg0c84Vu2wKJDdY5gcUvoU2DpM23p
 NjrWk/mQajrPryBbDA1XnrmV3eKmTjR9e56h2aIeoJrCOiPLaf6n/2GdK
 Mdny6Ftnr+f/yxcq/qRum04hCH3XGB3XGkmPrM85clyqzPOJGL2Ml5etf
 NxQHdlrO2CGMwBbYFso9hcUjwT0iJpqP+agbJd37A3bbA2lA64qQ/EJEI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="477388878"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="477388878"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="758941596"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="758941596"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 11:48:08 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 11:48:08 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 11:48:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 11:48:07 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 11:48:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JC1s3O96olhnOKTIKD0DZjRPYMsTFD5HxGgAlubYxXsBz1NmNiQCWvHYtfeJ/jOoewKi2I7Od6ef+huEXx05KNmFx4Tp2267yUF1fgZJMFNLXehUr3zU9xAGOx7VuwHGYWzNHeeuNkOmbQP+gllOtPJaLAaQn5FU9Oj9v9gvwe6eeer9Q/m02E/kNZLhzHh0Zckfhgs/yyXZDq08ayAsN/gSrfTWzMbImqmdm4Pm+uAdd7nwqyAu2BISXWDFW4uEVvIAT3QjLeQuVMD5nBCvPgJ+G7EXSyQN2nXpamPc2RkSIZvJ7XmiOzg8pfMPUX9Bc3EDp59m71QJJN5/LOnSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpLpb1IU7DHOJszPqLvxHaj65jzR+GBpAWUWV2sOgSw=;
 b=EZnVxeYfnfMVKrVuY5dQMNgXK5joXHiDJVKrc5b1x47ey3k1EgHPEnC6kEQm2tQ8bAJMWDLypI2OIJ5zVzVGBRYvpSmw9Ydozk5B8r6/F3YY/GXWLI9+o9FgHZ2nC8U92DfXp3u9hb9551Jy0mgdEWO7F1BlL4jGhi7Mo4ZMdIranQAONNgVTJofiwdamIep8Ymw0nnGeq5CwQCOtEMzgU/cZM3UtblNgEnQopEjoKniTTifE031YReHpFZQKWSReo6P+g+bDVFZ/VrLuLqVchQ4ZfGxPnH4//CEBmV3cymyNmWhQ5rrWxZKPvRlA9AQyXlyYEeV6d0K6nAb2/Cp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB8117.namprd11.prod.outlook.com (2603:10b6:806:2f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 19:48:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Thu, 16 Nov 2023
 19:48:05 +0000
Date: Thu, 16 Nov 2023 12:47:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZVYPV9xd0XsKI6Fh@DUT025-TGLU.fm.intel.com>
References: <20231115005611.29266-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231115005611.29266-1-brian.welty@intel.com>
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: d1534229-c8e7-47f1-8386-08dbe6dcf33e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /097oZAMJJdP6HRIUK+cjA5yl9YxDE1uKRDMLUqxC7Wmp05tuDs9bHIj6n5YJ1pkTxpY4NbkE+b48ICdHr+3rQAeemT8DB12E1alHDFcYdnfAX3K0Y/CnuBTseS6wrjQaHcRWBquVapXbuikH2mlFmonegW53zPA3QM5BzkIN4snHVrl9MaN0O+Bqb6z2uqkFLUpskop2t59ZcVJLSto/G6avbAqIAg0223YbF04KW/vHXf+5f01exjBeWNKiVFMM48hpaYUocioZi8Q7ZLIxPYcQEOmUEP5395Yr4Ox7BerNtqWZpzitOef61R+eJmfsjbSMyo2bZrUPSm/G9x55XXuRJyv4GEU+cIoXAiEAchXSC3jipJ2ShibbYDlJQ8Z8gXNvQ2QdChfggWAojzcOWcKnyXvWJvpGTPYnAeMhFOXw1DUot7oO+b6qQPUHgBqpUqeaJZFjINsEo2sHhyaeTl+fD2Ar5OpFFIlO4OGJa3DT+FHgGsq8/EHG5V5jElz2INLnY6ARg2YwpzjwFt8q7qtaplHOaDxWxY+o7lAfYZeBb90JiwNAHqZuq6fGexS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(8936002)(4326008)(6862004)(8676002)(5660300002)(66946007)(66476007)(66556008)(6636002)(44832011)(316002)(2906002)(41300700001)(26005)(83380400001)(82960400001)(478600001)(38100700002)(86362001)(6512007)(6666004)(6486002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eLE8TqW1kubkuWwxGCh8FHGZWwnrSmMIymtWk4yzIxxlXs9tQamTQZXgMaO8?=
 =?us-ascii?Q?dCgUGwP32INjj9Tbe8gNFT8a7SoSfgam/n4LQYyU7EWwjJNh3mGbKXn5OwU3?=
 =?us-ascii?Q?F/6ZoLDCKpVfwZrYPpTQAOO7COHgvX7OcIsI5teiZPNbvrvrxaNdCLOzavIC?=
 =?us-ascii?Q?cre9a1EZWCMLdPwxqQF65MWuzERQf1urSwwqAZ9Ym6yq2+Aqg7fg/9uvYXrd?=
 =?us-ascii?Q?tRU7ahDSxBVcfaJd5+ehS9fjUVDvd8PacoE+u4riNmvbTxQywG5o7ffxnvH5?=
 =?us-ascii?Q?03ZJxplmbnfOQtUfrTRyD1e3VVbKoMRxZySyntJVfudjTo0ZOjay84PeUBCU?=
 =?us-ascii?Q?M8ucyrz5brc0Kba14FwCo5CDwZIaMJLCzmNdKdYbtTjqGDHSEVcBx/HNS2pz?=
 =?us-ascii?Q?2XibIyAemCAUX8Bryj75wF79KZkfkotNWrs7s+HzMzfG9BXHaacBlzkEv7d3?=
 =?us-ascii?Q?bwYSQoUJHrruFNdz0ThMa6/Fa3kaihUMcAaBeNrmFT/ynYeYUHLEP744ZGT0?=
 =?us-ascii?Q?emBiBRh2Q14QharH7DZPnB7PTvWxbYlqX32zDewFL0auXBd2USVxyHeajC+j?=
 =?us-ascii?Q?nSHIQQ56Tr23NkoRrCmeXFYhNlh3nfwzYliL5R5Pk2SwHdASpoEcRV2ACHXG?=
 =?us-ascii?Q?hTzx7ZqqmmmkDK7Bi7R4ou5krLKf/SJ4saCioAI0CpVlwl+10SKvaFdq2Q4n?=
 =?us-ascii?Q?eiUbn9OcC6Hy3mESEIZ/qsTxePrbWRywaB6zCaqQoQMIC5q1ZUB4mnZkHdIU?=
 =?us-ascii?Q?PSgb6SWs3cMRPLCgsObyy3hFkdFMEie1U/qlLBg60AZIe4N48QZqppoNl6Ns?=
 =?us-ascii?Q?/jMh5GOs6T3DVl+O7wZG+RKsVV2sQHJha5l09433JjPXhcYoAOaq+kYxSz2s?=
 =?us-ascii?Q?RHB7enTEelNYaWB5g/yf0Grpg4gWz5AmAHK2Mx+DnMaOBoLY+hYvVzqTWhTX?=
 =?us-ascii?Q?jgXQfXgIzeklI+9lpYCiG46Nu8HcehW1z2eQd8sG8LFJZ/vckW3r95hwi453?=
 =?us-ascii?Q?cbQFzNiS/J1+4cP6DmJrjkMi1ibXR3UJPIsXC/nvM0axZgnC1zZd5Hmkw+Gw?=
 =?us-ascii?Q?ZvunH3zTF3pB2fck8NpfQOEo78o5EMiyKSKMBiikqXJYRdwbslWSODhD5aQW?=
 =?us-ascii?Q?KCpvIeZ8wGNI31KgOKO7iWuY7H6UkFj+UCLtKr9K5VC4FS7EFvDFSVu6j2oO?=
 =?us-ascii?Q?7TlGOFe/n08cJpDfo/NMjPFAiIGG/kevVtczZHosRghzRI1hFsasF9af0OFQ?=
 =?us-ascii?Q?ZB0m44xkdqS4jPw3Cw+DFtKMorjKvxO0ULivK9zyUqOKsoh0K+Eb1MA7nnny?=
 =?us-ascii?Q?PA9InUk3PI/PN4IO0oOPNnag9J5cDVJOa1sBeTgtqxv57iM8UXtbkXBzAQ/H?=
 =?us-ascii?Q?QjGXFJFVr2shkYD831t44EXDAYI1QEo4mjfMVyslYC8DY3ydPi9oWIOvPiUu?=
 =?us-ascii?Q?tlqzXo7nleeB7daqJPq8kSch/3J15j0ZK2+veFif8eiwNDIhga9edNHHLHPo?=
 =?us-ascii?Q?X+iCDU1PZ6nRolZAx28tcQH0yLdxp7ak50QHz9Fs494OYF4xV5wcy5kuEUKF?=
 =?us-ascii?Q?1AFt83lcuOXXip3UZSnaezdnWbgocUIYzG43pCQ5Ky1hdgNeaqxhPKRYSYZI?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1534229-c8e7-47f1-8386-08dbe6dcf33e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 19:48:05.2406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43ZznuFWfP16Jm5br2aVxLJpt/ezsqTq8pEW8w12YUmB2+XAZkeZkJZ7fhLJIgkLJ2iJTY7hYWUAROfb9RDWGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8117
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4] drm/xe: Extend scratch page support to
 fault mode
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

On Tue, Nov 14, 2023 at 04:56:11PM -0800, Brian Welty wrote:
> The PVC HW has a limitation that the page fault due to invalid access
> will halt the corresponding EUs. So, in order to activate the debugger,
> kmd needs to setup the scratch pages to unhalt the EUs.
> 
> This feature can only be enabled if scratch flag is set per VM during
> VM_CREATE. For use with EU debugger, the debugger umd will set the flag.
> 
> The idea is to bind a scratch vma if the page fault is from an invalid
> access. This patch is taking advantage of null pte. After the bind, the
> user application can continue to run without causing a GPU hang or reset.
> 
> In case the app will bind this scratch vma to a valid address, GPUVA
> handles all of this (e.g. it will create ops to unbind the old VMA and
> bind the new one).
> Future optimization: as we use null pte, it may not require to invalidate
> TLBs when doing unbind if all upper layer page tables are unmodified.
> 
> v2: per Matt's suggestion, remove the scratch page unbind.
> v3: correct error handlings.
> v4: add test for XE_VM_FLAG_64K, and ALIGN_DOWN the address
> 
> Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> Reviewed-by: Brian Welty <brian.welty@intel.com>
> Acked-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++++--
>  drivers/gpu/drm/xe/xe_vm.c           | 42 ++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_vm.h           |  2 ++
>  3 files changed, 46 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 5b3585e2c125..91ad843713a6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -161,8 +161,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	write_locked = true;
>  	vma = lookup_vma(vm, pf->page_addr);
>  	if (!vma) {
> -		ret = -EINVAL;
> -		goto unlock_vm;
> +		if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
> +			vma = xe_vm_create_scratch_vma(vm, pf->page_addr);
> +
> +		if (IS_ERR_OR_NULL(vma)) {
> +			ret = -EINVAL;
> +			goto unlock_vm;
> +		}
>  	}
>  
>  	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d45f4f1d490f..191a1d2e9835 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1397,7 +1397,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		}
>  	}
>  
> -	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
> +	if (flags & XE_VM_FLAG_SCRATCH_PAGE &&
> +	    !(flags & XE_VM_FLAG_FAULT_MODE)) {
> +		/*
> +		 * Create a global scratch page for mapping the whole VM's
> +		 * address space. However, in fault mode, we instead defer
> +		 * creation of scratch (null pte) to the fault handler.
> +		 */
>  		for_each_tile(tile, xe, id) {
>  			if (!vm->pt_root[id])
>  				continue;
> @@ -1951,10 +1957,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE &&
> -			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
>  			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
>  		return -EINVAL;
> @@ -3269,6 +3271,36 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  	return 0;
>  }
>  
> +struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr)
> +{
> +	struct xe_vma *vma;
> +	u64 end;
> +	int err;
> +
> +	if (xe_vm_is_closed_or_banned(vm))
> +		return ERR_PTR(-ENOENT);
> +
> +	if (vm->flags & XE_VM_FLAG_64K) {
> +		addr = ALIGN_DOWN(addr, SZ_64K);
> +		end = addr + SZ_64K - 1;
> +	} else {
> +		end = addr + PAGE_SIZE - 1;
> +	}
> +	vma = xe_vma_create(vm, NULL, 0, addr, end, false, true, 0);
> +	if (IS_ERR_OR_NULL(vma))
> +		return vma;
> +
> +	err = xe_vm_insert_vma(vm, vma);
> +	if (err) {
> +		xe_vma_destroy_late(vma);
> +		return ERR_PTR(err);
> +	}
> +
> +	/* fault will handle the bind */
> +
> +	return vma;
> +}
> +
>  int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  {
>  	struct drm_gpuva *gpuva;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index b08c75fbd8a1..e07ced37223d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -180,6 +180,8 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
>  
>  int xe_vm_invalidate_vma(struct xe_vma *vma);
>  
> +struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr);
> +
>  extern struct ttm_device_funcs xe_ttm_funcs;
>  
>  struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
> -- 
> 2.38.0
> 
