Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA62C48297
	for <intel-xe@archiver.kernel.org>; Fri,  9 Feb 2024 06:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989AE10E639;
	Fri,  9 Feb 2024 06:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5eU22pX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E6110E5D3
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Feb 2024 06:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707459785; x=1738995785;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+YJWAA25JbXCu0jldQIajZlDsMo5xx6LWMcPbGefPh4=;
 b=d5eU22pXSdjZgoTRIph4rXQ0fzzj7s8YAObHBz4oxfeV/m+JXCzI7eiy
 vhwl+nsyuMZLrCXODNPKWXgLlz5+BN+wCxXgepUo/VaW048emJC+NNJ9p
 ERJxWozu5huzrpebvLla1ygNJWYplDGaEnm8iSAjFCdtz5ON0KUnuowAv
 F+aFisoWVqPdPqzYKvHlHVE8xdykz9UGarl4qCC3mOxdnrtIVI3pXy4YX
 IoKf59NifLLvx/+FFF87135aMvKRJYrn5GUN/M6wGuVZPgqi01cvvbWwU
 YWfpC5P/dVB+cCCNqbGv3PYzOtku0Wi75A4kw/olU2IR1HYuGu8L/aZ36 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="26829864"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; d="scan'208";a="26829864"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 22:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="6638926"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 22:23:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 22:23:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 22:23:04 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 22:23:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k33NCY+X2k0mk6r6W6ipZeyeWcIFQcj0OujlwwSiGUnHFvzi+C44axIpHQEvK50SReYnwS3KcEzFeYfl4yl7DMRnXdRhymFL2pLtBAQXLZP8WdMtnhTdnsIUXJiEyDg2QTB/WoPi3Z37mWs4Ww+inHhGizdzqQwbYTdzUTIVwkMBuRlGIx6W9+0icm4wKRWpalsNP6e8GzDNayGYQWrkkRKewfzBwsKy3PN4FkzCvoLnIUwLwfHtw/tXSl9PFP/2zHsme8qPiHshrQIZKANoMqLJc5KEAShYzN9G+2XTZxATr4AjX1AGlt2rv0BdPZoFTVJqo+TjbLLRAkNb1rLvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dda9/3AQNEBHAE/Gz3ImGT5OfXrxIC38AnYD09/nq9c=;
 b=SPHc/mR5dv7ON+Mko6X1BhwzWzxrw2vZPntu0WS7/27emjQnZ4VuIP7qXENbs/MCJDdgY0oKoRp0+9e5fAySxSXavGWRHLkga4ad5nMi/BH0xP1rLx/TPro6RHY9bYXXk6ajfNjsaUq7/6GpXLkzAwxR9DMx0iZH0yYBQHYB8I2q8D2uRs1SstmnRtHhycKaAGDKTd6a5P8yIeXrqsuo2THFDc1KlcSrJvEc1qruaZAaHGU6zGRwGa96am/HwE7lSlE9yzp93uJEBa9ePO0CUbxoTIW9MADMkBByrDbiiRqFVUrScuL482WNv/ndEw6bF5GC07gqJUGAt1SAhvAybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Fri, 9 Feb
 2024 06:23:00 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::85a8:9b9b:5e2f:9431]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::85a8:9b9b:5e2f:9431%4]) with mapi id 15.20.7249.035; Fri, 9 Feb 2024
 06:23:00 +0000
Message-ID: <c16fd9ed-95d4-4a4d-a57f-06f19c7b6d6f@intel.com>
Date: Fri, 9 Feb 2024 08:23:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] drm/xe/oa: OA stream initialization (OAG)
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240208054916.3788133-1-ashutosh.dixit@intel.com>
 <20240208054916.3788133-8-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20240208054916.3788133-8-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::8) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|PH0PR11MB4869:EE_
X-MS-Office365-Filtering-Correlation-Id: 5629b91c-3886-4a10-70c9-08dc2937906e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmcn7pmcFygRPTq18bzfB9yvVHBSylEuZS5IWPi4fhp8F6M9voVTGw7hgTX6CL8vks5EavXuz1YIIdXWSw81IJipD8MGC1Q/G8WjUfBI4uA04KDtmIHvMlEmLv+J9T+T08h0lmVPqHNS8BSPTp7KuWrUnJRE4ut4t7nvJFIqtTvPlKQ8pZy5Pm3UTA/GktEWCZj8n+ZxIDssJ54Dx+2p5Dtwak4Egc2XVr/GY5brZQT10RXLIga45bafZFsJbjb27XpQ8DD6eXVprofxuWVngKbkOo0chZ0BqF+oXgnkzVYQzqr9cLyKBsz0E+RKZBdFSxyVf1/7cj3xNrKiD3gqCCTCDm2uzRwfp4uEfcPLYU3g/XyiX2AdvBwmWI0l0LAzwkXJHqlRYb2weL0p3uHsqXwq8uDDewuebH1X5p84i16hNnefyT4Mh3IMVFs4h0lASdCLcYUE8gjoL0iN9Zm105Q6weP+27gMUwnSJwnn2Hl3mQw7LBTIZ7kwptSqdJhPMgvQytb4AUdDN0mUVp86SEdYfuy0CCv/pB2/a+hvpUrHVs3hQIikVw4JbRmkmJ6v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(86362001)(82960400001)(31696002)(31686004)(41300700001)(2906002)(30864003)(26005)(2616005)(107886003)(316002)(6666004)(83380400001)(6506007)(53546011)(6486002)(478600001)(6512007)(36756003)(8676002)(5660300002)(4326008)(8936002)(66476007)(66946007)(66556008)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUJEb1BNYWZLZ1NEYUQvRFY1cUZJNW5kY1kwdUNiamxmWFlQR21Ka2VlUzMx?=
 =?utf-8?B?bUdoTEtlR0NhQWFFemEvUmxPMW41U25ycUxOeGllaUU3dm1IRmhaMUNPcGhw?=
 =?utf-8?B?dW9nNE1lZldicXdnNVdrc0w0QzMwT0VKSUs5TjlRTzd5azcrM1QrWmVSNEZw?=
 =?utf-8?B?TG9rTWFaQitqOGNzUERzcGRYZ3d2Yi9yZkhEUGhDTW51VGFHRHNDMnpCbU1m?=
 =?utf-8?B?QTRpS3AzZWltM0VrWGZZQUNWajc5clJYRkdUWnZ2a2xiUzd6eDgwNEQrWi9I?=
 =?utf-8?B?cDZKM3Q5NDdKRWRRVVpMK3VlVGRmL2lXV0xZdng3V3VxeGh3cnN3aTNIdUYy?=
 =?utf-8?B?UkJ5akp5ZnBjN3NtOStsVTJtdVBCaTNVSUMxT0xvNlBkZ1E1Z0RjMlNrMG9X?=
 =?utf-8?B?WkdiQU1LUkNrelpuTElhaVAvN3diSnVFcG9aSmN2RG5LQjJUckJ0RmFyUXhG?=
 =?utf-8?B?czZmRHJlK1NRSlJ0bmlSc01oZzZYTzhIa1FNZytPMllpYm1yNU1NdUlDVThy?=
 =?utf-8?B?OUdTaG5CUUhoemVtd1ZuZVVtUWxqeE5BNlBsdTI1eWZyYm5QN0xlQTRiY2Rj?=
 =?utf-8?B?RGlqaTRQNDExUEN5Zkk3Y0doT0h1b3NlVTVrNnpldHVvN25NN3lwQzFRSkRu?=
 =?utf-8?B?Z2lRbnFQS1E2RmVtRG9FOTRzMlJWaGFVcVJCZlpmOGZEKzBaWWNEK3U1L3ll?=
 =?utf-8?B?QU1IbWtBdWxqNGtlMi9KZisyaWp4bFlVRkZqV2hTUFlSYmVtNHVQWU1xSDFS?=
 =?utf-8?B?RVRvTWxrZFRldzJUczA4MkltbXFTR2lMcDZXR0Q5Y2c1aEpRNW5zeksrZVI1?=
 =?utf-8?B?aEVWU1pEcFlMVUc0UFJrREdkVnJ6cVdKYVVKenhZdHdzUkFWOHhhWkJPb2RJ?=
 =?utf-8?B?MXhYbm45TnJrMXRZc3I5TEpTS05KeXllNlREclZad2hrTWVVYmpFS2VzQkgr?=
 =?utf-8?B?WkxtOFU0L1FzNjc5YlJpSG56OEZiRlIyNUpGMUlxU0x3SmhaK1BENnE5bXVI?=
 =?utf-8?B?ektjck5kc1lsTjRqREE5V1VzNUpLNnpXclhyQXBVZXZxRnJJaGd0ZTJIRzd2?=
 =?utf-8?B?eTRIeVVmbVdhemVtelFpcXRibUw1bkhwL1JjdUhYS0hXK3lNaWpUKzBFQUVM?=
 =?utf-8?B?aUJlc0xmSG5BNW85WW5wb1p1dURXTmJ0REZwM0dWZmhQY2dWZyt3dmVVSmQ2?=
 =?utf-8?B?K2luN1RLaDVhRkR1UGZvbG53Y1ZrOVRSYndPdmlFSVd6V1B4SXdWUVNrZjl6?=
 =?utf-8?B?WmJlaVVNQVgwMnJ5QzFDRmxTa2VvVjBKNTRaeHNWTU90czRhNDNQeG9CS3pQ?=
 =?utf-8?B?Q1l6UUltMWNiY0V3MmNwcmg1Nms1Tll5M0lzUjJ0aFNscmo1VmlJTG95YzdG?=
 =?utf-8?B?WitWWkI3Q2VJdlVDOHpXVjJYdGRkVmttcER1ZTlEUjY5YTc2MldIVFdKV1RH?=
 =?utf-8?B?ZkFJdjlqRmJLaDdyTlFNeXlYUU0zVmFUaEFHVTc3T3lvVTRLcmV0alhDdlRC?=
 =?utf-8?B?WE5oTDM3WEdSTFNVajl5Q3hRNmVLeG1sWHlLa2dTZ2VyRTh0UERzSzUwdVBG?=
 =?utf-8?B?UTFKUXg2MjhwOWw0NnBFYk1mL1oyaHVzZ2VXRzEyTi92eXIrd2dUZjczUXZL?=
 =?utf-8?B?NndzVTIzSy9TUms4K0ovMFR6cFNFS1cxd0FGYmx5dTE1RHJteXBkZDRhT0Vt?=
 =?utf-8?B?b2xZSkpSa3RYL3NRS2pQWjJHU1dORHJQRjRMdkFLTjB0QXNBdml3M2ZKcVNL?=
 =?utf-8?B?eGRCR015NzJ1eFlPeDI1a21OQXV3WmpFZnNleHQrbHltNmp6VWpsU3NwN2Fn?=
 =?utf-8?B?VzFRNFBkT0g4T0lmRmhHdFE3STcvT1cyY3VXTjA2N3NNVUU2ZjlTb1R2K2gy?=
 =?utf-8?B?OC9Db3MxOVVucVNhdlE0cVpzSU1Fd05ZRjlscVdLM1hDTDh3ZHRkbGQxODU3?=
 =?utf-8?B?U290cXdQR2N2ZGFFTFd0bXhmVllWb1Vsa1ovYncxNnFCMXR1cGliWUVKcno2?=
 =?utf-8?B?UHpSUGVNRVd2UDM3WXYyQ09MQUs2QlhJSGZqTHFJcmlHeHdzVldBbFdDQUFq?=
 =?utf-8?B?NW14Sm5rRUgwV0V0U2VWNnBGUnFjSytFUDRWYi9Bd1M0bGZ3dnFDd0RvM2V6?=
 =?utf-8?B?Mi9vMzk1NUZuWmM3NnFOSGxtRGdLSmlMc2J4OW5zMzd5SXZjZUJVazFGVG1M?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5629b91c-3886-4a10-70c9-08dc2937906e
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 06:23:00.3978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2AV/zGJ2QK6lfiVavO18uZwA3GklsEeewmM/01cM7RIkNnV+Bac2zDnD7p/aSKnKetbmZ3zuEIpqJBT2vd4ejXGJI9F8m6qmE1I+echyWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4869
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

On 08/02/2024 07:49, Ashutosh Dixit wrote:
> Implement majority of OA stream initialization (as part of OA stream open)
> ioctl). OAG buffer is allocated for receiving perf counter samples from
> HW. OAG unit is initialized and the selected OA metric configuration is
> programmed into OAG unit HW using a command/batch buffer.
>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |   3 +
>   drivers/gpu/drm/xe/xe_oa.c           | 391 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_oa_types.h     |  79 ++++++
>   3 files changed, 473 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 15ac2d284d48f..853d6f9db8a99 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -134,6 +134,8 @@
>   
>   #define SQCNT1					XE_REG_MCR(0x8718)
>   #define XELPMP_SQCNT1				XE_REG(0x8718)
> +#define   SQCNT1_PMON_ENABLE			REG_BIT(30)
> +#define   SQCNT1_OABPC				REG_BIT(29)
>   #define   ENFORCE_RAR				REG_BIT(23)
>   
>   #define XEHP_SQCM				XE_REG_MCR(0x8724)
> @@ -357,6 +359,7 @@
>   #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>   #define   UGM_BACKUP_MODE			REG_BIT(13)
>   #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> +#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
>   #define   EARLY_EOT_DIS				REG_BIT(1)
>   
>   #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 915dd71454c7c..f3270fc30065f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -5,17 +5,25 @@
>   
>   #include <linux/nospec.h>
>   
> +#include <drm/drm_drv.h>
>   #include <drm/xe_drm.h>
>   
> +#include "instructions/xe_mi_commands.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_oa_regs.h"
>   #include "xe_device.h"
>   #include "xe_exec_queue.h"
> +#include "xe_bb.h"
> +#include "xe_bo.h"
>   #include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>   #include "xe_mmio.h"
>   #include "xe_oa.h"
> +#include "xe_sched_job.h"
>   #include "xe_perf.h"
>   
> +#define DEFAULT_POLL_FREQUENCY_HZ 200
> +#define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
>   #define XE_OA_UNIT_INVALID U32_MAX
>   
>   struct xe_oa_reg {
> @@ -53,6 +61,13 @@ struct xe_oa_open_param {
>   	struct xe_hw_engine *hwe;
>   };
>   
> +struct xe_oa_config_bo {
> +	struct llist_node node;
> +
> +	struct xe_oa_config *oa_config;
> +	struct xe_bb *bb;
> +};
> +
>   #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>   
>   static const struct xe_oa_format oa_formats[] = {
> @@ -95,6 +110,378 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
>   	kref_put(&oa_config->ref, xe_oa_config_release);
>   }
>   
> +static struct xe_oa_config *xe_oa_config_get(struct xe_oa_config *oa_config)
> +{
> +	return kref_get_unless_zero(&oa_config->ref) ? oa_config : NULL;
> +}
> +
> +static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, int metrics_set)
> +{
> +	struct xe_oa_config *oa_config;
> +
> +	rcu_read_lock();
> +	oa_config = idr_find(&oa->metrics_idr, metrics_set);
> +	if (oa_config)
> +		oa_config = xe_oa_config_get(oa_config);
> +	rcu_read_unlock();
> +
> +	return oa_config;
> +}
> +
> +static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo)
> +{
> +	xe_oa_config_put(oa_bo->oa_config);
> +	xe_bb_free(oa_bo->bb, NULL);
> +	kfree(oa_bo);
> +}
> +
> +static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
> +{
> +	return &stream->hwe->oa_unit->regs;
> +}
> +
> +static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
> +{
> +	struct xe_sched_job *job;
> +	struct dma_fence *fence;
> +	long timeout;
> +	int err = 0;
> +
> +	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
> +	job = xe_bb_create_job(stream->k_exec_q, bb);
> +	if (IS_ERR(job)) {
> +		err = PTR_ERR(job);
> +		goto exit;
> +	}
> +
> +	xe_sched_job_arm(job);
> +	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +	dma_fence_put(fence);
> +	if (timeout < 0)
> +		err = timeout;
> +	else if (!timeout)
> +		err = -ETIME;
> +exit:
> +	return err;
> +}
> +
> +static void write_cs_mi_lri(struct xe_bb *bb, const struct xe_oa_reg *reg_data, u32 n_regs)
> +{
> +	u32 i;
> +
> +#define MI_LOAD_REGISTER_IMM_MAX_REGS (126)
> +
> +	for (i = 0; i < n_regs; i++) {
> +		if ((i % MI_LOAD_REGISTER_IMM_MAX_REGS) == 0) {
> +			u32 n_lri = min_t(u32, n_regs - i,
> +					  MI_LOAD_REGISTER_IMM_MAX_REGS);
> +
> +			bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(n_lri);
> +		}
> +		bb->cs[bb->len++] = reg_data[i].addr.addr;
> +		bb->cs[bb->len++] = reg_data[i].value;
> +	}
> +}
> +
> +static int num_lri_dwords(int num_regs)
> +{
> +	int count = 0;
> +
> +	if (num_regs > 0) {
> +		count += DIV_ROUND_UP(num_regs, MI_LOAD_REGISTER_IMM_MAX_REGS);
> +		count += num_regs * 2;
> +	}
> +
> +	return count;
> +}
> +
> +static void xe_oa_free_oa_buffer(struct xe_oa_stream *stream)
> +{
> +	xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
> +}
> +
> +static void xe_oa_free_configs(struct xe_oa_stream *stream)
> +{
> +	struct xe_oa_config_bo *oa_bo, *tmp;
> +
> +	xe_oa_config_put(stream->oa_config);
> +	llist_for_each_entry_safe(oa_bo, tmp, stream->oa_config_bos.first, node)
> +		free_oa_config_bo(oa_bo);
> +}
> +
> +#define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
> +
> +static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
> +{
> +	u32 sqcnt1;
> +
> +	/*
> +	 * Wa_1508761755:xehpsdv, dg2
> +	 * Enable thread stall DOP gating and EU DOP gating.
> +	 */
> +	if (stream->oa->xe->info.platform == XE_DG2) {
> +		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
> +					  _MASKED_BIT_DISABLE(STALL_DOP_GATING_DISABLE));
> +		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
> +					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
> +	}
> +
> +	/* Make sure we disable noa to save power. */
> +	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
> +
> +	sqcnt1 = SQCNT1_PMON_ENABLE |
> +		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
> +
> +	/* Reset PMON Enable to save power. */
> +	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, sqcnt1, 0);
> +}
> +
> +static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
> +{
> +	struct xe_bo *bo;
> +
> +	BUILD_BUG_ON_NOT_POWER_OF_2(XE_OA_BUFFER_SIZE);
> +	BUILD_BUG_ON(XE_OA_BUFFER_SIZE < SZ_128K || XE_OA_BUFFER_SIZE > SZ_16M);
> +
> +	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
> +				  XE_OA_BUFFER_SIZE, ttm_bo_type_kernel,
> +				  XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	stream->oa_buffer.bo = bo;
> +	stream->oa_buffer.vaddr = bo->vmap.vaddr;
> +	return 0;
> +}
> +
> +static struct xe_oa_config_bo *
> +__xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_config)
> +{
> +	struct xe_oa_config_bo *oa_bo;
> +	size_t config_length;
> +	struct xe_bb *bb;
> +
> +	oa_bo = kzalloc(sizeof(*oa_bo), GFP_KERNEL);
> +	if (!oa_bo)
> +		return ERR_PTR(-ENOMEM);
> +
> +	config_length = num_lri_dwords(oa_config->regs_len);
> +	config_length = ALIGN(sizeof(u32) * config_length, XE_PAGE_SIZE) / sizeof(u32);
> +
> +	bb = xe_bb_new(stream->gt, config_length, false);
> +	if (IS_ERR(bb))
> +		goto err_free;
> +
> +	write_cs_mi_lri(bb, oa_config->regs, oa_config->regs_len);
> +
> +	oa_bo->bb = bb;
> +	oa_bo->oa_config = xe_oa_config_get(oa_config);
> +	llist_add(&oa_bo->node, &stream->oa_config_bos);
> +
> +	return oa_bo;
> +err_free:
> +	kfree(oa_bo);
> +	return ERR_CAST(bb);
> +}
> +
> +static struct xe_oa_config_bo *xe_oa_alloc_config_buffer(struct xe_oa_stream *stream)
> +{
> +	struct xe_oa_config *oa_config = stream->oa_config;
> +	struct xe_oa_config_bo *oa_bo;
> +
> +	/* Look for the buffer in the already allocated BOs attached to the stream */
> +	llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
> +		if (oa_bo->oa_config == oa_config &&
> +		    memcmp(oa_bo->oa_config->uuid, oa_config->uuid,
> +			   sizeof(oa_config->uuid)) == 0)
> +			goto out;
> +	}
> +
> +	oa_bo = __xe_oa_alloc_config_buffer(stream, oa_config);
> +out:
> +	return oa_bo;
> +}
> +
> +static int xe_oa_emit_oa_config(struct xe_oa_stream *stream)
> +{
> +#define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> +	struct xe_oa_config_bo *oa_bo;
> +	int err, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
> +
> +	oa_bo = xe_oa_alloc_config_buffer(stream);
> +	if (IS_ERR(oa_bo)) {
> +		err = PTR_ERR(oa_bo);
> +		goto exit;
> +	}
> +
> +	err = xe_oa_submit_bb(stream, oa_bo->bb);
> +
> +	/* Additional empirical delay needed for NOA programming after registers are written */
> +	usleep_range(us, 2 * us);


Looks like the entire oa_config emission is synchronous.

That's a difference from i915 where we could just pipeline all the 
config changes with perf queries in between.

If there was a mechanism to return a syncobj in this ioctl, we could do 
the wait from userspace and/or pipeline more submissions.


-Lionel


> +exit:
> +	return err;
> +}
> +
> +static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
> +{
> +	/* If user didn't require OA reports, ask HW not to emit ctx switch reports */
> +	return _MASKED_FIELD(OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS,
> +			     stream->sample ?
> +			     0 : OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS);
> +}
> +
> +static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
> +{
> +	u32 oa_debug, sqcnt1;
> +
> +	/*
> +	 * Wa_1508761755:xehpsdv, dg2
> +	 * EU NOA signals behave incorrectly if EU clock gating is enabled.
> +	 * Disable thread stall DOP gating and EU DOP gating.
> +	 */
> +	if (stream->oa->xe->info.platform == XE_DG2) {
> +		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
> +					  _MASKED_BIT_ENABLE(STALL_DOP_GATING_DISABLE));
> +		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
> +					  _MASKED_BIT_ENABLE(DISABLE_DOP_GATING));
> +	}
> +
> +	/* Disable clk ratio reports */
> +	oa_debug = OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS |
> +		OAG_OA_DEBUG_INCLUDE_CLK_RATIO;
> +
> +	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
> +			_MASKED_BIT_ENABLE(oa_debug) |
> +			oag_report_ctx_switches(stream));
> +
> +	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
> +			(OAG_OAGLBCTXCTRL_COUNTER_RESUME |
> +			 OAG_OAGLBCTXCTRL_TIMER_ENABLE |
> +			 REG_FIELD_PREP(OAG_OAGLBCTXCTRL_TIMER_PERIOD_MASK,
> +					stream->period_exponent)) : 0);
> +
> +	/*
> +	 * Initialize Super Queue Internal Cnt Register
> +	 * Set PMON Enable in order to collect valid metrics
> +	 * Enable bytes per clock reporting
> +	 */
> +	sqcnt1 = SQCNT1_PMON_ENABLE |
> +		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
> +
> +	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, 0, sqcnt1);
> +
> +	return xe_oa_emit_oa_config(stream);
> +}
> +
> +static int xe_oa_stream_init(struct xe_oa_stream *stream,
> +			     struct xe_oa_open_param *param)
> +{
> +	struct xe_oa_unit *u = param->hwe->oa_unit;
> +	struct xe_gt *gt = param->hwe->gt;
> +	int ret;
> +
> +	stream->exec_q = param->exec_q;
> +	stream->poll_period_ns = DEFAULT_POLL_PERIOD_NS;
> +	stream->hwe = param->hwe;
> +	stream->gt = stream->hwe->gt;
> +	stream->oa_buffer.format = &stream->oa->oa_formats[param->oa_format];
> +
> +	stream->sample = param->sample;
> +	stream->periodic = param->period_exponent > 0;
> +	stream->period_exponent = param->period_exponent;
> +
> +	stream->oa_config = xe_oa_get_oa_config(stream->oa, param->metric_set);
> +	if (!stream->oa_config) {
> +		drm_dbg(&stream->oa->xe->drm, "Invalid OA config id=%i\n", param->metric_set);
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	ret = xe_oa_alloc_oa_buffer(stream);
> +	if (ret)
> +		goto err_free_configs;
> +
> +	/* Take runtime pm ref and forcewake to disable RC6 */
> +	xe_device_mem_access_get(stream->oa->xe);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +
> +	stream->k_exec_q = xe_exec_queue_create(stream->oa->xe, NULL,
> +						BIT(stream->hwe->logical_instance), 1,
> +						stream->hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
> +	if (IS_ERR(stream->k_exec_q)) {
> +		ret = PTR_ERR(stream->k_exec_q);
> +		drm_err(&stream->oa->xe->drm, "gt%d, hwe %s, xe_exec_queue_create failed=%d",
> +			stream->gt->info.id, stream->hwe->name, ret);
> +		goto err_fw_put;
> +	}
> +
> +	ret = xe_oa_enable_metric_set(stream);
> +	if (ret) {
> +		drm_dbg(&stream->oa->xe->drm, "Unable to enable metric set\n");
> +		goto err_put_k_exec_q;
> +	}
> +
> +	drm_dbg(&stream->oa->xe->drm, "opening stream oa config uuid=%s\n",
> +		stream->oa_config->uuid);
> +
> +	WRITE_ONCE(u->exclusive_stream, stream);
> +
> +	spin_lock_init(&stream->oa_buffer.ptr_lock);
> +	mutex_init(&stream->stream_lock);
> +
> +	return 0;
> +
> +err_put_k_exec_q:
> +	xe_oa_disable_metric_set(stream);
> +	xe_exec_queue_put(stream->k_exec_q);
> +err_fw_put:
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_device_mem_access_put(stream->oa->xe);
> +	xe_oa_free_oa_buffer(stream);
> +err_free_configs:
> +	xe_oa_free_configs(stream);
> +exit:
> +	return ret;
> +}
> +
> +static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> +					  struct xe_oa_open_param *param)
> +{
> +	struct xe_oa_stream *stream;
> +	int stream_fd;
> +	int ret;
> +
> +	/* We currently only allow exclusive access */
> +	if (param->hwe->oa_unit->exclusive_stream) {
> +		drm_dbg(&oa->xe->drm, "OA unit already in use\n");
> +		ret = -EBUSY;
> +		goto exit;
> +	}
> +
> +	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> +	if (!stream) {
> +		ret = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	stream->oa = oa;
> +	ret = xe_oa_stream_init(stream, param);
> +	if (ret)
> +		goto err_free;
> +
> +	/* Hold a reference on the drm device till stream_fd is released */
> +	drm_dev_get(&stream->oa->xe->drm);
> +
> +	return stream_fd;
> +err_free:
> +	kfree(stream);
> +exit:
> +	return ret;
> +}
> +
>   /*
>    * OA timestamp frequency = CS timestamp frequency in most platforms. On some
>    * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
> @@ -416,6 +803,10 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file
>   		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
>   		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_freq_hz);
>   	}
> +
> +	mutex_lock(&param.hwe->gt->oa.gt_lock);
> +	ret = xe_oa_stream_open_ioctl_locked(oa, &param);
> +	mutex_unlock(&param.hwe->gt->oa.gt_lock);
>   err_exec_q:
>   	if (ret < 0 && param.exec_q)
>   		xe_exec_queue_put(param.exec_q);
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index 594e38c6328d2..539830f5f0b24 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -14,6 +14,8 @@
>   #include <drm/xe_drm.h>
>   #include "regs/xe_reg_defs.h"
>   
> +#define XE_OA_BUFFER_SIZE SZ_16M
> +
>   enum xe_oa_report_header {
>   	HDR_32_BIT = 0,
>   	HDR_64_BIT,
> @@ -141,4 +143,81 @@ struct xe_oa {
>   	/** @oa_unit_ids: tracks oa unit ids assigned across gt's */
>   	u16 oa_unit_ids;
>   };
> +
> +/** @oa_buffer: State of the stream OA buffer */
> +struct oa_buffer {
> +	/** @format: data format */
> +	const struct xe_oa_format *format;
> +
> +	/** @format: xe_bo backing the OA buffer */
> +	struct xe_bo *bo;
> +
> +	/** @vaddr: mapped vaddr of the OA buffer */
> +	u8 *vaddr;
> +
> +	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
> +	spinlock_t ptr_lock;
> +
> +	/** @head: Cached head to read from */
> +	u32 head;
> +
> +	/** @tail: The last verified cached tail where HW has completed writing */
> +	u32 tail;
> +};
> +
> +/**
> + * struct xe_oa_stream - state for a single open stream FD
> + */
> +struct xe_oa_stream {
> +	/** @oa: xe_oa backpointer */
> +	struct xe_oa *oa;
> +
> +	/** @gt: gt associated with the oa stream */
> +	struct xe_gt *gt;
> +
> +	/** @hwe: hardware engine associated with this oa stream */
> +	struct xe_hw_engine *hwe;
> +
> +	/** @lock: Lock serializing stream operations */
> +	struct mutex stream_lock;
> +
> +	/** @sample: true if DRM_XE_OA_PROP_SAMPLE_OA is provided */
> +	bool sample;
> +
> +	/** @exec_q: Exec queue corresponding to DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID */
> +	struct xe_exec_queue *exec_q;
> +
> +	/** @k_exec_q: kernel exec_q used for OA programming batch submissions */
> +	struct xe_exec_queue *k_exec_q;
> +
> +	/** @enabled: Whether the stream is currently enabled */
> +	bool enabled;
> +
> +	/** @oa_config: OA configuration used by the stream */
> +	struct xe_oa_config *oa_config;
> +
> +	/** @oa_config_bos: List of struct @xe_oa_config_bo's */
> +	struct llist_head oa_config_bos;
> +
> +	/** @poll_check_timer: Timer to periodically check for data in the OA buffer */
> +	struct hrtimer poll_check_timer;
> +
> +	/** @poll_wq: Wait queue for waiting for OA data to be available */
> +	wait_queue_head_t poll_wq;
> +
> +	/** @pollin: Whether there is data available to read */
> +	bool pollin;
> +
> +	/** @periodic: Whether periodic sampling is currently enabled */
> +	bool periodic;
> +
> +	/** @period_exponent: OA unit sampling frequency is derived from this */
> +	int period_exponent;
> +
> +	/** @oa_buffer: OA buffer for the stream */
> +	struct oa_buffer oa_buffer;
> +
> +	/** @poll_period_ns: hrtimer period for checking OA buffer for available data */
> +	u64 poll_period_ns;
> +};
>   #endif


