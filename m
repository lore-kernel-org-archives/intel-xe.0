Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0A5CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 15:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C0D10E1BF;
	Tue, 19 Aug 2025 15:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkxyaH1i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F21C10E1BF
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 15:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755616013; x=1787152013;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UnUY19Xm9N/XCBpPVf9BOInh5KbF84hm/gdmLgwQrIk=;
 b=bkxyaH1ikwCvTCk4OB2usBGeVqOV8cPHi6MfXHMVj69AOX2cGZ9DQ/ts
 hqg1rwwtdpyCQdt+Nzym5FngPD6o7viIfwqteS0DM88DVWqx7ycrAbpJn
 79yMh2UZ4iU0ZURR+nJysaWYj88hNCZ4ZQ/UuBY1bum//3+k9kyY5Ukr3
 1VjBioPfqYtA2TnJ9bB/x9rOJdKQFnHXZbHd+l4AcKzfhHmA0YPDNEb9E
 867WciLVc2596VHP62mnWJ7L6wgina2EL5IsxHU1DYwY+HY4fM7YyC36s
 UsG06q6rakbr9UXaHBWU2Af/BLe0LuDpCgQ94CPYzERAEC9UyTwnHYABf Q==;
X-CSE-ConnectionGUID: sgEXehf2QIOHD2pPhUX59g==
X-CSE-MsgGUID: yUaEiO4aRz2ocGkRQBY2KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="83290211"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="83290211"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:06:52 -0700
X-CSE-ConnectionGUID: GdC6y95pSYel4mYV2Mxn5Q==
X-CSE-MsgGUID: 1WIR3bHjQ7etyF7BXo5PZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167782071"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:06:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 08:06:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 08:06:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 08:06:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBnzgPdYohrslZRtEBat0M5AXHwpU4hjx59VvSgt55v4CSJGcVp3fDPiSuvQqEwLzSlC+0F7PM6emrQd3EeCOeX3NrGHGD+7An3Qqvjwr5lwFXfUytBn26BLJnI5AgpNxBham4a5NzVKdaRGaO00LaNez+8vixESuxjHoGcr+K1MPD/WuxXwcGJh1klMYopCpCIwMVp7jQIzcsstMnvDI4s5FModcKE7+0Zc4fL0ZFTfgkgpIU7M5xQpeg7OeFm/B5QiFqG9tsOHCebJF/dQfQXl9mIK2Qu5XJreQQjGG8/NVS6IJbokAfrK4UAeyKMG3lqUI9P+vULZbLwFq/aU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZAF66C8wuUMDHluiYfYL16mAsNwygY1heMl+quApVE=;
 b=KtVS4rdYTqvVFAB4hqye/QUXMZM1WKUiruLBe8xdVytx4lk236X8bqbdiSg6dMu2x+bSeengSohjJwqItkAD9EWL8TEVfwYCIa1r4W0bTHVtWd6hykF6fTOzjLK3gRyDh4eIZCWscrS3c4sWVOZELvkvlozt5wuMHe3/S0o2V9sEwlMIlfUTKf2NGs1bKoHq2QvkmU+ugWT97xcYqw83RlnTPBqGucFu75z0CGlZ00Aeh5jhcI/OLHwpvttEKiD9g3GFJ7TdW9e0B5SYh7oaaiLIkTJR9F6OoAmvTp6BhdYUpnK+VhR1IaDmw061I+PBBUvePAi8FMavRpu1SD8Szg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA3PR11MB9135.namprd11.prod.outlook.com (2603:10b6:208:579::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 15:06:49 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 15:06:49 +0000
Message-ID: <ca554da5-9285-4d54-a409-6fcf4ca75e02@intel.com>
Date: Tue, 19 Aug 2025 17:06:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Add devm release action to safely tear
 down CT
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Summers Stuart <stuart.summers@intel.com>
References: <20250819082234.21138-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250819082234.21138-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA3PR11MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b31ff5-cfac-4b52-3a80-08dddf320548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2lFUVZ3Uk9GbGkwaHUvdVJuY09oMytJOG1QWjlCQVorUCtsb1I3UnJwbTkw?=
 =?utf-8?B?ZWQvejkxY2NNM09VcHVSTGpIMHpPSU9JNkh6NDBhSEpvSFRDdkR2YlRzZnlI?=
 =?utf-8?B?ZmswN1U4Zk9raVM1TUcvN1hoQ0NjcXpNNkhmNWt2eEtjM0xGaDNjK0dxYXNK?=
 =?utf-8?B?UjZVbUJoOERZdEVqdis1SU8vM3ZmdEI2U3grSlRuQldlZURRRGt6NU9ZQU85?=
 =?utf-8?B?VlNOTmNOOW1XZVNhUUN5c3FyMmI5ZXF5Z1FCV0x1NkFsM1RQWHVaVkxIcTNy?=
 =?utf-8?B?eXk4emx3VE1wS21VM2tZbnp6RnNjWG1KMVgvcUJEVkZuYUtGUERWeXpoWURL?=
 =?utf-8?B?aVRsUmVxODZ3Qlpmb1dRMFRnOHRaZ0h4c3BwNDJsYWlUNjJvYmlvWjN4cUxv?=
 =?utf-8?B?OWp3S3NpM0JPTEJQbnY5cVEyTVdkWllXYmJrM3AvdmVZenc0TzVIaVhjdlJX?=
 =?utf-8?B?d01mZmNST3lTOURYOGtRUW8rYmt1TjNJaE1yMC9JbC9KT3diZy9ZWGxSKzZl?=
 =?utf-8?B?aER0N2QyenExamFlZUpKdnNhVW8xRUQwUWwrV1NLR0RyUVhlZ1F0OHo0dHpi?=
 =?utf-8?B?UUoxcHM4UUsycFlXRFZ2RmFTcWVLOGhFRy90YllxVnhDTUNZYXhIMk5jRnVJ?=
 =?utf-8?B?YTBUK2ZRUVEyUWVsNW96OE5uMzhLL09rUTZZaUc5VHF2eDA5MFd2OHlEVng3?=
 =?utf-8?B?azh4bjhMVzluN0pIRS90RExZRU5uYUNHYXZ1cmY5NGVIRWJhVUEvc0pRWFJy?=
 =?utf-8?B?TGlxeEhYM2xmaWZlaGVFWTE2M3pxZDhLdDVCNHE0QjdablN1YnpzTmVJVzFj?=
 =?utf-8?B?NWRmNUdkaDBWQmZGTUNyMkhFT2duVEdjSFNQRldORHgrYU5WUlpqeWZDSUZX?=
 =?utf-8?B?Y240ekR6N20xMzNvVjcvd2lNR3QrNVBsVkhCQzJ4cmF0Q1B2WWo4d3pMYkFo?=
 =?utf-8?B?U0QzdHArWjZHVkRRdlExU2lLZEpwaTFhTDlVNjZpb1BnZkJISzk2MlE4ZGQ0?=
 =?utf-8?B?c3Y3YXVVZGplNS91K25VTEFlci9kd0VzOVFzZXVDNjdvRm9nZWFnQVN2cDUz?=
 =?utf-8?B?TW13S1lMR2gzN05QTXQzdG1zWWhMNGxPMFk3dVdlL1YzWndNeitKMmJtVnBJ?=
 =?utf-8?B?MFZRNGdxQisrOE11UVBQNjNIdWhaRm5CZnlsUTJCcmFWSndaWnVCTGVLTEVG?=
 =?utf-8?B?dkxFYWRNdm5NdTNzdW5PR1pVTXIwZlpKYmU5NlgwS3Z0Z29tTnVXckJValRX?=
 =?utf-8?B?ZDRBZTZlcmpvcnY5a0luOWlsdkF3VmZBUTNHUGZBZXBBdUdDMGhlZElJQXc1?=
 =?utf-8?B?ZEk4bHg5V3gyNXBlWXpvb2JQSEp5MG9CV3dDS3RGNisxZ3FzUVNSRk9FSFFR?=
 =?utf-8?B?eGdpM2didVZvT2FCWWtHd0ZReElWOU90UHF6ZTllaGtsNHF6dEsrUG1LejhX?=
 =?utf-8?B?Y3RYSldwRWl6MHErbEdGd0hxZWdRZlZmQkhlNWRmeVc0QTB2cDhSSGxnZmUw?=
 =?utf-8?B?WXhjTlZTYm81YmhqTGs3Tm9ITjJqT3RFeFY4ZnFnaFl4RlNHODRUYkNGL0VI?=
 =?utf-8?B?SVpPYlVrK3cwM3BCQ3drV1FLWGpjNi9meVdsOWVQakJXNGJrSXZVcDJXcmVN?=
 =?utf-8?B?L0Q2SlFqTFllUmoyUFlZb2JXUjg3eVR6Sy9FRlllS3JzMzNJbnRXREVoOUtR?=
 =?utf-8?B?VXZFRnhCU2dHUHhoQkc0a1dnRmx5NEJVZGY0aE40RjNrNFlaRjBXWmxXL0xL?=
 =?utf-8?B?Q09hb2tuRTMxcmdnelFWZS9XSEd4MStSY2RHdVhzUkxlQlZXdWppR3Y1RnUv?=
 =?utf-8?B?QlhERTI0TzVzL2N5Z2hEQ29KMnJjYW01UkswVGNkZ2t5V2VoYkp0VnZ1QUlO?=
 =?utf-8?B?eXpaSVF1Mi9ReTk2V0tnbUt3MDdIaXlxL2J2RTZxZWtHZzEwWmFWQnRmdW45?=
 =?utf-8?Q?qPP+Rl3GHMk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWFsa3k1RUhQYnk5b2ZLZm9YSnkxcHpSdTFTQjBxR3p3V1FZdkUvd2xaaG5h?=
 =?utf-8?B?UEdNL3hzdDQ4Z05jRjN4UEs1VG51Rm5QS3ZhU2k3bzY4dFhDVGhaQ09qSkY5?=
 =?utf-8?B?ZU5CWFJRRlJNc1ZyZnBlVmlPRGIyMjFGS01JeHJBTkd3SFo0K1BmVVY3cWJz?=
 =?utf-8?B?YkFKSk5JcW9IUzlvbDhGWlBIeWx6WVk2aDhqZnl3M2lYRXZQMzR1TmhiR0pO?=
 =?utf-8?B?QTZrV0dCZzloRTJHbjh6Z1NQSjhiM1pBQ3hCdWZMQUF6VEl6c01QY0V6bEdy?=
 =?utf-8?B?VlZ1eEhEWHoyYXlvdXVkQ20yUFpmRklPQmVocDQ3bDVLMlVESnh3WCs1eExF?=
 =?utf-8?B?d09OQkxrWTVqZUxTMHM4VXlnQkc1T1crUzIreDBBMjdQRW5vTGovT3o2REk1?=
 =?utf-8?B?d2FCRU9ZNDdCaVZGczZ1QldzMHIzNjVPMDNaRUxUVmJKRDN3ekd6YS9LdklR?=
 =?utf-8?B?Qnk2QUF2enM2dHFNOG1tdU5Jd1F0TklqNTdlb2NVQkFUYTdUREtyZmJOWlQ4?=
 =?utf-8?B?bHdUY25GRE5vL1lMN3JJQXlVRUJWS2tTSmlmRVA5N0oyOHY2ZG0wb3p1NDN5?=
 =?utf-8?B?NmZzWkJLMnNpeWRHOTR4RUw5NGxJaHVrcDQrSkg2UUNwamFFT0lnbzd3VHJu?=
 =?utf-8?B?ai9QcDJLQkRZSHN6RzY2QXNXeldXMGFGWFMyejlNUGxaNk9tU2FjYkFIei9B?=
 =?utf-8?B?Uk5FZE52UFd4emg2eFV0N2h5bVJyM29IMmlxbFlmVld3M09hSEpteFZqaGw2?=
 =?utf-8?B?NDFlcHRCV05zNmk3eDZScUF1OFlURHB1c01acE9NeW02cGVJZEhTN1E1K28w?=
 =?utf-8?B?Zlk0aGlRNlNWbjF6QVYveDRDeGRmSFdxRld5azFpYjA5bWJvclpIMFdGNEs1?=
 =?utf-8?B?UVN5OGRScnFtSk10enlsdFZ5UzBpY2Y5VEN5UW1tdGRzcnJFdSt3NnZWbVdD?=
 =?utf-8?B?bEtqcTY5bmc0V2lla3BTOEJiZWsrdmlvNWFnTGxYbUgvSFVvR3Y2bEpWVzEx?=
 =?utf-8?B?NWErUXNHbVlVQVJxeEluTFBXc1Z6UVpwYUtOSkZJbzdwQUVrUDk4RjBhOEF2?=
 =?utf-8?B?bTZoNTRaV0srKzBFMnlzV2RHOHplYm9Lak8yd2YvWVVFQWRMZmxxUVVmTUJa?=
 =?utf-8?B?WGc5emFRTkVKZlJuazJKVlY5a1BNaXNEWCt3VW90dUFXdzlwTFlhNUVlMnlO?=
 =?utf-8?B?NVhqRVo5OXlSbXVzYyt5bEhZMzRNbVhvcFlUMWY0UkN0R2g0UUZBR2VnQTJz?=
 =?utf-8?B?Zi9pUE1EK0J3YnhBdFdETks2OVIzMkpHTnluZEZyazRKK0Z3UzhTa2dYQ0Ev?=
 =?utf-8?B?dVJVRHBWaW52bHJCQlNiZlg4OTlyQkJsNXp4Q25FSUlGWEdXdzQ5SFl6dFZC?=
 =?utf-8?B?RjNqbU5JNkxGVFVBSURqeEU5QjZ2UkhLa0pGblBvY0RFZzVtWGk5THlIS25s?=
 =?utf-8?B?YklIWnh4eEE3OEtNaVZzdGNsdzU3K1VjSE5XM1Bic0FIUVVlRU5JZzBLaEp4?=
 =?utf-8?B?QWphRm1QOVk5WFhnQkx1TU1JbUhoWFlRK1E3eWNwbEdRaVhJZnBGSVZiMmNS?=
 =?utf-8?B?ZmxJcmVqUXlQN3R4WTc1dkFUMldGaDNFNU9VbXlQdEtSZkRJU3lVd2JtMWp0?=
 =?utf-8?B?OERtVmdjbTRhajZJc044UTNBTytIODBqN2hlbnVPOUlNRnAyRm1wRW1ZYi9F?=
 =?utf-8?B?N0ZRbi92dS8vWEgwbFBpOXg0bDFIQXFlZjNId1VkbGpBajV2QnZYRTBkRVIy?=
 =?utf-8?B?YTBFa2hueHlaSHJUQzQxMHVMeTZCVUpzVzNWck5LN3RrcCs1cFpXbmZpRmVC?=
 =?utf-8?B?TUhLRVdOVS9veW9XS01TaEFST2taZ3hweWFwRDE2T1M0TzZkWUkwZXhua0F5?=
 =?utf-8?B?WVZudys2NldUcDcwbGc4THdFRlI0NlRvQUhRcXRjSjVFUFFQNmNJMlJaMVZi?=
 =?utf-8?B?UkJvcWJPRUZoK1VEenhjUlFaTEVVYnhHT0hLMWlZYzFIb3ZZbERTbjJiR2tP?=
 =?utf-8?B?Q09XVFBvVEd3RXNPdTAzVFRUQkUxZkJMRFBMWWlveHZvYWVJZEluanFMWE1q?=
 =?utf-8?B?aFpuRE9ZNnZ1Rm44QjAxVUlyalNENUpha01QY2QvR2ROQ1hLOXlHYjM1TWxt?=
 =?utf-8?B?TmFXcmlOdzlsRUZqMWZxNzZOQTZBa0RzQ1JSTndtZlNIOWF4REk3eXFBUUZY?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b31ff5-cfac-4b52-3a80-08dddf320548
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 15:06:49.1385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knMQChO3qEWh0GxBRkdlGbif1uLczK5WgxpZX3pMTCbntUXRgr4Sn8aJchSStwAolBrEjcd1PuNvHUcKsLU/vstyAlAihpIsSRFo4uhHPWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9135
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



On 8/19/2025 10:22 AM, Satyanarayana K V P wrote:
> When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
> flag, the driver initiates TLB invalidation requests via the CTB mechanism
> while releasing the BO. However a premature release of the CTB BO can lead
> to system crashes, as observed in:
> 
> Oops: Oops: 0000 [#1] SMP NOPTI
> RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
> Call Trace:
>  guc_ct_send_locked+0x8b/0x670 [xe]
>  xe_guc_ct_send_locked+0x19/0x60 [xe]
>  send_tlb_invalidation+0xb4/0x460 [xe]
>  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
>  ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
>  ggtt_node_remove+0x110/0x140 [xe]
>  xe_ggtt_node_remove+0x40/0xa0 [xe]
>  xe_ggtt_remove_bo+0x87/0x250 [xe]
> 
> Introduce a devm-managed release action during xe_guc_ct_init() to ensure
> proper CTB disablement before resource deallocation, preventing the
> use-after-free scenario.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Summers Stuart <stuart.summers@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

hmm, that r-b was before my comments were posted
so at least this r-b should be marked with #rev1

> 
> ---
> V1 -> V2:
> - Fixed review comments (Michal & Matt B).
> ---
>  drivers/gpu/drm/xe/xe_guc.c    | 21 ++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_guc_ct.c | 22 +++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>  3 files changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 433abc787f7b..5a6840d890f1 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -680,6 +680,21 @@ void xe_guc_comm_init_early(struct xe_guc *guc)
>  		guc->notify_reg = GUC_HOST_INTERRUPT;
>  }
>  
> +static int guc_realloc_ctb_vram(struct xe_guc *guc)

why this is not done as part of xe_guc_ct_init_post_hwconfig()
function as suggested before? you're still violating CT layer here

> +{
> +	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
> +	struct xe_device *xe = guc_to_xe(guc);
> +	int ret;
> +
> +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_guc_action_disable_ct(&guc->ct);
> +
> +	return ret;
> +}
> +
>  static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>  {
>  	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
> @@ -701,11 +716,7 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return guc_realloc_ctb_vram(guc);

and call to xe_guc_ct_init_post_hwconfig() shall be part of the
xe_guc_init_post_hwconfig() instead of this "realloc" specific helper

also maybe the ordering matters here - so call it before other reallocs
so during unwind, CT will be disabled after releasing other BOs ...
unless you explicitly want the opposite

>  }
>  
>  static int vf_guc_init_noalloc(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3f4e6a46ff16..fe844cfedd24 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
>  static void g2h_worker_func(struct work_struct *w);
>  static void safe_mode_worker_func(struct work_struct *w);
>  static void ct_exit_safe_mode(struct xe_guc_ct *ct);
> +static void guc_ct_change_state(struct xe_guc_ct *ct,
> +				enum xe_guc_ct_state state);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  enum {
> @@ -252,6 +254,23 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>  
> +static void guc_action_disable_ct(void *arg)
> +{
> +	struct xe_guc_ct *ct = arg;
> +
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
> +}
> +
> +int xe_guc_action_disable_ct(struct xe_guc_ct *ct)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +
> +	if (devm_is_action_added(xe->drm.dev, guc_action_disable_ct, ct))
> +		devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
> +
> +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
> +}
> +
>  int xe_guc_ct_init(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> @@ -268,7 +287,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  		return PTR_ERR(bo);
>  
>  	ct->bo = bo;
> -	return 0;
> +
> +	return xe_guc_action_disable_ct(ct);
>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 18d4225e6502..6be5c3bc5562 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  
>  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
>  
> +int xe_guc_action_disable_ct(struct xe_guc_ct *ct);
> +
>  #endif

