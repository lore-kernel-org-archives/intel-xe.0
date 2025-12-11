Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2D0D43343
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 19:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6B10E155;
	Thu, 11 Dec 2025 19:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UTDCQ8b7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650E610E155
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 19:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765482660; x=1797018660;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=r9LqNkx8S9dfOOsT4HMXc+tojANW9aJd9bS1oHQj2/4=;
 b=UTDCQ8b7d1+Lc46M/nsayzu+qIxFcw7Os/wmBa3MYFMQYcwit/7pDhVB
 6SmLerHdP31THYJjjAyfbScXXbKpppmoZsQwTTo8AHOiwHUqnJccwRt6X
 ojI0GkZLhMsAPUvIi5jR9p8Znau6A/SLfanjdTzFL6z5U/FwetbyKYx8C
 cwJvhX9/v3PK/4wh1/HFiOE4PSs+RPhG00MBdRFTu2P1+Nq+K8kMfPZOx
 GEM45xrR7PTFlPeIukMNvzDn6VVNZxUDarNn9TV3hEThqgvpiQS6YW3mC
 RL73P7MU8PVvvgJoIu2+Q8xa7Mm3vaiR1LbYHGLJR4KSZNo9x7e1/H0Ek w==;
X-CSE-ConnectionGUID: EmN/N+M+Rkmp9b/rMfBkPA==
X-CSE-MsgGUID: bZ1UWp+gR2iUs2RFlcvfoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="55021976"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="55021976"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 11:50:59 -0800
X-CSE-ConnectionGUID: 4S8HLmHDRNyMN8YGVBi6vg==
X-CSE-MsgGUID: /OZsTG7zSy+1hyiqp6wPRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196495729"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 11:50:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 11:50:59 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 11:50:59 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 11:50:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyxQrM3RTejV39LWcKwVKVUhZtSbKbMnLYFQWvml9XKim4H12dyyQ21503DGGfKoIyoZhXILFU0HFNeAZrXrBp+sameHLY25h8geW5RpVM9tiapEzwT58G3L9szd9G7Y4Zz1riZtC24boHi66nVW/LOotIKXjfpdZ7Xmirc42g6tlgaEiBDILaSHpSIL9AhIBV7vYuH4uUX0mvrdhQ5wfTzluw80GAmgiIAzOZOq42CGUVN/nwXWe7NRZskhI+uKMm90bVMvEV//lkbcmuJM6Xiwfa1Tmtrl0pIFBc5Y89CAzdeJGBnwBCRtRwto5R7FqAyQfCcc4TJcX0c/ZSpiog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1CYAgYjyJuCpEe8VkeOavL9xQwovdRghh2LpwHLS9c=;
 b=kbkLMkHBiBIE2hNVlD14awIl/OrLJ2MjhbRLYfn2opoCk1qa+lmHwXo4Y3FJhQfNyvBS3h1CNcYqBjWOjsOwKfnHw0YV2mF1OGEDTHWGGW2hB6rQRT2sHnbxzcxhfp8APojDQzcORRVQnasSC/QzMU4JlnsBi0Uuzk1NhZ2TVY5jLyIkXkvfmnHF1VcJd/tdsINWI3r45RC8qOBf+OpdNd6d6CsefFheXn+8jVp+ijy3xpPCkug8PJf/MBDCquE8/2fUruPRkwe/efVgOG3pVrm9kUjMZEvrbdnlhxYHYKXUigED+SxOkXD58YggeNSoaqbB7nwV7iIcN8MV9d2teg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 19:50:55 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 19:50:55 +0000
Message-ID: <a9855b8d-15fa-4c42-9996-77072528d36c@intel.com>
Date: Thu, 11 Dec 2025 11:50:53 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Page_Reclam?=
 =?UTF-8?Q?ation_Support_for_Xe3p_Platforms_=28rev6=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251210014517.3184135-12-brian3.nguyen@intel.com>
 <176546189866.77220.13542988878841606647@a3b018990fe9>
Content-Language: en-US
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
In-Reply-To: <176546189866.77220.13542988878841606647@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To SA1PR11MB8839.namprd11.prod.outlook.com
 (2603:10b6:806:467::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8839:EE_|IA0PR11MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fa0515-7baa-4f59-b861-08de38ee98b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmQwNnZ2MVVwWFhjNUR2RjljOXA5cTNjczRWaXFUaGNuOTA1YXhGK0FRbGRS?=
 =?utf-8?B?bCsva0JIM0JLSW5FcW41ZGIxWnl3U1lyV1VGL3VNbGN4bTJ2ZzlUcmFwL0Ns?=
 =?utf-8?B?SWxBc3g1bk9yR2pNMlZ0dmpVUTVZSGJEUjM2bm05VTY3dUo3dkZHQm80OGoy?=
 =?utf-8?B?a1B6UE94QXBwQnZ3SXpiekhRSk90Mmk3YjRrWnhQTVJobnFlSUFSdG8rcmty?=
 =?utf-8?B?OWRWQ0xCZ0JZeVMxTmIzS0JpTkZLVjVLVGUvaldKSEt6Q2ZnNmNFRnFIdDdK?=
 =?utf-8?B?L2RDZUVaTER3S0xZbHZKODA3c0o0MmR2UkhITHZMbzN3ZWdtZVhZbFBFWmVy?=
 =?utf-8?B?dTA3RWg4Q25OY0FqeHFkVHByTGxMZTRlWlhFRUZuRkN1N2xLY1JIZDIvZCtQ?=
 =?utf-8?B?VUl6U0N1NW1zaHAvWklGWEwrZ3luTSt3VS8xUWRPM0pEblpuVEcyOW5LNCsv?=
 =?utf-8?B?MlFXNXY3V2pwQTk5VCtaa3V6cEZweTRONDJXd2lic0lnR0xmbUdlRGF0VFo1?=
 =?utf-8?B?cWloWnNldE5CZnBkbk1NRndpSFdGamFreHNHeGpTNVJXMVJJYU1DNU53alNt?=
 =?utf-8?B?QlZ0N1MycGRQVnRLWENYRmxLV1R5R0NONlJ3bGRqN29wdW9JcExmQmtGT3Uv?=
 =?utf-8?B?TXVVdWRTZkJsRjZaNlR3Z1hwaHFZZzVhKyszN0sxeWRWTm5JRXcwR2RPU3JO?=
 =?utf-8?B?UnE4NEpub2tDR08zZ1Y0U2NkeWlYblI5Wk5vZTdoc3E2emEwcmFvNUdHQ2E1?=
 =?utf-8?B?eWhuQjA4T1ZNdW9Rd1RlaXJyYjJJV2JKZzV2MnplR1J0b2lHcExxYW5BUU1a?=
 =?utf-8?B?SzJmN1lKenhtZlFqdlErRFlBclcyTmVMVDV2Z3N5cU5DMnNBSVNEaUhxbDBB?=
 =?utf-8?B?azNmNXpjZVpoOU1lbWQ0ZTJqODl1VE5FL3dMaGUvU3k3NjJ4OXFIZUsySWR5?=
 =?utf-8?B?Kyt6UitlS3hWVXFNaUtaNUp1SFJ5SzZDcjE2YzhTUlRwOXNIdWRHNW53S0c4?=
 =?utf-8?B?L0c0SmdSTEd2d2cxdUI0NXdkcWZZV0htTUZtcDA5cG1pNS9WNkZTeVZMWUM3?=
 =?utf-8?B?eWxxbVBacEhBZER5YTZlQmxUSjZGN0NCbzZmTm9HcDRveFY5eHR4RnU3QjVt?=
 =?utf-8?B?SFFxcDdVRlJUZ3I0UVdKdVVvUHcvTndiUUhlZktSMk5CRGx6VTM1U0ROeHZZ?=
 =?utf-8?B?NHZVMUR3L1h1MTY3TnB6Q3NWMnRGR2lEQzNnNmNWeHZyTFZlbjlSNHNZa0di?=
 =?utf-8?B?UVJwdDdwaXVhempCSm16UmtNK3NTL3ZrY3FLMXMxbUszWUtPQUo3Q0NINzRt?=
 =?utf-8?B?Q0JqMGwvNkhhamlvOENoQzFydHhIUDlHdVF6dzhXdWwxQkZ6YU90R29qTE16?=
 =?utf-8?B?Mk03TUluQzNNRWdvSFBCRjlPYUpKay83OU9GbUVVZWdtNnZKVzF5N2FMbFg0?=
 =?utf-8?B?RHNMZ0V3UnI3STdkaXd3Rk1QYlZyN2dNUHBzdzhETEtQWklYZ25jYWN2UW4x?=
 =?utf-8?B?TEd6aWY5VlRHZ1FhYng3NEhkM2ZlR2F1V1BjQSsvZ3lmNUNVSlIwb0lQNnNU?=
 =?utf-8?B?azBPTCt1Y0JGbHMzZ3ZWVjBxSUpVbFMxNExnSkdQbllhK1lWc2xTYjJJRzYr?=
 =?utf-8?B?SXA5c2wvZWRMbVZFOVhQK2YxVEg0c2cvUHcwcXhUSnZVdE9ORVo1NEllM3F3?=
 =?utf-8?B?K0NXZUFWVkVYekRnYjBYamxUZ2txZjFvUlZiRElQQXB6UDZ5clpRalJyN0Jx?=
 =?utf-8?B?WEs1WnZDdjdtOFFiZ2JKN280M2huVVVzbCsvNUpiNkhlTGlROHpjWHhwWUdm?=
 =?utf-8?B?Mk9ZUStocGxSV25uRlJOMVE0NVFndW5YZzl4Z3E1TXg5WnBKQUxVOEpndkNV?=
 =?utf-8?B?UENFeWZzbklBWVloZTQ2aGFTZzlnaE5ZcWNMeEJoYXoxWGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEFTclhNbVA4MEc3L3FPMkRIUkF0K2I2dFVEbXpJUWlpeVBvQnAyaDRCcTFL?=
 =?utf-8?B?N1FFcUJVUlprYVh3ZkFkdzNCVlNxQ0YxTTlndk56Nkt3Y0JCQVRXKzVFZDZV?=
 =?utf-8?B?M0l3T0daMC9raWhMV0ZnVHE2K09pYlZxTWljaUVhV2V6dmpVRllLT3pFQy91?=
 =?utf-8?B?OFBqNzVGN0l4UFBtcHJEVWRjM0gwZ1BLUDVOY2d6UjdBbW44TDRWcjVla2Nq?=
 =?utf-8?B?VlQwU1QrSWhQUVNiUnllamdkRlhxdjlicExZcWdIU3VSQm9oRVBTR2hKR1ZU?=
 =?utf-8?B?VVJMR21KY3NLVE8wS1V6TmNiTG1iMFl0RXNHZWZnZ2E2cktxNkFIWThzVXNm?=
 =?utf-8?B?dWZ5WVpYWlMramhXNWcvdnNTbXI1UUZZN3Bna0VkNkt4cXBuSFZBbXZWZS9L?=
 =?utf-8?B?YzNoQThBd3REVkcxN1FZY0tjVGlMYWdMZnVjdHB0ZGZUUVZCSnFWRUFzc29u?=
 =?utf-8?B?NzUxcUQvOWtnMUFMSm94ZFFhOGZHbEpZTTJrWGJQbkxYRkdKcTBnQ0Z1STZm?=
 =?utf-8?B?Q1BSKzJCa3M0NDZoMEFHblJjSitUT214eUIxRXdMMFJHV3NBN1RqMVY3N0ZZ?=
 =?utf-8?B?ZEdURExZMkNLVjVxZWJ1WlFxV3Y1VEY2aEFkbVZmMDhKTXpwTEJtWHVJSHJJ?=
 =?utf-8?B?TTdwNTNXUDZ0azdtUkRRQUtDcXMwWitaWW8rY1E1RTFiQkRyZldZUmVoZ3FL?=
 =?utf-8?B?OXA0R2VRWjRPUlY3RE5kVUZ0dDdVMjBtQVg4Q2wrTGQrc0VpUHdiSW9za3Ji?=
 =?utf-8?B?ZzRLN01WRHhjaXRYS0pYUURLWFd2S0xhWERWOVBUK0xGODFaY2l3RXllU2pF?=
 =?utf-8?B?a1lpQ3RwMGtQZ3RBdC93bU9xNG9WOGx1eDl2UXNUVCtFZ2UzR0NwREsrQlZW?=
 =?utf-8?B?aTl6TE8vUDd6Z0hNRS9UTHUyYnFhVzhEdUJtcWgxdFp5em1aNU5laW9POC9S?=
 =?utf-8?B?eEdDQUNSNTlNV1I1Tmc5R25oeGxwLzQ3c0ZYZXlYUU9MdWYrdEhOZkhESHli?=
 =?utf-8?B?WFZLQ1R5NERaMmxTbVZFVWRuV0hpU3RKSWdaL2xKUUY5dmxGT0ZzU3d3QVV1?=
 =?utf-8?B?czRuaXlzbm90NkgwZ1hOYU45NG1PL1BOMVRUdkFkZzVvWGFUeVBCcVNpajAz?=
 =?utf-8?B?c2N6TW5NRWErWlNCeVU2aGlCY01mWTcrWnNDcm9QL3dKWUtYTHhGd0NkTVF6?=
 =?utf-8?B?SkNoSUZzMHlLdVF3QkpaYlB6RkV3R09uWS8vOCtZbWdldEJxaDhvSlpFdjdN?=
 =?utf-8?B?NkNYU01PVUtEaSsvNjBzeXNXa0p1SWxXRmtCQmx3djRWNjh4K1pRWmNyTTl4?=
 =?utf-8?B?WTdXWjNZV2pUQ3I0dmlGQ1p6MVZqQlU1SmQ2UWJuMXJGYUxCUkR0dG5oVlJP?=
 =?utf-8?B?ckJvQmxmbzFYUkgvcU5HNitnVkpKVlZ5eW8ySEVBWXFXRU5ualFyUnU1S3B5?=
 =?utf-8?B?Tk95MzU1c1JyQ3hac2FnTzF5aXM4THA3alplckZrMkV0aXpUSkFxT2N4Umg2?=
 =?utf-8?B?OEZHdjRBTDI5RlRSNkZxaENIa2FMUFdaMHRDQklKUUFOT2c2eENkZURLMzNX?=
 =?utf-8?B?Wk1pSG9zb0lDMTUzTllvUzlENEhmMWtkV1Btb2xTZW15ekswQ25nWEtLZWdJ?=
 =?utf-8?B?amdLQzlhZWxHMkZSYVhzL1A2VTBURUh5ZkpaZTZiNlRVQ3NsbVE5UTBxY2Zs?=
 =?utf-8?B?NnhPeStkdjUyRkNPOS95aXN0aGtTUU9mQXR0S2Yxb1NDakhiK3NSUkhOMmlk?=
 =?utf-8?B?dmViOGJhSnBXSjc3bUZiMVVSdzVMemp1Y0ZLbytJWWRsL1pJQmRnSU5hekdY?=
 =?utf-8?B?a2dUbmVqelpMcU43a2dPaWxFUWFZRDV5MGw3VmxON0VjTVIvM1Buc2NzcTdJ?=
 =?utf-8?B?dlNIYjNwQU12YmVNZ2RPaUZwc2loeDlGRW42dkE3MGRqUVhZU1duN25DVnJR?=
 =?utf-8?B?a212M1NEOGtuc05aU1pqT3VqcE1GMEdBeFNpUXpTem9nZ1o5endTUE1ORllQ?=
 =?utf-8?B?RDJMOUhRNzdTK0hGbEhRTFhKb0lOWFpseUJCc0ViaXJUdS84dEJvWTIvYUZY?=
 =?utf-8?B?SEUza1Rmb21GV09IR2lWeDZVNDdLRk12OFFRek1abGdxNFRpNlBwaHhIa0s5?=
 =?utf-8?B?ekhCOVVlSHE0bHZVTE90bjdpcjhnazRQN0ZCT3YreXNlaGxRa0Jnb3Axdlk3?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fa0515-7baa-4f59-b861-08de38ee98b6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 19:50:55.2355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZJ0BILwYPdHCohJOJh6SOgsWb8cIWyL31jPJiNNKsyXZZtQMDTt1VUwQnQ86rPWquo+i/cCiY4Z9gePkIcYwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
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

On 12/11/2025 6:04 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	Page Reclamation Support for Xe3p Platforms (rev6)
> *URL:*	https://patchwork.freedesktop.org/series/157698/ <https://patchwork.freedesktop.org/series/157698/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v6/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v6/index.html>
> 
> 
>   CI Bug Log - changes from xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b_FULL -> xe-pw-157698v6_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-157698v6_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-157698v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-157698v6_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v6/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html>
> 

Should be a random failure in test case. Unrelated to changes made in patchset.

Brian

>     Build changes
> 
>   * IGT: IGT_8663 -> IGT_8664
>   * Linux: xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b -> xe-pw-157698v6
> 
> IGT_8663: aca02d1cc9804e5f1868b0ebfba6426e2d1244fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b: 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b
> xe-pw-157698v6: 157698v6
> 

