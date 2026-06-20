Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CC0CD98F2
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jun 2026 19:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325BD10E286;
	Sat, 20 Jun 2026 19:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kh+Wdenw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6D710E286
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jun 2026 19:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781983803; x=1813519803;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IDwfBI2T3TZGNz4zhidnVqIjNWYCbBQadtbphj31RU0=;
 b=kh+WdenwktQuHYAYGXaft9ahz7BEAhswcuQeOVrDJqLuwkTl3MBYG7oa
 oeW2LYULc8MdggeZf9CF48+lpbu6/Tn+K0QQngRAiIY2KDznPYU9djrfc
 VRP3T8Cb4GfrfmjXTN/IlS46LYOBh3zMfqepioqbcU7AAS3kV57HV+bsg
 o9fUmtgnAE/r6KtxLCny14geQge3/uCkygI0A4VPri2J4i0k/Iryk2Jjm
 PUxn5ts+Q9JoSyjWt92BokN4qICBX+A3T+4QJt93u5GKPTfLAegktg7Zm
 hWXp0LqWJLirlL35v+9EC1Mm16WGQNFj5pCLFxQe7hsaAIcldrX050Clr Q==;
X-CSE-ConnectionGUID: VejIgUWcQkOpdRt4or1PnQ==
X-CSE-MsgGUID: b3Dk2haOQTaoo4fdI1tIgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="81879539"
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; d="scan'208";a="81879539"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2026 12:30:03 -0700
X-CSE-ConnectionGUID: b65GG5dKSzuRGbcQbZSBfA==
X-CSE-MsgGUID: dPShjY1JRH2N9M2igALMbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; d="scan'208";a="272564313"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2026 12:30:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 12:30:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 20 Jun 2026 12:30:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 12:30:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPP8qzu0YetGN9pf5QirVwKSXFzCN387jjdJxZU6hEFcS7N2LsL5y2bOWg8LfgtN32yjy63u49U2KoyUTLCuOogTMnJu/wyx8kD2BjvMo1+IA1+a4d6VpArdv2yoQnq6OVK5xNXRq99kYvfKE+aYfDswtpqbsc3kC0BheDi4Cac1wzhARkP+pl1J4kezrXW7qba5R29fehms/o5CT8j48/+V0bM0lJ5eX5hZTW/RI55tvQUE/C82rp8v0zIXJsUhHY6fxm0CH6Ud3nMF+LHJT9hojV9hzvFuzQVgSkrzvEcIgkyvpfPJw8LfWrSnV3hVQMCS5Cxa/K3vFNKmhBqXlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugHCF7uHUrXAAwS8BX2DW6D8WlGBwKOikLQ+e1HQjQU=;
 b=se/Vy3RNDQLZC0UYkmulLYnGH3s5fBIHpEP4fYo5//F3+vO7ZT7EQ61y+Rk+3xX+RFjavqA6uOfOufFI1AeYXabWpEKY9XLICFGXHnpN9/t+4UicDBr5wR+PHe03BIW7I9htOud+1eL+ZDiriWG23+yTIVyv73EkyAanjY6JDAZ6ZseHk/tDIbNXt5B6wYQwypcvLEKOP280CFaJfNivH7kf5NuuznC8bpWUcjOozhbeJOh7Oye8UXKyhURKTZPh0P1ccxfC0vzM7wt8sQTSA1C98NlCEgiJ8IDH2I8debsfaS4kX93ctwSNst952uasL2ZvJoqSwXBYhohOvSIGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB8057.namprd11.prod.outlook.com (2603:10b6:510:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 19:29:59 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0113.015; Sat, 20 Jun 2026
 19:29:59 +0000
Message-ID: <6a1dbfd1-9fce-4f02-85bd-7d6038f41ff8@intel.com>
Date: Sat, 20 Jun 2026 21:29:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/3] drm/xe: Add RAS logging helpers
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-7-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260617104711.79646-7-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR08CA0007.eurprd08.prod.outlook.com
 (2603:10a6:803:104::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: 75381d3f-6341-4e30-1200-08decf025144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|3023799007|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: C8yC7PKotRtz3418Hc6430PY1CzSUuC+nz59tcSbgarALKfPcjFp2/xGNZ9DZS/0WDD1jkvV8nPsf8mrADnWpMOKbcKiFhpZD33y8H6PMclwZPdXH+Zn6A29voxS0LaUSEnD2W/efABJsCj6Ym7r/k8omM+WxpPw/CjChj7HAme4NwtGFoAQy3VQTbxwcqa+pcJwUVeROzpMY8RnRagX2iAeF731BSkQxSup1ITFuJtpFY8rVuerGMH6zLzLtB/7y4jWIuDZMjCi5IjFj7bD/4R1MRHCMdQ63nPuuo8HXwsqKVdoJMqylDBiO0vGXnTpamM0gAs5eYWhVkwufRlgTiGgSQ1YjUL0hXIhxJpt2mfGLsaJgaWpQ1NRPAory+KwvKLaTHQu6SyVZUn1whguGwQBTGTaDcY9rxdE0IUVgIMZEz9IOVgL20/9pMHWu5jPPenXweqBepcFuyUJxMpfq3y4qYdcXPYxnTVrF6dYNDKiYNwmDdUwQogvL5BpDH/mBHMYy9Is28veT4xYHUBaYfPUkEsc9267RXcCgCPm8o4b26UC8KAgA/ytPSxDX3E/2FSOp6sZgzKwpVxBG5Tczg84sKTRxedus1OI8PeBkEwa6WewrLJxHa3Nt7rnCOsYu2IF4yN0AeOEdxtPlsRaw3cPHAuYFI+iR37OdGqqqEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUg3SUFXMTVkZDlLTWQzRUp3Q3Q5VFd3c2NHUktzaWd4Uzc5WmxoOUFzaGpM?=
 =?utf-8?B?ZXRrL0FrMUdRczN1VVljYzkxVXRCSGhOTE1VQ29scGZ0UytGMVdrTE9jQ0ZZ?=
 =?utf-8?B?bDlWcXErN043ZU1lNUs5MG8zU0hNemFwQlpjYnI2M1VRYkJqdGFJMnRQUGtt?=
 =?utf-8?B?aWxSZEFYeGtYaTZKRm9aUDc0WTFTbDI3QVBVbWFBVitPSWQ3NXRJNVBrWTlu?=
 =?utf-8?B?S1NsS0FUN05VUUpDVjhadFNCZ2FDaFdRTnBCNFdZQzVFUHpsZjVlVFF2ZEF1?=
 =?utf-8?B?RE5teHJOS1dFNUVQNFJlVis4YjBiZDlQdlR5cmpXcTFDVU5zbndwdndOd1ZE?=
 =?utf-8?B?R1hCOWRJM0F0NEp1WktqUkNuRHNHM1FBalVUWUFjcGYyQWloNDlObnh3ZWJ3?=
 =?utf-8?B?MytVMDU1UGVmWTZ2MWlxSGZ6QVd1Q1FmTG5lVmZINThBK0VyMHo5elZ6TXdO?=
 =?utf-8?B?dUZaTk1zUC9iQWYzWGlPZ25Ma01pQitPQ2x0ZVZZUTBCL0M2VFFzdGxxZnVm?=
 =?utf-8?B?RGtwMnI4T2FGT3NwTjlOcEo1em9lOG94ZlN6N0ZEYTNqdWhNRXE1S0h2dnNG?=
 =?utf-8?B?ODgvQzFCc2lXZDBJOGZYL2lPc0RTY1ZUZDhkNGZtM2RHeGVhVEh5ZkVidHNO?=
 =?utf-8?B?M2ZVTm5wZ0JQbnppeGZucVduSi9abFlsRUlTQ0VETDNlMElWYk9PaDJlYXp1?=
 =?utf-8?B?bTJWWnZaZ2dsbFhUV3F5Sk5vWDR0bUhXVW1abjd6UWMvMXZYNWZkQ2owZnRN?=
 =?utf-8?B?VDJUT1k1eXkwbkU2V0p2blh5ZEZvK1VIc250TFk4aStLWWg0WFY3N2hGanVo?=
 =?utf-8?B?Znk1UFhZSHRJN2dOYUNwdi9IZmNUZHFONHZTZkNzWEFQalNJcVc0M3FzT05j?=
 =?utf-8?B?RHBHMjFuN0orNTd0TFFwL05kcU81T3dYbWpKcEpXY1g1Z3Z5MVV0cE44TkxJ?=
 =?utf-8?B?UW8yUERjTXk0WTNkbUNHdk9qL0tIZTR3WlVieVJVam9FMDdsTzVqaFU2cjYy?=
 =?utf-8?B?WHZNUVFkS0hISlJBVlpCQjRIcUhPZ1pTWXYzOTFMSWs4S1JMMElBZ0d5QVZx?=
 =?utf-8?B?YjdleDlTYjBub3JnWHhvc1VHU2x6dUhlL3RMdU1rdXdFT2ZhYmtDTm5mdFRn?=
 =?utf-8?B?Rk1zNFozK2Mwa0pPNUVHa20rSENaMmNNSk1qWXpRT2lnUEhRRVd5NUlVUHRY?=
 =?utf-8?B?RGZ6bGE4azQzM1BaRy9zOVBiSTNrMG1VY3JuamxGY3BsVGZvQ04yMWNzQ1Na?=
 =?utf-8?B?U1h2NFI5UUFPblR3SmdtRnQ1dUVZMSs3ZVVCMzZqSXVkTWpqZ2FobTFDWkM2?=
 =?utf-8?B?YUtqRWsvc0JuL2IydVk0NHRiNzZxeVVRWUJOQVRVamVMSitSRHJFdHF4eUpn?=
 =?utf-8?B?NHljdHdSMUZKTFR2T2FzajdLVGlHWUkyRjEreEVFV2xwSUFjekhPYVZQTjJN?=
 =?utf-8?B?bmNXUjhTbkZYTFhvTStJNXM1MnZoTGRTays1aWN5dzZjTzEvdEhBVUh2eFlI?=
 =?utf-8?B?ZXVncVlndFNYUVZUbXhLdVBkWVBtK2p4NEg1Y0hYSWE4Qjk3Ny8yRVFvbGhW?=
 =?utf-8?B?TnhtVnVxc2N5MkYrSE5qRUlJUUYrN0xIamFOMENYSFBMSHFnL3N1TmdzcWUx?=
 =?utf-8?B?Y0pYRnJOeER2dmN5SWxPdCtPc1J5VXYrcEtnYlNSUWhoSmhML3dkZlZCVVh1?=
 =?utf-8?B?bEJCclNGVXFwc0pkbVIzS3dibGdXS09HK1hKZEU2aE92T1NEeDhnMjAvejJR?=
 =?utf-8?B?MjFGbGFhUm9tRlRJZ0VQMjk4Y1pxT3BPNTVwMElkdW5pbXlqdnVwVnZYdXpH?=
 =?utf-8?B?Y1RBNTBnWm5Ld2pYL3JOcFFVYlJseUFOR2lCQ0VnTFZaUmVwRUVtajhHK3dE?=
 =?utf-8?B?bmsrMVEyUjZXekdPNmRCcmU2cjJHeFk2QlFIUzA2L09lNFJVbWZYZlpKYUR1?=
 =?utf-8?B?eUJpd2I2R0h4SitiVUpML3Y5bkFXeURFRW1QY045UHZ0bWRGQitVbThjRXBi?=
 =?utf-8?B?Rno3by9IWnFlRHVJOVdmbWdLTGtkQlhxTzVDZVJtUHliWkYvQXR6Nk9nYU56?=
 =?utf-8?B?a09vSTJpb0gvOTFNRk1MdjN1MndZZlltUnhhYjg3L2pmWlA5TDRLYU5MVkFE?=
 =?utf-8?B?VmNHUHlFdGRIcTI3czFobHJKSTZuMUM1amZQWVpnM0g1Zjk4UFNSd1k1UG15?=
 =?utf-8?B?RFBEQ2lkekVNMTgrR0VuSThoRFlkQzhUM3BPMjVOekRwN1JaVjRsWWxNYVdK?=
 =?utf-8?B?MUhxY0NmQSsyWHdydlFKSDgvd3RvNXprc1VDWXNERU95aFcxclZlUXp3T2I4?=
 =?utf-8?B?UGlTeGhkTVdOL1hyQ1dVUThFV0hSa0JqbXhEdnA0enB3TllQcVpualdaOWda?=
 =?utf-8?Q?atxAPqC66BFb06Mo=3D?=
X-Exchange-RoutingPolicyChecked: bdsrh477DZhVXADfO/xDBIcDR01V+/NJJk1fLuNOoA9FUUJpr4VLPliow7iLrKqibTZtKzQofEmZmNo+ZTIot6w5CMmxIOhhpUsq064rEojEnI6lbUGrOJFkAFPvT1sjJPCXJGABhNE3nwYESN6lP3YdVJJvjYGCdZFi2SzpDLKj/Stz80JPuayNAP5o6ALdxDaj783lRel2BwIwXucNpUG3LRlfd9LFTczufXg0TsX3/amI59oslc4QapSH55BkDP/ucCC4V0qwKBMeHYASXCug22U6OWAbNrkfCxMmrB/ncw7dtdhkueCl0g2AvUm1vuV03RsmW6wXxGaekmYT0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 75381d3f-6341-4e30-1200-08decf025144
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 19:29:59.5154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZfNGzFo9qoVqxI+UBWxIyTFh/8rlecf66PuxB/4kSc+6YfobcbkELZZ3UQ6DoYt2QuZbqDO9kBPFIdkMmUTbDyFVG+JaFCy3nCZxOjvNQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8057
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



On 6/17/2026 12:47 PM, Mallesh Koujalagi wrote:
> Add xe_ras_log.c and xe_ras_log.h so the driver can report
> faults in a structured, machine-readable way.

hmm, but the dmesg logs are mostly for the human admins, no?

> 
> The core is __xe_ras_log(), which emits a single log line with:
> SIG_ID, severity, location (device or tile/GT), errno, and message.

our dmesg logs are already to some extend structured as they contain:

	severity:	<3>
	driver name: 	xe
	device name:	0000:00:02.0
	subsystem name:	[drm]
	error tag:	*ERROR*
	location:	Tile0:
			Tile0: GT0:
	message:	GuC mmio request ...

> Fatal faults go to drm_err(); recoverable ones to drm_warn().

note that we already have xe_err() and xe_warn() wrappers

> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v3:
> - Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
> - Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
> - Move __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
> - Make macro function properly.
> - Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
> - Add sig id documents. (Riana)
> - Change macro function same prefix as the file.
> - Handle __xe_ras_log() function with variable format.
> ---
>  drivers/gpu/drm/xe/Makefile     |   1 +
>  drivers/gpu/drm/xe/xe_ras_log.c |  63 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras_log.h | 108 ++++++++++++++++++++++++++++++++
>  3 files changed, 172 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>  create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e7b146880f4..607c9b099d03 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>  	xe_query.o \
>  	xe_range_fence.o \
>  	xe_ras.o \
> +	xe_ras_log.o \
>  	xe_reg_sr.o \
>  	xe_reg_whitelist.o \
>  	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c b/drivers/gpu/drm/xe/xe_ras_log.c
> new file mode 100644
> index 000000000000..0e836ef5dcf6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_ras_log.h"
> +
> +/**
> + * __xe_ras_log - Emit a structured RAS log entry
> + * @xe: xe device instance
> + * @gt: GT instance where the error occurred, or NULL if device-wide
> + * @sig_id: signature ID from xe_sig_ids.h identifying the error class
> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, etc.)
> + * @errno_val: negative errno describing the error condition
> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Formats the message and emits a kernel log line via drm_err() for fatal
> + * events or drm_warn() for all others. CPER record generation and hex dump
> + * are planned as follow-ups.
> + *
> + * Format:
> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno = <n> Message = "<msg>"
> + */
> +__printf(6, 7)
> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
> +		  u16 sig_id, u32 cper_sev, int errno_val,
> +		  const char *fmt, ...)
> +{
> +	char loc[32];
> +	struct va_format vaf;
> +	va_list ap;
> +
> +	if (gt)
> +		snprintf(loc, sizeof(loc), "tile%u/gt%u",
> +			 gt->tile->id, gt->info.id);
> +	else
> +		snprintf(loc, sizeof(loc), "device");
> +
> +	va_start(ap, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &ap;
> +
> +	if (cper_sev == CPER_SEV_FATAL)
> +		drm_err(&xe->drm,
> +			"[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
> +			sig_id, cper_severity_str(cper_sev), loc,
> +			errno_val, &vaf);
> +	else
> +		drm_warn(&xe->drm,
> +			 "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
> +			 sig_id, cper_severity_str(cper_sev), loc,
> +			 errno_val, &vaf);

again, this is not a very friendly message for the human admin

can't we just add severity/id pair to our updated xe_printk macros, like

	xe_err_fatal(xe, id, fmt, ...)
	xe_err_recoverable(xe, id, fmt, ...)

	xe_gt_err_fatal(gt, id, fmt, ...)
	xe_gt_err_recoverable(gt, id, fmt, ...)

and print sev/id pair within single tag:

	0000:02.0 xe [drm] *ERROR* [ID=123456] *FATAL* format ...

> +
> +	va_end(ap);
> +
> +	/* TODO: Add CPER record driver handler */
> +	/* TODO: Add RAS dump cper hex handler */
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras_log.h b/drivers/gpu/drm/xe/xe_ras_log.h
> new file mode 100644
> index 000000000000..08318dea75a9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_log.h
> @@ -0,0 +1,108 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_LOG_H_
> +#define _XE_RAS_LOG_H_
> +
> +#include <linux/cper.h>
> +
> +#include "xe_sig_ids.h"
> +
> +struct xe_device;
> +struct xe_gt;
> +
> +/**
> + * DOC: RAS structured logging and SIG_IDs
> + *
> + * What this file is for
> + * ---------------------
> + * Use the xe_ras_log_*() macros to report faults in a
> + * machine-readable way.
> + *
> + * What is a SIG_ID?
> + * -----------------
> + * A SIG_ID (defined in xe_sig_ids.h) is a stable numeric error class.

hmm, so a SIG is now a CLASS ?
in the prev patch it was described as 'GPU fault signature'

and this kernel-doc for SIG_IDs should be in .h file where we define those IDs

> + * It tells tooling what kind of fault happened, independent of message text.
> + *
> + * Driver SIG_ID classes:
> + *   XE_SIG_PROBE         - probe/init failure
> + *   XE_SIG_WEDGED        - device unrecoverable

hmm, in drm_dev_wedged_event() we can specify recovery method
so what unrecoverable means here?

> + *   XE_SIG_SURVIVABILITY - degraded/safe mode
> + *   XE_SIG_FW            - firmware fault (GuC/HuC/GSC/CSC/PCODE)
> + *   XE_SIG_GT_TDR        - engine hang or GT reset (TDR)
> + *   XE_SIG_MEM_FAULT     - VM/page-fault/GTT error
> + *   XE_SIG_IO_BUS        - PCIe/IOMMU/MMIO bus error
> + *
> + * HW SIG_ID classes are hardware-defined categories, reported by firmware via
> + * CPER records (for example XE_SIG_HW_DEVICE_MEMORY). Driver code does not
> + * emit HW SIG_IDs directly.

if HW SIGs are HW defined, are below IDs also defined by the HW
or HW just defines different components, and we define IDs for them?

> + *   XE_SIG_HW_DEVICE_MEMORY  - device memory errors (e.g. ECC)
> + *   XE_SIG_HW_CORE_COMPUTE   - compute/shader core errors
> + *   XE_SIG_HW_PCIE           - PCIe interface errors
> + *   XE_SIG_HW_FABRIC         - on-package fabric errors
> + *   XE_SIG_HW_SOC_INTERNAL   - SoC-internal errors
> + *
> + * Why this exists
> + * ---------------
> + * SIG_IDs let RAS tools parse logs reliably, correlate CPER events, and apply

dmesg is not reliable

> + * policy/thresholding without depending on fragile string matching.

if the whole idea is to group our errors per fault class,
then maybe our macros should be used like:

	xe_err_fatal(xe, CLASS, fmt, ...)
	xe_err_recoverable(xe, CLASS, fmt, ...)

and output should be:

	0000:02.0 xe [drm] *ERROR* [PROBE] *FATAL* format ...
	0000:02.0 xe [drm] *ERROR* [TDR] *RECOVERABLE* format ...

as printing magic ID numbers is not very friendly

and any 'machine structured output' should be exposed elsewhere?
maybe as sysfs file on the xe module level (to catch probe errors)

and maybe start with that alternate method first,
and use dmesg logging only as a best-effort informational step?

> + *
> + * When to use xe_ras_log_*()
> + * --------------------------
> + * Use these macros when the event is:
> + *   1) a real hardware/firmware fault,
> + *   2) relevant to production monitoring, and
> + *   3) clearly mapped to one SIG_ID class.
> + *
> + * Do not use for all logs
> + * -----------------------
> + * Keep regular debug/info/driver-state messages on standard logging helpers
> + * (xe_gt_dbg(), xe_gt_info(), xe_gt_warn(), xe_gt_err(), drm_dbg(), drm_info()).
> + * RAS macros are for structured fault reporting only.
> + */
> +
> +/*
> + * Common backend helper
> + */
> +__printf(6, 7)
> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
> +		  u16 sig_id, u32 cper_sev, int errno_val,
> +		  const char *fmt, ...);
> +
> +/*
> + * Driver-facing reporting macros
> + */
> +
> +/* FATAL */
> +#define xe_ras_log_probe(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_wedged(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_survivability(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +/* RECOVERABLE */
> +#define xe_ras_log_fw(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_FW, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_gt_tdr(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_mem_fault(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_io_bus(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)

IMO those RAS customized macros, should be per severity and take
a CLASS as a param since there is much less severity levels than
your new SIG_IDs fault classes, so it scales better

	xe_err_fatal(xe, PROBE, fmt, ...)
	xe_err_recoverable(xe, IO_BUS, fmt, ...)

and I'm not sure that there is 1:1 relation between CLASS and severity

> +
> +#endif /* _XE_RAS_LOG_H_ */

