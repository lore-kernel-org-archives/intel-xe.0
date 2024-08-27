Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73205C5473A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 22:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3416410E424;
	Tue, 27 Aug 2024 22:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRRi/79C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD7210E424
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 22:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724797759; x=1756333759;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HdPami88dczbWWycpJJqWleTLETYDdTMW4C6K3rYpDw=;
 b=SRRi/79Cap5zWAZhk9/3jGhjlzhlPq5q5DexJx4XmjIUa8YUhbraNyAd
 ZvwQFru8C4hTuJvI7uRiBHsMWXWa0a2awfxBG21gtlSJKw7Hz6aGsLnps
 HmfcZFfb7aPL5EvZq72euiDmGuBThIHgH3nfI05FRNrpTSRReB6At1gHL
 U8kno+nubNFoXMBNxJ5ZYDe4iVWUvJ3VrLT+357QMnF7jx3lJoljYNa95
 gkOkIq9Jun4v2Bq82D8BbB9ES97yR7u89h0Q12WrWvZQPUcVyXlwxRelA
 UMVJMf942gJxhuglg2gaXIkB3Myb3zi86ZYcGsqBF6CZnfAEsn5pZi68C A==;
X-CSE-ConnectionGUID: xcQ9oiFeTVuwYOAgwu+N/A==
X-CSE-MsgGUID: AuILCTFGSVekWYGSlawEsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="33926475"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="33926475"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 15:29:18 -0700
X-CSE-ConnectionGUID: IePWXPPjR0K06exxdFPHFg==
X-CSE-MsgGUID: MCHdUIAoRLW9gd7DBgIkoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67910990"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 15:29:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 15:29:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 15:29:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 15:29:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okCnvHqdsN18C5DaV7EmB/RRFdVEqro5JjZCGVPwlAk6SPMdLY5IdCH2WaerLqeIsQH4uFNM+NvZUK+hzREI1K/rFTuAL1KvM0qJX/LPVT+vG0i/BHKHqgfdKbcRwvIjGosK9B0tOBrDed4ymRNjq1bZiaxvcL5iaZrQg32fJDSzahYFkFPhnB0O2+Jy5vaMLrZwsDnpez/GuuUgE2Q0orfWUXP6Ozo85pY+R+NoIjqa9TerPK2scPyKnJCTHsu6O4xitLMPBjQeg2ZFMaBYh5CO38o7UOkmiEfufqXQW8Bqp7OOAmgcY6nye6b8kHmNuAsHpgQKMWCgnOw8ljxqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bxFCgqh2fkp0kivCTZCHdZCNSLV+zyo+13kPlpaZZQ=;
 b=OXJNAy4XrL2fPxGnZWLCFt202q/8K4FyziXPvduMTm+oVNnp3pxBHKHP6cXXnW24mrzZ3mxI2Emonpn5H5MuEfKyTzRDUee5fqqqqCb6fRD/6Gqsg0fXbRbDg1KFW3V1Wb+OO6lG7noVpIcCPy40EMNvKzS5p06bJ+ZTMtSgVTRnMi7YsHgN7xQBdgtPyxgtum8Zj9jvRBqFQXCBUb8FNnf01i/dPKzLnTLg4wFACi6nLJqusojovVJZCvqUB678UQKgI8el2IZXzV9Pd4ywrCPeJ6WcCYU8lLJv4HCCHKCiES4SsXTlDn/wRoDpBaa23iUV9aQ4mUteYmRD3V6qVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 27 Aug
 2024 22:29:15 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%2]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 22:29:15 +0000
Message-ID: <ca6aedae-a216-4753-a7aa-68056922ab96@intel.com>
Date: Tue, 27 Aug 2024 18:29:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/7] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240820021142.436536-1-zhanjun.dong@intel.com>
 <20240820021142.436536-2-zhanjun.dong@intel.com>
 <907851009fed50c370824f2cafc332f127841ef1.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <907851009fed50c370824f2cafc332f127841ef1.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA1PR11MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ddcc73-9d77-440a-050f-08dcc6e7aecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2lrb1lyRHFqSVhsS1BqR3EvMk5OTU1ScnE1WHJMekQ2Z1NQV3VDRHV2MFlX?=
 =?utf-8?B?d0pPTFBaYjl4VVFkWXlmT0xOQmIzN09LYU12QVZNT3ZCRm5kNTIvbDZ1TUtp?=
 =?utf-8?B?V0l0aDlMeXR5Z3ViRG5VTk9aMmZ5Z3U2QndBM1dTZjYwQ3lLdVVRWThlSS8z?=
 =?utf-8?B?aVR5OTRINzJsN1hMWlFNT0JZVXdidFl5dUxjeW9obG5RbXQ2U0dvWE1TMGNu?=
 =?utf-8?B?QlRVTDVwOGRqekN0cFNwWFNrYmNib3NIT3NHVVd0aWkydWpra0RuOTZaazMv?=
 =?utf-8?B?aHB5b3c0T2FRWHcxM041eTlma1V2bEtFbEN4bzBldGtkSmNGbUlzQ2s2SEdR?=
 =?utf-8?B?bnpHdE1BcmJYWjhucUFpeHdHNkdRdHVpNFhCWWlKMVkyVkRTWklXL2llaFAy?=
 =?utf-8?B?ZEJBSVk4dDRWYm1JR2FLeXIwTE5pbTFDenVZUVpsWDMyK0d3cHRxR2Ixd3Nn?=
 =?utf-8?B?NjlQREM1bCs0aUc5Nis1cXArdkJwWjd3TnNKUm9FcWVMcHAwSUVWQXloK2xo?=
 =?utf-8?B?d1pBUVBaekNZMjlmTDZIMHJ0R1RXTTJKRGdXZHVoN2VtZitiWnYwaFhrRkZr?=
 =?utf-8?B?NFEvbkxMRmloWElIK2lRalFvNXlMS3BWR2I1aUVIM1JnTEtvVU9nQjNHMTVr?=
 =?utf-8?B?YXZ0bVZkK0ZCQSt5SWpaSW9xRWxVU3gyNzc3TmloR211bytjTnp1SUplUjRn?=
 =?utf-8?B?ckhJMkZLWWVpRGpBQWZ2dnVSYmVncGRUYjMySXRGSmhzZDR5TGRMZDZkdjNQ?=
 =?utf-8?B?Z2xUVHJjQlg2d2Ria0NoMnJwcVBoeXRySmMyaGZjMENrRmNTa1F2ZHEvSEVF?=
 =?utf-8?B?WkVuby9lTXhHVUNYakdyd2YreElReThhRk92cDd3Qm05c0pXYjRqdjY2S0Mx?=
 =?utf-8?B?SElYNkNDckE3ZUdGWENGWnNJQzMzMERUMmJmRkV2NFZPTzRRWGl3VExkZ1E3?=
 =?utf-8?B?TjRFSkV1SGd6UVNZTW1VZUlkemtkSmtWSmZDd2hQT09INnFJWSt6dE9xTGVV?=
 =?utf-8?B?elNDYlFCdjMzRmFyOERaMzNtUDZQc2JnQlg3VmJCeHhqUWxQdFAwRFBmQldL?=
 =?utf-8?B?V216ejJGRlFxV3NNRXpDUFJwYzdKZXVrLy9TQ0hidFd3a3dzZm9manc0MmF5?=
 =?utf-8?B?SVE3dUEzZlZjVzJHM2V1TllxNmZyc0toWDBQMy80bkd4ekl0ZEhUZVVmQ1Ro?=
 =?utf-8?B?K2pQRzQ2cWF1OS9ZY204RU9rMnhXeEVwQ0kzWnZTTEQ3ZVhVOHo4NkFWcHha?=
 =?utf-8?B?dUVLTkg2OXd1YlZHTU53YlliazRzQW9SQ2ErRUNQTytjbzZSemZEYWZjdnVK?=
 =?utf-8?B?SU4zUVVUSjVOSjBLVk10MndNL0N2WUVocXpoTXdTL2ZqQXZHTGxyTjFKQVhX?=
 =?utf-8?B?VXJRVGdxOHBpZk5HQ3ZBMDIyOEVQVThLVG83YTBYdkNhT1B4NXJTTjZ5TFdX?=
 =?utf-8?B?TDJYb2FkV1g1czBhS0xkRWQrbG1paWFSL3FaRmptVDM5czlqNTB5dDdoS3gv?=
 =?utf-8?B?dlNybDhvNUtqK2JzNkN1cjNMQStwdWJxanFKZW1GSFN3RFYzK3BDeFFPRjls?=
 =?utf-8?B?eVBpRlQrSjI5b29IL2o3dWxOOVdYOStCWGVackNBYk83cnYrS2N4TzFyc09Z?=
 =?utf-8?B?UnNjZ1lKMStKSzdjcmRiRm9YdFBGQUh5TEVkNUdPNVpCNW93Y0dqWXdKc3Zi?=
 =?utf-8?B?Tk5yemxjSmFOd3N3THg4dFlWL1Q2OHkrbGFqYUpSNlJ5b2ZYamtxdkU3N3E2?=
 =?utf-8?B?VU1ONVZ3bW5GVnVjc1lrdTgrVHNCNEJmbmlBd1BDSUIwcU1nZW5lS2tFOE4y?=
 =?utf-8?B?ZFNaMWdMTTFveFNZdVFqQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2NRUWJzRnF4bmNZL1F2clMwUGMrUllET1htcE8xUFMvb2U3WVpQYWRiNzFv?=
 =?utf-8?B?bStrNHEwZVBJSU0rKyszSW5NOWdla0NJNE9BOUtDQ3JoU2FmYzI1blpwTVhN?=
 =?utf-8?B?bHVqbTY3QUJCZUwxdXZHZFhkRTdKaGt3b1FLZDUyY1JXd1Rzd0RIUlpsdTI4?=
 =?utf-8?B?VGU4eDlCSHJ6cTNBNXZIUGFCVEg1U2xlMDBKK0llanpOQm1vcWRaQXRBQ0xv?=
 =?utf-8?B?QnVSUFYyRDZnQlhWdG5LeER2M1pwOVdTS21nNzFlKy9wRkd1bndLTEoza2tE?=
 =?utf-8?B?UnplK3Q3Z3h1NUt3aEpvWlVwc1JFUm9SOE9sSksvaUdGV0JlUExzS3l1VzRN?=
 =?utf-8?B?YjZmOSs1ZHdLSnk4TEJqdzVna0Z1U25GanU4T1JjRnh5WWRRTmo3TnVIdHEw?=
 =?utf-8?B?bUwvcWJNcDNOblFqTi9XUDNhTWFkYjBXcWlMQ0hwVzhSR0tWM1kxMFNDakd1?=
 =?utf-8?B?dzk0UmQ0YUpuYmNmSkdId2wzaDUzV3JKUGhuQUd3U1BPYVlXTDhZek5xV0dv?=
 =?utf-8?B?Q3kvcnpxQWlOcEkrZHBrbXo4ZWNJUk1IRmxpeHBrTjdCaGpsYnJZbGEwRzJl?=
 =?utf-8?B?NllRMDBwN0YyWFFVd1VKY0Z2MjZUS3o1L0tWbEhoaEx2RXZaeTlFNDdnc1Vm?=
 =?utf-8?B?a1pTbThYLzRuZ0RQU3JQcnQyMExUalpDaG9kUkYzN1JrZENKNWQ4cENYUVdo?=
 =?utf-8?B?d05mVWpiNTdrVDdrV28yMXR1dkQ5MTkyRlFZT2tGS0NEMXFKdE5IYTlma3Jq?=
 =?utf-8?B?dS9RbDluSDBzNnQvM0ZmSjdrQmVncy92WWh4dCtJT1dhaDN0MWtqVmp6cFZ3?=
 =?utf-8?B?aDRSMXVETEJCZXBlNDF6RHFtdWxPNVdGRzQ5dnEvRS9BcWx5L1dqVDJSSmhw?=
 =?utf-8?B?SEl5Z0NPR2tUY0E4Uzg3Q3JLMEk5VlVtbVdYUis0a0Vvc2dYbXdXTklMeVBI?=
 =?utf-8?B?YWd0WCtSdnNjbnBHekhpajJEUWdUNyszZ0FzbnZsVnp4U1IyeWZ1TU52UjQv?=
 =?utf-8?B?WUN5RVJyNGRNZ1VCWSt5ZCtHYVVwT2pMeXl5WHZIdU1sdWRxR2RhVkZQOXZC?=
 =?utf-8?B?QjQrNHBkT0w5c2RLTXc0RlR4ZWJybFRRR3VBd1dMaHM1dnZUaW1MK3FmRlcr?=
 =?utf-8?B?Qk1FZzBsK2pzYkxtcUFwS3E1bVBrL1VXVFZZUTB0cWd6dlN1bTZoZ0xEOHE2?=
 =?utf-8?B?akVReGU2WFZobnc3ODhad3ZsamlQemJmSmJVbDQwM0tvT0h6NW1NSng0VkNO?=
 =?utf-8?B?dHFZZHk2ZkhxK0w2OXhrYi9GOXFCcWsvVnRGTVNZektnRER1UGFmVXExcVJs?=
 =?utf-8?B?K0hWYnZtVzJvQXNCS1ZJSzFuWVozZkI2eHdlMWl2QVZDcjRITlJlV2wzSVg3?=
 =?utf-8?B?OG9iYXBwaktRMEhMQ3JRRFhpS25maEdzZlJ4N2ZUUkNaTGsrdEpzRVIzUDFJ?=
 =?utf-8?B?YURHdFg3U2Q4cWY4elIvY0JiRGtDbnJQY1Q4K3ZmbzdMUVBHZHBTelk2cTFu?=
 =?utf-8?B?cWVHYjRsUkIzU0tvMHRiLzFrakMvVWxvYzJoMnNrR3d2Vk12d1NJQ0ZPU1hM?=
 =?utf-8?B?UGtreUFjWVBRelVqb3p3OUVCd1lBOUM5MG1oRVZaSmMvaE45VG8yU2NiMEdy?=
 =?utf-8?B?MTczOS9jeUp0K1F6clBuNkRuWmZINVh5SmxoM0VrVWh0QWxDNDJ2V3Fsa1hV?=
 =?utf-8?B?K0QxUjd2dGtXMk9wUkZQdkdEOVk3SFVRcG9oZWcxTjZXd0dxVk1acm9yV1ZZ?=
 =?utf-8?B?Z3RvSW1tT1FJaHFjTHd3d3FzRHQ2ZzcrNmdhYy83WGc3VjZyenB5anJCemti?=
 =?utf-8?B?VWZKRXJmcmlNb1JQNTNMUUY2cTB0cVBLSngwbWU5VHpNL1FocG90a3htZW13?=
 =?utf-8?B?N1FjYWxIaGQ3MWV3Sm52Rjg1RWpUM2lzUk5Zc2l6NkZNb2VtTGNLaSs4YS80?=
 =?utf-8?B?VHpXd0hDWXBMUHU0TnJQTHcrbk9vSVhOT2UzMmdVLzc1VmFzaFhSYjgzcmtw?=
 =?utf-8?B?VmhNTXc4SW1PWHNpTmpkZjl0SXd5UDBkSXRGUmlrbmZJdDhBVkRYb3ZKU3dz?=
 =?utf-8?B?VTVPcXI0Qzhpa2RJenJUeVoyOXkvSzBrdGdVN3M4TjlEVWlDaTgzMU1xOUUr?=
 =?utf-8?Q?tyK/gvm5qCBQ284zbYkcovCtM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ddcc73-9d77-440a-050f-08dcc6e7aecb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 22:29:15.3377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGCI4bpslEYivuPs5jDM3SAxKOBhOIIVb3YgT4WK5XYYGNhDG8posYIFgIU1jnBu8u3OLvqcWE2Mc9+H/P+2+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
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



On 2024-08-27 4:30 p.m., Teres Alexis, Alan Previn wrote:
> So i only have a few nits since the difference between v15 vs v16 of Patch#1
> is limited to the inclusion of the additional variables in the register list
> (to aid with for print-formatting of output), as well as the separation of
> list for lpg vs hpg.
> 
> However, lets ensure we circle back with confirmation that the register
> list ordering is not impacting the debug tool. For now I'm providing the
> conditional-rb pending that ordering - just need a reply on this.
> thanks again for the perseverence.
> 
> 
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> 
> 
> On Mon, 2024-08-19 at 19:11 -0700, Zhanjun Dong wrote:
>> Add referenced registers defines and list of registers.
>> Update GuC ADS size allocation to include space for
>> the lists of error state capture register descriptors.
>>
>>
> alan:snip
> 
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> new file mode 100644
>> index 000000000000..0e75d1553730
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -0,0 +1,508 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>>
> alan:snip
>> +
>> +/*
>> + * Define all device tables of GuC error capture register lists
>> + * NOTE:
>> + *     For engine-registers, GuC only needs the register offsets
>> + *     from the engine-mmio-base
>> + *
>> + *     64 bit registers need 2 entries for low 32 bit register and high 32 bit
>> + *     register, for example:
>> + *       Register           data_type       flags   mask    Register name
>> + *     { XXX_REG_LO(0),  REG_64BIT_LOW_DW,    0,      0,      NULL},
>> + *     { XXX_REG_HI(0),  REG_64BIT_HI_DW,,    0,      0,      "XXX_REG"},
>> + *     1. data_type: Indicate is hi/low 32 bit for a 64 bit register
>> + *     2. Register name: null for incompleted define
>> + *     A 64 bit register define requires 2 consecutive entries.
> alan:nit: this sentence above should be combined as part of "1."
Sure, will do
>> + */
>> +#define COMMON_XELP_BASE_GLOBAL \
>> +       { FORCEWAKE_GT,                 REG_32BIT,      0,      0,      "FORCEWAKE_GT"}
>> +
>> +#define COMMON_BASE_ENGINE_INSTANCE \
> alan: please ensure you have 3d-umd folks confirm that the change in
> ordering of the register printout is not an issue - since we are now
> using the same list for both exec-list and guc... and the ordering is
> will be aligned for obht the guc-ads-reg-list registration as well as
> the dev-core-dump-register-dump printout (which is what we prefer to
> ensure no dulicated lists for exec-list vs guc). If you already confirmed
> with them offline, please reply on this. I would expect UMD's scripts
> are flexible since they have to handle different gen products with slightly
> different lists - but best to be thorough. Thanks in advance.
Sure, I will contact UMD guys and get back to you once I got reply.

> 
>> +       { RING_HWSTAM(0),               REG_32BIT,      0,      0,      "HWSTAM"}, \
>> +       { RING_HWS_PGA(0),              REG_32BIT,      0,      0,      "RING_HWS_PGA"}, \
>> +       { RING_HEAD(0),                 REG_32BIT,      0,      0,      "RING_HEAD"}, \
>> +       { RING_TAIL(0),                 REG_32BIT,      0,      0,      "RING_TAIL"}, \
>> +       { RING_CTL(0),                  REG_32BIT,      0,      0,      "RING_CTL"}, \
>> +       { RING_MI_MODE(0),              REG_32BIT,      0,      0,      "RING_MI_MODE"}, \
>> +       { RING_MODE(0),                 REG_32BIT,      0,      0,      "RING_MODE"}, \
>> +       { RING_ESR(0),                  REG_32BIT,      0,      0,      "RING_ESR"}, \
>> +       { RING_EMR(0),                  REG_32BIT,      0,      0,      "RING_EMR"}, \
>> +       { RING_EIR(0),                  REG_32BIT,      0,      0,      "RING_EIR"}, \
>> +       { RING_IMR(0),                  REG_32BIT,      0,      0,      "RING_IMR"}, \
>> +       { RING_IPEHR(0),                REG_32BIT,      0,      0,      "IPEHR"}, \
> alan:snip
> 
>> +/* Render / Compute Per-Engine-Instance */
> alan:nit: if i understand correctly, this comment should say "Engine-Class", not "Per-Engine-Instance"
Thanks, to be corrected in next rev.
>> +static const struct __guc_mmio_reg_descr xe_rc_class_regs[] = {
>> +       COMMON_XELP_RC_CLASS,
>> +       COMMON_XELP_RC_CLASS_INSTDONE,
>> +};
>> +
>> +/* Render / Compute Per-Engine-Instance for xehpg */
> alan:nit: same as last, comment should say this is for class, not per-instance.
Thanks, to be corrected in next rev.
>> +static const struct __guc_mmio_reg_descr xe_hpg_rc_class_regs[] = {
>> +       COMMON_XELP_RC_CLASS,
>> +};
> alan:snip
> 
> 
> 
