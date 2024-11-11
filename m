Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCA2D3ABCF
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 22:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4C410E0C1;
	Mon, 11 Nov 2024 22:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwZKAvKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D4110E0C1
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Nov 2024 22:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731364872; x=1762900872;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8ByRx0OuFswBfJUOXzs2fULH0KNkt6Mdu4YTCjy6sXo=;
 b=LwZKAvKvJEOIa7SKNCLnE6qZmzuCmP2TctQAQgxAe9d/jqmbs74NN03r
 Pdackn1OGR8T4DEzd6oXtszhVi7LFhLCKHsosGSgEVFZREkV3p78Xw8Uy
 u1hsnuIwKTfD6E6iLuxi7CNXS6RciMVmkRxHMQSGBgzcwD1PuJ7+Scc2+
 hkMNy0nb6GYMzGOMCpewJ4gCF8edRk03f9xifViRh1bMGGZEcNrui/FWR
 Jb8pQvkDGqrlXNi3j6HJlUb6bOBlP3uGROfrx37VMq1NK6o4jK/jxpkYV
 GcvJ90NkIQefuBsHl2sdQzGJZu7haLJ41TyIgPLie0wMo3XxiWDL5kxXf g==;
X-CSE-ConnectionGUID: 5kBFIgwzSiCuOJd5IKIU/Q==
X-CSE-MsgGUID: WHgYtmpsQDqCbi3oenVRBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42283258"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42283258"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 14:41:08 -0800
X-CSE-ConnectionGUID: AXpnfLa7SGu+CJOKwaHvxA==
X-CSE-MsgGUID: EHcYftGxQ7CVHuNcac184A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; d="scan'208";a="87495847"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2024 14:41:07 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 14:41:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 14:41:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 14:41:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sgf+pzvFrzDedAK3ghIl4s7SX9jmAfkJzP7A6ZWDLn6EkNlBTVUeMY3nstJ2zAwLZPZupvMCNzS1vxy0rjJXQDr1kSZiUOnPSKuXu6MhK02whMs/PvGMwiDT0ZD9u87KV3ebTqtlXmzH1WoHMPTqV5ZyDzCQNdSZ2vsgQRXI80ExePbdKe4fNbrhiF5pMmJF4uGLUMZa6hqMc1XEmOVjivVCyqBiagA3Rtr2SNydBOXCEJMhIwzeK47OYyGFWsGgITEGUCV96tYlaULGDmqCV7hOe0PKRaeywsBu8YE82lvOweYfrC8K7kWshx2Y+Uk4m3tXxXgrEMH1yQmohf7DMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWwwPPagSTI/Fd4oxXh0IvwZqC/74G4Y0CiS0KkCU7E=;
 b=f0bZ0pgbY9vEJvyaqyM6keneen+gt5Wkpgv0eE3dsaSZ+Dfc/wWPFok1LfQKGqpXBYLXhBWr3jhXQVcXYJFChBkolWF18iR/MCLlKA+6tqqFCHwwWO8f/nEbg1mBsqauWybQplfAUCZZWB9XqnFiUcupkc1Yjn+OD/RLaxd3dM+6FMhK7aLna7agZ0YF+mfSTYzfm0aGl1UuJN2hJVoYMcR02FMrluWXslKyWhMY7IWnALpHCwkQpQujHDphy3wtRQzMPDwvgSO31aaD+GFHyeR80zW3D9JfezEXPT2HyFU/9ZCPgw5Eo0Wg2ylnU9pTPTMMN9gvrhj06ThhDEyKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 22:41:04 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 22:41:04 +0000
Message-ID: <b6a4c423-4b48-4fe7-aab7-dc8d7ec56c14@intel.com>
Date: Mon, 11 Nov 2024 17:41:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/xe: Change xe_engine_snapshot_capture_for_job to
 be for_queue
To: <intel-xe@lists.freedesktop.org>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-7-matthew.brost@intel.com>
 <fa1c6aa1-af2a-4458-90c1-1c7fc785d544@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <fa1c6aa1-af2a-4458-90c1-1c7fc785d544@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0071.namprd08.prod.outlook.com
 (2603:10b6:a03:117::48) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SN7PR11MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ad4059-f7bd-4440-a44c-08dd02a1ecb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3FEang1aGxQazRBNjE5d0ZZbHFNc0F0NmVva2p3b2luVUV0R1NJNHlVYTVa?=
 =?utf-8?B?NGhMdHRoYlNTWndRRXRHendYSEs5VjQrU0JmcitqQXlrcjE1L0NUamhOUUZI?=
 =?utf-8?B?bkthYXoxVnYxUFZQY01iaDRkM1pvaFFoeWprVzFXb3lXb2lMSnA0L210eHRq?=
 =?utf-8?B?NnhOamplUmdtUlVRbXJ5SHZFVkhEYXlGTEtScXI4RXBjNXlFNWJVQlpsUzZN?=
 =?utf-8?B?bWxLaEdITlhqWEZQYTMyYjFwT1kvMnBiZzFvbGRiMG5FTDExL3RNWUxPQUY4?=
 =?utf-8?B?dXhYK1NhdGZ5SGFxT0dzbkE1aGJHQkVYNVg3dG1iaUUxRW42YVliLy9HdlRj?=
 =?utf-8?B?RzJ0K1JYSW9zNGNUSXczeDJLNDFrdmdGeCtWVEcxUXViUnJoK1o3VXRYRFFj?=
 =?utf-8?B?ZGd1dGZaWlI0eEdkNU1RRkF6NjlDWGFPU3dXeXFhcVpWQU9oWG5oczZobUZ0?=
 =?utf-8?B?US9pcTN3Ym5FdHZtQ1BENGlwNmdicndZODhmeHkraVRHWGNLbXhVNWJQbnFQ?=
 =?utf-8?B?dy9lQVNvYnRpdkY0SlNwTmtlcmVyRG5JRjdQMjlEMEN5ZVJ6bkZ5bTRjMC91?=
 =?utf-8?B?d0VsRVhhTFZHRjFpZTNiNWkrTURHVGJOM0NUSGs1SmZabkYzYldGblo3Y2Jo?=
 =?utf-8?B?V1FyY1pac014MFBHcG85ejA3OVBIS1Q1RWppcTErdFNWSm9oRlV6UGozRktQ?=
 =?utf-8?B?K0pmc3RZbWd0SUlLVFExOEN2bVlJSGxsZ09vcHQzVmZ5SkVYeUhPNUlCUEdN?=
 =?utf-8?B?SG55amRKaUs1bkx1ZHpWZUhlTnNDTDMzb1hzZzdlUWdVMFloY0lSWjNTdUx1?=
 =?utf-8?B?T2JsR3dPbzl0ekhCcnljUEtnbXNWWUdsRnJ5akZUUWpLVWZjbHUvVmRidUNj?=
 =?utf-8?B?R2Foc1BsbTJNdWZmL21SSDFMVm1DUkhQamFxUzZDZGY0NGU1NEJUWDZVdHUy?=
 =?utf-8?B?RDB0QkgzMWg3dGpCMnU5OE9iQW5wNXZ4UG14TnRaKzdTbFZWRFYzS1daaEFP?=
 =?utf-8?B?YWtJVnl1dXQ4ZnphaE1Zakh0UWFGbzZSOFJqUldySGk0V1hZbHZaMHhBVmVD?=
 =?utf-8?B?ejBXV3FLTUg5NlBKS3o1NG9PbjdhNjMrQk5MaWQyMXJTTkZta2FnZk5SMXg5?=
 =?utf-8?B?VitmelEyUzFTbnpwc1Q0bVlwWWZ4WFVua0JETS9ob29TTVZJNElNWUo2Yi9G?=
 =?utf-8?B?dlV2VnM1K0pBU21WRU84NGkxVHp4dkc2MEFOWkpqSHFhcW85YmVxdGMrRzBp?=
 =?utf-8?B?N2lONVBjQlQxMzVwcW9uN002L2JlM0w4WUJaTHZzbU4yNHNZbmpGVTJZU2RJ?=
 =?utf-8?B?Mi9KOWxiQXlFMmRYN2lwdFRIeUpRSlNkOVVEY1h6UzFOak1ubEJrMkhaUDE1?=
 =?utf-8?B?U0hBeGlKcytGOTczR29sQm9qc0t6cWhpd25TbzZZYkF4NU9jTjRzWmVsMjJH?=
 =?utf-8?B?RUlxUDRZbi9jRldrSktUQjBjd0lZbnp2dnVCQ0l3TkdNTDkxVEZZeGU0cXdu?=
 =?utf-8?B?KzhDQVhleTU5Wk1WdEpSaCsyKzAwZk9KdHpOYzFTUTErRUlPakczZVZHWVFB?=
 =?utf-8?B?My9oak03MU9SK1lLVnorMDVVRCsrRkVCMTdHMzJKVG9za29EMml5NTk4aHZV?=
 =?utf-8?B?UlIyTWtoQUhQeENaUmxjMlZlSWJ2d20rb2pIaHdleW9JajFZR3lLa3dLYlU0?=
 =?utf-8?B?UHhSZmdPMlZJalRzbkdpcUlIOUJubVdPZWx2NVJYWFgxVVpRUTNTa3pLclVG?=
 =?utf-8?Q?BYDxjkfVw+ToRlQTPOQdAPFvxOOa1gpjrGjAZYh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVlyUHA2U252aWJrUnU1VUtxL05TRUJBR1JZNVdoMEhsb0lDVGpYa3RoQUxC?=
 =?utf-8?B?R1JpNVF3eHFPTEJvM2ZSNVovUExFRFNueXNHb0JBOG9uV3FQMFRBR0Q2aXFh?=
 =?utf-8?B?bjhoMTl4cEliOU5EKzgwQXpSa0NmaGJma3hCdEs3bmV4L0lEVEZ3a0RhQ2Jv?=
 =?utf-8?B?ZXJweGVZQnIvbytMQmw0d3R2NnpKM3NTZ1pVR29hbGc0aUJNbitKRW5LU0Np?=
 =?utf-8?B?KzlJWU90dDBXVUovRTlwZzZ3Um5wVDV5TFpPYURFdkFyRHAzUDYwREpNWkdk?=
 =?utf-8?B?QlAxUDBNaDd6YkRTYk84SHZDNWxhRzZQTGhMZWJoVW5YaWpEQzlNTkFOZlRD?=
 =?utf-8?B?K2pVeDVQSVA4VTdWenk2WDJXaWxOcExMM0dDT0tSc3ltbWFpSWtyVzRVUFgv?=
 =?utf-8?B?R3NVSGxwL00yeCtCTUU5S1U4Mjc4S1hWa25OMDZTdC9xenB6dDVYa09mNC8x?=
 =?utf-8?B?YkpMVTBIbnJpY04rQldDSEpFT0daQzZnSW51TzNhZURGU0FWdFB3eTF0THVZ?=
 =?utf-8?B?VXROUnd3TER1cDV3dTBUZGp2Wnk4UUZoTXpydFRqY1VadzhmTnlTTFB3NFNS?=
 =?utf-8?B?TmovY2I1aXZOTWpMWmZKdEhBYk56bkswUCtMNFlXVVFvakViQ2RmM2ZrR1Jq?=
 =?utf-8?B?cEE4bFZpWHhJSWJEeWRsemF1ZHlWVWVabnZvV1VoNGxXdXZ1aGo2TG93ZVJR?=
 =?utf-8?B?K0ZITkZiWU9NUmZtSnlHclMvWW9iQVdtRTNlVmRQdXAwTzJmdzlLZExlUnRM?=
 =?utf-8?B?dFVwUVJZbnR4bVNPU0RtLzYrOUJyNkg4QTVseUV3V0VDNDNjQWYza1dGaER4?=
 =?utf-8?B?MUo2ZEdsWUIvRVlQT1hnelNITVI2azdramlKTktNVnB5aS9WZUdCSkIvMks1?=
 =?utf-8?B?TTZpME13dTJNNmJMWEJRRldhR0hYa0VhazdySktReHJ1UTk5eEpIa3AwajQ0?=
 =?utf-8?B?anNSUEZCUm9jZ1RaY01CMG9MaWlCR0dYZ0czTjZ3alVXS2lkTzlqNFlNKy85?=
 =?utf-8?B?S3o2VzJ1VGFGWGwyRXUvUWFSNmovVFFlYVFUbHpDMC9ySHBzK1JwK2N2OWpu?=
 =?utf-8?B?UUN3c21vMXk3cWs4VFdsa2EwUnoyTEV4eFFVUzV3K1ptVmQvS3lPWWFDa1BW?=
 =?utf-8?B?RGNBS1BSdEVtUFIzTGRnczdGUXJvV04wdDZVMEI1VUJyVm5NY2pBTEVndXY5?=
 =?utf-8?B?cXlIVnVUNCtia2hoTWt1N0Q4RmpjQTlScHlpSUdheGprTU5uSHZoV2NzbUE0?=
 =?utf-8?B?L0FPL2d6SFVWemM2Mk93Nk5lL1JZTU9KRXZyOStEM0c5WWdZZGZTMXRmZkhP?=
 =?utf-8?B?amZuQzZnYzFENGZkWmJKcER4M3Jmb04xVDE4NFl4UFdNeUc4VFZXL3U3dUVQ?=
 =?utf-8?B?MXNNNmY5WGxTeEpJZWRDU01pK0tWckdzRVRGMzdHMUlVS25GWG5KcG0vS0JO?=
 =?utf-8?B?b283SmtRVUpRdE1WQVlpbFAxQU1kUXlza1hUY0J5VHMrdEttWFN0clNyUWVo?=
 =?utf-8?B?c2tSSjA0OEtyU01KWWtBZFV0SlpoVWFOY3NkZjVPbDlRbnNtT0RZUGFXbSt3?=
 =?utf-8?B?bUxIM3c0TXY4VCt1TzVvMkFMMlVyUldCOU9PSFF0bjNTTlRrN1M1MDNmZG9N?=
 =?utf-8?B?QnhWYnMwYXlUZXVDTThRaHc2a1lyYjNVRkdCWE5SekJxanNrY014VktEaVp5?=
 =?utf-8?B?NWRoVUREL2VyOUdJUEVBVk0xRnFETzc2VDBZUmVyT0RjNnVpcVY2QktDWGpF?=
 =?utf-8?B?emd0RUdvOGtIcjZ1a0c3dlp1YXFuUU1UOTcrM1lseHJWRmtsbVR6ZlloMTVP?=
 =?utf-8?B?Z0I2RERNLzUraU1SYzBBM0lheHlLOTU0bGRGOEdjN2FXTFFQaXFvOFBnbXZz?=
 =?utf-8?B?bWg2WUtPZFBrdVRNMnJ4SUI3VG01OUV0SXZNQlExQTJ1QlBGWFlNL3p0VEZB?=
 =?utf-8?B?MWZPbTNHU2hob3YrUjZORWUxbndXQVd1SFVuRGJJdEZBNnhBNmpMZTR3Q1lU?=
 =?utf-8?B?djZ1aXozTlEveXI0VXNFQWxjQXNvSEN6M1FYaS9DNmZmODhXeHI3ck9uU0FI?=
 =?utf-8?B?Q0Z2cll5VGRMVG1mVGQ1ZTl6cnJJcWtCdFhzQlJjRlFQN0x5UHBwanl3TElG?=
 =?utf-8?Q?Og1IfXSoe+LWCdcGQNWThNAyc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ad4059-f7bd-4440-a44c-08dd02a1ecb9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 22:41:04.2952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0P/14pCZKWqZC6PauVlNI4QX5TaAdxScCoc5f4y4R4SJmjni1TagraATeCCJ7rwVoqNETVACoU26rbd+MqyNnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6970
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



On 2024-11-11 5:15 p.m., Dong, Zhanjun wrote:
> On 2024-11-08 12:43 p.m., Matthew Brost wrote:
>> Add job may unavailable at capture time (e.g., LR mode) while an exec
>> queue is. Change xe_engine_snapshot_capture_for_job to take a queue
>> argument and rename to xe_engine_snapshot_capture_for_queue.
>>
>> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c |  3 +--
>>   drivers/gpu/drm/xe/xe_guc_capture.c | 28 +++++++++++++---------------
>>   drivers/gpu/drm/xe/xe_guc_capture.h |  6 +++---
>>   drivers/gpu/drm/xe/xe_guc_submit.c  |  4 ++--
>>   drivers/gpu/drm/xe/xe_hw_engine.c   |  8 ++++----
>>   drivers/gpu/drm/xe/xe_hw_engine.h   |  4 ++--
>>   6 files changed, 25 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/ 
>> xe_devcoredump.c
>> index c32cbb46ef8c..dfa946a3793c 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -282,8 +282,7 @@ static void devcoredump_snapshot(struct 
>> xe_devcoredump *coredump,
>>           ss->job = xe_sched_job_snapshot_capture(job);
>>       ss->vm = xe_vm_snapshot_capture(q->vm);
>> -    if (job)
>> -        xe_engine_snapshot_capture_for_job(job);
>> +    xe_engine_snapshot_capture_for_queue(q);

The
	/** @job: Point to the faulting job */
	struct xe_sched_job *job;
in struct xe_devcoredump also could be removed.

Regards,
Zhanjun Dong

>>       queue_work(system_unbound_wq, &ss->work);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/ 
>> xe_guc_capture.c
>> index cc72446a5de1..511a8e40d521 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -1793,29 +1793,27 @@ void xe_engine_snapshot_print(struct 
>> xe_hw_engine_snapshot *snapshot, struct drm
>>   }
>>   /**
>> - * xe_guc_capture_get_matching_and_lock - Matching GuC capture for 
>> the job.
>> - * @job: The job object.
>> + * xe_guc_capture_get_matching_and_lock - Matching GuC capture for 
>> the queue.
>> + * @q: The exec queue object
>>    *
>> - * Search within the capture outlist for the job, could be used for 
>> check if
>> - * GuC capture is ready for the job.
>> + * Search within the capture outlist for the queue, could be used for 
>> check if
>> + * GuC capture is ready for the queue.
>>    * If found, the locked boolean of the node will be flagged.
>>    *
>>    * Returns: found guc-capture node ptr else NULL
>>    */
>>   struct __guc_capture_parsed_output *
>> -xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
>> +xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>>   {
>>       struct xe_hw_engine *hwe;
>>       enum xe_hw_engine_id id;
>> -    struct xe_exec_queue *q;
>>       struct xe_device *xe;
>>       u16 guc_class = GUC_LAST_ENGINE_CLASS + 1;
>>       struct xe_devcoredump_snapshot *ss;
>> -    if (!job)
>> +    if (!q)
> unneccessary, there is !q check 2 lines below.
> 
>>           return NULL;
>> -    q = job->q;
>>       if (!q || !q->gt)
>>           return NULL;
>> @@ -1827,7 +1825,7 @@ xe_guc_capture_get_matching_and_lock(struct 
>> xe_sched_job *job)
>>       if (ss->matched_node && ss->matched_node->source == 
>> XE_ENGINE_CAPTURE_SOURCE_GUC)
>>           return ss->matched_node;
>> -    /* Find hwe for the job */
>> +    /* Find hwe for the queue */
>>       for_each_hw_engine(hwe, q->gt, id) {
>>           if (hwe != q->hwe)
>>               continue;
>> @@ -1859,17 +1857,16 @@ xe_guc_capture_get_matching_and_lock(struct 
>> xe_sched_job *job)
>>   }
>>   /**
>> - * xe_engine_snapshot_capture_for_job - Take snapshot of associated 
>> engine
>> - * @job: The job object
>> + * xe_engine_snapshot_capture_for_queue - Take snapshot of associated 
>> engine
>> + * @q: The exec queue object
>>    *
>>    * Take snapshot of associated HW Engine
>>    *
>>    * Returns: None.
>>    */
>>   void
>> -xe_engine_snapshot_capture_for_job(struct xe_sched_job *job)
>> +xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
>>   {
>> -    struct xe_exec_queue *q = job->q;
>>       struct xe_device *xe = gt_to_xe(q->gt);
>>       struct xe_devcoredump *coredump = &xe->devcoredump;
>>       struct xe_hw_engine *hwe;
>> @@ -1887,11 +1884,12 @@ xe_engine_snapshot_capture_for_job(struct 
>> xe_sched_job *job)
>>           }
>>           if (!coredump->snapshot.hwe[id]) {
>> -            coredump->snapshot.hwe[id] = 
>> xe_hw_engine_snapshot_capture(hwe, job);
>> +            coredump->snapshot.hwe[id] =
>> +                xe_hw_engine_snapshot_capture(hwe, q);
>>           } else {
>>               struct __guc_capture_parsed_output *new;
>> -            new = xe_guc_capture_get_matching_and_lock(job);
>> +            new = xe_guc_capture_get_matching_and_lock(q);
>>               if (new) {
>>                   struct xe_guc *guc =  &q->gt->uc.guc;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/ 
>> xe_guc_capture.h
>> index 97a795d13dd1..20a078dc4b85 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
>> @@ -11,10 +11,10 @@
>>   #include "xe_guc.h"
>>   #include "xe_guc_fwif.h"
>> +struct xe_exec_queue;
>>   struct xe_guc;
>>   struct xe_hw_engine;
>>   struct xe_hw_engine_snapshot;
>> -struct xe_sched_job;
>>   static inline enum guc_capture_list_class_type 
>> xe_guc_class_to_capture_class(u16 class)
>>   {
>> @@ -50,10 +50,10 @@ size_t xe_guc_capture_ads_input_worst_size(struct 
>> xe_guc *guc);
>>   const struct __guc_mmio_reg_descr_group *
>>   xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>>                    enum guc_capture_list_class_type capture_class, 
>> bool is_ext);
>> -struct __guc_capture_parsed_output 
>> *xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job);
>> +struct __guc_capture_parsed_output 
>> *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
>>   void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct 
>> xe_hw_engine_snapshot *snapshot);
>>   void xe_engine_snapshot_print(struct xe_hw_engine_snapshot 
>> *snapshot, struct drm_printer *p);
>> -void xe_engine_snapshot_capture_for_job(struct xe_sched_job *job);
>> +void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>>   void xe_guc_capture_steered_list_init(struct xe_guc *guc);
>>   void xe_guc_capture_put_matched_nodes(struct xe_guc *guc);
>>   int xe_guc_capture_init(struct xe_guc *guc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/ 
>> xe_guc_submit.c
>> index 974c7af7064d..3df8543deec1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1066,13 +1066,13 @@ guc_exec_queue_timedout_job(struct 
>> drm_sched_job *drm_job)
>>        * do manual capture first and decide later if we need to use it
>>        */
>>       if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
>> -        !xe_guc_capture_get_matching_and_lock(job)) {
>> +        !xe_guc_capture_get_matching_and_lock(q)) {
>>           /* take force wake before engine register manual capture */
>>           fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>>           if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>>               xe_gt_info(q->gt, "failed to get forcewake for coredump 
>> capture\n");
>> -        xe_engine_snapshot_capture_for_job(job);
>> +        xe_engine_snapshot_capture_for_queue(q);
>>           xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/ 
>> xe_hw_engine.c
>> index 1557acee3523..0cfa2b9282be 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -829,7 +829,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine 
>> *hwe, u16 intr_vec)
>>   /**
>>    * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW 
>> Engine.
>>    * @hwe: Xe HW Engine.
>> - * @job: The job object.
>> + * @q: The exec queue object.
>>    *
>>    * This can be printed out in a later stage like during dev_coredump
>>    * analysis.
>> @@ -838,7 +838,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine 
>> *hwe, u16 intr_vec)
>>    * caller, using `xe_hw_engine_snapshot_free`.
>>    */
>>   struct xe_hw_engine_snapshot *
>> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct 
>> xe_sched_job *job)
>> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct 
>> xe_exec_queue *q)
>>   {
>>       struct xe_hw_engine_snapshot *snapshot;
>>       struct __guc_capture_parsed_output *node;
>> @@ -864,9 +864,9 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine 
>> *hwe, struct xe_sched_job *job
>>       if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
>>           return snapshot;
>> -    if (job) {
>> +    if (q) {
>>           /* If got guc capture, set source to GuC */
>> -        node = xe_guc_capture_get_matching_and_lock(job);
>> +        node = xe_guc_capture_get_matching_and_lock(q);
>>           if (node) {
>>               struct xe_device *xe = gt_to_xe(hwe->gt);
>>               struct xe_devcoredump *coredump = &xe->devcoredump;
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/ 
>> xe_hw_engine.h
>> index da0a6922a26f..6b5f9fa2a594 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -11,7 +11,7 @@
>>   struct drm_printer;
>>   struct drm_xe_engine_class_instance;
>>   struct xe_device;
>> -struct xe_sched_job;
>> +struct xe_exec_queue;
>>   #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>>   #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>> @@ -56,7 +56,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine 
>> *hwe);
>>   u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>>                   enum xe_engine_class engine_class);
>>   struct xe_hw_engine_snapshot *
>> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct 
>> xe_sched_job *job);
>> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct 
>> xe_exec_queue *q);
>>   void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot 
>> *snapshot);
>>   void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer 
>> *p);
>>   void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
> 

