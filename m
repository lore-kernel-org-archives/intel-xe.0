Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78AFCA5FCE
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 19:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957AC10E145;
	Thu,  1 Oct 2026 19:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVo0bR/U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8053D10E145
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 19:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790881376; x=1822417376;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SF4v9QBIFZAiT65+6oV5qB2E35DGdcM9g314TNSf8xw=;
 b=TVo0bR/UaKrvWu/fCH1/ykjtTx88ZWcEJlY57pF9sajTxiO6G64v6MJ3
 avimIHxTBjexx/hu77nvNfixHji4BNYwTSP3RNeY8ElJjmMaOeBMmCdyS
 p4JwBY2kWGzNH6xWZBN5e9o77x3NDea3MfbQJUplcml82ftgTuCuNrAv/
 BakQ6N8AicQFqzSaFnPK5XiPDm/Zcxd9RoGkGqfnO74M1QjsDaJjr8HHO
 hzG9E53JL7Z9orCOBu3PV/pSN17kr5tOj4ElB2LBz0ErzG5sRdahWROFh
 K7pVkosoJUjXD6OeKEZbgvWIeojCNo/d+5aFU8CRzKB1UrITLWNro1Da2 w==;
X-CSE-ConnectionGUID: vkqOXmD8Shm3zP0wnC/hwA==
X-CSE-MsgGUID: MUucPIS8ThiML1kQ6bu8lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="103026419"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="103026419"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:02:56 -0700
X-CSE-ConnectionGUID: Ggu/YG/YS4y/J55fLEqCqw==
X-CSE-MsgGUID: FjJmbDrqQpmi1CkXEerDew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="279368757"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:02:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 12:02:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 12:02:55 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 12:02:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Af3Zrr+OYwXXw9oH5TUESz3/1sHiEaGBCegZUKV6bMe+j9/bleJQV1KyExdihmp2rvhGal0wS1L3oDTs59VTwdKZWesiqus2gkVH7i8jNGha6tH2k5+RNk0L5LafVNv2HMFu/d4gHvLoXMk4hWw9Wwm+8aR05jMshQvnaTC+ss7/eaR45pzDvXeHaB4P05tHTNGaZwbhrlzG1/KFZ94UXKcpbisOrc8f47EH+4rdewNRvHKGORvf653dfCJuv0UeRMGcQqymaaXfSWWY8AF9Kn5sQM28UVFJeyi4oyf7Unn9baUvayTMNdgLOgyB2aA3oNW7wtpS/9KcpxDiLcQO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91kHcLYXpWbtOG7JNLULaLV/BNCktknqrwJeJaglWVI=;
 b=csj3Dd9BMEkd3P2abVpGOBPXH2WCfQJ1jCgTqPVSGgG1PmayPr3UGNzYwF0z9wnQrNkC2OPDKmyIJVjWAkLBckLZCRZ4kwfVo4DvLBa54SWD7YD5TbIQ5sRJJBH6FRuKd4mHc/Iqna2/wfqAfTJeBXoDa0MHMQDroqhlfcd7Nk+/LkSmtlCgJlVyjW48IfKcD3ptL1X7dLU6gYbs/Zo5bbIiepuN3Xeeov2Z+jMVtjXNVR19dvgyIwsaNGDWGmF/q/RxzRuBfy6GlPvzXaxmgnuRh+Z3cqhsG35bL91Jgz/6rOWKW8Lt5ri4M7/LWklaWNjxQ4l2XX+pnnjTufIQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by MW3PR11MB4652.namprd11.prod.outlook.com (2603:10b6:303:5a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 19:02:53 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 19:02:53 +0000
Message-ID: <b144384a-96e8-4cbc-9574-09752bccdeef@intel.com>
Date: Fri, 2 Oct 2026 00:32:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/13] drm/xe/hwmon: Add platform-aware VRAM thermal
 channel support
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-11-karthik.poosa@intel.com>
 <arv9lBb85GqnSxdi@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <arv9lBb85GqnSxdi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0126.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::7) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|MW3PR11MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: 2984505b-06fd-41f6-0d19-08df1fee984b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|4143699003|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: T42lAjb3BqjjOg1oN6x1o9bY37AkCtckDrAnPE5ExnrWn51Za5T1eAVHeVMdSmq8BAX9WxitQmGYfsjYYnwEPR1zb/TusuweXdy6tgwySSLtbWDxR9k89cn0eVGrSN61ZG5UYQwcrMJecaWpQel+WJb0bKeLUMXXdIC8aEhRl/2W/omRi1reNg3zYMd3m0ePpZFQaCJbHnrMnQB5qakFduwsgM+9xELwKxweQzXCPOMZhvpGAm86WPMPOd9/yZj1tqTG97rFJqOlMlWk2b9lYV4qV+UD9tHuvNkClhpxRL9Ayk5dwunvnNu3xJfnysfotZ3Z75vZR3oIlfeoId8y+/PEnW248AfQNz/kgj/T3qWUjtZrY2d9aEK7thlSEXTjpAhHfnzUkbYEbaSfu3G814JJnkFwG4t2TPFJDqFLvuRxKTR742RqfyWOQlk9v2PQYQA8PNz5S+tdm7ForFPH3ppZX5t7zW1wT+M0aBLK8umssSDmWUN1WIE30OFQPzcp2NdLYBk3+9IlG+Fraff0ilB6SNWDzT0gTCtb6mH45ZOXEjBe/mQjDK6EidJTTzmP4G4oY97rDC5iWsTohjRA5bAEuPONvEJVrwdKZ8XGR8HlDx10j7mMCGSd35ExxCmaLJ4p8G0wnngi2R3/WUUK0+4c/DTmdvlrGiex59SV6WU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(4143699003)(6133799003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGlFN21KcHVUaVdtWTVDQUwwTXhkYzUxS1A3NGRKVkMzUFdOVXI5WEhJQk9h?=
 =?utf-8?B?MEhuc2dJVE9PV0FvMzRielF1UzRGMUNxdVBDL0ROeHFnVmpQeGJwTGg4N25P?=
 =?utf-8?B?ckdHMkR6REVONzF0eGhvRGVpVklnendQK2tqVzBZTndBM3U4MTUxNnFpRFBl?=
 =?utf-8?B?OG8rT2FIbldzMDBTTmJoVTBMSURUMmpXV0s1RmU2eDc2UnI0YXVJRmlHT1M0?=
 =?utf-8?B?U0hkOGdQM2FFd2xRby9TUk9ueVRoSXR1dUw5OFg5TklQdnhMZGdud3dlOHF2?=
 =?utf-8?B?bWFPcjNFUGh6L0wyb0ppUUQ0Y0t0WDhsUUk5UnpkM1RuejJ3Zlh0ZktuNURW?=
 =?utf-8?B?OThDdjh2VENCM1RhZDIxMjJRUDVHcndLcWtORXlzMUdlWXIyb1BSYlJ1TnJO?=
 =?utf-8?B?SThQQUNoQk1qWjF1MVVvLzRQQVMwYzYzZmJhRVgrT1pJMlVUa21ENUNKZGgz?=
 =?utf-8?B?bVU0YzNGY0NXdk03QStyR0ttMytOZmxYRlZOODBWVVdvaWs5QnlzdE1EdlR6?=
 =?utf-8?B?bUxJc2JXYklmanNaREp1aUdCcThiYXBhSTBLWm5VSjV2MzRBcmF4M3BwajRy?=
 =?utf-8?B?WVZudlh2UWRjUDg2SEdXMTdpdzMvMU5jampUY1ZjUzVwSVpKWExyWmtqbU95?=
 =?utf-8?B?eUtBOHNIQVV3S1ovYlM4MU9rMXh2Z2JJaTJQYlJhNzBiaDJJQjR2ZnBTVkxs?=
 =?utf-8?B?dTVrSWo4ektuVSt1L3Z6MzJBN0ZkQjI4QTFsenhRNXA0dzJNWW5DUmdiT3Bp?=
 =?utf-8?B?WFZmTStoZ1dIYk5pMGw0dThPTytZSFVSajRtRDJZcHZRb2NteU9rRldGRERX?=
 =?utf-8?B?aW5wdHFOYlRaNGM1OFBSOXoza0lRa2hiN2ZndXlWSVJuZkxEazhQVForU09h?=
 =?utf-8?B?cVczOHE0R3hTTEIvMmRnNmduT1lKWS80cmVvaVVBaTVxZUd0SlNJeDJTN0Jx?=
 =?utf-8?B?cEV3SXpjVDJSWHN4WkgrSm5zVVFabUYrM01DcE1nRnBTLy84SkQyWTg1WUdE?=
 =?utf-8?B?WS9nOEpXeFhBRG1EdmhaakhqZ2xycUpQWWxOckRDYjNSRXFUK21KYi9rVXo1?=
 =?utf-8?B?amUvK1FOQVdGaloydGs4Z001ckxTblQ4d2g1czNlVG1sbll6VUIySEU3S2JY?=
 =?utf-8?B?ZmxSY0drcnNuUDNGNVRqQ2NJOHdIbEZaaFBvZjJjT1V4bW5xNnFlenhLcFlU?=
 =?utf-8?B?WFF0VzI1Tm5xTktWcmJRSi9jbmN1Z0pPWi9iN0FzdXRndTNlYThlc3dEbVU3?=
 =?utf-8?B?bUlYSTZDKytiRFFGQkh6ZGkvTXdiaU1LZHdGQnhNWTBqWVhwTjBKNnNBK3lI?=
 =?utf-8?B?ODFBOGZMM1lyVXE4ZnJyMys0RUw5dHVnVXJ4ci9BT2d0bm5YMTJMcS9URk0y?=
 =?utf-8?B?NjB5NHBJeENSem9SN1RSd1lzN1JaSjlqNk9NdVlwRElSZkxxK3BWNXNoK3JB?=
 =?utf-8?B?S0ZQNWJ2aDJ2aG1oanlhYVZ3d2FidmdZRDh1SzJ4VStmUFkxb3FpR2JrMjQ3?=
 =?utf-8?B?UlpTa1Azd2JKbWtEUTJnTTczYWhIRWF2VlJPa0JLdk53YlhHVVVTRnlDdFJ4?=
 =?utf-8?B?Y0NtZ0s4bVRxdkdMYUlmbWd6OCtYUW4ydTVpZmJSS2JWOHFNZi9Ya1cyVGpv?=
 =?utf-8?B?K2pJUmVvdDJFWjJGNTQ2VXV0eUh4aTdtUWc2SERwcVJxcHJYdkRncXVoSDhI?=
 =?utf-8?B?ajlLdHM2NXA0VkJOTUNxdTFhSTJ3YnA1dUpXR1FrZytmd0kvQ0VZRGs2TGFw?=
 =?utf-8?B?M1RFWUVDMVJXN0UydU5lWEJsTWxRUmxRWnNXWlVMRGNocWhKOXlUZkQrU1V4?=
 =?utf-8?B?OElEMU5neWlyOStaOFVaVllyNWdaQWtsUzZkbGpVM0RwY2x6ZFZTb2NRVXlp?=
 =?utf-8?B?RSs3OE9SOHMvNVBTL0c5MWk4YW9Lb0pzSzZlWjBFMm9pd2dFNE92bEJWM05F?=
 =?utf-8?B?WW9HdVUzLzRWRkZSakZjZXpvN0lsVE12aW0xSDROb1VKMHJudCtnL0hobmFH?=
 =?utf-8?B?MC9CNkEwWkIrMVJrdmZTcHpPZ0xUamFXNTZ0aGsyR29HUG1TMENaS01nSGFX?=
 =?utf-8?B?NDdERWxWQzFjWDdTWjYzZkZNUlVJZzJqNHRZazZnQmdpR21HazlMc2lpNGpy?=
 =?utf-8?B?U3dMbFcvdVU3a2hZLzFWNHJyTlFOKzBMUUNHRklBVDJNQnhjS2F5NThXOTlN?=
 =?utf-8?B?c2hSQnFSaDV2VThXd3hyQ2hLMzdOREpPWmhOY3M3V29GQUFpR3dlRWRuQkFW?=
 =?utf-8?B?UU90MkFYZWViUWtZYTA1YjIxSTN3OURjZWRmYmVhNDRhbkREa0NQSFFwaUJR?=
 =?utf-8?B?eFVMYWFqVTBRRWNOR09qVWJyMEgwVURyQ3NxelJnT0hJbVhyNmFiZz09?=
X-Exchange-RoutingPolicyChecked: hMfK4D/oBBh5AZJqmehtsdh9eOpnOxC/Mpy0Es3gYGRD3sPBfYw+1ubk9/vECcPv96BWHWUuHzv3zx0S7Za8v34t+mtFt3LjaBgF1PGBSWAYRByItT5KGAb++Tv6fN38C+OEqpHkZyNjrIIWI84M2Lp/4YqXCRupMtMBfnqHPuWXNkCJ8Pw9NT4vUMnkRh4isFE/7kOgJeQIOuccA7J48MHYCOaSkUKtp4T2MLsabnHuETchnc4xMGKfJYLR0leQaRgBjKLO3qVoxUroLHyP0fdV4h151Z02CRutF9DzN0KDFSif2oKR6DstKvcoi1+whQoW/w3lSkSjDi/2/HpFNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2984505b-06fd-41f6-0d19-08df1fee984b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 19:02:52.9558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8P+clYUJt190bT8aNXnSZZ5OtiZkbXQTye0ET8MYHNPRHK0gfWGwTg3XzMlmIRTCS4Oxwe61KXYTAdb4WMVxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4652
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


On 29-09-2026 23:34, Rodrigo Vivi wrote:
> On Fri, Sep 25, 2026 at 02:24:26AM +0530, Karthik Poosa wrote:
>> On CRI, derive the number of available VRAM temperature channels from the
>> CRI_MSU_VRAM_ENABLE register, where each enabled MSU contributes
>> VRAM_CHANNELS_PER_MSU channels.
>>   
>> Increase the maximum supported VRAM channel count to 80 and use the
>> derived count to control VRAM sensor enumeration, channel access, and
>> VRAM label allocation. Add a has_fixed_vram_channels platform flag to
>> preserve the existing fixed-channel behavior on non-CRI platforms.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>
>> v2:
>>   - Use the highest enabled MSU index to determine the VRAM channel bound
>>     instead of counting enabled MSUs. A sparse mask could expose channels
>>     beyond the allocated label array, leaving the label pointer unset and
>>     potentially hanging during sysfs reads.
>>   - Also return an error when no temperature label matches the requested
>>     channel.
>>
>>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h |   1 +
>>   drivers/gpu/drm/xe/xe_device_types.h    |   2 +
>>   drivers/gpu/drm/xe/xe_hwmon.c           | 164 +++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_pci.c             |   2 +
>>   drivers/gpu/drm/xe/xe_pci_types.h       |   1 +
>>   5 files changed, 154 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> index a969661f0c95..d9e4847dd68e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> @@ -28,6 +28,7 @@
>>   #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>>   
>>   #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>> +#define CRI_MSU_VRAM_ENABLE			XE_REG(0x138340)
> can you please share again the ref to this?
shared offline
>
>>   #define CRI_PACKAGE_TEMPERATURE			XE_REG(0x138344)
>>   #define CRI_VRAM_TEMPERATURE			XE_REG(0x138348)
>>   #define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 87554605fa41..8a1ca65f5665 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -184,6 +184,8 @@ struct xe_device {
>>   		u8 has_drm_ras:1;
>>   		/** @info.has_fan_control: Device supports fan control */
>>   		u8 has_fan_control:1;
>> +		/** @info.has_fixed_vram_channels: Device has fixed VRAM temperature channels */
>> +		u8 has_fixed_vram_channels:1;
>>   		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
>>   		u8 has_flat_ccs:1;
>>   		/** @info.has_gsc_nvm: Device has gsc non-volatile memory */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 1b2e2fbe43c8..0422db647d11 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -39,7 +39,11 @@ enum xe_hwmon_reg_operation {
>>   	REG_READ64,
>>   };
>>   
>> -#define MAX_VRAM_CHANNELS      (16)
>> +#define MAX_VRAM_CHANNELS	80
>> +#define FIXED_VRAM_CHANNELS	16
>> +
>> +/* Each MSU enable bit maps to one VRAM subsystem of 4 channels. */
>> +#define VRAM_CHANNELS_PER_MSU	4
>>   
>>   enum xe_hwmon_channel {
>>   	CHANNEL_CARD,
>> @@ -48,6 +52,7 @@ enum xe_hwmon_channel {
>>   	CHANNEL_MCTRL,
>>   	CHANNEL_PCIE,
>>   	CHANNEL_VRAM_N,
>> +	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
>>   	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
>>   	CHANNEL_MAX,
>>   };
>> @@ -144,18 +149,22 @@ struct xe_hwmon_thermal_info {
>>   		/** @data: temperature limits in dwords */
>>   		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
>>   	};
>> -	/** @count: no of temperature sensors available for the platform */
>> +	/** @count: temperature sensors count from READ_THERMAL_CONFIG */
>>   	u8 count;
>> +	/** @vram_count: exclusive upper bound for VRAM temperature channel indices */
>> +	u8 vram_count;
>>   	/** @available: temperature sensor availability cached at registration */
>>   	bool available[CHANNEL_MAX];
>> +	/** @msu_mask: VRAM subsystem enable mask read from MMIO */
>> +	u32 msu_mask;
>>   	union {
>>   		/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
>>   		u8 value[U8_MAX + 1];
>>   		/** @dword: sensor values as dwords, u32-aligned for pcode reads */
>>   		u32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
>>   	};
>> -	/** @vram_label: vram label names */
>> -	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
>> +	/** @vram_label: vram label names, dynamically allocated based on vram_count */
>> +	char (*vram_label)[MAX_LABEL_SIZE];
>>   };
>>   
>>   /**
>> @@ -269,6 +278,14 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>>   	return ret;
>>   }
>>   
>> +static bool xe_hwmon_vram_channel_enabled(const struct xe_hwmon *hwmon, int index)
>> +{
>> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
>> +		return hwmon->temp.msu_mask & BIT(index / VRAM_CHANNELS_PER_MSU);
>> +
>> +	return true;
>> +}
>> +
>>   static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>>   				      int channel)
>>   {
>> @@ -281,14 +298,16 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>   				return CRI_PACKAGE_TEMPERATURE;
>>   			else if (channel == CHANNEL_VRAM)
>>   				return CRI_VRAM_TEMPERATURE;
>> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
>> +				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
>>   				return CRI_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>>   		} else if (xe->info.platform == XE_BATTLEMAGE) {
>>   			if (channel == CHANNEL_PKG)
>>   				return BMG_PACKAGE_TEMPERATURE;
>>   			else if (channel == CHANNEL_VRAM)
>>   				return BMG_VRAM_TEMPERATURE;
>> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
>> +				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
>>   				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>>   		} else if (xe->info.platform == XE_DG2) {
>>   			if (channel == CHANNEL_PKG)
>> @@ -798,6 +817,70 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>>   			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>>   			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> I was wondering if there was something better we could get here...
> and LLM suggested me a reduction from 80 to 8 lines:
>
> #define TEMP_CFG_CARD HWMON_T_LABEL
> #define TEMP_CFG_PKG  (HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | \
>                         HWMON_T_LABEL | HWMON_T_MAX)
> #define TEMP_CFG_SENSOR       (HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL)
>
> /*
>   * Indexed by &enum xe_hwmon_channel and zero-terminated; hwmon derives the
>   * channel count from the array contents. Sizing on CHANNEL_MAX keeps this in
>   * lockstep with the enum.
>   */
> static const u32 hwmon_temp_config[CHANNEL_MAX + 1] = {
>        [CHANNEL_CARD]                          = TEMP_CFG_CARD,
>        [CHANNEL_PKG]                           = TEMP_CFG_PKG,
>        [CHANNEL_VRAM]                          = TEMP_CFG_SENSOR,
>        [CHANNEL_MCTRL]                         = TEMP_CFG_SENSOR,
>        [CHANNEL_PCIE]                          = TEMP_CFG_SENSOR,
>        [CHANNEL_VRAM_N ... CHANNEL_VRAM_N_MAX] = TEMP_CFG_SENSOR,
>        [CHANNEL_MAX]                           = 0,    /* terminator */
> };
>
> static const struct hwmon_channel_info hwmon_temp_info = {
>        .type = hwmon_temp,
>        .config = hwmon_temp_config,
> };
>
> static const struct hwmon_channel_info * const hwmon_info[] = {
>        &hwmon_temp_info,
>        HWMON_CHANNEL_INFO(power, ...),
>        /* unchanged */
> };
>
> can be done in a follow up though...
i think we shall make do this in separate patch series
> Everything else looks sane... I just need to double check the regs again...
shared these details offline
>
>>   			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>>   			   HWMON_P_CAP,
>> @@ -812,15 +895,37 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   	u32 config = 0;
>>   	int ret;
>>   
>> +	/*
>> +	 * Only CRI reports dynamic VRAM channel state. Fixed-channel platforms
>> +	 * set the count up front so those sensors stay visible even if the thermal
>> +	 * mailbox reads below fail.
>> +	 */
>> +	if (hwmon->xe->info.has_fixed_vram_channels)
>> +		hwmon->temp.vram_count = FIXED_VRAM_CHANNELS;
>> +
>> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND) {
>> +		hwmon->temp.msu_mask = xe_mmio_read32(mmio, CRI_MSU_VRAM_ENABLE);
>> +		hwmon->temp.vram_count = fls(hwmon->temp.msu_mask) * VRAM_CHANNELS_PER_MSU;
>> +		drm_dbg(&hwmon->xe->drm, "MSU VRAM enable mask 0x%x, VRAM channel bound %d\n",
>> +			hwmon->temp.msu_mask, hwmon->temp.vram_count);
>> +		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS) {
>> +			drm_warn(&hwmon->xe->drm,
>> +				 "VRAM channel bound %d exceeds max %d, clamping\n",
>> +				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
>> +			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
>> +		}
>> +	}
>> +
>>   	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
>>   			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
>>   	if (ret)
>>   		return ret;
>>   
>> -	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
>> +	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%08x val1 0x%08x\n",
>>   		hwmon->temp.data[0], hwmon->temp.data[1]);
>>   
>>   	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
>> @@ -1025,6 +1130,14 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
>>   		if (!xe_reg_is_valid(reg))
>>   			return false;
>>   
>> +		/*
>> +		 * On CRI, VRAM channel presence comes from the MSU enable mask
>> +		 * (applied in xe_hwmon_get_reg()); the temperature register's
>> +		 * 0xffffffff sentinel is not reliable for VRAM channels.
>> +		 */
>> +		if (hwmon->xe->info.platform == XE_CRESCENTISLAND && channel >= CHANNEL_VRAM_N)
>> +			return true;
>> +
>>   		reg_val = xe_mmio_read32(mmio, reg);
>>   		if (!mmio_temp_valid(hwmon, reg_val)) {
>>   			drm_dbg(&hwmon->xe->drm,
>> @@ -1042,20 +1155,31 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
>>   	}
>>   }
>>   
>> -static void xe_hwmon_init_temp_info(struct xe_hwmon *hwmon)
>> +static int xe_hwmon_init_temp_info(struct xe_hwmon *hwmon)
>>   {
>> +	struct device *dev = hwmon->xe->drm.dev;
>>   	int channel;
>>   
>>   	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
>>   		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
>>   
>> +	/* vram_count is known only after reading thermal info above. */
>> +	if (hwmon->temp.vram_count) {
>> +		hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
>> +						      MAX_LABEL_SIZE, GFP_KERNEL);
>> +		if (!hwmon->temp.vram_label)
>> +			return -ENOMEM;
>> +	}
>> +
>>   	for (channel = 0; channel < CHANNEL_MAX; channel++) {
>>   		hwmon->temp.available[channel] = xe_hwmon_temp_probe(hwmon, channel);
>> -		if (hwmon->temp.available[channel] &&
>> -		    in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>> +		if (hwmon->temp.available[channel] && hwmon->temp.vram_label &&
>> +		    in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>>   			snprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], MAX_LABEL_SIZE,
>>   				 "vram_ch_%d", channel - CHANNEL_VRAM_N);
>>   	}
>> +
>> +	return 0;
>>   }
>>   
>>   static umode_t
>> @@ -1551,8 +1675,10 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			*str = "mctrl";
>>   		else if (channel == CHANNEL_PCIE)
>>   			*str = "pcie";
>> -		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>> +		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>>   			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>> +		else
>> +			return -EOPNOTSUPP;
>>   		return 0;
>>   	case hwmon_power:
>>   	case hwmon_energy:
>> @@ -1580,7 +1706,7 @@ static const struct hwmon_chip_info hwmon_chip_info = {
>>   	.info = hwmon_info,
>>   };
>>   
>> -static void
>> +static int
>>   xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>> @@ -1648,7 +1774,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>>   			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>>   
>> -	xe_hwmon_init_temp_info(hwmon);
>> +	return xe_hwmon_init_temp_info(hwmon);
>>   }
>>   
>>   int xe_hwmon_register(struct xe_device *xe)
>> @@ -1677,7 +1803,9 @@ int xe_hwmon_register(struct xe_device *xe)
>>   	hwmon->xe = xe;
>>   	xe->hwmon = hwmon;
>>   
>> -	xe_hwmon_get_preregistration_info(hwmon);
>> +	ret = xe_hwmon_get_preregistration_info(hwmon);
>> +	if (ret)
>> +		goto err_null_hwmon;
>>   
>>   	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>>   
>> @@ -1687,10 +1815,14 @@ int xe_hwmon_register(struct xe_device *xe)
>>   								hwmon_groups);
>>   	if (IS_ERR(hwmon->hwmon_dev)) {
>>   		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
>> -		xe->hwmon = NULL;
>> -		return PTR_ERR(hwmon->hwmon_dev);
>> +		ret = PTR_ERR(hwmon->hwmon_dev);
>> +		goto err_null_hwmon;
>>   	}
>>   
>>   	return 0;
>> +
>> +err_null_hwmon:
>> +	xe->hwmon = NULL;
>> +	return ret;
>>   }
>>   MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index e656fc012902..fa32436ecf6f 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -416,6 +416,7 @@ static const struct xe_device_desc bmg_desc = {
>>   	.dma_mask_size = 46,
>>   	.has_display = true,
>>   	.has_fan_control = true,
>> +	.has_fixed_vram_channels = true,
>>   	.has_flat_ccs = 1,
>>   	.has_mbx_power_limits = true,
>>   	.has_mbx_thermal_info = true,
>> @@ -794,6 +795,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>   	xe->info.has_cached_pt = desc->has_cached_pt;
>>   	xe->info.has_drm_ras = desc->has_drm_ras;
>>   	xe->info.has_fan_control = desc->has_fan_control;
>> +	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
>>   	/* runtime fusing may force flat_ccs to disabled later */
>>   	xe->info.has_flat_ccs = desc->has_flat_ccs;
>>   	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index 0041ec5676d3..4d1048ca7abe 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -42,6 +42,7 @@ struct xe_device_desc {
>>   	u8 has_display:1;
>>   	u8 has_drm_ras:1;
>>   	u8 has_fan_control:1;
>> +	u8 has_fixed_vram_channels:1;
>>   	u8 has_flat_ccs:1;
>>   	u8 has_gsc_nvm:1;
>>   	u8 has_heci_gscfi:1;
>> -- 
>> 2.25.1
>>
