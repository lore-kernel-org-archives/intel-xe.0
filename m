Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C57E67A68
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 05:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E7810E62C;
	Tue,  3 Mar 2026 05:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjnJaGj/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D7B10E62C
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 05:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772514576; x=1804050576;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bT6mmu8Px0FHfyqF9Do+YPuLvLdvXfEBaOJyRNiCJ7k=;
 b=VjnJaGj/nBHgQGtOCPu3pUhQztA23XNc4UAzd0mX6Anb2kVo5qNXgSI9
 7CVYBtkAbmNvyWjwoIGw4n4g9LND9l40o1CO98UudtpE7+5BC1wxoGbX/
 9pA0yRCOi5Lmr8VNsXN2J88rnPInag8DmI0qvvkGL9lZQQStFEnSSAipq
 V1Vh31a8+yE90LBOAd4uDuq3cUwsSE5+2+SBHu6yIh6psalQDHF+uhZR8
 yAFHlzWB4kTFcC2pUvO8x3a67lltKeTPU+wf3vmbRj7ZSb1tY0KSWPs85
 LKxeC8Dxy+r9e2Q7mjjDksj6MC0rBnD7KAcvMHx+zZaxkQClffUZEhtbq Q==;
X-CSE-ConnectionGUID: SAMBSuu8QMKuFdcoFOYWUA==
X-CSE-MsgGUID: Je/Itnq7TfGnjRDE+8PnUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73580141"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="73580141"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 21:09:35 -0800
X-CSE-ConnectionGUID: 98KNC9kpQjG4LXVBfrHGDw==
X-CSE-MsgGUID: HzQVYeDfSBOEENlaCExRig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222043504"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 21:09:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 21:09:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 21:09:34 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 21:09:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ao6AdA2vEsTABDv1QUCTiBALTm9o6KXDMxQ2kwe3nLxS6Aqqv6i5MsjXgUyDYArbPfuplEYiG98vn0G53alE/rb1bryyPLlAWR9ECDbTHyKUnKbWltIwBTHA4ozkjsWzYXGFwjgq9cxUpG3qTFA25XJkDsGdVVexWgsqOSPibu6Wjwh9Um1UZtvV4xceV15zOa0BTZSbdCJuoX9MixisxZlemx5XTVAk7TI8JJiYELGw6JeTUWGZ7hueIPz2HDGK4rrGWCpKxKwPHePLhT5qNP3D4iRkoUuRyWXFhrCsvnnt8uwWYYGlkt5BhZi7/v7qvgcCPCO4GyepwCLHIrXKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O02yQIPbHu2LwImE2CXUVUnqBnmX6KMCR9jAqyjlc2k=;
 b=szMSuMZ3OKYbsfkeKOuGMG+W35mZ6gqqvy8lALP270NBdj52nKlfzw41CqJwVTiEH3TNvADVO8iqvpZKTX+OIvc92ZwYtr2Nqj6yglwMMJQFrSlXcd2/e2TJycICixheoVlU4NRc0rRU8ORpp6QmlYUrnzGx34NXMGiU3XH2OW+YN2kdlAFqec/wrUBb5D/b3jeySKKpRxjNOLnW40wwcDwmCMf/yAOAPhg38ZmbNiMU1zb36Zo+gaIyK3BvX8qt4gzGoy6j815DlvUdNbg3o2qyrp8fKyuQ/iYIkcBNtX/mC3EBZw4EnWib4C2IbUTysITgTx8WLtEUYyMu15Kqdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPF77ABF615C.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::836)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Tue, 3 Mar
 2026 05:09:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 05:09:25 +0000
Message-ID: <ccfcc908-ca92-40bb-8de4-b355445ce341@intel.com>
Date: Tue, 3 Mar 2026 10:39:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-16-riana.tauro@intel.com>
 <aaXKyl5M5vpbDlka@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aaXKyl5M5vpbDlka@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPF77ABF615C:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e680dd-72ea-4dfd-911b-08de78e30982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: h0aw0J52xP8omXlVIn9trVbMdFjykpD3MpOnr5JaIdd9WoHQiERoCTJ6qJuqJVG3GXNAprisCKOjhzcQXu7j9L4XARRDJmsaHarDrZB7B/cTc7lTs94zx543/QqSdI/04bejY2gi4pdw/dCWzPS/t1TsnUnbvqm9m7+LPUhdp+CFFir9JaM6X9rOsujCh/CzryGtN1w2vZSCmLaywJ5bYlHlzn+xL86i5j9XGq7vH8zVpeDxu2PgOvX6dPav6SeQyoJsyENRH9B1yqrPz3sPi56ApaZdRLJA2z1jlE2lm6aQ+VbXXksEa0SIiVTwjkf/32zdDMLaPT15263DXARgpBQNsQYh4Gq0VUEzzVSGJ+athbUPY6MrZh78Xe8GnwSTyuafhTh9IoNurvl5LyDT5bkQScG6vkH5KPXQs3f/+oe5tlksgdE46br/bSyush11INOIEpSZX2ipcy3zaNFF6NzskIVn5Mf4NxeaAbgb40ld5OEjbtOcQOH49Snnnz17nEY0V/d4cLP+G1aRoqFFfjjkg2ptbgMDzJSw3nmPqANA0fJJxlEQYLYJW+wGFKj/fSz7li3r0cCBbLja7L60idZD8A7uPwk8/hadtOVHmOeS9DSjVDhRWqPolJHKfLSzuQKFeMRFRd7IeT12msYLwBrD5if6FehwbWUpRhvLqUOAEKEokFHqsfR6UQsJaYj5sjms5pcKrJpS5My2KVEeRt5ztsO7wwzA/+4TBiaKAX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVJ0YUkzaEdnOUVQZG1XTUhteXM1TWZJd08vUzc3WU5EZm5ZSGJEc2diblZo?=
 =?utf-8?B?ckRvbzl6L3Rsbi9uR3ZCbytUN0E4Nmtyc0xYUnFFUEFQYm12ZUlqb3BLZkRH?=
 =?utf-8?B?dzBXVkxBK3BvQ3pFeEdIUnMwSHYvZkFPRERnY2hNQW5HYlJIeGw0dWFaV0JX?=
 =?utf-8?B?bGdpUFNOVkZEVEJ3SzVma3FrQ0ZMN1orS1VkblFLdGZqdzhxbHJ0SVhpSWw2?=
 =?utf-8?B?YllUZUhnQkM4a2hpUDAyUUZndTR5NHJmdXdQNEJ1Ukd3REsybjFvSGdnVFVu?=
 =?utf-8?B?TDFET1JsNzlOK1d3aUJsNUdsWmRuQWhBWG1GRzVnZS9rL1d3L2NjWk1CTlRs?=
 =?utf-8?B?OHBrelltTGRYZ2wvbzM5cTdFcnhadHZ4OU8vUjFWQTBKRzdTWUlJMmh1UjBF?=
 =?utf-8?B?UUQ3QzltSWZmR2Fsb3dqVU5UbWUyYUxGdXVyVE93RVNTWURScDlqQmxTMWJE?=
 =?utf-8?B?UHNWcjFxbWs5SFoxRDJJeXdHSFBDbzBmTEhFOXk2S0g2UGtRaHkxbkhJVllm?=
 =?utf-8?B?dU15dUk3NU1KdTBlOG9IMVhleHFNMG1mOVdMTFhrcExSM3NpeEk4cEpxbHg3?=
 =?utf-8?B?Y21lQTQ0eUFMRkp6NGlnQ0Rvam81WVMxU0h5Qlh5S3pDa1pCSWNnSUVDaDFm?=
 =?utf-8?B?ZzdFUDJLU0FuS1RGa3JLNnpaU1BsMGdQdnFlOHU4VmdZYXd2eGpNWVI3dzdq?=
 =?utf-8?B?RGMzb2hIbjVJLzA3dHM3c0pVcVdPTWRjZktlYlNNelNnSWdmYXoyVnhOc3dT?=
 =?utf-8?B?OEtKS3pZcUJWYWlqUFU5WE1DWXVocHI1dWtFaVJNZjBVMzU1SGRQa2VKdEw2?=
 =?utf-8?B?UC95RUtSOUJBVzM4MVhDV2NMTTBrcXJPZWpNYjRqMnBGWk5FalVGTU9pMm9r?=
 =?utf-8?B?WUV0anE2ZzJ2akRBUVFTWkw4d29NckhJbytPRWg5a0xXSXZJNWpRdUYxWlVo?=
 =?utf-8?B?TkdGZ2NVMXp4UVc0UEFnb0xPZDdtT2c4dGhsNVVGalQxM2VwdDd2ejRWc0cy?=
 =?utf-8?B?NkF5bmhjVmNZdWJYZ2ZuNUJ3Z0lnMVIwQldyMWtSVVlJRjJhZ052am5sM3BE?=
 =?utf-8?B?NkNLZGkvR0FVN0QzeGx5Q2M5cGxxazgzcHlUeWMvZWl1bUpTcGVxamJyNkJU?=
 =?utf-8?B?dUI1M3diUjg0Y2FLT3FtWDVFZ0NIRS9VVHhtZDVtNE9wYU1vUmtidWUxbUtB?=
 =?utf-8?B?MFNKeGxuelcvR1IySXBFYk8xc1QrNFZUb0xEZTRCcFRCaE51d1UycFNqNEgw?=
 =?utf-8?B?Zzgyc0ZIKzFhem52aFdjOWRzTDlKNnFoZWVQeGlkR1p2QUhGdm5XVGJVTVUw?=
 =?utf-8?B?WUZReDRIaVFzeEJia0VkQm5xQ29HaWVScmNHajh2Yi8zdkY1VG14dUpKM2w0?=
 =?utf-8?B?RTY3bTcrcmJGbE1UOGZHMTFZUzhGYWx1a1BHOU1Dcm9oSnBqcXkyQ2dmckNP?=
 =?utf-8?B?RFkrK0pFUmlKZmU5QndzRk9mdFJDWHorMWthdEdNSVl1d2dPSExkb0JsVmFR?=
 =?utf-8?B?bVdveHNGQVowb05kZGdaVXFhQloxcE9HSHN6aGR6T2FZMEZjWUd4d3M3QTdk?=
 =?utf-8?B?RDk3U045VjFaZzlGbDZVeUJQNi8xRndlZ2ViaFhoTzJtYmEvbG1IS2tENEZi?=
 =?utf-8?B?VmxZdXd2b0tmQ2pzQXlMbFNGU25McnpqZmVkbU81Y29XbUF2eG9jamZ4Zm1s?=
 =?utf-8?B?RlZoSDBDRS9mK284dm5xR1lQK1NBaXUvNHRETkdEKzhJWE5RZzVJSjl1aUhs?=
 =?utf-8?B?UzFDOUlxeWFmS0F4USszdHpsQStXcXR5T1dLTk5SU2t3UUEzZWVTQ3hYajFk?=
 =?utf-8?B?SGVHYkYybmFmRWIrVlVCZXlhNXhsNXlhVE9mdkpvWklFM1JSVXBJdHB3Nm1h?=
 =?utf-8?B?djdxbzdLWVIyRlNhNGoyTWppSFBHa0ZneHZNRktwTWU2bE10c3FXSTFXMTlP?=
 =?utf-8?B?S0ZtbGE5T3dRNUVOVnlhR1I3L05qRVY2akVUOXpBQ3U1TTNoSmdNb1N5TktM?=
 =?utf-8?B?K1BKWkluRW41MWhsc054djJJeVlGSGI0Z0taQkNUNytHTGxoR3pON0RtZUJh?=
 =?utf-8?B?UHNoYTVSVU9LYjhGbUltdFV2K04zMDZYY3FBcVJ4L0xWbDd4dUs4eU9HMG80?=
 =?utf-8?B?bnVpUE55dGU2QXNVOHBnT3M3QU81QlhjYnhHSEJRRlBSUnNtLzZLRGE1UHYx?=
 =?utf-8?B?Ym82eVZJL0hMQTU0MzVNMkFTUW9PeGxaL2x1d3NtRWR1TFFyN0hWNXVwa2xr?=
 =?utf-8?B?UVBpSHVFVFpPWkFxVjByclhKdmhlVnorb1kzNVQ0WWJyWnNkcDRzMzIyNW1y?=
 =?utf-8?B?UjNJcXM1Y3pkbExsV282QWxEb1dUQzh1ZnJETks0Q2ZxMWh3STg3UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e680dd-72ea-4dfd-911b-08de78e30982
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 05:09:25.0573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WIAnbKNWFOMAtDYyN5za0SRGUc0ksg+5tFuXQBtdcARn0yCQqB8K25DZnBky5ier+jTzbmBZIzVHY1A0Yn2Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF77ABF615C
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



On 3/2/2026 11:07 PM, Raag Jadav wrote:
> On Mon, Mar 02, 2026 at 03:51:58PM +0530, Riana Tauro wrote:
>> Add error_detected, mmio_enabled, slot_reset and resume
>> recovery callbacks to handle PCIe Advanced Error Reporting
>> (AER) errors.
>>
>> For fatal errors, the device is wedged and becomes
>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>> error_detected to request a Secondary Bus Reset (SBR).
>>
>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>> error_detected to trigger the mmio_enabled callback. In this callback,
>> the device is queried to determine the error cause and attempt
>> recovery based on the error type.
>>
>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>> cleanly removes and reprobe the device to restore functionality.
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: re-order linux headers
>>      reword error messages
>>      do not clear in_recovery after remove
>>      return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>>      only wedge device do not send uevent (Raag)
>>      set recovery flag in error_detected and clear on resume
>>      add default switch case (Mallesh)
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++
>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>>   drivers/gpu/drm/xe/xe_pci.c          |  3 +
>>   drivers/gpu/drm/xe/xe_pci_error.c    | 99 ++++++++++++++++++++++++++++
>>   5 files changed, 121 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1890bbd1b28d..417b030e5ce7 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -99,6 +99,7 @@ xe-y += xe_bb.o \
>>   	xe_page_reclaim.o \
>>   	xe_pat.o \
>>   	xe_pci.o \
>> +	xe_pci_error.o \
>>   	xe_pci_rebar.o \
>>   	xe_pcode.o \
>>   	xe_pm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 39464650533b..972f43d20f1a 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -43,6 +43,21 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>>   	return container_of(ttm, struct xe_device, ttm);
>>   }
>>   
>> +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>> +{
>> +	return atomic_read(&xe->in_recovery);
>> +}
>> +
>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>> +{
>> +	atomic_set(&xe->in_recovery, 1);
>> +}
>> +
>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>> +{
>> +	 atomic_set(&xe->in_recovery, 0);
>> +}
>> +
>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>   				   const struct pci_device_id *ent);
>>   int xe_device_probe_early(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 5599534384fa..616d74792902 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -504,6 +504,9 @@ struct xe_device {
>>   		bool inconsistent_reset;
>>   	} wedged;
>>   
>> +	/** @in_recovery: Indicates if device is in recovery */
>> +	atomic_t in_recovery;
>> +
>>   	/** @bo_device: Struct to control async free of BOs */
>>   	struct xe_bo_dev {
>>   		/** @bo_device.async_free: Free worker */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index ad1e5ef2ee89..825489287f28 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1313,6 +1313,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>   };
>>   #endif
>>   
>> +extern const struct pci_error_handlers xe_pci_error_handlers;
>> +
>>   static struct pci_driver xe_pci_driver = {
>>   	.name = DRIVER_NAME,
>>   	.id_table = pciidlist,
>> @@ -1320,6 +1322,7 @@ static struct pci_driver xe_pci_driver = {
>>   	.remove = xe_pci_remove,
>>   	.shutdown = xe_pci_shutdown,
>>   	.sriov_configure = xe_pci_sriov_configure,
>> +	.err_handler = &xe_pci_error_handlers,
>>   #ifdef CONFIG_PM_SLEEP
>>   	.driver.pm = &xe_pm_ops,
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> new file mode 100644
>> index 000000000000..d4896a4a5014
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -0,0 +1,99 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#include <linux/pci.h>
>> +
>> +#include <drm/drm_drv.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_pci.h"
>> +#include "xe_uc.h"
>> +
>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	struct xe_gt *gt;
>> +	u8 id;
>> +
>> +	/* Wedge the device to prevent userspace access but don't send the event yet */
>> +	atomic_set(&xe->wedged.flag, 1);
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_declare_wedged(gt);
>> +
>> +	pci_disable_device(pdev);
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	dev_err(&pdev->dev, "Xe Pci error recovery: error detected state %d\n", state);
>> +
>> +	xe_device_set_in_recovery(xe);
> 
> This looks similar to wedged.flag. If we rather stop exec queues and
> cancel/flush all pending work properly, perhaps we won't be needing
> this. Let me explore what can be done here.

This will also have to deal with clearing user bos. Let me take a look.
Right now jobs timeout. This flag prevents gt reset and devcoredump to 
prevent accessing the device.

> 
>> +	switch (state) {
>> +	case pci_channel_io_normal:
>> +		return PCI_ERS_RESULT_CAN_RECOVER;
>> +	case pci_channel_io_frozen:
>> +		xe_pci_error_handling(pdev);
>> +		return PCI_ERS_RESULT_NEED_RESET;
>> +	case pci_channel_io_perm_failure:
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +	default:
>> +		dev_err(&pdev->dev, "Unknown state %d\n", state);
>> +		return PCI_ERS_RESULT_NEED_RESET;
>> +	}
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>> +{
>> +	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
>> +
>> +	return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>> +{
>> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
>> +
>> +	pci_restore_state(pdev);
>> +
>> +	if (pci_enable_device(pdev)) {
>> +		dev_err(&pdev->dev,
>> +			"Cannot re-enable PCI device after reset\n");
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +	}
>> +
>> +	/*
>> +	 * Secondary Bus Reset wipes out all device memory
>> +	 * requiring XE KMD to perform a device removal and reprobe.
>> +	 */
>> +	pdev->driver->remove(pdev);
> 
> A bit fishy, but does the job for now ;)

If the FLR changes are merged that would be helpful here.
Thanks for that series.

Will add those changes and test locally. Otherwise will incrementally 
optimize this to separate out xe_device and xe_pci related changes so we 
can call xe_device_probe and remove.

Thanks
Riana

> 
> Raag
> 
>> +	if (!pdev->driver->probe(pdev, ent))
>> +		return PCI_ERS_RESULT_RECOVERED;
>> +
>> +	return PCI_ERS_RESULT_DISCONNECT;
>> +}
>> +
>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
>> +
>> +	xe_device_clear_in_recovery(xe);
>> +}
>> +
>> +const struct pci_error_handlers xe_pci_error_handlers = {
>> +	.error_detected	= xe_pci_error_detected,
>> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
>> +	.slot_reset	= xe_pci_error_slot_reset,
>> +	.resume		= xe_pci_error_resume,
>> +};
>> -- 
>> 2.47.1
>>

