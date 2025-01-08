Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1111CE77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 20:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22CE10E92D;
	Wed,  8 Jan 2025 20:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuzYi+ih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BF810E92D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 20:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736367343; x=1767903343;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WT7hud5gqEHYXA9Df3crZUx24Oo0BcTuQRbXd7PSNzM=;
 b=SuzYi+ih/L5lMTGdYphUmh0pAw4B1yrXIrYgmcgTSwYyeaKmd/gYFpRH
 gpHHRmcpQwvT40nW77WIJu8VGWf1AihWvDrVLuGoG+mtoPERQAtJGe/wQ
 grAuDeAKhANYMtLLZQmlG4/2w4hAnvhLGYmUHwCzZO9m5ocX3ieb9qLet
 33rzHxqkg7jCFN48W/tcQMcwF90KKTdUBNENbUPWDwfIvMr+cyyDpe2dz
 ok/0gJs3UFPGaCxHTmVgInBlyUqSak7+mPT1+1RARqDJqpMvURVGMgDeu
 /+phYyNh+nN/l6MBrGFfKKFUdkrBldREh8lCrumFovlGSkqq1FcO8badM Q==;
X-CSE-ConnectionGUID: 812gSfNPS3mPCMI4i+Isig==
X-CSE-MsgGUID: x6ixQoMnT42vXC1NJk9PDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="54157521"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="54157521"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 12:15:42 -0800
X-CSE-ConnectionGUID: +V64D3wLQOqz+sax/fZSVg==
X-CSE-MsgGUID: QbfGfUdQTAuQgm5UfWkDkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103065203"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 12:15:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 12:15:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 12:15:41 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 12:15:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDLfZB3pmevtFpHKuLT9ZgpDVihSKPJKPPEQVoQM1VUbQQECJLVhS/zHqgLZ9WA2gQLK3r9EC1JseFY7C2/PFqn5vWveLsYD/AnKwBxgDUX1xk9zaUg83/U1WwN1hY/xd7P/yJv0sGCl6Tnuw0RJgWH9Or250aWGPozeEc6txfdc9v3C5CWMqErqn9NPrh1Ty7S8VH06rLjtYbkj5LCNRUT1fcuJayrDmvT7IAUL4Xsld6AYEb+pWEPhPlnZqFwZcUmAbRvI5u1NjGe2CpqYzXnWBgyMDVsqvdq3GcDhTdOn472umL5K5LQ2ikslEBNfiGJb7uMn/lomGrjvFHP3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/91XOAjo7NbnmiCacp4rjgDIkxkuFH+Vgg/aQx3RLtI=;
 b=Sd6tEI0n0D3u6veTPF9eRSaYCfbVCy0mgrzUkbkYPXYhCPq/3y9powQ+6tNtYdB6H05mnu5Eys+GBt1G5CwoDa15lh2eGpML8dLrozb65ej3HdNqQoIrY3fapwsOnulIAXhuSTbjPryZ9IMTumvy68Wnejb1ezC6afq2cZcsC9g2Qd5bOhXRrrH6sFNoogBMEBzD7LpjBs6cFHyLqLgz1gukWXUEjMP/oksr6wHxhO3l8mkPln23xjFVpKs0/EGyrqzRxsggrKfbhuYWrgnGeh9nkH0EmqtU3PfcZzoi/GQXMMy9+MRIO3l/sSVWJFNJjN2amDFimDbgdl/pruz70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 20:14:58 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 20:14:58 +0000
Message-ID: <ef3c1576-74bf-4fbf-be8b-9ff8d24cc24f@intel.com>
Date: Wed, 8 Jan 2025 12:14:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Fix GuC log/ct output via debugfs
To: Lucas De Marchi <lucas.demarchi@intel.com>, Julia Filipchuk
 <julia.filipchuk@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250107202252.2642853-1-julia.filipchuk@intel.com>
 <3god5fzcfbzxwlssqdb6eenzedqkykv2scpktlk5uglgf2ro73@bjuq2knwuweh>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3god5fzcfbzxwlssqdb6eenzedqkykv2scpktlk5uglgf2ro73@bjuq2knwuweh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0134.namprd04.prod.outlook.com
 (2603:10b6:303:84::19) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: e8260309-71d7-4be3-e36a-08dd30211fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aExCdmxtMmFudkZDckl1cVB0YTdXRWl3aVVDSFh2bVJtQmJGVlN4WldtSVM2?=
 =?utf-8?B?dGJlcEtHdWswc2ZiRVZ0N3kyUEJ5TkpsMnd1RmUzRVM5UXNMR1NlUWtGdVNU?=
 =?utf-8?B?TGtTZVFPbW1QVkdVUEhqWDdQamViN2xYdG9JYjJ1MGppZ2k1cTd6Mk9DYnV6?=
 =?utf-8?B?cjl4RzFSMGpNR0VPZzAzT29icWZjRnk4eThYK3luZFlYZkJyY0tTSXFmODZC?=
 =?utf-8?B?clJyRmp4NUM1Y0dOcUdwNWQ1Qzh2OGlteUpXU2J5ME1XMFIwWG9ZVzgyd1lZ?=
 =?utf-8?B?WEJyTXc3UjJ4UFZGTnA5b3dxb09RN25DY3lSNDF4VE1qUElBOS9FenpLMy9B?=
 =?utf-8?B?RERHWVd2Z2JxdWo4N3NSbkkvNXp5b3F3cnV3MWZRYW9OUWUwcGdNUkRFKy9C?=
 =?utf-8?B?VUp4ZU1KUlUzYjFNWWJadXJqLzFqa3hKVHMwVEY2ekRZcTNaOGxFVHUyRnhs?=
 =?utf-8?B?Rmk3NVdQbitVK2RXQVk3WTEyc1JKaTI2RXhYUDdoekQyOS84MURabDJ0WlJx?=
 =?utf-8?B?Q0VhV3YvVWE0aFA2allaUHlJcVNNV0NhQXV6QWV5R25ZaTd2cVZSWVNYZGQ2?=
 =?utf-8?B?YUxwWUxXSHlJZktJdE9sQ2g1MklYaTVCQU1qbGdmRWp3a2VQY1ROSlpvdzky?=
 =?utf-8?B?SHVKSG5VcEJ2UFNYYnFjYnBFSDZma1prRUpRNFdRRnF5R0dXWnlQNUw1Rm02?=
 =?utf-8?B?RC9JaTJvd01YNC9paktRYW1lTFI4TEM3OTNMa21UeWY2cHFJTVpESDRxUTBT?=
 =?utf-8?B?SGV5Sk9zYXhKQ2tkSVBuTFJlWUpBM1N3dkh4QUlmOEU4ZUpRSDNIR1Z0NlJQ?=
 =?utf-8?B?Q1d3T2k1Q1hOZWRZaGoySTYzOTlYSTZTZFFqek5mU1VtbWZpUFVSbW52TW9w?=
 =?utf-8?B?VXY0L2w2cVJXR3FpbEFLMVd6OVRhS3pnVGp2SkxkL2dkNmtycUZaTkdEQk8r?=
 =?utf-8?B?N3hSdUthd3N5Q2hRWlRhNjNjR08vSGhBWXJUTVFSbStNSnV4TngzVjlYOHhF?=
 =?utf-8?B?TW44OHRPSUIvNGQyNTJieXkvY1V4bmw4OW9DZGlldUhMUnZjN1p2aHB5Uzlx?=
 =?utf-8?B?RXVlUzZXVDhkRGZadG1jVytVWTVhaWVISUpKTCs0TWljSlRVSHVmR1RLbU4y?=
 =?utf-8?B?ZVFZKzJrdmNjbWJHeTVYeXFSazFVQlBYM3dXcGZmNmVmY1hqcko3RFFPK3My?=
 =?utf-8?B?UFNnM3dlNzh2Z2kxb21USlN0QURRbUU5K1ZZbkJySytnYzdWTzkyeDRUQWFP?=
 =?utf-8?B?cWIzdHJ0UkpOWjN1V1Z3WmlkMU12SXhWdDhtVkgxZ3ZvVjdkR0FQU214TkRa?=
 =?utf-8?B?b2owWlIwY1h3SXdNcjhTempvN0dta2lpeGRRYUFXdEFlRiszZnc3M1ZBWjlL?=
 =?utf-8?B?azlmM2JNazdMcnNiREx0REZZYkg3N01uNWlEZlk4TXk0NXI2cjltTVhHVG52?=
 =?utf-8?B?UTJ1YWNBSUhvOU5JTWFNOEhNeVI2b3lKRngvU200bExBUkpQeGY5bjFtODNl?=
 =?utf-8?B?cXVidXlkWWRNeVVDZVFxTGQ4S0NmTnRPTkhXRzI2TkZBYUhMT2NhKzlUbmRj?=
 =?utf-8?B?emgyUFZ0cThlbElQNkR2M2xoQ29qRFAvUkpSWWVEcmlGMzM0alBJTUNPUHRH?=
 =?utf-8?B?Q0NKUHFlTUZDZGRzTmI4OUJqZCtqaEwxMCsrVU8vUlh0aHhNNEozNkNJQ1Fm?=
 =?utf-8?B?UmFwQVo1NW1TOTYza2NJSlNIRmZDZDMzYUM5VGE1WWl5WnZVWEN6MDdvaTRO?=
 =?utf-8?B?cWdIaFV5cWFCTG5KUk8vSzE1U3JXdHFqbE9ub3lLM1NFNmpINjFDNTFxZzF2?=
 =?utf-8?B?b0FUUUI0UEp0eW9XQ3BBRUQ2VmxTbEtZUjIxMkFRUEJ3MlNVVi9YNmNRc3Vz?=
 =?utf-8?Q?XpxWijA5sZgwm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djI3WHBwRStudlNuVVVROFMyTUFGbVpHQ0dEOWpCMjBuNHNMMWJDSURwbkpr?=
 =?utf-8?B?eG5QME9WZTlKRjBDVkZ5d1VUSUExMkhNS1NJblJSc0hQTy9HS0liRnh5QTk3?=
 =?utf-8?B?TXBnQytpQjhIMWJVSE93WHBWKzM1Zmx1U3RGVG9vMVFEZDVCYVRZQ0lvVjho?=
 =?utf-8?B?UzVOYlVGemh2S1ZGZ3lKaEt3azQrK0ZXY1JqUWVuRDlCTlpnQlNOTnNyTmsw?=
 =?utf-8?B?ZzAxL0w4T2Q2L1lpc0ErbmpVZFNaNnE0RjlJclJqTUNNRGtMdFJJcjFZcnky?=
 =?utf-8?B?anlJRXErV2VJUjJDYmZkTlFEVWhjcElYcDc3bVBDUytGSS9Wcm5TTlhJbDUw?=
 =?utf-8?B?S2NUb0M1enR0Rm50K2pWS2VSck03QWZCcC91RWRPS1VkaHhmaU5sMk05d004?=
 =?utf-8?B?S1RaL2JiRFloUGp6U0tpS2NHeU8weTZjWkZnZ2dsUzVodTFUVERpUHdTc0NY?=
 =?utf-8?B?NHR5UXZqSGhyYUFpUTRWVHYzNTJxM2QzdURETEhUSG4zNFFxekRWMXBka3RN?=
 =?utf-8?B?WEgzTjgzL2hnQ25lcHk4ZzBlZEp5V0tmTGNHSlJDNmxoZlVWajBZOVF5SjRR?=
 =?utf-8?B?cjZ2Q0ExYlJxcWZNei9yYzBMZ01wNUI3VVZrTUpoR0J1VUZFbzV1MGlLVFE3?=
 =?utf-8?B?djM0cVJFNzMwMDA5dmhaYXg2aTFWenlxZTBQb214MHhrNVJzaXJxNkl3UnRN?=
 =?utf-8?B?R3p5ZWU4czBCTjJQZkhKZzVqYUZmY1dnRzQvZnVBdGFKNDFtVnFDSGpzWm43?=
 =?utf-8?B?WjNBaTJOYWp2YlZIZ3ZnQVZLRlQ4c1VBV3dJZHhXUENuTHM0elYxQ0N3VG9w?=
 =?utf-8?B?WmVUOFh2RzJ3dzFpMnNIcGNIYTFmRy9JYmZCZ20zR25XcWxXQ3ZyZTlXUEoz?=
 =?utf-8?B?WWFqdnNOYUFIcXBta1JRaWUzWEtiZEZST3hQUnZRVkg0bmZVY3Z5dmptMm9C?=
 =?utf-8?B?WVYzaVBacGhvbWF3LzhWQmdESG1yWFdxSEkzVHR6NERJdzI2eXMvdXluQkRa?=
 =?utf-8?B?MjNJa3pIaW00d3lRR0tNUDNxamxOdDUxaTJ2TW5LMWVCRnFBOWI2NXdHb2dD?=
 =?utf-8?B?c1RFR25NdFlNMCsvY2hHa2NQY3BZUXV0eHpEMkVCcG9aUVZFVjBOY3NXbW1k?=
 =?utf-8?B?VFRRcUZVSGlJZUJKTHV1RjFOdUF6RmVJbStkdFZHeUJqSXdUNGVMRUE5aXZw?=
 =?utf-8?B?VUxTOWZUWlphRVdpaENheU00ejNiNnZTcnQrTkRsNlBtbUIxNWU5QW1ZUnBy?=
 =?utf-8?B?TitoVG5iN1NUYkhhUVhwejgxeWJTNzB3RkhTRzQ4MUR0TmozT212T0xHeHZN?=
 =?utf-8?B?aVZrelpBZ2M2NFVyWjlGclVLQ244Y0RGb2xYSElaSFdKblJpS1RSZGo5MWlx?=
 =?utf-8?B?VVNBOXROQWp2ZFY4RUxUR2dWSXRrYjZhdkpCMWRWeFFxUG5JVUc0eSt3QWNE?=
 =?utf-8?B?ai9mYWl4Y281L0xqS29VNDQ2cnB0NUxkZGt1b1BQYzNQb29BTDdkQTN4aGVE?=
 =?utf-8?B?RWZwMWhOQ2RBQlZzdVgyN1FmeWZvVFZvdGVPNnB1Z3pEdHJnSGZ4RTE0RW5I?=
 =?utf-8?B?bk9zRmhIQmxsMjJET3lBTlI3VEVad2RiSGlNNGcvTVRKMFU4c0hlak9ySUZ5?=
 =?utf-8?B?amkzK216R3lDczZOK0JDMDdYOExVTkh1WFoyN21qejMwMU8vM3k1YkQ4Wndl?=
 =?utf-8?B?SGFyV3pFd0VNYjZMUjA3SzEycTkwTEYxVThXQ1hpUDVYUTlucDRZc3FCeVVW?=
 =?utf-8?B?RGd1Lzl2R2JZY09rbVNkRHpaTThkckI3cytURm1SbmlsOEtNT1FxR3FEbVVw?=
 =?utf-8?B?bmZPSFZkNDlOaktxenF6VUJ3WTFZbDE0WUY0T1ByMEgwaE5uOC9xcnBSS1lj?=
 =?utf-8?B?WUcxcmFIQ0dxYThyNnpUN1A5NmkvMm5Pc29uMUJGUVlRck1VU2tJblV3WGN3?=
 =?utf-8?B?RmpxQzljZldnQ21yYkk1WlZ0emViVGJHbUEzRHlzYkFuRHdDZnJ5elFOSWdD?=
 =?utf-8?B?MkZTRXpweWRwZTlvQ1BWREN1elduaWp2eWJ1VkUweTlMbnZJdTIyelkzWWhQ?=
 =?utf-8?B?c2VoSjd0eFVuNklUZzVIVVF2dXMySWE3YTNRR2s0OFpnblVRVVRFT1FNTFNG?=
 =?utf-8?B?VUNpZSsrZlZVRzlYYUNGWkROU2lsMXZDTndPKzZUemNnVThFMHh1NFhNQ243?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8260309-71d7-4be3-e36a-08dd30211fa5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 20:14:58.1200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPskqLcIr8veVU1k+Gof6s+/g0Pw9Sup6mc82IVRyUz+6HTys6JuJAbuGLixfvCWLb+NLCcIWvwFRVzd1W28Xu90TWz+G4XKcEMkuTCp5oU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
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

On 1/7/2025 13:10, Lucas De Marchi wrote:
> On Tue, Jan 07, 2025 at 12:22:52PM -0800, Julia Filipchuk wrote:
>> Change to disable asci85 GuC logging only when output to devcoredump
>> (was temporarily disabled for all code paths).
>>
>> v2: Ignore only for devcoredump case (not dmesg output).
>> v3: Rebase to resolve parent tag mismatch.
>>
>> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
>> include/drm/drm_print.h             | 2 ++
>> 2 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 6980304c8903..8e5d1f9866a7 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -424,10 +424,12 @@ void xe_print_blob_ascii85(struct drm_printer 
>> *p, const char *prefix,
>>      * Splitting blobs across multiple lines is not compatible with 
>> the mesa
>>      * debug decoder tool. Note that even dropping the explicit '\n' 
>> below
>>      * doesn't help because the GuC log is so big some underlying 
>> implementation
>> -     * still splits the lines at 512K characters. So just bail 
>> completely for
>> -     * the moment.
>> +     * still splits the lines at 512K characters.
>
> did we investigate where this is done and how we can overcome it? I
Yes. And the comment could be updated as part of this patch to make it 
clearer...


      * Splitting blobs across multiple lines is not compatible with the 
mesa
      * debug decoder tool. Note that even dropping the explicit line 
wrapping
      * below doesn't help because the GuC log can be so big it needs to 
be split
      * into multiple 2MB chunks, each of which must be printed 
individually and
      * therefore will be a separate line.

The dump helper could be updated to never add any line feeds, not even 
at the end. And then the burden would be on the callers to add line 
feeds as appropriate. That seems extremely messy, though. And it will 
break the dmesg output facility. That does need the line wrapping at 
~800 characters which can't be done from outside the helper.

>
> understand having to split it into multiple calls, but not something
> adding a \n. particularly for the functions dealing with seq_file and
> devcoredump.
>
>> +     *
>> +     * Only disable from devcoredump output.
>>      */
>> -    return;
>> +    if (p->coredump)
>
> but we do want the guc log to be inside the devcoredump, so rather than
> adding more workarounds, can we fix it ?
The simplest fix is your suggestion of adding an extra white space 
character at the end of the line in the helper function and updating the 
mesa tool to support multi-line output. That seems like it should be a 
trivial update to the mesa tool and it keeps the KMD side simple and 
consistent across all potential output methods. But Jose seemed 
absolutely dead set against any updates to the mesa tool at all :(.

The more complex fix is Joonas' idea of using an official structured 
output format of some sort - TOML, YAML, JSON or whatever. Something 
that ideally supports binary data and compression natively and has a 
helper library that can be included in the kernel source tree. That will 
then remove any and all confusion over interpretation of the file 
forever more. But it would require updating all userland tools to use 
the appropriate helper library.

John.

>
> Lucas De Marchi

