Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2DCC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 11:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D2B10F466;
	Thu, 10 Sep 2026 11:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVIY8WFt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501B810F466
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 11:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789040018; x=1820576018;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z3wgdCLxMnlkvpntvi3ndFclv5N8ipxfZ0pAUtrBb50=;
 b=PVIY8WFtDEUGWDmnmx14uU33kIws3FV4Y33R02hqJFG+L8z7V7O+p3qJ
 ectFlFYQ+Q5Lig3HKW3qqF+IqKvauSoXhQgyoocnKYXmqaZvc6zWc3tNE
 ZaAUeIq9GrrEdITPmFHTg7wck2uIs/FFcJ3nUr6mgwKfY7LEIG9Rwrboe
 iJrD+TrWW5CySWU5etWULGvPMOic0W7k3IR8Hzl9zVx8kKjzY1Fo2O5bb
 oB5hqTRnZ4aRgrMI2mvcX7w4kTn8LhvwQw0+VwNYrz/nSpK/CSl2o4s0k
 c/Io++daaQNjZWdjDfp1slzxhnnmJn5j69nv7ZnWX7xNUf9oISoD4u3g3 A==;
X-CSE-ConnectionGUID: Id3R/pVMQIyt1aeZ5LVD3g==
X-CSE-MsgGUID: 5tcWlwwzRtCLVY6x0zFC4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100840468"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="100840468"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:33:38 -0700
X-CSE-ConnectionGUID: MH6jCqQ7Sk2Yx2Wvot6tpg==
X-CSE-MsgGUID: coTdnwcuTvmXR/cDRIMvaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="301493615"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:33:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 04:33:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 04:33:37 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 04:33:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLF+9RqHCQ0EMNgf5WvkkRj1oZB81l8PM+Q0B6JqaD4P/iOS5CRR5tqfVpO4590sUmcoBitwyyYcQoPaaS7xF74DgDGrermh3NLhBlSwbSx9WU5jLSHEr4RKh1BjTBl2bCX0Y+uk8WDiFBmtoMBilRMdwfCrDhcF0p6Xo6HriNIaNMfqNsOov1BDduc3w7PX7MPwEgBpVelFeO48ysqqoZkTRM69O9woDjYAXeOMrwDUMpn/fnccL5cG7h/jGV1+tkjFnt9sEt2a2KJ+5K7Xj4KPHu9GAG3Mam+dE8/AzQaUwdbNicMfb/57iYvsYlXqhoXOGyo0OXweOfbIpFfYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFj5HZtgxjoByKMsCvyql5vjnh2JqtEPI9kTHb6xXeI=;
 b=USl8cxSVZjQRHypp3NpzB0bw9cvzSe+GTLFWPKthnExCZCIR686GNTrCAndSBmj2DTA7VVM7SmyeiPajytJ91ZXLL3MS4W8udWFMvpA4J3juUTXFxsDFLgSs/NJRtnbQoGU9nWBRe6K+Iv5WHeTLnX3XZiDnGyYDDdE2491QcXm+4LtW2Q6rScYNXfwsK4wudGT8ECeQHSQtY0ekkOFr3rQt0CVNE5gozsbhr6H6/VDpUBrmjyrMVe8c2r1+JyoWj6NnIIm/I+jpWhlpkEd1/xVVYWGmF1x9eD+2E6MNB897sKJnjWVL5ev4R+6LUS0dMZYGH/WYE2w6x0j3zyV2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:33:30 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 11:33:30 +0000
Message-ID: <da5dfa60-5f0e-4dfe-ba40-eb02b1da803b@intel.com>
Date: Thu, 10 Sep 2026 17:03:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe/hwmon: Use VRAM temperature sensor count
 from thermal config on CRI
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
 <20260902175507.3910573-3-karthik.poosa@intel.com>
 <aphuND-AkxP4_XQw@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aphuND-AkxP4_XQw@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::6) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SJ0PR11MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e470f2-9e0b-4a36-9f3d-08df0f2f5664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Tuk7K0z9Dsv71eZyBze3g/uwbOmp2mXxS48tceeRNbhBnrWckfKqN/oyQbyACvyNEQCs4cp/E2zNmr5dhTZqTxg+UwDjK1QYJ7cf6xtbRUhG8BVy3TKg1ah5LN36kzdrwUtsBDFVCVCfi0FmwGHpcrD9frfyy405fFV1+xX87jjvmlgzA0ecEPLkBtNOF9MbpC716U4GvJrUlLATWMnWGVhHVVXDDyPR+Val24P5LZH9h9NpfnxEFKQPoz11UTP9MPX1osNYQvkQaRHmnjbdtPfDae+81Jgt+hSfBwW/V0SPccSTzKXhTBfvhzO705OWnH/BN863xVQnEtg2+5mNLvFPS5VMEYjmgnWeAsG6p7497uHIQh946l8h7iUfkyjVjiKXNFkQEXKfm8LUxyIskRIgkorJIA73TsfjN1N97eQuKGqYmyVu5jWP0Mm6BSO5aAz/EKmdTD0LCRPdvCHX5iR5STSeC23bzIy/8sKEiqwOsYfKZmPmYGBY5HAgXoOb2S3o5BeOhPZ1u8ZuL+7wcIVf3fvKN6rfg8w+TD+W3bMJPjm8wrACJzUp5yZ9iEatAKSRbIJEIBibszZwYDNYhJ4Zb05PDp1ai/NOnJ1cThHt9cB5q1fW8T+SyyGm1s0c2+AXpg5bqTlijHxJZBgQPT808bDa3hdaYrGzJdpW+HY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUZJZ2dlK3FDYmF3N0RiTHdhWXJQVjFoZGYxVDFOTnNNY2o4ZVprMHArT0tO?=
 =?utf-8?B?UGpjYkd2VWxKTmxDczBRbG1TdWxBNm9ITk5tbVVDZndIWW5xOXBIVkRGc29G?=
 =?utf-8?B?aUxKREc2NzN0OVlIZ3I0L3JMUWo5QVdnVlJocjJsb1BpMXdNcy8xWHBMNU5M?=
 =?utf-8?B?RGppeDRzaTBJeFdwdjhqTW0xR050UmZldjE0ZkNxYUxIeDMxRHYyUmo2YnRZ?=
 =?utf-8?B?QThqcmRtYzNaZFYzdVgxaFJkdUQ1eVQ5azY0Wld4enBRMU9mV2JYeisyRmFW?=
 =?utf-8?B?NEx6WjFyeC9uYjRKQjZ6c3dCMnNhay9oSGhFdjJETnQyZkF1bFIzbUJ4QVQx?=
 =?utf-8?B?MmhnYzF2ZC9DZHczVkMyZHNncUlCcXBwd2hNRWxvYlNUcU8zaEJldloxckVy?=
 =?utf-8?B?SjBQNTBkZGN3Zk9ram5BU3N3bjBUVzBseGFXa1U4ZWxjZDdEWUpMK1NpVDBZ?=
 =?utf-8?B?UnE5cmFRUnBrektZT0RiQUlMWjNBSE5vbE1vbXZpb0F6NHM5b3JNM1lMTWkr?=
 =?utf-8?B?NURBMXZHY01lM1BXRFp0QWkzRVREYmhBQ1pYbHBDNXowYzFrWXg1OTdQVkRS?=
 =?utf-8?B?WGw2R2xmT3ZWOHdvVm15UzRhLzg5dHdMb09oRWJMaThsZXYzNzFXQXlZVDk5?=
 =?utf-8?B?czloelQvUHdFT2QySW04L1YzeDUxeDdUNWRhOEtoZVkxNXNNbTB4VTRjU3J6?=
 =?utf-8?B?Wm5VejFlRVJTbUpmeDlOSmJ0YVdPdmR6cENIdlE4NU5yb2x3U2xybnFOR3Ux?=
 =?utf-8?B?b1NVOGpuMDB6amxqN0RjdnU0Qk5YVUZEOVdoR2N1ZUsrcUVCc3lyZzhGUk9p?=
 =?utf-8?B?OGNibkJ1MVpkdWw4SzFiamQ4Tjk3NVVtQ1Fwd0IvUmx6V3ZhbEJDQWtLWmYv?=
 =?utf-8?B?SUQ1WEhacHZpMnZ0TnlaandBOEVpZTJwMmhGY1QwaTErb1ltMXVCbVZQNnlZ?=
 =?utf-8?B?bFFNTEZYdVoxb3hhZXUybm5UYzQvT2pvWGdtaHZLbi9oUm9xbVBmMjVtMW9D?=
 =?utf-8?B?cjBld3ZuaVV6eDFycnZhZGhYcHNHUTlnUUJKWkE4TDNHUXRHbUpWa3l2eWlQ?=
 =?utf-8?B?YjhEc01BNnVPNFFFcDlzVkVkSDRDZnpodnNSNm9iWFJqT2RTL3dkSHgwRTBQ?=
 =?utf-8?B?aTZxZVJZaDFEcmxsaW1WaXhFUW4wdHJ5ejNmamdqYkRSbXRPLy9lUVZzOFZM?=
 =?utf-8?B?dWlySEFvcEpuY3pDaC9vWDZvb04ybmdiSjJnRnlXMjhkTk9zMlU4KzJKZjZ5?=
 =?utf-8?B?Q1J2ZnBIMXJDaVVjblJJWFZBbjIrcklieDdxT1hFMStSMjZGT1lWL2NNTStM?=
 =?utf-8?B?aWwySGs2MXJqNmQ1Qjh2azFVVXRUT2xqVlN1NndGQitPcitOVjQ3QW4zTStG?=
 =?utf-8?B?amJlazlRSjU4WW1jcTVsVDBsOFJ3WTY5dzBUUVJHZ3RuYmFNVEcvTThQZEVk?=
 =?utf-8?B?ZUE2WThockUzSCtBbFdqaE8xOWdkNUxlazhMV1pQU21ad0RVMFdlSmRzU2Mv?=
 =?utf-8?B?VmFaVndwYXZvWGd4WlYyaTlWOWErZ2ZjaklEeWQvQXBhNUxURHZ0NVErelgw?=
 =?utf-8?B?VW1HY2RjaUpoZ3JRTEtkd0RuNWd1TkthQUdrQk9uOUNGamlUQnE2VFFicGRi?=
 =?utf-8?B?R3crYkI0NzR4OHBDaTVrWlNkTHc5MXhUditnSXdxK1ArWVl6WkwwU1U4cDNi?=
 =?utf-8?B?QVFKTHRsR0MzV0VhOWpaNWFBdTZFTTQyQklwck5YM2FnZVpzYzVEV1V5ZnFX?=
 =?utf-8?B?Q2NTNy9JWnlMWkw1T3Bab0VVaXNJcGFuSmJRYlJCRi8vakx2WVByN3FqaVJO?=
 =?utf-8?B?ODllL3NEM1N2dTlUbDVnQUtXVEx6UUxEL0s5R0hqdEVzR2xtdUN5ZHdSK2Ju?=
 =?utf-8?B?YkFabUllQTVDcUxkWHZpbEJjN3o1a0NiQnordDV5SXVmMldXQ3BUeGZwZnAv?=
 =?utf-8?B?eGZZVDhMYnk4TGREeUZxSDI3Y1VJcVZCSDUvU0NjVXRpNFl4Q3hCSWhoZEVL?=
 =?utf-8?B?VmV6ZU44RGpFU3V2M2NpUFc4N2E1ZkFKMjh3aXFKdlY3K2U5MXZuTExZUkYy?=
 =?utf-8?B?RmhwVkx0d1dGdHpoRzRscjc1cWtsREUxTklMSXpkVUZXUy9DcCtGREl1VnFC?=
 =?utf-8?B?R2NEUEFkTTE3VTBQcmhCR2JQL0hGbU1tSityaU14cktKcmp2T2FvQjBaR3Bw?=
 =?utf-8?B?Vi9NTWFYRCtOYmR1Tm5QK0NISXRQc3BFNjd0YXI1M0ZmMjg0cGMrN0s4a3Nh?=
 =?utf-8?B?cmpLTk05L3h3czNicjB6QThwakZmSUlKSHFKTlhWRlFJOWgvQ0N1TXNvRytN?=
 =?utf-8?B?czRJWTZWYzNoUk9CcWtHNkRmM1hTaGUxeU9BZ1doTWlmdXdFNFNNdz09?=
X-Exchange-RoutingPolicyChecked: FMGKZAiaDhUvo1CNoNSrd+E0hyjvgvCCV65Ax/O8UaOPcciD1tqPCU0Lzn+MPb8uSFGxVkwOH5iFJ+gKgSN8pJoMxzlf6OBhl18UZruSqSd62I6ADGaZlwBvd69CXnWDmU8pVSJnp5eMYVDfNQb9CsKObEARG0RVj2gfgBqMQmnaX4otMTJJMBHFA/EwOYYRT3upk/gs50RRY8e25k+ET/sxkRevMewpVpajc6q38v6dwe2xwVfC0x6/jhWI2a4g2ODLOxQ8JgfCLPCalL154WO3uyS0o+jZTMvFJKzEHUAJwf6xA8R5ouIYaul0Vih8AoVxxqTxHa8tiff6clKyFA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e470f2-9e0b-4a36-9f3d-08df0f2f5664
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:33:29.9064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kv6F5n7IAXOnl6q15RYvieVqLgZwfe50mYQN7WXVTA92JpdqlJZ/g27pzjQe22ssaNURSVkn7yyufsDb/s37FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
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


On 03-09-2026 00:13, Rodrigo Vivi wrote:
> On Wed, Sep 02, 2026 at 11:25:04PM +0530, Karthik Poosa wrote:
>> Read the number of VRAM temperature sensor channels from the second byte
>> of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
>> exposing hwmon attributes for unavailable VRAM temperature sensors, while
>> retaining the maximum supported channel count on non-CRI platforms.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>> v2:
>>   - Address review comments from sashiko-bot@kernel.org.
>>   - Address review comments from Badal and Raag.
>>   - Update HWMON_CHANNEL_INFO() to supports maximum VRAM channels of CRI.
>>
>>   drivers/gpu/drm/xe/xe_hwmon.c     | 102 ++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_pcode_api.h |   1 +
>>   2 files changed, 96 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 9433b47a19c8..a7c04c25e1c2 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -39,7 +39,8 @@ enum xe_hwmon_reg_operation {
>>   	REG_READ64,
>>   };
>>   
>> -#define MAX_VRAM_CHANNELS      (16)
>> +#define XE_MAX_VRAM_CHANNELS	(80)
>> +#define BMG_MAX_VRAM_CHANNELS	(16)
ok
> Please remove the parenthesis...
> Also invert the prefix logic...
>
> BMG_ would be read like started on BMG and continued after that
> while XE_ was the original one...
>
> clearly not your intent, but that is how we should read, so
> fix it please....
>
>>   
>>   enum xe_hwmon_channel {
>>   	CHANNEL_CARD,
>> @@ -48,7 +49,8 @@ enum xe_hwmon_channel {
>>   	CHANNEL_MCTRL,
>>   	CHANNEL_PCIE,
>>   	CHANNEL_VRAM_N,
>> -	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
>> +	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
>> +	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + XE_MAX_VRAM_CHANNELS - 1,
>>   	CHANNEL_MAX,
>>   };
>>   
>> @@ -142,12 +144,14 @@ struct xe_hwmon_thermal_info {
>>   		/** @data: temperature limits in dwords */
>>   		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
>>   	};
>> -	/** @count: no of temperature sensors available for the platform */
>   +	/** @count: temperature sensors count from READ_THERMAL_CONFIG */
>>   	u8 count;
>> +	/** @vram_count: number of VRAM temperature sensors available for the platform */
>> +	u8 vram_count;
>>   	/** @value: signed value from each sensor */
>>   	s8 value[U8_MAX];
>> -	/** @vram_label: vram label names */
>> -	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
>> +	/** @vram_label: vram label names, dynamically allocated based on vram_count */
>> +	char (*vram_label)[MAX_LABEL_SIZE];
>>   };
>>   
>>   /**
>> @@ -271,7 +275,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>   				return BMG_PACKAGE_TEMPERATURE;
>>   			else if (channel == CHANNEL_VRAM)
>>   				return BMG_VRAM_TEMPERATURE;
>> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>>   				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>>   		} else if (xe->info.platform == XE_DG2) {
>>   			if (channel == CHANNEL_PKG)
>> @@ -777,6 +781,70 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>>   			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>>   			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>>   			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>>   			   HWMON_P_CAP,
>> @@ -810,6 +878,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
>>   	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
>>   
>> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
>> +		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
>> +		if (hwmon->temp.vram_count > XE_MAX_VRAM_CHANNELS) {
>> +			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",
>> +				 hwmon->temp.vram_count, XE_MAX_VRAM_CHANNELS);
>> +			hwmon->temp.vram_count = XE_MAX_VRAM_CHANNELS;
>> +		}
>> +	} else {
>> +		hwmon->temp.vram_count = BMG_MAX_VRAM_CHANNELS;
> looking this code here and thinking about the defines, inverting the defines
> will also end up with an ugly code anyway...
>
> So let's do this:
>
> define a platform info:
>
> u8 has_fixed_vram_channels:1
>
> set this true only on older platforms...
>
> then
>
> #define MAX_VRAM_CHANNELS	80
> #define FIXED_VRAM_CHANNELS	16
>
> 	if (hwmon->xe->info.has_fixed_vram_channels)
> 		hwmon->temp.vram_count = FIXED_VRAM_CHANNELS;
> 	else
> 		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
>
> 	if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS) {
> 		drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",
> 			 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
> 		hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
> 	}
ok
>>   	return ret;
>>   }
>>   
>> @@ -1507,7 +1586,7 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			*str = "mctrl";
>>   		else if (channel == CHANNEL_PCIE)
>>   			*str = "pcie";
>> -		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>> +		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>>   			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>>   		return 0;
>>   	case hwmon_power:
>> @@ -1636,6 +1715,15 @@ int xe_hwmon_register(struct xe_device *xe)
>>   
>>   	xe_hwmon_get_preregistration_info(hwmon);
>>   
>> +	if (hwmon->temp.vram_count) {
>> +		hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
>> +						      MAX_LABEL_SIZE, GFP_KERNEL);
>> +		if (!hwmon->temp.vram_label) {
>> +			xe->hwmon = NULL;
> ouch, please, while at it refactor this function to the most common xe style:
>
> 	if (!hwmon->temp.vram_label) {
> 		ret = -ENOMEM;
> 		goto err_null_hwmon;
> 	}
>
> -	xe->hwmon = NULL;
> -	return PTR_ERR(hwmon->hwmon_dev);
> + 	ret = PTR_ERR(hwmon->hwmon_dev);
> + 	goto err_null_hwmon;
> 	}
>
> return 0;
>
> err_null_hwmon:
> 	xe->hwmon = NULL;
> 	return ret;
ok
>
>> +			return -ENOMEM;
>> +		}
>> +	}
>> +
>>   	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>>   
>>   	/*  hwmon_dev points to device hwmon<i> */
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 94575c476e3d..e1079eff72c6 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -57,6 +57,7 @@
>>   #define   PCODE_THERMAL_INFO			0x25
>>   #define     READ_THERMAL_LIMITS			0x0
>>   #define     READ_THERMAL_CONFIG			0x1
>> +#define       VRAM_COUNT_MASK			REG_GENMASK(15, 8)
>>   #define     READ_THERMAL_DATA			0x2
>>   #define       PCIE_SENSOR_GROUP_ID		0x2
>>   #define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)
>> -- 
>> 2.25.1
>>
