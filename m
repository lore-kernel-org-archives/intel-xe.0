Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A30C531DF
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 03:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C3F10E87F;
	Wed, 21 Aug 2024 03:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsUHBj7e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803FB10E87F
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 03:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724210766; x=1755746766;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FrlqB1O4hN/NKmml8xqrH6GhbIO8k76sdAvPLZbJfko=;
 b=BsUHBj7eq2g555Xe+i6ivvtO4VlUNyIgRfzq+v2AlkG9bNldIwrK2aMO
 dhVcz2ROuPizQnsTx4hEa2tVSITZcTFDSOz5Fg8bPWCbvv6hz5oPG9Pfl
 xWlYTkE2padUVXe8kvfDRfxjkwLLPna8A1xYhFafcWpTx6ZS36Bi1ArmP
 aD0PWdbjhz6mBuraLThhdRg4ik3Gs7PZX2KWsDM//mWKiZ7qRqLT4mfh4
 cujTNF5LoMXZMQk95gaOYyDEwHSOKRK7CB5s7zWEfGrJGdhtH1PWF1+tU
 9QxcbSLARbcTrpspaE1vdsiET5+bjDnOBB0YxaLJerfPCrDP7d/hBl3qt w==;
X-CSE-ConnectionGUID: TXfWnQgvSyyJsV3YgNsHCA==
X-CSE-MsgGUID: nNISVTySTHeX0ePWAah/1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22680172"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="22680172"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 20:26:06 -0700
X-CSE-ConnectionGUID: lIPJeS6bTW2Dkq4cFsrZnw==
X-CSE-MsgGUID: kPrXo7c6QrysfBAVRwdZ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="65307115"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 20:26:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 20:26:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 20:26:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 20:26:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 20:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfhHkqEB6lNMinKpKykvrj7gUNUMP2+SX6YlqEatjHMfuDfwSQwT43yilC/CaYOLI75UzyLTs4Bl3i+v5DkrccDZ3GbxDD2MEWyExGN4O82LkzWTxwT7kLpbSCSKm/6i6W6WQ5DMm1sy551tttyynYlLQoHIgaa6tIFiAhK9JoGEBqp1FjV7uuN7tGIJWpecfQjP4anVuxhePtF14+8wV+96Wlpp+/Vd6CNXRyeT8bUunexHI01w+PEyzjRD+EWJiGPxxaL+oPdk2YImrOwvxvL42xsOOLR6NTwYxtTkgEiAdrqbgKzdMduQza2q/hICnTaHh8TO0fJfhO7lwSFvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqy0eRk/239P1a5P2amK0YKA6OUKo/omwc1mwHdSqnI=;
 b=p+lOIZYIFzjL0jPYNOEiVtuYGZbY21on2IdPo5EbHRIBu8LKdx/jnVL49YghTHL6MGtz3gW4pMRxr0Sfu572atI3Hvv258UsZeTsf0DikUlO0JwIIgC2Sf9nTMhGgtx7HLo5QAjqyBsrkokqGX4Rh7wUpgOboYOEO+TvBtI6Yj5DZlwNN2eQduD7/VDr1oVodMborAkr4k1+Jt+6MD+WRUwaIrg2KvVG6qH5jQ5qs4bQ8GkLk3stLkXesK/d8+tw3rlsiqH+SmjO8oSESN4mGjr4MsalqGjV4za3USCSi2hJtop1uAEXKaNb17P+DgTdZUurTrDOmnDRVyg0NH05Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BY1PR11MB7982.namprd11.prod.outlook.com (2603:10b6:a03:530::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 03:26:02 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 03:26:02 +0000
Message-ID: <6be91567-3b6e-48dc-8b46-8d871ee3b9f4@intel.com>
Date: Wed, 21 Aug 2024 08:55:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe: Invalidate media_gt TLBs
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240820160129.986889-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240820160129.986889-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::36) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|BY1PR11MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e5d896-e7cb-485f-d529-08dcc190fbc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmxGQXEzSG5IM0hmR3l6SzFaV2RXamovQnowMVR6WHRkRWorbmNERVRCM0ZY?=
 =?utf-8?B?WFZnMGVZUXFpanhyUVFseWNtUjNBR29xMFFuZWF5VVBUaVM0cHJTd2F3YUdw?=
 =?utf-8?B?RnBXMTVvZFp1dW1SdjJyTEM1U1NSbis2ek1lSHRsTmlHTEVwdG5aaGN2MHFS?=
 =?utf-8?B?aVhJcGRBcHFwTEhvNk5GWCtIN2NEd29FdlgxMEZhTzI4VUtvMk9kY1hRdFJY?=
 =?utf-8?B?dlJTcWdaOC9BdjV3Zk5Rd2ZMUld4L0dSWXZnNXcyMlpoOFcvcXBsdVVxakUz?=
 =?utf-8?B?ODF4M2xiK2hpc24zOUxaMklZTkQ1eDVhZHlDVTdDZEZjS2UzY0hDOHl3ZWhy?=
 =?utf-8?B?T2tleWxpb0x2OGlibkh3dm1IcmxyWk9ZVkl0ZTd3Qms3UUZtUXlpOER5TVEy?=
 =?utf-8?B?VW0vQlFnUlc4Z0FNTEg1NGtlb24rTkNFR21BYUR0QlhiWmt2K2w4T21HK1RB?=
 =?utf-8?B?cDVUN2VqSk1veHFBU2pObjBFSW8ycXBlR0IybUJNRm9vZS9MdDZpemJQdmlC?=
 =?utf-8?B?SC9BbWk2OTUwenJ2UjdnM244Y0Q4ZnRncCtmVUozMXgyR2V2bkpSTFJKM0Fx?=
 =?utf-8?B?VDlGMFUycy9KRTl5SXZhZ3IwKzFiRDV3MGh2QzNwenV6LzNNTi9ZYWRDQ1NN?=
 =?utf-8?B?RnEyYlMyb2xYclNndlRPSGRGYzc4U1BsMlJMRDRJU3UydHR5WFhzUDFZTC9l?=
 =?utf-8?B?V0FwbzE1eXpHSWpiTVhyRmE2NUNCUU4rV0pLZXRHYWdLNG9sTmNmc3V4WFNL?=
 =?utf-8?B?UjBRdWRVMlcrd1RkTHNReEVFQkNLNGFJQmo5aXkyNlVoSkZFT2dpNHcrb1ZK?=
 =?utf-8?B?dVhNQThxemYxT3E2TGM5MTAvNnk4d3pjYXRVUU9PTTJ5UDlYWGVIYUZPbWJ5?=
 =?utf-8?B?SXI3L2cxTjlUWTlhR0ttVGd0TmVnbUNyajIrUkEzY0hFaFIwWlpqdWtHeU1i?=
 =?utf-8?B?ZVNYMHh1Q0pFdHZWQ1RNTndwYnM4REJlOGJtcUo3Ymw5L0crL2tGajlMTnFn?=
 =?utf-8?B?QWNoVjlHcXNrMmU0UDdTYjg1WWVEZEVBckZGZmpuOUc0RUxyRG4vMnR0Q1ZL?=
 =?utf-8?B?VFZFR0VsMCtUdHlhMHFoUyt5SHBHbFV4aVIzcmEvV2pGYy9MQXdRL2M4WHVR?=
 =?utf-8?B?bmV0ZGN5UGcyS3QrUjZWSmZvNFlaaHRQZFg2VEtHN1VDOUMwcHZRdm5iejFN?=
 =?utf-8?B?cDRmbmlMQjhvOVA3eGw2Wkg0WlY1M2tYMkduVlZVMVNaT0JFcmxPZGdRaGx3?=
 =?utf-8?B?clQ2TUt2ZGRJUnZXd2k1QkV3cWsvNXZSdldXSVN3blFvaWdBWVZKbWN3RzBy?=
 =?utf-8?B?Z095TEJDdE5TVXJIQ2w2VVhQNWxuVDVjWlM0YUMwdkx6VkNSazlVU1NNTkUy?=
 =?utf-8?B?VmlMQ0xUMWxZcmdkWit5cjlzQ1JpZ0pyVE8wcWJOQlk4Z1cyazZzLzB0VGxP?=
 =?utf-8?B?YVpIQkdIZFhIamZXcy9ybmJwU1ZwQWs3Q0xPNE02enplcHUraThiOWE3Z2Js?=
 =?utf-8?B?S3JHaERCV2F6MWhvS2d4Rzcrd2lNeVBlaEN5NVRxeEdYZllMNEFldk5DeWhw?=
 =?utf-8?B?Q2I4NG04czRsSHVpYUxWeE9sZnIyWC9PRXNBME1BN004ZVRQcnlwa3pteUZQ?=
 =?utf-8?B?enBzdXdieGJRajc4dlkzNm1iWUJPTVJibjJOcC92QTVDZGpROTIxU3RMcDd6?=
 =?utf-8?B?YlgzVVIzb0lyUVhHc25IbThEYXFuMG9TajhGYUdPNklGZ2d2OWJQSjN2ZUJD?=
 =?utf-8?B?cmlNWFN2aWpxVlFuTUJvdFEyMHR4dXc3aHJMNVBNczRBYXVtN1ZkYXdMSVNz?=
 =?utf-8?B?UzhiZmxEK2VhZ3d1cGNOUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmNRWmJ0TTVRQlNqNTJiS1JQNkNFSkd2WjU3RUZUdGlEUW5PTFc4TnR3VGpQ?=
 =?utf-8?B?N1o1VDIyT3dLTUl0a0NSV2w4UE91UW1XQTZ1RXdxTFd5d2RnZytKYmxWWTBB?=
 =?utf-8?B?L2hWd1AyWHV5d3RYNGk3RU5Wa0tEenB3Z0VtbUJrTTk4RW9oQXR1SFRoTC9C?=
 =?utf-8?B?THRNZ05nMUh3RUF2TE1HUWhDYjhQMWZkZkUyb0dDYlhremtqL3Y3OUE5YjZI?=
 =?utf-8?B?aktTS2Y4N3UrNGxTaEEvWVpiM0FQeVlxVGs0MFIzaVQ3SU84SnlXeTJVZzVM?=
 =?utf-8?B?MUgwQms1VWxRR2xUT3VxNXRrTzFtNVZjZUQyc0VQbTJtMDVHUDdrWnljSUFP?=
 =?utf-8?B?cmtBRXkwdlptTVVZTWZrSVVBSFE1OE9uY3JjM1BaSTBtQ0M2TFJSMHFETjVF?=
 =?utf-8?B?MUd4OVJ5Q2xVRit4Mng2b3BIOEMvQzJqdmdSblpzTjVBWU0zak5UajFseE1M?=
 =?utf-8?B?dUpTWjBaU29PbXhSTHB2SHBiaDRxV2JTUlRpQzJtUTNmaS9pdFhMSEdqWVMv?=
 =?utf-8?B?dkZIN1o0aVYyMDVNYTdESWNqZ1BIRSs2S3dnK0J5bUVJRUtrUnRtYlAxZW8r?=
 =?utf-8?B?dHZINDYydUNNblRibDBYVnhVYzZTMlpzM3NqNEF6NWxzbjBvbnlSNlplc2RI?=
 =?utf-8?B?aThOajBmdjZ2bUxja1BWVjZJb1Vaem1UU3Bpd2d0am4zVjJoWlB0Wktpemlu?=
 =?utf-8?B?WVhqdXZvSjNlbU8rUE1UaHNhdnBNVXpMSUprczFJMldsSkkvdXo3R1FQbWpX?=
 =?utf-8?B?Nm9KSWJZUUxJaW85N3dNcDM3bGRQdE5ncURKQmJzcXl0Q0Q0U1dNZzF4WTBk?=
 =?utf-8?B?QXRUNnIrLzlHNG9aRmxvV2FyK09NSkkwZENsVmJDNkNxbVRLd2NBK003VlRq?=
 =?utf-8?B?OGVxaXJpL2tpaGgrYlE1QUNlRWtzRERsUndBZ1FkdFRnUXRCNzBxS2Z0ZURk?=
 =?utf-8?B?VGw3dDVOL0h0eFBuQU80NzVBNVpiMmRhSHF0UXE0RloyZk1rTXdTQVhsaXhq?=
 =?utf-8?B?NnhBYXJaNjVMQjV6bU5YRytFS1lOOUp0TDliQk5VYTYxaFRpWWpLSG9ieWNw?=
 =?utf-8?B?WWFRMUkwY2NyUDhJMUlyMmZMSS83bjNLZk9TRHBXaGZHRUZjaGRJM1h0cDZi?=
 =?utf-8?B?RXVwL2E3Mk1LREZkOTlGUVJSSFJCZkhRTW0xaTdiSWJIR3JIZHhUeFZjUEpn?=
 =?utf-8?B?cFU4aEJMMTV3NStmdUZXWlZJcmtWa2JrRE5JbWI3STRMay9QQ1FIcjRLMnNJ?=
 =?utf-8?B?cG1GbHNGOVZ0a0dybmxORDV4aGp1WTdzWmlNQThjb1djVEhMWjZrOVZFRFNU?=
 =?utf-8?B?SmRGVUU0cWIrdXVkSi9tdlh0L1dpK2Z5eGdkRHJQODBmSWFFaXJiRCtEbkdj?=
 =?utf-8?B?TnVqNlZZa1lKNlErNWRJbFVJTnM5NGhsT01qQVpZeW84Qm1IdStZSWJSbTRB?=
 =?utf-8?B?aTd6L1JFSG5GR3BBSlcrZmdBMGtHNlhTTXRUYm5FamNJYzBSdFIyL1k3eE9u?=
 =?utf-8?B?L2JQd0FIWnZ3VzNPNE9Xd1JqSEZ0Q2RWeFo1Y0V1cWhqV1pOUEV4T1ZRengy?=
 =?utf-8?B?MnpwWEZrSWo1eU1YVW9QSFh5L1c4dnNlMEE4WnpSaDRuVElUODI1azVLRmtN?=
 =?utf-8?B?b25lbTJacWdTNTE1VElMYkRsajJEbDloQURrLzFsbkJ4M1owcEVWUEhUei9R?=
 =?utf-8?B?THpNYVBxdmpXZkxoWURxam13cDYyMkNvdDNwT0tpeVFqNWg5a1N2WFVwUkRh?=
 =?utf-8?B?SkFZSXBsZU8xSTZNVG9qY2t5ZTRYb0xTYXBNYmxqY2pxWXFBMXFudGgyQTZ5?=
 =?utf-8?B?MWl6Smlnb2RJSXZXNWZEQ1B2OFZTMEdvNldkN1dFWThxN2hxQWNmc21KMVEz?=
 =?utf-8?B?VmNEY3Joa2NSdjRpN1V2UWh4a2M3NGYzY2VteExpUHhwYmU2am80bXdVYktp?=
 =?utf-8?B?VHg0Rnp1c3lyWHVPTzJocHQ2Ukp4VkdxdkRDNXdiV0g4UlVjTGVzb3c2Szlw?=
 =?utf-8?B?OWl1RnZBMkVMWElEMGRKYk04MExtNDlSMmk1NU9SODA0c3dMYmFWaEthWEpI?=
 =?utf-8?B?TVk1NzBFSzdkWTlHdzlpQzJXM1ZpZWxoRWNnV0cwRkV1SDdxNlZUOXJ1ZzUx?=
 =?utf-8?B?cGhvankyelNPcW11V1JWK3VaQzJMa21Ya2hFemFQVXVxemRzc0dFeDVFSGFD?=
 =?utf-8?Q?2maLAkGok7QQf/X4/G5ICic=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e5d896-e7cb-485f-d529-08dcc190fbc4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 03:26:02.6499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYEay+msh9DzheHuJDT/IbaqYkKb8X3XuK8bjNw2hoUvMoE4efk89bITPJL09sXR/QxUI7JqvffPRO2IgN4cAvFLlg3KynEE/oPoMGrzDeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
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



On 20-08-2024 21:31, Matthew Brost wrote:
> Testing on LNL has shown media TLBs need to be invalidated via the GuC,
> update xe_vm_invalidate_vma appropriately.
> 
> v2: Fix 2 tile case

Bad miss at my end in v1 review, current implementation looks much cleaner.

> v3: Include missing local changm

s/changm/change

Please fix typo before pushing.

> 
> Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 37 ++++++++++++++++++++++++-------------
>   1 file changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d1bfd0b6e955..4cc13eddb6b3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3158,9 +3158,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   {
>   	struct xe_device *xe = xe_vma_vm(vma)->xe;
>   	struct xe_tile *tile;
> -	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE];
> -	u32 tile_needs_invalidate = 0;
> +	struct xe_gt_tlb_invalidation_fence
> +		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
>   	u8 id;
> +	u32 fence_id = 0;
>   	int ret = 0;
>   
>   	xe_assert(xe, !xe_vma_is_null(vma));
> @@ -3188,27 +3189,37 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   		if (xe_pt_zap_ptes(tile, vma)) {
>   			xe_device_wmb(xe);
>   			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> -							  &fence[id], true);
> +							  &fence[fence_id],
> +							  true);
>   
> -			/*
> -			 * FIXME: We potentially need to invalidate multiple
> -			 * GTs within the tile
> -			 */
>   			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
> -							 &fence[id], vma);
> +							 &fence[fence_id], vma);
>   			if (ret < 0) {
> -				xe_gt_tlb_invalidation_fence_fini(&fence[id]);
> +				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
>   				goto wait;
>   			}
> +			++fence_id;
>   
> -			tile_needs_invalidate |= BIT(id);
> +			if (!tile->media_gt)
> +				continue;
> +
> +			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> +							  &fence[fence_id],
> +							  true);
> +
> +			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
> +							 &fence[fence_id], vma);
> +			if (ret < 0) {
> +				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
> +				goto wait;
> +			}
> +			++fence_id;
>   		}
>   	}
>   
>   wait:
> -	for_each_tile(tile, xe, id)
> -		if (tile_needs_invalidate & BIT(id))
> -			xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +	for (id = 0; id < fence_id; ++id)
> +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
>   
>   	vma->tile_invalidated = vma->tile_mask;
>   
