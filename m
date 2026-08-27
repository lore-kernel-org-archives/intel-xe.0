Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DA9C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331FD10E63A;
	Thu, 27 Aug 2026 10:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzGZbX+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA67A10E63A
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787826446; x=1819362446;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JCsM0say9PWVqM0l2jPJvcNVdF332aOCQvXVBlfzqk8=;
 b=KzGZbX+Rq4QKVeNJI/6XyyPmm4mSHLUoLM1O+nUI5OSQXocnqvO4mknG
 qbmzhrdQJoumRdJVuJaCfSQDbacpWVVvO1nAvCanMTzkV58SSpyHuj8Pv
 ELP2XlLFfxtbjGACGwI4FUfN0skJ1X+lQjULrx1cCpFD0LPNFyl99EnCS
 7DZlqmfgTVow5LcmQjao1xEvyoWh0TSQzD1XGPbIYhGck0fYxLr2OoQXw
 RomTitJPT9fJe+DzgDeqzB72TuMCE6TvikvzcHvs6twALJF2Cn5/wwbXE
 BTtGBt1cs1GV7iyfxVeZCjpw3GtF5QZ39tVxeAjOYI2KXKWxqFDQoyHSd w==;
X-CSE-ConnectionGUID: C27drib4T42b+MsHZ+Aqtg==
X-CSE-MsgGUID: clwoLxmmTWecPv9bqhfjcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87457202"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="87457202"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:27:25 -0700
X-CSE-ConnectionGUID: UjB/MyAWSpGHSl6LPeNgSA==
X-CSE-MsgGUID: Zz2lfJocS/K1AftnW8GN9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="291344047"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:27:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:27:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:27:25 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:27:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2ISUYLIXPRvatZSXSIKLrEqij91ZOL2fjRXfTR+0hVkBdHbsO9VTUdC6L8ZBCkRo0LC8khpbp2xVp2ZOJRbCvLbI6/nd+EFlE+0ZqCbMoXw7Qk5kP7foRq4ry7VkuTRMY+08Yj8wcuC3M3C6TINLKeahIYT6/G7x76QneZuHNpSu6grOpAgSbSv6pOpsa2a25rzPdi147wIVEcpT0uZQhtUxCX0+B+3nYomZhI3NM5CYGV3Q2aK9dstTKvzPOVCj3bOlNY82vJg4Z/ATYbvClxz+XQBAyg3MFkdA86xqlpQHpRecWjW1nedszzyMdiph/g8HhCH0FKxC9Wbf78diw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bv3bKxJWqvVuwt0oZ745WlcgJ9hyp6jKW48BtQy4eSE=;
 b=K4XdVLe90/t2gFm5vGpdErzF/oCC5P9Tw6051vDU7yCaUQIqmUHHVTB9yvDUS40ajPKs1+2cjY2PT2nCeNRbzZyJn6JS5YUnUq3DtBcckiZoAyuZmsc27GmcY+Vh+ZSBkuccrL1HNv2hiVc9PQZgCwwkkLJxPrDxBWwPE5JZO+snjj4Zmy0vU11Ga8duPHY95d6JvLIXK3d8VRwBquHqDtUjSsyDLGrGUy9m/rh5X9vVYj6yWCoN1flJWJ3KmrvsEt5pw/BMiUMwABQLf/VeXXuo+Fx2AUPfDL8wptzPD5V2SmRfNatT8grzNTAeKeHL4mNcuCvZaHCvaGVjPuYefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 10:27:23 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0339.012; Thu, 27 Aug 2026
 10:27:23 +0000
Message-ID: <4d11f4f1-4402-4627-9b5e-b52d1d15330d@intel.com>
Date: Thu, 27 Aug 2026 15:57:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] drm/xe/hwmon: preserve fan user table across
 suspend resume
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-9-karthik.poosa@intel.com>
 <027a204a-82fe-4146-9e33-3fda70406906@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <027a204a-82fe-4146-9e33-3fda70406906@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0256.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::14) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS7PR11MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e2948b-23aa-48f5-cd63-08df0425c7f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003|5023799004;
X-Microsoft-Antispam-Message-Info: 5OX5TSPE6hjtZgTfRdB1BsyVRZ91cGt9kRtqbbV4zDAoEkaxqV/v1s7T8IEUqMFSru45M4E+yNcT5tT0mtfBo4uiLB5uGnPIzuWNWDmlyJiUroVZCna0BlfGRb4hHJIX1CqmhaWG3lKmyRz34PFCWPgn2XjBmVwgwEpwGzFkGUnULixuzMJZzeIHpQ5ZPTiTJYcnOWjwhYhTwbyNhocM3WxN30OH0j88iX4IwWVLm8LeS4ipbwZvOcamxqltiQLb1oiBaazS+o62UtQFEz3W9aT5VqQisi92mPk3WQ8dKhNjYgdBjjzKEEdngUECgy5EvxeQvJ7OBMnmTcUc342Y1nRtAY47yLbadKVEQuYVqMr4RDbOP8v+kn0/7qhV1+Owg1EpchU6nVePSo/dPGliZX9vi/w3wLCNk/zPn3Ly2suYRU2sVpLZMKwx8fl22HnKISDIoPg9QTamGeY4YwWjn1SvVqWC6L/3pXtRpRe54NygjT6hgT5Ih9qZD4TDU0qE2iLYE7yItCx/RMuhCEWmwQbWJgECcwWmyNsZtczJOstKDyXGBxk3IeFo2jemyoY9P96VrcNUatv783yOFgaa8ZhRxLxRx+T5nvKNq1nTd242eENRFXPIb+ejvyA90AyjzyiQyCVvRlts5SjJKauxfRKZ+4vxW++FufblYWUWJrE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjNpMWxoUi9GWWxQMkVNM3NFMTF1dlhOamRZRlhWUyt3MGpDNVhWRGt3YXpr?=
 =?utf-8?B?a0Y1UTdNeTZNS1htRlNFM29PU09YdllZcGtiYWJrRnNsY0R2Wkk0bGpaazJP?=
 =?utf-8?B?dnhsdkNzc1hKRGg0QlNWWS9UZForTEhpdHVwM1prTnJraDRmMHUyMU5XSGRD?=
 =?utf-8?B?YS9NR1ErekdQb3NNRGp4L21UZFlUWGE4ZWtFSGQzd0dCWXNXZXpsV2xEdllI?=
 =?utf-8?B?WVFRbEtoT1IvTDBtcjdHMW1yQS9RbUlMa2V0Nk9kMEhJdzRnOU9vTm9EdFpT?=
 =?utf-8?B?ckYyM0ZqZVVJT2UzVkRXSlRDZXVHdHl1QVJlclh4M2ZldDlYRTRBd0tsd3lk?=
 =?utf-8?B?UElMOTRlN0I5Mnoza3VzRzZTTzJ0NTBRWndvKzJ5aGkrTWlFRk1aZ3ZDY2t6?=
 =?utf-8?B?MTFKTk45a3l4N1V5L1hJcFE0dFJ4MlE5TDFRdHNKRlFEZWFxMDBVRHZYTTdl?=
 =?utf-8?B?UkFQK1J1cFNuc1ZuQm85UXZ6UUdOekgwZXhSVDVnanBzbVVETjdoZW1XMUY4?=
 =?utf-8?B?VGY4aHNFcVVZL1pkQlowSEppWkUreGZDTkRHOUUwVXREWVc5aFJaTklLTkFE?=
 =?utf-8?B?R1ZXZ0JiQ1QrZW40YlFHUDdCeGpTZ3luVnU1RlJqSnlvTTJVSEluMDRFR2p5?=
 =?utf-8?B?R1FlVzBHNDVrcWtWK3N2anlsOXhWWlhpV3Rwa1l1MitZWEVRWnI5UUZ1bk84?=
 =?utf-8?B?Z1MxV1dHNTJ2bURxNHhuanFDZGJnNlREQnBEYjd4MnJaa3dKYWYycEJtZ00y?=
 =?utf-8?B?RkpsSTBNanNWYnJMMGxENTRRV3lyRENYZGZkdE1sNHBySU5hUnYrM1VISnIz?=
 =?utf-8?B?MEZUVG5IL2ZDQ3BZWHl2dmZ4aUhjdmQ0UjBGcUZTelRKTnJIWWVnVWwxVThs?=
 =?utf-8?B?MnpZL1YrSGN2VFVZQUNub1ZBYVpvc2U1RVdiQTJOTTNTL0E0WnptamFGcTZ1?=
 =?utf-8?B?Qy92Z1lyVWUzMmhSZ0tNN04wUVFzTFhSemZ3d05MaU96b3Y0NzJZeW54azl0?=
 =?utf-8?B?WnNTeXpPQ1FIWUxtbWNRR01TQzdOZndRcTNlQnFVVVdsYWZDZWM3NGV0ak1I?=
 =?utf-8?B?bVZhMm1ON1JMQVZwcW5JdTRyUDUwR2dWdEV2cS9iTUVlODNBVHVDMkpaUzMr?=
 =?utf-8?B?WVArdWlIaHdQOXZLVEs0ejJBSWVLb1lVYlFMSVRrL0lnakRQRjVwaEwrV0Z6?=
 =?utf-8?B?c1plN0NMM3BrVVhGb0M5V2cwZnhKZnMxVWFVcTk2THpHR0IwZ0FtVERwc05J?=
 =?utf-8?B?bzJ6TjZ1S2JxUTVSZ0piUFFtclI5ZUdEYnBoZUs5SlFINmJFbDRwQnB5K3Rk?=
 =?utf-8?B?V1hRSDl6azN5K3lxRGRwcGlOS1F6RkMyNVM1MzVUdG95enVkWXhLcDlVU2tV?=
 =?utf-8?B?UGhrQWFNU2wwaG02azdsOC9JY0NjbWZTZytFcWNUY25PdkFKcElhQkZDMDZv?=
 =?utf-8?B?SFVlVldnUkprVTJQOWNKek9Vd2hsd1RtSWR6TUhGT2h1bWMvTGY2SDFVNlBk?=
 =?utf-8?B?bE05UnFSQ0MxOCsrS3M4SnY1SDl5d2gzUGdXN0M4NStsVGlvKzE0enVjTTcv?=
 =?utf-8?B?TTMrSFZsdUMrWkcrYnc1OEIyTGlRcWlHSGVEZ1ZJdWV5NHpLZzVrN1h6NXpC?=
 =?utf-8?B?U0V2aGd3eTZIQjVTN3BRTjE5UlpJS3ZtYlllcDBPd1VXaWZmWklqcUl3ZnEw?=
 =?utf-8?B?ZEdRaWc0d1Q5MEE1ZXVPc05tNS9BdHpTY01hdXpvNTAxWWlSbHlyU1ExdlVl?=
 =?utf-8?B?T1hxVjdSZlFyZXB1TjJlOVJQaGVoamdzMEYyeWd6L1FoNFl3amdwUkFxNUw1?=
 =?utf-8?B?S0pRWXhLUnluRzNtZ3NUcms5ZXB3cWpNRUFTOERHT1JRWVJaNmZTdEZ2T25z?=
 =?utf-8?B?UXdFYlBaMWR6akxRdEpyVU9IOGZtRUcvY2xYbXN4c2hGUHR1YVFGYUdBaUky?=
 =?utf-8?B?ekp5WFJCeExSdm5HNGZuNEFOSHdha1FmdUlDOFU5UmxCZjZ5d1drUTJoSC9J?=
 =?utf-8?B?SE9sY1J1RGp2dUFmeGNqWVp6QTJMY2RjbHZiSno1SUs3YmNxQmVqTi93Rkl6?=
 =?utf-8?B?ZEJQaXF0UmxxV216N0R2S2xrOWo2TmVlRTlEN1VKazVPeHU4bzF5bjJCeENT?=
 =?utf-8?B?cHBta245b09Vc0VxN0FLZG1XWEo5bnBqakw2YkdIelRTdDhFbzRudzZYN0F6?=
 =?utf-8?B?aG5WVG0rTHpnckJQajBadjN0T1E3Sm1lVXVrdnF4Tzd4WC9Pc3ZldmU2U0tE?=
 =?utf-8?B?U0FvZnRMOU5udEtjZWhFeldTakRQOWlZbmNwaTVKTm9qTWFCdXNIL3FSeXNv?=
 =?utf-8?B?QWxuZTVSa1V5NlZLZHNQRTRVWjVYMGxSamRoaDhzV2FxK2JXdzBBUT09?=
X-Exchange-RoutingPolicyChecked: pyB56Ic9etad0a/ADEn10BdeiqXXz6cNNQ9BsPppOcruCPAlYe9KBNmif9xii0lEKxNHH2O6gC3Oz8vRVu8vqsAToajsIz07cXwbtoTqeATWnVuFhAhS7Wpt5zp27zFcOY2skbKFkfD4dKEZ28BW1ns0QqS7W2E4MSl1hx7n/9JOTJ0nDHQBwmQeUkiKgi74G5l369zxZWDd0sLmzYhdiLlFaABZXOlMzqlx5wZ8x7bs40Qo573wRlW0n0sAiILVW7ShEWRNWHYJvQ/4IHk7brYQYJE780TxcuTjbTL72HwzrrHfba3aZa4XGKT/Ka9iz2cek/q2qqCXlDZSuR+fgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e2948b-23aa-48f5-cd63-08df0425c7f9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:27:22.9736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UTkPKhYdulq9imuJ2sUWFVJp+BmQ/mmFMWRbCrTZMQR4Mdrh/rQXJWREGDk91gUNM/3rZLMvavwyG8rwlwoSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7859
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


On 10-08-2026 11:23, Nilawar, Badal wrote:
>
> On 17-07-2026 09:47, Karthik Poosa wrote:
>> Save and restore active fan user tables over suspend/resume via new
>> xe_hwmon PM hooks, and run restore, only when d3cold is allowed.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: Codex:gpt-5-3
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 133 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hwmon.h |   4 +
>>   drivers/gpu/drm/xe/xe_pm.c    |   9 +++
>>   3 files changed, 146 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 770f07fb6511..65f356c741f5 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -229,6 +229,8 @@ struct xe_hwmon_fan_info {
>>       u8 pwm_enable_mode;
>>       /** @is_full_speed: flag indicating if fan is in full speed */
>>       bool is_full_speed;
>> +    /** @restore_user_table: restore user fan table on next resume */
>> +    bool restore_user_table;
>>   };
>>     /**
>> @@ -2785,4 +2787,135 @@ int xe_hwmon_register(struct xe_device *xe)
>>         return 0;
>>   }
>> +
>> +/**
>> + * xe_hwmon_suspend - Save hwmon state before suspend
>> + * @xe: xe device instance
>> + *
>> + * Save any hwmon runtime state that must survive PM suspend 
>> transitions.
>> + */
>> +void xe_hwmon_suspend(struct xe_device *xe)
>> +{
>> +    struct xe_hwmon *hwmon = xe->hwmon;
>> +    struct xe_tile *root_tile;
>> +    int fan;
>> +
>> +    if (!hwmon || !xe->info.has_fan_control)
>> +        return;
>> +
>> +    /*
>> +     * User fan-table restore is limited to d3cold flows, so skip 
>> snapshot
>> +     * work when d3cold is not allowed for this device.
>> +     */
>> +    if (!xe->d3cold.allowed) {
>> +        xe_dbg(xe, "d3cold not allowed, skipping fan user-table 
>> snapshot\n");
>> +        return;
>> +    }
>> +
>> +    root_tile = xe_device_get_root_tile(hwmon->xe);
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    for (fan = 0; fan < hwmon->num_fans; fan++) {
>> +        struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +        u32 point_count;
>> +        int ret;
>> +
>> +        /*
>> +         * Record whether this fan was using the user table
>> +         * so resume can restore it if firmware state is reset.
>> +         */
>> +        fi->restore_user_table = (fi->pwm_enable_mode != 
>> XE_FAN_PWM_AUTO_STOCK_TABLE);
>> +
>> +        xe_dbg(hwmon->xe, "fan %d user table restore flag set to 
>> %d\n", fan,
>> +               fi->restore_user_table);
>> +
>> +        if (!fi->restore_user_table)
>> +            continue;
>> +
>> +        ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +        if (ret || !point_count) {
>> +            xe_warn(hwmon->xe,
>> +                "fan %d point count read before suspend failed, 
>> ret=%d, val =%u\n",
>> +                fan, ret, point_count);
>> +            continue;
>> +        }
>> +
>> + fi->fan_table[USER_FAN_TABLE].fan_control_point_count =
>> +            min_t(u32, point_count, MAX_FAN_CONTROL_POINTS);
>> +
>> +        for (int point = 0; point < 
>> fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
>> +             point++) {
>> +            u32 fcp = FCP_INDEX(USER_FAN_TABLE, point);
>> +
>> +            ret = xe_pcode_read_timeout(root_tile,
>> +                            PCODE_MBOX(FAN_SPEED_CONTROL,
>> +                                   FSC_READ_FAN_TABLE, fan),
>> +                            &fcp, NULL,
>> +                            XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +            if (ret) {
>> +                xe_warn(hwmon->xe,
>> +                    "fan %d user point %d before suspend failed, 
>> ret=%d\n",
>> +                    fan, point, ret);
>> +                continue;
>> +            }
>> +
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].temp =
>> +                REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].speed =
>> +                REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
>> +        }
>> +        xe_dbg(hwmon->xe,
>> +               "fan %d user table snapshot taken before suspend, 
>> point_count=%u\n", fan,
>> + fi->fan_table[USER_FAN_TABLE].fan_control_point_count);
>> +    }
>
> The above loop appears to save the fan table when restore_user_table 
> is set. Is this required? It seems restoring the table during resume 
> should be sufficient, as the fan points are already cached.
>
> Thanks,
> Badal
Agree, we need not read user table here, as all user table writes are 
cached.
>
>> +
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +}
>> +
>> +/**
>> + * xe_hwmon_resume - Restore hwmon state after resume
>> + * @xe: xe device instance
>> + *
>> + * Restore any hwmon runtime state that was saved across suspend.
>> + */
>> +void xe_hwmon_resume(struct xe_device *xe)
>> +{
>> +    struct xe_hwmon *hwmon = xe->hwmon;
>> +    int fan;
>> +
>> +    if (!hwmon || !xe->info.has_fan_control)
>> +        return;
>> +
>> +    if (!xe->d3cold.allowed) {
>> +        xe_dbg(xe, "d3cold not allowed, skipping fan user-table 
>> restore\n");
>> +        return;
>> +    }
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    for (fan = 0; fan < hwmon->num_fans; fan++) {
>> +        struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +        int ret;
>> +
>> +        if (!fi->restore_user_table) {
>> +            xe_dbg(xe, "fan %d user table restore not required\n", 
>> fan);
>> +            continue;
>> +        }
>> +
>> +        /* Re-program cached user-table settings for fans active 
>> before suspend. */
>> +        ret = xe_hwmon_activate_user_fan_table(hwmon, fan,
>> +                               fi->is_full_speed,
>> +                               USER_FAN_TABLE);
>> +        if (ret)
>> +            xe_warn(xe, "failed to restore fan %d user table after 
>> resume, ret=%d\n",
>> +                fan, ret);
>> +
>> +        xe_dbg(xe, "fan %d user table restored\n", fan);
>> +        fi->restore_user_table = false;
>> +    }
>> +
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +}
>> +
>>   MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h 
>> b/drivers/gpu/drm/xe/xe_hwmon.h
>> index d02c1bfe8c0a..6c6f30208508 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.h
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
>> @@ -12,8 +12,12 @@ struct xe_device;
>>     #if IS_REACHABLE(CONFIG_HWMON)
>>   int xe_hwmon_register(struct xe_device *xe);
>> +void xe_hwmon_suspend(struct xe_device *xe);
>> +void xe_hwmon_resume(struct xe_device *xe);
>>   #else
>>   static inline int xe_hwmon_register(struct xe_device *xe) { return 
>> 0; };
>> +static inline void xe_hwmon_suspend(struct xe_device *xe) {}
>> +static inline void xe_hwmon_resume(struct xe_device *xe) {}
>>   #endif
>>     #endif /* _XE_HWMON_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 99562f691080..23a78fa4a71e 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -23,6 +23,7 @@
>>   #include "xe_i2c.h"
>>   #include "xe_irq.h"
>>   #include "xe_late_bind_fw.h"
>> +#include "xe_hwmon.h"
>>   #include "xe_pcode.h"
>>   #include "xe_printk.h"
>>   #include "xe_pxp.h"
>> @@ -189,6 +190,8 @@ int xe_pm_suspend(struct xe_device *xe)
>>       for_each_gt(gt, xe, id)
>>           xe_gt_suspend_prepare(gt);
>>   +    xe_hwmon_suspend(xe);
>> +
>>       xe_display_pm_suspend(xe);
>>         /* FIXME: Super racey... */
>> @@ -290,6 +293,8 @@ int xe_pm_resume(struct xe_device *xe)
>>         xe_late_bind_fw_load(&xe->late_bind);
>>   +    xe_hwmon_resume(xe);
>> +
>>       drm_dbg(&xe->drm, "Device resumed\n");
>>       xe_pm_block_end_signalling();
>>       return 0;
>> @@ -615,6 +620,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>       if (err)
>>           goto out;
>>   +    xe_hwmon_suspend(xe);
>> +
>>       /*
>>        * Applying lock for entire list op as xe_ttm_bo_destroy and 
>> xe_bo_move_notify
>>        * also checks and deletes bo entry from user fault list.
>> @@ -724,6 +731,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>         xe_pxp_pm_resume(xe->pxp);
>>   +    xe_hwmon_resume(xe);
>> +
>>       if (IS_VF_CCS_READY(xe))
>>           xe_sriov_vf_ccs_register_context(xe);
