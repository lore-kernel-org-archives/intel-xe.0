Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D9DFF8864
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 22:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F9510E10B;
	Mon, 27 Apr 2026 22:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k86ki1ig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EAE10E10B
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 22:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777330407; x=1808866407;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4EH8gVP8foRJaCtllX0DebC5/Oia1qS+aEUUiDT5wq0=;
 b=k86ki1igUX4+xPootz1yw3M7J2+T84nJTtulOVXmpvwTkA6PJqnWmNT+
 MpHQHaxTd7mpNojHm6u/OYOrkC/RBQTPLO58v8n51wT/VNe2eMj2JULTj
 TrSLZUED2KtrhdNudlV9x1vayJ1k5Ch7Gjc0mwffokp06O/NhKH+3qhmb
 il4q+Le8kl6qTjzMIzOwcuraM1yDTF9QlTefVzAkpXDz8Ur22oe0rHtQw
 k0W8stm/b0dczC3ibJhNOZONlF0tyzajjyYE7brr8mMLrIWhYgTyh5FbI
 eaNMWeAcIeLSa7ouYKTe/1fEgA1/3AJtqoWocV9edNs9vyVF+pG2eg2vO A==;
X-CSE-ConnectionGUID: /fcdEiipT/mncdh5wmPTfQ==
X-CSE-MsgGUID: v022d9a+QeiMfKY6+Bnj8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95644023"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="95644023"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:53:26 -0700
X-CSE-ConnectionGUID: luRZaUp2R3e3wDi0LLYo8g==
X-CSE-MsgGUID: ih1AiXjOS7GEpbOn8vzSiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="234050369"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:53:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 15:53:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 15:53:24 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 15:53:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSX8DSmGyWKfbzCyZuws5GPmYguReLHLU5LOsbQjR2NGHvlMoUOLQZmBI9Dvz0ns2Bi+NeXbGhoWatqWKt6TZMhfCQEVdCW8Wg+WpEkftgbAzETckgegg38skkbZF8gktUpW826su9Qd3t8XgAOx3uy7lNRE6BL5bipRSPVQjJ1ZwzLonOzi+Uj3UdfpHcVcfSORQJcIKYv03PP1lgkJ+lhKqTklqlwD0aJDdzlGDJn5HtawhLH5+UDtIHzdnqr+s5jepQr4KPAnEOTEpOgOfd6cqFwF0oQmzRIz/IWUmkVa5uKhXR93v2jih7YD07EM51jlfXJBtLW1kXOj16LHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AqEx83pEJhAKq9NR+T+9QA9D02h2hB+24hmh/h8nvY=;
 b=izIq7xRVxXwpDdd08qJZjHLeRoWqzRDZDt8c/LlI7ZEKMMb0VLs96cIIGvGstcz2aKozg4Lzg9Qc6lGcDvc+nNjYuDNAYcXoqgQ02Pvg+U3JpmXA2QrOtNxI+eRhLM/P2zZunG6Q4/YOjqQf0kDWaxzV6jbNECr2hKLtRX6c1rtVgiJ6cP7Tm9NaKMQBaqZSUzn92cYN5AS7tUjXjFHFNxRG1zPDMdnCjWtIfB5WDHzvO+3TBJf8F+3+uDrR9sJJD/ZzrJbHmuvT5fQMpgg+js2+3MNW6YacFjf2Xo91S3x5IOxVNJDfsDUmLzrJwcphl9dlsiajChcsHNRBBgntYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 22:53:21 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 22:53:20 +0000
Date: Mon, 27 Apr 2026 15:53:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/multi_queue: Add helpers to access CS QUEUE
 TIMESTAMP from lrc
Message-ID: <ae/o2uQTU31CmXXR@soc-5CG1426VCC.clients.intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-9-umesh.nerlige.ramappa@intel.com>
 <ad1jsmhJ5pJYw8mH@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ad1jsmhJ5pJYw8mH@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:303:b4::10) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH8PR11MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 27396274-557f-45ef-3f26-08dea4afc735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 75COIEk79dng227UVuMYFpImsBvptF8sVwBhnSmSEPWc29V7hZ76NRrtW5590vKLxF5eeV5xmenidOtkX5C8VwqpfH3uWVsKtiuBTKdFxzkPy/HR8rHUk/knonoWt1JE4bTyu2FM9b1g+QSrdZGGsysZ6LTtWT4bh7J2+IkAmtlOL2Ws3G/SrzGmcptHY7Y+562XcfqAGWKy5mImesKRgnCQQglNpelWkfBVC/bxyFiYW8qiLCoLwJRT+SM91VbhEdjd3bB9+xv5x+EVd436Ivv+9rWCq/9BWPAf45P8LSndCufiqYGgT9Y8wENbk/KPvc8Dngxhv8Z6qtSVfN87yelgsJZaCBpXRjeUUlbAvb4qghMYGKybF2YkfIBD7CVyH+B4d82i9XhGrrmbfhWbNuIptxlcyFYcV3v+5BbI+C/oQTqnW68J7v1OeQhUWET6GG3a0oM+fVLsaFxuKkVzp7aZpi5T2q/VlaGYZp6ZoGMljJd0SBn4FyiTBFYwO/d0hZy2lUPzPdM5jVDIxOU9vMLD1vpRv3CAOV6rieWnCcxQDE9+8q2NazcAjTUDbaEHkWeeNOa2FnuVYaHoVPINPHyvTgO1gF/wfE2bpUXJXNxg825YIZk3UH637UVlNH3KIWUXmhZuEEnsPlem8D/pZPmgbbfmOcYCZxuVtTfRy1ek5qJ4isdFOEOqyQYpS5NJtGU1Cs6OE7H+4DGLyfFoMS/YdlNE9J93UAA5vQqWVxs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUMwb0lZYkE1ZzRmVVJhWmxJZXlQR2FuYjRRVHg4UTJqK1JGcmdaRU1JRzE5?=
 =?utf-8?B?VG1rdEl3d0N2Y2cvcUhZMHdML2ZEMHVSQnNlYlAxYW5Oc2FBVXRKNkx5ak80?=
 =?utf-8?B?OVhlcDRoblR5T0R1bm1DcnpLazh6R2tGREQvS256LzBGWElQTUxBWGw0L0Np?=
 =?utf-8?B?amxWS05hcmtIU2dpRGVzNWFXTEMxWDRnSEFrejNCdFhEZlc1MDk3WkhOMDdZ?=
 =?utf-8?B?V0x5TS9reSsrckJTUnYvQ2tXeFp5TmFWb05vcC9vSzgyMlhhQmNwTDMxeTcx?=
 =?utf-8?B?WThFbGVEbm1yejZzMW1ObGJSMkc3dWMyZHErS3VjaVhFQ2ZlZGVMT0I1bXFI?=
 =?utf-8?B?YWFZNkpHQmxTMnJQL1ZybHcwbVlZVzZtNGcxMHJheEg4REpPK043S3kwakxN?=
 =?utf-8?B?VFB0WDl3Y0NUZ1pvdEFveW8zSTgrd0tIeWd6TXZSdDlYLzQxcWtzQmpQM2Jq?=
 =?utf-8?B?U1pVYk1VRVFKRUROTjJIMFJaOVVZdkp1ZFV4MFcxOHprQVhVU2h0eFhxYUIw?=
 =?utf-8?B?NzZxR0Q1NHpPZXVCb1dySmtTaU01QTI1cmNKZUpLRjNDZWRDWjQvajQ0S0ZK?=
 =?utf-8?B?TVQwK2xLc1JHUHVxOFlUb1ducFpwbTQ0SkxMN1NZcVdJSWZ4ZlYwRWVPVVRG?=
 =?utf-8?B?YTlqTWJ0cFA0SThtY2YwRHFLNVZOMGhXa3VXWEVzNVl1TlJ1aU1RVG5VbVZx?=
 =?utf-8?B?RWVzUFNBSlYxY293YmxNaUVmQnczcVhVc2dNZFRBT3BrYTFSNGltL003bXh0?=
 =?utf-8?B?TVFwVFNtUWJOMEZWU01zUjB6VzdFYTZKaSt2akpsWGJxRnZtbUgvNUVPYUVy?=
 =?utf-8?B?WlRQVnhCbG9NUHJ0VzRGWi9lNU5YaUYvVXhUdko2Q0d4YURXak5PTEpDcmhL?=
 =?utf-8?B?bE9ndFN6V3RWQmFJRGpTTXRXUUZEdlNwYWo4RmFYKzhIaXhOdmFJdlhTbnV0?=
 =?utf-8?B?YVRCcVdvSkt6NDlXTm1NMDFwU01qRWJVUjNMMWJsZm1WWmYwNjVoRmY0ZCsz?=
 =?utf-8?B?RzZmbHZDSnJjcVltZHc3d1FUNTJCZjJOS2lqMDRMRGdCK1hWSW8wL1E4dkU3?=
 =?utf-8?B?dGpCVklqaWpjUlUvNFRNaWdnZGgyRGYvdU5nZjFUUjJIc0xYbDZycWQ3eUsx?=
 =?utf-8?B?UDA2a2hLTHBCdWVsZ0NoaStHZFlsV1FDVzBqWnlESnAyQjRQL2IzaXZjdGN3?=
 =?utf-8?B?NVRhTHM3bWY5dnlZZkVvcVZOa2FDTDdpS0dPSnpCU1EzMlFpUXdWN0NMa2JX?=
 =?utf-8?B?QnhQb3hkSW1CT01wd2JveFZ6eThkMWxSR1VkNU9aczkzbFcwUTcrMmE4Um42?=
 =?utf-8?B?MjlxV0JBRlNTTnpTb2lnUkkzNmxRcDBCOFp6dCt6K0FtMmh4UnJ4ZzZHWE5K?=
 =?utf-8?B?N2JXYWlTQW5acWMyQ01teXQrSDVMSHJONkJvd041ZkhuTXlXRHB3bHM2VzZ2?=
 =?utf-8?B?MVlDWFk0VVJ2VGhudHFYWWhxZFE0UzJ0ZDg0cTA0cUJNVWhkVTVsMWhCUjJ0?=
 =?utf-8?B?SWg2NUh6clphQUNTUWU1Y3R2eGdEeUFaZTkzSkxrL0dzbXhGZzlGRnl4Rnp1?=
 =?utf-8?B?TWEvMFlVMEhHaFduQzNOVVJGYVowT0pjZm44bXcyRW1Lc3NEaUdnNS9xUEUy?=
 =?utf-8?B?ZzBNSXk2OGhIWEFIcEdNQUFxejM2blRKUzNDTVEyMHFlLzdwTjhTN3JPYjEz?=
 =?utf-8?B?cmRod0ZTcUpGK0U5K3NBRFlVdXNLUkhmWGhXSW92VURNeTdZR2NRQmxZQndq?=
 =?utf-8?B?bmpLQzE2NW1oSEpsZXczL3hlbnFodFZ2ZzQxblI4aE5Xc0g2NkxOMXlMMkt4?=
 =?utf-8?B?VDhtbUZTZm94Rllld01WdVhIWnZKK3JBd0s0a2RsU1BCY2dWMDZ4SVFIQWh3?=
 =?utf-8?B?ZXBGZGRnMlBDL3JPSnFDN3RRajBwZ0VIWHQxakgzLzJCNGZTS0ZsSnd6ZWg3?=
 =?utf-8?B?TmdGc3RFR1Z1M3B0RXJyTHdQMldkWmN0c3BpSEJKZ1VmMURIa1l3enkvei85?=
 =?utf-8?B?aUZIeWVxeks3QWpJZmR6STNVMnNTNjNQOTQ3NXFrdGRleTM3cmk3VzlMck9S?=
 =?utf-8?B?V21oWG5ORTB3YTdYd1lNN0RMWWd3Z3dWUGpydVVMbGpuUVljVG1QaE1pTjZi?=
 =?utf-8?B?OU82d0VjZ0toZ3RzazdFdGhaaktiRi9GUzZYMHJlQi9xeVA4S2dzaGtHcndG?=
 =?utf-8?B?SUp5L3pBeGdOMktWYXdmKzVMSTVkaUZUZmcva0V2VEpiUXVBRWxhYVROZG5V?=
 =?utf-8?B?Z0pZbGcwd1VKenU1Ly96RW53T1loZG5zYUx1Nkx5REFaME1xR2NkWmdHaXV6?=
 =?utf-8?B?NE5sMGE2Vi9pUHJ5bkVVTEJUcUtBZEVQcEtOVkZUaldvaXpIeEVEeTk3ZDhx?=
 =?utf-8?Q?R9d3vVaoM2XkIebaPsgQw8AYFufK0WfLmPfbV?=
X-Exchange-RoutingPolicyChecked: Yu5CMZPjoB4qBUDJKIE4lpmVvGucKhE+L8B2Z25WQFbkl8ImiJj1pyeMfkC/75daE6gwFEyKc+k32ClutNxiKh0KQPXMD69j38lq9AvEKn3x7UVQqWg4xsfT7ekWobhW9MzI+746NbZMTRn6n2X2ufIm8xUqWKu2QwzMgEWZZTA9k6uBvHomt+BLZ6Cg7nBuzBcn/gjzBcho1J3Y3CQHAqaGZeaSa15II0uRwAm8zG66dqcmILQ8D1S4Yk/d2CeJr0wQoITMh64VFCfQbDuEg0h3l47zyI9jTJqvd+U4IQV2pAzXUUYgD0se/cdtWEQdUH82GttMlRt9wCCTbd4ITQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 27396274-557f-45ef-3f26-08dea4afc735
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 22:53:20.4177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmrV0lpO6wZDpY4Ms5lcw6x6RXy21UxuNf2pGKduxhEs2OTN1aa4nSOwtxej2cgwmWet9FT5sHU+MnMeEgYu4u2h8Ya0V46kJ31kO5SYeO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
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

On Mon, Apr 13, 2026 at 02:44:18PM -0700, Niranjana Vishwanathapura wrote:
>On Thu, Apr 09, 2026 at 01:37:17PM -0700, Umesh Nerlige Ramappa wrote:
>>In secondary queue LRCs, the QUEUE TIMESTAMP register is saved and
>>restored allowing us to view the individual queue run times. Add helpers
>>to read this value from the LRC.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ++
>>drivers/gpu/drm/xe/xe_lrc.c             | 44 +++++++++++++++++++++++++
>>drivers/gpu/drm/xe/xe_lrc.h             |  1 +
>>drivers/gpu/drm/xe/xe_lrc_types.h       |  3 ++
>>4 files changed, 51 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>>index b5eff383902c..4ab86fc369fd 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>>@@ -34,6 +34,9 @@
>>#define CTX_CS_INT_VEC_REG		0x5a
>>#define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
>>
>>+#define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
>>+#define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
>>+
>
>Should we also add these to XE2_CTX_COMMON() in xe_lrc.c?

fwiu, this is being used to reset/update the LRC on events like GPU hang 
which seems to be unused in Xe KMD.

Our use of the TIMESTAMP registers is limited to query the LRC run 
ticks, so I am not seeing any reason to include it here, but please 
share if you see a use case.

>
>>#define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
>>#define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
>>#define INDIRECT_CTX_RING_START		(0x06 + 1)
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index 9d12a0d2f0b5..be1030c74e21 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -788,6 +788,16 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>>	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
>>}
>>
>>+static u32 __xe_lrc_queue_timestamp_offset(struct xe_lrc *lrc)
>>+{
>>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP * sizeof(u32);
>>+}
>>+
>>+static u32 __xe_lrc_queue_timestamp_udw_offset(struct xe_lrc *lrc)
>>+{
>>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP_UDW * sizeof(u32);
>>+}
>>+
>>static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>>{
>>	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>>@@ -837,6 +847,8 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
>>DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
>>DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
>>DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
>>+DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
>>+DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
>>
>>#undef DECL_MAP_ADDR_HELPERS
>>
>>@@ -885,6 +897,30 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>>	return (u64)udw << 32 | ldw;
>>}
>>
>>+/**
>>+ * xe_lrc_queue_timestamp() - Read queue timestamp value
>>+ * @lrc: Pointer to the lrc.
>>+ *
>>+ * Returns: queue timestamp value
>>+ */
>>+static u64 xe_lrc_queue_timestamp(struct xe_lrc *lrc)
>>+{
>>+	struct xe_device *xe = lrc_to_xe(lrc);
>>+	struct iosys_map map;
>>+	u32 ldw, udw = 0;
>>+
>>+	if (!xe_lrc_is_multi_queue(lrc))
>>+		return 0;
>>+
>>+	map = __xe_lrc_queue_timestamp_map(lrc);
>>+	ldw = xe_map_read32(xe, &map);
>>+
>>+	map = __xe_lrc_queue_timestamp_udw_map(lrc);
>>+	udw = xe_map_read32(xe, &map);
>>+
>>+	return (u64)udw << 32 | ldw;
>>+}
>
>Should we make this function similar to xe_lrc_ctx_timestamp()
>with the xe->info.has_64bit_timestamp check?

Unlike CTX_TIMESTAMP, QUEUE_TIMESTAMP is already 64 bits on platforms 
that support it. The use of QUEUE_TIMESTAMP is gated by the multi-queue 
check, so nothing extra required, IMO.

>
>Other than these, patch LGTM.
>Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Thanks,
Umesh
>
>>+
>>/**
>> * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
>> * @lrc: Pointer to the lrc.
>>@@ -1550,6 +1586,12 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>>	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
>>		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
>>
>>+	if (xe_lrc_is_multi_queue(lrc)) {
>>+		lrc->queue_timestamp = 0;
>>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP, 0);
>>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
>>+	}
>>+
>>	if (xe->info.has_asid && vm)
>>		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>>
>>@@ -2476,6 +2518,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>	snapshot->replay_size = lrc->replay_size;
>>	snapshot->lrc_snapshot = NULL;
>>	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
>>+	snapshot->queue_timestamp = lower_32_bits(xe_lrc_queue_timestamp(lrc));
>>	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
>>	return snapshot;
>>}
>>@@ -2529,6 +2572,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>>	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
>>	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
>>	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
>>+	drm_printf(p, "\tQueue Timestamp: 0x%08x\n", snapshot->queue_timestamp);
>>	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>>
>>	if (!snapshot->lrc_snapshot)
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>index b544c8169967..178d9519b196 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.h
>>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>>@@ -38,6 +38,7 @@ struct xe_lrc_snapshot {
>>	u32 start_seqno;
>>	u32 seqno;
>>	u32 ctx_timestamp;
>>+	u32 queue_timestamp;
>>	u32 ctx_job_timestamp;
>>};
>>
>>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>>index 93972536214a..4bca394ff024 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>>@@ -64,6 +64,9 @@ struct xe_lrc {
>>	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>>	u64 ctx_timestamp;
>>
>>+	/** @queue_timestamp: value of QUEUE_TIMESTAMP on last update */
>>+	u64 queue_timestamp;
>>+
>>	/** @multi_queue: Multi queue LRC related information */
>>	struct {
>>		/** @multi_queue.primary: Primary queue corresponding to this LRC */
>>-- 
>>2.43.0
>>
