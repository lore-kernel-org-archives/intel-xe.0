Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351DDD73E8C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 21:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EBD10E8D0;
	Thu, 29 Jan 2026 21:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbRdYvK+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1918010E8CC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 21:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769722895; x=1801258895;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Q1Dd8flRnHWItMB8s9gGd63qwRAL56k4ZKNI/zvSdKM=;
 b=DbRdYvK+sPCa3+t/f1h4LH60kuN/xAS6nYOb3Q7ROIPJ3VaNYJ2VGDJt
 C77H3weKmzfF8dz4BySSTz9msFupgSiaz5pJBIOZVjrJeaWEB5WmUYKq8
 H1OJbr4NrvOnk0fFe2KfvCo2iQwN4269jSWhQ3cWUeVdgexBCdSaqsJED
 a9sBhWQU+xD15RuResHHyxaR9XidyJdImwe01Y/TSMj5GzvDF9rWiiITz
 OJPifeojdDG8PwOGtcH8aUpxVbZpjlWan7/89UjdC9UhUXESjHScFEXp3
 lTm0Av4MfMqK6OwDlHKWrMXeNIsIY7Ix6R3K0l290UzpFz63y4EzQEOO8 g==;
X-CSE-ConnectionGUID: XR1Jw5WFQYarPPsDYAHYxQ==
X-CSE-MsgGUID: +zfl1kNHRxucEmXeoR8Y+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70690596"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70690596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 13:41:35 -0800
X-CSE-ConnectionGUID: +rIsT0LETt+5gaLWFjf3dA==
X-CSE-MsgGUID: AbT9AmC5TPKzFPTxhgg54w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="212767469"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 13:41:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 13:41:34 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 13:41:34 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 13:41:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sptUqbxER4ELfGCs11zZlmtT49MBXKcO70tBojgmdB4jDEjF0lfC8KQU45rRQDdf7RYisjNsUvl5cCZHpsNeIwvbb+NWN3zJ1q2QA+a18LKm0jhZ6c52ksyarBwI7gHJC1LqLv1WiB1vhwqoP72O2uMu5V1wYAI/19RmhwAmlacaj9iDXZjNSLK6ovANtN0lgrJFKIsqjcT1ncMDlQ8M/rX4dxwR4m+zoP+kgcYX4w1qz0/Eb3+eRt0oZ/PePWhbEHkbSQBbzaYkIH2mTbGslTzh6AFCZbPHSYaq7m8v9cCwh/+QKk9X7Dfb2Q39b23Gzh17oP35bMRGi5UivBVGNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEriVkETd93qaQgaK+yw7Ey1GLbHkcxuWqyMXPQJDGs=;
 b=P5q6DWVOw2G2Bt/G4UhnpAbNrUK4QZn5wi2/GxbEN1l9qRvGshRlGSQzcGrcYd4tl+s22sQ+GXMf5NFpCGt1NCA57EKjlrxeIQc8Arpchf+gBFprbTjieZuMqfSoXsOKrB6radXg/Mi7sD3L2YV4GN31UlEURvpDsiSWfDJVbz+AHLKo2aYCcuN3lMQRcge186vyIH4zA6Rhv06CmzYGvfj1Sx2b0Fo3O9gSLcW9DshyDikvxlC9L6r6CdA46nmAWrLjDR0xwpTMr+hqVXYYJUD9Do4Nmpk1e9984N9d53Pcc+BRTpW2yet9kqfsu/eexlb/gWHqUwAIVV+9hUnF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB5065.namprd11.prod.outlook.com (2603:10b6:806:115::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 21:41:32 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 21:41:32 +0000
Message-ID: <8bf19afa-44ab-458b-9cb7-178cfb8d0373@intel.com>
Date: Thu, 29 Jan 2026 22:41:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Mutual exclusivity between CCS-mode and PF
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-6-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260129172246.1106097-6-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: 7959c74b-4aa8-425b-f566-08de5f7f2aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THNxZW02aS9GU3FYYlVTRytkN1I1WlNPU2NyQmJ4OC8xVjIyODVZeko3ZjV1?=
 =?utf-8?B?QzF0R3ZOeG5MdkZpd0Y0U0RsRndoMS96U0VCMVhqcVp4Z05CUFBPdGJhVWZF?=
 =?utf-8?B?ODQyUUdublFkK0R4SkFlcTc4MzBnUjZsRk42dUNDSStVcThTN1hDRzdxeEc5?=
 =?utf-8?B?UEY3Ujg2anVDZEE0ZGZjeW5BbXhMMXZvZm9xNmRTUjZhN1kzcEZwZkRCSUlt?=
 =?utf-8?B?bWVjZjZ4SWw1SGxDa0JRRmJoZ0U4WXRLa2ZxZXpnenhWbnU1SmpVSFQxZ0dI?=
 =?utf-8?B?K205TjF6ZlU2Q3ZMUkxrZ0cvcW5pQjF4TWpoRVk4M2paWkFwbWYxampFZGZT?=
 =?utf-8?B?SnJUVjJ2RE1HU29PaE03b1RLdFhkWGF2NVg0QWxyQTgzTS8ya2FHZVVadGxr?=
 =?utf-8?B?Qk03NVM0MVRQT1dkZ1VvdGUwaFhrb1V2d0t4VWJtZ1ErdFhxSjNGQkJjWEdt?=
 =?utf-8?B?cUJraEFQWHJWbzVmRHBaVndFQ3ZKTVJ3T2gydklQU1Nkd2hRYUh0bkU3aTJj?=
 =?utf-8?B?R0NZNVV1eDR4Q0d1NlZSQjZoOTFVRU1aNnNpcllRMjFmVWFxYk01ejBKL2Qx?=
 =?utf-8?B?V01aSDArMFJzRTk3RE1ZSkZzVzdXYU4vQWs4MkdTTm5IaTBiSzJLNFpTVXZj?=
 =?utf-8?B?UElqSTFhVmFXUDd1WTY1YmtjVjlLb3dZSHp5UEs5d1RyYXlQVEFKTk0vY1M5?=
 =?utf-8?B?UE5oQ2RsaWFBVlpnVEtoQVNpUUgxUzlrNFF0cUdDWUcyOG5wZy9iZ1BxbU5k?=
 =?utf-8?B?SWZid1BKMGx0QThGSTFjR2YyUFhGVUdUVWZ3amNtNnB6YnRkU0Z0enJubiti?=
 =?utf-8?B?U2lYV2Y5Y05reHlqNWtrN3BTTmxGREgwY2U5ekJJeDB5TUh1N1o2Z1NHWENk?=
 =?utf-8?B?YThlOEVSaXdyYlRsQzdJMENEMlVFVXFYSW9tZUsyUFV5UjhrRjNZL1B6UElz?=
 =?utf-8?B?d2JaOXlNcFp0Z08yYmtQblFQbzduZEM5bkFLd0JJcTl2cTJqcGpLamdadVR1?=
 =?utf-8?B?dmQ5OFl0MkF2QTdUbjZDLzZPbTNrdyt6NC9EM1NSdXByVXlYUmd3bmtvY01M?=
 =?utf-8?B?SUFWYXZZalhEUUZOaDlqUHJwQkR4eU1Gc2dZRGRNVE9hYmNKOTlNWnJlTmFM?=
 =?utf-8?B?c3BRL25SR3EyMzEzcnpRT1YxWGlJRUQ5SUZIK2IrZjVRZXNhaG9FcnIwd0sr?=
 =?utf-8?B?TVY2THA5MFlYdWZWYkZseTZEdUV5bkJYVEpBL1RuREwxMEg1K1RIanQzc1pn?=
 =?utf-8?B?ZGpFUVVqelFYYWpUam0rMEpDMmVLYyt1UEFJUjBRK3QrRGtiVXJsU3NOcTBv?=
 =?utf-8?B?dzRLOXVRWE9VVjQxa2NUSTRrdmkrRTE5OFQrT3psTGpiVHgySHg0d0VpRGFw?=
 =?utf-8?B?SjZvNGp3WUZXN0JLUDlsM3BaUHZtcXV5UVFwTDFGeS9UQ3NtVEYyTzAzb0t5?=
 =?utf-8?B?RVNGTVI1RlEwMjBwVmZqeFh6U2hkKzI2WkZ4NHNRclloYTBSc0piSWRncW5E?=
 =?utf-8?B?eW5CWWlRa2lYWmFXWWVVOTNLbEpwdUZXMTRBVlpZVDZPNU0vb3VmMTBXeFZD?=
 =?utf-8?B?WkVGQlEydkxTck1Od3ZvR2w4REthM1NDd3h0c2Fqd3dzb2VZQ1QyMXJJcDMy?=
 =?utf-8?B?b0xrZVBOVTBxN00wV25ZRjU0S1FOZjVUVUREUGNrZmdscXBzZjdaNXd4dk5H?=
 =?utf-8?B?d1BnY0xndm1OZUxsd2NibWJJREN1ZGxHSGhIMmVvT2g1ZU9nMmtEaHNBZ3Vj?=
 =?utf-8?B?d2NoMUxGTE94d0RmUFpqWmdZNlV6OGx6Y0pkaTlJMWQvUFNIRklNZEhCZWlQ?=
 =?utf-8?B?ZUdhR1BOeTR6dWNnbW1ka2FNTkZ3SmNPclJIbjVhU2xLYXYwYytWK3RhODR5?=
 =?utf-8?B?NHZCaUJVMnVUMVlSOXVaOXNnTTJkNGFtVld2Nm5rS0Q4NXBLaVBuYjg2UStE?=
 =?utf-8?B?eU12TXBnMWdjQktCYTVURHRFRmxlMHFEaHZ5NGF5SVBLbGY1endJUlVOZ3RH?=
 =?utf-8?B?Q2lESVNGcnNnRlpvcXkwenJNMzVWK2RHdmVGYUJhYjcxK216aU1UL2dqem1j?=
 =?utf-8?B?a0tyVzlOWjJjWHBJWkQyTFU2Nk55eGgwenBNY2w1b0FVWDhUUUMvb04yelFR?=
 =?utf-8?Q?66xk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkhOUTFSME4yOUc2ZHJVa0F3SlVtTStwZGJTL2lkcjFIejNIbFdnNjFTR3J3?=
 =?utf-8?B?cC92ek9hMGhWNkxCRnVhNUV6dkU3R2VyaXZjOExaMGFqUThVekFJNkZHZGRz?=
 =?utf-8?B?NithNUQyT3JCamM4SnlGYkgzZVRjUlVvbHVXME5oQVJrbkpEVllzSXJMRitz?=
 =?utf-8?B?eFVvWnBUK0hXaU9UL2YyZWZUb0V0QjBFdGZiRWpZU29uLytZcXNOOHJQREo0?=
 =?utf-8?B?ZEJ5Q2ZTak1yQUkwRUtyY2ViWHltMmFpaGJudWNabXcxKzd3c3NkZ0pLbDJr?=
 =?utf-8?B?dWFpWHlMUkUrNXJwSVVBZHNQWDNCaDYvRU5VT1JIMzRjM0VJMWlidFNVM3J4?=
 =?utf-8?B?ZEtQU2VNSzc4UjF2R2lmMWsxZ3EvVU5TT0d1ekwweG1zeTdoelJBVW9GNUhE?=
 =?utf-8?B?UFQ1MGx0UnVvY2hzZFlXRzhFTy9mS3p1OGoyeWtzNFduRGdndjNhMFY5Uksw?=
 =?utf-8?B?UytvTUh2ZkE0ZjFxSUI2OHZZbUhKcFlTL1QyenpVTXdQZEVtZ2hJNkN5M2Rm?=
 =?utf-8?B?aW9hVVFNRU1TejZIenhRbGRyVHgzMEQ0cm14Q2RMcGR0YXBrSTRlbnVZZzFU?=
 =?utf-8?B?UlQvdy9SMlFNMFZMMG56Yi9EcHZkeDlSVlZSZEJBRER5SHVIdWp0N2ZNRGd6?=
 =?utf-8?B?UDBkVk14U2ZhdnVUbktleHdqR0JJMFE5eWNmQ2NKa0R6MjlGejBMMklOUkdh?=
 =?utf-8?B?K2N1WWhZc01vQjA1NnJieFZXdGNjdjFrcmNRZVJ1TC9lNkh4OFBranZ4c0NS?=
 =?utf-8?B?aTlqNG9sNXRrajJGQm4vNHR4WDJjMUx2MmdIWkVIY3Y2MU0yRTcwc0VWRG1i?=
 =?utf-8?B?L3M3NUVJbUtoeGpNbTBsVmhNZFFkU1lzUWZVOVVVVjVieEg0SVQ5cHZ3eXpp?=
 =?utf-8?B?WHU2ZjNySlRQcjRXbFN5TkRVa21HYTdCTHJFUkMySnpleVNCdGh6YnBLVTIy?=
 =?utf-8?B?eW1MTTVtV2N5RWFrczF3d29kL3lkQzVSSk9wNHpMYzFMZEtBcDZrc1M4c2d1?=
 =?utf-8?B?SVBGQ0xVZUJsOVBoZkg5OXExVXBYQW5ZZE1nNFhpQ0M4Q0RKYjJHdHZQQ3pO?=
 =?utf-8?B?Wk5GS3N1Sm5Sanp0clNMNkFmSjRodmxJTWVsM0E2eDRjczZiRklpVERHSGlr?=
 =?utf-8?B?NTNsRDgrb2JmWWhzZVhRYnFCOHp5UytFL2ZPUVhkMDBsVGhpRmdoampxUUxi?=
 =?utf-8?B?QS9haHozMStvNXlVQXIwcWh2UlJqU29tVkxma3E1SEs2K2JURGR5cTUybUFP?=
 =?utf-8?B?MExLd1hHbTllK0FCSkR0b2dQdkg0eDQyaEs4K2FPMlV3V3lMUWZ6bW9tTjkz?=
 =?utf-8?B?NHdONGVROUozMW1EMUR4amJrVVhrS2VVL1gybHUrK2hTTHJrTzJMNXNHUnhl?=
 =?utf-8?B?V3dmRW5aOEFLcHBpTG00MkhJUlFmUlgyQWw0NWxBSDNMUkRsUHd2bldRZzll?=
 =?utf-8?B?bGRLQzRIWlQ3YVBYdGRKQjYzZy91S3hFYjdYTkd6bkw1TW43ZWtXZGMvUGdK?=
 =?utf-8?B?YWJPMlVMMWRHYlNuY0x1K3pqc0xFTDA3RzdrV3l5ODJsRDRwWGVFcW5wcmN4?=
 =?utf-8?B?dnVBaHgrQ3lwQWNsQnEwNUZwN21wSU5VWEp4a0ZDaklLMFJpZ090RkVNSmFt?=
 =?utf-8?B?YjZwcHhrRmY3QU1jQmxhN0xPdWxSZUhUNUFDRDU4bjhIWE4vN3h4Rjltd05B?=
 =?utf-8?B?dCtWRnQxbHF3dVFrR3dRditEZFZ3dlJ2dGdqWjFmbHRmV1YxNDJHNlUyeGxy?=
 =?utf-8?B?TS9UZlBjZlhzcjB3TnRNc0tJVFptSTVBU1JhSXU4UGE4RjNINWVjNUhoZ0E2?=
 =?utf-8?B?ZHkxUW9zVitPeXFRYmd2WDR1dE1XUUxoQUI2ZWo4UXNoMzNFU3BRcUdETmNk?=
 =?utf-8?B?eTVTWlh5U2pLekxadm54dktCUDRSdmJVRVZJV2xyMkMwS3dYVlJiZ3UxOURl?=
 =?utf-8?B?eTlrcVNVSmhBaUU2Yit3a3JDbC9qYU9MWjlEUUZFQlYwWmY4ZUgvbXdCZnpu?=
 =?utf-8?B?dllDVXJ1dUl6MkszRS9DekxkQlYrVngwYTlxQ1JlcHFKNUlOS3lVTFhteVVT?=
 =?utf-8?B?ZGZwdmN4RnYzMlljRm8rRHNOeThWOVFaMWxEbnZXMXlJVFppWXZxL2J1Vk9T?=
 =?utf-8?B?eUtWbVdUNVVvTEo1bTByeGJzb2dCakhEd0JzQlZ2TytrNWFKUkFGOUdHVHFB?=
 =?utf-8?B?Q2VYeHdtRnBmaHpHR2RNdzFCSE5UdnRVaHF1cjBxQjZJNEdLN1BVMWphVXlG?=
 =?utf-8?B?WFV5eUFSdGhjc2xpeENGaldNcGJucTVoQWFLT1BNZG9adkNYajN1eC8wajFo?=
 =?utf-8?B?T3RNWUptTVBDZlRyMVkrU2ZxeGlGQXVkalRBMlAzNWxPei9lRGdaSk4rZkg2?=
 =?utf-8?Q?dkvFfcR9RtTZb/YA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7959c74b-4aa8-425b-f566-08de5f7f2aed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 21:41:31.9805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUat7cM/QqcrayWXrgSrZmV878ziuV/034KiwbXT+xrybZ/xgO7t/rvgPMym/zsXCdS2mDgpQv9aGHZbw6q5VNXwIjG9E3D0kdbP48wP5p0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5065
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



On 1/29/2026 6:22 PM, Nareshkumar Gollakoti wrote:
> Due to SLA agreement between PF and VFs,the alternate CCS-mode
                                          ^
nit: missing space

> cannot be changed when VFs are already enabled.
> Similarly, enabling VFs is not permitted when the alternate
> CCS-mode is active.

maybe it's worth to mention:

"Currently we block CCS mode changes if driver is running as PF,
 even if there are no VFs enabled yet."

above says "why" but what about "how" ? maybe:

"Use lockdown mechanism provided by the PF to relax that limitation
 and still enforce above VFs related requirements."

> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 37 ++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++++++
>  2 files changed, 35 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index e146e00b0ca2..52285a550f34 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf.h"
>  
>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  {
> @@ -117,12 +118,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	u32 num_engines, num_slices;
>  	int ret;
>  
> -	if (IS_SRIOV(xe)) {
> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EOPNOTSUPP;
> -	}
> -
>  	ret = kstrtou32(buff, 0, &num_engines);
>  	if (ret)
>  		return ret;
> @@ -139,21 +134,35 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	}
>  
>  	/* CCS mode can only be updated when there are no drm clients */
> -	mutex_lock(&xe->drm.filelist_mutex);
> +	guard(mutex)(&xe->drm.filelist_mutex);
>  	if (!list_empty(&xe->drm.filelist)) {
> -		mutex_unlock(&xe->drm.filelist_mutex);
>  		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
>  		return -EBUSY;
>  	}
>  
> -	if (gt->ccs_mode != num_engines) {
> -		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
> -		gt->ccs_mode = num_engines;
> -		xe_gt_record_user_engines(gt);
> -		xe_gt_reset(gt);
> +	if (gt->ccs_mode == num_engines)
> +		return count;
> +
> +	/*
> +	 * Changing default CCS mode is only allowed when there
> +	 * are no VFs. Try to lockdown PF to find out.
> +	 */
> +	if (xe_gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe)) {
> +		ret = xe_sriov_pf_lockdown(xe);
> +		if (ret) {
> +			xe_gt_dbg(gt, "Can't change CCS Mode: VFs are enabled\n");
> +			return ret;
> +		}
>  	}
>  
> -	mutex_unlock(&xe->drm.filelist_mutex);
> +	xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
> +	gt->ccs_mode = num_engines;
> +	xe_gt_record_user_engines(gt);
> +	xe_gt_reset(gt);
> +
> +	/* We may end PF lockdown once CCS mode is default again */
> +	if (xe_gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe))
> +		xe_sriov_pf_end_lockdown(xe);
>  
>  	return count;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> index f8779852cf0d..53a595b0882c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> @@ -20,5 +20,17 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>  	return hweight32(CCS_MASK(gt)) > 1;
>  }
>  
> +/**
> + * xe_gt_ccs_mode_default() - Check if CCS mode is default (single CCS mode)
> + * @gt: GT structure
> + *
> + * Return: %true if actual CCS mode is single mode, or
> + *         %false otherwise (CCS in alternate/multi mode)
> + */
> +static inline bool xe_gt_ccs_mode_default(struct xe_gt *gt)
> +{
> +	return gt->ccs_mode == 1;
> +}

nit: do we need this as public helper ?

maybe it should be defined as simple static function in .c ?

> +
>  #endif
>  

but the code change LGTM, so with commit msg improved,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

