Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296001075269
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 12:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6ACC10EAC7;
	Fri, 20 Mar 2026 12:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMkHEnt2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719C910EAC7
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 12:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774010964; x=1805546964;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Il5WmbintWaFxlrzRNZEEamOCbsbsXKgMYkQ4yZZbfw=;
 b=FMkHEnt2QOqgvLV46QPaNHvZM9U6Tv+jZEficSnxp5zxG+UxlD0OW4c/
 HDWQ9ptqB8ypaqfbdhsudGk77UG1BqHr7QPvyemt8F+J36DDOdUOP0Jiy
 ewrmIRTBN7tdxpSQbiNlaovWrDnf+F8PowPodJzkS/uLqaOgVm3grWsXX
 Isocw0KUWZjS6JLkAGPsAsmqKq0YLJhiXvp9WL3rC4j627KUQovi1JaVV
 d0O6tE8fZZBKa/a0+W+8dGMldR5tYI13kK5oZVLTVVmYPkyypYLzIhQhw
 LZDqTB6hAODfcUCME04AsxLEn/WTNkg7IZp6uZ/1A6tx3nykxBvHy0Fo8 g==;
X-CSE-ConnectionGUID: SxwAd9ePTOubpeVttid5jw==
X-CSE-MsgGUID: oIjj7S+4SzOYtn3hsFucqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74976156"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74976156"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 05:49:24 -0700
X-CSE-ConnectionGUID: SyQSCsKtRc2/a/46uBKxtw==
X-CSE-MsgGUID: hIZZFYXRTm2fJ1NbXwpShQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223257018"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 05:49:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 05:49:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 05:49:23 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 05:49:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMV0P9vjpvhHNE5dhjHiOu4rhN+CZqPyT8jPw5/6hhVKmBECCgdtaerID2XxLO/8LrGLuozZeUnlvqzEVGT6W5UX8en1u5U1xVjDFKwyuhouZ7w+gtsEzkmOIRp2hGAwZ75InV0FPIBiZO3HGhoN3RanekFBHv2o9qKQQn/1JbRarliBC6BxSpnbSYC4Q76AaikPfvbZaI1y/z/6RCOPY+eybwh/+jiltfXZL0X7oVb+1/nPGBsMvy1RDCwC8yky7JADkbXjyd01yjeOkAEEx2dXbuX0ygqDCZS17pzCiSmT0MCp4Bad0aIVaN7UnL0CV8fK2Oe/YsgPbwE712EUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kmenhgdSchCJPexs05JaMFwt5zLDkttNYkVAy4dFpk=;
 b=HKMiCcfKNWkEcP8mSpe8Qy9TFejPALY5octCuoyP+dEtVps3+Dp8gu/Lz+5z5iolynh7ycdsh8JRY3vusJFXgtki2z8iDQUfEedn2MECaf6z0+oB0E2+Mc59dmzhcRT/ei1jacyf9O7FjJK69QAvbUKtTRb3NYYt4VCrxILQzdyMzZfAPhF2Y1MsU9dlXH+oXTyS2BaPTz81yPAvaCvz9OSedpMci1twBAYqMTg2za7XoHue6KYyvmCVx3qSmRavOtNX2cI6HVpO+WzSPE1GlMRm5fE9WPCnmTowHYqiU+FSvo4w4AlrDvNvrClQUfd41eVebJ8etQTc26JUbnFENQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA1PR11MB8176.namprd11.prod.outlook.com (2603:10b6:208:452::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 12:49:21 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9723.013; Fri, 20 Mar 2026
 12:49:21 +0000
Message-ID: <51b1b6d2-5f40-4f2e-b2f4-8890e364a7b2@intel.com>
Date: Fri, 20 Mar 2026 18:19:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Read accepted power limit for CRI
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>
References: <20260218114722.2215386-1-karthik.poosa@intel.com>
 <4d6348b7-de39-4cf1-8281-dbd12ec37938@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <4d6348b7-de39-4cf1-8281-dbd12ec37938@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::16) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA1PR11MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab1613d-89fd-4868-75d9-08de867f1b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: MQGtBSHQxXk8PmSFYk8GcEvppZqy7khxP5qHNbu77J8uqOos1MCmMg741naGyfK+9cITEdOYaMykVhea3wbhqvxFED5KZHGpsVACT+Lg0knUpCiY9OdhbqdLtE8nC3dmLx60diwbnS8y+kIqJD2jTr6F14SmJrnxYJWjKIeMk7bDmx8lTHrfSfgLKmfNfR9tr3tAjLlHxQBaU67LUrIJWNZscCilgR5D98unYRUwYUkgGItr1qh+OP87WxTNuQ+PTSJqfEnHq72ooEE9twjJjd08ceBIf0zTYK0T9zSUXG/K0TPLUGRUhLrC7KwymhyOOweKIhYyP57xB0anD/A7TzrzjT/IwX8fDHQqcAgl18usZQRhPDI9cWEbWXJJhqxsIES3w4uYqk+9BfQjIoJmR9saK45lsaMe0GEXM2jpayenTXnQcyL2xGN/qiMzvCwJKlKFhevtOp4LHro6owiuHmYhNxVPgar3RR1RH+d+R7Y1cB40ekmDS8l0LVLuFIs6U6gyjLkX7Oih+UUv7Puq+U9Eo04Q4GN0QgFa2CWxcHRx3bvsL4ZxwMKvBvdMJ9ZWbjXhA+ik5zs2TDg+YZ3P4NLa7kL2iNnW8VkHTGCj8bRlE8+eE4JTBWwUOOC2oyTvLzIwWAwDKqjcrlYFVtzXo6/CPK2Or8ZQnmrAGKnJB3zzO6+cWJQMhvMwPfmtqmW+Qvf9X0StOKZ5fXe00AoHOkGqi59naL3tbpaYFxb2hHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEFiQ3RTV0tCVnk1R2NmVmtZN1ZicmRjYlNwdk14Z2FVdjJETHlmL3BpQjdo?=
 =?utf-8?B?MFFlSDlkMjc4SVU4d2NIa1ZWcG1kOFZ0eGNEVnVvSjJIL2Jpc2pQeG42eTBi?=
 =?utf-8?B?RWhpaFZJeUNuZDZIeXBrSUd1T1ByMnk0dUZwcnhmRVVUcFJ0VWtreHpQUzZq?=
 =?utf-8?B?RWd4eVdpMStzTmNhcHNMZTlBVWpuSkVFcmkvZEZkSWJJeE94L25Xa1NldGl4?=
 =?utf-8?B?WUxGUUdJYWt0bzlZWTZ1clhWNTVTM2xCaVNsZ3NJZzZTME1UNlRuYm5nZEdn?=
 =?utf-8?B?MTMxSE9oWXQwaUxCcEY4ODA5dk5pOGlvUU1jN0FhVWhSdVFjeFkvcEczNFgx?=
 =?utf-8?B?bWtCZXl4QmpJc2hTZk5OY3dEK25VL3ZaSzIzOXBmQnZiS05VdjRrMStPS3NG?=
 =?utf-8?B?MkpGOTFabFlhNFNpNkZjYUdEUWRlaWJUNERvaVdJSXV5WjU5SDhnWXRHR2Nh?=
 =?utf-8?B?WVVyOWJGVTNpdlZWTndBVVZJNDZneVNxbERNN1RRejhjSFo3c25RL3dJZGZj?=
 =?utf-8?B?ZHA1a1kzajFXTVVMK1dBYUZaNXhucVE3OTVhVXFBb1FlN1l4SmRJVFdEbTV5?=
 =?utf-8?B?U0ZQcGxIZjM3MkcvbTljdThleEQ5Y3N2YUlxT1dxd1htTzFUck53SjNQU1lK?=
 =?utf-8?B?K1FLVHNCcmg0a2xRSVdvZ0JnL09xMlRVVm14MVNpNFlCTit3UThTR05JSUhT?=
 =?utf-8?B?bG5xNWFPYW9iTURLNXRFTkZLT3NmcEs4ZlRzbWVvWmoyMHBCZWhYQmlQUFRk?=
 =?utf-8?B?Wk53N3laM09EVHNBazZLZmoranp1eWpFNkpxSHg3bmI1V2MvdEZvNUlMMVd3?=
 =?utf-8?B?QUhNckFKVGhBTHZseXB2ZlZlQlFvSHUwTUNqWURIUlVsZENpbnZCRzEvUkRU?=
 =?utf-8?B?cGtoZk8xcVdENE1mUDY5R2hhRkl4a0ErVGtoNGNLUmVvQmJkSHRyb1gvRXRm?=
 =?utf-8?B?dHlHdzFxcm5yZ1A5Z1dXbzB3Y0JvUmpTaWY3SWVEMFdvVDdKdFRCaDNGUHVK?=
 =?utf-8?B?NGo2ODFsOVYrNkkvNXFueElFeXBvT010RWxENk0rZkZ1dktpL3pJWVQ2L1U5?=
 =?utf-8?B?a00xYzBjS1RndDI3YkNSbTdaYW96djNYdW1WNHFiZVlRUy8rb1BvcFdmaVZh?=
 =?utf-8?B?MzJINUlJdVMrR0FrWFpKc21RWkJOeWc0Q3pTaGlETWdySmV5U1dYZWdtZkpj?=
 =?utf-8?B?MWpPcDltNUtKNmtBY29HakZKQlEyaFJpN2lJd2FuNldDR2lPSUplTHhOOC9w?=
 =?utf-8?B?czdWZ04wa1NRemJBazBKTGMyWmxZLzRtNTZXcFhkc2g0bytHMXh1M1VuR0xJ?=
 =?utf-8?B?YlUvT0g5UUZ6UzY2OE5sNXRKdnlCR3FNV2YxdEI0R1dqV0kwS3lKcGdOaUtn?=
 =?utf-8?B?eDhJNTgyWHBuMmdHbFlBNlFIRHdJL2xxOGZDZitzOVZwaTBmRHdWMWpCR2pB?=
 =?utf-8?B?OHBUMHNlWWZIU2xaMWdsMlkwV3J1VWVGV0ZSZEx3NVdNZnFVa3JIYTNCV3d4?=
 =?utf-8?B?SWcvbDY2V1FlYmZHdWtaNVRQN3pYcUZZb2hQNStlZUpRam1IQ2s1UHNua3c0?=
 =?utf-8?B?OXVEY0pmUjNVdWltVUswRUZ6OElCbDNWSC9wZVhCb3JiREZJK01BZ29VZHZV?=
 =?utf-8?B?bTA4dlUyRTVqcWwxTTNvOUdCVUh1WDVXYkxJUDJwZW5UTGM2NENNL1VRTkkr?=
 =?utf-8?B?SEI3L3czN3NjcEdFNENtYVRqYldjK0NNUjIzSGJWYjhvR3lGakRyTVdLWXlY?=
 =?utf-8?B?V1QvLzRNc2dGRmE5MVBBVzU2cGQ3NHYzclg0L3JRWXUzRXc5cFJrY0RWQ0pM?=
 =?utf-8?B?amx1RktmMTJFWGovZndqYUV3aFZZbVNDOEpsYjZ2bTNxQkI2RDZGaHlRcDFC?=
 =?utf-8?B?dlNVSXN5WHlObEh3VnRhUFBUaEFNTmR5c3ZlRlMvSWRUSmNYeTRYSTZTdTdZ?=
 =?utf-8?B?dDFjTElRTFZYeEV4ckx1YjZSUWFMc1BBRXhVVk9TUXhnVktpMGljaEh1VzNC?=
 =?utf-8?B?YUtLNGUwUnlncUhSRDh3emVxR2tSUTh3RElOcGozK2x3ZGNvUEVXZjRiWE81?=
 =?utf-8?B?STJPSzAyVFZCTjJVODRzNjErT1pxV05qeFFzZm5DbVlDeGpZT1Fva2xFUGU0?=
 =?utf-8?B?T0JZaUFWaUZNQ2NLSnJNcXJycjVsaXNSSW14Rk83cWxVTE9UUG1PZ2xNaTZ2?=
 =?utf-8?B?WkFNL0xlRWpmQkhMV3l3N0FDb1NOK0VYKzFmYXBQbnBwYzVRQzRlM3V0YzBN?=
 =?utf-8?B?UjluYzRTV3dZTHhxZWk4cmFINUNONHFHTWFSZXo2Ym9rSjd0VWMxTUk1UmlR?=
 =?utf-8?B?Y3VkYjRxajVOVE1ZZHFYSlo1WjIvRTdRMUo0UjgxY3BBV2lrWVpOdz09?=
X-Exchange-RoutingPolicyChecked: bzaVB759pPr+fzAIZ7DTti7MvkexsFo+vN8H+jmudrMbrSWKZYgEuzX5yz0nr6ZIZEjqkBDgvJWTE7CtcCR6+z+J+VIiG0vu2ctvWv9x0WNZK0aeIJ92jbQ44Dp5ixeuIGbX2l19Xox7m33bGs+eiGjG751BIjSfjh4JX9k+kZaBuZ+gf9inRbUDdAK0Gbk5UcMcZKtFDKnx9gowslyRPvFHJj1eEAuWGwuJW0PUExL19PYIX1p9bAosrXC3NO70/MkcNSnCV1kTPEQ4lnH59AgEIrWNG9hWEZcl4u6AG7GgJQKJ07a7tL7F5KGzMKHoBCUiih+fXQ8nB45RzM2Kbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab1613d-89fd-4868-75d9-08de867f1b0c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:49:20.9813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kV99//y+byP/wKIHJSKVnGZAaViDlgLkaUaCz7wjWAVMT/HKi2BVg/t+sy1+QSCJvskmXNv5Ou6LcTzSXOvwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8176
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


On 12-03-2026 15:58, Nilawar, Badal wrote:
>
> On 18-02-2026 17:17, Karthik Poosa wrote:
>> Update xe_hwmon_pcode_read_power_limit to read the accepted
> accepted by pcode firmware?
>> power limit using the new mailbox param introduced from CRI.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c     | 5 +++--
>>   drivers/gpu/drm/xe/xe_pcode_api.h | 3 ++-
>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index baf277955b33..8e1cbf7afed0 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -192,8 +192,9 @@ static int xe_hwmon_pcode_read_power_limit(const 
>> struct xe_hwmon *hwmon, u32 att
>>                             READ_PSYSGPU_POWER_LIMIT :
>>                             READ_PACKAGE_POWER_LIMIT,
>>                             hwmon->boot_power_limit_read ?
>> -                          READ_PL_FROM_PCODE : READ_PL_FROM_FW),
>> -                          &val0, &val1);
>> +                          (hwmon->xe->info.platform >= 
>> XE_CRESCENTISLAND ?
>> +                           READ_PL_RESOLVED : READ_PL_FROM_PCODE) :
>
> I think this handling is needed in xe_hwmon_pcode_rmw_power_limit() as 
> well, especially when writing PWR_LIM_TIME.
>
> Thanks,
> Badal

Yes, adding this in next revision.

Also, adding an API to prepare param2 for power limits below.

+static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon)
+{
+       if (hwmon->boot_power_limit_read) {
+               if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
+                       return READ_PL_RESOLVED;
+               else
+                       return READ_PL_FROM_PCODE;
+       } else {
+               return READ_PL_FROM_FW;
+       }
+}

>> + READ_PL_FROM_FW), &val0, &val1);
>>         if (ret) {
>>           drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, 
>> val1 0x%08x, ret %d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 85cc7478b787..636b9dfb11da 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -47,8 +47,9 @@
>>   #define    WRITE_PSYSGPU_POWER_LIMIT        0x7
>>   #define    READ_PACKAGE_POWER_LIMIT        0x8
>>   #define    WRITE_PACKAGE_POWER_LIMIT        0x9
>> -#define    READ_PL_FROM_FW                0x1
>>   #define    READ_PL_FROM_PCODE            0x0
>> +#define    READ_PL_FROM_FW                0x1
>> +#define    READ_PL_RESOLVED            0x2
>>     #define   PCODE_THERMAL_INFO            0x25
>>   #define     READ_THERMAL_LIMITS            0x0
