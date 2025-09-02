Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C411CA1007
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 20:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDC110E0A6;
	Tue,  2 Sep 2025 20:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXslR7HG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B8110E0A6
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 20:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756846004; x=1788382004;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9P1u56CLpulsNAQY2GnyComJVUHgznkfCkjGH4/zBJg=;
 b=PXslR7HGqEsDvgU4DiACEZHQPxLMTIYPm5bLaCx4GXcjSAGsTyjAZtnb
 DQ4QJhrNW9+9mCsV0aDrD9R6YSwVCMliNJhZzLosIFlgFKYitAB8a3Zek
 8zDO/YJzsA2N1Y92qCuuOc8opdZ/j/lQFcNfTJol/ph616wmq1azBGrCW
 oPGU083GsRloaFSL+gdOAS90eEpmTfoQ0VRVdSkhkFrjPDuwfPG+t/z3t
 wUpPd/zJcdwHix3+TbHyo/tR3UP1AZSZsfcvl12TWRkBTqSQh8Pg+mJzb
 vdy84Zjlr9WvjhV5eYkNUgLvfXc7a4uINuA7jEe9j1my17w20gIVIeXrS Q==;
X-CSE-ConnectionGUID: s3ceFnlCSw220rqD4tP09g==
X-CSE-MsgGUID: jalz8QB2T52ypICDd+LBzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58996636"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58996636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 13:46:44 -0700
X-CSE-ConnectionGUID: bpUouqRFSg2Q1GACR0fG0A==
X-CSE-MsgGUID: B0U/O6WzTuaRM+SagCrbyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="170653508"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 13:46:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 13:46:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 13:46:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.69)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 13:46:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEbZgtQ6JbxAPJ11gG2YRqkzqBmKkh5mKeh84iVssCTcIfDxZFXAzSasCKYSsQpI5edw0oV0vYbLUixIn3Ot4Rm+ID3y0Bg7E9W4CoJiHF6cZSzqMtnrP/pW0RJceZc7a8VfdAJwqtNOAfkMbQGpP/JsL84lprGFb3KSOTv7BCPMrqTesSx0wr6mq9IA/wy+51pJwAjNRld0sCyJbHHyLRCleuVLDeoff/xzZNsMNPuqA394qs62NzMLrM6/FbGxni+UVKz35gzEU0GTrs/BwMpXtGaP489bEb2XKVP90DNF7aMhTLxKQq3Qad29vCN0ecEGVeeYzxxA6RbINVlvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3H8BcUMrETkeGdOuaJmko9WFO9Vfxi6ckHUFcyZaE2E=;
 b=TofetKkK9w8iAYF7mD1AMEThybjrv16ca2HnVmNc5/g5q70uSVm4T81C2wHnIPbRKPAC5G9qwR3wimGztvtL0/TBUShzq2UBeK+8X1UiqrgayIyYRYFYRLSjjdaQI+6LiHfB5XgGEsFqp4dSdc/JR9JKCMqxN+Ug0Zzc1YDA3ThiTBWvcbdcCf2Gofzq87s855xIsAwtuaKEDEyWgICdVImTcB5PBMk8uyVf6fB7u8yGnGX0cZj9KeGMTWTilmxCTRkXBbmAyKmq73oIK2A80EliN5+jPpnRDS9+IojhQn4EsNDLF0hOpi2dHOm0Jaobtxcjwk+xvZM2sNyF1dtItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by PH3PPF10FBEE80C.namprd11.prod.outlook.com (2603:10b6:518:1::d09) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Tue, 2 Sep
 2025 20:46:39 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9%4]) with mapi id 15.20.9094.016; Tue, 2 Sep 2025
 20:46:39 +0000
Message-ID: <02788271-c104-4268-ad20-70807a890387@intel.com>
Date: Tue, 2 Sep 2025 16:46:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/guc: Recommend GUC v70.49.4 for PTL, BMG
To: <intel-xe@lists.freedesktop.org>
References: <20250829235305.672287-5-julia.filipchuk@intel.com>
 <20250829235305.672287-7-julia.filipchuk@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250829235305.672287-7-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0179.namprd04.prod.outlook.com
 (2603:10b6:303:85::34) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|PH3PPF10FBEE80C:EE_
X-MS-Office365-Filtering-Correlation-Id: 58cae34b-22ef-4453-fb85-08ddea61d0ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEJncjhNVGJHWHBvcmpYc05FNnBzeU5QNUQ1WGhWQUpiNDZDN01lcjRxL05U?=
 =?utf-8?B?Unozb3k3RHR5bzBDemFQczVFS3IreThPTmF6cnFBbndqd3VVWG5oUGR1RFRq?=
 =?utf-8?B?bFJVdWdEc1Nmc0Y4WEZBaERvSFRXV0hPc1F2V0dBcDc5bVd6VGprVUpDODRN?=
 =?utf-8?B?QVZ2alhHMU1sVU4zK1NTRnlZNVpyWk1pRDBXSlBhSVVLSGd2bVJHcnF0dFBB?=
 =?utf-8?B?L3JudmZFQXZoOGVBTE5Ea2JYTXZrcEhLdmtRY2p1R2M0TkNwRnFEWksrVWxs?=
 =?utf-8?B?WlRiclpqRUk1WElrK0FTVmlDOWtnWUVBcndZeFMzQW9VMk9VV2ZzWjhqWEly?=
 =?utf-8?B?cFArZ1BtVm81K1lyVEZOclhKSjJrN1cxejBvRThlbTBlbHVXK2NKS0JhMWlx?=
 =?utf-8?B?a01ZMEx3SUkvOStYWTlRNXo0dlhZMDRMNjBwZHRzeFp2TlJGRWdmYTgzRW1t?=
 =?utf-8?B?ZTNXL2ZVRmdpNkpZcmhIMWY0TVdaZ21SVFpSRjBxV0NTWTRYd045dXFIcmVx?=
 =?utf-8?B?dWlkTlNlSlB6Q0p6QzgydzZTNlZ2eDVsRFhuMytPSlBObjBDOXU2cENYTDN6?=
 =?utf-8?B?QlRpRUJmNHJXa3FsOCsvYnk1a2pZbCt1S2w3eTFkdzk5dVJ4WmVTQUdGeHhE?=
 =?utf-8?B?NEJBY3Zvdm5Ra0xsY20rYVdKeEdkNURxdG9oSlVrNXhqS2wxUnFIYzk3KzZJ?=
 =?utf-8?B?ZlMzR2NhQU1qSmdUQXlHM1dEb0lHWU10TGhtc0xLeGNLcnFPQm0rZnZCeUZC?=
 =?utf-8?B?bXg4VXY0TnkzTGh4VDBqMWwyRE12SFJXQUJ2UnR6NHh4a2d5YmRTOXl5Qks4?=
 =?utf-8?B?NkdlTzM2dkhrdzVGQlBwWUFmdzRzU0N2VjJTMVRyKzRGWjJJcXpYa0ZNYWJk?=
 =?utf-8?B?TWZYOWxyTHpBNzIzOTRDaGNzZVRLOUZ3cXRBR3hFSzlIRGhWWTlmUXQ3RGtF?=
 =?utf-8?B?WHdCK1NLUnh4UWdFVW42YThzbVZZcnRDMHd0UTBieW82Wkt2Z2liYjVtWFZM?=
 =?utf-8?B?SUdEdm9ucGpXUDVGQ1Zlc0lybHNrKzArNjgxcE1rb2pibEc5OUROYmNMTmJk?=
 =?utf-8?B?N3B4cjdON0RERXdkMVo1MkpqbWdXSSt1c25xcjRsSnh0dXFqUDFKaDYyaC9w?=
 =?utf-8?B?bFl4NlR5QkRvMG5jcERPdFNzMlFEdjl3amQ0TmlieUdsaGdzakYxYWdsL3Bl?=
 =?utf-8?B?YkZxRW10dExnMkYwMjBFVThKSVNORzA2aFNPOGd3TktkK05FR3Q4WC9yQ0dp?=
 =?utf-8?B?VURoOGt6dVJNbG5kU0dPcVdsaWRFc215Wm5wa3NRY281dDQvMWQxT2d1cm04?=
 =?utf-8?B?eVZXVkRKWTRzUUhkOHhlRUc4VUcxUnloNEQxKzRzb1I1SnNjOS9HMGxrSkxn?=
 =?utf-8?B?NGhhVmlQZ2VXa0ZGbjVHUE5NdmNQM0JLRW9zSWd6YlFhT0QwQ1ZTZjRFazFF?=
 =?utf-8?B?L1ozamRIRTVNTFRTK1FYaC9YcCtoc083cXZOZmdxaGtISW5hZXZWRkRLUVNW?=
 =?utf-8?B?eTEybmJXQUlxTUJQU3cxRGltY0NRYUpsT0poR2s1a1EvMzFNaC9JL1U0eHpo?=
 =?utf-8?B?YU5XUStTMmZLT3BVZzl5MlBpL1Bqb0NLRFBzUzFUaWFaQzJaWklJR3VDSEo5?=
 =?utf-8?B?Z2NCMDluZmFvckFteDNpTUNKT1hUN3ViQWdFWnMybWZxNEw3QVRHeG85Qlc4?=
 =?utf-8?B?dm5wVDYwY1lyZXhRZXRFMUM4YjZBQ1ZGZTY2ZVFRMklxdkdpY1IrMkx5N2dQ?=
 =?utf-8?B?N2t1VW1NYzUzSHNQVUtiWDFUUjJkVC83dXB5MGszY2x2VVczdy9vYnpyQVVH?=
 =?utf-8?B?c0JWYTJJTHdhRkZvOHd1SW9qNG1zNFRmc3J6SERmWXcwZG05OTNScFMzZ2l1?=
 =?utf-8?B?dU9oc0FwRWtQTjhBOE5sK3MwOVYvUGRieVRUSVEwSkdlYXVYSEZjWHlKZWpw?=
 =?utf-8?Q?794PYm5WdhA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0RjSklUWTRYV3RrcFlNb3BzeUZrU0xVOGhBcGptazVndDY1OFZhS282Rkh2?=
 =?utf-8?B?RmRCcENFZEhqOVZmV0VlRkE0Z04yMUlGQTVyTHJ6cVY0b0NjLyt0VmpoaGhM?=
 =?utf-8?B?QzVnZWc3RVc4RWtGbjFYYUJnT2hGMEI5ZEM2WDVBSUpBQ2lEanI5Yytmb3Zr?=
 =?utf-8?B?c21BNXRDZGZVRXBDSzBmVVJTTXQ4Q2ZOTitFWkplZVZHOFZUc3V1eHhlc1Er?=
 =?utf-8?B?MHZ5c1JlYW5Yd1NzakgrSll4QkVBVUFiWGJ4ZDU4akNjbmlJRXpWQmFscktU?=
 =?utf-8?B?ampIU2h4anpHOHAyU3hTaUdKR1lMR3pEVTViTVh0WkdUckYrVEdFRy9OcnR0?=
 =?utf-8?B?OEdOOXJlTGtoLzBKSGpJSytGRnBDTzRhRGx4SUYydHBxMkFyY2ZjajU5UmZF?=
 =?utf-8?B?QjlwcGhWT1d0VXpWREdqVGIveWxoT0xtZHlIdGRncmJocmdaT0lFdkczSFB6?=
 =?utf-8?B?RnNNL1JvblpLNlN1dmx6VFBmSlpMd2daWVc3TCt0L215QVA1R3Nac1RyODhW?=
 =?utf-8?B?Zm90czZkZzc4MnladktuOVlvRnRETXh2TmEyTUFOM1pzRjltZEI1QTdoK2hs?=
 =?utf-8?B?cGpzTk1OZzNDQW5ZNnVhVi9PcUVjUUtNa0dkMXpyRTZ5QnhSdittNktkb213?=
 =?utf-8?B?ckNVM1FPVGlDNUdSVW9uZEtWclFBbmNRMWhOYktpaFlTM1R6VXNQYlZubytY?=
 =?utf-8?B?S1k3T1N6R21RMllYNlhmUTNxT0EyWWdZVnF6MVg0VjgxM0EwTG5LTUNWYUlr?=
 =?utf-8?B?ejVrS3c4OURHTXl3WlBQQ1lrU2VlYnN2NUZVMEk4NEF2dkE4MkJYQUJVR3F4?=
 =?utf-8?B?S3MxSWJ1ZkJ4R1VCS3BPREVvWE1NU0oxc29wVXRYTU9oS3VOeGs1cnRHcE16?=
 =?utf-8?B?VkRiWkx2R3NMVFZnZEpHTElzNEc1TzlqM1FDbmpNbGwzTUl4L3RNSWR0K1pG?=
 =?utf-8?B?R0tDMTkvUFp1TXF5anZpVFlNSGhnMkdTRURqK3c1U2kyL1lqRXg1TEdvMWF4?=
 =?utf-8?B?WnhZQ0RMbUdGaHVVMEFzbVNNS2NINUxQRWF1K25rMFpveFY4RUdmUlluYkxU?=
 =?utf-8?B?N0ZKclhuNXJGR2dZWEpsdnJzc0IxNDF3Zm83RDlqUXdGZGZkZklOTXdhWkJu?=
 =?utf-8?B?MUJwVXJRTWJBZjk5UnFid0R5eDZoaFNBOWhPTzBRVjhobzNKbGFBdmZPRlI5?=
 =?utf-8?B?WUR2enU3MU9sNytreUNKMVk2Y1RJTEdJWWxhZzJya1h2ZnF6VlpsdXdZaGs3?=
 =?utf-8?B?UjJsMldPNnd6VEFjeTJRa2VJZjFlZ0FhWDRsZTZpNU5pWHZKTWQxWUNjNXFV?=
 =?utf-8?B?dG5lNTdtaCtoQk45K1hCRFRpelpYdDRQbUU4bk9FYXNNbG5XSndVUzd2am82?=
 =?utf-8?B?Z1MyaHlkaUZsQzkyZ2pNN2RuZlJ3c0VIb25oYjdvVysrVHljc0JONElHODJ2?=
 =?utf-8?B?TGNnY04weWhWaXhPNFd4UFBBSFBxYnBLUndpcC9GTVRXRWR3UUNueDhzUVFv?=
 =?utf-8?B?eHN5SWNIbHhRRGNvODlRNjR6R0JUWDRtNXZuVFArdXcxWnhMZlFIeGdBL3py?=
 =?utf-8?B?eGhZZDlhcXhydEpnTlpncUs0djJ2UzFsQWwzYllaZXVSSFFFWFQ0NXRlTG1v?=
 =?utf-8?B?THoyeXpNNVJLbFY2aFhDeVc1S0Z3VHlZb0p6SWFBVjdDNGk2ekhOaVN4RFNZ?=
 =?utf-8?B?a3JNSjdSZml0ZSs4QXVjUHdUck1pWmpveVU4NWd3TWVXd1Zpd0hya2JOdGJE?=
 =?utf-8?B?cFM2ZFJpSVkxcmZTZFBZeXNqRmVWU3p5RG1NenF1RmJpUTR5bUxGdGFUNjRj?=
 =?utf-8?B?ckZ2UmkrOTlGdCtRTzZWM1lhT2d2cUdYZkl0U1krVyt1S29FZjE5d0xvd0xi?=
 =?utf-8?B?NnpMTzd4eVFYb3pQczBsaEVpTll6ZXhZam1ad0VDSzJWTUtueTZ4OXBrYTZ4?=
 =?utf-8?B?Sk9yMzNEMDBvSkx1SE1pNEF5N2VsMGtRUk5UbzFqMkR4ak1JeXZYa1dLUkVZ?=
 =?utf-8?B?bWJsakVCZHBBMUhBMytlSnJLK0NmVmRNWkxTVDkxREJTSUo2OE9jR0dETFdV?=
 =?utf-8?B?QTNHcmxTQzZJTWV1ZmVUZEhTSThldGdVeGlXUllvS3ZJY21nemRXSUlyWVVH?=
 =?utf-8?B?dDdRVGZhYStXNzgwOW5UUXlCM1kyZ0Z1STZkMnd1cHhWVGs3TG1OUlYrV0pK?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cae34b-22ef-4453-fb85-08ddea61d0ce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 20:46:39.4273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeCtq7wPDBOt54U62BgfJXwq5Jie5nQR9xVFtgFzULo3M+0oos744WG/eSlOrH+v/bt/XHH61hwQTQcmksPtxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF10FBEE80C
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

LGTM
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

Regards,
Zhanjun Dong

On 2025-08-29 7:46 p.m., Julia Filipchuk wrote:
> UAPI compatibility version 1.24.4
> 
> Resolves various BMG, SRIOV issues and adds new PTL features.
> 
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 9bbdde604923..4faf8b0fbcfe 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -115,8 +115,8 @@ struct fw_blobs_by_type {
>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> -	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 47, 0))	\
> -	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 45, 2))	\
> +	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
> +	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
>   	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
>   	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
>   	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\

