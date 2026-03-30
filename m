Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F23610D14AD
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 13:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4871F10E6A9;
	Mon, 30 Mar 2026 13:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWTop9oB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2764310E6A9
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 13:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774875647; x=1806411647;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zpdoklSGTSXesG6K+ndS/eelvfOo3lVSqcw2oBGMRGs=;
 b=bWTop9oBmn5bC6LqYS1+ai644jdaHKkFnsJ3baxsbzta5CNKtJ84EVqQ
 d2Xg6PTCFnJCufkE1Enz+0Q+lJ3Alii4Qczm4Dy+zdhXCOZdz+b44pM2+
 gfqpLE2z/2YNhYuK4k2NIFqNg+Vw8A4sP7eQQjqM034k2bBz+qNBXuB81
 37OxzzBWLOcTeS7vZniww0UfJoqco4yjTextjAIR6788V1zMd/hJ9OAVJ
 Mi9pogFgYOA55WULOIjVwBbfkERClgSRXtTss+kYD86pitt//S4PbhYh9
 CoPTjY6vT4d+Gky7VgLqV6F9y4jzrIZHCZoKN8EzPrx9oasqFCDR4hVwX w==;
X-CSE-ConnectionGUID: Ge2TR5iATS+5MbWLx9YUuA==
X-CSE-MsgGUID: QNdf6+OzSsKNxFEUFekRSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75043826"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75043826"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 06:00:47 -0700
X-CSE-ConnectionGUID: l1EnPO7iSYiuG/2bd4R08Q==
X-CSE-MsgGUID: I6jb3vngTYeVCNk10Wixfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="226037536"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 06:00:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 06:00:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 06:00:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 06:00:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoprFEiBfilvbYkFLSExa4ZmSbJZV+mSkAQEA4bRU2dNA5IXRe05nSYDgDbeH2iyVJvTeAAg4q/YHR8p68MEWp3U+0rvzDZMRIQBWVwy/4app1DHBrhegULaHoXohK2i56A1TOFxbDoJZFmqMm1nTS4rd6Atz/fmJ+80SGEWUzu+51T4N4GSQBV3uKZWsizZ1IaXNV+rxhbuLZpOa3dFJ/yEVdJ5BCsLyE47f0kmXWHwwnXRlI+pk1Hjv4jrWvr4TpHFjnUFNy7BUcn3/XcnFDKX9zp4+/9s/eL/9bKhr00Vn8zzjYugSYitaH6X/nbdgFkaf6+Rgj/wn2h7LU+rSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeS4quMA0LQEsBiWM3l5aE7CHH3dyaHqiblfX8cplZo=;
 b=ekyI5R1NEZ9+E+TWPWC8k6W0QvUT27VRad2ni/UWexxX8tSkvu6tahKuB2+TEBl7BEH92KJU7EjML42GKQRjNzxoI1YhM1JLTDSIb/uJnIb9fbZuzVTaO/JHfCovJe64bchNMPKw0dLjO0yN2L/YJTAMB2PZ38WD4O3F88/AVieJI3TGaIaAQHMTxi401apPQUZmTbV4NBa2tHuSCIyizacOF8YpuQUOT0brr9JKqnAr1BoM7471I5O7Ac7T5hbm1jKX9jcLuLqrWaXJ3c9BIjsvc5r+oKa+EIcySOmJ0T8vSY580WJWcU4Xq9YbBfhBT2Gk526rLJvOoMcAA98TWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW6PR11MB8390.namprd11.prod.outlook.com (2603:10b6:303:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Mon, 30 Mar
 2026 13:00:43 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 13:00:43 +0000
Message-ID: <09149a69-6af7-46b6-9d2f-e5a83062120c@intel.com>
Date: Mon, 30 Mar 2026 18:30:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] drm/xe/xe_survivability: Decouple survivability
 info from boot survivability
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-15-riana.tauro@intel.com>
 <aaXCL5mABQdwlG_X@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aaXCL5mABQdwlG_X@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0167.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW6PR11MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 25fc555b-303d-4e80-306f-08de8e5c59bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: b/R68n4ZXsaDyWboAFRkdMRXiOSrm6XpFDPEGuKQ7GTpceaCKwlFtJO+B/HP7+jx6MpRo/jRsibEWHPk9SMARNOBYqgnUwVvrZGBY7iccpYZBiW7CA9hT4/AYG2ME0+2776QpCognWGBpBG3sEatMGCAsBRGEnR2jjsiKquLL7kIBADH99AcVY4QoyTRnqAbmqz3lYd8yhX/Ds64P5lA7mBA3Fs0UJur076pe1D16PA9x3kkFPicjMZmgxqk9T727CdFphR04yRoSJjdE7iv/fOFNNwd4m7EgkX9vB3jyStW0ffVB+vdOAYiL3w57cGgogy880l4kqrqERCs1MmGDALMoZNoyqN1lL6s4NmcwzeVqHp24NeoSQJx3CfOYYpA4xb9k+/9Wzi8nI1q1vJM6PCSDzp7bitiFb0YLiyxscxhIBBLwipsW0qGuCVy0xfK/bHXIR1hlJWDcDJZPgq+CmuwWosiBz1zhpoCoCIBVLLC3xIMxPfpU+lc0tmNN6EnWGxsBr16sNQVQnOFvewuNoIjOsm4a2uDYIHTmxzYKrLzFGbtnngZIQyyLTbceF+Wg5JvymPB/jQFsrkUKtpoPzek0ImgtmJdivHPq1dMnbLP4aoewTH371EYGHpdDZQ/Wg6/gqmTFxppyFS3ABZJTjCM/0gGUvLS2aLaIc245FDM3C3tQnKDgeQewIGZ4ISSArI0xqgBwnaFqNDtCgEIAG/bw5sZcqo10BvsZyRALm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUQ4bDVibVFiN1loWE5MTXhtLzJWdVZWNWE1QlNXaFo4RHIxVHJiaHN1N3Aw?=
 =?utf-8?B?TFRXRzRPeU5ONjdRN1pOMSttMGFqRnBmd2tHVzBiZkowbTR6NDBaNWhrbHZY?=
 =?utf-8?B?UG1lc1dlZTRiN0t6YXR6U3F6dkFwc2k1TGdhMXNZRm1rRmlCamVTQ0Y2MDh2?=
 =?utf-8?B?SWlHUkpnWmxnZmVITXZ6b0cyMXd3c0JXSjlBeFBQR2FhRi8xaTE3SysxSXBq?=
 =?utf-8?B?amRSb2Y0dzJ1N09BcW9DbHZ1Uks2QnJlTkd1dVp3WDVmUFl3U0hSSkNVSVls?=
 =?utf-8?B?L2U5Y092T0V3TGwxRW5aaXdsOXZjcnUvT1RJR0ZiS0tjNDl3bzhnMmxFdkpP?=
 =?utf-8?B?am1rQkx1Nm5TelhNa0k4YVhOSFFBR0lqN2F1NGc0Mk5FWXpNZUVPYkFZQU5I?=
 =?utf-8?B?dDVoSFNsUWgvM0tQMWcyV1JkWE9DYXp6WGVDYzdwSGtqNUVZNkkzZDYzQzBs?=
 =?utf-8?B?dWh4bndXY2l2RXkzVUlabzNwNUpRNUtJSWVLaUpFazExQ1ZzbmJUWFJMMFdn?=
 =?utf-8?B?SitONHc5bUVacEtabk4xckhEUzZEQWxiTWxTTVJkd3JmU0FEbnlXYzJoSE9a?=
 =?utf-8?B?MXV2TG9PR1N5ZU0xRWdZZCs5bnR6MTJSTFZaYmV5SHpVSnlqallhK0ZxeWVU?=
 =?utf-8?B?d2lPeXZHSUppSm9tQm5CZnNNUjE5UFZqUUdRWVBjb3RySXZydG9KczlmcXJQ?=
 =?utf-8?B?c24yS3B1Y3pWRER3TUtCbHhEZ2NkMnVTRjlUNXo1UzZ2UWZ2UWxUdUlkZSsx?=
 =?utf-8?B?OHE0QmgrRmZ4TFJpREFXeFp0RG04SENFeTZSR2psVXNJSEorTG80VDB5aFJL?=
 =?utf-8?B?MFVpZGIwdjBKdkxzWU5pMVBKeFJ3aWFpYkNxc3IySHlMN3ZQeGFNZUxwNUlz?=
 =?utf-8?B?L3NlMDQzaEtPUmNNUmtTbzhoWkdRWFJZSzhnK0VJNTJjbWxxTVlVWDAxc2xi?=
 =?utf-8?B?TCtPeTV5T1ZqeWNLK1dSS1llalpWRU50S3Y0RG4xcHY5LzdlaG5veUZDTm9G?=
 =?utf-8?B?L3ZBNCtrTElSZlYxdnpNRE9FamVjTXRRcjl0NUtNOVhNNzRJbXk2TWJ1KzRF?=
 =?utf-8?B?bTd6Z1pneUNLdHQyN0NXWE5PbHBKdHp1QzdXNHdVc2tnWWswbzhoR28yMHdI?=
 =?utf-8?B?RHNLVVZpbTY4M2ZvMjQvK0tNS0IwV1ZHVnlQR3B6SWgwcE9tS2xpZGcvSVZq?=
 =?utf-8?B?Zm5GbzAvbTBraG93Mm11cXJwV3BodVUwdnNyVWlSYlNvZGo5U3l6YzdNOVhG?=
 =?utf-8?B?Q2tEMGtSeDMvL0NYV3U5TEFuVVNKUDVJWW50NkpLSU9BVzlBdWtSUkk1dnJ2?=
 =?utf-8?B?ZVhhK2lScmo0SkUyT2RlQStaRlBScDd2MUZQTGlvT1MwdlVqcmpLT0xxQjE4?=
 =?utf-8?B?eTdsbU02ZWkvMG5Dd2hrVElsUVF2NjZEMGUrOUROdmd0ZEJqRldzeUhDbkND?=
 =?utf-8?B?TGU2TzA0YjVwREdhRGNST0x4S3Zxd2xremtwK3p3ajBCUFBOWWR4QlcwTnZQ?=
 =?utf-8?B?RUFaZjV1Z3RpR1VhWFRiU3F1UnZkUVVHYjZmWWtpRlhNK3JsbmJWNnJOMXVW?=
 =?utf-8?B?UTlGc29STWltZ0VHYkhqQ001ZE1CRnVySW1nQ3R1RnlNVjlxdE10WUc4cEh1?=
 =?utf-8?B?MnlmbmxVM0VMb1Z6TU5xc3lyNTRGRGRPYWVwRXFrYlRaaDBTM3IwTU9VQVI5?=
 =?utf-8?B?QjFuUEZKQzRiZm9nQzFzeWlYK3BPTGQ4SVJpYjdveEEzaDN0MXJrcEU4NVov?=
 =?utf-8?B?bWpNVGR5elhmTVF2VER4RkZjcHRneXpRWHlWVk40ZFYwanJCUCt5T3lrTVQx?=
 =?utf-8?B?V2tscFJnUVA5Qm5SRmxORFdlZzhCZEpkaEtqL0dvQVlubFJjSEUrVVJxSEpO?=
 =?utf-8?B?a2dxYi92eGhORzNxOWlKZEpQTlVHQUFoNDJFd01SSGZ5VGxpaDV0K0dRYVhm?=
 =?utf-8?B?SWVXTWdtQzF5c2p5cDNtaExMZXRHbGZyWFB0MlRhT28wcXJQVlFoWGQrYndP?=
 =?utf-8?B?V2hOVUIydmlVNnpCbGREVXYxL1o5QWZoaExXdTR6TEkwSFhpdzlLTURXczBD?=
 =?utf-8?B?QzZnWUVlSjg3bHg5enZBMzB6N2VtWWNBUlpicHg0cTlLemFGM0ZwR20xVHR5?=
 =?utf-8?B?c1FzdVJyZW5LOFkwYnEydW1QZnBIZE03N3dZZlBQcjBKOFhaSUVKZ2FoYk1S?=
 =?utf-8?B?Tjh1L3UvU2hJOUdpb0xJTjRnZHkxbDRNV3NJd2diSStqUFJIWHZDSzhFREtu?=
 =?utf-8?B?SlAvS2Yzc1grNnR3LzZHVXhsT0YrUFhRaklVWEVEZWwvb3o4a2hxK0NGdHlP?=
 =?utf-8?B?QlBxSEo5R0Y0b21xUEJXci9tbTRtY2VZMTUxUXRMQS9CWGhBb1hMZz09?=
X-Exchange-RoutingPolicyChecked: lzDwyAUgGxYXF1XY6RGzczLj6wCa/1pCa9HVyG+Nx1RQgS/KoMyAl4qisNtJsQYmrw1gbyauz/FfWaYJ821+fcUhibqXlJwHxbaVRPZUx9SwG1i/NJUdCa+WdGBEX61AaULlpRLqu95USvHY2zjr3O7QfLPG5lbN+7ZUwG6j31x+6PcOq3iac7jbcrsUJewyRL9tgDo6EgfLZbZj3cTF3gczd2FMMOdSNGh91bII+5G3natnscHcZg3CKIKTKN1W+8e2lP5M3Rb/sphgJnkolUKRlnN4KX4s670csJ8sfLkhQ63MRcdmU9RrSsE8t4Q7y3ZdyJL5cmhWn9MJovBukw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fc555b-303d-4e80-306f-08de8e5c59bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 13:00:43.1518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jU4BWOG6uv7ylMD2L77XvvjgVj2QIzOdrVfb02sNV8+sYg6pRgfryq49noFTl967swMQSe6SLJ0gURHW2fE1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8390
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


On 3/2/2026 10:30 PM, Raag Jadav wrote:
> On Mon, Mar 02, 2026 at 03:51:57PM +0530, Riana Tauro wrote:
>> On CSC runtime firmware errors that requires firmware flash through SPI,
>> PCODE sets the FDO mode bit in the Capability register.
>> Currently the survivability_info group is created only for boot
>> survivability.
>>
>> Create survivability_info group even for runtime survivability to allow
>> userspace to check FDO mode sysfs.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index db64cac39c94..70feb192fa2f 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -98,6 +98,15 @@
>>    *	# cat /sys/bus/pci/devices/<device>/survivability_mode
>>    *	  Runtime
>>    *
>> + * On some CSC firmware errors, PCODE sets FDO mode and the only recovery possible is through
>> + * firmware flash using SPI driver. Userspace can check if FDO mode is set by checking the below
>> + * sysfs entry.
>> + *
>> + * .. code-block:: shell
>> + *
>> + *	# cat /sys/bus/pci/devices/<device>/survivability_info/fdo_mode
>> + *       enabled
> Currently FDO_INFO is defined as (MAX_SCRATCH_REG + 1), but I couldn't
> find this case in survivability_info_attrs_visible(). Or did I miss
> something?

This check is present in survivability_info_attrs_visible
&attr_fdo_mode.attr.attr is at the last index.  This is made visible 
based on survivability mode version.
I will be sending this as a separate patch too.

Thanks
Riana

>
> Raag
>
>>    * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
>>    * survivability mode. User can then initiate a firmware flash using userspace tools like fwupd
>>    * to restore device to normal operation.
>> @@ -296,7 +305,8 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (check_boot_failure(xe)) {
>> +	/* Surivivability info is not required if enabled via configfs */
>> +	if (!xe_configfs_get_survivability_mode(pdev)) {
>>   		ret = devm_device_add_group(dev, &survivability_info_group);
>>   		if (ret)
>>   			return ret;
>> -- 
>> 2.47.1
>>
