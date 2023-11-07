Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A129C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 15:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A9710E09D;
	Tue,  7 Nov 2023 15:05:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B792510E09D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699369499; x=1730905499;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9J5zH9lMpH0/D8VU9f6krQheMSYOxeI2Lg/wA9nH6Xg=;
 b=Rcj9DFsxwzWa4MaWuSnEjna1KlM+wuYJpCnAIIZ94vQMdHYnQfP60Ljw
 oweUvfcSE6v0ielIIKNscFJybD/ePfjJmmUjTmTnyEKU7wJ9Ov7FWG6ER
 Zz6WJk960FHW+g9PZ3rWw8krx6yXV9v07oGuZlpc0+IdsjOWfBNYS+pB1
 fqhRwdsHiIqWrI//TSGvDIxedNa33PKHdxG0AvEOVTMX/NHAD+FRgmqgz
 NUqlGrMumiip+rc2V74zanKc2qcqHdQPNcWHc4jRRnu51tinxHlFpPO4c
 YuzfiA344XSsJdWi8i0bXL5j6WN5i4yerzOP04ehbXCzz4gtQyZV/0aco A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2536196"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="2536196"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 07:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="853392887"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="853392887"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 07:04:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 07:04:43 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 07:04:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 07:04:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 07:04:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuGylUWLCdM3zr/Hcu/WYRfQYl6VFheM1E1sf0a/PCB/3n+XDL7chx3lxdj5z2DESOdcSFGR5rHtB8j+fqpFKk2vuipEM6FWwCdi4vSCa4sLyDFVk9oiO5clW3KacO50J9tqH1AbdDI3qWSRsjyHz0OqHs+SAQ5U4yIK2uHf9/dFxSRQQ7nqifJmZKlHmPemRfPct1CXB2vYT/vB5BDiePYYoazs9IQ8+wuf8/aEplRO6HQnV0aehr+kZesVU07tQ8JXhG3UD1e7hLYzj6KlBBwREmbOd0IM2yN4v1KFkFoZsgqS2b3mXub4YDbGbfi/+HxocEYa249gzRkc91rxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQXQGFaSUnSGobr4LZko4rmldKNh4a8AJLrUpS1j4Hc=;
 b=E50z37cepb3ttRayCzQuSOqZt/gOOzXeOlWXJj/jysOIveHw/iLiIEAQtvSJ7VJhPrtvAacx2cSd1gXkpbo3GAVmYkH2G5dQbDgFHSbBqmWCWcJPX/Cft+fNBOLqMhdnKC4tGot66vwL8uwwLCi6u/cp7fOmXTV+uefaSP2x9iy+JNzjGoLroUDxZxY5CgQ5Tx5oIE57vJxKSLM+gB3+XsDBslJKDdfGRY5ZEzu29cSn4HuUm+0E9u5gnsQfIgYjoriAkp9Z16bOV1f+NuUQ2ST4D2LFpMwdMkbqozoVOE2CGtBJjo8+f34Ivp1UaZVf8H8v7j8mL+Kf0Fd388EdSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 15:04:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 15:04:41 +0000
Date: Tue, 7 Nov 2023 08:03:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZUnvbDjVfKsjHfAd@DUT025-TGLU.fm.intel.com>
References: <20231106221538.14505-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231106221538.14505-1-brian.welty@intel.com>
X-ClientProxiedBy: SJ0PR13CA0238.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: 680fcc39-03a0-4c79-1ac8-08dbdfa2de2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUszwUE+gi7h0rhUWxX+9JLO6FbDe1SYDNctkK9oHqT3Fv3shGSjcyAoLS3XLhSTOTaHU02N2S/Gt+/FyDuuaq7ujW811lQFJR8wwiBiCUmceAjeZcTBB30wvK5rXDnRxPdug0ur1z2ES1DrDhDH531Jfl5PYyp6SUNGCyj5BCk3tUMVWRG3ItjZ0XfC/zQxXuFA5vVihXpUgGoW3GSHxdOpuBUDz3yVF3uXM1v/q/DCyOthS/F0l7lNMspqCT4dSmZRuHO/1FUzma1TTGZnH5NqWlwXYkGYj4n7cXreNVQxE4CqOcienUXD/eThxLQw+FyxVjk1TyVbJM+wX3As1qM0YJcD51HqRx/A17Mfcu7xTsJafsXKhqqgtQ/0IjnnLUVuB3qOlR8R5wwoyGU2K1jrCOheg04oXeWNA7oKtqYqrlCF51ouTNafYNoSlAbJNoal8rySjlTEnuyuiucxkjKIUUrhc9IvAjM8RTMEifX1MDYk1pnQr12Juk+96yGGDSeKjsYqCFgKwYVi5PNFSPMryRedTQ50uMvkI9qKnoG3XcnPLBtFCPNq9yBBXXOHN/VKdyReoRGcrGQSAczEKblRARhGftRCquK6ftNIL6b3fU2NwVCpPDqRrtSjhItj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(366004)(396003)(346002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(186009)(1800799009)(86362001)(38100700002)(6486002)(478600001)(5660300002)(6512007)(82960400001)(6666004)(6506007)(2906002)(4326008)(6862004)(8936002)(8676002)(41300700001)(44832011)(83380400001)(66476007)(316002)(6636002)(26005)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3U4QVxuw7pNGlI5mJXhosXFPghIp/gDJNjKqKcppsdDapXbH1Fi8eMabWK5M?=
 =?us-ascii?Q?gwKE53+92vpmL1hn5RpZLwZnFHvbObCwfwGio/7fstMkEH7PzkK/3//dl2PD?=
 =?us-ascii?Q?F3t8GIpZmfI7fE93QE1Nxyg4Ui4KS2Y7Fmlb2ZL6FPTt2LJdce2Cs8DKqYT7?=
 =?us-ascii?Q?J+SPR5wBpj2vTa967N0jyI1cqntXZ4XgiQ+5dm4uaekI95j6ERdRko43dDA9?=
 =?us-ascii?Q?sgQOr3UlQkjtWjWIzPKCF0lWFlqKzD7o9hV/sOqDiAfZmDcOGBfB0KT/PFEo?=
 =?us-ascii?Q?09uqIzJzV0qiZ0i5x2vyPTXjjSPzG8/KCtFXlJyiVc0hxtNHTEUU2TzDK+qT?=
 =?us-ascii?Q?1gurfvZEOPY8gz7r0GIOcZFDcMx0RebHhrmArdg+NL8Fus5CpARGf2Pd8jdd?=
 =?us-ascii?Q?ACAxoOLZaX+UPMtMuDKlL6V7kUPvRKN9XjoHdKr4+JHhZfGGXqtLs8SAw63C?=
 =?us-ascii?Q?0vUlrdlBahTPTlkhWcThuz/8d9faf0htCc/WEDbZ/Zk8S8Npn++DP6qRMNMr?=
 =?us-ascii?Q?K3wj0Ahw+kOGG99HDBFXmhWu6E+YtPiF7sCo0GUAnnCZWfBbUpJY+Ebx4a2D?=
 =?us-ascii?Q?CSgH4aodcf6kGgRQo9eOFFHHdaEjdE5zZQ/KnsrYGwpoOyTcyQruewCNFEPt?=
 =?us-ascii?Q?+U9CZlFTD2LToB/iWJ5/S7pKbG0+dHg0r+LBP1gs3H4XpGXUSrsHG4kDlHw8?=
 =?us-ascii?Q?II5izjXufD6ehF23Sqgt9v2j7DQNNmzgX8nb+4YMQZeh63U/Bmah/FETydzf?=
 =?us-ascii?Q?QM5yZM2qiWq7ccb6VlsoYJjiZc4bsBqfth44x7Cek1Sn4/WQwfR0Dvwj0XFK?=
 =?us-ascii?Q?Duu+C8D5OfAeYcrMNpEwYi0zh+i5CDtJGn8r/cvZmihrVQMr1NIDiX70VUaV?=
 =?us-ascii?Q?UBiJ3iGBijZiHydRPEB9MtAp8ZSzZ3D8zcNFEQrer2gNJeOryhJOVSxcZRfq?=
 =?us-ascii?Q?U3rpRvbjDxjTiUsNsI8yibHXeHLCNO1J6g/Ecsd19vAJX0/4ZeDvmx+/xaWR?=
 =?us-ascii?Q?2lStXjUJB1paj5PE4oZoPXECW50hmwG/X1Q+SYb8KF7cLd7zGI0mh4TvOgXD?=
 =?us-ascii?Q?cNm+Eji4Bg5Xv26QfhU8IKi0LtdSJc6ZfeH0UVnk6OgWV19CrVK0dfdYiWn9?=
 =?us-ascii?Q?5TAlNtj+GLH/AHtN1HPkX/bm42SG88ZixK/kxODZhIhgUhbqOQCz3xJ2iDR/?=
 =?us-ascii?Q?eIjVYZepHix7I+0Xf52daz+b8hk9/fzzW+aW8UaXCUc4DYJ6LEYKo4wZfV3G?=
 =?us-ascii?Q?dc+gzRwYrJsTo7nQqf5hZVpm6zxEXy4tVA2a+Glc3gyysjMBmGXc2lT7jtTy?=
 =?us-ascii?Q?ITJHAc7Hxq1u5H8GMi55O26MGMAUVQwE/6+7s8zuRrVlTBQaoj2aMbLGBC2f?=
 =?us-ascii?Q?IXlTKxWP57AxEzR93MfRbcXq3zFQpnKXxdIcDnqg46NizNaG4fEGAggRkE68?=
 =?us-ascii?Q?rfFLR/a8cbTYQXIOuwhkNw9khY/H8YHy9smzWFutq5R/U/0Lld6A9wquSEP4?=
 =?us-ascii?Q?PzF61H4i30t1jb+7z5azWvSVO5oy54qLBCZG1LVAITlox9WDIL8RlUIY8PnZ?=
 =?us-ascii?Q?xhUEObS4cYCVy05LVqNuCptgUjwTw9hO99WKFgD+h9v9mIPdX6J/qiPiEznp?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 680fcc39-03a0-4c79-1ac8-08dbdfa2de2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 15:04:41.0224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUuQ4/gRj+m4ND82EP3ffudPOMKLwoNTbPLCO9JIMDb+zsUgjHTLfgv5jHcnkp6ksJ6wApbEQjE2b5UZlxxblw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5351
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix unbind of unaccessed VMA (fault
 mode)
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

On Mon, Nov 06, 2023 at 02:15:38PM -0800, Brian Welty wrote:
> In fault mode, page table binding is deferred until fault handler.
> Thus vma->tile_present will be unset unless the VMA is accessed by GPU.
> 
> During a later unbind, the logic doesn't account for the fact that local
> fence variable will be NULL in this case, leading to pass NULL into
> dma_fence_add_callback() and causing few WARN_ONs to print to console.
> The fix is already present in the code, just hoist the fence variable
> computation to be done earlier.
> 
> Resolves warnings seen with igt@xe_exec_fault_mode@once-invalid-fault
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d26c90f0d702..d45f4f1d490f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1738,14 +1738,14 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
>  		}
>  	}
>  
> +	fence = cf ? &cf->base : !fence ?
> +		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
>  	if (last_op) {
>  		for (i = 0; i < num_syncs; i++)
> -			xe_sync_entry_signal(&syncs[i], NULL,
> -					     cf ? &cf->base : fence);
> +			xe_sync_entry_signal(&syncs[i], NULL, fence);
>  	}
>  
> -	return cf ? &cf->base : !fence ?
> -		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
> +	return fence;
>  
>  err_fences:
>  	if (fences) {
> -- 
> 2.38.0
> 
