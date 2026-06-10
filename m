Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E4CCD8C90
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 04:43:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D6110E6C9;
	Wed, 10 Jun 2026 04:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzE+1FBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C494D10E6C9
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 04:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781066618; x=1812602618;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wjmXiqM/w/vK5oIYs2KDo3+6KtIH4Xjpz9x0IRTXyQE=;
 b=fzE+1FBB1EBDtTOc5JnYaEpr1oVc2WCjr5cqQ5j3cizjwAGidsYG9I13
 lUfgDmKwtp0RttsCs12+58jCht+lxtYKkmbjWWXKAfNkYMpdUoRHpt2CH
 c8soFJAvUuA0r5yfIOlHfH3B9vvtJ4GFnLMTvjMvGAs2lRlPo/pvpAtar
 HaWD0xN7G0oa9FrI9NUbUg00MPtbsV4CkHouaD9HCriClF7QEvA0iygSn
 wlv9PkQqTJvrvcdCrOLhLIcbR7j+zkUm7SH/pZYMGor9ufcyISZa48d99
 BggCHunAxJwzpzjY2bMVJQJ/lBcHVENdqLGiucaPSITXbbWnZODjM93qy Q==;
X-CSE-ConnectionGUID: KHAG9OV0T0ix8cRE/TCuAg==
X-CSE-MsgGUID: KUQXcy7wTq267D5THpmdwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104514972"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="104514972"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 21:43:37 -0700
X-CSE-ConnectionGUID: ePrVWuGvSf+7orxeL8EPLg==
X-CSE-MsgGUID: E2P5DqgRQq+eeVzq7XPa6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="241633543"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 21:43:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 21:43:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 21:43:36 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 21:43:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWVGii7+1L8nAHQaYc0kmRAJSFQEGOgQYZBOg5J/Ef7SeuPXr9Fkr/Amh0l/Pywy+fCzh9HoGTQu6ZPCjt71eikNC07fTfZ5Dn35OJAniNdy37rlE1npPcw2XQA2Nt5fKV5xkuxvHXKizoSm59WjsKGWGsTLitjp1madhnSty7eiLTHvDN937ngmA0diwLq/6irgzcwiRIwHtRP68TK/rZcKDlqU98oK36McFtxWz9VzW227Lh3zFypEWPGDAFFxkxYGse9fBGNHq1wVpFgIkzOyOTT3fBJsEyIuMZ4bVHyGc2oYsUt8glVEaKP5cFBcwsW4HE8j5IIy1u9WvD4tnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCti0KgcP6TCX7tmQSPXhATplOoacMEEQ9rT+yfY43g=;
 b=q6P1/RzvDLCaHY1hMi+oMeRbF2j4lFDyOh6FC9qCLTn8VRWCSLY7c3SxM+KyZilW5+QsZyuVn1vEGt9r0B4eJUvSNkXb75y5fnTTSPViUQBu/3ZJGTMYOa0ooV/DNSD3GU6+wii5RVbO+EE2Y/Wyup2eD2ijct22d6M8F71r05RxHA30vRATExe9yAP7lh5JQkN4anUWhHU4xaUztRiiZQ8ZKALLeFvdG3L5hM7gSJQAhkyRJ2oQUOQYWpTzTIDzC6cnG5qj4WBhU4X38Q7kWXqMi4mVZTYw2LyEHPeMnc+5Ove/+Tothk4eYd29FQy/dmUYb4tpMLszC/TzA+7aMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA4PR11MB9012.namprd11.prod.outlook.com (2603:10b6:208:56d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 04:43:32 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 04:43:32 +0000
Message-ID: <2d217c00-9800-4846-a99e-e8f592ef09ac@intel.com>
Date: Wed, 10 Jun 2026 10:13:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe/xe_ras: Add types and commands for RAS GPU
 health indicator
To: Andi Shyti <andi.shyti@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>, <anoop.c.vijay@intel.com>
References: <20260608052556.1744123-5-soham.purkait@intel.com>
 <20260608052556.1744123-7-soham.purkait@intel.com>
 <aicuwb6lk-CoRduh@zenone.zhora.eu>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <aicuwb6lk-CoRduh@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::20) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA4PR11MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: bda88bd6-fd09-44a6-2275-08dec6aad300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|6133799003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: rYcyPTp7kBJd1V7Gg53L4Mpy1BxrLWljE0oJ7dvPFOP/OBYxqWs8RSGy1RTfblZUZnmW5r7pGgMhbKLhzNs2XUtzwE3iRxv4hxlvmq7fp+CbjCKf4H83NZFlYwvYYYgLU6OQeaW8J1nTFRb/ZcqnHmn6r2GWe6iOdBpcJhfhAMjp9BGUpVBncXMAjxTJ/xg0rb+OK9SwG6EXG5qmZWpqmAS2cu+w/VHRFPX+zJ83+K1ohEGUuRwd8YmmSvbsqdxKHG1RMl1rzZC3CoVLhMe3Wv6W46z0Nhs3M2FgMAk6p0RA7M5nTDd7yLVmTfpm7VqiDfR3sffW+DGtS/hoNgLGQ/NbxNYCg29+fsyOfOZ4qNW70H4a7eeKkdBHJuBt1expV3l5CHpaFckPa7ARH4jTggP78ucgQKbY8QLqFDhvth5OCiMXvwd/gr8RuC554SyYLsv9CVZTJq0X+37rdQCfnoExOf00S20JldfLixw7pxTccC8SVs8vPO6+/c67/7FvCQJ5h4UDI3TW6jYFdFFftJLUFlkuTFqKq39hsXSojjwRchzm9Zsqmj4njClaK/QBaQcSnoS4K3cqFaaHa8yITbzaK+MoI37rE7wD+eOqZrO8g8OSwjEEySSYJTM8OrO/f8DQ/kD+hTccsZVKWNSYMz29h9XGDG1y3SqisjSfc7dhSWme/3eNP+mEp4gNH3UY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(6133799003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QytQNUNRSmtwMHFXb3pHbitDQm96OStzbkM1NlZUVDhIVG5iV002RlVZQW1a?=
 =?utf-8?B?Rm5LZ2IrOFNiYmN4V1g2MTBhMEpGdXgrU2c1M0htZ0gyVnJpN1RBaGpxd0po?=
 =?utf-8?B?VkVRSWhDb016UC9Da3JuNlU2bS95YWV3eEhXUmZZY25aL3F3dWRycmtZcktG?=
 =?utf-8?B?Ykk4aC9DN0xkTGdTenRSdWxSZGNoTE0zS2YwdXdETjJlOUU5UzNQbXJzUGVD?=
 =?utf-8?B?am4vOVlxS3VzODZ2cXBnNklPU3hVZUxZYmNJaWR2ZCtMSXgzbC9RY1J2RDFk?=
 =?utf-8?B?L1hmYVNVeWVKNzl1NDRYSDRQcFpQTkRZMW1ja0JrcGpVT1pmL2hXelJmZysv?=
 =?utf-8?B?SDRDMkNQeWJHV2JTUEpmVlRVMUdXTFBnQVNFS0JtUkVJcUhYblFhaTl0eUts?=
 =?utf-8?B?VmZmMHlVOHA3ams4alNwZEZwWTFqUFJjRUNkTTlZUXRuckdjY1B3QUhaWUJQ?=
 =?utf-8?B?dGhRbG01R3pUR1Z6QzhGSEg4VFQ1MDJGMFh1Y2RJQXQ2bW1iTDhNSmpYME5F?=
 =?utf-8?B?bmMxSXFKVlZyallHREhMbXUrSW03WGpFSkVReklUY1cva1htaUhiejBSWnlQ?=
 =?utf-8?B?QzRvdFdZcVRZeWYwZ1cxbzJvQ1c5QkZOc1NsU2xXanZOR3hheVluWnlxVkNB?=
 =?utf-8?B?TUMxaER6QmZWdlVkOFlzaXkvNEUrcGhpOUphRVBWWVJYVFRMQ0RpV3c0eEk1?=
 =?utf-8?B?NjZwbXpaNTlWbDR3TVNGQS96UTl4L1QvdUt2c3RUdFJkakdRWHFYZmVoSWZ5?=
 =?utf-8?B?RUlUQXdnWklscmZSTGR6SVpvOVpKb3E2TnRDbXZIY1lkNEwwWkZndXpkbGpJ?=
 =?utf-8?B?K0poRzY0V3JVb3BJc0hLUG4yVFRIN3IxTjE5RDdOTndNOG5YMEd3bFd5Zzhn?=
 =?utf-8?B?OFlVelFPdGYxc3AyeDlCNUt1WW1ScjRPa2NuTEIyZm5PNlhYM1VQelVMSjg0?=
 =?utf-8?B?SlRUd1JFMkRGNUljeFhraWxSQjRrb29aOGw0ZGorTmY3SG1uL1E0dWlkelpu?=
 =?utf-8?B?NDYrVmxET29vZEh3aHNnNWhWRGRpbkkweGhxYjd4aW8wN01IUFg0alBEdS9p?=
 =?utf-8?B?ZUk1c2JsSy9UREV1ZlpMVHovTzdJZnZRMW5qNHdmbkdCaHhwVnJhQUJNYlg5?=
 =?utf-8?B?Q3JXcVdHSXljOTMwZmRsbzlHWXVnSHBDV3Q5bkZYN2VPN2dKM1U3VUpYZEQ3?=
 =?utf-8?B?NmtyL3M0ZFBOZm1ZZ0VwaVRVZVNEM3picVBNZUdycGhhL2RXSDRDNy9QY05y?=
 =?utf-8?B?VlhZZnZtV3RrVTRERGpQcVY1NFliMDczcXFZTjVtb3JvVGdGclBDSFhLVTIx?=
 =?utf-8?B?MFoxa1g4M1hlYklqREhvSU5sSVlzM2tITUZTTjhWTE9JSkx5eVlRSFhXZFlQ?=
 =?utf-8?B?QkVNUXBmR21Yb05VTmdDZEtzUzllc2dtbHplV2ZLcWQzN0pCT2JZWDA1UEdD?=
 =?utf-8?B?MXZJUkVTdTAzWDR4UEZ6UEduWGM2ZFBCQlVwS01ONHhTSCtKYU9yV0FKU3dK?=
 =?utf-8?B?Z3dtQTBudnpCbm9MYjVwS3A1bXFIdHVvOW5PVWZlSkloTHJNMExSbnRSOS9w?=
 =?utf-8?B?UEdzOVFpNFNIL1hrU1k1K1c3RVk4UjArSFAwSGhiNkl2RnA0UTZXNkE5anh0?=
 =?utf-8?B?YS9mOW1JNmhjb2pvelVTZXRCbjFEZnk1VHFlamdpT25iYlEza2xVMzNxOTEr?=
 =?utf-8?B?L2dHbEM3Nno3VUxscEhwajE5aG9ST0NjU2d1ZC9HRFFxNkx0U043NUk4aUR0?=
 =?utf-8?B?RzdmNlUzcythTzV5V2Y2Z3dtbXoyTUx5bHkxSGhwNHpaZUZpaVgyb0FuMHk1?=
 =?utf-8?B?djNTMEQyOTZDTmxubEVXM1lXSlQzRDA5aDRoblF0UnNPQlo0WTJGNzZBM29F?=
 =?utf-8?B?STFNVk1zNDA5WXd1VGJqZ3c3REV0Tkl1OU45SmJyVlBIZVpzNWJCZyt1WXhj?=
 =?utf-8?B?MnhCVHBEZDhWcUdUTGtvaHozVk85UVFBTDc3cDBDV29DSE9GZVBFWVp5STNl?=
 =?utf-8?B?SzZjYzhuaGt5UG1zelA3ZVN5WkgzRExXLytLcVg0V29EOW5FN3doNkFXZEhk?=
 =?utf-8?B?b3lDQXJsSVhlUmxpeExKb0ZTd2pLQnVnM0ZUcUZZVG5WYWhIV2Judm8wWlA1?=
 =?utf-8?B?cHhnWCt1am5zUVFtVVRFVjNDNm5IdHl3bVcxOUU3RmNSbHI4QmNZU0d2bzZ0?=
 =?utf-8?B?RGlzcGNIY1cwYy83NGNuOGZOa1MrM1V0MGkwVlBPOEdnQXNOamtUeUxBekJy?=
 =?utf-8?B?WXdSQTRsTCtJazFhWXVzT0thRER4ZU9zUXl0NXQvcmVEaVJNMFdxZkk0NzRo?=
 =?utf-8?B?RUxkV0hmemtGaFh0a3FEMVJuL29wZkdiS1h5NGxEOGdEYlVaaW9sdz09?=
X-Exchange-RoutingPolicyChecked: nLLhKie7rJ8dFjvA6daWcXmnNf2BBfpBE7krUI9Ut4T5kXvRpg6amqYA3T722FsuLCvw5Mvt5rLOrDmqDjkZXXX+K35+srvZMs5YJyDA5GqdICZ1mcMXlqr0OfQla3E1NIKycZ3OipwzqU6vomEFIpHE2d3ZrGBQ2hCojxX94qEEVS06k/eyI/exPfLlniMc/WCyulbiQQ3+sdfDTNx9R75TlUKav6SrSNs/HurBDejKu42I8arix2y/WOKK1mF1kH9Q3gX9F6RW75ye1kpbPqw+WquGds1kQ/J/anOYdPEeZgi/oRIZ57jgKPGXP2QWgNKohr6mqKuIMY1s8gWdeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bda88bd6-fd09-44a6-2275-08dec6aad300
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 04:43:32.4929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfA52Llxm1QCyQZznTgrKX7KBhZ8ZL2Zt8t7GtPLTz56sKZzFQmVprZq0IRycp7aDOLXYUSUh7POLD9rSXKmtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9012
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

Hi Andi,

On 09-06-2026 02:39, Andi Shyti wrote:
> Hi Soham,
>
> ...
>
>> +/**
>> + * enum xe_ras_health_status - Device health status values
>> + *
>> + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
>> + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is still operational.
>> + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and may not be operational.
>> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
>> + */
>> +enum xe_ras_health_status {
>> +	XE_RAS_HEALTH_STATUS_OK = 0,
>> +	XE_RAS_HEALTH_STATUS_WARNING,
>> +	XE_RAS_HEALTH_STATUS_CRITICAL,
>> +	XE_RAS_HEALTH_STATUS_MAX
> do we need this *_MAX status? In the next patch you can also use
> ARRAY_SIZE().
I'd rather keep XE_RAS_HEALTH_STATUS_MAX paired with the 
static_assert(), since together they catch enum/string-table drift at 
compile time.
>
>> +};
> ...
>
>> +/**
>> + * struct xe_ras_get_health_response - Response structure for get health
>> + */
>> +struct xe_ras_get_health_response {
>> +	/** @current_health: Current GPU health, see &enum xe_ras_health_status */
>> +	u8 current_health;
> should this be of the type "enum xe_ras_health_status"? Same fot
> he next variables.

The struct mirrors the FW layout and needs fixed-width types — an enum 
on the other hand has implementation-defined size.

Thanks,
Soham.

>
> Thanks,
> Andi
>
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved[3];
>> +} __packed;
