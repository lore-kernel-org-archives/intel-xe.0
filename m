Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D107C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 20:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390F710E111;
	Mon,  8 Apr 2024 20:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5POIo23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CB410E111
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 20:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712607822; x=1744143822;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=lo0fGxKgVO+fUQNLq7vSWYMOnVMGpO3kQMF8BqRxG14=;
 b=A5POIo23SYlZahAoFGTnOJjPW2VelBp7NVbVjDeDTOZhO/wX1AnxhGJw
 GUC7vUMTbxxWucbIjXU2I8k5uAlGa3pCwKa/e8y5ki36oOgdPNh10KMd+
 VmoIE2rSRp3dlemkGiLl3So/kaGWph765CmxvxfSg84VO4TnsZEV0XTDu
 nPMiAYJCuF4yW2CX6ZMNxMYSQwkYOb0F7lcAwXhvJksevFS6NJi63ta0m
 jbpDPOXBaSewraEYhJtRTwgPWgi/gjJZA6pbNXyDu28eQLNLdFiS5NEpN
 j8xZugSHMWVWjjV/ZrLLKyQN5KE2bkc4EnShg+FcyA6CclQdoiX+ZhY2b Q==;
X-CSE-ConnectionGUID: X/YvjJ5YQh6y8AjYGMIQXA==
X-CSE-MsgGUID: lUgEhMuAQfGGkWUnyBkaRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19337401"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208,217";a="19337401"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 13:23:42 -0700
X-CSE-ConnectionGUID: 6scNspnESQ2jrlBWFE2UWw==
X-CSE-MsgGUID: jugXTdrRTZKsXcPJd6kuIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208,217";a="20434828"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 13:23:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 13:23:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 13:23:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 13:23:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvUvgotIpvxWuM7uGZ9Vb41dpMbc679wCU/D4WKMeoCvCgT5hZhTeSQ3J4yu+HqyN/qK15XnvSP/3JIBQJhF1BfDZB0lWhII+WtaSps1Eb98+yx3oeG+bCjMnUuR2wK4JJylJ4DBnJ7TkBGV1nDjFnUjLFqBHf5QKpa8BsaRIejPEcJxNd+1qaHQytG8K9ME90hkPtNA7Y8b5o2P6Q5zRtEU8a8KjaJa3ylYdA/SiLMUJ9SVD2aw+3ngx6I33MlbyZQt7hY0fHSthzIz8PZmKHmnXm3ApvNIl214qt4P0OW23AhT7LjmeYGD7Ah/3GRDMqxyPqHuskttY5A2eYsceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUsP0vPW1V0Rg2Hv4K68NKb2WQpYruJk2Q+cm+8VMEo=;
 b=QhYfuLrNY9GvXDIjGRR7VSbIS/+CpS5ArsPfaE0Fs9HOzYgTJ/v3yYqBOA0MWiJAu/id3os2PHdWCGQAeQKjjw1ca5f68kQXpi0TxhqIHnesTKfxGmyrPj5EjGgabmR2mhhtpR8sGjOc7LYcpIfeCih1iylcWoSVsUtOKZP2kDv3FYEMze/OwV7xv43itpaK7nPlzBwuR028TguedQTQ+shNLxcAkRqnh3Kfgyvyxn2qaoydDmZmizwArGS9Rgre6TjfkIu9kEdO++/0jumhcMiDT4+C4LYATig4ypu3Rk0fMhECcVgZCG82nFRTa0OnwmbeUENvbR5m2SJLg7jpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS7PR11MB5992.namprd11.prod.outlook.com (2603:10b6:8:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Mon, 8 Apr
 2024 20:23:38 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 20:23:38 +0000
Content-Type: multipart/alternative;
 boundary="------------P8zZV8KIudnnvz79nicVB6Ge"
Message-ID: <7ebc9a2e-e876-4471-aa26-c31f1d2e4ed7@intel.com>
Date: Tue, 9 Apr 2024 01:53:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Add helpers for GuC KLVs
To: <intel-xe@lists.freedesktop.org>
References: <20240408181408.1023-1-michal.wajdeczko@intel.com>
 <20240408181408.1023-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240408181408.1023-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: PN3PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS7PR11MB5992:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ok0zNCJRBeJcdCpEpg/y/wXcXMdk2WxS+xWVLDj9QUdaVvH0jEPLASHWupgoh9Q5Wp8M8tNpSkQdUHofzPSjZZts0FjoF6SFymRe71iFGUaB9j1I25JcJ9PyAx3lq39QN3rQ+3dFemQQj4hDD+hARgOrz4vqBKba9Z+tOpZCzv/CWEKIQdDUursLEaINyh2GhLUYnACaQFXxtDMuOFPsUBXTxHJKXs0xEq3Z28BTO2qVMh1+GwmuTX0QJB7aXjfn+dPEHjhYL4OlNrMdXvSIPP+ffzIJsdQylCL7wYfpkbQS8DpU1cmdxdTVcIvgmmmdEk/+OFNWc9IAd5i3QyYmtW7Gtj+au/t1Bk7wIOUsOAJWZHI8h/gMv8zC8NpvZGsp7KVtBPd7RrDAVyeTQILzVAvFLZpnOCma38YeCdBEFezGP2ct3gRDwDQp16wXOhL/OMarLhKYxLbj7Lk0QfPZl/5h8u1ZBSu4CBCKAPzOIpXaNdJuM7lwdsh4sr/wkMLUIng2EuD3ucVz61VjE7/pEdREyJJRmoT7k2g5eroSN/jVMCNX+0+j0bkN101W4w9dqQImqdzIjTpzGqRVhECPUwpq3gtrNKpuea9utulpQ/YLhL1kzo0Smbzg1ilCop3ASPiMhcsz5zTeuY3mijoSHiJUACBwBu6mIw3onZp8+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1pnMUovUTgrRUNGOTk1VlFqTy9SbmMwNmQ3TDlUeTBqcG1vWTRDQTFUR1VS?=
 =?utf-8?B?YStoVDNPNnlieG5lbCtDcDNtckU1TTJTQjF3R2dNQU1qQ1hDNTBscXJRdmhn?=
 =?utf-8?B?SUsrTm1FeUxwc1dwV1M3Qk8zQS9hS3djVGo2REFpdStCUTB0ME5palQvTitx?=
 =?utf-8?B?S2llVEVENHZCdnZKeE9mM0xIcGhuS2J3amc3RVMyTC9wa2IrY0VQQ2M1cnY1?=
 =?utf-8?B?WlgwZS9XVGRpLzJ1Zk5NWkhZdnVORFRQL0cxaXphUWZuWk9BOTZRb1pWbFRo?=
 =?utf-8?B?cEY2bmZTS29ySXFrbHFjNFFKTm0wVk1xRjQ3YWJUWXB0WVJXM0lWUzAzNmd4?=
 =?utf-8?B?eE55dmlZWDJnR1NVaWoySS8vYXRCdjlpMjNQWkljRXlNdCtSNEtxLzBJeitM?=
 =?utf-8?B?YkhZM3BaUElIN3pwWTRHdzFvYlBnSTdpZDFYQVpZV2Y4U0dSbE4wRmhuQ1FG?=
 =?utf-8?B?RUM2NTZLL2F6VmtkbkFZbTFROWt6ekZReG15NmozcDhOUUhLM0hyek8zUC8y?=
 =?utf-8?B?M1cvTGY5Z25NTXBvRFcvVEFaZjNXY3JJdHRiZTZnQk9ySktqMEFRUTY4aVFJ?=
 =?utf-8?B?SFFiY2R0U0VFM1pWNnoxaGtUM0NaOUtybm0rekVZeE96RGxkbXoyOTYyNzRT?=
 =?utf-8?B?OStrRDRPVVkxc0NhSlhYZ2gvK1Fvb0l1QTJBdnE1NFRCSDl0b21wcm5qWXBr?=
 =?utf-8?B?VlVDMmRTNTFBUnNUWnoxTmEwMkhIQ1FyWXBCRjhSUVlVL0xUN2djdDJMN2VL?=
 =?utf-8?B?VEV0RDFydmJYanFHMW5Xa05tb2RuRUl1ZEFGOFR5czNicDMyQU0reEdJcGpu?=
 =?utf-8?B?OUg0RWVQcWszS0ZvMHNrMlVIb1NHR3k1Um9xbWM5d2ZHL3dsOHVJSGdSYUQ4?=
 =?utf-8?B?K2dkbXY5aVpWenp5ODZDR21iVEtmY2JrTllzQW12cCttS0l2MkFVY1dYcy9i?=
 =?utf-8?B?R1RxOVJHTTh3U0poNXAzOVUyR1FxSlVWMllkczRJM2hDdTMwcS9MM2hoc0tF?=
 =?utf-8?B?SmdBbnZqN3ZzODJQSDBwQ2JheDlVMGtrZG9qN1NWb3N6c0NRQmdNcXlPT2Ni?=
 =?utf-8?B?Uk5XMTZ6aGkzUzMzQ2tIcGZoZzZDVUFRRnBIWTRJSWZSRmhud3ZFQUxRSFND?=
 =?utf-8?B?RG44UXJGZEZzaXRERmRiaGtWbWkwbVV6eU9TUlVHUW9jUVczME8rZEpCRTA2?=
 =?utf-8?B?NHJ5ZXNLZlFyNmNZWUVjS1YvUHpyOWlFSEZ5ajFiNGJ2Yy93QUhyTEN1czU3?=
 =?utf-8?B?MjVFeHQzbGxUaDdtVTVmbE9UbThIT2x1QTdXRmNabDRKQlRia1dMaXl4OTdO?=
 =?utf-8?B?VDRTU1NkeThNcmNaQnd2c1V2TXZvUnV3YjZhN3BUa0VNaDJPbVhXQ1UxTWQ3?=
 =?utf-8?B?R0VlSGl3NXFiV1pYbVJQSzUzUnpXR0FhRmhvZkxuQjRsdXNhZWpVVCtsZjY2?=
 =?utf-8?B?ZXRUZDZveEo2QjF3TFQ2a1ZDMEowcmovNXV1SkZtRmFVZUQ0a1ByaktHOTNk?=
 =?utf-8?B?Z1VGUUFKWWJGdFpIR256azNWZDFaNlpXYytVU3cwSVAxUVlNQmVWeXM3WVBa?=
 =?utf-8?B?RGN2SUhaamsxcWtYa1lSSURmMlBFWU9kNy9mdXpHMHAxUHpFaVExRnJYQTU5?=
 =?utf-8?B?MUJiellOdmo3NTRuMGt4NFZkdytwdy96YTV2ME5SZnZNYmNkRU9ETUp3dWtw?=
 =?utf-8?B?OTV1cjc4ejJjbVh4TFBsUnk5b0djY1FMbmVROGFCdGNSQWFQZFRnNElvLy9y?=
 =?utf-8?B?RVdGNzZEc2dtMXJFZmt2bkJXT24xMVNnRS9HTWppdFZoZi9hMCs2UzZ4MUNY?=
 =?utf-8?B?SzBpSjl1ai85Rnh2UWpHMVhGRHRyakhpK04yMkNzbTNCbkZxWEZPU2RpNXA5?=
 =?utf-8?B?S2Y1TFZDSk53MUtHVzFKdWp5VHI3WXRnY1I3aEZDZWZyUVlrSWNJZko3M25D?=
 =?utf-8?B?UFU0MzMxQ2FlLzk0WDVpLzhiZXE4QklpYkF0VHJjNlJRandyZEJVZmVDdkp6?=
 =?utf-8?B?NXdXcFJGaXFVdjB0OHEzaGZWWmVKdVlndW9jRVlwNXRoaUw5OXpUUDFiU2cz?=
 =?utf-8?B?YlZ4dGhPRVp0dVdSSWJEMmpTMkJOQ0grdGVjNWFNT05mcXorMDJJTVRrdWdz?=
 =?utf-8?B?UmZ0dGJwMVFMdGNNQlhjNDJPZzNwOWMwVmF0MTFCeG5mS0dERktjV3RjTzRy?=
 =?utf-8?Q?mDdY5X50fWfOhTJbVLToc6Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8352ab7f-cb51-416b-87de-08dc5809c5eb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 20:23:38.1238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pquDtZYmGc5+gdxVY42yAQJFzlJr+2069OsJv/5F99Nu6S2I+BjDtAojGgBuS1InEzaqYi3yiplndwVwvhxnuX8Q3Xi1hNOCi+P73Ib/srY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5992
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

--------------P8zZV8KIudnnvz79nicVB6Ge
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 08-04-2024 23:44, Michal Wajdeczko wrote:
> Many of the GuC actions use KLVs to pass additional parameters or
> configuration data. Add few helper functions for better reporting
> any information related to KLVs.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile             |   1 +
>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 133 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  51 +++++++++
>   3 files changed, 185 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e5b1715f721e..ec0d1fb49b1e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>   	xe_guc_debugfs.o \
>   	xe_guc_hwconfig.o \
>   	xe_guc_id_mgr.o \
> +	xe_guc_klv_helpers.o \
>   	xe_guc_log.o \
>   	xe_guc_pc.o \
>   	xe_guc_submit.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> new file mode 100644
> index 000000000000..c39fda08afcb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_klvs_abi.h"
> +#include "xe_guc_klv_helpers.h"
> +
> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))

is this macro necessary, it's being called in one place ?

((u64)hi << 32) | lo  should be enough.

> +
> +/**
> + * xe_guc_klv_key_to_string - Convert KLV key into friendly name.
> + * @key: the `GuC KLV`_ key
> + *
> + * Return: name of the KLV key.
> + */
> +const char *xe_guc_klv_key_to_string(u16 key)
> +{
> +	switch (key) {
> +	/* VGT POLICY keys */
> +	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
> +		return "sched_if_idle";
> +	case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
> +		return "sample_period";
> +	case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
> +		return "reset_engine";
> +	/* VF CFG keys */
> +	case GUC_KLV_VF_CFG_GGTT_START_KEY:
> +		return "ggtt_start";
> +	case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
> +		return "ggtt_size";
> +	case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
> +		return "lmem_size";
> +	case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
> +		return "num_contexts";
> +	case GUC_KLV_VF_CFG_TILE_MASK_KEY:
> +		return "tile_mask";
> +	case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
> +		return "num_doorbells";
> +	case GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY:
> +		return "exec_quantum";
> +	case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
> +		return "preempt_timeout";
> +	case GUC_KLV_VF_CFG_BEGIN_DOORBELL_ID_KEY:
> +		return "begin_db_id";
> +	case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
> +		return "begin_ctx_id";

default:

return "(unknown)";

Have seen warning/errors if default is not defined in switch-case.

> +	}
> +	return "(unknown)";
remove.
> +}
> +
> +/**
> + * xe_guc_klv_print - Print content of the buffer with `GuC KLV`_.
> + * @klvs: the buffer with KLVs
> + * @num_dwords: number of dwords (u32) available in the buffer
> + * @p: the &drm_printer
> + *
> + * The buffer may contain more than one KLV.
> + */
> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p)
> +{
> +	while (num_dwords >= GUC_KLV_LEN_MIN) {
> +		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
> +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
> +
> +		klvs += GUC_KLV_LEN_MIN;
> +		num_dwords -= GUC_KLV_LEN_MIN;
> +
> +		if (num_dwords < len) {
> +			drm_printf(p, "{ key %#06x : truncated %zu of %zu bytes %*ph } # %s\n",
> +				   key, num_dwords * sizeof(u32), len * sizeof(u32),
> +				   (int)(num_dwords * sizeof(u32)), klvs,
> +				   xe_guc_klv_key_to_string(key));
> +			return;
> +		}
> +
> +		switch (len) {
> +		case 0:
> +			drm_printf(p, "{ key %#06x : no value } # %s\n",
> +				   key, xe_guc_klv_key_to_string(key));
> +			break;
> +		case 1:
> +			drm_printf(p, "{ key %#06x : 32b value %u } # %s\n",
> +				   key, klvs[0], xe_guc_klv_key_to_string(key));
> +			break;
> +		case 2:
> +			drm_printf(p, "{ key %#06x : 64b value %#llx } # %s\n",
> +				   key, make_u64(klvs[1], klvs[0]),
> +				   xe_guc_klv_key_to_string(key));
> +			break;
> +		default:
> +			drm_printf(p, "{ key %#06x : %zu bytes %*ph } # %s\n",
> +				   key, len * sizeof(u32), (int)(len * sizeof(u32)),
> +				   klvs, xe_guc_klv_key_to_string(key));
> +			break;
> +		}
> +
> +		klvs += len;
> +		num_dwords -= len;
> +	}
> +
> +	/* we don't expect any leftovers, fix if KLV header is ever changed */
> +	BUILD_BUG_ON(GUC_KLV_LEN_MIN > 1);
> +}
> +
> +/**
> + * xe_guc_klv_count - Count KLVs present in the buffer.
> + * @klvs: the buffer with KLVs
> + * @num_dwords: number of dwords (u32) in the buffer
> + *
> + * Return: number of recognized KLVs or
> + *          a negative error code if KLV buffer is truncated.
> + */
> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
> +{
> +	int num_klvs = 0;
> +
> +	while (num_dwords >= GUC_KLV_LEN_MIN) {
> +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
> +
> +		if (num_dwords < len + GUC_KLV_LEN_MIN)
> +			return -ENODATA;
> +
> +		klvs += GUC_KLV_LEN_MIN + len;
> +		num_dwords -= GUC_KLV_LEN_MIN + len;
> +		num_klvs++;
> +	}
> +
> +	return num_dwords ? -ENODATA : num_klvs;

while loop can be terminated only if num_dwords < len + GUC_KLV_LEN_MIN 
or num_dwords is 0. Therefore return num_klvs; should be fine.

> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> new file mode 100644
> index 000000000000..b835e0ebe6db
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_KLV_HELPERS_H_
> +#define _XE_GUC_KLV_HELPERS_H_
> +
> +#include <linux/types.h>
> +
> +struct drm_printer;
> +
> +const char *xe_guc_klv_key_to_string(u16 key);
> +
> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p);
> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
> +
> +/**
> + * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
> + * @key: KLV key
> + * @len: KLV length
> + *
> + * Return: value of the KLV header (u32).
> + */
> +#define PREP_GUC_KLV(key, len) \
> +	(FIELD_PREP(GUC_KLV_0_KEY, (key)) | \
> +	 FIELD_PREP(GUC_KLV_0_LEN, (len)))
> +
> +/**
> + * PREP_GUC_KLV_CONST - Prepare KLV header value based on const key and len.
> + * @key: const KLV key
> + * @len: const KLV length
> + *
> + * Return: value of the KLV header (u32).
> + */
> +#define PREP_GUC_KLV_CONST(key, len) \
> +	(FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
> +	 FIELD_PREP_CONST(GUC_KLV_0_LEN, (len)))
> +
> +/**
> + * PREP_GUC_KLV_TAG - Prepare KLV header value based on unique KLV definition tag.
> + * @TAG: unique tag of the KLV definition
> + *
> + * Combine separate KEY and LEN definitions of the KLV identified by the TAG.
> + *
> + * Return: value of the KLV header (u32).
> + */
> +#define PREP_GUC_KLV_TAG(TAG) \
> +	PREP_GUC_KLV_CONST(GUC_KLV_##TAG##_KEY, GUC_KLV_##TAG##_LEN)
> +
> +#endif
--------------P8zZV8KIudnnvz79nicVB6Ge
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-04-2024 23:44, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240408181408.1023-2-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">Many of the GuC actions use KLVs to pass additional parameters or
configuration data. Add few helper functions for better reporting
any information related to KLVs.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Makefile             |   1 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 133 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  51 +++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e5b1715f721e..ec0d1fb49b1e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -98,6 +98,7 @@ xe-y += xe_bb.o \
 	xe_guc_debugfs.o \
 	xe_guc_hwconfig.o \
 	xe_guc_id_mgr.o \
+	xe_guc_klv_helpers.o \
 	xe_guc_log.o \
 	xe_guc_pc.o \
 	xe_guc_submit.o \
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
new file mode 100644
index 000000000000..c39fda08afcb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include &lt;linux/bitfield.h&gt;
+#include &lt;drm/drm_print.h&gt;
+
+#include &quot;abi/guc_klvs_abi.h&quot;
+#include &quot;xe_guc_klv_helpers.h&quot;
+
+#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) &lt;&lt; 32 | (u32)(lo)))</pre>
    </blockquote>
    <p>is this macro necessary, it's being called in one place ?</p>
    <p>((u64)hi &lt;&lt; 32) | lo&nbsp; should be enough.<br>
    </p>
    <blockquote type="cite" cite="mid:20240408181408.1023-2-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">
+
+/**
+ * xe_guc_klv_key_to_string - Convert KLV key into friendly name.
+ * @key: the `GuC KLV`_ key
+ *
+ * Return: name of the KLV key.
+ */
+const char *xe_guc_klv_key_to_string(u16 key)
+{
+	switch (key) {
+	/* VGT POLICY keys */
+	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
+		return &quot;sched_if_idle&quot;;
+	case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
+		return &quot;sample_period&quot;;
+	case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
+		return &quot;reset_engine&quot;;
+	/* VF CFG keys */
+	case GUC_KLV_VF_CFG_GGTT_START_KEY:
+		return &quot;ggtt_start&quot;;
+	case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
+		return &quot;ggtt_size&quot;;
+	case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
+		return &quot;lmem_size&quot;;
+	case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
+		return &quot;num_contexts&quot;;
+	case GUC_KLV_VF_CFG_TILE_MASK_KEY:
+		return &quot;tile_mask&quot;;
+	case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
+		return &quot;num_doorbells&quot;;
+	case GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY:
+		return &quot;exec_quantum&quot;;
+	case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
+		return &quot;preempt_timeout&quot;;
+	case GUC_KLV_VF_CFG_BEGIN_DOORBELL_ID_KEY:
+		return &quot;begin_db_id&quot;;
+	case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
+		return &quot;begin_ctx_id&quot;;</pre>
    </blockquote>
    <p>default:</p>
    <p>return &quot;<span style="white-space: pre-wrap">(unknown)&quot;;</span></p>
    <p><span style="white-space: pre-wrap">Have seen warning/errors if default is not defined in switch-case.
</span></p>
    <blockquote type="cite" cite="mid:20240408181408.1023-2-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">
+	}
+	return &quot;(unknown)&quot;;</pre>
    </blockquote>
    remove.<br>
    <blockquote type="cite" cite="mid:20240408181408.1023-2-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">
+}
+
+/**
+ * xe_guc_klv_print - Print content of the buffer with `GuC KLV`_.
+ * @klvs: the buffer with KLVs
+ * @num_dwords: number of dwords (u32) available in the buffer
+ * @p: the &amp;drm_printer
+ *
+ * The buffer may contain more than one KLV.
+ */
+void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p)
+{
+	while (num_dwords &gt;= GUC_KLV_LEN_MIN) {
+		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
+		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+
+		klvs += GUC_KLV_LEN_MIN;
+		num_dwords -= GUC_KLV_LEN_MIN;
+
+		if (num_dwords &lt; len) {
+			drm_printf(p, &quot;{ key %#06x : truncated %zu of %zu bytes %*ph } # %s\n&quot;,
+				   key, num_dwords * sizeof(u32), len * sizeof(u32),
+				   (int)(num_dwords * sizeof(u32)), klvs,
+				   xe_guc_klv_key_to_string(key));
+			return;
+		}
+
+		switch (len) {
+		case 0:
+			drm_printf(p, &quot;{ key %#06x : no value } # %s\n&quot;,
+				   key, xe_guc_klv_key_to_string(key));
+			break;
+		case 1:
+			drm_printf(p, &quot;{ key %#06x : 32b value %u } # %s\n&quot;,
+				   key, klvs[0], xe_guc_klv_key_to_string(key));
+			break;
+		case 2:
+			drm_printf(p, &quot;{ key %#06x : 64b value %#llx } # %s\n&quot;,
+				   key, make_u64(klvs[1], klvs[0]),
+				   xe_guc_klv_key_to_string(key));
+			break;
+		default:
+			drm_printf(p, &quot;{ key %#06x : %zu bytes %*ph } # %s\n&quot;,
+				   key, len * sizeof(u32), (int)(len * sizeof(u32)),
+				   klvs, xe_guc_klv_key_to_string(key));
+			break;
+		}
+
+		klvs += len;
+		num_dwords -= len;
+	}
+
+	/* we don't expect any leftovers, fix if KLV header is ever changed */
+	BUILD_BUG_ON(GUC_KLV_LEN_MIN &gt; 1);
+}
+
+/**
+ * xe_guc_klv_count - Count KLVs present in the buffer.
+ * @klvs: the buffer with KLVs
+ * @num_dwords: number of dwords (u32) in the buffer
+ *
+ * Return: number of recognized KLVs or
+ *          a negative error code if KLV buffer is truncated.
+ */
+int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
+{
+	int num_klvs = 0;
+
+	while (num_dwords &gt;= GUC_KLV_LEN_MIN) {
+		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+
+		if (num_dwords &lt; len + GUC_KLV_LEN_MIN)
+			return -ENODATA;
+
+		klvs += GUC_KLV_LEN_MIN + len;
+		num_dwords -= GUC_KLV_LEN_MIN + len;
+		num_klvs++;
+	}
+
+	return num_dwords ? -ENODATA : num_klvs;</pre>
    </blockquote>
    <p>while loop can be terminated only if <span style="white-space: pre-wrap">num_dwords &lt; len + GUC_KLV_LEN_MIN</span>
      or <span style="white-space: pre-wrap">num_dwords </span>is 0.
      Therefore return num_klvs; should be fine.<br>
    </p>
    <blockquote type="cite" cite="mid:20240408181408.1023-2-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
new file mode 100644
index 000000000000..b835e0ebe6db
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GUC_KLV_HELPERS_H_
+#define _XE_GUC_KLV_HELPERS_H_
+
+#include &lt;linux/types.h&gt;
+
+struct drm_printer;
+
+const char *xe_guc_klv_key_to_string(u16 key);
+
+void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p);
+int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
+
+/**
+ * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
+ * @key: KLV key
+ * @len: KLV length
+ *
+ * Return: value of the KLV header (u32).
+ */
+#define PREP_GUC_KLV(key, len) \
+	(FIELD_PREP(GUC_KLV_0_KEY, (key)) | \
+	 FIELD_PREP(GUC_KLV_0_LEN, (len)))
+
+/**
+ * PREP_GUC_KLV_CONST - Prepare KLV header value based on const key and len.
+ * @key: const KLV key
+ * @len: const KLV length
+ *
+ * Return: value of the KLV header (u32).
+ */
+#define PREP_GUC_KLV_CONST(key, len) \
+	(FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
+	 FIELD_PREP_CONST(GUC_KLV_0_LEN, (len)))
+
+/**
+ * PREP_GUC_KLV_TAG - Prepare KLV header value based on unique KLV definition tag.
+ * @TAG: unique tag of the KLV definition
+ *
+ * Combine separate KEY and LEN definitions of the KLV identified by the TAG.
+ *
+ * Return: value of the KLV header (u32).
+ */
+#define PREP_GUC_KLV_TAG(TAG) \
+	PREP_GUC_KLV_CONST(GUC_KLV_##TAG##_KEY, GUC_KLV_##TAG##_LEN)
+
+#endif
</pre>
    </blockquote>
  </body>
</html>

--------------P8zZV8KIudnnvz79nicVB6Ge--
