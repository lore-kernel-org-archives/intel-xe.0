Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C15CFB45B
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 09:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6D610E35C;
	Tue,  8 Oct 2024 09:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGCt+Rb/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30FE10E35C
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 09:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728379101; x=1759915101;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GzHdu+ICsM3X4mSMouOumA+vWCGNM2shAE1ruBrZwOQ=;
 b=KGCt+Rb/ny5+MT7L+0QevH6O3lGMFYt2ow8zOFqlmesNlln5ypCaKTbk
 lnVWwQ4i7YIeEeOhflrH8PoxgopeflDQ9qBuiAGXvjqMbPdACsudf0l+g
 UD4vlxZgZYjEzq3OxyxZ3CQIeSLm3B/VDNLIYAbVNAQO0P2DvMGEOxx0L
 ywEJixlZvvy1BmbktGchKqlL56oW2895NG0QOX8W6TGyFRt9fELE0qnWR
 gQXabxvrbDzzZPT2qMZS9OYnI5Q1SNYhAi28S/rY2ESElJin52DyYDblF
 s3YBGXBJu6vwBj38D+UYS+dgzRI6Yl87XYHnn0GN4HPqpxQVGLHb7GHJx Q==;
X-CSE-ConnectionGUID: ZlGZNHvPSSaEmO2+1DkmAA==
X-CSE-MsgGUID: 8N+q2mcxTx2F6GwXCp1hZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38691787"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="38691787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 02:18:19 -0700
X-CSE-ConnectionGUID: 7sXRJP6LSgCWpgPfCTZZ+g==
X-CSE-MsgGUID: 71+KComXQHqDrwuzhenyQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="80612444"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 02:18:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 02:18:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 02:18:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 02:18:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 02:18:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfL5pUZVcdVluLBGmQurHBLCYBah5ANKqAHgQ24brPmB8gW/XQ72MzCWMtPYl1c589E3AM9SiLYpt/E1HLIyOfCglXT5CyurNdzuIU1hA4oFTEmQBJVDcznSmvwqG/t2NioNnmT6uvZqyjTD1vqjLa2FvhFP1WFFbeC9cdK3xX4tyjD/T1cBBLuzGi5tjv1lfVRQSO90rhmUxmlb7Yik4vWE0nMl54DM08DL/EvD3Cf7G9ofsBqB7faMsIIlOT37XeH772cCF3qfCWEZL9+DyHTFQnoUDqu37OOfAS7X7fycrIqWeGVUAg5P0nF1goe9DpxBOsE+u2rxdlhut+3vvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cc5QzQMr92ZDcWF0F1HvKIswNP3jJ5QwG5DcevBmTAA=;
 b=hzTCmnlPAFdbeTGdeRETLzyy+kxn8EZLbNB89BFqxjuTQthkRYAH2Io886X/nXiLOU5nyR4XMT/GnPzuw2K8lY1Q9hFnZ5C6c+eGHixWnY9EqFHRK4NHe72boXxPDiudIRjDPTERBmYE9ATDBV1iMcJt1wNjHrIZJGpvhAd5Od6O03Sg6WD6yx71XFYLid6OaS+ATyfS146JSBoH0pIaQhtdhM+zZyZUKySrbYpq4psv80LcyTHR4GiybpfGxCsmbrjj84LtvkxDSEcrAG1to5l+7/KVyUVfi2+hr/BviRtCdjosFpDXktChFIhELFcNY/oIkOy2CYuMwo5KcKJpkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 09:18:14 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 09:18:14 +0000
Message-ID: <92e68252-a911-4ddc-aa7f-7330263bc710@intel.com>
Date: Tue, 8 Oct 2024 14:48:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline timer
 during lapic timer shutdown
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <rui.zhang@intel.com>, <jani.saarinen@intel.com>,
 <srinivas.pandruvada@intel.com>
References: <20241007135242.3028131-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241007135242.3028131-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH0PR11MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a9c7d1-d6cb-4583-2104-08dce77a22d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzZVUGxuQTRXaUJRUVdzdkc0T2JSblpvSUdNQzAxVlRuNG1vZXJuMkQvWW56?=
 =?utf-8?B?dTBNdG1BQTFTMGtQTWhvYUw5RUlLdE5aNThyY3c5THloQlNBa3FsdzZLMHls?=
 =?utf-8?B?eW4zVjdDTjN1VFRQVmhsNitFR1h6MTR5MWtvOFFqa05maHo5TmlYOVVLdHU1?=
 =?utf-8?B?dlhFTVdHcmRHWUhnMkZRdmZTK1p0VFhpZXdKZjh1YVZaSE83bWFweDRXVzYy?=
 =?utf-8?B?VHlxQTB1RWZpbmEzSmRYNHpoQklYNTFpMDdFdGlTNGxKU0xyTkJTWEJINk1K?=
 =?utf-8?B?bjYzQlYyUlhHSWxhVWkxM3YyRkRraTBjM3pmcjZmemhaSU9veGprWGJDY2Z0?=
 =?utf-8?B?WjZFNFV5REEzWklRb3d1VFpsSFdLaUpSUDRkTTZ5dWtVRjl2Unc0ZE5NWENT?=
 =?utf-8?B?NTUrQmphU3FsMXp1ZDdIRGZMS05aTkkxekRidng2QkNxckJGemdDZEs1VWhR?=
 =?utf-8?B?bGY5cHVpZ2FtRUx1U3hiOW1XdXZ3TTh6cDMxTm54bEFkc1BVSEZKWmpOanp3?=
 =?utf-8?B?dzAxaHptelBTUW0zKzFGZ3N5N2dEeFNKZCtwa0NWSm5FL2dkRkJ5bk9KL3M3?=
 =?utf-8?B?b0RrTWYxdktRNEYzOWtSbnV4ZFZvcSt1VE1yWC9Ra3UxUUhXeklCZVJRSmhX?=
 =?utf-8?B?eUhDTFdlM0hRMVFNc1hyWmQ1U3piS3dZWURrMGRmLzNVK1YrclZVaHlwdlFy?=
 =?utf-8?B?cjBaRGU1QUlrcWRsUDN4cGtlQ2Vnc1RNeTM2c294cS8xUEw2NDU4d25idjcw?=
 =?utf-8?B?YlNNQ2ltV3dDT1FHWk1XNFpiV3FJM0J5VkQxUHJyY1dONUJoTng5TmdrZ3B2?=
 =?utf-8?B?UWZTYWswdTFIZm9ENEpPRTBEN1dTU0U0NklBVFVSbmQxTDhsVlUzYlNmNVBk?=
 =?utf-8?B?UXZaZGh0QVF5aWdMMFBvc0E3Ty9SN2dZR0dRa09CbHY5U0RnTk9YV3p6MGFQ?=
 =?utf-8?B?SmJYRjN1c1o3MVBwWGhTNHpDQkxYeTFQVUlBWS94VStQa0FFeW5yMHVpSFR3?=
 =?utf-8?B?YlVLNXovY0E0N3VpYlY2OEZyN3RtY20wdTQzM2dPYnRjY2FudXZwbVh6OU8v?=
 =?utf-8?B?djVpWVUrRkE5REtIYXRxWUg2Z0EvRVZlR3B2ZWRibUxPaDZ3U0paazljY2Rj?=
 =?utf-8?B?dEwwc2dMdUtRbmxTNWhmcUJiajVmS2FCWll6Nk5LTktScVRzVVE3TTRHL0hX?=
 =?utf-8?B?blJISTExWWJ2YjZ0eVdwRk02ajB6dVYrWjNsZFFQejBhdEN6dzZtbmpwRlhE?=
 =?utf-8?B?ajNqdHFuaU52RWZQZVAyT2s0NlVDckJlSEZVVkVScENwVjc3dFpuLzRhMTNm?=
 =?utf-8?B?MkExbjZIczRUN2JDcGxocVNkaUlERCtsQkN4dlRZQzN0ZEdFczE0UkVaZWIy?=
 =?utf-8?B?Tm93Nko0bDdxdnEwVFBYZmZ0TitsWTFUd1g3cUJxVndlOFhBZTVMTDRRcGN2?=
 =?utf-8?B?UDlPYTR4UTB4dnhoMmsxQjFoeWpPblIvVkN0NllPSXhPdzcvdDFHNHVCSjdW?=
 =?utf-8?B?UEF0SW93WmhTOW5qRUJtRWl5T05KQzhYdnN5VkxoYlI4QzlvZElsTVBQd09Z?=
 =?utf-8?B?NkhTMXFpY0JmWlk2d1VRMU5Mc3JHQndDTkY3UmxiV2kxUnpVaGY4VkVVNW1X?=
 =?utf-8?Q?nCDAY5QJdYoqZ39YxgNnWtqJlUoRtWRmdOCnzOIUCig4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0R3Tm1ocmREcVRTWE83MnBhRng4dlBjK2M0WllRWTV1K2duZEZCR1VKY3lR?=
 =?utf-8?B?MXRkMXRXOFYyMGpQZWRwdHI2R0RPd2xERXNLV3BtMWRlL0VLWFZ3MUE5Nnov?=
 =?utf-8?B?bHY0azJXWVBxbktJZkd1SnJKVEFjakdRdWZOamhPdWtyeURPekhlWlgxUWVx?=
 =?utf-8?B?OWZJTmFSZXhQdUw2N1d1aVBsbk5rZzVEMnNyNmNyK3ZZM3FuNVJMQ2VMQkxa?=
 =?utf-8?B?V3A5K05QMlNzV2ZhUS85dmpXeXZwMzdmdlp6dGFQVCtrR202SjVCZ3dmZnRl?=
 =?utf-8?B?eFMweEg5QllDcFo3Z1A3WWtGcjRiN1lCWkFPQ3FsY3haWTRrSnNxSWMwcTJO?=
 =?utf-8?B?RkdpTDhmMnNUZ25xZWMrVkJzeFFtUzlhVXhIZXc0UVBMQVRTUFA4aDN6VWJM?=
 =?utf-8?B?RnFkSFhob0hJNEFZejVVMFVIbGlnaEdNUTNLREFhaU1IQlNXRjJvd2lRQ2pw?=
 =?utf-8?B?TjVOKzJXekVXazdhdmFGb0g0M3dDSGoycGFoUk1oQzVHUERGbm05aTJBNWU5?=
 =?utf-8?B?MzB2dU9wNWU0cDdnQTYza0VDUTlobEdsZUU5a1RLSmoyNmxHRHhNOS9zb3Nw?=
 =?utf-8?B?eWw2WE5VRk5YZzF5NXZGSHRtSmR4bURURVF3L2Faek9rREZEcDFWaHpQWURS?=
 =?utf-8?B?WW0zNTFkRFdFQXpyZ2NNMjFUMnZ6NGp4QjkyMGFoRHBLKy9Cdk4rTWJrZjFT?=
 =?utf-8?B?Z3lJR3VDbDhUdFdRY0RFeEJPdUJUQjZrWVFCNkExd2s3UFhTazJqd3QraHBP?=
 =?utf-8?B?RmwzRVl5Q2NtV25hZDdhYndhb0dRS1RBVGZ3c1ZVMFdROEI3WU91R0RsTEJ0?=
 =?utf-8?B?VlRSVXV6OWRha2RiTWJSdW9qaWVwdFdFTHg5WVplN2wzb2VjZyswMGhoODJx?=
 =?utf-8?B?b3RUSVZkdC9ieUl3Vm5ybUIzU1N2RVVmbDFqNUtQNkNrTE0vVnhIb3JQeFBK?=
 =?utf-8?B?K3FqUjVzcTBGcnB5bnVxSzhvVU5XWU8wd3ZtTUFhSW9wUGUvSXllbTlEcFlx?=
 =?utf-8?B?VjVIVnJld1BpYjBkaFZtUWpwZzJGUDVhdXQ1Z1hHcHhpNzlpd2YvRjc5akpX?=
 =?utf-8?B?cHcrKzZtMVhhMzlmUUF3OHhYdzlYQy9Kb0VEK1pla2QvRHdIUzFKN0pWa1JB?=
 =?utf-8?B?QmE5TXhiZHFyalhWUWxpUHRPTkUyTkZ0Ym1nM1hWajg5MThHRlFSLzcyTDl0?=
 =?utf-8?B?TUxBYTlaNDFQdzlSOVRaRmcrQlFyRVBOdnlaV2huRXduazNYOTBXODdGZWw5?=
 =?utf-8?B?b2NnMFdLcVpjSHFvRmZtMkdkRG1VdmxLQXB2aEF6d2dqOTcwS0xOODBKZSta?=
 =?utf-8?B?Q2dSUUNuTjNHRlpmeWlSd2NPcXVwSGlzSERKYS9mbnJOU2ZHOFZWZjNLMWJ4?=
 =?utf-8?B?R3RnaUNSdWoveW9Hc2trOXFsUmcxUkNxS0JnTlhjYVZaWERweXBHRUdVY3RT?=
 =?utf-8?B?dk1oS1hXUHZuN3ZYL1ZOeWlPWjdtSS9oQ2hqbm05ZjE2eGFvcER4MWRjR3Ri?=
 =?utf-8?B?WUhRMzVCSERLUC8wUlZRNHkxT2hlbnFQTFRsWHRvbG12M09hS1RrTnF3TitL?=
 =?utf-8?B?Ty96QVRpNnRmQks1ZnNrbFBjWUxCTkc0NkpnaEQ4b0xtaStWRG5ZbXpSNjRq?=
 =?utf-8?B?VWJtdW5ud21zcjZrMFZOaURWSXVRM0pUVTljdXVXMHhlQ2paU0szM3VwcWhU?=
 =?utf-8?B?bzE3TnEyL3Y2cnRzd1FvQis0a1Q2OEFuaW5TQ3pIODdlTVluV2hjeFp1ajc4?=
 =?utf-8?B?aXZpcUlHbjFvdUh0RVZ4Tk1Ham1jQWUybUFhU0JPN1BoSmR5NEdNcnBEUGdr?=
 =?utf-8?B?Q1dub3RSWDNUN2Q1QW0zVm1ERC84WVVDUXBhcHFlWHVQQ3dQU0hNbDNSQjZz?=
 =?utf-8?B?dEpTaWFRWVhVMW9NaHpjWU5QNlFvZFRxbDBTZi9UMkZWNms3YkVXdWVCc0Y5?=
 =?utf-8?B?QUwwOWpyWU9LUit6QUZVcm1tbXNIR3l2eHNIcURZTXVnK0J0MVdIOVhqS0Z0?=
 =?utf-8?B?ajVPNmg1Rm5oek9CbmcvM2dMN0kvVmQ5cjMwb2ZFWFh5QmdyaE93c1FtK0FH?=
 =?utf-8?B?bENTd1FYRzRSeFlnZ1BjTXpaNXVySHZMdzY1SHVBUEFaNElBQUUzOHlwbkI4?=
 =?utf-8?B?R0ljaSthVEdTRjQzYlJ6MitCUTBHT2h4eGxDcTM1UXNvbVlWS2s5dlF0OE9D?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a9c7d1-d6cb-4583-2104-08dce77a22d4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 09:18:13.9391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7E5BdNMqlXUxhK0l1M8OflUjuYjuqTlt4nMpthAa/NzZlP0BqDAsgSzKs2UKLOzkXi7IVhUmAznRtlz+xzxMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
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



On 07-10-2024 19:22, Karthik Poosa wrote:
> From: Zhang Rui <rui.zhang@intel.com>
> 
> This is a core-for-CI patch for
> https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/
> 
> According to Intel SDM, for the local APIC timer,
> 1. "The initial-count register is a read-write register. A write of 0 to
>     the initial-count register effectively stops the local APIC timer, in
>     both one-shot and periodic mode."
> 2. "In TSC deadline mode, writes to the initial-count register are
>     ignored; and current-count register always reads 0. Instead, timer
>     behavior is controlled using the IA32_TSC_DEADLINE MSR."
>     "In TSC-deadline mode, writing 0 to the IA32_TSC_DEADLINE MSR disarms
>     the local-APIC timer."
> 
> Current code in lapic_timer_shutdown() writes 0 to the initial-count
> register. This stops the local APIC timer for one-shot and periodic mode
> only. In TSC deadline mode, the timer is not properly stopped.
> 
> Some CPUs are affected by this and they are woke up by the armed timer
> in s2idle in TSC deadline mode.
> 
> Stop the TSC deadline timer in lapic_timer_shutdown() by writing 0 to
> MSR_IA32_TSC_DEADLINE.
> 
> Fixes: 279f1461432c ("x86: apic: Use tsc deadline for oneshot when available")
> Link: https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/
> References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12344
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

> 
> ---
>   arch/x86/kernel/apic/apic.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> index 6513c53c9459..d1006531729a 100644
> --- a/arch/x86/kernel/apic/apic.c
> +++ b/arch/x86/kernel/apic/apic.c
> @@ -441,6 +441,10 @@ static int lapic_timer_shutdown(struct clock_event_device *evt)
>   	v |= (APIC_LVT_MASKED | LOCAL_TIMER_VECTOR);
>   	apic_write(APIC_LVTT, v);
>   	apic_write(APIC_TMICT, 0);
> +
> +	if (boot_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER))
> +		wrmsrl(MSR_IA32_TSC_DEADLINE, 0);
> +
>   	return 0;
>   }
>   

