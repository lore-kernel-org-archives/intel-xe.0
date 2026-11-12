Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EFA606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PR1hzeWs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F1110E529;
	Thu, 12 Nov 2026 09:14:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE6910E529
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 09:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794474882; x=1826010882;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yiZsFjvwxCUDYG8t3RL+n8vlmM2qxIejzlETh0GbO38=;
 b=PR1hzeWs8JqKqnnYglii34pxsqtRyOT+T9muobFfQ2B5sMDR7kXhi488
 TaA6hgoVKUFE58RA4UCisZP6WlAOvCH45tL6EXZhT82PpC+H/R1unMgqS
 3dwIlXfziyqtSf6vsvTQWZiEBMDgU2c0K+BNojZGDI+GW/4B1SGf3+uod
 Uf+ZjV7x9/dJ/wloOPqH1LWtvrheK67BQbxn3q6sg9eyzHKkaODpHAPKH
 sg+goHzRWpdkPldSEASBwi3LzNjpKPQk8S65WruOMkrCxzcOgXRML/ACg
 CKHE6DAwBgCVrb4hsw2rkH2NQ67N+EQzkbDyyohgnBgreE5Kmt8nKiTI+ g==;
X-CSE-ConnectionGUID: alGbB0cQTjKnNHvTcwvF4Q==
X-CSE-MsgGUID: Rkky2TlMTUuM0MFB5e6Nmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3288813"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3288813"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:14:41 -0800
X-CSE-ConnectionGUID: ziSpxT3lQEGoCSgVBFDjPA==
X-CSE-MsgGUID: ESFy64MRQLmSP3A1fKmZQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8931131"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:14:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 01:14:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 01:14:41 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 01:14:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RaUws4wPN52RbUGlgLWphkYOqg/HPaW1JMBAK+Xjfi3hFW1Xt38wrE/tXUCAV9NWiiXo1NLJNbaVMhS1o7OpsB3dD12brMreRJpvUejkCQys9fy6LFjCHhT+8M9qoN5woi+bXimcUSl5PF7+tH0y7w7YLuDdpGq8fhuklChy65pfVtWXsXvNAgNyc9xlxufgfX11fdtPjIQwR+GilBjv6To6im23kJe3KmJa/Rok10gVJMeuwi2vrp1XiDUFAVFOQDX0rXO8PnhenAON7F22XHg47Qxt8Dg+gkj4CW61HCmMsE8Cvh/W0obLVEBtzCBdhnK/41zE3l+V3Idpc8xPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PopLPXVFO0TwYEbrzBdcS9aApnkftTIPblrxOoIq51E=;
 b=ecnWzwEIWGIyx41dowRhAoBzsJ3NFGZVGfXuekO4Xn7IoLrwD3nojjFnLEptb1RVNY1kCXuMqaZlvSFAAeyJK86Esk8YJ6Nki1eMH3HALlVh6KJtrWq4DInCbVQ6EL3yeVuOLXb9+79y3/GCGwFrI9j82sQgPEhrOo+aGaDUH925byMiMpD6unWU/7ePAyTUeQ/RbAxQsu8nyuvd5Sw18HfGYn80zl/PXa94R3vo47TBHtcj/SuMHcktG6RurRuOfd+uPT9eUF0w/o9ZLtK568dECnyyFCcy52VqINPaJmQXGb5T0LyooH66rXrOrhRRoNM8E/3jeC/43lib/RNLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB414024.namprd11.prod.outlook.com (2603:10b6:610:34d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 09:14:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 09:14:39 +0000
Message-ID: <84e17025-a7f8-407c-8c27-144232f4766d@intel.com>
Date: Thu, 12 Nov 2026 14:44:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/xe_ras: Add support for PCIe error component
 handling
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <badal.nilawar@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261111123021.3253044-2-riana.tauro@intel.com>
 <da57b7e4-a2e3-45df-b925-e840595b6b29@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <da57b7e4-a2e3-45df-b925-e840595b6b29@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB414024:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aac066b-e4b9-48eb-599c-08df409d60a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|4143699003|11063799006|56012099006|261028144727099003|261102123227099003|261026140227099003|261022105027099003|261022113327099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: cX4L/qCnuh4ZxpzaFBa50Q6C+Au80DY38Lv2tdZXItLj58lmIMp54Y3YVSh8fR5kBDhB6nQNRfNSWalGrlwFgy+1VnIXCSc77ES6g38rzef8RJIBgpqM0FHm6FOfzjDDhvihJyzvpasuWxyg3iRHTbqxmRA5l3pSZ8G5wpHv+yalqLT51IfEzwQpjyS2bEP/wouoJ7xLEffravhrVdh5remCDtOkBQnURIFKr4Xw0Eq+XVQIyW/gemWL5SxWfilWdIleixfFylPn4EEDhNgd07TyOSDTsahKFSDhjGFJBz164TDJUJ3bFrb6d0SzjJF+jqAOhkiiXQ5pW0Uk7E+wRw+VjlQZWxyyv33YVKBlcSS+XGtwzxTbnOSpanNCwqTX+MBMn+3HNmDhl36dWxhapRPebUTEuJkLkVwXkG2Zkn9GnRnzf0Qrnuj3xMGM1L/G45gQOvbAOHPrLBr2pzoiNlKiZdf646u7t601EOExc8DEDDkHAAnvqOwzEH3i9A6paLiobt+GF0gsgWRPLW5oleVnvVnAuHJe8nB1XlUqM7v0JtnWrSPaZqT1z/EA5+SXYC0E9Nt1zdTrXAAeiUUj96TqfqqktlPe8xcYVkoZDwv+TPwibWm6kIzry2GEDDO0SxUXc9KsVis3ZfgGzO7kioKRUFe4GhVhSj05radPC3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022113327099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STZEZjBxSFNCanRicFNOcEdxOG1BbnJLNGVibXRpZGN2NWM4N3pGWFVKY1JE?=
 =?utf-8?B?QVhXVzIwUTR1dmtGSlV6UlVSVGdWR2FPdmVLRVRpNXpuaGFGOUliN1hBWlZ3?=
 =?utf-8?B?VTRvQjdGL3JJa1cvanYwdVhPSFBxVlQ1S3lsSUhSQWFXRjdKd3lEZ2J0TWtF?=
 =?utf-8?B?cUpBRWxVNkkxY2RCRExLbkFKdlhva29nUWl4ZGlvczRweU5maGk0RWU1dWNK?=
 =?utf-8?B?OU9neDhucDBsV1g2WUVXL0dQTCtHcmoxbWNrSkZLUWhBSjBKbHppa1VPRCs0?=
 =?utf-8?B?LzdyWSt3dUxialBGY3ExeEpTM0gvZmlsQnc5U0FKa1Z0Unl6Y3hGbE9lZFI3?=
 =?utf-8?B?MEYrK010U2lpQUZ5bTE3a1BuNWlhYzRiUSt2ZWpWVHh1Z20rOUR6d2I3VGhE?=
 =?utf-8?B?N0NlSTE2ZXN1SFRxWXNxZ0owRW8vQ1Q0THRWRG5FVnRGeFBXeGZqa2NITHFx?=
 =?utf-8?B?Q3M2bFA5blNpQm1tTWJvM0xHaDBiNXJBS01CeVJaWnhCTjR2UVhpOW5aajdy?=
 =?utf-8?B?SDlLZWNJenN5NjJUVVBnSnRXdllaMGx3Z1k3N3ZLRnBSUzBkeUxockVQM0RO?=
 =?utf-8?B?dWtvbDNrT3M0NzhvMEtzQ3VIaFpRcUxITW9hbXFlWnNIZUZwaHpGQklEd240?=
 =?utf-8?B?bUxOYWVEM1FONnY5VHRLSDJ0MS9hNnY1ejdDRytmc3RpU2FmTFBTNTZOV1hw?=
 =?utf-8?B?bzd4QUdwQ2w0QUQxRlhkVGRpWmxXYk9BcWtja0h5OGswdmdhT1V2TzVZdGxo?=
 =?utf-8?B?d3dqRTBwQ1ZxM1o5eU1HaktJYVdCSW1qVVdTYjNONUpsdWcvTkk1a2hnd0pl?=
 =?utf-8?B?YkdTS0NidWNmZUVSZlVaaGl4T1lrQys1VWxHRnQ2MEJCMFdNZFNnZjJyclcz?=
 =?utf-8?B?L1lyZTRJQ2dpUTZTZnVMbkJGeWU2Zm8ybXZCOTR2VHRJS1dwU2tYL2hkZk03?=
 =?utf-8?B?KzNIUFlrZHJ4V1lmNkpobWtrNzZ6aEcyS243V1d6dVloUytZZ2ZNOERjV3Uy?=
 =?utf-8?B?dDRhcDNZRjk1ZkU1d3RRY1QrL1lDajJlSUl4NHo3LzJHYXhzbEcyUDF2NXpi?=
 =?utf-8?B?T2k5Zjk0WEIzdlMzTHhuM2U4VS9jaFVuT0FGYzhwOWR2MUg4T0o2Y2g0Mjcy?=
 =?utf-8?B?Z1dLT01qM25rU2RPbEFxdUYxOWNnOWdLQ05FeGs3eGllTEpiVkhiWkdUSGJW?=
 =?utf-8?B?aE9YTFdlVDI0ZzFPM3JDM1dXcWxKNUlUWFdUa3JIcFJxOFBQSVdmQjE1N1FS?=
 =?utf-8?B?Q2RvNkFzelNTT2dQWHlnRUhKcmJQbnlSaHhnd2ZVYzJacnl0NUVRYXJ1OW5m?=
 =?utf-8?B?T2U0ZmtZdWdrS2ZuMTJEVFNMZ3VzNHR2MWtpMzhoUUdVSjBadGM3cEtMOGZq?=
 =?utf-8?B?RnkvZXZiQWF6dWs1MDR6TXVNNjBTUHNGRVQycDgrOWQ3aWRIdU5DblQ4eURR?=
 =?utf-8?B?emZwQStKUU8zcnduemYzL1d5Ylc4aDlRYlUzQ2NDTnBIZjZENnpVc1F1YVRk?=
 =?utf-8?B?RnF2N2ltbmZBMWpXbkhoZXZSOTJOL1NYV2ovcFRqME9ZTWNycHA2S0R4eDlv?=
 =?utf-8?B?Y1dmSE44ck1jcFNjdWlxZEUzcUMwZmU5R1NGdkZFMTcvSVlndDNSZTRsdGNT?=
 =?utf-8?B?b1hkSWp1UVdJaEVEQmhPZS91Y0tuREdJZng2U1RhU24raWlRWW5OaE9qcmNa?=
 =?utf-8?B?UG5qTHp4c1RrdlpvVHlFQ2VGaS9xMEQzSnpOWXFaMUN5aU9lQll1OUY1RHEw?=
 =?utf-8?B?aUlydkFnWWpkdUY0WFVsaUdRZkZxVXFtVnY5OGJYZXhiVTA1WG9UNEhYVTB6?=
 =?utf-8?B?Y2IxVkszSGtaaFI1Rkt1ZXZUVmNkMm0rKzZCd2lFWDh6Y3l3TSszM0lsV2RJ?=
 =?utf-8?B?dW1xMTVqblVRV3NRTnlGdWYzc2prRTkrVDZBTHFWczR0RXlwQXhUb3hJWFp0?=
 =?utf-8?B?cTVnN1N6RG9OQWI2ekU0L0RtbzMxeGM0b3hKT3lUYjlWd2N6dTdnLzBPWTR4?=
 =?utf-8?B?RTBjTCtFajRwbmpnekNqdFExeThhdkVwM0ZCb2FxbmFNSENkaEJKV1NBRDlW?=
 =?utf-8?B?d3pWVUFxbU5rb3gvMWNvTXNPT0w0T0ZjUmVlYVhwenFCbmloYXlZUW9vakc2?=
 =?utf-8?B?YjZxSE9jRHc5YVoxd041WjdWaG81QXBKemVCbXcvTGIvUW5TTWtkMHYzdGt4?=
 =?utf-8?B?T2E4SFpsQU8zLzBYZGJycEN4TGxjYXczTk4xV05XWm5qWnJneHBSSER1dVhz?=
 =?utf-8?B?N3Zac0RSVDNvWmkrZ2dHSWVjYnJNUnVCaWN1dno4VUxxWkVzSURjV1NLUFph?=
 =?utf-8?B?LzBBaUJQZkxIMUI1QVM0WWVrekltWXZxRHdEbW5vZUg3dFM0ZUloQT09?=
X-Exchange-RoutingPolicyChecked: q0PyAXfKjg4UEZgE2kmuhVX4ojwEbS/aTqinMGS5Dmttkgl9UpSinaoH4I3ardF4NcRNgUCABqFNzAV/nUlHNReydiO3rleYCEO9ShuP3qT9l8VRrdhb/x945KhGIEH/972IbqMK3dG9sMi9deiltsqNZk+6aZTjHV1d0PRIc4t0txr1NyyA6jiQ3+BqTV0IuiqbuDCdRREbI/WmWfqFqVFVQlbi1qIbG1TxtWa5+I0jcDWhnzRoDSS1XHx5FPHk7bnu0NBQJ+JERgYUUHwuZhXBNQhcnFoKn+P2cBhYXjvNElGDQs1+8gUIHQJQJd+Ewv0wXhhz1b7ZjvjR12twag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aac066b-e4b9-48eb-599c-08df409d60a3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:14:38.8979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwHUvlr84Wm0CYIBjcSScNA2UQToFSr9zMjZSjf2GpnlfmbBcUag8aVQPUAmMtSAN/uJ6gxzOdp/ze+zK2+/Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB414024
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 12-11-2026 14:32, Mallesh, Koujalagi wrote:
>
>
> On 11-11-2026 06:00 pm, Riana Tauro wrote:
>> Add support for handling PCIe subsystem errors. PCIe subsystem power
>> management errors require a Seconday bus reset(SBR) for recovery. Treat all
>> others as recovered and take no further action.
>>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>> v2: add mapping to cper severity (Badal, Rodrigo)
>>      add abbreviations
>>      fix punctuations (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c       | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 2c01c183d02b..bd3ad017f013 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -698,6 +698,19 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>   }
>>   
>> +static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>> +{
>> +	struct xe_ras_ieh_error *info = (void *)arr->details;
>> +
>> +	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), PCIE, &arr->counter,
>> +		    sizeof(arr->counter), "error detected\n");
>
> For consistency, start message with capital letter and log 
> global_error_status as well.
>

The log is consistent with the correctable logging of general errors. 
Will be printed as below

  [drm] *ERROR* SIGID=201 (0204xxxxxxxxxxx) [Hardware Error]: PCIE: 
error detected

Sure will log error status as well.

Thanks
Riana


> Thanks,
>
> -/Mallesh
>
>> +
>> +	if (info->global_error_status & XE_RAS_PCIE_IEH_GPMA)
>> +		return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +}
>> +
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   				      struct xe_sysctrl_event_response *response)
>>   {
>> @@ -889,6 +902,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>>   			case XE_RAS_COMP_DEVICE_MEMORY:
>>   				action = handle_device_memory_errors(xe, arr);
>>   				break;
>> +			case XE_RAS_COMP_PCIE:
>> +				action = handle_pcie_errors(xe, arr);
>> +				break;
>>   			default:
>>   				/* For any other component, reset */
>>   				action = XE_RAS_RECOVERY_ACTION_RESET;
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index a86f9d2b8c92..36435a3f52e7 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -14,6 +14,8 @@
>>   #define XE_RAS_NUM_PAGES			25
>>   /* Error bits in IEH global error status register */
>>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>> +#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
>> +
>>   /* Device memory error categories */
>>   #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>>   #define XE_RAS_MEMORY_POISON			BIT(2)
