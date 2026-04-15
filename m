Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20F5F43858
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 16:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1D210E165;
	Wed, 15 Apr 2026 16:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdDn32wV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA5110E165
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 16:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776271600; x=1807807600;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mXVxx42CT2UzrbWUsY1bLmAMAlwlz1gAtcsgDGaSJR0=;
 b=YdDn32wVJUsJdp790jQY3QajB6PgzJAd7im6mSyix9C7BxuGBXT1nrXn
 RKQjjC1adloNIdLWfvcc/bsselYOP/wiPc4bnwUi5Mw0Vv6SXBmUk7DdH
 MniBK96iCiH0U1G/faznYBQkctOov+EzuVv+sI1qSVAi2YkpUscqLOgW9
 reUNMAZINqqAYs94WUHHe+aiTeU9rVQBYQvdIG+Ax+In61+hIDcFWj4Hg
 5n6UbcK8vxrWbJswwecKNRdS41iOWckTnBfo1QhkU2p+tD9W+EzqRdEk6
 VqM4eEuqkwFQCyeLDe0/xqq7WxwusV/Js2WH/EQ8jcNs9HoXrvMFkBUDb w==;
X-CSE-ConnectionGUID: InUiMpN/SCuFzQdbmT9DvQ==
X-CSE-MsgGUID: cCGUxNRERgOKL4XUA/ESIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76292216"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76292216"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:46:40 -0700
X-CSE-ConnectionGUID: 4rV8zRtZQyKihfVKnsSmrw==
X-CSE-MsgGUID: cbf+qxo+Q5Wxx3dfChKl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="227302810"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:46:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:46:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 09:46:39 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:46:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEWcdqzmcoRQruDQXtFIllt2nglmqBOf1hZUrLhZ/Xq4edJ0InkqxKJMYRoabB4LZHoLDD1ToBoKeIuzv5T1icoKf7bCGC2k4rNYyQO7RDmiXhispl7VIQvbR6MxPZs6I40z2F5Sz4ysmF1IPccoV/U4fVkhlCDe4bSeYhR6wpbsCpq/GuFP7ndMK6UKkXTKEZBK2dT1plbuG4pAmZmuDI9SkzOdTzy9zbha3pP+YY85PaZYiTILIeMEoDKdE2NbcxrlkM90+J/DN2SuMDWxYR8nFRxm9jGCL2q3dIIDdedPb1HMQAQZgJBkcFiOrYYByeeurCDb/HRQrBbhT1B+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKkSK1f+DTjIUwr7PHnbX1bjj1aVC7C0fLSP3BjUvu0=;
 b=ogHrLVfGlmYT9/R9k84xl6cuXgTkVi39G6082r2mQx656dUn2SP2ONuozF9P3gcMBAoXD03JlH0+Mf9V0jZ2Cpk8TxR4rbFhfnVFrz9yTRORgf3PBQsNpas6hh53rxK67Pp7t9pn0Z38D6SeDMnMpS/RHGLnXjTzDk51a6cA/qkScxAAnB1wy12VguL9CqHa1/H/EisBdIAaCzGU2ujEmZvvQE/cGhQpxHRzguNkSfVjLADhKWBtlxT6SDM2ZGLBVSpp/qDMoMud9uW8/UyQ+YbEObZfbGyZzzd56uf4fT88FDTTRca7HbHKxV59G/EbrUHKUUO4spjB/H/us5LP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by LVXPR11MB9708.namprd11.prod.outlook.com (2603:10b6:408:388::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 16:46:37 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 16:46:37 +0000
Message-ID: <79fd8836-8194-489c-8295-4bb8afbae3c3@intel.com>
Date: Wed, 15 Apr 2026 09:46:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/xe/pat: Introduce xe_cache_pat_idx() helper
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260414211453.303679-1-x.wang@intel.com>
 <20260414211453.303679-4-x.wang@intel.com>
 <f36b32e7-da49-4e0c-b2bc-731fa825bd99@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <f36b32e7-da49-4e0c-b2bc-731fa825bd99@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::19) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|LVXPR11MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 97598f45-d57b-460b-49bf-08de9b0e8f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|42112799006|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YOJwAVKtMO29if8Lz0NPHQ6yHHaRoWXUz6UOvCV0UrwoqEmZYhLEbs8X0aIpqOOC3E/PkDJpxWcbolbP1Nc4Q7VAeI4qNSfarwdth3Hz6DSkJUh0DLc9mg6y8Y1fg1mkOihdsXEDEXVh6kd03lTTACuywpyVr+Wo+w6QiTptWojOuS94xCcDFZccdbX/0bPcffdt5WeDS0CXAb8qbYq73i9EUcb62G4aXsuUsD3C8EiGBmNbecddTF6+HfFTgwZ/2VMatHLanGGoHkgrzSdqBdNPav1WVJO7Xr31J4nnVeaKGAs++D54/DSaM+fgj+MHhFIhZrwH8ZocMkgt2oZ44toHXSvGWBrd8L+xi7edKttRQ39QU/XxoeyTGthomT8yJKncv5dlE5n/G+CsKtJfKHbW++BDdNoUxY97H108sPQRhdndVgE8eYbVRr5LaK1eQxfpThMu5yvRbjQIztBCXyetyvzHmt3ZsAySCJE8Han0x5hKBnehbE14uCfogCow5hRe1HuEptAYLV9klAB71tBTxIz78x0to396nZh+ZP4DquqIWc7dFEJ67Yp5af2NRf859iZyfqRpcRXp+KTijng1KO6tG3AH+SludKlq3r6lqfAiXTLwYUjom3GwNp63WMWE3QUJ8eOZo27GUn4AivM55hu+1Q+ulZEenMUagBw1NK24SgyO9s/dJ+Mr3FQdKDQcodlVwolUkBBszXnWVNaNNtcBODfa5tMyNvRol08=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUxiVkk0ZjJKUlEyT2NLb3V6Q2lPY1JRZ3c1MDdZbDFhSkJ0czZnNTZ6UHBj?=
 =?utf-8?B?a3AvUlAwakFMT0VhYkgxZkJRKys2allmamVEb2dabzZmcHZRWWgrcGlzWm84?=
 =?utf-8?B?R2ZKNkwxZisrNUcvZ0NHZGdVSm85SjlwTFJpLzRpeEhPemJXUHhLUy9TdzJa?=
 =?utf-8?B?cjJQbjRTcllnNkY1V3FyMWhZSWh3enBFSFo5MkFoWFRFL0RuQXRZNmdKOGw1?=
 =?utf-8?B?dzBhNlZTWnZTSGZlTlFQT2Mwc3htd3JsU1VURXZpaGRJeGo4WCt1NENlWE4w?=
 =?utf-8?B?dGxoeEdEUzRpdTJrTHM3cUg3YVV0SDJvV3ppTTlzb2VlQ0dKcVFEN0d0akJJ?=
 =?utf-8?B?V0ZWanYzSG1aVTE3NGVJSTNuL2VZV25zV2RPUkxBbjB4ZjA4M2MxelEvMFlv?=
 =?utf-8?B?dWY3Y2gzMHJFTHVWR29lSnMvY0w4UjlFYnc2Q0lMTzI3cGZKZFUycXIzR2Ru?=
 =?utf-8?B?cW5nbGY4emN5RjNodm1BWktSa0wvdnlSVlgzcGphMjhkTTh2L0NBNVAvSUxX?=
 =?utf-8?B?NFNGMlhUUndKR1ByVm1mMGhFS0xMa3l0SENpQy82Y2NoTzIyNHg0NEV3NDE0?=
 =?utf-8?B?Y1pRWXNNbU9MUlFncEc0RFZiVlk0ZUIrcFdWS0g5djR2SGE0RzdaRnVHSnNP?=
 =?utf-8?B?aitMNWdPVWd4dVRKSlQ1WVpWSm1KeFRCTkU2YUZSYXZ4WnpIVXRqamxUTnRi?=
 =?utf-8?B?RFJrR0VDRW41R0ZsQmRZU1BxVW9sUFZmSkJUVzFXcm5CaHR5UnRUSmV5cEdp?=
 =?utf-8?B?VWZTVEdyTEZabDM1UWZVNkM1QmdZbkNvRVF2MjBIMnRPSWdGbnpNdHJMZHB2?=
 =?utf-8?B?NzYxSSsxaDh5ZnBUWHV3dERrcXhrTWJnOUZ2MjgwUSsveWZQQlpwYzFiVmNp?=
 =?utf-8?B?SGQ4bmZyNzlwTGlTLzdseUFPODIxNDZ6U3BFK1ErQnNBdzRMSGlYYzdSalNF?=
 =?utf-8?B?TldUeUFwZUhJSE1VWC9nblo5bndkRnlSKzRLN1l1VllzOHZUTm9XQSs0bDYr?=
 =?utf-8?B?NkZ5eHY3aFlDdmkxb0lFazM2U3JiRlJVdXV0c1FONndaY2EyVGJFVFFBODhj?=
 =?utf-8?B?NjJ1amlUMzhUZE5Yd1U0TGMwTExyMGgwRzNaRFNWTkNCTGo2eFloTnRjWk9Z?=
 =?utf-8?B?eSt2dG51ZE1zWFB3bkMvdW4yMENrOGFNdDUreng2WDVrNk5UMkwyU2c3UzM4?=
 =?utf-8?B?ZWowZ2c1dXhmVEZkNUpGcWcycVo5Z3FhSGFtcGhOUWJOVHdkVkg3U0hxT0JG?=
 =?utf-8?B?MnhFcUVKRU5wS2VoclF2U0F5dEJzZmc5VldLOE5rdHFSQ0ZTTEZWNW95NkMw?=
 =?utf-8?B?TXo1NjZrTm1rNlVzUEh2TGZtWExmRWwxMGJaZlBTOEY0OE00SkNSNlZBaUFI?=
 =?utf-8?B?RHdPSUpLS0ZXcWt1RFcrQ2JwNzdIdXFkOVJHQlUzdm11cDZCdVhsU2FCalcy?=
 =?utf-8?B?K3FEbDVHZVB6L2NQRmQwdXVQbyt6UGg2U3J4dmNhL2x6Z3NWdHUzQ040T1pL?=
 =?utf-8?B?QXBLeUg2WGNFNGVVWTI1UFhCVGFMRTBuUXJyL1lBUG00Q3l0WmhDcFV6cnRT?=
 =?utf-8?B?TThWU3QrZXpWVEdGZ1cvaDR1Y0RoOUpGNllnWGNrWUV0UDJKRWx1SytaYloy?=
 =?utf-8?B?cU1wQ203Tm5RT1NTTzRuMHV6Qy9nOXJ6dEN1RXFvUzJ4NUt3T1pUdXdhbGgx?=
 =?utf-8?B?YWdmV1B4YVFFdDBoUzFNbkYrY1FWeFR3dWVuREVFandTb01yM2I3UlB5SHdi?=
 =?utf-8?B?OVpoekJpSHFrUzFLWlBJWFZlcSt0UnFVUG5TUG9JeFBwY0VvYndnbDRIQ09N?=
 =?utf-8?B?OTlaRmNUa0RRTGVBRnhRVVc4b0FwT0k3bDN2NEZnSjd1SUltMS9sU0FLd0d6?=
 =?utf-8?B?KzRYZ2dRU3JLY0FGYnh5Y2pXeVEvSWZZczRlVWNtNjJLN2l1Z29LUGZLZ3VP?=
 =?utf-8?B?ZGhLRHF1aXVFaVl4SDVzcy9UR0FRRzNkdUpja2NKd1NzblBLREFJdXZsdUNY?=
 =?utf-8?B?aE5mZ0ptQzN0dGUzam5VM0lETDVCem9NMUZpU0NDQ1FmbTM4ZEMwVGdIeGFC?=
 =?utf-8?B?Z2FOamlHcCsvNTM3RFJFQXAveXFXaTl0TDVyMW13TU0rN1hNa0dpOWVmRkFO?=
 =?utf-8?B?RUs1dFhuVXkrbkhNVjFUL2R1VGNyLy9hL0QrYldURU0vQXFYMk9ueXgzclBJ?=
 =?utf-8?B?c2hYdWRhM3JRbGl4VkVlVU90bStaOHMyd2llc1ZkOXBoYzIvSHhkWWFicTY3?=
 =?utf-8?B?VXpwUXV1YXVoay9mSFpGQTF6Y2lUcFE2QjArbG55bVlHRXBhcVliZ0Y1bU1y?=
 =?utf-8?B?RWQzdm5uRzFLT2NBY1ZsVWV1eDF1eXYrQStIaGdwVmcwT0FOKzVMQT09?=
X-Exchange-RoutingPolicyChecked: uu51oN9W+HPlwS6D5g63Qg3HBy+27Z45LhKQ+HwBcO83wdB/vcnJeCQXqCQqAEG9pQXQ7wj7Vcbe6HlJSfAmOWOXAElT5jvMCjHxcLq4ipeMz1I8gRbcyDcjBXQPoROHOkjE/gKjFti9bn68+pyCozJqAfFRbOBsFss5/u6248nWjMQa9lODMBYfw/vFuQ4YNt/PQkh6Nf9/DPWqtosj3ZZHfITIN9fxoSvOoquuB9Cl+UEfgFaGCknTltNoQQDD9MZZ/uChZtlz4OICrc4WKue9TS6uLlT0sWz9R8QKJprMPXanIHz4+uBnwxPsnda73mhaanePTtYWrdt/9BKzMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97598f45-d57b-460b-49bf-08de9b0e8f45
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:46:37.0500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBYlyiXv2OXEq1sS/39dIe8CZmRTF130XW9xzLCRKfXxexcwV1HQopHVMGEBpTWkqYaEAFlFJG12T092QNpksA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9708
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



On 4/15/2026 02:12, Matthew Auld wrote:
> On 14/04/2026 22:14, Xin Wang wrote:
>> Add an inline helper xe_cache_pat_idx() that wraps pat.idx[] read
>> accesses with xe_assert() validation, catching any attempt to use
>> an invalid PAT index at runtime.
>>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++++-----
>>   drivers/gpu/drm/xe/tests/xe_migrate.c  |  3 ++-
>>   drivers/gpu/drm/xe/xe_ggtt.c           |  7 ++++---
>>   drivers/gpu/drm/xe/xe_migrate.c        | 15 ++++++++-------
>>   drivers/gpu/drm/xe/xe_pat.h            | 24 +++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pt.c             |  3 ++-
>>   drivers/gpu/drm/xe/xe_vm.c             |  6 +++---
>>   7 files changed, 48 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c 
>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index e45a1e7a4670..d670a3cf1b84 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_device.h"
>>   #include "xe_display_vma.h"
>>   #include "xe_ggtt.h"
>> +#include "xe_pat.h"
>>   #include "xe_pm.h"
>>   #include "xe_vram_types.h"
>>   @@ -24,7 +25,7 @@ write_dpt_rotated(struct xe_bo *bo, struct 
>> iosys_map *map, u32 *dpt_ofs, u32 bo_
>>       struct xe_device *xe = xe_bo_device(bo);
>>       struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>       u32 column, row;
>> -    u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, 
>> xe->pat.idx[XE_CACHE_NONE]);
>> +    u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, 
>> xe_cache_pat_idx(xe, XE_CACHE_NONE));
>>         /* TODO: Maybe rewrite so we can traverse the bo addresses 
>> sequentially,
>>        * by writing dpt/ggtt in a different order?
>> @@ -64,7 +65,7 @@ write_dpt_remapped_linear(struct xe_bo *bo, struct 
>> iosys_map *map,
>>       struct xe_device *xe = xe_bo_device(bo);
>>       struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>       const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
>> -                         xe->pat.idx[XE_CACHE_NONE]);
>> +                         xe_cache_pat_idx(xe, XE_CACHE_NONE));
>>       unsigned int offset = plane->offset * XE_PAGE_SIZE;
>>       unsigned int size = plane->size;
>>   @@ -87,7 +88,7 @@ write_dpt_remapped_tiled(struct xe_bo *bo, struct 
>> iosys_map *map,
>>       struct xe_device *xe = xe_bo_device(bo);
>>       struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>       const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
>> -                         xe->pat.idx[XE_CACHE_NONE]);
>> +                         xe_cache_pat_idx(xe, XE_CACHE_NONE));
>>       unsigned int offset, column, row;
>>         for (row = 0; row < plane->height; row++) {
>> @@ -190,7 +191,7 @@ static int __xe_pin_fb_vma_dpt(const struct 
>> intel_framebuffer *fb,
>>           return PTR_ERR(dpt);
>>         if (view->type == I915_GTT_VIEW_NORMAL) {
>> -        u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, 
>> xe->pat.idx[XE_CACHE_NONE]);
>> +        u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, 
>> xe_cache_pat_idx(xe, XE_CACHE_NONE));
>>           u32 x;
>>             for (x = 0; x < size / XE_PAGE_SIZE; x++) {
>> @@ -306,7 +307,7 @@ static int __xe_pin_fb_vma_ggtt(const struct 
>> intel_framebuffer *fb,
>>           /* display uses tiles instead of bytes here, so convert it 
>> back.. */
>>           size = intel_rotation_info_size(&view->rotated) * 
>> XE_PAGE_SIZE;
>>   -    pte = xe_ggtt_encode_pte_flags(ggtt, bo, 
>> xe->pat.idx[XE_CACHE_NONE]);
>> +    pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe_cache_pat_idx(xe, 
>> XE_CACHE_NONE));
>>       vma->node = xe_ggtt_insert_node_transform(ggtt, bo, pte,
>>                             ALIGN(size, align), align,
>>                             view->type == I915_GTT_VIEW_NORMAL ?
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c 
>> b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index 34e2f0f4631f..50a97705e0ac 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -9,6 +9,7 @@
>>   #include "tests/xe_kunit_helpers.h"
>>   #include "tests/xe_pci_test.h"
>>   +#include "xe_pat.h"
>>   #include "xe_pci.h"
>>   #include "xe_pm.h"
>>   @@ -246,7 +247,7 @@ static void xe_migrate_sanity_test(struct 
>> xe_migrate *m, struct kunit *test,
>>       /* First part of the test, are we updating our pagetable bo 
>> with a new entry? */
>>       xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>>             0xdeaddeadbeefbeef);
>> -    expected = m->q->vm->pt_ops->pte_encode_bo(pt, 0, 
>> xe->pat.idx[XE_CACHE_WB], 0);
>> +    expected = m->q->vm->pt_ops->pte_encode_bo(pt, 0, 
>> xe_cache_pat_idx(xe, XE_CACHE_WB), 0);
>>       if (m->q->vm->flags & XE_VM_FLAG_64K)
>>           expected |= XE_PTE_PS64;
>>       if (xe_bo_is_vram(pt))
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 3552fa3cac4b..a351c578b170 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -24,6 +24,7 @@
>>   #include "xe_gt_types.h"
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>> +#include "xe_pat.h"
>>   #include "xe_pm.h"
>>   #include "xe_res_cursor.h"
>>   #include "xe_sriov.h"
>> @@ -258,7 +259,7 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, 
>> u64 addr)
>>     static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>>   {
>> -    u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
>> +    u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), 
>> XE_CACHE_WB);
>>       u64 end = start + size - 1;
>>       u64 scratch_pte;
>>   @@ -723,7 +724,7 @@ static void xe_ggtt_map_bo(struct xe_ggtt 
>> *ggtt, struct xe_ggtt_node *node,
>>   void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
>>   {
>>       u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? 
>> XE_CACHE_NONE : XE_CACHE_WB;
>> -    u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
>> +    u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), 
>> cache_mode);
>>       u64 pte;
>>         mutex_lock(&ggtt->lock);
>> @@ -840,7 +841,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt 
>> *ggtt, struct xe_bo *bo,
>>           bo->ggtt_node[tile_id] = NULL;
>>       } else {
>>           u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? 
>> XE_CACHE_NONE : XE_CACHE_WB;
>> -        u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
>> +        u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), 
>> cache_mode);
>>           u64 pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
>>             xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index 5fdc89ed5256..a87fbc1e9fb1 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -31,6 +31,7 @@
>>   #include "xe_map.h"
>>   #include "xe_mem_pool.h"
>>   #include "xe_mocs.h"
>> +#include "xe_pat.h"
>>   #include "xe_printk.h"
>>   #include "xe_pt.h"
>>   #include "xe_res_cursor.h"
>> @@ -217,7 +218,7 @@ static void xe_migrate_prepare_vm(struct xe_tile 
>> *tile, struct xe_migrate *m,
>>                     struct xe_vm *vm, u32 *ofs)
>>   {
>>       struct xe_device *xe = tile_to_xe(tile);
>> -    u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>> +    u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
>>       u8 id = tile->id;
>>       u32 num_entries = NUM_PT_SLOTS, num_level = 
>> vm->pt_root[id]->level;
>>   #define VRAM_IDENTITY_MAP_COUNT    2
>> @@ -337,7 +338,7 @@ static void xe_migrate_prepare_vm(struct xe_tile 
>> *tile, struct xe_migrate *m,
>>            * if flat ccs is enabled.
>>            */
>>           if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
>> -            u16 comp_pat_index = 
>> xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
>> +            u16 comp_pat_index = xe_cache_pat_idx(xe, 
>> XE_CACHE_NONE_COMPRESSION);
>>               u64 vram_offset = IDENTITY_OFFSET +
>>                   DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
>>               u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
>> @@ -637,10 +638,10 @@ static void emit_pte(struct xe_migrate *m,
>>         /* Indirect access needs compression enabled uncached PAT 
>> index */
>>       if (GRAPHICS_VERx100(xe) >= 2000)
>> -        pat_index = is_comp_pte ? 
>> xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
>> -                      xe->pat.idx[XE_CACHE_WB];
>> +        pat_index = is_comp_pte ? xe_cache_pat_idx(xe, 
>> XE_CACHE_NONE_COMPRESSION) :
>> +                      xe_cache_pat_idx(xe, XE_CACHE_WB);
>>       else
>> -        pat_index = xe->pat.idx[XE_CACHE_WB];
>> +        pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
>>         ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>>   @@ -1876,7 +1877,7 @@ __xe_migrate_update_pgtables(struct 
>> xe_migrate *m,
>>         /* For sysmem PTE's, need to map them in our hole.. */
>>       if (!IS_DGFX(xe)) {
>> -        u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>> +        u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
>>           u32 ptes, ofs;
>>             ppgtt_ofs = NUM_KERNEL_PDE - 1;
>> @@ -2098,7 +2099,7 @@ static void build_pt_update_batch_sram(struct 
>> xe_migrate *m,
>>                          struct drm_pagemap_addr *sram_addr,
>>                          u32 size, int level)
>>   {
>> -    u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
>> +    u16 pat_index = xe_cache_pat_idx(tile_to_xe(m->tile), XE_CACHE_WB);
>>       u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
>>       u32 ptes;
>>       int i = 0;
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index a1e287c08f57..338fda95e63f 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -8,8 +8,11 @@
>>     #include <linux/types.h>
>>   +#include "xe_assert.h"
>> +#include "xe_device_types.h"
>> +#include "xe_pt_types.h"
>> +
>>   struct drm_printer;
>> -struct xe_device;
>>   struct xe_gt;
>>     #define XE_PAT_INVALID_IDX    U16_MAX
>> @@ -82,4 +85,23 @@ bool xe_pat_index_get_comp_en(struct xe_device 
>> *xe, u16 pat_index);
>>    */
>>   u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
>>   +/**
>> + * xe_cache_pat_idx - Get the PAT index for a given cache level
>> + * @xe: xe device
>> + * @cache_mode: cache level to look up
>> + *
>> + * Assert that @cache_mode is within bounds and that the PAT index has
>> + * been configured for the requested cache level, then return it.
>> + *
>> + * Return: PAT index corresponding to @cache_mode
>> + */
>> +static inline u16 xe_cache_pat_idx(struct xe_device *xe,
>> +                   enum xe_cache_level cache_mode)
>> +{
>> +    xe_assert(xe, cache_mode < __XE_CACHE_LEVEL_COUNT);
>> +    xe_assert(xe, xe->pat.idx[cache_mode] != XE_PAT_INVALID_IDX);
>> +
>> +    return xe->pat.idx[cache_mode];
>> +}
>
> Oh, actually maybe better to move this to the .c file, unless there is 
> a strong reason not to? Especially if we have to add a bunch of extra 
> includes in the .h.
>
My initial idea was to use an inline function to display the line number
and filename at the location of the call when the assert occurs, but it
seems that this doesn't achieve the desired result. I plan to use a
macro to implement this helper, which should be more reasonable.

Xin


