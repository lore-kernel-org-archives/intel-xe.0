Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3390C10F04
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF2D10E7DA;
	Thu,  7 Dec 2023 05:14:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AF210E7DA
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701926053; x=1733462053;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZpoLSP58q5j0HlqqawogCvu6TyD7NpZKbsbpuPtNDlA=;
 b=RgP4EOq3X1fWVUzl3xMUzZcLjLVVfqu5ZcBvLgcvq2gATL7zras/p9np
 wBp6YCjkxL/gMOY00ia3CRet6SvlHJmLqj5qHUudrmAKXKVQUWALQEpgV
 92/vR61REn4mCpfa106X/vv/09JM9cDtvgZy2BeDrig/55GOokUheb4CY
 sPcc3cvrsz2oS3ReVn473uvHZRL1X/jdIG+r/BTdF+3KtWxqQGvhMyjOz
 RxaDA1D1Yq22ho5YBeUjCIuZMkabevld3fQSJHC8zY8nT93nQO1ld9X9o
 HQvlfG2YY93sriybpClA5fKkxxsLs/j3ULj70rvYLEfOMJlS2X7MAnCG5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460663133"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460663133"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018815179"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="1018815179"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 21:14:12 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:14:12 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 21:14:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 21:14:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8dGOrNJ/3fQzbw++4jLhifN+2KPVQLucFIZxhq9M28HRAd0FKr5Z8FOQWDQFCDRBzllxspzRf9STXv0P9ZSR4CNJQ0zI2XKG7Pk4bc8SR64EwDY6cAsarf3sg2ACMgAhfC8zr3IL44CEAYcewm7111w9RPmmfF7tFSLjSlTkoKogqWsoOMdeqcm3KqMjaGgW6VJUhatWaJcv60WXx1JBmm7HUSBUpOEli2NLHSectdYbcP2Nn4nChAl9Rrbi4AockGRR9K6/TDAGeAeI1Rla5dc6p11xXQvEzqJHA2VRh7izvrCaulZExl7KRANVmhMhse+t6pYjE0nquuGd0+52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8uc4Mn5X7bdjxCCBk4C3lgFfzbqLBtcctXfCKsc278=;
 b=Z5vTWGgWL6TjqB9m4z2s5zHuaszyWekGMefT95rcxzaBfHBjlSlxRciE//eYdUWxrxf3/18VaRgdjLfdu2K4tCNQZ0DWozEv/N+aEODj36m3sKlGChYi2QUPGmOe627sQ+xYdwU8ovKFFwrY2DdYMk3S1VXigNusgdWwSfrtHHiWPJPDiHtGnQbntddte3kpcuo+WvA3AV8Ku3XPlPn1nnAZpH6UL4efMtVaW1LFUMrMT3H0rAyhSUnxnIUqTHf1KdZaSyph8d/di10PRCdnA5TxXlgtHkM1kAZwYpIh6yS87yLWxw127BdGCp/2EA9xtzZCApfrrNMAuTa94aq2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 05:14:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7046.034; Thu, 7 Dec 2023
 05:14:09 +0000
Message-ID: <7531590f-11a0-440a-a222-bb9d9a01438e@intel.com>
Date: Thu, 7 Dec 2023 10:44:01 +0530
User-Agent: Mozilla Thunderbird
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
References: <20231205213659.179813-1-rodrigo.vivi@intel.com>
 <20231205213659.179813-3-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231205213659.179813-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 6366672e-7556-4f6b-7728-08dbf6e35769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQ7rUahHBSPg39OtFC14kRKuOzevMkbYcT0vnka5CMDaDG9mapJzJGul05G++TDruepZY13Li7ztLxu/No+M3gRjPkKcFsNIZt5euFexha36fqtxE+SmL8VJErAvlst/+i5bntTYE3YKGwlhd5jaQtXK949Rf6Yn5cLJiax3zNkcinXjYQB/fLYeGqhF6hRZ3LG89Y74hmfLtK8eU2RZ2+VTe1xdtu/8WdXFS5Rsdw8WQ3KyxFGO+5JSKGhNn3YbFuflFJMZ1Oy3F93OvpV6en6tjYiGeA7KeVTB9QZDUH826jPZuJEU3ihFd2h1LfNI1TAOP21bmkjB47SorWGabl1aUighb+rTfuLxIJ7jKncCsD6BPz6abc6bc3kmw/UksUQ8DuRvYnHyQUEkT7V39oR0PpK/ThRV5QoGXcvnjNMCl4eh+4CObaRp5OmPIT9bCkUyuXqCnx3HDCxpOrpLRHvQDLa2JbdVtoetvRALSVLkxDc1pitLnpl5ow+jnpZZkPXDfwUCoLCEtGqZ+SdZIRuXM2MLaL4v6huyNzv0pNuL/UcbwV0FrRwGViQiWK7CMGmsWfVuBmxDjEulzb9/MRoG5Bt+gy8xzeYPGT4K8MhNucZKEDt21v7ZIbWDE4uLZ6lUEUfWK5C7C1z5h2NxLbHnnRGO5hPR+C8d+9OGg58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6666004)(83380400001)(82960400001)(478600001)(6486002)(6512007)(26005)(6506007)(53546011)(2616005)(66946007)(316002)(110136005)(66476007)(66556008)(8676002)(8936002)(31696002)(6636002)(38100700002)(31686004)(5660300002)(2906002)(30864003)(86362001)(36756003)(41300700001)(44832011)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzdlWlpNd1A5SE5FRHRqd2F1OG04MkFnSW9mejVzR1Z5eGFuUXJMM1JkczBT?=
 =?utf-8?B?QVlRYXkxREtEbXFRdmtLR1hLQzA1SHVOazMxeWR4bzJLbDk0YWkxcEdEZkdG?=
 =?utf-8?B?ZUxVWUVRUE5DZXk0RTJUWjU5VVNGNEZZVm9kNWlaOUtDYzF1R01QZG11dnc2?=
 =?utf-8?B?T3V3QVJ4eC9ycUtVbUxSWXRmQ0kwNUJsd3gwaTZmQVNBNnRLZXZrbS93UitX?=
 =?utf-8?B?KytjeTZ5VmFQMU9HbWtqZmFJTFFOdHhXVjJGL0o3OUhqU1FvUHBFUEYrVDJR?=
 =?utf-8?B?NXV1bnF4RVR0RG5KRnFCVFIvR1BJdVRKU1FRMEpZZXRCakVuRXJESEEwbHdV?=
 =?utf-8?B?SWdoYllQcTh6c1ZJS09CTVBGczJTeFRDa1phUjV6bXlNQndqUXN5eWwxM3Vm?=
 =?utf-8?B?TXI1dFpoM3M1SXh4S3VtVzRkT2t5MnNJZXR5YmRiUnZ4UnlQR0JBT21zTTN3?=
 =?utf-8?B?c0FOM05FVW10Ni9vTExRbnZxdENnQnJzbjBRRmw0WllRUHJWS28rL3F1cC9B?=
 =?utf-8?B?QkhBSXBXWEtMeU9HYWJjbW1HQklybnluUmZiaGQrVndHN3hrK2pWbGMyWlVn?=
 =?utf-8?B?K3phN3lwMmtCa3BFSFkwdmhGQytNLzk5QlBDaEdXVFJsbE1lNDFCM05pck5L?=
 =?utf-8?B?N0hOZDAzN3ZhL3RXYUluZEtYcVNHcWJ4ejZBRFRPK0tkZW52Z25aNG1ucVpq?=
 =?utf-8?B?WEtFU0pNOU5PaThHQzhTdEtGSVJONDljK2VVTEhaTVJFZ2Y2aVEydFpURFFC?=
 =?utf-8?B?RVBFL0tpSktWbmZQT1lDQ0FYVUtRNjYvS29nSWJtd0crbWUrTXRYSmpnV09k?=
 =?utf-8?B?a1JYWFFMbWJvVGxQT3FkbUFDbXZsUzNKVDJPYXVsaW1WdlpmeVhuSGFqb3VV?=
 =?utf-8?B?S3oyQm5Ha0VpdTdkTUx2RTd3eko3MXRYT01FVE1hclc2cVMyMGpiSHRlNkIx?=
 =?utf-8?B?OERham45ZlkwYm1jcVFBT2VWRThiYW43VVBOT09QSitzWGpxZDdvRStGQmti?=
 =?utf-8?B?eXBHNmoxZVgwV1dHZlpHOGFqQ0ZnUnFqQklWand5dVJSUzI1bjRUOUduZlVh?=
 =?utf-8?B?dzI0TlR1S2xna3poaHd2NE9GUVphemt0T2t3bG4zYmZCZmpwWElvU3BaU01M?=
 =?utf-8?B?cndDbGo2ZEV5OVJKNmh3Qjl0NS8ydFRKL0dzOXl3THZsc2J2c3J3TmFJNTRM?=
 =?utf-8?B?ZGlHYjdVTU10d1gwWWNyK2JpbW02azlEZjRyanFQczlpWXhIa0JJbWEzMWhR?=
 =?utf-8?B?WmNZS1U4eWU1STRJY3pZUzFqZnh0VFh0R2w0ZWppYU0wOXN2TVl6RWFPa3BB?=
 =?utf-8?B?RUsyWnpoSDVnUXgreXlDMUFmaEgxaE0xZFF4TjBMZkpCdS91dHBBenpydzhY?=
 =?utf-8?B?cDVaVUprem1NV3A1MVpRanVGcE4rejBtazRUdllMU0E1QXAwK3diSUVaWThj?=
 =?utf-8?B?eDVrRjRWZjNvWlhhSWhMNG9nczZrVnV5cDRlTzczMno0L1A0RnkxNldkVHIw?=
 =?utf-8?B?WndXZUJkR1h3WUpTK0JZVzEwZjQ5VVpiUVh4ZGFXc0duTlpCS0dhVmgyREJZ?=
 =?utf-8?B?MERkbWQydDM2QXVQQ0hHRmRUUEVmMEVSK2w0bHlXbE04cThRS1doRnVkZExS?=
 =?utf-8?B?UFVzd2RhR09CUm1JT3NIckRZcVByVVFuTE1PVkQrek1FUDFBWWFKelB5OVdW?=
 =?utf-8?B?MzcyZHhOYU9lYjlnQXg1QlA2dU1qZVYxUXFTcWpjL1NLd2VIQk5ieHJHanFK?=
 =?utf-8?B?UXJ2bUptcEk5dkdLTGxpWnRRekpWOGpUZkYzRnVuZ0o2NXkrR3pscnFSL2J5?=
 =?utf-8?B?a2U2alVhV0dMNk0zbFlSZ1h5eEdKUFQ2aVM2WXh5c0tPV2hIOGdzcmFabGJL?=
 =?utf-8?B?Zkt5OHRYYXRUNktYUlQ5VnZEbEZVL0JOTjdnV3J1R2hUQTFqVHRlaktRdGRp?=
 =?utf-8?B?UTB4TmFOTndtdURPOGw2SVpCTGFPNy91d1Q3NmpFR05VcDREZlAwcjNqT3Av?=
 =?utf-8?B?R0xYUy9nc05TUFMrYmtKVFhEYVUwQ1grMkk0Rmx6dTFDdnZnb3ZWSkM2Mkl2?=
 =?utf-8?B?SUsrK0RwYjVuTWJJUlhrRXZwdmpUV2UvQWVjeVRkM2VGUnBialFyVDhlZllY?=
 =?utf-8?Q?vmcvBi65PM/sVP4LI+XmrXuvc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6366672e-7556-4f6b-7728-08dbf6e35769
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 05:14:09.5302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pj+zdQcVbcy6OU2BzJGoucvY1cl2Pwsd2PpugpDjZas6tOAxPhPZVN4NY2s94tJlz9MwEXK7yGCCN4miPcAXIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add frequency throttle reasons
 sysfs attributes
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

Hi Rodrigo/Suja

Small changes

On 12/6/2023 3:06 AM, Rodrigo Vivi wrote:
> From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> 
> Add throttle reasons sysfs attributes under a separate directory.
> 
> /device/tile<n>/gt<n>/freq0/throttle
> 			|- reason_pl1
> 			|- reason_pl2
> 			|- reason_pl4
> 			|- reason_prochot
> 			|- reason_ratl
> 			|- reason_vr_tdc
> 			|- reason_vr_thermalert
> 			|- status
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile               |   1 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
>   drivers/gpu/drm/xe/xe_gt_freq.c           |   3 +
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 254 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  17 ++
>   5 files changed, 287 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3bca43cdbe3d..c4559590b256 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -77,6 +77,7 @@ xe-y += xe_bb.o \
>   	xe_gt_mcr.o \
>   	xe_gt_pagefault.o \
>   	xe_gt_sysfs.o \
> +	xe_gt_throttle_sysfs.o \
>   	xe_gt_tlb_invalidation.o \
>   	xe_gt_topology.o \
>   	xe_guc.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d318ec0efd7d..19d00e4f0a33 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -463,4 +463,16 @@
>   #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>   #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>   
> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> +#define   PROCHOT_MASK				REG_BIT(0)
> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
> +#define   RATL_MASK				REG_BIT(5)
> +#define   VR_THERMALERT_MASK			REG_BIT(6)
> +#define   VR_TDC_MASK				REG_BIT(7)
> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 769d59441988..39268a9c5b6d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -13,6 +13,7 @@
>   
>   #include "xe_device_types.h"
>   #include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
>   #include "xe_guc_pc.h"
>   
>   /**
> @@ -214,4 +215,6 @@ void xe_gt_freq_init(struct xe_gt *gt)
>   	if (err)
>   		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
>   			 kobject_name(gt->freq), err);
> +
> +	xe_gt_throttle_sysfs_init(gt);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> new file mode 100644
> index 000000000000..1132e827f1c1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -0,0 +1,254 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <regs/xe_reg_defs.h>
Unused header
> +#include <regs/xe_gt_regs.h>
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
> +#include "xe_mmio.h"
> +
> +/**
> + * DOC: Xe GT Throttle
> + *
> + * Provides sysfs entries for frequency throttle reasons in GT
> + *
> + * device/gt#/freq0/throttle/status - Overall status
> + * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
> + * device/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to PL2
> + * device/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
> + * device/gt#/freq0/throttle/reason_thermal - Frequency throttle due to thermal
> + * device/gt#/freq0/throttle/reason_prochot - Frequency throttle due to prochot
> + * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL
> + * device/gt#/freq0/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
> + * device/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
> + */
> +
> +static struct xe_gt *
> +dev_to_gt(struct device *dev)
> +{
> +	return kobj_to_gt(dev->kobj.parent);
> +}
> +
> +static u32 read_perf_limit_reasons(struct xe_gt *gt)
> +{
> +	u32 reg;
> +
> +	if (xe_gt_is_media_type(gt))
> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> +	else
> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> +
> +	return reg;
> +}
> +
> +static u32 read_status(struct xe_gt *gt)
> +{
> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> +
> +	return status;
> +}
> +
> +static u32 read_reason_pl1(struct xe_gt *gt)
> +{
> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> +
> +	return pl1;
> +}
> +
> +static u32 read_reason_pl2(struct xe_gt *gt)
> +{
> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> +
> +	return pl2;
> +}
> +
> +static u32 read_reason_pl4(struct xe_gt *gt)
> +{
> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> +
> +	return pl4;
> +}
> +
> +static u32 read_reason_thermal(struct xe_gt *gt)
> +{
> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> +
> +	return thermal;
> +}
> +
> +static u32 read_reason_prochot(struct xe_gt *gt)
> +{
> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> +
> +	return prochot;
> +}
> +
> +static u32 read_reason_ratl(struct xe_gt *gt)
> +{
> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> +
> +	return ratl;
> +}
> +
> +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
> +{
> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> +
> +	return thermalert;
> +}
> +
> +static u32 read_reason_vr_tdc(struct xe_gt *gt)
> +{
> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> +
> +	return tdc;
> +}
> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr,
> +			   char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool status = !!read_status(gt);
> +
> +	return sysfs_emit(buff, "%u\n", status);
> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static ssize_t reason_pl1_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool pl1 = !!read_reason_pl1(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl1);
> +}
> +static DEVICE_ATTR_RO(reason_pl1);
> +
> +static ssize_t reason_pl2_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool pl2 = !!read_reason_pl2(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl2);
> +}
> +static DEVICE_ATTR_RO(reason_pl2);
> +
> +static ssize_t reason_pl4_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool pl4 = !!read_reason_pl4(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl4);
> +}
> +static DEVICE_ATTR_RO(reason_pl4);
> +
> +static ssize_t reason_thermal_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool thermal = !!read_reason_thermal(gt);
> +
> +	return sysfs_emit(buff, "%u\n", thermal);
> +}
> +static DEVICE_ATTR_RO(reason_thermal);
> +
> +static ssize_t reason_prochot_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool prochot = !!read_reason_prochot(gt);
> +
> +	return sysfs_emit(buff, "%u\n", prochot);
> +}
> +static DEVICE_ATTR_RO(reason_prochot);
> +
> +static ssize_t reason_ratl_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool ratl = !!read_reason_ratl(gt);
> +
> +	return sysfs_emit(buff, "%u\n", ratl);
> +}
> +static DEVICE_ATTR_RO(reason_ratl);
> +
> +static ssize_t reason_vr_thermalert_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool thermalert = !!read_reason_vr_thermalert(gt);
> +
> +	return sysfs_emit(buff, "%u\n", thermalert);
> +}
> +static DEVICE_ATTR_RO(reason_vr_thermalert);
> +
> +static ssize_t reason_vr_tdc_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool tdc = !!read_reason_vr_tdc(gt);
> +
> +	return sysfs_emit(buff, "%u\n", tdc);
> +}
> +static DEVICE_ATTR_RO(reason_vr_tdc);
> +
> +static struct attribute *throttle_attrs[] = {
> +	&dev_attr_status.attr,
> +	&dev_attr_reason_pl1.attr,
> +	&dev_attr_reason_pl2.attr,
> +	&dev_attr_reason_pl4.attr,
> +	&dev_attr_reason_thermal.attr,
> +	&dev_attr_reason_prochot.attr,
> +	&dev_attr_reason_ratl.attr,
> +	&dev_attr_reason_vr_thermalert.attr,
> +	&dev_attr_reason_vr_tdc.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group throttle_group_attrs = {
> +	.name = "throttle",
> +	.attrs = throttle_attrs,
> +};
> +
> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +
> +	sysfs_remove_group(gt->freq, &throttle_group_attrs);
> +}
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
> +	if (err) {
> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
  @action is directly called for any cleanup work necessary on failures 
of drmm_add_action_or_reset. So sysfs_remove_group is not necessary
> +	if (err) {
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +		sysfs_remove_group(gt->freq, &throttle_group_attrs);
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> new file mode 100644
> index 000000000000..d26d0072f907
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
> +#define _XE_GT_THROTTLE_SYSFS_H_
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
The above headers are not used


> +#include "xe_gt.h"
Forward declararion of xe_gt can be used.

Thanks
Riana
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
> +
