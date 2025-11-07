Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F40CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 21:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B36510EB7E;
	Fri,  7 Nov 2025 21:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaEyZJCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E75B10EB7E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 21:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762550344; x=1794086344;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=vuqsuVv1oSCKzYQVnAA7qBrCFFoeulQ9K/5ZbG/JQ2U=;
 b=kaEyZJCcnojZTJ6auShPpUAXIUI2f3rN7lzrg6kESxroQYPCU6vj2PZT
 9k8Ri9q0LrMcBhAgY/1C4kAOgMxXQPkP9a/IfFFQmBb94SX9sN0+nCkJL
 ZB2BKmVyYGiC5gDmsIWWq43Df/wX3vx2IZY32iBvjjafZMkWch2I35KYU
 5bmSQdKtvBY5xoY646fSt5lkIbQw/9PKV39DR/fd+xKtB6IHmRHRQ69w6
 0moDXzCz5P2wadoR27/105L0HJXjjMhd6SeR+AxUc9tt5SlMXJZEeXiS9
 N1kb4EQ0NAEWJU3fydrYxHQKkiArF607p9ix+tquSjVgj0mV9L29Ed0Wp Q==;
X-CSE-ConnectionGUID: iWl4r96TR/a5vvKHmpMZPA==
X-CSE-MsgGUID: GJRMbT3mQpa8lqiQkl0zHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="76154107"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="76154107"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 13:19:04 -0800
X-CSE-ConnectionGUID: 0db/6tvqSyaFfUs1oEE3QA==
X-CSE-MsgGUID: z0rDf4dKRA6eYT8rbulMlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="188852673"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 13:19:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 13:19:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 13:19:02 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.28)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 13:19:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOmPejbXGwoMJx617/1YiF/OHtrf0Myho5FAPjajsg7r2E9sjZL4ZbRu2+tFe/k3PsPA/i1fPPy0Lv1mG7xShZDcB7oeEGh/5AxOm9bVVeCBZ6IxDMuCRWiP4gnRYQI4JE9E/V8B7+pKkIy1YnidM+QYFeNHmbVnQ98cWLOKOjdva7xErA5CbfzBTwaOPWIH5NOBs3Yp5jSQ1SEpGzffDqbS1khP+H5nfze8eh8tYVl/HCM7Nkst9mTTMDj/Hv1twMoLKFUKO6I8XD4Q4qN5fDxVMRXO+Kqn7OQuM4eVS76OITZD1fq7+XG7LnHG1uviKrPP2SarGLthCs+LsPXkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRmglQJRMUY/MrqDBUaWZVHWnq2v+grDup5e9ADFmxA=;
 b=hKdBKD6Op5fJauMbDiqsxtiMvkHNe+yuP1nkp8YOGO7VupQWu4Mp7If1jqhYjdLyi0bef4CBb4D59OeqoS6KpV9yLhgwhAjrzTSdLpxG6O/lrKX4DWoKX3K2KZeIhSgtfQn/GZ1YcdtuI/6O3/Pwedvgu4hRVWGV3DDTdhIR9N3p7rC9S2hKAYSIbdcePUv5PkjNdlZdgSQwG6cVAnkVwZcqNkd1pIlL0f6FFNPYD2/owbJztie7XAfq3M7FFIkSUPEeW7wa5SvN3ngRY4O5NA9DCowz1Vz6LUST8ebM5TxNt7WrJXdhlOULS4dOHYX1vz5qyAp+v/yLs8az2k+bdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7439.namprd11.prod.outlook.com (2603:10b6:806:343::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 21:18:59 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 21:18:59 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2] drm/xe/pf: Add runtime registers for GFX ver >= 35
Date: Fri, 7 Nov 2025 22:18:45 +0100
Message-ID: <20251107211845.3633633-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::6) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b23dcea-d577-4b64-7292-08de1e434454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWF2YjJmLytESnl2MVFQUzArVHdFZFhoSHNKTWdJb2lEQ1Y3QjdJemlkNlpY?=
 =?utf-8?B?VHI0ZmUxOTcrckh4UzlBa0V1Y1ZFSWNGclc1dktUQ1ovQ2FkVllRaHJoNFNj?=
 =?utf-8?B?ZmZ5ckFFRGdIM21nT2R2L3BHUXdsMVlpK0J0aGdpMSswSnc5S1dUMHZ5Ym9C?=
 =?utf-8?B?alFuL2RGSmZhblI4eGFQUFZRTWw1ZlpadTR5ZE5pRjYyMWpYVFVHQW4zZVpI?=
 =?utf-8?B?NTdUNFg3emk2cXJmdzZZdTFkcGdYdVkva291T2I4YVNoeXZESnhaUFVCbFha?=
 =?utf-8?B?K0htVnF2RXQwbXpkNC9aUFdBck1YQnIzLzFSRXZwdmFCanZlU0xLTkhyYjRO?=
 =?utf-8?B?M1A5WjRpZjhLYlV2Y1BIbkFqTXZmbWw4NjU2eDY5U1l2WmdYaFBGNWppTFFx?=
 =?utf-8?B?dXFkemJTdVQ3ZkZRNjlKTGJWOEdOL0RTcU42dzVFN2V6NUpJRDJwNm1hNDVy?=
 =?utf-8?B?L2ZXQXgzUkFvT2t0VXFwaitDdGR5eUxkc0w3NE04RHAwb0c5S2I1UFJOMThN?=
 =?utf-8?B?cnFST0JuTGpYdk9SanBEYjUvdWc0THBrQjdyNFRiTms3OFY4RDdlTjJtNStv?=
 =?utf-8?B?N2tyRUczNUZsNkR1WmxSTm8xR0phOS9sdmFLUklNcDQ0NVU4ei9XVEdhUjBE?=
 =?utf-8?B?ZVdzRUdqQzhWRWtXUklZNnAxZ1NXenI3UzZkcFBPUnZGZ1FZQUpROHZuMHcw?=
 =?utf-8?B?WlBXeWRtL2krUU9rTEg3QVB3SXViY0xPUVFDcnRBYnRHYkllR0JRNDcvSnJI?=
 =?utf-8?B?UGE4K1FrMER6UTJhK2x0NncyMS9TL0pQaTROb0hrTGFvNzFFa0R0TWU4bncr?=
 =?utf-8?B?dzhjaE43WXZhUDBrcXBERFU3QktHRXIrNmc4NE1Kd29NMlY2NEZScjF5SnFX?=
 =?utf-8?B?L0NmNEV0MDNrTDF5RkVoajlHaXp1djdMNXd3ajMyUVBQcTlMQmZWajdhbStr?=
 =?utf-8?B?aTg0Q0ZTZmpCQjBaY2dQcUR1Q1dNQ1RCNlVtR3pJaTQ1TFlIbHRpMWJYbEZK?=
 =?utf-8?B?ZUZqVmJxYmlNdjBoZkw3RGg1RFZRMHFiUlg0bm51WWs3bFhkekhmNFFrNzJw?=
 =?utf-8?B?Szl6bU9jcWlYYWJhTUI4WnJySTFEVWpFUDFhb0puNnNUaEREaDJrZnozdllw?=
 =?utf-8?B?WnEzQTNTcFFyWTI5OTdrNkpaT2o0UHl2QnhmRWM1bzJBUisxS09sMGZhSmxj?=
 =?utf-8?B?TUxueFNaRXJDbW9XSXcrMUJJRUx2Z2hHQU9SRmlrVnh5bEloNVRJbHhwTTgw?=
 =?utf-8?B?cFQwUVdURldpYWJpcGdwbytWeFJBc0xORTFDazZ4d3pZK0U2R3JoUURybTFq?=
 =?utf-8?B?Mk1KYTMzanc4c0lWRlRpYUJqM2tQeXBPSExDWmFJUm0zTXN0aENSM3psS2VD?=
 =?utf-8?B?UktmTXRubDVBcHRkanZCa3QrV3J2R3lFZlJjMUJVWHhiR3ZIM0pBaFJwNm1a?=
 =?utf-8?B?dzE5NEp1RFJ0YXA5QUIxWXZkWGVRTHVBcGU0TDFQRnNlOG03WVMzdC9Id0J4?=
 =?utf-8?B?a1ZTYTIvM2FtdjdkLy81S0lqSUpEUTNtUkJQM1VwSmw2WUtzUS93UXVGaHBW?=
 =?utf-8?B?bW81SnBYYlNvMnFhK1R3Wk41TUxtenMyVG5pUWJwczB1OFJzWFlJblJyaWNZ?=
 =?utf-8?B?VGUxY1RvakY4TDhVdUxSelZHZ0xzaVRCc0UvNWdmWTBFd1BybVJWMXU4bmdv?=
 =?utf-8?B?K0MyV3AvY2R6VEQ1UkdpakI5Qys5dklGT0JvU3orMjBTV0lNcis3ZmRzRVJL?=
 =?utf-8?B?TjJtQkdzOVBHbitRUGZhZzdXa0o5QjJyNGxiN2k2NWR5aVIya1JSczllQ1lC?=
 =?utf-8?B?UU5od3JmM25sVjY5WlQ0N0ZpSkV0QlVsMkxXTzV6ZlFBVkdkalQwOE9STnNO?=
 =?utf-8?B?R2N0aXpobEdBWHNLdFhHaHZoUm1ZUWU1cFAxYVZ5dkpGd2phbmVMS2k5blBM?=
 =?utf-8?Q?Yzuv6WczpuL2zoDp0gf2kvJXtqQkn5oV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVRFaVJXSzJFVi9ycnA5Szl3TTVUZDhCTlhzZERHRjJmYThyMDZkcEh3dTFP?=
 =?utf-8?B?NHZQYnQwakc4aytPT2VORTEyMFROTEFJQWh0SVM5VWFpeFRhVEpoaTZPYXZl?=
 =?utf-8?B?cC84SjUvYk5kNUUvMzhpbmZuQUhwSm9EYUFqUERvcDJTL1NxWkJWa1M0aGFW?=
 =?utf-8?B?aEF0U1prSU84UXppZEFnZTFLVjZVNm52Zldod0tmSVlFZTkzQTYxNjlWRFlS?=
 =?utf-8?B?K3hRNWlNdUpPQkNUZEJhaUo3ZzRjWVFqMnQ2Unh2ZkxSRW1BTFZOMEViazJy?=
 =?utf-8?B?NTBqN1lGSVphMkNxUlcwK211T0d6S01zQ0VFMjJtcDVxL3RnS3dHMTBsNE1w?=
 =?utf-8?B?d0pwbXJRc24zYStRVk44TTJpT3lESXVmdU5WZHZnQVNrOGFMVEpDWHcyTmtH?=
 =?utf-8?B?VnJsUGZYRmtwYVpWT29rZzRTNHo2aXBNVXNSZkdaVGhYNTRLYkZscGpRMGNt?=
 =?utf-8?B?UnBWWGRqdWNoc2JPeVhhK0QvR1ZwRmhRTE05Ry9kM1NjRzhXVVN5eVdTWVBQ?=
 =?utf-8?B?bWt6VC9ybE5ESGM5dHdOZGZYSm5GQzFuVW5GazlOWGZpYnd3R0RRa0tVOU5x?=
 =?utf-8?B?eHBRbFVvR3BWdWZNc0NQckw5TzVZcnRNbDYwME9VUnZ4R085Z3VDb1FRZmFB?=
 =?utf-8?B?bXNoYnVmbzI5bTRiSXJ3cjZMaHBXSVFseklOQWNReEhwZTJkYllqTWthS3pB?=
 =?utf-8?B?bjByV0tWam5abHJRSm5vQlZXZ1hoWmI5My9acWZFcGsvNC9nK0MvWkY3c292?=
 =?utf-8?B?MjhhRlRZaUFQaW42WnIyaWRLWGlhNFc4d01yakJJU3RLM3hHSGlwbm5VNmd1?=
 =?utf-8?B?MTlrYUdRYXhIbk0zWGFJMUVFQVJMVllhbUgwVUdQMlladTFkdUwvSGlWOWhD?=
 =?utf-8?B?R2YzZmpVdU9xdjJmL1FMVU1Ta3pxaXZGcUhqY0JRbUJvL1dmY3R5Zy85azV6?=
 =?utf-8?B?eDZGbHk2TGZQZDRHM3BJMy9tWEdJSUhSQnZOYmt5K0ZXUGJDYzExRGFhRlBZ?=
 =?utf-8?B?STRIWWVBQmc1Vm54TjhsUG5DMnBCQUJnQ3k1NElaQXJYOHBZeUdEM2tJdEhS?=
 =?utf-8?B?UjYzUjBwQ2drSHRXZTk1bkJodUEvVEhFbC90bFpqVVAxRzAwSUNBUklzaC9p?=
 =?utf-8?B?Vmt6UzNLTjZUQUFHUll2NjEreFRiUVRBaXllcU8wT1lFR1RpSnd0SjU1Vkcz?=
 =?utf-8?B?UE56NmpHQ28zQURneGJneVlyc1QxZUNIU1RwY2k5K2R3SnJ5YzNpeUJYMUYy?=
 =?utf-8?B?bXdZUW9qSmp4L3dDeTdKa2NObWtHY0w3TW9tMlFRaDZjL09TM1JKRERvVHVP?=
 =?utf-8?B?THh4cmtGcjJkcEFUNHJiZ0lneGhSWktXR0Z5YzJNakttVi9YTW90SWVqYkVv?=
 =?utf-8?B?R212TzA0bGpNQUpuZEVFbzlxMjVQVG1XWmpxbHNjbzBLYjY1WjE2NTE0WHgx?=
 =?utf-8?B?eVh6QmpNbUQrdEREY0lzdS9sR0YxYjVTTVRPSlpCemRPSDFEWHhLZWNxYmJz?=
 =?utf-8?B?dVUwMEJVam5oSW56dHM4Y3ArakNVRUtwODNrRDVITnNTNjh3aE5uTVQyb1pG?=
 =?utf-8?B?VEJXMDgwSEtBeS9qUGtuMEZBR1hrNnNkdk9Cdit5aEVhc1ZqU2ZLWHBteTE4?=
 =?utf-8?B?WlpkZjhzRTdoTjR1RkpXWXNzbENrUWltRFZ3aytScG9DSktuZXROaEM5eTNs?=
 =?utf-8?B?bEUvRktWcGtFaVcxVmdTQkhvc1JHd0NOR2JHWXV1Z2p6cjdOTmZyVXRXTlVF?=
 =?utf-8?B?QnNGNlk3ZzdQZHRpZ0hsVGJSWDdLODBxajVUREVFUlNOd1JlM2dxZGFtcmkv?=
 =?utf-8?B?ak8rZDYycmF1UTJQMzRxVlFsQ05WOVUvUGhCSGlDRWo0YjJjYWtrbmJ4VjBw?=
 =?utf-8?B?QUJ1Y3JhT3Y3dFBobzZCbUhOMmRtM0FLTUpaU05McENsMEtnNWMveEJXRWhO?=
 =?utf-8?B?dUQ5WFhGVE5la3VWTWtiVGQvWi9lZzNwT3YvMU1rNUZIQUxnUXZnVWpWWDFI?=
 =?utf-8?B?NTRuMDM2MEFjRWo2VVZCLzZaREpIQXE1ZzljYmUzRTlhS0k5NFZUL3VUY1M0?=
 =?utf-8?B?aXhyamdhN3RWQzl0b0FTaTJlclF5OFJ0L3MzWFJ0b05NUytwSVgvSWxmTmhn?=
 =?utf-8?B?aHVHQmkxcmRjWDM1VHZjS0tmTU5UNnZ4cXdCa0ZsTkZOKzdldjkyZW9UVTcx?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b23dcea-d577-4b64-7292-08de1e434454
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:18:59.2248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zglQ98ah1LUdLKcw4+AfNhIoCgm4GR4LiDQhvw4PfiouBmP074z3pmp/5WOlpK4/cTNt0nlRw7D1Ca+w1F5pp6uqms/JV2SnC63IZrTnHPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7439
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add a dedicated runtime register list for GFX ver >= 35.
Compared to the list for GFX >= 30, this variant drops
HUC_KERNEL_LOAD_INFO, MIRROR_FUSE1 and adds SERVICE_COPY_ENABLE.

v2:
 - drop MIRROR_FUSE1 register
 - update commit message

Fixes: 5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 76dd9233ef9f..2eb21610e5a0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -99,11 +99,30 @@ static const struct xe_reg ver_3000_runtime_regs[] = {
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
 };
 
+static const struct xe_reg ver_35_runtime_regs[] = {
+	RPM_CONFIG0,			/* _MMIO(0x0d00) */
+	XEHP_FUSE4,			/* _MMIO(0x9114) */
+	MIRROR_FUSE3,			/* _MMIO(0x9118) */
+	MIRROR_L3BANK_ENABLE,		/* _MMIO(0x9130) */
+	XELP_EU_ENABLE,			/* _MMIO(0x9134) */
+	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
+	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
+	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
+	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
+	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
+	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
+	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
+	SERVICE_COPY_ENABLE,		/* _MMIO(0x9170) */
+};
+
 static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
 {
 	const struct xe_reg *regs;
 
-	if (GRAPHICS_VERx100(xe) >= 3000) {
+	if (GRAPHICS_VER(xe) >= 35) {
+		*count = ARRAY_SIZE(ver_35_runtime_regs);
+		regs = ver_35_runtime_regs;
+	} else if (GRAPHICS_VERx100(xe) >= 3000) {
 		*count = ARRAY_SIZE(ver_3000_runtime_regs);
 		regs = ver_3000_runtime_regs;
 	} else if (GRAPHICS_VERx100(xe) >= 2000) {
-- 
2.34.1

