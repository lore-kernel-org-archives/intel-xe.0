Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4108C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECC010E7DD;
	Thu,  7 Dec 2023 05:24:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBE010E7DA
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701926655; x=1733462655;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XccqEL+0GMaEt1hdheaQOgwDYheycA/+L7E5yyoQspw=;
 b=LHxWmCjRR9njJWWL76sSvP+Oaj8twjWTQ8+P8WucZKOD3y554EmTRyzE
 JvCsnuWDCzE6l3QHFozvYlCBk70d6CIqjqcPrppxBA6TYyA22OSU5YBMk
 9FwwGZJ1rGHvglkupyoWc7gHgORF08Ez791Z2ZowBIx1XVqMjRCrEsrkX
 +n9/3TAZIn6sRJBY4Ef/m/WWjrk9I3seV/S8CIZxYzkljKrHOX3Eciu8t
 FY9ahf6pEOKoK+/DhDKus6LVHitDpUF8R9ulkecDcxmdA7/u2CKoRxmND
 hSsgkpKL760JEX+zU6v6rjQfJ/tED8KulWyY1syMjy7Z68qSyv5kawNEq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12886740"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12886740"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:24:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="915443091"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="915443091"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 21:24:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:24:13 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:24:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 21:24:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 21:24:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDo+9Qc+2O9grE5XBklD7TGOc56xenstqStGnLRG0sCVoxlq32Lsu0Hv+2taT7K81jOeN9OvtwT8NmMVOL+YIrCP2DS5D7Q8o5E77Uaqb7vR/buFFJ/r51W3Cpi1XvIoEsmbqXSzzk3+Qs54lGvhrob4xjf8Jt+/OKZWBGpn3U9Cp3FP6B3KjnZs0WAeaI8oFKKpcyJ0mZO+ukSKu5PzsN71eHpQVoUFsE8FoBx8ucPVBxwRrOEsOn+JKnEpr2/LnDdj++QzI92QpfMgoMva+ha2b6oo1y3ENWQxkdQXLyrDMnOTNjtLQj9+d0RqKqb7fA6a5Gt8iH+9XARaUXTDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEZRwmyCXkaxYUUWJmaebI8WvR1vKk5GXVx31+kv/Ys=;
 b=bEl6QUkCRvzlpOXuw8nFunCKsOUP8J6Jp6eIZYB7yoP0pptzeWy+6acI5miaaJb6c0FUxNw9r/fjbO398AIzZA6aJ/FjYphdUEmryq/OGm3bzKQLkCmtsBK/3Xa8qVkIGfz7ppKpGJtdvXaNY76fMWB91BKyiehHie4LMWQ9aovRSX1j4vqCvWK91LaLUPoC8W/aQPjB3JWD+zexXsuBQQ+/WvU2XEuNJ8WTxwcHoZVVEOozRF88qrm8jvfNY3BnXeN1zWtuEkxXpHrQL5r4SL/FdDp2JZfLFLdGrC7yAAy0c3UeDolWf6qW7vKJkt8+OFryKvm5aPItYRHu/euZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BN9PR11MB5516.namprd11.prod.outlook.com (2603:10b6:408:105::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 05:24:05 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7046.034; Thu, 7 Dec 2023
 05:24:05 +0000
Message-ID: <d657ddd3-565d-4f41-b1e1-a86e7a5d8370@intel.com>
Date: Thu, 7 Dec 2023 10:53:58 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231205213659.179813-1-rodrigo.vivi@intel.com>
 <20231205213659.179813-2-rodrigo.vivi@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231205213659.179813-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BN9PR11MB5516:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e422b8a-1fe0-42ac-1511-08dbf6e4ba67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pUh4K2Er2YFUcaj9YqE1EKjPij2ccVMvq8WngqcGV65WhPpDLbZy0ajal9BiFt/70lU67sJLnNZUYXPEMhy0C/z10Mq0vmdQoPZvIg19wbXE7wNq1L+uza3VzwRhXeVV0P3wjyf5jpeXRaGBf+GvVGPF8Ogr/FgCm758kRyn3xJdo1qbmF86KO5GEu/sIR/yA4Aw0foK2mVALHmif3DfAhUrdxie3TyX5LIz36KBQdHhTvBtZxnosvVw6dlcRTsuOMdJuRwxTkmicwtPlasPskWprZWQk7drJCmbd7LB+HHq8mqTz6hC15ox6WaW28Xj2ttdpvuDe05c/A/iobax3ifQmv7eK2P+T577GxG150Hx42xk28aptdtHbEEKZXYLZ1BKR0eU+Qodfjmqbn/TN+F6cTgiiKA0dqAY8tCd9XLWWOgViIpnCPcoDMyJwbKeId7h3fB1kIlSY+8ykdEZtu1qGokpj2cNHkXhH3wPNAEJtD40ZBNQIeUxa5IKi+P0HILYUWx9hmmm13j/Wxru+Tfs+Mao2nK+UacY8854Ou5+XxQX5ITxQoE/eJ4zrw1SOrEHRN2SaS88vHeBvXRTg4Ds/9lf7Cr1CGL8b3L8r32UCY8PQJGMbtsj5FRgNxSGnVt6Y4E0ve23bp+aYx1FhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(4326008)(2906002)(30864003)(8676002)(8936002)(31696002)(44832011)(86362001)(5660300002)(36756003)(41300700001)(83380400001)(82960400001)(53546011)(6512007)(6506007)(6666004)(107886003)(2616005)(26005)(38100700002)(31686004)(66556008)(66476007)(54906003)(316002)(66946007)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c01oT01RU2VFOXFjd2l1RVhLdUd3b3pzWkFTd3RNMnd2cWZXb3huMmV6MU1L?=
 =?utf-8?B?MGpqZzFHekY2SmlscTkzd2hLVTg3MitiYWpIS0pENUpqY1FBRWdqbDlJU1Ro?=
 =?utf-8?B?WFVLeGE0ZUorN3hyRzN1c0c3QXhTWm54VyszU2tHbFpSNzZvNjJOK3lNcWtp?=
 =?utf-8?B?WkUwVjNQay83ZHRtWFNBbVhIam1SZTRURXZTanYyVUFqSlVFRzVTSFNXS3lE?=
 =?utf-8?B?NDhGTFlGOGF1eU5FcHFiK0NWTDVGN09JazJpZjNyMGRuUStQTENETGhLVlFa?=
 =?utf-8?B?VzgxanJHVXFHYkcyS3JLRDlhc3NSc2hvZ1JlRVlJYVNYSUJ6cWh2VmRaZjRs?=
 =?utf-8?B?S0FmWGpQM1Z5ZXMyTi9qOW5aK0hHOG1iK3laajVkbkl0aU1OMUg1TzVVZmxG?=
 =?utf-8?B?T2twc3VnSXZGYndoUzNoOWV5ZVR0U3dlY3ZoNHNRWVlMOWFYazRJaTBqMkFK?=
 =?utf-8?B?U3VEdkN0ZS9SdXN2UzVlbGdWVnJxQ2lyTFRUM1ZNUWpGVVhnZVpZWSt1Z1hO?=
 =?utf-8?B?Y0xYeitRSlFRaEhzcG5hSmIvNDExeGg1K1FCVUozUk8vQmlkZnAvZjQveDFk?=
 =?utf-8?B?M0hmTFB6MzBlRE5jemMwWWh1anpsM0JZZnpQdHBxYVBlVzM0YytOTnY5alM4?=
 =?utf-8?B?NTNTRzFmazRTU1NKRFNvQXpGY1NzUUhURHhiUnB6VWJ5TThXOEg1RmRJUGVu?=
 =?utf-8?B?MTl6VlBRbG5vNnFhVTJFeVpOYVpwTEhJczVkU2JTeC8yTmhJNnNMWHhWbHV0?=
 =?utf-8?B?bnd1QWpDMEI0UUllZEJkTzd2RWhLRlk5Q1Q3dUVKRG96UHJOK2o5WnhvbDZQ?=
 =?utf-8?B?dEtqNE5JbkpEcHlXVkk3Nk9ZeTBIWkpxd3p0dlZRaWxQelRCdTYwQ1QyQlVI?=
 =?utf-8?B?akZjbXFhb3NFSmZzYjA4aGdYTFdUR3FHS0svWTJKa012S1JRMkNwVktDM1Fo?=
 =?utf-8?B?VTRNdys0SFljY3VDaVprTytDLytxTnl6cWtjVDNnYkJtVUU4d2NmaGhaWjFD?=
 =?utf-8?B?T3RIZFV5cm1weEV3ZUVFckRzc3FDYTR3UnBDbWhFVUFkNXh5SXdqNEtGclRi?=
 =?utf-8?B?NGltMHNMTTY4eE85RDZXaU1TckJhVkhFYUduZ3NqaGp1VmNzUTlVVHd0V2xu?=
 =?utf-8?B?OHRnR1pZVTVCMWFyQXVxNE5oUFEzMVgvQkNERC85djhqZDQrYmprQzNZL2hp?=
 =?utf-8?B?T1MzOUM5dS9aVHFOSURxL1VUdXlQbWRRUnAyZnZ3R3Nyb3hxR0Q3QlZqRFRY?=
 =?utf-8?B?bUhLaHdOb0JqQlQrVGxhdWczMEI3Rnd4Uy9uVVBlb0MrYnJCclQwaWtGc2VQ?=
 =?utf-8?B?V0ZYc0dmeXR4MHRqRWZPUm5DTm9zWXJaTW1WYkZrMzNnME9sK09JZGFDVnVp?=
 =?utf-8?B?RHllSGo5Nmc4cC9hT2R4S0IvYmVWV2NyNmloeW55QW9zVjgxMGJGZ1dROHZH?=
 =?utf-8?B?S1YwOG5sb3d2TEFhalgyNEVFMi85N0cyTXU0YWgvZ0VOOTBWaE16Z21IbGdW?=
 =?utf-8?B?c2kyS2YvYk96K3g4TnBpMU12WUpSd1ZOY09qVmlCRUR5d3psUE80VC9Vajh4?=
 =?utf-8?B?WmtiTmtQSnJiOHRsRnZlTzFQVXJ0YVRTejhvT3IwaUhaR3pqaGhuMHhqWEpy?=
 =?utf-8?B?bkRuVTFJWWpoT1lYcTA1cStqV2dDMy9KeXBiRURuanprQ0tUVUtkUzN0TWM1?=
 =?utf-8?B?UXltM3dDYThzUTRMUXJVSWwxS2E4eEowQUtFYkJTV3FJeElDb1lsNVFaakxL?=
 =?utf-8?B?SUVNQURtQ2NORmpkMDNVbGlxVmdoNWdDVWxzcHhpV0dmY2dOOTB5TUw2cHB0?=
 =?utf-8?B?YXYwcjBMbUlMbmFIdU8rYzgzejNPSTlML05mYitIS0c2amFQZEhFMFVqMUVr?=
 =?utf-8?B?M1lJL3VoZ011QzFxdEJNWDRFVXNzZXpqUytZRm1WMUZaLzNUWG8wNzZGaFdr?=
 =?utf-8?B?WUdFTjlSV0xReVFwTTJQakpTYW5RNE5xbk1BakpmUld4bFBoSlJwb0Q0VjZW?=
 =?utf-8?B?aHhOQ3pPdkxnNVI1U0ZCTWJMTnNsUWIzS0xuUFhlODBSV2RDZC9xc3ZaT1FM?=
 =?utf-8?B?TzBMRmkxaWFsN3llN0I3K0VyL1RjTWpYdnhqZWhWeHpzdjR4eHN1SlFDRDFQ?=
 =?utf-8?Q?6Zk3Qlyz6fefUMn38cprsosLv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e422b8a-1fe0-42ac-1511-08dbf6e4ba67
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 05:24:04.6995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qA2viMC9t4Mf9tt3VSGEQYBYkTRFOMvGtCQZt895nA/uBhh7agoRCBajA8PMNYg/zCoB9cb1krRA0qBT+m/Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5516
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Create a xe_gt_freq component
 for raw management and sysfs
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Rodrigo

On 12/6/2023 3:06 AM, Rodrigo Vivi wrote:
> Goals of this new xe_gt_freq component:
> 1. Detach sysfs controls and raw freq management from GuC SLPC.
> 2. Create a directory that could later be aligned with devfreq.
> 3. Encapsulate all the freq control in a single directory. Although
>     we only have one freq domain per GT, already start with a numbered
>     freq0 directory so it could be expanded in the future if multiple
>     domains or PLL are needed.
> 
> Note: Although in the goal #1, the raw freq management control is
> mentioned, this patch only starts by the sysfs control. The RP freq
> configuration and init freq selection are still under the guc_pc, but
> should be moved to this component in a follow-up patch.
> 
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile      |   1 +
>   drivers/gpu/drm/xe/xe_gt.c       |   3 +
>   drivers/gpu/drm/xe/xe_gt_freq.c  | 217 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_freq.h  |  13 ++
>   drivers/gpu/drm/xe/xe_gt_types.h |   3 +
>   drivers/gpu/drm/xe/xe_guc_pc.c   | 197 ++++++++++++++--------------
>   drivers/gpu/drm/xe/xe_guc_pc.h   |  10 ++
>   7 files changed, 344 insertions(+), 100 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 87f3fca0c0ee..3bca43cdbe3d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -72,6 +72,7 @@ xe-y += xe_bb.o \
>   	xe_gt.o \
>   	xe_gt_clock.o \
>   	xe_gt_debugfs.o \
> +	xe_gt_freq.o \
>   	xe_gt_idle.o \
>   	xe_gt_mcr.o \
>   	xe_gt_pagefault.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index a9c71da985d3..38a1e9e80e53 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -23,6 +23,7 @@
>   #include "xe_ggtt.h"
>   #include "xe_gsc.h"
>   #include "xe_gt_clock.h"
> +#include "xe_gt_freq.h"
>   #include "xe_gt_idle.h"
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_pagefault.h"
> @@ -494,6 +495,8 @@ int xe_gt_init(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> +	xe_gt_freq_init(gt);
> +
>   	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>   
>   	err = all_fw_domain_init(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> new file mode 100644
> index 000000000000..769d59441988
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_gt_freq.h"
> +
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_guc_pc.h"
> +
> +/**
> + * DOC: Xe GT Frequency Management
> + *
> + * This component is responsible for the raw GT frequency management, including
> + * the sysfs API.
> + *
> + * Underneath, Xe enables GuC SLPC automated frequency management. GuC is then
> + * allowed to request PCODE any frequency between the Minimum and the Maximum
> + * selected by this component. Furthermore, it is important to highlight that
> + * PCODE is the ultimate decision maker of the actual running frequency, based
> + * on thermal and other running conditions.
> + *
> + * Xe's Freq provides a sysfs API for frequency management:
> + *
> + * device/gt#/freq0/<item>_freq *read-only* files:
should be tile#/gt#/
> + * - act_freq: The actual resolved frequency decided by PCODE.
> + * - cur_freq: The current one requested by GuC PC to the PCODE.
> + * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> + * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
> + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
> + *
> + * device/gt#/freq0/<item>_freq *read-write* files:
should be tile#/gt#/
> + * - min_freq: Min frequency request.
> + * - max_freq: Max frequency request.
> + *             If max <= min, then freq_min becomes a fixed frequency request.
> + */
> +
> +static struct xe_guc_pc *
> +dev_to_pc(struct device *dev)
> +{
> +	return &kobj_to_gt(dev->kobj.parent)->uc.guc.pc;
> +}
> +
> +static ssize_t act_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_act_freq(pc));
> +}
> +static DEVICE_ATTR_RO(act_freq);
> +
> +static ssize_t cur_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +	ssize_t ret;
> +
> +	ret = xe_guc_pc_get_cur_freq(pc, &freq);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", freq);
> +}
> +static DEVICE_ATTR_RO(cur_freq);
> +
> +static ssize_t rp0_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rp0_freq(pc));
> +}
> +static DEVICE_ATTR_RO(rp0_freq);
> +
> +static ssize_t rpe_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpe_freq(pc));
> +}
> +static DEVICE_ATTR_RO(rpe_freq);
> +
> +static ssize_t rpn_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpn_freq(pc));
> +}
> +static DEVICE_ATTR_RO(rpn_freq);
> +
> +static ssize_t min_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +	ssize_t ret;
> +
> +	ret = xe_guc_pc_get_min_freq(pc, &freq);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", freq);
> +}
> +
> +static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buff, size_t count)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +	ssize_t ret;
> +
> +	ret = kstrtou32(buff, 0, &freq);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_guc_pc_set_min_freq(pc, freq);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(min_freq);
> +
> +static ssize_t max_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +	ssize_t ret;
> +
> +	ret = xe_guc_pc_get_max_freq(pc, &freq);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", freq);
> +}
> +
> +static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buff, size_t count)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +	ssize_t ret;
> +
> +	ret = kstrtou32(buff, 0, &freq);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_guc_pc_set_max_freq(pc, freq);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(max_freq);
> +
> +static const struct attribute *freq_attrs[] = {
> +	&dev_attr_act_freq.attr,
> +	&dev_attr_cur_freq.attr,
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpe_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	&dev_attr_min_freq.attr,
> +	&dev_attr_max_freq.attr,
> +	NULL
> +};
> +
> +static void freq_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, freq_attrs);
> +	kobject_put(kobj);
> +}
> +
> +/**
> + * xe_gt_freq_init - Initialize Xe Freq component
> + * @gt: Xe GT object
> + *
> + * It needs to be initialized after GT Sysfs and GuC PC components are ready.
> + */
> +void xe_gt_freq_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
> +	if (!gt->freq) {
> +		drm_warn(&xe->drm, "failed to add freq0 directory to %s, err: %d\n",
> +			 kobject_name(gt->sysfs), err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, freq_fini, gt->freq);
> +	if (err) {
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +		kobject_put(gt->freq);
   @action is directly called for any cleanup work necessary on failures
of drmm_add_action_or_reset. So kobject_put is not necessary

Thanks
Riana
> +		return;
> +	}
> +
> +	err = sysfs_create_files(gt->freq, freq_attrs);
> +	if (err)
> +		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
> +			 kobject_name(gt->freq), err);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
> new file mode 100644
> index 000000000000..f3fe3c90491a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_FREQ_H_
> +#define _XE_GT_FREQ_H_
> +
> +struct xe_gt;
> +
> +void xe_gt_freq_init(struct xe_gt *gt);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index a7263738308e..4d24d0e78e6b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -299,6 +299,9 @@ struct xe_gt {
>   	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
>   	struct kobject *sysfs;
>   
> +	/** @freq: Main GT freq sysfs control */
> +	struct kobject *freq;
> +
>   	/** @mocs: info */
>   	struct {
>   		/** @uc_index: UC index */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index b1876fbea669..2bdabbab2d7a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -57,19 +57,6 @@
>    *
>    * Xe driver enables SLPC with all of its defaults features and frequency
>    * selection, which varies per platform.
> - * Xe's GuC PC provides a sysfs API for frequency management:
> - *
> - * device/gt#/freq_* *read-only* files:
> - * - act_freq: The actual resolved frequency decided by PCODE.
> - * - cur_freq: The current one requested by GuC PC to the Hardware.
> - * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> - * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
> - * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
> - *
> - * device/gt#/freq_* *read-write* files:
> - * - min_freq: GuC PC min request.
> - * - max_freq: GuC PC max request.
> - *             If max <= min, then freq_min becomes a fixed frequency request.
>    *
>    * Render-C States:
>    * ================
> @@ -100,12 +87,6 @@ pc_to_gt(struct xe_guc_pc *pc)
>   	return container_of(pc, struct xe_gt, uc.guc.pc);
>   }
>   
> -static struct xe_guc_pc *
> -dev_to_pc(struct device *dev)
> -{
> -	return &kobj_to_gt(&dev->kobj)->uc.guc.pc;
> -}
> -
>   static struct iosys_map *
>   pc_to_maps(struct xe_guc_pc *pc)
>   {
> @@ -388,14 +369,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>   	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>   }
>   
> -static ssize_t act_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_act_freq - Get Actual running frequency
> + * @pc: The GuC PC
> + *
> + * Returns: The Actual running frequency. Which might be 0 if GT is in Render-C sleep state (RC6).
> + */
> +u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
>   {
> -	struct kobject *kobj = &dev->kobj;
> -	struct xe_gt *gt = kobj_to_gt(kobj);
> +	struct xe_gt *gt = pc_to_gt(pc);
>   	struct xe_device *xe = gt_to_xe(gt);
>   	u32 freq;
> -	ssize_t ret;
>   
>   	xe_device_mem_access_get(gt_to_xe(gt));
>   
> @@ -408,20 +392,25 @@ static ssize_t act_freq_show(struct device *dev,
>   		freq = REG_FIELD_GET(CAGF_MASK, freq);
>   	}
>   
> -	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
> +	freq = decode_freq(freq);
>   
>   	xe_device_mem_access_put(gt_to_xe(gt));
> -	return ret;
> +
> +	return freq;
>   }
> -static DEVICE_ATTR_RO(act_freq);
>   
> -static ssize_t cur_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_cur_freq - Get Current requested frequency
> + * @pc: The GuC PC
> + * @freq: A pointer to a u32 where the freq value will be returned
> + *
> + * Returns: 0 on success,
> + *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
> + */
> +int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>   {
> -	struct kobject *kobj = &dev->kobj;
> -	struct xe_gt *gt = kobj_to_gt(kobj);
> -	u32 freq;
> -	ssize_t ret;
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	int ret;
>   
>   	xe_device_mem_access_get(gt_to_xe(gt));
>   	/*
> @@ -432,54 +421,67 @@ static ssize_t cur_freq_show(struct device *dev,
>   	if (ret)
>   		goto out;
>   
> -	freq = xe_mmio_read32(gt, RPNSWREQ);
> +	*freq = xe_mmio_read32(gt, RPNSWREQ);
>   
> -	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
> -	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
> +	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
> +	*freq = decode_freq(*freq);
>   
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   out:
>   	xe_device_mem_access_put(gt_to_xe(gt));
>   	return ret;
>   }
> -static DEVICE_ATTR_RO(cur_freq);
>   
> -static ssize_t rp0_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_rp0_freq - Get the RP0 freq
> + * @pc: The GuC PC
> + *
> + * Returns: RP0 freq.
> + */
> +u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -
> -	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
> +	return pc->rp0_freq;
>   }
> -static DEVICE_ATTR_RO(rp0_freq);
>   
> -static ssize_t rpe_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_rpe_freq - Get the RPe freq
> + * @pc: The GuC PC
> + *
> + * Returns: RPe freq.
> + */
> +u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	struct xe_device *xe = gt_to_xe(gt);
>   
>   	xe_device_mem_access_get(xe);
>   	pc_update_rp_values(pc);
>   	xe_device_mem_access_put(xe);
> -	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
> +
> +	return pc->rpe_freq;
>   }
> -static DEVICE_ATTR_RO(rpe_freq);
>   
> -static ssize_t rpn_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_rpn_freq - Get the RPn freq
> + * @pc: The GuC PC
> + *
> + * Returns: RPn freq.
> + */
> +u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -
> -	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
> +	return pc->rpn_freq;
>   }
> -static DEVICE_ATTR_RO(rpn_freq);
>   
> -static ssize_t min_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_min_freq - Get the min operational frequency
> + * @pc: The GuC PC
> + * @freq: A pointer to a u32 where the freq value will be returned
> + *
> + * Returns: 0 on success,
> + *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
> + */
> +int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	ssize_t ret;
>   
> @@ -503,7 +505,7 @@ static ssize_t min_freq_show(struct device *dev,
>   	if (ret)
>   		goto fw;
>   
> -	ret = sysfs_emit(buf, "%d\n", pc_get_min_freq(pc));
> +	*freq = pc_get_min_freq(pc);
>   
>   fw:
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> @@ -513,17 +515,19 @@ static ssize_t min_freq_show(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
> -			      const char *buff, size_t count)
> +/**
> + * xe_guc_pc_set_min_freq - Set the minimal operational frequency
> + * @pc: The GuC PC
> + * @freq: The selected minimal frequency
> + *
> + * Returns: 0 on success,
> + *         -EAGAIN if GuC PC not ready (likely in middle of a reset),
> + *         -EINVAL if value out of bounds.
> + */
> +int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -	u32 freq;
>   	ssize_t ret;
>   
> -	ret = kstrtou32(buff, 0, &freq);
> -	if (ret)
> -		return ret;
> -
>   	xe_device_mem_access_get(pc_to_xe(pc));
>   	mutex_lock(&pc->freq_lock);
>   	if (!pc->freq_ready) {
> @@ -541,14 +545,20 @@ static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
>   out:
>   	mutex_unlock(&pc->freq_lock);
>   	xe_device_mem_access_put(pc_to_xe(pc));
> -	return ret ?: count;
> +
> +	return ret;
>   }
> -static DEVICE_ATTR_RW(min_freq);
>   
> -static ssize_t max_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_max_freq - Get Maximum operational frequency
> + * @pc: The GuC PC
> + * @freq: A pointer to a u32 where the freq value will be returned
> + *
> + * Returns: 0 on success,
> + *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
> + */
> +int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>   	ssize_t ret;
>   
>   	xe_device_mem_access_get(pc_to_xe(pc));
> @@ -563,7 +573,7 @@ static ssize_t max_freq_show(struct device *dev,
>   	if (ret)
>   		goto out;
>   
> -	ret = sysfs_emit(buf, "%d\n", pc_get_max_freq(pc));
> +	*freq = pc_get_max_freq(pc);
>   
>   out:
>   	mutex_unlock(&pc->freq_lock);
> @@ -571,17 +581,19 @@ static ssize_t max_freq_show(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
> -			      const char *buff, size_t count)
> +/**
> + * xe_guc_pc_set_max_freq - Set the maximum operational frequency
> + * @pc: The GuC PC
> + * @freq: The selected maximum frequency value
> + *
> + * Returns: 0 on success,
> + *         -EAGAIN if GuC PC not ready (likely in middle of a reset),
> + *         -EINVAL if value out of bounds.
> + */
> +int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -	u32 freq;
>   	ssize_t ret;
>   
> -	ret = kstrtou32(buff, 0, &freq);
> -	if (ret)
> -		return ret;
> -
>   	xe_device_mem_access_get(pc_to_xe(pc));
>   	mutex_lock(&pc->freq_lock);
>   	if (!pc->freq_ready) {
> @@ -599,9 +611,8 @@ static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
>   out:
>   	mutex_unlock(&pc->freq_lock);
>   	xe_device_mem_access_put(pc_to_xe(pc));
> -	return ret ?: count;
> +	return ret;
>   }
> -static DEVICE_ATTR_RW(max_freq);
>   
>   /**
>    * xe_guc_pc_c_status - get the current GT C state
> @@ -666,17 +677,6 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>   	return reg;
>   }
>   
> -static const struct attribute *pc_attrs[] = {
> -	&dev_attr_act_freq.attr,
> -	&dev_attr_cur_freq.attr,
> -	&dev_attr_rp0_freq.attr,
> -	&dev_attr_rpe_freq.attr,
> -	&dev_attr_rpn_freq.attr,
> -	&dev_attr_min_freq.attr,
> -	&dev_attr_max_freq.attr,
> -	NULL
> -};
> -
>   static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
> @@ -952,6 +952,10 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> +/**
> + * xe_guc_pc_fini - Finalize GuC's Power Conservation component
> + * @pc: Xe_GuC_PC instance
> + */
>   void xe_guc_pc_fini(struct xe_guc_pc *pc)
>   {
>   	struct xe_device *xe = pc_to_xe(pc);
> @@ -963,7 +967,6 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
>   
>   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
> -	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
>   	mutex_destroy(&pc->freq_lock);
>   }
>   
> @@ -978,7 +981,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_bo *bo;
>   	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> -	int err;
>   
>   	if (xe->info.skip_guc_pc)
>   		return 0;
> @@ -992,10 +994,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   		return PTR_ERR(bo);
>   
>   	pc->bo = bo;
> -
> -	err = sysfs_create_files(gt->sysfs, pc_attrs);
> -	if (err)
> -		return err;
> -
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 054788e006f3..cecad8e9300b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -14,6 +14,16 @@ int xe_guc_pc_start(struct xe_guc_pc *pc);
>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>   int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>   
> +u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
> +int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
> +u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
> +u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
> +u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc);
> +int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
> +int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
> +int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
> +int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
> +
>   enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>   u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
