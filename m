Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75924C8303D
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 13:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFCA10EA3B;
	Fri,  4 Jul 2025 13:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDgsrwJe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF0510E05C
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751634990; x=1783170990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rX1JnPd1F2tfSJHu+a+RbqpKKAZfWfAWXtuymayMMvI=;
 b=IDgsrwJeo7xCmJ/BstgfJELXmRKhNSt9wpqKfdmlANifd4eduvz153nO
 qKbNMh0YbWvD9tdnWvxaRy+osMaT1IMKx2BhKFjXWz6s0oC2fKTJDNW/n
 xSnz9XGV+LGaVMkYNsp+Wc9/6Yh1onHPyiz58hmELZpd1eQktTwtinWwt
 Xup6HE+ns/RflguTlRBkRmww2atcUrXtegeuGN18VfuAz+zs1RhKKB0BX
 +ynDIHGONQNVgJ/F6v1DQnyLLKqT/HeVQuVG4YDRgh5Apql5BDhxQuK/a
 ZN/lGf7ezSFz/90lUrzYivbNSWZ0RuWk9RwCSnCdZbpTG4PTRfDWrrAcf Q==;
X-CSE-ConnectionGUID: 5rj+uh7ARYOWOR8PRW2OPw==
X-CSE-MsgGUID: EQ+TtDXdQu+FNNmFb+R1Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="54111466"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="54111466"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 06:16:29 -0700
X-CSE-ConnectionGUID: B2NcOLCeQ/Wq1zhJ1Q80bA==
X-CSE-MsgGUID: W3ZTdokLQP257YUXOw2SZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="158671678"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 06:16:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 06:16:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 06:16:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 06:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t91oE5kyd8mWlAOINoWbTtGkgT2gsPajsLqFTAcv0DRUkf+WCDtJ62foycd50rReNTBwbi/Y2JGmliv7rmFW6BKZaeovfze8qpmFO1ywPSW9KSDmRnpYNn4YoZJQkA3wOZUyqnjL4q86/ejXdVxnEJOPISOqK9CMmomAeSdHhNfT1S0iiV4nzK+JRgrJFUm/i8M+Oz7fVYS0Ivo0h2PDIUhghhFKIlKaPfk27Gn+YrEF8S2qYCap6oqA/nlwm6ngGPuX7ZZ5KKJp//iyH+O7MKyUxSl3ghVqVsVwOS0Hh42EtfVP4KsXUEOmk+3Vb3I2NPdHYwIOLDQX49mHOPxlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJEBoJ2vLmG3ZKEILpsQalx1PzNtJ1Gz7wq/PCWE+RQ=;
 b=SE5xJ5SwovhsSLrafAMm2D/weXU3PhuIhze8rj/lMZZv/ZI4FzY3EJ3O4aaeyfzvqs/uW5ImYroYdyTNhMXLvW16YLFc07w2jXlPyqcaPKoPpTRdb+TO5fuGPxK5hBYOrTXl9cZ8Th5wu/vUSF0Tc6K0mIyVL+bYrJ2oAe+m0Ij/kybn2e/V6hzhx32z2hfmkMbgc/DT1021+7APATQZDfwC6eXJJkwpQf0zqHZbmoOQ7bMIAmLfjtXV3yHUKX5J4qJO02EYpTJX5c7NrfDNYQoSdzvdzmYhlZDw1162mCLGPWeCMuoyzQ3iw3igDuK5xOwUvLqJWp+vTGHwTCDV0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 CY5PR11MB6212.namprd11.prod.outlook.com (2603:10b6:930:24::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.19; Fri, 4 Jul 2025 13:16:12 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%4]) with mapi id 15.20.8857.026; Fri, 4 Jul 2025
 13:16:12 +0000
Message-ID: <d555db37-dccf-49ad-a683-9c3a7c90fc2d@intel.com>
Date: Fri, 4 Jul 2025 18:46:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bmg: Add one additional PCI ID
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <balasubramani.vivekanandan@intel.com>, <Vodapalli@freedesktop.org>
References: <20250704103527.100178-1-ravi.kumar.vodapalli@intel.com>
 <1653febe-2dce-4c1b-9c70-97dcdc1b17fa@intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <1653febe-2dce-4c1b-9c70-97dcdc1b17fa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|CY5PR11MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: afb9cb75-075f-411d-43c0-08ddbafcf2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGQyU0ZpOWxkeTA0NmNvcTN6aFM3Ynh1cjRERnNKWW1oS3dyYjhCN1JZUC9z?=
 =?utf-8?B?d09laEcyckF1SU1PMHI0V3g1NlpyOHJsQUs0Tk9XSUdvTjFvNUtkMUdjL0tH?=
 =?utf-8?B?VVh0Nzk1VXZYa093NWpBdldnV25kQ0JyTFp2cjlDakJ1MHRHSUcrWmFHS1I0?=
 =?utf-8?B?UGNjTVFvYzVPbStybmhNSmxLV2lZQ0tKc3hSMFZDTEgrYThBdCtpTllxNmZQ?=
 =?utf-8?B?d0Vxd211SmdoSDl0bnlUOGJYWWliVGxDOGY1ZVF4T2JaS0UydWxmRDlqUGdi?=
 =?utf-8?B?Y29LdCs0anE3czhMbzU3OHh4cCtxS0NFcXpFeTNzczVRQ2YvNGlSQU1KR3BO?=
 =?utf-8?B?dmZFczNzZFV5Q3J2N2ROY2xRTG5xS3lianRLZXhhcUZ6RVhMNnFXNDYyQ0lN?=
 =?utf-8?B?aGJjSFJZK3JBYjEyYjN5RFMwdUIzenVMWW5URlZlbzN0Sk5LL0JNYnBncThk?=
 =?utf-8?B?V2k1Ny9mZHZZTHFMZ1A5NkIvY3lEWDdHNXVXSkhmbEo4Nm8xY1RXNHdPRWRJ?=
 =?utf-8?B?bEhKelpacmtrajREQ3k0OCtqeHRqdGJ6SGVENHRzbmMzNndvbVdGVW1TVWlu?=
 =?utf-8?B?UmFobHNpZjVpWnZ6T1Q4Q3ZjN1Bud3p0dFpTa2hBN05xZCtralptellOZ1NK?=
 =?utf-8?B?VCs3b2diSERqa2R5TWpFS3JsUG5XN0o3VEFCbHliWndGY0g5andOOTRWRjhU?=
 =?utf-8?B?NUNiVWt0c2VIVzMvWUJrYy9xc0ZsWUxPTjRIZ0VhdmVsdXFKellUUFptY1hq?=
 =?utf-8?B?NWthUXlKUFJMT0lhWWRramhhQWo3dXg0cWtVL0Y4MG9MUGNCMURpZDNvdzNO?=
 =?utf-8?B?Tkg5c3lrVVNIQm9uU1NGK1Vqb1ljYXBiNGNZcHRIQ0FiVDV4MDF2eUdka1ZK?=
 =?utf-8?B?UitQZ2pGa3RBdnF6L2JXeFNJRWM0Rng1YnJQL2plYzlPcHdQTXp2QlRhWnFn?=
 =?utf-8?B?YmhNNzNyNXJXamUvakFtL0d3OCt3d1N0QnNHRFJVRGxEbjRaVGNxQkZ1NzQr?=
 =?utf-8?B?TVk1NVR2dHZzYkNlQjY3eTdCN2IwdzR1U2RXRWhwVnR3djBsSTVWTzNVYTV4?=
 =?utf-8?B?Tk52UUsvTjY4cXRiSHhoZURUOUZmdnJTSitoUmszTlpGRlk0dGRXM2tENVVz?=
 =?utf-8?B?SHk1enV0N3FiMk9DQTZJVzAxWThXc1ZBYUgzMWJGdHFoQzVxYU92MFlDbFRT?=
 =?utf-8?B?aUJhWWFLNjlrV2g2N1V3Rkd1NjFRc2tXcXlvcEJjN3BrcG9TWDVMUHh6OU5R?=
 =?utf-8?B?L3pYN1Y5aU1qd09yeC8vUXhlQW8vNktZcnRFK1ZGS2xvdTMrek5iTHN2Smov?=
 =?utf-8?B?RlpGbVIremNKaVRUeXRWY0p5SnVCdXdURXdWb200R3YyUjM2cnZpUVhlSnpI?=
 =?utf-8?B?MnltR1pSMHdSaThTTDduWFA5RWFPdHp2Zk9kTTk2bUh0MlhTcjV1YzE5blVX?=
 =?utf-8?B?ZWRLbXNRdGNSN3pzM0FNcFBsKzFuQnQ4ZUdUNU02MFFHSDJaejc1SkFURzNQ?=
 =?utf-8?B?N1EwNWRkYTlxYUxGNXp5bGJkTXhoSG9iOTRqWVFPbW5OZlhtOG1xRTNJUDBz?=
 =?utf-8?B?L3NBS1VDNEZnUkFOemY3ZllDS0RaZTQ4a2NaTGJYVWNvanhkQUd2ZER1dDVW?=
 =?utf-8?B?TnoxaEtwcGQyamJzbysxVHpNeXhBT0VGbnRWOXc5K3FROCtySFE4a3hCTk1S?=
 =?utf-8?B?Kyt2bEpFd1FTTzA5S1JZNnBSV0Vxa3hjb0FaZVZPUERjbldXa1BucEtUN1dp?=
 =?utf-8?B?SFZ6OW5lZlR6SlBHRG1NcnVqOTVIUjY0NTIrYjlKbUdKQ3VlODlGTE5OVDZp?=
 =?utf-8?B?WlRxVHFWRWRVNExXLzV2b2hreUUwR2ZPRVp1TDFuTGJSKzk1Ny81cGYweW94?=
 =?utf-8?B?UVJSMEJRaE9SbmI0akF4Zjdpb1RZU2JXbm5uN1hKTk12U3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWR0WHFQRVVmamFKRE5FUWNsRzArYUZPNXcxS3RiTE40VDd1M211MDRjTXRL?=
 =?utf-8?B?eDllUmg0UzZjbVlZUU5GQXhsUjZ2T01iSUd4Tys0SUdTRFFSODJOdURtTDdm?=
 =?utf-8?B?ZmY5NnpabE9vcER0c1JVbFUwdFlwQ0RQWVpkOFlJNlhrZmREUi9lVEc2WlRk?=
 =?utf-8?B?YjRNM3k4RDhrYm8wd0tsaDA3aUcxZno1SlJ5SFBTQ3hyYnZJRkV5VGZkWkZl?=
 =?utf-8?B?dTFwVkpuTEhxRmVnRTJoWnBDWVRyZnVjVjZOR2lhQmorako5dWVIK2NJV2dh?=
 =?utf-8?B?aHJ1S2xxU3oyUjErOVFhZldjSXo1aTkwbUFPZ2RqUmxHYmxDMGwxdFp5emtM?=
 =?utf-8?B?S2FQLzIwUlNmSFYxemJDNVNMTnJTWUlKQUJaaVN3dFhwSmdSYkFZSlRsS05T?=
 =?utf-8?B?WkdZRXJYa090dEY2aXg4VVpOeGk1SWdqaHpFRTE0ZDhoWWhMT01aUHNhaWEx?=
 =?utf-8?B?VGg3ZlVzWmRTMXY2bk44bzBIVWxOZ0pEQlEzZ3J4eWhrekxrZE1VMHhwVlpJ?=
 =?utf-8?B?SGVEZWpKQ3FZbS82ZkJWcnBTNWQ0MmZteGtlb3VQMEtqY0V3Z0tlNU44Q0cy?=
 =?utf-8?B?VnVmZ1NxSExqdzExcHlITkhXV3A4a1pDR0NqRkdDbWRFbno4dUdvZ3NEUVUx?=
 =?utf-8?B?Uy9rK1h5bXBwb2ltcjBKN2lObHZyWVY1ejkzL1U4cStBZjNjczd2MjE4aWhs?=
 =?utf-8?B?QU9UWGVqMUI0MHA2cUlUZEF6algzVXJSTGpoSTdSTUNqb0xmaDNuNkZGY05L?=
 =?utf-8?B?RXNiNUdoOUVqWVRnak15RWl6aFphNHJ3S2gvWkZrL2h0aHYwbjJ5aS83WWY3?=
 =?utf-8?B?YkRTWG9UUXJCUGtHSFN3ZXlMaWc4SnpxNGlJNHhKZXNvQ1haWlRBV1lZVjBM?=
 =?utf-8?B?NG0yZDlzT2dxUzB3Qy9pTXJuNlNTeU1ZbjY2ZHZ1K0w4NWFuVWljcXN2S2FG?=
 =?utf-8?B?WS9QTmJURHp0dXROVEUvSnFHd3hIYUpRdk85cE9zd3RLN1pzYmNuSFpZSE8r?=
 =?utf-8?B?d3R4V0FRY2JEZFd0UU92Zm05YnphOHE5em1HWWt0WEFLWmxrSGZhejlpcHBG?=
 =?utf-8?B?bm5jZjN0M3YyMStVOFQ4aFVvQmFPanhSVzFSbmlZY1RUUWRvalkzNm5ZRDha?=
 =?utf-8?B?QThTWE1RcHFlenBkd2tvNldIWWgyTWE3Q0phcFVZZ1hZSU1HOGdiSkEzbjYw?=
 =?utf-8?B?UnFkNVZuc0FpTG5tb0gyOU4yaFllaHlTajJESGNtV2ZHUWZIUjBrem9PQnZX?=
 =?utf-8?B?QUx0WDVsSW9PTnlQaHpON0pTMmNaTnR0YXdLQk0xVFNnMFB1aE11Uk1vV2JR?=
 =?utf-8?B?YWwvdmdvRGJaNTVuVVZweFVtSS9DVFpvRndobFpIZWl6czJsKzRMOXV4am9U?=
 =?utf-8?B?dWdnckhFTmdkVFJZZVp1Q3FaaWdSVU5JczlWUUF0aG5BdzBXZWZPVHR3cWN6?=
 =?utf-8?B?bmwreTY5Nzh6K25VMHhvbjJhajhSc1B6WmlLcStQYnNuMjd6SnpDMG5kclRJ?=
 =?utf-8?B?dEdqVGh4OTlSTktBb29tZ2ppWkpvb3NBNTAvb1F6Q1V1UmhRTjNIeUJkWDZU?=
 =?utf-8?B?ajdrSFF4NUxNVnBQMm52UFcwNE5VcmhTSXliZjFHU1c3eERZMDl4bXNKU1dF?=
 =?utf-8?B?S2ZTVGRHVjc0Ym11OE5GUXJ0VjBaYmV0K2Erb0dwNmxWRzBqck5XOTBmRmNU?=
 =?utf-8?B?R3JrWnJuaC9mNU4ySDVVNVZUTEdvMGRxQUs5WTJWR2x6QVpzUStqVGxJRnRR?=
 =?utf-8?B?cFVVakhJTlpFU0VBQldSQlJUZUxJSTVBOHhaUkxja3J2WDFHaEtTVGNHU1Jn?=
 =?utf-8?B?NWZVbXZJV0liOXZXUXNnNkNiaytwOGdIMWE1REgvdGloOUlnMkNHWjI5c2V1?=
 =?utf-8?B?UDZJejdOa1N5MTJtWHVFNTlNTjZZMW15MDdQeFE0VjJGYzdVSFRqMnAzSDdC?=
 =?utf-8?B?RlFTOU9FaXVobHBJdlpvTmI1N0drckF4b0JJemxmSWZuaXdPU3k5T3lpaU04?=
 =?utf-8?B?bmpRRGF6MExVampja3pUNStENXZlOEFnVzJuZUFwaWZWaWhJM1JiaGdhOVk1?=
 =?utf-8?B?dDNBcWJmQTc2eFdpcUt1OWZ1ODA2cGl4YytCaGxUUmFOWWIvb3RnZTJEbFl1?=
 =?utf-8?B?ZUUvRWYxZ0FRaEVPZXFFSnZQVVlPbTVGRlVLc1hkeHA3ZGNSVU90cW0ydkZW?=
 =?utf-8?Q?OnSjhZFxokEmPyhMjVmuOXs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afb9cb75-075f-411d-43c0-08ddbafcf2c5
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 13:16:12.7898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYl+aPRr1rEqqJLCbSnRJo8RnrxVfqpokMYcw6wnJlfiPjdsrj6kU8GhpbxdxzVi6d5SaYD0aA6M1PUyc4J1zh+OhC2CLfh/Nq53aJ0h3v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6212
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



On 7/4/2025 5:34 PM, Matthew Auld wrote:
> On 04/07/2025 11:35, Ravi Kumar Vodapalli wrote:
>> From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
>>
>> One additional PCI ID is added in Bspec for BMG, Add it so that
>> driver recognizes this device with this new ID.
>>
>> Bspec: 68090
>> Signed-off-by: Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>
>
> Going by similar changes should we also add:
>
> Cc: stable@vger.kernel.org # v6.12+
>
> ?
> ok

> That way user doesn't need a bleeding edge kernel just to get a 
> working machine, or is there something special about this pciid which 
> needs some other kernel changes?
>
No changes required.

Thank you,
Ravi Kumar Vodapalli
>> ---
>>   include/drm/intel/pciids.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
>> index a0180d10e260..76f8d26f9cc9 100644
>> --- a/include/drm/intel/pciids.h
>> +++ b/include/drm/intel/pciids.h
>> @@ -846,6 +846,7 @@
>>   /* BMG */
>>   #define INTEL_BMG_IDS(MACRO__, ...) \
>>       MACRO__(0xE202, ## __VA_ARGS__), \
>> +    MACRO__(0xE209, ## __VA_ARGS__), \
>>       MACRO__(0xE20B, ## __VA_ARGS__), \
>>       MACRO__(0xE20C, ## __VA_ARGS__), \
>>       MACRO__(0xE20D, ## __VA_ARGS__), \
>

