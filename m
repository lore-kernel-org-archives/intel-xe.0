Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC6CC71155
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 02:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3FA10E1A7;
	Wed, 18 Jun 2025 02:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTGpyIoG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0077210E0E1
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 02:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750214655; x=1781750655;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wLmyKStg3I50qWaBLOpadi1iegvHN7iOWn2AS+qTJ6c=;
 b=MTGpyIoGeh90JJnMqG7d92FALc9yq67tnL9e3ptnPnLJn3Z5EFgaZ50a
 6rzVk1S/2kvf1npQ1HWfjuBZ/RqulzYS7bxg5vV5AOJOscKJB3zXDLkzA
 9ozzQmdykqXh1hjAQXNsBcNEybMTe3jGiyekoC4sN1NKRSUyu9NA1bdzX
 ChUxiiantGwgMzNtdutmzcut9Q9aJy4ic1pBbSkjh10vZ9nwhql6jq6Ca
 JaDZyOhM4QkxFDW/KlUUoOo6cCWHvYm0eaeNPxhZWybzmkCOH8BuPEXKs
 yX8KsgXtkTMT6l4rkir1bVumt64ukl1FPWM38MPoi3VEm3HVYlIsCYVFV Q==;
X-CSE-ConnectionGUID: ErUIttdDQpeVSATDzgC7hw==
X-CSE-MsgGUID: Wrp4Lr9bQ7qRdsm4KsnF5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63773354"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="63773354"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 19:44:15 -0700
X-CSE-ConnectionGUID: ouLjqpAMTLykswkaX4bwPg==
X-CSE-MsgGUID: ACam9zzsTOSFWeq3NXdC7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="154385453"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 19:44:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 19:44:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 19:44:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 19:44:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTuEkY8QPWyce3l0a/3EndvjMqwjWLuLoDSARCKsRM58FyY7DnAd9gg/4I0r0QESn/Ymtvz6JoCh5quhwH5kQW1kENMyA6SOWP1XtaNtCchgbelddPIY12ScH6pkubyEFTZCZVew62Ox0hjmTBaRkbtxomlEH/R9LVLAHnxgc7gAI3EjjVr490p1XfKn8HrYL+bSnkjI5q5+gqam/4FaaMZ2WgeZ/6v/oNlvrnxMlTk3JXnwZmjlUJVBdnQnby867hyGE4LGovMNZoJT7LgXjKNc5YeesoXUd8j42q+2e9vSvzbmNwGvpzwa7vb4cHRO9wPfbEWJBgWX/aLVIlRsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3xjEkCSjPyKcshKHArWWvntV0JfbNZD0niVcX74CbM=;
 b=C4HXWLgo3AUJU+imiaxUdfLVNGBkNrR/dhegIZq9ZeAKE4fmxRoYSLhgZEggHT1kviMt6hHAlL513Z+IFdG8Q5nhY+zyxdNPXr6hj6Lyt/uP3DoFMCawnjSdzyEz940vuHNl3WgL4HTNBsUgw4LTitMytF9XAS0dDZdC2bw9hVMP+ocxgdYG5nhuY3pMG8/khSiJUFN5galmE88zA1/HWlyXRWTHKUI7W51L4EUJLNZ29rb+eWc50ouk8aqN9jc8RO87IzJ3xte6Aun+Jjw4qzYOgM3kOXNB3LCsKbf2uKNixfKu7uzV2LvTHoEJcxPSPb0FdQSwCUuVJjazewt99w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ2PR11MB8472.namprd11.prod.outlook.com
 (2603:10b6:a03:574::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 02:44:12 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Wed, 18 Jun 2025
 02:44:11 +0000
Message-ID: <5b746c1a-45af-4de3-b2b4-e473a2211247@intel.com>
Date: Wed, 18 Jun 2025 08:14:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Opportunistically skip TLB invalidaion on
 unbind
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250616063024.2059829-1-matthew.brost@intel.com>
 <20250616063024.2059829-3-matthew.brost@intel.com>
 <6c3ce96c-7817-482d-835d-3925b9b52111@intel.com>
 <aE/I4T51X7GYc7ZE@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aE/I4T51X7GYc7ZE@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ2PR11MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b2093b-c5cb-49bf-4d22-08ddae120191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUFRUGxQcGczN1lkSDI4M1k3UWRXOWFQR3ZVVzFKZkNXa1RMWVJTakNEaDZC?=
 =?utf-8?B?RFpzMDUrL1VXdytUVE1tUHBBbU5WaXpabXJmMFpIMzNCMDJFUG4wUUtuNSta?=
 =?utf-8?B?WDFGeXdzeWFOdjROVnY3emkvSDlEVW5vN21RbGd4aGJVR0prQm9sMXFxa1My?=
 =?utf-8?B?dmRYMmdTWVpTaUdmWWkzSSt1cmdRVHRMV0hxL3FqZFRMVHZRTWdRbEhYWmRH?=
 =?utf-8?B?QUVkbWNnbTUzM0xIZTU3d2Vod0RWeVlYRUM5dVd5RnpBdXJBTUQ5NlBGK2FY?=
 =?utf-8?B?dU1jakNnd0dIS1FLMkNxR0VQcmpNcmpyN3hhWDd4dmxaZjJEVzIrQVFYZ0RV?=
 =?utf-8?B?bVNjUGhMVUlRTlhLZnZkWUFlTE5zMVRXZXFrc2w5UmhnSWV6Wnl6L2lLQXhi?=
 =?utf-8?B?aURDMnZhL21oVlBxa1djREYvalc1VUlwWVR0cCtETUQzR0t5dEMrcktWL0ZN?=
 =?utf-8?B?K1JuOENwdkdzcXlSQ2liTks5aGVvaUJLSmx3c3QvVHVxV0FQN2d2L25nQjB5?=
 =?utf-8?B?K1paRUY1NTMxVjJObFB6M2R2L2ZDWCtTRDFmaERHWHFVcklBeGM5ZEdYOEVC?=
 =?utf-8?B?a0JDTWw3MzRMclRLSVVNMzlOcjJ2ZW5mWFF3RUZsYzhFUzFmVk1tWUwrNUVZ?=
 =?utf-8?B?T0d6Uk9FOVIwVkZKeHdScTdnTUxieVFJemZER1VzTGVVYUNWcHZNckU2K2t4?=
 =?utf-8?B?RzVVaERIUTZFN0UzY0hFVWg5eHdmTENsZld1cWt4NkRTZVlxcTBYMHgvd1BH?=
 =?utf-8?B?MTkzaXdqWndKRjhHdGRaeFdlcE5UZUJNclNuRVlIdXFoVm9jV1RJU0ZxTFZq?=
 =?utf-8?B?cnFlTnBhLy8yZ3kzaEJrN2JKR3liMlc1VnZjY3VDZEJSaFZVdVMydVI1VDFz?=
 =?utf-8?B?aWdLUVd1NEFQZytGK0pKR3YrOEdIOWNKSDdXcUthNkZ0RTErM1JtRFNrUGY2?=
 =?utf-8?B?SDlURy9FSys3VEE0ZGRkS0NKWFZyYURzK1ZFVWZZM2cydHoydHV3Nkk2cEUw?=
 =?utf-8?B?UUNXMjcyR0F0VTRwTjF5MVNzb3dGQWNmSzZLNWYvQ2tUdE9rVzZjMG83M2pD?=
 =?utf-8?B?UUV1Ung1b2w3aC9SRmlwRXNPZmszKy9qdXhJZFA3UU4yR2J2endmN3ZzYzNz?=
 =?utf-8?B?c0pLMVJWUTJxbUt4aWFZaGxEZWprNzFsUGhZcnUyS25xcFBJQm5kUmpIS3Jn?=
 =?utf-8?B?ME9QZDJUM2tUTC9FUTAyWGc0R1FkQThZbE1OM1NrOSt4bWI4blZGTDgwQzRu?=
 =?utf-8?B?cTNIcTVnSFZYNU1PRk1RZjN3OWhDNjFPL2N4ZmhWTXdWSUpJYTJPMTc4Zmxi?=
 =?utf-8?B?OTJCVVdkL3JsRkdJdUZZdWxKakYrelNxY1BUZnVVbmsreGNyQXh0TjUvL3Zs?=
 =?utf-8?B?RTg3N3ZaNDNCM3hUN0gvTllGMld3K3Y0NDdQVDhldVZVSk5aajZNNmdnZGJF?=
 =?utf-8?B?RnhwRFlVSlpTMGd6akh6ZGhoYloxZStIYncrNWN3bDEwWjF5cWRHYm9ndjht?=
 =?utf-8?B?c2FYTjZNbDFMOTYwL1I5UTBiSHEwNEZZL1NuYjg0UklXVkhqRXA4QTNxNTBn?=
 =?utf-8?B?VWQvRmVQVmtQYnBuQ0lsZGQ2c3pJL3FZa1ZaUk95VHU0bDBQWkxJU0QwdWVk?=
 =?utf-8?B?eHIwWHZFMVBwRWpVMnN1R2tiSE9NZ3R4R1hWMTlYa2ZFcXM0QkJZYUtHT1FI?=
 =?utf-8?B?WksrRXU2Ty93ZnZic1JZQmpXS0tuTThtSXlSbnFJblY5U1FaUHBJa3JhNFMz?=
 =?utf-8?B?a3VLOG1tM01VRjdkZ3hCVFVuU3c3enp6K2lCWGtvekZUVTFtRjV5enNiSHln?=
 =?utf-8?B?MjFkRmtwbTA1Qm9POFZVV0VIT05VNVpsOHdGRlRCR0dZM1lLV1NWcXA0Nmpp?=
 =?utf-8?B?VDVnaHlZTzlMQ0tYYzAyNW1jdVQzS0xiNE41VHc5WEFDKy92TW9yc05MSDB1?=
 =?utf-8?Q?9EftmBcmEfI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG5pSHE2bzkvM0xLQ2t1L01OTzFOY1daalhLYWovNHVieEFaV0VoaVJQZG5F?=
 =?utf-8?B?bExWTnpaRG5hLzFPM1FYekljZHNEN2VzT2ZiM0gvcDh0Yld6YzBEbEV1UGFZ?=
 =?utf-8?B?QlZMc2dJeW8zSklqc2xpQU5JV1ZHK1BRdnJYYzR2TThpdjQrcFpObSsvaVFq?=
 =?utf-8?B?RktNL3RQT0M4d0hXSHFrdHJVc3JOUjRsRWpsdTVWZ3hNZHNaRDNtUW9mcXVW?=
 =?utf-8?B?czIvRjlMTkVGbkl2Q04vRVUrc0dlaWFOdUxZdXExR3VWUkx2a3c0eE0zZUsw?=
 =?utf-8?B?RDMxK2hrUzhLZzRUdUs1eG03V2w2TGVzb3N5bTJucEhjdEE0NlpNQXBrbzJ6?=
 =?utf-8?B?UytTREx3Umt4YmRyYU9yRWdtK2twUm96eWFlQnpTUWpEWUI1cVFEaEhmU1RY?=
 =?utf-8?B?S0JwTmRnNks3bTk2NXgwclA2ZTF2RTRPL2JKQ1NvWnNTazd0aUdaVlJHWXdo?=
 =?utf-8?B?MVJoSFE5bU9PZlQzc1o5Ty95bWFDcWdyVWI3ZjFmUitaQUVaVUdDU3VleE9l?=
 =?utf-8?B?bzJnKzJka0IzYnpDNTN4Vk1EdWlad3VWcVVZUmt1VkNJUDhncHlzc1BibjBl?=
 =?utf-8?B?dE5TZk1icjlvUVlpR3dWVkJ5QjU1RnZXM2oyMTUwSEhZdHpFSEI5Ynk2RGR1?=
 =?utf-8?B?cjZrQzdibXozektiZGhwSHNua3MrU3lOaUVVVnc5RWorVVlZS21LV3Y3VG9l?=
 =?utf-8?B?d2k2VkVScitmTllpUVdqK3N3WE85ZDR2NjNjWEE3OG5iWVU5ZEc2TVNESW0y?=
 =?utf-8?B?VGpUb0NYTFJjKzB3VXZ3Y0dsbjBSemZrMzc3Y2JnamN1eTV4OE03dnRhYVBC?=
 =?utf-8?B?bmt1WHNTTHVmSTdKbkNBSGNHLzYxL0VGc1gzOW9jbGlybXQrdGRTblUremw2?=
 =?utf-8?B?ckV1N0JFSjY4dXBWUHpIUXd5bzBzdTNwMVE2RWptVkZFaytiVzN1U0Z2eXBF?=
 =?utf-8?B?V25NUE5CaXEycnk3UmtOdWkvdEs5TzFDeGZxeHo0N0llbkdMWTdpOU1vWjVL?=
 =?utf-8?B?VzlDd0xIenlnUkZqejE2Nm1PN1Zob1RBYUhYaDJDQ2NnWWlxNHZ1bS82SHlO?=
 =?utf-8?B?SURWUE5VanVUYk5nWjB6ZWVMRUxSRXBKVW10cUZUQ0Q5aDA2bG1sQlZzcHlv?=
 =?utf-8?B?VXl3NEV1eElDdU00SFZHK1M0Q2FXNisvLy9HdGJ0eXhZUlNWaXB5QTh5a0NG?=
 =?utf-8?B?WXpLU1c5bE9kT0RqM3J2dHE4Y0h5TU5vTWN5dFBma2N3UUdaaXQvQVRKZ3Ix?=
 =?utf-8?B?QUJmd0gydzl3bTlaR2FkVzk0SjkrSnh0Z0ZUbHc4cUJHN0d1aGVNNEpyVVln?=
 =?utf-8?B?d1JZYi9ra2p3RU1taGZQN0p4Y3ViMitJNllDUDJVMGxJQzhMNm03Z2hmeldn?=
 =?utf-8?B?ZTgwaWxZRmpRMGVjRlVjRk9rQmVXY01ZeUxBZlZUNk13SW91ZDBuejBuMWkw?=
 =?utf-8?B?TldwOENTNnlLN3ZuSFFOb0tqZGRZV0tVUzZ5S2MwM2w0d1NqME1nNTJ6eWJK?=
 =?utf-8?B?ZmxBZ0NZOVZUY1k3RzhTVytWd2FyYnRKT3ZOcGI4YlpsWUdxYXRTNzd6N1lB?=
 =?utf-8?B?WUlRTldZN05aZmxRS0dPUUtUcXE5YWgxWlNwaHQzMjB6QnBXclpEdWkyVjJK?=
 =?utf-8?B?OXJsZjB2VWZVVW15YVBXdDdWZnBLMnN6TWlVanZMT29xUndYNWtCbFJBTzNF?=
 =?utf-8?B?Yi9YWUtldzY2Z09FRE9uWXdqNFhndEQ2S1dKdFg0RUlQVUJmU09ZNHkxUmxi?=
 =?utf-8?B?OGIzbCtnMGhxbUhrSThETjB2RUgvSk9nbi9yWGJNLzNkYUtiQWI3Zjh6aXM4?=
 =?utf-8?B?czdZY0ZKbXlhSGZZZ2w3NUoreW5NWnRqeHRrZlV5Y1RKQnVGaDRDZUhCa0NH?=
 =?utf-8?B?bWJXbnoxWHhpbWdFN3ZPSEkrODZLZjVGRmF2NmFSOThkZWJnSVNGc3lYYXh2?=
 =?utf-8?B?Q0FvUDdZc1FFOGFtRFlyYzRmY0xuU3Q3dUNVRmZ3RUF6QUlyWHpHSW1mT01H?=
 =?utf-8?B?VUlmNkd4THEwL1dxREp6M1VwWkVNY1ora0E1UVlIQ1R2VHVJWXpWM0R4NFN2?=
 =?utf-8?B?d2FiRmdLaW56MFl0RlZGNmM0ZzBBMUd1SWlMWEFIR0p3bUNaZG9YMjUzMlhz?=
 =?utf-8?B?MmNZL24yOE9aZ0JNYndzYXdNTXVZdVRMSzQwTWltOXpidzNhR09uVVVCWlJY?=
 =?utf-8?Q?oTNVv3iT5Xv9/54xH0Whdt0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b2093b-c5cb-49bf-4d22-08ddae120191
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 02:44:11.8570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lSarF4cNUZiZyfrY+rkSH2g8Ae89rbR2wBLTiSKbxxLo2oRySf+niOHm+XnjdXvj0dA2VoeZrAR+zCFy5YBARyWfMd1nVfiEFA2VIvcW9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
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



On 16-06-2025 13:03, Matthew Brost wrote:
> On Mon, Jun 16, 2025 at 12:44:38PM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 16-06-2025 12:00, Matthew Brost wrote:
>>> If a range or VMA is invalidated and scratch page is disabled, there

Nit: Although change log covers this, the helper from patch 1 is no more 
used for skipping tlb invalidation for VMA.
  >>> is no reason to issue a TLB invalidation on unbind, skip TLB
>>> innvalidation is this condition is true. This is an opportunistic check
>>> as it is done without the notifier lock, thus it possible for the range
>>> to be invalidated after this check is performed.
>>>
>>> This should improve performance of the SVM garbage collector, for
>>> example, xe_exec_system_allocator --r many-stride-new-prefetch, went
>>> ~20s to ~9.5s on a BMG.
>>>
>>> v2:
>>>    - Use helper for valid check (Thomas)
>>> v3:
>>>    - Avoid skipping TLB invalidation if PTEs are removed at a higher
>>>      level than the range
>>>    - Never skip TLB invalidations for VMA
>>>    - Drop Himal's RB
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pt.c | 31 ++++++++++++++++++++++++++++++-
>>>    1 file changed, 30 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>> index 9c30111e8786..b6df8995e8c1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>> @@ -1995,6 +1995,32 @@ static int unbind_op_prepare(struct xe_tile *tile,
>>>    	return 0;
>>>    }
>>> +static bool
>>> +xe_pt_op_check_range_skip_invalidation(struct xe_vm_pgtable_update_op *pt_op,
>>> +				       struct xe_svm_range *range)
>>> +{
>>> +	struct xe_vm_pgtable_update *update = pt_op->entries;
>>> +
>>> +	XE_WARN_ON(!pt_op->num_entries);
>>> +
>>> +	/*
>>> +	 * We can't skip the invalidation if we are removing PTEs that span more
>>> +	 * than the range, do some checks to ensure we are removing PTEs that
>>> +	 * are invalid.
>>> +	 */
>>> +
>>> +	if (pt_op->num_entries > 1)
>>> +		return false;
>>> +
>>> +	if (update->pt->level == 0)
>>> +		return true;
>>> +
>>> +	if (update->pt->level == 1)
>>> +		return xe_svm_range_size(range) >= SZ_2M;
>>
>>> = or == ? Dont think ranges can be greater than 2 MiB.
>>
> 
> This is future-proofing. For example, if we add a SZ_8M entry because
> profiling an application shows it helps, this code won't break. I also
> assume we will never fault in 1G ranges, so there's no need for a
> level-2 or 1G check.
> 
> Matt
> 
>>> +
>>> +	return false;
>>> +}
>>> +
>>>    static int unbind_range_prepare(struct xe_vm *vm,
>>>    				struct xe_tile *tile,
>>>    				struct xe_vm_pgtable_update_ops *pt_update_ops,
>>> @@ -2023,7 +2049,10 @@ static int unbind_range_prepare(struct xe_vm *vm,
>>>    					 range->base.itree.last + 1);
>>>    	++pt_update_ops->current_op;
>>>    	pt_update_ops->needs_svm_lock = true;
>>> -	pt_update_ops->needs_invalidation = true;
>>> +	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
>>> +		xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
>>> +					    range->tile_invalidated) ||
>>> +		!xe_pt_op_check_range_skip_invalidation(pt_op, range);
>>>    	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
>>>    				    pt_op->num_entries);
>>
>>

