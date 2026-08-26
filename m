Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2741C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 12:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A953810E27D;
	Wed, 26 Aug 2026 12:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0lkZRaS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EE310E27D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787747647; x=1819283647;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ziqpkRrdubvZIkgY7j+mWL2A5IJH6P9xWJooLktGSLI=;
 b=n0lkZRaSc6vb2BaVE69dxm5rNwQd0ozsMqTVc0htI15KkhSV75Jhz4of
 kgu377HO9rlWiGdN/DaJKKQNk1lBo2RjHhVWMMppTJey2dQjdtbjT5dnw
 nyHqkPwCybuRSJ2QfNPCOadXxTsxKJ12cbTSdUmwX/7PGQOnMFHDqlgC/
 ECywnJlnWu3eUa/prQ2lPuQA8BxxTxpOCabX48KqcEG+iirLU5sQQnV4n
 K+jex9KLjdiidvIc+BPxtFPCq/RDz1GqmLjUiAQ1rOu9m8frpGjjOQFOe
 QwMtSR3PkfTVm9a5ScJANz1R2EX7HdEG2AbOarkyUkWGkL6qkC3lMrUVH Q==;
X-CSE-ConnectionGUID: W5qmdVRqR3ud3AhtSkEE2A==
X-CSE-MsgGUID: snw+n/NdTI6lVYvwegStBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92090009"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208,217";a="92090009"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 05:34:06 -0700
X-CSE-ConnectionGUID: tHgNmEwuTo2ywocIFfQErQ==
X-CSE-MsgGUID: PcamlXoYQRmXrNZ5Ym//XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
 d="scan'208,217";a="291090599"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 05:34:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 05:34:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 05:34:05 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 05:34:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMtRLSl7iyHRg+9jnNn0WvR5DHv3KMVhPc08PAc0egA//BGL/dKcea5TbzlY01tiK5hKBZCwnW2LsHUrQV9s3SUYuGyZ/5FVMH8mA0EYIlgBSbcxKKsMARtDPvJlCRmY9Ni+KewOPDDzhUm3Xwq63A4hwqkWPrAfmk9dNEdf6BkPqmG0SWjWAGFy1U6+zr3XtDgCsGKV01dn0TdTbTHMuiq9BdfczPRwgnFqXkgVcip3fkE5jKgJTMOyQgju/QsSpVRgBDGF6UwIm0uHsfwO2mXT8P5QCad8IZsaxQuFPaYzwDwJehLQR3Eb7J3Oh24RznOUX1u2Z93S5kZz7M8wrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5YPkgkwWr7mfwUanx0D5lg+gFwdHcYLckKhTXe22SE=;
 b=ucGmGf5s8IHAsDQRTP5lMNdGMAgYrxsVV2eZZ3rcaiVdJekNc4nIV+CVPTCliItEWZMKX3x9+3TxEiOS2ZIz4wG2DyXaA8ktTVPic11B5qgEl0SAEeu5o/+sFUH+xopYRXtolq1XgJXigWcvhfKFqgSRr7PY/QxjaHg7Ki1fQwugs+QRN65CcVq1PRLiFXIu9/XCHWVRfBHWyEmdhdiBPr/oLc+QDAWvJWzskraPzqDdpyVyGU1NCmh8mleuiUbqITjbPTFDvLTMkHRfBdqVe8WmCjp4IyBQsT3p6a4HLwN9RDpUXYeSCez3mikyoLRfSNXPtEZ6iZtT64qKZxpv5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH3PPFDC3198517.namprd11.prod.outlook.com (2603:10b6:518:1::d55)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 12:34:03 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 12:34:02 +0000
Content-Type: multipart/alternative;
 boundary="------------VuXhla4eWJp0lRqST8YpjpBc"
Message-ID: <fa2e96f7-1190-4018-a62e-d717269f01ed@intel.com>
Date: Wed, 26 Aug 2026 18:03:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/xe/reg_sr: Report save-restore errors using
 structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-8-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260819191442.1957986-8-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA5P287CA0143.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH3PPFDC3198517:EE_
X-MS-Office365-Filtering-Correlation-Id: b87b3ce5-4c8a-4d5e-e343-08df036e4f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|4143699003|10067099003|56012099006|11063799006|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IKgH9dBIjGT9wLXH7/lzMxliBVdPTmk2+trdFSKEkzWXWsUIkBgaa6g+PKlXYba3l6FGZL+CraEdDr5y1BXCA8HMm/97wyDwTZy08S+doohArAQdRl2m9Vjcy0+Y/7xUdipn87ge6hoUP9Y9HdvH3DBlVLMTSJt6XpozriNK6LPWNBJWxL93GBv1k+410YcadfQDEbKyt9uih12iq1EqUeDCQJda6uUYrLBILqjOC8SY4+aPxEa0q0kwskN4n/lIw5qvtajVLhj0lP5BtOVvzFt2VgZqHfYhPkwycJl+Q36OHTqvt+gMggi+2H6argh1W6vuFB8NHNQI/hYlAjvUaSbQdhfT3OX3GxvXkeRKei7zrgCnYxXpU0NqFKWMZHT7KNj0acu8JD9/as6510tOIRUr92LY/yYL/4jYdJKhLIItrI7msOzFD4reSnZH0/QHLXTwCDt9WdwmUZhQpQ3TxooDOAfy3GkkSPrAxWMG1xwfVtzhqT5ZXt1guEskmASenzbv/cSS9Gjdyvjb+7uLvRZ+pMSGxpKkceAuSO9m4228L9gOnhHIXMmwm4vl1/SoswHwam7Kblqg/QRs4wDpDJx7mYd3CsoiYIloT43eeYIL2L7/5yqp7OVgdfsvBIAKGP8s9eBEKS6vf8mFescWb3EiQyVa5Ci6YLOlXT9tdjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(10067099003)(56012099006)(11063799006)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWdVSnB1TzByRFByWW5waHJnMWJ2K3pGelNiOEp0L256NlhsMXFmRGxPdEho?=
 =?utf-8?B?K1dXWDE5RngrUkRBaXZ4NjdhVzRXSTVINHh3Q3kzVE1uMTJkVnR0aVJ1dW1R?=
 =?utf-8?B?Tmx2Y2RnK0szTDlmQVpITDZqVjVQU1owclJPdGFQNDF2TVNDTlo2RmFDZ3ZL?=
 =?utf-8?B?YjlhSC9EeElHZG9MSm1paXFTR3l5S21tSTZ3M1N0UlJrNFFFSThWNmJodVAz?=
 =?utf-8?B?MVdyakp1U3Q1cUdPNUo2bUI0QkNHSWpKTnlKa1FQZzM2cjEwT2xIbWhDUXBj?=
 =?utf-8?B?dXRsYnRrbkhwNlpGT0tEU2JoWHU2QUdFUkxHYTlIQ0hmUlVVU29nQUg5bFdQ?=
 =?utf-8?B?a2RUaE01STBFaHRRSXAwQTRFNy9sU2VIR2tnaVlWRFRCTHdTSXhTb0dFMElP?=
 =?utf-8?B?T0xxR0FqeFNPOFk3MTRvY3dsMEdHK3R6RTRmVXFtZUVhRVpOcHZGQ3lFdWVS?=
 =?utf-8?B?NVlWSW1ibUo5Wjl6VnJJVjZqOTAvSVM0ZlNTVzhINW53c242OHQ1UVRlckVx?=
 =?utf-8?B?UmhTc1RXYlU2bllHRjVsN1QzbURidjhSSjlabU9zNlVlL2JqUFRicytOVGNS?=
 =?utf-8?B?eHRJNzdLMGFKZzJYWHZqaUhROGF5SmQ5MnZTMk4xVzU5cEJha3ozSkRhQ3cx?=
 =?utf-8?B?Tm9wejE5SXJ5RkVGMXEwc0Jsb1pTczFjdDI0VzdsK1p1WUtGbGhUQUdCeWQy?=
 =?utf-8?B?SURoSW5xQnpicFBDVzBCSmErUkV4NUpLelN0ZHdDYmliZmtITFJ2WGFRQTcv?=
 =?utf-8?B?TXppKytGVExCZnlTUTFrUFgweWdiVnIxZFJGaWN0UysyOTdNYUV4bTVLSkhW?=
 =?utf-8?B?NVhhZjREYisyQTVpaE1lNWpna0RiU0FiM2wzbzJiS2Z1dkZ4WEM1U0NSOGRW?=
 =?utf-8?B?SEJ0QmZtTXE4dU01VkNmcTZTY2tWL3FxNlZyRjhVbHZidTNUbkhmZGYzVjV3?=
 =?utf-8?B?Y1U0dmZXbUd5dFIvM0IvZTZVbXlqMUR3bVF5VEFtSTY1b1NOU29CMk9iaXdv?=
 =?utf-8?B?eStxQUJ6RlhBeENLTVF4RFgyMEMySEh1T0p1bUV1LzFaVFJldmhBUVBDYU0z?=
 =?utf-8?B?YWxSSlRtN2NJQnB4ZFUrMGsybGlZL1pQTHVJbXVyazVpbXNzQW85d1I2aVM5?=
 =?utf-8?B?U0xMMWRLbVBjL3U2MzVVN3pDL0ZJS2lvZEk2R2JuYkF0bmtSa2NrSGNaRThE?=
 =?utf-8?B?S0ZnZWFBTkJRVzBpRzVzMmxHSW1tY2tHVDF4SVNsTFpTa0xOY0dGZDJYaXNX?=
 =?utf-8?B?dUtZd05rVDR5b3NJRTF4b09WckFFb05lWlB5SzYyMHV0Y0NmMHltY1lpdVlt?=
 =?utf-8?B?R2VEMzBXQnpxQkpxOHlMZDVFT3NJYXlSSXVlYzI5K0ZPRjJoTEg3aUd4V2hs?=
 =?utf-8?B?c1R6WXgxVnhyNldUM3lFV1VZTjZTb3BWT29aMVFlUE42TjQzeUczcGdxUkFK?=
 =?utf-8?B?UXFxanZCcGU0OWNtTzE3TnE4aXFRSjJaUGgxaURXSFhnUVBRbmJiMS9qUjN5?=
 =?utf-8?B?ZlRCUjBTVENYSHJzcHNjNnRtQ3NHNVRsNU1Oa2RnVTJGZU9NTisrYkMzLzZF?=
 =?utf-8?B?RGJCL1NmZ1ZmVWVjU1ZYV2RjRTZVVlgvK2NsaEt4THVSeGRIYWIydDJuSDEy?=
 =?utf-8?B?aUFlMVoxTmQzcHYxWnNIU01WTGNpT0E1bnJlYkJVbWVFUTVuOVdxT21QQ0pM?=
 =?utf-8?B?K05CWGJwbU9ES1IvVzgrMXo0Um5mL3JySm82eHVNSEFXTkEzZ3NRRmFNVWxp?=
 =?utf-8?B?Si8xT0pSZDNTd1RhSXNwNmF1YmpENWhITm9Xc3YwVXl0cnJHRFYva2tOT1V2?=
 =?utf-8?B?MXc4MWJHcmJ3NjFyQzBqMDNWZ0pUU3laRTJMODQyTjFLdldZdUw2THJSVXZL?=
 =?utf-8?B?NGk5QWJETEhjVnoxRGFvZUFJTHFndm9laHdDNW5DRWFOdTZZNXVXakk2RVpz?=
 =?utf-8?B?Ti9haHNuZUoxZnAvSEtJYWRFdmV4c0xsRGVyR3FueDhMcTBsUExJek80dHFS?=
 =?utf-8?B?cUJPZGQ3ZGRDc0NYdERXZ3JBc3dBdXpGMFdkUFU1SzVyMmpCbW11TDYyb3lv?=
 =?utf-8?B?THd3UnZrd3Avb0JhWFhiSEVpV2U3eGNxcFFlaGlhem9MNnFhZ1pQdTFVZXFD?=
 =?utf-8?B?REh5bnVCUVdnblBtQjhOZTlKNjlwOTZDOE5zL09WNUZNQ0JteHlId3VTOEQy?=
 =?utf-8?B?NXptTG9ZclBMQXN1QWZTLzFId25zem80dUxsRUZHNXhTQVp5ZHZnWlJ1eUtm?=
 =?utf-8?B?d0YxZFF2QklVT2dLSTBOU3RUeDNXWVBYR2ExdWlDNlppaWRqK2RlREIxcGJv?=
 =?utf-8?B?emtFUjUvb1VIVnAwNnhjOVhsTVJ2Ry9xRXI1UkIyMHBqVUNJaEZWejk3bUZi?=
 =?utf-8?Q?pnrnSNfiXFtVIZoY=3D?=
X-Exchange-RoutingPolicyChecked: W9KbB61KME9vMfnZr7SrjUOCauQtrsNwC9fUbBdAqwoPi/oFA1xKenF50ol6MQKZLvU6bMln6d82/2ir4dJEw+jvqew4OhYyA40QVEu2O3KAaIsyLFJTrKC2hD0UJNOK6dbT3ivRN5nH+URxWwIN/fAVKr3kHAhEuSkVhXZIF75YB1ReoEgatUsDRDcN7flGLi3NSn4/MqeOsVz84/gp+j7VQNGTZ5deJO3YYUUHMrtyTpGGhVIlZDxF+lo5sD8AUHCyfVheDEGfNb1v4eCrI6orU/41WRypT471WJC8oLtKU2CIhrBgsbNcycQ8oO6Hac0aPmL+EH/bdeqolqn9GQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b87b3ce5-4c8a-4d5e-e343-08df036e4f41
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 12:34:02.4539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZ7oGKzCa4kkiJDXD5o+Kg2U0aVHnTYXco4qmrVLWQTu+6Uo0bqzeO1Ap+Nq5hc+R+pY9Lg3AfOh53SzD0n9CoLA6ENs+9IM9xKbkQY8CwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFDC3198517
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

--------------VuXhla4eWJp0lRqST8YpjpBc
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 20-08-2026 12:44 am, Dnyaneshwar Bhadane wrote:
> Replace xe_gt_notice() and xe_gt_err() calls with xe_log_info() and
> xe_log_err() using the REGS component tag for register save-restore
> operations:
>
>    - MCR register mismatch corrections
>    - Failed to add register to save-restore list
>    - Force-wake timeout during SR apply
>
> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_reg_sr.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index e328f5072557..c3ea0acd91b6 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -21,6 +21,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_gt_types.h"
>   #include "xe_hw_engine_types.h"
> +#include "xe_log.h"
>   #include "xe_lrc.h"
>   #include "xe_mmio.h"
>   #include "xe_rtp_types.h" @@ -87,15 +88,15 @@ static struct xe_reg sanitize_mcr(struct 
> xe_reg_sr *sr, if (is_mcr && !reg.mcr) { reg.mcr = 1; - xe_gt_notice(gt, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
> -			     reg.addr);
> +		xe_log_info(gt, REGS, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
> +			    reg.addr);
>   		reg_sr_inc_error(sr);
>   	}
>   
>   	if (!is_mcr && reg.mcr) {
>   		reg.mcr = 0;
> -		xe_gt_notice(gt, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
> -			     reg.addr);
> +		xe_log_info(gt, REGS, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
> +			    reg.addr);
>   		reg_sr_inc_error(sr);
>   	}
>   
> @@ -143,12 +144,11 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>   fail_free:
>   	kfree(pentry);
>   fail:
> -	xe_gt_err(gt,
> -		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> -		  idx, e->clr_bits, e->set_bits,
> -		  str_yes_no(e->reg.masked),
> -		  str_yes_no(e->reg.mcr),
> -		  ret);
> +	xe_log_err(gt, REGS, ret,
hmm, if Memory allocation failed, REGS TAG is right one?
> +		   "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s)\n",
> +		   idx, e->clr_bits, e->set_bits,
> +		   str_yes_no(e->reg.masked),
> +		   str_yes_no(e->reg.mcr));
>   	reg_sr_inc_error(sr);
>   
>   	return ret;
> @@ -219,7 +219,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>   
>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> -		xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
> +		xe_log_err(gt, REGS, -ETIMEDOUT, "Failed to apply, err=-ETIMEDOUT\n");

drop "err=-ETIMEDOUT "

Thanks,

-/Mallesh

>   		return;
>   	}
>   
--------------VuXhla4eWJp0lRqST8YpjpBc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-08-2026 12:44 am, Dnyaneshwar
      Bhadane wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260819191442.1957986-8-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">Replace xe_gt_notice() and xe_gt_err() calls with xe_log_info() and
xe_log_err() using the REGS component tag for register save-restore
operations:

  - MCR register mismatch corrections
  - Failed to add register to save-restore list
  - Force-wake timeout during SR apply

Signed-off-by: Dnyaneshwar Bhadane <a class="moz-txt-link-rfc2396E" href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index e328f5072557..c3ea0acd91b6 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -21,6 +21,7 @@
 #include &quot;xe_gt_printk.h&quot;
 #include &quot;xe_gt_types.h&quot;
 #include &quot;xe_hw_engine_types.h&quot;
+#include &quot;xe_log.h&quot;
 #include &quot;xe_lrc.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_rtp_types.h<a class="moz-txt-link-rfc2396E" href="mailto:@@-87,15+88,15@@staticstructxe_regsanitize_mcr(structxe_reg_sr*sr,if(is_mcr&amp;&amp;!reg.mcr){reg.mcr=1;-xe_gt_notice(gt,">&quot;
@@ -87,15 +88,15 @@ static struct xe_reg sanitize_mcr(struct xe_reg_sr *sr,
 
 	if (is_mcr &amp;&amp; !reg.mcr) {
 		reg.mcr = 1;
-		xe_gt_notice(gt, &quot;</a>xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n&quot;,
-			     reg.addr);
+		xe_log_info(gt, REGS, &quot;xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n&quot;,
+			    reg.addr);
 		reg_sr_inc_error(sr);
 	}
 
 	if (!is_mcr &amp;&amp; reg.mcr) {
 		reg.mcr = 0;
-		xe_gt_notice(gt, &quot;xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n&quot;,
-			     reg.addr);
+		xe_log_info(gt, REGS, &quot;xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n&quot;,
+			    reg.addr);
 		reg_sr_inc_error(sr);
 	}
 
@@ -143,12 +144,11 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 fail_free:
 	kfree(pentry);
 fail:
-	xe_gt_err(gt,
-		  &quot;discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n&quot;,
-		  idx, e-&gt;clr_bits, e-&gt;set_bits,
-		  str_yes_no(e-&gt;reg.masked),
-		  str_yes_no(e-&gt;reg.mcr),
-		  ret);
+	xe_log_err(gt, REGS, ret,</pre>
    </blockquote>
    hmm, if Memory allocation failed, REGS TAG is right one?
    <blockquote type="cite" cite="mid:20260819191442.1957986-8-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		   &quot;discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s)\n&quot;,
+		   idx, e-&gt;clr_bits, e-&gt;set_bits,
+		   str_yes_no(e-&gt;reg.masked),
+		   str_yes_no(e-&gt;reg.mcr));
 	reg_sr_inc_error(sr);
 
 	return ret;
@@ -219,7 +219,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
-		xe_gt_err(gt, &quot;Failed to apply, err=-ETIMEDOUT\n&quot;);
+		xe_log_err(gt, REGS, -ETIMEDOUT, &quot;Failed to apply, err=-ETIMEDOUT\n&quot;);</pre>
    </blockquote>
    <p>drop &quot;<span style="white-space: pre-wrap"> err=-ETIMEDOUT</span>
      &quot;</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260819191442.1957986-8-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
 		return;
 	}
 
</pre>
    </blockquote>
  </body>
</html>

--------------VuXhla4eWJp0lRqST8YpjpBc--
