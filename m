Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643E7CAC5B8
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 16:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028E910E601;
	Tue, 30 Sep 2025 16:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFghz9wj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C16B10E601
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759249501; x=1790785501;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=zfakquPf4ClbSdbpnzKNj0kvaDW5ehg2LFxHax3p9JM=;
 b=ZFghz9wjSySsQQuovpCCG+pHzJtKrPezBKdETcq4Az8hgSD+xPmyxFXj
 En//0oqq2rTCxD23uMttaObOEK54c8uQopPHdgeHVQSWQdopk+eOoNeky
 /BC7UvPIKX9byV9wV0fWxkhzOrCjrnlEVJFUDeJLITFCb9AQGA9HqE6Bs
 7uuBDOw8LuwkZPo6lKKFfVMwtjMiFoBXknGiOZdJl95ERg23ZP+9AIKof
 pVvarcSpsQwUqGbffaFsmyAAFPoJyjVi2dvCA3+tak/94CZsM9RmU5eLr
 e8pCpD0mf3oG73R2CFkKgpai0S/JibEgwdTIxKwcD++iUHvTeEweFYW+B g==;
X-CSE-ConnectionGUID: E47qR/3aTh2X4trNcWz3Zg==
X-CSE-MsgGUID: 2KiOrpyKSSGh35OhRqMeXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72615582"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208,217";a="72615582"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 09:25:01 -0700
X-CSE-ConnectionGUID: QUnQjt0/SRCG4qaU/7sjxw==
X-CSE-MsgGUID: ftXJh663SOS+VkzOA9slGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
 d="scan'208,217";a="178611056"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 09:25:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 09:24:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 09:24:59 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 09:24:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOf1XY12+tF+Ri0S7aMCnQEh6ZDYsJGWolL6egujsCpcqId9mArZSrYP2ihpMr90/+y/iHmuP98qY5MDmZunRxmfKO7p+smaZWhBxE3L8SX/LJEisdovttsNvjACPHCVZ5fKU2wOcB7lCSSkyFIZSlfIcz5kOF4grmFxCxhodar1dLJ1vUgPx5fKf4ejgWyn0JOjRpHYMT7oGYGP7DY0qX0q9PqUSXa+FvTY+rcz75tkaiRGVvY6r7qsP7w15jvSdPkycTYmWGRfdkDNwDKVINRqpOReFlgVRKWg2lsNNYfa3MDQepvY2tPfwmxCI0tIlXCURTw6EjTAMq+Sc4cHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=im468j/KwWAoaraKQvpHQhtZnlWju3w+O6AHb0IK5lA=;
 b=mjn5HlK3P5HAL13pnwQgthEKbv849rseFY1pJy3Bx1qd0+XWbcNKKs/fJ+/l3E2J9fO6/oMmdE2tknM7HeKqrXbV4qoZ8+188AHcnxyP6FqdD2wNSs4nZCKdoxM1iJa+IGQobUjQRSbWE9a2XQM28TuosMKO6jebAOzixc17ZRKwSXLbxLg1AMnWcnMWB9TYPjUgaNoIbKvZTfgSObUSzQceGTz8D8OMvjXt0gYfHjhjBbhusPpPfVl6lUJacqcwtQe34DC9D8rI365+BqPnWsG7uzlT3C97UgXbgsRM+UfVSNbaV12YTATQVtoDLLVqbEfsLO6BHxb1XxO2qNrw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Tue, 30 Sep
 2025 16:24:56 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Tue, 30 Sep 2025
 16:24:56 +0000
Content-Type: multipart/alternative;
 boundary="------------faY1qdR1KIogXlX4I808UP9J"
Message-ID: <212c985a-efa2-4ec5-87e5-ba292db11cae@intel.com>
Date: Tue, 30 Sep 2025 18:24:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/36] drm/xe/vf: Teardown VF post migration worker on
 driver unload
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-18-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-18-matthew.brost@intel.com>
X-ClientProxiedBy: VI1PR09CA0102.eurprd09.prod.outlook.com
 (2603:10a6:803:78::25) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SJ2PR11MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: b4be8836-5222-4eb9-899b-08de003de498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnZsSkllYStoR3lGblc3bWRMa09kNjRHUnhtUkdXVisrelN1YzY5MGM0YUZa?=
 =?utf-8?B?QlppdFRWemJsZEJlTVgyZVJnU0lHSW14dE14VzcxWGtvSzBvVmFuSVlqT293?=
 =?utf-8?B?QURMQm94WTlhNnB4MHdYaVA1WThibzlQNDNhbjVQK0JPQWp4VmdUbVZIYk9L?=
 =?utf-8?B?K3YyZGZVYWxudlFidFYwTjVTRXpvRGdDUFZzOG9leWJPM1ZOVjg1ZTBaeUFv?=
 =?utf-8?B?RWRsMHVUSUNFVXhGOC9xbEpCM29iaW12aFEvVy9nb3lMVWx6U0NqWnBWUEJI?=
 =?utf-8?B?YWpuR0o1NHpGejRqZXlvblJUeko2aFVWeXIwWDdXMWtRT29XL2RMWXg2RTY1?=
 =?utf-8?B?SE05L0NBWjliYUFEZ3p1RWhmcEhka0haN216TE51dHE0YmljTUJSL0JMeFov?=
 =?utf-8?B?V0pUTWQ0OVVEa0ViWDNsYzVtM2Y1Q2lZSDFaSVA4SjJqZzcwOUw1Z1JiRUVv?=
 =?utf-8?B?cUpMTXRpaXd3YTl1L0lNWlZZVngxNUpnc0MrVWhmNlRjUnVnOWN4ekdjRmgy?=
 =?utf-8?B?Q0ZpMUZmdWJ0VnFMa1NXUXRBN1RUZXc4MXhReHk5TTNEME1tU1NTakNteFBB?=
 =?utf-8?B?YWVGWXF1dnVpSU1zZkpCZ25tWW1yWlIvdUhyOTNwWWNlVzBvczNFaVFEbzUw?=
 =?utf-8?B?WFRwNWJpNHVpM3ZTbHY0RVlQSGVmTVptQ2MyYWRyUWFFVUtyTmFaZTVkWHUv?=
 =?utf-8?B?ZitCdkIwM0lmR1RCdmZZRnBta0c1SnlEOXJ4UE5kWSttY3BhUDBhbUxFdTlo?=
 =?utf-8?B?M0xlZTJJOFhyWjRySHJwY2oyRHlGWmVDZXVTUFZPVFZTYUpueVJxTW5sZVlK?=
 =?utf-8?B?ZkFGUFFuMVdBVmw4a3BiZThFa3d1VisvMElRTUlZUjJwZUtQUTgyUHdvUW1l?=
 =?utf-8?B?bGZOcDRFQ05IMVhaanNxWVgrcnpUODVHMm1PYjR2SVZIdTBYNGlDMGVRcWdq?=
 =?utf-8?B?R0N4WnhDT0JNOVRCem9UbTBZY01tWVk4T0Z6QkNMRHFNdFlZV1dmNzFqc2V2?=
 =?utf-8?B?NHNVWDhLczk1cjQyYlQrSjNYTFNBM3NJL1h2VE5VWW1HY213bVBtbWVkV0Rh?=
 =?utf-8?B?ZFJFUkdERmhpM29vc292UkJuaXBCV2IwdVhkUmM0NEVLaW1VUnR1WlFFWDUz?=
 =?utf-8?B?S0lZOTc2RlFvZVZLTFBkRGpDTWZkSWpPSk1DVkYxTFNOUmM4S3BHUDBrVG01?=
 =?utf-8?B?c0U1cGREZFV6aVFFY0pRZTFVY2NZOHFDTW4yc1ZIamJXR1RkYVRpT1ZzT0Nj?=
 =?utf-8?B?QkhtQUJ4cDB2aGtzelhtbEs5QnJXV0pBMk1ObVI4c3BYV0Y4QXdEZ2kwREVV?=
 =?utf-8?B?N09YQjdlR0RXWWJzOXZnazFUU2l4UXNJUHJEbjJLVi9TTnROalZGdURJMEE3?=
 =?utf-8?B?RjdUdFpjdDFoZnNGV1pxSW9WWTJENGhIMjhZWEpVQmhaTFlndnB1cnJ5b2w0?=
 =?utf-8?B?N2EyMFdIRFVadFJ5aG5haXdYODZaZlFWamJIeG1LUHFGd1hWM0tNMStPODcz?=
 =?utf-8?B?cWYxUHVvcE9WbGV4UmlBWENPU3lzdG45ais5SVM5VWUzdmRTZElDSFdTLzZ5?=
 =?utf-8?B?alY3dWhOb3RiYzlwNG1KME8rTlZ0MHJ5WWNhNitIMDhBOVVjcHMyNkhId3E2?=
 =?utf-8?B?MVNKV2JXR1Jtb0tTcWpxQnhmTW56Q1RqNFU4VDUrYnNPdDU2cE5mOThJS0Iv?=
 =?utf-8?B?WHUzYWtYakFHcUxBS0JBckZCV2F1aC9iRWZWdXU1UjFCL2VwNTdmcVZHM21D?=
 =?utf-8?B?WGNCTjN0cFA4Q2FIUTBvVkYzT2Z5R0VobnVXWnZxaEM3VDJwdk9XWkdNMytB?=
 =?utf-8?B?VHByd09UbUoyT3BaY2tOKzZocjhOVWo3Tk5KSjhZV3loWWtnZC9LdE9UcjJo?=
 =?utf-8?B?ZTZvMjU0aHhJZkpmZlM1VG51MkpqY0dabFI0NHhjTDBsamxqR1hiNTd4MWoy?=
 =?utf-8?Q?GMxpDuLpobPTHCJtzp6R+RGbPivOCilE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blFiNHBhZmpqTEU5ZFBINDl0VG1xay95MjBIVDN0YTlvbk9EYW9mMkVVc1NS?=
 =?utf-8?B?V0JEaVFCRS9vVXFQV3RsLzh5YXRiL1lEY21raGtEREIzc2ZPYnQzRHRwMVRP?=
 =?utf-8?B?MmJlUEZ1N2VUR3pVR0VOb0RVam4wZ1NWSUVQTUFtd3VyWThXdTVFaFpVQkEz?=
 =?utf-8?B?bk9aQ01jMkRVYWc5eGpHVXJWem5NdEh6T2xNc3UwQUNEREZRZXpwWW14QjZt?=
 =?utf-8?B?OVFscFJmUmZDVHlWUzBCOFZGb1kxWW90TWVnbnoyTW43SWFubE41TGgzenpS?=
 =?utf-8?B?UnV1K2xQek9vdVhTaUlDU2cwRlp6ZXBCN1B1WnEyUEJJYUMxRElpM2hWMnNO?=
 =?utf-8?B?ckhuQ29aVUh4NWNiQmQ3QmRqM1dRdTcxYmc1U3ZHOE41U01rS2RYVms4K0Iy?=
 =?utf-8?B?MGROczZkM21BRHRvVXlRRDFOUmNSVnE0aFNFRnVuY0hIbi9rdW9kaFNJdEVT?=
 =?utf-8?B?YmN0Kzhpa1c0U3o0dFc2SE11MFhWQm5UeUFHdjRkS3Z6QWcyMEI0SnoxTUpS?=
 =?utf-8?B?bjhDd1M4YWtDeTc5UGNrY1JUeXg4RTcxVjkzZjV3YUVsaEZhSEVBejQrRVZE?=
 =?utf-8?B?ekdUQk1BMWRyM2NSWi9MbERNNndISVJsRG4rNnpuQ1hCREdibnN6eEJ6cEFW?=
 =?utf-8?B?Q2MwRFhnZDJsL2ZVcDBMeVVjaGZicFZVRm9qRlppaVJKS2VhR2FSc0Njc1Vr?=
 =?utf-8?B?ZW0xd0FIK0ZOR1lPenc0aUk3MStaSS9xbkI3YnpHYkd4NXIwMkhPVTZwU0JV?=
 =?utf-8?B?ZWtTZUorTC9pcElFSzZQQzMraEZJaDlzSU1odmxyQUxNVHBWS3IxK2lXQXZI?=
 =?utf-8?B?WDFrSTY0V0ZZYjRuWmlCVWdsMzlkdnpyT1hMVG5taHJxblNnZHFhRm8zV0wy?=
 =?utf-8?B?Z2Vtc3dFbmFzUVZNWWFqM2FianozTTdMWGtac0pPNEFYNVVKMTFKVU85NWgv?=
 =?utf-8?B?cmVxWFBCWjJGOGVMNEhaR05VdmFhbkkrazZJOXdERm0wa1lZNVdUUmROcUhB?=
 =?utf-8?B?bnkyM0FJZ3o2ajdUR1pOYitUQ05BTGVKRmw5QmQ1S1FDUXB6ZUx4OUNUWUpl?=
 =?utf-8?B?OWludVJlVmNQVTU5ZnhPdmJuVEl0QjBWVE1lTkk5ZGdtYVhKTzR2UmZwbDRK?=
 =?utf-8?B?enVQdVFaZmZBYWVRMUYydEc5d0tNTldMQzNYTEE4SUZ5QjJLNWZRa1UyQ1JN?=
 =?utf-8?B?MkJSVXFDWDRCbFNqeTdOa28vTGpQSThuN1BwMU5tUTB4K3Zhc21yYmVzeGJm?=
 =?utf-8?B?ZmlDQm9nSkZsMEZXZEhudDJJTTlqeXhUWXJMWU5JTm1NQnU3VGJCL1NZU0xP?=
 =?utf-8?B?Uk1wME91L2E4MDU1dU5VWXpHaVZ1bFd1MFUzT2t5TC9uaU44V1VUa2orSGp1?=
 =?utf-8?B?WndVSDUzL0NaL1FJalRkUWZDZCtBN1FVNmpNeXBqTTZ5KzVGTEwxM1NBYytj?=
 =?utf-8?B?VllEaStnSDJ0VHJRbit5eEEwbFg5RCtnMXArQkxITHRQYXZCNzBFRlo4djE5?=
 =?utf-8?B?MFJ1NDV2L1RhTzY3a1FIY2xCMENNM1NoVkpVZHZrK3NJU2lnN3JWQXliWExX?=
 =?utf-8?B?c3lOK1FsNUFxU0c5cDJpaURiVkl3UDZrYXNwYXBvK1VRU1JxNkpFSWhMRG5Y?=
 =?utf-8?B?b3kxZHhWQzlLNWxsSXZKbGptYXRKZVRqVWpNTHNIM3Y4OWU1bGNnVk85M1RF?=
 =?utf-8?B?dWtBSWZXS0RNbjk1UURreXIxTi9NQnlMMW9tQUlrWlpCSjV6SGd1dzZiZUho?=
 =?utf-8?B?ZGg3VWF4VjMvOUF1WHNWS3E2dkFkM2t1aVF6bkVJMDY5TkovNnRMQWlVM3g5?=
 =?utf-8?B?cnBCYVl4cjFxMTYvNlhFQVZkeG5rVGx4YWM0a0ZmQ2Z4bmp0cmtXU3lQMHJF?=
 =?utf-8?B?NWVqZEcyK0tnaU1zeTlXYjdxeXNWSGdqSUEyL3lDUFBLU2taYXJBd0pZamlO?=
 =?utf-8?B?Vnp4SnVCdEQ1VDlBcVh6REtDcXAyZ0lpM0o2blNLM0FGMHpoYlhUNXBqNDR2?=
 =?utf-8?B?cU9YT25RdElnaDB0WFVlcjRyclhUT2RVQlNNRkdNekxFVG9QdkxkY2llaG5M?=
 =?utf-8?B?bkFDVHZMRHczQVRhNkMvbzNpNFI3eEt6a1RKNlovU2t6bUVjRzB5ekI5eEhU?=
 =?utf-8?Q?X1cBRl9KZ5I5VncfF4pCqqWaU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4be8836-5222-4eb9-899b-08de003de498
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 16:24:56.4000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08Lt5uxPAWt8pJcIR0P1B3BxctFMsjkFSrrp6v2E2t814eTnwl44o7pJYDBaUQVeroXjIIkYhOMzSCvJpH39AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8540
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

--------------faY1qdR1KIogXlX4I808UP9J
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> Be cautious and ensure the VF post-migration worker is not running
> during driver unload.
>
> v3:
>   - More teardown later in driver init, use devm (Tomasz)

there is no other teardown, so you probably meant "Move".


There is no real need to check `xe_sriov_vf_migration_supported()` 
within `xe_gt_sriov_vf_init()`, at least as long as the teardown is just 
setting a flag. So this is ok (though you can add the condition if you 
prefer, to avoid confusion on future modification).

Either way, this is ok:

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c                |  6 +++++
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 31 ++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++-
>   4 files changed, 40 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 5f9ba4caf837..82be38c99205 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -663,6 +663,12 @@ int xe_gt_init(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> +	if (IS_SRIOV_VF(gt_to_xe(gt))) {
> +		err = xe_gt_sriov_vf_init(gt);
> +		if (err)
> +			return err;
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index ad1d63b5b8d1..cc5af19c1911 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -811,7 +811,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>   
>   	spin_lock(&gt->sriov.vf.migration.lock);
>   
> -	if (!gt->sriov.vf.migration.recovery_queued) {
> +	if (!gt->sriov.vf.migration.recovery_queued ||
> +	    !gt->sriov.vf.migration.recovery_teardown) {
>   		gt->sriov.vf.migration.recovery_queued = true;
>   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
>   
> @@ -1283,6 +1284,17 @@ static void migration_worker_func(struct work_struct *w)
>   	vf_post_migration_recovery(gt);
>   }
>   
> +static void vf_migration_fini(void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +
> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> +	gt->sriov.vf.migration.recovery_teardown = true;
> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> +
> +	cancel_work_sync(&gt->sriov.vf.migration.worker);
> +}
> +
>   /**
>    * xe_gt_sriov_vf_init_early() - GT VF init early
>    * @gt: the &xe_gt
> @@ -1314,6 +1326,23 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>   	return 0;
>   }
>   
> +/**
> + * xe_gt_sriov_vf_init() - GT VF init
> + * @gt: the &xe_gt
> + *
> + * Return 0 on success, errno on failure
> + */
> +int xe_gt_sriov_vf_init(struct xe_gt *gt)
> +{
> +	/*
> +	 * We want to tear down the VF post-migration early during driver
> +	 * unload; therefore, we add this finalization action later during
> +	 * driver load.
> +	 */
> +	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev,
> +					vf_migration_fini, gt);
> +}
> +
>   /**
>    * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
>    * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index ff3a0ce608cd..71e1d566da81 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -24,6 +24,7 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>   
>   int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
> +int xe_gt_sriov_vf_init(struct xe_gt *gt);
>   bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
>   
>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 6cbf8291a5ab..e135018cba1e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -59,10 +59,12 @@ struct xe_gt_sriov_vf_runtime {
>   struct xe_gt_sriov_vf_migration {
>   	/** @migration: VF migration recovery worker */
>   	struct work_struct worker;
> -	/** @lock: Protects recovery_queued */
> +	/** @lock: Protects recovery_queued, teardown */
>   	spinlock_t lock;
>   	/** @scratch: Scratch memory for VF recovery */
>   	void *scratch;
> +	/** @recovery_teardown: VF post migration recovery is being torn down */
> +	bool recovery_teardown;
>   	/** @recovery_queued: VF post migration recovery in queued */
>   	bool recovery_queued;
>   	/** @recovery_inprogress: VF post migration recovery in progress */
--------------faY1qdR1KIogXlX4I808UP9J
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/29/2025 4:55 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250929025542.1486303-18-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">Be cautious and ensure the VF post-migration worker is not running
during driver unload.

v3:
 - More teardown later in driver init, use devm (Tomasz)</pre>
    </blockquote>
    <p>there is no other teardown, so you probably meant &quot;Move&quot;.</p>
    <p><br>
    </p>
    <p>There is no real need to check
      `xe_sriov_vf_migration_supported()` within `<span style="white-space: pre-wrap">xe_gt_sriov_vf_init()`<span style="white-space: normal">, at least as long as the teardown is just setting a flag. So this is ok (though you can add the condition if you prefer, to avoid confusion on future modification).</span></span></p>
    <p>Either way, this is ok:</p>
    <p>Reviewed-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a></p>
    <blockquote type="cite" cite="mid:20250929025542.1486303-18-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt.c                |  6 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 31 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++-
 4 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5f9ba4caf837..82be38c99205 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -663,6 +663,12 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	if (IS_SRIOV_VF(gt_to_xe(gt))) {
+		err = xe_gt_sriov_vf_init(gt);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index ad1d63b5b8d1..cc5af19c1911 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -811,7 +811,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 
 	spin_lock(&amp;gt-&gt;sriov.vf.migration.lock);
 
-	if (!gt-&gt;sriov.vf.migration.recovery_queued) {
+	if (!gt-&gt;sriov.vf.migration.recovery_queued ||
+	    !gt-&gt;sriov.vf.migration.recovery_teardown) {
 		gt-&gt;sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt-&gt;sriov.vf.migration.recovery_inprogress, true);
 
@@ -1283,6 +1284,17 @@ static void migration_worker_func(struct work_struct *w)
 	vf_post_migration_recovery(gt);
 }
 
+static void vf_migration_fini(void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	spin_lock_irq(&amp;gt-&gt;sriov.vf.migration.lock);
+	gt-&gt;sriov.vf.migration.recovery_teardown = true;
+	spin_unlock_irq(&amp;gt-&gt;sriov.vf.migration.lock);
+
+	cancel_work_sync(&amp;gt-&gt;sriov.vf.migration.worker);
+}
+
 /**
  * xe_gt_sriov_vf_init_early() - GT VF init early
  * @gt: the &amp;xe_gt
@@ -1314,6 +1326,23 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_vf_init() - GT VF init
+ * @gt: the &amp;xe_gt
+ *
+ * Return 0 on success, errno on failure
+ */
+int xe_gt_sriov_vf_init(struct xe_gt *gt)
+{
+	/*
+	 * We want to tear down the VF post-migration early during driver
+	 * unload; therefore, we add this finalization action later during
+	 * driver load.
+	 */
+	return devm_add_action_or_reset(gt_to_xe(gt)-&gt;drm.dev,
+					vf_migration_fini, gt);
+}
+
 /**
  * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
  * @gt: the &amp;xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index ff3a0ce608cd..71e1d566da81 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -24,6 +24,7 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
 int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
+int xe_gt_sriov_vf_init(struct xe_gt *gt);
 bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 6cbf8291a5ab..e135018cba1e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -59,10 +59,12 @@ struct xe_gt_sriov_vf_runtime {
 struct xe_gt_sriov_vf_migration {
 	/** @migration: VF migration recovery worker */
 	struct work_struct worker;
-	/** @lock: Protects recovery_queued */
+	/** @lock: Protects recovery_queued, teardown */
 	spinlock_t lock;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
+	/** @recovery_teardown: VF post migration recovery is being torn down */
+	bool recovery_teardown;
 	/** @recovery_queued: VF post migration recovery in queued */
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
</pre>
    </blockquote>
  </body>
</html>

--------------faY1qdR1KIogXlX4I808UP9J--
