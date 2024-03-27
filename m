Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B00C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 04:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6648710F7F8;
	Wed, 27 Mar 2024 04:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7LmqnKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8805C10F7F8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 04:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711515120; x=1743051120;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qGEMn0b6YHwizm71Hry0fDKX5f9JyuSIVCqgFy/+zRM=;
 b=R7LmqnKW7WwkAwHwrB5NOh/0eXZsnrWmZpAwuBXk5NU+lDT7W34TL+DM
 XzwzjgEuih9BGa6cQeUJ5zKctYuZ0g0BkkV4wQIjOYpBf3SJbB9g2OrND
 QDdtDA3QuUG82AYX/BGrrr6hNvLjxc5zISWXt7z8Uo3IAViokF+EtlhUm
 Xm0vzALecoHeIOe4Uiug4V3IoSn4vAEqeLxyyRAc4TdcQLV5vk279cHlQ
 rhZF5hYweMTITojrGA+u22KmA63lZrujxv0aj80+foV+5zn0rPWILfskT
 hjcClgkSEAxiaM7CXletYiW+mBF/epOLt6SnMhsZUQUkc6zRywhidcHez w==;
X-CSE-ConnectionGUID: TCyqISghTVm3VebLrKA03g==
X-CSE-MsgGUID: ipDpLF37TZ68V2lVLcI8LA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17140976"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="17140976"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 21:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="16105058"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 21:52:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 21:51:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 21:51:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 21:51:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGBSs2oJOmj9JSJi3Zy7Xpftde/FULAljZP4Fak/may/3SFq5DhIzlfWkhoMPhrZUtiRuSVlH6uaGjXvrNQJ+B1rH5fbXHUPeBwkPPdtp4D8qtevZFLUuTdTcM2sb3hxOOtUNHA+O1YATwVxlHYFLaZ3aCr0rGbkTYwnAG1iXBDUz8+N2hWPZu2FziHPowK7oG6eEzuKoxs5CW7U6dL4fhrym2MU5/D+D/lNeLmNs7H8tIHeKFpzIuI29cWJmiFFDQPgQczcMny+wsvD0BAMNUPg0mctv1s93WZ3ukAloHzW/oTMNOWRaOf3FOBgl3aBikQ1J8EbMAR1x9fObJ1Xiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wshnuO0n1W6vK2HkX2PhXY36S3MdZNmBiH7lPgtokk=;
 b=MThced4CcNrOnR1lhu7bbuZDSCVMpnsyVWbxvEbA2b5pG9z7DHanCY6YLd/UekvjqUcdRhnMd/NnIDcByu+lmsI5Oz9EL5CDm1P+/SiwLTi8U3O7DQHnkAXvp1zHbDg8tiXG51I/aqH3CJrCZKCc23PKy0ZWRqYBGuhONYhVG9k6tpPA3oNwKupsarkWxP6r4gcShE5/j0jYOx8rHjbq9Br1cROT33/OJCi6UWwrcHeywmAU5hr1wDnvLZGZCaWTdKz1pTOClbaFbGtpIdkXzB8Imxxo7H7lCiMt29Aag/3qxdsrRKXzv8sPACtnSyIrsh9Fuas+Ay46uFNgS14dXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 04:51:57 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 04:51:57 +0000
Message-ID: <9bc34436-a90a-4c3e-a461-50cc639475a2@intel.com>
Date: Wed, 27 Mar 2024 10:21:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, John Harrison
 <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
 <20240325150435.2967536-3-badal.nilawar@intel.com>
 <29f52749-032e-469e-9cae-cad1f01896fd@intel.com>
 <2636ee70-1b30-4f05-8448-3453d8f7e155@intel.com>
 <97e2b27c-4d1c-4eae-8902-5dd84702995d@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <97e2b27c-4d1c-4eae-8902-5dd84702995d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH0PR11MB8085:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQAd6vdiyInxmHdk2HweYovoC46effvLul2E0WTuo7T7dO96KBCspfea3KZnUHxfQvUXapQIxcPulOlevRkfDQiX6FXyFnog6ujoMXZ2YQgVBt0YDU2BGSvOsG0Z28IKD9UvCLPRvwBV8bRPNE+/NJSQmYsNsefvr86Y9w5oVRfadNMtPITNl0eq6Suyvxx1XuxkNYbtQT1ipV4Vwk8c4H5sCB6dTG2ctmRdENBdSXd2v3/2l/HhNk38OAezcJ8A/1azHCbvLiAxiEXEgh4NL3ltR2xC2ZxgJiPwcRD+pMTuKqHBHxMcTy5IzLzs4FrlyXfZbjJKTBH9iD6aBEGagndqzT5NmwQlarFmFgMIEUhY0HE7tJ8ObAs7WQZd/kczj9cnwQa5C/rfYskZjatizZoPMWFrb+yFI+SogHwAIr4hWD48BoOrmiXmJ019uk9yxBRZKz3v/DNInkZtwuKANl4eg8z7zX9xEQ3XmVoFpO4E7YzOK6HdPMqT5JIzpzUOmAvENOFfwYpb0fwOqHBOKgsnRjE1gHLeUp611rFqxI+WziwWuL3bnwiQwoH4mTh6vkfM8pliCz1Sesexo4Pb6wYt9WAuJrKug7KvVX7AVw/8VkodPMpD+kz8KTqXH7zQ3LziwO3eXZd03ECYCimLp50d56v5z8wwNRRbJboLd0o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzNyczlKOFlCSjNnSEVnUVkvWWlnZndWZHo3U0J6eE9wWkswQUcwUy9oQXYw?=
 =?utf-8?B?WmdDKy81eXV0TjFLVHBBbjdSMUFuRjN3bFhyUnZhQXhRV1FhQUhBRmMwUkR1?=
 =?utf-8?B?Q0NZZXc3Rkd6UmJtem1lNFVTUTlHZSt5MlF2YzRoVWR1MFhUQUd3bTNNbWl2?=
 =?utf-8?B?ODg5NHdDZzFpMGM4TFptTkFiVzVPQkl2U0VINTZZTVl1cm5TL20xdTZXNHQ2?=
 =?utf-8?B?L3BBaEpJS1FYTTNueU0zUU5nTWwvMFBTejZNOHpUY0NBbjBycWlZdHJiZjNE?=
 =?utf-8?B?QndWaURCWWs0a2Q2SkJlOFI0KzRrZHJDeGZxWk1NY0JycU9rQ0xxcVl0SGNI?=
 =?utf-8?B?aTVoaUJLNFBwM2Npc3QwL3VxdyswS01SK2N3WDZ2N1NLZ1RSaC9EOWFyU0RJ?=
 =?utf-8?B?UEd4YU9ScGQwd09uWElJZloyaUN5MWRsUGtmbzVOTHlYVXEvQk11ZUd3eDdo?=
 =?utf-8?B?c01DeWp5djFQY3dpZDFhRXNER2lwNE1ib1hOdWJzNUViR3hnallyZjE4UFNT?=
 =?utf-8?B?T2pXUFlJcTFuQ3ZUWkZPVWdNSnhHSWZDa1hjRER6VDFrUVBMUUVNSERFQWlk?=
 =?utf-8?B?Zkd4bUN0bjVxWGQydXlQdWp3eUs2K1FscVk1NWI3VWkxTXlLQ2JQQ0NoNzlK?=
 =?utf-8?B?Ym91R1hMMTJuc281T1VwYk8rRE9UUUtOczZ5UkFIRFZROWdIRnRxaDFRc0hP?=
 =?utf-8?B?WDk3UTdCVXQwUzFyRlVYRGhEMko4aTIwaG5HT2pLMnFCcTVPdy85NGxhQlhm?=
 =?utf-8?B?aTY2QWVqYURHcG4rTFVpWTRPUXNZY1FWQ0RmWnNVcGJ2QnF0UEtNZXA2aXQx?=
 =?utf-8?B?WE9YMXBFZGpPWE1rbDZZLy9MMzE2OHViQzFYamNONVAyZ0JXQ3NBdEJUYm0z?=
 =?utf-8?B?NXZ1TDJMSm5ya3kyOWtUOU5RR3JYS2pJVlJPL3VwZU41dEYyNjRaajJ2cDBw?=
 =?utf-8?B?d0JYeWY4Y0ZJN01rcXFER2tBNGVrZEthYTZicHlkS1N0R0ltQTFUVWpabEpV?=
 =?utf-8?B?SFFVeW1FeklyVE13a01ZOVVERDZITy9KcjRjbTBWTnFHSUMydkkrN1d6bHkr?=
 =?utf-8?B?QWsrZUMzekxMaVIxamxWU3lNeUNrVVNJQUN0aEJ1U1hGRXhQTitKLzFSb0J3?=
 =?utf-8?B?bzVXT2lTQWhxL3VKK2dlQXpsMzVNSWJYMmtoU0JBT0hHcDNQclpSV09RYWcv?=
 =?utf-8?B?cFowcDZidzMyeHJZMmplVTZlbTdjQnFqSmVMQlpTbFZ0dEZRM3Ayb0RnUTNt?=
 =?utf-8?B?VDhZbThQS2UvYXoyS0hBOStCVFBSVlpVVWZHclRuLzJrQi9CajFtMzhObzJw?=
 =?utf-8?B?azhyU1NZbXYxWmlxSG5GRjcxVzVEUEdUN25ZUVBOWkwvbUYzRmFXZ3FpMHhY?=
 =?utf-8?B?TTZ5NW9UNlRCZ1BmZTJuSFZpYmpQZEM4US9xN1BoMHVEaGw2NVFBZ3AxbXVE?=
 =?utf-8?B?Q1h3SjBiYk1yOXU1M3QwV1VZdmtRajMzQzJ2ZVd5dlhWSCticWNBcGhjK2h1?=
 =?utf-8?B?QytEUmROZTlaNXlRQmFvV1Z0ZVRwTm8wK2JCNWlFNUdqcXhMZXVwelkvTzgr?=
 =?utf-8?B?di9BM3JRRjZ1NDlqOFA2NERrOVN6c0NST1Z2bDA0TVU0dUx3emZjY1BYV0Iv?=
 =?utf-8?B?dmdJa0lYcGRzK2gwTENHb3hPM3FBMG55RkVNWFAyRmF3L1A5c0lIS0o5azV1?=
 =?utf-8?B?VEE2bFZkMjY3QXJDU2g0cjhySjhQaU14VHdnaEMyck10ZHFnQU81S0V0Z09x?=
 =?utf-8?B?SE1FRm16eGJtK2ozcmFhcDRoY0xVVWpxVXZoaHFTZ3RnTDRldTNyTnpDcFN5?=
 =?utf-8?B?WXFlSXgyM0U5QzA5bm1hKzlUdkpWQndCYlNjNDNzUTgwMkZRaVVMRGNaVVVw?=
 =?utf-8?B?eHBod3dRTHhESmdWZUVBS2dtcUJ4Ly90SjhicFQzUENDUHpReElJM2h5T0VI?=
 =?utf-8?B?bFF5NHdLVkRGam9lM1hlYTQ4Q2prYmt0dGVRQ0NjbW5YbXl4cE9MMTZMdVo5?=
 =?utf-8?B?R2xQd1VyZ1VxSDF0L1g0Z2luNVhOSUpSL1ZXSHBDV2cxNjEzdTgzUUM1SVI1?=
 =?utf-8?B?ZGZTaCtTa2huRjk2eDlRUDkrc0VWWlZlQXMvZVZySWczdlRERXlCQkhRUkZ2?=
 =?utf-8?B?ZGpyZVg1eWZsa2FPbFlDcmFwaUNvYm5GS1RFbllmZWNDSzhSNGExeTd5TnhK?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e13f73fe-8969-4c71-d41a-08dc4e19a188
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 04:51:57.4895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykwcmlGfLyvL4pBurEKXmLDn5sG12L/rm51UC40es9NGGIgMlb3QiO4Nu0tQ/UwxfAwtCpwIfq7Edxk6c3Lpjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
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



On 26-03-2024 16:51, Michal Wajdeczko wrote:
> 
> 
> On 25.03.2024 19:56, John Harrison wrote:
>> On 3/25/2024 08:32, Michal Wajdeczko wrote:
>>> On 25.03.2024 16:04, Badal Nilawar wrote:
>>>> Enable GuC Wa_14019882105 to block interrupts during C6 flow
>>>> when the memory path has been blocked
>>>>
>>>> v2: Make helper function generic and name it as
>>>>       guc_waklv_enable_simple (John Harrison)
>>>> v3: Make warning descriptive (John Harrison)
>>>>
>>>> Cc: John Harrison <john.harrison@intel.com>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
>>>>    drivers/gpu/drm/xe/xe_guc_ads.c       | 41 +++++++++++++++++++++------
>>>>    drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>>>>    3 files changed, 40 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> index 0400bc0fccdc..5dd45e06f0b6 100644
>>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>> @@ -319,4 +319,11 @@ enum  {
>>>>    #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY    0x8a0b
>>>>    #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN    1u
>>>>    +/*
>>>> + * Workaround keys:
>>>> + */
>>>> +enum xe_guc_klv_ids {
>>>> +
>>>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED
>>>> = 0x9002,
>>> how should we know the LEN of the particular W/A KLV ?
>> By reading the spec.
>>
>>> as this is the ABI header, IMO we should define that here along the KEY
>> I strongly disagree with copying the entire GuC API spec into the source
>> code just for the sake of copying the spec. The implementation of this
>> w/a (and a whole bunch more that will follow) has no use for extra
>> defines about sizes or fields. And creating defines that will never be
>> used is a pointless exercise.
> 
> but without those defines in ABI we are using plain numbers in code:
> 
> +	u32 klv_entry[] = {
> +		/* 16:16 key/length */
> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> +		FIELD_PREP(GUC_KLV_0_LEN, 0),	<<=== hardcoded 0 len
> +		/* 0 dwords data */		<<===
> +	};
> 
>>
>>>
>>>> +};
>>>> +
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> index a98344a0ff4b..633e5fd9c738 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> @@ -7,6 +7,8 @@
>>>>      #include <drm/drm_managed.h>
>>>>    +#include <generated/xe_wa_oob.h>
>>>> +
>>>>    #include "regs/xe_engine_regs.h"
>>>>    #include "regs/xe_gt_regs.h"
>>>>    #include "regs/xe_guc_regs.h"
>>>> @@ -19,6 +21,7 @@
>>>>    #include "xe_map.h"
>>>>    #include "xe_mmio.h"
>>>>    #include "xe_platform_types.h"
>>>> +#include "xe_wa.h"
>>>>      /* Slack of a few additional entries per engine */
>>>>    #define ADS_REGSET_EXTRA_MAX    8
>>>> @@ -279,23 +282,43 @@ static size_t calculate_golden_lrc_size(struct
>>>> xe_guc_ads *ads)
>>>>        return total_size;
>>>>    }
>>>>    +static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>>>> +                    enum xe_guc_klv_ids klv_id, u32 *offset, u32
>>>> *remain)
>>>> +{
>>>> +    u32 size;
>>>> +    u32 klv_entry[] = {
>>>> +        /* 16:16 key/length */
>>> drop this comment, code is self explanatory
>>>
>>>> +        FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>>> +        FIELD_PREP(GUC_KLV_0_LEN, 0),
>>>> +        /* 0 dwords data */
>>>> +    };
>>> you can define size here:
>>>
>>>          u32 size = sizeof(klv_entry);
>>>
>>>> +
>>>> +    size = sizeof(klv_entry);
>>>> +
>>>> +    if (*remain < size) {
>>>> +        drm_warn(&ads_to_xe(ads)->drm,
>>>> +             "w/a klv buffer too small to add klv id %d\n", klv_id);
>>> this looks like our programming error so xe_gt_assert() should be
>>> sufficient as we don't expect this ever happen in production
>>>
>>> but if you want to keep the WARN then use xe_gt_WARN() instead
>>>
>>>> +    } else {
>>>> +        xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>>>> +                 klv_entry, size);
>>>> +        *offset += size;
>>>> +        *remain -= size;
>>>> +    }
>>>> +}
>>>> +
>>>>    static void guc_waklv_init(struct xe_guc_ads *ads)
>>>>    {
>>>> +    struct xe_gt *gt = ads_to_gt(ads);
>>>>        u64 addr_ggtt;
>>>>        u32 offset, remain, size;
>>>>          offset = guc_ads_waklv_offset(ads);
>>>>        remain = guc_ads_waklv_size(ads);
>>>>    -    /*
>>>> -     * Add workarounds here:
>>>> -     *
>>>> -     * if (want_wa_<name>) {
>>>> -     *      size = guc_waklv_<name>(guc, offset, remain);
>>>> -     *      offset += size;
>>>> -     *      remain -= size;
>>>> -     * }
>>>> -     */
>>>> +    if (XE_WA(gt, 14019882105))
>>>> +        guc_waklv_enable_simple(ads,
>>>> +
>>>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>>>> +                    &offset, &remain);
>>> hmm, it looks that your implementation here in patch 2/2 is different
>>> than suggested one in patch 1/2
>> It looks the same to me. It has simply optimised the the offset/remain
>> calculation to be done inside the helper rather than outside it to avoid
>> replication when all the other 'simple' w/a's are added. The actual
>> behaviour is identical.
> 
> still you can move this 'optimization' to the comment in patch 1/2
> 
> alternatively reconsider the need for this comment in patch 1/2 if you
> drop it immediately in next patch 2/2
Sure, will remove calculation part. Will just add /* Add workarounds 
here */.
> 
>>
>> John.
>>
>>>
>>>>          size = guc_ads_waklv_size(ads) - remain;
>>>>        if (!size)
>>>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> index 48cdba1cbf95..a8d15f004b6c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> @@ -19,3 +19,4 @@
>>>>            GRAPHICS_VERSION_RANGE(1270, 1274)
>>>>            MEDIA_VERSION(1300)
>>>>            PLATFORM(DG2)
>>>> +14019882105    GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>>
