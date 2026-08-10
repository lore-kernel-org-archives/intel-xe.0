Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331E4C5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 05:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E5510E156;
	Mon, 10 Aug 2026 05:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ksjjRw6Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE56B10E156
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 05:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786341231; x=1817877231;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CLaIRat04LDO04j0rENSPN1QEd2jK20k0vnH+14A0Ig=;
 b=ksjjRw6QPFfYc6ENI8V2a6xsj1ept51LfsutQ21xGrHHDVZ2/SQDQWu6
 01VyC978gYIYQowDKPEIOH7F9nQRnOUgg3zvztNJjrtGYw1zThnqL1T4S
 8CS/xzMqescdfZN0hWn7ezBHY+K2PP24kGNlKsQhvBl1OMaqfISNiB/+A
 YnddnI46Z6ZnXDsXQYBgEdDZktmD6xlMudZ2iort4ur9cJ71uRc02sBVW
 V1jbjcZDzmhp4tevRmJP5tCyL/j7B5JfhZ+4JhNKRJpQ4uue4dj3v7ayg
 dtqBFIhj1I/vVfT/QfjNQGZfDkviPSSH4SgfgN4kH/tCrrhQe1iZpqIz6 A==;
X-CSE-ConnectionGUID: VMixE2IZQ66YdUHZuumLrQ==
X-CSE-MsgGUID: 1rclE9W6QJifD5ghvmoClQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="74381416"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="74381416"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 22:53:50 -0700
X-CSE-ConnectionGUID: UWzxusxZQYaqndlIkKjfbA==
X-CSE-MsgGUID: j89H6PQzQFCXXNfN4anm1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="286365715"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 22:53:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 22:53:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 9 Aug 2026 22:53:49 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 22:53:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qkcnq2uI09ZhwXnday6SCWuAiauhCcN7Fp80AjdViCRox4SoSAbsEjbd6p9zqLWxVnwuHaKw7tGlbfqnMBlPIK6vd7GNvAoWdqLlHOegExJ8Yf/5l4qEwgtMa5IIOWGkkGe9AuQJcTCvOwehUze2JZdXTfq10Mt3gpQPOpVvT8tNwaRvhQvnRxU7kPZBPRen0USjgQ0JQC3cGOoAGktxHw5/faGT84M9Rb0gnL2xV0KErOtGvsAo4DYaYYWmYA4koRm3G7ngKyNKnxj81YfTosYJ3fqOzNk5pQ0SmStzoKJzwZEy0luuKjcuaGGmO0q7of/fIEml1trWkpJYvnbomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrHYudG+gEw/km1eyQM1//vX8Ub7H4dONxiu+R5SPSM=;
 b=KasQvFuQpaBlVn7l2+G2CL2CExERj+Zolqsp9zesi8mR5j0U83p7rK5/5F+3LTsURGem7QtxlHHDoGptQefm4BD7esk7/t6xk7VigHEYS6EvbrpQoJi4M8N4JpvIJGoI5Dr2mNIFuCUg2dUIttdpzaK38RkXdZFmxtuknaicq4zmaFfFa7XDI2cEfUS8xpw/T0KMaypUej1IUZu9ErSD/DxZhDmTw4DEkI2cdEfu2XklsjbJbVtgMv5PnXkFmPRxAAfMmx9irU9KmPf7MDtxUg9dp0bgvMBb9qhowB5GzVOnk9AGnS4+wCPuKIVADMKU8aeqOGoweR3tHg9OmRHQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS7PR11MB7885.namprd11.prod.outlook.com (2603:10b6:8:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 05:53:47 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 05:53:46 +0000
Message-ID: <027a204a-82fe-4146-9e33-3fda70406906@intel.com>
Date: Mon, 10 Aug 2026 11:23:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] drm/xe/hwmon: preserve fan user table across
 suspend resume
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-9-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260717041757.2759084-9-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0179.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS7PR11MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: cb664fba-2cd8-4f4b-83d2-08def6a3be08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|5023799004|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Lm1VIfFNrAa64yU7bk7EBa9K5q4rbe5FLhLRsyWeadZ2FLmm9+JinLmr1d3LOUA5C+eCN3SVGSs0OTbCRE3vOp7tu5DLyLtbnnfE13RBYvVyuh9xYYF50qJf2RjSFs8CS0QHf6bAfIzHI/YLpivLkt2XEaf6DQhAB+QGGP18sl+cyANsUqZSgWzhWlrM6xqwfdk5O+Y6Am0Rh8nAJcfvdEtWWnIbmfD7kF0dqXrbbzdACEAVSN/lLo/BPlmROzxDEDYicT7NFniIo2xeBf6dlpNmnQ204+1zzaEaxiQucYZlSwsckmwQSBxItmGD5zhKgMTCsDdDr6cctc/gyDTZlyUiX5uEvWBbdH9WY0W9ALrnFIiNpuqxn13oKP1hJMQDrhq2fh9ldg8gsMfRw0QyMEkFGE4Bzu/CdC/h3SREPBVaZ0i4rfdEvTkKF7i217HR+Jf3KxvIbRJMUyRhPWK8rMYq+3LfSSVCqTKqsqVddvFNSzvjdLoq4k+3FecyoG6NZeZQSUglMuky0VbGCIDRPsbsNJZqaAgMzmMdhyb80SI7xiD9NeKuzhMGTXFBI4KJD1vSCTUfvL3TEd2YJSBaSbj4t5cbnZpyNjmtKkPUoSw98HdYlgBcv/s+AIQ/snwXZY7dq0vPbrdYLpktua0ZwwlPXHuZ7MIpFk3O6w+uiwk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(5023799004)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzVHb1czWk5SaW8wRjhlbmpnUWQ1QXlFdFFlSkcrbUJOSTJXaytTWkQvQndR?=
 =?utf-8?B?RnlIa3BLN2phcWRmbHhyRHRzTHQ4Q3lpOUR1VjkrVmZWTmxSMk0vZURxNkdy?=
 =?utf-8?B?RHg1cWVRS2NrZm5tMld6WURLcndjRnRQTnpLSkR2L2JOQVpVZHVkM2dESmQr?=
 =?utf-8?B?YnloaVE3UU1ZdEV6aTBWdUlncGJ1cWtPekg1UWRQTG42YWZKR2Zqa1BERWVI?=
 =?utf-8?B?Ri9aYUJhZDlZZ3Njakx2VHVCMjdNZFNCaStIOVppMHowY3hpSFd5ZFpMNUxa?=
 =?utf-8?B?OUJ3QmZZTFU5aFBibHlFTjA4bldRODk1YTB0d2xZU2VaeERnbmw4ZzlKWHNV?=
 =?utf-8?B?dGJJSElvbyt0bzRWbDQ0a2JuQm0xS0xuNjRXMHBUbUhNdHUwWHZxMStoUkFa?=
 =?utf-8?B?Z05NRVdCYzcwdEtZcnh4bGlFM2VvWjZSaFYzakJQWm5rTkFMSGNuMHkxYjJP?=
 =?utf-8?B?VU5hS202ekxzaG1iYkh6RW9CaGI2SFhISCszY3Y0dmlQbXRkZDNxN3JxZzR0?=
 =?utf-8?B?Ry85VndtOWlSWjRVUkFibmk5SXNMZ0xQblNISXZjcmR4UEFBUlNjOWFWZ0Qx?=
 =?utf-8?B?amRvNFdUNnhnaTFDTFJoMHRwOEpSaExtNGZ3QmJCekFQaFEzYzVEOS95MlR2?=
 =?utf-8?B?alNVTm11RE03QjlYNWNLQWtnNDNrQ296VnJkU1N1SGZNVE9Qcnk3MUUvNVVJ?=
 =?utf-8?B?K3NWSmdsVzdsTVQ5SldDVXBSTURSR1Rhc2VkQlU3TTQ0VEdKazdKcnQxckw0?=
 =?utf-8?B?WjVOd0RKRzlSOU0rd3k4UVgxL21BUjBjY25JeVdMeWUvQlVKaE4xRHM0OWFk?=
 =?utf-8?B?SVloQ1hwYmZRbklMcS9tYzYxSUwxOXg3UTRSTnVCL3liWVlIODkwYjM0K1ZK?=
 =?utf-8?B?dkhkUGtZdTJ4QzFHRS92U1BoWnNRcWVwLzZPUkVLd3M5aCt6YlA1cDFldDJw?=
 =?utf-8?B?dVpOdWFMWDN1TXhZNHU4VjZSWDhMc0ZRQjhCOGZNUnBKU2lzN01NYytXaW5P?=
 =?utf-8?B?WHBWbUwxeEhXMllOMHczTFpjQ0xxalIxL1dDbkhLYXIwY1lRK2ljVFNWVlBv?=
 =?utf-8?B?WjB0NFV0U2hTUXlMZ0xNcG5DYmd2UXQvRGVwRU9BTThxeXhlSTR0TVUvTWN3?=
 =?utf-8?B?MmFwczdPbGx1VEZJOTE0QllpYTFEb043akQ3bjAvY1NCa1E2RW9SL3NjRzV1?=
 =?utf-8?B?S0NHTHNETGFGNEJ2VHJZV2hyVGFhay9yMSticlZtTDROMEhJVXIvd1hVMkFx?=
 =?utf-8?B?YzFkK1VXYlRQUDVtcUgxemRLS0xoQlRiZTRhWEkwUStLL3hETjFMalI3TlNH?=
 =?utf-8?B?TWtuUk51UURodlZQUzN3eVlkMG9IbSt3S09pdWhTbkRCUGMrYy8vTVJCNkMz?=
 =?utf-8?B?QUtPRE50V2xnM1VuNTVOUk9rUTF4dlpsU0xXcDl4MTVqY3AyU0lFU0czVVRR?=
 =?utf-8?B?emhqd24wOTRJUDUveG5kVkJ3UUtYVi9xWU5naDZ0SVMzMmRJc1k1THVwSktE?=
 =?utf-8?B?eCsvNlptZVkySFdNUFg5SUlSVWNXTHlZVUt3VmZFUVpaYmJXaHRBenRXSzJL?=
 =?utf-8?B?aEtURGVkaGxieWlSRFlKd05BYTNnQUxhYUpobS9QRnAvV09jZ0J3RmtaUHVp?=
 =?utf-8?B?R2FzaW02V0JsQTlSRFRjMDlwRDZsUjU3ZFNDZ3FBdGE2Q3h2cllNM2RCVExO?=
 =?utf-8?B?eG1yUE40MWpPZUdjUjR3WlI4YVEvemwwY3MxVWNMdkFNakRTdFRuWFdnamsy?=
 =?utf-8?B?Uzdzb2EzMUZOUFpQanJNRTdDbUZSRVhvQnBDbE5EbkFha05zcHpVcWRQL0kv?=
 =?utf-8?B?aEJrUmVWNUtBTENTLzd5bWlzTWJPUmNzMis4MFVWeEp2WGttaDUxOGpWMVhk?=
 =?utf-8?B?V1VOc1BBSUN4UGtNeDRTb29ZTjNFUmRrMlQzTGdqa3dSd3cvMHp5NUE2M3BH?=
 =?utf-8?B?aVhSWkZSMnZMWlROdE9RcEZFTGxGMWdEdVdjUFJGQndCMm8yM2JhMGU5YnJR?=
 =?utf-8?B?Zi9qbDJQMFFieFF3dHRWeUl4eGFpKzdkNWh2NUpCNGtISERvVmZaSW5sSW9o?=
 =?utf-8?B?WHJQTzVVK1d1SERPMEs4YW5oc3NXd0tmQWtyNnV0cEV2WTZSVzZNNGtDN2Rw?=
 =?utf-8?B?QVYwSFBBNzBVTVpzdm14MzVkRVlYTGtQT09NVXBwLzgvVmFhcEdYOHFIN3pQ?=
 =?utf-8?B?K0JYQmNKSGFhSFdyd1pETzZxMkNhZXZTL2kxTzhLUThwdmw0OXUyNSswUXdR?=
 =?utf-8?B?WlEyMEVJUExCaG5lQjFSUGh6N0dQSW9RVWtRWGtqWDk5QXBESllDUng1b2Ro?=
 =?utf-8?B?UTNsRTkzYUlqaEJoVUpFNVdNWGRBbWMrQitVMVhyNm95ZGxSbnVWZz09?=
X-Exchange-RoutingPolicyChecked: d7kRgyaRt6ERj9NrclnESRtDCZIcXfl551joJ692shIi32vXaDK0uYG3Y6uW1tOdAg5vNrhdCg+8ClaXlMvu8L+pRjxLtVTyqzxyHk7oNWtupQEciNHfO5X2Pxl0J1f9VBqSO/gnRDeonpsouiGPseiYKFDHOp6lFZ54eVEt519aEVdAjrd4SNbH5x3M72AQWX0gyplgpMNNZqPewvFlo+Fm9zMpxcFitreqi7tMo8i+/qmi7Zp9K0ewz5XKICZva0e9nKm/Hx7wGHrQiWLTGhpqurRPplMr+uWtmcYFuJoANiCyb2yeMmaEpUipyG24kK+xDF1Yj++tOa8RRbCBKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb664fba-2cd8-4f4b-83d2-08def6a3be08
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 05:53:46.4527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0ZmN2BK0dEqMJt3rtz/YFetbCPYW/EN1Y1ODb/Mn/aFrF8ZhREhPZgfYOf8pYntsd+NaMZeLWLM+rlJPwPN4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7885
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


On 17-07-2026 09:47, Karthik Poosa wrote:
> Save and restore active fan user tables over suspend/resume via new
> xe_hwmon PM hooks, and run restore, only when d3cold is allowed.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-3
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 133 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hwmon.h |   4 +
>   drivers/gpu/drm/xe/xe_pm.c    |   9 +++
>   3 files changed, 146 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 770f07fb6511..65f356c741f5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -229,6 +229,8 @@ struct xe_hwmon_fan_info {
>   	u8 pwm_enable_mode;
>   	/** @is_full_speed: flag indicating if fan is in full speed */
>   	bool is_full_speed;
> +	/** @restore_user_table: restore user fan table on next resume */
> +	bool restore_user_table;
>   };
>   
>   /**
> @@ -2785,4 +2787,135 @@ int xe_hwmon_register(struct xe_device *xe)
>   
>   	return 0;
>   }
> +
> +/**
> + * xe_hwmon_suspend - Save hwmon state before suspend
> + * @xe: xe device instance
> + *
> + * Save any hwmon runtime state that must survive PM suspend transitions.
> + */
> +void xe_hwmon_suspend(struct xe_device *xe)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	struct xe_tile *root_tile;
> +	int fan;
> +
> +	if (!hwmon || !xe->info.has_fan_control)
> +		return;
> +
> +	/*
> +	 * User fan-table restore is limited to d3cold flows, so skip snapshot
> +	 * work when d3cold is not allowed for this device.
> +	 */
> +	if (!xe->d3cold.allowed) {
> +		xe_dbg(xe, "d3cold not allowed, skipping fan user-table snapshot\n");
> +		return;
> +	}
> +
> +	root_tile = xe_device_get_root_tile(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	for (fan = 0; fan < hwmon->num_fans; fan++) {
> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +		u32 point_count;
> +		int ret;
> +
> +		/*
> +		 * Record whether this fan was using the user table
> +		 * so resume can restore it if firmware state is reset.
> +		 */
> +		fi->restore_user_table = (fi->pwm_enable_mode != XE_FAN_PWM_AUTO_STOCK_TABLE);
> +
> +		xe_dbg(hwmon->xe, "fan %d user table restore flag set to %d\n", fan,
> +		       fi->restore_user_table);
> +
> +		if (!fi->restore_user_table)
> +			continue;
> +
> +		ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +		if (ret || !point_count) {
> +			xe_warn(hwmon->xe,
> +				"fan %d point count read before suspend failed, ret=%d, val =%u\n",
> +				fan, ret, point_count);
> +			continue;
> +		}
> +
> +		fi->fan_table[USER_FAN_TABLE].fan_control_point_count =
> +			min_t(u32, point_count, MAX_FAN_CONTROL_POINTS);
> +
> +		for (int point = 0; point < fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
> +		     point++) {
> +			u32 fcp = FCP_INDEX(USER_FAN_TABLE, point);
> +
> +			ret = xe_pcode_read_timeout(root_tile,
> +						    PCODE_MBOX(FAN_SPEED_CONTROL,
> +							       FSC_READ_FAN_TABLE, fan),
> +						    &fcp, NULL,
> +						    XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +			if (ret) {
> +				xe_warn(hwmon->xe,
> +					"fan %d user point %d before suspend failed, ret=%d\n",
> +					fan, point, ret);
> +				continue;
> +			}
> +
> +			fi->fan_table[USER_FAN_TABLE].fcp[point].temp =
> +				REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
> +			fi->fan_table[USER_FAN_TABLE].fcp[point].speed =
> +				REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
> +		}
> +		xe_dbg(hwmon->xe,
> +		       "fan %d user table snapshot taken before suspend, point_count=%u\n", fan,
> +		       fi->fan_table[USER_FAN_TABLE].fan_control_point_count);
> +	}

The above loop appears to save the fan table when restore_user_table is 
set. Is this required? It seems restoring the table during resume should 
be sufficient, as the fan points are already cached.

Thanks,
Badal

> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
> +/**
> + * xe_hwmon_resume - Restore hwmon state after resume
> + * @xe: xe device instance
> + *
> + * Restore any hwmon runtime state that was saved across suspend.
> + */
> +void xe_hwmon_resume(struct xe_device *xe)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	int fan;
> +
> +	if (!hwmon || !xe->info.has_fan_control)
> +		return;
> +
> +	if (!xe->d3cold.allowed) {
> +		xe_dbg(xe, "d3cold not allowed, skipping fan user-table restore\n");
> +		return;
> +	}
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	for (fan = 0; fan < hwmon->num_fans; fan++) {
> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +		int ret;
> +
> +		if (!fi->restore_user_table) {
> +			xe_dbg(xe, "fan %d user table restore not required\n", fan);
> +			continue;
> +		}
> +
> +		/* Re-program cached user-table settings for fans active before suspend. */
> +		ret = xe_hwmon_activate_user_fan_table(hwmon, fan,
> +						       fi->is_full_speed,
> +						       USER_FAN_TABLE);
> +		if (ret)
> +			xe_warn(xe, "failed to restore fan %d user table after resume, ret=%d\n",
> +				fan, ret);
> +
> +		xe_dbg(xe, "fan %d user table restored\n", fan);
> +		fi->restore_user_table = false;
> +	}
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
>   MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> index d02c1bfe8c0a..6c6f30208508 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.h
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -12,8 +12,12 @@ struct xe_device;
>   
>   #if IS_REACHABLE(CONFIG_HWMON)
>   int xe_hwmon_register(struct xe_device *xe);
> +void xe_hwmon_suspend(struct xe_device *xe);
> +void xe_hwmon_resume(struct xe_device *xe);
>   #else
>   static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
> +static inline void xe_hwmon_suspend(struct xe_device *xe) {}
> +static inline void xe_hwmon_resume(struct xe_device *xe) {}
>   #endif
>   
>   #endif /* _XE_HWMON_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 99562f691080..23a78fa4a71e 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -23,6 +23,7 @@
>   #include "xe_i2c.h"
>   #include "xe_irq.h"
>   #include "xe_late_bind_fw.h"
> +#include "xe_hwmon.h"
>   #include "xe_pcode.h"
>   #include "xe_printk.h"
>   #include "xe_pxp.h"
> @@ -189,6 +190,8 @@ int xe_pm_suspend(struct xe_device *xe)
>   	for_each_gt(gt, xe, id)
>   		xe_gt_suspend_prepare(gt);
>   
> +	xe_hwmon_suspend(xe);
> +
>   	xe_display_pm_suspend(xe);
>   
>   	/* FIXME: Super racey... */
> @@ -290,6 +293,8 @@ int xe_pm_resume(struct xe_device *xe)
>   
>   	xe_late_bind_fw_load(&xe->late_bind);
>   
> +	xe_hwmon_resume(xe);
> +
>   	drm_dbg(&xe->drm, "Device resumed\n");
>   	xe_pm_block_end_signalling();
>   	return 0;
> @@ -615,6 +620,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	if (err)
>   		goto out;
>   
> +	xe_hwmon_suspend(xe);
> +
>   	/*
>   	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
>   	 * also checks and deletes bo entry from user fault list.
> @@ -724,6 +731,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_pxp_pm_resume(xe->pxp);
>   
> +	xe_hwmon_resume(xe);
> +
>   	if (IS_VF_CCS_READY(xe))
>   		xe_sriov_vf_ccs_register_context(xe);
>   
