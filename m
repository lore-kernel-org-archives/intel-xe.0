Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58FBC83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 16:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C4410E82F;
	Wed, 23 Jul 2025 16:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hklZQEHP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300AB10E82F
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753289721; x=1784825721;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RuiEt4qsaqjkzAbldbLSmskl1/dnebysv/1YpahSvqI=;
 b=hklZQEHPgtRpvv1NulpqbMiXY3+cdQ4ZEZNxxYO55tCMUwk0hMw+yJh2
 QtVJC7eogNSrjZFnRL0D6MkCrDGc73Y5IhZEDtod7h+URzo9pEfej74zE
 lE++TM65vMXbff8wG7SNxoecYLXcecKTvjw7IlEnOajR1+TBHxl7SraUE
 YIhbTpCyRgZIO8GZ5BKEVRhH6jDi0BjrDaD6dPbDEELfsbxCel6wbiZSa
 2WNhMvLsI7IhlGyKMg0tl9r23oCARzlEWw0H8hEEye5PQBPhRzV6UWfWd
 MZiFbGS25npeeeQEdgi7vFu0U90LSO9GlZx+jw+eWFmX4kJkxYcDMUPNJ w==;
X-CSE-ConnectionGUID: Wi++qtj/SwqqUOiL01VAhw==
X-CSE-MsgGUID: OtRGtoPITy+CtZ+plsolfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55460685"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55460685"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 09:55:20 -0700
X-CSE-ConnectionGUID: um8KEV55TH+UtvFDLl//iQ==
X-CSE-MsgGUID: ga1SlGpZTS+0sB+xghPNLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="160171660"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 09:55:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 09:55:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 09:55:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 09:55:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuRSyeUCktbyK4nPHr1wjWJgfQOcwgaA4YJwAylNadlElHgCEOjWpKA069sh8iGXn5dSzFxbKKv1TZF+l1ZIIKsReOfoAs3CssrlfVFzsvm0Ffge78zIOyFxSPtoJKaZNDd8YmdWyC8tJtnnPiL4IdUHnAutF8TpNoHbR8MO12xXo1OBqLFaK5XWTc4lKK4+dI6ob3X/TbBLZBIh1MkwJBcEjUBVk2JqyepGoGMNerc8jc32zKj00a1Yw3//aLpoG7YcYt7cYUHsR3zYcB9yad9H/UIcIfW8ra204AUGYUgk2LXGpHisijZE9eu6e6d7Xmuib+ust2swxhymePO2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOjjH4vJWz9knWk1cGyHq8x2KtM8zrIJSl0fpACtXO8=;
 b=NpUCXJAnSeCyw/XRV9wDz6rnWuM7jRvFafo/dlqr8Cuv4o9bvl06Y0encOJJJ6C64zWXWniid1nmm3Fwqj3CO3xX/znOcYWqkadSVNbT9hPr+LK7eS9CD8XreCIQt1KcyLKmXGNF17wqA73p2TySv3fVtkru09kulzcsGhWLd2sTuaAHs1UuYZCZrUYw3tOjG07G9ZmNqg6MU8AbB8cf7kNte8jZrjLxsMKu/bKHU+RcH6LlJ6mgbHz87t221Y94LPnQ9T0iJ3O2u70D6ObldiCn9OsPy0tvm3BWwSJheyY2YlkLyGT/J2y23NR23xVzZkj3BwbtBsm/0br11pdoQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH0PR11MB4854.namprd11.prod.outlook.com
 (2603:10b6:510:35::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Wed, 23 Jul
 2025 16:55:11 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8943.027; Wed, 23 Jul 2025
 16:55:11 +0000
Message-ID: <844a4adc-7dc3-4fd6-9d16-723901448f93@intel.com>
Date: Wed, 23 Jul 2025 22:25:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/23] drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory
 attribute
To: <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-14-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250722133526.3550547-14-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::14) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH0PR11MB4854:EE_
X-MS-Office365-Filtering-Correlation-Id: c59a6f8a-347b-46ab-2af7-08ddca09afc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzE2RnZLQ0hERlJBK1N5dGRmVGQvS05GK3kzcThWS29ZNVRlcHdDZTEyWkE4?=
 =?utf-8?B?Rkx3cnh3bHJaUzI5cjFEb3FZbW1rTU9jZXlEUGRrUGVDbGVSb1JDallQakU2?=
 =?utf-8?B?bjZVZ1ZBSG1hTjdZZWdBbWNFbWZUMStkeHJNYlI1eXdyc0xHRGlsVnM3Q2Rx?=
 =?utf-8?B?MEJwellBMlpNeU5BWk9qNGc1QVRUMnRCNG1jbGVMV2Vlb1hFWjRBMjlWdEUz?=
 =?utf-8?B?RTk0OEdBNW9ZVzdOajBDazdJR1c1b3RvN1VoT0t6TVpJZ1N5T2NVVVdDQlhN?=
 =?utf-8?B?NkE2V3AzYVVpWW5rZDlKN3lSUnZMU0VrV3dSN3BlNzFzdkRPUzc1c0ZOdWlu?=
 =?utf-8?B?bjVBV0dzSU5KYVZsTCtXUU1lQUw3ZTRML0dNYkxQYXI5RWRlbnFwMGNrOXJy?=
 =?utf-8?B?WFpSZ090MXJsU1BDcmhmS2tXKzB4bnFhQlB5dDZkNnBDMG8wR2FPTUNoaVg2?=
 =?utf-8?B?S3FYNTVtMUdrbGQ0aGYrSFViY1ExR2ZxUVQ4R0NRcWFxUzJqYXh1RE9EZ1p6?=
 =?utf-8?B?NEc2NXhOVmloaloyR1M2cXZaRmNQNk14TVozbFBPRitHb3labHZ5Nm0yQWdC?=
 =?utf-8?B?eDlocjdpSWtVdkw3MkV1NlRlckZaL3p3RVpscmoxN0xkNGdOUURlS0FxaHRk?=
 =?utf-8?B?ZGFWVHFBQVRmL0VteS9aTE82cmRDRURmY0tiNExlMWhjdEV3cVJyYTQrOUdn?=
 =?utf-8?B?a3kzOFhyTnY0cFliUFJ1blhwKzBFa1lUTERqL2dmTmZRRjhSSTZRUm5hYVBu?=
 =?utf-8?B?R1ZRZWdVczgwUDRiOUo0c2dLUnlUNFFxdFJVUDV1cnRNbkp0MUg1OXNvZFIx?=
 =?utf-8?B?cW1WU2NZMnRnQklRTDQ2YmdQcmNxcXB1bU5hbFpZMTlMVlJ0MUJDMzFBYWhy?=
 =?utf-8?B?NEljWDEvYnp5K0RnTGg1V3FiZ3p5SE5od1g2SWEzOGhkNzk1SDQ4Z1ArZlhR?=
 =?utf-8?B?NGlXbG00RFNKQlk4ajMzayswTFFHWWlzRVBwbW1BYm95MGZiMkhUZ2tYbVZP?=
 =?utf-8?B?YllId01Na3VITGpFcjd5elNDMlhrNjlkaGZzZ2ZCMFdlY25KSFBjbEk1VGg4?=
 =?utf-8?B?Z2YrdzhxbHdveHF5NGhzOUhPWmF1U1VCTTc5aHUvbTNwSm5qc2pzYzZrb0cz?=
 =?utf-8?B?UXJpajBna2c5bDJMYlBReHdJakpXVzdPMW5QS1ZVdjdhNENzbStYaFF3THAv?=
 =?utf-8?B?VHVSWFM0WE5na1VGczY3eXl0dnNVdk0wdTMzRytNVGlaWGx6THNpbGE2UlpL?=
 =?utf-8?B?SlRMcjUwcXlQd1JURVAwMW9FK0lCbzlGeDdUMlB5azdKTlFEemlGM3QyT2t0?=
 =?utf-8?B?RHhsNEQxblJsM3RVeGlSRCtIMTBsM1ZjV052NURCOWRWVXhvYzdRSW1wL3lm?=
 =?utf-8?B?NXZrTWZJOUxGQnF1M09tazdxWTE5R2JjRFYrZWZiNWNxc0YvcDZLVVhtc3pF?=
 =?utf-8?B?Z2diMHFkVENnRlF5SXczaVJwY1k4dE5rM2YzWE4vMHg0SWNTWlRoUXMwMG1N?=
 =?utf-8?B?cjNoUTQ3UGRYcGYvaEpkdllvM3ZxNlFObjV5YmxrTEl5cHBvemxDT21aME41?=
 =?utf-8?B?VXhTdHVXSHU0RkRqbVNoSHdxREI2Q0p2OFhKb3lLY0VmUERrQkx0M3ZRZ0NZ?=
 =?utf-8?B?TGdVRlROTnRLckxyNkpucVp5U1VjeTVsY0RIUHBhV3JyaEVmR3pvc25iYnFi?=
 =?utf-8?B?MkVkVXArOFp1cUg0ZzRlR0hWQVJrSjNKejlMTnhhK1FNb0tqUmdMSDdDZ0xS?=
 =?utf-8?B?M1FOUjFnazZmODNmUUk0Q1JuK21ULzdueUl1allWbFRiQStRL2Q4cUxWeEFN?=
 =?utf-8?B?M2JWRVBJQk5zUUJXNHR0N0VWMkRlTnZ6blhMUXBIbVdtRG9HR2plcnUyTjlM?=
 =?utf-8?B?TXJyRk9YTWF0a25aOUdBWW9VV2cyK0ticTBQUG9LNFRJTTRHRGVCVU5Fb2F5?=
 =?utf-8?Q?gLOuugf0YDk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUFnNGtkU2tUNE1xK2dQaTJ2S2F6YjZLU2w5ZXlnZERmaGhXUnhMTmdiTW9M?=
 =?utf-8?B?QjBNMU14MUcwQUVEMXFlRWlGSGw1REt5NTlFVTBlL3Rpd290bTA0ZmZpWER3?=
 =?utf-8?B?Lyt0bVlZWWFzZVllSVhqM0VGOWxNU1d5Z0RQWGwweG9JWCsweG5mczd5cDl0?=
 =?utf-8?B?OWxvRWF5bjU3MmtpMUdrc0VlbXpreEtXb1pCTmhVQlI2ajl5T0xvVWRvNkVs?=
 =?utf-8?B?bCs5dzlUVzFKYitEZFQ2bGV5VEZvTDc0L3lUNkl5aFIrNTVvZCtIRjRkK3c5?=
 =?utf-8?B?Tm81cUVJRStsMXNVWDZVak9hdFE0VVRZaE5lTVAzUjA3RFJCZDhRcjJlbjZm?=
 =?utf-8?B?VG9MMnBUTHVCNEpHV3dhTGQ0OWVhUFFZb0RmWTlIODAxV2Y0NzBvR0lhSC9G?=
 =?utf-8?B?RUd5NVZVbnlDZlZkbHp2a1lKdlBMTThGaHQxcmk2SWxTZE1Kb2VEM1N0Ulhp?=
 =?utf-8?B?aTJjWnFBbHcrVHRDZzlsSDc4ZDE3U2wzVzl5c09hWGhBT1Z2R1d6RzNkdzVk?=
 =?utf-8?B?V2xXb0cwYzdRZnFLaXJ4OGFndmpUU01VSjdhTHF6SE5tK1QvMXhrckR5Y2Js?=
 =?utf-8?B?QzlaRFNrL3lrNXd4ZzJ4cjRnRGFnTTZ5QlBaRjlqNFBTcTZPdU9qR0dFMDdB?=
 =?utf-8?B?UFExRWhkdXA4WlY5UnFjQllBWDJMRUJCSE1NTG52aXNvWis0NjBrK3ByYity?=
 =?utf-8?B?aUowNnM4NXl4amk0dUk2WmRSQWpqN0RvZitHOWVtdEpoWWJBNHNoRkEvV2cr?=
 =?utf-8?B?RTcrbCt3TzExdDUxbFZaMTFEK2Z1aTNoMDRzWWREV01GTDMwakhJckFsdnNS?=
 =?utf-8?B?RGVaazc4ckc5NG1CSDYyTUQ2UXMvdlp2bXpFeEZaMXZqQTV4VXptQjNadXA3?=
 =?utf-8?B?ZzB6bGNzYzFJMnlyUU8vL1o3UkZqR2ZkN2ZucURwSXBEVUVtdjdsZUsxMmZu?=
 =?utf-8?B?aFdTRDlVa3Q5K1hBaDBvNnozVStnQ2JmRUtoc3V4cHQ1THlnVzQ1RHBoeW5R?=
 =?utf-8?B?WTVMdGk0N09pYTVsY3JFZjVGWDZMWndLYlQ4cXBSemxuRXg0d3RQNllodG9j?=
 =?utf-8?B?MFdHOERoQlArVDVzRnptV0tkbzBPL1g1M1FnUFB5K3IvOGt0YnFHdWcvYUZC?=
 =?utf-8?B?SzFPcDRMbUVmQzhzY0dkZ2JKRVFFSXByQ1krT0JIZ0dhdjNlUHdXNDJRekpr?=
 =?utf-8?B?SjUzSFpXdnRhSkRrR00xWnFKbXlGeFREVWtDK3pqUDJ0andlSld2ZWVtOEFY?=
 =?utf-8?B?aWpPWWdGVC9HM0pteEEvRU0yTDc4RnB6NithMkYwM0Nhb0ZBdTkvaVpXQklY?=
 =?utf-8?B?ajhzS1BSWU1uODM4cEIvcHdlbXZFbytGem9lNnlvNTBVVWg5UzdnKzYwMkpz?=
 =?utf-8?B?WmkzTjVUdlZidGVhaUlaZThTcE5PdVhsb0ZBcUU4NThiUUdjeExjZ2pCNnc4?=
 =?utf-8?B?WUJWd3h0Zktjc0tKWVUrcVZrNFVUb0hWZURrMjk4OWJtYUc1NkNEQVF1dWQx?=
 =?utf-8?B?ckJIZ2Q1SytBU0l5d2JYeEthcGRYZENjU044RkloOEhBempmeTNNeFFCYjVj?=
 =?utf-8?B?UDZaUXdMVGp3NzAwMzd0c1QxUkhSRFB1WE16TVcwSUJTeTRSMkE3WVYvL2Vu?=
 =?utf-8?B?YXVHbGpGSnFFT3ZGTUtydzF3YmJzM3VIN1pVN1hoNVRiekMxaGkrK2o4Ympy?=
 =?utf-8?B?aHBlZWVCY29Qa1VZT1VCZ25LNXlnajZCWnhuMnBSbXZRLzR5RmVoekdlQXIx?=
 =?utf-8?B?YzlGaFNOYXY5Ym5oYmJwTTNDVnozT2VydmR1bzl4dTd0UGNVWkw4OXk1bFZw?=
 =?utf-8?B?Z2I1ZUdtL3ZvMnp3SEtLVUlmYk9UeExhaFBhU1BZTko1WkhxSHcxQWkvU3Rh?=
 =?utf-8?B?TWVzVjVJYWVDbFhjZ21VcnZuUEJlbEM3cG4zeFNPVTVZSHFCVEF2dnBET3p2?=
 =?utf-8?B?VDNrenlYaVB3V1ZBMjhhMElxOE9GNDJxdVRlamVSL1FrSjJxSUhpNDVNdHBU?=
 =?utf-8?B?Q3dkaWZVS0hKNXcrOHh0TEV6c2NNZCtoRmUyMWdHZUFqOUZKeFNWWWluMWdK?=
 =?utf-8?B?S0w0aVNDeGhJRGgxOTE1MXBsd0cxZEhDZ1ovQWFhbXcrREwzRzRSMGtwRVJv?=
 =?utf-8?B?Q2xRMlZRbFdMTzF3WnV5TGh2ZFdqcWJGeVpPdTJRdTlnRTNra2swelZSaDNQ?=
 =?utf-8?Q?M7MjQ73gw9NE46wTDU3Ohe4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c59a6f8a-347b-46ab-2af7-08ddca09afc5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 16:55:11.2831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19K+1+iE5p12REMY/0qKQ7Vlv02rBpR5etwRaHrsvV4HiM+whyu3vGudeyL/nixuarohXfVwqps0R3ZwuFQB6oSdpUbiB+b8rUDRSsaDi1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4854
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

Need change in commit
s/DRM_XE_SVM_ATTR_PAT/DRM_XE_SVM_MEM_RANGE_ATTR_PAT
will fix in next version.

On 22-07-2025 19:05, Himal Prasad Ghimiray wrote:
> This attributes sets the pat_index for the svm used vma range, which is
> utilized to ascertain the coherence.
> 
> v2 (Matthew Brost)
> - Pat index sanity check
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 25 +++++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 17959257ee1d..1dc4d19a5f2a 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -9,6 +9,7 @@
>   #include <drm/xe_drm.h>
>   
>   #include "xe_bo.h"
> +#include "xe_pat.h"
>   #include "xe_pt.h"
>   #include "xe_svm.h"
>   
> @@ -111,7 +112,13 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>   			      struct xe_vma **vmas, int num_vmas,
>   			      struct drm_xe_madvise *op)
>   {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
> +
> +	for (i = 0; i < num_vmas; i++)
> +		vmas[i]->attr.pat_index = op->pat_index.val;
> +
>   }
>   
>   typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> @@ -219,8 +226,22 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>   
>   		break;
>   	case DRM_XE_MEM_RANGE_ATTR_PAT:
> -		/*TODO: Add valid pat check */
> +	{
> +		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
> +
> +		if (XE_IOCTL_DBG(xe, !coh_mode))
> +			return false;
> +
> +		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->pat_index.reserved))
> +			return false;
>   		break;
> +	}
>   	default:
>   		if (XE_IOCTL_DBG(xe, 1))
>   			return false;

