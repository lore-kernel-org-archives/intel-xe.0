Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E316C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 23:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9EE88668;
	Wed, 14 May 2025 23:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8b1JajL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C836D88668
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 23:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747265277; x=1778801277;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xbviNcZAXmV02z9ckWEtrNhxZ2lhvhu6Fq/qt3rCX9A=;
 b=I8b1JajLLXUNWTuNbdxztgBfCop5t8OfVKlQXV9ehJlNHdPYMkHJCS4b
 FOkky7LncCWjf9TQ1Xp1bbBGIsfN0auKlGxQj4OJWYGrhvZVkurowTARh
 Jdf0YUoKDXOQKIe7JdvWpY6B1SSJizjSxgZisOWQ6ZBcC10DiCd2UXaCV
 3LQUe1rCEPln+FJK5QJW6Olp7PdjFxCitnZiMtZEwZmpdENTG7jPsE3ld
 mscSyxeUBrmUTASC3nroxvmi0XP9aXBpZum+jJwszK7ghSKtesH921ip6
 b/KOWUJWhl926o1XXHWYxDlsB2fY23WT3AZhvaao37IUgxTfGzVbqgrs7 Q==;
X-CSE-ConnectionGUID: /a5I4yidTvemdkT8dw9lEw==
X-CSE-MsgGUID: AZYeYOBaQcKhnA+C/igzgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49257808"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49257808"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 16:27:56 -0700
X-CSE-ConnectionGUID: ca5d5hNGSNGLagI49Nld8g==
X-CSE-MsgGUID: AiGB4A9hRmuusysevvdGzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142209641"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 16:27:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 16:27:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 16:27:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 16:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yU82ljDA68if5YrRNvM95aXa1ip+Hi21153nOa7fNn9HpJh7/4qgbjjcbLw1AG5lrN2+xkM4ywVsyxIBrtz1kD66iiEHDm5vHPHG1i8DJRzZHVJJx1OkI9Mlz7MrtFtBr9YgGlGfIUHScJ+fAQgrayOU4RRxt9ox6SjAb6akX48BIkeNL3j/QfW1fZKKR9wgKf0Ljx2ViMjpa1Zj72NRJwoakYa1u3PdHHBf/CMAFLCHejKrjSeAIc6CK3N+u14b5KGm4p3nOsNve9tRm2KZxZvYZmweTTPgRY/RCCgCWbzcbBbD0Ex8OACCGaOyqjMqCW9vLAB8pAB9VKBMnC376A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDaZqZjN2ZlGKHatPm/xVjOb6eQQrJAXVBte/YfMH9o=;
 b=mW4T5G4cG0S5wajESjuQ2uBYS3J8/xk0j/gFCabGOE4KaxsldQr9YvMcLnmpYIznq8eNmhmWKCjWjrILdHIIPxk23jPH5KAaYqrgPl6Nm6d372BCnK/Ri9YuB42StLwTHkSK0ppJoNrI1sfYdW7Aj6RV/2bqhJ/RArDwDxkKf0qEvCGf8yMe4dWw3bfocZ/knFcHyleiwHHMFcod/ZSAFW41ZqYSzXLLe4lp8BWPymp8Ly25Qjl85EkW5gc+Ch2nV5AyAOGQ48cUwEoHwcYuVoqnSj1Jw4iYXgB9MXVw1xPpkgmKjrs+z/3VYjLASfmPZPPW0UdjsTG4cvVK1PSTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SA1PR11MB6662.namprd11.prod.outlook.com (2603:10b6:806:256::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 23:27:47 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 23:27:47 +0000
Message-ID: <89a7c36e-a588-40be-9037-7f82d6abd1ef@intel.com>
Date: Thu, 15 May 2025 01:27:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/7] drm/xe/vf: Finish RESFIX by reset if CTB not
 enabled
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
 <20250513224952.701343-3-tomasz.lis@intel.com>
 <779be9db-0359-4af2-b4f3-9cf90836162f@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <779be9db-0359-4af2-b4f3-9cf90836162f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0017.eurprd08.prod.outlook.com
 (2603:10a6:803:104::30) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SA1PR11MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: edc75e92-6ee1-40cb-dfcb-08dd933eef54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THZBZjhEei9YYjNGSUJNYjFPU3gybVFVR2RWL1FjaFBXcUVYa0d4K0tQZ2lL?=
 =?utf-8?B?NGF2THpvUWpaQWMzL2hTNmt6amsyaE1xa1lUVkhlWEpkTlk0eXFTMmt4R2Zn?=
 =?utf-8?B?UTM4aUMxTlNkWVVrd2JYVStjaVpHSk9BTXIxby9VNEZLald4b09yc3hiMGFt?=
 =?utf-8?B?WkppNW1mOUs1VDMvR0wrbnB6R2d0MzA0U2NuZlRRL09wWTlpTWZPTHM1d2xX?=
 =?utf-8?B?Q05aZk5neHZqNlZiL0Y5RkQ3VXpkWGE3dDRNb1lwamJYeTZmWko4dDVqdVl3?=
 =?utf-8?B?VWVSbmQrajVjRUpxWDFYbmRXNkczS2ZlejAySlNtT1dzWmluaEd6Q1FSVnJP?=
 =?utf-8?B?WEtaUTVyU3BtY0F5RVNQSzVmek9ia3dWaHB0Zk1RSHJORlJESXMzVHR1ODYr?=
 =?utf-8?B?OFEvQzhXdlNGbVdPZ0pXZCtIUnQ1RnZ6UHRpbXJzQmE4VXBQUDNCaWxsaWZH?=
 =?utf-8?B?MUc4b0J4ZTJJaXVocGxTWXNuSGJpTGtjVmZnR09TcitUU2VWanU2Ky9xaU9s?=
 =?utf-8?B?ZTFyeGs0OVZRTEJrWVZaRVNHekVWQkxGYUwycGFoQXVJZ0VUUUR3UEYyWm95?=
 =?utf-8?B?R3NjQ204VGR2YjJHc0J6TDN5MTdxaHRwbXdDZEYvMUFkMzZ3WGw0WXZsUFNK?=
 =?utf-8?B?M2xCMWtKb0g0dnBJZjM4aWtqMmVYc3A3OVBSWkFkQ2twNXJ1THNlL1hoU0xO?=
 =?utf-8?B?ck9oZGszdWVMZkpISnFsZ1NudkxmOC82aTFXOUlzMzBwN1dsYmdHSjFVaWxG?=
 =?utf-8?B?Z2dDckQvQnZpMTNpQzZzT0U1N2lBMzJhbGtzU3lRd21sVFZ3YStuNUh1WUtw?=
 =?utf-8?B?dVhDVnd1ZW5naEZjbHFHblFsS21oNk5KenBseWhZVFFGQjNoK04wT0F4ODBi?=
 =?utf-8?B?aS9FMWZnMWk4dkVHdnhWWUIrekI3TE1ROTNvempXWENHZzIwT2gxaFcvbEdZ?=
 =?utf-8?B?aDVEeWlKdVFvWngvSnJOOG8yc0lrMGtNWm9FLy9zQXhRRkszSlFRUjY4eTY4?=
 =?utf-8?B?YjRTek0zMmZFdDZIZlo1VEFXSzVDeUdiOHN2TWZkdCtvYk1jQmM3VlgyZTNJ?=
 =?utf-8?B?cGRBNWNYdm50NDNzNUpJSGZFVVdHSFVyVW5zbFZWWnZLOTc3UTltUXNDdmJC?=
 =?utf-8?B?MGZrWG94SEtjc094cjFzTXpOdkFDV1ZXQ2Z2SUM4ZHVyVjlQYTViWW0vaEJa?=
 =?utf-8?B?UlYyQUJ3N0xiUmU1Q1o0aktORTgxUUVxbUZKRlFlVlJGZEVXNzlNWnV5UHAy?=
 =?utf-8?B?UzNUSXFaK0djVjNTY05YM1JRMUZyNG1uUkNTK0JCb3IrME1ydEt1N01LOUVC?=
 =?utf-8?B?dUV6TXdLUzBSZCt0L0RtY0VMZ2xrcVRvdGxvSWIyK0JoNksvWDFZZUxuRFJn?=
 =?utf-8?B?eW80bm4yWFExL2p0c0NRV3lMdnJlSU1RWXkwaENJTzBCc3Nsa01rZXZjajVK?=
 =?utf-8?B?R2xFL1hZR01sU1ZnM1VxY240TUJZeGlCYlhITVlBYmJsQmxzRUF1NmhQZHIy?=
 =?utf-8?B?bVVNOXlKdEVuNXBXZ1N2Q3dpK1BJY01yd2JtWFZEaXdvb3JnS3RMMzBKZy80?=
 =?utf-8?B?VUJNczJZZVp1ZlMrMXdtUHFZVEdVN3laR3JuNXVEemtaZjd1Q3RPNGt6SGdu?=
 =?utf-8?B?U29MUlU1N1p2QXUxNWsvOUduYnloOGhkc29sV1N6RnhzL1UyUWx4Vis3c0VC?=
 =?utf-8?B?ZzNUelg2cFlpZS95MjlpanhmZ3hxdGczUWhTb2dSOFJwUHpiS1Z3VkhUTm9C?=
 =?utf-8?B?QU1CZWVCR3U3QVkzYmJMM1JCVGRtaTFKTTUvb3R5ZlZMUnZhc0xyMEV0QW9P?=
 =?utf-8?B?S0dmbVA2aVgxMW91RTNJWVFyeDY4VitrczR0WGRKang0eDNFSVhOd0dKRXYv?=
 =?utf-8?B?azZPMXo1VEIydGZ6cWJubUQ3ejZZd2p5d3UxTVdkeW1vZno2UkRrTWVvK09O?=
 =?utf-8?Q?lTQD9SpTRS0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW1ReTk1UzhrRkJxUDZiVzAyTWlPTVF3MTJHT2VtbVVSU01jUVpIWXNKYmtB?=
 =?utf-8?B?V0QwZjh4YVVQMXBydnZEbnRNeko5SVhtWWNWOTRnd0dtVUNiVVdRQWFVQXhR?=
 =?utf-8?B?clpRcUJGRWZMeEFyMnp1T1RRNTVKR2U0dVpSUlhNa0RmbzU0LzRHL3JoUThL?=
 =?utf-8?B?QjhpaGdPMm1tcUpLNC9BV2ROY0RRZm50bWZmczdmT0pKT0ZzbG1RUTNCeEl4?=
 =?utf-8?B?N3RnTm5tYldacTNOMUoybkdyVFExSytwRWJ0N0FNYm52NGczb3NITEhmdktS?=
 =?utf-8?B?cDc5Y3A5RWdQd0kyd2d6cWlyMmdNeWdmMVVBQVI1NXVIMDdyajNQd1NDMFUz?=
 =?utf-8?B?UEh2VTdYTFcvVWthVGc2WVo1SEVJL3pVTW9OeWwyNkdUTk4zcVFUZllUMmdy?=
 =?utf-8?B?L3N2ZWhWOFB6c1E5L0JqZVFZbjZ1UUxXQ1dOenc5bVhydkpXMExiMm9rMzRS?=
 =?utf-8?B?TldtbXJvWFA0QkFPMmhZSVcwc0Yvd3NIZmZNMjlvQmNuMUZ0TVZvbmg4cXRI?=
 =?utf-8?B?RTZnV0xvSExqMEt6a3d6dzNybitqNnlLYldvekN2bjNGaExsem1TbHJrVEVv?=
 =?utf-8?B?VlZoaUkzL01UeStISExlY3JNTDFVcE1YK0VxWFdnUVpXR1RFM1dSMmpWNk84?=
 =?utf-8?B?ZmQzZzJmdFlpVlQvdVB0RG1SV3VabnNZRC9rSlk4NHZ4VjNtOG8wd2ltd2Jt?=
 =?utf-8?B?YWtURGtZT1cwUGMraXBLeU5qeVRZUHE1eitvN3RYRTYwZE4vTHpiYys5OWpn?=
 =?utf-8?B?VjBVS1Y5RTNyang0YzJZT1hCeC9qNWlpUExVUkRvK21RamhQVkVrUjE1VXhB?=
 =?utf-8?B?a1Q4ZEYxK0F0U1RiSjVwbDJhdXcwVjVvTUY3OXFJQlRBTWhtVFVSUWttemYx?=
 =?utf-8?B?bytYbEhCeC9QVndqOVFvdU1RVHRocktBM1JIVDRaemtPK2YrQWI1UnRIMmpU?=
 =?utf-8?B?SWZnTExsRDJOckl2TFBiTXVCWGVqd3JrK2piNnY2SGpCbk5LRmx2Mm1nNSsw?=
 =?utf-8?B?K3B1SXBSbllibGI2RlRFOGx5bHFmY1NxUUFxUDJFQ1VnOWM5WFVmTTlMWm51?=
 =?utf-8?B?V25UZjNXZmczN1djUW1wZGJWaGxhWDRLc1JQS2FiRnR3Z3J3UExhMmtDYlEv?=
 =?utf-8?B?Vk9uVmRFYUlLbHVENEs5WTVlbzFzcXhLZ2tyTVExcVZNbi9LQXJ1Y25OUmhu?=
 =?utf-8?B?U1FTb2RDNUozTmFha0dpQjkxM05lRFFMZDk4c2pQcXBNTWtsSkd5Wllzek50?=
 =?utf-8?B?RGZIeDUyRmI5ZXhlMzd5TFJ1dHRGN2Z0SkFlNWFtZVVxTGJ5WFZDT2lZcGx6?=
 =?utf-8?B?RWY4bkp5RnJZdUpDbnRUeXpqOE5wZFV5R080YUczRk92ZEhVZHpBbzhGZDZk?=
 =?utf-8?B?dUUvcXJpRExQcHhSQm1rbTBoQ0g5dW11dXZNS2hFN0d2Nm9PeFNSVEwxcFRZ?=
 =?utf-8?B?MHp4dlU5MDFRTjJoVHF2TTVIM1hjdG1ETlpmb1pRWTRtblh2WUhnRVlmR2dO?=
 =?utf-8?B?dnFDZmZqRUF4cW0vOFcwZFJ5SGVQZFRLV1M4ODNTYlV4Wm1Xb0tvSnMxWXJ1?=
 =?utf-8?B?TFVpWDJ4YStWTktVeTBLNUJ2WHJva3JNRXg5Z3U5WUlQZTlKMVdYK3NWU1FE?=
 =?utf-8?B?cmFQT0k4bXJ6Y1JQSGwzVVlCd3pnQUxiUVNWWDZDcDBMbDRyVnNuT0JGRTBj?=
 =?utf-8?B?RTFENGZ5bTJJSHMzTmY1d1BrWTFTN2syb3JjVDZGc3lXdFN5M1JucWMxSENX?=
 =?utf-8?B?MUtFdm1TVGFQVkpxQWo1UWJMb245ZmpVTTI4c3NLSW5USjlLK1JkOElqNitY?=
 =?utf-8?B?Y1Z0TkhIdDArclhQY0R1b3pGVlJuVHE1aDJGRlp6aEwzd0JybDg3MEl5WVFE?=
 =?utf-8?B?Wm5jT2hEYnVLNUJxSW03R2dRWlJJa0djdWptY0FTUXBhWFg3QVpFUlFwanJm?=
 =?utf-8?B?Z0J5bmsxS2tTa2d2NjRvRFhpK1dBUVUrbnBoZ2JIdkxhMHk0cmczTGRLaWJP?=
 =?utf-8?B?eGw0Mm04WkRDU213NXBBU2ErNnpKNzNCR2lYV25kdERYL0lUUklrR3pqQ1dQ?=
 =?utf-8?B?U2N6Y2V4SlZuMWYvVDE4NWtwczhReGZOUXdvZ3Zxamx4dkovN3YyalZHbXpY?=
 =?utf-8?Q?JqR31JhFju5pwaHuRRHoVmfcn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edc75e92-6ee1-40cb-dfcb-08dd933eef54
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 23:27:47.2969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSP/v7mrQ9BQijgL2Hlgs8fti3HzDnr6t6pi9gUrJJ/4WHd1Jj5BM4R/WAMCDSvH9B1u4vqodSdBLD4FCK33Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6662
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


On 14.05.2025 19:23, Michal Wajdeczko wrote:
>
> On 14.05.2025 00:49, Tomasz Lis wrote:
>> The RESFIX state should be achievable only when CTB communication is
>> enabled. If CTB was disabled and we still got it, then either we're
>> dealing with unclean initial state, or the driver is not currently
>> functional. In these cases, exit the RESFIX state by reset.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 ++++++++++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c    | 18 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
>>   3 files changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 4ff7ae1a5f16..b9af112ca771 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -23,6 +23,7 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_gt_sriov_vf_types.h"
>>   #include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_guc_hxg_helpers.h"
>>   #include "xe_guc_relay.h"
>>   #include "xe_mmio.h"
>> @@ -932,6 +933,15 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>>   
>> +	if (!xe_guc_ct_enabled(&gt->uc.guc.ct)) {
>> +		/*
>> +		 * If at driver init, ignore migration which happened
>> +		 * before the driver was loaded.
>> +		 */
>> +		xe_sriov_vf_post_migration_reset_guc_state(xe);
> this triggers async-reset on all GTs, not only on this one where CTB is
> off but on other GTs that might have CTB enabled and running - is it
> safe to reset them too?

There should be no situation where some GuCs are in RESFIX_BLOCKED while 
others are running. Also we're always probing/suspending/resuming in 
`for_each_gt()` - so there also can't be a normal (non-exceptional) 
situation where one GT disabled the CTB and the rest require a standard 
post-migration recovery.

We may receive an IRQ from only one, or from all of the GuCs - either 
way we should respond with resetting all.

It is likely that the current probe/resume will fail anyway, resulting 
in a wedge. But by resetting all we will get to a state where retry 
(unbind+bind again) should work.

> and if CTB is off, can't we just wait with "recovery" once we actually
> start the CTB later on?

Enabling CTB will fail in RESFIX_BLOCKED state. Very few commands are 
accepted by GuC in that state.

>> +		return;
>> +	}
>> +
>>   	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>>   	/*
>>   	 * We need to be certain that if all flags were set, at least one
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 2674fa948fda..940b81036321 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -134,6 +134,24 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>   	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>>   }
>>   
>> +/**
>> + * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * This function sends VF state reset to GuC, as a way of exiting RESFIX
>> + * state if a proper post-migration recovery procedure has failed.
>> + */
>> +void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_reset_async(gt);
>> +
>> +	drm_notice(&xe->drm, "VF migration recovery reset scheduled\n");
> note that there likely will be already
>
> GT0: trying reset from xe_sriov_vf_post_migration_reset_guc_state
> GT0: reset queued
> GT1: trying reset from xe_sriov_vf_post_migration_reset_guc_state
> GT1: reset queued

right, will remove the extra message.

-Tomasz

>> +}
>> +
>>   /**
>>    * vf_post_migration_requery_guc - Re-query GuC for current VF provisioning.
>>    * @xe: the &xe_device struct instance
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> index 7b8622cff2b7..ba846af34a13 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> @@ -10,5 +10,6 @@ struct xe_device;
>>   
>>   void xe_sriov_vf_init_early(struct xe_device *xe);
>>   void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
>> +void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe);
>>   
>>   #endif
