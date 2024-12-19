Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168DFE77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 20:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65AA10E092;
	Thu, 19 Dec 2024 20:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJofXbNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D175010E092
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734640097; x=1766176097;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YK65VkUE90fY8KTyvRWTNCBDbD69nDe14msEfU8RNtU=;
 b=OJofXbNPNCpUb9yjnXkptzCXnHgkCTMuLapw3LVeK4rxKZm4qu0PM9ie
 yps3fplrxoh4Du9mGVnsXYNJqHay6ZSkRh1LZ8aXk8PNuhmncQX5dZOT5
 UwMYCEE4kpkdLNp3RxjJ9C5LVbFQZ9qeJswd7kHMAWb8tqzU/GwmZBj+B
 9faKNFli3IXck4uqKvSL4n8MS3vLoFtn+HhFRpnE2/8/81VjOHzHFcpBW
 2I7SyBQNf30/sae5ohikq+8PIggveRXuBPeYug/OPB8/kvlzyl+Oqk4Kx
 1S0eJq+IaGWAnvyxTOYx82Wp2eShQKF8FqU/R7Kap1IIBoi8+lfB8qSNJ w==;
X-CSE-ConnectionGUID: xt6pXoghSZGL/6Vh0HfflQ==
X-CSE-MsgGUID: QbAYrE6sQXS7MeC6ZkgQQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="38957511"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="38957511"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:28:17 -0800
X-CSE-ConnectionGUID: liFVaAzcTHyo3lVrgSr2sA==
X-CSE-MsgGUID: yfcjJXUWTrG9nhuFgO/B1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98700462"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 12:28:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 12:28:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 12:28:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 12:28:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbiyILXulCrRhDqnIMUveiK3KCn6wl8MutqB6osyK9xeyfhUqgN030HT/kpQRDDAcU3dnwxoredDYcwE+w4tQfotFKOK7LGoX8ihW0QtHiVm3h95jgZYNKtHuE0P7yaIjUft31SVws3NIMC1XhYKFImjFhHwr79N6gdczM7p7mS/XZmeCMxj7uaDk+7N/oN8SeTbkDT1746pp/K/X7aMf9XxiIguqEKuLga8GNeBo/ZTpk4WssdnhTyqbmvel9lzOOryHOZQnBviUeVLPiiyzGyDHYwblV6aoo3zOB3myhXX98UP+l7vOIBO6zl6GYaUpvDsDuQM6VeA5anXDFz/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjuIBes2KF9lJuZ4xYVtACj0xBkDVi38FGQqGJ95EAc=;
 b=zQ+Evc9esNQ1/3hdiLIZv3yvjcfrtuogj+V6a1X6ebqJZlybc0zLbrx+3YElajcB0BdaUhN9W45eiiBUbb3k1fq40mTrmrmGxjHORWdvDOHK46Np9PAQ8206isXw23JhdXwLWqT2gR4AnTzyE72PETys4EirO9mqjyghXfiBzNkLffaUg5xG0fu7NYL/14l7+NfTL75rvZSAP9PF0g+vTYEISMr4Ict6Kd32bjYkP0vyAJHtdpe9/b5tGT/ZgDo8GfdcQ5J3xRvAztgipJHfeFwQQl2/nK+F1IDggloGx9TCWaLvAlQFxzqJ7tMy4yG44SdOB5KwMJherqdjVjo8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6426.namprd11.prod.outlook.com (2603:10b6:510:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 20:27:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 20:27:32 +0000
Date: Thu, 19 Dec 2024 12:27:30 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use q->xef for accessing xe file
Message-ID: <Z2SBskuLlr2uedQQ@orsosgc001>
References: <20241218053122.2730195-1-lucas.demarchi@intel.com>
 <20241218053122.2730195-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241218053122.2730195-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:303:8f::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: d9106ea4-47dc-4fa6-1376-08dd206b9102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXVaTm1FYXc4eFBNaWNob2NxR2VDVGJnWU11VGdpVjdJcTJFa3M0eC80SEJz?=
 =?utf-8?B?OXpwMnlpVEZBQW1NRyt5Rkhlb0pwZHBUTVQ3cURvWGdiSkloL0I4eWVHK0hj?=
 =?utf-8?B?cGFCckszc0RYZTZZdlo0QkdTQWpSSzgzdTJkTjV6YjY5aUF1SmErUkNpZ2NK?=
 =?utf-8?B?MGxPT0JQQk95TkJBSy9OZGwrM0E2aEh2WFMyTGpQYU1BUFpHa0RTdk9YaVl3?=
 =?utf-8?B?R0xzM3dNaDZ5QlNGMkU4QzFRdVhJSERKZ2k5SzBXdVpYdkdUSWd2cmZDcHBm?=
 =?utf-8?B?cCtXVVRVcTVnZ2NiUUFkSTl6ZkNJTWVRL0s5NzM3L0FPSWlTUGo2V1dodmlY?=
 =?utf-8?B?MkUremdHU1BZVXh1b051d1EvSXRBS1RRSmxQV2lPK213V3BpVFljNVBLTlkw?=
 =?utf-8?B?UHFBN20vTXlnNGx5dGFkVmlhWEdRWFk4NDlkclNKdWZqaTdEaTRqcFBHYlRk?=
 =?utf-8?B?TmdwelN0UWpWaFRKZkdjbEV4L0J6Ni85Q3RCNVp2RmxVVnh3VWhDNWcrdVo5?=
 =?utf-8?B?RDhsa21qNGVvMExNNkhPQXRpaWx3cGp0S0ZmTFZxQkpQdXlxL285OEYvR3lO?=
 =?utf-8?B?RzFRVjN0THdRRVQyWDBaQUlTQ2l4ekJyUW9jRHdDSW4wWmx2ZWNLVnZVdjM5?=
 =?utf-8?B?cEFwZGxVaUg4T2lKak5IdGl4Qlc0a0N4Q1M1bW03WnZtdmxPRHk0ZnJDb21a?=
 =?utf-8?B?TmdCbEdSNmxFWmluaVVnRVl1bnVtQTRqU2VleURTOVBVRDhVT0ltVFRlMHRS?=
 =?utf-8?B?bUVacjdTUG1UMkhCUzVCenRJL3VrckJLSFhxaXNxNGppeWJweE9ucGJMVzVT?=
 =?utf-8?B?bEl6Q2Rja1hFczVYZ3hQNTVtZnNNV0oxVmlkbzhvRjlmbkdkYUY5T1d2Tk4w?=
 =?utf-8?B?SFl5OGhUM0RJeGEzRDRJTFdoaU1Yc2RCb3IrVzJFcklsdm9sZTF0VjBJUDhY?=
 =?utf-8?B?eHM3VElBWjl2TmoxdWd6eGRCenk4NU5BTnZCREkwNEVuNjB1emJ3NUZZdGlr?=
 =?utf-8?B?YXlGUWlucFFIbEd2Um5jSzZvU0Zpa1BXWGtuNHptSllPc20xcWgwV1ZvT1Ro?=
 =?utf-8?B?UUFuL3dSc3AxUU5JcnFBSmx5bnNKVHE2dWo0RU5BRkI3Q25oMGFzODg5aWx4?=
 =?utf-8?B?RG12VjhVUWVKdnlpWWZiYnNMUVlrTXBEWTZCcmwzb2QxaUlyK1pwUlNjUUtU?=
 =?utf-8?B?WWRSNHJzVnRHc2xRd1JHTGU0OXowQlhKaEFJTU5hWHdJQnJ0MTNvSDZzS0lC?=
 =?utf-8?B?bzZqMExEZHc3TzlHNEVPK3lWRFhlZ0p0aHNDSjRTME5TSGF0QS9jUVF2VjVV?=
 =?utf-8?B?RG9ycjNORld0b0t0MloyQ09vM1NZek4xSmd4eGtnM1o3UWxpRHhXckpMZzhP?=
 =?utf-8?B?VDJYQlZXRjRsam5jZkw1NkFrMFM0aHBlSXJZalRKRnA3RnpnNFltZmtYQThs?=
 =?utf-8?B?azk2K0l2Y3JWeWNQNENvS0dGQ2QzR1h6blcxdjJjRTkzVERBUXlaT2x4c084?=
 =?utf-8?B?T0E0My8wQWRwUmhpQnQzMm8raE9RbVRoaFlEVDlpSmgrY2JuaDZLdCtXa2JD?=
 =?utf-8?B?RFVPM0MwV0NUT1BEL054YlVpekhLMGlVQjhpcDBLZ3dxeU5vdnZSb1UrVkVR?=
 =?utf-8?B?RjRITm5vbWVReEppSHMrRW1IVDg5YUt6Z3hLeUU0WmxKaHIzV2hBMGMwQXYy?=
 =?utf-8?B?cDROTThUM3RIUFZXMDkrcGVjMjVQTG5FYjkyMENQK2hyRi9uc0pGN1JIbHNy?=
 =?utf-8?B?dDE3QVc2a0ZIODNIcGlWT3NRdEYxQy9FVmpjZjhBdXVBV1NQNlBQQVQrU1k5?=
 =?utf-8?B?SHRlWHpRUDQwTk9OcWRrbEV0ZzFQU001ZXN2a21FZ2RjSElZZS96WUpQOE9s?=
 =?utf-8?Q?NNlQdt59E5tcQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um1BaXBuUXBJSkJ4b01CNFlPNUNUelVqMEhxOVNvbXZrRUZIUTFvUUFpL0Ru?=
 =?utf-8?B?VXpNbUIweFdETFlNeWxmekJ2T1o3RXViaVl1a1h6Zk1OSU52YVpzVTFSQlZy?=
 =?utf-8?B?QjlrNXVsRFByYVBrM1ZwTk9JSXJEWDE4NXpFS2I1M3l3SGNGQXF5ZzloWXYz?=
 =?utf-8?B?dGh5dFNVYnNwMFZvd3oyUDJTQi9OQyt5bFhiOGg3MVFjSk1zSmh3aE01Q0NQ?=
 =?utf-8?B?RkQ4T2ZOR01tSVVxVzFiRnNMVnJ1WmlaT1JyU2NlcW90cEFPMmZ5Zmw4VFVB?=
 =?utf-8?B?RXJZL3ZZc0gwTEtwekMwcXQzVzZDL214ZG9QdDc2Vzd3eFloY0VlUmpiRnNr?=
 =?utf-8?B?d0l6ZUNaalhHck9nallpbnl3ZVZvWXgyektpeWNORml4ZDdySE5pUm04SHdv?=
 =?utf-8?B?bjlJVDBPRVJKZG51WmlLZXRoeU9yUE9ZWmdHTEY5RnQyTGgvaHY5ak5XOEc2?=
 =?utf-8?B?SjBQOXI4VHdzYU9lRkZKa2xlQzU2dkFCYjVxd0gzTU5KOEJNdEQybGtTUU80?=
 =?utf-8?B?NGI5SWtwZGM0QVZiOFZ3NVI1K2NTQlh0UUFVMExlb2hXNndKdVdXOEM5L1F1?=
 =?utf-8?B?eHNPb2ZxdlZ2ZXVlYmtKTFBSNDZVaVhVY2RCaUh0OWRGemhVdTIwOE9lQUdi?=
 =?utf-8?B?YmNNVzVweitWbjNKQXA2TVJoa05Fc2NXRk0yZW9NbFJKMWhSdHR5by84amNl?=
 =?utf-8?B?Q2FmL2l3NWdjcFJjSmdoTWg5bHRpbEo2VElQeURTeER2cThFQXpROUQ0RWpD?=
 =?utf-8?B?QmR5eERueTZDR1BmQ2JqOTZpQzVVZHlycnhVUjNsNDAwdjhhalEweE1ESC9X?=
 =?utf-8?B?L01yY2pQcElUUVkvN2lOTXlzS2dGakxjZ0orOC92Z3pkNThjSkhyVnZ4QXVq?=
 =?utf-8?B?aFZyM0JOMEtxTkgxSElvZUN0eFRac0kwUFRJc2NISUxJSUlVMGhlb1p2SDBm?=
 =?utf-8?B?VmFSRlJvcm1ET3NuWXI2NVdGVlNDOXNRajN5eVk1V2RXSVk3V0hiU1owdzBx?=
 =?utf-8?B?RVV4LzhLVGdyN2h0ODIvcnBLaHg3K0gwZlB6U3dvOXNocTdieXArb2JDdDdT?=
 =?utf-8?B?MFhwNU0xYnRVbzducjlDbHdLRDhBNXhLaU5rOVl3akNwOEFlSm1MN3dLcEd4?=
 =?utf-8?B?QXozMFZDdDBkc2J2Y3pWdEJpc2tUQmQvL3pmbG9jMkhjMEFEMFVZZDVjZU9O?=
 =?utf-8?B?MDNYek9Sd1JSWE0wandwUHlJQ08vd0Rxd0ZVT1NFbUpNK0RtaWE1bDBmYmEr?=
 =?utf-8?B?dmJPUkN4SmdZN0tXTkhKOERaUStWSFpDN0dMSVpzMHF2UFllL0svaEJsTXRu?=
 =?utf-8?B?Wnd0V2VpRElUa1hkOFVWdVVXOFl6eW9nSkNheGdqU1kwYWtHbnEyYVVrSThM?=
 =?utf-8?B?YWl4My90K09GeGFLd3h2L29yQ0V3QTZYVUFWT2wwdTNvMlB2NmYrbUJIQ2hD?=
 =?utf-8?B?SkdXT2NvajZMYnE3ZmoxSEt5dFlWeC9nTnJtTEdTYjc3M3R0cTEvckp2Tk4w?=
 =?utf-8?B?SnZBeW5MSWI5QUdkdjVDZkwzUU1EUlRHYmp1ZjB1VGlycjdkdWovSExBMGhJ?=
 =?utf-8?B?QUtGNFlnWXJMNmVlbFUybFAyZWJ0ckNzbkJFQW9sem1EUVAxNThNRXBQWWRq?=
 =?utf-8?B?Q2NYL2oyekdJcEJrNTE1ckRCN1lzY0VRTk1KOU9UN0hSeGxwaWNkM0l2VGJN?=
 =?utf-8?B?dXZlSVF3Y291blcvb21ZL3VBTDFlemhqZ2RXZkdLT01CYno1cTd6K042OWc1?=
 =?utf-8?B?NlozcmxHOHNDVTFuK1hVYVVnVXlBSGNxK3c0cUtnZ1FWVTBseExlUjhUd1pu?=
 =?utf-8?B?ZlI0SHcrd3oyNXREM09Ra09sdy82d3dSK1RZTkR3RS96QlUrR0w4QlhOZlVZ?=
 =?utf-8?B?UW5aYWxlaEZQcWpRSXRrajJHYXUzMm1iUFJIN0FWdE8xbTA3WTVGN3RRY0NY?=
 =?utf-8?B?M1pJTS9PMVM2S29NNHpDUzdxenM1R1llWVI1Yko4aHczYjhmSGJwR25zTGFC?=
 =?utf-8?B?Q0ZWSW5yVjV4NTFEdXhBRzM3MkFtbG05bUtIZXlFQXFRa2hwU2VudSt1WDNE?=
 =?utf-8?B?RnQzQ3Z6djZ1KzYrZHI5UVRqUzVpcEZpTjU4TTI0RkhWVzJMS0QyMlhyNVQv?=
 =?utf-8?B?WVFYTG1QN3VlS1F0M29BaW85eWppZFRJQ0J1MVh4aWgvbGN3M3VzdFBXcFZI?=
 =?utf-8?Q?zSV2TKppZ/n1nkh/jlAfmPg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9106ea4-47dc-4fa6-1376-08dd206b9102
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 20:27:32.4585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HY5IRff5P1w9ApQ68gGz9ZwCx/Z3h9WPy/CR0IPwbTNdlkiQJBUCuWVJphnSLTUVG2UBeafWZs+IzAObMka5Exr7N8CZczd4Dft+TyGkdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6426
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

On Tue, Dec 17, 2024 at 09:31:22PM -0800, Lucas De Marchi wrote:
>No need to traverse through the vm object as each exec queue maintains a
>reference to xe_file. Also improve/simplify the comment on why xef is
>checked.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM, 

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_exec_queue.c | 12 ++++--------
> 1 file changed, 4 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 8005530b5e51e..8948f50ee58ff 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -770,25 +770,21 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
> void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
> {
> 	struct xe_device *xe = gt_to_xe(q->gt);
>-	struct xe_file *xef;
> 	struct xe_lrc *lrc;
> 	u32 old_ts, new_ts;
> 	int idx;
>
> 	/*
>-	 * Jobs that are run during driver load may use an exec_queue, but are
>-	 * not associated with a user xe file, so avoid accumulating busyness
>-	 * for kernel specific work.
>+	 * Jobs that are executed by kernel doesn't have a corresponding xe_file
>+	 * and thus are not accounted.
> 	 */
>-	if (!q->vm || !q->vm->xef)
>+	if (!q->xef)
> 		return;
>
> 	/* Synchronize with unbind while holding the xe file open */
> 	if (!drm_dev_enter(&xe->drm, &idx))
> 		return;
>
>-	xef = q->vm->xef;
>-
> 	/*
> 	 * Only sample the first LRC. For parallel submission, all of them are
> 	 * scheduled together and we compensate that below by multiplying by
>@@ -799,7 +795,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
> 	 */
> 	lrc = q->lrc[0];
> 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>-	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>+	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>
> 	drm_dev_exit(idx);
> }
>-- 
>2.47.0
>
