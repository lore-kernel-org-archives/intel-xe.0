Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C1ECD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 09:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781DF10E30B;
	Mon, 15 Jun 2026 09:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JrVdFVzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9851910E306
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781515541; x=1813051541;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cc1bs6RKW6M+S7NWeOn7r1OhnbJSh6d/IHinKj44XJM=;
 b=JrVdFVzGWUfyMubw9rCyi/twsaBvkL9fFQmznAt61AXROwdvIvVm1dyw
 U95TlopRzCLS8/KluG0VQzGLuyzilaa5EUalfncUDCy7H5sugmu6nlnGu
 FTv6wIoaZX0DB4DfDpltLBHMVTJfjGlqT4myOECMyZoCnT1taE9VzZL96
 XUaoPN3cu3nMPJIQbpbVJwQEGyOPYgfbVciwhzxnU3CShdEXUaDvYVxaB
 /oE3v8H5VStBrFTsGVj511GKJtbsSsvrNt4Hvlh69AdwwmQr4i1sQa9Mq
 KE2XWzcd0J7S/NCEhJb7m/EPy4x5h245TulExLDU4db5Pau46v+C1OCth A==;
X-CSE-ConnectionGUID: Zu3B+kz6QfqbfIE4oNNedQ==
X-CSE-MsgGUID: 8PuRwwOVSEKVOd9HPzLStw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="86149963"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="86149963"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:25:41 -0700
X-CSE-ConnectionGUID: 7d6XXRyqREu7ynBNh/PEiw==
X-CSE-MsgGUID: KigDnkalS/6OPGFYop5dLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="245024826"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:25:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 02:25:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 02:25:40 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 02:25:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmsGbPBgEjfYgV8t7X5TKumjC7mCBai9D9fgeAyae4EYWo0B9Ndpj8RMS4u9J9HQ2+lpBBV9dmDk7ft5b43APD360hN2eIx7MoGIBb1MwyLY/iupnOpNN22ikqPmhYpXgSLsT6x+FjgMvZcKacLH40sByHttFc6WsbkjAfYmLAFo+7nvOR2qCY3+1l+tABW5wi+5VeqlTQKgD951Wv5oceBoFA7OlmeGAr3bqkF3QJKKO8scczhz3GygDZxl4788B8zVTsEK1UF0T051MSQIZ1boiulvCZVRAhGZdLd+018z4aFnbAkmtEqAyBBMd6NEtTEuI5LDoFTik0M3PPBakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBhuuPAebWKekDi3ESNaLxCpKXqoOREl3xS/SU5DZ+4=;
 b=NL5YA1CnXPgyhyMq5YYl6p73nU8H9S4qUdiVJ5BA4UANS2HOMs5HViJZJTSRCG6IKhtVKbWbHmqLGePLjeewJkx1CTBGK0EeWGQUFrhEcd94a30CTFp1OIHdKxxxujF0PAQgBc5BL+lULzG/t2EC7TBoXuGruhWlUXMBu1v8IqxBXlA01jDedMPd1KKEx+1eClhaC4pE0c63RgtgJVisR6ggw+zvRxbD2BzGH0tkLX39YhDTTFExI9XA95SRLEud1R49hYZwLKvRaQ2JrkQF0Kw7o4uS/JWh+YUlcE+++e2A1kjXVrIrXK4AV301+ZQ6e5TO7LUtTLSQoEc9+bU8Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Mon, 15 Jun 2026 09:25:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 09:25:32 +0000
Message-ID: <33c682e6-5677-4cb1-bbc6-eb40e5aa22fb@intel.com>
Date: Mon, 15 Jun 2026 14:55:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] drm/xe: add structured RAS error logging
 infrastructure
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260611111542.19256-4-mallesh.koujalagi@intel.com>
 <20260611111542.19256-5-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260611111542.19256-5-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: c19c29d8-3ac4-4e37-9ae1-08decac00c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Jt9gljWzI0MsuP8YNHB4eoy3iorZjR6WqhVFPYNWFGsQrRE7ikVN7vNbrJMTLxb+/tr3VkKdpzuscnea/yNAgqNwX1+xv3/4pb0+v9RDGL+Dsd3y6LbzZhtkbOKzIf1sDmOM/2cg3J4lBMv7ZuaQYYG05nDVIZfSYvKF1S///QeFgrhX7GZMdfY19PLPcyMTUGC74nGc2hUzZrGd0vB8ases3HFgwXuEUq3fULLxmCKs4OWtlI7n56ILyERoV9IhSA4neKhuaze1XgDyKt19+pqNkGp/WCg2HrkSJ2RFKrit+7HvMFsi08e07kUy7hNmf5mE5oL9W5rIiDo8DMQzaTG+j9cXqCcqoYctPxeybVxwxKGYFJqHNR3gNhMNNQBAhMsaHwzNssz528fafrdPjBfiuM3aP4GLZ7lWQjJVylWFXmGKAAIfIF4xPkYACfgJlcyTDb10T2RRZawcUNwVXysnBa60h7vimMTpXqk2yrhQC0ED2hKynYNlh8gLsNwnLCRx5U8u39p4/CxsefznwZr5eNMsTjzU1Yx7ztiYpfHOaYYuCknmF2Qm48u23ieLnW9cpg9nR1F1gV9TYAFYYKAEjFiBuSl0BE46Qxr6bwzl2mIOAc68fEcw7YX66FQ/ZRiFSAz0olpsIyhzO+BmcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUt2NGxKQUMwSW5Ka0lFenJzVUxHcnl2L3pGdDZYaS93bzJLcCs5a1ZTdVdP?=
 =?utf-8?B?VmVXaEFQUEV2Y0JCemxsUkVHY2hhaUFSSkRpSm5qYTJBUVZ6WEljVXhPUFl4?=
 =?utf-8?B?dXFPUSt0U2NTL2o3c0Vrak1SNXZxcGV4L20ybzZTOHplb3J4UGpQaVJCSGZH?=
 =?utf-8?B?Sm05OExCZUdLUnpBdVFWL0FrRVl1QUw4Q1ZXYVIxTDRCODNKUVZobHdEbm9y?=
 =?utf-8?B?VmhTNys2WWJYWThKcFpnSWpzbG8vd3h4RndLMWVOZUlPbFdseVc5YXg5bC9J?=
 =?utf-8?B?aVpWVEIvZlYyUDhiRmw0djZrb2ZheitBT2NTZmtOblhRbTBBQ2k4T3ZjTzlm?=
 =?utf-8?B?ODhHaC9QNlBZTzVQeFJkcGorY2tnMHZaWXBNK0pVYysyQmh2SE4vQzduNWVM?=
 =?utf-8?B?TFZ4NGVjVy9qamN1S0h6cFhYRU40dFhOdnJubFV4NHRHZHoyQXpoMTNMNXFw?=
 =?utf-8?B?RzlpZEdIOURGUXV5TlVZVkVHckV3UEhKYnhKcGprendROHh3OXZsZ2lLQzgv?=
 =?utf-8?B?MFo2NGYzd0gzZ1BrS3hDOEZkVkM5OUVBaWdjSnkwa091QkxXOExPSE16OW02?=
 =?utf-8?B?NlNNRml5MHhkSG1LM29PcXM3ZGF1K2ZtaDlGWmwrcE8wdWtvTS9VVC8vcUYv?=
 =?utf-8?B?dUJQaHFMV2pULzllem43ckhkNHBCNFQveTFGSTZ0ZktBdlMxNkt4MXl1WWxY?=
 =?utf-8?B?ZFNkWVNmT1B2Z0ZDZk05ZVExcVpJcjdDQnBEekVlVy92MzJYWVJ3T2p2azZQ?=
 =?utf-8?B?RkRmQVVJRTY5c3owUzlFVjRtbjhja0FHMU1Ud3BjYVdaY0VFRGkvZ21CNUwx?=
 =?utf-8?B?eXo2TGJYZUVIcWVRZU5RQjlkZG5Yb0ZzYWtsMGYwUEo3NlA0M1ZqdUtPaEFr?=
 =?utf-8?B?MDNLNEo4VVBwektvK0VNYWp2SHJIbk4weExJM1Z4VzVYZDgzemhOWnVBWDBu?=
 =?utf-8?B?ZWNsTWlTRXhzTlZMMER3RDRnOHpuM3BqVG81UWl5NHU3amx1MER1NTZSaldi?=
 =?utf-8?B?ak5kbjMveElUNGhDZkF0eHVKVXdmbmQ1MEI2S2Yvd0ZQTzVsVk56S0RLaHl4?=
 =?utf-8?B?N2toLy9BL1lOTFZ6L09VZHhhRmZSa0syS0pjWUJMNmU1ZWhOL2JBU0pVRnFx?=
 =?utf-8?B?ZzB5R2dOU0R2RnhBNEJaNGhobjNVcjk4RHhrVGtaaFdXZVlkaDJtUVdWY3kz?=
 =?utf-8?B?TktLSHV4QUtseDQ5WnpEdURwZlhwK3RlWWI1VkRKV2VJVmt0WEQ5OUJzaHQy?=
 =?utf-8?B?UWxPRHNiWmEvZ1gvdGF2a3orWHN5dTN4N291cVZKelV4bCtSZmZEd3VWdGpn?=
 =?utf-8?B?aDVKSlJZSnlsTzNvald5RlhLMFFNRVhXQnBMa2x3dzlXWERWeFlIOGV1SW9L?=
 =?utf-8?B?VmU4M0Fwek5lZ2xKTGdSemU1Z0xJejRaVEt2Q1pBY2lHZlYzVEhMN09EU01a?=
 =?utf-8?B?R1lLWHg2ZExlMHludVlmOE45YzE2WmhoaUtDZS9yMGRFTXVzVm1jUnRNUUZm?=
 =?utf-8?B?VzJiNmpXZjNMWFBRaTNiSGZyNXNEYmZVaDlBWTI2dU9WTFpSNjkxbmo5ZFlJ?=
 =?utf-8?B?c3U5S1NwckxPcTMxaUFMNTk5SzJRczFvWTRMeFl1a2ZGZHBKbUwzQU8yalNH?=
 =?utf-8?B?SGtjNjdVUGJONXI0cEJkVDFYWTB0cytORithYm9XQ0lVRW1kWHY2b1Fnenlr?=
 =?utf-8?B?dk1mRVEvdTNKYStXaTNKaEVCWTBKL0UxMmlQUlpUSEsyOWxsb0ZrenRFbXlX?=
 =?utf-8?B?K0RNR3lRbXd4RXRNZTZvOHVOcEw5aVJBUHVoeWNLMWZ2WWg3ZW5nUWl2bmF1?=
 =?utf-8?B?dGV1cm1LcGtvcXNhbGdOWUNxMUJrdXdZTEhqeFJkUVJSdVF5Q1BFWStGQlVp?=
 =?utf-8?B?aGVKVGltVjRjYS9ZL2Z6MjZsd1VlajV2amYzaWdXS1llSEVkSkJHb1VPa3Yv?=
 =?utf-8?B?ajZmeGdLK3VzYndwZE00ZVhhV1RwdXlYVC9WeDRMdDh6VWFTWnNMcFB4TytJ?=
 =?utf-8?B?QkJickN5SXQ1dEdaTHkyQ3hDOVZGaFVZVG1iRkhwak1VRzFuN1YyQzZ0MmY0?=
 =?utf-8?B?ZkNhaUlvaThUNHpRT1BzbG5tTVpPTElNZGVVc1IwVGwwTnRicWdyUFFRcW82?=
 =?utf-8?B?WkJTWnUyUEw5UVVnRS8vVVdjN1pBWVhValEreHhMOW4zNEZOS2Y5dHY1MHVh?=
 =?utf-8?B?bGYrR3RwUjM3K2xzWFJUUExlaXljeTNONDAxL2RGMlRTRTBsb3dob3JoUVZo?=
 =?utf-8?B?MHN5ZjdERysxc2tnK1VTREpsV0pCUHgvRHBZTjdyQWxmMWR5OWJhOUR4cXJB?=
 =?utf-8?B?K2t0WExFcW5vb2MzU1VUcDdtKytWbmNNRjFMMkQ3aitaY2ZMV3ZuQT09?=
X-Exchange-RoutingPolicyChecked: ocrZ88I8+cG8qObuGjnVSAYueKC2aOAwWO9RzQZT7FTkGxysSe+fd5WhOoJ/AUKKVq40pa/akGc6A5e+ickhYGqR8ie1Ie8ID2oaPAEfRSsMSqwMydVs/Z10is9COuV7va7gVhgS7FRATE7dL9JCiTmqyITu9WPMMKLiOy9IKkjLOjraOHE8KLUWtkZC0aQeff/RKfGxkNr/SZkY+Jn/9vBL8xuJe1MosHHTsgyka/Qbd8vTM7Y73i9uAfouGKUigelU59nFmseQd01SUjCLaFQ5IcDTlLcXl/VVnRExx17oH6KPzEsnf1mRcIh/0Z0dyrWurcRmjMhCJGB1obl3ww==
X-MS-Exchange-CrossTenant-Network-Message-Id: c19c29d8-3ac4-4e37-9ae1-08decac00c13
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 09:25:32.1815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDWdXA6GbcnyakqUFhDBrMyGDM2iu/BrPxrJ7RT75MQj6++AFmKgEMctqhAMbE5hurW7uN8slhM6xOMID2J5mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
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


On 11-06-2026 16:45, Mallesh Koujalagi wrote:
> Introduce SIG_ID defining Signature IDs (SIG IDs) for
> categorising XE GPU errors, and __xe_ras_log() to emit
> structured log lines with SIG ID, CPER severity, tile/GT
> location, errno, and a free-form message.

Maybe add a documentation. What is sig id. Why do we need this.
When should developer make use of sigid ?
Is it applicable for all logs?


> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile     |   1 +
>   drivers/gpu/drm/xe/xe_ras_log.c |  64 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sig_ids.h | 101 ++++++++++++++++++++++++++++++++
>   3 files changed, 166 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 09661f079d03..45b5aa735aa7 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>   	xe_query.o \
>   	xe_range_fence.o \
>   	xe_ras.o \
> +	xe_ras_log.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c b/drivers/gpu/drm/xe/xe_ras_log.c

Either use xe_ras_log or xe_sigid.  Not a combination of both

> new file mode 100644
> index 000000000000..b6a2792b61d4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_sig_ids.h"
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
> +	char msg[256];
> +	va_list ap;
> +	int ret;
> +
> +	if (gt)
> +		snprintf(loc, sizeof(loc), "tile = %u/gt = %u",
> +			 gt->tile->id, gt->info.id);
> +	else
> +		snprintf(loc, sizeof(loc), "device");
> +
> +	va_start(ap, fmt);
> +	ret = vsnprintf(msg, sizeof(msg), fmt, ap);
> +	va_end(ap);
> +
> +	WARN_ON_ONCE(ret >= (int)sizeof(msg));
> +
> +	if (cper_sev == CPER_SEV_FATAL)
> +		drm_err(&xe->drm,
> +			"[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%s\"\n",
> +			sig_id, xe_cper_severity_str(cper_sev), loc,
> +			errno_val, msg);
> +	else
> +		drm_warn(&xe->drm,
> +			 "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%s\"\n",
> +			 sig_id, xe_cper_severity_str(cper_sev), loc,
> +			 errno_val, msg);
> +
> +	/* TODO: Add CPER record driver handler */
> +	/* TODO: Add RAS dump cper hex handler */
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h b/drivers/gpu/drm/xe/xe_sig_ids.h
> new file mode 100644
> index 000000000000..8abe7554714e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sig_ids.h
> @@ -0,0 +1,101 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SIG_IDS_H_
> +#define _XE_SIG_IDS_H_
> +
> +#include <linux/cper.h>
> +
> +/**
> + * xe_cper_severity_str - local severity-to-string helper
> + * @sev: CPER severity value (one of CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, etc.)
> + *
> + * Avoids a link-time dependency on cper_severity_str() which is only
> + * compiled when CONFIG_UEFI_CPER=y.
> + *
> + * Return: string representation of the severity, or "unknown".
> + */
> +static inline const char *xe_cper_severity_str(u32 sev)
> +{
> +	switch (sev) {
> +	case CPER_SEV_RECOVERABLE:	return "recoverable";
> +	case CPER_SEV_FATAL:		return "fatal";
> +	case CPER_SEV_CORRECTED:	return "corrected";
> +	case CPER_SEV_INFORMATIONAL:	return "informational";
> +	default:			return "unknown";
> +	}
> +}

We already have this  here
cper.c - drivers/firmware/efi/cper.c - Linux source code v7.0.12 - 
Bootlin Elixir Cross Referencer

<https://elixir.bootlin.com/linux/v7.0.12/source/drivers/firmware/efi/cper.c#L66> 


Can't this be reused?

> +
> +/*
> + * Driver SIG_IDs
> + */
> +#define XE_SIG_PROBE			1  /* FATAL: probe failed */
> +#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
> +#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
> +#define XE_SIG_FW			4  /* RECOVERABLE: GuC/HuC/UC/GSC/CSC/PCODE */
> +#define XE_SIG_GT_TDR			5  /* RECOVERABLE: engine hang / reset */
> +#define XE_SIG_MEM_FAULT		6  /* RECOVERABLE: VM bind, page fault, GTT */
> +#define XE_SIG_IO_BUS			7  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */
> +
> +/*
> + * HW SIG_IDs

Mention these belong to error categories

> + */
> +#define XE_SIG_HW_DEVICE_MEMORY		8
> +#define XE_SIG_HW_CORE_COMPUTE		9
> +#define XE_SIG_HW_SCALE_UP_LINK		10
> +#define XE_SIG_HW_PCIE			11
> +#define XE_SIG_HW_FABRIC		12
> +#define XE_SIG_HW_SOC_INTERNAL		13
> +
> +/* Must be updated when adding new driver SIG IDs */
> +#define XE_SIG_DRIVER_LAST		XE_SIG_IO_BUS
> +#define XE_SIG_HW_FIRST			XE_SIG_HW_DEVICE_MEMORY

Why is his needed? There cannot be id's in between according to the current
implementation

> +
> +struct xe_device;
> +struct xe_gt;
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
> +#define XE_RAS_PROBE(xe, errno, fmt, ...) \

use the same prefix as the file.

Thanks
Riana

> +	__xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define XE_RAS_WEDGED(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define XE_RAS_SURVIVABILITY(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +/* RECOVERABLE */
> +#define XE_RAS_FW(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_FW, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define XE_RAS_GT_TDR(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define XE_RAS_MEM_FAULT(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define XE_RAS_IO_BUS(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#endif /* _XE_SIG_IDS_H_ */
