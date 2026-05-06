Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95424CD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 16:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B58D10EE1C;
	Wed,  6 May 2026 16:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVL1k+Kx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0D210E554
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778083202; x=1809619202;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PXMMhYP9VAoCRx9sum3TuGAgUoy7zbs8ugyRrGCbuYA=;
 b=nVL1k+Kx1fREPny86BGzGDv5gDh4IuH/YxucKLzzzZHUBvPpe7m0zfHT
 IzUh6C2lT7kCZo/FcocQIog9oheKxypjxE81b32aSiyois4jzYyNHft7X
 SE7aL7rj0thsWgRoOjny19q1VFK/oJFTj6ne1v3o4Mf9bl2rAQuNr7uDY
 /uyWyZtPVYY6dgxErFrErCD+9FPqI8L9aCIGC4MvM0urwkFMMt9IGOhCz
 Aw2+Vra4g56T+c/t+qs2eoUUlRJvxC/5RMjP9yUFBuFeQ4PfvjIJy2bfS
 rcgtgvPH1uZMFwkh8xpOdoNwmPoPVl9iTag8/lidWHsxcCyELkiwNb0M9 g==;
X-CSE-ConnectionGUID: voMZbALoTCqeoTt3Rjw6uQ==
X-CSE-MsgGUID: OGdrJomTRs250Xmr8TvVNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79033126"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="79033126"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:59:53 -0700
X-CSE-ConnectionGUID: 5uT3wOiRQ5GqUVQSdEseHw==
X-CSE-MsgGUID: zbYwfYkdTVWPwJMSBEBEHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="235178736"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:59:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 08:59:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 08:59:51 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 08:59:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3JJQ0+TIVhhu09t4M9eFP29tpiiCC2sNrGUfCt/hZUA5y4/giN2WiDzcAzIJj5ezsSClis+TsAEIhhdtqB9M1Sw7bTqa20ET58e+wnT7fAoAGh5vWNiL43Ov09ZGSNBO7B80qNO8uY6Xr9kaPEgAbOLNsNjSGUIhZZOusX89cYi6iSINg8c7xbzVhrkV0bvezwI218Av2GbtrxGUyp4h7B7/smU0aZwkTz7ZJ0jVWVZgy34mDpu4Cb78kpmgAR9FIVQD2uTgz7E2t/pEobo+67QYWYFMFCEar/fl+ohMVLM1BlKB1Z7H8k4qmrGfCL8wrzU4V4FIClgpCxaltR2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VP5AQ1Uh1qUZx9/QacZ0j+6DoScbIYcxqerm6a9RTFs=;
 b=I5mzz3jl2yr+p2T5oHKdNJKhfb0Ln0HAp8mTqRVuktkfn13CUlnF0POLRGJ5YO6j4Xl7Y/rubJe1UXyM3WrJiaMLKYmZsc9XmyrQ+FxFu+Xi0z/NvvU4CwRFmIIwELDYNMeJGylMBldOV7E8A+tzRuiMTH7qi/fjcm6/Jb2E/fjjgCaq5Z2Cg7C0hy9ek4KL1IGQHaOm0YkGl5lhdTy1cfT/CV33RsN2V9EeOkxkNqL+Xh2Zudz86Ygu+L1xeWfVhGzgXTynWVpQe8SfOZdoHSVQHTMtUTw4qrXEOqnKv8k98s5VTOjrQkHDHlTzas6FiOe5f+RaLbBD1Fn2BEcZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by SN7PR11MB7020.namprd11.prod.outlook.com (2603:10b6:806:2af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 15:59:46 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 15:59:46 +0000
Message-ID: <ad1df3ca-2b77-4a83-a009-c9930643483d@intel.com>
Date: Wed, 6 May 2026 17:59:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] drm/xe: Add num_pf_work modparam
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <francois.dugast@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-6-matthew.brost@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260226042834.2963245-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0179.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::34) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|SN7PR11MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: cf430097-5a55-4fb0-07bc-08deab887e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: gQ/kB0L0VoHdk/HM1cF2XDG5vrNvzXWa+oxvQffLD/AfgALykqymoMxA7ehRjuGuRo/P2IhtLubhI7PCZgzP8Ms0VRKTgRxgF8R0iNy+YfH2z5vbEnP1YyW24RV5S84WYnqvxWY7FU5ItvwI5HX2iDY67aevECOorNfccbLz1QmhKelNZlUOP+Qz/PoCdLUkJylEDKA50FuEY0Tg57G2LwjtxRId1GWYwtecvHMd2vbXzlNEAf+1/Ie8uRn+hWV3YFfrzcVvAOHDCn/Kzxpg1PJwAxIXBBr1QcG82Bn0jNE5f/2yeM5j9cvrvWi62xRonX/h8BzJyQQi0oDRS6tIxGwEPIIeovZQmO1Xqn3AsbNUFVEOaQwFLxWpGu78NWMS6jkCihT9BSPQeFfNIwNaj/Kpd82KMF0H1D6j5SCLK+5r3X117r+dJnh5HQvod6xAbGGIgiSk9Z6zvIc1IIRvs0HVyL2hZUNabefNbsQbllYszgg8Gc3RrX5NdgZe+3rrwpvxSziSY1NYY/J//VB0A6pg7uBxrAkFUuPzf7SHAAv4yKCfpgFIaYQfdqVUIfBh2msY8AzwRswJzurZgXaDdg7tHPzKTq9FxYAWLChXq5I/YvPpvRPYW0mi33yF1fSEM7N5D58d9fN7piFVGav0APLQRNvWDrR6mhjVhrFD0ZpmCPdTGxa/Z/lfvP13K5I5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkY0cHp1T0JEV3prSHJhQm1xTEROSUFDbkRRanJucEloRnVSSWRvdS9Gdjhp?=
 =?utf-8?B?U3lmbkorTm9nRWxWa3BPb1pUZ3haaXlFVUJBaWZYN1piMGt2UDVQQkVTOUtX?=
 =?utf-8?B?aElwUW1LN0JBM0ptOWR1LytvOFRldkdpS1AvbW5PMWtSZGx0aHlkb3gwRkl6?=
 =?utf-8?B?a294em5wd2hmS1FYUTlrT1RqeUpOc0ltTDV1UzM4NklNdktaRG1nNzJFTVpC?=
 =?utf-8?B?Q0IrSzYzdC9uRkwzSWdib2dWZE1yOFNvQ1dhRGxLTmlwNmNRcDh3UGE5NXI2?=
 =?utf-8?B?RGIrVmxyL1VQVkw4ZHhKbnhPclB6QjAyWVN5TFZVbzN6Vmx6eFpPS3dOVkRk?=
 =?utf-8?B?b3o3MVVLUjBjQ00vVXlkOFZ1K2tQMnRIcEhMbGhmcGdDcjlHSW5XTEMyNWp4?=
 =?utf-8?B?MjR0Yy9PcGJFeWVtMkFxZ0Z3ZGlPRFhIcDE2WGJqYUZWK0prN3dmZG1DMUI5?=
 =?utf-8?B?a2VtUnlEMy9tcEdBNHRjdkpyampXYUoxN2pISUhhVE5Ob013UmtRbFdDVkJG?=
 =?utf-8?B?YmVhQ2ZBdHpsSlhkYmlDL0JDd1BjUEJVSGltQTJBN2lWSTFTTC9xZEpNRVVD?=
 =?utf-8?B?TFJmYVo1dkF6bEVxUzNiUFdRK3p4dEtkUEhYYURjVmRMTFdLNHZkS1pSUUdP?=
 =?utf-8?B?eUhHNUJWUW50R0hHYjBGS1JKNTNSV3VYMDRNZ2N0MXg2Y3Vza21uREduMG82?=
 =?utf-8?B?aXNkTG5XSkl2SDNEbU9QSFFqRXVvVVJPTHoyK0hOYU9hTGxSSWFoTlQ3cGVT?=
 =?utf-8?B?VlZxZ1d5d0xBZXYzVnh0SGJpcFUrQ1I0TmVVajJLUjhiQm41dlZxWkZnb2hv?=
 =?utf-8?B?ZStYcnJuMy9YYlBXUXpENXM5YnV5Q0xBUVhybHpOMzRYd0pTSk91aW92YlRN?=
 =?utf-8?B?NjFoZ1BLanFHU2pFYVlyaENSOXh2Ui8wUlRKYTBkdG1IT3FoYjg5QVBoNlhT?=
 =?utf-8?B?bHRwM3BhZE5lbm9sVEVXYXNQWnh1azQzYmtMU2lOcE9YVFlKRGh4OVIrVGRK?=
 =?utf-8?B?MXU3aTJsS1pPREdpMkk1R0pzTGZvby9mUklFUFQ5ZFNYcFhlcDA2OFN3TzJ3?=
 =?utf-8?B?VVVyZ1FCcHZGRUNhQkVaTy9heWZ3cjNkR0hJdnY5SEllZ29XTkNpK0F0Yy9C?=
 =?utf-8?B?SHF3R1IwdkhCbmNjWjRwTVNqUmROQ3Y2UVA0RGY2WEswZ2FoMllvcmpCRzYr?=
 =?utf-8?B?ZlhsdW9HTGpGMXNyR3RXVTA2OVl5ZGp5NCsxY1B2TTdNVzdNUXF3UVR1aEE2?=
 =?utf-8?B?ZUhCcEVCUU83VGp0MmFGcHcyVXpOOFFTTXhLVFA0TnZybzhFM2F5UXQ1akZl?=
 =?utf-8?B?Q2pXTGY5S1dYbTg2UHNmVG1MRlp6MnE2WVRDOTdJRWZJb0I4TXdKYnhXMEZB?=
 =?utf-8?B?dExEYmJOdk5BelYvVDJwb0k4SHZVd1JRQUxtNUhXNWdYeGxXVXZSK21IbmJT?=
 =?utf-8?B?UUh6VURxaGdQaU9mVmI4VDBWOWdGQWFTbFRhVmpNOXpwVjBQaUZqL01XZElM?=
 =?utf-8?B?RDJscS9nM3l1NzA1TW1lc1B6Vnd1VWpLV0lJSngwUXc1Sk8wVHhBeVdtbGdo?=
 =?utf-8?B?VGZYb1RFaklyY1hrNmhPR2FTRnR0eHRrRzlxc3NEU0FSR0czcG0xWDV3Wk1I?=
 =?utf-8?B?Z0tGcWlZanl3bE1VWEU4bloxZ2k0N0Iralc1cE5GTE5VN1FpWFNiUG1MT0Ry?=
 =?utf-8?B?S3praitISTkvck5HZ2RNVFZVRGFyTWRkTHdHc1k3NjJoc1JyVlRpSDN6eWpj?=
 =?utf-8?B?bG5LckR3YlI4Z2gwSUE0ZzlQMnRWMmZyMCtxdEoxWHFXbEorclg2YTdVdThP?=
 =?utf-8?B?RFl1c3pxN2RKN1IvYTE5Z2gvR2JaQ202ai9FaUI0eTAxci93Tzd1UEJ5WWhl?=
 =?utf-8?B?dE1qQkJ1VWZ5Z1VML3VwQUdmYUI2MkhiWjBqSjB5b1hmSml1c2hqSFhES1JJ?=
 =?utf-8?B?dEMvTW9ueHQ4K2pXc29US2RnR3pXUi9uNUVxbndMbXdLVUZvYTcwZFNsWHRC?=
 =?utf-8?B?LzhvRnpWeXJTd1ZKVUc3Zml6UWhTb3pqSWpYRXMvMUg4MWM1OU5pVFhKRWVR?=
 =?utf-8?B?YmtqMVh0WDg2ZGczVkVQMnBHbXVrSlROTWV5eThZbzI1aVRzTzZhbENtNktQ?=
 =?utf-8?B?M09mN2JoMFMvS2NoRit0c3FrUVZVOE1CYWF1QmVCRUdsR2NGYUVkellVQ0dY?=
 =?utf-8?B?dWk2NkN5TXY5NHBwWFFZRnRUS0NPQmFuMVVFbGt0TVcyYnc0aUhJTTJWK2Jx?=
 =?utf-8?B?WDl1K1BacW4vMmVxMlA0NnlJbDFqR0U4cGZIeU5nNi9ZVHRsWFFuSVJJQUVZ?=
 =?utf-8?B?dnQwcG84b2JKWjFNQ3lsYUVnVisrYjk0S0x3L1NNV0EwMWliYW9ua25LTGNu?=
 =?utf-8?Q?UBYqTGLylzp+o848=3D?=
X-Exchange-RoutingPolicyChecked: t03Hw1ed/Mc1HluznB+ArobFtBBCXwzNb7M6pvQkoKXdl40xEM8j9r4jt8q6LH9Bbb6FDSN50eUEj4B4Yh0hvbvpdTrQu7umMdPXLQwOCZp/Q/JkNobOmNSBdJ+9IviZkK/oqnxaNLVWh1NtKlSpPDmUS3HPFhLTURZKdEMm2sUGqmLXOzgz7COvow1542OchihqMDoVsjUPX86gAAMWAE+1Nvz0kdwAg8tCHq+M81ou61zQQ3aBR2jvXf9Zov/aYk5yDDPADuvaGyXOq+/667xkHThjV8bbI5OxFGoAIMDc7UTGznTT89nAq/ScwbMqkAEPTroAWQs7VYDZTaoaIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf430097-5a55-4fb0-07bc-08deab887e73
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 15:59:46.1124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQ0sssSpjBirLRxhVTh40/uT7voaJOapATEBFqdAqS6tf+K1Cxc5mL/6BFG7ULBnbjV3yIM6L605aVWPlfvVc2/TG3+/Ce9PLXnTNwT6g/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7020
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

On 26/02/2026 05:28, Matthew Brost wrote:

> Add a module parameter to control the number of page-fault work threads,
> making it easy to experiment with how different numbers of work threads
> impact performance.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_defaults.h     |  1 +
>   drivers/gpu/drm/xe/xe_device.c       | 17 ++++++++++++++---
>   drivers/gpu/drm/xe/xe_device_types.h | 11 ++++-------
>   drivers/gpu/drm/xe/xe_module.c       |  4 ++++
>   drivers/gpu/drm/xe/xe_module.h       |  1 +
>   drivers/gpu/drm/xe/xe_pagefault.c    |  6 +++---
>   drivers/gpu/drm/xe/xe_vm.c           |  3 ++-
>   7 files changed, 29 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
> index 5d5d41d067c5..2e615cf896b2 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -22,5 +22,6 @@
>   #define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
>   #define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
>   #define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
> +#define XE_DEFAULT_NUM_PF_WORK			2
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3462645ca13c..0571079a09e8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -436,6 +436,18 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>   	ttm_device_fini(&xe->ttm);
>   }
>   
> +static void xe_device_parse_modparam(struct xe_device *xe)
> +{
> +	xe->info.force_execlist = xe_modparam.force_execlist;
> +	xe->atomic_svm_timeslice_ms = 5;
> +	xe->min_run_period_lr_ms = 5;
> +	xe->info.num_pf_work = xe_modparam.num_pf_work;
> +	if (xe->info.num_pf_work < 1)
> +		xe->info.num_pf_work = 1;
> +	else if (xe->info.num_pf_work > XE_PAGEFAULT_WORK_MAX)
> +		xe->info.num_pf_work = XE_PAGEFAULT_WORK_MAX;
> +}
> +
>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>   				   const struct pci_device_id *ent)
>   {
> @@ -469,9 +481,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   
>   	xe->info.devid = pdev->device;
>   	xe->info.revid = pdev->revision;
> -	xe->info.force_execlist = xe_modparam.force_execlist;
> -	xe->atomic_svm_timeslice_ms = 5;
> -	xe->min_run_period_lr_ms = 5;
> +
> +	xe_device_parse_modparam(xe);
>   
>   	err = xe_irq_init(xe);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0558dfd52541..a027ca5f6828 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -130,6 +130,8 @@ struct xe_device {
>   		u8 revid;
>   		/** @info.step: stepping information for each IP */
>   		struct xe_step_info step;
> +		/** @info.num_pf_work: Number of page fault work thread */
> +		int num_pf_work;
>   		/** @info.dma_mask_size: DMA address bits */
>   		u8 dma_mask_size;
>   		/** @info.vram_flags: Vram flags */
> @@ -310,14 +312,9 @@ struct xe_device {
>   		struct rw_semaphore lock;
>   		/** @usm.pf_wq: page fault work queue, unbound, high priority */
>   		struct workqueue_struct *pf_wq;
> -		/*
> -		 * We pick 4 here because, in the current implementation, it
> -		 * yields the best bandwidth utilization of the kernel paging
> -		 * engine.
> -		 */
> -#define XE_PAGEFAULT_WORK_COUNT	4
> +#define XE_PAGEFAULT_WORK_MAX	8
>   		/** @usm.pf_workers: Page fault workers */
> -		struct xe_pagefault_work pf_workers[XE_PAGEFAULT_WORK_COUNT];
> +		struct xe_pagefault_work pf_workers[XE_PAGEFAULT_WORK_MAX];
>   		/** @usm.pf_queue: Page fault queue */
>   		struct xe_pagefault_queue pf_queue;
>   #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 903d3b433421..c750db4b579c 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -28,6 +28,7 @@ struct xe_modparam xe_modparam = {
>   	.max_vfs =		XE_DEFAULT_MAX_VFS,
>   #endif
>   	.wedged_mode =		XE_DEFAULT_WEDGED_MODE,
> +	.num_pf_work =		XE_DEFAULT_NUM_PF_WORK,
>   	.svm_notifier_size =	XE_DEFAULT_SVM_NOTIFIER_SIZE,
>   	/* the rest are 0 by default */
>   };
> @@ -81,6 +82,9 @@ MODULE_PARM_DESC(wedged_mode,
>   		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-error, 2=upon-any-hang-no-reset "
>   		 "[default=" XE_DEFAULT_WEDGED_MODE_STR "])");
>   
> +module_param_named(num_pf_work, xe_modparam.num_pf_work, int, 0600);
> +MODULE_PARM_DESC(num_pf_work, "Number of page fault work threads, default=2, min=1, max=8");
> +
>   static int xe_check_nomodeset(void)
>   {
>   	if (drm_firmware_drivers_only())
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 79cb9639c0f3..c6642523184a 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -22,6 +22,7 @@ struct xe_modparam {
>   	unsigned int max_vfs;
>   #endif
>   	unsigned int wedged_mode;
> +	unsigned int num_pf_work;
>   	u32 svm_notifier_size;
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 7880fc7e7eb4..64b1dc574ab7 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -383,7 +383,7 @@ int xe_pagefault_init(struct xe_device *xe)
>   
>   	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
>   					WQ_UNBOUND | WQ_HIGHPRI,
> -					XE_PAGEFAULT_WORK_COUNT);
> +					xe->info.num_pf_work);
>   	if (!xe->usm.pf_wq)
>   		return -ENOMEM;
>   
> @@ -391,7 +391,7 @@ int xe_pagefault_init(struct xe_device *xe)
>   	if (err)
>   		goto err_out;
>   
> -	for (i = 0; i < XE_PAGEFAULT_WORK_COUNT; ++i) {
> +	for (i = 0; i < xe->info.num_pf_work; ++i) {
>   		struct xe_pagefault_work *pf_work = xe->usm.pf_workers + i;
>   
>   		pf_work->xe = xe;
> @@ -457,7 +457,7 @@ static int xe_pagefault_work_index(struct xe_device *xe)
>   {
>   	lockdep_assert_held(&xe->usm.pf_queue.lock);
>   
> -	return xe->usm.current_pf_work++ % XE_PAGEFAULT_WORK_COUNT;
> +	return xe->usm.current_pf_work++ % xe->info.num_pf_work;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 06669e9c500d..54c7d0f791e1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3070,7 +3070,8 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
>   	skip_threads =  op->prefetch_range.ranges_count == 1 ||
>   		(!dpagemap && !(vops->flags &
>   				XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE)) ||
> -		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
> +		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK) ||
> +		vm->xe->info.num_pf_work == 1;
>   	thread = skip_threads ? &stack_thread : NULL;
>   
>   	if (!skip_threads) {

In addition to patch 04, we go down with workers to 2 by default.

Good idea to have this as a modparam!

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

