Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490B3CD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 17:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0947D10E223;
	Mon, 25 May 2026 17:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIz9tXT1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3C010E223
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 17:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779730578; x=1811266578;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i65Uv5I3O8gyfNbY8mTgyutra3/BtVvjtq1r5idwI/s=;
 b=TIz9tXT1yyON2E/+cEqVobMDm0mQjED+hX7fEx6+PNZlRTMSFnA5nWvj
 mLyKt/aav+nMDkUigehUDNGopED0QElUqv2xSPqS/X1yIZ6/LPwi8A1Lx
 nqh0s+A81302Q8WRyMnc/k8GxNkKubtGLJdu68U6AAzjPuKxwr2qgSz4A
 mmYh8cEj/iGRrWacsxDSZnrcd7aSB5TjP9Dm4K2KZOqzxEP2hq5y0B0MZ
 oDoHJNGaLm+Qpicv5BggDhLJHgZn4450WnLUuDHEune22//Faz8vStwgV
 kRAeFweCaa2h0+j55gP07rMAKb7oHcexiTV+BLZ68sj+rNnjjQOAb/ppJ g==;
X-CSE-ConnectionGUID: pV1F3WL7R8S4GoDExQSjtg==
X-CSE-MsgGUID: VXyyFvlKRSi+Lw3gNBwJNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80667718"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80667718"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 10:36:18 -0700
X-CSE-ConnectionGUID: hEeABudZRIahKKo+5CHcrg==
X-CSE-MsgGUID: HUg/tVq7RJe9AvV6SLvHVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="240822051"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 10:36:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 10:36:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 10:36:17 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 10:36:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/bsXpymJbsUtmTSKulGJRZrBfVWlylrxfyM4gYCMHlMIdZV9x92sb4vtNqj90m5ygGLehR47Q649d5o8CvJhJxhj0Yf8OFSCgZ+L0pHP/2gB9jyORnpWjiZzkHWoxoxSS/0Hksy1ggyKqeRcG/HpcOM/fGMKCFHFQSZDM0v0bPBFz1qA9xvgseu3H5juzYC9yS4nQfufMGiM7PJhEuIZ3tG0lVy68qMZ2ay8bjVxvfKrtvVkh/mLWfxqN+72xGDhhiceBJMOtPZ1cVV+x4cJeWQRGYyTepircM5SKdkJs5bkCvsZhZ33TIfv8eztcRzv9Nbw1YafpP4uRa0NgyJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsMnyaic/YE64BCq8wvzwg3PacE7gLne0aBSkU9CO5k=;
 b=gJemCh78v97emfG2qFJoX3EHe25DOe7mTNFERMyjuhy6ArveTwQ7kcM0cWLDB/vbb6RglfWeoPRe9OQ18LmAuJ79PGHY00xjBjzYBeQtu9+HRu48+Qg02Cx07emke4gmxxXq8JBCBs5AKyBoddnXjGt65Q6q+WXlAVT5ifRkg44BLKVuO6AnGtFv9wa4mWL6AoHc/zI5xgWG+BCvGKsCWnos/UJpM+V4BEJXW0bV819e/Mp5sb/64ixAN/OtP+pNGwFO5KpsCjMHx10oXLQEl5J40S/iqpPREHdNMYmgsuvNdX/7V0aDd+f05TeFMBtqb8Ll62k3HV+VMlHlJMb8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6997.namprd11.prod.outlook.com (2603:10b6:510:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 17:36:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 17:36:13 +0000
Message-ID: <a032b750-a77b-4f78-aa24-f6879950828b@intel.com>
Date: Mon, 25 May 2026 19:36:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/15] drm/xe/xe_ras: Initialize Uncorrectable AER
 Registers
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-24-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260525100619.3155663-24-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0025.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2b71d2-b889-46fd-788f-08deba841e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|6133799003|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: 9h4Hh93WAYbf02A11ZF8WQCtCtvN0nlbzCihVx/joz/rui2HTXOqhAV0QVbhinbwZCkbDtX/acEuTJN/kEOOwGvNCQvtDX182Znht4f8KGz8xm/n8e2FQxngvkN70VxCvV4mW5QgT9C5POhCa3ltjlEsNB5eJCn4qh68qWVKJ4AKsHsaxSEdG79OTFoholzmm5PIDvxex5hZUeeTnRjxA01nd80Kign18bYjWPzMr05nvQ3ZrVBI4b1/3TbDMIu3OkfcCvzdQhEaOCiaDh45sBUaNluoVFBTiP1nrrzrSFPyAysiqBYT5/Kl5R+uhu4MHD0JVGmqjWXZGFXEe/S5cKl1bQ+XpmxNDRnxZe4Esm3ub3Q6m1gBDj0jfmWaPvGPUfcfE/eQR2ua0bcrw5H06OutUD1Zx5WlIqUhmkqLKwCuga4bnH/vfd8UZZ/Dfc51epy8zqGx22EXDiUP4NWbh50jhvcmY54MisY/mBozFpvxIYyXCZFhQ7ov9VdQl/qmsunfYZ1IpIFOeHgrcbsE7dsFfEife4pAauEksQ4/awS+a28T94+lFVpdJDFID5+nn3BJjFehkkOZOKdrhmt45WLi53NKQc7rt5gK121UKtLWAXqbvOR2IhJurQNvEF94OOn50rIc5gZ36haXPE+C35gmzuDgJftMGlNP0iOnX50rnkXyDfiwSfXhuLUrbtCm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(6133799003)(4143699003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STArWFdZRlhqdHlLQVo3bkw5WmVIdW5ZRVh6eG00T2xybUNvRUo3V0VrTko0?=
 =?utf-8?B?c0o2c0xFQUZEdDlOZlZyM0VtT0lpZitCdDhLQk9oV1E0a1ErdC9ENkZGMDFh?=
 =?utf-8?B?NVE5aVBhRjI0VWdabWJvMzJaTjhRS0ZMT0NNQ1JSYWNKenNjNVpXNytHM1BU?=
 =?utf-8?B?UExpNFdPR2Zkc0dNbmNlOFE1U1F4bitJVzhKaWxuSVFZU3dld1dieVQxRUVG?=
 =?utf-8?B?SXd3RUhJK0tnSEVtRVFWNFBQaW1OZjFxRm5BdEtNSS9BajIrV3pwSWpxUU5z?=
 =?utf-8?B?am5FUU5qYWVHTlNrUld0cWlOekxjVjNQTjZNcE9zVnV2azVCZjkxYkhoK3Z3?=
 =?utf-8?B?MmRZMURXaXBlUzJTYVR6R1pxQzFuK2hwNkxjR21TUDZTdTEyVFNOa1Y5UFhO?=
 =?utf-8?B?aEcxb1Q2Wm5vSWliNTNlWEZJaVVFZGxjeC9tdExab1AvNWRzVnl6T0Y4ZWx6?=
 =?utf-8?B?OGt2b0llaE1mSDNYVERlc2pralVDcDc2S3NIcTlLWVpBUVpKQkFMRlRvUGN0?=
 =?utf-8?B?ckwzREg1TU1tTTNxVUk2OGpVT00vMitneTVvMnBJeGZWYXVLT3VCQXhXQ1Fs?=
 =?utf-8?B?MS9YNlZ1UXpXUFluS0JvcU05Z2xNMUlvMDU0ZHhWeks4OUx3RC9VVUpTdVE2?=
 =?utf-8?B?VzRFUThXLzhzRmgrTWxpSEY5WVprdkhkRENnOU1SSzMydEpCanIwM2R3QTVE?=
 =?utf-8?B?RjFMeXpXSTJEa284RkZyQXpXbEtEWHJJYzcwT1lCOFpxd1o0MTBiT0tHOGhR?=
 =?utf-8?B?Tkk3cVlFV1VOMkhMQ0ZUV1dWblZpdWlZTCsrdkZ0eUVETHJuWkZnVHhvVVNY?=
 =?utf-8?B?NzRXSDlLSTdnR2IrNFg1bS9YaG01TmIwT0doMlBlZHIyZlFod05oSE42bGs3?=
 =?utf-8?B?VlhTTks3dUUvejM2MHpNTG9nbE9hL1dmUEpEWG9WSmpxM21HWXNFY1VBWUhF?=
 =?utf-8?B?d3VZdnJTSGt6VzJSOW1QWUJnYkNUQ1oxcy8vRmNrN2tLdDRUdHVlVDlQZjNY?=
 =?utf-8?B?UzVtMnlKSHRvbHoyeXlobzRQRFpPV1hRM1VsYmt5Vm94eHMvZlc1VXo5dWY0?=
 =?utf-8?B?YTMyTFQ1R3VZYlB3Y2l0Z3VwdE9nSnNUbVdWRFE1ODkyRWRua1dtb2xxZE1x?=
 =?utf-8?B?TXZ4M1diK2lJM3k3c0trNmt5WUdMV0llUGkvM1UyQkttMDA4RDhNWE5rRE5S?=
 =?utf-8?B?OE5jdzYvc1dOT3Q0bC9qVDVueVJtTEhrNjR0YngyTFNiZkRNbS9ZcDFTMVFW?=
 =?utf-8?B?RlpOcXJrV2crL3ozS0lESUlXamdJUmRkU3VJZWlHWlNQajY3QWZVaHU3VlJ5?=
 =?utf-8?B?Q09OK3BIK21BbHQrcWx0OGE5cVJmZEk0VnN0TDJrdTFxbDc3a1NlVHdmK0hz?=
 =?utf-8?B?TC9MUWRFWlp1dG1wa2pPUXdoQ2lPd0JDZmZDNHR2d1RkVVNGZ2lmcURjMTY0?=
 =?utf-8?B?SWo2Z2lZWjRCWG5GZ2NtQWJ0YTU0VldYWkpuVFlaOEJhUlFLcEZlTlVkbXFy?=
 =?utf-8?B?UHk5bE9SRmh4akxrT2hUVnE0L1htZm5ZRFZoM05PcEhYR0l2YlVBVmRBUmNH?=
 =?utf-8?B?Tm50bStLVHoxa3VSVHRreXFQRmVXMXAvRGkyMHNVYXRHOGNBT3NDTTRBT3lj?=
 =?utf-8?B?MytPbWEzSFVwUlI4cExPUnV4NDRVTDg3QlpPT3F3a205WjZaM1I2cDBJeEdC?=
 =?utf-8?B?VHk4MVpFT1hQbEVwV0FOM2dwaWZtRk1rQWR4L3lDVFpHNHk1VHNVNXNhcHp6?=
 =?utf-8?B?dFdqYnkwWmwyZDhNU0tIN00rOG13dDFoVHVpTzJnREE3R1JHUytlUGJTWXBt?=
 =?utf-8?B?VFhFVmNHMHpFQnY1RUNFd0svWFExRjdkT01yYnNyVjNoc3FOQVAzYi95ZVll?=
 =?utf-8?B?U2crZ0k4T0pMMWJXRGM1bFBsTDVUMEE3S3dwNXN4QjV3SDI5ZThETlZUUVp0?=
 =?utf-8?B?K1RFdEU0bnhndkhlcndvVXR2WTM3ekNJWlJXVEJWNE95UlFBQTJvQWF3bDds?=
 =?utf-8?B?YzZqcm1RamF2YTIyLy9ES0RpQVpMWXZTa2Z5dkFXWEJPaHpJeTgrcEJSSVdo?=
 =?utf-8?B?cXVDQ1gwbElnMlErWlVxWkhiYTFPMjRibzhiV2JEQ0wzUkZzeDdvb1N1SWNG?=
 =?utf-8?B?S1RENXNScU8zVEtPYW1aaWorOGVMb2VwTGloeVQ5YW50OG4wMUJyZjh1MGls?=
 =?utf-8?B?ZTJWNU5LRUkwRzVLN29RMGprcnVLQS8wbXFHYzlCcjg3Q3F2QVlnVG03WC9E?=
 =?utf-8?B?UDF6My9TeWdqWFdmeWhaWTVpUzVMVXJMa1dkaE1lVisvMmpYaFBWRm1zV3kz?=
 =?utf-8?B?T1cyMFJuUTFLcXpoelRkSlNlZ0dWRmw4b3Y4bzhjSjNtUklpbklZSXY4dFFw?=
 =?utf-8?Q?Dc7nf0gbPD4I9XxM=3D?=
X-Exchange-RoutingPolicyChecked: CN5A0z+lyAMHnUq8SN2/MABLv8iF+g1cXm8y0zn+cC4SfAefjZbBAos724UnuYgNUPnXlUNCJLN2dUxk11CZD7W5+6ZspP2KGvCw/pJNI1A3+ooZVOwlHlKHgtQwbOf6zjGliO31/TwQSE7ls55HKeq5hHAplxv7M0VlIyJrR7aqKhuUV3teRwvD7wzgX3Cnr6pKDHrCZ4itA3HX14tcgUqmpDkgxFOM7Oq6kGGEKeO4qaKSi8mMgjIAFaEYNPl/Gk9+tpUTJggitUNXL50aqH189Sz/U4U10TTHip17Dij0Cr57OTm0AADbUpdlcbR1t/I/3Y0qTZuQ+3nXB7Pr1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2b71d2-b889-46fd-788f-08deba841e09
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 17:36:13.7901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mowwdaJihoRsxN0X0RoKqd66Rved2zBI4jVphxMejmRUcqMi6Z0YZpGXTnXSBcYp3xE9oreZISornaP5FNFCsM0smf4cmpa2a/jrD1yiGfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6997
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



On 5/25/2026 12:06 PM, Riana Tauro wrote:
> Uncorrectable errors from different endpoints in the device are steered to
> the USP(Upstream Switch Port) which is a PCI Advanced Error Reporting (AER)
> Compliant device. Downgrade all the errors to non-fatal to prevent PCIe
> bus driver from triggering a Secondary Bus Reset (SBR). This allows error
> detection, containment and recovery in the driver.
> 
> The Uncorrectable Error Severity Register has the 'Uncorrectable
> Internal Error Severity' set to fatal by default. Set this to
> non-fatal and unmask the error.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: clear stale uncorrectable internal status in status register
> (Aravind)
> 
> v3: abbrevate TLA's (Raag)
>     add a info message if USP does not support AER
> 
> v4: add a success log (Raag)
> ---
>  drivers/gpu/drm/xe/xe_device.c |  3 ++
>  drivers/gpu/drm/xe/xe_ras.c    | 78 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h    |  2 +-
>  3 files changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 576095cf0952..c321a5710f28 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -61,6 +61,7 @@
>  #include "xe_psmi.h"
>  #include "xe_pxp.h"
>  #include "xe_query.h"
> +#include "xe_ras.h"
>  #include "xe_shrinker.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_survivability_mode.h"
> @@ -1049,6 +1050,8 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> +	xe_ras_init(xe);
> +
>  	err = xe_device_sysfs_init(xe);
>  	if (err)
>  		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 4cb16b419b0c..24642c309967 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -91,3 +91,81 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  			comp_to_str(component), sev_to_str(severity));
>  	}
>  }
> +
> +#ifdef CONFIG_PCIEAER
> +static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *vsp, *usp;
> +	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
> +	u16 aer_cap;
> +
> +	/*
> +	 * Device Hierarchy:
> +	 *
> +	 * Upstream Switch Port (USP)--> Virtual Switch Port (VSP)--> SGunit (GPU endpoint)
> +	 */
> +	vsp = pci_upstream_bridge(pdev);
> +	if (!vsp)
> +		return;
> +
> +	usp = pci_upstream_bridge(vsp);
> +	if (!usp)
> +		return;
> +
> +	aer_cap = usp->aer_cap;
> +
> +	if (!aer_cap) {
> +		dev_info(&usp->dev, "USP doesn't support AER capability\n");
> +		return;
> +	}
> +
> +	/*
> +	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
> +	 * Status Register.
> +	 */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &aer_uncorr_status);
> +	if (aer_uncorr_status & PCI_ERR_UNC_INTN)
> +		pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, PCI_ERR_UNC_INTN);

not an expert here, but is it safe to update config without any device lock?

> +
> +	/*
> +	 * All errors are steered to USP which is a PCIe AER Compliant device.
> +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
> +	 * from triggering a Secondary Bus Reset (SBR). This allows error
> +	 * detection, containment and recovery in the driver.
> +	 *
> +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
> +	 * Internal Error Severity' set to fatal by default. Set this to
> +	 * non-fatal and unmask the error.
> +	 */
> +
> +	/* Initialize Uncorrectable Error Severity Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
> +	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
> +
> +	/* Initialize Uncorrectable Error Mask Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
> +	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
> +
> +	pci_save_state(usp);
> +	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
> +}
> +#endif
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))

I assume the .has_sysctrl flag should be already cleared by the VF
in vf_update_device_info, so extra IS_VF check here is redundant

> +		return;
> +
> +#ifdef CONFIG_PCIEAER
> +	aer_unmask_and_downgrade_internal_error(xe);
> +#endif

nit:
	if (IS_ENABLED(CONFIG_PCIEAER))
		aer_unmask_and_downgrade_internal_error(xe);

didn't work here?

> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index ea90593b62dc..a88ea0a46766 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -11,5 +11,5 @@ struct xe_sysctrl_event_response;
>  
>  void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  				      struct xe_sysctrl_event_response *response);
> -
> +void xe_ras_init(struct xe_device *xe);

nit: keep separation line before last #endif

>  #endif

