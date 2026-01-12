Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117F7CF45D4
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 23:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A2210E1DA;
	Mon, 12 Jan 2026 23:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gN0bWVEh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC4910E1DA
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 23:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768260991; x=1799796991;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EAnO6X3qqrJZp3GO5Gmp0swF1sKM1AyEf+df3JivS7c=;
 b=gN0bWVEhsm7padyzgdDNOQaMgOVPF6sS1pXGQsgEFn35Si9zHBJcaXR5
 5ZGJO997+lSRHIbJvAhIQy6epfYnfGObzcJVjd3h1P/yE+jkwhRvNEoiA
 8sH7xtNi5QQwXw7Khwp5mCA3u9xO7NU0CPEBQFD4Hw8vx6IjL1HAf9DNY
 LuygDiHhO7FWgaffKvnQGUnqGGBHn9NE9SDUrxRrqEkov3i3uhgj4hd3n
 /1oE3zjh+O9fTghRxvcQ2g+TvnpQNngGnsyf57jRj3Z6vSPXtE+jaT97X
 iIjycCINQyxHJFDwFFWMwVg51ZasZRWNVFGFSbmLyXI4ZN/XegobTab43 Q==;
X-CSE-ConnectionGUID: xeZb80QMS8+d06omt9SE/A==
X-CSE-MsgGUID: I0PG/fMTRvSLTyvbwMZJRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73385827"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="73385827"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:36:30 -0800
X-CSE-ConnectionGUID: TwAmTC4mST2noboWr4IRjA==
X-CSE-MsgGUID: BtxutJ2bRvO+W3MMMUoRYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="209057398"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:36:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 15:36:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 15:36:29 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 15:36:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlLiQzo7R/Smeizf6LfPFi8DBc7zKegkirz/twNxX3aaDYVRf305ZuDx5B4CFWDXK7jdHGJgN9ychKgzfL0n1Pfvq/sH6EmEKu70KJtcL+TcAmapN7dq4Qap1SPGpehfk7QfYRAEBuxqoBEOGKFjjjuMVrIJ8kICRwEe/TxwVs1R0s8UhWgaGB91C9BQFBaIqwVf74KS7wwslibNy8muSzoa0t0HngOtZNAZ1stb/qHAOtNrhzwIoXbWFWtuB77Su7U2jr10H5MYaqMHcRGqjFhXgh+nCAIcTlo7TCK2CZtTNdD+fPLW5RMeg1rZT+eimmc6DVvkrFF3/sXFCCYW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guanRONRx+Ovy1hbExjTWIGz1/juMdrIKC9DDLjSJvw=;
 b=BKPr0k1q0XYY1t6phrx62ovf1EYDZceE6v0Z7a6mUY++aw8I8YXPiyW0se42WuNGTjqzp09TIXk62xLZnvGoQ7MBJ93vfDQdkNJ9FtLjssKDStjKFja7uCd0Nk5gvtLrmx/GcUSAvbboO9WF6KOfuhS+vLZO5JrKlFq0K1QrZcpxiPt19E9PJS0efa8KkPS7gWMx/lHrvpHqctRUWMi4mT1clIzqA0/Vs29H+Ud0ICXWfB1BZbNyy9TzmD7+xTeUpCcMeDdlhImts3LUwHRnnR7XlqpF5vn2kLVcLVcsTdZbEj58h1YLSwppPQTA6HKdgl/HewffA5H0YLv/WMcFOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM6PR11MB4641.namprd11.prod.outlook.com (2603:10b6:5:2a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 23:36:27 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 23:36:27 +0000
Message-ID: <ba87370f-53fe-49e4-b54c-ed606518d6bc@intel.com>
Date: Mon, 12 Jan 2026 15:36:25 -0800
User-Agent: Mozilla Thunderbird
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251223085129.412961-1-vinay.belgaumkar@intel.com>
 <20251223085129.412961-2-vinay.belgaumkar@intel.com>
 <471a7fb0-532b-43db-bcf9-fa2320ac21a2@intel.com>
Content-Language: en-US
In-Reply-To: <471a7fb0-532b-43db-bcf9-fa2320ac21a2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM6PR11MB4641:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d411398-2d79-4499-39f3-08de523367d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmVPbWlzSzZRTzBRSXpwRmZiWjhmRWhXM1o2b0FxMDJkbStCK3ZjQVBIZkE1?=
 =?utf-8?B?V3FxSTBSY1B1UDcxdmFzelh6aEViWWdqSDIzNXFxTkhyalAyMUsrVmdobWE2?=
 =?utf-8?B?TkcwM01xZ1kwS082WmxiTGRBN3BYWEt2L0IrUHBIYTVmSk81MXVSNmJrN3hn?=
 =?utf-8?B?T2h5cEFiTS9TdlNWbDdhMWVCRjZqd3dpVXdvUUdDZENGVnhxVWgvZFp4c3lw?=
 =?utf-8?B?RkZMQ1dYb1JzQ1pUZmxONE5aOTREQzJNbjBPV2plZ3ZIeDZKSEIwWGpvdzJi?=
 =?utf-8?B?Qk5KMGJwNWNzUnpOcDBCSHp6bG8xWnNQc2QrKzNCeTFIMjJad2wrdFA2VUsv?=
 =?utf-8?B?V1NZRmRDZEp0VGU5ZGE4ZHhvVFYvQmdjYnVmN0tWRUdSTGpxQ2ZEa3NBa1hr?=
 =?utf-8?B?ZDJCSlIxVG9DQU5jSFNDYWFicDVaSmpuaU05VnE4N0VVeENQbmZ5ZGlRZitl?=
 =?utf-8?B?QUJsL0pWeVNGbGV3NFVXMitRSEwvdTA4aFBaSGcxaUZwY0srYmNRb1NGbm16?=
 =?utf-8?B?eGZVRDl5VHRPZGcrTGtYbG11Z2EvRzZQV0FQai9Bd1JhU1dKUlpmMkFPMmd0?=
 =?utf-8?B?WVcrNVllRURqd3RTdTgwVStRNHlQL3Uyb3lpaXJ1ZUdaczR4bnE2MVpRQnNm?=
 =?utf-8?B?RDVPbllHczNnZXVkcVd3TzVMN1MzUG14MWppWmh6MlFOVWRDVkxJL2hpZG9C?=
 =?utf-8?B?QWh1Mlh3dnM3bmRYTHE5RkNWWTUyOERWNTJ1azhta05SUFNLbVRkQ05IZEVk?=
 =?utf-8?B?empuU0o2WmRpWVJteTNWVU8yUlhZR3JMQVEvWW1mK3hjNElsRDBPZCs1M1dX?=
 =?utf-8?B?eGhUaUIwY0ZvM1oxb0xTZzZyMDc5V2VrelF5RHJiUzh3SkhaUXFERXlzKy9U?=
 =?utf-8?B?aU5Mb0RnVEFCdktvdm1oa2tuM2FwVDZjREtnT1R2cWtScnQzakVyTlNHeTVF?=
 =?utf-8?B?akxZVVNGRVBWdSszZkhFYUVOdDRzajM4ZWRtZ0RDaUxoZ3pxc0FOOTdnZkZl?=
 =?utf-8?B?V3k1ZnRveklrR3dCOVlmMFljSjhqU1lGUTF4RnNhcGZwVmxWa25tTVEwTVZN?=
 =?utf-8?B?aG0xNE5EYXhxbm1wL1o5ZjM4TmxRTFVFb3pOa09CZTVSZG01OURzN21EZzZl?=
 =?utf-8?B?NUtvSUNDTWRvWEJNNXVRREkrRW5vQzIrN2MvYWI4R0Z0T1BnRzg4NkNvTnFz?=
 =?utf-8?B?dDhDdFZpMklTTG51eEhKN2VZbHZNT0RWcmg1WWh6bTlqbEczVkZYbkF3alhK?=
 =?utf-8?B?RDlYOGVnYkJQM1ZFcHMyOXRWQmprMnlPUWlDN3N0cmpNWW1PK1FOZTFlN1Zn?=
 =?utf-8?B?OW9TbHdtd0tFWXd4TUZEWHJEbUFGOFZzVlBBbDF6bVJpNUZST0dMY28xUHkw?=
 =?utf-8?B?M3NEcTg1bStpNXQ3OHB4MjNpSWhXNG94V1Q4VUZjV3F5bktXejJjajNDZzNi?=
 =?utf-8?B?RjN4cnU2TTJyT2xQTFZpcXdIckM3ZFF0NzFLSHB6UFBRN21rVm00VDhDVktI?=
 =?utf-8?B?K2NRWVNtNXkxN203ei8rR3doVmdKdmlENm8rYnZnV051QVBCYzhoL0x3RHM2?=
 =?utf-8?B?OXFGU00yMUw3Y05MSnNtcVVYTFhCRUkxbWVJWDlWRWQzYll6Q3JhRitsMjRl?=
 =?utf-8?B?WnlTWXhCZDlTUXg0ZUVPV2hxSHZSOEJEUS81N0U4bHVmYUJmMWg5UTNZZ3Fm?=
 =?utf-8?B?K0RNNXg2a0VNQ21ZMkR6T3RmMkU0VVdneG5OMUYrdU82VmNzRmhxVFVtWUk2?=
 =?utf-8?B?UmswekI1NE4xaFZjdTFvb1NXN2QwdzlyMnlyTXliWXoxN0lGKzFOYWNmMkJk?=
 =?utf-8?B?RlVkREJLYkt4NndFcnZGODlFaDlMV24reXJvcE9ZQzJ5TitWcUZjL1Uyb3pJ?=
 =?utf-8?B?UG52aENibVVkVzJ2MW94S3VZQnArU29YaGN5Z2llSUgwNjRLa1AySi9HQ2NE?=
 =?utf-8?Q?GC07pEzWLx+DNdpvOWNgnrFNJ5R6nuwt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0M0Ly9QU2N6NnRXWkpQZVdsUVhaVmFTWmEwUjJUaWFhWitrb20wZC91MGVJ?=
 =?utf-8?B?WGFGbklLZGxLWjhPZXFGYWQzNmJ0U2h1OWxwbXNJUENUdGNDRm92VmRTZnJq?=
 =?utf-8?B?Mm1JSm5vTFZMUVJ4Y3dMUmoyZ2FHd1Q2VGtRUDE1KytjQk9nSjNyNTc0V2Vi?=
 =?utf-8?B?R2xWZjFVVEx3UXVQb1JaT1Arb1NEN1pyUXVCVGYrSk1ZMVF6eldSRmNrVzJs?=
 =?utf-8?B?WHlzUFZvaE9uZmdWOEZKdS8vTGRjMHpSVC9iWkIwQWVZVjZMcWhqZDVOUWFs?=
 =?utf-8?B?L2dTK0NkdHVpUzY4c05DZjhOdldlUzAwTFhzd0c5Y2Z2b3J4Z1JJb3p6QTIw?=
 =?utf-8?B?Kzkrb0RzcVRlZWRvTFhOUG96WHltUGw4ZXpNd1Z5MzlRUDRRNjQyczJqWWRF?=
 =?utf-8?B?NDM5M3dDWHdmRVhuajE5N1lTcXIxN2xSV0RrWFUvZjNMWDk1WFc2WllwRGN6?=
 =?utf-8?B?SzVVWmJiUHZwbkE5VEN0YllId3FJNFVlcUtQYzlUckhTRTJIa3JUajdIcHlX?=
 =?utf-8?B?MHc3MmxzbjJ2LzRpL0V5aHdia2dOOFh1N3dWUlV3RHNEZnhhaHVyVjFvby9r?=
 =?utf-8?B?RkZsOWlqdGRBOGZaTkVtcXdFUHE0UDU3R2FKV25QYVdKMGJhakovRmJmS0pw?=
 =?utf-8?B?RERkNHg3WXExbFprSHhoZTdzVVIyL2RoSHdnVDYxa2JCYW9UaGdLcEJQMWdr?=
 =?utf-8?B?YmRtaW9HUnZlRlJJQ1NJbnZKV1c1YVlkZVcvc0YxTmFzUVczQ2toemdISzg0?=
 =?utf-8?B?MmFtVlVYQnV2QXh4MXMwOTVPL3J6MjJhKzFyMC9GaE1Rb3k4QXJGc2pzVlNM?=
 =?utf-8?B?ajZYZzZPVDNFeUx0dzNsdU5ENUYxWG81VWVwSTlKaHVpLzhDb2ZGUytvQ205?=
 =?utf-8?B?N1FDR2xZMjJaZGQyT3JOUW4yN1dBYW9HSVBDTzJHZEVzQTlWZGx4M1JhV2NS?=
 =?utf-8?B?ZWJxaWQ5UndVVm9wYkxVSDh1OWh3dWpmaGpmcHhyN280T1NJRFdTc3U3ZVhY?=
 =?utf-8?B?OTljb3ZOTGdYcDdDM1NZREN4dG9sNm9NMXhTbWtzSnZPRSt4eUpIeWVZSVF6?=
 =?utf-8?B?a0ZkbmFtY1pkL1lDdmNUT04yL2JCNGZwSlRCUEk1V29BWnBwSDJ5WnhvSG01?=
 =?utf-8?B?K0FoU0hRK3pDRFRSRkxXKy8yalVBZCtoQlV6WHdROENaaVlaelhwckxmTitG?=
 =?utf-8?B?NlRkNDFDbXdhZFZQazlzYWZudm5RWXh5ODlJSzEwWXRoM09zV0FDOGNUakd3?=
 =?utf-8?B?bHVIVHdqYjJjNVp3YUNJbUJDRjZPcEJMOGdlaGw3VnpSN0xJRVRmZEdvZGV6?=
 =?utf-8?B?aWtDblFwZ21CZUU5d3ROeGRPVVM3WnBub1dNaUZBMUZvNXp2M3VFVXM2ejB5?=
 =?utf-8?B?eDNGNnU1MzQ2b3plQ0d2SVhnbUxydzVRbkN5Uk1qTHhoZDhZUmdSdG0xd1J2?=
 =?utf-8?B?MzFueGN6YUxWM1p6SU5PMVYvem5JdkVrNVEwa2tTZkNJR3hjR2YyM2ViYk9P?=
 =?utf-8?B?WnlKNDBTVi9QTTZtOUNsUWF3NE9hZklTS1RvMS9aRGpvZENWUWp5RkE2TGwr?=
 =?utf-8?B?VzZsMEdZSlh0WHFDbFBmSDM1angvUzhrYUNvWmpkcDR6UXpDbE92cEpyaEtL?=
 =?utf-8?B?ajhMTTF5QWdvcWJOejFCWU5iK1RhSHlmeEdVL0FhMmZlaWsvbGtKYm50dWtL?=
 =?utf-8?B?TUk4UjNha0JsbVFWcWJJY2VsK3dWVzhTR0xXNUY4UEJQQXgvMlA2VnlFQW1a?=
 =?utf-8?B?TFVPUkowVmVjS01Qakh0c25WQjRtMjZ5U1Z6dmJtSXlBNFZjS0hWWTRPeWJ0?=
 =?utf-8?B?dFFDTDBLM2t2dDc4NWhPR0VTeEx0U3AwRjhLZmw5UFVyamtURGQ3SVVmcWRw?=
 =?utf-8?B?YXdOamRlbWFSci9PK1hGb2lvNWhmNjhNQjRFVTB3a1hnclNpUlJlYjA2WFBM?=
 =?utf-8?B?eWFMbVNNcmlYV20xc1BRVlh5ZHFFQWJBMlVRaStDS1pVRVc3YkRjYmt0Lzhv?=
 =?utf-8?B?cWp0SFNYZ2pqODA5OGo5ZTFpTkptRjhray95VUphMUM5ek9OeFJaY1N6eWdp?=
 =?utf-8?B?WlA1M3NpakY5anB0SFlqeXFwS2RyWHZoM0k3TmVxSWFaMzMwOTNPc0lHSU9T?=
 =?utf-8?B?dm1IVlE1cU1wZkNTNG5uaGI4R25sVHhYYTRTNVRUd2w4STZBejgxTWdPVElP?=
 =?utf-8?B?Sm4wWFRidDBraW9PZlFHY0cxZHd2WGg3OGFVVTNDa3MvMlNlZktQT0J1NmVP?=
 =?utf-8?B?ZDJmcmJkQUhTSFJMUWJ3VEQ4ZWttaURUK2h1MHJjNGRGSzB6SW54WW13UnhC?=
 =?utf-8?B?SHFiakdNUjdMMTB3M3lvTlB3VksxeDlTemIwRTZWcUx3OWVteHVjZ0JNTHlw?=
 =?utf-8?Q?gm5N4kq+pI4F/DbY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d411398-2d79-4499-39f3-08de523367d5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 23:36:27.3979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLEua9DHU8pCu2mHVv5ZFVPRdxQQib82d7Vw6kPfoxFb794u9uSf6auqWjG25uUZhwXhTRrdrc/a26AibmeDGtKH8vOIY1HbUpv8MQO/WXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4641
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


On 1/6/2026 9:50 PM, Riana Tauro wrote:
> Hi Vinay
>
> On 12/23/2025 2:21 PM, Vinay Belgaumkar wrote:
>> Move enable/disable GuC RC logic into the new file. This will
>> allow us to independently enable/disable GuC RC and not rely
>> on SLPC related functions. GuC already provides separate H2G
>> interfaces to setup GuC RC and SLPC.
>>
>> v2: Comments (Michal W), remove duplicate c6_enable calls from
>> xe_guc_pc.
>>
>> v3: Clarify crosss interactions between xe_guc_rc and xe_guc_pc
>> (Michal W)
>>
>> v4: More comments (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile    |   1 +
>>   drivers/gpu/drm/xe/xe_gt.c     |   1 -
>>   drivers/gpu/drm/xe/xe_guc.c    |   6 ++
>>   drivers/gpu/drm/xe/xe_guc_pc.c |  68 +++-------------
>>   drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
>>   drivers/gpu/drm/xe/xe_guc_rc.c | 139 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_rc.h |  15 ++++
>>   drivers/gpu/drm/xe/xe_uc.c     |  10 +--
>>   drivers/gpu/drm/xe/xe_uc.h     |   1 -
>>   9 files changed, 178 insertions(+), 64 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 89dc48cd73e2..928fdb925c13 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>>       xe_guc_log.o \
>>       xe_guc_pagefault.o \
>>       xe_guc_pc.o \
>> +    xe_guc_rc.o \
>>       xe_guc_submit.o \
>>       xe_guc_tlb_inval.o \
>>       xe_heci_gsc.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 313ce83ab0e5..9ee328aa6579 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -822,7 +822,6 @@ static void gt_reset_worker(struct work_struct *w)
>>       if (IS_SRIOV_PF(gt_to_xe(gt)))
>>           xe_gt_sriov_pf_stop_prepare(gt);
>>   -    xe_uc_gucrc_disable(&gt->uc);
>>       xe_uc_stop_prepare(&gt->uc);
>>       xe_pagefault_reset(gt_to_xe(gt), gt);
>>   diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 44360437beeb..beac4050c4dc 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -35,6 +35,7 @@
>>   #include "xe_guc_klv_helpers.h"
>>   #include "xe_guc_log.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_guc_relay.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_memirq.h"
>> @@ -869,6 +870,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>       if (ret)
>>           return ret;
>>   +    ret = xe_guc_rc_init(guc);
>> +    if (ret)
>> +        return ret;
>> +
>>       ret = xe_guc_engine_activity_init(guc);
>>       if (ret)
>>           return ret;
>> @@ -1609,6 +1614,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>>       if (!IS_SRIOV_VF(guc_to_xe(guc))) {
>>           int err;
>>   +        xe_guc_rc_disable(guc);
>>           err = xe_guc_pc_stop(&guc->pc);
>>           xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: 
>> %pe\n",
>>                  ERR_PTR(err));
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 54702a0fd05b..3e7173130066 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -92,6 +92,17 @@
>>    * Render-C states is also a GuC PC feature that is now enabled in 
>> Xe for
>>    * all platforms.
>>    *
>> + * Implementation details:
>> + * -----------------------
>> + * The implementation for GuC Power Management features is split as 
>> follows:
>> + *
>> + * xe_guc_rc:  Logic for handling GuC RC
>> + * xe_gt_idle: Host side logic for RC6 and Coarse Power gating (CPG)
>> + * xe_guc_pc:  Logic for all other SLPC related features
>> + *
>> + * There is some cross interaction between these where host C6 will 
>> need to be
>> + * enabled when we plan to skip GuC RC. Also, the GuC RC mode is 
>> currently
>> + * overridden through 0x3003 which is an SLPC H2G call.
>>    */
>>     static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
>> @@ -253,22 +264,6 @@ static int pc_action_unset_param(struct 
>> xe_guc_pc *pc, u8 id)
>>       return ret;
>>   }
>>   -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
>> -{
>> -    struct xe_guc_ct *ct = pc_to_ct(pc);
>> -    u32 action[] = {
>> -        GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
>> -        mode,
>> -    };
>> -    int ret;
>> -
>> -    ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> -    if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
>> -        xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
>> -              mode, ERR_PTR(ret));
>> -    return ret;
>> -}
>> -
>>   static u32 decode_freq(u32 raw)
>>   {
>>       return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
>> @@ -1050,30 +1045,6 @@ int xe_guc_pc_restore_stashed_freq(struct 
>> xe_guc_pc *pc)
>>       return ret;
>>   }
>>   -/**
>> - * xe_guc_pc_gucrc_disable - Disable GuC RC
>> - * @pc: Xe_GuC_PC instance
>> - *
>> - * Disables GuC RC by taking control of RC6 back from GuC.
>> - *
>> - * Return: 0 on success, negative error code on error.
>> - */
>> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>> -{
>> -    struct xe_device *xe = pc_to_xe(pc);
>> -    struct xe_gt *gt = pc_to_gt(pc);
>> -    int ret = 0;
>> -
>> -    if (xe->info.skip_guc_pc)
>> -        return 0;
>> -
>> -    ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
>> -    if (ret)
>> -        return ret;
>> -
>> -    return xe_gt_idle_disable_c6(gt);
>> -}
>> -
>>   /**
>>    * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>>    * @pc: Xe_GuC_PC instance
>> @@ -1217,9 +1188,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>           return -ETIMEDOUT;
>>         if (xe->info.skip_guc_pc) {
>> -        if (xe->info.platform != XE_PVC)
>> -            xe_gt_idle_enable_c6(gt);
>> -
>>           /* Request max possible since dynamic freq mgmt is not 
>> enabled */
>>           pc_set_cur_freq(pc, UINT_MAX);
>>           return 0;
>> @@ -1257,15 +1225,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>       if (ret)
>>           return ret;
>>   -    if (xe->info.platform == XE_PVC) {
>> -        xe_guc_pc_gucrc_disable(pc);
>> -        return 0;
>> -    }
>> -
>> -    ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>> -    if (ret)
>> -        return ret;
>> -
>>       /* Enable SLPC Optimized Strategy for compute */
>>       ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>   @@ -1285,10 +1244,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>>   {
>>       struct xe_device *xe = pc_to_xe(pc);
>>   -    if (xe->info.skip_guc_pc) {
>> -        xe_gt_idle_disable_c6(pc_to_gt(pc));
>> +    if (xe->info.skip_guc_pc)
>>           return 0;
>> -    }
>>         mutex_lock(&pc->freq_lock);
>>       pc->freq_ready = false;
>> @@ -1310,7 +1267,6 @@ static void xe_guc_pc_fini_hw(void *arg)
>>           return;
>>         CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), 
>> XE_FORCEWAKE_ALL);
>
> The forcewake can be removed too. Frequency registers don't need a 
> forcewake
The usual ones don't. But this one needs to write to 0xA024 as part of 
pc_set_cur_freq() before setting curr_freq. 0xA024 is not shadowed, so 
will need fwake. Although, a GT force wake is sufficient here.
>
>> -    xe_guc_pc_gucrc_disable(pc);
>>       XE_WARN_ON(xe_guc_pc_stop(pc));
>>         /* Bind requested freq to mert_freq_cap before unload */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 0e31396f103c..1b95873b262e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -15,7 +15,6 @@ struct drm_printer;
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>>   int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum 
>> slpc_gucrc_mode mode);
>>   int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c 
>> b/drivers/gpu/drm/xe/xe_guc_rc.c
>> new file mode 100644
>> index 000000000000..b7dab3158060
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
>> @@ -0,0 +1,139 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <linux/device/devres.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_actions_slpc_abi.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt.h"
>> +#include "xe_guc.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc_ct.h"
>> +#include "xe_guc_rc.h"
>> +#include "xe_pm.h"
>> +
>> +/**
>> + * DOC: GuC RC (Render C-states)
>> + *
>> + * GuC handles the GT transition to deeper C-states in conjunction 
>> with Pcode.
>> + * GuC RC can be enabled independently of the frequency component in 
>> SLPC,
>> + * which is also controlled by GuC.
>> + *
>> + * This file will contain all H2G related logic for handling Render 
>> C-states.
>> + * There are some calls to xe_gt_idle, where we enable host C6 when 
>> GuC RC is
>> + * skipped. GuC RC is mostly independent of xe_guc_pc with the 
>> exception of
>> + * functions that override the mode for which we have to rely on the 
>> SLPC H2G
>> + * calls.
>> + */
>> +
>> +static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
>> +{
>> +    u32 action[] = {
>> +        GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
>> +        control,
>> +    };
>> +    int ret;
>> +
>> +    ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>> +    if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == 
>> -ECANCELED))
>> +        xe_gt_err(guc_to_gt(guc),
>> +              "GuC RC setup %s(%u) failed (%pe)\n",
>> +               control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
>> +               control == GUCRC_FIRMWARE_CONTROL ? "FIRMWARE_CONTROL" :
>> +               "UNKNOWN", control, ERR_PTR(ret));
>> +    return ret;
>> +}
>> +
>> +/**
>> + * xe_guc_rc_disable() - Disable GuC RC
>> + * @guc: Xe GuC instance
>> + *
>> + * Disables GuC RC by taking control of RC6 back from GuC.
>> + */
>> +void xe_guc_rc_disable(struct xe_guc *guc)
>> +{
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +
>> +    if (xe->info.skip_guc_pc)
>> +        return;
>
> guc_rc_start enables host c6 when guc_pc is skipped. So don't we have to
> disable it in this call?
Yup, will update and cleanup the general path.
>
>
>> +
>> +    if (guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL))
>> +        return;
>> +
>> +    XE_WARN_ON(xe_gt_idle_disable_c6(guc_to_gt(guc)));
>> +}
>> +
>> +static void xe_guc_rc_fini_hw(void *arg)
>> +{
>> +    struct xe_guc *guc = arg;
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +    if (xe_device_wedged(xe))
>> +        return;
>> +
>> +    CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>> +    xe_guc_rc_disable(guc);
>> +}
>> +
>> +/**
>> + * xe_guc_rc_init() - Initialize GuC RC
>> + * @guc: Xe GuC instance
>> + *
>> + * Initializes GuC RC feature.
>
> This function does not initialize GucRC. I think we can combine both 
> init and start as a single function.
Yup, will just stick to enable/disable.
>
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_rc_init(struct xe_guc *guc)
>> +{
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +
>> +    xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(xe));
>> +
>> +    if (xe->info.skip_guc_pc)
>> +        return 0;
>> +
>> +    return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, 
>> guc);
>> +}
>> +
>> +static int xe_guc_rc_enable(struct xe_guc *guc)
>> +{
>> +    return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
>> +}
>> +
>> +/**
>> + * xe_guc_rc_start() - Enable GuC RC feature if applicable
>> + * @guc: Xe GuC instance
>> + *
>> + * Enables GuC RC feature.
>
> Function name can be xe_guc_rc_enable to pair with disable

Agree.

Thanks,

Vinay.

>
> Thanks
> Riana
>
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_rc_start(struct xe_guc *guc)
>> +{
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +    xe_gt_assert(gt, xe_device_uc_enabled(xe));
>> +
>> +    CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>> +    if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
>> +        return -ETIMEDOUT;
>> +
>> +    if (xe->info.platform == XE_PVC) {
>> +        xe_guc_rc_disable(guc);
>> +        return 0;
>> +    }
>> +
>> +    if (xe->info.skip_guc_pc) {
>> +        xe_gt_idle_enable_c6(gt);
>> +        return 0;
>> +    }
>> +
>> +    return xe_guc_rc_enable(guc);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h 
>> b/drivers/gpu/drm/xe/xe_guc_rc.h
>> new file mode 100644
>> index 000000000000..f2a6ae7f05d8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_RC_H_
>> +#define _XE_GUC_RC_H_
>> +
>> +struct xe_guc;
>> +
>> +void xe_guc_rc_disable(struct xe_guc *guc);
>> +int xe_guc_rc_start(struct xe_guc *guc);
>> +int xe_guc_rc_init(struct xe_guc *guc);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 157520ea1783..300b99acbd51 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_guc_engine_activity.h"
>>   #include "xe_huc.h"
>>   #include "xe_sriov.h"
>> @@ -216,6 +217,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>       if (ret)
>>           goto err_out;
>>   +    ret = xe_guc_rc_start(&uc->guc);
>> +    if (ret)
>> +        goto err_out;
>> +
>>       xe_guc_engine_activity_enable_stats(&uc->guc);
>>         /* We don't fail the driver load if HuC fails to auth */
>> @@ -244,11 +249,6 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>>       return xe_guc_reset_prepare(&uc->guc);
>>   }
>>   -void xe_uc_gucrc_disable(struct xe_uc *uc)
>> -{
>> -    XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
>> -}
>> -
>>   void xe_uc_stop_prepare(struct xe_uc *uc)
>>   {
>>       xe_gsc_stop_prepare(&uc->gsc);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index 5398da1a8097..255a54a8f876 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -12,7 +12,6 @@ int xe_uc_init_noalloc(struct xe_uc *uc);
>>   int xe_uc_init(struct xe_uc *uc);
>>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>>   int xe_uc_load_hw(struct xe_uc *uc);
>> -void xe_uc_gucrc_disable(struct xe_uc *uc);
>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>>   void xe_uc_runtime_resume(struct xe_uc *uc);
>>   void xe_uc_runtime_suspend(struct xe_uc *uc);
>
