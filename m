Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3E5C19F4F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 22:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E348210E1B1;
	Mon, 29 Apr 2024 22:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcdkcMhY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B2710E140;
 Mon, 29 Apr 2024 22:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714430282; x=1745966282;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H5IomchFkFAdXm0yQaxKYuiaL399usIlgDeBUgxkchY=;
 b=KcdkcMhYA0oR+IyhF7Kd1Ibq+hM/Y3oN3YFLxRD9A3N25UdJjp2yMwoY
 j7I/2CvzMo69r+Ky1xOrioV2n4HB8YxMXeFentdc1bYyq4hAZ1iPjXOMv
 rIYlZct4ldSa0P+PXbyIXxp/Yvbjbs9Mr/vcgH2CaheQbEfxFqXsRQ8pc
 2B6Nyy/ipQLd05CQDFQTso8+PGWjiXHXalyMbsSYSjXgdEsIdueS5MXb9
 eEgw9Ern+w/3IB7kVEvM6LvDZfF6mgHvzYamCRIbOKJGQCKQy0S+0+28u
 U6OAHwEnopU2tfQsIwpmPkwM/yKp5osp4OKePd5vfUnXskajqPxwycCKh Q==;
X-CSE-ConnectionGUID: MvVbtPZfSsWq0yvdnYfxrQ==
X-CSE-MsgGUID: agRnZ/QYTUW2v660vvCSaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10036335"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="10036335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 15:38:01 -0700
X-CSE-ConnectionGUID: zoAfBT45SfGQlXVjiSFYrQ==
X-CSE-MsgGUID: s4FJzS4wTceQxTsAHiq5dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="26118183"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 15:38:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 15:38:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 15:38:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 15:38:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 15:38:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOOYPIIbHyiG4pKm408CgZGp+nH15RZ9ys9/4trlQsqJ4/kTxpv24YBBfKpsr0lY6c70YsXSPoucsilkIU0zWg5NOnobd4UzoD6DymkxvXmAXszFADobTbdwRm+34K2dW68dcZ2wLCsBxZNTGIEVLkwK85UI1aIU2DEUleGbgGg54GOkgw+TNsu/m+WEvzV5601FyAOadz15fpX/zi8jQed3KNxVo5Xiqlbn6ihU9fREpsJuEalQv0oi6JDzJRGrjeJGS3tPi+f6TshUopnctlwTXtTaN4AU7SHaJ9wlM5x0n1GyPegbX+Sc9M3yOwZ23vy1iiiCI4q2BTrZaKEI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mJ4o+vWkMOQT2YRega+GDk3E28SsW6zOadguAMI/a8=;
 b=PuAi2Z8QdRCOJsW/6NZEpC5K7zSmHYYDH0SjaEBTEkyEiRHIZJ3sj3ikO4yp6127WsCsAMxp7DDgm1/dXnTymVGQnoGYoCemamjreZzAIu9kXFhelCmURp1RmUIIT+7bjBzPjtz627YBSjTbYkz9xaDybLt+R0gXhr75kfJmadiMERN5twJUVlSIPr6zA/zaQ6hPTWMbdcYd/k0Am21BJR6KkR8qhBKlNfQSCPFAr4dclANe1mNUmn/WIvCwL8sPv/KeE1jzk9W0+UplK6pMBJ4n4uL1DtcP1inKFLIpC2I3VdtYG8YzmjWdv1s8syUEd7zh5spJaCx1Nh76sRPxJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 22:37:58 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 22:37:57 +0000
Message-ID: <1eade99f-7964-490c-81b4-417c5429716b@intel.com>
Date: Mon, 29 Apr 2024 15:37:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240410094052.1033721-1-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240410094052.1033721-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: fad72253-a93b-43b2-1832-08dc689d0476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUt3SGN5WTRONlVqbzNXU2I0Rldxd0cyWEVCNjRxTkVTNmdRUldkZGVsUE1F?=
 =?utf-8?B?bFhBSXlDVmpHUVJuWDNwTERSenhpMHljRi9PcUI5RVdLUTkyZmJLMTNWWmhu?=
 =?utf-8?B?bzBGRmtKeDNCMWcrYy9OdlBWUUQ3dkdveG9HUlFZTFdub2NyZGlNL2RITGx3?=
 =?utf-8?B?T0hjRHFyRCtWWFMweEdHZ1pKenZVYnBZUWpWYUtRRzROS1JZYmJaSmZOcjJN?=
 =?utf-8?B?WEhFb0Z3aSswSllPR0hVUEV3dGI2N3RTQ0ZZWW9wU3BodGJsMktoQmdUQ0RY?=
 =?utf-8?B?S3Rkc0RGamdldHkvTnR3d0dLWThnV09DeU5DUUF4ODNZczRUQTVOZmliN001?=
 =?utf-8?B?VkFqNTd1U3ZLOERlREdwWkdDQnZVUlFWdUFQVE92VWJzNjh5WGVDclRNbXl4?=
 =?utf-8?B?WG9KaEFsd0MwWmx5OS9GU1o1dURTOVMwQ2xHQmpVcjBpTnhQVXA2aUxvdXpN?=
 =?utf-8?B?MU50R0x4cjBRRmkxWno4dnJ2SDRxNWR6dEF3SGY5UDFNRi8zYkxtR284eFQ3?=
 =?utf-8?B?b0lHRG14T1ZkNGNOY3pwSHJJdjgvWWtsTG9Qek1OZnhHcVNpcytNc2llZWd6?=
 =?utf-8?B?MFZtZ05zaExlTGNibUtaRUtKTjB0REpROGpmdE5ZUGNTWWZtSE9qY3ExVktv?=
 =?utf-8?B?T1NkTkJvL0FFSThJMjIrY0VETUlpT2pnNUlhTWVNUDFKUGxTMlhOcnhwVFNT?=
 =?utf-8?B?eXNjdjl0a2RjZFBvbEdzb3VnSnZTNG5DSTJtSytNZUViMEQ0blpiRUNFUXZz?=
 =?utf-8?B?eVhaMEFUZEV2OHl1Y2FObHdWT3AwUkxZSGpYRkgrajJiSHU3WGZZMmlJVmt1?=
 =?utf-8?B?K1JOMXR5L1E5emFmQW1rdVoyL1M1aFMzcmJMK1NHaHkzUXp2VWUzUXpSQzJy?=
 =?utf-8?B?alM3STBmbnZKdG5Fa2t5bTlXTzVhcjI4MkJXbTFVYUM4MzQyN0gyYzR2cWR2?=
 =?utf-8?B?MFFmZFN3K3FHbFJvU0ZTM2ZsWlAyMGRiQXM0cE1pbTFlNC9YL1p0UE1LYm9L?=
 =?utf-8?B?WnFrVEh2QU5EMTY0V1ByeTREWXdzUHMvZ1duTk5vK2dNK2pPSEdzSlJXS3BD?=
 =?utf-8?B?aWxmTlJCMnNvRnI2TGtDclhDTzE4RkViM1VwcStrQlRSWkpBRXlTcU01d3BR?=
 =?utf-8?B?cmtscXhuZTF2QUFpTUdqWTVGaWhwaVdyaENNYW9IWEJBZlJXWHM2cE1qMjdl?=
 =?utf-8?B?Q3JNSmk0YnNoeGF4K2JSK1YwNDBJTHBUd21MRGZXTmM1V1Nkc1NyK0FXOTRO?=
 =?utf-8?B?cVV0MTZxUm9MbTlkaHRpZGFESlpBS0NMajFWY2UzY01CWHdvVTgvMXJ2T01G?=
 =?utf-8?B?a29td1NRR3oxaG5tN00xZ0ZHVXNWU2VTdGhMeG8rTnBJY1l4MFFTdmNmYWYv?=
 =?utf-8?B?am9FVEoxcmpFQ1BqMGFHWWtoaFRQVTZKd0JDNUNBRzU2NHhDVW1pMEJaRkFa?=
 =?utf-8?B?N00yNDF0V3Y2TnNzT01tU0llWUlyRnE2VzFpOGVHRVVCeXF6SlYza25LbnV3?=
 =?utf-8?B?bEZ0alczOFllcFBsZkZMaFhCcnVRM2x4ais3M0VNWjNHbzBHMHBaNUlGcjQv?=
 =?utf-8?B?c29kS0V4NmFpaEFwNTlRcFF5U0svdzRRTTk3TUFxWHJzMUdvdkRzU0E0blpM?=
 =?utf-8?B?dEI0VFJkUFdGQjB3WS8wZzQ0UUxvWEJ2Y0hBdW5Id0NleGI2S1ZSbFM0QWJX?=
 =?utf-8?B?NVhiWkRoMWIwSGRmV0VaeHdHanlaNzNXUFpIa1cxcWVneVk3TjNnYi93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0RYVDR6R28ySTY2L1ZIMXFJamh5ZSt0ZDZldmFjd0dQWElvQWNkbHZmb1ZK?=
 =?utf-8?B?aXNCdGNJVzIySFRjdXdFWm9zNVh1WGhuNE05VEM2K1ErRVBHZ3FSTnRRVmhx?=
 =?utf-8?B?aGVuMTVsSWE3Yk9aak1XbnM1VTlTOHU3VkVHVGIwQjI4UFo2SHg5RW5ZWHlu?=
 =?utf-8?B?VHBxNjRqNm1mMHFiVGtHaCt6eWtFd1NsNDNVN3k4cVQycVBzQXJESHhJbHNo?=
 =?utf-8?B?VDEwQVRNckVDVHdrOWFtQllyT29kc01UeTQzTkh3Qm1LSWJtWmVmL0F2WkFi?=
 =?utf-8?B?NjNkYmpDQTFnTko5M0hZNlNQeHVCbkpSeTdDRkhUMWhEWmFGc056ejErbHVN?=
 =?utf-8?B?MUlmVWFodzNCS3NmNXBRQTYwRVEvRDU2Rm1BVnpjUmpUdmE4RjlPTHA2SjNr?=
 =?utf-8?B?bG9rZjVkQ0tmakR1UHMzckFVR2J6WngwbFNQUkFvcDZKZFo3N0l3QWVVMlJP?=
 =?utf-8?B?cmk1Q3lmLy9pbGRzcDc5OFhyOUhTVksyL0FBdGNFVUMwcTk2ZmxCMDNHWENr?=
 =?utf-8?B?M29FVzRYRGVUd2h6dVM1a0wzODh4UmR1c3hqYVlmaTZ0OWwyb09DWW1HZEJp?=
 =?utf-8?B?R0lRMjFtUXE3UkFGaW9JK012V1Y4VWNDdzNlbkRsb20rY3NYbzZDOWttR0Mv?=
 =?utf-8?B?T3BqcmVKYi9UUWhRYWdWd2lyRVUxTjRjUTEwMTlISFlUZjBRWTRBYklYOGFK?=
 =?utf-8?B?WnhBQ2U4ZFhpNFMxVWZhSkZrSVhpYUx3Tjl0YmhheWtkV2lwYUJCbThyVjg4?=
 =?utf-8?B?ZlhlVVlNYU1naHZ3cTcwdGF2QTFzS3J2NDNmNHB1OTJmRkVFMkNrYTdGa0hS?=
 =?utf-8?B?WmFEbjV2U09HQXlXOTRGTFNXRHpjV2hJM2t5eFFLc1NEemNJS3JFWEU3Q0E0?=
 =?utf-8?B?QjUvUTI2c2RnTmxrWVcrZ1krd0dBOXo0QVpBeFZsR2xiVUZUUUozL3JnRGp5?=
 =?utf-8?B?QjNCMkMzR0tiaEpidjlIeklNVCsvTUdqZW5qcDVTS2tGR2hsVjg0RXlsTzg4?=
 =?utf-8?B?M2h3TnMyc1JYU2V6cUFQNXdBMFowRC9sRVpQZGVRdUlNZjNuN1ZuVDE1WnpX?=
 =?utf-8?B?cmM5VmJJTmQxL2c5YzJIeENhUC9KQTFXN0ZOWkNvN0xlbzJ1SlRxQS93Ykor?=
 =?utf-8?B?ZlJ3NjVlTy9iNkFoZ0dqQjZadVNFWTJMVTR4WHEySEN1MktSVGNleDBqMjFF?=
 =?utf-8?B?dU1LcEpuSkpIUVJyOXNQdWp5TFl2TFhKKzFTY3VZN3FYT09sNGl3K3BrK0x0?=
 =?utf-8?B?TlhJSjFsYTExNGxTbXdQMkh5cThxZE5LMVpFNExYR3pVa3FKc21rblJ3MkRk?=
 =?utf-8?B?TXVnSGJtMnJ4TGJKaXk0cnA5bUQxQnR5SXVHTWk4M0pRU2xRTFQvaWJ6MGVy?=
 =?utf-8?B?bVdaRytqeFRESG44eEJQRWlUeStUWkZlcTJ5YjhsZTRIRmlOL2U5MXgvdDlS?=
 =?utf-8?B?L05jWWQvZ1p1SlZaaiswRjNQYkhINWR1UGNvR3hueUNPcml0RWh1LzRhVUxK?=
 =?utf-8?B?L2FXWnZkaTdGYm9ENEFQTTZCSklORmtvUWZYbmVKUTNOYzl4NVIxSTJEWU4v?=
 =?utf-8?B?SlRkVVNMMzNLbWNTVC9ZTmdrTkgyMDBDbXRTZ1VBYnRPa1R4ZVBUMzJrMFRX?=
 =?utf-8?B?V1JMdHZNTGZZejNmWUZmUlRiTng2WnhreG5TRW8yTkkybk51L1NVaWUyOXUw?=
 =?utf-8?B?K2pHamEwRGVIbW1xRmpwQTE3VGp0UmdkRFpBTVBDendOL1NKVG82c1hJU3Fz?=
 =?utf-8?B?L0kxTENrUlJJb0x4eXlZNXY2dzVaYlJDMUhndTArNHB3Q1h5OVRGK0Nmditv?=
 =?utf-8?B?RHA0U29Ba29zbkFrZ3cwR0ltVU1hOFNYTEZYWTZ4ODRwWWFnUkFSdWNVczZx?=
 =?utf-8?B?YUVNZkhyZjVWbnZMOTFiSndzOEJBS2FBRHJxUVExY0FwTEtkdjM1Yld6Um1D?=
 =?utf-8?B?UlgxT21hUHI5TDZ4ZG1GdDUrTTEwWDJ1VFh2TmpWQ1RTUnIyUnNVVDV5TFFo?=
 =?utf-8?B?TUF0UGVlSzVNcDhyTjhLQkRMUCtTUWZwdjhDY3FmUGpNZ2Z0MTlLN0s0d3Ir?=
 =?utf-8?B?QTJQMWUvcjhVSjNxYUFQOFQ0MDBlOUVEM0F6ZzRkanZ1TlZQdTZBaE5OV1l0?=
 =?utf-8?B?QlY4aUozQjhDaU1lMHU3UWUzVnFCU3NMbVVORVdScTJsM3dHVlJGek5UeDl3?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fad72253-a93b-43b2-1832-08dc689d0476
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 22:37:57.6874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jguwarryjYApmOSmaWD+o3pRflq6Hml8k2ffkS2FrER9pMGS88jjezT3NGtCEnvumciTMBWCGH/awQt8r2Gm1zt0m4b6TgPyGmDwcIxwyA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
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

On 4/10/2024 02:40, Tejas Upadhyay wrote:
> RCS/CCS are dependent engines as they are sharing reset
> domain. Whenever there is reset from CCS, all the exec queues
> running on RCS are victimised mainly on Lunarlake.
>
> Lets skip parallel execution on CCS with RCS.
But why? In a real-world scenario, this should not happen.

As per earlier comments, before changing the test we need to understand 
more about what is actually happening and why. The previous descriptions 
of what is failing and on what platforms do not make sense.

Also, the request for more explanation was not just for the email 
discussion but to actually add that description into the test. I even 
explicitly asked for that in one of the review emails. The 
xe_exec_threads executable reports 114 separate subtests, none of which 
has any documentation at all. The comments within the code basically 
come down to saying 'wait for completion' immediately before waiting.

At one point Matthew Brost stated:
 > If the HANG flag is set, 1 of the exec queue per thread will insert a
 > non-preemptable spinner. It is expected the GuC will reset this exec
 > queue only. Cross CCS / RCS resets will break this as one of the
 > 'good' exec queues from another thread could also be reset.

To which my replay was that if only one spinner is non-pre-emptible then 
all the other spinners should get automatically switched out prior to 
the reset being triggered and should therefore not be killed. The 'good' 
queues should survive and be totally oblivious to the reset occurring.

So either the above description is inaccurate and all the spinners are 
actually non-pre-emptible. In which case, if that is not the intention 
of the test then the correct fix is to make them pre-emptible and it 
should then pass. Or if the description is accurate, then the test is 
correctly failing because it has found a bug which needs to be fixed. 
Either way, the correct solution is not to simply skip the failing case 
and hide it under the rug.

John.


>
> It helps in fixing following errors:
> 1. Test assertion failure function test_legacy_mode, file, Failed assertion: data[i].data == 0xc0ffee
>
> 2.Test assertion failure function xe_exec, file ../lib/xe/xe_ioctl.c, Failed assertion: __xe_exec(fd, exec) == 0, error: -125 != 0
>
> V3:
>    - Check victimization reset domain wise irrespective of platform - Lucas/MattR
> V2:
>    - Add error details
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   tests/intel/xe_exec_threads.c | 43 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 8083980f9..24eac39de 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -710,6 +710,24 @@ static void *thread(void *data)
>   	return NULL;
>   }
>   
> +static bool is_engine_contexts_victimized(__u16 eclass, unsigned int flags,
> +					  bool has_rcs, bool multi_ccs,
> +					  bool *ccs0_created)
> +{
> +	if (!(eclass == DRM_XE_ENGINE_CLASS_COMPUTE && flags & HANG))
> +		return false;
> +	if (has_rcs) {
> +		return true;
> +	} else if (multi_ccs) {
> +		/* In case of multi ccs, allow only 1 ccs to run HANG test*/
> +		if (*ccs0_created)
> +			return true;
> +		*ccs0_created = true;
> +	}
> +
> +	return false;
> +}
> +
>   /**
>    * SUBTEST: threads-%s
>    * Description: Run threads %arg[1] test with multi threads
> @@ -955,9 +973,20 @@ static void threads(int fd, int flags)
>   	bool go = false;
>   	int n_threads = 0;
>   	int gt;
> +	bool has_rcs = false;
> +	bool multi_ccs = false, has_ccs = false, ccs0_created = false;
>   
> -	xe_for_each_engine(fd, hwe)
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
> +			has_rcs = true;
> +		} else if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
> +			if (has_ccs)
> +				multi_ccs = true;
> +			else
> +				has_ccs = true;
> +		}
>   		++n_engines;
> +	}
>   
>   	if (flags & BALANCER) {
>   		xe_for_each_gt(fd, gt)
> @@ -990,6 +1019,18 @@ static void threads(int fd, int flags)
>   	}
>   
>   	xe_for_each_engine(fd, hwe) {
> +		/* RCS/CCS sharing reset domain hence dependent engines.
> +		 * When CCS is doing reset, all the contexts of RCS are
> +		 * victimized. Also in case of multiple CCS instances
> +		 * contexts running on other CCS engine are victimized.
> +		 * so skip the compute engine avoiding parallel execution
> +		 * with RCS and other CCS.
> +		 */
> +		if (is_engine_contexts_victimized(hwe->engine_class, flags,
> +						  has_rcs, multi_ccs,
> +						  &ccs0_created))
> +			continue;
> +
>   		threads_data[i].mutex = &mutex;
>   		threads_data[i].cond = &cond;
>   #define ADDRESS_SHIFT	39

