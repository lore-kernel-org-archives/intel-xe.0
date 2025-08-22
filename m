Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAD1CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 21:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A2110EBCC;
	Fri, 22 Aug 2025 21:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rr4vaF+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D282110EBCC
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 21:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755899949; x=1787435949;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5WUvihoKsmnHshZTW300HywsJZrwog6nWQmoYOriGS0=;
 b=Rr4vaF+/YHjaOWLQ7xH4EaogO21rTo91PeZKyoyuP5TuCX7swsN0pJBW
 xJkWpqu97L3m+1o0k+UOlyuRkQbYKXrW3TXfvQqQBzNyfYP/Tai33pXOr
 4D436RkNXfpx8K3o/RgExeFkgh1GYNzdhJQLMVzUYHClmUvMgRno66BkS
 Obb7PoP3AwV6Ce4Vyd90vTk1wZAcFBVSqk1iFO1ig4lCxUqlyUHCkm2OL
 /RP9pl/OgxrZpNL9A5DFRlhPfobvQVc/2RmGTznRsgzOhvn7Dp6stSXMD
 pHaA+8FhQXR3tnoyAuLzjXUJ5irmLqaQ7xRobZSBYQkuRcNmF8zget5IR A==;
X-CSE-ConnectionGUID: u/ufjM3wQp+FU776bg01EA==
X-CSE-MsgGUID: yL2WkeiuRtifceV2VAoT9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58162579"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58162579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 14:59:08 -0700
X-CSE-ConnectionGUID: WxqSaTcSRU+rjBiuYkk/nA==
X-CSE-MsgGUID: afYRHCZiQty0MQB8rI8ZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169161309"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 14:59:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 14:59:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 14:59:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 14:59:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oi5dEVdICA2VIKOuKKKQWfMnJN3Rfo0QF/G7mnW34d1+R0J7yr4yrPGUx2XtcgoUilQjQYaFnUV9fv2475HkjZJ/czqNioTYDJ1blzcNeop2NEtlm0m0UW9ZtozefLoE1Ot92toy4BPsF7M7HuAM2JSiSJ0hrDCxDJDJ9zxCjazwBOrzI+NuKzmcHS63zba7+pDYNezZXAL+St+sQZO5dFf6wfrArpkBVg9khh59eCc5yYKyyhwyu5A+Wvskr9thiHX4sd7adiP9foD0Wvb6ETqiibI5je4M/Z94lVLAxsIQsUOHT/kB3ZRb98i3lzA/jPwwqUd1JXq2QPo6beSVrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZjBmN3xbyK0u4kubo86bSBTXtnK1uyZTOxwir7HCXI=;
 b=ZgSdWxL/DXfjwVaZCZoYRCt+Dly4xBzBirMd6hb/WR3iqRVkZ9g1mqgdAJolIEFGxOSBBabEnNw62XhLmPO7bucegsAeYCiEeHt+SvAlvbncvJoy3EZGeP0+kHqQbdhf4CXrWj4vPPvB95il/cDr2axFwcoUuM06wEiVn1DAmm3CdkbqdwX34SXD/TsAszyBHf4hDsQBI+rgn3dC7ChqyElM2Rf/bnE3ZpKlxScMdYH6nCbwr/T7zmupc99o0SVFMjXXnW+sH1H1JuQpqvtfzJmaM1Ax19KYwZ9Gme9OkkLsB+f5XHDHD+7QrwmBOjctMnk2KjcuTaTvyArciYlYGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Fri, 22 Aug
 2025 21:59:05 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9052.017; Fri, 22 Aug 2025
 21:59:05 +0000
Message-ID: <4f066798-3d6c-410e-973b-42a2e6401473@intel.com>
Date: Fri, 22 Aug 2025 17:59:03 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 4/6] drm/xe/guc: Add GuC log init config in LFD format
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-5-zhanjun.dong@intel.com>
 <4c3a225f-fbeb-45c9-9659-ddfb1046d0f6@intel.com>
Content-Language: en-US
In-Reply-To: <4c3a225f-fbeb-45c9-9659-ddfb1046d0f6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:303:8d::33) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DM4PR11MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: b0143d7a-7d26-418c-88da-08dde1c71cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MERhOFRuc1gya1g1bVcxbEF6UHZYdndEY2NKaGRFT0JmTDdsWGVuMlFlM0pN?=
 =?utf-8?B?cUxXRTFJV252bGhkdDY3cTR0aGp6Q0x5OWlneXVKMThnVWxZT3pUNDRVV0VI?=
 =?utf-8?B?VWhFNFM3aGoyUDhubVB1T3RnYjdZKytiaVU5OGZGbkc4V29MUVpHYTRlUWFs?=
 =?utf-8?B?ZXZ1ay9JQVRidXlJY01ZNGpCNzJTdHVqMEdxT0Y4WUJhNmRoVk5BYmlqbWNl?=
 =?utf-8?B?K1g2Qnh6S25jUEZ0b3p5dWtIeVNLSjRPQkN1cFlXS0ZNT2tsRzFwUkhKSEpZ?=
 =?utf-8?B?YXRNVHZlKzExZFRBTUVjL2hrSWlCQ0Q1Y1E5MzV1VmhPUFA4WVhnY1pHSFoy?=
 =?utf-8?B?VXY2QXhoOURObGpwcDg0UnZzdzJFeVR4NlFuUUtXazJrMTk4NUpsQWtiTXBr?=
 =?utf-8?B?bUxtSXQ0MHNyYmxKY3pUV0ZLZGozdU5EbVRaN3lFK3Y3Y0FXUmJNMXc3bTlR?=
 =?utf-8?B?Unp4aStVajZnR3NNZDl3RFNmQmpUWjZObndQV0xrcjA0SnhFU3lXUWNsRGda?=
 =?utf-8?B?aHJpUTNyWDFyckREdEdwSlBCak9BN1lEK05YL2tQUkNKaHVHVHFQT0w5NEdP?=
 =?utf-8?B?ZnZ2NHlVLzMxYVI0VHdoVFNoYnBoYVZjTWgrVWtKa2dnRHYrUjZEQ2VNMUww?=
 =?utf-8?B?M1ZTSlB2elowV3BibVE0dWlDd0pLYUFtc3VQUyt5bG83eXViRW8rYmgxZTNC?=
 =?utf-8?B?SjBOTG90Z3FYREt4REVoNHZ4TWQ5VzQ2UVY0YTRxRTNwUlordmFJUlk0cE9E?=
 =?utf-8?B?bWF3WGZRWEUySnZNaUZGU3ZEZkovYUZUVjgyWUppcGNScjB0bC81ajJuVjdY?=
 =?utf-8?B?NXk0T1ROcjkwa29aRnh4cDVXQmpwRmFmbGkxUjdVbDNPY21kRTVqSFpPa3p2?=
 =?utf-8?B?MHNzT2RYYUkwbGgvY2Fid3hheFNQdnRTNk1PQ3A3K3gySmtxbG9hNG1pYTJW?=
 =?utf-8?B?ckxmNXRpdld1V3JhSCtNQWRPdStrazA3WWo5TUY4NGVkMndncUIrRVNlcm5t?=
 =?utf-8?B?cW1qZXN3RVAvVU92eGt6andwbzVIdnRONFRFdWE0a2tlVDJhazI0Vjg0d2U1?=
 =?utf-8?B?MVMxeVBVQ1REZmRVc2oxb1BVY2QxWFoxSjBkeXFrK1RCakQ4TTVMV1lGNEIv?=
 =?utf-8?B?cy9EakR4WGhpOFV6VExsa0plUlE5ckt3WXFrcXJGaWlQOW5XVmNwLytzQlEy?=
 =?utf-8?B?eG56RGRaMVpCbVhrKzBNOFZDbm9qYkQ1bjAyZ0NzNXVPQXJpakEzTUw4QWt3?=
 =?utf-8?B?MGVIQmNMNnZ4Ty9oeFl2a2hCVzdoSVdUWWJDeXFaOUtHK0tBc1VqdkZKRDlN?=
 =?utf-8?B?bTlQK2JNVWIwdWNyLzlkNERwMlpIUjROZm13SXFMbGRmUXlqMlBsMkF0aVUz?=
 =?utf-8?B?OG9FMlI3cWp1SUE1c1ZyeTRVYlRoZmRiQ1E2WG5LMERGWFJhK29uTGp5cGNO?=
 =?utf-8?B?UE9HK1kwU0hsTVVyai9qc0QreHBDR2U4Uk41ekNReDhER0hmR2V5TkZQT2dJ?=
 =?utf-8?B?QkRtYi9EcnFuYzVuQmdjRGp1bkdVZUpzZG9mR2tOd2JnRkFOL2NWVzl4MVlG?=
 =?utf-8?B?NHZ2SzBjN2R1UC9xd2lIZ1hQbG9XOHQvL3dVUEFobExQSnJGNVQ3UUI3R1Bh?=
 =?utf-8?B?d3hjbWlZR2lvZGF6NFN3WlpBRllvZjA2dVJkTTE3TGJldzBycHdLZXVWbitM?=
 =?utf-8?B?OGNIVFdOWWh3NHJGOUozMUw4YmVZZk5NcUZtZlBnaHhYRVppV2RsNUhaRHNO?=
 =?utf-8?B?ZE1WRUppUXBoc2c0TERIVkFDazIrdlRZU3pldFdRci82RGdIcjNIYmtCVitO?=
 =?utf-8?B?YzFuNWRuTjdhMGdtdjRKMGhkb3FlTWkxSVU3bDBEeUt0OVFPNlpJcmUrbCtS?=
 =?utf-8?B?RXRvREpCQklKY0xKeE94bDJPU0ozWWhpSlJ3cE9BN2lOdEx6RFpmODJkeUhJ?=
 =?utf-8?Q?fPs8MIFivI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWpoZnd2UDBnZVhSY3FuVkh5aWNqVVN5QjRTSlh2bmh2SjZIM2hYN0tlcXpD?=
 =?utf-8?B?MHpuRThRanZLMkJJNHN3c3pXWmxYeHR0MUE4VXYrUGdNRzc5b2JXZlFxT0VB?=
 =?utf-8?B?YnVKS0pIN0ErSmhheWlpbG5Oak4xQi9HTmUvbStxcXlYdHQwUHRYWVA5d2I4?=
 =?utf-8?B?eWg3cXFEdnhsS2FVbGdIQ0I5elV6NzdDY2tTS3lJUGJYQ3Y1OXZ4VUVoMDVm?=
 =?utf-8?B?WmJ0VmNHUkxBeTNmUGZmcFQwUFBhQU1adUxEMlpRck9hSC9EdlJPemF2OG4x?=
 =?utf-8?B?VFU2NFpCSGNwVTcvMFJESFpKTGRKeWgwY0NyV3ozZE1jK0psVnl6YmlRdXZ6?=
 =?utf-8?B?dFk3YmFaekU1Q2cvck5ucko2UGFkbGF5WTBOL0RPNmRlRmRDTTJXa0FxbEhW?=
 =?utf-8?B?OE81djhhdllIazZhSzc3VjRObFEydXdlWGxvcUgvZlhrWnFvWEZYYVk1d3Mv?=
 =?utf-8?B?S0w4QjN5R3lsbWZ0dWh2N0Q4U0cxeTk2SlBKNGZtcUNkeDBSNGRzSVRTRGhH?=
 =?utf-8?B?V3g4dnhRNkt3ckUrVjcxN3Z5Wlh3dVVPVHJMaXV5enBUMFJtazh0aHhxSWJ3?=
 =?utf-8?B?Q2JSWEFOMHFPZDZ0RzlWYU5DQ1pjR3FKeWRxQldGOXZPT3RVNzcxVUJqOXZD?=
 =?utf-8?B?djhadmI0M1QvV3ZwZVlTT3lsSGZzb241bkQ4TlFidS94U1BES3BvaSt6QVQr?=
 =?utf-8?B?a1crNjNHYVVtaWRDcTB1QmtZWTgzWnJRMTlEb1NSR2QzWGpHWG1iVkNudWc1?=
 =?utf-8?B?TUN5c2dQUzY0aXJ1VEpSVzlDdTVvQ2hrZnp6MzhiYXQ4UGFocE5aOExRS1Vy?=
 =?utf-8?B?bEE1NG01dFpSQ05DbkdYcGV0ekhaNGRYQ0p1b3V5NVpwRG1BaUxtNE03eVkw?=
 =?utf-8?B?NlpXeFhpTFlrODFJN0UrOEwvR1Jwek56cFdNWndJVGxvSW9NVEtWSE85OFpM?=
 =?utf-8?B?RWMzbUpnOWk0WmNkMmVBR3pURWVFYW9EdWtYeWdMRFVlb3RKdUduVTN6dmRW?=
 =?utf-8?B?ZUUwelJJcUVOZTNHSm5YMlpIbGl0UnBpVTRoOGpyYjBYZU9YVGZqSElZTEpN?=
 =?utf-8?B?ME1HWVBnNlhUS3hrSE14Mm5WdkF1VUVVczU2M1JzNDI3V2EvYmI4dVBtTWpU?=
 =?utf-8?B?OWJ3em42RWtBcTFFNlJlQWJ6R1ovWnBzeVFFY1dPMnM1Ny9MNzV1V2k4UExX?=
 =?utf-8?B?QWV4Wktzd0VpcnRkbDBMS0VJek9JNmFueUozWmxGL0U0VW1oYkpISW1sT2Fs?=
 =?utf-8?B?dW9EV05BcngvVGRwVjVOcjJ2MnEyZURQQjJiM0JrTmlwc2ZsTzhqSlg5QzNk?=
 =?utf-8?B?N1F3MU44eWxHYzJwNjA4OStaSEtMYnRXbDhSeTJpY0tXRTU5dHBITnl4OUs4?=
 =?utf-8?B?QnZkL0t3UWorN1k3STU2cDFuUmY5WWVNZ1BWR2poSE56REtsWjVrN3pCSnJG?=
 =?utf-8?B?RG5jSm1kSnM5WS90MnhDYVVlZFp4bkxyQjZuQ1hxcHdkbFpFc1I5cm5LYmpL?=
 =?utf-8?B?THk2TXp1c3JlZG5udFBaSVJHRTVpd3h6NjJ5Z0lZZmVFQ010SjlSYnNKTUNS?=
 =?utf-8?B?TXYzOWpURTNNN1pGNGJUdnRoUG8va1RtYWNzdW9NNXVxbDNFTlJOTU45S0t5?=
 =?utf-8?B?RCtsL2l3Vnpoak5XenM2TWY0OHh0VnI5WDRJbXB1NG5oZHg4bVhpdS9IVGVL?=
 =?utf-8?B?L0pJU3gzUVJ4SnJrY2RTWldFQWxtZDNieXI0N3BHdEhuNmdlKzgwYVN6NVRp?=
 =?utf-8?B?L2RmUGxFSzRzL0Q1dHZ5b2xleFRkMUlUZGtOZjF2MVQ3dURTeGZNY2RvRHJC?=
 =?utf-8?B?VnVNMG5ad2FsRzdTRE1KdDcwYWhrZkF4UVJtKzlUNW9DYkpsR1pVOEhPN1Jq?=
 =?utf-8?B?YXFCYUhzN1Z3UG5FdmZGa0ZGUXZJZDFqQlBiOHdxMW0zUC9rVXpNTzdqd2NR?=
 =?utf-8?B?R0FZU0ZLRFVQVHJwUGR1dXFZb2FEbS9zQU9mdnlxUysyYVFGQTJsUVpoTUcy?=
 =?utf-8?B?aldpQnB1bDZNTC9aRW9EWDg4SFhWYW9NRHFvK0RiajZ1c0sxT1pJUlFZaVF0?=
 =?utf-8?B?aWZXMXM4ZFhpSTFwT2JBMWZWclZnMGQ4blRhTzJuckRKVWJocithT1hoVXhJ?=
 =?utf-8?B?czhXMkVBbGV1RlRvL3FFbzVYclp3UzBXNllwcnBZVzI1aXhPK3V6UG1HTnZX?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0143d7a-7d26-418c-88da-08dde1c71cd2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 21:59:05.5926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /arp88ERZHyiTHRuz2sjAVhUY1xncm4ucI4ZPTMK9iRsUsLTsQfFPe5bAGNzhh5SVii5l1Al5O3dhvZaq9zP8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
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

See my comments inline below.

Regards,
Zhanjun Dong

On 2025-07-29 8:27 p.m., John Harrison wrote:
> On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
>> Add support to output GuC log init config (LIC) in LFD format.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_log.c | 204 ++++++++++++++++++++++++++++++++
>>   1 file changed, 204 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>> xe_guc_log.c
>> index d2256773aaf3..609a9fd5ba0c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/fault-inject.h>
>> +#include <linux/utsname.h>
>>   #include <drm/drm_managed.h>
>>   #include "abi/guc_lfd_abi.h"
>> @@ -20,12 +21,67 @@
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>> +/* LFD supported LIC type range */
>> +#define GUC_LOG_LIC_TYPE_FIRST    (GUC_LIC_TYPE_GUC_SW_VERSION)
>> +#define GUC_LOG_LIC_TYPE_LAST    (GUC_LIC_TYPE_BUILD_PLATFORM_ID)
>> +
>> +#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH        4096
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG        0
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH        1
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE    2
> These are already defined in guc_log_abi.h.
Will use the existing guc_log_buffer_type enum.

> 
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT        3
> And the LIC is not/does not have a guc_log_buffer_state header.
> 
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT        4
>> +
>> +#define GUC_LFD_BUFFER_SIZE    SZ_1K
>> +
>> +struct guc_log_buffer_entry_list {
>> +    u32 offset;
>> +    u32 rd_ptr;
>> +    u32 wr_ptr;
>> +    u32 buf_size;
>> +};
>> +
>> +struct guc_lic_save {
>> +    u32 version;
>> +    /*
>> +     * Array of init config KLVs.
>> +     * Range from GUC_LOG_LIC_TYPE_FIRST to GUC_LOG_LIC_TYPE_LAST
>> +     */
>> +    u32 KLV[GUC_LOG_LIC_TYPE_LAST - GUC_LOG_LIC_TYPE_FIRST + 1];
>> +    struct guc_log_buffer_entry_list 
>> entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT];
>> +};
>> +
>> +static const struct guc_lfd_data default_guc_lfd_data = {
>> +    .dw0 = FIELD_PREP_CONST(GUC_LFD_DATA_MAGIC, 
>> GUC_LFD_DATA_HEADER_MAGIC)
>> +};
>> +
>>   static const struct guc_lfd_file_header default_guc_lfd_file_header = {
>>       .magic = GUC_LFD_DRIVER_KEY_STREAMING,
>>       .version.dw0 = FIELD_PREP_CONST(GUC_LFD_VERSION_MINOR, 
>> GUC_LFD_FORMAT_VERSION_MINOR) |
>>                  FIELD_PREP_CONST(GUC_LFD_VERSION_MAJOR, 
>> GUC_LFD_FORMAT_VERSION_MAJOR)
>>   };
>> +static struct guc_log_buffer_entry_markers {
>> +    u32 key[2];
>> +} const entry_markers[4] = {
>> +    {{
>> +        GUC_LFD_LOG_BUFFER_MARKER_1V2,
>> +        GUC_LFD_LOG_BUFFER_MARKER_2
>> +    }},
>> +    {{
>> +        GUC_LFD_LOG_BUFFER_MARKER_1V2,
>> +        GUC_LFD_CRASH_DUMP_BUFFER_MARKER_2
>> +    }},
>> +    {{
>> +        GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_1V2,
>> +        GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_2
>> +    }},
>> +    {{
>> +        GUC_LIC_MAGIC,
>> +        ((GUC_LIC_FORMAT_VERSION_MAJOR << 16) | 
>> GUC_LIC_FORMAT_VERSION_MINOR)
>> +    }}
>> +};
>> +
>>   static struct xe_guc *
>>   log_to_guc(struct xe_guc_log *log)
>>   {
>> @@ -223,15 +279,163 @@ void xe_guc_log_snapshot_print(struct 
>> xe_guc_log_snapshot *snapshot, struct drm_
>>       }
>>   }
>> +static int xe_guc_log_add_lfd_header(void *buf, int buf_size)
>> +{
>> +    int len = sizeof(default_guc_lfd_data);
>> +
>> +    memcpy(buf, &default_guc_lfd_data, len);
>> +    return len;
>> +}
> For the sake of adding one dword in one place in the code, this seems 
> massively over-engineered.
> 
> I would just do "buf[0] = FIELD_PREP(MAGIC)".
Sure, will do>
>> +
>> +static int xe_guc_log_add_payload(void *buf, int buf_size, u32 
>> data_len, void *data)
>> +{
>> +    struct guc_lfd_data *lfd = buf;
>> +
>> +    /* make length DW aligned */
>> +    lfd->dw_size = DIV_ROUND_UP(data_len, sizeof(u32));
>> +    memcpy(lfd->data, data, data_len);
>> +    return lfd->dw_size * sizeof(u32);
>> +}
> Again, why split this out into a separate function? For such a small 
> amount of code that called only once, it is simpler/clearer to just do 
> it inline.
To be merged with next function>
>> +
>> +static int xe_guc_log_add_typed_payload(void *buf, int buf_size, u32 
>> type,
>> +                    u32 data_len, void *data)
>> +{
>> +    struct guc_lfd_data *lfd = buf;
>> +    int index;
>> +
>> +    index = xe_guc_log_add_lfd_header(buf, buf_size);
>> +    lfd->dw0 |= FIELD_PREP(GUC_LFD_DATA_DESC_TYPE, type);
>> +    index += xe_guc_log_add_payload(buf, buf_size, data_len, data);
> I'm not seeing any checks that the pre-allocated size is sufficient.
Yes, will change to either use local header or add size check>
>> +
>> +    return index;
>> +}
>> +
>> +static inline int lic_type_to_KLV_index(u32 lic_type)
>> +{
>> +    XE_WARN_ON(lic_type < GUC_LOG_LIC_TYPE_FIRST || lic_type > 
>> GUC_LOG_LIC_TYPE_LAST);
>> +
>> +    return lic_type - GUC_LOG_LIC_TYPE_FIRST;
>> +}
>> +
>> +static int xe_guc_log_add_klv(void *buf, int size, u32 lic_type,
>> +                  struct guc_lic_save *config)
>> +{
>> +    int klv_index = lic_type_to_KLV_index(lic_type);
>> +
>> +    return xe_guc_log_add_typed_payload(buf, size, lic_type, 
>> sizeof(u32),
>> +                        &config->KLV[klv_index]);
>> +}
>> +
>> +static int xe_guc_log_add_os_id(void *buf, int buf_size, u32 id)
>> +{
>> +    struct guc_lfd_data *lfd = buf;
>> +    struct guc_lfd_data_os_info *os_id;
>> +    char *version;
>> +    int info_len;
>> +
>> +    os_id = (void *)lfd->data;
>> +    os_id->os_id = id;
>> +
>> +    version = init_utsname()->release;
>> +    info_len = strnlen(version, buf_size) + 1;
>> +
>> +    if (buf_size < sizeof(struct guc_lfd_data) + info_len)
>> +        return -ENOMEM;
>> +
>> +    strscpy(os_id->build_version, version, info_len);
>> +    return xe_guc_log_add_typed_payload(buf, buf_size, 
>> GUC_LFD_TYPE_OS_ID,
>> +                        info_len + sizeof(*os_id), os_id);
>> +}
>> +
>> +static void xe_guc_log_loop_log_init(struct guc_lic *init,
>> +                     struct guc_lic_save *config)
>> +{
>> +    struct guc_klv_generic_dw_t *p = (void *)init->data;
>> +    int i;
>> +
>> +    for (i = 0; i < init->dw_size;) {
>> +        int klv_len = FIELD_GET(GUC_KLV_0_LEN, p->kl) + 1;
>> +        int key = FIELD_GET(GUC_KLV_0_KEY, p->kl);
>> +
>> +        if (key < GUC_LOG_LIC_TYPE_FIRST || key > GUC_LOG_LIC_TYPE_LAST)
>> +            break;
> Error message?
Will added>
>> +        config->KLV[lic_type_to_KLV_index(key)] = p->value;
>> +        i += klv_len;
>> +        p = (void *)((u32 *)p + klv_len);
>> +    }
>> +}
>> +
>> +static void xe_guc_log_load_lic(void *guc_log, struct guc_lic_save 
>> *config)
>> +{
>> +    u32 offset = GUC_LOG_BUFFER_STATE_HEADER_LENGTH;
>> +    struct guc_log_buffer_state *p = guc_log;
>> +    int i = 0;
>> +
>> +    config->version = p->version;
>> +    while (p) {
>> +        for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
>> +            if (p->marker[0] == entry_markers[i].key[0] &&
>> +                p->marker[1] == entry_markers[i].key[1]) {
>> +                config->entry[i].offset = offset;
>> +                config->entry[i].rd_ptr = p->read_ptr;
>> +                config->entry[i].wr_ptr = p->write_ptr;
>> +                config->entry[i].buf_size = p->size;
>> +
>> +                if (i != GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT) {
>> +                    offset += p->size;
>> +                    p++;
>> +                } else {
>> +                    /* Load log init config */
>> +                    xe_guc_log_loop_log_init((void *)p, config);
>> +
>> +                    /* Init config is the last */
>> +                    return;
>> +                }
>> +            }
>> +        }
>> +        if (i >= GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT)
>> +            break;
>> +    }
> This does not seem like the correct way to decode this data. Not all 
> these items are the same structure. While the crash dump section does 
> technically have a standard log buffer state header, it does not 
> actually use it. And of the register capture buffer is not interesting 
> at all to LFD dumping, which is the only other section to have a valid 
> header.
> 
> I would flip this around and have a helper function which finds the 
> structure in the buffer that starts with the given magic header and 
> simply returns a pointer to it (or the offset from base). Then the 
> processing code for each section (which would be very different 
> implementations and be called at different times) can retrieve the bit 
> it is interested in and use it and not worry about having to have a 
> generic function that processes all sections at once.
Good idea, will changed to use marker to find out structure for it>
>> +}
>> +
>> +static int
>> +xe_guc_log_output_lfd_init(struct drm_printer *p, struct 
>> xe_guc_log_snapshot *snapshot,
>> +               struct guc_lic_save *config)
>> +{
>> +    int type, len;
>> +    size_t size = 0;
>> +    char buf[GUC_LFD_BUFFER_SIZE] = {0};
> This will add 1KB of zeros as a global static object. You should never 
> give large arrays an empty initialisation like that. I recall someone 
> once doing that with a 16MB array and it took us ages to work out why 
> the driver was so huge in debug builds!  Also, this is putting a 1KB 
> array on the stack. Kernel stack space is limited and you should never 
> put large objects on the stack unless absolutely necessary. Just use 
> kzalloc() for this.
> 
>> +
>> +    /* FW required types */
>> +    for (type = GUC_LOG_LIC_TYPE_FIRST; type <= 
>> GUC_LOG_LIC_TYPE_LAST; type++)
>> +        size += xe_guc_log_add_klv(&buf[size], GUC_LFD_BUFFER_SIZE - 
>> size, type, config);
> I really don't like this idea of effectively cloning the LIC blocks into 
> LFD blocks. There is no requirement for any cross-compatibility of 
> structures, enums, etc. Also, the LIC information is potentially useful 
> data for the driver to include in other places, e.g. devcoredump output.
> 
> My preference would be to decode the LIC blocks as part of the GuC 
> initialisation and save the info in the xe_guc structure. Then the 
> devcoredump code can print it out and the LFD code can create LFD blocks 
> from it. But no longer with any assumptions or connections to LIC 
> formatting.
> 
> Also, no buffer overflow checking?
Will avoid use LIC_TYPE_XXX
To be changed to add type from GUC_LFD_TYPE_FW_VERSION to 
GUC_LFD_TYPE_BUILD_PLATFORM_ID>
>> +
>> +    /* KMD required type(s) */
>> +    len = xe_guc_log_add_os_id(&buf[size], GUC_LFD_BUFFER_SIZE - size,
> &buf[size] -> buf + size
> 
>> +                   GUC_LFD_OS_TYPE_OSID_LIN);
>> +    if (len < 0)
>> +        return len;
> Aborting on error means that if the given LFD block didn't fit then you 
> get no output at all. Would it not be better to print a warning message 
> and just skip adding that block?
To be optimized>
>> +    size += len;
>> +
>> +    xe_print_blob_ascii85(p, NULL, 0, buf, 0, size);
> Why use ASCII85 encoding? The LFD stream is supposed to just be raw 
> binary data, isn't it?
> 
> Hmm. For small logs, it might be useful to output in ASCII, but then do 
> we need some kind of file format on top of the LFD format? E.g. the 
> "[LOG].data" tag below is part of the devcoredump format and has nothing 
> to do with LFDs. Do we need any kind of extra formatting? The LFD 
> already contains all the meta data we currently need and can support 
> adding arbitrary meta data anyway. So there is no need for extra data 
> around the side of the main payload such as we have in the current 
> debugfs log dump file.
> 
> However, the main purpose of a streaming output file is for capturing 
> very large logs. And those are going to need to be compressed to move 
> them around. In which case, there is no point in doing ASCII encoding 
> because it is going to become a non-ASCII zip file anyway.
Sure, will output LFD in binary format.

> 
> John.
> 
>> +    return size;
>> +}
>> +
>>   static void
>>   xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, 
>> struct drm_printer *p)
>>   {
>> +    struct guc_lic_save config;
>> +
>>       if (!snapshot || !snapshot->size)
>>           return;
>>       /* Output LFD file header */
>>       xe_print_blob_ascii85(p, "[LOG].data", 0, 
>> &default_guc_lfd_file_header, 0,
>>                     offsetof(struct guc_lfd_file_header, lfd_stream));
>> +
>> +    /* Output LFD stream */
>> +    xe_guc_log_load_lic(snapshot->copy[0], &config);
>> +    xe_guc_log_output_lfd_init(p, snapshot, &config);
>>   }
>>   /**
> 

