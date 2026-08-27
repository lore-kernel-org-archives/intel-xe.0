Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7900EC61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5C710E3E7;
	Thu, 27 Aug 2026 10:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUf2HRJ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0804E10E3E7
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787828241; x=1819364241;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m/29hEVBxBNVwC0mLBPptTk6iljhwCCYPhJzcmx/B8U=;
 b=KUf2HRJ5R/O4rgXrGT9X2cmIOJJjYLeQVEBHzx0qS6ztK8O8dmI1dwCo
 nfWMwGs50U5Tu9NQmCX75PnUmacvik3X1bfANdg2zHaEZvAAh95T6T7C0
 YhZeiIfvJxMEV4MHH9h8prg4VSYzlR3s8R96r+AtlwBGZ28krL1GkU70I
 S9DYDyJBfXbP8MItB5P1AgHM4MXfzKLira00cjT9II50wTCIg2dX01ADJ
 sj6EW6nez6xTI9dK5aNKKOeIg4GZeYXverknA+wsiP4to9D/3q6Jp76vp
 e6FEgslaBejP3bPO9bS8+jCuAmhIUz4uXaNRNmp8q/qYQBhQLxxAh/uMI w==;
X-CSE-ConnectionGUID: awK8gr86SaGKwcueuTWd4Q==
X-CSE-MsgGUID: uokX1NljTOW7CoqwBiU5Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99843012"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="99843012"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:57:21 -0700
X-CSE-ConnectionGUID: abFiS/LpSUy2Hs6smITecQ==
X-CSE-MsgGUID: cuutIn88QpOQP3bTOHS+1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="297730513"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:57:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:57:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:57:19 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLML0rp10R0iIhmzYnbGUxsOkIrEh6cjiesQHMa2+ClTLMq6qd9cv7rtF6XYwgJvDxWiO3gFGATNT3dGqlO3MpMkLTyhppOHvmlSICvCsiTHhNMocylKXQqnncVO1/ZaoBvPY50SAZowkAllVTh5EIkjXC4kKgrwP0nMC8z6ZMhtOqvuKyKPfLeoplx0HS+xsQNonvNcLM4ixz1XORiTc2i0nqD9fvjMDxkSlvokebq+cR8aV3SDkGpAZzVbQbgu7+umXz+lhZQ14s7b+Y4C13WMTCQ1Wp1B1AClTmaEJYMT9RyctCiZocSt0ETKq8e/BE/GaSf3T9K02RS7k0WwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdZN8xSDjApkp9kmFn1QLX0bsyhRWV76z79mGelS6vs=;
 b=AB3ecZ1MRJyV03f/BhEVZoKcQKqKwVkA6G7PBZWg7GHekHTHU0dsoGRdRHZbLvcVjZAfOZa0Wp1Zb8iDDwfE7zj8FWOz8FPvZ8S5ilJ/kX1To/Pb6qJeWiJTbAlMvzJCWQ2gkJm55RKSto1/N7NH5QZQIdWQaSrN7rHlm4x+Vd1NSNWpcdE9b9nzi17agCcVtp8+/GmMxaw1rJfVggDHezFDesV9z70wUF14Lhn6+8B8nOFRNcVTmTIwqOu/yZT0q5nPkXorS+DwlLAiFXtfj8USUQ0aHtQT7uLc//uYiHAPFpJFWNX2epfESbfIsA7Fvp+7cg27jFPOe0YwqoqB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB8593.namprd11.prod.outlook.com (2603:10b6:806:3ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 10:57:17 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 10:57:17 +0000
Message-ID: <d24a07b8-3977-40d8-a7ca-35eeed9c6f9b@intel.com>
Date: Thu, 27 Aug 2026 12:57:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] drm/xe/sysctrl: Improve firmware response error
 logging
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
 <20260825110542.1359776-14-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260825110542.1359776-14-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: 39285e30-b6cb-4828-dd5e-08df0429f587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9CXN+UVPLAWapdpq7aHES4Nfuab3/n1VwsA3tGEUM20nLuoyg929P2mmKwfaTUSdUieClQPIPa+wyEm/vojJ1/GFjxaco6/k1AxgfqQMf9Ly5Z7PEDi5NUUrOs3NxqZlYUCO0zfuFmdvTn//z1HzvS/ivFxGpxIpoy+sQM4KrbcQlWDddt3prATwgoptslBuXG7vPn48lQyFDNMZm6OWwr1M43ZyUoNI7l4KLTrWFztwojaqX2mRZHV6dIYCLSiB8rGNXCD+copCBG1R4Wh7JV/H1PL8USGPkkcfJf9RjiQdinTWYuy3tzvwe+u1xkdSgWopJpTWt/5he1rAECrih7BjAt7+qhCW4vq1UV8Mcn6zzaZT+peyXWQWfRLjrepa61HMIXc8bTJNffpNqaxuls1DZ+2UbreQtfkhlFqV1eB94MPigXnoJYPAQq1b+aP3piiyPVNDSkl78slV4tmMOU30mFXHYoRGVHEInYQQlCUE6vdO9Ges1J1I4ERbaCfhtVNhWe2tpS2VYkGNzrTtKW8K6nzt4kSBxa/kD9Wx0qRJZwIAKtUS6e1Y6vSUHqnAlrkGxPDbfydownWSO4licpHSNEREb0wNHvF1ClfOR63XSQJzxzcX7D6YiitVvOz41VuCRymUZKzBh/huWPD6PmJ7G+qzY2znVj15e9x6Hes=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z213WlE2Y2xCek01Q29nRHViY0RtdmtsTW03WkRRUGlZa2VVUlNVRWVCYmEv?=
 =?utf-8?B?NlZCUElSalRXbGpScDVSSVR4ZGRxLy9sWVpLRXVWY01FUlJlQ0p3dkc1VHhY?=
 =?utf-8?B?dStpb2NSS1YwSG5UcERsR1lWSFU2VkNGKytzUDRxRHJkQzNaUVNDTjc2Vm9r?=
 =?utf-8?B?Y3hvZTFvY3ZCbUxmWGVHMHNVT3Z5dEJHVFFNZmg4Y0JvYklIb1BmcEhnOGFI?=
 =?utf-8?B?YjZOMGZWR0JkbVI0ZjVzRHh0WFhvajZIZ1h0MkVPSmdVLzdUQWV3K3dXWEk4?=
 =?utf-8?B?YmdybjNvKzhKNFVKdFZHZ0RBNEhFYitEekc1RWhyZ05aMlljYXVSK1BtZzJE?=
 =?utf-8?B?dGJOZ0NSUnBMakJGZ0FKL2hEb0p3dTFqRVZuOCtGZVlMTFhtK2lTcEtkd3py?=
 =?utf-8?B?VEJLWE5NcGZhVUNFcjlqYVFqNlcyOE40Mkd2TTBRUVZjWHJoa3lyZzE2ZVRB?=
 =?utf-8?B?M25ETERDU0xqbjJJK0ZYd3IwMjFLTStxUEZLWjgrLzBxWEhDRmR1enlNcFN0?=
 =?utf-8?B?R2g3dzlkclBUMzAxZDF2V0JibTNXODNSWW9QT1dCaThScGhURytRcGRyNnMv?=
 =?utf-8?B?QlJOVEdBN2NlY1JjOWlFTXdINnppZDBlbVlrMkdRbkhhSldySUxPTmxKTlhN?=
 =?utf-8?B?QzJyT3BlWVRsaElJdG5HamxqWWx6MHRWR1NacDgxL2JzQzJPU1FhR3cybTAv?=
 =?utf-8?B?Z2JhL3hRYmxjR092eTNOVVpHVjBpZE5Vb1kraDZPMmVLZk9YWDRKZytnQjlH?=
 =?utf-8?B?UVJpNkZDUG5na1BIc3lNNy9CYnU4YU9NNGZ3N203dXVhNkNGNUVvUy92OUZK?=
 =?utf-8?B?UWlFcUJVL3Z3N0tqZHZpN0txa2VucUVpd280VjFVaGJwQ0pacnlsWnZlMjVz?=
 =?utf-8?B?eTBzeE5aNEp4NE5zOHFrbzJmL28zb3FjQzJMT2RCTFNmYkxQeTc0OFQxWEhq?=
 =?utf-8?B?Wk83SUFXM0c4a25QdVUyeCtoeVlFMW1JVEEzc0YvZzJCQU0rK0Rpa0JIKzVT?=
 =?utf-8?B?T3JsUEtkSjFlZmJINnpkMFNzNkVhbm5UYlVxNGxtNnZkS05LVmFoWGI1YlVv?=
 =?utf-8?B?dUNBR1Q5MDhjcXdoaWYxTnR4M3U0QitQTVpOL3R1akNQOGtlcUdramROcERW?=
 =?utf-8?B?NzBzRjJwVkJ3R0FhMVppeG0yK2FnVy9qZ096UUVvMEpybStyZkNEL1R0Tk05?=
 =?utf-8?B?QW44SUVGRG5jR0N3a1NFMkhXWHI0MWxnOTQxcmlJNm9jYmJuR3U4NjVESXFW?=
 =?utf-8?B?M0JEdlFsQ0RaOWgrd1hrRlFsYThCRVY4TStlcUpGQk5CU1pXVU81MGExRzZt?=
 =?utf-8?B?ZnNYOW1FOUVwN1pNb1ZaUDI1MEx0amcxOW9pY2s0Y1RqaUUzYjlDcEtTNVJl?=
 =?utf-8?B?QXlJMkQrdW8wOEhvTFB6MENxWE5ERkJ4YVpYYk4vUUJoVDUwYjlveTJNSU5X?=
 =?utf-8?B?MnM0OVk2K2lZOXBDK1BTd2FzUGUwWm5EdDFPcnpMNmVGdUNLekFSQWhUYlBN?=
 =?utf-8?B?c0RjUmpOekFIWTB0Tldxb0pUTFkrS2trQWRVS2JEZkoxd3V5c29OVlZZY1pE?=
 =?utf-8?B?aFU1Y0piVFdGSVRwNUxGMzZXbjh6WTNpV0w2SFJ2VVNpcDZEUEhtNmZ6bmdx?=
 =?utf-8?B?dG9WaXAyeHRhVkcwQkVzUkFKZ3VKSzZjSzFWQWNHRlpEU01iTzhXcWRjUjBs?=
 =?utf-8?B?bE9zZWd1V2RwenhIcGFIVXM3Y3F1VEJueHJDbUhGcFZvTHNUSlAwYno5Sjg1?=
 =?utf-8?B?bGRDaUxTMXJQLzNoV1RFcjVCRXlBemlQRGU2S2V1dmkrR1hOajU3cUU4Uk9x?=
 =?utf-8?B?U2g1b0RWSW1ZMnAxZnFQWVlOWHgrSkZPajVRbkZzelQ4ZTFUVDgrK2F5Vjdt?=
 =?utf-8?B?L0dHdmhNMmxCNDcrUXhMcWtjQjhCQmd2VHo4ZUY0OFhHbFdla3hMNDgxVitC?=
 =?utf-8?B?MlIxdFhwM2NFV012LzJNUkZrMWt6ZzZEejc1cmZ6aHZydHRHZHkwd3htWSsy?=
 =?utf-8?B?V1FueloxRitBRU9hNXR5R0NLWjJBL0VQelVOek90VWZCaU5iUzBpYXc3TXhU?=
 =?utf-8?B?SFR4RlQ3QlVBWGZoQmYzN0lYeUEwUjN0eWpUSkU4L0Q3Q2lRRlFicXpLdjlN?=
 =?utf-8?B?c2lqQlRNZ0xsWTM4MXRndE5WdjdSZy9tb1pCRUpMN2k4NDE5emRiZ0ZzeHg1?=
 =?utf-8?B?aTEwSTNCRVBmWkFENWsxV3FZdTNwcUJkWW4zVGNXem9yQ1ZzYzZMd3hiSENJ?=
 =?utf-8?B?SUMyclVoMGJiUTdoNytjNnVlMGVrZUdEOGlvaWp5ZjZXMHpRTzVjMDBaU2dz?=
 =?utf-8?B?YU4wU0xmWWxzQjdMMzhTbTNKYmd3dnpNS1BMb1pHTTBTQ1RnNXFJK3V2dGdt?=
 =?utf-8?Q?AxBK3u3f98KJ/bx4=3D?=
X-Exchange-RoutingPolicyChecked: r07Q6dekrCVaMAbnHbqVAC0lT/g4zVNdvJGoehneeWcdCMt7inSMB8C3TVJjOHSfclwfamBK6Zb3YeT3ED94EDnw7cHhalY/9ZuLAgDNBqzPw/ek0+Kx/KXspxWXsAWbwil4bk0XtZyn4cLJQBVHhaljA5XiG6FCoJDGwCas42BDHQ5JVX4yoQiuRk0xi7lfsGcpyqIdTn0Qm9UlhAy8IKcGU56ussdNpTD3Ii2YA99N5N5PP34yDfuA18ohfyWEVPvZJIXia2MYALkFU0rJvaVocyp5ocE5EFElZpc0/X+aGzSQKKAPLuPdklurPCR7ajp4QFnWO6F7mtPLhC7fQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39285e30-b6cb-4828-dd5e-08df0429f587
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:57:17.1885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCHM2ffUujtmKhmK0XIq5ideCRLVhkEI6+kWMYxFWx28LMPcQfdsyWHqmHU+X9RqjbElW21HIq0fTbP1ByCCxa8wOiqdLYY15/RuLJpeReA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8593
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



On 8/25/2026 1:05 PM, Mallesh Koujalagi wrote:
> Use xe_log_err() helper and include additional details when a
> response header mismatch occurs.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v5:
> - Use %#x after REG_FIELD_GET change. (Michal)
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index f8b518dcafa2..5032d766b314 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
>  } __packed;
>  
>  #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +	REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>  
>  #define XE_SYSCTRL_HDR_COMMAND(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +	REG_FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>  
>  #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
> +	REG_FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>  
>  #define XE_SYSCTRL_HDR_RESULT(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
> +	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))

this should be mentioned in this commit message

nit: or maybe above changes should be done in its own patch?

>  
>  static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>  				  unsigned int timeout_ms)
> @@ -237,13 +237,17 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>  	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>  	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>  	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
> -		xe_err(xe, "sysctrl: Response header mismatch\n");
> +		xe_log_err(xe, SYSCTRL, -EPROTO,
> +			   "Response header mismatch: got group=%#x cmd=%#x is_resp=%u, expected group=%#x cmd=%#x\n",
> +			   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
> +			   XE_SYSCTRL_HDR_IS_RESPONSE(hdr),
> +			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));

nit: as admin may not know what is "group" "cmd" "resp"
maybe we can just log raw hdr value?

	"Response header mismatch: %#x\n", hdr

>  		return -EPROTO;
>  	}
>  
>  	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
> -		       XE_SYSCTRL_HDR_RESULT(hdr));
> +		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
> +			   XE_SYSCTRL_HDR_RESULT(hdr));
>  		return -EIO;
>  	}
>  

