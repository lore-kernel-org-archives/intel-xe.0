Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB01CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 09:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D7311B1E1;
	Thu,  4 Apr 2024 09:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6XpK5hh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E589511B1C0
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712224505; x=1743760505;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OUgVNvJ8cvcLSxR1+5MtGAxOFap4j570xvn1/cq9Ino=;
 b=O6XpK5hhDDGSSStn6WS1wzd8r3v++DhEdwF2vBUvYDB5AdpvQiNHlqXN
 SnyRjHsABxJNHBNUatV/+bHWyQ0+VWsTlHhlAnaoPN17LXPe1DTGpfMWB
 1TWL2kyMbcEvOSqqFAzuuICSooWDzydKu0UQbEmwiLTNhosyJ2zEaMXix
 6pjQR78LGeAe5P4byw4JjM4nzH4uU9fFQvwnrp3XnrtE7EH5iLc6rHLiv
 oOYu/AzKFK66H6tpCQ53odhDGB9PYssApFUJ4s3mrd5R8t2hI51BfU08J
 NH91D+FTQHfrgQru08d21d3FVcppKmmLXsFOfPeeGFmeBLl72P1rZalLj Q==;
X-CSE-ConnectionGUID: 00uoj4FhQ5qbC3cRdQ7sww==
X-CSE-MsgGUID: GTfCBwiDRKKbD3gkiylmjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7336604"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7336604"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 02:55:03 -0700
X-CSE-ConnectionGUID: reDw6dkJTQWATvG7qWrUBg==
X-CSE-MsgGUID: AmqG5+AZRPm5SEpFQA7sRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="49948596"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 02:55:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 02:55:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 02:55:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 02:55:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiORsO7toKBpraBq21IwmRJiZK7Ut6tDNqZbO/PMhZRzzvfpwEwFyOnn8ccYUCi2tTO4CGH7pGCLMbxYYodeSV8+g6MZ8fG/Hk+NHY2zVGuQT0p7ObxWXnGHUWJf5sc5asVz6HwAqnRPJ8YUIg9AMDyvZ5Zo2vH08MFD31H7dnJIWWgN8UPF4AaHB9Hkg6GQG5atkyuK8jf0kblyrgFCTSWL7FKz+d+SWM67HYlzpD4QjNVCCeyqXZ7jGRq7yJLRlV96fRkwvJ6CkVMMtTKzFN05C4xMBnS0JRZgGmvIN8IWWpQiibKHR1NQTUieTDQqP0GTTfUl39+PLGfdlKdraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZ5PKp4sQgdAjKJ9KGY2eu+yyXtP4MkbvmgpZq3IPRw=;
 b=YcUegcMIGY3k8F8Tp8nfYFm5yDu9UEwPci+Tu/hNNPBxZIcMfJQVul2YEEbKzq2zRPLEQL7SNXjuwkg7HbQUVG2RaC9/hiyf0tE7Zoybh8TiY0rZSdj+kf658wFCbHiFHDI3tZo3FgFUQrIGb0XiSO88y7tVIy0t2A72uCnCA/tdIKTswqRviQGPjySHgrgta3AN92UpmCp/WJUmjKHE+khZlXVnyf9Ad6La/ZIAjjXKzKiRwCcXSuWl6nTek/w7z85LoshH3sCOe/70gg0d1B60sttzbiCTrFPiaRh0KwRqfoucg8ckuxnUJc0kfCJ/1DpHGleZur+8ekUZCEUsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 4 Apr
 2024 09:55:00 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78%5]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 09:54:59 +0000
Message-ID: <c652b81a-fd71-4d15-abb9-a598118676bd@intel.com>
Date: Thu, 4 Apr 2024 15:24:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/xe/hwmon: Update xe_hwmon_get_reg to return
 struct xe_reg
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
 <20240404035441.965590-3-karthik.poosa@intel.com> <87plv5cy7r.fsf@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <87plv5cy7r.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|IA1PR11MB8248:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Umrg8XR/HqFzRVAOHIpL9VcAuiirG8p7aM7QxvvD9X00vC11BnYEryK6QbL2voezM65YTUAcwR5Z7C6l0izdqFi8uHwHsgfoK7c13TsNXeNYN9XEvBOGAfJ3qOqIe6S7ePqtjn9U+UW5nkh1xTahe7gjf38uF3q/zPuybAEIqdda9ElMWeUuEujr/Uw80b2bPWkkJ1fILQqiTY/q+r1jueuUKz8JWL8VNAkbJossWWgXiwhyye0YztRm5PwO+D9NfxgxhUQEyS0ywaHmg1y9DxhygB7LJjHXKqKSZPh/SzIgVpFnPW11uSe97wKB5o6QHWmOyctxyaJac9+jki+xH32XrKRTzzs42A7X1hcK6yB+2QFgPfKiDh9ofXyZ4RJEx/aibhbq8zgl85se0Djz7r4FdGz8Z9RFLT5rHmDlSW7U6VChpX99crzeWhbb2m9dn97rKDaWpdX65F2JdfWRgGphFv+Ihpfo0gQdE9bZcG+srEwmXs1GdfzPHjZG8jsqhm/t05N2XTxih2CtwI5Z5tsJoO0Bb6MsHRU5nQ2hf25r0gcB/MuhqAspqRVbc1hSMFqTfMg19ZgkzJ9RNgA+zP6rxWAfN9r8IWhTAOs8kFvdyjXnDJ1LTfEhPc84xThhg+TflEN/HtqzUJW4iENRw75LkNjIj9HYPQpas+z2Iog=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjFOVDJhR3Q4S05GTnBnT0xDVmJ0cmRUU2hLOTE3MnU2MHNkV2p5ODVrdDFv?=
 =?utf-8?B?Sldoc2NBZGNvVy9xd3FVcE5MdjdRT2ZjT25nb0thMm1wMHk0OVRMS1lmTkxG?=
 =?utf-8?B?bmEyM1lqeUtDdk5QQkN2Qk4vcTdBUnE2d2dOdGI4TUZaZWhxbURUd0FodStC?=
 =?utf-8?B?YnVhTWJKRERXRkFaTDUrbElVSEpaMmR5aUN4REZXMEhrcUdqb0owTElZUU1a?=
 =?utf-8?B?MVZUZUNVUkszYjI0c0tHQStUMThVTWQxcFd0M242dmdHejRvWjBLYldNY29K?=
 =?utf-8?B?TDBRY0k1UmoyOVNoR040eTBqWkxtMjl6UVZCaFZYbFVyTWFKbHliMG9JYTZU?=
 =?utf-8?B?dUt5WExmdmZSeGhrSXVhOVVLUkl6c0VtQmJ5L28zZmQ4Y3Eyc1Erd1JyRDhY?=
 =?utf-8?B?UVJoTVpQZFBUR0V1SUZIelNjOXRGUFhtSGNxSEVVMTNTSjBuWVllSCswWlRv?=
 =?utf-8?B?bktXbTdPVC9ZcGhmWkhIRUZvN21GaDNzaER4SGMvakpjUlVIZVZNWGJQNWlF?=
 =?utf-8?B?V3pPdS96TnJMaWYxZStkYmN3dVc4eGZVdnovejFCTlNPMWJMd2F4RDc5dCti?=
 =?utf-8?B?cU1TYkhaWUxaMDFBdHdSTjBYdUdRNVlMUlEzeC85YVpqUmZPdmd0aG4xUVdV?=
 =?utf-8?B?bk1SM0JOMU1yclcwb2xOTTM3OWszMk1reXJ3UCtxdFVtbE1kOGFma1AyaGk5?=
 =?utf-8?B?UFpGYlppMmJCdHplNDVhQkYyRzJwTDNJVVRzYTlPR0VIa3VaU0JKdW4yRE15?=
 =?utf-8?B?aTVoY2ZkYno0SW5HaGgzWHR0SGFmN0g1QUhDbUVxbUp5eFZMVkR1VWM0ckZF?=
 =?utf-8?B?OXNXcGg1bHk5NWxJWkFrMHRKWWdkZERrWmR0dWVNdFZSMmM3eDZkeVhkSis5?=
 =?utf-8?B?S1R5UEdoVmprK0VWcHc0Z2lnU3kvVHpwNE9jcTlSbTN1Vm81eWpGYXZYdkVz?=
 =?utf-8?B?UzhCaS9KdlQ1bXVvbHRBT2hOcUJNb3BjWlpPUy8rV29wSXZ0MTdkSmdFY0lx?=
 =?utf-8?B?RVpGam54UG5zL0Y1ejhpUHVKRzlBRmcwa3c3K1d0bjRaZW5jWDlwSnFrT3g5?=
 =?utf-8?B?RVIya1RpRFFQQ0phbUxrNzNNU0lKcGw3VUNwZ1F5K1Z6dkcxbE0vK0Uzb040?=
 =?utf-8?B?K0NiMXNnbS91MHBIb2hwYkltL0RYaytXR3pzR0YrS2dqTmFJWVluSFBLT2dr?=
 =?utf-8?B?WTI4M0Y3K0ppN2p5RFArN3dGZ1h6VzVVN0VLWjdzMnovZkc4QUI0V3E1WGc4?=
 =?utf-8?B?VkYvL0ZYeExQNkQxRmZQWllHNzFjY215cjJGRzRXVWNkeUU2QVJlZEJwSC9H?=
 =?utf-8?B?c2JZNEVkNmIyNFd3Znl3UTJiV0l6aXVSYWtZWWVjandKeWJWd0VMbTF1dTRs?=
 =?utf-8?B?Zk1ISTJ0NGlvRUl4STdLZUdmRXV1a2IwVVd1aEtFWUpEOGVBdkZGekIwU3Fm?=
 =?utf-8?B?YUU3UWdyVVFVMi9mdjlpUFA2RUhNd2grZUZCdWl1VXRkY3pnWXNRN3hRM1B4?=
 =?utf-8?B?dXBxQ2NSb242ei9CdXVvb1NlSXZIMmtWVzFZZHkxYzZYcm9zS2s2WGx1VkNw?=
 =?utf-8?B?QS9Zc2FwVXF1Tmo0QVRVUklSb2lYakViOTZSZzZ0UjVWQ05GUUtLbkxTc3Nh?=
 =?utf-8?B?VDF5bVhIakk0MVMzcnRDMjNxUHZKWVhHWkZtNnlWeHd1U0ZTSmNlNWcydGNi?=
 =?utf-8?B?ZnViL3VrZjJJZU5vTVQzUDBsL2RsUDZUY2hjMUM1bjhUWVZsVmh6cDlMa1NF?=
 =?utf-8?B?cFU4bXZxK2lTcEtmemUvZElDY2dFbUZvM1QvekhsNEFBQ0NtRVIzVEkvUmFo?=
 =?utf-8?B?Y2IvbkxTZnIrS2c0VGxYMDdCZlNQV09JSnVkUzh3NUxSSG5STjR4KzdBMWFL?=
 =?utf-8?B?alZoL3V3SFk1MFNqeVFJK1dtTHNiY3pzY0xDNTcwbGJjK0FjcmxZakFMQUVw?=
 =?utf-8?B?Mkd6NENOWE9INUVJWCt2dzYzN2dzQlRBUnJCM1BzVE9uV2RoZ0VDdEtDTDl2?=
 =?utf-8?B?L3V5dnpKMWd4dEw5TEk1VUZiZmdFM2l6eEQ2d3ZueWR0UVdQU1lvNy80Njl3?=
 =?utf-8?B?NUhlc2dUYVRCc0pZZ0hTbDY2K1hxeTVRb2sxVFVUWlJwTEJQNm02Mjd1Ukc3?=
 =?utf-8?Q?LA/9IxpTiWwoNQzvjfOScvHoF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6ad86c-4a3f-4cae-52dd-08dc548d4a6b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 09:54:59.8777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TWW5AeRXmx6VNX7XL7kvONfG+5QL2TRt4iH+lovk87AYt4hSXQP7B1e6xQS0RZQSkmMI5WyL1GZB8hC6caO2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
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


On 04-04-2024 14:16, Jani Nikula wrote:
> On Thu, 04 Apr 2024, Karthik Poosa <karthik.poosa@intel.com> wrote:
>> Return register address as struct xe_reg from xe_hwmon_get_reg
>> instead of u32. (Lucas)
>> Use XE_REG_IS_VALID() from caller to check returned xe_reg. (Badal)
>> These changes are done to have abstracted usage of struct xe_reg.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 47 +++++++++++++++++++----------------
>>   1 file changed, 26 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 7e8caac838e0..2385f05d9504 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -79,46 +79,46 @@ struct xe_hwmon {
>>   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>>   };
>>   
>> -static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, int channel)
>> +static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>> +				      int channel)
>>   {
>>   	struct xe_device *xe = gt_to_xe(hwmon->gt);
>> -	struct xe_reg reg = XE_REG(0);
>>   
>>   	switch (hwmon_reg) {
>>   	case REG_PKG_RAPL_LIMIT:
>>   		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>> -			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
>> +			return PVC_GT0_PACKAGE_RAPL_LIMIT;
>>   		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>> -			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
>> +			return PCU_CR_PACKAGE_RAPL_LIMIT;
>>   		break;
>>   	case REG_PKG_POWER_SKU:
>>   		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>> -			reg = PVC_GT0_PACKAGE_POWER_SKU;
>> +			return PVC_GT0_PACKAGE_POWER_SKU;
>>   		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>> -			reg = PCU_CR_PACKAGE_POWER_SKU;
>> +			return PCU_CR_PACKAGE_POWER_SKU;
>>   		break;
>>   	case REG_PKG_POWER_SKU_UNIT:
>>   		if (xe->info.platform == XE_PVC)
>> -			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>> +			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>>   		else if (xe->info.platform == XE_DG2)
>> -			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
>> +			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
>>   		break;
>>   	case REG_GT_PERF_STATUS:
>>   		if (xe->info.platform == XE_DG2 && channel == CHANNEL_PKG)
>> -			reg = GT_PERF_STATUS;
>> +			return GT_PERF_STATUS;
>>   		break;
>>   	case REG_PKG_ENERGY_STATUS:
>>   		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>> -			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
>> +			return PVC_GT0_PLATFORM_ENERGY_STATUS;
>>   		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>> -			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
>> +			return PCU_CR_PACKAGE_ENERGY_STATUS;
>>   		break;
>>   	default:
>>   		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
>>   		break;
>>   	}
>>   
>> -	return reg.raw;
>> +	return XE_REG(0);
> You might want to look at i915_reg_defs.h, which abstracts away the
> magic 0 as the invalid address, and provides type safety for the reg
> validity checks via _Generic:
>
> #define INVALID_MMIO_REG _MMIO(0)
>
> #define i915_mmio_reg_offset(r) \
> 	_Generic((r), i915_reg_t: (r).reg, i915_mcr_reg_t: (r).reg)
> #define i915_mmio_reg_equal(a, b) (i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b))
> #define i915_mmio_reg_valid(r) (!i915_mmio_reg_equal(r, INVALID_MMIO_REG))
>
> BR,
> Jani.
Lucas, do we need similar abstraction here ?
>
>>   }
>>   
>>   static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>> @@ -127,9 +127,9 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
>>   {
>>   	struct xe_reg reg;
>>   
>> -	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>> +	reg = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>>   
>> -	if (!reg.raw)
>> +	if (!XE_REG_IS_VALID(reg))
>>   		return;
>>   
>>   	switch (operation) {
>> @@ -400,7 +400,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>>   
>>   	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
>>   
>> -	ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index) ? attr->mode : 0;
>> +	ret = XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index)) ? attr->mode : 0;
>>   
>>   	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
>>   
>> @@ -496,16 +496,19 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   
>>   	switch (attr) {
>>   	case hwmon_power_max:
>> -		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel) ? 0664 : 0;
>> +		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> +				       channel)) ? 0664 : 0;
>>   	case hwmon_power_rated_max:
>> -		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel) ? 0444 : 0;
>> +		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
>> +				       channel)) ? 0444 : 0;
>>   	case hwmon_power_crit:
>>   		if (channel == CHANNEL_PKG)
>>   			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
>>   				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>>   		break;
>>   	case hwmon_power_label:
>> -		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, channel) ? 0444 : 0;
>> +		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
>> +				       channel)) ? 0444 : 0;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -588,7 +591,8 @@ xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   	switch (attr) {
>>   	case hwmon_in_input:
>>   	case hwmon_in_label:
>> -		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel) ? 0444 : 0;
>> +		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS,
>> +				       channel)) ? 0444 : 0;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -612,7 +616,8 @@ xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   	switch (attr) {
>>   	case hwmon_energy_input:
>>   	case hwmon_energy_label:
>> -		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, channel) ? 0444 : 0;
>> +		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
>> +				       channel)) ? 0444 : 0;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -763,7 +768,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>>   	 * The contents of register PKG_POWER_SKU_UNIT do not change,
>>   	 * so read it once and store the shift values.
>>   	 */
>> -	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0)) {
>> +	if (XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0))) {
>>   		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
>>   				     REG_READ32, &val_sku_unit, 0, 0, 0);
>>   		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
