Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5E5C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 16:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1F910EA2A;
	Fri, 13 Jun 2025 16:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOZcY8Vo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43A410E013
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749831619; x=1781367619;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OjZGmUnm5FNjyWcZx57joMJGslhPySAiKGNgkzLb2oc=;
 b=ZOZcY8VoUhdTC5DtVrirGwxIUk4g3fER418UtHBxP/cypr4oaVv2a3HG
 KOPcjlnJEToa1c6HvcP9LgrLVNGD4Xlu2OpfvJEv8yZsr4yrhkUtV04ZT
 bswLRTZFDXb6eBdOpVAGygWTFhbfSI2W6/oZXV+7cpEcaFX3/lXYP4w3g
 EuD/g8x89CLjf/PaK6R08XlNZQD7kv6wG957f+7F8/yr8ZlvkbU7Z43kX
 s9zABmDcpCXwd8ByUFlZAj/wWTj5F0cCbOAf8qV5ju/ZaHaIk8fTrOfyz
 XjwLxDjY86VPhCCbpjMHMLyyiCrPxXEfa6Ez6/Por64YwMwL+A9b3LB8p Q==;
X-CSE-ConnectionGUID: 59Jgs2CSSumngCOFC5a3Iw==
X-CSE-MsgGUID: 2Eglo5CuTm23lKxmEeMJgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52149362"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="52149362"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:20:18 -0700
X-CSE-ConnectionGUID: 8qLFvWMPTPaA4ARvw/SUAw==
X-CSE-MsgGUID: ViaAAV/eRD2gN9Q1JlJf8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="147859601"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:20:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:20:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 09:20:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:20:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tt0xOTPwnKW1aJHWWPnHWA8eSqk4q/R+uwYVn4o+RBZLls17THpEGPnILlFPDssqyOPqWtfovbyFyi90PiiPP8psWuNBSTQbAnkAqZjprjTFMSQn1Yo8iPioxbr+4lpSb6o63uOtMsPspRAplven19oJotAzO3Qq40Xr4b8+bsD2aQ8ILs+f7ix5bjtpeBM9XIT1dD2iL6y8J5gkhgMCwJgxACJ9UUujJReEdldLXQyJSHGIC7niDnnOPg4sfgdghdZQiirOJ1dEDReu+/4fe6IM1xP9wS0Vqf9zwDVtHmwKNnieWwQFW5jhprc3w8IVZnPlJKyKuJCXZQP+ARuX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXGn4RCnO80ErblpoF3jnEuxd+y5i389TqYzGefkxNc=;
 b=QyR8rweDfGzzqluKBOwxZUM/KNEbeJQcDJt5hrxr8hkVfYhvYqIlpqq1jKlFm7RHqsdZyCAxy5vK8Mgm+uJgPpJjA1tL55eZXX0RVbgg29/rDJmSfxAWKqVhzbzdYSfIE8A3fSqIFn7Ij4ZGMCeifjWm9YqPSTgRkdMeBHPON2FMnMkA5fTsDjbMVv2xMCdXDF3KpA/KLArbCtHjvQXNbjU0kQ8PLKBkysTq95ysQpvhrjZoqSa2oKZRt0BqkcQNEn/CxvXqOz0BYsAaEobIInMFZiLTLfWHM4uIO+fhzlDVcOD27ua/urTf3VVaePL/O0Jub8W8W98ZA6bvxmpq7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4919.namprd11.prod.outlook.com (2603:10b6:510:34::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 16:20:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 16:20:00 +0000
Date: Fri, 13 Jun 2025 09:21:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
Message-ID: <aExQEKec1H7yqS1I@lstrano-desk.jf.intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
 <cb53d2efe677724fd5d141d8f3cada5f06758adb.camel@linux.intel.com>
 <aEsKU2LliY6JmG6a@lstrano-desk.jf.intel.com>
 <eb5531f03ee560a593f77f60ae1f6f862eea6a14.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb5531f03ee560a593f77f60ae1f6f862eea6a14.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:303:8f::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: 2daf782f-6dc3-4223-06f3-08ddaa96252e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEZBZmhxRnRFbVRIV0M5akZTRjhRSjU3NWtpOUV6bUhWalQ2TFBhYjMyU2g0?=
 =?utf-8?B?WnQ3dGZFOGJKcDFjMkM5bENrVWhuZGJGOWI2Y2h4Y3h3ZEg0aHh6MDdZZWpP?=
 =?utf-8?B?Y28xZDZ5WEtjbHJ4ZC9ncDNnM25RY0QvT29xOHpXUU9Lc3ZNemMwMVB1azYv?=
 =?utf-8?B?VVBmcm9MUDVNdzBMYUoyOFF5TUtsd0lMU2EyaWJRcDhDRWlsUFRMNG9VNGRm?=
 =?utf-8?B?b293SGh5S3dNbVpUcklObmdwdmd4SU1ZOTNhNFRHK3hKYmkwYXp0VTdYZEpW?=
 =?utf-8?B?SDA1VHQ5eWRiUmVXTWN4TWczZ0FQWFAyUVJkYWVMdHd0NDE0bGFOWngza3lw?=
 =?utf-8?B?SWVPY1NMSGt3ZmVqV1htL1FtdXpaYUlaei9pNUw0U2kwTm5GMVd1OHRlLys4?=
 =?utf-8?B?UVZvMzQ2UWpYeUNtaVdiYk5sYXIrNTBPeTZOOFN5Y3hJTU9BTnRLZnB2cUJB?=
 =?utf-8?B?V1o4b1hnVU9DZXEvU0I1ZmVxZ0R0NWY2TkhPbExtcUhCT0xRdDJVNlp2ZTA3?=
 =?utf-8?B?MFFlVlNQNGFsK3BjR1p2bnR1YVFTb0JReG84Ny9aMy80NHhGUDY4dktKZ3pk?=
 =?utf-8?B?bEpaTnl5VllWMEh3WVB1MzY5NTdtTEI2emMycUVEcmJEVnJwM2ZLVWdvYjlN?=
 =?utf-8?B?cjVWUzJVL2sxUmpmTG1CVW9hYnlocUVDT2tyK1hmanQ1OXRzQzJhdmlCNDNk?=
 =?utf-8?B?bFpoYVJQbTlvY0l2cGRoMnV2VW55d0tjd2xBcXV6RnY4ZGdSQUlrdHJiSnow?=
 =?utf-8?B?b1FBS0E1VDFIdWhPWjlDN1Zkbkh5NXBqQW1nUWtoZ3ZTbUpGYzluUXZVYmxx?=
 =?utf-8?B?VzFhK3orQjVlTEpCaTBRN0p2dXFYWTR5RXYyQXJDTytDdjhSaEsrZnBRY0Fj?=
 =?utf-8?B?S1Z6TW5lSVFuRVR2V3R0QndmWnVPYVFPb1BWQ1doYUdxOFdpcVZqVGtvSVV3?=
 =?utf-8?B?Q3J5eTFzWmtCbnkyS0hJaHZPYXQ5WENvV2hjVFdaRWpaQU9Bdk4wajBUZEhn?=
 =?utf-8?B?SkFuL0VESjN2VS8rWWdGVWpNTUpsVDViQ1dFQzlRaWNma1gySHhicXJ0eDhK?=
 =?utf-8?B?M21yREVlQkdVaENEV0Z3WkIwOE9UMmpjZzZUejdxM3FlT3dDVHF3dUU4S0Vm?=
 =?utf-8?B?MEJpdjl5KzhoSVYzcWRnbmlKNS9EZ0ZLeWEvZGZoVkhhR3p1aDlRTnk1a1JI?=
 =?utf-8?B?ZTB4dzZsc2NyYXRlQjlwMHdYZ0oyazUxUGxKNDV0bFNBWm54UER2YTlwNkhz?=
 =?utf-8?B?dHZJa01SekhGYllXTndWaWQraHNndExlVDJZTEoyaHQrd2R3MFhzS3hUcHBC?=
 =?utf-8?B?K2NuZVYvSmJLMzJ3akNhRFB5RllPZjJDSVVQb0lyWUMvVzJXWWdPeUhXcHRu?=
 =?utf-8?B?RUErSGxlbDd1RzZRTG9WR0puYVRVQzExbUlmYk5zcnVEdWE1aFBtZlMvTHoz?=
 =?utf-8?B?SU8yMmFZeGdrOU9sSVFkeno0aGxQU3ZaQ0xNNElIY0w1NFNBd3VyS2J3STZ1?=
 =?utf-8?B?QTEwYXhOODc1QS9lL3dIOERpZSs2akxXb1N5RjZhQzAzcjEwZFI3MmEzdXFO?=
 =?utf-8?B?T1VPaUwrRlZ6R2R2VzB4TGpFQmtzSCtEQW12Z1VoMWxydWhyLzhwTkdTbFdl?=
 =?utf-8?B?T1JrQ3ZWa2F6TjcwVXdiWjA5ejNEaDU5eUMyQ3ZXaTdrd0ttM2sxOFFHYXBl?=
 =?utf-8?B?V2VvNEpnMTMzam9ZMUxTZTBmTmY2Z2k1RG9mR2xBWkRJUEtncmdSUzNkUnlp?=
 =?utf-8?B?b0VuVlZrdHk2R3pIKytvSENMN0U3TFo0cGU3bU1kM3E5dDFrWSs4VElJU1Nn?=
 =?utf-8?B?K3l4SG1mQUtNN2RjeVNYT3FRVXRLaDNLb1FCV3NvaHUyYm5tdThqUGhFcWls?=
 =?utf-8?B?bHFqN3lMZG1jUW5sU21CZEhINFJnVEsvck50N2gyak82anNjK3ByWUpWNmli?=
 =?utf-8?Q?leo0QFI9Wls=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGU4QWpyVTVXN1FKTHRzSk0yTzh4R3VhQ3dJeVNNNUc2QUhuVHpPa1p5UlBn?=
 =?utf-8?B?ckhJWDhxUzlpTTlHMGVNS3Z4MDVTcW51aFFMTnliSmdLTG5EQzN0K0ZWK0Er?=
 =?utf-8?B?SXdwVnJQbVppOWg5alp1MFUwUkFIWis2cnJYZUI4dGdVazR3NHA2ZytpWEww?=
 =?utf-8?B?Z0pOMU9yeEFaMHhFMkZweWlVeXlkbWR5djd1NE9jL2FUMG8wWm5NOGxRM0ww?=
 =?utf-8?B?YzZjYStuRGtxK3g1NnFnMHVnZXRicDNrRHJJMTluajJHNzRPaVZmNXllUjcz?=
 =?utf-8?B?Y1Q5MzBNdlRTM0EzMkhoZC9CcWdPQXFhc0o0RmxrZEdLc1REK1FRYWtCQkhj?=
 =?utf-8?B?V2twZDNBem9aR3BYM3FXSHRIT0N0dlEwUG9Db3hsb0hyL2JsTjdoTU91MWNt?=
 =?utf-8?B?SVlHT21OZ0ZCVE9JY0tVdHU5NHR2UmNpa0FzZjV6cUk2T2MvNUNlRkw1eXEw?=
 =?utf-8?B?L015dmVBRXRzdVBVT0V3M2QzU3MralRDdWhUNzc2MXl2eGFacGVPWEQwTHZ4?=
 =?utf-8?B?UHFzNkUwb0ZMamI5UW02N2lTYmF3bHVjUGNTa0lTVXZZTVk1N2xVVTlxZnRm?=
 =?utf-8?B?ZGk2Z0xIR3hMSnRKYVh5Z1l5OG0wZ2pBQWgwRlBudmRyMlBndXNpVGMrbnMv?=
 =?utf-8?B?dDZRWXV5TElKNzg1eG5KVVRkTWlTcHVzZUxYUHdVc0V1YlN6RElvUnJhSjJn?=
 =?utf-8?B?a003Rnd1cDB1bGVkVjBsN2xpa2FhUURlOEFWU2dib3JuV1FoZWYrcU1iRmVL?=
 =?utf-8?B?c21OMWoxbkFXVENJVlFBb3FlWlVMTFVnQ1J6c210M2JoNHZaNXM5Nm8wanJ0?=
 =?utf-8?B?dkxEcVdVV1FudHRwYUdJZzV5TDMyeVhuL1JBNXdjWnloUitNZnVpQ2J5ZGRO?=
 =?utf-8?B?QnVEaUlwNFMxNFUwRFFvalJwcmpGanlGOFAzaFBpTFFuayt4bVQxYTNqaFFU?=
 =?utf-8?B?ZlRldnhMVngzdW5EelljWlIzeUpmTk02NjBFTGRVNGNzVGNSZVk0bFNkcW1S?=
 =?utf-8?B?SVMvNHM3NlVMb1RTOUlJYkZGTDBHYlRkSFFxeC9rNmU3YTZ1eWFuVTlrSVBk?=
 =?utf-8?B?L2RXMkh1Z2RCT2NaTW96VDZXa1E4b2Rxd2FmdjNIUm52QVVOSjF4azZMVlFx?=
 =?utf-8?B?UVNZVkdUaW91Mi81cFVxQXV0dkRmUlg3ajU0NWdRL01PZ3RzRit5a3daNlVu?=
 =?utf-8?B?bkN5T0ZnY1lXbExLUTQwRS9DYlgzY1VDd3VqZ0NETjNhUDc0Rk9RUlNBQ05v?=
 =?utf-8?B?TUxZbElQSWFNazZmRi9RR1d2UzlveDdzSWVqRGJRQ3pEVUFVbXpkOFRBclpB?=
 =?utf-8?B?bTRESHAzNUp0SXU1RkQ3UVM1R1ZzTnpxeTNoUDIvbXBVRVR5UENIT3l4NFZZ?=
 =?utf-8?B?TXhoTk9zekJreFFYaDJQTXlMQVNZb3VFNVBTeWxXSlcxUGZ0eFZYTW5OQnNj?=
 =?utf-8?B?RGVPY2dsdGJGZEJmWVhmQkw1QmlHU2UxZDFLZFVCckdueTR2dmI3aWFyOHg2?=
 =?utf-8?B?M1o0MmYyWWJqTzNmUHlmamZFS0ZFZEVRUXhXaHp5REwvT3NEU253dTlxcWk4?=
 =?utf-8?B?WFUzN1l0TXVtM1ZyL2FvN1g0VW5NSXVubTg1Y1NHWW9IdGJtUGg3N1NTRE16?=
 =?utf-8?B?VWUrbG1QZ2hiK3l3elV5S2FtQ0pZMkZhVXRJYmUyenNFc1kzS2l0RDBWa1A5?=
 =?utf-8?B?a2tWbURwSm1OWC83QTVBeDIvMUphOFZwd0NWOU5yYnNBQmdBZmg2N0kzcmdP?=
 =?utf-8?B?ZWUrTzZyQm44RWdXdC9Dd0trMDRWbWlJa2NHNDlPelRKWjJBdE5GZlJxWXNa?=
 =?utf-8?B?ZWViV2E4eC9XOWlXQ1NKMXNTdk8ybG5sWHdPODRGUFQyQ1pvQzhEOTJjeTJS?=
 =?utf-8?B?d3dzVm0zZER6SXYvWVNrM2kzdU1ubmJ0VUdRWk1yNHRpRUZGdyt0dkk3b2tF?=
 =?utf-8?B?blIwNldYK0FjM2ZnYVBwUGFpenZOTzhiZGdRcmlyMHdoWkxRK2w0Q1FIL1NP?=
 =?utf-8?B?VGRWcklkeHIzQnl0Tzg3dDhvNVVoUnBEVDZsWkhQTXFiejZmMVFTMUpHTDJK?=
 =?utf-8?B?Q2VZN3JlLytsdldmN1VvRG5XUjJJWDdtaFcyZm5zdWI5a3c3NHE0Vis0dnV5?=
 =?utf-8?B?YkFtc1VhS1JMMGx0Q2VsUGEyT0dTaENIb0hoYS9VbEljU0lvSHBFUVh6R3lB?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2daf782f-6dc3-4223-06f3-08ddaa96252e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 16:20:00.3827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2rpsyogqFLvBk8EZv3qQhJxlte9j5Fco5C9JJ502nzum3LF+ehCiOAbk6YpkaF2NoIjyLDY+WURuYIufWdVbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4919
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

On Fri, Jun 13, 2025 at 10:07:17AM +0200, Thomas Hellström wrote:
> On Thu, 2025-06-12 at 10:11 -0700, Matthew Brost wrote:
> > On Thu, Jun 12, 2025 at 02:53:16PM +0200, Thomas Hellström wrote:
> > > On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost wrote:
> > > > Clearing on free should hide latency of BO clears on new user BO
> > > > allocations.
> > > > 
> > > > Implemented via calling xe_migrate_clear in release notify and
> > > > updating
> > > > iterator in xe_migrate_clear to skip cleared buddy blocks. Only
> > > > user
> > > > BOs
> > > > cleared in release notify as kernel BOs could still be in use
> > > > (e.g.,
> > > > PT
> > > > BOs need to wait for dma-resv to be idle).
> > > 
> > > Wouldn't it be fully possible for a user to do (deep pipelining 3d
> > > case)
> > > 
> > > create_bo();
> > > map_write_unmap_bo();
> > > bind_bo();
> > > submit_job_touching_bo();
> > > unbind_bo();
> > > free_bo();
> > > 
> > > Where the free_bo and release_notify() is called long before the
> > > job we
> > > submitted even started?
> > > 
> > > So that would mean the clear needs to await any previous fences,
> > > and
> > > that dependency addition seems to have been removed from
> > > xe_migrate_clear.
> > > 
> > 
> > I think we are actually ok here. xe_vma_destroy is called on unbind
> > with
> > the out fence from the bind IOCTL, so we don't get to
> > xe_vma_destroy_late until that fence signals, and xe_vma_destroy_late
> > (possibly) does the final BO put. Whether this follow makes sense is
> > a
> > bit questable - this was very early code I wrote in Xe and if I
> > rewrote
> > today I suspect it would look different.
> 
> Hmm, yeah you're right. So the unbind kernel fence should indeed be
> last fence we need to wait for here.
> 

It should actually be signaled too. I think we could avoid any dma-resv
wait in this case. Kernel operations are typically (maybe always) on the
migration queue, though, so we’d be waiting on those operations via
queue ordering anyway.

> > 
> > We could make this 'safer' by waiting on DMA_RESV_USAGE_BOOKKEEP in
> > xe_migrate_clear for calls from release notify but for private to VM
> > BO's we'd risk the clear getting stuck behind newly submitted (i.e.,
> > submitted after the unbind) exec IOCTLs or binds.
> 
> Yeah, although at this point the individualization has already taken
> place, so at least there should be no starving, since the only
> unnecessary waits would be for execs submitted between the unbind and
> the individualization. So doable but leave it up to you.
> 

The individualization is done by the final put-likely assuming the BO is
closed and unmapped in user space—in the worker mentioned above. If an
exec or bind IOCTL is issued in the interim, we’d be waiting on those.

> > > Another side-effect I think this will have is that bos that are
> > > deleted
> > > are not subject to asynchronous evicton. I think if this bo is hit
> > > during lru walk and clearing, TTM will just sync wait for it to
> > > become
> > > idle and then free the memory. I think the reason that could not be
> > > fixed in TTM is that TTM needs for all resource manager fences to
> > > be
> > > ordered, but if a check for ordered fences which I think requires
> > > here
> > > that the eviction exec_queue is the same as the clearing one, that
> > > could be fixed in TTM.
> > > 
> > 
> > I think async eviction is still controlled by no_wait_gpu, right? See
> > ttm_bo_wait_ctx, if a deleted BO is found and no_wait_gpu is clear
> > the
> > eviction process moves on, right? So the exec IOCTL can still be
> > pipelined albeit not with deleted BOs that have pending clears. We
> > also
> > clear no_wait_gpu in Xe FWIW.
> 
> Yes this is a rather complex problem further complicated by the fact
> that since we can in wait for fences under dma_resv locks, for a true
> no_wait_gpu exec to succeed, we're only allowed to do dma_resv_trylock.
> 
> Better to try to fix this in TTM rather than try to worry too much
> about it here.
> 

+1.

> > 
> > > Otherwise, this could also cause newly introduced sync waits in the
> > > exec() and vm_bind paths where we previously performed eviction and
> > > the
> > > subsequent clearing async.
> > > 
> > > Some additional stuff below:
> > > 
> > > 
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_bo.c           | 47
> > > > ++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++---
> > > >  drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> > > >  drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
> > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> > > >  6 files changed, 94 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 4e39188a021a..74470f4d418d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1434,6 +1434,51 @@ static bool
> > > > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
> > > >  	return locked;
> > > >  }
> > > >  
> > > > +static void xe_ttm_bo_release_clear(struct ttm_buffer_object
> > > > *ttm_bo)
> > > > +{
> > > > +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> > > > +	struct dma_fence *fence;
> > > > +	int err, idx;
> > > > +
> > > > +	xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > > > +
> > > > +	if (ttm_bo->type != ttm_bo_type_device)
> > > > +		return;
> > > > +
> > > > +	if (xe_device_wedged(xe))
> > > > +		return;
> > > > +
> > > > +	if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo-
> > > > >resource-
> > > > > mem_type))
> > > > +		return;
> > > > +
> > > > +	if (!drm_dev_enter(&xe->drm, &idx))
> > > > +		return;
> > > > +
> > > > +	if (!xe_pm_runtime_get_if_active(xe))
> > > > +		goto unbind;
> > > > +
> > > > +	err = dma_resv_reserve_fences(&ttm_bo->base._resv, 1);
> > > > +	if (err)
> > > > +		goto put_pm;
> > > > +
> > > > +	fence = xe_migrate_clear(mem_type_to_migrate(xe, ttm_bo-
> > > > > resource->mem_type),
> > > > +				 ttm_to_xe_bo(ttm_bo), ttm_bo-
> > > > > resource,
> > > 
> > > We should be very careful with passing the xe_bo part here because
> > > the
> > > gem refcount is currently zero. So that any caller deeper down in
> > > the
> > > call chain might try to do an xe_bo_get() and blow up.
> > > 
> > > Ideally we'd make xe_migrate_clear() operate only on the ttm_bo for
> > > this to be safe.
> > > 
> > 
> > It looks like bo->size and xe_bo_sg are the two uses of an Xe BO in
> > xe_migrate_clear(). Let me see if I can refactor the arguments to
> > avoid
> > these + add some kernel doc.
> 
> Thanks,
> Thomas
>

So I'll just respin the next rev with a refactor xe_migrate_clear
arguments.

Matt

> 
> > 
> > Matt
> > 
> > > /Thomas
> > > 
> > > 
> > > > +				 XE_MIGRATE_CLEAR_FLAG_FULL |
> > > > +				 XE_MIGRATE_CLEAR_NON_DIRTY);
> > > > +	if (XE_WARN_ON(IS_ERR(fence)))
> > > > +		goto put_pm;
> > > > +
> > > > +	xe_ttm_vram_mgr_resource_set_cleared(ttm_bo->resource);
> > > > +	dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > > > +			   DMA_RESV_USAGE_KERNEL);
> > > > +	dma_fence_put(fence);
> > > > +
> > > > +put_pm:
> > > > +	xe_pm_runtime_put(xe);
> > > > +unbind:
> > > > +	drm_dev_exit(idx);
> > > > +}
> > > > +
> > > >  static void xe_ttm_bo_release_notify(struct ttm_buffer_object
> > > > *ttm_bo)
> > > >  {
> > > >  	struct dma_resv_iter cursor;
> > > > @@ -1478,6 +1523,8 @@ static void xe_ttm_bo_release_notify(struct
> > > > ttm_buffer_object *ttm_bo)
> > > >  	}
> > > >  	dma_fence_put(replacement);
> > > >  
> > > > +	xe_ttm_bo_release_clear(ttm_bo);
> > > > +
> > > >  	dma_resv_unlock(ttm_bo->base.resv);
> > > >  }
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index 8f8e9fdfb2a8..39d7200cb366 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -1063,7 +1063,7 @@ struct dma_fence *xe_migrate_clear(struct
> > > > xe_migrate *m,
> > > >  	struct xe_gt *gt = m->tile->primary_gt;
> > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > >  	bool clear_only_system_ccs = false;
> > > > -	struct dma_fence *fence = NULL;
> > > > +	struct dma_fence *fence = dma_fence_get_stub();
> > > >  	u64 size = bo->size;
> > > >  	struct xe_res_cursor src_it;
> > > >  	struct ttm_resource *src = dst;
> > > > @@ -1075,10 +1075,13 @@ struct dma_fence *xe_migrate_clear(struct
> > > > xe_migrate *m,
> > > >  	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> > > >  		clear_only_system_ccs = true;
> > > >  
> > > > -	if (!clear_vram)
> > > > +	if (!clear_vram) {
> > > >  		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size,
> > > > &src_it);
> > > > -	else
> > > > +	} else {
> > > >  		xe_res_first(src, 0, bo->size, &src_it);
> > > > +		if (!(clear_flags & XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > +			size -= xe_res_next_dirty(&src_it);
> > > > +	}
> > > >  
> > > >  	while (size) {
> > > >  		u64 clear_L0_ofs;
> > > > @@ -1125,6 +1128,9 @@ struct dma_fence *xe_migrate_clear(struct
> > > > xe_migrate *m,
> > > >  			emit_pte(m, bb, clear_L0_pt, clear_vram,
> > > > clear_only_system_ccs,
> > > >  				 &src_it, clear_L0, dst);
> > > >  
> > > > +		if (clear_vram && !(clear_flags &
> > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > +			size -= xe_res_next_dirty(&src_it);
> > > > +
> > > >  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > > >  		update_idx = bb->len;
> > > >  
> > > > @@ -1146,7 +1152,7 @@ struct dma_fence *xe_migrate_clear(struct
> > > > xe_migrate *m,
> > > >  		}
> > > >  
> > > >  		xe_sched_job_add_migrate_flush(job,
> > > > flush_flags);
> > > > -		if (!fence) {
> > > > +		if (fence == dma_fence_get_stub()) {
> > > >  			/*
> > > >  			 * There can't be anything userspace
> > > > related
> > > > at this
> > > >  			 * point, so we just need to respect any
> > > > potential move
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > > index fb9839c1bae0..58a7b747ef11 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct
> > > > xe_migrate
> > > > *m, struct xe_bo *bo,
> > > >  
> > > >  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> > > >  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> > > > +#define XE_MIGRATE_CLEAR_NON_DIRTY		BIT(2)
> > > >  #define
> > > > XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA |
> > > > \
> > > >  					XE_MIGRATE_CLEAR_FLAG_CC
> > > > S_DA
> > > > TA)
> > > >  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > > > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > index d1a403cfb628..630082e809ba 100644
> > > > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > @@ -315,6 +315,32 @@ static inline void xe_res_next(struct
> > > > xe_res_cursor *cur, u64 size)
> > > >  	}
> > > >  }
> > > >  
> > > > +/**
> > > > + * xe_res_next_dirty - advance the cursor to next dirty buddy
> > > > block
> > > > + *
> > > > + * @cur: the cursor to advance
> > > > + *
> > > > + * Move the cursor until dirty buddy block is found.
> > > > + *
> > > > + * Return: Number of bytes cursor has been advanced
> > > > + */
> > > > +static inline u64 xe_res_next_dirty(struct xe_res_cursor *cur)
> > > > +{
> > > > +	struct drm_buddy_block *block = cur->node;
> > > > +	u64 bytes = 0;
> > > > +
> > > > +	XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > > > +		   cur->mem_type != XE_PL_VRAM1);
> > > > +
> > > > +	while (cur->remaining &&
> > > > drm_buddy_block_is_clear(block)) {
> > > > +		bytes += cur->size;
> > > > +		xe_res_next(cur, cur->size);
> > > > +		block = cur->node;
> > > > +	}
> > > > +
> > > > +	return bytes;
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_res_dma - return dma address of cursor at current position
> > > >   *
> > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > index 9e375a40aee9..120046941c1e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct
> > > > ttm_resource_manager *man,
> > > >  	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
> > > >  		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> > > >  
> > > > +	if (tbo->type == ttm_bo_type_device)
> > > > +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> > > > +
> > > >  	if (WARN_ON(!vres->base.size)) {
> > > >  		err = -EINVAL;
> > > >  		goto error_fini;
> > > > @@ -187,7 +190,7 @@ static void xe_ttm_vram_mgr_del(struct
> > > > ttm_resource_manager *man,
> > > >  	struct drm_buddy *mm = &mgr->mm;
> > > >  
> > > >  	mutex_lock(&mgr->lock);
> > > > -	drm_buddy_free_list(mm, &vres->blocks, 0);
> > > > +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> > > >  	mgr->visible_avail += vres->used_visible_size;
> > > >  	mutex_unlock(&mgr->lock);
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > index cc76050e376d..dfc0e6890b3c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct
> > > > ttm_resource
> > > > *res)
> > > >  	return container_of(res, struct
> > > > xe_ttm_vram_mgr_resource,
> > > > base);
> > > >  }
> > > >  
> > > > +static inline void
> > > > +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource *res)
> > > > +{
> > > > +	to_xe_ttm_vram_mgr_resource(res)->flags |=
> > > > DRM_BUDDY_CLEARED;
> > > > +}
> > > > +
> > > >  static inline struct xe_ttm_vram_mgr *
> > > >  to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> > > >  {
> > > 
> 
