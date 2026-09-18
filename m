Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BE3C88E75
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 03:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A7810E080;
	Fri, 18 Sep 2026 03:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flBLuIqf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8AE10E080
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 03:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789703285; x=1821239285;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8Hni9aAjVIJd2WO1/MAqO0qDxrTLOaIaX+IzAi4L3J4=;
 b=flBLuIqfNJvLb8RjtIqAsYCu082jvE28Co3Iok1iAvFT0wwJKz4LnXz9
 V/6Co6PjRT7rZU/eVh6AyBkpmfOe/pp3dRRX38oPhWUNnDgrJtStsTIU3
 q8ge2kz1s6gaex9Zgg2MFrK4IG70GqZcbNcQFwTr4MtfZJ07cVFl53m0G
 enhjpfvUSGnfZsDLRdbOdqzdAOOa+vaSQ55Su7vmCHioDHcjaocIiQSJz
 gS4MiGbyV04jieA38tgeVMJ/5AbAygZYx7veSydZDvfrXlWWrodCSNvS2
 yjSwIyzhi03c8XvfueTRxUvshcUVb1k/LaU/sotVFt8jwJnm4Eq6lSifv A==;
X-CSE-ConnectionGUID: YZIt+8UIR4ipp8ue4BBcUg==
X-CSE-MsgGUID: BWRpBSbcQfascsjkzv2Ldw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77749033"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77749033"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:48:05 -0700
X-CSE-ConnectionGUID: GJVYzJ2/R1q4Tc10wUbhjw==
X-CSE-MsgGUID: WU1+0zbLSdS2l5Mq3wcjNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267929842"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:48:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:48:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:48:05 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:48:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nus/cWHcsypVslwHg8aRg66iv8VfJbMhU+xAlPb+8XMkSlEJJuXtsV58DWZFyywtMT2OgEiSvvkQn5wTM0KHJrV6nEEcop2G1KmxSQ2X3OYli3aLjyT4UPZPY3M0+zGZt6vQgB77HoBGdJKRig2H1TM9tYCvFk3W2rZ3c8FZQsdBncMZ+AhjErn6RId+OAA4lwWL6RN4e6ZtUnPl/edwzzsupk/7nLrLNNbKmXqUirEqmv7lHjMbw8hR9Vi+vUVAVk0jfbpKXLLaApUeNEEXY0mr7z8HhSZL/83rHDh6dEgA4RlHfD/dinTmtcJFYla8hsztddzVMPEC7zG711YEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSOcNVpsuISvBUnaJ1mF9SzCsoAWa6vR+ZFXYNpV77s=;
 b=ujXXdSg7i2UeHvnWCttP5vh35WlVo3O4M3acufoJ01zkLf086E3hmaNTA3Pdieqe9Nxi7N5PfS9ad/Y1sPpHP9gRuLiG7gJhbX+4saiLsmjxp7I92QX59hU+TVpnwk19R6/lh4+m41a3TT1fmgf7WmcSLQxCMjyOCBAT4i07qEsYMyJ2Z8hEQVapxHnl8PLf2RZhCj6/hwJLmf4djaO1+DLPq8k0q4pkA6uKQAU47z90BMS+CCd0+gvDDWQ1liW19dreNQYlK0793bwupf+9NY39I4sMzm3nA/lHxap/4hhM3SWGln489NyMc0rs6hl725yyZ2icS4EtCD6YePhDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) by DS0PR11MB7310.namprd11.prod.outlook.com
 (2603:10b6:8:11d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 03:47:56 +0000
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::5a59:d223:e831:5b1b]) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::5a59:d223:e831:5b1b%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:47:56 +0000
Message-ID: <cc53d16b-6542-45ea-8793-73376aac6cf8@intel.com>
Date: Fri, 18 Sep 2026 09:17:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Add mnemonic error reason to page fault
 diagnostics
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260917203850.321385-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260917203850.321385-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF67C992ECC:EE_|DS0PR11MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: be890687-462c-4579-908e-08df15379f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|3023799007|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: h7rIDiXp90PczR0faPlFAC9qrNFc5FiEeyjERt2j7qTc3ihMLDjTGnodNzKO1r3gCrY45AAfPU8ZhNmFVdF/dJnklmBUp/Qhh0FKa3PZeBWglG2rpjdDslLbpw4N0oAd2MMKRF1iV37BSp8ama7cPiXSac0LuHl5xzAar+XQeZS3CKo/NriG6zF5DtFffJQHWzvL02XvqaGgqE2zzIQHJQlfeIkz6AZVErB4L2VFT/EFcD4fr5HLbSfK3SfDysowirVQw+qzKEaUJMiELh7VPknyjuZDK9aytV2DZIOYYszxvbAUneSqhUatFTjWJjehBuaBZ9l+++pUIQISox13NV7HtO9VdQrzi6htq7DW7MVvuF1aR3Ej8NH0Lyd2RQdseCTRtuQXKQNN2w+gK9cL51+3EXdd3GbhrQQQ9NMPVpdv1Tg8nq8ywBiHThCWcaLMeJrbvSBKGbVfrd5KXtZenYx9H3PiCtBFys3lWey7OqwQRm+B1tox7WgrLa2k2O8g1v91cZ3jY5W44KFLhTZR3lBdgJuQon5nq3d+aWRyK4+/nGanzhZ6BKoMfOESJUbVafhd4iltESFi5WN7U7/TMhB9k03F3MoSW36Fup7coo9bfHuF+EGGUK9KTGcSEXi1+2//h/xycgLpy5fmfmhWU65FEfSpdWWHFtIIrxDPG10=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF67C992ECC.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmdvVE5Cejh3KzdPRXJSa2V0dUUxZVdnYXlnamdtOXVaWmJqa1BwcXZvU3RU?=
 =?utf-8?B?eExaaGZibEFxVXZJR0FZN01JS2dXNWFJbWk5eS9Yd2haMXh0Ukd4aHBseWM2?=
 =?utf-8?B?YzZlWDJYYmdQVVhjK3l3VU9yYW9COUdCN3FLa0NQczhoUk12bFBlMU03SmFk?=
 =?utf-8?B?SFlQR2VqQS91V1U3N1ZVU21Qb0hyTjQrNTFJcW1MRlJjZXMxUGhOUWFCYXlk?=
 =?utf-8?B?djRpY1dYSVhjREo5ZjZONUJZbFE2Q0dna085T3Rxd2dzTERVUnl3QzRVdGVG?=
 =?utf-8?B?UDB2UE5RU090dUM0OWRGUHlWUWdlZ2lwMm5hdWRBUDFvRlBaanc3KzZvV2N5?=
 =?utf-8?B?QjJ4bExnMXdXcHUrNzZCd25OY29teXpzeldvOTBwSitWY05BRkxGSnp2aUR5?=
 =?utf-8?B?N1VXWEdWNEI5blh5R1BQQlJFLys2MCszaGZDUExhWWpaRURXcnBGMzFzUXpK?=
 =?utf-8?B?ZXZsRzMxUDdrM2xhc1NiS2hYMkhVanVodkZHbDZHcVZkVmVWTHlNajEyTjZp?=
 =?utf-8?B?OFJLRlRQc1J2Umo3dzJjSHNWSU82Um5HNzJkYmFJamtSNTNIVGxPcWZOSjRC?=
 =?utf-8?B?VVlVWHo5OFpncUJXTUxNdFlySjllMEh5QVZGaW1Fb1VJRnJIU2pkVEdPUTVI?=
 =?utf-8?B?am14eFBXWTdyY3RkTjVhMkJVeE1kcEl2bGNtRkpFaDlUTG5YSmExTFRXWlV5?=
 =?utf-8?B?Q0E5QkN6d2VhazEweGV3RWV1RW1NeFJTVEtHRVlGaElpYjgvUWNNNVRMeXg5?=
 =?utf-8?B?cWF5QmRTMnhMZ0FJaGxJa1NFMVozbGRKTkxqdWY4REdiSzcxZzBwanhTZEhn?=
 =?utf-8?B?SkdRUVJJUEkvdDZIMG04QWxzOStkek9hMFRwMGpLNTU5c3JtbFZnU3hZM3RZ?=
 =?utf-8?B?Ny8vQ2dLaWNveDFhd1Q1M25nNGJMU0dsOU1ma3d1RTNXV2lPUVlQRUtOOFl3?=
 =?utf-8?B?SWlsenJ3cWdjUVI3ZE9ZaEVjalQvL2dzTFcrT21sdi9KbXRyLzZHczRwWllB?=
 =?utf-8?B?Mi9sN0crSjUvZVpjemJxSkI1UVBPZGdxZHcvRnRQdDYvSWZ4Y3NOQ2NNOGt0?=
 =?utf-8?B?K0s5Y2g3ZUNlakdkVWlPMDlxZFN5am1SQzhrN2dqNlZyMWd4cGx1OEdoMGZD?=
 =?utf-8?B?K0VWSTF1OHdFdTZLd2t2K3ZNR0JlZENpN2pKbGFWOHU3Q000NUFXQTA2aENw?=
 =?utf-8?B?bWNQUkJlMTNPcXhBVjBRSmRrVG80bWhNZytGZFBmVlhsUUNCenI3TXFtTHI5?=
 =?utf-8?B?RSs4RGxoZy9aNjAzMlZjb0RvYWxxZG9ML3hsMVpwUGRnZWwvb0hqL1FZdGxY?=
 =?utf-8?B?Qllvc051MURLdDE5MDVpcjlUdm9PNTNiUkFnTE5GMi9DeGErNnJFd3NCT3Nm?=
 =?utf-8?B?b3BhdVdlcDdpbTg3TzRHSTdLS1FDMnJ6QXJEaFRDUndWaXpTM2Y4RENQdG11?=
 =?utf-8?B?Tk55ak42c2F2cCt5NEVZNnN0bHYwWmN5dDA1Qjdra2FvWGl6T2JPTkh5T0xL?=
 =?utf-8?B?NlVidzZqeDdrdDdYYVBNNURMck5VcThLaTlvYnAzcC9HVjNKY0JIdGs4RVM4?=
 =?utf-8?B?aVhjcFlYeVRSQ2xSNjBkdXMxQWJPa2p1MERYS0dXK2pqZElqQmxxeGNJSm8v?=
 =?utf-8?B?di9GQkhlblJDYTVqb0tpTE16WWJ4dzFmZG93ZXc0eXVYR2thOGFTUHpuRWU3?=
 =?utf-8?B?N2xIVE0vUEgwenQ5aG44ak1GM3RONDZOYmJkazRWdkhXL2FySm0rL0hHbFNv?=
 =?utf-8?B?ejBHeTZDVXM1SzdKaHpycjd2WTRFdTcxOWppSSs1OWRFRjd2ZHF2Tkg0MWYv?=
 =?utf-8?B?NC95RWtGcTZjNERxYW1TYnZ0UFhxdytpdjhjN3BpMFdkNUpkL0trV2phWlZj?=
 =?utf-8?B?TjJsUmZVcHlDN0dpRDNMNDVEOW5QaTRUNVlucXpHSGN0Q3ZFSm1Cd0JyQlov?=
 =?utf-8?B?MVRxNHNLMm9pbWhWblA2TS9VMWRPSDVWMy9hakFwNE9mdnlCMlJVZ29uTkhR?=
 =?utf-8?B?T2N0d0tTOHNnZXltLzJNeXBLS3NzMHhKVXltQzhrVW5MWWk5M0U5SHRPU3V6?=
 =?utf-8?B?cnZpQlphZGNjQzN3eGIycU5NRHljY3RYR0tpM0tFd3NSMDdwRlpURkhlMFFh?=
 =?utf-8?B?MEdtRjVja1RXS3B1SEZIenFQSStTQmw2WmU1QzNUMHN2R2ZvOEtHUi9Edm1l?=
 =?utf-8?B?Nm95RVJadDZBZ2MrdTczMGYzMmlRbit4VmVCUG44a1luRjF2cTEyWHhoSmps?=
 =?utf-8?B?N0VEVElMSng5aWphUTZUNktQNWM5cExCZzAzUWk0K1grU1NSejdVdUpwbGl0?=
 =?utf-8?B?VS95MDRTeXNvRUgydUNZQmxOcmxKMmg1U2ViK3Rlamp3b2EzQ3NlNmgwN3c5?=
 =?utf-8?Q?5xcQl1DFwwkjecUY=3D?=
X-Exchange-RoutingPolicyChecked: q22rqLSU7xHzgDPU/51qKifyH19c1Enelz0fIMstE1bG4IB+bHF+DnwA4zzJopI1SZMce0zM9MIaF7Dc3BDPDS8vB2AxdbkbtSm7EvDucv+Gf94Cpoj56Caq18yqwIvBq6s3vEUKtaISt1EDik0NmHRsTcuk+ohAhk1sYkHxRzsCVXCGRRA2YokCMTnK1+v4xtn9rE4DVe8tEY0aTv4Bo2xp5XQnwT4nrRHZBZzkOwfvBd2GNrR8Y2E4MPQK+UGzXwKESu+QjXdT+R0b4T6DIueWPLPAvfLUmxEnCrOQoAyQ8RZsfdwLF7YMz7yl2wmpS+etpGGaE7i3xrZLU4a01A==
X-MS-Exchange-CrossTenant-Network-Message-Id: be890687-462c-4579-908e-08df15379f29
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 03:47:56.2858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6YLivDfD/FtwVlJpM+JP1BQ1J5iOMTwhk/9p2sI5HUoBNmY2sFL+OFYjxVeGMCNC8gvfjUfIRgc3wSMH2bwgfnDhWB/YIIHW+DNbEZQTIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
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



On 18-09-2026 02:08, Matthew Brost wrote:
> xe_pagefault_print() was firing without indicating why servicing of a
> fault failed, making it hard to distinguish benign races (e.g. a VM's
> file descriptor closing mid-fault) from real bugs.
> 
> Add enum xe_pagefault_error, uniquely identifying the high-level point
> at which xe_pagefault_service(), xe_pagefault_handle_vma(), and
> xe_svm_handle_pagefault() fail. Since consumer.page_addr is always
> page (4K) aligned, steal the reserved low byte to carry this code
> without growing struct xe_pagefault. Add xe_pagefault_set_error() /
> xe_pagefault_get_error() to encode/decode it, and xe_pagefault_addr()
> as the single accessor for the real (masked) faulted address; update
> all real address consumers (xe_pagefault_match(), cache alignment,
> xe_vm_add_fault_entry_pf()) to go through it instead of reading
> consumer.page_addr directly. xe_pagefault_set_start_addr() now
> preserves any already-recorded error bits rather than clobbering them.
> 
> xe_pagefault_print() decodes the error via a new
> xe_pagefault_error_to_str() and reports it in an added "Error:" line.
> 
> xe_pagefault_asid_to_vm() now distinguishes an ASID with no VM at all
> (XE_PAGEFAULT_ERROR_VM_NOT_FOUND, e.g. the owning file descriptor was
> already closed) from a VM found but not in fault mode
> (XE_PAGEFAULT_ERROR_VM_NOT_IN_FAULT_MODE).
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Assisted-by: GitHub_Copilot:claude-sonnet-5
> 
> ---
> v2:
>   - Add more XE_PAGEFAULT_ERROR_* types for SVM
> v3:
>   - Reset to XE_PAGEFAULT_ERROR_NONE on retries (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_pagefault.c       | 102 +++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_pagefault.h       |  67 +++++++++++++++-
>   drivers/gpu/drm/xe/xe_pagefault_types.h |  82 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_svm.c             |  21 ++++-
>   drivers/gpu/drm/xe/xe_vm.c              |   3 +-
>   5 files changed, 250 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index aeb56ff5d58e..c4aafdbdb518 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -158,8 +158,14 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>   	lockdep_assert_held(&vm->lock);
>   
>   	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
> -	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
> -		return needs_vram < 0 ? needs_vram : -EACCES;
> +	if (needs_vram < 0) {
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_NEEDS_VRAM_CHECK);
> +		return needs_vram;
> +	}
> +	if (needs_vram && xe_vma_is_userptr(vma)) {
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_ATOMIC_USERPTR);
> +		return -EACCES;
> +	}
>   
>   	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
>   	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> @@ -178,13 +184,17 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>   	}
>   
>   	do {
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_NONE);
> +
>   		if (xe_vma_is_userptr(vma) &&
>   		    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
>   			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>   
>   			err = xe_vma_userptr_pin_pages(uvma);
> -			if (err)
> +			if (err) {
> +				xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_USERPTR_PIN);
>   				return err;
> +			}
>   		}
>   
>   		/* Lock VM and BOs dma-resv */
> @@ -195,8 +205,10 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>   						 needs_vram == 1);
>   			drm_exec_retry_on_contention(&exec);
>   			xe_validation_retry_on_oom(&ctx, &err);
> -			if (err)
> +			if (err) {
> +				xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_VALIDATE);
>   				break;
> +			}
>   
>   			/* Bind VMA only to the GT that has faulted */
>   			trace_xe_vma_pf_bind(vma);
> @@ -206,6 +218,7 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>   			if (IS_ERR(fence)) {
>   				err = PTR_ERR(fence);
>   				xe_validation_retry_on_oom(&ctx, &err);
> +				xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_REBIND);
>   				break;
>   			}
>   		}
> @@ -230,16 +243,22 @@ xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
>   	return (access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK) == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
>   }
>   
> -static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
> +static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_pagefault *pf, u32 asid)
>   {
> +	struct xe_device *xe = gt_to_xe(pf->gt);
>   	struct xe_vm *vm;
>   
>   	down_read(&xe->usm.lock);
>   	vm = xa_load(&xe->usm.asid_to_vm, asid);
> -	if (vm && xe_vm_in_fault_mode(vm))
> -		xe_vm_get(vm);
> -	else
> +	if (!vm) {
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VM_NOT_FOUND);
> +		vm = ERR_PTR(-EINVAL);
> +	} else if (!xe_vm_in_fault_mode(vm)) {
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VM_NOT_IN_FAULT_MODE);
>   		vm = ERR_PTR(-EINVAL);
> +	} else {
> +		xe_vm_get(vm);
> +	}
>   	up_read(&xe->usm.lock);
>   
>   	return vm;
> @@ -248,7 +267,6 @@ static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
>   static int xe_pagefault_service(struct xe_pagefault *pf)
>   {
>   	struct xe_gt *gt = pf->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_vm *vm;
>   	struct xe_vma *vma = NULL;
>   	int err;
> @@ -259,7 +277,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>   	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
>   		return -EFAULT;
>   
> -	vm = xe_pagefault_asid_to_vm(xe, asid);
> +	vm = xe_pagefault_asid_to_vm(pf, asid);
>   	if (IS_ERR(vm))
>   		return PTR_ERR(vm);
>   
> @@ -267,18 +285,21 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>   
>   	if (xe_vm_is_closed(vm)) {
>   		err = -ENOENT;
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VM_CLOSED);
>   		goto unlock_vm;
>   	}
>   
> -	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
> +	vma = xe_vm_find_vma_by_addr(vm, xe_pagefault_addr(pf));
>   	if (!vma) {
>   		err = -EINVAL;
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_NOT_FOUND);
>   		goto unlock_vm;
>   	}
>   
>   	if (xe_vma_read_only(vma) &&
>   	    pf->consumer.access_type != XE_PAGEFAULT_ACCESS_TYPE_READ) {
>   		err = -EPERM;
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_READ_ONLY_VIOLATION);
>   		goto unlock_vm;
>   	}
>   
> @@ -286,7 +307,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>   
>   	if (xe_vma_is_cpu_addr_mirror(vma))
>   		err = xe_svm_handle_pagefault(vm, vma, pf, gt,
> -					      pf->consumer.page_addr, atomic);
> +					      xe_pagefault_addr(pf), atomic);
>   	else
>   		err = xe_pagefault_handle_vma(gt, vma, pf, atomic);
>   
> @@ -375,7 +396,7 @@ static bool xe_pagefault_match(struct xe_pagefault *pf, u64 start,
>   			       u64 end, u64 cache_asid)
>   {
>   	struct xe_device *xe = gt_to_xe(pf->gt);
> -	u64 page_addr = pf->consumer.page_addr;
> +	u64 page_addr = xe_pagefault_addr(pf);
>   	u32 pf_asid = FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id);
>   
>   	xe_assert(xe, pf->consumer.alloc_state !=
> @@ -499,7 +520,7 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>   	if (FIELD_GET(XE_PAGEFAULT_REQUEUE_MASK,
>   		      lpf->consumer.fault_type_level))
>   		align = SZ_4K;
> -	pf_work->cache.start = ALIGN_DOWN(lpf->consumer.page_addr, align);
> +	pf_work->cache.start = ALIGN_DOWN(xe_pagefault_addr(lpf), align);
>   	pf_work->cache.end = pf_work->cache.start + align;
>   	pf_work->cache.asid = FIELD_GET(XE_PAGEFAULT_ASID_MASK, lpf->consumer.id);
>   	pf_work->cache.pf = lpf;
> @@ -542,10 +563,53 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>   	return true;
>   }
>   
> +static const char *xe_pagefault_error_to_str(enum xe_pagefault_error error)
> +{
> +	switch (error) {
> +	case XE_PAGEFAULT_ERROR_NONE:
> +		return "NONE";
> +	case XE_PAGEFAULT_ERROR_VM_NOT_FOUND:
> +		return "VM_NOT_FOUND";
> +	case XE_PAGEFAULT_ERROR_VM_NOT_IN_FAULT_MODE:
> +		return "VM_NOT_IN_FAULT_MODE";
> +	case XE_PAGEFAULT_ERROR_VM_CLOSED:
> +		return "VM_CLOSED";
> +	case XE_PAGEFAULT_ERROR_VMA_NOT_FOUND:
> +		return "VMA_NOT_FOUND";
> +	case XE_PAGEFAULT_ERROR_READ_ONLY_VIOLATION:
> +		return "READ_ONLY_VIOLATION";
> +	case XE_PAGEFAULT_ERROR_VMA_NEEDS_VRAM_CHECK:
> +		return "VMA_NEEDS_VRAM_CHECK";
> +	case XE_PAGEFAULT_ERROR_VMA_ATOMIC_USERPTR:
> +		return "VMA_ATOMIC_USERPTR";
> +	case XE_PAGEFAULT_ERROR_VMA_USERPTR_PIN:
> +		return "VMA_USERPTR_PIN";
> +	case XE_PAGEFAULT_ERROR_VMA_VALIDATE:
> +		return "VMA_VALIDATE";
> +	case XE_PAGEFAULT_ERROR_VMA_REBIND:
> +		return "VMA_REBIND";
> +	case XE_PAGEFAULT_ERROR_SVM_GARBAGE_COLLECTOR:
> +		return "SVM_GARBAGE_COLLECTOR";
> +	case XE_PAGEFAULT_ERROR_SVM_RANGE_NOT_FOUND:
> +		return "SVM_RANGE_NOT_FOUND";
> +	case XE_PAGEFAULT_ERROR_SVM_REBIND:
> +		return "SVM_REBIND";
> +	case XE_PAGEFAULT_ERROR_SVM_NEEDS_VRAM_CHECK:
> +		return "SVM_NEEDS_VRAM_CHECK";
> +	case XE_PAGEFAULT_ERROR_SVM_VMA_NOT_FOUND:
> +		return "SVM_VMA_NOT_FOUND";
> +	case XE_PAGEFAULT_ERROR_SVM_SERVICE_FAILED:
> +		return "SVM_SERVICE_FAILED";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
>   static void xe_pagefault_print(struct xe_pagefault *pf)
>   {
>   	u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
>   				    pf->consumer.engine_class_instance);
> +	u64 addr = xe_pagefault_addr(pf);
>   
>   	xe_gt_info(pf->gt, "\n\tASID: %lu\n"
>   		   "\tFaulted Address: 0x%08x%08x\n"
> @@ -554,11 +618,12 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>   		   "\tFaultLevel: %lu\n"
>   		   "\tEngineClass: %d %s\n"
>   		   "\tEngineInstance: %lu\n"
> -		   "\tSRCID: 0x%02lx\n",
> +		   "\tSRCID: 0x%02lx\n"
> +		   "\tError: %s\n",
>   		   FIELD_GET(XE_PAGEFAULT_ASID_MASK,
>   			     pf->consumer.id),
> -		   upper_32_bits(pf->consumer.page_addr),
> -		   lower_32_bits(pf->consumer.page_addr),
> +		   upper_32_bits(addr),
> +		   lower_32_bits(addr),
>   		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
>   			     pf->consumer.fault_type_level),
>   		   FIELD_GET(XE_PAGEFAULT_ACCESS_TYPE_MASK,
> @@ -570,7 +635,8 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>   		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
>   			     pf->consumer.engine_class_instance),
>   		   FIELD_GET(XE_PAGEFAULT_SRCID_MASK,
> -			     pf->consumer.id));
> +			     pf->consumer.id),
> +		   xe_pagefault_error_to_str(xe_pagefault_get_error(pf)));
>   }
>   
>   static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
> index e9c5d1f03760..799c984dee84 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> @@ -6,6 +6,8 @@
>   #ifndef _XE_PAGEFAULT_H_
>   #define _XE_PAGEFAULT_H_
>   
> +#include <linux/bitfield.h>
> +
>   #include "xe_pagefault_types.h"
>   
>   struct drm_printer;
> @@ -21,6 +23,61 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
>   
>   void xe_pagefault_print_info(struct xe_device *xe, struct drm_printer *p);
>   
> +/*
> + * consumer.page_addr is always page (4K) aligned, so the low bits are
> + * reserved and unused by the real address. Steal a byte of those bits to
> + * record an &enum xe_pagefault_error describing the high-level point at
> + * which servicing of the fault failed, so it can be reported by
> + * xe_pagefault_print(). All real address consumers of page_addr must go
> + * through xe_pagefault_addr() to mask off these reserved bits.
> + */
> +#define XE_PAGEFAULT_ERROR_MASK		GENMASK_ULL(7, 0)
> +
> +/**
> + * xe_pagefault_set_error() - record the failure reason for a pagefault
> + * @pf: Pagefault entry
> + * @error: Failure reason
> + *
> + * Encodes @error into the reserved low bits of consumer.page_addr. Should be
> + * called at the high-level point a pagefault fails to service so
> + * xe_pagefault_print() can later report a mnemonic failure reason.
> + */
> +static inline void
> +xe_pagefault_set_error(struct xe_pagefault *pf, enum xe_pagefault_error error)
> +{
> +	pf->consumer.page_addr &= ~XE_PAGEFAULT_ERROR_MASK;
> +	pf->consumer.page_addr |= FIELD_PREP(XE_PAGEFAULT_ERROR_MASK, error);
> +}
> +
> +/**
> + * xe_pagefault_get_error() - read the failure reason for a pagefault
> + * @pf: Pagefault entry
> + *
> + * Return: The &enum xe_pagefault_error previously recorded via
> + * xe_pagefault_set_error(), or %XE_PAGEFAULT_ERROR_NONE if none was recorded.
> + */
> +static inline enum xe_pagefault_error
> +xe_pagefault_get_error(struct xe_pagefault *pf)
> +{
> +	return FIELD_GET(XE_PAGEFAULT_ERROR_MASK, pf->consumer.page_addr);
> +}
> +
> +/**
> + * xe_pagefault_addr() - read the real faulted address for a pagefault
> + * @pf: Pagefault entry
> + *
> + * consumer.page_addr may have failure reason bits encoded into its reserved
> + * low bits by xe_pagefault_set_error(). This masks those bits off, returning
> + * the real page address. All accesses to the faulted address must go through
> + * this helper rather than reading consumer.page_addr directly.
> + *
> + * Return: The real (page aligned) faulted address.
> + */
> +static inline u64 xe_pagefault_addr(struct xe_pagefault *pf)
> +{
> +	return pf->consumer.page_addr & ~XE_PAGEFAULT_ERROR_MASK;
> +}
> +
>   #define XE_PAGEFAULT_END_ADDR_MASK	(~0xfffull)
>   
>   /**
> @@ -69,11 +126,17 @@ static inline u64 xe_pagefault_end_addr(struct xe_pagefault *pf)
>    * The pagefault consumer stores the resolved fault range so subsequent faults
>    * hitting the same range can be immediately acknowledged without re-running
>    * the full fault handling path.
> + *
> + * The start address shares storage with the failure reason recorded by
> + * xe_pagefault_set_error() and therefore must be masked with
> + * %XE_PAGEFAULT_ERROR_MASK before storing so any previously recorded error is
> + * preserved.
>    */
>   static inline void
>   xe_pagefault_set_start_addr(struct xe_pagefault *pf, u64 start_addr)
>   {
> -	pf->consumer.page_addr = start_addr;
> +	pf->consumer.page_addr &= XE_PAGEFAULT_ERROR_MASK;
> +	pf->consumer.page_addr |= (start_addr & ~XE_PAGEFAULT_ERROR_MASK);
>   }
>   
>   /**
> @@ -87,7 +150,7 @@ xe_pagefault_set_start_addr(struct xe_pagefault *pf, u64 start_addr)
>    */
>   static inline u64 xe_pagefault_start_addr(struct xe_pagefault *pf)
>   {
> -	return pf->consumer.page_addr;
> +	return xe_pagefault_addr(pf);
>   }
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index 907189b73286..8ae6b9848bdc 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -32,6 +32,88 @@ enum xe_pagefault_type {
>   	XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION	= 2,
>   };
>   
> +/**
> + * enum xe_pagefault_error - Xe page fault servicing error
> + *
> + * Uniquely identifies the high-level point at which servicing of a page
> + * fault failed. Encoded into the reserved low bits of
> + * &xe_pagefault.consumer.page_addr (which is always page aligned) so the
> + * failure reason can be threaded back up to xe_pagefault_print() without
> + * growing the size of struct xe_pagefault. See xe_pagefault_set_error() and
> + * xe_pagefault_error_to_str().
> + */
> +enum xe_pagefault_error {
> +	/** @XE_PAGEFAULT_ERROR_NONE: No error recorded */
> +	XE_PAGEFAULT_ERROR_NONE = 0,
> +	/**
> +	 * @XE_PAGEFAULT_ERROR_VM_NOT_FOUND: VM lookup by ASID failed, e.g.
> +	 * the VM's file descriptor was already closed and the ASID has been
> +	 * torn down
> +	 */
> +	XE_PAGEFAULT_ERROR_VM_NOT_FOUND,
> +	/**
> +	 * @XE_PAGEFAULT_ERROR_VM_NOT_IN_FAULT_MODE: VM found by ASID lookup
> +	 * but is not in fault mode
> +	 */
> +	XE_PAGEFAULT_ERROR_VM_NOT_IN_FAULT_MODE,
> +	/** @XE_PAGEFAULT_ERROR_VM_CLOSED: VM found but already closed */
> +	XE_PAGEFAULT_ERROR_VM_CLOSED,
> +	/** @XE_PAGEFAULT_ERROR_VMA_NOT_FOUND: No VMA covers the faulted address */
> +	XE_PAGEFAULT_ERROR_VMA_NOT_FOUND,
> +	/**
> +	 * @XE_PAGEFAULT_ERROR_READ_ONLY_VIOLATION: Write/atomic fault on a
> +	 * read-only VMA
> +	 */
> +	XE_PAGEFAULT_ERROR_READ_ONLY_VIOLATION,
> +	/**
> +	 * @XE_PAGEFAULT_ERROR_VMA_NEEDS_VRAM_CHECK: Failed determining if VMA
> +	 * requires VRAM for an atomic access
> +	 */
> +	XE_PAGEFAULT_ERROR_VMA_NEEDS_VRAM_CHECK,
> +	/**
> +	 * @XE_PAGEFAULT_ERROR_VMA_ATOMIC_USERPTR: Atomic access requires VRAM
> +	 * but VMA is a userptr, which is unsupported
> +	 */
> +	XE_PAGEFAULT_ERROR_VMA_ATOMIC_USERPTR,
> +	/** @XE_PAGEFAULT_ERROR_VMA_USERPTR_PIN: Userptr page pin/repin failed */
> +	XE_PAGEFAULT_ERROR_VMA_USERPTR_PIN,
> +	/**
> +	 * @XE_PAGEFAULT_ERROR_VMA_VALIDATE: Failed to lock/validate VMA's BO
> +	 * or migrate it to VRAM
> +	 */
> +	XE_PAGEFAULT_ERROR_VMA_VALIDATE,
> +	/** @XE_PAGEFAULT_ERROR_VMA_REBIND: Failed to rebind VMA into page tables */
> +	XE_PAGEFAULT_ERROR_VMA_REBIND,
> +	/**
> +	 * @XE_PAGEFAULT_ERROR_SVM_GARBAGE_COLLECTOR: Failed processing
> +	 * pending SVM garbage collection (unmaps) prior to servicing the
> +	 * fault
> +	 */
> +	XE_PAGEFAULT_ERROR_SVM_GARBAGE_COLLECTOR,
> +	/**
> +	 * @XE_PAGEFAULT_ERROR_SVM_RANGE_NOT_FOUND: Failed to find or insert
> +	 * an SVM range covering the faulted address
> +	 */
> +	XE_PAGEFAULT_ERROR_SVM_RANGE_NOT_FOUND,
> +	/** @XE_PAGEFAULT_ERROR_SVM_REBIND: Failed to rebind an SVM range into page tables */
> +	XE_PAGEFAULT_ERROR_SVM_REBIND,
> +	/**
> +	 * @XE_PAGEFAULT_ERROR_SVM_NEEDS_VRAM_CHECK: Failed determining if SVM
> +	 * VMA requires VRAM for an atomic access
> +	 */
> +	XE_PAGEFAULT_ERROR_SVM_NEEDS_VRAM_CHECK,
> +	/**
> +	 * @XE_PAGEFAULT_ERROR_SVM_VMA_NOT_FOUND: SVM VMA re-lookup after a
> +	 * range split failed to find a covering VMA
> +	 */
> +	XE_PAGEFAULT_ERROR_SVM_VMA_NOT_FOUND,
> +	/**
> +	 * @XE_PAGEFAULT_ERROR_SVM_SERVICE_FAILED: SVM range population,
> +	 * migration, or bind failed
> +	 */
> +	XE_PAGEFAULT_ERROR_SVM_SERVICE_FAILED,
> +};
> +
>   /** struct xe_pagefault_ops - Xe pagefault ops (producer) */
>   struct xe_pagefault_ops {
>   	/**
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 6c3033fc4db7..f39e647512ad 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1304,16 +1304,20 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   
>   	/* Always process UNMAPs first so view SVM ranges is current */
>   	err = xe_svm_garbage_collector(vm);
> -	if (err)
> +	if (err) {
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_SVM_GARBAGE_COLLECTOR);
>   		return err;
> +	}
>   
>   	dpagemap = ctx.devmem_only ? xe_tile_local_pagemap(tile) :
>   		xe_vma_resolve_pagemap(vma, tile);
>   	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>   	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
>   
> -	if (IS_ERR(range))
> +	if (IS_ERR(range)) {
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_SVM_RANGE_NOT_FOUND);
>   		return PTR_ERR(range);
> +	}
>   
>   	xe_svm_range_fault_count_stats_incr(gt, range);
>   
> @@ -1415,6 +1419,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   			err = PTR_ERR(fence);
>   			xe_validation_retry_on_oom(&vctx, &err);
>   			xe_svm_range_bind_us_stats_incr(gt, range, bind_start);
> +			xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_SVM_REBIND);
>   			break;
>   		}
>   	}
> @@ -1437,6 +1442,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   
>   err_out:
>   	if (err == -EAGAIN) {
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_NONE);
>   		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>   		range_debug(range, "PAGE FAULT - RETRY BIND");
>   		goto retry;
> @@ -1469,8 +1475,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	int need_vram, ret;
>   retry:
>   	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
> -	if (need_vram < 0)
> +	if (need_vram < 0) {
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_SVM_NEEDS_VRAM_CHECK);
>   		return need_vram;
> +	}
>   
>   	ret =  __xe_svm_handle_pagefault(vm, vma, pf, gt, fault_addr,
>   					 need_vram ? true : false);
> @@ -1480,11 +1488,16 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   		 * may have been split by xe_svm_range_set_default_attr.
>   		 */
>   		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
> -		if (!vma)
> +		if (!vma) {
> +			xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_SVM_VMA_NOT_FOUND);
>   			return -EINVAL;
> +		}
>   
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_NONE);
>   		goto retry;
>   	}
> +	if (ret && xe_pagefault_get_error(pf) == XE_PAGEFAULT_ERROR_NONE)
> +		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_SVM_SERVICE_FAILED);
>   	return ret;
>   }

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index efa5ff6cc823..17dc4debe7c1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -29,6 +29,7 @@
>   #include "xe_exec_queue.h"
>   #include "xe_gt.h"
>   #include "xe_migrate.h"
> +#include "xe_pagefault.h"
>   #include "xe_pat.h"
>   #include "xe_pm.h"
>   #include "xe_preempt_fence.h"
> @@ -643,7 +644,7 @@ void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf)
>   		return;
>   	}
>   
> -	e->address = pf->consumer.page_addr;
> +	e->address = xe_pagefault_addr(pf);
>   	/*
>   	 * TODO:
>   	 * Address precision is currently always SZ_4K, but this may change

