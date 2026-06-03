Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DD2CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 06:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950CF10F8AB;
	Wed,  3 Jun 2026 06:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2Ttm5xX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0822610F8AB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 06:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780467778; x=1812003778;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n7UBE/cAd7WOa/jHXd3Dpl/IeNnTEXQsAQkFL5Gpt8E=;
 b=V2Ttm5xXgjBzRjc0lUH9x37MZmzvsF8oRz4CluqcB7UCF6DTYnoPMOma
 t1HS/3hYJ3+qPkJYaiCHzAGkgF+tMAwcGc1HaxTCh4oLmTKty3b0VQt5r
 4p1mDw4e2TF+CBAEDLI204zwHodhoPiXZAsBFvrOhXFMVb+pohFClTFb+
 XZmcDsKRpJCGW+9+VwljEjegCPuN+/jt5yOf7VhBI5U3Ml2lrLD+sZei6
 EvSlBf6lSBRcGuycdloIw45SINHF7ghH8bhPsOJeJAClWGDuXEyX4ZvTk
 gwbPdNYM0mGZsb6HY23vVsRClNRJc/18Vtbv+T/uK/pgB2Vy+IV43Djbx w==;
X-CSE-ConnectionGUID: KKIg+AZoSvO2UylNfaroKA==
X-CSE-MsgGUID: O+2LIY1mRl2LoqO8K6vyOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81122613"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81122613"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 23:22:57 -0700
X-CSE-ConnectionGUID: TgTk3BetRZOaWpryQUD4jg==
X-CSE-MsgGUID: rUiMKoq8SQKlazvxtcRLAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="249057390"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 23:22:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 23:22:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 23:22:57 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 23:22:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q59C+PeQHFRZpfDJzY+3uvLyeYdlBaW4UwA3HqN7oIW4VEArrnYH3HkpOuONb1IKpzYLcOQ3bmYb2DBmPka6LHXQMGw8BU5bZXXHPYVDPi/odaPyeytoSlCSFinXIYHJChMl6e8kuIKrVNyLRc/S+SJGsVpPq+fYMzdsobvjHpNSm4zYv45cfqDl6QHjkLCxV+fAGi4/u+6zkX8wz6O99frOVOGu53UQG3IzhBI4irBV3HjIqf1ipFTNQ6BOVjfPTZRvSTJsmS/TnkZddpZ+DrtdVN8VMP1wehx1K+OxvZNmcOP8tzYMKbx/Zv3a4pIBAqYH5njDo3dVCtayy/ckeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icQVg5Dz2AfssCqPwXnPEG4Y6SwfdEo7apj1+FRxbI0=;
 b=V5mChfWlavZx3XsFxA5YYocf45ImJmA0TS5xpGV0bdIQtclJluZONPnrYd17zDJiAhwtPlLs7wlvJJpY3kp1fZh0Q9+Gn8hXYbgihm0Yr6Yw9EiBpgw3sMqMrM4+h8mf8h3Ey+6NGVmqHgyTbB+3aGCeI9SqtXZz3+h08ZDp9ttbuL6L9J+WgAK6i17jhpCM2oDrGwIXvaFnns2E1nM9bV+p9crXbZUKDS7ca2CQW6XWAt6JcLxXfRBqRKRM//YmqNKFls5vBM/HGVytPwk3Ec6QvlUnH1eQEgW67ieNcGrKqKtjJxZCXKHRUfor4VF+iBr6A6bFgLQHMwLueTl+rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPF6E320AF71.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::833)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:22:52 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 06:22:52 +0000
Message-ID: <413aaf62-9e17-45fc-a25e-21d66457b07d@intel.com>
Date: Wed, 3 Jun 2026 11:52:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/15] drm/xe/xe_ras: Initialize Uncorrectable AER
 Registers
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-24-riana.tauro@intel.com>
 <a032b750-a77b-4f78-aa24-f6879950828b@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <a032b750-a77b-4f78-aa24-f6879950828b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPF6E320AF71:EE_
X-MS-Office365-Filtering-Correlation-Id: f4750bdb-5b61-4256-fcad-08dec1388a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006|4143699003|6133799003|5023799004;
X-Microsoft-Antispam-Message-Info: RvJ5zFmTitDvmjB0xBMcTyaWndjg0xdWY8pjrf57h2+HEctxvz+Rk/qXWspNn2OZBAVQ9+Ye94eEriK8zECbcIvjrbKjJ5SyU/oj3SmzVv5ADpqjGe4GdEOgMpyzi4aJkJwT1wwhEVczavskQmn9YctPhDaW6LHbLWZEAL5LHWpRUHCy9apPZg2es1m4gn8wEHHkcXA5tNwNFh2XqDj6j9Jkr/y04FH7zhg1aSrIQ7+E3+QGixFKg0sDv6oFqokDqicX/GKqDDM92SexUnED51KuVz258DFG+NVAncU7r07KGrqJIj1GLKqxI5Df3YaToGtzz0K1/bpMp+WvCm2xo2KwhbmT35pdKW1jgnWy0WLrJWLGpP3g7V2Rv0dbwa6YdQH3tFBtNOIxeET6wVPNWmY1IyIpHjj0YVCAZS0b2QA7bFpbUMflb3OFiQonIkdOUFbHV4MKPmrjwrHYyAiFBZu048JM9c163WqCKPt2shj/8Lb5igBAz7vMQqLaFJweS6MbytpjYiNbdmtRyBDJzyoHeFutp9BcNDfYfW06716p0kMej23eXxI//O0ip8OvtqtumacC0nxWq5Lk/88rCVuR842E7dHf/m0Zth15Yu9V8wrhUrZOsPgeRDmNIIf55AEe8wIB/sdj6e2jz3sJW1hYlk3BpBMrijhtKRIrRx/53BOWbuL9E9h4NdxQX6ey
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(6133799003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3dGNElYc3BpYThwOTAzdThNalNCT3V4U0hjNjRJeHlBeklUYlE5U3l4YUNW?=
 =?utf-8?B?NExSUEx5MmNTQTNObjlJYW0xeEhvdVFxN2Q1SkE0VW1WdjV6Q3ZaR2trRjd6?=
 =?utf-8?B?bFVqV05Vc3kwcTd4R3JFRW5ERzJNYmp5WTMvY3V3L055NEJTNEFDUEZOYUJP?=
 =?utf-8?B?YUlwUTFkbTdrSi9YamJCOFBtN0U4TkN5WkFBcHh2YllmZERFUXFSRnlOZ0JX?=
 =?utf-8?B?QUNURGp4QmNldGEzanh2SFlJRHc0L2kvVzRqQmVqOU9JZy9VV3VjK29McGJL?=
 =?utf-8?B?TDA0c2JTU1VnQ0VFMTU4Z2cyZXpNTzRvalRhOGdnUk43NnM0SkJZcWFtaUJv?=
 =?utf-8?B?d29xVnJRKysxa3BlZlhndHpYRHZ1OU50QmtMZWc4Q2l5K3lEdURGN2xMYXpI?=
 =?utf-8?B?OE9IdkluaVpGcWptT2F0RkpFTEMyeFZ5WjR0aExnWG15bE93TmQ1V0NtaTBT?=
 =?utf-8?B?aS9LUVNxZFk4cFc2N1Jjc1c1RnlwVGM3cVdwQU5rblBPTnludGJqL0Ztd29X?=
 =?utf-8?B?L3c3aE52OVQxdDZEb2RZUFNER0pHTy8wNG5zSml1dVExT0Rsd0hMQWJuMjFK?=
 =?utf-8?B?T1Y0OVdIV3ZtSnBLdGl6U0Z4dFpJZUJsaGcvNUtpSzZJMGdtODg2T0lNdUto?=
 =?utf-8?B?WWRCZ0lFUzRpeGp0R1ZTMHY3OEsyU2tCeDIvQ2x1RDlyd2dlbk5SZVpKVjJ3?=
 =?utf-8?B?SXlkVVFnVm16ckppZEhYMmJSd1lJSk9yV2tSR3hjQ3ZZTWJiSnhKcDhJNUpa?=
 =?utf-8?B?WWd2RFhiWGVzYXB0R2V5SktqbitYcFZVbmFqOW9SaE8wOUhVRUlhS0srRU0z?=
 =?utf-8?B?Q25yTGNLRHE4NWxjSEhwN1l5Wm5jSUd5QVV4YkFOV1FpQWZnSGpjM0N1N3JG?=
 =?utf-8?B?TmdkME1nZ0ZrZUlXelNTVXVVT0hsVTdpcU5IVzUyNVRQQmkwMitJc0RaK2xQ?=
 =?utf-8?B?Y2V2azd3RW8wY21mQ0p0VklDak4zdUpON0VXdlZxSkZJb3phUDd2N2E0NzNo?=
 =?utf-8?B?Qm0xVnJvSVVxOFVrdXh2VzZVS3N6NHN3UC9zNnZBNHFLL3V1K3pNYjZrUWFp?=
 =?utf-8?B?ajZXYmE1Mi9GNWNlbGQ4UlplQmZOSVowQWw5YWt6Nk9OcW9BQU1nSXJYU0dB?=
 =?utf-8?B?M0pnbWhVU2UySkhveUV0VEtxNWRNQnN0dDlsNC9SNjd1eHlIcGltSTV0bFdH?=
 =?utf-8?B?dWtCTkVodnp1eGRDWkdaKzhLU0VwV1E3Y2dHWlZjT1U1UlJ5TURxcHpjQ3ZC?=
 =?utf-8?B?MnNDeVJtdkR3aGhIcG1neVZpbWVWV0dmdGJkV3Y5MTErNTZyeDQvb0NmQzNV?=
 =?utf-8?B?L0lTN1lUZHhBaG5GSm5iSzZWOWE4N0FuOWhWK1hHSGdDTENOMTE4WkJvc0JF?=
 =?utf-8?B?VkdTU3dqN005TGdOZDl6K3RpZ2dVUlZJOTJwbTNVaFplbEo5YU9kcDQxNkFJ?=
 =?utf-8?B?bXMrOVIyRllPeWNJUFlPUUJxdENIM3U2RFl5OHFtd0hZQ2t3MDZKSFBWTGdY?=
 =?utf-8?B?TWZleGVuU1V6dGhIWmxIcGh4K1dMaUlUQzFPay9iczh6U1lJdElvejJHaEJw?=
 =?utf-8?B?c2tEME94Sk4vK05KMTkrZklUUDVLdGtCQkZyNEdzS25FSGNCNFRjNm13akxX?=
 =?utf-8?B?ekZIakdFWXF0UGZ4RmtTOFl0djIrekc1cVd3K2V4dmVIWDlaQ3NuMmdaMHJx?=
 =?utf-8?B?TkFuK0RZYkI4TVVWNENIRVdvQnBzb0ZQSVdOY3pmNlVuV1RGc21OcWtuV3Yz?=
 =?utf-8?B?Q1FNbTNCNytud082bld5WGJMNjN0RHZZTUdZWFRQc09UdUxGM2I3RWdOV2NF?=
 =?utf-8?B?SnhzZWk2OUlHNnVVU3hQeTBoN1FPT0FXRlc0YVBjWDJwc1R6d25rMnhMRjBK?=
 =?utf-8?B?aVk1TlNwRFlWY2NFMlRDTXJmRlZJVkY5YTZyZUNBdkxlWXp5UFY3QTJjdmJE?=
 =?utf-8?B?OHpRVkxWTnMxb2hXTnZDeEFaOWdXaDQwV2FNNTJWbEJDNVQzU0YydFdkQXJJ?=
 =?utf-8?B?TGcwdHB6SVgxMDJzSXJxc2kvS1owZnRlS2d3VXhWZXpkZFBYVDlGSGFrZGh5?=
 =?utf-8?B?QUNEZ1h3UDFHb2U5aFFOZ2tlOGFMWmhOV0ZMT3dGSWNZek5wd0VlaUxOcWpz?=
 =?utf-8?B?b21zaFh5MzdqR1cxbmhQdzFrMkttSTIvTlVtNTlUeHlpMXFGNDhlSU9yZDFp?=
 =?utf-8?B?emYxMWJna3BENEYyZzBxNG9lRndnQ2lSRGtHUUFaT2hRcjBNM01yZW8xNFpC?=
 =?utf-8?B?N0pKc2dDVEh4TDlGTm1UQURSbVNDR1B0S0VDc0d6eU1saXF3UEJKRVFYNjdi?=
 =?utf-8?B?TTdNZ2NoenRxMVZ1SzNjQ1NuN0YxcXQwMDc1M2pNTzRKdm9nL3ZyUT09?=
X-Exchange-RoutingPolicyChecked: H8DOYq+dAZNXIjVJOA/8mCiUZaoQFcDa25c96xRU+PtQSM2ii3NurKvIraP83TyFldtntig4eUEKIBJlV9CcZTcbW6ZGvSh73+cKJ+3mGk8/4L6o/+o6zHMFgATTSBI6sM6Hr4Y8AriL0I/9HCnUY04Cyqd646xryaJUmNX+uO3nnibGQQSciWMJSdHcXw54P5WcMTv8s2PQgR/Jnqe3CN467Dcp2uS7p/vKtS2Xy5YKqiCZwSgvpZvI8Q5r0OfD+U9fSnYzvpE0nEGWFqXiJjXMKUMr9UYkLTIaUPHSE04KS8rYkCTyzETkPfKKj59SMGqUBMgvi9c1k9Lrbe+91g==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4750bdb-5b61-4256-fcad-08dec1388a75
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:22:52.2584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnLhzvSSNgdEpBYGNGAcCISVMZ2drLxK1LEt4D2Ij+RR35gkEp6UgeQZqsg7GtSrRYUqyIjr1NMeSaWK1Grr6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6E320AF71
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


On 5/25/2026 11:06 PM, Michal Wajdeczko wrote:
>
> On 5/25/2026 12:06 PM, Riana Tauro wrote:
>> Uncorrectable errors from different endpoints in the device are steered to
>> the USP(Upstream Switch Port) which is a PCI Advanced Error Reporting (AER)
>> Compliant device. Downgrade all the errors to non-fatal to prevent PCIe
>> bus driver from triggering a Secondary Bus Reset (SBR). This allows error
>> detection, containment and recovery in the driver.
>>
>> The Uncorrectable Error Severity Register has the 'Uncorrectable
>> Internal Error Severity' set to fatal by default. Set this to
>> non-fatal and unmask the error.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v2: clear stale uncorrectable internal status in status register
>> (Aravind)
>>
>> v3: abbrevate TLA's (Raag)
>>      add a info message if USP does not support AER
>>
>> v4: add a success log (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_device.c |  3 ++
>>   drivers/gpu/drm/xe/xe_ras.c    | 78 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h    |  2 +-
>>   3 files changed, 82 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 576095cf0952..c321a5710f28 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -61,6 +61,7 @@
>>   #include "xe_psmi.h"
>>   #include "xe_pxp.h"
>>   #include "xe_query.h"
>> +#include "xe_ras.h"
>>   #include "xe_shrinker.h"
>>   #include "xe_soc_remapper.h"
>>   #include "xe_survivability_mode.h"
>> @@ -1049,6 +1050,8 @@ int xe_device_probe(struct xe_device *xe)
>>   	if (err)
>>   		goto err_unregister_display;
>>   
>> +	xe_ras_init(xe);
>> +
>>   	err = xe_device_sysfs_init(xe);
>>   	if (err)
>>   		goto err_unregister_display;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 4cb16b419b0c..24642c309967 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -91,3 +91,81 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   			comp_to_str(component), sev_to_str(severity));
>>   	}
>>   }
>> +
>> +#ifdef CONFIG_PCIEAER
>> +static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	struct pci_dev *vsp, *usp;
>> +	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
>> +	u16 aer_cap;
>> +
>> +	/*
>> +	 * Device Hierarchy:
>> +	 *
>> +	 * Upstream Switch Port (USP)--> Virtual Switch Port (VSP)--> SGunit (GPU endpoint)
>> +	 */
>> +	vsp = pci_upstream_bridge(pdev);
>> +	if (!vsp)
>> +		return;
>> +
>> +	usp = pci_upstream_bridge(vsp);
>> +	if (!usp)
>> +		return;
>> +
>> +	aer_cap = usp->aer_cap;
>> +
>> +	if (!aer_cap) {
>> +		dev_info(&usp->dev, "USP doesn't support AER capability\n");
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
>> +	 * Status Register.
>> +	 */
>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &aer_uncorr_status);
>> +	if (aer_uncorr_status & PCI_ERR_UNC_INTN)
>> +		pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, PCI_ERR_UNC_INTN);
> not an expert here, but is it safe to update config without any device lock?

pci_lock is held in pci layer

>
>> +
>> +	/*
>> +	 * All errors are steered to USP which is a PCIe AER Compliant device.
>> +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
>> +	 * from triggering a Secondary Bus Reset (SBR). This allows error
>> +	 * detection, containment and recovery in the driver.
>> +	 *
>> +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
>> +	 * Internal Error Severity' set to fatal by default. Set this to
>> +	 * non-fatal and unmask the error.
>> +	 */
>> +
>> +	/* Initialize Uncorrectable Error Severity Register */
>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
>> +	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
>> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
>> +
>> +	/* Initialize Uncorrectable Error Mask Register */
>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
>> +	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
>> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
>> +
>> +	pci_save_state(usp);
>> +	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
>> +}
>> +#endif
>> +
>> +/**
>> + * xe_ras_init - Initialize Xe RAS
>> + * @xe: xe device instance
>> + *
>> + * Initialize Xe RAS
>> + */
>> +void xe_ras_init(struct xe_device *xe)
>> +{
>> +	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
> I assume the .has_sysctrl flag should be already cleared by the VF
> in vf_update_device_info, so extra IS_VF check here is redundant

Oh okay. Will check and remove this

>
>> +		return;
>> +
>> +#ifdef CONFIG_PCIEAER
>> +	aer_unmask_and_downgrade_internal_error(xe);
>> +#endif
> nit:
> 	if (IS_ENABLED(CONFIG_PCIEAER))
> 		aer_unmask_and_downgrade_internal_error(xe);
>
> didn't work here?

This should work too.

>
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index ea90593b62dc..a88ea0a46766 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -11,5 +11,5 @@ struct xe_sysctrl_event_response;
>>   
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   				      struct xe_sysctrl_event_response *response);
>> -
>> +void xe_ras_init(struct xe_device *xe);
> nit: keep separation line before last #endif

Sure

Thank you
Riana

>
>>   #endif
