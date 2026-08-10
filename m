Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6BAC5AD55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 23:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78DC10E244;
	Mon, 10 Aug 2026 23:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GA1+1fYW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D7510E244
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 23:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786404534; x=1817940534;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9B8tzw/7dpGh2fNhPBasn8/BiJyoEGEvNS1uCyQK2uQ=;
 b=GA1+1fYW6buMCapIdxs393xRLxEwab4mwz9KTgfNoi2I//HqlprbyltW
 IJGkqfsS/0uOrJbK4YAydSB6jmHSsJMAfn1jxRPLhV8sXb04XVa9iZaG2
 lD8wHXMpm811TVPN+1ObEE49yadhh8016DAmmgNkwUnJn30MoCGsC29pR
 9cosYKx7BSZD5VErnp8qcCmLYS7MUHVr73H7vXJmejva7sXc5tjLzR3kz
 61RYuWdXYb+8wOjnUaBk1TBzYgocctebBu6Fx8mG40//gnCQR5k8CfTzx
 9rZUpQodd9LC9WTbk0ompBopX9/c7aM9WwyGBsmr42Lk1RWpLovt/W+vK Q==;
X-CSE-ConnectionGUID: Xek3aOfWRxqAfU9/B2RW+g==
X-CSE-MsgGUID: t8TTwQjLSw+nvWHApjIDHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="85894757"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="85894757"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 16:28:53 -0700
X-CSE-ConnectionGUID: Ku/Qw9A8QEStiDVbI0mx+Q==
X-CSE-MsgGUID: 6AHk6lkwQauJu7zb4C7bDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="261419440"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 16:28:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 16:28:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 16:28:52 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 16:28:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIHsFdLIi31iQNOEB0bJZACRtmL7koSRhfiDImC0lqZGU7T9rAFmaFAhU47D8ZsXCURAmmLJCS81DB+YMNCV+oCcmROa9ITc79HVgmLrl5TNPuywyhs6wwgr2snnUIpmxtnRFLrAcfNwMzbEJJqrI96wk0xr/DumQo6aDcrvctEtgWgH0otg3HP1LtopeUDjBmfsrOnru9FFStJp5Sny3cFgy6VLR2i10WNosO8PfVekmWl3pj8T5sFO7FSC/rscvXjP/b2yqpMz0y2PCZFGUdCmwSIrErbZJdpJaNcCQn11mUwAaKpxwXrz861zLrpb38PSl5G3Odn0e62JJHcvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOm58k4MVypXIWl8lnRJyjtepXkbWYrBI+yclmE0WU8=;
 b=bXKQz+C83iCBMG7N5gA/w4HMeoNc7YMHRYKLbaAoj8G1lK/4czLCSJeq6iQg2DB4Xp8w0syQPYnE1JeV5oBJJJt5LK3gXfCtZ4LA1PGBIszKrU7lH8J3AKthoGXGIc9yjGN6da2LzmNp52mw8QJKE5HIGjegmN98cYdp0iFlsOHy1aDHOXH+v4oPdh1z7ko3k3I8e/GQb9AmD6Sahy96ZIuPwVdyntH9yioIog7bbM4Epcytn7yOP3BdeR0GvfNHZdqGuiF2T6kJ9qbIdYJwnA4ofyXxF+FrwXB1xXflThNdYV6f1JJ/i7RvS/2h23RSOu3N8guPiRTeoDhlR0tNNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 23:28:48 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 23:28:48 +0000
Date: Mon, 10 Aug 2026 16:28:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>, "Dnyaneshwar
 Bhadane" <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Use xe_log SIGID API for probe-path error
 reporting
Message-ID: <anperU+HpYo8gPNV@soc-5CG1426VCC.clients.intel.com>
References: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
 <20260806110039.1245282-8-mallesh.koujalagi@intel.com>
 <4592d2a2-f241-4ff2-b922-997a3ef81cdb@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <4592d2a2-f241-4ff2-b922-997a3ef81cdb@intel.com>
X-ClientProxiedBy: MW4PR04CA0150.namprd04.prod.outlook.com
 (2603:10b6:303:84::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5508d0-2386-4f80-349c-08def73720da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|4143699003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UMAMGBqoiPvtTHc4fVk9gQ2rMd29VfwTxHBKPFeUggyFtzJWDOgu9c2cqo07qMQzj9Xq+I/FW3wEZmLT6js/SU/p/CV2owzVmxikMJ7KGgJak3PyTo4nE8Ge0eUkWEes8tG0zXnbxKfs2QKEWu8YiIwaneLZTyWe5k8WOLTNCeEWkZWFAXuseIhUpglcpYpfUE9+noNSoarJ7oyVsnErwx5qW6VAc20vQqI3Imip56YxQMK2nwXyCoT3iwCP4vGv+oICI7Q7r01frGure9SA7AULrxWU+vYzAhliJ+HC6RU1Q6bwu8u0fRJ71GgYpiifQGs3bhEDk4V1tDVtkPWm2GHL0iq5lA69ABvw+eeLu4NELaSUnCHHeYPZMvXX73ekj29m7cNOWrc4CQwNx8Fa8ufvSjjp1+V4eHKzChrYRNYr3jSCZurOzEiY9JbWnaRgem/48nXlKYfLj4RcnlVmtKLrdZRgkxYdCL+FVZGaxal0myUGkwddExGVzOCL/xQmTjBabqr/IL8FEWsa280s23u6mF/XzhUkw0ax+sf4g1M/UXT+7F4pfleV5qoJ01+weEsoROW5naaLt9FZsVShGu3AakRNA3qQXnsUobQOID1ddwmM9Vxya8IilX6WGEgaeWipk5H3X/WMVIo4zgTIkVc4Rpaba99dX2GSz5+tOpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUdFSEdTWVkxQllJNk1XanpNUitFTFBOVXZtNnp2eUlPNzZhK1k4bUdBcDEx?=
 =?utf-8?B?TzhLNVVwaWc2Z2NTaS9HUkp6dkFOZjZmZXNrVU81ZXQ3eG5FTFowWGJkTkxO?=
 =?utf-8?B?K0NvTEZxbVJubmpSQ2ZLZFpIZjMrT0hRZjd2NDg1R0o1RkZzTUJCd3pZVWdv?=
 =?utf-8?B?Q3FOTGlBY0dINHlXRmJLZUdqNFlSUTV6RHlqWnRpb1A0ajk2ZDB3RkhVUGFZ?=
 =?utf-8?B?SGEwYk0rWW1UQnowU0lMQjVNMmhPMHlnSWNYSUxmbFlpV2pVdTFleFhtVnRn?=
 =?utf-8?B?dytsSXgxMTdFMlgrVWh3bTJSdGdZaVdXenp0TUtjbC92ZzBQZjBGZ25ZV0dm?=
 =?utf-8?B?VE5NVmFCTkRuWkdnaG8vUHNLR2hzTE9adTROQUw3RGlSa1ZsMUJoRjNoSU9E?=
 =?utf-8?B?VS9MYkNLei9nZUdnRUJxakVkdllhbzUyWGFyRXNkVDBndUtTc0RjeUFmUklu?=
 =?utf-8?B?b09KWEZDTHU1ZkdxZmQ5UWNLMlFlbDd2bS8vaXVLUi9wRnRRd3g3TmIyUDBh?=
 =?utf-8?B?alhwSUJxTGNWR2FSczE1b2dxaExGMjdkam9ZR2Q1YWRHQjJOKzE1RWRjQjYx?=
 =?utf-8?B?ZVRUWThvWDJKdmRUL25DODIxcTlOTFhnNTVaeDdIU3E1bGVHb3dmTDZqT3pv?=
 =?utf-8?B?Z2pQSEtLSWI3MWJDVkZzMDZYejJMek00WUNrOURmWHRsWFZGenVORDJON0Fl?=
 =?utf-8?B?VUJhc1V1aEtCVklET1ZORjFjZ2g3RTI0RkZFcFlFZUhuRXAwUXRlNE5rSzh3?=
 =?utf-8?B?RGQ5MktMQm1JS0M0ZEtJQUMxeXR4c3VnUmZXNzBSRzQyTFBrQ0N5RHlLbjdH?=
 =?utf-8?B?UHdjRDNkcENCY2FEdWxGTXUxcnM2aGRkbzlUVGg2a2dnTGxFbThKcUpXdGM4?=
 =?utf-8?B?Ym0zYzZMbzNpVW9Zb09sRnY3enZmQm5tTklFaTNCaHVRNDJmNEx6bk9GaGNQ?=
 =?utf-8?B?YnQ4N0Z6NlVGRnVCOXNJSmt5bDQ3SXVEdlVoejkyamVGckRrdzhpTU1tc2xo?=
 =?utf-8?B?Y083QkhlQnluT1JkSkxoVnMzN0dlS3NCNEYzRTh0b3Z4cVdueGJCMDdUNTl4?=
 =?utf-8?B?MGNhRmJhUUhLZ2tSZ0NFdnF2V3IvTHlKS3JqTy8yUWk2cWpiL0dHMEUwNWRB?=
 =?utf-8?B?WXR3M1B5b3ZhQ1JLRlNlY0dabTVEVVBtRFhXS1VndGFvM0NEaTFVRDhVeUh3?=
 =?utf-8?B?WWd5QjBobURnbDlHUE0wSFFxdVV4V0xlNDFIVlRCbDNBRHdiMUkxMTZ6Mzlk?=
 =?utf-8?B?YmVFUUlJTlZCMjIxREt3cGthUVpSWFJaM0d6S1B4T2lIRHJIb0hqZGFSRXI2?=
 =?utf-8?B?SGR2bDN3M2dJc1JmRWQwZ1c2Vk1zV0tPMk1mTmVTdkxqQjd2Q2FFeGRRcVVq?=
 =?utf-8?B?RjAwTDZENEdHVGFWZkJNMGVjU083VVpyUG9DTU5uYU1YUFpTbWtZNi9qYnBl?=
 =?utf-8?B?cnRjY1crNGJQMUZmdUkrYmpoMjRBb2RCRFFmR0lkZkxQbHQyVzhIRXU5SDY4?=
 =?utf-8?B?WjRUcHZnZE1qSlBoaForbmtXWHJ5c3hPSHNvN2RZbDlWeDA1NEJ0bFV3SjdF?=
 =?utf-8?B?TFhDS2Z3YnhCVUNrNk4rWmJpcjNQZGR5R29FTnJ3ZE5paDlYUXVFS2pYSy9z?=
 =?utf-8?B?c0J4RXFCTVpISzBUVTVYc0VMbmZqV1E4WVFFNnBxSFFIQlFPSjZEK1h2dWRj?=
 =?utf-8?B?V3hObnNFOHZoVmlPN2pVaUJXR05JMEJ6SXY5QU93NG1ST3R0Z3hUWkhwWWhQ?=
 =?utf-8?B?NEJ2NmlrcTRrLy94SzBFa3N2QWw4aTBZM2tzdFRnMi9kZ2V3cC9UakFOSkF2?=
 =?utf-8?B?cDd5cFhBZFEydUdvVjd5ZldqY1Q4VUxDMnlpK2xROG1WMVdWTm5EVU0yUGFz?=
 =?utf-8?B?dmlOcDJLMVhXUkx3R1R2ZkoveE9tTVgzditpOHdhOTViTE0rNnowWFF2M3Zs?=
 =?utf-8?B?MG1sRkNsVFlCMGlsU0lyaFFsdnpwVDRreWcvSGxuVVYxblFhTldzczJHYU1L?=
 =?utf-8?B?cmJrWkpPVmgyQ0IycXhPb3ptT3BHYnNXY0pPS2hVM2Fyd3RZWXc5N1FodkxH?=
 =?utf-8?B?TlBlK0ptSXBqeVljUXQ1KzRRMENodEVKNGorQytHeVlWZ3c2MVdvMmF4SlB1?=
 =?utf-8?B?UzNUekt2OGttSXV1K28vNUtYR0pZZG81UW9Nczc5a2IzNlIreG4rck0yS1M4?=
 =?utf-8?B?emFLVnZzMnRmSXFIa1FjM0E3VnpaU1MyR3BONjBEbTl4Q05pbDlnejBERTA4?=
 =?utf-8?B?ZVV1czU1UEp3MUQ1d0dCMEMzWHZWUnNVTzhWNGYwZEpPKzh3R05aR0RTaUty?=
 =?utf-8?B?ckNaNkZJVHljYWIxMzFQamo0N3FjRVBjL2ZkSENyNGcrRXVPUXNlN2NsYjRq?=
 =?utf-8?Q?5nOrhvYyWY7SPoqRc/iQZN8H6J4Wbi7JeOolJ?=
X-Exchange-RoutingPolicyChecked: G0QB7If+rIqaA+rC0ZEPGUv5kF8AkPgTGWoilwHyslxYMh+YqN/Rp+2WxtTAlPmoLvp4xNcACcYKPYGZstl21UlfUIUin4ZA587xAyXdszp09Tq33Og1xDfaRuFjD1V8CQoU8xqQcna8obxtJrsoiFYY2ji+jTlyQYSu++lvIUVYLAD38Q5jNE9pa/GVrYgctSyBuz14DCuERbtWlmZuL7lv4hvr4A88gFNXfF1N3BDpN/5aIx3KQzZtycB1V1zGFxtPA505RxJpACUN1nWJFoAAieKtcBl2imtszW+YtT4z+p+FppBZODnS6cYWAYx43vLqRw/vUEj8pD5jHGM4uA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5508d0-2386-4f80-349c-08def73720da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 23:28:48.2291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kfs3sM8zAZo6tgE/8Ef//HIh3mpylE8oAENAibEDN3J0i+0DFtyaX+uiC4cdy4xs3Pd0upaQolH+rPbyNsdSnbHaEAR+WnNmCn5pXQj9E9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
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

On Thu, Aug 06, 2026 at 07:52:32PM +0200, Michal Wajdeczko wrote:
>
>
>On 8/6/2026 1:00 PM, Mallesh Koujalagi wrote:
>> From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>>
>> Replace ad-hoc drm_err()/xe_err() calls in the probe path with
>> structured SIGID logging helpers. This gives fleet tooling a stable,
>> machine-parseable identifier (SIGID) for each recognised fault
>> situation rather than relying on fragile string matching.
>>
>> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c |  6 ++++--
>>  drivers/gpu/drm/xe/xe_hwmon.c  |  4 +++-
>>  drivers/gpu/drm/xe/xe_irq.c    |  9 +++++----
>>  drivers/gpu/drm/xe/xe_mmio.c   |  5 +++--
>>  drivers/gpu/drm/xe/xe_pat.c    |  6 ++++--
>>  drivers/gpu/drm/xe/xe_pci.c    | 14 +++++++++-----
>>  drivers/gpu/drm/xe/xe_pcode.c  |  5 +++--
>>  drivers/gpu/drm/xe/xe_vram.c   |  5 +++--
>>  8 files changed, 34 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index d25d02b24898..52bafe708d74 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -48,6 +48,7 @@
>>  #include "xe_i2c.h"
>>  #include "xe_irq.h"
>>  #include "xe_late_bind_fw.h"
>> +#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_module.h"
>>  #include "xe_nvm.h"
>> @@ -586,7 +587,8 @@ int xe_device_init_early(struct xe_device *xe)
>>  		 * Cleanup done in xe_device_destroy via
>>  		 * drmm_add_action_or_reset register above
>>  		 */
>> -		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
>> +		xe_log_err_fatal(xe, PROBE, -ENOMEM, "Failed to allocate xe workqueues\n");
>
>OOM errors will be already printed by the MM, we likely shouldn't have this drm_err here...
>
>can't we just leave it as-is and add xe_log_err somewhere in xe_pci_probe()?
>also, maybe we should wait with submitting more patches that use xe_log() until we actually get some agreement and merge that first?
>
>> +
>>  		return -ENOMEM;
>>  	}
>>
>> @@ -717,7 +719,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>>  	return 0;
>>
>>  mask_err:
>> -	drm_err(&xe->drm, "Can't set DMA mask/consistent mask (%d)\n", err);
>> +	xe_log_err(xe, PROBE, err, "Can't set DMA mask/consistent mask\n");
>>  	return err;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index de3f2aeffc3f..e4c319598dd0 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -15,6 +15,7 @@
>>  #include "regs/xe_pcode_regs.h"
>>  #include "xe_device.h"
>>  #include "xe_hwmon.h"
>> +#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_pcode.h"
>>  #include "xe_pcode_api.h"
>> @@ -1575,7 +1576,8 @@ int xe_hwmon_register(struct xe_device *xe)
>>  								&hwmon_chip_info,
>>  								hwmon_groups);
>>  	if (IS_ERR(hwmon->hwmon_dev)) {
>> -		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
>> +		xe_log_err(xe, PROBE, PTR_ERR(hwmon->hwmon_dev),
>> +			   "Failed to register xe hwmon\n");
>
>while this is during the probe, shouldn't we use HWMON as a component?
>we allow chained SIGID reports from different layers, and this error
>will eventually lead to final xe_log_err(PROBE) anyway
>
>also, there are at least 2 other cases where hwmon initialization can fail
>why only this one is so special that requires use of xe_log ?
>
>and IMO it would be good to add each new SIGID usage (across
>different files) in separate patches
>
>>  		xe->hwmon = NULL;
>>  		return PTR_ERR(hwmon->hwmon_dev);
>>  	}
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 9e49e2241da4..74d2b63cd505 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -19,6 +19,7 @@
>>  #include "xe_hw_engine.h"
>>  #include "xe_hw_error.h"
>>  #include "xe_i2c.h"
>> +#include "xe_log.h"
>>  #include "xe_memirq.h"
>>  #include "xe_mert.h"
>>  #include "xe_mmio.h"
>> @@ -759,14 +760,14 @@ static int xe_irq_msi_request_irqs(struct xe_device *xe)
>>
>>  	irq_handler = xe_irq_handler(xe);
>>  	if (!irq_handler) {
>> -		drm_err(&xe->drm, "No supported interrupt handler");
>> +		xe_log_err(xe, PROBE, -EINVAL, "No supported interrupt handler\n");
>
>this is already a dead code, as xe_irq_handler() never returns NULL
>we can use xe_assert instead
>
>>  		return -EINVAL;
>>  	}
>>
>>  	irq = pci_irq_vector(pdev, 0);
>>  	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
>>  	if (err < 0) {
>> -		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
>> +		xe_log_err(xe, PROBE, err, "Failed to request MSI IRQ\n");
>>  		return err;
>>  	}
>>
>> @@ -822,7 +823,7 @@ int xe_irq_install(struct xe_device *xe)
>>
>>  	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
>>  	if (err < 0) {
>> -		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
>> +		xe_log_err(xe, PROBE, err, "Failed to allocate IRQ vectors\n");
>>  		return err;
>>  	}
>>
>> @@ -891,7 +892,7 @@ static int xe_irq_msix_init(struct xe_device *xe)
>>  		return 0;  /* MSI */
>>
>>  	if (nvec < 0) {
>> -		drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
>> +		xe_log_err(xe, PROBE, nvec, "Failed getting MSI-X vectors count\n");
>
>maybe we should have IRQ component with SIGID_SW and use it here?
>
>>  		return nvec;
>>  	}
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 7fa18dfcb5a2..bcf36a381424 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -15,6 +15,7 @@
>>  #include "regs/xe_bars.h"
>>  #include "xe_device.h"
>>  #include "xe_gt_sriov_vf.h"
>> +#include "xe_log.h"
>>  #include "xe_printk.h"
>>  #include "xe_sriov.h"
>>  #include "xe_tile_printk.h"
>> @@ -105,13 +106,13 @@ int xe_mmio_probe_early(struct xe_device *xe)
>>
>>  	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
>>  	if (!xe->mmio.regs) {
>> -		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
>> +		xe_log_err(xe, PROBE, -EIO, "Failed to map GTTMMADR_BAR\n");
>
>shouldn't we use REGS component (SIGID_IO_BUS) here?
>
>and this is a FATAL error, no?
>
>>  		return -EIO;
>>  	}
>>
>>  	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
>>  	if (xe->mmio.size < SZ_16M) {
>> -		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
>> +		xe_log_err(xe, PROBE, -EIO, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
>
>ditto
>
>>  		return -EIO;
>>  	}
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index a5fe1beec652..aad15a4b0ac3 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -16,6 +16,7 @@
>>  #include "xe_force_wake.h"
>>  #include "xe_gt.h"
>>  #include "xe_gt_mcr.h"
>> +#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_sriov.h"
>>  #include "xe_wa.h"
>> @@ -686,8 +687,9 @@ void xe_pat_init_early(struct xe_device *xe)
>>  		 * raise an error rather than trying to silently inherit the
>>  		 * most recent platform's behavior.
>>  		 */
>> -		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
>> -			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>> +		xe_log_err(xe, PROBE, -ENODEV,
>> +			   "Missing PAT table for platform with graphics version %d.%02d!\n",
>> +			   GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>
>this here is pure SW gap and it is broken as right after
>logging this error we might crash in the xe_assert() below
>or later in xe_pat_init() as xe->pat.ops is NULL
>
>maybe instead of blindly adding xe_log_err we can just
>fix that first and return some error to abort the probe?
>
>also maybe we should add PAT component (with SIGID_IO_BUS?)
>
>>  	}
>>
>>  	xe_assert(xe, xe->pat.ops->dump);
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 36d62927b969..3c452f399e6d 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -25,6 +25,7 @@
>>  #include "xe_gt_printk.h"
>>  #include "xe_gt_sriov_vf.h"
>>  #include "xe_guc.h"
>> +#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_module.h"
>>  #include "xe_pci_error.h"
>> @@ -718,8 +719,9 @@ static int handle_gmdid(struct xe_device *xe,
>>
>>  	*graphics_ip = find_graphics_ip(ver);
>>  	if (!*graphics_ip) {
>> -		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
>> -			ver / 100, ver % 100);
>> +		xe_log_err(xe, PROBE, -ENODEV,
>> +			   "Hardware reports unknown graphics version %u.%02u\n",
>> +			   ver / 100, ver % 100);
>
>maybe use REGS component here (SIGID_IO_BUS)
>
>also, isn't that actually broken?
>with graphics_ip = NULL set here we will crash later in xe_info_init()
>>  	}
>>
>>  	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
>> @@ -732,8 +734,9 @@ static int handle_gmdid(struct xe_device *xe,
>>
>>  	*media_ip = find_media_ip(ver);
>>  	if (!*media_ip) {
>> -		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
>> -			ver / 100, ver % 100);
>> +		xe_log_err(xe, PROBE, -ENODEV,
>> +			   "Hardware reports unknown media version %u.%02u\n",
>> +			   ver / 100, ver % 100);
>>  	}
>>
>>  	return 0;
>> @@ -1088,7 +1091,8 @@ static int xe_info_init(struct xe_device *xe,
>>  		 * required for VRAM management).
>>  		 */
>>  		if (!tile->primary_gt) {
>> -			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
>> +			xe_log_err_fatal(xe, PROBE, -ENODEV,
>> +					 "Cannot probe device without a primary GT\n");
>>  			return -ENODEV;
>>  		}
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index ccc3bdeed6bb..c492737242d3 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -14,6 +14,7 @@
>>  #include "regs/xe_pmt.h"
>>  #include "xe_assert.h"
>>  #include "xe_device.h"
>> +#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_pcode_api.h"
>>  #include "xe_pm.h"
>> @@ -320,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>>  		mutex_unlock(&tile->pcode.lock);
>>
>>  	if (ret)
>> -		drm_err(&xe->drm,
>> -			"PCODE initialization timedout after: 3 min\n");
>> +		xe_log_err(xe, PCODE, -ret,
>> +			   "PCODE initialization timedout after: 3 min\n");
>
>drop "PCODE" prefix
>and move to separate patch

When you move this to a separate patch, please also pick up this change 
(from Michal)
https://patchwork.freedesktop.org/patch/743325/?series=171022&rev=3

Thanks,
Umesh

>
>>
>>  	return ret;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index 23eb7edbdd57..dada430d7ed5 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>> @@ -17,6 +17,7 @@
>>  #include "xe_device.h"
>>  #include "xe_force_wake.h"
>>  #include "xe_gt_mcr.h"
>> +#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_sriov.h"
>>  #include "xe_tile_sriov_vf.h"
>> @@ -43,7 +44,7 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>
>>  	if (!resource_is_valid(pdev, LMEM_BAR)) {
>> -		drm_err(&xe->drm, "pci resource is not valid\n");
>> +		xe_log_err(xe, PROBE, -ENXIO, "pci resource is not valid\n");
>
>shouldn't we use REGS here ? (SIGID_IO_BUS)
>or add VRAM component (also SIGID_IO_BUS?)
>
>>  		return -ENXIO;
>>  	}
>>
>> @@ -237,7 +238,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>>  	vram->io_size = min_t(u64, usable_size, remain_io_size);
>>
>>  	if (!vram->io_size) {
>> -		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
>> +		xe_log_err(xe, PROBE, -ENODEV, "Tile without any CPU visible VRAM. Aborting.\n");
>
>we should first fix the vram_region_init() as now it is used
>in two scenarios: to init each tile region, and to init device
>level region info
>
>and this error is meaningful for tile-based usage, where
>we should use tile as a location
>
>>  		return -ENODEV;
>>  	}
>>
>
