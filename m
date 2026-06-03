Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5392FCD6E4A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 06:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0627310F8BA;
	Wed,  3 Jun 2026 06:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivuoiE5k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D04B10F8B5
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 06:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780468092; x=1812004092;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nZcG6aP1IVpRTDonXxrmFTGFNxpNyYpUy/XaSj0HJhM=;
 b=ivuoiE5k2mMY2FwsD+qfH/x4AJuG6QQYPZIlxl9jENVCy02wZfR/bCb3
 Pgl39Tf4WGx92YSYbJnQSCUUK61budlLFsUpMnOueF6UinLbpDxk1rb5K
 PuteXLRl69gVffubr7+D0SFjICOEpEa3lBOiSSOiSekEYnwB7+g6gmS0/
 lBnfXSFGvjvhszlwo0eyb65bZ7CGdMvAd+9c6cCkxwrs+Gb604aWH50VQ
 q4Yy0jcnne7b0vHM2IjbhNDre2fPui6kEIEZBGduVdtswtdwU56PmYDDk
 xeDmSD1paS4bWknb7sorLOOOQuLaq6VPP925p9qOHrK77lEwGgaj9fs9J Q==;
X-CSE-ConnectionGUID: pugxdZBkTk+ukj4MaEyujw==
X-CSE-MsgGUID: E2QRz48sRU6A5QqRlTfWLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81446132"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81446132"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 23:28:11 -0700
X-CSE-ConnectionGUID: 9db04vBWRlK/q2yJhz1alQ==
X-CSE-MsgGUID: y+29OUmAQwSxJurm2SZXnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="237776423"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 23:28:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 23:28:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 23:28:05 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 23:28:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4sQNDgGi11qiRsEOazlXaulZxvv1/9NtBNQMNLaWALWhdyN20xZVBO6EoA5nQMMUa1TaGDzhZh1cozuZkxCpTp7fzmN2xGI0p0f7YEuneXX/Psyi1r7VrYiGZuy9WbHeiXkD2YqDqin08o0OWQlLUHTO85lAaZIK0m1NhUojKE15bRNYm2mgK+dQvUCMKviQNGQ99ZhhmXM2emg2II48gtDNoBN9OSq1wJt0RO0uuSuehtbVrQ7yHQ3VtfZJivLVxeMQDm1eKY0rQeK/di3KDjCZuqPgOSdxWrqgnQFCvwrfZ7Ga8h0SSJwLz730RH3VkOPzR2vLGOdPr2sWYpINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPyOX9d0VL4719EZZxe0eydYEr0cSM31yuH6+WFDB7k=;
 b=gYEjOPKh8Ux91CFvDaAF0xIqn7Zyd9f/6QVhjw2EDjj//Fa7yP9L494EmSaCC6sefHJUicezV+ADFHNc7se1hQ+lr4YANCVVQs7PrxvKZIE/xYYPexKdc/nx31ivmpDUM0dqivge1wCgK5Mn7IPn2gxPFIWu7UC8i+3wwJjea9wXnnFucKI4gteVTKrejKLn4mNrESl29p59cvzprDYlijeNUQPxD9lS5PIhcOkK9hmoq1Em4YVNmny8Kvh8lLnJ38iq/oOY+sdgIJfVNJOHEyw0HtiRRargQeJJzpW5TCUPyQ2BaqFo7q+8xk9PkU5EDmYlX36nHf1oreZuyy/KDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPF6E320AF71.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::833)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:28:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 06:28:02 +0000
Message-ID: <8b809d87-46dd-4ed6-9141-a11660c351d6@intel.com>
Date: Wed, 3 Jun 2026 11:57:51 +0530
User-Agent: Mozilla Thunderbird
From: "Tauro, Riana" <riana.tauro@intel.com>
Subject: Re: [PATCH v6 03/15] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-20-riana.tauro@intel.com>
 <da722f1a-c062-4062-ab0a-ea94f6ad170d@intel.com>
Content-Language: en-US
In-Reply-To: <da722f1a-c062-4062-ab0a-ea94f6ad170d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPF6E320AF71:EE_
X-MS-Office365-Filtering-Correlation-Id: 587050d5-1fb1-4ba3-5cde-08dec139430d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: v3FvuLxman/KgGW7LY+lLNtOw0VUntC35fQfKPQvCAnS2B/JFQmaj59DFdr42S7Uif/V2Cf0qKWkCunFDzh11r9Am2ikAK9qs2pLGlUXe9tqWWvVokQzDaTAdEkv8iA445XeWZaymppVrH2qRCGaOWsfBvwkymYkN/UzEGS5B9O/AizieOE9PRSaBOr10NziB/4TzhKGc5zcKIYzWV1VTizxFHGy5QG7OhyIjJBqevzu3eYmJKxY5zADUZQj+C+rGP0VokqfbHIJNEGwc+kW6Z85bUEfe2Na2pwozykA6aCV+eYThKPYWY9PSuGrViMfWLF6wi0f+33GYDzCKgM6eatRumBaLbJUDA8DqWrMzdh5cc998DNT6oXhKFf+GlTrpGZaDYKq8KIYu+03LqwUeL24kKsKNbv+JxMhikeQUnbX9oOlMQXaZAmnXoO3/Ial2aVQZTPrmerTJSaCKOIx7dYz0vvAq+xv8TShtoaQalK6NWCogYZJCnqmbYq86GTYYN7dNJwzmrGe2z5ha7f10CnDuqs+PZ/e6jXaVSM/yT14mv68OJaIR2JVqR0njb0BFecOg1mJGIhjMk1pQuOfvW7v0omEy8ZV1Jr5nNxfeaoBZTiu70xQ9ZKFJATqrA8FWgsXyV9x8VLVlEdb8uJjHWPFv8aO7yolSfgkQ+b5ZcWwIaUsglrtT4od4t4VG3I6JM0dpgYkEJ1aUxRjCnxA1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEJ6Mkt3aWhpTlNpNUduS01XR1lIZ1N4VG5rUWtldlFDL3cwSEcwVVBtOWUv?=
 =?utf-8?B?MGlIOXIwSFQ1N250TXBjSjVZaTVGUkVna2NGMjNFZkZzZ3NpanptTVZLc2Er?=
 =?utf-8?B?NTRDWFk4eGdpUk5QaXJkakxpRThoazIveFJGRkVWZEwvYXo3MkkybzRLaEFY?=
 =?utf-8?B?ZmN3cENPTTk0VjlpRURSbDFLdXFLWkNFT2gwK2JnT051UXpmbE1BcUFPWEw1?=
 =?utf-8?B?VjBWUkNBT0hrK0ROaTBaa05Wd1hSUTg0bTRLa3RMNkVUcnh5YnN4Mmppekpk?=
 =?utf-8?B?OStUY0wrRDNoRFMxMFQrZmcyOE9lK0pUL1FXaW1XdXRyN1J4YUloMHVLWTRY?=
 =?utf-8?B?ZGhEOVgvT05iZUs0NVh0QnBYYkNnRXNNOEVRc2RNTlR6Nlc0VjRuUldsRlU4?=
 =?utf-8?B?QXZoeWxXczBDNDJiZkcxYWQ3dk1iaDl6STRwNmtnMElTY0xTQWt5WXZjS1dk?=
 =?utf-8?B?STJzY2VsUU5LNElEaXIrNHNLRkhrNWtzS2NzSTQ0cHQ3bFgzcDNHTDJ1N2pj?=
 =?utf-8?B?Nzd1NHRKYnlSVFBQZFNnaDRsYTlENEVDY3FsYTRHUU82Uk9sNDFRT0FtYXV0?=
 =?utf-8?B?M0Z4ZE1nT3BRSUl2U3F4bjlzRE9HbTNqb0NnQzM0THA0OWIyamVuN1hVSGdw?=
 =?utf-8?B?RTJnRng4OVoyd1oxQjFQUEdiZit6QzhhNVArMlJXUzk4VEk1WXFJR3YyVVBG?=
 =?utf-8?B?dk5jT2lHUXZNSmtjZUtTeDh4TXBVamhRUkJocm1yQWNRMHRRRTFvZHdXUklK?=
 =?utf-8?B?dFNDMXZOdTVZRG9sdEtjcjZJL1FKMGxoMWhHTlBid0JGQUVpRWd5Y1ppdjl6?=
 =?utf-8?B?SEtBODVHOVlmYmJSeldWdXB2bjd2SzRmUUQ3dlBTTHo1R053MjZwZDYxeTR2?=
 =?utf-8?B?WjZaSFhKRnNKek51QnBkVE52K1ErTVFEOUptSDlnWmRidmMxS1JRWFcyTGdX?=
 =?utf-8?B?eXY3U1lyVy9NSW55V3dFb0dOZzZNOTRVK0tIYVczcGJGaWpRaVRST1ZPK0tP?=
 =?utf-8?B?MjRuUjRsV3BBQ2djRVpjUXFHNzQzTWl4eDY0WWJ1czZyUk1Wd2c5TEVFeSsz?=
 =?utf-8?B?UzE2TVlieVR5Z0FmQS9zM1BHV2xOZ2ovZkVOYitzMTZFLzRnVTg5ZHp0NmVt?=
 =?utf-8?B?by8rcUhBTTFjbzNxSlQ4WkVieFRQb2tPcEsrbCtubVhzeFI0RjdOeU1YejhW?=
 =?utf-8?B?RkNFcHh4UHYxOVA3VlNHMjFoS1M4L0wzYWttMFI2YnRXZ254eVZZNjNpbkhP?=
 =?utf-8?B?cW8xRUY4Q0p4ekRjai9adTMxYnpYM3pvalpRNW9rcnZjTEI5YVF4ZTlONy9x?=
 =?utf-8?B?SFdsS3JsTzJoSWlzMWt2eEF3d2FqM3pFc0h0NUxpYnZKSFRQM2dXWTNWaGM0?=
 =?utf-8?B?MFo1elUwSkl5R2QyMEx4clVtN1FId1NNRWlPcE5IREU4cmR0Vms1RnBhWU9q?=
 =?utf-8?B?Y0xBYW1HelNVV1hSaHFiY2hMZjJtU1NpRXJRblQwOTdOZ01IcXM4S3Z0WjJT?=
 =?utf-8?B?UHBYUW9GNjBvbTdkbFROQUhjSHNMQ3cvL2JSKytsVWo5U08wMnFiZkdGejMw?=
 =?utf-8?B?K0lJOWdmYVFZd0xrcy9JdVdxOGNuQVlPSU1EdjBXMVdaSFBPcUJKTlVVRSt2?=
 =?utf-8?B?WEIzUWZwVkp1ZXBpSVF5RG5YdHlFanR4SjVCeFdQQmtia0lCRVhLeG1laDZi?=
 =?utf-8?B?NUIwYStOd3BBSithb1Y4Z1FRODdGeWlUY25meC90bU8rTnVDWXQzY001cHFK?=
 =?utf-8?B?NWQxK2hhOEZGT3F0SHFQYmJicXFmMFF2UnZkbktodkpjMjVyMnphNWxxd1F6?=
 =?utf-8?B?SlR0YmhTVmlGOGUyYUdrZXVLbGViNWJta0hCQzNYa3pQenFRUFRLYzE5TmhY?=
 =?utf-8?B?c2JlcXI2Z2dmWGlkRFFPYlYvWGM2V010VjJlSCswU0dRYytWd2ppMkpQd0Nm?=
 =?utf-8?B?RVc1c2RaQ1BoUnBnT2ZkWHFjclVlN0ZFcEhPMG9ZYnpGSFl2eDVSdlE0SXlj?=
 =?utf-8?B?M2tiUXVGMW0zWXYyQStVaTRXV3RVQlNIRkNMbzdtQTJJcWtmS21sTXhNaDY0?=
 =?utf-8?B?OENtVVZwMU5ySTlUVEhZVFVheGNiWWJwQkFmTDFjT2NrWi9iTnh6U1VXM1RG?=
 =?utf-8?B?VkpZYUV1TGJkOUZFcW9VVjVZYTNLQ3hZVklhb0VtMGJIRU5aY1k5d0xLNUJH?=
 =?utf-8?B?M2FrcmQzSjFCUmZXemR5N0xZaVpyQ2ZkeXJvaktHbWx5NkdQbEZtM3BXY3dH?=
 =?utf-8?B?b25INzRQRVdMUlBjOGMyT3N5RWVEL2tpRkJ0SjdXd2phQUpjYzJBTnpXTFBa?=
 =?utf-8?B?Z29PSFp1aTQ2NlJiSFBFQ1RmL1FYeGs3SFRnT0w2MG11RHhoY1NiQT09?=
X-Exchange-RoutingPolicyChecked: e6Oth+axz5Tkgbnk9Q8xCi09/Pvl6Rm0ffHI2Kb9csRTKIN5qZyKD4H/ahCMowz04HEXIYP5j+tYtbuRkq3xNmL4gfaei/GoS1O6uDRjHPY8MfgU4e9tr/wioRQO0BDvMEEI5N1sOLx+QPuy79f0M+1HMurfNu8PRlPLD/VlO/j5jizR6M1H0vFAM1+2AAOsaQW+ouQllvf98xpNx/Jto61uFkhrSDu6fKzLZfJXqPdVOu+Q7o1Y+oApmR+eA6m+z69ipWpcAwDtwwS3tyA47Q26AII7oihsl94kF9a+CZJCry3EtnXd6lIExvjEB+vrHY/qez4c4L4uxi2k+3FF2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 587050d5-1fb1-4ba3-5cde-08dec139430d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:28:01.9244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iy+9/r17DiSLD4oTqsgII3bJxcp4/REWsdw9ikj+sut+71jQ5HrGW2VOE/AsooMNFN6fzu9EpTKwp71tE4slXw==
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


On 5/25/2026 10:51 PM, Michal Wajdeczko wrote:
> On 5/25/2026 12:06 PM, Riana Tauro wrote:
>> Add error_detected, mmio_enabled, slot_reset and resume recovery callbacks
>> to handle PCIe Advanced Error Reporting (AER) errors.
>>
>> For fatal errors, the device is wedged and becomes inaccessible. Return
>> PCI_ERS_RESULT_SLOT_RESET from error_detected to request a Secondary
>> Bus Reset (SBR).
>>
>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>> error_detected to trigger the mmio_enabled callback. In this callback, the
>> device is queried to determine the error cause and attempt recovery based
>> on the error type.
>>
>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>> cleanly removes and reprobe the device to restore functionality.
>>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Matt Roper<matthew.d.roper@intel.com>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> Reviewed-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>> ---
>> v2: re-order linux headers
>>      reword error messages
>>      do not clear in_recovery after remove
>>      return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>>      only wedge device do not send uevent (Raag)
>>      set recovery flag in error_detected and clear on resume
>>      add default switch case (Mallesh)
>>
>> v3: do not set in_recovery for disconnect (Mallesh)
>>      return if already wedged or in survivability mode
>>
>> v4: Add comment (Matthew)
>>      Fix tab (Mallesh)
>>
>> v5: remove in_reset
>>      disconnect if already in survivability mode or wedged
>>      block I/O operations in slot reset (Raag)
>>
>> v6: acquire runtime pm wakeref while setting the
>>      wedged flag(Matthew Brost)
>>      rename function from xe_pci_error_handling() to
>>      pci_prepare_reset()
>>      call pci_prepare_reset() before requesting SBR
>>      add blank line after copyright
>>
>> Note: The re-probe in this patch will be replaced by
>> minimal re-initalization once below patch is merged
>> https://lore.kernel.org/intel-xe/f642453c-f657-41c7-a01b-5a0baf886cd3@intel.com/
>> ---
>>   drivers/gpu/drm/xe/Makefile       |   1 +
>>   drivers/gpu/drm/xe/xe_pci.c       |   3 +
>>   drivers/gpu/drm/xe/xe_pci_error.c | 120 ++++++++++++++++++++++++++++++
>>   3 files changed, 124 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 09661f079d03..091872771e98 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -101,6 +101,7 @@ xe-y += xe_bb.o \
>>   	xe_page_reclaim.o \
>>   	xe_pat.o \
>>   	xe_pci.o \
>> +	xe_pci_error.o \
>>   	xe_pci_rebar.o \
>>   	xe_pcode.o \
>>   	xe_pm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index e2a1232c4fbf..5462ddb25d29 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1331,6 +1331,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>   };
>>   #endif
>>   
>> +extern const struct pci_error_handlers xe_pci_error_handlers;
> hmm, as you introduced new component xe_pci_error then maybe it deserves
> its own header instead of this random forward declaration
>
> also, maybe like in other cases, expose functions used by this ops struct
> instead of the struct itself?

Sure will move it to header.  Since the header did not have any other 
functions i used
a forward declaration.

ops are defined in xe_pci_error.c

>
>> +
>>   static struct pci_driver xe_pci_driver = {
>>   	.name = DRIVER_NAME,
>>   	.id_table = pciidlist,
>> @@ -1338,6 +1340,7 @@ static struct pci_driver xe_pci_driver = {
>>   	.remove = xe_pci_remove,
>>   	.shutdown = xe_pci_shutdown,
>>   	.sriov_configure = xe_pci_sriov_configure,
>> +	.err_handler = &xe_pci_error_handlers,
>>   #ifdef CONFIG_PM_SLEEP
>>   	.driver.pm = &xe_pm_ops,
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> new file mode 100644
>> index 000000000000..218d67074385
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -0,0 +1,120 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <linux/pci.h>
>> +
>> +#include <drm/drm_drv.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_pci.h"
>> +#include "xe_pm.h"
>> +#include "xe_survivability_mode.h"
>> +#include "xe_uc.h"
>> +
>> +static void pci_prepare_reset(struct pci_dev *pdev)
> nit: it might be risky to use pure pci_ prefix

Renaming it to prepare_device_for_reset
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	struct xe_gt *gt;
>> +	u8 id;
>> +
>> +	/*
>> +	 * Wedge the device to prevent userspace access but don't send the event yet.
>> +	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
>> +	 * pm reference to avoid underflow.
>> +	 */
>> +	if (!atomic_xchg(&xe->wedged.flag, 1))
>> +		xe_pm_runtime_get_noresume(xe);
> maybe instead of open-coding this logic, this should be done by the xe_wedged layer ?

This is applicable only when wedged is set till unbind, not when it is 
set and unset like slot_reset or in
[1]. So a generic function seems unnecessary.

[1] [PATCH v7 8/8] drm/xe/pci: Introduce PCIe FLR - Raag Jadav 
<https://lore.kernel.org/intel-xe/20260516093131.27442-9-raag.jadav@intel.com/#r>

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
> nit: while this is PCI error handler, shouldn't we still use xe_err/drm_err
> to provide consistent "[drm]" prefix in all error messages the xe generates?

  We can use xe_err. Will fix it in new rev

>> +
>> +	if (state == pci_channel_io_perm_failure)
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +
>> +	/* If the device is already wedged or in survivability mode, do not attempt recovery */
>> +	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +
>> +	switch (state) {
>> +	case pci_channel_io_normal:
>> +		return PCI_ERS_RESULT_CAN_RECOVER;
>> +	case pci_channel_io_frozen:
>> +		pci_prepare_reset(pdev);
>> +		return PCI_ERS_RESULT_NEED_RESET;
>> +	default:
>> +		dev_err(&pdev->dev, "Unknown state %d\n", state);
>> +		return PCI_ERS_RESULT_NEED_RESET;
>> +	}
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>> +{
>> +	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
> shouldn't this be xe_info() instead ?

err seems appropriate as this is in error handling path

>> +
>> +	pci_prepare_reset(pdev);
> and this shouldn't be done in error_detected handler?
>
> mmio_enabled is just another recovery step, no?

mmio_enabled is called for all non-fatal errors. I have added the 
default action as RESET in this
patch since the function needs to return a result. The actual processing 
is done in [2] where system
controller is queried for the type of error and appropriate action is taken

Will add a TODO here.

[2][PATCH v6 13/15] drm/xe/xe_pci_error: Process errors in mmio_enabled 
- Riana Tauro

<https://lore.kernel.org/intel-xe/20260525100619.3155663-30-riana.tauro@intel.com/> 

>> +	return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>> +{
>> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>> +	struct xe_device *xe;
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
>> +	 * Secondary Bus Reset causes all VRAM state to be lost along with
>> +	 * hardware state. As an initial step, re-probe the device to
>> +	 * re-initialize the driver and hardware.
>> +	 * TODO: optimize by re-initializing only the hardware state and re-creating
>> +	 * kernel BOs.
>> +	 */
>> +	pdev->driver->remove(pdev);
>> +
>> +	if (pdev->driver->probe(pdev, ent))
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +
>> +	xe = pdev_to_xe_device(pdev);
>> +
>> +	/* Wedge the device to prevent I/O operations till the resume callback */
>> +	atomic_set(&xe->wedged.flag, 1);
> can't we call driver->probe() in resume()?
> then we could avoid going though another wedged cycle on new xe

resume callback is part of two paths

SBR:  error_detected -> mmio_enabled->slot_reset->resume
Recovered :  error_detected -> mmio_enabled->resume()

remove/probe is only required on the first path where SBR is requested.
If this is moved to resume() then we need to keep a state to distinguish 
between
the paths which cannot be done because we call remove() in slot_reset.

Thanks
Riana

>> +
>> +	return PCI_ERS_RESULT_RECOVERED;
>> +}
>> +
>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
>> +
>> +	/* Resume I/O operations */
>> +	atomic_set(&xe->wedged.flag, 0);
>> +}
>> +
>> +const struct pci_error_handlers xe_pci_error_handlers = {
>> +	.error_detected	= xe_pci_error_detected,
>> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
>> +	.slot_reset	= xe_pci_error_slot_reset,
>> +	.resume		= xe_pci_error_resume,
>> +};
