Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AAAC44512
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 05:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07D010EC33;
	Wed, 22 Jul 2026 05:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6Ak0uMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29B910E75C;
 Wed, 22 Jul 2026 05:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784696458; x=1816232458;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=giuiIt5q0EiBjz40eJ3B0lMEp9A4Y0g2hvkypyUNj0M=;
 b=k6Ak0uMudlVvu0N8SiG4H+Qf0uOPHB+92sVJwxHepSIi6K1fJz8edR09
 Rq/wxHrJgFoIWlnMl+Rv7CS4BHGWvgYJTm+zwy++L8FBgG1JWyNP5TELn
 MTJdxSyg9Za7BAljuOidQmuhnkm+1xqNzabIzckVBoGLH7kUSIIcW6sVF
 0EBXtifEIrqrf901rEdr+XZlxJo6wXvgcvcZ0qQGSMCqG3HcnY7bP9IXf
 JiFvgXRcRf2s7wOpG2fabxMXbLJdhi6exmaX2aV323sXmcRc8LcAY5DhH
 PPq//9OMscF/1DLYaWDbToU/L4FUYidNYfsosi104h8cB9eCPQFMFsGtQ Q==;
X-CSE-ConnectionGUID: vWPlsbXbRvmgbZiRm5I8ZA==
X-CSE-MsgGUID: Z/ZoL4eBQfivVdpo6UGopw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="102735469"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="102735469"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 22:00:57 -0700
X-CSE-ConnectionGUID: f0lylhBbTCOu1SqsAg2WTQ==
X-CSE-MsgGUID: O+VUNwRSRge7Y3ZR0qw+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="256192034"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 22:00:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 22:00:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 22:00:56 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 22:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELw3CCOUPsWsi+2fbfr5DRK6J/7aiH8MD/NriPj1pz2UILYgoGdssdoHykGVc4x+yQ4braR+EtnYDpYYuOsXxzKicF3yvLA7ncIj9wIz9E/aXor7EIkLdpMxPjKQbr+U1qJBpUo27ZFEIPA9DNq4Z2C0ocIxEltFh9UDm7I0UXoo3h8y5yvChoQEx3khAgRMqUlRP6GVfOYmBsMDti0fcDIf5l7IuffUEFSMEHjal719tnTXV38kEOlDQ3PJJ0WHrfdJTxmaSS9/cVAr/6qwD7fvsX/rbpuX5x7G6/jlpSy24fHRYezB1vO41+n1uYqy/jMqBjte+o5qXUcLYB1GHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wusHen8Kr6/RzDHaFF2r4OM9D//cetn48mM8rEJMOLg=;
 b=RE081/YDXkALnDVctTCNzf13ZESuE2MrjdxjRn/9cL2Nlq0pgBbIx4zZWL6KhHqwSiBj7vhgm8Rn3cm+J/wNrz9vU5XHppMWFjnhzNoJjj1b8mQ3nNkvZF6rbZowSzFfXMTaG3qhRrP0CXloFJZdTl3CpjOK/nkoTZIct5RVGw4PjNDnb10coefTRfM2Xlb3kiTxgoi9UFdM1//g2QYe2+lytHkTYvixTARYSbCM/WxIemb8jOsjsFm6nmQdQ386BkPor7l2/j6tpMlasMUzIj5K29nvJQ8sWZn4TTqr6u686ad/lK8PcmegjVeoUWDQoNyXCi1fz+fjpiGU7SycCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by MN2PR11MB4517.namprd11.prod.outlook.com (2603:10b6:208:24e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 05:00:52 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 05:00:52 +0000
Message-ID: <68708714-7d9a-40be-8917-da8983204cd9@intel.com>
Date: Wed, 22 Jul 2026 10:30:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: Ensure a non-zero safe window from PTL
 onwards
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>
References: <20260720081803.1123264-1-ankit.k.nautiyal@intel.com>
 <535d50b9-82f7-437d-8eb3-76f7554aa528@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <535d50b9-82f7-437d-8eb3-76f7554aa528@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0357.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::6) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|MN2PR11MB4517:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b9f649-aa48-4581-7a07-08dee7ae33fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ZqdpP8NRef5wxmX2Ja021I0QXgOBBjV2ut+BOWOJxsm3qZQFLyMQXR1huW3ZOLB/OvaU6KYpbEtjuuu5lHeZCeLd2oz0T0dYNeh0zS5pQsOlTfbMa0joguW571XinY3hb/8q5P69Y0rOT4rBi+utesUEPZdZbJdE8981R/TGPpzbXow211wrx2E5mhIZ7SdUpk8jd0DJWmT1S6nBCs0reLtX4jV19ouPUN1qkIf3d8mjp9RnX06B+8q236vlXp7Br6uR706hrQ6aqWEQ9SbGeVw3nTOKnuVgM+J+Z3XffL1h72eQog75BDxJtxqHdzR5vkoHCSq1WEog11JwjA+SmYzQ7O6NiwU3gaIOa2XstWqCvraMiq6wA2MOP2EdemgjABD8qc4vCpCeOkUiiA0zXd47lmdCh6aE2lUzcJLAJMCg6PBVVS/mVOsk1eUUjdciZ1+7s1BcOaAyIKHLSVLp67uYSMT54V9M1zYMVUJ7MoI7g7cMCSF4WnD947xnRgU6vyMb30Y/xPOHqS8VUCIg/t7suRaU3vMC7jCwBHSM8AYwOwz3CvZ5ownJpP8aZWTv6GqzZt1OWQFV9PDwnRpksbQh3MrpZEaGxnsokfLoNPoKFrxsLGRNkqO9iSHQ0oaFZoNWwfSribrV9GTC08UHBpAcXuv9jNPiKo37Puq2k1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjQrSFdWRUFyV0pOYmZ4V0d4RlV1bGZXY2xVckFFektzOUxJVWpKOGZtN01N?=
 =?utf-8?B?NnBlOWFQeVRCY2U4a0kyZUd6TVNIbU9zQkhOTGU1VFRIVHZsSmEzR2FSNXBI?=
 =?utf-8?B?aFBWelY5U3ZNUVhjT1ljVjZQQ2lWZ2RZRkxzZHEwdk9VUngzSUNFMDF2Nmxh?=
 =?utf-8?B?VFg3Y3VvRXZKUjlneElnMnd1d1FYaFpJeWl5d3MvNjh6YUpkMTZxdHZtaWR0?=
 =?utf-8?B?V2pYbVFCR0xZOHlibHducTF4V0l5S0dWc1RNamNOSklqYUtNeFVtS0d6b3o1?=
 =?utf-8?B?aFBVMDJXd0xpc3NaNGlGTzFaWnVOa2RQRzg1NTRUMi9jdUQ1dDl5S1RGbFlD?=
 =?utf-8?B?aE5zM0IyeXFsR2dtSk5JQXZCTHNFZEZXekdDSFJCMVZQUHRmV3JyYU1lYUpz?=
 =?utf-8?B?ODdMTGFiemVTcXRyTHFTOThqNHFZb3J2L2M3ckJlUW9uNzhKQm1OOFJmNWxB?=
 =?utf-8?B?aWYxOXNmYytPUWM5M083MGJuQ1N6OEozalI4clBFQjNnVEd4VFlGYmg5WU8x?=
 =?utf-8?B?cjNpWXUwakdQelRMdUtaWEI3RkZqOWx6QjFYV3hNS2d2V3lsMzJYeDl0cVQw?=
 =?utf-8?B?RXg3OVhyd0NiS2h5MklHRHRUdE5tNXRndzdGTEtEOUJZMGRpZEthZzFDWXVN?=
 =?utf-8?B?V0luRzB5NnpLK2w2TzhyYW92dElybmZUMXVWMW9lNUVRZHAwNmdHUW54eFg0?=
 =?utf-8?B?R05rV08wNy9kYm5Td0tJN3pMZ091WkE0aE5FYWhPQ0YwS3JCNnFtcUlQNjdE?=
 =?utf-8?B?TDNDbytua1JsaWNyYlRkZ3V2RldPdEJhYlhHTW1Dc3FDamxsaHNJSXhsRzIv?=
 =?utf-8?B?UVdGdUh1N2ZaTFpJa25YWGVWWFNXWCs3M3RKTXNHVGhNL2gwQi9oeHJDWG80?=
 =?utf-8?B?bm82a25YV1RoczF0SVFURXNWK2FianJtK0lqaUxldEVxYytyWENSQmtla21a?=
 =?utf-8?B?VEF3STZGUFhkMklZNnB5cDYwSGF6TC8wQXNRRjlreXJrb2oyYzJnWnVZVTQz?=
 =?utf-8?B?K2kvQUU2anlGZkhqNVpuOHBwUkdjRkR1ZUNLdTZNN2lwVUY2ekxMWklNaURv?=
 =?utf-8?B?ajJXVlZDYldXb0VpdEYxbnpkMDBYazlkWTZYTWJQdHU2ZjB2MXNHaFRxM0VV?=
 =?utf-8?B?MTgyaGNkZkdOWnVUM3ZKek5UNjB0SHFFNHFvVnpXNFk3SXNmSytKelRWNXVI?=
 =?utf-8?B?VUJwZTYxNmFLYWFSSUxIMm5tYjI3dXV0ZlJJVGZmcEtlYWFJckR4VkhNR1A3?=
 =?utf-8?B?S2gxNjM1L1RIa0dlTHdQZkQwMHpPK3BYdjdFbVcyaFZWbllLQ1pMdGVoWXJX?=
 =?utf-8?B?OW8xYTg5N1UwN2c5dXl5MVhLKzh5L3FibmNkWk1ZeG9aeFNkb1g2YWxLLzZJ?=
 =?utf-8?B?K2t5a29OY2xqUElsRnpRTUNQTUtyc3JMeW42aTB6MG9VMFd2WlN3eHMzc0RH?=
 =?utf-8?B?NzZDNzBBL09FUzlvak5yb0QwTUxpWnp6T3J0ZlBnUnExdUU4SWh0OEJ5Rk0r?=
 =?utf-8?B?VElJcUd3Um5Nd1FPZG0va0pQUEJRNHJSNS9BMDNQalBKTDBROVpxVitnSkNC?=
 =?utf-8?B?OEZoRlBjRmZKNFZYaXY4TG11bEJRY2xTZUF5c3UrQ2x6UEVabnUzWjM3ZkRy?=
 =?utf-8?B?aktiWWVnZEVJSGFDc0RCRXEwZ1dFcnFIb1JIbmpxaFdVbUE4MUlMZElrd2xw?=
 =?utf-8?B?SVM5L05mMFVRSHorZVRyc1N5cWM0Y3dGSVhpSEsyQkRHeWZCRmxTTEdoQTBx?=
 =?utf-8?B?eTN5dVdpTnZTdjVVSnQ0aDUvT2kweXgvYXhVUXVTNG9uTUs4QzFZcjYvVERy?=
 =?utf-8?B?WVArRVZKRFFyczJxVHF6WVZVRGsxckZFZThSckljMEg4bTZxd0tuRlVROHZn?=
 =?utf-8?B?dmZ6K0lFMmdOaEdmdjIzelpzK0t5QlVLbzBEdEYwR0pkNVFYTGFhVXV2OGRw?=
 =?utf-8?B?a1pKcC9YOWwyZ0hESG1GNGNWV0VraVltZHlFNERiMkVPTGVDcmFLRC8xYVdF?=
 =?utf-8?B?Q2cvclgwQ3BRNGd3em1iRHdYam44NGxaSGpicjNUR3MySWppUUhCZ1FvOEZs?=
 =?utf-8?B?N3F5bFp1R0Y4YWxDYXpac1BRTHNDdUlyV1E5cUQ1NjNEZGNCa3pWRUEzQWhn?=
 =?utf-8?B?K05FUHNMaU15eGo5UnVmRFNQRTFpdndmK0x4SGdpdWQzcDQ0TUk3amt6QU5H?=
 =?utf-8?B?N1V5M1RTbWFRRFEzald3aDB0aWZ1eTlJblVDT3paUDRuRGJEWitZR24wNHg1?=
 =?utf-8?B?Mytna2lXMWgrd0NzNVhVMGhUNHdEaDdsc0NpZnIxUVQ4eHJtTkgxcG9rbUty?=
 =?utf-8?B?a29PcHV4OGxEOVZ2WUJXaFNYTVNUcTVud2ZDWWdwOG1PSXNBemtudUE2MjNs?=
 =?utf-8?Q?AK9uf5Jdk7DwuyXk=3D?=
X-Exchange-RoutingPolicyChecked: a6wTvXV3Ok2QSQpTXXHcHbfF3zVzH6fTVuOHloPDexkHwhhQhcagimiCdK7a31c0IjOkdGWqjteOh0ddS1JrfC+0n4751IYoYT+2cR0fJt8szXvXH8QHrVGLOrZ4Zvypg5hxYpWy+3yltePTsxQOzzb92hwcivF7b28+UMsicP5q5l0jxlURVZYxKJqQF8LjMMVk1oBmfWt+J/LlvyfwaEbR7/ZpfnRVl2mbm1s+zog4CePLcPuWF40g9EStQ2fl2hQsNoZLMm4oDzRG6rQZyKlymLWKp1xuhWIRsfdWBPt3FZ2Gq6bx2Ae5hzsks+64/x0DRJAtQZCD9eZtKqezuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b9f649-aa48-4581-7a07-08dee7ae33fb
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 05:00:51.9232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljjSpsK8dseIXSafPxh1RlLnvmhiIgQx6iPGfw7LEiXQ+ChBPYzGRPay8rqCRQonQGWZ6FPtuiM+qttvw0lyuEAcGNN//+uGCuHfKjsVKHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4517
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


On 7/21/2026 8:12 PM, Borah, Chaitanya Kumar wrote:
>
>
> On 7/20/2026 1:48 PM, Ankit Nautiyal wrote:
>>  From PTL onwards the DSB waits on the VRR safe window instead of vblank
>> (chicken bit 14 selects the safe window signal from the DPT unit to
>
> bit [15:14]

Thats right.


>
> It is not entirely true that Safe window signal was used only from PTL 
> onwards. Pre-PTL it was still used but just for VRR.

Yes right I missed to add that we are waiting for safe signal for Fixed 
RR case. I will reframe this.

Thanks for pointing these out, will fix these in v2.

Regards,

Ankit

>
>> start the DMA engine). The safe window starts at (undelayed vblank
>> start - set context latency) and ends at the delayed vblank start.
>>
>> With modes that have a smaller vblank region, the computed guardband is
>> clamped to the vblank length, which makes the undelayed and delayed
>> vblank coincide. If the set context latency (SCL) is also 0, the safe
>> window collapses to 0. The DSB, configured to wait for the safe window,
>> then stalls forever since the hardware never signals it, leading to:
>>
>>    *ERROR* [CRTC:159:pipe A] flip_done timed out
>>    *ERROR* [CRTC:159:pipe A] DSB 0 timed out waiting for idle
>>
>> Clamp the set context latency to a minimum of 1 from PTL onwards so the
>> safe window always keeps a non-zero width.
>>
>
> I could not thoroughly check if there are any side effects of this on 
> the optimized guardband (and therefore on PSR, LOBF etc.) but the 
> change looks safe enough to me.
>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
>> Fixes: 4a68c7516c57 ("drm/i915/dsb: Use safe window path when VRR TG 
>> is used")
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Assisted-by: GitHub-Copilot:Claude-Opus-4.8
>> ---
>>   drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c 
>> b/drivers/gpu/drm/i915/display/intel_display.c
>> index 38763a6802c5..0822a2194c7f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -2459,6 +2459,19 @@ static int 
>> intel_crtc_set_context_latency(struct intel_crtc_state *crtc_state)
>>       set_context_latency = max(set_context_latency,
>> intel_psr_min_set_context_latency(crtc_state));
>>   +    /*
>> +     * From PTL onwards, the set context latency can be in the vactive
>> +     * region, letting the safe window start some lines before the 
>> vblank
>> +     * start. With modes that have a smaller vblank region, the 
>> computed
>> +     * guardband is clamped to the vblank length, making the 
>> undelayed and
>> +     * delayed vblank coincide. If the SCL is also 0, the 'safe window'
>> +     * becomes effectively 0, and the DSB configured to wait for it 
>> gets
>> +     * stalled, since the hardware never signals the safe window. 
>> Keep the
>> +     * set context latency at a minimum of 1 to avoid this.
>> +     */
>> +    if (DISPLAY_VER(display) >= 30)
>> +        set_context_latency = max(1, set_context_latency);
>> +
>>       return set_context_latency;
>>   }
>
