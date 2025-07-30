Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C97C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 06:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0ED10E365;
	Wed, 30 Jul 2025 06:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBOEAL3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B936A10E365
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 06:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753855762; x=1785391762;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wdq3BhVHrYB2JERtijEzP6cQWG2qKX01PrrsTMUfQi0=;
 b=fBOEAL3GC3MtQAg++tREJRtbBxdzLk0zvG+MtL9qHCG9hMupAiGFppXa
 NUiSzGe0mhnRRxzCxsb0syO4gXWB5jt997+Ioi6comlbONi6VRMN5SfFD
 YEa4bQbOwVZKelZYTatE9dpM20eyQmwgCGWRvL4jibxKSPgiBrp/hYL+B
 n14X4i3gNhQzHKdOJP78yY67hzm55ODOkm0UR4fYwFuI+SUprhmlQuV3o
 ln8Xgbi8reGARFl3tM4bM4l409FSzBWdhw26l59vaYuFC69US1CUciS1h
 viy7Ak79FURJNIwmzIg2o+7+EgoEbsa/C3lTnwqfGrV22i5NDklBe9R5j Q==;
X-CSE-ConnectionGUID: 8yttHtA4Tvi1IEv9CfL38w==
X-CSE-MsgGUID: tiUbH0qNSz6PFl3OKHjqUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56031617"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56031617"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:09:21 -0700
X-CSE-ConnectionGUID: 644GvxaGRHeIlRcBr+m1mg==
X-CSE-MsgGUID: DAh7xsxcQFeY/EdB5U6fmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="200080482"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:09:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 23:09:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 23:09:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 23:09:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfSdf0ukNPX9f87Pjf4Jpv/dqFwwUVFqZx12dHg5U2rzeSvqgd3TxAb4rl/zbOSg3gEJZDNcLp8nVMd4lC41qv06sbX43+bVnXDjmZNsErY0kfc07HkiE6XD4oUEGKKYSGyyHaoDquCvnjUtpEOX54t0X7INxXCmMMQwMdBLU4xkE8d6AzKWu3m7IfGQVYrbNGS+In6hhW/b1Mqp6RNbhKBnhQrZTCdgzbMTIlXmYVZxkJdM1/kjqGgvBKwUVUBa057gaqd27bCdZ4WN2aNfuf2L7GZ+vxaEN9keSDBGJBvYnRirVcQ2wGTftdNIZJ62TbLZvROuBjRZLApSOxyzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7Ic48n3Tf0MydKPtUKiWyoFxVSid1RNvEJ+9yUdNeA=;
 b=aJ3M7ENSLMe5YDTKk63AtS4aUpd9vzuuM7xnMCJCuMXyGtTzPHVEP8nkv0egGrnA0RaPR5VEQ09yLQAJVfwe6WX1Dqfi6hbGZOKQg3kMkPz4dOKsuGqW5J11lcfTMfJVSTVuAqSnvUf3hpQybXL04TkfsIJb+TVEPU5oNzUNEDc6E5DVOzdhkseJwlwzeeXSEJcrVagMhgHU7Dg5YDCxwplGBnXfdF1m1vrXIudxAINtvDJujDMlUp/6s7eCdqFdwoFGGHD9bggDHglfyfhy4aV2fNMCWSZf0F5byQ0xW9+tFe9RS1lpWZ4dy6BG5uUkFjrUVRdEmGL2dGp/89iwBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA1PR11MB8374.namprd11.prod.outlook.com
 (2603:10b6:806:385::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 06:09:18 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%8]) with mapi id 15.20.8964.021; Wed, 30 Jul 2025
 06:09:18 +0000
Message-ID: <40c30362-2c87-416a-b7a7-5b9d06e741db@intel.com>
Date: Wed, 30 Jul 2025 11:39:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/23] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-21-himal.prasad.ghimiray@intel.com>
 <aIKqt67Ob0sYuDIO@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aIKqt67Ob0sYuDIO@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA1PR11MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f393d6-0f92-44e1-676c-08ddcf2f9e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWtsU1FtamNidWdqTHY1dUdhUDZsMEZMYnhLcWsrTVgvdk9LMkdnTzRSMU43?=
 =?utf-8?B?QmRDcUZGeWpUdGUyTXhwYXJGQUhLeUdEcEl5V1lFWGJBbWpTdER5NGpCTVU1?=
 =?utf-8?B?UnBmcUIxMmxGMHF6eFM2UmgzdjlwckpBNGxpbUtZT2ZtWE1YOUh3MkpaNVpp?=
 =?utf-8?B?NFVTcXE5QjM1VkEwWk00VEI4RFJTWi9ONklGSlE1VERKeXFxWXFxaDRvdFFQ?=
 =?utf-8?B?TjRNUmJDTlkrYTY2SnA3UkJCdDhkR3N3TTR2M25McThrY3o5RFpCSnZIQnFS?=
 =?utf-8?B?V2NpYTBMTUNWSDgvWHBoblUwMlFkeEh0WlJBdzVtbE5EYkRqV3RRSk5BREg4?=
 =?utf-8?B?bTRWb0pnM2Z0UHk2WTVRQlErVFpST3JIdmE1STRrRzZSSzhIb3djZXR4RVZP?=
 =?utf-8?B?K0xVeXJzd3VrcWh4cE9jOWQ3eCtETDlMWm5XeHIrYWVRYStUMG5NS3dTVlJO?=
 =?utf-8?B?d0tlaXZrazhnbTlraFRZVG0wZDVyUmFUZEJzeTBuWjAwYTVhWXdPdWFKdVRp?=
 =?utf-8?B?NlNNUnZBRGN1RE4wZEQ1NmhhcjhocE5qRld2MXJKSGg5MzZJcVN4bzM3Y2tZ?=
 =?utf-8?B?dEpyN3BhRXpiVXFXd3lhTmhLemZoYkZDNjJTbG1wY05HK1NVRjdTMUUzNDBJ?=
 =?utf-8?B?R2ZHWUNHQ2MwajV4RkxQc1NTUUZmVTBYYTR4TjI2T3hOQ2l0ekVxWkx3ZkVh?=
 =?utf-8?B?bXRKM1RGeDVoRlhsMkZ5MkhUdXNKenNtakNGeFZ1ZzJKK2RKS0p4dTVqbnBD?=
 =?utf-8?B?TGlWdDR3Z2NncUdyaEdOUjdPRkJpNkJYc3BqdEFVTTJ2WGFoYXZzWUF6aUNa?=
 =?utf-8?B?eFV2Uk1XZlV2NHE5MHVWMk0yT0p0TExSd1RlaFJMWTExanFrVjE4aUFPOEJP?=
 =?utf-8?B?eUVNV2dzNEdjeGVUdkQ4RXpLSHdjK21La1RhdTdoQWxSNU1zOHNjUzFRRC9n?=
 =?utf-8?B?WExta2FQb2o5YUxCUVJPVWdCbmg1THR2dmNLbWRUOTJKZnlJenRmVVNJaTFh?=
 =?utf-8?B?UW5VeUJiQmdaNUM1VCtRMHRXQldCQWZxTHhiZDNRbkpMZlNmVEF6MlNKSTFr?=
 =?utf-8?B?YmNUQkw5OTg5UmZhZDNHMmJqUFFna0tiU3U1aE1janNjYkRhTjkybHFrMTVW?=
 =?utf-8?B?TkxQTkJndzVVV2FMcDNKNS9HMjNsRDdhNDB5Z2M4NFAxOXlOOGhqVys3TDRB?=
 =?utf-8?B?djBLSEJibDE4eSthOEpKMFkzK0kyU0FaNm5mNHNEVWJQc2Zkbm0wWFl4a29P?=
 =?utf-8?B?NFpPM041Mld4QUJJSWMvY01SeXB0Z2FhMVN2bHdaSUhqa2lxSldjZHlvRW5m?=
 =?utf-8?B?eDRYNERrOEhxMTE4bEZob2R4SVNSdkhyYzNadWtUQy9Ud1RPMHNDS0Y5L0lT?=
 =?utf-8?B?NXp2YWJhTlpVb3Fvem10WGk1eHhuZEUrYnV5ckNqdGYrTlMyblVCTkpQaXlm?=
 =?utf-8?B?bDFZdmg4NHRzWmFySzRPQ29rQnUxa0VjWk1jdlk1aHVaOFIzeU14dXNVdW9m?=
 =?utf-8?B?MUEwdnA2Z1ZKd3A0T2gxUFdCZFpHV2draDNOc0pNUjVKeHFpRDFYTjkraEFh?=
 =?utf-8?B?MUJvK1NCU2JIV2Y3aTVsNEIrOUJSSml3S0xVV1ZJT1QxVTVIbWs1cGhIT0w5?=
 =?utf-8?B?NWI0RUZ3R0JwTk1kQlIrc1RTejhyVDFkSDFQVHFMNGxYNjdRdVhMSS9RNS90?=
 =?utf-8?B?b05mamg1QlQzSHRWQWx1NXBGKzhDVE9uSWx0QjIvbHBGbEswWXBJTFZBMm4x?=
 =?utf-8?B?UUlzYnAyNVJTKzVMYm52YmFaU215YU1yLytZVkU5QWlRdXByZWFINlZBMnIr?=
 =?utf-8?B?V0xReUVVaG9ZNisvVnlmNTNXNXJTeXpmSU9ZeGNCU1RFMzJWVkxicDlPaWQ2?=
 =?utf-8?B?NWk2MXFENTRRTlVrdUN6OWlHZGNaaUlYRnRLS25KOVhYY3BGMVpLb1FuNCtl?=
 =?utf-8?Q?YvEF60aLRQM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFRsby9ETE5nTVhHS1d3bDB4SG1WR1FOZUVCUzc5UUx5QTM1NGhobVJmSkRw?=
 =?utf-8?B?bFhHWitnTzRDQnZ3dUJLMUJUZ2FaUmIwRWRIZGx2MGl1NlYrSlB1UExyVDEx?=
 =?utf-8?B?Wms5RzQzcVNyOG5VVi8xNDI4VXhOMmhZaWpsMkUrRVA3aEVmL3BIT2tNQ0pj?=
 =?utf-8?B?YVlwRkdaeHNJK3I0WFBKaEJtSEdpRjJUZXE4ayt6di9RRnJVeC83MlNxMVV5?=
 =?utf-8?B?Q2txWHhvVXhidm9CUnpRc2RKVEphSUhqejVhQ0NKY0czQVg3a1k4THNsZ3dn?=
 =?utf-8?B?NmRVeDZ2aW02ZkJUTldXZUw2U0ZwV0d6VWtEdTEwZGszdExiK1BwMEZnZ1hi?=
 =?utf-8?B?VFQwbjFhOU5oaG1HNk5hM2p6L0drNmhmb3NiSWQ0UUduamp1S0tpNGY3YWVW?=
 =?utf-8?B?U1dOV3hlY1AwSkh1RTdVa3A1UC8xaiswOGdVTi80a1dRVVBVQUp2bCtSZEdI?=
 =?utf-8?B?Mk10OUZsZU1NS1NMYmNWMkVuYlFmREZFV00yUER4V3hwRzhoN0ZYL0xGR1No?=
 =?utf-8?B?bTVkYTdONU1kTi9qMkFmZExmWlExQW84bVd2TTU0Tmt0RlBld1BvR2YveHBB?=
 =?utf-8?B?WHdKZEp3ZHhnTUlabHllV25oRlFTczl1VW9waWhBb0c1UkVvRkRGcTNUc2VP?=
 =?utf-8?B?eDJjOVMySzkrUTJ3bElFOUpZYzYzaS9kWVRldnc4UFVtdFI4K1oxSnA1c1cw?=
 =?utf-8?B?MW1RSnU0V0twcE9yMlNqcnh1ZGwrUC9QUDNDWXkwZ1V1WHhHQjZSVkp5aUlH?=
 =?utf-8?B?eURhMzBlK0FSMnQwZ2pkZjkvS1M3Qkd6eTc5TTRzK3doU3ZPMDdxZUllWEd3?=
 =?utf-8?B?eWRQOGtIYlBXRG5DVStWRDl1NVQ1WW84RHZZdkpxbGVzWVRqakpWNW5zTlUy?=
 =?utf-8?B?UzUyUUhJMTVxVlpHV3RiUXpTNFVnVmJrRmpGcmJnRGRvVkZ5NVJwUGlzaTBD?=
 =?utf-8?B?Z1FXM0JEUFhIVW9TOWJWN2tVUXo4NWg4aXlGbVZHaW54c2E2TlJZYy9sMjQw?=
 =?utf-8?B?YmhJR0pleFppWk9jWjhjYmd2MG0wdmUwSUt4cURVMlFKM0lDOWtCV0xwMkda?=
 =?utf-8?B?NGZUZkkrZFFBSTVpSXFGTkwyNHFldmV2amVoTDJRLzZMdXpXUWhRUHFOVWdT?=
 =?utf-8?B?dUQrc2JCV3FGOVh3K3lTQmE0MUhCU1RlWS9iQU5HeDZwYUYyYXF4ZjZmTG5t?=
 =?utf-8?B?ZHplUnhTSllJQkZHTEhEQWJWUXZvdkJaYktiOFVpY0FnbVVSOTJoYjV6bnEx?=
 =?utf-8?B?Zm0rb0oxY3Nkd21qTVVHTy9uOFZvWHI0eWF1Z1MwZjNXWmpFS091a3hzQ3JD?=
 =?utf-8?B?NUlEeWJvZUFyb1VST0phZ2FIbmp1aHduSVFvSjF0N1ArMC9kYkhSVHBVNUxL?=
 =?utf-8?B?eHB4NUxmS0Ird0s1Z3IvVVRyUkNtaGVMbjNMRGhOM3dwWlJwaTRmamRUS3RZ?=
 =?utf-8?B?Y1JwcENvcVlSdHZMVll5Ymx6eTFrZkVUL21Bdkk5ZVNnTTBobWg5V29iZ1NJ?=
 =?utf-8?B?Vk1NblhRbUcrRVE2S3RWUUhkazVnRFdpRmlrUUhxSVFuRmN3SjV5cE1xY1VM?=
 =?utf-8?B?dE9zaE83alNLUEQvU050di9IK1ZtZExVTDhaQXdJWmMxNUREMDFPS2RvV3ZY?=
 =?utf-8?B?Um5XZnVsdjZLcVhoWGVGTjJWaE53clEvck5KcnBqRWNTZGRQTGp4UWZWME95?=
 =?utf-8?B?Rm9yS2FCdEI0S2xNcTAwMnZoU1dZZ1V1YmI1VGNjbmh4cDBoUE5aV1k5SDVV?=
 =?utf-8?B?OXlXa3JmNFJVNlkwRktMdUd5bk84cTlXcmo0V3NyQmdNZ2MyS2d4d2JraWNl?=
 =?utf-8?B?WUR0VGlBcTZ6dUJiRnI5Wk9IYk8zOUJhYmVWV2xzbnI0cmkwNWhCTVJYSWdz?=
 =?utf-8?B?SmZHV2RydG5xZTU4Y0h1MGRHR3FLUnBOY3k2QUoxZmx0UXVCT085ZkIraGFX?=
 =?utf-8?B?VTM5SjhLa1hFOVUrWnU1WmpuZnhCbjQ1UFBaT0dlQncyaVVUNlhjN21hREE5?=
 =?utf-8?B?MDdjanpnajUzUmR6R3VGRW9OL3BzZTYzUUJNMWhvdG1CR291ZUpCU1lvbXFm?=
 =?utf-8?B?SUtZaEtyRkJxRC9zSnVZWnpuWTc2TkFRMnQ3SEdLSlZ4d05sM0Zab3RIa1RL?=
 =?utf-8?B?VHpxcHBmUWk3SUtBQmpNNGtQbC9ja1JCMm5JYmlkcTNaUFQvV3hMdjM2QTZy?=
 =?utf-8?Q?dOS8xH/dirYMrkaGmV3VP5A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f393d6-0f92-44e1-676c-08ddcf2f9e12
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 06:09:18.0048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5louaWSYYlIYNig6WOe4+RwVlR0kVUYQxzxiJhH5CsI3bc/i+JYunAuTuoR3pHr7ujlTZdnrRNy/jpxslUS4xEbKJzqW9whpVc1dTf2668=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
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



On 25-07-2025 03:20, Matthew Brost wrote:
> On Tue, Jul 22, 2025 at 07:05:23PM +0530, Himal Prasad Ghimiray wrote:
>> Restore default memory attributes for VMAs during garbage collection
>> if they were modified by madvise. Reuse existing VMA if fully overlapping;
>> otherwise, allocate a new mirror VMA.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c |  34 +++++++++
>>   drivers/gpu/drm/xe/xe_vm.c  | 140 +++++++++++++++++++++++++-----------
>>   drivers/gpu/drm/xe/xe_vm.h  |   2 +
>>   3 files changed, 135 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index ba1233d0d5a2..79709dc066b9 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -255,7 +255,18 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
>>   static int xe_svm_garbage_collector(struct xe_vm *vm)
>>   {
>>   	struct xe_svm_range *range;
>> +	struct xe_vma *vma;
>> +	u64 range_start;
>> +	u64 range_size;
>> +	u64 range_end;
>>   	int err;
>> +	struct xe_vma_mem_attr default_attr = {
>> +		.preferred_loc = {
>> +			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
>> +			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
>> +		},
>> +		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
>> +	};
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>>   
>> @@ -270,6 +281,12 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>>   		if (!range)
>>   			break;
>>   
>> +		range_start = xe_svm_range_start(range);
>> +		range_size = xe_svm_range_size(range);
>> +		range_end = xe_svm_range_end(range);
>> +
>> +		vma = xe_vm_find_vma_by_addr(vm, xe_svm_range_start(range));
>> +
> 
> I'd find the VMA outside of the svm.garbage_collector.lock.

Sure.

> 
>>   		list_del(&range->garbage_collector_link);
>>   		spin_unlock(&vm->svm.garbage_collector.lock);
>>   
>> @@ -282,7 +299,24 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>>   			return err;
>>   		}
>>   
>> +		if (!xe_vma_has_default_mem_attrs(vma)) {
> 
> It seems possible the VMA could be NULL in error cases. I'd check for
> NULL and error out.
> 
> Also could this code be moved to a helper? Internal SVM seems ok, in
> that case xe_vm_find_vma_by_addr could also be in the helper.

Sure

> 
>> +			vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
>> +			       xe_vma_start(vma), xe_vma_end(vma));
>> +
>> +			if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
>> +				default_attr.pat_index = vma->attr.default_pat_index;
>> +				default_attr.default_pat_index  = vma->attr.default_pat_index;
>> +				vma->attr = default_attr;
>> +			} else {
>> +				vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
>> +				       range_start, range_end);
>> +				err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_size);
>> +				if (err)
> 
> On error, I'd print a message and kill the VM as it shouldn't be
> possible to fail aside from a memory allocation failure and we can't
> code with errors given this can be inside a worker.

Sure

> 
> I'll circle back to the rest of the patch a bit later.
> 
> Matt
> 
>> +					return err;
>> +			}
>> +		}
>>   		spin_lock(&vm->svm.garbage_collector.lock);
>> +
>>   	}
>>   	spin_unlock(&vm->svm.garbage_collector.lock);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d3f08bf9a3ee..003c8209f8bd 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -4254,34 +4254,24 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
>>   	}
>>   }
>>   
>> -/**
>> - * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>> - * @vm: Pointer to the xe_vm structure
>> - * @start: Starting input address
>> - * @range: Size of the input range
>> - *
>> - * This function splits existing vma to create new vma for user provided input range
>> - *
>> - *  Return: 0 if success
>> - */
>> -int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>> +static int xe_vm_alloc_vma(struct xe_vm *vm,
>> +			   u64 start, u64 range,
>> +			   enum drm_gpuvm_sm_map_ops_flags flags)
>>   {
>>   	struct xe_vma_ops vops;
>>   	struct drm_gpuva_ops *ops = NULL;
>>   	struct drm_gpuva_op *__op;
>>   	bool is_cpu_addr_mirror = false;
>>   	bool remap_op = false;
>> +	bool is_madvise = flags == DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE;
>>   	struct xe_vma_mem_attr tmp_attr;
>> +	u16 default_pat;
>>   	int err;
>>   
>> -	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
>> -
>>   	lockdep_assert_held_write(&vm->lock);
>>   
>> -	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
>>   	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
>> -					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
>> -					  NULL, start);
>> +					  flags, NULL, start);
>>   	if (IS_ERR(ops))
>>   		return PTR_ERR(ops);
>>   
>> @@ -4292,33 +4282,56 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   
>>   	drm_gpuva_for_each_op(__op, ops) {
>>   		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>> +		struct xe_vma *vma = NULL;
>>   
>> -		if (__op->op == DRM_GPUVA_OP_REMAP) {
>> -			xe_assert(vm->xe, !remap_op);
>> -			remap_op = true;
>> +		if (!is_madvise) {
>> +			if (__op->op == DRM_GPUVA_OP_UNMAP) {
>> +				vma = gpuva_to_vma(op->base.unmap.va);
>> +				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
>> +				default_pat = vma->attr.default_pat_index;
>> +			}
>>   
>> -			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
>> -				is_cpu_addr_mirror = true;
>> -			else
>> -				is_cpu_addr_mirror = false;
>> -		}
>> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
>> +				default_pat = vma->attr.default_pat_index;
>> +			}
>>   
>> -		if (__op->op == DRM_GPUVA_OP_MAP) {
>> -			xe_assert(vm->xe, remap_op);
>> -			remap_op = false;
>> +			if (__op->op == DRM_GPUVA_OP_MAP) {
>> +				op->map.is_cpu_addr_mirror = true;
>> +				op->map.pat_index = default_pat;
>> +			}
>> +		} else {
>> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
>> +				xe_assert(vm->xe, !remap_op);
>> +				remap_op = true;
>>   
>> -			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
>> -			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
>> -			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
>> -			 */
>> -			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
>> -		}
>> +				if (xe_vma_is_cpu_addr_mirror(vma))
>> +					is_cpu_addr_mirror = true;
>> +				else
>> +					is_cpu_addr_mirror = false;
>> +			}
>>   
>> +			if (__op->op == DRM_GPUVA_OP_MAP) {
>> +				xe_assert(vm->xe, remap_op);
>> +				remap_op = false;
>> +				/*
>> +				 * In case of madvise ops DRM_GPUVA_OP_MAP is
>> +				 * always after DRM_GPUVA_OP_REMAP, so ensure
>> +				 * we assign op->map.is_cpu_addr_mirror true
>> +				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
>> +				 */
>> +				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
>> +			}
>> +		}
>>   		print_op(vm->xe, __op);
>>   	}
>>   
>>   	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
>> -	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
>> +
>> +	if (is_madvise)
>> +		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
>> +
>>   	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>>   	if (err)
>>   		goto unwind_ops;
>> @@ -4330,15 +4343,20 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   		struct xe_vma *vma;
>>   
>>   		if (__op->op == DRM_GPUVA_OP_UNMAP) {
>> -			/* There should be no unmap */
>> -			XE_WARN_ON("UNEXPECTED UNMAP");
>> -			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
>> +			vma = gpuva_to_vma(op->base.unmap.va);
>> +			/* There should be no unmap for madvise */
>> +			if (is_madvise)
>> +				XE_WARN_ON("UNEXPECTED UNMAP");
>> +
>> +			xe_vma_destroy(vma, NULL);
>>   		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
>>   			vma = gpuva_to_vma(op->base.remap.unmap->va);
>> -			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
>> -			 * to newly MAP created vma.
>> +			/* In case of madvise ops Store attributes for REMAP UNMAPPED
>> +			 * VMA, so they can be assigned to newly MAP created vma.
>>   			 */
>> -			tmp_attr = vma->attr;
>> +			if (is_madvise)
>> +				tmp_attr = vma->attr;
>> +
>>   			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>>   		} else if (__op->op == DRM_GPUVA_OP_MAP) {
>>   			vma = op->map.vma;
>> @@ -4346,7 +4364,8 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   			 * Therefore temp_attr will always have sane values, making it safe to
>>   			 * copy them to new vma.
>>   			 */
>> -			vma->attr = tmp_attr;
>> +			if (is_madvise)
>> +				vma->attr = tmp_attr;
>>   		}
>>   	}
>>   
>> @@ -4360,3 +4379,42 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   	drm_gpuva_ops_free(&vm->gpuvm, ops);
>>   	return err;
>>   }
>> +
>> +/**
>> + * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>> + * @vm: Pointer to the xe_vm structure
>> + * @start: Starting input address
>> + * @range: Size of the input range
>> + *
>> + * This function splits existing vma to create new vma for user provided input range
>> + *
>> + * Return: 0 if success
>> + */
>> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>> +{
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
>> +
>> +	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE);
>> +}
>> +
>> +/**
>> + * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
>> + * @vm: Pointer to the xe_vm structure
>> + * @start: Starting input address
>> + * @range: Size of the input range
>> + *
>> + * This function splits/merges existing vma to create new vma for user provided input range
>> + *
>> + * Return: 0 if success
>> + */
>> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>> +{
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
>> +	       start, range);
>> +
>> +	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SM_MAP_NOT_MADVISE);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index a4db843de540..f7b9ad83685a 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -177,6 +177,8 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
>>   
>>   int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>>   
>> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>> +
>>   /**
>>    * to_userptr_vma() - Return a pointer to an embedding userptr vma
>>    * @vma: Pointer to the embedded struct xe_vma
>> -- 
>> 2.34.1
>>

