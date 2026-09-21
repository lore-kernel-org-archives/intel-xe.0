Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012DFC982F0
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 13:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F68410E38A;
	Mon, 21 Sep 2026 13:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1LJTdXB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F042210E38A
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789997227; x=1821533227;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zgwDKEicilXPRVLWUkcZWe59Ge6lOO4HOqHP4mfp5AQ=;
 b=U1LJTdXBrREXKZ6tKubfnik4KKNwYxylwRzCfvPR9LW+pavYqJ5S0Tt4
 R4Ww/3x61YuRccJi7cumuggoHUl+Ai8Osnn8hkBUc+GvIcR6SbCnf1sJ/
 RbKLf5NyHR+dOJ85vk8Y6IxnnINWEtp+iF3a6jgYs0JzrFMrZUXK3SFqS
 ihl8IjdjcuHFklWjgwqC6aCME3ShxtKpcRYsWt2/peKQklmjdnYHbFiBC
 7UkLFY2xfxSIobpcTZuiJV2hRNayQhai8LKjFuZbkcjzyBIH9ruoLn0Nk
 nJRcWcfM4/yoe7OCy+hTbcLOEqjgdYXQ4RJBcN29HEi+y7q+U/Yv6uBLk Q==;
X-CSE-ConnectionGUID: hy9PUlybQPOiR6WrW0iYBQ==
X-CSE-MsgGUID: PpJ5gP5tQoe49KAMFSra7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="93005919"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="93005919"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:27:06 -0700
X-CSE-ConnectionGUID: ybIHojEtTM2+sG3s1U6CXQ==
X-CSE-MsgGUID: dGCf9VP+R8St4XCP+gK+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="277446141"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:27:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 06:27:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 06:27:06 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 06:27:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVWQT54iTZnhvObTXS8BD+fI0/qczaJOo/u0ZiipVjJt+UfdYs3JsI4DojV7r3PPtFjeJTSmKd1U29+QNmDkdWXR2sCdRDoVqWBNW/o5FnDTQiyM02QhTn9QBJ0XGZvg/7JmkxCd4o7nFHYtGApM9JgU92GJn/o5tV5f0MKSEJANI/2osni4L7c/Wv8Csu5Rr2yiiGHuWHc7WOGyM2nmpEji2I7kFKkmGNbqKlhFGcSA+Fesa3geogjLi3K4izsBeBTE2XNgiF0LZA+5e+1dRiYGLoE1MGkUhDLl2+Zf5T4hL4ZVg65xL5QhfVAaLXLii1kfSeSEaPHf+aTknM4Ykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAMIvn8edUrUK0W4BaErZLkokwbGg0EYFEQdSAgw1/I=;
 b=TR7UYbBrWJAL9gpqCx6J8b7xH9/jUaChLeTnLYBfcjFpxhh13dvMaK11pgkPWzmD0RT2lBG53oobGDStRJa13wdUdKnl2gM+OswoGgC7731IgzW6VqOSwsbB7kXpM+nDJnT/FNDxPDrG5XnnLA3I1CVBGRMixtai893BLEdKmuSu5Gi1cW0UGZTJJLxKNiqoC+03VhIWUHIURjylkbCph4JxYbAWt+9Z0Dc0V4ZPFtA3VxOQNhAU/O8laiw8DCrJNZ1ZrYnR/lDI1HU7/yEMNm/m6NzWl6+/4zxqWf3kfaYrBumQlnI4F/wejQR+lDMhaOU+uKIR7yWLuikvgZWFNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by MW4PR11MB6912.namprd11.prod.outlook.com (2603:10b6:303:22a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Mon, 21 Sep
 2026 13:27:01 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0428.009; Mon, 21 Sep 2026
 13:27:01 +0000
Message-ID: <ca165f68-b84e-4a78-af7d-03c32185ffe7@intel.com>
Date: Mon, 21 Sep 2026 15:26:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/10] drm/xe/sriov: Add helper for VF GGTT
 provisioning alignment
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
 <20260921092101.1243989-18-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260921092101.1243989-18-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::46) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|MW4PR11MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4f5196-5182-406b-ed7f-08df17e40505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0hLCqOVEIMLBfWCdCwJ+2jQSScfCDtspnt8e8X4FdaAjgmtC5F1Vtf0TSYolWs0On26y1iVdqArKMvdBpdJV2jvO9hcg9YrKs4yR8eYNVPScBj7geeSyZdYjjPtrhCJZWsNinJrmtGutdxudVLEsmZEqAVUXvKH+1RkpL5HpOz925cHzbxe3Hqpsn3xYV6KXk1U2NgdIVfZhSQOliHBgKtQCP7i05LM+fuOENZ9avqBF2puKovDuDE9prBx4GtI8kJvXKUktUOVCeFlVEyDkLsUVFwU4cci7D3g4nGghN2PXrqVIwe7E5f5LITiL7KFH9uSqQD8b+Soubr0A6Psmxqr31dQLshZezYYZ+B/coiumtGVpNjLPEui2t/j1mqj/riB8Vcl17UbNwS3N08tmbFeKnzjm6bjHHCivDVeQFq4D3Tm9HwLhNtYYedfs3NO4NfeabOARriJW7v/XIPjNwilKprIqq/wbgVTjbBJkfIFG0QoUNeVbCEwR6SqAu5dWWBU9oHlcPmdU1IiX4j7H3W7zzve9omR92UtB68HssTf9iM4I4T/viz478vPjApC2sD6q2eQ9UNMuALA/D/u7d4c0Shr/it/iyghJotrQanAsUlj3JHbzZXcfLgDFiCEYBbUrRbpsGntPhnGCyWES8mqjGz06P8w/cRQvKj1xdd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjVvaXEwT0xIZm5saHpCMk8zQjVWdEswNWJld0V6Ky9obWg1OFYyTk5UcTBP?=
 =?utf-8?B?RWloT2NNcml6Vm4vUllVYXU0U3RTdDZIeVZKWTN6ZHdPRHBrbjVodHZTN1Zj?=
 =?utf-8?B?dEE1Y0ZCK1ZiVmdUR3lYUmQrd1pHVllORXM3eVFXVmdjSWF5OVk4dUwxM0Uw?=
 =?utf-8?B?QTlqSjlSbi9URUIvZmpTMmppbU5HTXJ4em5wekI0UkNtemhvMHFwQU1RWHU5?=
 =?utf-8?B?b01WbUdBcjFWUFI5b3lqTFFRSUs3U0VkTmlhMUdFZzhKS21NVVROenNIdDVG?=
 =?utf-8?B?WHhabzB6aUZ2c1VSL0JTekJGY2RxWmxQRUM5WEdHV09CSUtKcG9OYzFidUZ4?=
 =?utf-8?B?dk5RSWkzNkQySUNkWlQ3eHE3S1NlT09na1EyN3FXdHl5MFhBNlhNM1hqTEYv?=
 =?utf-8?B?d3NZQ2Frd0tvUXY4ZTMxMytYRG5HNUgzaW5QbEloOUVnck5oUDdGNXRVL09i?=
 =?utf-8?B?M3M5Z2h6OHRQYW1sRmhoLzdCbWxQOG5LelplNGE1V1Jsak12TDBCSHVmTndu?=
 =?utf-8?B?L2EvSUNGZjZuMFZjS2hlSFRDSVdVZXYvaGNMaXZDZmZ6VHFZcVBFYXVBcjZt?=
 =?utf-8?B?bURaUmNUUHg5L1JwZHBzd0FxdVQyUzFaY2wyQmNUZUpwL25FUE93MUNvV0R4?=
 =?utf-8?B?Q20rWVdNRHFaZ25lMTBVUGQ0elR3U3UyRy9yOWlmcFQ5LzBVU0thNzF0QU9P?=
 =?utf-8?B?d3FNb3ZsVVpsSUdKK0lOdXVjclNCaFJBN25sZXRFakNOSGtFTVJjNnpraXhp?=
 =?utf-8?B?ekNNL1dQWnl5bEFBYkNWbXY4cmxqYk5uWHdQMWMxbE9yN1doS3lmZkd4WFh3?=
 =?utf-8?B?dXJQdFhPVlloMW5uVy9IWW1kdWpHQTY0VSszNFQ0dHhzZ1ZWRWxyZEErUFJK?=
 =?utf-8?B?bk5PbTJBUzQxRFduak1ONGorNUJzSVBvOEJKNWZjdnJlbTBVQVZMaWtGYW5p?=
 =?utf-8?B?ZVM1Qk0wWkFUdHArT0NLSmRsbkJKY0NVWFdidUR4TGI5ZkpQbFl0WHlvS1pw?=
 =?utf-8?B?cllEMEN6cDBDY2ZpanNnWThpT3JYelZ1MlM3NkYzY0FqUFFIRHA2anZzaURn?=
 =?utf-8?B?YmZVM3gvNmlpUkpBNDdkN0p1VnVCTG5XaSswUWNFUm1ON2ZldmQ3T1VkazB0?=
 =?utf-8?B?WTRIbHQvL2NXN2dRcDV2dVc4VEV0cXlubExWZ2E1MHhYVU5iRjI0Rnp3Szc2?=
 =?utf-8?B?QVhuZmFQeVlna0lmcHo3NklrR1UyTGJlcU4zUjh3NDJTdjhIMnJHbHpMUmtM?=
 =?utf-8?B?UktCMXdTeGhYYkV2cjVGZ091VlFsRjE4Q0RPKzBIeENxSWdVZUQvYUsvTU04?=
 =?utf-8?B?Y2dESU1OaWV2WjN2ZXZyN1ltNVVCR1Y5bitWSEcySTRqdmw3anBPdWppSVpn?=
 =?utf-8?B?NEN0UFppTC9maTU4cmhDdGFIR1V4MU1TOXQwUWF4N3o1Q0w4Zjl1a1ZHUkx5?=
 =?utf-8?B?QWhiK1pIWUpSc21GVVVJSjdxbFNieFN4ZDRGeUxTYTl0MGVTeWdKNnhISHJP?=
 =?utf-8?B?Q3JIYmlOL20xejFvdUpCcGZ4U01ETS81QW5tMzArNDdkQWtOaUoxSDZrUWxG?=
 =?utf-8?B?M3J5cHJOOVZFQ2R3RUFOOWhKbDNJZ2JyTFZ6K0dNVG9ESXVmSTA2QUVrN3Bt?=
 =?utf-8?B?dHVESk9oQXhJYk5uUlN0RTN6dTlWcnZucm4rMWI0UUtWSVJPSEU5Z2JEUlBs?=
 =?utf-8?B?Y3BEU0pDempSYkJiUEw3bmE4L1llMkYzWU9TN1N5RXdlQm9NaDhINnRITlZ0?=
 =?utf-8?B?YVRBQ21wU2dlYWpUMVhtY2FPbkhCSi9KdisrSm1lNVR5RFRobG1OdDQwL2l2?=
 =?utf-8?B?b3JMdWVRSlhDQ2duaTdVelcyOTVoaEx2Nk82LzhDYWg2UHVMUktLNDJMVnlW?=
 =?utf-8?B?dXhDcjMrR004QytxQ0tjNHBTZUlwSEpCSURTeUwvNCs5YU1Kek1oeDVBUUoy?=
 =?utf-8?B?Y3R6bWdJQzltTm5KMU5ubFZpbDZiSTVZZmtsYXJ3cmF3aGhpaGV5ZkhUNXJL?=
 =?utf-8?B?MllxTE8zTkUvKzkzZkVLU3NRa3pneTNuNDhQTVJFSC9rRDFtMk5HNUVsbmxI?=
 =?utf-8?B?L0RaSmNLaWFBUnJtek1yTUQ4YUJYbXk3ZVhhL3JhNlc2Q21jSy84S2VJaS9O?=
 =?utf-8?B?azlLR2dIMkpJcTBuZGx4dU9oOURaU3hRd0QyNWkrcW10SC9wL2gxekhTRTVI?=
 =?utf-8?B?c2t3Nk0rV0phOFplcCtzS3ltSzZWbUtoOXJRbW1FQ2JqdFFEc2oyMHZXWVVw?=
 =?utf-8?B?eXR0V0hhN2dqQnRIa3F6UGZsQm1oUk8xV25tZUtLL2JDb3hNcG5lREFLbzZY?=
 =?utf-8?B?L3ZIRFZFYlgyLzFibTJqbktGeUcwcUNkeG45MWs2dUN6QUd5MkY0UDdOWnVR?=
 =?utf-8?Q?HST75ALBa705bjTA=3D?=
X-Exchange-RoutingPolicyChecked: PgmZk7PssBYD8KyDWNvjYQiC3hJe5wzkkWZ9YUXg8P3TzjUsg64FTNRz/xeL1+n6hmAxXvvj+65MGJKJ4zukOyJd2gIpoVOu7zSS/M6AVmy64wC16yjREsec5aH65+GmzJvUNDOmoU8Sgu0nQkoH3b2mfZZGILVQmGUSAD7qFXRM2Kpli/ba7jGCo1bOW+yp//QoztSAVL8itoBJ+Pi0xM2ITgU0jYRMiMvHDnCT79hko4iW9XvySjfOUYQPAcSMgmCKIrRm2KK3JUwZqEVWhNu8xBFQ+vVlYtJ6b2Jia0vXrnE678/E3utsL5i8R7QAXZGFDEMbq4SQC7KSu2uQMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4f5196-5182-406b-ed7f-08df17e40505
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:27:01.5189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aebNlKQBndosuaJpNzFz75chm7WNCi66a65aNfQ9kxWkszmBMJ46zfWLqDkd6XMOPCUy6oUcmdlnoCLv/YN606g+Z/ou4sbf/9V4dekdBaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6912
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



On 9/21/2026 11:21 AM, Satyanarayana K V P wrote:
> The alignment of a GGTT range provisioned to a VF is part of the PF/VF
> contract: the PF must allocate the range with it, and the VF must be
> able to verify that the range it was assigned respects it. Since PF and
> VF run on the same hardware, both can derive the value independently.
> 
> Move it to xe_sriov_ggtt_alignment() so both sides share a single
> definition.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V9 -> V10:
> - Created a new helper to get the GGTT allocation (Sashiko).
> 
> V8 -> V9:
> - Update PF GGTT alignment to XE_PAGE_SIZE (Sashiko).
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  4 +---
>  drivers/gpu/drm/xe/xe_sriov.c              | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_sriov.h              |  1 +
>  3 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 6947aeed458e..04ee0fc08804 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -441,9 +441,7 @@ static int pf_refresh_vf_cfg(struct xe_gt *gt, unsigned int vfid)
>  
>  static u64 pf_get_ggtt_alignment(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	return IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> +	return xe_sriov_ggtt_alignment(gt_to_xe(gt));

hmm, while looking at __xe_ggtt_insert_bo_at()

	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
		alignment = SZ_64K;

where 64K alignment is enforced only for VRAM objects, maybe current
implementation of pf_get_ggtt_alignment() does too much and is too
restrictive by forcing a GGTT provisioning to 64K alignment, as it is
still a VF responsibility to use GGTT wisely, and can use 4K alignment
for system memory

>  }
>  
>  static u64 pf_get_min_spare_ggtt(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index f3835867fce5..d7704d226554 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -174,3 +174,14 @@ int xe_sriov_init_late(struct xe_device *xe)
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_sriov_ggtt_alignment() - Alignment of the GGTT range provisioned to a VF.
> + * @xe: the &xe_device
> + *
> + * Return: Alignment in bytes.
> + */
> +u64 xe_sriov_ggtt_alignment(struct xe_device *xe)

hmm, it doesn't look like a SR-IOV specific function

maybe it should be introduced earlier in the series in xe_ggtt.h as:

	u64 xe_ggtt_alignment(struct xe_ggtt *ggtt);

but given the comment above, maybe there is no such thing as "GGTT
alignment" at all, or it is always 4K and we don't need this function?

> +{
> +	return xe_vram_alignment(xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 72e55543c30e..ee770afca00b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -19,6 +19,7 @@ void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
>  int xe_sriov_init_late(struct xe_device *xe);
> +u64 xe_sriov_ggtt_alignment(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>  {

