Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A08AC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 03:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3FD112AAA;
	Mon, 29 Apr 2024 03:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZp/z9zE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A220112AAA
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 03:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714362282; x=1745898282;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ppa2Ndke7vlPcTHSbsTTMHSQU9YtrK5hhEb3BQ6Hmo0=;
 b=WZp/z9zEgYjSTG7EsLmlXGUQAVbOSgmiXgriLD52s6HOJiyWohpfnl+B
 4HnnD7bAGkoinYgtIgid5PnGiNJtcrl5vduEEGqlinOQ1+a6VirEnhbjk
 U1odRaZW+uHD+Fp6umm45NpSLg8C0wRLjE5xBlyL1gGBCHbkhbhInQpc6
 lzvCuAV8AQ005DMIKdEbBmD1HB6Bs6VYRZ8URvskaFb4bfOQEOEgjx3Kr
 8Tzivo7LHo6xTeEdQiU4Fi0icbJVqgqOyZ25z71aVxh1dcWwWQdWWBC4A
 p2NsXhP5WioBAOdlUnMkUbrS/qZhKkowjhhZ83PDc0ixwTV+B1flXQueZ g==;
X-CSE-ConnectionGUID: u233lAoTQmuMMhOgOKIb5g==
X-CSE-MsgGUID: Axb8G9MCSS+L4pI8gWhznQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27463007"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="27463007"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2024 20:44:41 -0700
X-CSE-ConnectionGUID: OLTSF9xOSqywzBx5jtP/+w==
X-CSE-MsgGUID: Mb0iYL2WROSY7E6dZ+vMLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="26050473"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Apr 2024 20:44:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Apr 2024 20:44:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Apr 2024 20:44:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Apr 2024 20:44:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdC35bhq8Bcsy/dZMVVoXo++oDVrMDVMYYakL9sT5uqatu53IICySlkb5k30IUN5PCQY9I+e28T20kbLHwqu+E/ezGWgx62Yq9S5mOw5S27v+uxWBgJeYmFbTden6XLDUdmj5bMYPqoWj7DOpabXjRZB/05WdUGsh22p1h7W/f1mQ1XfD663p3Ko62Rz4tJBCcX2/4NQjUlnqfe+W9k9FNlNvIcyXy4dlHB0u0r3pfyWWXdyKg5Rvm+47AeFs/ZQX3TZbqQF/cZIGqzNdCM7E78hhoKghEcrnaamyxZTqvLZDAGsM3YfDsShvlBfysDGmYuXxg01YVNRg1kezCE46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EWjpNkk0tRmHCrQNut2NzziL+RWqhBTyiQHhkk53hY=;
 b=EAOY0i+517qsDSdyMTlU6UTdTCmm/tuNI0CvCtB0JJP9ySVkAim8WWa8447sREIRes1LbFdhW1MCgTFg2bmupLRr4wjCC3flk+0d8zxoIqmO9tJ0i9Z0Sr+lTkCIbq1eWwC3xlIqZ41PBdHifmrtCX/JZk29d2g8nST0DS6Vp4+Vbe530oW2VoOji3yQZPVMAtjLrkcHEI2iFouFhrWrgZukMzfRA13ciZNvpX6+i5OUVI3SqUDvJqoAcrr2LhG7WzFiG2AfWFB3BqqiTOs+3ZQh0koJPYcvx7Pu4LlEiTyGTfYVXzbVh2eGqspXDxX9QSZ6gbcr9cGL7+qmKzPchw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by PH8PR11MB8038.namprd11.prod.outlook.com (2603:10b6:510:25e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Mon, 29 Apr
 2024 03:44:38 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 03:44:38 +0000
Message-ID: <9aa151c5-de86-4ac3-a874-894f2f780c95@intel.com>
Date: Mon, 29 Apr 2024 09:14:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Merge 16021540221 and 18034896535 WAs
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20240427135339.3485559-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240427135339.3485559-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::31) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|PH8PR11MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: 163c20f3-bc27-486a-d9ff-08dc67feb177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGZ6VnFXU3VKRE1jNk94QS91SVBuaGtQNEJxbEM1dXJrcEpDaTlCRmtzWmNI?=
 =?utf-8?B?V3ZpL0xuL25BYWlpWVFFTXBncStSSVJHMmhDL2lKTDFFQURSR05MZmtYREth?=
 =?utf-8?B?aUtucS9mVGlXVG1uOUVnb0xNNDNnd2JqUG5MMUhkeW45bGJrcmxSR2NUcGdl?=
 =?utf-8?B?bkhjeDU0K2dBcFNQVDA0cUhjSjY3N000ZlVOeXRuNjBtMEw1eUR6OUFEQ0Mr?=
 =?utf-8?B?NmhDNDNjdDVUZFFvaEorWHZHd21IOENINktHRzRQTGlJd2tGQ3RDM1M5ZG0w?=
 =?utf-8?B?ZW9kUG5Zc2xVRHhXT3pSR1EweEhWWjhvbTZXUWhxT2ppamxXVFJjOXZPZTA3?=
 =?utf-8?B?UkhmQ2g0NVdKS3FVVnNOTDRJeTBlcnk5bkwvYkh4UVZ3MTJwaWlMOUJDcDdu?=
 =?utf-8?B?YWpNOEVxNjdubGloc1JLVTdTQWpVVkJQck1VSHVBRDZQWVRYNTdwc1cza3Yy?=
 =?utf-8?B?WDBYY2ltM1NIUzA3YTByaHdiRXhSRnQvaUwwdlY2V25lbVpPZnlzVEZ6Yzdv?=
 =?utf-8?B?bmgrbmEvMXlIdTZtdnMrZEcwMkVPTGZ0VVBreEJXaVdYMEp5ZlFMNEhFZ1o5?=
 =?utf-8?B?eXBvTkt4RENGUVhqZUEra204Q1ZtMlVOM3dCYm5OU1dPK0FQUkJNVEpzSkVO?=
 =?utf-8?B?Q05scDh3VmJuZkttM2NUdXlxVDBCVWdkOHduM2VaNjIvMmNtV09tSFJzaWIr?=
 =?utf-8?B?RWVIQmZlN29BLzlGUTYreUJPdnVVeGhTWU9wRTJKMU9NTUtNTCtnS2Fuck5t?=
 =?utf-8?B?eTBIL05hcHpHMlBCWXFacHFKWG5NU0F1NEtZQS9CN0dVMHpOeUlBTkxydjl4?=
 =?utf-8?B?a2ZIT20yVHVycGxpamtvUDdvak43S1BoWDF4RzRMOTJuSlJvU2ZYbGltSVJS?=
 =?utf-8?B?Yk0zNVlDenZZRm9QMTNnbUE5cTg4ejRwWDhkZHErbXhraXR4alN4Zmd3MGZN?=
 =?utf-8?B?d2RjeEs1eXpydDh2VVZRamx4bjE4RHJJVkJqK2NSWXltbmIvNUFCUDdNV05S?=
 =?utf-8?B?Y0pDeTBnd2hqeW4wSkEzMmRUNE9RbkdEUFRGUjFGV2xCSVdidE80Tm44ZERz?=
 =?utf-8?B?TUJmS3Zmc0VYQisyTWNyeXp5VWwzQ25PTThGZXBaK3JCOVFkYmkwb3hjMmpo?=
 =?utf-8?B?L0cwOTJHU0cyaVRCV0s2SjlDZGhLR2xzUUpIK1Bpc2hOcFdIalkzVVBWbGpI?=
 =?utf-8?B?K24vTExQd3EzNEFJNTlNeUN6R29MNjUxbTNTcy9GUkNnVDRBV056blhKU0Y3?=
 =?utf-8?B?L3hDcTczem5SK2J0OXd0TlRnVkFrSE45RmJIRm9jcEVzMDB1NzdZVVRwckZR?=
 =?utf-8?B?a0VEODlzaDROTjZHTGlXTHlObldIdHJ0Z3VYbXg3WFBaOFFwWmdFRmliNGU3?=
 =?utf-8?B?L3crQkxYOGl1aDdRdDAyOHk1T29SR2tvZnFSVjdCQUlkRjdyZ2dwelVnQzdC?=
 =?utf-8?B?a24rME9qOFl0RitYUmpSdG96MW5FWE9ERUFuRk5SUTVoZjk2cHhBRUw3b0VZ?=
 =?utf-8?B?REUyanBpYXgwNTlYWk0xeDEyR3I3dUNyK0RUT2NONGpsNUxtZnFFc1BlVGZP?=
 =?utf-8?B?WmpoVjJDTmpOM3JpRU5LWXFOSzdXa1o0M3lWRFZaWHBTdWNoZGZDNWV1VmZR?=
 =?utf-8?B?S3RwTUtYaXpheERXVklScjRjVzFBNGs1dG1CVnF6bG5PRG13cFowbWRzWTZK?=
 =?utf-8?B?THFsU0RCazkrcUQ1cmQrcU92Ty9LY1F5VUFoemFhZ1hzU04vQUFrcUdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2h6M1l0RWdOVkM2OXBTNjVYZE9EVUJRcWtFajBJL0t4cjVhaDNtRDRyUEFT?=
 =?utf-8?B?MkozbXlwN3VYN3JGTVhkb21udEFvQnRycXdVQ2VnWVpUa0p2djBNY2NVRWZk?=
 =?utf-8?B?STBJR2MxVUl6QlFSOW1KRURkd0VTeC9OY0dpSWZndmxmUDFLMERXWmlOTVBp?=
 =?utf-8?B?TmVLbXRGYjY0VThRMUp6QkZLWG14Y09jSW5pbmJVOGpzUThETzJWU3BJWGhY?=
 =?utf-8?B?dFpvRllrdDAydTFvYnNJMnJJUUk0aUx1elVuRmxEWUFMMEhKZVpWL2oyMGRi?=
 =?utf-8?B?K1h1K0tidEZxYk5jZ05TcGZVWFN5WkwrYlQ1dmgwQ0lpRXBab3NFekRJZU1k?=
 =?utf-8?B?eUJsSTVXK3A2TFk3U2d0RVVNdXBYZ3pEUXV2YlNLdm1NemtJanhaaEFQZGdL?=
 =?utf-8?B?RFNlMHJqdWFEUnhSMFNWTmhtd08yZEZnaUU3N2hMSk9aNUFzN3B2LytJbUhz?=
 =?utf-8?B?QUFEb1QwVlgvZDZGQnlPZG1BWXMzdStDUm55bmx4L3R4QnpSRGxWNWNVdWM2?=
 =?utf-8?B?MmhwQmovM1ZEMUhuKzV1TGpoOW82SENxNS80aDVnZi9XVmR3ZGdHZDUwWFdH?=
 =?utf-8?B?S3M4ZWNabFAvd2VYVDlLSzZWSDZrUVVySzNtQktDNnhCYTFQYy9MQloxYWZO?=
 =?utf-8?B?cUNKUnN6ekdXS21ZMGg3bVpydjk2S0VpR0wzMXpLRERhU2hPY0hvblV1Zzdp?=
 =?utf-8?B?MEl6V0poNjh5SkxXaldiSzFUOElEZDd3WnRpWi96MmFHVTAwMFBsdG9FUENq?=
 =?utf-8?B?ektaM1ZEU3JVbE9Oc0MrbjdqWDFRcWV6RWlaaVcyb2NsN3NXcmthakFrWlZl?=
 =?utf-8?B?OTJRMjBGZktaTHZ1VHUrN0tPcTlFb3g5R1IyaVJVTjY2ZDhJcDhsYUFMMWhB?=
 =?utf-8?B?R3VHc3NBVUd0RHhDb0NNNjE0d3BMSmFGODlTbTROT210WmJwM2t1OFpDMi9M?=
 =?utf-8?B?SldjRHRYSE9Cek9wTE5rUXE2aEFYOGVZSlQ1RGNHMHBSNFZ4MlNuRitlWDlH?=
 =?utf-8?B?ay9JYjhXUnlZc2FKbExhWVVscTA2NnlYbFhHTW1DOXVhVGl2dmZ1cXBWUUhQ?=
 =?utf-8?B?dFVIMzE1bmpscEJmaDNlU1VvRTd4aVVpcCttaUR5TXVLRDRVNFplY0tLMjRJ?=
 =?utf-8?B?UHFBK3lRSG1PMVJoMUxRNmdZUzNCOE1RZFdaSVRCYzVHVHl2aDEzOC9LY244?=
 =?utf-8?B?K3I4c0srZjdPMUZWVnFjOVlHenpkVHhMYURwNTVxeFpwOEFSdFNGNWhOWndM?=
 =?utf-8?B?ZW92TjlaeWExUEQrSmp6cTNNNEFieUtSa01hRitXSUg0M0lMU1dNUVVwVC9I?=
 =?utf-8?B?KzJyRzhyWWZpd2N1dzNJUzA0Y2lQMzNCdVZ5SmpiU2VGUGE1THh0OVoyVytw?=
 =?utf-8?B?bDg5OC9QK0QwVVNkbnJKMWdNVmVJVGRkeEJLY0RRRkY1cFExZzlUZXUyV3p1?=
 =?utf-8?B?cStJY1lYR2NNL1hQVi9qNFJUaS9QQXA5Mzcva0ZqcWpqN1lQYnhFVml6ZmJ1?=
 =?utf-8?B?YVQyMW9XNFliRkNSSzluWmh3elpDVi91bGEvb1lJNHpnWk40NUUyL0sySmVS?=
 =?utf-8?B?NDVaS1o3cDIxVjdLRTFJc2VjZE5ybjdMaWVVUU9PWE95SUR2SUt5YWduQXRk?=
 =?utf-8?B?TklqVlJhTGxrQkVXNHZmUC9HaUtOYyszYTJVR1ZqMzZCMC91Nmx3Nmk5RkpO?=
 =?utf-8?B?SExENmVZbk1vRHhMS0cwV3Exa3JjNXhqWjhybU0rQUFkb1R1REo2OU1JenpO?=
 =?utf-8?B?U1pzWk4yQ3lqWVo1VFVEN0E2MFhvQmZQQXpUd3UwcUJVNzZ4VWJyMlRLc0Rx?=
 =?utf-8?B?Z2pWMXp2N0lUMzRzWDI4RjIwTDdCUEQ5U3NIcGNpUktXNjU4Vm9NNVNNK2hH?=
 =?utf-8?B?R3B3T2c2V2ZaQnVSNG4ya1YvZDNhWkFMWGU4Vm1xeEhwUU5TdGZBODZETy8x?=
 =?utf-8?B?VmJoaWY1VUNObnI0Q3pBd2Jpd29FbHVHNzFWK01pZjkyVmRvZ3lBUnJicjYz?=
 =?utf-8?B?NHlrTTkrOW8xTXJVdUtIWkViSE5ocmtZRnRaclNDUG1OTHBRUC9jSi93UDdh?=
 =?utf-8?B?SkEzcEdZSnZ1emZUeFAvYit0UGNvdXQ1TFVvbVFwOG5ZZXl0Tk9jaDVBb3Zz?=
 =?utf-8?B?Q21WbmN4NDNOYUlsYkJjOXFiendHdzVtZys4bGNxRm1xVm1ZaXViSGFsbzZ2?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 163c20f3-bc27-486a-d9ff-08dc67feb177
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 03:44:37.9776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8ccmCgSLXmdj6/01M2yw2QhBNQpf620WNwLkgQ1lteoZZMRi5Sj03SB3ah0gDod9jDuu1e5jg9bmHGL4vCq+qjP3uvjeT80qefKLBrSVuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8038
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


On 4/27/2024 19:23, Lucas De Marchi wrote:
> In order to detect duplicate implementations for the same workaround,
> early in the implementation of RTP it was decided to error out even if
> the values set are exactly the same. With the introduction of 18034896535
> in commit 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535"), LNL
> stepping with graphics stepping A1 now gives the following error on
> module load:
>
> 	xe 0000:00:02.0: [drm] *ERROR* GT0: [GT OTHER] \
> 	discarding save-restore reg e48c (clear: 00000200, set: 00000200,\
> 	masked: yes, mcr: yes): ret=-22
>
> RTP may be improved in the future, but for now simply join the entries
> like done with e.g. "1607297627, 1607030317, 1607186500".
>
> Fixes: 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535")
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wa.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 9d9b7fa7a8f0..db7c7c7875c5 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -449,12 +449,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>   	},
> -	{ XE_RTP_NAME("16021540221"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> -	},
> -	{ XE_RTP_NAME("18034896535"),
> +	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */
>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),

w/a 16021540221 is applicable to only Steppings A0 to B0 (B0 not 
inclusive). With your change, I think the w/a will be applied to all the 
steppings. Wouldn't this be incorrect? Please provide some guidance.

>   		       FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))

-- 
-shekhar

