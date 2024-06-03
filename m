Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7B0C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 16:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A321410E256;
	Mon,  3 Jun 2024 16:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwgn2CNj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11DA10E256
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 16:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717430940; x=1748966940;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=up+IHUadlcqZNg0dClO0v0K2jfwrdyxsCaJsRnhRLjU=;
 b=gwgn2CNjYL7mpKd2l0MR9QY8zZGUFMjcwlVvE3PgSV06GoKGqws9j0y+
 jflO9skcjprID4dB9mytiuKNaQk9RopO5gbVeNodO3f8pkXa/E59Tb3Q4
 RtFBwPjIiQGEX19C+eJ5K+CqbZjoCrdxQkkPmBXDw/z5nZ5/WmQBzlSfL
 YxQLB8q6dnftvsszN3AzTHzq7FCyOJchVNYITjcMMJIe9EDgo6ohDvIIk
 qWEY0tNkb7jhNbFcqok1Q1Tg7K4twqV+AqdrgVFUsRhzhpBHF9EtREdjz
 p9/xw3pwUNmcu28vccCxeXz+sPVw6Ldy1+06MpxmcWASeiGl3j/gLOHw1 A==;
X-CSE-ConnectionGUID: b0eHgFz4TyaRk/cWsauNgg==
X-CSE-MsgGUID: Q2DsTjeCQVOn+8Yog1fIrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25332268"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="25332268"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 09:08:59 -0700
X-CSE-ConnectionGUID: A9e8qnOoR/WRR7FsWUg+sA==
X-CSE-MsgGUID: 0jCrlh20QGKOgNeUDhqXsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41466615"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 09:08:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 09:08:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 09:08:58 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 09:08:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ba7w+lb3T5zdzvI5iwb+xGDOlr9xWJW9u8TqtyUJShKRTTf+FTdoeoJblqBvJmdfTfrBCqSw/nPt1skcqhUlUta4UZySAgJDTsDVuVLuHE4GRMUnNJJlcW3/6W0VSRcuWtnV+IO4Cz6+VzjqlHWJBE0QZTt/W4OFV2kGh7dJc8Es79iR1W77MthQdnlrI/84okOnPUL9tQXdvBGN5nW0eUK1szFuTJFbVgrMLHHTMm231T1zwPhsStQiK6/75Z1aJiI5W4GeCxwRLoS9LD7J1CNt6UBZr35PHsrqjelCCcZym3koq/g4aAtWhKQ1zGeY2dDKY00hrmxNIuQAOJ8C4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gUsztzfmsV8x3A5+6YP4b5mX317oHc/o11MPbxTH8o=;
 b=ZyLcQmZLxAm7xVqB9utDg+iNz9dt4Ir+ZwTQFPrbpsSdVr9usGoP7YbmALZdIJVV8HBcjuhqYj1wvk5hu5/qHtjRahDrGDlgBrnCBQFRUwTKOGiUR+vAThIPG3jgE7EPwZNqoVQFksbMzkwbYKYLdXe3Ucq1iEvUap1w4DEKpIA2FUh2VNEi/S7QUGf5L7fxmW+g9eWyOvvjNQRMLNYQALp+AkMwhb3Ln851wySakZccej2gQ94Pu8rMcSd+ue4wkHyQCgoZSIuSUArP25Ef5ElrVvsOT6r0Wn3IkYRh8Ne3/ZpK7CGVxol6FSm4i0+Yl51iR0ITHwPoLacxXoy3sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Mon, 3 Jun
 2024 16:08:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7611.016; Mon, 3 Jun 2024
 16:08:56 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240603145430.1260817-1-balasubramani.vivekanandan@intel.com>
References: <20240603145430.1260817-1-balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/xe/bmg: Add PCI IDs
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <gregory.f.germano@intel.com>, Vitasta Wattal <vitasta.wattal@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 3 Jun 2024 13:08:52 -0300
Message-ID: <171743093213.5170.5636956575738897127@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::37) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS7PR11MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa70e99-37ca-40e3-205d-08dc83e77850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlZGWFh4UmovazBxbGtrZ1U5Z2tCcy90OXY2OThQeGxiWDFjTkVNS3dwZGxs?=
 =?utf-8?B?MjkyRENkM2RIOTN6RFVwRFFneXJWK3hUbUJwYXR2QnBNUy9vK3hKb3p1VDBI?=
 =?utf-8?B?Uk5PaUF6RW9peVBHZHdUd0R5SkpSbm50UFllcWhabjhuZVpkOWdRcFNzcmN6?=
 =?utf-8?B?UitkZzRXdmE3Z2lrUjBqZ0QwaWFlMFlzQWgyMmw4WndibEpUWTdvWGpzbjF3?=
 =?utf-8?B?azh6Z1pGTGx5RUJXa3N6eWkxOE1qaWp5dWpyUnByd0ZPYWJGMjdpVWpmVVlK?=
 =?utf-8?B?ODRSdUhvdjN3R290Q0tJYU5lNUtHc1ZuZEthUWJyaU55L0JlWFlRczJ5NE02?=
 =?utf-8?B?emU3TTRUNUlMWkpnNDlrT002a2ZJakplMy9xYjRQbkduTXdqb3ZhdG01emVk?=
 =?utf-8?B?dkdFSUpGYWlIL2dzaFJ6Um1MRDdOM2FNV2psMkRHTGdXUkRlaks1bUNEVEVF?=
 =?utf-8?B?N0ZhWWJmeEp3WmpvY1laS0ZEQXZQdDFUSmRWOFRTOUdmb0pJWlhpVmluUFdM?=
 =?utf-8?B?OUIvb01ZdktPRE5IVWxUNFdHNXljNGIvVFNBY1pEOVgvb2tGU1RPaHpmcEta?=
 =?utf-8?B?UDlFUWZWWitvckJFMWVJYVA5bWhTTkdsQUhrMmlCQTFBK1pnQldlaGN6ZVN5?=
 =?utf-8?B?RCt2S0crWE9VZHgxamM3Rkl5UU1hTHZ5K2x4QXBFOUgyQzd1a1JzVGluNlAv?=
 =?utf-8?B?d1cvMkFIVkZ6b3U2aXU3dkdqU2dJZXVsb3BPaExSM1RNSUJTWnM4emZNdTBj?=
 =?utf-8?B?U255b1o0OHYrNmt2dS9pc2JkdXN6TVBqUVBvaGdyc3k4WGNVWVdOTUxXbENH?=
 =?utf-8?B?N3Vud3kzWXFZWm11Q3VldUp5NEw3eVlSNDY1cVNMbG9xQmFjOVhvT2lmMnYy?=
 =?utf-8?B?ekx3ZzdqbVM4U3NsTldPWXpsMGg0MG13dXl2QTBGSDBCTjREaVhFam9UUHZU?=
 =?utf-8?B?ejZ2a1pBUGI3THFGWk1XK2J6MGdqOXJLRFBFdkJrem1mOG5BZVVGMDJFUksy?=
 =?utf-8?B?UVYrdVJaTmtnS2Jqei81Q2hkbkpGV0ZPbjBDRmRaSzRIMllVeHBkUmFYRU10?=
 =?utf-8?B?T2NGNnJKdFlWeVA5STdFb3FBMlZrenc0dDgxWnYwTzFYQXUyZmU2VXZZTGJ3?=
 =?utf-8?B?NGE4eU11czNsNlBtcWJyalluUkg3dmd1dHNZaVRGYTdzTXhXa081R3phV1p5?=
 =?utf-8?B?Z1hsWHFlMGNDU0JWcUhraUYrZHAxTG1sM2Z1SXMrR0NUS1B0VldsMGxRb3hv?=
 =?utf-8?B?TUc0NllXTlVTOSt6VC9kMFcwT0doV1Y4SkUya1FKSHRYcGVyRmJ2OXRnaWg3?=
 =?utf-8?B?MnBIK255NVF6aDMwTzdaZjVtS0Y4OFZTU2kxY3RNK1c4L2tPWXl5a0krUEw5?=
 =?utf-8?B?OW5McE1BQzIrQnNTaTFtbkJXS2RFNnR0WmlnNko2ejkxRDYrRkI3aEUzUjhQ?=
 =?utf-8?B?bHl3aEdROHEybklxQUl4dEd6cm1EVC93UElNZmVvL2xGRnBZbjl6YzAxdDZw?=
 =?utf-8?B?UnQvanNycWVjRmwwZS9Zb3BVM1NxUlJoazlwWnhpWExmN21pT3p2Wlk3NXBC?=
 =?utf-8?B?dU9NWENsTFpXZkxFVFR0aUtzSm1OM3kvenpnR1JOQnpRQklxU0d2YUdmTHJK?=
 =?utf-8?B?SGsvZnRIQXBiTXNZRU9yMW54YlRmUVNQYlR1dmJxMmtQTkFXS2RYSVNYQ3lq?=
 =?utf-8?B?U3FzbzF6cDVXTy9wOVZkTFdKWCtuZk1pSkVnRnVySFB0WmhVVVcxQkJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzM5VkxoL2tyWFZHdWJueU5Ga3hNV2Q3a0UvZ05hQ3d1TnlMNjJBWFBkdzJh?=
 =?utf-8?B?aUNCRVNNZENiLzlad2xDVk1PcTMwRkh3YmNvNnhWeFRRb2N0UitkWmZpOXRV?=
 =?utf-8?B?VmxjQVo2b3RnVmh3eDFXY1YySTJLSEZCNlZYVmRjNENSVXQ2ZE1DMk9KSlk0?=
 =?utf-8?B?R1hZNk1HcHBOOUZ4VTZ4MDUzMmg3dEpqbXFOK2dkZklvSG1OUDFGMU1uS0FZ?=
 =?utf-8?B?c0ZyY2h4STF0ejZxS0RlSEl3Qm9TR2o3NGxmWmlwUU1qOGlXSkQ5RUl0aVNl?=
 =?utf-8?B?M0NuKzRsMWhaOEhHUXNXRUwrbFI1QWV1SDBOQXY5bC83RHFkK0UwU3NWV2JK?=
 =?utf-8?B?M04zeE1JL3Jsd1c5MnM5QmtjUGN3cW9EVTA5NlRLZGdNYUpENTZSYndWTmRT?=
 =?utf-8?B?Nng0V3F4Z2FzNDVXWUxsOEh5ZVFSWE0vV2ZEY2p6cVEydFJrcVpuUjE5ZlhV?=
 =?utf-8?B?TVpsOE1JakdJNWU5TW54aUh4aVZWR21xU0JxOVdYSTNmb3JRb3VBYnB0ZWJ2?=
 =?utf-8?B?T3VVQ0dVZEZuc2YwZlZIOUpKeHBDNG4rc28rd1BDM1FkSlFBOHFXSXlLczZa?=
 =?utf-8?B?WjZoTkxQTkpNcmtEcWVRVHV6RThVUU9vVFY1MzRwVWVVLzdlQ3JlWFFreStN?=
 =?utf-8?B?TDRZTkZEU25WckFMN0ZHUCtncGE0TzFtVUlIS2x4NXNMc0xJODNENDUwOGsr?=
 =?utf-8?B?THR1S0lBUlRlV2JUNFp3UGh2QWk2S1A5cmZ2dzRmN2RoVTZOaGpJbU43cVZ3?=
 =?utf-8?B?UXFWN3ZVRHpORllQZURYbXZ4MndpbmxPN1NQRitkVUY5U0hDSFFwWGVTUTlj?=
 =?utf-8?B?V1BIRHNlUlNmMHRBbjhoYVBSK05LeEt5ZDQvUGh1RyttS3c1UXFMek1GeTFz?=
 =?utf-8?B?NXdHRVpFQzhvN01ES0tWOXhOUktCSjNDTllYOG8zOFFMNytTaDQ2N0p0NzJF?=
 =?utf-8?B?RmYxa3FrZjNjeFV4S3huSjVFQS9ZSDRBQXJHVWF2NllmN1NKTFAvVGVQSlV4?=
 =?utf-8?B?ZVplTmFrQ0xuVEhnTG1BeTFzcld1d2l2QWlZU0dlNDRza1Mrb1ljVVRqbVIz?=
 =?utf-8?B?SEJmQ3dQT255Q0haM1BnNGtValB4OTBiNlNqNjBCdThNdHJTajhjTG80aVhP?=
 =?utf-8?B?NWovWnRPanpRWkk0czlqN09iQ0NncTVoMWFFRWdyczZ1bHRzMUJ1OVlnNElF?=
 =?utf-8?B?OFhkdDN5UExkbXQ0N1lid2FtRU16RlpYQlJLM2xwV2VtUmhUd0Z6d2N6MDgw?=
 =?utf-8?B?cFRZYjVKeld5Z3NGbUxOZG9lRXJHd3hsTFFBOElmMXdhek56elhlNkFjUGwz?=
 =?utf-8?B?Z2tIVEZLSWxackF0bHBrQU5ZYy9UMTJ4Z3h1VkRNNlVtSWRqbFBqb3AzN2JX?=
 =?utf-8?B?NFZ5V0pXaFdQNjc4M2R1a0t4NC80TVFsZjNrQWg1eUIyNyszand0NFV0ZE9j?=
 =?utf-8?B?NnZFVEJSMFFqQ3ovWmU4NStXcW5SbVZOelgxV3Z3SFhEU2VMTHBjRGl5SEZY?=
 =?utf-8?B?MzZ3cXpPMERrK0tKSXBaN0Fka0o4Ty85Slo5dHRJVTVySTV0NXowKzMycWZ2?=
 =?utf-8?B?R2NNSEtOM1N5K0VwSUY2Q21FRVBxVWJhaXllbU9CNGdVOER3cXFpYVl0ZUVZ?=
 =?utf-8?B?UExpek42Z0o0VGM2YmpSQTIrYTFEUEZaKzgwTmhIb1RMbGRqa2VNWFdyTlJD?=
 =?utf-8?B?d29ZWFhuSUtSNDlUUS9ZbXZMaWRMYXRJREh6dlFMWnpDTkhQbjg3ZkVYZDZI?=
 =?utf-8?B?L0w0UkhvdWRldHVWSHZhOWszdkJNQTJvbE9aNjhXZ3NScDRRMnpLSFNzd0Y1?=
 =?utf-8?B?VVlKc1A1ZmlOdHhDbGhvdUNMRlJFU082RHFQWDdtSStod09NUGw2WmpjZ3pa?=
 =?utf-8?B?SkVYWWtRWENjMEhEQnp6cmhkK0dpOEZ5QmdpZTQ0RDNJN0ppL0RYbHpydHVH?=
 =?utf-8?B?Q3Z1V0xabVZNcTNoMUlQdTBkR1d5bld6QzhRUUpLOVBkU09YbTJuVEtQejVF?=
 =?utf-8?B?cnBnRW94WUxsck9RRUJSQUQrK2dlS2g2Y25DWHE3VUhrdzRGdUlaRE5qcjAz?=
 =?utf-8?B?aHJuL2pIdjRnNzl4R2xib1VERVpqVG1YQzBzVVZRSmtHcTBXdFZTRXpOd0VQ?=
 =?utf-8?B?T25VdWtScXFFemJLMldQMGZmZHhqTitJU0dpYTV4T1cyemVDZU9aQXl0TW5V?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa70e99-37ca-40e3-205d-08dc83e77850
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 16:08:55.9995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbsuQkBpx3q8yYHoFO+OAjEhEvV4UOHOkX/08kKDVv972vxf/PxPj/9McWLobds1S4I9NVIy41k3IWZnJ2p+AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
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

Quoting Balasubramani Vivekanandan (2024-06-03 11:54:30-03:00)
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Add the initial set of device IDs for Battlemage.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@inte=
l.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_pci.c   | 3 ++-
> include/drm/intel/xe_pciids.h | 7 +++++++
> 2 files changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 5655222aa4e1..ebff5ea79b1d 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -340,7 +340,7 @@ static const struct xe_device_desc lnl_desc =3D {
>         .require_force_probe =3D true,
> };
>=20
>-static const struct xe_device_desc bmg_desc __maybe_unused =3D {
>+static const struct xe_device_desc bmg_desc =3D {
>         DGFX_FEATURES,
>         PLATFORM(BATTLEMAGE),
>         .has_display =3D true,
>@@ -391,6 +391,7 @@ static const struct pci_device_id pciidlist[] =3D {
>         XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
>         XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>         XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>+        XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
>         { }
> };
> MODULE_DEVICE_TABLE(pci, pciidlist);
>diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
>index c7fc288dacee..73d972a8aca1 100644
>--- a/include/drm/intel/xe_pciids.h
>+++ b/include/drm/intel/xe_pciids.h
>@@ -208,4 +208,11 @@
>         MACRO__(0x64A0, ## __VA_ARGS__), \
>         MACRO__(0x64B0, ## __VA_ARGS__)
>=20
>+#define XE_BMG_IDS(MACRO__, ...) \
>+        MACRO__(0xE202, ## __VA_ARGS__), \
>+        MACRO__(0xE20B, ## __VA_ARGS__), \
>+        MACRO__(0xE20C, ## __VA_ARGS__), \
>+        MACRO__(0xE20D, ## __VA_ARGS__), \
>+        MACRO__(0xE212, ## __VA_ARGS__)
>+
> #endif
>--=20
>2.25.1
>
