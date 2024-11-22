Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2878EE6918F
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 21:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC32210EC9F;
	Fri, 22 Nov 2024 21:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OblsQaZA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7C910ECA4
 for <Intel-Xe@lists.freedesktop.org>; Fri, 22 Nov 2024 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732309235; x=1763845235;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eqxW3/QWH4F3bdukq7MMj4ISa9letuuTqws7OMeSr7A=;
 b=OblsQaZA7+F4DdFEOdd9tqVlCXpokgzfF+gwNYzLJgbINuUVBqI7LQsy
 hkg0rSGZ/fHfe4BTNcteIY56MMGNUmXOMT4Xc6mMj9IvLAuXPWmxrHvrA
 n6kKeOUNOz2Ajdexdf7YkNoCA3gEM5uCkXP2JKYNIQHmJy2DnTRkdCMeD
 e0eTytzBQpFVNjPcEDB47nn7RE7xWNpsCu+7fInCeEQbiIx+EGghJ8fR4
 z6fsGbPsSaPsu69ROUyAAcmNAB4vhp8xZuBOvx+3LBovvrHkAuVO1jzZy
 9/tK5V/FPspbOgCvfASVp1nKd5OG8+vZGbOypoLY2jc0WZRgrPBD8N9Ok g==;
X-CSE-ConnectionGUID: 9u0ww4O7T4CjOQFjbxSMcA==
X-CSE-MsgGUID: BkVsUvzDRf6M4//fgF7caQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32343616"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="32343616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 13:00:34 -0800
X-CSE-ConnectionGUID: nQyiQ2qKSra47Kf8237ENA==
X-CSE-MsgGUID: aPPvPDBqQviZstWDwoV8rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="91040023"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 13:00:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 13:00:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 13:00:24 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 13:00:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bp9lHEW5f275Q8VX7wwVlc5t+xedGXqkx3Bd+WPq32tQcqT8SumUyft++SLbFAaDG0MHbdwt+bSnDmCSMr8jlYvYFdbG5GkDHyKpc8/pbl6cGSVYCYwINg4XyrUkUkBnJSjoCUmactqTh5inR/ERjOBongWwgJfv9sNVSSHBAeriBugk/2BCTvRzTtwNVlmrtFCW4oIQDcjDi44wmCg1azUUal9DaOEK+Q9IkMzpXLamAVSDltjK7WBr+X3H/uTrOxgGO0/67gKeb4KaJYnouVu765OThOb03gJtMZrFoRSv07mZw29eTqYJO4DPbzRHlyrGbnLB5EAHEGUXcTAq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/X0eXFzYvgSV0Cj3vTbv8T+K0nCeJ43+1RIQaxFu6I=;
 b=Faqc/XB0KeLG76OxGHoAvUTKFWkKhkfsQIiNycUM38gULG/XnjJp6IIO++H7v5saI51GFgHplB7nKjG6APJF7cWgqOspQonvm4/1vajKxIx9r6h61Cbn/UJKCdW+EaWZy1OKhpFCVrzQplAbw+sIRv3qqIBZ05TKiQKMXtfcaZHZNWIxzTaz+g7OBK8MZklVUkX5Z5t9JIbFiYT6ll4GcUEkzUrtZ62D9NMO6Cp4LasF6td7Kyj+D4D0nrcIiNKZKjdTuXd3CZUNaFDKzGrVPlMvRkXCs9K1orP/DCuy/2WyKURruf3p3VKa4OroSTtn7TP9k9Sr/K+HgnrZPmyC+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 21:00:20 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.023; Fri, 22 Nov 2024
 21:00:20 +0000
Message-ID: <cfe75186-3e3c-44de-885a-f440990a0d2c@intel.com>
Date: Fri, 22 Nov 2024 13:00:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Add mutex locking to devcoredump
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241121225542.1336796-1-John.C.Harrison@Intel.com>
 <20241121225542.1336796-3-John.C.Harrison@Intel.com>
 <Zz/F29WgIzFmAH3V@lstrano-desk.jf.intel.com>
 <132d8232-e8a2-4c68-b426-ef5363e90eb1@intel.com>
 <Zz/mFHF4wYhFm16a@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zz/mFHF4wYhFm16a@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:303:dc::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|LV3PR11MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 0072da4a-a5a0-4b9b-9fb1-08dd0b38acb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFI1c0VCSG8zQWo3a0JRUzE2UXJiNFc3N3M2bGdTdzJFK1FLaFRremprMzEy?=
 =?utf-8?B?d05pRmhNcE8yMm0vcTQzNmdyV3l1VVh0cjNFeTRLYnkrMG5JYnpJeitPdXI3?=
 =?utf-8?B?SjhyMEkzRllERUFKNXZZUy9EZEcyeEFoeVJEaDg1cFlsYlc0ZFBYNEtoYTEv?=
 =?utf-8?B?TkZ4NXIvZno1b3ZlRHNPRUVKN2ZUSlAzV2ZvZzNTVmNyUDlkL2FZS2dXdXQv?=
 =?utf-8?B?VjQ3dWdqMFRuSWF4R2lUbkZ1MmxEU1NPck05Qy9OendJeHI1d1Buc3ZmeTRQ?=
 =?utf-8?B?b3BUSE5QZUNTRTdxUlVaUERpd3dZMUIrbjZuWE40WEdocjl4dUJ2RU1iRjhD?=
 =?utf-8?B?V1g3Zmd1bWpYVTVDbVRoUHBwQWdaSCs2cWhlc3hrV2x1WVkyK2hSeUpXUVI3?=
 =?utf-8?B?VVJteXdtZUdmUXg3NXVKc1FUcWNtSmE3c3BKdjVOcEt2RHMyNXVuSnVDVEpI?=
 =?utf-8?B?a1FmYk9VNCszanN0aDE0dXR6Rlp6WW1WVkE5K1pBZ3NOQnplQ1hZcmRWRVRX?=
 =?utf-8?B?bGVMYnZEUEM3a3d5ZGtlQTZic285MEhRc1NSQSsvMi8rZHR2WUNRTngzQmtJ?=
 =?utf-8?B?eFZYSU5FTGxTcDBaWTkwUHRUYXNGdExoTzZZY3g0R1o1SDhwTE52d1Z1ejU3?=
 =?utf-8?B?Z3FQamVacWNWTmtjV09ldWZOV0ozdHNwaExpNFNWTTAyTWptMmhkWHh6R0FR?=
 =?utf-8?B?N3RhdDcxL1hrbHR2UE1rU0hwY1NlbWhjVDk2dXcyaTgwQWk1WW00V21TcVo2?=
 =?utf-8?B?bTl6eUYvN1dyVnM0MUJuY0JNckUxTVlTSEE4R3ArRStrK0UxdWkzZjN2Z2JS?=
 =?utf-8?B?QjVocFBVbkM2bWdqZGp2b05uQlFZWlBuUXdJY3doeDVocXpWcXdHR0NqY2xZ?=
 =?utf-8?B?YVJvYUZBeENaSnIza3RWWFl0VmFYemJQaU5QT3BkYkxhY2txR09kNXZSYkpQ?=
 =?utf-8?B?Y3hlUk9iVm9HaXFqbXJoMEVCYjZpRmlUK2krRTJkamdackF0Vi9JbjFTcGtz?=
 =?utf-8?B?L0lGZUpEc1FRQUFML0l1ZlB6MVdycXpuaUFHQXlRd1dJclZIV0U2ZmR4RzRS?=
 =?utf-8?B?bE9PRGl1WENiVmRRZlNIbXc3U0xTV2NUTDlXdDdQWVZFQmc5WWtIZ0NyK0Fp?=
 =?utf-8?B?OHlTQysrdTZRUVpaWFJkYVJaalNxU3YrUnNhSDNnc3dpSE82bVkzREljeThv?=
 =?utf-8?B?VXhuWTNVenJyc3VIQ1RMei9lMGtrSU0yaDArL3lObUZFYk1MUWMyM0Zudzhq?=
 =?utf-8?B?cWwwY1lLeGJEY3lFWmFQdTFUeGZFMU9FeUVEbDdLbkhpcS9BMUQ1NnZaZ1pi?=
 =?utf-8?B?Rmo0Z051UkJFRE5GVUFXeFI5elNiUFZaWnZuV2d4TlNCMURGNGFORjZSL3hv?=
 =?utf-8?B?WFF4aUxYNnZ4Wnk2eHlHYUQvT1RUeXZ3cEcxMmJZNGZFVnppWXE1WkRjRTRU?=
 =?utf-8?B?L1JGMmdJQXIyR0lSNW9iTlY3dWovRHlZSVphVis2T2JYaW1iNjJ6d2V1by9B?=
 =?utf-8?B?Qld0Zk8ybHFiWTBDOWpPR0I3S1hvcmNMZnNFc0hwNFluN0RzYXFtaDhaYXJH?=
 =?utf-8?B?Q2craS8rWmF1V2wwL1JtbElDaXpvdmhsRmJHSnY2VHgzVmExWDRVa21EbjRP?=
 =?utf-8?B?djhWcStveTcrdWdyQnJvR3cvZVpCcEVpM0RuZ2RvUTNwQkpxWFlyamYyVFV6?=
 =?utf-8?B?UmFLMkw1cnlGUGs1Vld4R1pkR2Y1V0gwWG5sOWRQUm5YWTdVOVJmSTlLdGlw?=
 =?utf-8?B?K2xuSkhJYmxOWmdUbTlSRVIzd1BkQ3BHS0I0T041NVNWNE5HVEk5eURJT1Y2?=
 =?utf-8?Q?oljvfFp2VWlLwB/dBMrzlFyQ288W/FEfdjlcA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxWV3JWdEZObkwyZmExQWtJWDBwK3JqSzIwY0gxSE1Pa3RrL0dEUkJxTHJL?=
 =?utf-8?B?N2EzT0VZSVpUMmNRalZUaEYrNzR3TTB0V3ZMc0JUb1NkMDRCUU5GeS85UHJl?=
 =?utf-8?B?eHl2M2I2Tzg1NjQxektoNUR6NnJacER2aE9SU0p5UUtBTys2MkhlZURLS2F2?=
 =?utf-8?B?UDltNERXUVpVVURzRGFTSDIzcHd2UUJtMTQ5WEExTlgrS2lwWXZJMUxLdlIx?=
 =?utf-8?B?WG51bzlUSUI2Mm9FRzFFNWRZTGFheXRFZ2VnUnRoYmJlNmkwS3RlYlpCVHJU?=
 =?utf-8?B?Y2ZOREIrK0pPdTVNS3dUb3RNb2c4MThsTTdsVXkrR3lacXBkeHpVeldDdmp5?=
 =?utf-8?B?UWl1YUJiTi9ZMFAvNG4wTlNvOWZlcEpVcG5iSDhLRjFWU3Q4VkpuVGhDVS9V?=
 =?utf-8?B?Q3QzeHh5NDd3TTRVOWtORVgxbkxmV0JDNHVJc05FK1FtVno0bWJKY1B6b3NH?=
 =?utf-8?B?ZWtWdHc0aDYwNTVoSStmbExhZmFRc1Rxb0ZnMjdDaGxZYWJUSHp3M1ZpZFV0?=
 =?utf-8?B?QmZzQkRobk9UWk5XWnNsVmtlUkJwY2s3Q1hFa1NwdldSbHFscEIvYTk1TjJK?=
 =?utf-8?B?aUE2RFUwMFZ2bVRMY0wvdnhJMWRsYmRXMExBa2k1M3k0OFhySWJFMXhFU1J2?=
 =?utf-8?B?Y0VmTFpXNDY4R1JrNUhqUWkyb2diZE1sOHJVcHpvTFFYZlVrV3VZZlZtdk1W?=
 =?utf-8?B?WmVFbDZQc05FZHgvK1VZVWhJbGZTN2NMRUNLbXgzemdadUFOMGhaUkNDVlNX?=
 =?utf-8?B?U0dFOFUzQU1yaFA0YkFreEVFRlVyK2c1cFkxWDdmeGE1Q3hWOW9pS2duV1h1?=
 =?utf-8?B?ME9aU2FzVndObVBRbktvWXpkN0FhYno4bmxHL2MwMTlQME12NFNVK1lKNzFh?=
 =?utf-8?B?VnF0SXRsUlc4M1l2Y3dIUnFDdU1ITXRMdy9GMU8ySTNmajZ6ME1zY2JaRGdy?=
 =?utf-8?B?OS9DOU9xajQyUWRLa1h6ZUxsMDYzSXVTODEwU3F4b2VQZjBoNGFkVm5hWjlV?=
 =?utf-8?B?RWwwWFFBSFVNdGVIQ0EvSE9lamVwZDNRM01pN3ArelUzNG4yZ2dXOHllc3JD?=
 =?utf-8?B?cmI2UDA3UlI4aUkwdC9PaTNnRWVqVjJabi9JNGVqdURCbjR5aWlRTWR6WVdO?=
 =?utf-8?B?OVJETi9RK1haOFJIU3J4TE1SRzlVSVRDaWk4OVFnNWhtdEpjTGJBWWtRMHBK?=
 =?utf-8?B?L0NweFlSREwyeExHQ1hkM2JVME9CZ2xOcmJVUGdzWkF3QVZyM24rWXJtb3RS?=
 =?utf-8?B?L3ZrSFBTekgvVWtjS0dSSThnQkc4dXFyYmxONGFGZ05iV2xPaGZ4QVNybDUx?=
 =?utf-8?B?N0JuSUhYeElBRnBKNkNFd2JwV3ZqbHVyVjM4ajhjek42S1VORFVlazlYbGZ3?=
 =?utf-8?B?WG13eEowVnZhSTBJMnJDSzhmUkwwaGljdHBUUjVUNjVqV1VIRUNJdFV6a1A3?=
 =?utf-8?B?QzQ0Q2g1Nms3dEZ3WGhVTGFNNzFyZWk5V2Rsd3pRdDBNVzBERENQWEdZb01j?=
 =?utf-8?B?aXJpNHRsUDVZbEduNklEbGZ6T2FYOG9HcVFldlV2enk5Z2x6cU52UTJzMEJs?=
 =?utf-8?B?bUkxM3ZDTU91TVR2bDVrbkU4N0tjdHUralhUWStoTSs4U2JadnVRS01oSTVP?=
 =?utf-8?B?SmNwS3o2VmRYYlZWWmJXR3R2bjc0VGRrcllSczJYY0N0NUp4ZEMyU3RQcGxo?=
 =?utf-8?B?bmtpdGVJenBaV1FwMGY0eGRld0hpOHJNQnlmU1NIQURxOTB1RXRUbkhYN3E1?=
 =?utf-8?B?YzNIeTBGWnBBNmxNN0tjUEFXZnhCOUx6YjJCZ3E0ZXU4Q1pCMjZvOXJMZERS?=
 =?utf-8?B?dlJYQ2V6cEkvOGtrVU5qc3VPNjdiYXF4MlpKNEhxQ2FOY3JjUzlmUktwajhR?=
 =?utf-8?B?ajRjZjdUMW52TEJLaVp4VUxmNTRPdnZTQ2ZHL0ZjbzFEeGVRYXpQd3hWeEdK?=
 =?utf-8?B?S3Z4NHc2dG9LSmRkdVJlTll5RjhydzJ5U2N3d2plWmo4SlphS0U2aXgvYzhq?=
 =?utf-8?B?MGp3bWttSTRhVWxiNFVLKzNZelBkV0RweFp0RGlOa3drQnBtL0ZHWiszd3lY?=
 =?utf-8?B?WUpzRjNKdkhFYkdmL1ZmOHdrSldvTkJDb1VRN2JzRm5SZkZDYTM4UHFGRTZw?=
 =?utf-8?B?dCtqZ0dhOFFyZDk5QStYVUpGUHNGVUROYVFVT012RldXTHRiVlFsc3VJd1Jy?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0072da4a-a5a0-4b9b-9fb1-08dd0b38acb2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 21:00:20.2030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +u262CuNP0dvDOARmbSkiE9K4GVGaB4/ALtg53fAkvnru8XrGlEAHRCRdevTumAMGnm+TiJPCaMxlOCn9lwZzvMDjsxdc2fYdeVqBsANP5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
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

On 11/21/2024 18:01, Matthew Brost wrote:
> On Thu, Nov 21, 2024 at 05:25:10PM -0800, John Harrison wrote:
>> On 11/21/2024 15:44, Matthew Brost wrote:
>>> On Thu, Nov 21, 2024 at 02:55:42PM -0800, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> There are now multiple places that can trigger a coredump. Some of
>>>> which can happen in parallel. There is already a check against
>>>> capturing multiple dumps sequentially, but without locking it doesn't
>>>> guarantee to work against concurrent dumps. And if two dumps do happen
>>>> in parallel, they can end up doing Bad Things such as one call stack
>>>> freeing the data the other call stack is still processing. Which leads
>>>> to a crashed kernel.
>>>>
>>>> Further, it is possible for the DRM timeout to expire and trigger a
>>>> free of the capture while a user is still reading that capture out
>>>> through sysfs. Again leading to dodgy pointer problems.
>>>>
>>>> So, add a mutext lock around the capture, read and free functions to
>>>> prevent inteference.
>>>>
>>>> v2: Swap tiny scope spin_lock for larger scope mutex and fix
>>>> kernel-doc comment (review feedback from Matthe Brost)
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_devcoredump.c       | 26 +++++++++++++++++++++--
>>>>    drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++-
>>>>    2 files changed, 27 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> index dd48745a8a46..0621754ddfd2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> @@ -202,21 +202,29 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>>    	if (!coredump)
>>>>    		return -ENODEV;
>>>> +	mutex_lock(&coredump->lock);
>>>> +
>>> I'll just explain my reclaim comment in the prior rev here.
>>>
>>> 'coredump->lock' is the path of reclaim as it can be called from the TDR
>>> which signals dma-fences. This is why most of the devcoredump core uses
>>> GFP_ATOMIC to capture smaller state which could lost quickly. We also
>> So the reason string allocation in patch #1 should also use GFP_ATOMIC
>> rather than GFP_KERNEL?
>>
> Yes.
>
>>> have worker, ss->work, which opportunisticly captures larger VM state /w
>>> GFP_KERNEL. The worker is not in the path reclaim. Thus you cannot flush
>>> the worker under 'coredump->lock' without getting potentail deadlocks.
>>> With proper annotations lockdep complain.
>> Okay, that makes sense now. Was forgetting the captures are from the TDR /
>> dma-fence paths which are reclaim requirements. Doh!
>>
>>> e.g.
>>>
>>> We should do this on driver load:
>>>
>>> fs_reclaim_acquire();
>>> might_lock();
>>> fs_reclaim_recalim();
>> I assume this should be fs_reclaim_release()?
>>
> Yes, typo. Got a little distracted typing this.
>
>> I see three separate instances of a local primelockdep() helper function to
>> do this, two which do a might_lock() and one which does an actual
>> lock/unlock (plus another which does a lock_map_acquire/release, but I
>> assume that is very different). Plus another instance of the construct that
>> is just inline with the rest of the init function. The helper versions all
>> have a check against CONFIG_LOCKDEP but the unrolled version does not. Seems
>> like we should have a generically accessible helper function for this? Maybe
> A helper might be a good idea.
>
>> even as a wrapper around drmm_mutex_init itself? Although the xe_ggtt.c and
>> xe_migrate.c copies are not using the drmm version of mutex init. Should
>> they be?
>>
> Yes, all mutexes in Xe likely should use drmm_mutex_init. A prime
> reclaim version isn't bad idea either given all drivers in DRM use
> dma-fences and likely have mutexes that should be primed with reclaim.
>
> IIRC priming with reclaim was a bit of a hack actually, using
> dma_fence_begin_signaling/end is really what we likely want to do but
> that annotation had some odd weakness which would give false lockdep
> positives. Thomas may have fixed this recently though. If you post a
> common drmm function, I think the correct annotation could be sorted out
> on dri-devel.
Are you thinking this would be a drmm_mutex_init_reclaim(dev, lock) 
function/macro at the end of drm_manage.h? Or should it still be a 
separate drmm_mutex_prep_for_reclaim() function to be called after init 
and in some other reclaim specific header?

John.


>
> Matt
>
>
>> John.
>>
>>> Our upper layers should also but may have gaps. Reguardless, priming
>>> lockdep is a good practice and self-documenting.
>>>
>>>>    	ss = &coredump->snapshot;
>>>>    	/* Ensure delayed work is captured before continuing */
>>>>    	flush_work(&ss->work);
>>> So this is where the mutex should be locked.
>>>
>>>> -	if (!ss->read.buffer)
>>>> +	if (!ss->read.buffer) {
>>>> +		mutex_unlock(&coredump->lock);
>>>>    		return -ENODEV;
>>>> +	}
>>>> -	if (offset >= ss->read.size)
>>>> +	if (offset >= ss->read.size) {
>>>> +		mutex_unlock(&coredump->lock);
>>>>    		return 0;
>>>> +	}
>>>>    	byte_copied = count < ss->read.size - offset ? count :
>>>>    		ss->read.size - offset;
>>>>    	memcpy(buffer, ss->read.buffer + offset, byte_copied);
>>>> +	mutex_unlock(&coredump->lock);
>>>> +
>>>>    	return byte_copied;
>>>>    }
>>>> @@ -228,6 +236,8 @@ static void xe_devcoredump_free(void *data)
>>>>    	if (!data || !coredump_to_xe(coredump))
>>>>    		return;
>>>> +	mutex_lock(&coredump->lock);
>>>> +
>>>>    	cancel_work_sync(&coredump->snapshot.work);
>>> Likewise, lock the mutex here.
>>>
>>> Matt
>>>
>>>>    	xe_devcoredump_snapshot_free(&coredump->snapshot);
>>>> @@ -238,6 +248,8 @@ static void xe_devcoredump_free(void *data)
>>>>    	coredump->captured = false;
>>>>    	drm_info(&coredump_to_xe(coredump)->drm,
>>>>    		 "Xe device coredump has been deleted.\n");
>>>> +
>>>> +	mutex_unlock(&coredump->lock);
>>>>    }
>>>>    static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>>> @@ -312,8 +324,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>>>>    	struct xe_devcoredump *coredump = &xe->devcoredump;
>>>>    	va_list varg;
>>>> +	mutex_lock(&coredump->lock);
>>>> +
>>>>    	if (coredump->captured) {
>>>>    		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
>>>> +		mutex_unlock(&coredump->lock);
>>>>    		return;
>>>>    	}
>>>> @@ -332,6 +347,7 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>>>>    	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
>>>>    			      xe_devcoredump_read, xe_devcoredump_free,
>>>>    			      XE_COREDUMP_TIMEOUT_JIFFIES);
>>>> +	mutex_unlock(&coredump->lock);
>>>>    }
>>>>    static void xe_driver_devcoredump_fini(void *arg)
>>>> @@ -343,6 +359,12 @@ static void xe_driver_devcoredump_fini(void *arg)
>>>>    int xe_devcoredump_init(struct xe_device *xe)
>>>>    {
>>>> +	int err;
>>>> +
>>>> +	err = drmm_mutex_init(&xe->drm, &xe->devcoredump.lock);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>>    	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
>>>>    }
>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>> index e6234e887102..1a1d16a96b2d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>> @@ -80,7 +80,9 @@ struct xe_devcoredump_snapshot {
>>>>     * for reading the information.
>>>>     */
>>>>    struct xe_devcoredump {
>>>> -	/** @captured: The snapshot of the first hang has already been taken. */
>>>> +	/** @lock: protects access to entire structure */
>>>> +	struct mutex lock;
>>>> +	/** @captured: The snapshot of the first hang has already been taken */
>>>>    	bool captured;
>>>>    	/** @snapshot: Snapshot is captured at time of the first crash */
>>>>    	struct xe_devcoredump_snapshot snapshot;
>>>> -- 
>>>> 2.47.0
>>>>

