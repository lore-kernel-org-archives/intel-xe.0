Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C250CC8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 09:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7813510E316;
	Mon,  7 Jul 2025 09:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnXvRQWf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B255210E315
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751880170; x=1783416170;
 h=message-id:date:cc:subject:to:references:from:
 in-reply-to:mime-version;
 bh=7kTLBH9dRtKTDctMEM7svtij3L9icJtV7Bzk0cA76FY=;
 b=fnXvRQWfZJyqNmjErk4OVTXAK1wjWFvhd+EbJUi9bIWgXvV84qSvwSWH
 g8YUTdpMjk060qk+3R17oSTeJPW7ZL9k3FZWxPZkLt3F8X6MGOfgFmw8I
 tai+W2edc/9sriVuh+YzBqAQFyFNyF1vnNlURenw2wC0drR9vgHOV/zD4
 nW+AhMDPjWm6ald9cki49ZdKxYU7b/By/FBr7N0wTBS3I0FGL9NfvpI8U
 ZmjZMbE5DE3Lribch2Cawa+Yv0sFjwEPKKh0gXBHZac+Hkbq3FoyxxKOM
 bDLc4uksO/CXwAKbaTRE8Yz7o2O/F1t2gk5Y8mTEZtgd0Iu/6zOMNWEXF A==;
X-CSE-ConnectionGUID: KstZ+QO+RgWCC/pukhiFAg==
X-CSE-MsgGUID: +WgyLl6HRKaRrFDtHFI5CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="57897533"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208,217";a="57897533"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:22:50 -0700
X-CSE-ConnectionGUID: +bhU5fECQpq6sEAIZNsOWg==
X-CSE-MsgGUID: aMc7fN85RriNmzm268kcIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
 d="scan'208,217";a="155645409"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:22:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 02:22:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 02:22:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 02:22:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMbKJt80HjVwAEhYU3Xk+hUjYuKONO8dZebsbtVIHT4TD7empTCJz54Gw4eYNB/Phffm0IqnaVfkvB25FaTtWt9VqnA9W1Cg4ZRZZDoUgcJmm1jDzxbcgF313MAPUK0l7uI/zeAQd2HyiDDwpy8Mh8Tod7m2T+Rv8ppGgAQnee1HSSl9iFZ3FUAvyTjF+igEcyl0Qu4QhPGNQCut1xSCbuAmgNYphxWBFg1PqGDy6YB+GGns6rs7UOTL4082Yu/NKjYQeybnHrZ0Ltjatjm0dLECp/UY8ZXeGzs7n3CCNrBax+7qdfOW4An7jday7PIIrZePmAEmQCU/hseseZYU6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7ru+FBnH9QFKm4peTK9fhu4YkEUSesNR8Ul0C+E3+c=;
 b=yZarImyAtFP/MGl5qgdP7aAcU0wtcWTP6lYdyg+Cpy18rbpBmQqHXY4PgcaT0oDF4h4+hOkWck1O2Bk3i2wDaBt28STqTF/Lfv2+e1IphDSsWi9ltEw/7vuwGJ4RyXabiKEyw+i2vWUPM9mjg9H/1tL36Ex6rG7p00alGevIc5Pxfp2HiLp+iReGgF+IMLePwmrI0PmU2deso4Z6CO8QDEHY4dMfq4cibC/mcM5XEm9tRhyFfbwJsI1TC2f52YGPPqnb4qNytoy2QO8zCmD68jE1ENmjageffhTO3vFE73KZTH93jj5VNuJWs55/ChgkdPvY4DyuiAcxankNY+LTSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 09:22:47 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 09:22:47 +0000
Content-Type: multipart/alternative;
 boundary="------------1nJrBdnytDQ04XvkrMALNXxQ"
Message-ID: <c09abdf0-4884-4d2e-8828-88f1fd39182b@intel.com>
Date: Mon, 7 Jul 2025 14:52:41 +0530
User-Agent: Mozilla Thunderbird
CC: <satyanarayana.k.v.p@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v8 2/4] drm/xe: Use dynamic allocation for tile and device
 VRAM region structures
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
 <20250702084424.3609863-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250702084424.3609863-3-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3e5b99-b45d-477e-d7cc-08ddbd37d62d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjNnbXVFT1FDT1NuTXVzUDUrSmhCbE0zQlFNaHRFNkNCMkJ6YjhZUWJCQVJ6?=
 =?utf-8?B?ZDdXUHArYW5FVVArb281Y1ZJZTdxSE5aemRwRDhGakd2ekFGWHlhMWE4U0w5?=
 =?utf-8?B?ekY0STlHaVI1SDVFbFk0RVdRb0pGejlhS1k1Q2c3WWVYVUhTQ0dXV2dYbnU2?=
 =?utf-8?B?eGd1V0tGbXdUbWUwd0twaTY2VXVwNGxSTXBzcHFrT0c0NTh0ZG9vS3ZmNjVC?=
 =?utf-8?B?R0hNUTI1MmRwSGJ5eEpPNUhTUEw0cjVaWGNqK1JpbWJ3OUdtM0pZQWVVdElL?=
 =?utf-8?B?Z2doTWZWdmxKOEM0YWdGT2lHdTd2K0Zpb1hqeDZhVlhtdFRSczN4ejJJU041?=
 =?utf-8?B?VHZYWVZ6bTkybEwrT1pBQVhaZmlMbU5OMHBEVGY0ckwzSnNuNm5ZazBPOUtP?=
 =?utf-8?B?OUNvM3pIRk0rQ1ArRlZCR0F3Mnp1cm9janI0VFNVNDJJRFFXVkdsVXFMdnlW?=
 =?utf-8?B?L2ZldWFIZEJucWIxVDY0MnZ3cEQrOWRGRG5LYnpYVkZTenFjYXQ2ODJaWTIy?=
 =?utf-8?B?RkxEeXpnTzNnM0JFdFhZTzJjRGFBWXE0dU42V2phVUxmWWh5VXNYcS9ZdmZD?=
 =?utf-8?B?MEFOSFhkUC94aGlkUUxHM1pNNWdVM0tDaDJVSU95MVpwcHZOU0xkZFBYMkxp?=
 =?utf-8?B?RkpBT3lDOExnZE1GY0hxRFp2cjkyNnpTRVpUZnhYem9aK1J3S3FMTG9YWVZL?=
 =?utf-8?B?blE1disvWElPcnZ3YWJIR29ubnhQdmNwNHJFSzhnRDhOTlNLd2ZJSjBZbk4y?=
 =?utf-8?B?ZXBLTkZGNWN0Q2VOaGJ3bjduOVpZQmJVZFplMThkZ0NLY1hzNmRtdmswaml0?=
 =?utf-8?B?S2RiVVdzcHRVa1RjRDNYUFdxYldXc2s0RW50c21vbU96emxqWUt6bEZQc0N2?=
 =?utf-8?B?UTRKS3NldGhYcWJOM0ZWMDBlZ3h4UTF5dUVESEFUcjZaTWpycHhzM0w4TU10?=
 =?utf-8?B?WG5pV2FEQnRTdGkrWWtvMVBodERjT3JVRGpLZTd6cW1rNmxiSDFacTU1Q3Fq?=
 =?utf-8?B?N3lsUWs3c1Q0MUFkZGhyZURpK0F6L1NnVzk2QzAwNnBLU1NLUWZ4aUNSOSt4?=
 =?utf-8?B?RHg5djlxa01UZHoxL3hheisveUN6NmdQdUtWQXhtVTVvRlVHSXJQME1LMWlv?=
 =?utf-8?B?cmcxQWhaQ2lUNU93WnpyQlY5R2wyU0ZiZFVuUVhkYzZaZWlrRUJUd3IzVVI1?=
 =?utf-8?B?ZDM5YTkvL253SjJxRTg4c3Z5YkxvU3Z3cmtKSlpJM0RsY1FlWFhibXoyQWli?=
 =?utf-8?B?SFJUQzJtUTFDK3pCMmUrSWhLN1lMRlFXdzg1NWp6NHA0RHlNcWVqM2lQT25n?=
 =?utf-8?B?ckxhbGt5NU13bmdhZkFmWE1hSlJjNzZPSlJTdG41bGdqYjFwZ2JBRTA0Wms3?=
 =?utf-8?B?U0xGYjVQUExwSEtmaWpTVjJadGJtT0N6dVhJQ0s0MUhKaHhueWtSYkZvS3V4?=
 =?utf-8?B?TWZQd0htRUk2UGNHZlRCdWRMOVI4Q3kxbHg3Ry8xUGlIYVBFakVPRmV3UGlK?=
 =?utf-8?B?T09nOUZHRmZrdEJhRFc1NVhPSW5nY1FnMzJ0TkpoNnljeWJ3NmxMajg5UUhB?=
 =?utf-8?B?UTRLeDNsSDJMdm9oNnVyN0NjTFhPSGlyN2J5MlI1RjRmMldFZ1Y4OGFsc1FO?=
 =?utf-8?B?d2F1ckluQVBxU3JEVjQ3Vm5ZUjhUOUlaQWkvQ3NtQVhFZE1QazRzVmprN2ZD?=
 =?utf-8?B?SWVSMzhES1BiT2UrdG1OQ0FYRzJFVkdSZkJSV1QzZVpoamQxUU5LQ2NjKzFO?=
 =?utf-8?B?d3hQdFlFVUtJMjErUGZLR0FQUi9qMXpObXdoOEtpUHdwYmsvTUJMSk92eTc5?=
 =?utf-8?B?aWpuMUJlWVM2WkE1VEpHbW1GQmUwdUVSNUZST0VHVVRVSjBLOEZlQkdLdHFX?=
 =?utf-8?B?OUxudWI0Z1pzQWRUOHJOVXcrc1doWVd4Y0p1a25TbFkwa3JxV05CT0ZDM21o?=
 =?utf-8?Q?pot0Yk2y1NU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkJFaEtqNzlPSjFYRG11cGJxODZFYzZsM0ZzcXZLZ0FhTnhxQk9wbFdpTUd1?=
 =?utf-8?B?SjBndGttUFlKcCsrRU4wdTlLTjJnVzA5bjNNbVZxT1dUK0R4OEtqUzdJUElM?=
 =?utf-8?B?SDF6Nk9jWVplbGxNa1lnRlladkRHTkl0UVI1NWN6UWowQkpiRk0rTWFXN3dy?=
 =?utf-8?B?K0NhNlZ6MmhJYmRTOGppWmhIdlhyMVRLWlFEbzFLcmQxUzNUdHNVYWRMOG5B?=
 =?utf-8?B?ZE55M2xtU2JVekV2MW9iQzgzK0FJZjdwcDNFOXoxSDR5YmZ3V1doVTRXR0c3?=
 =?utf-8?B?clByS01jdXpFdEs5eEF2ZFNCSXJldjQzclpwM1B4T0NUbFV3a1ZxZ2FPVitl?=
 =?utf-8?B?VExHTW05LzArZG9vT2U5Q2lwZzRqQ1ZCNmc0MjBKZzdGekMxeGhQSVVjWElH?=
 =?utf-8?B?eUdwQ0RNMEczcmJ2VFdPODN2amhMTnVoQitaa0VtWit6dGZPaXRCQUJ6VzUy?=
 =?utf-8?B?Nkoxc1FHeEFtRVd2V2EwbFdCdndLdDhYdkpSRW9zMDcxRzJQY21pTUJFQ29p?=
 =?utf-8?B?YnJ3eWpWaXJIWVlDaCtUOTFhYnY5OWJkeDdJMG1uRytocHZhU0ZlMG0zUEZI?=
 =?utf-8?B?UTRjenB0cU5jdVB3YVI1a0p1aUJNaHVsRERabGhzbG1Mc25hcTdoNlNKQnJL?=
 =?utf-8?B?TzFFOEJrcFdiUHRBNk1neUw4cE9SZEphUlJjT1NEWVgvUGZxTkxSMVJVVEFq?=
 =?utf-8?B?MlhXODdtZFN0cnAvTDJCcHZjcWFCbkgzQ1FKRFVqNHhzVkZNalQ1eEhkbEF4?=
 =?utf-8?B?eVMzMHJlalMzUmZiS3B2L1MvR1J2MXFTdDd6Z2hzUjhtR1dlWVNCbENZUW5i?=
 =?utf-8?B?MWt4OGxFeHpVaXBmVHlydjRGNFFzUUhpRHEzeWZYVENXRG9DdzZiamh2QndY?=
 =?utf-8?B?S3lsUXRleTdwNFg2ell4S1UzMW9iL1l2bldZTFc1dUFCVXJCSTIzYTZYZG1a?=
 =?utf-8?B?RTFMMUkwTlRPS3hZaHFRd0FkNThlU3o0OXhPSE1SVHdmQWJ6amxDSXI0WEln?=
 =?utf-8?B?SjBDaE9YWXprQkZtL0Z5TkhPWGVCckRTYklXaExSdGZtUUdIVmYvVmoyUGhT?=
 =?utf-8?B?SGVsSWJ0M2lEV0dhMnVFNFNNYjdhdU1uaE9FNFR6UXBHL2xaK0xFWjdjTFJF?=
 =?utf-8?B?QkU5c2pkZGdlRzZ6MVBkSi9jbkhkZm9DOW9MZHFWc2h2Z2I2KzUxUS9TNHUr?=
 =?utf-8?B?aS9FSjR0ck4weGM4Y1J4Rmo1MEh6UjYyWFRRNThwLytDamlyQjlFUkVmUEMx?=
 =?utf-8?B?TCt4NURqcGo3d0tXcUdubWYrNTVVOEZadU5OcnpQZWc3Mzg3endLNDVLL05Y?=
 =?utf-8?B?NVBDWUFKVEpRLzA4bDY3cWppYUYrcXlMR0paMXhHSm1DM094MGNORklwRElP?=
 =?utf-8?B?WTJIeDJvcy81TUpHZEFtbUtjUDk5UmxHbyszNVNkcGtNVVh4Mm1IOVpVaUxE?=
 =?utf-8?B?Z0VHK0htQjAraVU3SkM0MVZGNHNOWDdwUG9OcmZWckxRZDREc1JVeGJsYnRu?=
 =?utf-8?B?MmhIbU5BZElJQ25XRHpWV3lqdFQ1dkwwRTg5RmNYTzFPLzQwb28yQkpEenRB?=
 =?utf-8?B?OElSTWd6ajgwR0hMNlpEZ01iU1hVWHc3ZW9KZHFVSGppWm1PaEtFZ0ZYZ3RM?=
 =?utf-8?B?TzFqUC9MbitzeHAySTRYTXlJaHJLSVpuLzA1bjhWWld6YUZrYklQWlFIK28x?=
 =?utf-8?B?dnpUMDR1cEM3Si8xZWNIekZNalByOVlJZjFsTStHRUhTbkZCazVZMWMvVlZG?=
 =?utf-8?B?QittRlpDbGc2Tyt2K1RGYXUvSG13U1RrYk9nc2o0ckl0T3BiUXlldG0vaFhr?=
 =?utf-8?B?SU45d0FqM1pGNzZwaisxSGRndjk4S0ljME1pZ29kNk9mSTJOSkNJUFAzTHdK?=
 =?utf-8?B?ZDBKdjhEZVVsNHVKYjZ3S1EwUitac0EvMW5zWVI1ZG1DKzJaWkVPQmF1MGNt?=
 =?utf-8?B?dHh2VVRLcnRkSlUyWG10TjA2SktuTDN6eXpmV25yR3dxVUF6bXZpenlYT1lr?=
 =?utf-8?B?V01KWkVUcWVON1VGRUpyZGVSdmJwR0tyOWI4Qk91YWlaS29xOHJOdlFzWWtX?=
 =?utf-8?B?R0cxd0FvcG1RbEthbGowcU1yR3hGYXU0UVk4UmdlZURybXdxeXZ2ZE1TM2Yy?=
 =?utf-8?B?RkJZNTVoV01FRk5DS0lKL1RRd1NzUHR2ZzlCVHc3aDhKQ1cxNnl0d2ozUFNI?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3e5b99-b45d-477e-d7cc-08ddbd37d62d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 09:22:47.4443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veXh2nBXMXoBeWECeCRAR2efDBOhBoCoEo1qdn6NJzqZMcXM8hvAU9pVeru1B/IO9TXP5VX4tc0Z1SBz7Gb/MzGESQBTbo+ZbVUT2EdiETo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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

--------------1nJrBdnytDQ04XvkrMALNXxQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 02-07-2025 14:14, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> In future platforms, we will need to represent the device and tile
> VRAM regions in a more dynamic way, so let's abandon the static
> allocation of these structures and start use a dynamic allocation.
>
> v2:
>   - Add a helpers for accessing fields of the xe_vram_region structure
>
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Stuart Summers<stuart.summers@intel.com>
> Cc: Matthew Auld<matthew.auld@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c        |   4 +-
>   drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
>   drivers/gpu/drm/xe/xe_assert.h                |   4 +-
>   drivers/gpu/drm/xe/xe_device.c                |  19 +++
>   drivers/gpu/drm/xe/xe_device_types.h          |   6 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
>   drivers/gpu/drm/xe/xe_migrate.c               |  25 ++--
>   drivers/gpu/drm/xe/xe_pci.c                   |   6 +
>   drivers/gpu/drm/xe/xe_query.c                 |   2 +-
>   drivers/gpu/drm/xe/xe_svm.c                   |  24 ++--
>   drivers/gpu/drm/xe/xe_tile.c                  |  34 ++++-
>   drivers/gpu/drm/xe/xe_tile.h                  |   4 +-
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  10 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   7 +-
>   drivers/gpu/drm/xe/xe_vram.c                  | 119 +++++++++++++-----
>   drivers/gpu/drm/xe/xe_vram.h                  |   9 ++
>   16 files changed, 200 insertions(+), 77 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index c38fba18effe..2187b2de64e1 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -289,7 +289,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>   	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
>   	    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
>   	    !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS)) {
> -		struct xe_tile *tile = xe_device_get_root_tile(xe);
> +		struct xe_vram_region *vram = xe_device_get_root_tile(xe)->mem.vram;
>   
>   		/*
>   		 * If we need to able to access the clear-color value stored in
> @@ -297,7 +297,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>   		 * accessible.  This is important on small-bar systems where
>   		 * only some subset of VRAM is CPU accessible.
>   		 */
> -		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
> +		if (xe_vram_region_io_size(vram) < xe_vram_region_usable_size(vram)) {
>   			ret = -EINVAL;
>   			goto err;
>   		}
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index b2ede3af9345..873f4e18cb2a 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -103,7 +103,7 @@ initial_plane_bo(struct xe_device *xe,
>   		 * We don't currently expect this to ever be placed in the
>   		 * stolen portion.
>   		 */
> -		if (phys_base >= tile0->mem.vram.usable_size) {
> +		if (phys_base >= xe_vram_region_usable_size(tile0->mem.vram)) {
>   			drm_err(&xe->drm,
>   				"Initial plane programming using invalid range, phys_base=%pa\n",
>   				&phys_base);
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> index 68fe70ce2be3..a818eaa05b7d 100644
> --- a/drivers/gpu/drm/xe/xe_assert.h
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -12,6 +12,7 @@
>   
>   #include "xe_gt_types.h"
>   #include "xe_step.h"
> +#include "xe_vram.h"
>   
>   /**
>    * DOC: Xe Asserts
> @@ -145,7 +146,8 @@
>   	const struct xe_tile *__tile = (tile);							\
>   	char __buf[10] __maybe_unused;								\
>   	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
> -		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
> +		      __tile->id, ({ string_get_size(						\
> +				     xe_vram_region_actual_physical_size(__tile->mem.vram), 1,	\
>   				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
>   })
>   
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0b73cb72bad1..19019b032c78 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -685,6 +685,21 @@ static void sriov_update_device_info(struct xe_device *xe)
>   	}
>   }
>   
> +static int xe_device_vram_alloc(struct xe_device *xe)
> +{
> +	struct xe_vram_region *vram;
> +
> +	if (!IS_DGFX(xe))
> +		return 0;
> +
> +	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
> +	if (!vram)
> +		return -ENOMEM;
> +
> +	xe->mem.vram = vram;
> +	return 0;
> +}
> +
>   /**
>    * xe_device_probe_early: Device early probe
>    * @xe: xe device instance
> @@ -729,6 +744,10 @@ int xe_device_probe_early(struct xe_device *xe)
>   
>   	xe->wedged.mode = xe_modparam.wedged_mode;
>   
> +	err = xe_device_vram_alloc(xe);
> +	if (err)
> +		return err;
> +
>   	return 0;
>   }
>   ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 7e4f6d846af6..bd8aa742618b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -74,6 +74,8 @@ struct xe_pxp;
>    * device, such as HBM memory or CXL extension memory.
>    */
>   struct xe_vram_region {
> +	/** @tile: Back pointer to tile */
> +	struct xe_tile *tile;
>   	/** @io_start: IO start address of this VRAM instance */
>   	resource_size_t io_start;
>   	/**
> @@ -213,7 +215,7 @@ struct xe_tile {
>   		 * Although VRAM is associated with a specific tile, it can
>   		 * still be accessed by all tiles' GTs.
>   		 */
> -		struct xe_vram_region vram;
> +		struct xe_vram_region *vram;
>   
>   		/** @mem.ggtt: Global graphics translation table */
>   		struct xe_ggtt *ggtt;
> @@ -394,7 +396,7 @@ struct xe_device {
>   	/** @mem: memory info for device */
>   	struct {
>   		/** @mem.vram: VRAM info for device */
> -		struct xe_vram_region vram;
> +		struct xe_vram_region *vram;
>   		/** @mem.sys_mgr: system TTM manager */
>   		struct ttm_resource_manager sys_mgr;
>   		/** @mem.sys_mgr: system memory shrinker. */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index d186f780885d..e69a05126dae 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1574,7 +1574,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
>   {
>   	struct xe_tile *tile = gt->tile;
>   
> -	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
> +	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
>   }
>   
>   static u64 pf_query_max_lmem(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 0838582537e8..0d169f23bd6e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -34,6 +34,7 @@
>   #include "xe_sync.h"
>   #include "xe_trace_bo.h"
>   #include "xe_vm.h"
> +#include "xe_vram.h"
>   
>   /**
>    * struct xe_migrate - migrate context.
> @@ -130,34 +131,36 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
>   	u64 identity_offset = IDENTITY_OFFSET;
>   
>   	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
> -		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> +		identity_offset += DIV_ROUND_UP_ULL(xe_vram_region_actual_physical_size
> +							(xe->mem.vram), SZ_1G);
>   
> -	addr -= xe->mem.vram.dpa_base;
> +	addr -= xe_vram_region_dpa_base(xe->mem.vram);
>   	return addr + (identity_offset << xe_pt_shift(2));
>   }
>   
>   static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
>   					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_2m_ofs)
>   {
> +	struct xe_vram_region *vram = xe->mem.vram;
> +	resource_size_t dpa_base = xe_vram_region_dpa_base(xe->mem.vram);
Follow inverse xmas tree format.
>   	u64 pos, ofs, flags;
>   	u64 entry;
>   	/* XXX: Unclear if this should be usable_size? */
> -	u64 vram_limit =  xe->mem.vram.actual_physical_size +
> -		xe->mem.vram.dpa_base;
> +	u64 vram_limit = xe_vram_region_actual_physical_size(vram) + dpa_base;
>   	u32 level = 2;
>   
>   	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
>   	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
>   					    true, 0);
>   
> -	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
> +	xe_assert(xe, IS_ALIGNED(xe_vram_region_usable_size(vram), SZ_2M));
>   
>   	/*
>   	 * Use 1GB pages when possible, last chunk always use 2M
>   	 * pages as mixing reserved memory (stolen, WOCPM) with a single
>   	 * mapping is not allowed on certain platforms.
>   	 */
> -	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
> +	for (pos = dpa_base; pos < vram_limit;
>   	     pos += SZ_1G, ofs += 8) {
>   		if (pos + SZ_1G >= vram_limit) {
>   			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
> @@ -307,11 +310,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   	/* Identity map the entire vram at 256GiB offset */
>   	if (IS_DGFX(xe)) {
>   		u64 pt30_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
> +		resource_size_t actual_phy_size = xe_vram_region_actual_physical_size(xe->mem.vram);
>   
>   		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
>   					    pat_index, pt30_ofs);
> -		xe_assert(xe, xe->mem.vram.actual_physical_size <=
> -					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
> +		xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
>   
>   		/*
>   		 * Identity map the entire vram for compressed pat_index for xe2+
> @@ -320,11 +323,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
>   			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
>   			u64 vram_offset = IDENTITY_OFFSET +
> -				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> +				DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
>   			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
>   
> -			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
> -						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
> +			xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET -
> +							  IDENTITY_OFFSET / 2) * SZ_1G);
>   			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
>   						    comp_pat_index, pt31_ofs);
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 824461c31288..90494f16d3d8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -714,12 +714,18 @@ static int xe_info_init(struct xe_device *xe,
>   	 * All of these together determine the overall GT count.
>   	 */
>   	for_each_tile(tile, xe, id) {
> +		int err;
> +
>   		gt = tile->primary_gt;
>   		gt->info.id = xe->info.gt_count++;
>   		gt->info.type = XE_GT_TYPE_MAIN;
>   		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
>   		gt->info.engine_mask = graphics_desc->hw_engine_mask;
>   
> +		err = xe_tile_alloc_vram(tile);
> +		if (err)
> +			return err;
> +
>   		if (MEDIA_VER(xe) < 13 && media_desc)
>   			gt->info.engine_mask |= media_desc->hw_engine_mask;
>   
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index e8e1743dcb1e..ba9b7482605c 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -337,7 +337,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   	config->num_params = num_params;
>   	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
>   		xe->info.devid | (xe->info.revid << 16);
> -	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> +	if (xe->mem.vram)
>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
>   	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index a7ff5975873f..e6871734ffa9 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -306,16 +306,11 @@ static struct xe_vram_region *page_to_vr(struct page *page)
>   	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
>   }
>   
> -static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
> -{
> -	return container_of(vr, struct xe_tile, mem.vram);
> -}
> -
>   static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
>   				      struct page *page)
>   {
>   	u64 dpa;
> -	struct xe_tile *tile = vr_to_tile(vr);
> +	struct xe_tile *tile = vr->tile;
>   	u64 pfn = page_to_pfn(page);
>   	u64 offset;
>   
> @@ -370,7 +365,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>   
>   		if (!vr && spage) {
>   			vr = page_to_vr(spage);
> -			tile = vr_to_tile(vr);
> +			tile = vr->tile;
>   		}
>   		XE_WARN_ON(spage && page_to_vr(spage) != vr);
>   
> @@ -508,7 +503,7 @@ static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
>   
>   static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
>   {
> -	return &tile->mem.vram.ttm.mm;
> +	return &tile->mem.vram->ttm.mm;
>   }
>   
>   static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
> @@ -522,7 +517,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
>   
>   	list_for_each_entry(block, blocks, link) {
>   		struct xe_vram_region *vr = block->private;
> -		struct xe_tile *tile = vr_to_tile(vr);
> +		struct xe_tile *tile = vr->tile;
>   		struct drm_buddy *buddy = tile_to_buddy(tile);
>   		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
>   		int i;
> @@ -683,20 +678,15 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
>   }
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> -static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> -{
> -	return &tile->mem.vram;
> -}
> -
>   static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   				      unsigned long start, unsigned long end,
>   				      struct mm_struct *mm,
>   				      unsigned long timeslice_ms)
>   {
> -	struct xe_tile *tile = container_of(dpagemap, typeof(*tile), mem.vram.dpagemap);
> +	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
> +	struct xe_tile *tile = vr->tile;
>   	struct xe_device *xe = tile_to_xe(tile);
>   	struct device *dev = xe->drm.dev;
> -	struct xe_vram_region *vr = tile_to_vr(tile);
>   	struct drm_buddy_block *block;
>   	struct list_head *blocks;
>   	struct xe_bo *bo;
> @@ -722,7 +712,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   
>   	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
>   				&dpagemap_devmem_ops,
> -				&tile->mem.vram.dpagemap,
> +				&tile->mem.vram->dpagemap,
>   				end - start);
>   
>   	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 86e9811e60ba..858ce0183aaa 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -19,6 +19,7 @@
>   #include "xe_tile_sysfs.h"
>   #include "xe_ttm_vram_mgr.h"
>   #include "xe_wa.h"
> +#include "xe_vram.h"
>   
>   /**
>    * DOC: Multi-tile Design
> @@ -95,6 +96,33 @@ static int xe_tile_alloc(struct xe_tile *tile)
>   	return 0;
>   }
>   
> +/**
> + * xe_tile_alloc_vram - Perform per-tile VRAM structs allocation
> + * @tile: Tile to perform allocations for
> + *
> + * Allocates VRAM per-tile data structures using DRM-managed allocations.
> + * Does not touch the hardware.
> + *
> + * Returns -ENOMEM if allocations fail, otherwise 0.
> + */
> +int xe_tile_alloc_vram(struct xe_tile *tile)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_vram_region *vram;
> +
> +	if (!IS_DGFX(xe))
> +		return 0;
> +
> +	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
> +	if (!vram)
> +		return -ENOMEM;
> +
> +	vram->tile = tile;
> +	tile->mem.vram = vram;
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_tile_init_early - Initialize the tile and primary GT
>    * @tile: Tile to initialize
> @@ -132,8 +160,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>   	struct xe_device *xe = tile_to_xe(tile);
>   	int err;
>   
> -	if (tile->mem.vram.usable_size) {
> -		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
> +	if (tile->mem.vram) {
> +		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
>   		if (err)
>   			return err;
>   		xe->info.mem_region_mask |= BIT(tile->id) << 1;
> @@ -168,7 +196,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>   	xe_wa_apply_tile_workarounds(tile);
>   
>   	if (xe->info.has_usm && IS_DGFX(xe))
> -		xe_devm_add(tile, &tile->mem.vram);
> +		xe_devm_add(tile, tile->mem.vram);
>   
>   	return xe_tile_sysfs_init(tile);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 066a3d0cea79..fb0473fa9098 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -14,12 +14,14 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
>   int xe_tile_init_noalloc(struct xe_tile *tile);
>   int xe_tile_init(struct xe_tile *tile);
>   
> +int xe_tile_alloc_vram(struct xe_tile *tile);
> +
>   void xe_tile_migrate_wait(struct xe_tile *tile);
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>   static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
>   {
> -	return &tile->mem.vram.dpagemap;
> +	return &tile->mem.vram->dpagemap;
>   }
>   #else
>   static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index d9c9d2547aad..2f5243343446 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -25,6 +25,7 @@
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_ttm_vram_mgr.h"
>   #include "xe_wa.h"
> +#include "xe_vram.h"
>   
>   struct xe_ttm_stolen_mgr {
>   	struct xe_ttm_vram_mgr base;
> @@ -82,15 +83,16 @@ static u32 get_wopcm_size(struct xe_device *xe)
>   
>   static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>   {
> -	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
Follow inverse xmas tree format.
>   	u64 stolen_size, wopcm_size;
>   	u64 tile_offset;
>   	u64 tile_size;
>   
> -	tile_offset = tile->mem.vram.io_start - xe->mem.vram.io_start;
> -	tile_size = tile->mem.vram.actual_physical_size;
> +	tile_offset = tile_io_start - xe_vram_region_io_start(xe->mem.vram);
> +	tile_size = xe_vram_region_actual_physical_size(tile_vram);
>   
>   	/* Use DSM base address instead for stolen memory */
>   	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
> @@ -107,7 +109,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>   
>   	/* Verify usage fits in the actual resource available */
>   	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, LMEM_BAR))
> -		mgr->io_base = tile->mem.vram.io_start + mgr->stolen_base;
> +		mgr->io_base = tile_io_start + mgr->stolen_base;
>   
>   	/*
>   	 * There may be few KB of platform dependent reserved memory at the end
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9e375a40aee9..3de2df47959b 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -340,10 +340,11 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
>   {
>   	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_vram_region *vram = &tile->mem.vram;
> +	struct xe_vram_region *vram = tile->mem.vram;
>   
>   	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
> -				      vram->usable_size, vram->io_size,
> +				      xe_vram_region_usable_size(vram),
> +				      xe_vram_region_io_size(vram),
>   				      PAGE_SIZE);
>   }
>   
> @@ -392,7 +393,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>   	 */
>   	xe_res_first(res, offset, length, &cursor);
>   	for_each_sgtable_sg((*sgt), sg, i) {
> -		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
> +		phys_addr_t phys = cursor.start + xe_vram_region_io_start(tile->mem.vram);
>   		size_t size = min_t(u64, cursor.size, SZ_2G);
>   		dma_addr_t addr;
>   
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 3a4c84e9efc6..71f463f2c3be 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -147,17 +147,17 @@ static int determine_lmem_bar_size(struct xe_device *xe)
>   
>   	resize_vram_bar(xe);
>   
> -	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
> -	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
> -	if (!xe->mem.vram.io_size)
> +	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
> +	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
> +	if (!xe->mem.vram->io_size)
>   		return -EIO;
>   
>   	/* XXX: Need to change when xe link code is ready */
> -	xe->mem.vram.dpa_base = 0;
> +	xe->mem.vram->dpa_base = 0;
>   
>   	/* set up a map to the total memory area. */
> -	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
> -					       xe->mem.vram.io_size);
> +	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
> +						xe->mem.vram->io_size);
>   
>   	return 0;
>   }
> @@ -279,10 +279,10 @@ static void vram_fini(void *arg)
>   	struct xe_tile *tile;
>   	int id;
>   
> -	xe->mem.vram.mapping = NULL;
> +	xe->mem.vram->mapping = NULL;
>   
>   	for_each_tile(tile, xe, id)
> -		tile->mem.vram.mapping = NULL;
> +		tile->mem.vram->mapping = NULL;
>   }
>   
>   /**
> @@ -318,10 +318,10 @@ int xe_vram_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> -	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> -		 &xe->mem.vram.io_size);
> +	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> +		 &xe->mem.vram->io_size);
>   
> -	io_size = xe->mem.vram.io_size;
> +	io_size = xe->mem.vram->io_size;
>   
>   	/* tile specific ranges */
>   	for_each_tile(tile, xe, id) {
> @@ -329,45 +329,104 @@ int xe_vram_probe(struct xe_device *xe)
>   		if (err)
>   			return err;
>   
> -		tile->mem.vram.actual_physical_size = tile_size;
> -		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
> -		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
> +		tile->mem.vram->actual_physical_size = tile_size;
> +		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
> +		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
>   
> -		if (!tile->mem.vram.io_size) {
> +		if (!tile->mem.vram->io_size) {
>   			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
>   			return -ENODEV;
>   		}
>   
> -		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
> -		tile->mem.vram.usable_size = vram_size;
> -		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
> +		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
> +		tile->mem.vram->usable_size = vram_size;
> +		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
>   
> -		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
> +		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
>   			drm_info(&xe->drm, "Small BAR device\n");
> -		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
> -			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
> -		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
> -			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
> -			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
> +		drm_info(&xe->drm,
> +			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
> +			 id, tile->id, &tile->mem.vram->actual_physical_size,
> +			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
> +		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
> +			 id, tile->id, &tile->mem.vram->dpa_base,
> +			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
> +			 &tile->mem.vram->io_start,
> +			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
>   
>   		/* calculate total size using tile size to get the correct HW sizing */
>   		total_size += tile_size;
>   		available_size += vram_size;
>   
> -		if (total_size > xe->mem.vram.io_size) {
> +		if (total_size > xe->mem.vram->io_size) {
>   			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> -				 &total_size, &xe->mem.vram.io_size);
> +				 &total_size, &xe->mem.vram->io_size);
>   		}
>   
>   		io_size -= min_t(u64, tile_size, io_size);
>   	}
>   
> -	xe->mem.vram.actual_physical_size = total_size;
> +	xe->mem.vram->actual_physical_size = total_size;
>   
> -	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> -		 &xe->mem.vram.actual_physical_size);
> -	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> +	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> +		 &xe->mem.vram->actual_physical_size);
> +	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
>   		 &available_size);
>   
>   	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
>   }
> +
> +/**
> + * xe_vram_region_io_start - Get the IO start of a VRAM region
> + * @vram: the VRAM region
> + *
> + * Return: the IO start of the VRAM region, or 0 if not valid
> + */
> +resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram)
> +{
> +	return vram ? vram->io_start : 0;
> +}
> +
> +/**
> + * xe_vram_region_io_size - Get the IO size of a VRAM region
> + * @vram: the VRAM region
> + *
> + * Return: the IO size of the VRAM region, or 0 if not valid
> + */
> +resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram)
> +{
> +	return vram ? vram->io_size : 0;
> +}
> +
> +/**
> + * xe_vram_region_dpa_base - Get the DPA base of a VRAM region
> + * @vram: the VRAM region
> + *
> + * Return: the DPA base of the VRAM region, or 0 if not valid
> + */
> +resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram)
> +{
> +	return vram ? vram->dpa_base : 0;
> +}
> +
> +/**
> + * xe_vram_region_usable_size - Get the usable size of a VRAM region
> + * @vram: the VRAM region
> + *
> + * Return: the usable size of the VRAM region, or 0 if not valid
> + */
> +resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram)
> +{
> +	return vram ? vram->usable_size : 0;
> +}
> +
> +/**
> + * xe_vram_region_actual_physical_size - Get the actual physical size of a VRAM region
> + * @vram: the VRAM region
> + *
> + * Return: the actual physical size of the VRAM region, or 0 if not valid
> + */
> +resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram)
> +{
> +	return vram ? vram->actual_physical_size : 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
> index e31cc04ec0db..d4bf1f9c2a72 100644
> --- a/drivers/gpu/drm/xe/xe_vram.h
> +++ b/drivers/gpu/drm/xe/xe_vram.h
> @@ -6,8 +6,17 @@
>   #ifndef _XE_VRAM_H_
>   #define _XE_VRAM_H_
>   
> +#include <linux/types.h>
> +
>   struct xe_device;
> +struct xe_vram_region;
>   
>   int xe_vram_probe(struct xe_device *xe);
>   
> +resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
> +resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
> +resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
> +resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram);
> +resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram);
> +
>   #endif
With nits fixed,
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com 
<mailto:satyanarayana.k.v.p@intel.com>>

--------------1nJrBdnytDQ04XvkrMALNXxQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 02-07-2025 14:14, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250702084424.3609863-3-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

In future platforms, we will need to represent the device and tile
VRAM regions in a more dynamic way, so let's abandon the static
allocation of these structures and start use a dynamic allocation.

v2:
 - Add a helpers for accessing fields of the xe_vram_region structure

Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Stuart Summers <a class="moz-txt-link-rfc2396E" href="mailto:stuart.summers@intel.com">&lt;stuart.summers@intel.com&gt;</a>
Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   4 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
 drivers/gpu/drm/xe/xe_assert.h                |   4 +-
 drivers/gpu/drm/xe/xe_device.c                |  19 +++
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  25 ++--
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   2 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  24 ++--
 drivers/gpu/drm/xe/xe_tile.c                  |  34 ++++-
 drivers/gpu/drm/xe/xe_tile.h                  |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  10 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   7 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 119 +++++++++++++-----
 drivers/gpu/drm/xe/xe_vram.h                  |   9 ++
 16 files changed, 200 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index c38fba18effe..2187b2de64e1 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -289,7 +289,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (IS_DGFX(to_xe_device(bo-&gt;ttm.base.dev)) &amp;&amp;
 	    intel_fb_rc_ccs_cc_plane(&amp;fb-&gt;base) &gt;= 0 &amp;&amp;
 	    !(bo-&gt;flags &amp; XE_BO_FLAG_NEEDS_CPU_ACCESS)) {
-		struct xe_tile *tile = xe_device_get_root_tile(xe);
+		struct xe_vram_region *vram = xe_device_get_root_tile(xe)-&gt;mem.vram;
 
 		/*
 		 * If we need to able to access the clear-color value stored in
@@ -297,7 +297,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		 * accessible.  This is important on small-bar systems where
 		 * only some subset of VRAM is CPU accessible.
 		 */
-		if (tile-&gt;mem.vram.io_size &lt; tile-&gt;mem.vram.usable_size) {
+		if (xe_vram_region_io_size(vram) &lt; xe_vram_region_usable_size(vram)) {
 			ret = -EINVAL;
 			goto err;
 		}
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index b2ede3af9345..873f4e18cb2a 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -103,7 +103,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base &gt;= tile0-&gt;mem.vram.usable_size) {
+		if (phys_base &gt;= xe_vram_region_usable_size(tile0-&gt;mem.vram)) {
 			drm_err(&amp;xe-&gt;drm,
 				&quot;Initial plane programming using invalid range, phys_base=%pa\n&quot;,
 				&amp;phys_base);
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 68fe70ce2be3..a818eaa05b7d 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -12,6 +12,7 @@
 
 #include &quot;xe_gt_types.h&quot;
 #include &quot;xe_step.h&quot;
+#include &quot;xe_vram.h&quot;
 
 /**
  * DOC: Xe Asserts
@@ -145,7 +146,8 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, &quot;tile: %u VRAM %s\n&quot; msg,			\
-		      __tile-&gt;id, ({ string_get_size(__tile-&gt;mem.vram.actual_physical_size, 1,	\
+		      __tile-&gt;id, ({ string_get_size(						\
+				     xe_vram_region_actual_physical_size(__tile-&gt;mem.vram), 1,	\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b73cb72bad1..19019b032c78 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -685,6 +685,21 @@ static void sriov_update_device_info(struct xe_device *xe)
 	}
 }
 
+static int xe_device_vram_alloc(struct xe_device *xe)
+{
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&amp;xe-&gt;drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	xe-&gt;mem.vram = vram;
+	return 0;
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -729,6 +744,10 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe-&gt;wedged.mode = xe_modparam.wedged_mode;
 
+	err = xe_device_vram_alloc(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7e4f6d846af6..bd8aa742618b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -74,6 +74,8 @@ struct xe_pxp;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_vram_region {
+	/** @tile: Back pointer to tile */
+	struct xe_tile *tile;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -213,7 +215,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
@@ -394,7 +396,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 		/** @mem.sys_mgr: system memory shrinker. */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index d186f780885d..e69a05126dae 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1574,7 +1574,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt-&gt;tile;
 
-	return xe_ttm_vram_get_avail(&amp;tile-&gt;mem.vram.ttm.manager);
+	return xe_ttm_vram_get_avail(&amp;tile-&gt;mem.vram-&gt;ttm.manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 0838582537e8..0d169f23bd6e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -34,6 +34,7 @@
 #include &quot;xe_sync.h&quot;
 #include &quot;xe_trace_bo.h&quot;
 #include &quot;xe_vm.h&quot;
+#include &quot;xe_vram.h&quot;
 
 /**
  * struct xe_migrate - migrate context.
@@ -130,34 +131,36 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 	u64 identity_offset = IDENTITY_OFFSET;
 
 	if (GRAPHICS_VER(xe) &gt;= 20 &amp;&amp; is_comp_pte)
-		identity_offset += DIV_ROUND_UP_ULL(xe-&gt;mem.vram.actual_physical_size, SZ_1G);
+		identity_offset += DIV_ROUND_UP_ULL(xe_vram_region_actual_physical_size
+							(xe-&gt;mem.vram), SZ_1G);
 
-	addr -= xe-&gt;mem.vram.dpa_base;
+	addr -= xe_vram_region_dpa_base(xe-&gt;mem.vram);
 	return addr + (identity_offset &lt;&lt; xe_pt_shift(2));
 }
 
 static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
 					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_2m_ofs)
 {
+	struct xe_vram_region *vram = xe-&gt;mem.vram;
+	resource_size_t dpa_base = xe_vram_region_dpa_base(xe-&gt;mem.vram);</pre>
    </blockquote>
    Follow inverse xmas tree format.
    <blockquote type="cite" cite="mid:20250702084424.3609863-3-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	u64 pos, ofs, flags;
 	u64 entry;
 	/* XXX: Unclear if this should be usable_size? */
-	u64 vram_limit =  xe-&gt;mem.vram.actual_physical_size +
-		xe-&gt;mem.vram.dpa_base;
+	u64 vram_limit = xe_vram_region_actual_physical_size(vram) + dpa_base;
 	u32 level = 2;
 
 	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
 	flags = vm-&gt;pt_ops-&gt;pte_encode_addr(xe, 0, pat_index, level,
 					    true, 0);
 
-	xe_assert(xe, IS_ALIGNED(xe-&gt;mem.vram.usable_size, SZ_2M));
+	xe_assert(xe, IS_ALIGNED(xe_vram_region_usable_size(vram), SZ_2M));
 
 	/*
 	 * Use 1GB pages when possible, last chunk always use 2M
 	 * pages as mixing reserved memory (stolen, WOCPM) with a single
 	 * mapping is not allowed on certain platforms.
 	 */
-	for (pos = xe-&gt;mem.vram.dpa_base; pos &lt; vram_limit;
+	for (pos = dpa_base; pos &lt; vram_limit;
 	     pos += SZ_1G, ofs += 8) {
 		if (pos + SZ_1G &gt;= vram_limit) {
 			entry = vm-&gt;pt_ops-&gt;pde_encode_bo(bo, pt_2m_ofs,
@@ -307,11 +310,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	/* Identity map the entire vram at 256GiB offset */
 	if (IS_DGFX(xe)) {
 		u64 pt30_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
+		resource_size_t actual_phy_size = xe_vram_region_actual_physical_size(xe-&gt;mem.vram);
 
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
 					    pat_index, pt30_ofs);
-		xe_assert(xe, xe-&gt;mem.vram.actual_physical_size &lt;=
-					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
+		xe_assert(xe, actual_phy_size &lt;= (MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
 
 		/*
 		 * Identity map the entire vram for compressed pat_index for xe2+
@@ -320,11 +323,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (GRAPHICS_VER(xe) &gt;= 20 &amp;&amp; xe_device_has_flat_ccs(xe)) {
 			u16 comp_pat_index = xe-&gt;pat.idx[XE_CACHE_NONE_COMPRESSION];
 			u64 vram_offset = IDENTITY_OFFSET +
-				DIV_ROUND_UP_ULL(xe-&gt;mem.vram.actual_physical_size, SZ_1G);
+				DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
 			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
 
-			xe_assert(xe, xe-&gt;mem.vram.actual_physical_size &lt;= (MAX_NUM_PTE -
-						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
+			xe_assert(xe, actual_phy_size &lt;= (MAX_NUM_PTE - IDENTITY_OFFSET -
+							  IDENTITY_OFFSET / 2) * SZ_1G);
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
 						    comp_pat_index, pt31_ofs);
 		}
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 824461c31288..90494f16d3d8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -714,12 +714,18 @@ static int xe_info_init(struct xe_device *xe,
 	 * All of these together determine the overall GT count.
 	 */
 	for_each_tile(tile, xe, id) {
+		int err;
+
 		gt = tile-&gt;primary_gt;
 		gt-&gt;info.id = xe-&gt;info.gt_count++;
 		gt-&gt;info.type = XE_GT_TYPE_MAIN;
 		gt-&gt;info.has_indirect_ring_state = graphics_desc-&gt;has_indirect_ring_state;
 		gt-&gt;info.engine_mask = graphics_desc-&gt;hw_engine_mask;
 
+		err = xe_tile_alloc_vram(tile);
+		if (err)
+			return err;
+
 		if (MEDIA_VER(xe) &lt; 13 &amp;&amp; media_desc)
 			gt-&gt;info.engine_mask |= media_desc-&gt;hw_engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e8e1743dcb1e..ba9b7482605c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -337,7 +337,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config-&gt;num_params = num_params;
 	config-&gt;info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe-&gt;info.devid | (xe-&gt;info.revid &lt;&lt; 16);
-	if (xe_device_get_root_tile(xe)-&gt;mem.vram.usable_size)
+	if (xe-&gt;mem.vram)
 		config-&gt;info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	if (xe-&gt;info.has_usm &amp;&amp; IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a7ff5975873f..e6871734ffa9 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -306,16 +306,11 @@ static struct xe_vram_region *page_to_vr(struct page *page)
 	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
 }
 
-static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
-{
-	return container_of(vr, struct xe_tile, mem.vram);
-}
-
 static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 				      struct page *page)
 {
 	u64 dpa;
-	struct xe_tile *tile = vr_to_tile(vr);
+	struct xe_tile *tile = vr-&gt;tile;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
 
@@ -370,7 +365,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 		if (!vr &amp;&amp; spage) {
 			vr = page_to_vr(spage);
-			tile = vr_to_tile(vr);
+			tile = vr-&gt;tile;
 		}
 		XE_WARN_ON(spage &amp;&amp; page_to_vr(spage) != vr);
 
@@ -508,7 +503,7 @@ static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
 
 static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
 {
-	return &amp;tile-&gt;mem.vram.ttm.mm;
+	return &amp;tile-&gt;mem.vram-&gt;ttm.mm;
 }
 
 static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
@@ -522,7 +517,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block-&gt;private;
-		struct xe_tile *tile = vr_to_tile(vr);
+		struct xe_tile *tile = vr-&gt;tile;
 		struct drm_buddy *buddy = tile_to_buddy(tile);
 		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
 		int i;
@@ -683,20 +678,15 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
-{
-	return &amp;tile-&gt;mem.vram;
-}
-
 static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      unsigned long start, unsigned long end,
 				      struct mm_struct *mm,
 				      unsigned long timeslice_ms)
 {
-	struct xe_tile *tile = container_of(dpagemap, typeof(*tile), mem.vram.dpagemap);
+	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
+	struct xe_tile *tile = vr-&gt;tile;
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe-&gt;drm.dev;
-	struct xe_vram_region *vr = tile_to_vr(tile);
 	struct drm_buddy_block *block;
 	struct list_head *blocks;
 	struct xe_bo *bo;
@@ -722,7 +712,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 	drm_pagemap_devmem_init(&amp;bo-&gt;devmem_allocation, dev, mm,
 				&amp;dpagemap_devmem_ops,
-				&amp;tile-&gt;mem.vram.dpagemap,
+				&amp;tile-&gt;mem.vram-&gt;dpagemap,
 				end - start);
 
 	blocks = &amp;to_xe_ttm_vram_mgr_resource(bo-&gt;ttm.resource)-&gt;blocks;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 86e9811e60ba..858ce0183aaa 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -19,6 +19,7 @@
 #include &quot;xe_tile_sysfs.h&quot;
 #include &quot;xe_ttm_vram_mgr.h&quot;
 #include &quot;xe_wa.h&quot;
+#include &quot;xe_vram.h&quot;
 
 /**
  * DOC: Multi-tile Design
@@ -95,6 +96,33 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+/**
+ * xe_tile_alloc_vram - Perform per-tile VRAM structs allocation
+ * @tile: Tile to perform allocations for
+ *
+ * Allocates VRAM per-tile data structures using DRM-managed allocations.
+ * Does not touch the hardware.
+ *
+ * Returns -ENOMEM if allocations fail, otherwise 0.
+ */
+int xe_tile_alloc_vram(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&amp;xe-&gt;drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	vram-&gt;tile = tile;
+	tile-&gt;mem.vram = vram;
+
+	return 0;
+}
+
 /**
  * xe_tile_init_early - Initialize the tile and primary GT
  * @tile: Tile to initialize
@@ -132,8 +160,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
-	if (tile-&gt;mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &amp;tile-&gt;mem.vram.ttm);
+	if (tile-&gt;mem.vram) {
+		err = xe_ttm_vram_mgr_init(tile, &amp;tile-&gt;mem.vram-&gt;ttm);
 		if (err)
 			return err;
 		xe-&gt;info.mem_region_mask |= BIT(tile-&gt;id) &lt;&lt; 1;
@@ -168,7 +196,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe-&gt;info.has_usm &amp;&amp; IS_DGFX(xe))
-		xe_devm_add(tile, &amp;tile-&gt;mem.vram);
+		xe_devm_add(tile, tile-&gt;mem.vram);
 
 	return xe_tile_sysfs_init(tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 066a3d0cea79..fb0473fa9098 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,12 +14,14 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 int xe_tile_init(struct xe_tile *tile);
 
+int xe_tile_alloc_vram(struct xe_tile *tile);
+
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
 {
-	return &amp;tile-&gt;mem.vram.dpagemap;
+	return &amp;tile-&gt;mem.vram-&gt;dpagemap;
 }
 #else
 static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index d9c9d2547aad..2f5243343446 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -25,6 +25,7 @@
 #include &quot;xe_ttm_stolen_mgr.h&quot;
 #include &quot;xe_ttm_vram_mgr.h&quot;
 #include &quot;xe_wa.h&quot;
+#include &quot;xe_vram.h&quot;
 
 struct xe_ttm_stolen_mgr {
 	struct xe_ttm_vram_mgr base;
@@ -82,15 +83,16 @@ static u32 get_wopcm_size(struct xe_device *xe)
 
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)-&gt;mem.vram;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);</pre>
    </blockquote>
    Follow inverse xmas tree format.
    <blockquote type="cite" cite="mid:20250702084424.3609863-3-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	u64 stolen_size, wopcm_size;
 	u64 tile_offset;
 	u64 tile_size;
 
-	tile_offset = tile-&gt;mem.vram.io_start - xe-&gt;mem.vram.io_start;
-	tile_size = tile-&gt;mem.vram.actual_physical_size;
+	tile_offset = tile_io_start - xe_vram_region_io_start(xe-&gt;mem.vram);
+	tile_size = xe_vram_region_actual_physical_size(tile_vram);
 
 	/* Use DSM base address instead for stolen memory */
 	mgr-&gt;stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) &amp; BDSM_MASK) - tile_offset;
@@ -107,7 +109,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 
 	/* Verify usage fits in the actual resource available */
 	if (mgr-&gt;stolen_base + stolen_size &lt;= pci_resource_len(pdev, LMEM_BAR))
-		mgr-&gt;io_base = tile-&gt;mem.vram.io_start + mgr-&gt;stolen_base;
+		mgr-&gt;io_base = tile_io_start + mgr-&gt;stolen_base;
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9e375a40aee9..3de2df47959b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,10 +340,11 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = &amp;tile-&gt;mem.vram;
+	struct xe_vram_region *vram = tile-&gt;mem.vram;
 
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile-&gt;id,
-				      vram-&gt;usable_size, vram-&gt;io_size,
+				      xe_vram_region_usable_size(vram),
+				      xe_vram_region_io_size(vram),
 				      PAGE_SIZE);
 }
 
@@ -392,7 +393,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &amp;cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + tile-&gt;mem.vram.io_start;
+		phys_addr_t phys = cursor.start + xe_vram_region_io_start(tile-&gt;mem.vram);
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 3a4c84e9efc6..71f463f2c3be 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -147,17 +147,17 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe-&gt;mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe-&gt;mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe-&gt;mem.vram.io_size)
+	xe-&gt;mem.vram-&gt;io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe-&gt;mem.vram-&gt;io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!xe-&gt;mem.vram-&gt;io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe-&gt;mem.vram.dpa_base = 0;
+	xe-&gt;mem.vram-&gt;dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe-&gt;mem.vram.mapping = devm_ioremap_wc(&amp;pdev-&gt;dev, xe-&gt;mem.vram.io_start,
-					       xe-&gt;mem.vram.io_size);
+	xe-&gt;mem.vram-&gt;mapping = devm_ioremap_wc(&amp;pdev-&gt;dev, xe-&gt;mem.vram-&gt;io_start,
+						xe-&gt;mem.vram-&gt;io_size);
 
 	return 0;
 }
@@ -279,10 +279,10 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	xe-&gt;mem.vram.mapping = NULL;
+	xe-&gt;mem.vram-&gt;mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-		tile-&gt;mem.vram.mapping = NULL;
+		tile-&gt;mem.vram-&gt;mapping = NULL;
 }
 
 /**
@@ -318,10 +318,10 @@ int xe_vram_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	drm_info(&amp;xe-&gt;drm, &quot;VISIBLE VRAM: %pa, %pa\n&quot;, &amp;xe-&gt;mem.vram.io_start,
-		 &amp;xe-&gt;mem.vram.io_size);
+	drm_info(&amp;xe-&gt;drm, &quot;VISIBLE VRAM: %pa, %pa\n&quot;, &amp;xe-&gt;mem.vram-&gt;io_start,
+		 &amp;xe-&gt;mem.vram-&gt;io_size);
 
-	io_size = xe-&gt;mem.vram.io_size;
+	io_size = xe-&gt;mem.vram-&gt;io_size;
 
 	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
@@ -329,45 +329,104 @@ int xe_vram_probe(struct xe_device *xe)
 		if (err)
 			return err;
 
-		tile-&gt;mem.vram.actual_physical_size = tile_size;
-		tile-&gt;mem.vram.io_start = xe-&gt;mem.vram.io_start + tile_offset;
-		tile-&gt;mem.vram.io_size = min_t(u64, vram_size, io_size);
+		tile-&gt;mem.vram-&gt;actual_physical_size = tile_size;
+		tile-&gt;mem.vram-&gt;io_start = xe-&gt;mem.vram-&gt;io_start + tile_offset;
+		tile-&gt;mem.vram-&gt;io_size = min_t(u64, vram_size, io_size);
 
-		if (!tile-&gt;mem.vram.io_size) {
+		if (!tile-&gt;mem.vram-&gt;io_size) {
 			drm_err(&amp;xe-&gt;drm, &quot;Tile without any CPU visible VRAM. Aborting.\n&quot;);
 			return -ENODEV;
 		}
 
-		tile-&gt;mem.vram.dpa_base = xe-&gt;mem.vram.dpa_base + tile_offset;
-		tile-&gt;mem.vram.usable_size = vram_size;
-		tile-&gt;mem.vram.mapping = xe-&gt;mem.vram.mapping + tile_offset;
+		tile-&gt;mem.vram-&gt;dpa_base = xe-&gt;mem.vram-&gt;dpa_base + tile_offset;
+		tile-&gt;mem.vram-&gt;usable_size = vram_size;
+		tile-&gt;mem.vram-&gt;mapping = xe-&gt;mem.vram-&gt;mapping + tile_offset;
 
-		if (tile-&gt;mem.vram.io_size &lt; tile-&gt;mem.vram.usable_size)
+		if (tile-&gt;mem.vram-&gt;io_size &lt; tile-&gt;mem.vram-&gt;usable_size)
 			drm_info(&amp;xe-&gt;drm, &quot;Small BAR device\n&quot;);
-		drm_info(&amp;xe-&gt;drm, &quot;VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n&quot;, id,
-			 tile-&gt;id, &amp;tile-&gt;mem.vram.actual_physical_size, &amp;tile-&gt;mem.vram.usable_size, &amp;tile-&gt;mem.vram.io_size);
-		drm_info(&amp;xe-&gt;drm, &quot;VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n&quot;, id, tile-&gt;id,
-			 &amp;tile-&gt;mem.vram.dpa_base, tile-&gt;mem.vram.dpa_base + (u64)tile-&gt;mem.vram.actual_physical_size,
-			 &amp;tile-&gt;mem.vram.io_start, tile-&gt;mem.vram.io_start + (u64)tile-&gt;mem.vram.io_size);
+		drm_info(&amp;xe-&gt;drm,
+			 &quot;VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n&quot;,
+			 id, tile-&gt;id, &amp;tile-&gt;mem.vram-&gt;actual_physical_size,
+			 &amp;tile-&gt;mem.vram-&gt;usable_size, &amp;tile-&gt;mem.vram-&gt;io_size);
+		drm_info(&amp;xe-&gt;drm, &quot;VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n&quot;,
+			 id, tile-&gt;id, &amp;tile-&gt;mem.vram-&gt;dpa_base,
+			 tile-&gt;mem.vram-&gt;dpa_base + (u64)tile-&gt;mem.vram-&gt;actual_physical_size,
+			 &amp;tile-&gt;mem.vram-&gt;io_start,
+			 tile-&gt;mem.vram-&gt;io_start + (u64)tile-&gt;mem.vram-&gt;io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
 		available_size += vram_size;
 
-		if (total_size &gt; xe-&gt;mem.vram.io_size) {
+		if (total_size &gt; xe-&gt;mem.vram-&gt;io_size) {
 			drm_info(&amp;xe-&gt;drm, &quot;VRAM: %pa is larger than resource %pa\n&quot;,
-				 &amp;total_size, &amp;xe-&gt;mem.vram.io_size);
+				 &amp;total_size, &amp;xe-&gt;mem.vram-&gt;io_size);
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
 	}
 
-	xe-&gt;mem.vram.actual_physical_size = total_size;
+	xe-&gt;mem.vram-&gt;actual_physical_size = total_size;
 
-	drm_info(&amp;xe-&gt;drm, &quot;Total VRAM: %pa, %pa\n&quot;, &amp;xe-&gt;mem.vram.io_start,
-		 &amp;xe-&gt;mem.vram.actual_physical_size);
-	drm_info(&amp;xe-&gt;drm, &quot;Available VRAM: %pa, %pa\n&quot;, &amp;xe-&gt;mem.vram.io_start,
+	drm_info(&amp;xe-&gt;drm, &quot;Total VRAM: %pa, %pa\n&quot;, &amp;xe-&gt;mem.vram-&gt;io_start,
+		 &amp;xe-&gt;mem.vram-&gt;actual_physical_size);
+	drm_info(&amp;xe-&gt;drm, &quot;Available VRAM: %pa, %pa\n&quot;, &amp;xe-&gt;mem.vram-&gt;io_start,
 		 &amp;available_size);
 
 	return devm_add_action_or_reset(xe-&gt;drm.dev, vram_fini, xe);
 }
+
+/**
+ * xe_vram_region_io_start - Get the IO start of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the IO start of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram)
+{
+	return vram ? vram-&gt;io_start : 0;
+}
+
+/**
+ * xe_vram_region_io_size - Get the IO size of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the IO size of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram)
+{
+	return vram ? vram-&gt;io_size : 0;
+}
+
+/**
+ * xe_vram_region_dpa_base - Get the DPA base of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the DPA base of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram)
+{
+	return vram ? vram-&gt;dpa_base : 0;
+}
+
+/**
+ * xe_vram_region_usable_size - Get the usable size of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the usable size of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram)
+{
+	return vram ? vram-&gt;usable_size : 0;
+}
+
+/**
+ * xe_vram_region_actual_physical_size - Get the actual physical size of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the actual physical size of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram)
+{
+	return vram ? vram-&gt;actual_physical_size : 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index e31cc04ec0db..d4bf1f9c2a72 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -6,8 +6,17 @@
 #ifndef _XE_VRAM_H_
 #define _XE_VRAM_H_
 
+#include &lt;linux/types.h&gt;
+
 struct xe_device;
+struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
 
+resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram);
+
 #endif</pre>
    </blockquote>
    With nits fixed,&nbsp;<br>
    <span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
      K V P &lt;</span><a href="mailto:satyanarayana.k.v.p@intel.com"><span style="font-family:Aptos">satyanarayana.k.v.p@intel.com</span></a><span style="font-family:Aptos">&gt;</span>
    <blockquote type="cite" cite="mid:20250702084424.3609863-3-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------1nJrBdnytDQ04XvkrMALNXxQ--
