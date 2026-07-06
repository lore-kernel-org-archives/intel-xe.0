Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71188C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 05:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6A610E74D;
	Mon,  6 Jul 2026 05:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MistLAHf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBF810E74D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 05:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783316461; x=1814852461;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+8sqn9lRdtXcEBCwE+SHuOWd0tA01l+INGRfeG+yRLA=;
 b=MistLAHfKDM0LWxFFxeXM+lXxQc+uof9uJGcAAZfknZxcyvFW4re0byr
 h3xA/tHUlXwr0/l4YF1aVIwk5twPv+cTuffK/1qciVebyb54YaV3JK3yK
 jO7lhqYGocykOqL3tYSXCZr0evFUEz/kg6lyCz6YUAV/ZLj3lBxjLkbpJ
 CHtr71sFcsoKGE0Nj8n55PqwWNMXzLMhCUtPAYx38Tpkyj+Qizey5J5Ly
 2cyjMhB5XDn7IYJUwcBoLlXjZ/ghJaSGfRWDGIJZ7pvsEew0cRG4qRsiV
 Wb+buAHXT4AyihtfUFEWKZcfXpSXSQKAA9M+o9TCgoWizBabObftkjHjh Q==;
X-CSE-ConnectionGUID: egQa4C56QLqKr3rn/kidQw==
X-CSE-MsgGUID: kkPuB2BwRmOusJsbJ3Pgjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83802411"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="83802411"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 22:41:00 -0700
X-CSE-ConnectionGUID: ipk0KVZkQ5+bhuSGNrMmAw==
X-CSE-MsgGUID: BspEyYnHRzmHy5zIrhJVOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="291765499"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 22:40:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 5 Jul 2026 22:40:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 5 Jul 2026 22:40:52 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 5 Jul 2026 22:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Af6384ir3y+n13z5E11ZZZPrNHw8TtZVAu7Ai4PPTiyRSHEGzMSfDihvvhyGKWC8tpdIgiNsJv72qG9wObf+WZRLxwB/1HRJDAoiThDQoccHWhaaQwMRXon2wSO9CVyFthiYKyTlWksRCk3RGOS1SuDREQEL+nZg5YAHS5PPKZM3+6Xn0qL8ultN6hD9vUaeWvEhdamtTgMpUslLsKasyjp/wgeALshQ5+74tQy2Fl1Hqge36YsCjBWPn+qpZBGmacJJAHVIin6iGgbCOTNCkO/l3xTOQjPuH2z0neGijDGuuyy03oSjVTuZAJZ6DW19MxrplNUK7QEBby7/KZroQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cq749JcQZLdeCAFt8hJ86MJB1B07DD/NcHWAlikdO/Y=;
 b=uGyAlOtD/HW0v+jZbstx/z+W/z7uGuHXobhXY67dC2n3SMclqSsF+zawc/KX9x3Kn34Xbt9DezCqORJbWZOpU7jD7xUlogKptQ28ovmJ1OvaIQqxyJpJzICIKOVrYxfT8BzD0VO9aWOXlimjiXiXV+kmUv4dzOkMg3qFIR2SmwerffRAvWzXjWUm/fr86EtJth0TyJsoEXXZ4ZJmUUbLzk43+9Q3PZKFsP3brWdrTkXSpaJFerm0oG+F8huBrvHsU+fivRTdy+AI61yvGgmnbwMXVMQrXAiKj5fXH+QV2wctqtPZ6Px2pY59REgs3zVuFPQ1wDjte88ZOEkrZwnpMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA6PR11MB690409.namprd11.prod.outlook.com (2603:10b6:208:5e4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 05:40:50 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 05:40:50 +0000
Message-ID: <ff884f89-c924-49fc-9a73-48c2333b223f@intel.com>
Date: Mon, 6 Jul 2026 11:10:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260618061053.3307213-3-soham.purkait@intel.com>
 <20260618061053.3307213-4-soham.purkait@intel.com>
 <0b45c835-b31c-414d-881e-361bcba934a6@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <0b45c835-b31c-414d-881e-361bcba934a6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA6PR11MB690409:EE_
X-MS-Office365-Filtering-Correlation-Id: 45746b5c-d1c2-4b27-fb41-08dedb212326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|921020|56012099006|3023799007|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: cLqaIB9bANviNHI2bhXITMbYQWmrJ50URI447yMSEAkbtrv2sbIgVLaAdBcsVfz+GmsN7vx/12Zc4feyllqqudDtGnLAMheRTAeOZsneUskxnPg5revQyvDKvrf63xAdK4pIJa3AwKeo6SIJYXGgKpdfS2WEJUQcvkPUfh0Guwj6x50nEZC12nRTGFcsx2Jay20P9jG0Eb107VFfux1GttXOVCEOp3xJgFal0WOyFOMl+6hijzPe/KPt6gXtMtcJRKnFZHiNWzUJUPXjnLB8MdSRNS3a8J1GxXH8zGoAYBA2MMgrugcvyHCtdlApUdX9rG3qAHmInwFc1X93UWeLblK7cvQiOx4haLjLyoSFV4k7cr+d1/6YdrK1JrLU/LGGw3BEemJ3HNNnJM899Am90xQnwUECFYtR951jyXJzSfg6OCxeRLH06HTmkmmlMhxpdDrh3+/dX1XZflTKqa2TLsE640eViblJAsQWgpBQ62tzytaoDGY0DTB05n7DpluxOQcN3q+ItDTYHT7Ci3csYYuxgOP6oZgG6VZeq2634v6PFsZwlKvJgP0jgkxx/CSxQsuiuxfh7XCDHdj1KSgR+c5hlWslSSBoHZB/GwhIi+uUksWO2EL9NoN7PFp4XJ0FemHbesvYwokKiwf9GOiSdT11QYoqaUlJxwKc3XLAbf/GjgbAmD+xY0OC6ZqiLVDSV3RUPz+HrlLHwN9Kxe15jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(921020)(56012099006)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDNqTlNtSlkxdXQ1RGZhMTFEV1NkdkFKUExTbkN3d2FsbnU4dUFkMnVUVThT?=
 =?utf-8?B?MitmRW4wVXBFTHVPR2lMTnYyb1R5UlUwUTNEYVVjaUhEWEpSeXZUallmRDhY?=
 =?utf-8?B?bEJhc3pUWTE4MGFxMWFTa1BJak1yRksrMlJhVUxkdjh1K243TDM1cWR1RFRP?=
 =?utf-8?B?NldwU09BeFlYdndZdE1rdFNKNHg4LzRpK211dXZ0UVl5dTQySkk1bktHQ3Zl?=
 =?utf-8?B?OThqYklGU3VzWGhDKysrbnNHeXBOYkZRT0ZwMkwrWjNPVmI0NStvcldsZHI2?=
 =?utf-8?B?UWcrTCtFdHpMQUMwZHRiSkwycXJwS3VkcnRBYkhmekpYRDhuZThoc09mL1dh?=
 =?utf-8?B?WWNheEw3dlR0U1E5UGhmaFg5S0M5N05HU0F2YXhGOFFKZERNeXlmSytEdFpB?=
 =?utf-8?B?M3g0RUFKd3czNlA0Qm04enZackI4czJMNVNsZEE4RGpnSGZJVTRXMW9LMm0r?=
 =?utf-8?B?QUZOOENBRzlwSU9zcnJTc1crUDhhY2lraWlGS2lQeGhiU2tlcVZxVXNsNUZx?=
 =?utf-8?B?dTRFYUFqaTl4WlBQOHJiajArRktIUi9mZm5VNlcrUit5WUdUZzJjM3lSQ0VG?=
 =?utf-8?B?b2R5Mkc0OXpkdU1IWDEzaW10ZEM0cTZtT2NLQmpPVER3WE9KaXdmRjRHYmNk?=
 =?utf-8?B?U2ptbmtsZEZVZ2xvN3FnOEx2VFZCV3l4ait6OFBpc21abHF2UXNHNDdGME01?=
 =?utf-8?B?cG56YjV2RlNtd1VDdmJCa2grV3k3NGQxOVNEQ0owRnMzU081RWJpd05ueFZk?=
 =?utf-8?B?bUJZS1U1ZGwrMmNkYW82V01xL1Q1dk94a2RhNVFWODBSSkNUencxcUU3aWZD?=
 =?utf-8?B?bHJGNHpPN2s4MWVhR05jSmUvVWVvQVhtWnNpdUhlc1ZNb1YzbTRySEhURk1x?=
 =?utf-8?B?Z1Q3NjVxUnBTb2hMQmxYWERkeHdxNXV1VFdvVC8zWktweTh3UnVESzhDSTRh?=
 =?utf-8?B?TEM5Zy9rNy93QWR1WVU0aWVZWjhvWVFqa3V4N2NwSkh1OTlCamh5UjhhRTJG?=
 =?utf-8?B?MW5rMUpYNVA3RS9KczZZd2U5Nk8xei9lOUp5RkljR2tINGRDSmttS1Z1SEdi?=
 =?utf-8?B?ZHB6KzRtL3R5UzdmZWZXUTlUN3NwVjg3Qk1QcDU5SnRJK0JYbllXTFJpOG9Z?=
 =?utf-8?B?VFJURWh5TGRsdGluOTdqY0h0cmhUcEFKS00xSm5GR0t6aHRSTUZrbE5td25E?=
 =?utf-8?B?K3k5N3cxdWZWM0t2RTVBMFMyeWgxMk5CUUhuQXdBMHdiVUlBbnY1dUkvOFJU?=
 =?utf-8?B?aXZJcG41TjFpZzc0dWZ3Q1kxd1ErcDdORUVZRDdaTklCNThjTWZWWlhhbmxW?=
 =?utf-8?B?Ly9tSy9Ic3BUVUNtS05oTVlySTlCMHg3S0k2WmhCT3hvOU41aXJNczFJY3Zq?=
 =?utf-8?B?RkJlYStsZ0hqZUFZT0Zyd0U1YVB1dmZzQ1BnL1R3ZXlaTjZqeHI1cGNUeDZm?=
 =?utf-8?B?eUxHVWRoVHFYUHdkc1N0RWpBN0FlbVZDcHpsMzFkRFh5Snd6VkdodmdpUDBP?=
 =?utf-8?B?QzBnQStlS3dyWEFBVTRSUjVrYTB0d3Bra05qc09McitPZHVJcTR1Qm1tN1N4?=
 =?utf-8?B?YTFkOW1hTGZnMjRjVUxFeTN1bEh5SitRU0ZaVlovVjVJbTh3S3NQNGN0ODFo?=
 =?utf-8?B?eFB3aWlBMEV5Q2VvN2JENldSNjFmdktjbUxsRzFHdlFVdDJmRnlxZW9OT1BJ?=
 =?utf-8?B?ZEMxVDMrODNzRTU5K05raDFZN0FUVEpCVWpoQWhLMTA5dTZYOHlvbDArR3FI?=
 =?utf-8?B?Y0NhcHJCSUkvb0pCZWd5NFhEYVV3dTZsVDZ2Nmt0Q1V6N2x4aXBTZjAvaVJH?=
 =?utf-8?B?VGxoM2FmQURZWDUwZFRES2ovMFV5Sy9ZdTNudjhFU0gvcm5md0lRb0RGT1NG?=
 =?utf-8?B?L0pMbnZvbDBXVVozTDJOKzNXYW41MTZSWTIxODg3WEpnMmVLekZ5TkE4TDNl?=
 =?utf-8?B?UXhWc1ZnRWdwd0F1WUtKS1NLTCszNy9zVUFjc2JPQUtYY1prWjFXU0JFc3hG?=
 =?utf-8?B?d1RabmthZXI5RjhKcEFpNVFxR3oxWUhCa0VmMUtKZlM4OGZGalVPdDZXTG1v?=
 =?utf-8?B?Q0ptTEsvMXFnVWlnTFdPWmtXREUzRE5jNUZJNElwMlVHWE9qbDlQLzFMT2M4?=
 =?utf-8?B?cE9GbTBNc1ZtQXhDZ2F5bXpjTmF3V09ndXFWMHBtZWl1U2FUNWZwNnBNR2xF?=
 =?utf-8?B?UHBBOVZnNHo4dHZDTkdSSGFCT0R6QU00czd2bldsV2R5Z05UYWR3RTFkMGo5?=
 =?utf-8?B?ZHdXQ0FJbmh1VUtCVExqajhUeXR0VG1KWGpSa1BzZGpkZGIzUjFMQSs3SVZn?=
 =?utf-8?B?R3BHYnBHSjkreWR1TDVrVlZPTStaTGNkS3g3aW5nVk1jdFJYbmM1UT09?=
X-Exchange-RoutingPolicyChecked: si8Pzzj1pDQ4iqJ1Okg1ffaU6egfsLCeFaIsUhrsUs+k0xp1aX2R1RXo6D53LPCDMQfn3GMXbX3PFCLUr24ziyelZOt6h5SEBllK5eCZoMEe9VZ+19W7RCl8PdKCyIbHJgkkc42Vw0UgzKjsJvRNpGKB0amKLY/nHsK8s7Ff1+rnfuPrMs1XUKutrQ/CaXVNp/Bf+KX08OM0pqi5gbpxKiVw5PiQpN8b+XkXa4+CvihGpRep0JOxIelUKC/tB10OrnkrSPvmMR5RdYwV9FWXvP1uG5R7fCG+uVY85alnD5oa5xk+8LGm3N9p6iE0V1kChZQYmr2D1+Wq5/MQHjdvsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 45746b5c-d1c2-4b27-fb41-08dedb212326
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 05:40:50.5354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 177oRsZq8fXoxti8sbTCFg8Nm9AW5p6zmUFZXI8QuD25IFlHKG4YemVD+pu/KUNpz8KwmbeCzI+Me3msE53EAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB690409
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

Hi Riana,

On 18-06-2026 12:06, Tauro, Riana wrote:
> Hi Soham
>
> On 18-06-2026 11:40, Soham Purkait wrote:
>> Add a sysfs interface that reports the current GPU health state and
>> lets admin users and management tools update it but is readable by all
>> users. Requests are routed through the sysctrl mailbox. The interface
>> is present only on platforms that support the GPU health indicator.
>>
>> The interface is a single read/write file at the device level:
>>
>>    $ cat /sys/.../device/gpu_health
>>    ok
>>
>>    $ echo critical > /sys/.../device/gpu_health
>>
>>    $ cat /sys/.../device/gpu_health
>>    critical
>>
>> v1:
>>   - Add enum for health status. (Andi, Rodrigo)
>>   - Return error number instead of error message in _show/_store. (Andi)
>>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>>   - Return only the current health state for sysfs read. (Andi, Rodrigo)
>>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>>
>> v2:
>>   - Make logs and structures consistent with their counterparts. (Riana)
>>   - Drop unnecessary variables. (Andi, Riana)
>>   - Add correct KernelVersion. (Raag)
>>
>> v3:
>>   - Add missing blank line before #endif. (Badal)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 +++
>>   drivers/gpu/drm/xe/xe_ras.c                   | 177 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h                   |   1 +
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  61 ++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>>   7 files changed, 304 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>> new file mode 100644
>> index 000000000000..c7f2cf8bb6ad
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>
> Why is this under testing?
It is a new sysfs interfaces so starting in testing/ per kernel 
convention and graduate to stable/ once the ABI has proven stable across 
multiple releases.
>
>> @@ -0,0 +1,30 @@
>> +What:        /sys/bus/pci/drivers/xe/.../gpu_health
>> +Date:        April 2026
>> +KernelVersion:    7.2
>> +Contact:    intel-xe@lists.freedesktop.org
>> +Description:
>> +        This file exposes the current GPU health state and allows 
>> the GPU
>> +        health state to be updated.
>> +
>> +        This sysfs file is present only on Intel Xe platforms that 
>> support
>> +        the GPU health indicator interface for RAS. Reading the current
>> +        health state is available to all users, while updating the 
>> health
>> +        state is restricted to administrative users only.
>> +
>> +        Read returns a single line containing one of the valid 
>> values for
>> +        the current device health state. Writing one of the valid 
>> values
>> +        updates the current device health state.
>> +
>> +        The valid values for the device health state are:
>> +
>> +            ok
>> +                The device is healthy and operating within normal
>> +                parameters.
>> +
>> +            warning
>> +                The device is experiencing minor issues but remains
>> +                operational.
>> +
>> +            critical
>> +                The device is in a critical state and may not be
>> +                operational.
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 4cb16b419b0c..b7efd607aadf 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -4,11 +4,14 @@
>>    */
>>     #include "xe_device.h"
>> +#include "xe_pm.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>>   #include "xe_ras_types.h"
>>   #include "xe_sysctrl.h"
>>   #include "xe_sysctrl_event_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>>     /* Severity of detected errors  */
>>   enum xe_ras_severity {
>> @@ -31,6 +34,16 @@ enum xe_ras_component {
>>       XE_RAS_COMP_MAX
>>   };
>>   +/* RAS response status codes */
>> +enum xe_ras_response_status {
>> +    XE_RAS_STATUS_SUCCESS = 0,
>> +    XE_RAS_STATUS_INVALID_PARAM,
>> +    XE_RAS_STATUS_OP_NOT_SUPPORTED,
>> +    XE_RAS_STATUS_TIMEOUT,
>> +    XE_RAS_STATUS_HARDWARE_FAILURE,
>> +    XE_RAS_STATUS_INSUFFICIENT_RESOURCES
>> +};
>> +
>>   static const char *const xe_ras_severities[] = {
>>       [XE_RAS_SEV_NOT_SUPPORTED]        = "Not Supported",
>>       [XE_RAS_SEV_CORRECTABLE]        = "Correctable Error",
>> @@ -50,6 +63,33 @@ static const char *const xe_ras_components[] = {
>>   };
>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>   +static const char * const gpu_health_states[] = {
>> +    [XE_RAS_HEALTH_STATUS_OK]        = "ok",
>> +    [XE_RAS_HEALTH_STATUS_WARNING]        = "warning",
>> +    [XE_RAS_HEALTH_STATUS_CRITICAL]        = "critical"
>> +};
>> +static_assert(ARRAY_SIZE(gpu_health_states) == 
>> XE_RAS_HEALTH_STATUS_MAX);
>> +
>> +static int ras_status_to_errno(u32 status)
>> +{
>> +    switch (status) {
>> +    case XE_RAS_STATUS_SUCCESS:
>> +        return 0;
>> +    case XE_RAS_STATUS_INVALID_PARAM:
>> +        return -EINVAL;
>> +    case XE_RAS_STATUS_OP_NOT_SUPPORTED:
>> +        return -EOPNOTSUPP;
>> +    case XE_RAS_STATUS_TIMEOUT:
>> +        return -ETIMEDOUT;
>> +    case XE_RAS_STATUS_HARDWARE_FAILURE:
>> +        return -EIO;
>> +    case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
>> +        return -ENOSPC;
>> +    default:
>> +        return -EPROTO;
>> +    }
>> +}
>> +
>>   static inline const char *sev_to_str(u8 severity)
>>   {
>>       if (severity >= XE_RAS_SEV_MAX)
>> @@ -91,3 +131,140 @@ void xe_ras_counter_threshold_crossed(struct 
>> xe_device *xe,
>>               comp_to_str(component), sev_to_str(severity));
>>       }
>>   }
>> +
>> +static ssize_t gpu_health_show(struct device *dev, struct 
>> device_attribute *attr, char *buf)
>> +{
>> +    struct xe_ras_get_health_response response = {0};
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_get_health_request request = {0};
>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>> +    enum xe_ras_health_status health;
>> +    size_t rlen = 0;
>> +    int ret;
>> +
>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_GET_HEALTH,
>> +                  &request, sizeof(request), &response, 
>> sizeof(response));
>> +    guard(xe_pm_runtime)(xe);
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret) {
>> +        xe_err(xe, "sysctrl: failed to send get health command 
>> %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe, "sysctrl: unexpected get health response length 
>> %zu (expected %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EIO;
>> +    }
>> +    if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>> +               response.current_health);
>> +        return -EIO;
>> +    }
>> +
>> +    health = (enum xe_ras_health_status)response.current_health;
>> +
>> +    xe_dbg(xe, "[RAS]: get health:%s\n", gpu_health_states[health]);
>> +
>> +    return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
>> +}
>> +
>> +static ssize_t gpu_health_store(struct device *dev, struct 
>> device_attribute *attr,
>> +                const char *buf, size_t count)
>> +{
>> +    struct xe_ras_set_health_response response = {0};
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_set_health_request request = {0};
>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>> +    enum xe_ras_health_status health;
>> +    size_t rlen = 0;
>> +    int ras_status;
>> +    int state;
>> +    int ret;
>> +
>> +    state = sysfs_match_string(gpu_health_states, buf);
>> +    if (state < 0) {
>> +        xe_err(xe, "[RAS]: invalid health state '%.*s'\n",
>> +               (int)strcspn(buf, "\n"), buf);
>> +        return -EINVAL;
>> +    }
>> +
>> +    request.new_health = (u8)state;
>> +
>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_SET_HEALTH,
>> +                  &request, sizeof(request), &response, 
>> sizeof(response));
>> +    guard(xe_pm_runtime)(xe);
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret) {
>> +        xe_err(xe, "sysctrl: failed to send set health command 
>> %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe, "sysctrl: unexpected set health response length 
>> %zu (expected %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EIO;
>> +    }
>> +
>> +    ras_status = ras_status_to_errno(response.status);
>> +    if (ras_status) {
>> +        xe_err(xe, "sysctrl: set health command failed with status 
>> %d\n",
>> +               response.status);
>> +        return ras_status;
>> +    }
>> +
>> +    if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>> +               response.current_health);
>> +        return -EIO;
>> +    }
>> +
>> +    health = (enum xe_ras_health_status)response.current_health;
>> +
>> +    xe_dbg(xe, "[RAS]: set health:%s\n", gpu_health_states[health]);
>> +
>> +    return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(gpu_health);
>
> Do we no longer need admin permissions?
It requires admin access only for setting the health status and any one 
can have read access as DEVICE_ATTR_RW() expands to 0644 permissions 
(owner rw, group/other r).
Thanks,
Soham
>
>> +
>> +static void gpu_health_sysfs_fini(void *arg)
>> +{
>> +    struct device *dev = arg;
>> +
>> +    device_remove_file(dev, &dev_attr_gpu_health);
>> +}
>> +
>> +static int gpu_health_sysfs_init(struct xe_device *xe)
>> +{
>> +    struct device *dev = xe->drm.dev;
>> +    int err;
>> +
>> +    err = device_create_file(dev, &dev_attr_gpu_health);
>> +    if (err)
>> +        return err;
>> +
>> +    err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
>> +    if (err)
>> +        return err;
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * xe_ras_init - Initialize Xe RAS
>> + * @xe: xe device instance
>> + *
>> + * Initialize the RAS GPU health sysfs interface.
>> + */
>> +void xe_ras_init(struct xe_device *xe)
>> +{
>> +    int ret;
>> +
>> +    if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
> Remove SRIOV_VF. Not necessary
>> +        return;
>> +
>> +    ret = gpu_health_sysfs_init(xe);
>> +    if (ret)
>> +        xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, 
>> err=%d\n", ret);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index ea90593b62dc..8acfd0ffe48e 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -11,5 +11,6 @@ struct xe_sysctrl_event_response;
>>     void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>                         struct xe_sysctrl_event_response *response);
>> +void xe_ras_init(struct xe_device *xe);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 4e63c67f806a..535841b8d037 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -10,6 +10,21 @@
>>     #define XE_RAS_NUM_COUNTERS            16
>>   +/**
>> + * enum xe_ras_health_status - Device health status values
>> + *
>> + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
>> + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is 
>> still operational.
>> + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and 
>> may not be operational.
>> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
>> + */
>> +enum xe_ras_health_status {
>> +    XE_RAS_HEALTH_STATUS_OK = 0,
>> +    XE_RAS_HEALTH_STATUS_WARNING,
>> +    XE_RAS_HEALTH_STATUS_CRITICAL,
>> +    XE_RAS_HEALTH_STATUS_MAX
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Error fields that are common across 
>> all products
>>    */
>> @@ -70,4 +85,50 @@ struct xe_ras_threshold_crossed {
>>       struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>>   } __packed;
>>   +/**
>> + * struct xe_ras_get_health_request - Request structure for GFSP 
>> GET_HEALTH
>> + *
>> + * GET_HEALTH takes no input parameters; the reserved payload is 
>> kept to
>> + * preserve the firmware wire layout and allow future extensions. The
>> + * driver must zero all reserved fields.
>> + */
>> +struct xe_ras_get_health_request {
>> +    /** @reserved: Reserved for future use. */
>> +    u32 reserved[2];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_health_response - Response structure for GFSP 
>> GET_HEALTH
>> + */
>> +struct xe_ras_get_health_response {
>> +    /** @current_health: Current GPU health, see &enum 
>> xe_ras_health_status */
>> +    u8 current_health;
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_set_health_request - Request structure for GFSP 
>> SET_HEALTH
>
> Why caps?  Remove GFSP.. the group already has gfsp
>
>> + */
>> +struct xe_ras_set_health_request {
>> +    /** @new_health: New GPU health to set, see &enum 
>> xe_ras_health_status */
>> +    u8 new_health;
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_set_health_response - Response structure for GFSP 
>> SET_HEALTH
>
> Same
>
> Thanks
> Riana
>
>> + */
>> +struct xe_ras_set_health_response {
>> +    /** @status: Status of set health operation, see &enum 
>> xe_ras_response_status */
>> +    u32 status;
>> +    /** @current_health: Resulting current GPU health, see &enum 
>> xe_ras_health_status */
>> +    u8 current_health;
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +    /** @reserved1: Reserved for future use */
>> +    u32 reserved1[2];
>> +} __packed;
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index 3caa9f15875f..9507f68bc2eb 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct 
>> xe_sysctrl *sc,
>>       return 0;
>>   }
>>   +/**
>> + * xe_sysctrl_create_command() - Create system controller command
>> + * @command: Sysctrl command structure
>> + * @group_id: Command group ID
>> + * @cmd_id: Command ID
>> + * @request: Pointer to request buffer (can be NULL)
>> + * @request_len: Size of request buffer
>> + * @response: Pointer to response buffer
>> + * @response_len: Size of response buffer
>> + *
>> + * Helper function to build sysctrl command to be sent via 
>> %xe_sysctrl_send_command()
>> + */
>> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command 
>> *command, u8 group_id, u8 cmd_id,
>> +                   void *request, size_t request_len, void *response,
>> +                   size_t response_len)
>> +{
>> +    struct xe_sysctrl_app_msg_hdr header = {0};
>> +
>> +    header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
>> +              FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>> +
>> +    command->header = header;
>> +    command->data_in = request;
>> +    command->data_in_len = request_len;
>> +    command->data_out = response;
>> +    command->data_out_len = response_len;
>> +}
>> +
>>   /**
>>    * xe_sysctrl_mailbox_init - Initialize System Controller mailbox 
>> interface
>>    * @sc: System controller structure
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> index f67e9234de48..fb434cc165b2 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> @@ -23,6 +23,9 @@ struct xe_sysctrl_mailbox_command;
>>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>>       FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>>   +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command 
>> *command, u8 group_id, u8 cmd_id,
>> +                   void *request, size_t request_len, void *response,
>> +                   size_t response_len);
>>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>                   struct xe_sysctrl_mailbox_command *cmd,
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 84d7c647e743..f82e3fb9b5ef 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -23,9 +23,13 @@ enum xe_sysctrl_group {
>>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>    *
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
>> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>> +    XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>> +    XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>   };
>>     /**
