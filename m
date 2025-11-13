Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C73CD8CBE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 18:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4159010E91C;
	Thu, 13 Nov 2025 18:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoHFg/D6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8D310E91C
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 18:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763057780; x=1794593780;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=iiXN1uofLu3VJkptn0mPSMY7yJBu3XioMidNWWXK4QU=;
 b=BoHFg/D6wyiv6xeQFvma/j0c5w8mjJH7/+kH6bkjESIxU3QN+7VgRJpP
 Q5HdR5/9Ejpfxxl5+JeHyG4Q0Ce91FQ5zVfEGxCwzsxguJKojMuwy21Bd
 vnsrNgaFP3nRJl9DmRAlRIJzE/9RjxBoteI0oC6c4z/1ZhJ1/C8SKPCdf
 neG4Ykh8u8O/kpI0Bl8SKImo5DMoD3EXYwMFefZ3gihts2MRUiM8G5uvS
 e/MQZwjIOLdXGaQ4LVcPdoE0TWG+6aYSZVBR78qwVTJo35aj9ob0AHX6I
 mzg34kKms7W5yqTuJ/G+quEPwmml++PZYdExAF3If0OtxRFf8MrD/D2Le g==;
X-CSE-ConnectionGUID: B/AY93EeQEeGQqfgEmgdGw==
X-CSE-MsgGUID: AMR/cDIxT9KT4oUB91Wy1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75828580"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="75828580"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:16:20 -0800
X-CSE-ConnectionGUID: CHKJXLPMQZSc3DSMaC4wNA==
X-CSE-MsgGUID: MfskOdGATHa/cEPXLKB/+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="188825635"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:16:19 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:16:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 10:16:19 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:16:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UekoEH6VSKu3g+aI6qfspD2eFgoxo9Fmzz1xPu8t01Xtj9SQX12CwQfCTp75a/bApkbedY32XVOIbDDy3W0lmFUqXwSgCF4GXFRhon5BX8kUqHUHJ+ktZQvHGUsD95K+eLmCAF1K+5nLFsZOhBaZL4l/mGcsR2jpXbncmHcKRrf1b3QjePsOqECcCSCrsBdf96kgex/WBfVJxqCsLQSKVutSaDFpP+v3wRVBDHvj8kgIAkg2kHol7QawFZ9XgpLdbN8j/lj8gmc+gMcopGzDmRKopZRdw4CKMUFmUayohdnvTZUcDMSqdID7MHM5jppbQYx8slIPGWejNWUa1UBjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLyGaxIUxggxdy1eRbe0fEdi+QjSJNjV1VpSkskvLpo=;
 b=I1mvjHwDU5czJDF+X1+gpijh3SfMI5/0h5TSUCprS6mg+bH1cV++x/QT0fbxK+camp3vKly1AOqFgQYsPMhifFRHAVxhJOvxiDVxcOnuS6KBjfAiy+9hGrkWXNvmwTRWriT61H4Rf0wAnSi8+IP5/9oT3urWLDCu557gJvPu7DwYEheMEjaeVSDWXseclUeghQhJCbRBD8vU/Fr81GYr0CKKk8lyFvgUNKLcNU+9AiDLI4YCWGVVsAMhkxa5sVa+2kfxSNXSKAHLWju5sxMuCkAlbchboR5iafOdcN7px1ahuRDC38/lOORSUpNga3RSBm94TwK1wRk777vyVwGdNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB7878.namprd11.prod.outlook.com (2603:10b6:8:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 18:16:17 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 18:16:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-60-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-60-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 28/30] drm/xe/tests: Use scope-based runtime PM
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 15:15:55 -0300
Message-ID: <176305775564.3698.15674185107665211528@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: f6fcb3c0-a48a-42e3-ca6f-08de22e0bcc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjlCRHZyWVpnYi9IZ2VuSFpjaUdGbFM2a1piZzI5UTVmcjRqbkp0bHc3eGRZ?=
 =?utf-8?B?dSs1V1IyMm1yOXdRSW1WcnFQbXhSSjFmbFQ2MEF3TGt5QlpJcVpOc1BRcFdL?=
 =?utf-8?B?OW45NVYwVzBuRTlsR0V6R1c3bXB3em5SclczSk9yUFNacEFkbW5NeDRMOHBm?=
 =?utf-8?B?Y2Rmd1hkQ1drUld6L0JjV1NOeW11a2hlUXd3d3pWWmxCZ0JGSjhNaWkwTWFi?=
 =?utf-8?B?c0tGbjZsWmhRTU5UQVFyQkxJeHBIWDJ1RU5YMVh6aGRmYXZCOFNZMEgzMzAy?=
 =?utf-8?B?eFVoRU1TVFdoKzBsekxlUjM2Z0h0OUhsRWs2TDVXQU05M2pibHNMUEE3SEph?=
 =?utf-8?B?UW5FOHZZZlRWQkg4V0JGbUNNSkg1S2VqTjd5NWZFK2crYXlIUXV1ai9Ea1hC?=
 =?utf-8?B?V0d1Z1gra3dYeGV4NWZyQlBmSlo1bGJlV1VRdVBjNmFtaUhVOVFuNTlob1NR?=
 =?utf-8?B?bVprQmZvVmJjS2RkSW5PREFFQlVkRm1UL09XTTlQbUxnU1dGOTFtK0VxdUlx?=
 =?utf-8?B?N1RlL21WWFlkUHBhWXovWGgwa1BSbFNORVczL09nUkd1aDF4d2dPNVlGOUxF?=
 =?utf-8?B?Vlc0MGkzUlg0V05mY1BnYmFwSGtZaUJWVFhwWlBkMlBLQk1kaFBXWHhIKzZU?=
 =?utf-8?B?OWtPT0RNQ2xRTnYzeCtwTXNNUFFDZ0R0N2haMlg3TnhnYldINDJCZUY0L1Y3?=
 =?utf-8?B?NzArcXZpL0thTVltSjJaWFo2cnNtbWZmeUxRY2E5aXBHOGIrTHVUbU1XeWEz?=
 =?utf-8?B?NE84c0JHU1ROUmluN2dtZWFZN0tjeGtsVVFRclVsRndnSHpWRjd4b1Iwdkk1?=
 =?utf-8?B?ZzRYOVRPRHhBdmkwaTk2RW1Mc3V0NTRxM09neHVVT09KVGFHczRQZmlva3Zj?=
 =?utf-8?B?emtzbE0veFVDemlKbUl5cnJnVXFvTExMRXg3QWxkZmdvQmNFY1ZxeFZRMEFl?=
 =?utf-8?B?R25iTVJYd2t4bGJjUG5vaTE1cGJCYnVXVmNKbE5RRWdxR3FCTjl3ZzdXUWhE?=
 =?utf-8?B?L1hnczU0ZzFKelFBRnMvUEZEZlJRZ2syZFNpaFVSbU1xWHIxV3FXTS9xRTFP?=
 =?utf-8?B?b1E3RXpaMU5pTStKYm5SUjkzbU9pNnhyN0pFcWptbUsvMDlpNm0xWnAzNzlv?=
 =?utf-8?B?dlpwQWtGNDZxdUNDMW5nNDRsSHE0ZmxhRU5vdTd5aDdaUnJRK1pQYUl3MlM0?=
 =?utf-8?B?K2daSVUzZlc0OE5ZQldtM1F1MWk0R1hvU0lBTk4xdFdtUGgvcHg2Nmc4MXh6?=
 =?utf-8?B?U0Z1eVBVdURrVXN6NG5PWTNRRE9Ia2FTNjZFZGErZmNkdXBrZml3RmNhYUhY?=
 =?utf-8?B?MDFDYnoxL1FsT0RLZHpDNHBYYy9nSjFtYkt4WUlXMXdpLzYxeFFiY0Zmd2JT?=
 =?utf-8?B?VjZVMzY1cFJFeEFWSGNJN1N5RERkYU9ycTFka3oxRmdvYWIzODl4QzFHWXVt?=
 =?utf-8?B?T2Z6aklTbU9vME1BREwvVk4yUHFwa1NDMERxT1hxbTBRNjlqNVhKRy94QmFE?=
 =?utf-8?B?d1Rra0xtR1BSY29iNU1FOSswdEIyd09FVzExSXhRSkR5SURrOXdTdTNCaC96?=
 =?utf-8?B?Zzg2Tkt2Q3RuUGtHb1N5MkZpYVlWYVN4UWlyOW0zT0tOUmNlVitXcGQ5M1FD?=
 =?utf-8?B?VmRRVzlHMDFsWWVKdHNkVWVJRVJJOVp5b2QvdG9lbjdmZGRkQWJKbHR1QTdB?=
 =?utf-8?B?SWFWN1VabW5wa21jbFJQZFdvOEVLeENIQmRiNTJFM3dLc1l5andFd1ZQM1BV?=
 =?utf-8?B?WDJBaWFpYmJvQzhWd3diK0NOT3RjSU1ISjRncEwvV0IzR0tETWM2cjZTd1py?=
 =?utf-8?B?TEFKL3g5U1dYaUdPU0tIUkhjdjh3a3IyVXg5S0VZV09id0x3eERjYm5Sczgy?=
 =?utf-8?B?TkQ2SjRjcGVML1BwL29DUHhCRGpHQXpWeEswRjVaVG9qbEtqbUlObzEramdq?=
 =?utf-8?Q?HlFRkdhb4N/58l3bUbYEGY2quNLT1baj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzdvV2ZybXNDYVEzZkNpNGJzSWxOMjR4ZWhvdWlHOXRQaGUwM3dOdEY0VHRJ?=
 =?utf-8?B?NWdBdU1hMHptSGVVb2xLVkt5bC9CNi9mU084d2J6TGh6K2VsbzdZR2NGY21p?=
 =?utf-8?B?cWpPRGt3aU52Tm13bnZBaUx5K29VSjhxOTJpK3lPY0hrcEZ4Y2duM1ZDWjhY?=
 =?utf-8?B?dWlZSnE1TCtvRk5VMThPTVA0VnlMdERra1pyU2EvQVFDaGdjRmliaXdnYmVV?=
 =?utf-8?B?QTNRNzNQSGZubGVveEhkd09MLzZBeHYzUWQ4dmtpTThWZ1lkK1NhU2xjdExY?=
 =?utf-8?B?cHUwUUdMUlNCWmtDQUJRaHQxUkQwaDExakwxSTE4eVZOcitWTDFscFVvZTl1?=
 =?utf-8?B?enpYeDFKTUtkZzFYcXdHdk5wbVdwQklLbWw4cFNIS1YwWkVIK3Y5Yi84SlIz?=
 =?utf-8?B?ZHNFWFNzMWhwVjlnVW1kdnQyWHlaUjdnN1NzTU9JaGErNWwzblJpTjk0Wlli?=
 =?utf-8?B?THR2Z05BV2NuRnUzMVVyZFlrdkU2UVRlblBuQk5vNFNrZk5qd2VsbW5Ud0Nu?=
 =?utf-8?B?WG9HZXhhRWl4VVV4cjltbDJMcFR3QmV5cEQzdlNaang1M0srQnpoNDF0ZEpP?=
 =?utf-8?B?VURjVFJWYTFOQ28xVUJ0ZUtzYU9sTVRVNW1BaHFuSTRvbkVIZVh1UWxSMytD?=
 =?utf-8?B?K21qQWxTYTR1RjJGNHphUjI4STBlcGtqLzk5SDRiMjMxL0ZmcFgybUhzZ3lw?=
 =?utf-8?B?aEVnbml0UG1FVXdDdG9aWVNGZndCRlhxcEQ4VU51ZEQ1dTFKaEVDL092ams5?=
 =?utf-8?B?Z2tnM0lBVERQa2VQOU5OZnpnV0ZnZ2JWNEdsbnFIUDVpVS9UOWxkdnVhM05V?=
 =?utf-8?B?dkQ2em1JeGpsUG4xTDhuUi9oenVPbmFUV2dGSEtSRDI1dE1YZERqTWo5MW4r?=
 =?utf-8?B?K1NRTmp5U056VzNUbFRrWU9PNzUxTmtSMWI1aW1ZQmY3YWJlTzRrdXhWdnpG?=
 =?utf-8?B?alFaZ2FvSVdHNGdVR0Ezdmk4SFJzS3JMZjMzTzN3NVE0blNZUWdBSFE5aWlU?=
 =?utf-8?B?Q09vNlN0aWNWa0xhWngzeC9zbFloUTkrU2QwZ2tDVnNmcmZDNmQ4RDNUUnlO?=
 =?utf-8?B?b3llL0pYZUUyRjR2RjBqWU1oK2REblVwSmJWNXlNRWhVK0pVTWJZWEJZNXZC?=
 =?utf-8?B?d1RQaStQOXBtMDlORkJIOFBPaVI4VVhud005aWc2U0tBSnlLVWp6VnZlbFAv?=
 =?utf-8?B?WGhBVEMyanZTZGpXSFp4ZDJGZ3VEZUJSWDJNYUdkMWpmVXBkaWNldFhaNGxt?=
 =?utf-8?B?UERYVDVCU3lsYTZxVFpDdlRFQWZVekpKa0dpaHlvdkdsTEQvRkNXSlVGbER5?=
 =?utf-8?B?QklxZDdsZ1BNM1JRazFNQXFnZTYvQXpaSDU3UU1QNG1tZnQ3QTJ2OHdsR3FI?=
 =?utf-8?B?RU5paWhRd1FYdVQrVmdaODY0V2l5NXBxODlFdzZmVmF5bXdGVHMxaHFad0I4?=
 =?utf-8?B?aFc2ODJDdjYrWkJZRndMRnhscE1PWGlSNTRLMWRNYXlKSkRUNGt6YUpUdCsr?=
 =?utf-8?B?S0laaitwQkUrQXpXRFBJMkJHNzhxVWhPdTBtSUQ4TnE1N3JGZ1JCRG5jb1B0?=
 =?utf-8?B?Q3RQeUcvR2VRelVmcWFLQmNSL0gzVE1saEs2RTRjalRHb2pUdWo3N0d5UWpT?=
 =?utf-8?B?L2R1UC9IYklQZkN0Z1VEWnEyeDJtVnA4a0Z6SDNOV3grS2FEd2xZRU9iVTRG?=
 =?utf-8?B?czl4ODdJK2xQZ1J6Rmd6WktLU1VZQ3ZyL1NOK2VUak10ci9wN2FaRWk5Wjhm?=
 =?utf-8?B?djV2bzZUc3FaZmVpTEZvbE5vWEplN2xkajFhUCtjOWRPdXRLMnJMMTlJYUw5?=
 =?utf-8?B?eFVnN1NaNXE0c1FJdjdVVkkvaTE3ZDZDNXhNQjVnVEE0NEphdlM0K3c0S1NL?=
 =?utf-8?B?UmdxOGoxakZ3Vm1XWnhiVWpaZGt5N3IrRHNzL1FZVS8wWnh0K1c4d096Nnl2?=
 =?utf-8?B?bFJGR2l3a2RjR3QxZXBpZnhQOEVLYlJnUFhRbzh4Y1VBd1I1UzhvRFo4SGEr?=
 =?utf-8?B?KzBjUlRZeEVVTjdML3hxSHlSUUdTV1hEY1hzM0xlOGpiUGpxcWlKdGRodE9S?=
 =?utf-8?B?ZU1EdlVPeWFEZk4wak1FbnpiR2NzSUxoY2I4TnRDVTVXZE9oc21XZHpmdGFV?=
 =?utf-8?B?aUFMeHc3YzhkME5XL0wwYTlTS1BCT1FYQ2tXOElBQzZvTVRKcVhGdlp1RmJY?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fcb3c0-a48a-42e3-ca6f-08de22e0bcc6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 18:16:17.1622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cky7z9GZwOQyahCXxOJPiEW462xim1DXK90Mp+y1Xor/+Ugsp70z1mwoM+4chmYVtH3ux1dVUeu0nGOOa/s9Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7878
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

Quoting Matt Roper (2025-11-10 20:20:46-03:00)
>Use scope-based handling of runtime PM in the kunit tests for
>consistency with other parts of the driver.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_bo.c      | 10 ++--------
> drivers/gpu/drm/xe/tests/xe_dma_buf.c |  3 +--
> drivers/gpu/drm/xe/tests/xe_migrate.c | 10 ++--------
> drivers/gpu/drm/xe/tests/xe_mocs.c    | 10 ++--------
> 4 files changed, 7 insertions(+), 26 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/x=
e_bo.c
>index 2294cf89f3e1..2278e589a493 100644
>--- a/drivers/gpu/drm/xe/tests/xe_bo.c
>+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>@@ -185,8 +185,7 @@ static int ccs_test_run_device(struct xe_device *xe)
>                 return 0;
>         }
>=20
>-        xe_pm_runtime_get(xe);
>-
>+        guard(xe_pm_runtime)(xe);
>         for_each_tile(tile, xe, id) {
>                 /* For igfx run only for primary tile */
>                 if (!IS_DGFX(xe) && id > 0)
>@@ -194,8 +193,6 @@ static int ccs_test_run_device(struct xe_device *xe)
>                 ccs_test_run_tile(xe, tile, test);
>         }
>=20
>-        xe_pm_runtime_put(xe);
>-
>         return 0;
> }
>=20
>@@ -356,13 +353,10 @@ static int evict_test_run_device(struct xe_device *x=
e)
>                 return 0;
>         }
>=20
>-        xe_pm_runtime_get(xe);
>-
>+        guard(xe_pm_runtime)(xe);
>         for_each_tile(tile, xe, id)
>                 evict_test_run_tile(xe, tile, test);
>=20
>-        xe_pm_runtime_put(xe);
>-
>         return 0;
> }
>=20
>diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/te=
sts/xe_dma_buf.c
>index 5df98de5ba3c..954b6b911ea0 100644
>--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>@@ -266,7 +266,7 @@ static int dma_buf_run_device(struct xe_device *xe)
>         const struct dma_buf_test_params *params;
>         struct kunit *test =3D kunit_get_current_test();
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         for (params =3D test_params; params->mem_mask; ++params) {
>                 struct dma_buf_test_params p =3D *params;
>=20
>@@ -274,7 +274,6 @@ static int dma_buf_run_device(struct xe_device *xe)
>                 test->priv =3D &p;
>                 xe_test_dmabuf_import_same_driver(xe);
>         }
>-        xe_pm_runtime_put(xe);
>=20
>         /* A non-zero return would halt iteration over driver devices */
>         return 0;
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/te=
sts/xe_migrate.c
>index 5904d658d1f2..34e2f0f4631f 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>@@ -344,8 +344,7 @@ static int migrate_test_run_device(struct xe_device *x=
e)
>         struct xe_tile *tile;
>         int id;
>=20
>-        xe_pm_runtime_get(xe);
>-
>+        guard(xe_pm_runtime)(xe);
>         for_each_tile(tile, xe, id) {
>                 struct xe_migrate *m =3D tile->migrate;
>                 struct drm_exec *exec =3D XE_VALIDATION_OPT_OUT;
>@@ -356,8 +355,6 @@ static int migrate_test_run_device(struct xe_device *x=
e)
>                 xe_vm_unlock(m->q->vm);
>         }
>=20
>-        xe_pm_runtime_put(xe);
>-
>         return 0;
> }
>=20
>@@ -759,13 +756,10 @@ static int validate_ccs_test_run_device(struct xe_de=
vice *xe)
>                 return 0;
>         }
>=20
>-        xe_pm_runtime_get(xe);
>-
>+        guard(xe_pm_runtime)(xe);
>         for_each_tile(tile, xe, id)
>                 validate_ccs_test_run_tile(xe, tile, test);
>=20
>-        xe_pm_runtime_put(xe);
>-
>         return 0;
> }
>=20
>diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests=
/xe_mocs.c
>index 53a0c9c49f85..28cebbe4baed 100644
>--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
>@@ -115,8 +115,7 @@ static int mocs_kernel_test_run_device(struct xe_devic=
e *xe)
>         unsigned int flags;
>         int id;
>=20
>-        xe_pm_runtime_get(xe);
>-
>+        guard(xe_pm_runtime)(xe);
>         for_each_gt(gt, xe, id) {
>                 flags =3D live_mocs_init(&mocs, gt);
>                 if (flags & HAS_GLOBAL_MOCS)
>@@ -125,8 +124,6 @@ static int mocs_kernel_test_run_device(struct xe_devic=
e *xe)
>                         read_l3cc_table(gt, &mocs.table);
>         }
>=20
>-        xe_pm_runtime_put(xe);
>-
>         return 0;
> }
>=20
>@@ -150,8 +147,7 @@ static int mocs_reset_test_run_device(struct xe_device=
 *xe)
>         int id;
>         struct kunit *test =3D kunit_get_current_test();
>=20
>-        xe_pm_runtime_get(xe);
>-
>+        guard(xe_pm_runtime)(xe);
>         for_each_gt(gt, xe, id) {
>                 flags =3D live_mocs_init(&mocs, gt);
>                 kunit_info(test, "mocs_reset_test before reset\n");
>@@ -169,8 +165,6 @@ static int mocs_reset_test_run_device(struct xe_device=
 *xe)
>                         read_l3cc_table(gt, &mocs.table);
>         }
>=20
>-        xe_pm_runtime_put(xe);
>-
>         return 0;
> }
>=20
>--=20
>2.51.1
>
