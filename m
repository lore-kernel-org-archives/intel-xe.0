Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF414CA0EDC
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 17:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A3610EAAF;
	Fri, 30 Aug 2024 17:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zls3VTzn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6972110EAAF
 for <Intel-Xe@lists.freedesktop.org>; Fri, 30 Aug 2024 17:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725038947; x=1756574947;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ufzn+6L//fEX6HklYc/NMLnKpyKWZeetygvB704Nbwc=;
 b=Zls3VTznE5Xl++d+4PXooNyMCl64zqKQGNy0/ym0kVSSt12ksRbG7LAy
 0ALU8pI/FTkJIf9HdnmOAZApSeRjC3so4a1rQRWskuSA9Pfnk8gV3bcyh
 tgjGj4ktQHxG52uEsrXW6LHgnztL6uNi+sqxyAERepzn+OnrM/f3+/3xf
 W9Czw6K6GkK/rPircltyTNVOD88uN5gfGCRf3hyU9emJYin598/zRPCBK
 T3Kcx+FxL1rHtdwaVhZNaNVOIYCiEa1pXFihdXvb8KFiNM6ar0WBrH0ay
 Fc00xQjue2t8RF/taN9e2RFtgb7TPjY/1jSz/zThvH9u02oFQuUhKiw2j A==;
X-CSE-ConnectionGUID: /4Dtwq49R1qAiHOHEDy0TA==
X-CSE-MsgGUID: JNsNAwvzQBW7A5bL3+9fYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="13302111"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="13302111"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 10:29:07 -0700
X-CSE-ConnectionGUID: 8hXRrLYTTPCCZUqqNjuMIg==
X-CSE-MsgGUID: 9G94ypb1SEq4WmhrT22d/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="94769846"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 10:29:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 10:29:06 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 10:29:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 10:29:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 10:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZzsFZ3qJS1sb6+5AY+fSHgsGatP9KMdnNowRWLHJO0NvimngxqMxQsjY2PW+q8rGR+8JadsT+mjWDOGjM3lYNSXkLdBNmplgg1rglntzNctPnCDFPrVNQD3wNysJHydTVSO8YNZWdn2awIphN91FwmSjqrroYc7xzhyqRuNA5IXerp/L8U0zI66NuTZf/T3lVmRfQp9gwiXCddqXFU6cbbon9TeBI3VvBmu9XDoFTn7f8PP6sb4kOIlnwYfmLenpE0BOFXb2QvWJeoAfUKZX/LmAsHXQfcpN/8vjdQ+otH6KPLf2z9ZE/820fBiJoh6nlcBlY6Mi9lxz1SLR6kOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQSiJyA4aJaZduUP8OXN63KBsfP0/pVzeDD7wnR6J3w=;
 b=W7axaSmNQ6EcDxk6ElIgLh/B2Lz6MVZDXGrLK8vLjKlelU7OUZdovsRX0EyUrfsbnjkP2ZwamlDqgKk1+AYb8m5pmZ8CCRoXRZPeIcio+82+EDoBdjNCI7NZK73UOzcoDsnkyCdpatpmCgwSqSzzeDz+OCDZISJJoDIpV0IVFPhT4tRqjh0j/7jllQBXonhbiUqfOYToyWgVzUcPPnPSqbxS+WZJz6+rytfhjs25jD9Jw4MKh2g/ew5e28xg4kLBh3Ze0jSwEJNILTOqCZfl7fYoyIcOzK2C1Ped8qKOLlJGFImqKRVkLW1ls3nUtv14PsFNzUwz3EpqpTh4ux173A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB8251.namprd11.prod.outlook.com (2603:10b6:510:1a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 17:29:03 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 17:29:03 +0000
Message-ID: <3792b964-9c47-44b7-b2f0-808cff4f239c@intel.com>
Date: Fri, 30 Aug 2024 10:29:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] drm/xe: Add ASCII85 dump helper function
To: <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
 <20240830062310.3450387-3-John.C.Harrison@Intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240830062310.3450387-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:74::24) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 4924e83f-544a-4611-b2b4-08dcc9193e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlVRNC9pcjhSeUYxaitOVzgvSFEvMURjUXlRSDhZdkcrSXc1dm85a2ZycE1v?=
 =?utf-8?B?ZDVBMnRZc0srbmsvaklJbFcyeWxZSFplNTlzWndMMERyRjJId1NRY0xyUmI1?=
 =?utf-8?B?Q1ZtdmJqRFdkakg0QTZaSjFpTndRRm5HZWlJb0hVNjUweHJEeDJsNHJKd2lz?=
 =?utf-8?B?ZGtjSkUrcHAyM0VFSmVNNlpNQUdkL0R2cmZUOXFRb1ViQThJajVQeUxvQkxT?=
 =?utf-8?B?UGVUMjFZYTN6M3Z4cmxaejh0ZHdlOVpzVEIxY3pzVXlDTnhmREdTZEhtUEN4?=
 =?utf-8?B?V1poTWd2c3ZJOUhDRFBVRE11Y3hnNndIVXZyaW4yU2loaWl6NFBmK2kwS3FG?=
 =?utf-8?B?YUhNeEZESDNtM3Y2OXMvSW5JYjE1OVdnQnFlTjluTkY3U3p2YTVvUThGZ3Jk?=
 =?utf-8?B?VEYrd0JWd3l4QlhwSzFNa2xZWnJRYklDVXo3MXJab2FZK3VuZkwwK00xWU44?=
 =?utf-8?B?Ump0alFNc1dSTGhhOHpKTjNFTDNuSldZMzRuWjNkdXBYVC9aSlo1MXRxUytS?=
 =?utf-8?B?Y0tnUEFOMnpMRXphQndGV1lITGNkRFA3M1lvdmpSdXdqOXZCUE5Db3F6blF5?=
 =?utf-8?B?WmVoeVdNRXowdGZXc2pHWncvc05ZVUc2QW14VjdpK2pyd2VlNDJOMjQwWEl1?=
 =?utf-8?B?b2x2NDBkSFF4WFY5ZXVBWjZmZ2pQTEhmY1AraHJnc1dBSm8zbHlrNFZ6bHJN?=
 =?utf-8?B?VmhOYnJYU2p4cHBNT1lxMUF5aWRjQnBIbDUwSGRnK1hlUmp2d0RIWVNTV1pJ?=
 =?utf-8?B?QitFaG1rMGJyYVlFN25STldLemZOSk1yUDdZeEVjS1NmUGpocEJ3VGpvblFn?=
 =?utf-8?B?UWkxZ0FEZEJWcXV5R2JPcEFlQW8zSGpST05YakQ5ZGF6L01QeW9tOFVqWHJC?=
 =?utf-8?B?SU5KcktodnJjRS8xeTRGanVUSlBVUXRnbUVHNlh2R1R0UHJ5SDVNSUlEaWR2?=
 =?utf-8?B?UWFILzd3UWkvRm5iWDhvM0NRMWd5YlRZYXM0ZHYzNVVrVVlONXNzbk5IUlNQ?=
 =?utf-8?B?VWZFNUZvTGc0VFNlcGR4cWZ0blBnKy9NTGNTdFVyOHRhSWlXbGIyVWlzcWVr?=
 =?utf-8?B?VUloZFhCblhCNXdIV0c1SVJQb0xJQkVOaHh4UitiWlR6RFF1eVREc1JXSjZY?=
 =?utf-8?B?T1hOalEva1pvRGRpL2lhTEdPNlNKdnNIa01KdHl1TlV6d3F3MzAyNzN0OVFl?=
 =?utf-8?B?T0dOcExuaVZmVFBWM0w5aG51U3N1d2pDdTBMZ1NBOEkvOFZoOUxkQnpHN28x?=
 =?utf-8?B?YjErV2cxSG1FVEVkYzBjS1R3NnBCMFpsSS9PZlFQc1RpbnY0MDlIU3pLRlhw?=
 =?utf-8?B?QkUzSzFtOG0rQkwrMVdiVDBqdmJFbEsva0IvTEVtOEtmN0VMM2RJbFJlZDJ0?=
 =?utf-8?B?VVBkZ3NCVm9pOUpzc2dvNlYxbkk2MHJCVzFkTWMrbTZRZUw5Y0lQbWJ0aGNa?=
 =?utf-8?B?L1RlNk5xSG1TU2FkWE5QWWNrRFZoMGNwNnQ1bXN5aTY2V3RZTFhNR1ptWm9u?=
 =?utf-8?B?OGhURVVxbkoxNE56cUltL1F0akltanZTNTVjMUJ3N0poYmVsdk5QVWFZK3Fz?=
 =?utf-8?B?UVlPL2RqN1BFR2ZrSnNreElMbkxWNlRTVE1TSjlHVGEyQ2FNZFpLWlMvbW1X?=
 =?utf-8?B?YU8xU04rSzQxRjU3cVVnOUJIZ0VFdnVpZm5DTmVMTnN5ZmtoQUpsclUwc3dM?=
 =?utf-8?B?YytMOXE3TFlOUEJNQ241amlhWUhuR28xZjlkVEFVWm03S0V0RWdoVXZONjNK?=
 =?utf-8?B?SnA5OW9iZGVvVkdXK21BZzBnbmJEWUhYMkp4OGlVS0w3Y2JldzAxRlByRGtM?=
 =?utf-8?B?Z1JSckhkeTFMdTJraVdkZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmZWclVNaEtFZFVvaHJ2MUptVlNnU0REM2J0ekJOSWlvOEZUcEQwQm44V2RD?=
 =?utf-8?B?NmpwRkF6Z3o5Yk80VVRjNGtyOUpxM004T2pGS3FKRjFJY2R6cjRGMjhxWDQx?=
 =?utf-8?B?RVlNSnAwR1drcWQ4SGIybmphMjZWbTA1Ny9jRGlmMFZycHFERkg5U1pYTitW?=
 =?utf-8?B?emtZdVVsS0hJa1dIWEgrVkFsbE14MzBXSnBJRHlXMGE4eHEwWDRKZk5RZWtD?=
 =?utf-8?B?bGZtd1k5ZkJObVhVcmo3bUlQalFWcWJQM0hpK1Y2UmhoUGlsajdQM204MXY1?=
 =?utf-8?B?ME15M0xTVDhySzJsWU01cTRaUG5EOHNibDQyUkZQQ25mSEwvL0c3ZW5uejNp?=
 =?utf-8?B?ZXAxeDBQMkh0TU5JTWdrNjlOOW53RC9JQjlRdWdMWk9rd3dkdXBzdzhrVys2?=
 =?utf-8?B?ejdlQWcrdDBHT1ZYMnYvS2hKYSt4Z2orVmc1ZGhXcW5NUFlBMUI4Y2R2QUxs?=
 =?utf-8?B?TG5FSEZFYjlobFc2d3VRZGQzVlI4eElsM0U1a1B5N0JkOUNyMWU3SEFZZ1lJ?=
 =?utf-8?B?ejl2Q1hCejM2dGpTU0UrUmFhWWMzQ1ErOVQ1WUVaMlBkeHZKTHJiODk1ZkhK?=
 =?utf-8?B?cUtqdGQ3cTFhWTVGaWV4TGxqWXBrbmc2QmZIVW1RQzQvbjJMMzY5dFRGMnU5?=
 =?utf-8?B?VDBsSjJqZldqenB5UlArMDMza1JzM1FxUWl2V3dPTm9oMFg2ZDQrWmREajkz?=
 =?utf-8?B?NVg5VG9hTU5QaEVydCs4NzY0clBpdmU4S2k1Nk1sM1ZzQldpNld5RHoxSGR4?=
 =?utf-8?B?cEdpRWordE1nU3Y0MEZGTzlaQ0lhczhRZjRmSmJZb2ZudXQrcHpVZG4yNUpu?=
 =?utf-8?B?UDZNUWx4MmJjSGtiWjdPOTRzclpFRnZXdVJRcnJDSHVTb2I2NHN4aXBlUlY4?=
 =?utf-8?B?M3VDM09seVoxYVNmcTlFaEVOalNZejBaL1NBVi9zZFR2T1gvbGptUUxVSlVZ?=
 =?utf-8?B?MkFPNE5PSUJ3ZDQ0NTV4Vzh1UlE1QW1Tbi9HOGpRV1ZyUXVzbllWSHgxNnFQ?=
 =?utf-8?B?b0F1YUptZlY0Z3lDWnBKTGdwSytGWGRrRFUzQjVqQktRYVFCK0xQQ2d3d2Fu?=
 =?utf-8?B?aE9iNVdRWnFDRnpnMThzb0xjOWk2c3JrU2JvNzdEU0ZtNlNyd2JibzF0WlNl?=
 =?utf-8?B?elFoWk56V0RkN1VpdVRhaXlVNnI2aDd2UjBabmtlTGthT2gzSkhPS1hrc2VY?=
 =?utf-8?B?ZSsvcWJhREx3RWpONDliZ1hWZThtUUxWSUl6L1YvZ0lheTcyQnpJZmxER1Iv?=
 =?utf-8?B?U2liT2h1dEpaS2NhSkR6LzNDK3VKTWFwVmkzY1RpUlZORnVHQjlhMTdJSkVH?=
 =?utf-8?B?S0w5MWNoTzNNVGMxdUx4QXpNWlBRd0Rlb2d0Z1ZQdmtaa0FXbHRXMll4RHJj?=
 =?utf-8?B?Zm9oVTRhczUzSFRMbFR6UVF2WTVmdFJYb0t0MlJVRlZyOHpjWDd1TzczVnFT?=
 =?utf-8?B?WGlHTEg2ZXJaRWE1Y2dMZHM4QitTdm9QME1ycGJGNEtsVTN1WUNFVkJhZG5K?=
 =?utf-8?B?TGRWTFpGRVJGMDNpRllXN2RIUGVXUDJYMm1JZmt1azNDaDYvVmZKblo1R0NC?=
 =?utf-8?B?Sk9yd1FYMHZrcjFkUC8xMUxoSExocmZoM3REblpCMkdGalZGaHJOWk5VeWFB?=
 =?utf-8?B?WHM4dHhPYnYrWExEK1QwSmFVa0d6VC9nL0NSL3VaY0lERWdYdFBZS3l0MHFr?=
 =?utf-8?B?cE5KUHhCQzBGY0dvSzY1WDNBVjFMcXpqd0ppMFd2TzBmbHBjWHVodmZpbWUw?=
 =?utf-8?B?V2FTQXQ3QXNML2pFOUhpU0lhZDhzRWFZZjFFMFN5SExwNzRsbmpUbXpNeXRi?=
 =?utf-8?B?cWM1bVBIaDVzNnJ2dElhNE1ZdDJhTENXbjA3ZlFKc3RzUlFqYUV1SGpLVEt2?=
 =?utf-8?B?aVFRU0FhWWxZZStPMHI1ZFVqL3Nma2pCazNKNG1aakwzSGFmNVgzM3A5U2VH?=
 =?utf-8?B?c3pyeVdsSkNubDJWZWlZUHo1SXhEa0lEbXYrMjRnWE9yQTVQRlRvelUxRUR5?=
 =?utf-8?B?aGpSOTlVZHZ6OFZZdy9VUmdvSGIwV1VnMzZjb0lHZkdjL0haQ0RJd2pSRVNM?=
 =?utf-8?B?T0JmeVo4S0lxTjdDSEY2RmFXT3FyMEN6OFZBNmwwdFBnWURUOE5KMWUrdFBt?=
 =?utf-8?B?ZTNwZEVlYUVVS3NYRGpHME14MUR2dFJWYVFXckRVaGNPczBaV1JKYjg2V3JM?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4924e83f-544a-4611-b2b4-08dcc9193e40
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 17:29:03.6888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSj7L+F/scll4HxWdIU0rB592A327afwP1mKg2Qpz0Qzm8buRC3JvBE+/9Yiivh4NLx6wSt0P/YJx1FqLnFxj4/IsocDie6t9DQa9IJk+Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8251
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

On 8/29/2024 23:23, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> There is a need to include the GuC log and other large binary objects
> in core dumps and via dmesg. So add a helper for dumping to a printer
> function via conversion to ASCII85 encoding.
>
> Another issue with dumping such a large buffer is that it can be slow,
> especially if dumping to dmesg over a serial port. So add a yield to
> prevent the 'task has been stuck for 120s' kernel hang check feature
> from firing.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
The intent would be to use this helper for the existing ascii85 dumps in 
xe_lrc.c and xe_vm.c. Otherwise those will hit problems with maximum 
line lengths when spewing a devcoredump to dmesg. However, that will 
also add line wrapping to the regular devcoredump via sysfs output. And 
I'm not sure if that would confuse the decoding tool? White space should 
just be ignored when decoding ASCII85 but the tool might well not be 
aware that the data spans multiple lines.

One thought is to move the line wrapping out of the encoding helper and 
in to the drm line printer helper. However that would require putting 
memory allocation operations in the line printer and that seems more 
problematic as that could be used in atomic context. It seems much 
simpler/safer to just allow for line wrapping in the sysfs output.

John.

> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c | 76 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_devcoredump.h |  5 ++
>   2 files changed, 81 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index bdb76e834e4c..eec7b89ab48b 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -6,6 +6,7 @@
>   #include "xe_devcoredump.h"
>   #include "xe_devcoredump_types.h"
>   
> +#include <linux/ascii85.h>
>   #include <linux/devcoredump.h>
>   #include <generated/utsrelease.h>
>   
> @@ -310,3 +311,78 @@ int xe_devcoredump_init(struct xe_device *xe)
>   }
>   
>   #endif
> +
> +/**
> + * xe_print_blob_ascii85 - print a BLOB to some useful location in ASCII85
> + *
> + * The output is split to multiple lines because some print targets, e.g. dmesg
> + * cannot handle arbitrarily long lines. Note also that printing to dmesg in
> + * piece-meal fashion is not possible, each separate call to drm_puts() has a
> + * line-feed automatically added! Therefore, the entire output line must be
> + * constructed in a local buffer first, then printed in one atomic output call.
> + *
> + * There is also a scheduler yield call to prevent the 'task has been stuck for
> + * 120s' kernel hang check feature from firing when printing to a slow target
> + * such as dmesg over a serial port.
> + *
> + * TODO: Add compression prior to the ASCII85 encoding to shrink huge buffers down.
> + *
> + * @p: the printer object to output to
> + * @blob: the Binary Large OBject to dump out
> + * @offset: offset in bytes to skip from the front of the BLOB, must be a multiple of sizeof(u32)
> + * @size: the size in bytes of the BLOB, must be a multiple of sizeof(u32)
> + */
> +void xe_print_blob_ascii85(struct drm_printer *p, const void *blob, size_t offset, size_t size)
> +{
> +	const u32 *blob32 = (const u32 *)blob;
> +	char buff[ASCII85_BUFSZ], *line_buff;
> +	size_t line_pos = 0;
> +
> +#define DMESG_MAX_LINE_LEN	800
> +#define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
> +
> +	if (size & 3)
> +		drm_printf(p, "Size not word aligned: %zu", size);
> +	if (offset & 3)
> +		drm_printf(p, "Offset not word aligned: %zu", size);
> +
> +	line_buff = kzalloc(sizeof(DMESG_MAX_LINE_LEN), GFP_KERNEL);
> +	if (IS_ERR(line_buff)) {
> +		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
> +		return;
> +	}
> +
> +	blob32 += offset / sizeof(*blob32);
> +	size /= sizeof(*blob32);
> +
> +	while (size--) {
> +		u32 val = *(blob32++);
> +
> +		strscpy(line_buff + line_pos, ascii85_encode(val, buff),
> +			DMESG_MAX_LINE_LEN - line_pos);
> +		line_pos += strlen(line_buff + line_pos);
> +
> +		if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
> +			line_buff[line_pos++] = '\n';
> +			line_buff[line_pos++] = 0;
> +
> +			drm_puts(p, line_buff);
> +
> +			line_pos = 0;
> +
> +			/* Prevent 'stuck thread' time out errors */
> +			cond_resched();
> +		}
> +	}
> +
> +	if (line_pos) {
> +		line_buff[line_pos++] = '\n';
> +		line_buff[line_pos++] = 0;
> +
> +		drm_puts(p, line_buff);
> +	}
> +
> +	kfree(line_buff);
> +
> +#undef MIN_SPACE
> +}
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> index e2fa65ce0932..3f82188590ac 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> @@ -6,6 +6,9 @@
>   #ifndef _XE_DEVCOREDUMP_H_
>   #define _XE_DEVCOREDUMP_H_
>   
> +#include <linux/types.h>
> +
> +struct drm_printer;
>   struct xe_device;
>   struct xe_sched_job;
>   
> @@ -23,4 +26,6 @@ static inline int xe_devcoredump_init(struct xe_device *xe)
>   }
>   #endif
>   
> +void xe_print_blob_ascii85(struct drm_printer *p, const void *blob, size_t offset, size_t size);
> +
>   #endif

