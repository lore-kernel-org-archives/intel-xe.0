Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFEEF513F3
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 03:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A4510E319;
	Fri,  6 Mar 2026 03:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTomQEAM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94E510E319
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 03:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772769029; x=1804305029;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bb58NIEnAfXoQYuA86KGuLPZr/K78lGrxZLN6iCXl20=;
 b=FTomQEAMwemHvUglmZD3Y/wX+2i3bZNxoB8XNOaojfRNVuk8pZAaFOFQ
 Mqd46C1pqTBupiBWNZSMYcBLQ3X7uXg4lcG9JDDajgiWNYzDxd7/TNc4V
 go7hHn55K/dW3VsVbo4HBog+0lrqV2DVTits2JiVjvqiqcZl9/OMpBkP4
 5QQ0N83lkT98OdsvdjjZknnbpb6uDEoCFYRW+g1vYDq005NyP6gnIrPic
 aKlFw3+QePHHTtBx4JJOxnrkg4gKgfWgEiPFO/wOmnnN75VXLF1xknr9E
 cj2xtNmRFsAMNQyyzeUXTqc4S/1be4Yw7ZZdRlvzez2XJWPPZV4uHj9yJ A==;
X-CSE-ConnectionGUID: uazxibhpTOKeRaTqEbda/w==
X-CSE-MsgGUID: EEs+CbMVRymUKGK8M7cALg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="74062094"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="74062094"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 19:50:28 -0800
X-CSE-ConnectionGUID: ePbgc3AQQVy9GzuaW7QEZg==
X-CSE-MsgGUID: t+juGCj4Rk+Uj7FfqVXw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218128811"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 19:50:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 19:50:27 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 19:50:27 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 19:50:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNbSeYjOCaACqD1xzraM/0EIsixsmmMo70+Q6UzZCbMvn6weVJF1ch+ETHxwGtyKhVwuwkQsdDvDFuK+NDee2OPuoolSAvssos3FXffzHvgBW3JT1mLMXh6BiheWF2s9NLanqf1RSPgB8jojy+2hyBUz5JK0gfOsvLzNSrrh8hUOC2pX5PC04nM/R9gcyLxW1YxyWrBhu0aLeKkT23w9m5vmFVWHEArw0NKySRCyOi7XjvFXbTd2hWYNZ6ZezPhDTj1w1NeNOeWtB1k0744YeiDElP2P21EAVyrRzuQBWzIk6R2gvTOoZvhFE36gsuFgTnbl25V/HChJynD/mpFhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvJER3t0w4dw3LugKKkmHEfsM6vYPPrEUpFZcfBUNOU=;
 b=TphYAn5HejCS1+slvGAZAbpL/VRuWUcEVt7zaPS0Q3uVzMEm978RXKtI9iDKaXcfGidxtjkyAbywrOucTIrcv3O6EpoookNM5bjRHg8kusc+icZhxv4FPv3IB4kF0pXB/pgPLqCMP2vCEHzFzPQKVMDDMPda4tvDFp1JOadB7ASnhczniL/NvjLMcAjPyFeEnLR5hf9cZeDux/4/RGcw/Sy6LRRCgAOhYNr8RtJs/X4eQ+NwD9NyuCe3WFr1pVMM/B3oHEb6RUtm7TCMHoKGblZmMWfPBH9IAzpVm++zaqeiMNRADWQ0txtDKTDAvzr7sRunkiJ1KokM1rgEAM06BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA1PR11MB8395.namprd11.prod.outlook.com (2603:10b6:806:38c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 03:50:25 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 03:50:24 +0000
Message-ID: <6392e82e-371a-4474-b456-0a0affa29db5@intel.com>
Date: Fri, 6 Mar 2026 09:20:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,08/11] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260302102155.4074630-21-riana.tauro@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260302102155.4074630-21-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA1PR11MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 229b4395-6c6c-44a7-a35f-08de7b337f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: ImaepPlBHP6wJBkakSWTLOkkJquu8BhN4LHTLFPOUeOhzK05fEGDu6ifQkyyWvH18JqwYmWwbLN6TWhgTHKUadB+DlGBcJPEe7+EpOHJWRm28U55Hb6q/bD7SUxn9xKxSQXhKJRUKVdS0piuFwaeJSoeei2fVoQV4MLlfUsuFTcYD/4ZwKZydgmkO2xao9Be0nCLPsmauPHVCvjlaHponnP6I6njIDV8YKxAEElxWVUQcloysrJtznCEDWxwpCejl+EG26FfokN35q/tKuNpYcgzZ+4GyVvx6s5Hey65CdK2/cFvAJB80fowmPCawZaNCIcrPLeAyMcDJivqPKkdCzwSxh2Z4kUcVpgb8Fd5aQ+bik6whe1sDyaTNj1BK6ddblKjh47YTVjgtxbrx+mWucMKaTJFynOPLNdSO6Sq4IK4zBC/Ayeo5Q57fNOeIUabbo+6Sr1+aVh2htew6uq7x8F3ujPpA26f8nlNJtoW48e/xlyajLsdWfoyDAPqOVcVfmKipE6OVy7LuO0WMp3EFO0CbDA/e3Vm/PjXvR9h8v1e170FGFzm12wPZQ6KZMTHbJBvcRW9IssMHrvFoZdeSLQ+4AEb9Gvyv5DJyUcwNHNGMqcSNiQ6a7OpYea21I0JfHdRyc+QdYtjAPlIuW84v/ApA8S9fmlc/um5/pDAILxGx+/WRjMFbffO6QesrfRSAyROeCRqBSOc2caknCJVOogBdj9NKo04v/WZS0MHKHs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmprbjlhRElJblBXeU1nZ2h0b1dyaS9KR2FRZ1AwOEVPbzdIRVFVSHZWeXUz?=
 =?utf-8?B?TzZiN2VXOVZFZDZDQm5uc0YwSldKMlVHN1QzUzhxbmhSY01mUlpDNWJWMUZ3?=
 =?utf-8?B?eExrMDlhK2hUL3h5NUhuUTl3a0xKNStrOTA4QytRVnY2MFpibVUvd0l5NXV3?=
 =?utf-8?B?QlhHb25XTUpoZjJCWFJwMWJkbkcyU2VuRThCOTJPak9Mc25YTEpvVlo0YS9i?=
 =?utf-8?B?bHRLcUNBdHR5QS9UTjlQcXFrY2hJTjZobC91QUNFcncwZktkVHlMTUV0b2tL?=
 =?utf-8?B?dVMxdU5USG0vaXFTSzh4Q1hESmRiaDE1ZTJhRU80R1JZZGFSYktpUGRjTThl?=
 =?utf-8?B?ajVNN3JnMTMwamY0enRSYmVRTko4dXRXeFRmSHNtUHFKTFFMenNZV0JFaENu?=
 =?utf-8?B?cE42ejhXVWdQSlNTRTZJQlFhY2NSdFNDZGNVKzMyamkzWVFydzhNRGh2ODFx?=
 =?utf-8?B?NXZnQVBoeWg5VjVFQnRWaXF0RzJ1LzNUUGtGNjNYMmdZbk96YXgxZkE0dThj?=
 =?utf-8?B?NVhzZG9JcDJsSUFKT1B6bUQrNFkyM1V3V05EZllHQ1dVdU1YbjJaUkxmZ3JX?=
 =?utf-8?B?bnQzbU5iRms4eFM5b0xUa1JRN0xSODRhRDlYVzVMWk5TZGZyUVNIT1JnSVBj?=
 =?utf-8?B?WGQyRjNYVzNIcmVXNGYwTFp5OU1LWjVuWHBOTFd6cUJsdTF2NmpRTjNrUGNx?=
 =?utf-8?B?WlJieHEvUENrbXhJaVN6Z2dJc3d6Zk0xNU80Q3FKTjBtdjQ5SHJtc05SSkYy?=
 =?utf-8?B?bkR4WTFLaGVWcGZWOWZYeE5mVis4a0JlalpSTEg0dUNQWUFYKzF0clh3NlAy?=
 =?utf-8?B?R29YVDZYMzZpQmtvRmlEVHluQlJNYkRTSG0xaEJtdFM5QWNnazQrVzlGMDM5?=
 =?utf-8?B?Z1RXU2gwTlkwaHRRK3JTWU9lR1RDOUYvV1l5aWtGSFhXYzlhRWhYQnMvb3ZQ?=
 =?utf-8?B?Q0wvOFpncVFaM3RmSFBLV2dUNS9wdkkvVlFQMkc3NTJhSVZQLzdsMmt2S0Mr?=
 =?utf-8?B?NGR3RWI3a0pOZ2NyQlprMXVzNkVnTXJWZ2Z5M0RScVZkQml2SzJNZFZpQnVu?=
 =?utf-8?B?Vmt2RTFZcmNqSlltL1J5QWk0MWl1cGdGbWhTVlVabHk5MnFJU0M2UUkwYTk4?=
 =?utf-8?B?YkFyR3JqakwwUG1qa01DdHdDaElmVEpSRkVyRFdHVmp0L0J4OFNSNGs4Tjh2?=
 =?utf-8?B?TDd6ZWh4SkF1NGNCWWZkT0dUdVZzOFRjSEFCUjVYNDVwcHJtZXhpejRacW1u?=
 =?utf-8?B?WTcyTXhYQkp5M3lTaEpWRzUyQ2dCdWhPQVF0WUllYkh2MHAvdXB6TXlNZDRN?=
 =?utf-8?B?YWYxZVN2aFlwVHNIaDJBa3daV1BYYS85b2hPMytDMWlMT1g4QzRVZzdkeHA3?=
 =?utf-8?B?TGFmWTV0TlRsYk50WnN0Z05WWXB4Yzhsd3E2NTJEWnMydWJablllek5SSzUy?=
 =?utf-8?B?N1dPdDlCSGhsL2tNU2RmU1lpQ1FqWDlyTHgwbFRZV2w3N1dLcFV6TzQ3eGsx?=
 =?utf-8?B?SW43bENFV3RJdm42QmRjYlFhb2RCVi8zcGg2TjNTR0FzYzlHMnBRcnBKb2NG?=
 =?utf-8?B?NGprTld4L1hrSkxMNWFnVEY5czlPZGhPL2cwRTAyMWp4aUY4WHFNd01wNFlS?=
 =?utf-8?B?UFZVcERLQ0lHcDlTOEFQQ2gyQnJ6OVpEYXYwc1o5VXBrN0hTWmR4MGRXdXIr?=
 =?utf-8?B?dkthVmI1ZksvN0pQWm80RFo1dURaTGsrRG56NzBPajNVbTAzdnVhWGhZV1Qz?=
 =?utf-8?B?aHdnL2ZEdEFmcERRbE9ZK1AxcHNNZDd5OS92QTJycEFYM2pOWHBiZkFEY25r?=
 =?utf-8?B?Y0hsS0tXVTBxTmVPU05iVktxa3lXMlNpOHc3Nmc3cE9tYTZNU3RSdUlKT3ZH?=
 =?utf-8?B?eXhzcE05SUdWeWNlak9MbytCUWI0M1JjMFhPS0doTlVhdWZwL29YanE2ekVa?=
 =?utf-8?B?M0RDVTFGckpSeDEzK0tkZFJ2dyt4U0NWK1VmSnllVG5LOERGSU91cTFoY0hh?=
 =?utf-8?B?VTJMVHpnb0FmdFBxRDgyYTdCOUVjTWxoV01ESjE2SkJnUk1TeFRtbW1aQ2pO?=
 =?utf-8?B?bi8wcThBT3lqR1RSc1UzVTFBc214VzVmRHVlQU1OaHUzZjJyR1dsYS9adFlE?=
 =?utf-8?B?cTJNOVJLMGM2MnROVDc0bGErRm91Q3BCeE1CNm0vNXFmWGVKaHNkelhST1NV?=
 =?utf-8?B?ajRnNmRYTy83TzdNTDFJeThmckZEZE5XaTErTklMWXp6UFF1TWZYTVltdXI0?=
 =?utf-8?B?dTNQU1BIQzB2eTNmQkZHQnppSGMyZFhlVFFqbFJObS9FMVZ2SmlqbTNXZGc1?=
 =?utf-8?B?WWNhd01ac0Q2aDAvc01oMXYzZTlIT011eUpZS3pMbzIvV2d2NFhWQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 229b4395-6c6c-44a7-a35f-08de7b337f75
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 03:50:24.8853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ip6G10gsriWRLZ5t6w/Cuuqp+CB7td/EjSok9zBbFclaqszoUJkg935/pdEfPQDq4vh15Ozrnp0qNitW4gfqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8395
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

Hi Riana,

On 02-03-2026 15:52, Riana Tauro wrote:
> Uncorrectable Core-Compute errors are classified into Global and Local
> errors.
>
> Global error is an error that affects the entire device requiring a
> reset. This type of error is not isolated. When an AER is reported and
> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>
> A Local error is confined to a specific component or context like a
> engine. These errors can be contained and recovered by resetting
> only the affected part without distrupting the rest of the device.
>
> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
> generated and GuC is notified of the error. The KMD then sets
> the context as non-runnable and initiates an engine reset.
> (TODO: GuC <->KMD communication for the error).
> Since the error is contained and recovered, PCI error handling
> callback returns PCI_ERS_RESULT_RECOVERED.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: add newline and fix log
>      add bounds check (Mallesh)
>      add ras specific enum (Raag)
>      helper for sysctrl prepare command
>      process all errors before deciding recovery action
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 139 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h       |   3 +
>   drivers/gpu/drm/xe/xe_ras_types.h |  16 ++++
>   3 files changed, 158 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 3bef589082d7..61c01a4bfadb 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,7 +4,14 @@
>    */
>   
>   #include "xe_device_types.h"
> +#include "xe_printk.h"
>   #include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +#define COMPUTE_ERROR_SEVERITY_MASK		GENMASK(26, 25)
> +#define GLOBAL_UNCORR_ERROR			2
>   
>   /* Severity classification of detected errors */
>   enum xe_ras_severity {
> @@ -62,6 +69,138 @@ static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
>   	return xe_ras_components[comp];
>   }
>   
> +static void log_ras_error(struct xe_device *xe, struct xe_ras_error_class *error_class)
> +{
> +	struct xe_ras_error_common common_info = error_class->common;
> +	struct xe_ras_error_product product_info = error_class->product;
> +	u8 tile = product_info.unit.tile;
> +	u32 instance = product_info.unit.instance;
> +	u32 cause = product_info.error_cause.cause;
> +
> +	xe_err(xe, "[RAS]: Tile%u, Instance %u, %s %s Error detected Cause: 0x%x\n",
> +	       tile, instance, severity_to_str(xe, common_info.severity),
> +	       comp_to_str(xe, common_info.component), cause);
> +}
> +
> +static enum xe_ras_recovery_action handle_compute_errors(struct xe_device *xe,
> +							 struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr->error_details;
> +	u8 uncorr_type;
> +
> +	uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, error_info->error_log_header);
> +	log_ras_error(xe, &arr->error_class);
> +
> +	xe_err(xe, "[RAS]: Core Compute Error: timestamp %llu Uncorrected error type %u\n",
> +	       arr->timestamp, uncorr_type);
> +
> +	/* Request a RESET if error is global */
> +	if (uncorr_type == GLOBAL_UNCORR_ERROR)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	/* Local errors are recovered using a engine reset */
> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +}
> +
> +static void xe_ras_prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,

You can drop prefix for static functions.

Thanks,
Soham

> +					   u32 cmd_mask, void *request, size_t request_len,
> +					   void *response, size_t response_len)
> +{
> +	struct xe_sysctrl_mailbox_app_msg_hdr hdr = {0};
> +	u32 req_hdr;
> +
> +	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		  FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
> +
> +	hdr.data = req_hdr;
> +	command->header = hdr;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
> +/**
> + * xe_ras_process_errors - Process and contain hardware errors
> + * @xe: xe device instance
> + *
> + * Get error details from system controller and return recovery
> + * method. Called only from PCI error handling.
> + *
> + * Returns: recovery action to be taken
> + */
> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_error_response response;
> +	enum xe_ras_recovery_action final_action;
> +	size_t rlen;
> +	int ret;
> +
> +	/* Default action */
> +	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
> +
> +	if (!xe->info.has_sysctrl)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	xe_ras_prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
> +				       &response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +		rlen = 0;
> +
> +		ret = xe_sysctrl_send_command(xe, &command, &rlen);
> +		if (ret || !rlen) {
> +			xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> +			goto err;
> +		}
> +
> +		if (rlen != sizeof(response)) {
> +			xe_err(xe, "[RAS]: Sysctrl response does not match len!!\n");
> +			goto err;
> +		}
> +
> +		if (response.num_errors > XE_RAS_NUM_ERROR_ARR) {
> +			xe_err(xe, "[RAS]: Number of errors out of bound (%d)\n",
> +			       XE_RAS_NUM_ERROR_ARR);
> +			goto err;
> +		}
> +
> +		for (int i = 0; i < response.num_errors; i++) {
> +			struct xe_ras_error_array arr = response.error_arr[i];
> +			enum xe_ras_recovery_action action;
> +			struct xe_ras_error_class error_class;
> +			u8 component;
> +
> +			error_class = arr.error_class;
> +			component = error_class.common.component;
> +
> +			switch (component) {
> +			case XE_RAS_COMPONENT_CORE_COMPUTE:
> +				action = handle_compute_errors(xe, &arr);
> +				break;
> +			default:
> +				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
> +				break;
> +			}
> +
> +			/*
> +			 * Retain the highest severity action. Process and log all errors
> +			 * and then take appropriate recovery action
> +			 */
> +			if (action > final_action)
> +				final_action = action;
> +		}
> +
> +	} while (response.additional_errors);
> +
> +	return final_action;
> +
> +err:
> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
> +
>   #ifdef CONFIG_PCIEAER
>   static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 14cb973603e7..e191ab80080c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -6,8 +6,11 @@
>   #ifndef _XE_RAS_H_
>   #define _XE_RAS_H_
>   
> +#include "xe_ras_types.h"
> +
>   struct xe_device;
>   
>   void xe_ras_init(struct xe_device *xe);
> +enum xe_ras_recovery_action  xe_ras_process_errors(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 676755732ef6..221d07efd84c 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -11,6 +11,22 @@
>   #define XE_RAS_NUM_ERROR_ARR		3
>   #define XE_RAS_MAX_ERROR_DETAILS	16
>   
> +/**
> + * enum xe_ras_recovery_action - RAS recovery actions
> + *
> + * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
> + * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
> + * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
> + *
> + * This enum defines the possible recovery actions that can be taken in response
> + * to RAS errors.
> + */
> +enum xe_ras_recovery_action {
> +	XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
> +	XE_RAS_RECOVERY_ACTION_RESET,
> +	XE_RAS_RECOVERY_ACTION_DISCONNECT
> +};
> +
>   /**
>    * struct xe_ras_error_common - Common RAS error class
>    *
