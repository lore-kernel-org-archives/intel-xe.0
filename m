Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4493C27C55
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 03:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7646010E445;
	Wed,  5 Jun 2024 03:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDSqr15F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C5F10E445
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 03:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717556635; x=1749092635;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=75mS8rQiINvH9WlUr1ZMVyacU0gZ8IzQljogLzux3ms=;
 b=bDSqr15FPZQjdYOk0w877BRH1RcEzpJGaIhi5kwidRhSIR2JaGOVTCTz
 g0rbv0tTl22hE6OtACqa70GWpOu8/vWUuoernuIw9WzNShpAzVhFsViQe
 zkTXLNkwuw5LuoNyhQ/A82P3lrxGyXb8sN4LhvKMHLQgUMLfbVXAcQgsi
 hjtf5SS1oq9JtGfdcuSoR/NQzubbylIoW/tnbW7rSoiRmr3zPN1Aef1Tf
 ifL3K3jUql5rcwT1h80/yLl/EoqWYdcXFYz4dXzkNWsZDtSb7tClfWBAJ
 VN/W6BiRinPph+bQPqgr8f/jyirlzQkUv1NibpaZ3dFgtxpUACwwPqPSS A==;
X-CSE-ConnectionGUID: dAybCy/iSq+V3WiMXOe3Ig==
X-CSE-MsgGUID: 4aMAu2p+RXer0A2FbEJchg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="39545554"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="39545554"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 20:03:54 -0700
X-CSE-ConnectionGUID: 5VeUaUpmRuaIQhv8XB5r+w==
X-CSE-MsgGUID: F3PJsn+6TLKsGA53RC6IUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="41870638"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 20:03:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 20:03:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 20:03:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 20:03:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqySjVMlJgGHQGihoe79PNUVTm2tYnhla23I1AebJBgf79BFIphFUedpyC/EPm1f/GhPbUz3sKG6gdH34KOte+kWXOJGmFzEQwecpc0SLVI0RpDrcqoUhW1R06dLhVztG7A37+xwi9eCuyqJE6KSIUEnjHIV+Kgmjxb7P7aeKEveSDvK5/vOhDT2KNeA9h7wwDf93YXTYHcXhpzWE1E4w/KVqINobogPZzrvV2KPBJiCVePi/hrAKZAyoFcUOjJtL0J4KuYttthqms76Wm5hdk/6N0PLvsc8yAbxmyH8FYNJXYbvSGC8STetT4vAdJdf5VwIYLCP1PzTMH3ww2RvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGJmdpUVPBVLwpgyDkosRHSzJyRAjvcm5Tn1ys4E07o=;
 b=jDlHx/1Hf3zp0pivsDGzybY0Ov1orwAT1XbjD6yBjH1h27tXAZT9MQQ1yh515RKqBtckaJhaDe5aSfPOWRLImzWjfOL7/+tJ/7FR0wbOO6/7Zxg6I59LFuJrfP4f/2sbibS3yRu8zwZomyvrEALk5RCiIm7aoTEWSquQzj5I8zL1i5R/1/tKYHb5OjVifEumwdFExO7fzmQhHBkHWo/ssM3hEfeioPpmUTVCWL+72vSGIKxfkdvTnyjJjcH8gWyJ2T6jbkPlOZHy3vOtvVNZqMhEBvasWhgGORT08UJS7noZTD8K/3iFDVUqltUE+FFhfsziVZMfJvWVNbeQHuZp+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8564.namprd11.prod.outlook.com (2603:10b6:610:1b1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Wed, 5 Jun
 2024 03:03:46 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7611.030; Wed, 5 Jun 2024
 03:03:46 +0000
Message-ID: <6c5983b1-6303-4ac0-b95c-e83690217b1d@intel.com>
Date: Wed, 5 Jun 2024 08:33:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Cleanup force wake registers bit
 definitions
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
References: <20240603090147.1098639-1-himal.prasad.ghimiray@intel.com>
 <Zl9hYn2IiuzgEoKc@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Zl9hYn2IiuzgEoKc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: fe0c9266-f6e7-4f29-8cd7-08dc850c1dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXJUSDZ5WTdVSmhXVmdXY1VxYVYweTF5MGs4L3RsSXJobW54NmgvZU1hdUM3?=
 =?utf-8?B?WVJ2bkRETHk0NkNheitwdm05aFV0djFRMmxZSXRPa0RvRk5NU1RmNkg5QnZM?=
 =?utf-8?B?VUVoWGRuU0NIVjhseXVucTB2OUd1QmxsNnpVR0xJOGo3dVd5bitUZVA4eXFy?=
 =?utf-8?B?R0ZvWHk4TEo5dFVkdkxUemZlQU1HMmgrQm96L29qdEp3UUFSYXdIR2RnOHp6?=
 =?utf-8?B?cER2amUydDh5dDdvRGF1TDVkUGhUd1ZPdXMvQXRjKzFTUFA0OVYvUytkWTBF?=
 =?utf-8?B?d0ZRckJEbXN5R05UZmJhOWhwQUc4dmhoTURpakNmWWI5ZW5yU1pGRklsLzJs?=
 =?utf-8?B?VXBPR05VM2t5c2hYUHVtSWlxQkV5eHNxWUkxSUlubU5MWitpNkhlanBkWkhR?=
 =?utf-8?B?NVRRcHE4RTU5a3ZhYXdEd2QrLzczN1ViSWZtZDNyOHRIUFFUTzFMaXhWeGQx?=
 =?utf-8?B?dE9sdU9UZHNnc1lqQUl5anF2cTVxdndBZndsRnB3TzdvdnNSZ1BWbTNOS1Zq?=
 =?utf-8?B?N240SGoyR3prdUV0aTg3c1plZnR3bVR4VjBvNGhwUml4U2x4VUxJdU5TSy9L?=
 =?utf-8?B?ZEYvSWk4c1l1bk1wa01KUCtVajY0YlhxTXp4V3JPR2R3MWFINXRTbWhDRDVF?=
 =?utf-8?B?eHJMem4wRFBFWUxuK2Q0c3FpeFZNOGFOT0Q5VGlYUEJEaWRmSys1bHBXdG9y?=
 =?utf-8?B?c2FiWUIxZUlWaXVWT0k1RjQ1L2JKcVhRR1ZhY0RIaFFtZkhFVTE1cEd6QU8w?=
 =?utf-8?B?dTVaN2p2MXpzZDg3MG9RVXR3WTFqKzl6OXFRdGFIYVhuL05FN0Uvc3l6Rm5z?=
 =?utf-8?B?NGVmd2k2aXh5aTBlUmZGSDd6RW1jVHFMaGhnaWtyZWVlTnZndEVtOElPZmxs?=
 =?utf-8?B?cHpGZGp0UjM1UE9pbE1MV2xacWp3RUx4bGJtR0wxRk1DNCtqYXJtQktQdXVU?=
 =?utf-8?B?YXh5cXhiQnpxSTIyZmtaUE4rNyt2b0padWkxSzNpVEd2ZklCeVRiRFlvc0ZN?=
 =?utf-8?B?bVdPUVpKRWhsMEY0L0VJK1Fnb1BJdW9VaEt0eTFoOE5YeTlVa3RMdzR1YjU3?=
 =?utf-8?B?bHQyTDZNYXhENzJNMlRUb2wvNUh0emJFMEVPR2dCUjd2dVh6c01JNWt6MHYw?=
 =?utf-8?B?Wk8wWHJHYjJzMmNBL3ltMkpBSS8ydDcxSHBIVUxublNsS3FCb0x1Wm1tSGNp?=
 =?utf-8?B?MEhXTkR2WGFwY0MzVkN0Um94K1lSVUUwVURBOFNSMWZISFVQT3NPdUtJcWRU?=
 =?utf-8?B?ajc4SzZTdFlBWXpPUWkyRzhhQlc2ZStEMEFMOEUrc0htVmZuY1hPTm1JV2FD?=
 =?utf-8?B?M2hFbGNvUkVWR0dvWUJaQXVhQzlGMmRiRkNaVkNqR2hER20xQVRKQXVVd0NF?=
 =?utf-8?B?S3V4MEpaWnNwbi9aSDBFcURtbkFNQTFtYU9xUUhVOVp0c1QxTUhXNmpDcGF5?=
 =?utf-8?B?Y3dKYlBDalVrZE9teURnVEpCZVhVZXFmY2htSHE2aFVyZFhNZkRDRHVhWVJi?=
 =?utf-8?B?NVBuSkhTanNOT0lRdHNRTWI5UkJYbzhHaTZNSFd5dDdWa1pPenBzZklERW5N?=
 =?utf-8?B?bEdKa1NyNHVyK3FNVlR4Y1hFSjVsWmExd0NFL3E2VzhjMXlUOFkycmY3eTRM?=
 =?utf-8?B?SWN3VnRHYjU5dFNuZEtuUFRrZEJhYWd3bG11dHo3dzFDSjJJUXNLWTBTTTlI?=
 =?utf-8?B?V3ZzcU9JdDRKUWRQSmdqd3RZMk8zM3pTWW5UWGtkVXp1NU9oSVU5MlR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWdwaWVjelZ2T3RjMzdiRXhCSjhZZCtLQ3Z6LzRRZUtRM29Gam41eG9HNmIr?=
 =?utf-8?B?dEkxbHB4WFRjQjFWUG5rVE1KVHBXU2d1bUpLYWlHNFBUY3ZWdGJPckxuaGpp?=
 =?utf-8?B?eVdxZVp3bzc1UTNmS3NsbTJ3QlhOaWc3aVFMWnRjd09uZnR6SXdTVklFUERV?=
 =?utf-8?B?Ums5ci8vem01Sm9JeWJMNE1RS1ZkazNHcjRmR2JqbFVaVC85bldjcnJkcXNK?=
 =?utf-8?B?ekFJQmdXeXl5cDlhdVJQRFh3VVZ2bGU4dXk4QWg0cHBib3R2WmpRbnQ0Nm1R?=
 =?utf-8?B?eEROQ2R6SmFMMCtOdzNqTG5rSG4zSmFEdTIvUHpka3dZQVRucDd3cVZmQmVx?=
 =?utf-8?B?VzJKK2YvSkxtZGFXSVkyb1llbFd3MjcwN1B4ZnltSE1qMXBBTXBSbmNNaDMx?=
 =?utf-8?B?S0Z3bmF0ejIwc0lab0ZMaDVZakxoNnJkSXMxNzRmRVpUNTdNMWp4REN2Q1Nm?=
 =?utf-8?B?c1VSUE5qeVpNYWJSUlk4Mzdwam9YQ1EwNjdXYlVEQkRtT2ZrSEtQV0d1bjBF?=
 =?utf-8?B?NFZIZW5SSC9Dd1dxWHZaMnNaSEROWVJoRVgwaGFvNzJEalM2ZnVGbHhYL2hK?=
 =?utf-8?B?MlVtOGFpK3VVYVdkVWQrU2sxeFBuOE95L2ZVUDU2YWM0czNYbXJVV3A0eWpK?=
 =?utf-8?B?QTdWRGJxMW9kakoxUi80OTg5U3JnS09PQk94T0dtVzI1Y29Yb3BXeGlKbGd2?=
 =?utf-8?B?ejhnYXlHZ3dRem42WmlTYVcrTnN3Z2ZMcjRJazNVOVQ2YzFKZHlmY09maXRK?=
 =?utf-8?B?cThOVUpZOUVMY3Y1cXBtbmRJMGNtcmJnTFJqSWdwR2tSNEQxUXJRVjFIVU00?=
 =?utf-8?B?aFlidk1rRFhmZkVhMVh0M010ZDYyQXoyb0lQelh0azlWUTdhWlNZL3FnbUh4?=
 =?utf-8?B?MExEeThPVkN1MDkzOUt2SW9TT0R4YlhYUkhjZlpwbEs1eGN2S3ZvNEU2Z2hW?=
 =?utf-8?B?dFRxQzlZalJydnZ2ZUV0cFk5RDhTQ3JJNDVNSFdOL3dXUlNNOTZvc1BFbXpI?=
 =?utf-8?B?dmpKN29MeTdzYmhDQjFDV0k0NEVDZVlqTHUwejRLSnkzL2htSjV3UEQwaVlS?=
 =?utf-8?B?a2tGRTBiK3ZPZGQ5cnZYWEx0QkFoNGJ1N3VJemJTVzhSWE04SG1yMXNERVNE?=
 =?utf-8?B?M1RVSXlCRndwR0hYSlBsNyt3ZW9URlJDOGRaV0puRU5KdHhlRlUvelRydmxp?=
 =?utf-8?B?OUkvNmZRZzR4eGw5a0RrR0orNVZJa2ZmbXduWVdBWFNET3V6UDIxaWRxUGlJ?=
 =?utf-8?B?NDk2TWhNMjl2MjFQcmVIVTVuVXNsYnhPYkZkWklNMU9PbG8xclZSZkkyWTFk?=
 =?utf-8?B?dkt4SGRyc0NzWStBNHZUd1FodGo3QmkrNzVFVE50bVVQcUJ2VFpERVZsYURh?=
 =?utf-8?B?TkJUZTRrbDNzTEgwT1hOT1FtanpQTC8wTEpBeFJPL0VPdzFjekJyZXJwS0w2?=
 =?utf-8?B?QjlPMlZUOHZjMlVobWdzSk5KRXBuZC9jdkNwVGRRVVZ3Smd1QkszR2hwNi84?=
 =?utf-8?B?QzBTdTdiV2pRTXI5YmI2R3BKY0Q2Q1JzeWVkcWZHalVaL0JJSVh3Njdqbk5P?=
 =?utf-8?B?WWxPOFJ5NmRMRGxPRmZ5RXg2YWsxbTZ0MW9ra1EyZldqSXZ0NERFd3dLczRo?=
 =?utf-8?B?V0RIL05pd0c2UEFvNnFGcUE1dVF4b0ZWeHg0ZFFxNnRNMlpkeDVPMkMwTXZU?=
 =?utf-8?B?R0dnaVhHZkY2Q2JVakYyWlk2Z1lpUENpemlKdEdIczdEWjRMUlhCNnVyc3Ax?=
 =?utf-8?B?elVadjdkVXVqM2laTSs1T05Ld0NmR3R3NTNncW56M2JuNUUvRkdHaGN6SXhM?=
 =?utf-8?B?T0dBb2h4aWdhSEh5aTFSNytMN21JWjVFYUNnaE0vVnE2QjZFWGZVMWk1V0k1?=
 =?utf-8?B?dHlMeGlKd1dpNXpFMUl6eFFqNU5sbVZsSm5BTUlDTFl4NUF6b0JxVUlGWHVm?=
 =?utf-8?B?N3JpQUJXVHFFNmVLdlp2SXZoZkVnMVdEb09HSlJCVXROdmY3bFdja2VLZG5L?=
 =?utf-8?B?eEs5YzNjdU9LUTVUN2JPTTZOS1VxeElyTEZWWTc2Y3ZyWGJQZGl1dmtOZGZV?=
 =?utf-8?B?OGpjM0pEcDc5SDZUZy91RVVGWHBwMWlGdDJXYnRBNTdQQVhudThwNThGbjNW?=
 =?utf-8?B?Qzl2U2cxWEYrRWdwMWZUTEpaOHY3bmN4azFjTUtSV3k1Szl4UWhKeGdNZzF6?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0c9266-f6e7-4f29-8cd7-08dc850c1dad
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 03:03:46.6822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZGr/+Fkl58XpMsoW9NihOGKMgltUaGAjnRMvTqVnPEgkpVsdBOMxPnsDIwPxe+evRvDL7NXfpBGg2oun3pDO74yaIPCQFmE5P2msjt9KAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8564
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



On 05-06-2024 00:18, Rodrigo Vivi wrote:
> On Mon, Jun 03, 2024 at 02:31:45PM +0530, Himal Prasad Ghimiray wrote:
>> - Remove unused bit definitions.
>> - Driver uses BIT(0) for waking/sleeping the domain and since the
>> registers are masked respective mask bit BIT(16) needs to be set. Use
>> defines for these bits and use them in domain initialization.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 ++++---
>>   drivers/gpu/drm/xe/xe_force_wake.c   | 18 ++++++++++++------
>>   2 files changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index d09b2473259f..441747f2d28a 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -487,9 +487,10 @@
>>   	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>>   
>>   #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>> -#define   FORCEWAKE_KERNEL			BIT(0)
>> -#define   FORCEWAKE_USER			BIT(1)
>> -#define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
>> +
>> +/* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
>> +#define   FORCEWAKE_THREAD_XE			BIT(0)
> 
> Please keep it as FORCEWAKE_KERNEL since we already know that is
> the multi-thread one reserved for kernel/kmd usage (xe, i915, windows,...)

Agreed. Will fix it.

> 
>> +#define   FORCEWAKE_THREAD_XE_MASK		BIT(16)
> 
> please do not define a bit, but a mask macro.
> 
> #define FORCEWAKE_MT_MASK(bit)  BIT(bit + 16)
> 
> just to be 100% with spec which says: "Note that mask bit is the data bit
> offset + 16"

Makes sense. Will update it.

> 
> with that changed:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks.

> 
> 
>>   
>>   #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>>   #define MTL_MEDIA_MC6				XE_REG(0x138048)
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 9bbe8a5040da..64721c01f30d 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -52,13 +52,15 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    XE_FW_DOMAIN_ID_GT,
>>   			    FORCEWAKE_GT,
>>   			    FORCEWAKE_ACK_GT_MTL,
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_THREAD_XE,
>> +			    FORCEWAKE_THREAD_XE_MASK);
>>   	} else {
>>   		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
>>   			    XE_FW_DOMAIN_ID_GT,
>>   			    FORCEWAKE_GT,
>>   			    FORCEWAKE_ACK_GT,
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_THREAD_XE,
>> +			    FORCEWAKE_THREAD_XE_MASK);
>>   	}
>>   }
>>   
>> @@ -74,7 +76,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    XE_FW_DOMAIN_ID_RENDER,
>>   			    FORCEWAKE_RENDER,
>>   			    FORCEWAKE_ACK_RENDER,
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_THREAD_XE,
>> +			    FORCEWAKE_THREAD_XE_MASK);
>>   
>>   	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>>   		if (!(gt->info.engine_mask & BIT(i)))
>> @@ -84,7 +87,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>>   			    FORCEWAKE_MEDIA_VDBOX(j),
>>   			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_THREAD_XE,
>> +			    FORCEWAKE_THREAD_XE_MASK);
>>   	}
>>   
>>   	for (i = XE_HW_ENGINE_VECS0, j = 0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
>> @@ -95,7 +99,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>>   			    FORCEWAKE_MEDIA_VEBOX(j),
>>   			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_THREAD_XE,
>> +			    FORCEWAKE_THREAD_XE_MASK);
>>   	}
>>   
>>   	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
>> @@ -103,7 +108,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    XE_FW_DOMAIN_ID_GSC,
>>   			    FORCEWAKE_GSC,
>>   			    FORCEWAKE_ACK_GSC,
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_THREAD_XE,
>> +			    FORCEWAKE_THREAD_XE_MASK);
>>   }
>>   
>>   static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>> -- 
>> 2.25.1
>>
