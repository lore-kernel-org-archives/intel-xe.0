Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3679FC61DF0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 05:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FEB10E251;
	Mon, 31 Aug 2026 05:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RE3vNCGQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB9C10E251
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 05:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788153071; x=1819689071;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6qtFuDufuQQvU2oIGGtkRMigWv6lHb1Fzlp+Nyt0iLQ=;
 b=RE3vNCGQFGjVSp2b1YBtD3dYy6K9LLU0x98o4Lhuy43g6M9tsHOEF85f
 UuVOohLDY6cBdNnMtPvaiMqGQDN+o0XW9a27y4VYwTvmDRvbvxDasZVVo
 xOyLOUqs5epIrRK4NmMZnXLJCWAHc6nAdbCNPAYu5I4dJgHl1DqmMTLHc
 eIp0lE+Ma8+O24qx5VdM97LepFvtTQA/cj9h8nfK3vDqeVYcC9+X6yvQP
 1Eakt4I5f/VM4zypTgYb9AhbYwuBHtK2RBODm77gwXL99I44s68/WlYDJ
 OBY8u+/+UEPuEl08v3NWSdt4nfSVw/XjAcWpKmrJ8iGk2rjsBiXfzHBXm w==;
X-CSE-ConnectionGUID: 72o0JL2oT+O0M8KVO6fxvg==
X-CSE-MsgGUID: laN1sgGASkmLoDOibZw2Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88565081"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88565081"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 22:11:10 -0700
X-CSE-ConnectionGUID: Kpg7NGh+Rj299yhyJ30tVQ==
X-CSE-MsgGUID: vI9isIHpRp2n3pAxhMqF8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="292191302"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 22:11:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 22:11:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 22:11:09 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 22:11:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKGvauNNA2/gxEIcQ2jzNj7zhNEtRZw8FpsQ+EdE4Wnh8Da7RCgQ2JI4/837GRYrmOAE1PX6UTo6Jal17nBbydjEwGKEIn6TuW3725cWAYxSzJENW3Njs5AxfIXPJ0g0hgbZzVBCzcAdgvyHInja4UGoD66KhbVClfcVOJSI4385Dy9+lQW9SO2RbMukGvOSesryFYtBulkbGr2oX3HtmV8fv6Y6HfBDi19DG6bf7kN57/0n2OFv5j3JNXyF27Wy6t/UZCQbfDpBPleqWA8NBTWNjyeq+HuEMb+VOX5eTa6T2IhISAbdxHK5O5N/ompytvTaRCAHj8OdqlzWQF5eSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4c+e9Ho5CknH7Whv01yCvhSSj5Xa5ZxZ0oSzX3/f7M=;
 b=q4wtaj/99vobI5qEXASzdbd4I0CWItZzUs1JZOIgBn9jINFQo1TaRU/wVb+HzxL5XKX8NQr4YBLE1D5isAdvW//Z/CJvYs8UW0Jn3dFMzCEugpmFiCqeXeSe23ZlUXamnLzWtSziQVedctak7rq8NSmloFJx3rJqth+860kuJscOhzbCX1vlNmP/cigpBaTqsT2g6P8Zv9Py7RmnTEeai9XfurjTsHpVq2ZgVS9XNsUQBsj9OU2lTg6wby3YhpGuu6V9MQRNRyXXcDlrl5pLWraBgvhIJiREgTPF9Nlds4AyvWqBfUOxhYnD0hxyRx5THNFv5d3Yq5hw1ks0BcRGRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH0PR11MB7615.namprd11.prod.outlook.com (2603:10b6:510:26e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:11:07 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:11:06 +0000
Message-ID: <28a685e8-fa43-4c9a-b0a1-fbe641668d4f@intel.com>
Date: Mon, 31 Aug 2026 10:40:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/xe/gt: Report GT reset and power failures
 using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
CC: <badal.nilawar@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <mallesh.koujalagi@intel.com>,
 <matthew.brost@intel.com>
References: <20260828095803.2130312-1-arvind.yadav@intel.com>
 <20260828095803.2130312-5-arvind.yadav@intel.com>
 <432ba474-a670-4f98-bfe6-3ee151329a45@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <432ba474-a670-4f98-bfe6-3ee151329a45@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0317.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::8) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH0PR11MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a73034c-d2a9-4a20-9d40-08df071e42d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: xQeTTiREXnngibjPL61r3znYk5rfjywK00sXGWvr/sePjiRZBNhdT5YH3yBJ6PdSJnvAlInnB06agPUgK/KC1cQBkkEhcMBQATnBhvhCuoTuU4Uk0xmeBz6+bhteI6ddVGKPZcsYW2a6afUoHb6qF4d9B+r9QoJnwAKnZ4BU8JR92Yf8y/r/68elJoXqq8MHuss76TC0GBsHJaglqFv5ntyfcnr9N/tXLJqDeAwu/MkVUhCPloG9tQ30z3qMP+D63vuXeqe4NV554PiTGRmp6PmDed9xgbqu8z3QbCNzkm5zI9yxwnyHFp0dyUtyIity8XRfzrLDqm8MVNznAi0vyZydwJ/tJUBP/11Lo4woC7sUJ88dcMhnLd6w1XPwj8aS5nrSE5FfqbnIJk+ijMTaS/4YXkoiayK4hmblxX7GSfPWfJDeGakfrwO+rveu4RI2kZHCganC6tjDvPce+mK3A3U8TNs/3OfdEzmiG8pJAfn5SIEDuwXj9RMbcAQCuWbO5ZXviYr/nKgGf2s0Vqch6bKTNcRO3NvMJ4IVpe1aN1a13UXpjxi9Az3wiiXWghTusu49jlZ7TQMF51HE0VzMBTkPUMo30WoHdcgUBUDOdSEwVkwsA6iDrdSCRgtt/pBaf4YNEjBFtAytmtt0TTRqGo6NQWJNRugtHKTb7VBKWLo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SllvVmdCcDl3MW40b1lLWXFUc1ZZNmhVL3lkdlUxM3ZqVS82S1doTUJxUEZW?=
 =?utf-8?B?dWV5TStWZDZKMDF4bTMyNDJ4YnQrK0JjRGR2aE5hNmdmSjZoRFpNcEpxTCtp?=
 =?utf-8?B?cEx0NHFlVUR3aTVqRnZ6ZDFVTHQyVWN1Y0Npd01mN0tUb3M4d2haQmRzYkVC?=
 =?utf-8?B?VjIwWEZSNDYwM1RFSzNEWjFOSGFHNEFlcUpoNmlqbjM0SmwzMGlvSFFJaDZJ?=
 =?utf-8?B?eU95Lzl5Z1Fabnc1QzE1eXN1ZHRtcDNsaG5OYzRud1VxanJNVmcwRXlsRzNZ?=
 =?utf-8?B?QUFIdzkxOTI4RVRBa09PQXZLK2xqU0t4K3FQZWtnQU9xN1U3WkttQUZxTVM2?=
 =?utf-8?B?Ym1HQnYzTHlIaDk4U2ExaFFqMUZDTk9TQXUzb29DNlRibVlLRW0zVUhSWkZL?=
 =?utf-8?B?Q0ZBUFFHeUh4SDJPU01mQnEwa3MxZS8yQ1pkMTQ2WFJEdTBybGNaSnhCK1ls?=
 =?utf-8?B?OFJYNHVPbFFzYzI3ME00b0JabG50Q3V3TEtOZnhHbUNJWG9oelFkckIrTzBq?=
 =?utf-8?B?Q1pXYnZXY1I5Qng2V0ZnMHZCUHpVdytlQmVQTlAyK2hOOTh5cTU3Z1I4S2Rk?=
 =?utf-8?B?WmJteUUrQTdrcFpTdWl5RVVqa2tLQWsrbkhBSi92Qnh1WnFFOVVnSm5LL3Jt?=
 =?utf-8?B?M3hWOWxDR3ZkeHNnYTBmMTQyWjNGcmY1U3hNOGpDREdsRHVaNlRhWkllbFpj?=
 =?utf-8?B?M3NpZE9DVk5ZMzQvT2J4RW1hOTNpaFJjWUJLYm10NXlEdCs3elVmMWlmU0JD?=
 =?utf-8?B?QnQ4OFdqekNEeXU3aUJFYUdqam5BOTdBazFpc1NmSnlaMnFWZUNsUVRKRWJQ?=
 =?utf-8?B?cm1qVXA3MlpUWGZIb0VEdWJsL05XSWszUjJlVm1kbmp2M0F2ZkN2cElVQ1RQ?=
 =?utf-8?B?UmdvV1NEdHhjSFJrdnZIemRNQWtFOXFIOWZMK1RqUzU3WlpiYUg3Y3NTRWQv?=
 =?utf-8?B?ZEFhOGo0K0c0c1ZEa3pDeFhmQTRPZFc5OXRxOU1WVThDeVJPU2xpdVVjLzRE?=
 =?utf-8?B?ZVFGNlZ2Y0IvYkE4MC84c0xWMmhVelRaUVlQcExMc1JBY2hGZFd5bHRDM2Qw?=
 =?utf-8?B?a2NKdXIwZHFITzM2ZE9td2doaCtjcE5TNzNUUjZvMFRoM3NSOEM1QjVxNTJ3?=
 =?utf-8?B?WWtWV1ArT3BBSThkVWxDTnM5M2ZOZU1pNHMwTktiUXlpYXpDNlRlN1EvWU5G?=
 =?utf-8?B?MEVUakFvME41bnhNQ29PdVFOUkpyTjJsUkhBR2VFcVRPSWhNbEhEcFp3OGtD?=
 =?utf-8?B?N0VpQkxLMHlISGNJV3E2WWVGYkR0TUxGcU9VSkpPZ2pMa2htVTZjWHEySGl4?=
 =?utf-8?B?Q1NuakdRMlc2eng1ZUJnOURDTG1vcnVFczkxcEM3bjg0WTMrRFQ0ZHZCZUdN?=
 =?utf-8?B?OFdRYkpQY0xxVFRqeXVpblBGMGZBVkNrbnc0TjUvREVzYXdBYy81Tk11NnJV?=
 =?utf-8?B?dkpqblZOeWdnY0FzZG5nMWR4cDNKL004UlRHSVN5SlE1WFZRalJlL2tHakJs?=
 =?utf-8?B?Yk4xWFNnc3NmZytBWEJWWkphOUZNTmVMUE9ibXRnMjU4QnNEaDlEdExjcEU0?=
 =?utf-8?B?TVU4NXRlNnRHRHJzTW9hdHlsZWluTnhJVWtmaDk0cXdTNUdwc1NKaDBoVzBY?=
 =?utf-8?B?V2lRZTdGNlQ3ZVI2K3Y4TVY1dXRlKzhQWEN6NTU3UzM2N28yaHNPcGhCbmRj?=
 =?utf-8?B?eDIxRnlIdlZjQW9JT1B0cGJ4N1pVektvYWNxdkhOb1R0U1c3MThBNXhnRjMy?=
 =?utf-8?B?dldiU2hZSDEyOTd0YUd5S3pNMENGYXg5N0gxWU5ZR2JGdGNMak9OdjI4OFYy?=
 =?utf-8?B?K2ZLeElaWm8xMlhubkFpbHluZ3V1YUVBNEVzODRwTUVjblYreVRUc1Bvbkgv?=
 =?utf-8?B?NkRpRmhSQmdCOVJ1Q1FMNFR4S1JJRUlVc0dmMEd3NGhzdFdTaEhBMEczUWRv?=
 =?utf-8?B?cjkrTWVqdE9pbXBucDkxV0ZZSkdqWGZ5WU5WSmlvQzVxcEkzZUU2UlNNR0hR?=
 =?utf-8?B?OXJ0eUEwSVJDOGpjN0V4aGQ5ZWk3dDk0N3BpMXJIZW1ENkY2WkNtMmZGdTdC?=
 =?utf-8?B?eW1RajZ1aHErbVZhWEZSMGpDelpqa2JVOXZ0WDZDZUVwb1JmUlBwVzRzNXFM?=
 =?utf-8?B?Zk9tN2RQc28vSmdJNEl4bTdCM0EvcUJWRHE4Sm5aZWhrdjU1dzR1TXRMOWpY?=
 =?utf-8?B?cUZSdUhTUUNVYWkxakNmc3ZvbUtQenQ4K2VMd2VRT1A1aEZ6SEVhaHhxZXlT?=
 =?utf-8?B?USszOEx1TUtQQnBEQ1RhYUJmWHdIMzlxNDRxV0srUzVnL1Q5cW55eGE1cUVy?=
 =?utf-8?B?Y01nWnhaZU5sS2c3cy9iOHhLMGZnS2xUVm1TSlJQdk5sdXJPZ2hmQT09?=
X-Exchange-RoutingPolicyChecked: JUE/h3AVdpPkBQZZyHCK+RbWbG52mxhIj9TelYNPBxD1nJEmUJuZHkQ+gRTgB54pbiabHl/dXGTNKueri9ExmBWp8DVJTt3GDg01XpTKl0Q5NqZiOAnNrf/SFR8qQW/9fux8sQ/ZQsOGQbrGevl8pezA+LpBHsV9GF8JG2UFhArmN6NPmI8S17rgrWzLugBZQaL96X2i/h9k0wiZXAA5cyW1N/3A2nZecBSo19ADPs8dbZl+tNPDiHeeWZRZEUrEYw9O8wTtaBnYioe59XUdw6YydkP9ntaV4oYN+CevFYZuBR6ovTFPzEfzyKk9A7Lfwfq1tKgcy1miHvNboRNgZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a73034c-d2a9-4a20-9d40-08df071e42d5
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:11:06.5452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAXmSO0IY9wkBTSXppI53CXfLwg54+p5dsbPiir7Nd/mkmoTX/r71nXjKnfRABYLWSeyGmzb1PHeEbDxpBYOww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7615
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


On 28-08-2026 19:48, Michal Wajdeczko wrote:
>
> On 8/28/2026 11:58 AM, Arvind Yadav wrote:
>> Route the GT reset failure log through the structured SIGID logging
>> helper.
>>
>> Failure to clear GRDOM_FULL means the GT reset did not complete as
>> expected. Use the GT component, which maps to XE_SIGID_GT_TDR, and
>> pass the reset errno value to the helper.
>>
>> Keep the lower-level GRDOM_FULL failure report because it records
>> the exact reset register wait that failed before the higher-level
>> reset failure is reported.
>>
>> Also route GT suspend, resume and runtime power-flow failures through
>> the same helper.
> can't we do that PM flows in a separate patch?


Agree. I will keep the PM-flow changes out of this patch.

>> These paths were already reported as GT errors. This change only adds
>> structured SIGID reporting and keeps the errno in the helper data.
>>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 6805e0d3bf21..58df31ecb825 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -824,8 +824,7 @@ static int do_gt_reset(struct xe_gt *gt)
>>   	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
>>   	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
>>   	if (err)
>> -		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
>> -			  ERR_PTR(err));
>> +		xe_log_err(gt, GT, err, "failed to clear GRDOM_FULL\n");
> while around, can we improve the error message here?
> we are not clearing that bit, the CP does (Bspec:52549)
>
> 	"full graphics reset not completed in %u ms"
>
>>   
>>   	xe_gsc_wa_14015076503(gt, false);
>>   
>> @@ -1013,13 +1012,13 @@ int xe_gt_suspend(struct xe_gt *gt)
> hmm, for the PM flows below, is the SIGID GT_TDR correct one?
>
> shouldn't we use PCI component (or maybe new sub-component POWER)
> that uses XE_SIGID_IO_BUS ?


Agreed, I will drop the PM-flow SIGID conversions for now.

>
>>   
>>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
>> -		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
>> +		xe_log_err(gt, GT, -ETIMEDOUT, "suspend failed\n");
> btw, maybe it's a time to improve our error message:
>
> 	"can't suspend due to forcewake error"


Noted.

>
>>   		return -ETIMEDOUT;
>>   	}
>>   
>>   	err = xe_uc_suspend(&gt->uc);
>>   	if (err) {
>> -		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>> +		xe_log_err(gt, GT, err, "suspend failed\n");
> 	"can't suspend due to uc error"
Noted.
>
>>   		return err;
>>   	}
>>   
>> @@ -1065,7 +1064,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>   	xe_gt_dbg(gt, "resuming\n");
>>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
>> -		xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
>> +		xe_log_err(gt, GT, -ETIMEDOUT, "resume failed\n");
> 	"can't resume due to forcewake error"
Noted.
>
>>   		return -ETIMEDOUT;
>>   	}
>>   
>> @@ -1092,7 +1091,7 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
>>   
>>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
>> -		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
>> +		xe_log_err(gt, GT, -ETIMEDOUT, "runtime suspend failed\n");
> 	"can't runtime suspend due to forcewake error"
Noted.
>
>>   		return -ETIMEDOUT;
>>   	}
>>   
>> @@ -1116,7 +1115,7 @@ int xe_gt_runtime_resume(struct xe_gt *gt)
>>   
>>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
>> -		xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
>> +		xe_log_err(gt, GT, -ETIMEDOUT, "runtime resume failed\n");
> 	"can't runtime resume due to forcewake error"
Noted, This patch will only convert the GT reset failure path. I will 
drop the PM-flow SIGID conversions for now.

Thanks,
Arvind
>
>>   		return -ETIMEDOUT;
>>   	}
>>   
