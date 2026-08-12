Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8207AC5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 03:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0EB10EE25;
	Wed, 12 Aug 2026 03:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMfnj8hP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650B210EE1A;
 Wed, 12 Aug 2026 03:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786506594; x=1818042594;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/GimvNbfDlGxW7Ac7jtdevKUVoAJTV3SwvQ3VF/eWVA=;
 b=IMfnj8hP5m2PKkUkEno7zRVHFXkLQ5ykYFmzvvX3u0B5ONTUf212ME6q
 +QBMv3WhF31+go5P38BUFeyz3sZeOtVpcPHxvJaKucCWbGsIwydUko2qT
 xuGTd6l+hD+hTOKiyXlorXjVW1rSpeCLsJQ/AaVWGNfkowHXR5ggpxHin
 lNBLMpthrVOlWHUEFjYov0x7Ml5CWh4QxF1fpPXtClCJ3oI8ZitTYxCPo
 Oz1RkO/DdzZD74yPkJFFI2eCA8xoODKzmKv8xWJQSyahmNhPb0IkEji7O
 UWGyQj+MOjakQzYvIUsEU4zrnd33uG/5nSoOO2Wx/M/ooq5juE1OxHvzL g==;
X-CSE-ConnectionGUID: dGB8syGATBe2fegbw3HXJw==
X-CSE-MsgGUID: q/WcGgUPTSG6QzEGf1c/yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97395923"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="97395923"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 20:49:52 -0700
X-CSE-ConnectionGUID: Yzd+b9e8QACpfha8gEXlgg==
X-CSE-MsgGUID: av4J178zQReYNB7kGrut/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="260882699"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 20:49:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 20:49:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 20:49:49 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 20:49:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcAazS4agkIrgeExK4zxi1IBOWa+RLe0Qj5w/YrPD2/KMj9i9tx9/VIMTPvNm0l4Av8k/0a0ZvDpTeRnBhr8JchEtbSaAcwM1IsawSIO0XFz265OAFgvhEi9h90j7NMij1lu3Ltj5Ckf4tLjCFQiDp9EUzyge45xiZEsWungrrruGHAOYnDPOms22qzpUIMdY2vCW6bOa1BHmBSOH6ayDG2oSp7e0foa+Fil/VYDzN2e8wC2Xzxy8ZqUP4ucRwVM8rLSVp7n+/rBCTp7jMK1oxvtWSMF7dTOvLuOyFxUGZeM/nyuh7YOpQ8uB4Hm/Tb3YgkYCQ+xikZESpUTucn2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mS6dV55um02yEOds75TCuNapR7seqP3SYwYyBsLJqOQ=;
 b=lEnHm1Id/Pj48vaSwqcTo2qJjNW8x/qo2CzC94/NEx7e28rk0rE+Flm5tNcGC2eUiEG4yjWL/QRO2Mispvik34teD7jWW2pWn0D+3ExBoDc7mMHZSdSXlFr5Q0rVXz5Q9Egt6lDz68nxmeVwnPUJaRAIwUVf1QgWG/gtcrTrfkDKjGxMehAaj48w/sUpyzqYMl2BeNT7cEMfHMV43mdV0fLGAkIiN6C2ZX6ACii952mipRMKKrJWzdA0DlDbqpkBsGB1yZsqU5BMKeL59PVYHGB+OZcP5q6XSh7TymQuLza08lOVgRnglGq++ZP4iClBofJnb2qU8vtOP/Iee3NbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 03:49:46 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 03:49:46 +0000
Message-ID: <d760d5c7-6e2e-45c3-b38e-108571d94cf1@intel.com>
Date: Wed, 12 Aug 2026 09:19:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/i915/cx0: program DDI_CLK_VALFREQ with DDI
 clock frequency
To: Suraj Kandpal <suraj.kandpal@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>
References: <20260811175844.2613721-1-suraj.kandpal@intel.com>
 <20260811175844.2613721-3-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260811175844.2613721-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 9823b486-2836-4bc0-7e35-08def824c04b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TCW8/t81laOTxRBbD4O4uka2l3j7cwRJmP+xUVzq6UrDqc4VXvG4mgiOWPJaze2LKfFhov0sPWPu1kJvHq+6rDEF0/L63sZ+pwsAi6rb38t2sZa59r6atCOamgF/Oby3GdMzgKCYMAefb6FnBoQtcYJfhACW/8Ts5RpBYaDi8raaG21eth9USLuZjDIhXAS2SkhC01QOg8wyxzhe2VYDYcxQZ3D0HJ2ccMSXSZdkBtcpeAWEkVsEj9uBK9In7hA875ExkCZWUj7ybl0jBCeHCVuIM534THoKhU8DUXee7CUGLDqv77udFEnrhuGFCf7Jy6IoFXpgcAO13pKdjvfzSEYyuumngYW2chs3pN4gk0enlNacNJdiS4sij13e1h6naXmKdwDQiu2Lume3308hncwyd/0S+BXsZlErk47Vv/9sLbyMmLGEnf/Hj841qyUvqHUZBAl+KG573MPe3mCxwK0dVY69GEKmYDyYZoiVCWHJYeTI+48lkldOu77CMVWNiSnEpsDFt3xTUQB4o8+Tg9+T1LJk0bcMPykaqu/ls5pmeNea7aLzlIYzV8T/xBlEp3MJGOeQkhepeIBJKQUJJlxc92K0/JI0eKYqnkmLcGUKo/7p50EurasDD95uBV+Q7ZM/PWhRpQkvl5qiPQalmph37B01LQkRPcZ+ehHsVZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGxNME9ZeWZjNFJwMjkxK21aQnZCQVp4VGptWlJ1eTFCdnROdDRwMXFURkEz?=
 =?utf-8?B?WVNHcVZ0d2ZDbDBwZWEwWlluRGJGdzhycGVjbU10ZDhZeWFlSVN0aS9Ma2k5?=
 =?utf-8?B?VFdXWUJhN3Zab1EzVXBzRVJyOW40MW4xT2pLMW9KUFZUSDB1alZHTloxazVF?=
 =?utf-8?B?VTI1b05VWGU0Vlp6em82ekdtQmFKKzNjamd6NmgrbTVORTM3c2JNNXNvT1Nm?=
 =?utf-8?B?UFJNL0ZLT2hxMFl1MGVvcFptYy9OL0tMZXNsWHRiK1ZSNDNaeXdwVzdSenRE?=
 =?utf-8?B?VkJNMlVRTjBoNmlBRW8vaWh2QXdyT0pXRGUveG56a0pST3pIZmtvNzVCSUpq?=
 =?utf-8?B?VTduSjd6RkRwaHdmTkp4WlF5amdVUllWT3JHcHNlc05jSFJoTk43TDF5SE5Q?=
 =?utf-8?B?RG5QNWxESXdqallZV3BjUGE4SGVGalM4SnBMSG5qMHVEcExzSk1LSUk0UU43?=
 =?utf-8?B?VzdDbW9FcnR4K1MzYnlXa0FnNmhKVnhHNGhGV1pOd2t0Ykp4NGpGQ2FEQnJD?=
 =?utf-8?B?M0oxdkFWaFYyWTNLSmhpeW1iVng4WGg4RC9ucWsxM0twUklNWXYzcUF5ZG5C?=
 =?utf-8?B?NGVWakVIWlNJdERNRGNzenIxSjRxL1h4aDVPYUhJcUVWZ3E1WVlxWCtqMkNo?=
 =?utf-8?B?MEN5Z1p5bmFrQ3BEa0lXdWgzK1o3US9XWkNyd3NEWnpnU2x3aTh5VnNNMnBZ?=
 =?utf-8?B?M0NlZGdEbU5NZlBTenZjek1HazZrbWo2K0x0QVREaUJITkhLTklsdHZhN0Nv?=
 =?utf-8?B?bk9LVGZEdlRDbkZreEhUdGxzdG1PTVdlYmdKTzhNMXc4ZGZUNzJuVnlnaGxS?=
 =?utf-8?B?emRQWVlpV3dGWHpiWW55RFNwUTVsb0tMdXdpMmlLUGVPL3pWT0F5WlBVVVRH?=
 =?utf-8?B?R3g1S0dGVjVpZzBkM00rWk5uaW9STU9rMGlIM0d3Z0lTbFRKVmhjcW5SNWpo?=
 =?utf-8?B?OC81SmZlTU43YmNmWVBuV2t4U0JLNE9rREZ3MWFka01BL1VXeUdab2hoTU54?=
 =?utf-8?B?STJjVnd5NTgxd3Y2QXd2QXlMNWtacGRaUGVGbHlqYU5aWEVaOWl4RW5CcExB?=
 =?utf-8?B?UmZJUkI4N2FOVXNVN2xuaFJ5cW1NbG5taEFVVG5jenZ1YzU4SEZnT2pyNXdp?=
 =?utf-8?B?V1luQWdpalVIeWo3SFdZcUxROEdnVTFNSXl0bWxFaVFGcEY2Y0VmTEhudmVp?=
 =?utf-8?B?dzcwWEo5VWhzRSt5czFZTEQrUm5FRDFpdWpUR3dFY0JqZEpxNzBMc1VMaGRS?=
 =?utf-8?B?by85cENsTWFmK1dCSXNueUw0UE8zNlVQbXltODlUb0h3T09qaER0Qk1XNUc2?=
 =?utf-8?B?TGIvVEFUWG1EZVFvaTdTcVludzhJU1RrZGxKMUFraVVBK1FKK2dDbUFBUyth?=
 =?utf-8?B?VTFtdXFBekpjNkdVRDk0SmtLb0ZCOEhGK1dnTEMrMDdNUy9LVDhYckYrdDdT?=
 =?utf-8?B?dGR3elpIUzNMT0pOVUUwaUFTKzA3dVhhSEs2YTQycTZ5ZkNvMW9GUFN6ZmJW?=
 =?utf-8?B?KytuMFEyc3c4UkRQWkxnVVVlSHlCWFNHVHZKRDgrdWtZQndnVCs4WTJBaEMw?=
 =?utf-8?B?eEJ4VGJ0Q1BmTGZJVWxUaDhseEMxRWM5Z1ZSOTlpbWw3VDBsWFBWSmtuZVcy?=
 =?utf-8?B?dGc1RVBXRXVkT1BsWURNMkUzajhyaTRIRDBNb2lGWHRlT1B4VXZuM3pqVWlL?=
 =?utf-8?B?UWhhNDV0NEw2MHNpWVdnU3N1dXJ4VmJUUmpENEx0NloyaDBHZE5MMGdydFM3?=
 =?utf-8?B?SFIzdVA1MXpzSEF1RzR2blZVNzlpMzdwL1lrRVVjTDNCYXNWdlZaZ1RFZStv?=
 =?utf-8?B?SGY0MkxPQ0pyZWNWWFJjRDMxSGM5N1lIeHE1T0NMWTJpZ2JOL21RZnV1a0E4?=
 =?utf-8?B?RmlITGpNM2d5WXZabXVqWkQ1UjZzWjFOSzVneVJ1czU5Tjl1RU1rM2VMd3c0?=
 =?utf-8?B?SWd2cjcvRVdnUFF3QksycHFzVk5qNHFLWk40d0VZU1pacmN4RU56NUFpZG9S?=
 =?utf-8?B?R3dJSnIyQTBhbmFHRCtHdVZua2F3WGRUUFRMTFNGeUZLN1FFN1JJeDlxNXh2?=
 =?utf-8?B?L051MjdmM3dNNUhQMkNvRUJscGNpbXlaZ2NQTGRVRUZtbThUTXhLazk4RXBE?=
 =?utf-8?B?bThFZnVSenJBVXl6eG4yZFlzKzBoWkhCczJOOC9hdHg2dU1Kam5YUmp3T2kw?=
 =?utf-8?B?OVdrRnRpM0djeWxyWGpiYW1Id0R3ckRJRVBDQjVGU3I4VVZTamhDNlZ6aVRY?=
 =?utf-8?B?dTVZTHFMRTAyaGNKdUNpOGRXVHFUNlprTUZvREVzbXBhSzhvbXNtQ2hRbXkr?=
 =?utf-8?B?dkhBS3E1MGU3MGw3ZzNiQzAzb3JSK1Y0UXhxQ0YzN3JyL1NxVXlBR0JNUlBn?=
 =?utf-8?Q?TBzCk8aHzBaxS2iU=3D?=
X-Exchange-RoutingPolicyChecked: Buj1W9sTvZbbnR31m7wSOEFe7V0CCoEaukm/3Unuc7TNOHQilB/BGTlmJu4wEjBGcLG3GYkFNTTtXgo782iniIIS0ObEeeEe/1QoPlOqIGWEy9ueNhQ5SNeMGm4hsZvS6R4kEdoAK+PydJws1a67AHmH5nzLAsbIe4zoZxSrPfSUkjxORILkbvHANGSp3LRjy5OLAsK2RbdGinHTBiCcis1QjANOgaUhTY5VQt1NqE9as1Uf9Q++F7PE8gKotCxbnBRILwq4Ralh28GLX4mt77D8EpXbFAd4QlKULy6GipMhkxG7sYMI6N8ZWrcKR3bkGrrIlI2nw9shEdJgDK2mkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9823b486-2836-4bc0-7e35-08def824c04b
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 03:49:46.5523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0f6Wco/M9eA/17KNh8uiYxjB6CTZYElkxT/tz7c4Fo8jpDTDoHKgJ8SJHQoRSF4diBrlbkV31RAUEGSS1Rn+DVUDT46nxMlRbRr9pOx7Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
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


On 8/11/2026 11:28 PM, Suraj Kandpal wrote:
> DDI_CLK_VALFREQ is programmed with the port clock, which for DP is the
> symbol clock computed assuming 8b/10b encoding (link_rate / 10). For
> DP 128b/132b (UHBR) rates and for HDMI FRL the port clock needs to
> be modfied.
> On silicon DDI_CLK_VALFREQ is a scratch register with no
> functional impact, so the bug is not observed.
> Use intel_ddi_link_symbol_clock() to write the correct DDI clock in
> kHz.

Perhaps can be re-phrased as :

DDI_CLK_VALFREQ does not configure hardware, it only records the 
frequency software intends to set, so there is no functional impact.

Patch LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>
> Fixes: 51390cc0e00a ("drm/i915/mtl: Add Support for C10 PHY message bus and pll programming")
> Fixes: 73fc3abcb797 ("drm/i915/mtl: Enabling/disabling sequence Thunderbolt pll")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cx0_phy.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> index 452062417ce9..dbebd7210848 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -3233,7 +3233,8 @@ static void intel_cx0pll_enable(struct intel_encoder *encoder,
>   	 * 8. Program DDI_CLK_VALFREQ to match intended DDI
>   	 * clock frequency.
>   	 */
> -	intel_de_write(display, DDI_CLK_VALFREQ(encoder->port), port_clock);
> +	intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
> +		       intel_ddi_link_symbol_clock(encoder, port_clock));
>   
>   	/*
>   	 * 9. Set PORT_CLOCK_CTL register PCLK PLL Request
> @@ -3406,7 +3407,7 @@ void intel_mtl_tbt_pll_enable_clock(struct intel_encoder *encoder, int port_cloc
>   	 * clock frequency.
>   	 */
>   	intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
> -		       port_clock);
> +		       intel_ddi_link_symbol_clock(encoder, port_clock));
>   }
>   
>   void intel_mtl_pll_enable(struct intel_encoder *encoder,
