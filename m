Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28945C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 19:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A935D10E235;
	Tue, 30 Jun 2026 19:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezBwi6WI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D3610E235
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 19:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782847685; x=1814383685;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=P/ti6wWAuo1/N3BG3lPCTJs9TFunvKhwztP2QUJfa3M=;
 b=ezBwi6WIEE+5Imah/BjMZrF6cNScZP8SyYGushzJB1Eme315UgOhSvSE
 hmN8yBcQIHLF7AsK1jEeGjR6SIH8COL0FwJyhXO9IYCaDfP0Qxp3R3T2W
 Z6Gklp1oJrMDOPsrKj/o4HX02s4pHmQa5IKyiU6rjNI6krqePLOpIGkxZ
 QDE+vwlVMPUa28aJj0QRrNajkA+k+1S+38p42yuNmuNEkt0YYNUuw9e8U
 wDcwPr5jGWkTgSIIrrZTj97lONYA62JbnZ9JvoJ/ighd4dQSirMbaCXCO
 4n2HioWC1h6R/71gg6UMRMG6zR8aMFDS7ERky3OGoZ7J8NJ+VPHk84dqo g==;
X-CSE-ConnectionGUID: I3PnyE/dSc+yn7oo8FzFCQ==
X-CSE-MsgGUID: fqm3lsBQSt6KG1DfBwyprA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87483394"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="87483394"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 12:28:04 -0700
X-CSE-ConnectionGUID: zqOC4M4ET/SRBfuzQ+n2UA==
X-CSE-MsgGUID: 0Uskd3Q8QnKNUFXmhmwG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="246013769"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 12:28:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 12:28:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 12:28:03 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 12:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7ts8uNz1UMw7hbvurKwVJODlvGAdmVlo/EVk/V+Sq2xr8dHgVDen4p1tm7EXnRow105L1KhSjLQUSCg8Ze9wTxM5xkHz7Fcqn4V3ZC+AghTNkaqHtpwAKxukoXZv/P0mTnIVVnYQRnA0d/vfEMOvgRHWAhj3CSAiFZQUKbfGkGvey5L7RTRRMiiaUA7WY3/CbjA3xqX2CI4TDvPHEvJGvje0GoxOJRE6q9ZSrDleEO2ANYXjDHf+/+OoKPDLDbe3R67+hhU2P5dXj+8Xi55XX5NM9tzGSKtnumAJEj8YZOW7uAxz8Uj0npg1LvaikoqPcSxpF9l4s9sW12VnCjr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCBQLfYeejv7VjwSicZ1lmXTh+0ptyF5wf6cpUQ3SMs=;
 b=BQ3EEq5MzjR5Fmfzhn8JgEExWYbPDMyC2xHjRRK4eiZc26aRRBtvYvt+bNXCI/C0pTP4KBmLx1AwZK4v31qEf1Em4UGJWzbwkQ7LMELVrN1uYN1IY6+Mit8TOee8cEPc2cI0KPnEqXIeg702sjroKak42w1MZeFfhGkW5Oo4C6n6yB6np7xBN+xTfPK4tThlscRY9UfIZ8SpYzhDXoMDFHXSpXym5CxNDCgrCnzY/qjWB6tfcTjahzpe2k6epCNibO32dYnFagJtuwE4crhlQ2YA8UIfKvW2kmvVI3/HD6lT8/ksc/+I7E70zE4qcXhdTwY87w0qzzJVwusbmStP/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB6606.namprd11.prod.outlook.com (2603:10b6:510:1b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 19:28:01 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 19:28:01 +0000
Message-ID: <c0b83019-18b3-4049-87db-6fb8d30cc6c1@intel.com>
Date: Tue, 30 Jun 2026 15:27:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/guc: Preserve HW error state in wedged mode
 2
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260629140836.2074349-1-zhanjun.dong@intel.com>
 <20260629140836.2074349-3-zhanjun.dong@intel.com>
 <250d289a-3fd7-465e-9e81-e91601a5bc03@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <250d289a-3fd7-465e-9e81-e91601a5bc03@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5e87c3-72c1-40bc-f5db-08ded6ddb2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|18092099006|10086099003|56012099006|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 5fWqm6oKGzVxpiTge9zV9Q85JpyK007wpyRqDhwyZvZKdu1Wd77tSAMadOcL5m6M/0IHzGceAKqYTqmInZ3zRIYXp32dp3cmYo4/YZ0hrDAdqkiZAB2sCpgewsp9C6eL1GCKFP7gu36ib7o38bdgxjwAHlKybOWb0V9lJWF1KtgpRBKZBh/KmMpm5LSeVMb9hPz3L6xZfdCM1/XpOHJyIBnd+d0q8ctJioO9Dev0T6E71+AxjVj6WqIdDqax26LepCH4XzslH5hSNyCxVtow1cP4fRyCTqsaq6KRlQjkPVClAUCFO5Fc1kV9Ds6cGIMVFZ6qFlyb7MUjFgMei1StrDhNkN0yGbvBRiOWemul6GZ8KRSo9snQh/ZMMdIo2bWz1mRNm90bmRhwfeUiGVmWbgQlwYakoKX8qLRVOWD3jHvPK2H2nL2oJVJvgDNX0U1hQCpGO9rUOgqovSTQgYl9spLaSmPdy8RC17fFLaIFelH1TnmeZGl51WLK/+NqxqCHPqo5KlocPN/TWX0SSn0t7kAMa2bAvbU9Nfvnh3S8zMybr2gZXYd1Q3xkXICxinl4xCgXRShXWXfSg6TTNyHq+zn9ptuUTTyD/aLdDEZgxyG8+XAGGe5OpHWo2b/gWH9DxBWW8JCVBHceiMoDPdki0z/LEie0OYuFiAxPjcTO1LU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(18092099006)(10086099003)(56012099006)(6133799003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekFPTWlYUlBlMGtqUjlUOGcwVkFnaFhaNGc2SHpjTTJVa016TW9lVVljMVFi?=
 =?utf-8?B?aG1wMnJkWUhhTTB2bVBwaEJra1ZaVkEySFdVZmFhZDIyTFFWZ2g1VHRYbDJ5?=
 =?utf-8?B?SjFEcWZBRGl5YWwwQUd1QmxuaGtmbWJ4dVU0aWdoNFVaN2dVY1hWby9OYllW?=
 =?utf-8?B?VEc5dEFaNnJRV0o3clVRd2ZQWDE2ZW5sMm1kV01pZit4VkNBb0lkSGxtS0tT?=
 =?utf-8?B?UkhwSS9OcHRCc0xseU5vWUx4M1R4dXBDaXY4YURoTHppREZxM0hlb0t1M1pE?=
 =?utf-8?B?c1F6SElHSkYvdEdYWnNJblc1bDd2UlMvZ3YzN2cyVlJFb3M2Tk91elVzbFg4?=
 =?utf-8?B?KzlCaTJTN3Y2OW9HK1NHR1J0NUJoY0FDNy83QTQvRWZ0Y1cvWjFsOXEwUEp5?=
 =?utf-8?B?YmoxWFNBZFN4SW5HbzRHV3pVTnhBUDBSenJGcDcrM1BrSFlYbHY5TVdOUFE2?=
 =?utf-8?B?bUlZc0ZhcnJYZlVCZVUrUkdiczNmOWM1L1JBVFNoOTRFY0RieUxHTE1lZnRC?=
 =?utf-8?B?TndVWGxWYzBPZHdodGtxSHdNTTdreVM3TFplOERQcVUyOE9KVVJYVzZtUzgv?=
 =?utf-8?B?NWZmdFhhSEFQRUdCQyt6VmVkYm1zdUNQWDRLeHdMYzEzWUJMNDJkLzdjdmtK?=
 =?utf-8?B?N0wvR1Zvby9iTHBUemp2Zk5zNHFmSUgvaWpKUnM3cVdrZDc3cTVBMFo2a3pp?=
 =?utf-8?B?bGJYaWpES09WUXVQb3lCWVJRSjhtQXNjWVpMLzB4R3RLazErVS83aHJwZ2JF?=
 =?utf-8?B?bjNlQURhME5JaWtPSnJMR2Y3bU1DUUNVOWk3c1B2RVpJMndqVnUzc2NNRTJX?=
 =?utf-8?B?MkpiVlRzdTlzUk9HK1dBMGZPekVQZ1RiYjBzQUE5STBKUzRmZTJnSXZaTWxh?=
 =?utf-8?B?SmtJdmMxekZaY0FQcDl5SlFVckNvWit3c0xMWE5iQzk4YmUxelRNSzhDcDl3?=
 =?utf-8?B?UTVyMWsvc0tLdERESUdhU2xpS1ZybENlTFhlWS9qandUdmZhK2tOU2NWWVpB?=
 =?utf-8?B?QWtMVXR2WmlNcFVrT2pPWGRXZS9EZjI4d2ZBam9FYzdRN3FkcWNDMGgzWm9t?=
 =?utf-8?B?TVRnNE5ISHg2VFkvMktNSXhyOE9RMHhYaDhEQmE1UFZVcFc4RHU3YjI3WExF?=
 =?utf-8?B?ZHdXL3ZLTFMzVmNqaVQ1OC80dDBOSlpOamI0YlJTWmhlM0lyZlRIc21hcHhB?=
 =?utf-8?B?OEZodDVUa0Mzem1LT2lDSE11V2ZreFg0TjNmSmFjclNONkcyek5ZMFd0Z0lm?=
 =?utf-8?B?dUV5WXZvTFZsYWRnT0FDYkx4bEk4YlJTZmthQjFwcko0TUhod2o2bWJsTXlv?=
 =?utf-8?B?SHQzR1BuMVlaL2w2clBTeklId0MvM2RBWFdPZ0Z0SXNSczVYUnBUSDYvK3Vr?=
 =?utf-8?B?c0VmbWxzbmN6SmtuaEF0Q0toMWdMNmQ0bHRKY2hOaTJaalNBa25TM29tblo2?=
 =?utf-8?B?Mi9FSjZaemVobE9BUDN5eWQwSFI5Q2lRZVVzcnovaW53VGU5WEZRYnpCVjdY?=
 =?utf-8?B?RVcyVlZQUlBldFdhalEvTnltMXF3K00xZTBFb2VIUUJkckJNVFdlSEx1bVEv?=
 =?utf-8?B?Sk95Y0Z2Q2RDTkpHUTVTUUhKdzZuRXF2Unl5R3hibHV6UVpQOGd5YnlsbGdK?=
 =?utf-8?B?bERwcHFMZlJHU0pHVDlPRHQ5YlFkYmgvcWZqbWRtWWVaMWMvVVU3TUlKZ3k2?=
 =?utf-8?B?ZnZOUkRET3ZFOHpsY3RWeFBJcjNSWjh4TVF0Y3lzVm9keGQ2R2FkK2hjcGhP?=
 =?utf-8?B?cnplNFI2QXlTTFRUWExzNkxGdnF3WXpaZWZPRTJ3amx4SG5GUXE2ZlZxVVly?=
 =?utf-8?B?enFaYTV6enNCRVVhYlNHQmVqd0pJOElYMWRBU1QwS3ZtSS8xVlpDelZJNHE2?=
 =?utf-8?B?RUZiV1NOOGpJRzFGWGRTUkk0VDhNOVY1aWswajkzc1dmSk5yc1liTWlKNFJt?=
 =?utf-8?B?bk03TEpPajVtUjRPSnVkamQ3d3JaM3F2OGpwZU1pMUhFYStaWjZEeFFJZ0x5?=
 =?utf-8?B?Q1F6N28vOEFtUlNVT3htcllrTVB4amxlcXM3SGZyYzlaKzVhZkVTeUExQUxr?=
 =?utf-8?B?SGJDOW1LeURuZEprTGhCbHdmeUNyWVBCODZJQ04yUmVPM1d5ZkJjRDF1d0Rl?=
 =?utf-8?B?dEV0SFpJb2NzSnNmckYyN1lZbFhEc3V6aUJzYnE2R1F1b3IrWU42NkJnTFBx?=
 =?utf-8?B?bnlvZ05sVVJYbDdpc3h6Wlh3MG50eVRwWTVmMlZ2SGJ0Mk9xMWZkT0swWEEr?=
 =?utf-8?B?R0kxZ3RNbkxuVnpxM1lhS1o2YnkvOTIwdk8yVEdjTDRFb1d1a1creE1XWXYx?=
 =?utf-8?B?KzRjOEMxYjNCMGFIQUUwcmZOTDFKUUZrcFlURHdXdlRoTlN4anVUdHZWbUN1?=
 =?utf-8?Q?yUUpHeVAbLILwKtc=3D?=
X-Exchange-RoutingPolicyChecked: FaOOYT0COVM96imydM0cMul4f54monWjicEzkF1vBNdE8BrVsWSFW4jswnkaLEr7e6SMpFuPex/nI6sPjFJofQ5luBE5tin5eTHFA3CXg6xIrnCtZOCPMwQ3zLMybpkzNM6gvkH21W2vQxM9lqAwrCOcpN43LL7c5hAM9J8sB3QymI45FSmpu62lgCRlwUBSyJRrP+g1soVWScCTq0ub7WzHoBTsmQWo95bln+YYG6vvdeLEXhJlufuMqtTSlG8GFPA4E24++YDs3wW6HDqaZ3Rc/CKQj1U8d3BjjJeoD1TpqpTAxD4x7zgwzajBDQ1WMwyBc4Vt4+DH9an8fx+OIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5e87c3-72c1-40bc-f5db-08ded6ddb2dd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:28:01.2604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIqPCipu+QTXdpI/3S8z600WLxIx/OCAQD7rY/iNpL4qPYw1/feBxhH931py86pWIlxoSdrLCZuWteNicXhVzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6606
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



On 2026-06-29 7:31 p.m., Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/29/2026 7:08 AM, Zhanjun Dong wrote:
>> When HW reports an uncorrectable error, debugging the root cause may
>> require halting the GPU in the error state so scan dumps can be collected
>> and inspected.
>>
>> Use wedged_mode=2 for this debug mode. In this mode, Xe already avoids 
>> GPU
>> reset on hangs, so also skip the engine reset cleanup path for GuC
>> uncorrectable error reports to keep the HW state intact.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/ 
>> xe_guc_submit.c
>> index 29ccabc4b7a4..05fa4e466461 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -3024,8 +3024,10 @@ int xe_guc_uncorrectable_error_handler(struct 
>> xe_guc *guc, u32 *msg, u32 len)
>>       trace_xe_guc_uncorrectable_error(q);
>> -    /* Treat the same as engine reset */
>> -    xe_guc_exec_queue_reset_trigger_cleanup(q);
>> +    if (guc_to_xe(guc)->wedged.mode != 
>> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
>> +        /* Treat the same as engine reset */
>> +        xe_guc_exec_queue_reset_trigger_cleanup(q);
>> +    }
> 
> This doesn't seem the correct place to do this. On one side, if we skip 
> the reset call here, if the queue it's actually hung on the engine then 
> the fence will eventually timeout and guc_exec_queue_timedout_job() will 
> be called anyway. On the other side, 
> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is a generic flag and 
> xe_guc_exec_queue_reset_trigger_cleanup is also called from the CAT 
> error path, so we should cover that as well. The best way to solve both 
> issues IMO is to add a check in guc_exec_queue_timedout_job to wedge if 
> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is set.

Good point, test shown the existing mode=2 feature already handles this, 
so this patch is out of scope and would be removed in next rev.

Regards,
Zhanjun Dong>
> Daniele
> 
>>       return 0;
>>   }
> 

