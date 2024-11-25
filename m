Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8A9D59D67
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 19:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5407610E71B;
	Mon, 25 Nov 2024 19:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHtbdx4p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BEF10E71B
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Nov 2024 19:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732564433; x=1764100433;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/0Zar4aNQz2BllMsawMn0WRaayyT2CMZ2vKgMVWjdss=;
 b=dHtbdx4peXsDS63pg8KrWDNE1sqKeDey45cAslFskr08fW7+1THUO6eb
 Zo92yQbQ1SEGRVescCqpKYbM/PvoYIml/TvYmruy75AgHgHaJ8SfWiqhN
 uJ4/GnanB3MvLFadf8oiCZr2BIkb/LKZ4WCAnM6gijen036/eKc+gM4ox
 /8LQOwGY97NXtTpx1eAjyAqlYfv/jhC9NbQnP5JKCISV+dWo7Rpgky5tM
 dCavYbgDVC2H9P26GTrgBju0eQqmnrjf6PF+8VRSC8aeNLDSjCR6Oae7y
 +CpdRA5eAvMikHcvnVO6mHJeVS4Lp0l7VUoi+V1ZPvlKXwesKi9rJq3yF g==;
X-CSE-ConnectionGUID: lslDMyHfTEa3u2uiJaNKrg==
X-CSE-MsgGUID: 2KrE6cJGQIab2mah2ocgvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50102811"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="50102811"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 11:53:53 -0800
X-CSE-ConnectionGUID: yt+yj03JRt6tQV9v3BzRJA==
X-CSE-MsgGUID: 29zeCl5vTYWq+g1CnrPvUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91000130"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 11:53:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 11:53:52 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 11:53:52 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 11:53:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sb2jtV0RNyObU4NTBmERbOa05IGsC5ag9mb11aLRofvhZB9uoCzCD/WBYMLgpPcjvnpoN0SWwpEyTGRtYCGZFtcR3iHjXRG1vavK+q+roVGOoh3mD3HsvqTT2jGojTqG7r57K1aiKIDGtRPDmXT+ut0vtisJN6+SmHFQw1YTQsetk9nOcD/Cd6fTHBwGJDFRYpqajnsKbyhVQZsKIqK6QfgWLtbgscqbkRjTSRkJZiH47/6DKbucHDGKk8L9kIhOrn3aWeo/q/8LLTP0AMchDXJ/rWs8sxt2Y1KO9o7KIYx/tVZLyaKlk/7mwluA0HhOegqUYnRcnqqdS3xxPSS1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0dCTjc2Z5XsetbrtfZ5zfb3MGVwVUmY7gHtPGgvBWA=;
 b=KxgGdmqoiCCd3PO/HKpCScnSY5NgXaF8cpnnXC4FjAQXcpZUvnKubH7mnQu0vPpS+TmGOWxiKMdfulHiiPAsFptQaQeBWPtSSOO/i3VXOqedVgURWxAaFfZEW4t8yctwQCi9vFjwn5Ob3ZIsDPNucuj7DplQAiASqBlS58GClk4L6MsMF0+fjI8LLklBBbxQ8ubjFBErZe+dKzcCswW1ig7zjVhspGgQ0/RRTnVIVjppCyOmiSNuMI37p76/m/AGky4WVtxgptCLei7KInxFvfh4hQ5isG94yx3qchW1rUYjR+PhlB4Z9C4nPUIgBvWXWxKXUPm9P4EEGXk3XjPxRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS7PR11MB8781.namprd11.prod.outlook.com (2603:10b6:8:256::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Mon, 25 Nov
 2024 19:53:50 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 19:53:50 +0000
Message-ID: <64072e09-7656-4e37-9ce0-577294ff5711@intel.com>
Date: Mon, 25 Nov 2024 11:53:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Update xe2_graphics name string
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241125194838.1190599-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20241125194838.1190599-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0041.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::18) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS7PR11MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe399e7-1fc0-4add-3caa-08dd0d8ae1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnZaRHIxVkM1VUNRYk92ME1iWnNDUXVPY1I3WXJWMHAwdC8yUVlPZjRaczY0?=
 =?utf-8?B?UjRaWHpqQUVIbll5L29xWEo1TTA2RGFEbEQ3OFREcTlwd2EydGV3bHZhMVNl?=
 =?utf-8?B?K3YwOE0wRVdRQlZKY3Q3MFJvOGVCcE1kTUxod01sdW4xUTZHVUdrUDhYaDIw?=
 =?utf-8?B?eUZBTXU5ZXhZSUU1QnNtcnFDUDRVUVI0ei9jVFk2a3lnK3J6eUh3Ym9HOFRu?=
 =?utf-8?B?ZjI2a3RLTW5lZGV5QW1sMnlvZnhidEZhM1VVa0NqdDZBcnRnclo5NEhxM1Nh?=
 =?utf-8?B?V1JhYko0YUtTemdVUENQMm5RaHlETWZOdHUzdStOS2t4VDdlNTdZWlVkQ2lk?=
 =?utf-8?B?NzRPVU5OL2dWa3FjVGZJRlRXWTRGdXdTVm9xWENvMXIwZWlGdC9lNXBGZmpG?=
 =?utf-8?B?U1YyTFhOenEzRDZkYzFnckFtS3ZUUEw5bTBBbnN0SnZRNWxMN2gxZVpaVzNs?=
 =?utf-8?B?R0V6RzYxWGk0ZXRaYVNIWFdjNUlqOU5RWjNaZURMVDdNbjFhR0tQZzlNMjdB?=
 =?utf-8?B?TGpYSi9VSlpPcmlQQytaZWppUHFsSFRxKzY0bmltNTAyVXIwRFJveVV5emor?=
 =?utf-8?B?YnVCV1FmdXhjZERRaW0xZzRtYnZ3QitacHd3Szd1RHlxSnQ4UmJFK3VaTy96?=
 =?utf-8?B?TzlNM1pwWXhoTHpNTHFLL2VBekt2aXBGVm9EVXhIbkxFcnFIRCtPV1ZSYnI5?=
 =?utf-8?B?ektIOGZleUptWm8wZ0I3OExnL2g0Z2xRNXZZUDZCUmRyaGFwYzNoVGEvU0Jr?=
 =?utf-8?B?QXJ2aVplZHhzTFdobXBPZkdMazZ4aW1lT3VjZVhQcG56N2twTURCd0drbm5B?=
 =?utf-8?B?RklzVVNxbjR3MHpjYkxlbGw1TGFVZHBEcDJKTm16dnpVOWdIRDJEYkhhNFRD?=
 =?utf-8?B?eUZKODZaWjhxem9kTmEyVFdqU3prby9HTGFVMDFvMnVXWWlBeFN3M2RBclNk?=
 =?utf-8?B?VXFvWUFTcWhwZTViV2U1RDZkSmpUUklnMkhORllDM1VsVk5LTm9DWFBBY2xO?=
 =?utf-8?B?ajhLTEtYMldyY0pKcThZR0FFVTZJc0t5OG1HdllKZkVpUEdZY3R3Uy96cG1s?=
 =?utf-8?B?TUIxVkM4UWptYlJqTmFsOThPRFl1b0hPR2FseTN3aDVHSVNrOE5PLzV6NE54?=
 =?utf-8?B?emVXcmc0d211Q3FZalhhQlFLTW9PdUtQYXNuejhDYXBSa0k4eko0VWJra3ky?=
 =?utf-8?B?T3R6ZDRPZ1ZtbjVUK3RBVWtxZDJOaFVmMUJkT2psMk8wdVpMTWRzb1E2ZHNB?=
 =?utf-8?B?K1RyTm5Fa3FUMjh5OGFEdkM3MGpWWU8vOURweTV3eUE4SHhDU3Y5V3hIRnVI?=
 =?utf-8?B?SlpVUS9ONWhkc0RHcnZncGp3bWNHcTMvTVJmRThNTmhmcnlPbDUvQnE0eG01?=
 =?utf-8?B?aFlOTnFhdWdibFlkSTk1bEhxaXp4UStsOFNQWjVHTnI3OXNZVnVkOUplK1Vs?=
 =?utf-8?B?eWtkOVFCVVhCRlljTGt6MTFTdXRRbWJDaGtuN1pOTWx2MXAyeSs3L2xZT2NL?=
 =?utf-8?B?WVF1L0hwWkxHK1JRbkpIY0sxSVFnM20zZzVBT0VMZU82R2dsWEY1YlVCYWFa?=
 =?utf-8?B?VU85V1c5bzFGQis1SXB4ZEVkbDRuQXRrVzNZQ0I1UG51NERMdzZ5ODI1VGVo?=
 =?utf-8?B?TEt5SFhoQmh0K29LemFpQjF2T1NKRzFqZ0o0RHQvRUhCNEQrNzA2Z3dGVnhJ?=
 =?utf-8?B?dXUvZEhCTXVySmxkVVBUNXlIYlVoK1M4N0YxNmw5MHRFODFDaEQrRGdGdHBF?=
 =?utf-8?B?bnRNQnJyN2lQNVhOUU9WVVEybzh0RjhYRVowSGhJUndWNGRCWms1WTMwVXFv?=
 =?utf-8?B?QWphd1d5MnpWUmFLTWxCUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDE2VUVQdmZCclhLYUZ5bjYxaUlGUEdkZjliVENEN3hXaFhTdXZnMngxTHY0?=
 =?utf-8?B?b3JwY3hRYm1ucEQ1UXN1SU9HM2lnT3RMWFFLQU1pdXRhMCtoME91UkZ0NjF0?=
 =?utf-8?B?bHliVUFOa2tydGZQdkJOOGNDZGJkMDViUG1OMFN0K3pGMXk0OXhmSktPRzht?=
 =?utf-8?B?OEw1bnZ6SU5FZFdkSEtNUzFGOFZ6ZDA2N3F3Yjh1Rng0V2t1bzNqVXRHb1Rm?=
 =?utf-8?B?UkNVRmw0Sm9ZWEJJS3hVcmdMSUxPeGo1RU5hdWpmajZuM280Zk1TVlp2REFy?=
 =?utf-8?B?SmZDMkNONExSb2dXYmVoNWlHc0RVbkVpV3hjenBiSkdNeE5JNjN0M3pIUjg1?=
 =?utf-8?B?YUpybndSdVk1RUdBZnVKTFJobXp5bCs2ZjI1V25iMXA4bFNaaGMwMWZLVENJ?=
 =?utf-8?B?SkhxeXZiQWY4WFk0VHc3b0JzaGZ0N2svRkxJWGxCRk9EMVhSVzBxQisvR2cw?=
 =?utf-8?B?dDRHblpTZU9uV01NQWpzcWMzN240QmFrUkVUT0hDcWphSTBQU2lIZFNrWCsw?=
 =?utf-8?B?aWxRc0hKekNKTXFqbTJjbTd1NUVuSUloZVpJeXJqZnpyN1VNaWw2bTZFc1Fo?=
 =?utf-8?B?c2ZWM01teWcwZHcvSVJaQ2FNQWZEcFlhaVltUk9XYk50bmFic3drT1BXWHlp?=
 =?utf-8?B?UmtRT1JhNzdUUFd4Z3BocmFBZW00MmxkRU82MDF0bzZ6bGRqbVRmR0lzUzFR?=
 =?utf-8?B?WERZTjlJZFk0OHFqOTY4RHN1blRyZzcwQmVvYjJBbGY1bjBZWkhkdHltdlpK?=
 =?utf-8?B?YU9FN2hLUXY4Nm5Cb2RRUzdrYTl0UWhNOGQ5MUhKekhlcW0xMEErNkpJbFZM?=
 =?utf-8?B?SUF5TlJPdzVUZnVMejNFK1puWE9KUVlLa2RUd3FmeFdSQVVRbEV5T0VvbUhU?=
 =?utf-8?B?cUVKSmYxMTBOVFUrQWVMNDM4TExoaUh0ZGcvMTd6c1I5dmVXQkxzWlZKS3VH?=
 =?utf-8?B?WUhpdTlWUlVOMjBPazVocXJTWDY2cXBIamZnYW9TZjIxa2RqVUY2dXRCSk9B?=
 =?utf-8?B?M0N2QlhGNTVpT3FBenlLMFYvY3AveDd2Q0NSalZRRFRUQTZoZHlIbkNlWThM?=
 =?utf-8?B?VlR0Nzk3TlJuZWZRZ2Y2RUh1d2l0dXdxNFFZTjE1Q1JLNTIyT1I4ZkVpa0JL?=
 =?utf-8?B?ODN2U1IrKy90eStVSkpaSkZYZHN2a3FFVGFSNldKNmdlZklvRVhTY3drRzhs?=
 =?utf-8?B?Ti9EOXM2SDFxREpyd1RDWWhFRHJ4MzdnM1VpNVh1WHcvOHhrbDRnUkVzS2J6?=
 =?utf-8?B?clp3M3pBanpIMUdpTjYzblIxMmtBd0pvbHVVMGhPVXkvOUJOeTRBdnpTTFVV?=
 =?utf-8?B?RHZvMlBOVitQS1doSitkWkJ3TjZBUFVKK2ZMYjYvUVFNQitmYldncHdqREhE?=
 =?utf-8?B?WDFrS2lhK2VpOHRUZDBaU3VkbVQ0OFF3dDhWamhqN1lveENvUzhIdER2QWE1?=
 =?utf-8?B?MlcxVnZTMStnMFVnZGdOY3dibVJXdlh2ZFVQeWtqWjlqbUhNTHJwVkZEWFho?=
 =?utf-8?B?UXdETU1zVWxDM3VXK1Uzb3hoWno1dW95Z0Q4eE1lU0NOSnpkQTRrZTBBQnhu?=
 =?utf-8?B?MFQ5NjEvR29PWnc3a0dHUTF1djUrbFhjeGF6cFM2bmk2NmlwM0dPM2cvUnFZ?=
 =?utf-8?B?UG5FZ0tyS0hjNUhUbFNPNG9pWTFyb0lMS0VQV1dzZzJUZUw5eFZqUzNQOU5V?=
 =?utf-8?B?NGVPMFBNNHpTcW1wZmtLbFNJYXgyK1Q4NGd5VlZ6bncwQXdHa1hVanN3STQ5?=
 =?utf-8?B?ekhIeHlSRTMwVG5icGNnU1R5ZlJrRFVRNlZhWGUrSlY5NVJxekh4Smc4dDlv?=
 =?utf-8?B?OEt6ZS91bWk1VisyL2Q2dFhXalc3Uk5idElHUFhaVjhFY0R3R3ZwZFczeTZM?=
 =?utf-8?B?WGVqM2h4L2xieHR2MmlQenkvRHZiczRhWWVtN2ZnMVU3cTl6ZDc1YjZ4Yzhm?=
 =?utf-8?B?RmJONUw0dEpIdUo1V2ZsZ09GdEV6RXZSYTR5VUZjenNnR2V0WFVjcTgrekwy?=
 =?utf-8?B?Sy9KNDNIbkVrM20xalVibzhTSTlXSXBIVXNxUzhBZTJsSWY3QTdJZ3BEOU9W?=
 =?utf-8?B?WkhNRk9UeDlraktKeldGbGRRR2E0NkFjelpqcGU5VG9yRGJ5eEo2b05EMFA2?=
 =?utf-8?B?eHdxcjY0SFFla1o2aExxTXltNjlVTFk4dXdkK1ByVXlBZ2s3UlpQc0JJVHdH?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe399e7-1fc0-4add-3caa-08dd0d8ae1b2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 19:53:50.1774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McmZg7x+n/OsG/Ztgm9/oh+i1eUF3aoH0vuLDPPfHrmBxZGfY8Uq2SU5+tX+h+OImSPxePkL0xl5DXcPLcSsVloU2IvvTMcQJBM52m/dI2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8781
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


On 11/25/2024 11:48 AM, Matt Roper wrote:
> Since both Xe2 and Xe3 platforms currently use the same set of graphics
> IP feature flags, we associate the "graphics_xe2" structure with both IPs.
> Update the name string on that IP structure to clarify this and avoid
> confusion as Xe3 platforms start going into public CI.
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> Fixes: 800d75bf20ae ("drm/xe/xe3: Define Xe3 feature flags")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 9b81e7d00a86..7d146e3e8e21 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -174,7 +174,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>   		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
>   
>   static const struct xe_graphics_desc graphics_xe2 = {
> -	.name = "Xe2_LPG / Xe2_HPG",
> +	.name = "Xe2_LPG / Xe2_HPG / Xe3_LPG",
>   
>   	XE2_GFX_FEATURES,
>   };
