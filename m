Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25704C001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 20:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23D710E125;
	Fri,  4 Aug 2023 20:45:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67D910E124
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 20:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691181955; x=1722717955;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bV+iKqd1likQnnTBGVXOINwqQYIQIaWfFGBmPcOyIYI=;
 b=IVKNJinvS+xQTaZutrRUk+Rz0s7OzY12/NYHGuc04w5GlL0XYkLxsje8
 81reuJEz4G1u1eRyo1b3FJGOQehJ6RxK8jjurCEUa9pbxePorDSFIgaGJ
 sI7H0PyoW3lohQuiiKBkL1Qieq5II5m4XBCjJAxSizL72h5ubxRLp6Pn9
 eshlCxfh4JcRBwP1OYygtOkNnpgCDT/T9Z/XFCJ+DdajtEpewMdRdXOXQ
 O0XX1Ktv1gwNNm0D+j5pjxwmBrZbQ6DKcFGZcLMSu/zD98c9c00ffD4jg
 S9k7KvEp0a/v5A2Q5gK2iQKNwYoaIvzCqoJeeMDWeudhlHM5lHN5+ktaz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="373897357"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="373897357"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 13:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="759706774"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="759706774"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 04 Aug 2023 13:45:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:45:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 13:45:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 13:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkFINz5nKaIbWzDx6mcQBzAZ+4vU/WK4p6HzHDaWZJBorNX8SrZ8Di3meDtic2eSL9dl1I8fGKCmC9FwTA1eStQT4w6kvnr6Dw4NZQ6Qt8UbCfQjcUaJy1fagaoAzlkdy5FW4xpcz+u3IYokk//5kyfl98M4P50FmssQ2eW6YK8SYILstLM1WhHNBI2rFlB6snT75oODkXUalkdTMqJhIovzfJ51tBMVa2FDkpX0ghmbCYSXdd1jOsW7T3RkaHnU4qGMNPbFGHLOmU0VTXaxVtpDtEzQ2eFuR+gRg0gQzjMujOzQrQAWlukqh/9xSbRdiMA/zjoMNAs58xI96DFr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hak267sdpiFLbRNxrcM+it8P21ODND5Vpi4FbD9el/Q=;
 b=F1fIXFFhuWSRZqzDft+MQ/suknnJE4ZBvt7atTZWSX28T3nS7Ljr7d4RcvxDadiQ29I2KTv2piz1E3gbx+elc3mtjMoP2dPHMYOoNf68uB8A8llpiRNFDvmnA8iqUDal/7HB5Sv4sfntP+5u1R7+w+tCldNLO3QNOILqIP5dW4YMEVDDoMtgq8NPjrAWFdo2UD3Q6jymU2ws/22QMpjkiDrB4p8NrtHCzkUYe1KhplT9+KKMjU+5NpUbEZTeaIHBhdGfXjMyt4lIU+iRyenzj4MGepcqk8iuuoEAqmlChJzj294t9qBT5G6x4AmRrrExtd0VEZjm52PmqkkwpPQ33w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4643.namprd11.prod.outlook.com (2603:10b6:5:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 20:45:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Fri, 4 Aug 2023
 20:45:52 +0000
Date: Fri, 4 Aug 2023 16:45:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZM1jfIk8pbfbh/jZ@intel.com>
References: <20230803032317.706386-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803032317.706386-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4643:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ffc03a9-4c4c-43a4-34e5-08db952bcb07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4+JgRfIiEvfd3q5MSA4llVUnSybHOVth2AjXJ1j8dsC6feEwRQy46q5a6eV/PUzqNcEi0RStbF+x0/waHkskZ4C12hCmdKq7rIOBGkU4atE+HzxXMkMmwP3W/BSD392N+5AthnHf7XvLgT/+86Dz+ryQvzm56aQtO5IfVr6eEdSE9mOFbRitPfKRPx76kAJLSt1sjawQ44eJe6LuUoINZdeP8L1Hqb5ShCJPVvPdb2yNijLmkXFbxEwuyC9uKAOQKnXEFvsPGbpoixm4RGXVYirf7kLTTRSshOblrXY32iebEbgrolQM+h/zbgmPvNGwpCJ7LY+yyP+quKPR86qZ/ANatZwemOeSZUXFo3H/yS/l/7txaXtVvFIHUp/cbGhbMA9/hmaUf2XbadW/MkQuadC/dFfDgiY561GkB1yjVhXhq5hhzdj6f8VWVB7oPND+UA6YVjE87EFLJlYc7gvAyFex4b+X4GnvtJNgKaJDZTWcfSII6zM4T2k2oN+Pk+fdD/3qAJ2gMOAiL8khWBQxKK0I0xUiK5AheWM3e/tXKx0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(366004)(136003)(39860400002)(1800799003)(186006)(451199021)(6862004)(8936002)(8676002)(26005)(36756003)(478600001)(966005)(6512007)(86362001)(6486002)(6666004)(316002)(41300700001)(5660300002)(4326008)(66946007)(66556008)(66476007)(6636002)(44832011)(83380400001)(37006003)(2906002)(6506007)(2616005)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EhNasqKoZ63aQhb6p7+hwuuH/8oiiIm604gXRJz7txG/Foi17w+UwIYHIJR6?=
 =?us-ascii?Q?gA2aVG+/ifRq31Sdw2w3LPWRoB8cqltl5C2/yIlOF3euwYeSv+8jPn7J1iV7?=
 =?us-ascii?Q?cJTjjI1MHA2NoQRyHsgd4NMlDH7OLCqLwipvTrXyckCTeYUADrrXgMC8YQB+?=
 =?us-ascii?Q?s2lvnDNe4iW6s0SHElhckf6HEKMtvPn5zJKD1c28mOuf8/UVe6ihaVTSPmtn?=
 =?us-ascii?Q?5J+98S6yEwTA9EoVzDkfoSNhTehaOqAxsFt+BeUupMEiJg0m777/BHF/f4sa?=
 =?us-ascii?Q?NwhjuTMh97ssPIQUrt2RiHiRmNF3h768VZawa/vNbBQW4tBuU8VPDDj9tKMR?=
 =?us-ascii?Q?Ffz9R4wWXKPnduUESxK5eBzrHxF/abMo7Cqj+MDk7SDN/qJ39W1rpRAscAgG?=
 =?us-ascii?Q?a8PQz+Cd9RhZlaxkDbTAL/+BC2dFHFwikbMRwXPqt3pJTOvVnepfjgdx4jLb?=
 =?us-ascii?Q?5NgCwsr5zJ2x+ypIvyeAJ8Pw0Ss1B2fCfvqzDXoBSloOOJYSPo7reip5n9tF?=
 =?us-ascii?Q?Uyc00wiKcf+Iiz2+k9kKr4UVcLP2aqKqyEZdXAI39smYmPFhxdtZfMjYMa0c?=
 =?us-ascii?Q?30xZkVODd0i+CC74urcHh1TmNejB3mdagDHx4obcDQhrToXuQ4va254cX3e4?=
 =?us-ascii?Q?yc+cJ2UbnNIDWb65RHJy0rVYnXJvQwE+3w6fG6eCAUWA5iSRvEWmPbDMkXaR?=
 =?us-ascii?Q?DF9WANKGt98Pcho0WbFao5CjrhmmUr9v7Ut8ZJwxE8ptUcqU5368sgUuNsXl?=
 =?us-ascii?Q?qejPZoLc3hn6Hir4NTRPMbjtzSQ8bTw3VoFuwS6DHMtIv6x/HPuWQ3FFtRZk?=
 =?us-ascii?Q?SQpFndCyrqWfKxs5FONzcUsXxUIGes1fo/HpcK+tqgqNFYvyGkiro8/eH9e7?=
 =?us-ascii?Q?Di3GA+6EJ6l4nwEODptu5pSYPkRXuDMWoNWGmwcP4jeVnflIHtuIGtfanzZe?=
 =?us-ascii?Q?qR0ipV1j9OhFi5o/A+7JUdM06P+BxDODm5i82QXeTDL6UhaJcNb0lLSv7/V0?=
 =?us-ascii?Q?a43Nr+D/1VmeX8TZ910/CLGe35db36Iz+5LhOTnrywbNlkWUd5GRhpelRw9A?=
 =?us-ascii?Q?zRSb6a3lNKtdxc0Clw4IgR1G1z6m9u0UpbyZ6CUfVknQoe3OsGDMKP9PIvZ1?=
 =?us-ascii?Q?T96++jCJqXF/7B3cpjTZd/bOD7DLVRjQwZyLLuCulmBMdK3MkOxiq0FNRk07?=
 =?us-ascii?Q?h47LvUzAHTG/r3j3nP+jfFpSqcWtW4d0G756I2quYFsuAiBGiku8hgW+46rt?=
 =?us-ascii?Q?yRGM07dnkdpZKcp8w0RGPC3uKRVyn6Cvg5D3Pv+m0DFOVYyOLF1PV0mp9mEH?=
 =?us-ascii?Q?jbqlf2cFadnVEvyg2EiNlEa2uqg1fkshfKALrmxeZXjv93XaZILSM9GB0n8f?=
 =?us-ascii?Q?XyybMJITm7BzIyxuVdIvkRrCrkJrZGFLLUNOSz0cRDsZkOgpHqQHikCpyTvY?=
 =?us-ascii?Q?1iPZQ7k1jSuYFOHHyeg8LY6y87gXuzxjeT45CFchTFH8oHENY9LmD/a3E3nq?=
 =?us-ascii?Q?UUVqCiKjG+iQL7ZFSzf5Wrhl3Odl+AOcdBI1q8Yizh0AiP/bgpV2UKhZV2iG?=
 =?us-ascii?Q?jDCAx0yeGrK7Wi4PRRWmpfB9Pokxde3O+oVeEDEj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffc03a9-4c4c-43a4-34e5-08db952bcb07
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 20:45:52.8468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3vUckFROYQgQzTIVIL3hVF588NTtynjNIPF7slORV3L7Vy4ruASlxCKROuH4joiYLPsJfZEtbLVcRtMttyg0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4643
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Set max pte size when skipping
 rebinds
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

On Wed, Aug 02, 2023 at 08:23:17PM -0700, Matthew Brost wrote:
> When a rebind is skipped, we must set the max pte size of the newly
> created vma to value of the old vma as we do not pte walk for the new
> vma. Without this future rebinds may be incorrectly skipped due to the
> wrong max pte size. Null binds are more likely to expose this bug as
> larger ptes are more frequently used compared to normal bindings.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Testcase: dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_24
> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Fixes: a042bb4ca894 ("drm/xe: Avoid doing rebinds")
> Reference: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23045

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cb28dbc2bdbb..936492915ecb 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2406,6 +2406,20 @@ static u64 xe_vma_max_pte_size(struct xe_vma *vma)
>  	return SZ_4K;
>  }
>  
> +static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
> +{
> +	switch (size) {
> +	case SZ_1G:
> +		vma->gpuva.flags |= XE_VMA_PTE_1G;
> +		break;
> +	case SZ_2M:
> +		vma->gpuva.flags |= XE_VMA_PTE_2M;
> +		break;
> +	}
> +
> +	return SZ_4K;
> +}
> +
>  /*
>   * Parse operations list and create any resources needed for the operations
>   * prior to fully committing to the operations. This setup can fail.
> @@ -2516,6 +2530,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  						IS_ALIGNED(xe_vma_end(vma),
>  							   xe_vma_max_pte_size(old));
>  					if (op->remap.skip_prev) {
> +						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
>  						op->remap.range -=
>  							xe_vma_end(vma) -
>  							xe_vma_start(old);
> @@ -2550,10 +2565,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  					op->remap.skip_next = !xe_vma_is_userptr(old) &&
>  						IS_ALIGNED(xe_vma_start(vma),
>  							   xe_vma_max_pte_size(old));
> -					if (op->remap.skip_next)
> +					if (op->remap.skip_next) {
> +						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
>  						op->remap.range -=
>  							xe_vma_end(old) -
>  							xe_vma_start(vma);
> +					}
>  				}
>  				break;
>  			}
> -- 
> 2.34.1
> 
