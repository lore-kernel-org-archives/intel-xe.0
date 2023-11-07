Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9573AC4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 23:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8B710E04B;
	Tue,  7 Nov 2023 23:46:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D71210E04B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699400807; x=1730936807;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V2L5Rsc7IKD29fLuQlI1uBzvyKCQgLyddFmtTPBuacU=;
 b=Da0Wuu97CXesAdzCEKfas0derxZNSe8Vz+rzUI86gArSGkqQ6yUeqy7O
 Md/oWpqETiZT5NWL4oOsi1eqVnAWTOpHfML+jlNnFONivVBJuYXAabiD0
 xVu7gAcEaywRGfhx7J8BsGlzLYlB4W9Yzz03QtHNvcv3pieAzU/QlbjrU
 +ec2B0uw1MpXmQYc+JbuuWVyTYwQ/JWKlwQAqGL9v4QmPIKMUPvy1D7tk
 Zf40dnIwXZTdbuyqI4CSdPo9DqDKPIK3kmG5ebZO7R82HCrL62WFOMWPJ
 vOfTwR+5vslWhIdeoxlNJwvOHDSdGZD7HVN6MV5+lneW5JSs0sI1uwBAP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456146588"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="456146588"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 15:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="766477942"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="766477942"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 15:46:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:46:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 15:46:45 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 15:46:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0tEyTf1XpgExoRlK8sRc99x75TB6YPEuWG+uJ4T2QSA3F+Nh+YIEAeL/36QCgq/HuiDlfrFwOfaeyjbnEq/O6vEOAB0rKcNHK9R8K7I5NrFn+Yi+GghZYL4FtUEmiKaYFATMrBDsamTbom35X+UKrpwLJkZZ2ShIUK1a2zw3dha/w0UI6yxONOzT8sh0bK7UuDfNUmyD5FRR1o+UdcgfiyCpOQW0/XnFtATZz+p4Zc/e0842ZOQNECxC8svEjUOvQ5MBLDyASezjAxAfhkcjwUQ5bcgV8YMYuG1DH67bRBu+mgwehQp6WjuwrcaoQevD7+H+sLP2LJl4CHMs/IMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScSLUBY6FWOCpsPtSohI8T57bDA82OCISapvJKSWoHQ=;
 b=ElJ0vHvaPrBXq/tGeTh17NoUtjNPQ6cc7rLu9DUNSx/iPIAl/YqkFN9cG2g4gXqPUdsU8zPtYlgTalOmqVGai2lBS1DKeD6OUG6O+/W4PcBfVXMnlPQpLmNDMF770viS0udVe8hY43Nzkvr72GudoZwam2v5/bNgdXFrZB+49GnqEXpgb57QZdWjzcDB5go90Pfgd0qaLhJwbk0SY76WcNS3AXGBkJsn6DjtNhr6GPzg2Pd4Pblfr47XhD/yLwlgkvDqQpM+ms7Dz2dPxYPN9GIn1thq+i0vGdGCLmgTg01bXSuRci1GBth/thGJBXj0dADTCXAizgj7knmVbbH6uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB6872.namprd11.prod.outlook.com (2603:10b6:806:2b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 23:46:38 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 23:46:38 +0000
Message-ID: <c645d629-0d1d-4f3a-9199-6edcb3745739@intel.com>
Date: Tue, 7 Nov 2023 15:46:37 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-2-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:303:b6::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA1PR11MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c363f6e-52e4-466f-b4e8-08dbdfebc869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +glYovcHg0QNPVQFisEki0vA5tbYVtbXIHqEzF2sLO5GvA7iM+BmTwlX0yG/6U3g73pVDRNQWC3oecBFAoqIlIoaGm1yctdPYNi1z4XwdlSpRCM9h+Q1oWILEsqmg2uQ0vK9Pfc2xhdVwa219R6n4Ub4vVwfCXTjT5QKcMgsaf0pJP8DqhVDpyrEznTyo1U/q5WX5qbNZo4LIyBDpz2IBRqCOtSFqv6G8ZbLWzsM8I/dZ9xk7NlEi2hrXlCBPb1TK290SUwLRbE3LeEmyM5I7fdzYeYMpzVtYOmztyG36vIjZisio6lkJjrb6QLNQMUaihPwKVTd01xiL1fhWxqPTSmT0c1zUlvHmkW7I2snKJJaw4cdgdiJVOUGaV9/VDLlwO9ko4vYIlW7/CdvPmTEU5BxELDI5stxKMA7xeyHElP+EKxIr548b4fnftM3hVzVj2z/+J1phLCV5Ah6u2KfMBF5geBc+FWZSJ8aNoRdvupLwZCfBm+CZdJKM1EsJ6OiGABhCsXmHMTaXUNisMFvNsL+4Wk0WT7bl97n2EZW5/ouMS3pv3pA/Xp8VLwOIjht0tA3ubFaP1j1PmrBm8TsUXc+7067YsLM1x4rlrMnrJBTXbxafLHDPAhmgrZzU78jaxhnCDn15Vf3Q6PXPiBsbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(376002)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(38100700002)(478600001)(6506007)(6512007)(53546011)(6486002)(2616005)(83380400001)(5660300002)(26005)(8936002)(2906002)(107886003)(66476007)(66556008)(41300700001)(66946007)(4326008)(316002)(8676002)(36756003)(82960400001)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlAyWmJaNDUxUWR2ZFFuVVc2QXR4bzR5alNFbUdPRG1xTGxRbldrUUxwNWdL?=
 =?utf-8?B?QkwxMWFYcloxOU0xS3FXN2o1SW03QmFxWnI3WEdyUWVCWkVRcHc4VmVoa0lm?=
 =?utf-8?B?NGh2Q0hvcDhFZExiaThGNnJBZXZXc2RZV1Frb245K3BobTc4L3NyLzhFWnlz?=
 =?utf-8?B?Sk9nSG1GOE5tSVpnU01oNjhFY2Q0REZya2QxRzNpc2dkdGpSWmEwRkJYNkJF?=
 =?utf-8?B?ZHVuKzU3WnVtSXpCVVM4ME9vSFRlenFJVnpibDhDbkwwbGVLazJIVDZPQjlP?=
 =?utf-8?B?Z1pqSkw2R2JpT3Fib2VUQ01wSlZUSXl6U0pqc29FZ3dybE44aXJ5OEd6K2N1?=
 =?utf-8?B?WlRndmduczJaY1NJWGl0SGdkejlKTC9jYWdLa3J0VnNkbk5XMU83MWVQRjh2?=
 =?utf-8?B?RndZSkhNeEV6dVFUSC9EdytBbUpCeXJVOVU4OUFWZmFWUXhaV1F0dzNmMjdn?=
 =?utf-8?B?MWRoMDhZV2NIdnRDMUxCcDc4UWRaOXM5WW9aZHI1L3JQNWhueUJ4ZlhHSUFU?=
 =?utf-8?B?YUpMWWxYaGlHdEdZL1JreVgzSGl0QmxYWGRBcUZ6VTFyMHNXYUJ3U1hDKyty?=
 =?utf-8?B?YjdIcm1wUmRqOVhlZTZCQU8vY2kzcHhGdzhhdm94OStVSVVuaHBBTmVkY3Nr?=
 =?utf-8?B?dC9KRDFrNEJ2bDh6NlpySlJ6YVlWdlJjdGkwU3NBd202UXA3TStGdzR5dC8r?=
 =?utf-8?B?a0tUOHN4QUZSSzRtaUdocEh2VEVaUEs1VjROcFpiL01SZVFkS2VkWTFKTGY2?=
 =?utf-8?B?ZHNtcXczekNIS3o2OE92L1RWNDJ1K1hHK294YjJXWU1qR2JjQmJQcTEyNDdY?=
 =?utf-8?B?amJlYllLYWVKc0VjMjl2S0lVTnh4cGo0a29qS1pRUmdJMmU5MmdNeGwxSEx6?=
 =?utf-8?B?ZlJVSnM0L1Y5a1NXY2dXTGpycmIycTJ5aEtqRWhRQTg4RlpRMjB6R3F1S0dt?=
 =?utf-8?B?YVdXNmVrNmh3WHpyWnk1WFdzNGQ0ZE5XS005WU9VbE5uU2FpQjN4V01ORk5j?=
 =?utf-8?B?U2p2ZGkwYXIweFN3Y1lCZ3hvT3hhZmNsOGhOanN3Z0grYkZDR2d0RmxCOTRp?=
 =?utf-8?B?clh4NCtGbzZFYUFhblR1cm9QNE0wRkEzQytTN28xQzJRVEVNNnZpV2dYVDdx?=
 =?utf-8?B?RG52b1FBdXJkeUNsSVMxbThqRjN1SldFQ0VyUEZKZmFhWGMvNGV0MEw2ODY2?=
 =?utf-8?B?MWF2VlRsNzZYU1FlOUVwYnloemNOeTJkSzZiNHkwdld4UkNkcG4xM2VCdS8z?=
 =?utf-8?B?dnZ4SEZkOGp0dnZBN1EzbDdHT1g5WkQyaSs3S2FMcmM0d2xwV25Tdmw2WHFr?=
 =?utf-8?B?WDA4Mi9XVmthTTFJQzlKem8vMXM3S2VySGZrMThhamQ3YmljN25TUm5PM08y?=
 =?utf-8?B?cVBSQ0pkRmJMdXZsNDlpYW1RVHpOdFJNalBYSFFTbEhHNWpDbTFXQ1MrUWpT?=
 =?utf-8?B?cXZ1L0tINTZ3ZXdhTDBJYS8rdmQrbVp4M0tFTy9EMVMyeFd4cTZ4R1lpRmFX?=
 =?utf-8?B?QkhiOE1JRjNMSWs5SnErc2hXY2c5RjNqdFA3REFldno1b0plSGNPcnc0RDhI?=
 =?utf-8?B?REJSNzFybm5Icy9EUjRaTXI4WGxNUWdMVzExT0RTNS9zZ24rZG9HY3oxcEha?=
 =?utf-8?B?alNJR2FCYUM4RDFqTm42RzhsNXhteldWSktuVUplRzQxSlFhVGxUbFVzalpz?=
 =?utf-8?B?eUxDeHVLUnFheFIzWXd3ZW1FQWZkZHB0VkJsMmVhVzFCamdEZ0tPcTk5SXkw?=
 =?utf-8?B?MDZ3ajVEcVNPSHlxT2NLNE1kM2xDbWtUdnJhNTdDSVN6WWZ0ckE2WktVN1dZ?=
 =?utf-8?B?bXZwd3VmQ2pRSytrTXAxL2NFZGdoakdwb2E4ZUxibitBRkhsTFIzMFozbUl2?=
 =?utf-8?B?WkdNeXdPZmkrc2twajg3OUxWOExwemhzK1J3ZEZjVms5Y29MQ3VEdzFOMVkx?=
 =?utf-8?B?dnF4bmxQSUFYdVhTZUUxaEtZbEhucE56M2FyeEhZT1BUUVlUaXo2Vm1PN25Q?=
 =?utf-8?B?SlpwcStTd0Q5RWZKb0o3SlhuaUJja09YQjFwTk5aS1gzdW5jaW44ZXp1SDlS?=
 =?utf-8?B?UWhIaGwweVBnMSsvaDV1ZVg4UEJRK2pEeEN3NFArYyttd0VXZFQyY2VKK25l?=
 =?utf-8?B?ZDB2MElKellYK3IyNlpUenloR1d0LzV1MmozMlNBYi83RjViUHFOUStRbzNy?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c363f6e-52e4-466f-b4e8-08dbdfebc869
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:46:38.1391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GoOfcIohSkTzm0UaRej1B1Wbk9f7AFxf0XDzLtPeGKULGVqjgynNvDp3UQiZu+o/VMaTBMygdhip0NO2oVZe50IM4E1kqq5x70LM76sW8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6872
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/12] drm/xe: implement driver initiated
 function-reset
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
>
> Driver initiated function-reset (FLR) is the highest level of reset
> that we can trigger from within the driver. In contrast to PCI FLR it
> doesn't require re-enumeration of PCI BAR. It can be useful in case
> GT fails to reset. It is also the only way to trigger GSC reset from
> the driver and can be used in future addition of GSC support.
>
> v2:
>    - use regs from xe_regs.h
>    - move the flag to xe.mmio
>    - call flr only on root gt
>    - use BIOS protection check
>    - copy/paste comments from i915
> v3:
>    - flr code moved to xe_device.c
> v4:
>    - needs_flr_on_fini moved to xe_device
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_regs.h    |  7 +++
>   drivers/gpu/drm/xe/xe_device.c       | 78 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h |  3 ++
>   drivers/gpu/drm/xe/xe_gt.c           |  2 +
>   4 files changed, 90 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 2240cd157603..a646d13af03a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -57,8 +57,15 @@
>   
>   #define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
>   
> +#define GU_CNTL_PROTECTED			XE_REG(0x10100C)
> +#define   DRIVERINT_FLR_DIS			REG_BIT(31)
> +
>   #define GU_CNTL					XE_REG(0x101010)
>   #define   LMEM_INIT				REG_BIT(7)
> +#define   DRIVERFLR				REG_BIT(31)
> +
> +#define GU_DEBUG				XE_REG(0x101018)
> +#define   DRIVERFLR_STATUS			REG_BIT(31)
>   
>   #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
>   #define   SGSI_SIDECLK_DIS			REG_BIT(17)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8341acf66e5f..515cdf599fab 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -5,6 +5,8 @@
>   
>   #include "xe_device.h"
>   
> +#include <linux/units.h>
> +
>   #include <drm/drm_aperture.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_gem_ttm_helper.h>
> @@ -260,6 +262,78 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	return ERR_PTR(err);
>   }
>   
> +/*
> + * The driver-initiated FLR is the highest level of reset that we can trigger
> + * from within the driver. It is different from the PCI FLR in that it doesn't
> + * fully reset the SGUnit and doesn't modify the PCI config space and therefore
> + * it doesn't require a re-enumeration of the PCI BARs. However, the
> + * driver-initiated FLR does still cause a reset of both GT and display and a
> + * memory wipe of local and stolen memory, so recovery would require a full HW
> + * re-init and saving/restoring (or re-populating) the wiped memory. Since we
> + * perform the FLR as the very last action before releasing access to the HW
> + * during the driver release flow, we don't attempt recovery at all, because
> + * if/when a new instance of i915 is bound to the device it will do a full
> + * re-init anyway.
> + */
> +static void xe_driver_flr(struct xe_device *xe)
> +{
> +	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
3s or 3us?

And is it supposed to be the same timeout for both registers?

John.

> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	int ret;
> +
> +	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
> +		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
> +		return;
> +	}
> +
> +	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
> +
> +	/*
> +	 * Make sure any pending FLR requests have cleared by waiting for the
> +	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
> +	 * to make sure it's not still set from a prior attempt (it's a write to
> +	 * clear bit).
> +	 * Note that we should never be in a situation where a previous attempt
> +	 * is still pending (unless the HW is totally dead), but better to be
> +	 * safe in case something unexpected happens
> +	 */
> +	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
> +		return;
> +	}
> +	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> +
> +	/* Trigger the actual Driver-FLR */
> +	xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
> +
> +	/* Wait for hardware teardown to complete */
> +	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
> +		return;
> +	}
> +
> +	/* Wait for hardware/firmware re-init to complete */
> +	ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
> +			     flr_timeout, NULL, false);
> +	if (ret) {
> +		drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
> +		return;
> +	}
> +
> +	/* Clear sticky completion status */
> +	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> +}
> +
> +static void xe_driver_flr_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	if (xe->needs_flr_on_fini)
> +		xe_driver_flr(xe);
> +}
> +
>   static void xe_device_sanitize(struct drm_device *drm, void *arg)
>   {
>   	struct xe_device *xe = arg;
> @@ -294,6 +368,10 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> +	if (err)
> +		return err;
> +
>   	for_each_gt(gt, xe, id) {
>   		err = xe_pcode_probe(gt);
>   		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 44d622d4cc3a..9a0b0ccc1018 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -405,6 +405,9 @@ struct xe_device {
>   	/** @heci_gsc: graphics security controller */
>   	struct xe_heci_gsc heci_gsc;
>   
> +	/** @needs_flr_on_fini: requests function-reset on fini */
> +	bool needs_flr_on_fini;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d380f67b3365..73c090762771 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -626,6 +626,8 @@ static int gt_reset(struct xe_gt *gt)
>   	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
>   				   gt_to_tile(gt)->id, gt->info.id);
>   
> +	gt_to_xe(gt)->needs_flr_on_fini = true;
> +
>   	return err;
>   }
>   

