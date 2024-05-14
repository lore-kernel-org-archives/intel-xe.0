Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA60C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 10:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF9310E0B7;
	Tue, 14 May 2024 10:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlC4Q47H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACD810E0B7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 10:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715683054; x=1747219054;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XPAIDSTdBOdFK1jVwIszU7u/K3IIwlM5TB8Uzoy8yiA=;
 b=WlC4Q47H6kWEU4y//XyQAjH69mhCZtTTaXD70d6fm2afiDO2AsxqD55T
 wpYc3OQjprPuec4HnlqHbU41uY3mI+2prCqUPCSgOjXbdFirHY8GqT+s7
 G342CR9K38VtX/UF77gEWRtrFQGJPiWvwM/imYFh3F0p6aVhb2wjl4nZo
 MpyVDCQfJOSyCPr65NTDTODLOWIJYQYoPLX+PEJW/Zht13I6/krqMHudt
 vuig+HihZolfRXqrBUHRZn3r8t7WRXeCdOZk8tHB0aap1Plln0RYM7LoO
 R2rixhuqXBonCpxuHTUbkuzEus0H2Fpj67cnjPTPJi0uGrdBXo+X9pT4A A==;
X-CSE-ConnectionGUID: ranHhWlSR2qpAGuNW7ONWQ==
X-CSE-MsgGUID: +aa7xTgmQhWyZoyNYjkcdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22328711"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="22328711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 03:37:33 -0700
X-CSE-ConnectionGUID: rbhUwqdGSfqpbDqAMitsvA==
X-CSE-MsgGUID: d770ySvCRX2erFnTQlicoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30708617"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 03:37:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 03:37:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 03:37:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 03:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A82ZAiFtcc6ftkeLVrct0iPcfe6GU4Ftrb3jr892PL0yXkm6Lib0XUzs9EBLX0x9G/zZ3yHw2e7B5PfuLyUZnBvW5JwFgk+6NLt3R9xKp5TztyvuX9rjFXyYDqK4MiA6aWt560QbSy4jKhGGq4NnWvKjewNovBKo3IzJN2XWUpM0UCS4ZlDVR+Bak8D2KQBvNisCDIqxW5nN0nIQfzhI8IFWSwktu4OGBsLQRXAGFuyqGgDogHC/5YLVAm/y0KZd+hRp0j1XSExOUXfKDAPxRYA76qeiUdq/rFrin/cOAy7O8ew5xObv0xcoD2KPVQPdC3cBK3thDq0q9GhusSWXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E43godrFgJqz536xus85o5fXpzrSSlE/gRgdkRQepO0=;
 b=JPESRROR5/Lo5QI9yAotVPyQIoRlXkSydRvQfsM8LihDsIYfbJwrNlg8FkbjiiafKJC6+eRvG0uOonQF5GoPoICPTCKnTun7R4A+XIDCfbsF9EyMhR48bYBQE0A1QCgcQuGz8J1sJ7Yg2bS7HrO1kOCTJyXaxWBM7c1pyX2vP6X1n6cSTjM6B2G5rBNb4hQAZlE9HAgnggMRazoyk65lUyEP07HHzbOs2p06WvpTVHn5ulk2HY2YImOaM9WIM30D7sZ8AH+vhaCGVD1A5kmTHNYaBPtB05b8yNOX5W0uVgKncZ5guir5Xqap7dNR+alkSBRwMRVTfS2+wVe+i0Hhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB6452.namprd11.prod.outlook.com (2603:10b6:510:1f3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 10:37:30 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 10:37:29 +0000
Date: Tue, 14 May 2024 12:37:27 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/8] drm/xe/pf: Track adverse events notifications from GuC
Message-ID: <20240514103727.v46ftf2jodytv6kl@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
 <20240506133814.2571-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506133814.2571-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU7PR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::21) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a90833c-3b69-4b03-87a1-08dc7401dafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTBtMDNKcERyT3FqNWRkRXVOL01GQnM1UWFFZDN1cjM4OVJIL1RsTnY3UC9U?=
 =?utf-8?B?aHBQdC85N1NGQkN5TG8wOU03WUMyWUZhSTVrMWxXcnhMZk14aTFwa1dub1pZ?=
 =?utf-8?B?NW1BaGZZNHdnVFRXbXlBQWJzMVFuVUVaQU5xYUxSODFSb3pWU2tqZGg2eUZu?=
 =?utf-8?B?WURuZkdkRXBtS1hxcGxyQ0JOZ29nMENwSEpuM0EyNUlnT2ZkN2xubTBCTXJT?=
 =?utf-8?B?c3NYcVFaMU9zS09URW8wNVdRdGZUeTdZSWIxNXhjWVYxRGlrc2FUZU51M0tI?=
 =?utf-8?B?S1NrUEJtN0orNmpJblNHRVQzU2N1VnRsZ3BuRzlNT3YzY3UrUnB4ZWtmSWRY?=
 =?utf-8?B?Z2lHR0E5SGFxRC9HT01vWXFKZVhlZEsxSHl0Qm1jeDBSZU12Si9UTjJxQnow?=
 =?utf-8?B?QWhTNFYxMHhHdWpEN3BuZ3RVcWRyTldCRlAvL1B0c2F1N2l4WEMzNENnOE54?=
 =?utf-8?B?ZHBhajlWdGJ2K01McFVGVUJkWjdFNjI3NUdTTVdWM2lITENXSjE4K0JlMDJu?=
 =?utf-8?B?VFFOaGR5ckxraTJrUE5wZkVaamtCaTFNTTBNU2M3Rm1TMTN0T3lIb0xXUWZ2?=
 =?utf-8?B?bU5ockwyRzQzSUFPbDdpYXpkNDNuaHhaV1R1Y1p1RkhHVFB1bTdLUHc3MnVO?=
 =?utf-8?B?b0VlckxIcGNRNnVoR1RoRWdqRzJNV3lBVisvWXFnczZNYjdieTQ1MVZleE1J?=
 =?utf-8?B?RmNLTjhNdmFMM1dhNlg3MzEvdDFoTnNIOTE2SzRMcUEwU09vY1NISjZUc1Qy?=
 =?utf-8?B?a1hWQ0pvVXNZRkJVUnF4VzZUYkRNeStCVUk3U0JRTjY4RW5JeGtsK2VLZE5Y?=
 =?utf-8?B?dUN3WlVjTVppMEdDS1Q5L1R0Ums0OE90OGpPN0w4UWVKakladGh3Q1p3bGtq?=
 =?utf-8?B?RHZLSUxiTW0wdkxWYkpEeWNiZ2Rvcy94VVpUeEU3SlVidHhtL24rYlZDS0JC?=
 =?utf-8?B?ZGl3SVhWZHcyeWNvUTViV2JiZE9wUHExazJWNVg1ZEZyKzRzbmJqd0lDTGcx?=
 =?utf-8?B?TWVqbGw2Zm9zelhNaUpVTkNFaXp5cEZsSXVod0pIaTBtRkswM2ZwTUNVaHdw?=
 =?utf-8?B?ZVR0NFlIbTZIejQxQ3A4REx1UG5YTUVsZkw2NEhTKzA4dWV2dkQ1RFJsK3p5?=
 =?utf-8?B?aGh6UW9vL1U5NllMZ3hMZzhrS2U5Q3VxelE1aGJSMFZXQkY4VTdiMm5KM3RE?=
 =?utf-8?B?WmtBZXNNUFVVWFJpckl4NGZUelhYVXFkenJ0dS9VQnFoNzdXWWJzbU5SYXF1?=
 =?utf-8?B?VXIrcDV3Vis3b2tYSU9NQ3pQZmlNYVZSQ04vYk5qSUtacmVJOStxYkhoQUZl?=
 =?utf-8?B?aEQ0c1BLZ3RleEwzM1dPL3V6d3hYd3RPOEhmblhkSUNPVHlEa1ZuelBBR1Vj?=
 =?utf-8?B?NkxVdENVd042MUdtSWxGZldrTGJuR3FmOWlCWUpjNmdUT0M4ay9SRndKaGR2?=
 =?utf-8?B?MkVrNlgycFByaXBrNncxSEJ0TytTNVVnMFdnK1l5dXpWTVY2bzFzTUJENkNh?=
 =?utf-8?B?TmdmMk5sdEhNeWt3VmFtVVlYbUIwU21wOFo4NHNzMXpPOGh0U1Vpa2VvZVUr?=
 =?utf-8?B?cjN2VDMxWVRmVzBSa2J0Z3NIaWUrMmJFcmhZSkl5WlY0aVVaY3BpMkVLYndw?=
 =?utf-8?B?eDZBV0NiTEdQZzlvVGwzQWQ2akQreHEvRXN5Y25oUjViVkU4dm1FM05PZ2wx?=
 =?utf-8?B?T0NrT21LMkMyaFA3TEM3MUxxTXZZK090VjNMS21HUXJadjZSNHFaRG5RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnZ4Z1Y1QnZFaVVmTElJNDlWZ3h1NmNHcGRZZUFGbksrVVVwMC9qVndGK3BD?=
 =?utf-8?B?dytkMDdmY0ptck1hcElXT3BDcktCZDE1UnpJRDBqMUxmY1pCaWlXaG9GaVpv?=
 =?utf-8?B?Ymp1QU9hNDkvbU40c2x1eWZBMEU4TzVmVDNPZENrQnNZYnZxdXovOUlVMXV6?=
 =?utf-8?B?NTFlQ09qRFAvRXQ1ZGlkLzkyRmI2WDlWNmdqR25CcVkrWW9xSDE5Q3BOQmFr?=
 =?utf-8?B?bEp1ZEtDN21wTGlsd1FZK3l1TXRDcEdCSndOdnNnNXo3K3ExMTVndnFDREMx?=
 =?utf-8?B?TmRKQzZ4TlQ3WlFhSjZGQlR6NnRTelhWbWl5RXNySzd4bHI4dEtlZERCMklV?=
 =?utf-8?B?SVRNWjVFcWxta21Yc0I0bnc1dnRRbjNrQjd5QjRZTjM3OXVBdnA4RmY0eWVi?=
 =?utf-8?B?ekRabmowM2FHNmFwbWhiekZXWDBmekVMWGhHOGdTWmVPbnlyTktiK3JnTGhU?=
 =?utf-8?B?WktRTU9oM09vMmtVc0syZlQ4ZU1Ya2lDeDZ0M0ZHeHFqcFlHN3NrNzlYdTJW?=
 =?utf-8?B?SUVoWDRBWGRlNzJhN085MmJ6YVlJdWJzR2JLTTlqSUtPV3pxaDREZDRNYTNh?=
 =?utf-8?B?SzRwTEZGYVdsd3NPelJQbU9WUXJ0ZDE2eFFQZk1uMk1hb2lXUHVqV2UrMi9q?=
 =?utf-8?B?aW5RVzVFUHVVMTRGNnpvZU1KNU1BWEdRS2lhQWhpcmxSdHV1QXU1NXBpQ0U0?=
 =?utf-8?B?MC8yOUNQc1Myd2VIdHVjU3pMWkl0UzhJWWJ2QXczZWRlQTdWbXBCL1JCZzl5?=
 =?utf-8?B?L2tMaXdaZE1iQ0pjRW5XVzRySi94SGovQ25JSkp6YWs4dVJ1MHhVWnV4Z1dG?=
 =?utf-8?B?VlFLS2g3d2V1LytTMENyL1h0ajRma1hMS2tPN3cxd2VIeExRZFJwN25WQVFO?=
 =?utf-8?B?OTl0Wi9tNjhIbVp1QUNYYTZnY1oxazVoSlhkZjRKWVJ2Z2llc0hhd0tJNGs3?=
 =?utf-8?B?L1JGemNKemMxN2pGZThyM05oMDdVaUhxT2dUcStUSDJ3bnhxOUpaRGdPeTFB?=
 =?utf-8?B?bStCUHUvRHF2RVFXZ3lIdzEvSDV5MDhuOGtqUVNFOVBQMk96ZEJLM2h6VDFo?=
 =?utf-8?B?Y3pleC9YYndxMVNOZ2xkS0ZZRWFHL0RndTFxSDB4cGpEZWs5dEhsNTltc0Yr?=
 =?utf-8?B?ZjdKVk9KOGdwTzNwWFI1K2wwYUI0eEYyczBiakpRdUVsNXh2Q0lsTlh6MmZn?=
 =?utf-8?B?c212eUdkRzZrUGdtTnJuNGI4cGlFOXpJQnpKdmwwcVp4OFNqTUhoQkY3bjZh?=
 =?utf-8?B?TE9zOStwM3R3RFIwVTNEd3FBSWhxTGZzbTdncDFJWW50UU9rd3VVQ2czSnFp?=
 =?utf-8?B?anVqSElnREpOTnRkMXlxYW4zaGxHd25JMDlpbmNPcUJ5dUQ5Zm1DT0NvSVlV?=
 =?utf-8?B?dEFSalh5QVVYbDZLbjRCV3RrWDRMYXhWOXFlbkg4WllOdElhZVl1aGVNTHV0?=
 =?utf-8?B?bGNVME1UU2lFYmlXcmthcVE4NEtGeWVQRnp0dzdkcXB2QUdoeDAwZXMzdXZT?=
 =?utf-8?B?RE1xaVFUb0hBUEFhS3E2SXpscWZCWGVJN1F5R2ZjZDJmRDk3WTZadnZkSnFo?=
 =?utf-8?B?Rlh0bWRSdXZYTCtOTWh3S0tjQlZkV2N6OE1EbmRDUXdJaFV5UHl1eTl6YUJQ?=
 =?utf-8?B?Y1JCekJLc1RhYkM1bG9zc3pqZ05WVGRhOWVYay93SDlIWUdhaXlua2IwZU5y?=
 =?utf-8?B?a0h2RGZoWGNyMFhUNjV0RFp2cGtYcUlheUM3SHluZStRUnJVZW43R1hFeDAx?=
 =?utf-8?B?cWNtTTN4UnNCd2Jmam1yUlhRSW1kM2xwNktYdjdxeUxYSHVjUnBjSGt3ckFR?=
 =?utf-8?B?OFN4SzdVcTRQcHdUS3JOTjdpNnhqbFdrMkh1S1dvdUJtSWpsNWhST1J3aWxY?=
 =?utf-8?B?UVI2cmFmRHU5dzEvM3BGWm9VZmQ2bWlGUVFxK21DOWpQUzByRXRTNUlzZ2c2?=
 =?utf-8?B?WXlka2tJVVNWR25vYnJXUTgzb0dOMnI0dWU4Z0RxMWxuYmI2WUpDbHNzUlRD?=
 =?utf-8?B?MUpYdHhoM1pZNUVLN0JmT1VlazU4SzlzcXZob2U1V0xFOFpuM3JwTkhCZSts?=
 =?utf-8?B?eldzOXZFWjRzK0N3dXdQbHdMVFN5QzdBU2Y5Yzl3YlVpdTRubDQ3djUxVFBZ?=
 =?utf-8?B?SUhuWjljT05tZmhKUHkrOEVJZitWWlIwZCt5NXN1eG9JUTJuSGN2V25nZnBl?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a90833c-3b69-4b03-87a1-08dc7401dafe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 10:37:29.9250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+YXnQ+lb6m5rkavxyKrE1rq0JHAC0SfLHBpsKYrWfPCdnIHN87qlfKqFZeoegkj28we6/yQhVxscKOe99LQQ3wxKKiU7jHPK6FlnYcDmIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6452
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-maj-06 15:38:13 +0200]:
> When thresholds used to monitor VFs activities are configured,
> then GuC may send GUC2PF_ADVERSE_EVENT messages informing the
> PF driver about exceeded thresholds. Start handling such messages.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c   | 143 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h   |  27 ++++
>  .../gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h |  22 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   5 +
>  drivers/gpu/drm/xe/xe_guc_ct.c                |   4 +
>  6 files changed, 202 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b620389761d5..31198375022a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -164,6 +164,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf_config.o \
>  	xe_gt_sriov_pf_control.o \
>  	xe_gt_sriov_pf_debugfs.o \
> +	xe_gt_sriov_pf_monitor.o \
>  	xe_gt_sriov_pf_policy.o \
>  	xe_gt_sriov_pf_service.o \
>  	xe_lmtt.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
> new file mode 100644
> index 000000000000..2c0c5572a6cf
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include "abi/guc_actions_sriov_abi.h"
> +#include "abi/guc_messages_abi.h"
> +
> +#include "xe_gt_sriov_pf_config.h"
> +#include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_gt_sriov_pf_monitor.h"
> +#include "xe_gt_sriov_printk.h"
> +#include "xe_guc_klv_helpers.h"
> +#include "xe_guc_klv_thresholds_set.h"
> +
> +/**
> + * xe_gt_sriov_pf_monitor_flr - Process VF FLR.

The description is more suitable for the VF FLR handling function

> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * On FLR this function will reset all event data related to the VF.
> + * This function is for PF only.
> + */
> +void xe_gt_sriov_pf_monitor_flr(struct xe_gt *gt, u32 vfid)
> +{
> +	int e;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_sriov_pf_assert_vfid(gt, vfid);
> +
> +	for (e = 0; e < XE_GUC_KLV_NUM_THRESHOLDS; e++)
> +		gt->sriov.pf.vfs[vfid].monitor.guc.events[e] = 0;
> +}
> +
> +static void pf_update_event_counter(struct xe_gt *gt, u32 vfid,
> +				    enum xe_guc_klv_threshold_index e)
> +{
> +	xe_gt_assert(gt, e < XE_GUC_KLV_NUM_THRESHOLDS);
> +	gt->sriov.pf.vfs[vfid].monitor.guc.events[e]++;
> +}
> +
> +static int pf_handle_vf_threshold_event(struct xe_gt *gt, u32 vfid, u32 threshold)
> +{
> +	char origin[8];
> +	int e;
> +
> +	e = xe_guc_klv_threshold_key_to_index(threshold);
> +	xe_sriov_function_name(vfid, origin, sizeof(origin));
> +
> +	/* was there a new KEY added that we missed? */
> +	if (unlikely(e < 0)) {
> +		xe_gt_sriov_notice(gt, "unknown threshold key %#x reported for %s\n",
> +				   threshold, origin);
> +		return -ENOTCONN;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "%s exceeded threshold %u %s\n",
> +			origin, xe_gt_sriov_pf_config_get_threshold(gt, vfid, e),
> +			xe_guc_klv_key_to_string(threshold));
> +
> +	pf_update_event_counter(gt, vfid, e);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_monitor_process_guc2pf - Handle adverse event notification from the GuC.
> + * @gt: the &xe_gt
> + * @msg: G2H event message
> + * @len: length of the message
> + *
> + * This function is intended for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 vfid;
> +	u32 threshold;
> +
> +	xe_gt_assert(gt, len >= GUC_HXG_MSG_MIN_LEN);
> +	xe_gt_assert(gt, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, msg[0]) == GUC_HXG_ORIGIN_GUC);
> +	xe_gt_assert(gt, FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]) == GUC_HXG_TYPE_EVENT);
> +	xe_gt_assert(gt, FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[0]) ==
> +		     GUC_ACTION_GUC2PF_ADVERSE_EVENT);
> +
> +	if (unlikely(!IS_SRIOV_PF(xe)))
> +		return -EPROTO;
> +
> +	if (unlikely(FIELD_GET(GUC2PF_ADVERSE_EVENT_EVENT_MSG_0_MBZ, msg[0])))
> +		return -EPFNOSUPPORT;
> +
> +	if (unlikely(len < GUC2PF_ADVERSE_EVENT_EVENT_MSG_LEN))
> +		return -EPROTO;
> +
> +	vfid = FIELD_GET(GUC2PF_ADVERSE_EVENT_EVENT_MSG_1_VFID, msg[1]);
> +	threshold = FIELD_GET(GUC2PF_ADVERSE_EVENT_EVENT_MSG_2_THRESHOLD, msg[2]);
> +
> +	if (unlikely(vfid > xe_gt_sriov_pf_get_totalvfs(gt)))
> +		return -EINVAL;
> +
> +	return pf_handle_vf_threshold_event(gt, vfid, threshold);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_monitor_print_events - Print adverse events counters.
> + * @gt: the &xe_gt to print events from
> + * @p: the &drm_printer
> + *
> + * Print adverse events counters for all VFs.
> + * VFs with no events are not printed.
> + *
> + * This function can only be called on PF.
> + */
> +void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	unsigned int n, total_vfs = xe_gt_sriov_pf_get_totalvfs(gt);
> +	const struct xe_gt_sriov_monitor *data;
> +	int e;
> +

If you describe that the function is only for PF, then add some assert.

> +	for (n = 1; n <= total_vfs; n++) {
> +		data = &gt->sriov.pf.vfs[n].monitor;
> +
> +		for (e = 0; e < XE_GUC_KLV_NUM_THRESHOLDS; e++)
> +			if (data->guc.events[e])
> +				break;
> +
> +		/* skip empty unless in debug mode */
> +		if (e >= XE_GUC_KLV_NUM_THRESHOLDS &&
> +		    !IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV))
> +			continue;
> +
> +#define __format(...) "%s:%u "
> +#define __value(TAG, NAME, ...) , #NAME, data->guc.events[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)]
> +
> +		drm_printf(p, "VF%u:\t" MAKE_XE_GUC_KLV_THRESHOLDS_SET(__format) "\n",
> +			   n MAKE_XE_GUC_KLV_THRESHOLDS_SET(__value));
> +
> +#undef __format
> +#undef __value
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
> new file mode 100644
> index 000000000000..7ca9351a271b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_MONITOR_H_
> +#define _XE_GT_SRIOV_PF_MONITOR_H_
> +
> +#include <linux/errno.h>
> +#include <linux/types.h>
> +
> +struct drm_printer;
> +struct xe_gt;
> +
> +void xe_gt_sriov_pf_monitor_flr(struct xe_gt *gt, u32 vfid);
> +void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p);
> +
> +#ifdef CONFIG_PCI_IOV
> +int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len);
> +#else
> +static inline int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len)
> +{
> +	return -EPROTO;
> +}
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h
> new file mode 100644
> index 000000000000..e27c0308c5db
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_MONITOR_TYPES_H_
> +#define _XE_GT_SRIOV_PF_MONITOR_TYPES_H_
> +
> +#include "xe_guc_klv_thresholds_set_types.h"
> +
> +/**
> + * struct xe_gt_sriov_monitor - GT level per-VF monitoring data.
> + */
> +struct xe_gt_sriov_monitor {
> +	/** @guc: monitoring data related to the GuC. */
> +	struct {
> +		/** @guc.events: number of adverse events reported by the GuC. */
> +		unsigned int events[XE_GUC_KLV_NUM_THRESHOLDS];
> +	} guc;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index 880754f3e215..40cbaea3ef44 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  
>  #include "xe_gt_sriov_pf_config_types.h"
> +#include "xe_gt_sriov_pf_monitor_types.h"
>  #include "xe_gt_sriov_pf_policy_types.h"
>  #include "xe_gt_sriov_pf_service_types.h"
>  
> @@ -18,6 +19,10 @@
>  struct xe_gt_sriov_metadata {
>  	/** @config: per-VF provisioning data. */
>  	struct xe_gt_sriov_config config;
> +
> +	/** @monitor: per-VF monitoring data. */
> +	struct xe_gt_sriov_monitor monitor;
> +
>  	/** @version: negotiated VF/PF ABI version */
>  	struct xe_gt_sriov_pf_service_version version;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 8ac819a7061e..be9aaf30974a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt_pagefault.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf_control.h"
> +#include "xe_gt_sriov_pf_monitor.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_relay.h"
> @@ -1066,6 +1067,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	case GUC_ACTION_GUC2PF_VF_STATE_NOTIFY:
>  		ret = xe_gt_sriov_pf_control_process_guc2pf(gt, hxg, hxg_len);
>  		break;
> +	case GUC_ACTION_GUC2PF_ADVERSE_EVENT:
> +		ret = xe_gt_sriov_pf_monitor_process_guc2pf(gt, hxg, hxg_len);
> +		break;
>  	default:
>  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>  	}

With fixes:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> -- 
> 2.43.0
> 

-- 
