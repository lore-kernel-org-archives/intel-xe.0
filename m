Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DB8C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 19:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134610E0B4;
	Fri, 14 Aug 2026 19:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtnDRMaZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CCA10E0B4
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 19:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786734136; x=1818270136;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OErwKhyCNAXkm7DKnZ0LLtPI8h9PQIIQgjK2RpjB/uY=;
 b=jtnDRMaZjVOZ9lQXHbduHatE+MN0QgLaQt7G8KXdE1a3Sp7hyzu33Vga
 /HWhCLOvTCGWArjJbwcopxRka3/tJtiDtJxRBkRjpSqEv1pW2kgD00aTt
 NJE4MCYlbyG1sXVyFD1Ka7YXdVjl8c35IFAh2JpW74UOp6fnq6lWFR+fg
 oFfa5M9d8tFrnJ0X0gLjv6dDzSTwV8J9X/Po8Zrld+LBBUyoNNMT+sUHR
 ExieGXpakaK0Lf64hw+O/B6DgCb22M66iqauPmCurgCp3VsHWdDtdW05y
 lmmS4LS7S9eFHCmqQuTOVEm3bPqFmGhniKb7Z46i4L6RWzSoO+hDLii/W A==;
X-CSE-ConnectionGUID: sVD/g+5bS1+QIhESFrP82Q==
X-CSE-MsgGUID: neOKZGIARZKEkGpQajtpBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="86278433"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="86278433"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 12:02:15 -0700
X-CSE-ConnectionGUID: wy3tRogbSP6+MQOJo14W+w==
X-CSE-MsgGUID: xotOEVkSSOimv3lovWbuyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="267789149"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 12:02:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 12:02:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 12:02:00 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 12:01:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4QLWYWhgQ1FErpg4NAJ8ywTf8NvtoBPnxHn8Ujbw7lOOkSP9DmyHGLYvtYZQi7sumML0ZKgHd9CzAQU9/7WbFnfLesSQLtaigZSSuC7ld2rWLRyDxyXfcbjJJ/fyRG/Nk9MHje8WvYRSqhe8EwfnRsjNVrTM5JWTZSNRCCRWR/mWe7HshTP43neyRAzswi+OxUbTeph7GpJgjLmkDcqS/cM8sK3JRuD4CsqZYdauN+qiYU9j7e7rPot2ydVsL1GO3g/aBbk0R8KLQH06ldM6h6/G3Qoi0izzTcMSDG9NVAY/MRMP3hlVUnm/fhh+pC6OETfVBnNPnN/ZtiqFdsFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D5gBUiG17EegbG5zO48ETEWyTWs7ItR9cnqD1FSSUM=;
 b=iNZoVHK/2j98jV3Pig6sLHqZVzhEfqgRBfdv24lddhyeFDYW1w9j2fTkx9kfe1OSICPH0NYKnOnuh2cKRd68WiiwkQmesYvlZpzE55qtidlJjZ9ByUoaFvYdQziimvSz7oFwSvcdO83/SQ2ZILvoC2/xuOIELrDlYh8lvyr4wMsak2YXk0FN0hr0sz4ktco/EXKzsZNloq1fNYuPYpwdZbZMTRVhGsBzKlOY5KgpduriUNd1IochhnKsLhqj+PfVTGLUp6louc2dzljzEI4gE+vhRIGNwJ/hdQsjgh017BXgYaVeusRcyHx9zzZu8/T76/+hjatOk2Msw+ot9rYbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 19:01:53 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 19:01:53 +0000
Date: Fri, 14 Aug 2026 12:01:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is
 exported to user
Message-ID: <an9mHmSelbjvwPyq@soc-5CG1426VCC.clients.intel.com>
References: <20260806224702.3563031-5-umesh.nerlige.ramappa@intel.com>
 <20260806224702.3563031-8-umesh.nerlige.ramappa@intel.com>
 <87bjb4hfo8.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87bjb4hfo8.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:303:8d::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: f391a094-a5f8-469d-a274-08defa3680df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: ZzjSTrXqGRE9xqdhexbgutwpsBaSg81E9wZyiIRuyhFU2QryqTLHMiGaDM0lQxPld3Csd719wa2wA8PsCny5Q4eTAiM6X4aCo5FS0j4lQKP812Ezq/YhHp+UT9wQqSgCRcA2JeUryLcCm1M8tP8MORoI14/joC6rTiIkhA53yZdr+Fg1x0neBuCMhUhYRp+RB2UzJXpb8bYBZQ/pYwiwCLiJRgnNo7ky+NDcsigGGzub8hYGjdTlAZaGrW+Y2TQl0egjXi+/8qofyq7cNWd+92ck8kYGy4u8DhRS3stpPH9IyddLYXSzL1spZNqwBLbOoLK555dGSGe0Q+D99PULqweuinp+KFXWABqBWZq9atQI8FV4LEbHk3OVsuN2zsZ7iaO4QLqhWIUYS8pl9ICbhpXV0Hl4mNI8kwoFERNyEhZHyuuVwUztZz58fGALbgrY7m6iejQVP6se8Y7IiSGk01rzC2PrxtjEjwDKFwrg6YCbnFF8zQFM8YIlZ8f71UBoNAiow17lkFWvEmZ/A0zsbmw/Mxh0mxsP/jpiX1onRxg1fVg7iTv6tv1PX+EgliT7xz/rKasTS+Qh+rG7/NoVOCueEkQXznE5fSri/SkNJxxA92WOxPsTflHm1ADL3vrrta+MlOuT7YosCWexyhWg8s/m7cxchcF08IQIFgS02OM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDNjTEVrY2tMQXRDR0tCZUxMRnFtNUxEbXZieWNoZWl5R3JkTW5IRTg5amww?=
 =?utf-8?B?d0RRSnJDc0NocjBlQWI5Qk1kb3JjMURJVVNicGF4U0dhYXB5Yi8zbGp6SmRF?=
 =?utf-8?B?T1VVeXczOUx5OXp0c3FoY0FFaGRPbUJvSEVHYUtxb2VwWXcxcnk1T2tFWmMr?=
 =?utf-8?B?d21GVzZkaXcrMHJzeHh3eTd5SmR3MUZrTTRkR254eGRzUkFtZWREZ2R5QkVo?=
 =?utf-8?B?aXlwTjJOWDR2SWs1SGM1ZTdGUCtzNHdIdjdNS05XbWs3dXBQSEd6RXMwTDJq?=
 =?utf-8?B?L1ZlRStENTl1THh3ZGMzaXpqenVKRWsrYW1DemI1S0pheE1oTUt0QnNjTG5F?=
 =?utf-8?B?c0JudGJRTmk5STFaMEhyOUVBbHJaaVNsMGFxdUdkamNkZkFsWklIRW9YaVNF?=
 =?utf-8?B?bG0xZlZ4Uy9QdWluYmY2Zm04dVBNcUZkbFBPdVdXNlVoRk1JTnlnNkhXUUw1?=
 =?utf-8?B?dGpSK0xXODA0NlJxZjY1UkJxSzZ1TytwSDFLMG5jdDU2YzRjby94aTV2MUpn?=
 =?utf-8?B?NXZRcy9MY25SYjgyNjB0VlZmUFhrYUE3RERpQTNUc3VzdGludnJiWTRMdFVq?=
 =?utf-8?B?djVFSWVEa3JsTTVpZEdKemllcEhZVnB0ajVZVUozNlI2eWRhcnovRHQ2NU5x?=
 =?utf-8?B?bUUvV01oTUdCdmtuMHNuRmpJREFuTXgxZXVyaTRnU293R0RHbG5NQk43YTZT?=
 =?utf-8?B?MENLV0U0eGl4c0UyeW8zcU5DU3JNYUdNN1k4a09FMXg3UisxSDQ4UXQ0VVov?=
 =?utf-8?B?M0Q4WHdqbDQ4NFBUV0hFcytSSFIxcEEySVlqOFVKV0crMmJNOXcrSlp1YXNw?=
 =?utf-8?B?R0JQMjNSUkVhelkzWWpZOUZ5NmF5TFhzczJqZFNWT2dhQ1c3Mm1OUXB6YnRp?=
 =?utf-8?B?SVVxMllJUFVVcHk2UWFycjdGa3dVTjZFc1ZrNko1STIyZnJNL011T0xxVkNV?=
 =?utf-8?B?MEpEQmo1NTAyZzN3aGRYQ0NEa2RQSDZPNlBrb0dKOURPZWxQQ0V5Z3lYZGVx?=
 =?utf-8?B?dWJaM2ttbWNBc2FJODh4OTFNeFVzazBSS2sweVJTRkUzcTBSV3FvZTZHMzBs?=
 =?utf-8?B?cENUekVxcG1CUVNmaDRXRGtUeHl6SXV3b094VWhKZlZxeWZmd1pWREdtWklm?=
 =?utf-8?B?ZDEzeXk5YXNZRGtMV1M2NUtFRnk2ekl1NXhuRmd1a1RSaU1QZ3J0R2Z3amFX?=
 =?utf-8?B?VHNMSDkrWnpTbk9jN2dLZW5LdHRvb3FhWVJwY1poMVdLd2Rwem8rdTM5Z2hB?=
 =?utf-8?B?Q2c0b1pMYTdTbStTZ25OendGN0Q2bm1TcFdNcHEzRnF3Nk5TdjVyOVgvM1Nw?=
 =?utf-8?B?YnVUcmR5WXc3L1duRUZCNGorbEtxcVVIMmtDT3lubDNhZjJwaWRDU2ZIVkZN?=
 =?utf-8?B?bWNiTnRpNitXUzNEYStUZWkyUEUxVENjNW1reEU3ekdoaTdNZk5ENjFjdXZF?=
 =?utf-8?B?SGVJQlRibnhLRjRpR05SbUJvN3VTNnBvQThORXlHL1pvZnlSR0NjZk9uKzJH?=
 =?utf-8?B?NnBmQWQ5VmRtemVnQ1RTdmxLeVBxa05DMkxhRmMyRG51VzlzUlVLS2hlWXU1?=
 =?utf-8?B?VDQ3VGVKeXZObm5VOURIM2xhUGNSMWRxTkErTlEzQloxdHVubVZ4WExwTEpG?=
 =?utf-8?B?QytBTWxzL0RzS1NrRWllZ3NsOUZBWFlBZEZtNmJMRTNMQStHUTZ3TWxQQ1Vs?=
 =?utf-8?B?TjZ5Nmp5VnNYc2ZtVElBOU0zNW1wdDdZcDRQWkhxelI5ZS9teXhVbkV2YlBj?=
 =?utf-8?B?T3JHL1AvbS9BT2lrU2ZRVGpaTVE0RCtaRzRZYndjbWZqUHpneUw3bmVhbzlk?=
 =?utf-8?B?SFNFalc1aEVudUVCemNrb3hBbGU3cHJJMmlpeWYydSs1S2crQS93ajlmNXZN?=
 =?utf-8?B?UGNBb0pHNVZ0dGNKVXdkRG5WNVovbTM3cHdFZnpuRmkyeVBJTkZWeGFjU3ZD?=
 =?utf-8?B?c2srb3dPZGxtaW9FZ1AxemdYVm5lZnpiM3lRNzQ0b1NNdFA1Q29VcGZRMGlJ?=
 =?utf-8?B?djJlMG9FdUwwdjYwNTRUQjV4SkJ1bmFTY1ByR3IvNjBQMXU5QnhvaUFzbWJC?=
 =?utf-8?B?eFU2cmc0bXk1SXRvSmgyYVFKRHZYbWRHeGY0U2w0ejBzb3pUK2oxNmpPL01o?=
 =?utf-8?B?VEhCYjFLZkxTMFU4ZVRJcDVTNXdpcmhrb3NIZVIyZnZmSjBXajV1d2JDcSs5?=
 =?utf-8?B?diszQ29OUjNFZFBvbjhpYjJKTVE4N3pQRjgrVVZvazBQNXU3V0V1Z1czVTFq?=
 =?utf-8?B?R0JQa2hxUmgrNnlNWmpkSkt1cmptdGFtNWwzZGVqVUpXU25wVkNNREp6Wloz?=
 =?utf-8?B?VDlNNVdzaXNwaVRieEY0dC81UWRKUWsxaGRwbDZybU1Tb0lMMjdtRmFHN1hV?=
 =?utf-8?Q?KTM2LjJnqQrYXNbk=3D?=
X-Exchange-RoutingPolicyChecked: JG3RQROgoUhFg9JzW7oi1OqujE8UYiaW3ZMAGL08y48pO6YibEwJQAlAaFaCH9k6mR5ZvZB2+UJVeEWgop3OY7bB0IvsLO7Jrwaq1QqFmhwADd+i54kI6ndCq0nh15N/8K6KsekJytcxKu+W+hHWwSb+mlIlOAuAPHxExKt+zLqalroAEZ2KB6zlJs5m0wKXlw3zfyE2ntp2cqkN8Jwevf1bRFc30yPioqz7UkLp2MMgxlhHNHhlP4lB0FAQYGASDb9TJ2gpfdVHUfDnOk5sDTcv9aLc1PENAcTyBBoflZlRZ5AKC9Kd+4+kDdIlogzGBtk0mHtcuvRZjj+8YAK5ww==
X-MS-Exchange-CrossTenant-Network-Message-Id: f391a094-a5f8-469d-a274-08defa3680df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 19:01:53.2674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NFSLLpIsotMtgukT5b5xqUlSrY09xt4xcHPo6FBYwpg3t2nYiiXooWuRDGEmp/21Otd6oXBCxRBRv931E7LfBzuKSIsZYQcLZZ52egaqvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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

On Fri, Aug 14, 2026 at 08:42:31AM -0700, Dixit, Ashutosh wrote:
>On Thu, 06 Aug 2026 15:47:06 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> When running heavy workloads, reading the OA reports too soon does not
>> guarantee that the report has landed in memory. To make sure correct
>> reports are copied to user buffer, only return reports that lag the
>> current HW_TAIL register by 32 reports. This is an empirical number
>> based on a heavy render workload and several test iterations.
>
>Looks good overall, but I want to discuss a couple of further points:
>
>1. I know you are doing some verification of OA data in IGT, but I am
>   thinking it would be good to have some verification of OA data (of the
>   sort that is removed in Patch 2) also in the kernel. So e.g. after a
>   report is read, we could set the timestamp field in the report to
>   0. Then when we advance the SW tail pointer, we could check if the
>   timestamp fields for new reports are non-zero. If we see a 0 timestamp
>   value, this would mean that the 32 report delay is not sufficient (for
>   who knows what will happen in future platforms). An error in dmesg if we
>   see a 0 timestamp should suffise.

I am hesitant to write to the OA buffer at all, especially due to the 
different coherence behavior between discrete and integrated. We should 
just address it as an issue/bug at that point. Let me think about it a 
bit and see what we can do if we see an error in future.

>
>   I understand that, because cachelines are landing out of order, a
>   non-zero timestamp value doesn't absolutely guarantee that all data is
>   correct. But I am thinking statistially we should see 0 timestamp
>   values, once in a while, if the 32 report delay were insufficient. So at
>   least we'll have some indication from the kernel if that were to happen.


>
>2. The second point is about "what happens in the end", the UMD never sees
>   the last 32 reports? Maybe we could do the following to address this:
>   when OA stream is disabled, we advance the SW tail pointer to the HW
>   tail (overriding the 32 report delay). Then when UMD reads the last bit
>   of data, after disabling the stream, they will get all data. Though all
>   cachelines might still not have landed, but at least we will have
>   advanced the SW tail pointer.

oh, I missed that part. Yeah, if the stream is disabled, I would need to 
drain the data. I think that would just add a delay for 32 reports, 
based on the timer period before updating the tail to the latest.

Thanks,
Umesh

>
>Thoughts?
>
>Thanks.
>--
>Ashutosh
>
>
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>> v2: Fix the LAG logic by using sliding window (Sashiko)
>> v3: Fix checkpatch warning
>> ---
>>  drivers/gpu/drm/xe/xe_oa.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 5952010e8f51..dc8b402d059a 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -224,7 +224,7 @@ static bool mert_wa_14026633728(struct xe_oa_stream *s)
>>  static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>>  {
>>	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>> -	u32 hw_tail, partial_report_size, available;
>> +	u32 hw_tail, partial_report_size, available, lag;
>>	int report_size = stream->oa_buffer.format->size;
>>	unsigned long flags;
>>
>> @@ -234,17 +234,21 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>>	hw_tail -= gtt_offset;
>>
>>	/*
>> -	 * The tail pointer increases in 64 byte (cacheline size), not in report_size
>> +	 * The hw_tail pointer increases in 64 byte (cacheline size), not in report_size
>>	 * increments. Also report size may not be a power of 2. Compute potential
>>	 * partially landed report in OA buffer.
>>	 */
>>	partial_report_size = xe_oa_circ_diff(stream, hw_tail, stream->oa_buffer.tail);
>>	partial_report_size %= report_size;
>>
>> -	/* Subtract partial amount off the tail */
>> +	/* Subtract partial amount off the hw_tail */
>>	hw_tail = xe_oa_circ_diff(stream, hw_tail, partial_report_size);
>>
>> -	stream->oa_buffer.tail = hw_tail;
>> +#define LAG_REPORTS 32
>> +	lag = xe_oa_circ_diff(stream, hw_tail, stream->oa_buffer.tail);
>> +	if (lag > LAG_REPORTS * report_size)
>> +		stream->oa_buffer.tail = xe_oa_circ_diff(stream, hw_tail,
>> +							 LAG_REPORTS * report_size);
>>
>>	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
>>	stream->pollin = available >= stream->wait_num_reports * report_size;
>> --
>> 2.51.0
>>
