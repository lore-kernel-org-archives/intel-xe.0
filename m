Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA1BC02192
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 07:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AFA10EA3D;
	Fri,  7 Feb 2025 07:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ck2Elalq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E69710EA3D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 07:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738914817; x=1770450817;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ksvT4S9dO2dNGsxaQO8z5I1GYDPdO8eUS0foAr58hrU=;
 b=ck2ElalqcN6hRzR7vPr++erjHCTxnkRoLxvyPKEsMHR2TfczZV29S3/9
 95EI0hTIFFUgMwbaQOmhkkpu5/ybKNDUXi3CRo2Undjxz3UNNg+T3SwPw
 NdLKB3v4nqYdawchvw5hsfDhR0ycWKibNLJ4v67O67UMwIaWh0sz71mUG
 CuUAQeI9Zi6bO6zfSndmk9eZjKeqp7/2EcVwNQfbYg/jlbqfSL+cVVZM/
 b9kSfSodkPqIJgUXR5g3FRtIkEYW6gSMF5mlbfEgJrnTNfXgWO6OxGzAw
 uTpHmfRcIDfTroNYc0rGfcIWZB8UOxFTsmsUHVBspYGGJQvZ4arA5yrGK Q==;
X-CSE-ConnectionGUID: peskH/XXTk2okJwjbyo4Lg==
X-CSE-MsgGUID: thbK1jMLSl+0vkMqxsm3/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50938036"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="50938036"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 23:53:37 -0800
X-CSE-ConnectionGUID: k61vVSmaSSmbksYd9JBDFg==
X-CSE-MsgGUID: K7fOfk1sRwyiExIZ/ZOlVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116075256"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 23:53:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 23:53:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 23:53:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 23:53:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRhNnK4y7bAaGSSfG81Pry06bNS8FAkzEkCk8fjZDJ2+N0CUwN9S446bFIEKghzFtIuxyVzl1B9Ye7sSdCdlsTTKdkeZc0h8gLyw10uydsSauxiiDm2xemxHcvc7Aq34a8ikr2MjwQ4Si/a422FYaLKn9rMtyOlE4uRAPkdN7FeBSHxqb78iX5U5zPOtDX15VEXPFHiSNVGH4DLSO+paQjMVr640dYK+FKQvJ2MktGejSfRpG/c7QhcEI3QFdyBvInO5dGj5SK1yn+Tp5M4QV1AhnB7bC+UbvhlBbLUzM8LuqRMnW8d5DE3ALeVitohkjmEsEdUF7TsBIviSr28q5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPc6zc0HyAWKHGyZnF74YBHdcLDVf0cRN+HMhWE+leA=;
 b=wAymHGyVLJbof2K5E9KuysS1RJRtcFMtr5IjtdF2H8cKLN/XXqJb4TiILYxT3P8zB6fKDZEvN9iT/NdgBsKeOv9wA4wVA8VbIZJo+WLDlYAGWL4dNwwhoRXsXUsRxx4LTu5DJyHBcSGPSXWE/VGX28K9ljt0WckZBILCpdt7Zv2bdIKYqPjZSv3q4QKUYLAIjWm7o6Rzwg/Fpci1GLvZ3bVoU/9LctLYotkIbm6iz02n57XX9Q34LGEN1s7G1OmBA63ZMx2KwkR87g4YCWo4VqwCDULgIeLnvRKYpZhqgs5xbG8P9RrbneLYNCw8k9e0ViLLHahWBBWHO7Hjmh94Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BY1PR11MB8055.namprd11.prod.outlook.com (2603:10b6:a03:530::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 07:52:21 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 07:52:21 +0000
Message-ID: <a48ad6cf-e533-4c5c-baa7-56ad3a2922b8@intel.com>
Date: Fri, 7 Feb 2025 13:22:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] drm/xe/xe_pmu: Add pmu support for per-function
 engine activity stats
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-8-riana.tauro@intel.com>
 <61dd8ba7-5fa2-47db-a03f-81fae29cc1e9@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <61dd8ba7-5fa2-47db-a03f-81fae29cc1e9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BY1PR11MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: ac052607-9357-4b95-04a8-08dd474c59e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEY0Ky9hZmNJQ0tMcUxFQzcrb21OKy9jcytMMFVOek1GSWhxVlVqWXQwMUlt?=
 =?utf-8?B?a0dnQUFzU09ITSs5cDJvSFM0Z29nZGFycGhBSjRMaC81bXhZYTZ6dHg5Z0t5?=
 =?utf-8?B?VGV0QUFsTjRVL0V5YytUcXJqZm4xcEVPREZyUXpmY09JdjNWaWM3MWJ2WXM0?=
 =?utf-8?B?MHAwUXJuOWQrRGtmaXQrZXd6c3o5SDk2cm45TFF6dDJXN1pZNnhtK21SeFhh?=
 =?utf-8?B?ZW5EbitNRWtET3RJanFxOUJmM1ljSEI4WEdWVWhEQnpGa0R4bGNMeDNKYlcr?=
 =?utf-8?B?RnEyM1lnMmpldEsxTGFiODBZWkM4TTZoU1k3OTg1cXQ4MmpGQjVoamQwOWtq?=
 =?utf-8?B?ejIwU01MZGdjaDRHcHVlYURySjJzNFFJVUdBVWFpYjkySklpMEEva3lWakhi?=
 =?utf-8?B?cytGN04xeTdLNTdjMUxTWWo0ZVlhblI4KythZXA5dmJob3krZ0ZiVE9qeklM?=
 =?utf-8?B?VStvNHd1cGo4ekg0L0FDKzhkWkhLZXNKbjF6TE53K0YxeEFjd090N2pzNDFl?=
 =?utf-8?B?YStXV09Qa0dGVml6ODBKaldwTXlBcFV4aWlkYXUwbzZCaWhxdDliSXRRb3ND?=
 =?utf-8?B?eWsyY3RtTEt5ZGFaWWlPdkJwZDhqY0ExUUFqb1JYRmpUbStPVVdOdVhVUG5O?=
 =?utf-8?B?QlNpMW9ENGx6K29ES20zWEVaU1diYmNWNWVjWEF1VG9qdWhCTmhyQ2RqY091?=
 =?utf-8?B?WGJDTXhXVjVBVVVmelJqdmRoWGdEckJydCtUeTdnRmFVS2o5b0dHT3RWdGRD?=
 =?utf-8?B?blpsdDA5b2pCQTFGRlZLRTBuay9IUk5ISVQ3Q2VzYTRZdjQ5MVlLeERVZk9E?=
 =?utf-8?B?WWthazBwa052UlVqTW1iajdQRXJnYldiSUdFLzdhaFYxekNBSzNLNy9mRCs4?=
 =?utf-8?B?RGxLTzVxSWRJaUhxY1luN1grckUwanF1dDZSNkovSTFiWjhicitjODNnSi9R?=
 =?utf-8?B?eWF4M3ZGaUVuYTN5dzdsUTNYcEkvK0NVbm5sZ0pnMWxmZC9kZXNsb1FXQTlZ?=
 =?utf-8?B?dWwzV1lnakdzWmJqQnQyRE4rNWo0UDBKd3dRTGFNdUV5ZDRvbEo5RUFpYk52?=
 =?utf-8?B?YUZnVWZ2WTlrMlQzcm8vRmVPalFuQ25jRVlQU1RzYkduYWxiUjNONTlRakJO?=
 =?utf-8?B?RVQxL3BNUDRsZnVjc1FqMURvWE0xK2R0T3p3VE15UkJ5N3d3SUNBaHR5WmN2?=
 =?utf-8?B?UVBSMXFlZStZVm03QzMzVHVVSXZQWDNvTzBzWHhGT3RwYXdOT2RtL3EyV3lV?=
 =?utf-8?B?R2hjbUVLQjdDY3RkeGM3SmJrSEx6SlBHKzV1UGhIeWtHZnc0MHhBdmkvMkZV?=
 =?utf-8?B?ajcwSmdvcGk5c1hQT1ZXVXB4a0NIMlRXNlJKeFJYNzJhRTdyNnM1bFdBaGhX?=
 =?utf-8?B?L00rWThTcWVNRSt2OU1VUlVXZ0w2cGpFOWJmbmZ2Sk96cHdkZXNhajRNM1po?=
 =?utf-8?B?TjZVVVQvelovM01tMHdqa2tBU1IySS9USzU3N3hvNnJOZFhBaTdydk9zOUM0?=
 =?utf-8?B?clo5Wk1HOUJxc2gxcUpPNm5Sa1A5U0o1bDJFWEdHR2tJU2Ixc1cydThxUmIr?=
 =?utf-8?B?SXVTOWkvNmNCT2c0eFh1NzVhdHJVTCtmTnZCRGxnNWpCdmJoeThWRnZacXBs?=
 =?utf-8?B?OWtRbTlhSjdxamtxUW5sdXhlck14NVJQMW9ndC9qNG1kMnQ2Q2x0RncwdG5B?=
 =?utf-8?B?Nk9rRlhITC9vMHVWY2ZZK2dyZGMyV0h0Z1J6RGdUK0NQaWFMRng1KzdzdFI1?=
 =?utf-8?B?dDBXRFdGbENFcUZURXk1bXlnSTE4UkkrNzRIMjY2aVZST0JVWTBKaHpLN0RP?=
 =?utf-8?B?QWptT2hyUXBxRk1hYXZab29udExSZEpJK1ViaHROYTdxcFFTbjVtMzBMRThp?=
 =?utf-8?Q?JWhRyyzkL/Ovg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXlISVR2OTk3M2tFaHJCRTJWRVdEUU41bFlWZldjcDBrRXZ2czBjYUtDRjlC?=
 =?utf-8?B?MzBrL3JZUjc5RlFxOFlDVE1hTHQ4K2E1MzdCSmNoaFhwZWFWeGQ4b2NPa2dP?=
 =?utf-8?B?NW1lTWc4WldRaXlwN0k4RCtJU2lBSGswVDVxT2pmdmh1NFZjdWhPYlY4M29K?=
 =?utf-8?B?dlhsT2xyZ2lzeGpFc0ZYTUM5L0xkV3FEbm5UNGkzZEFMV3prMjVaeHA5dEVP?=
 =?utf-8?B?Z3RCUnNsdCtwTlFJQU5VZEJ3c0pYSWkxTWNId0lRV1orMHduaDJncWVuNHh2?=
 =?utf-8?B?T1VTaUQ0bHFJSGdzVGdtWGhTa1JZOTRoVms5a2F6WC9CYlAvL1diK3loVy9r?=
 =?utf-8?B?eHF6QUhYR051VGJPYXBHOUU4cFNyakRjM1V6RHR0Z2szbnpQQ29aV1FkMldD?=
 =?utf-8?B?ZGdjWVJXNEtkY1JlOFpDVXVkSWJNN3dLZGlmSlVkbzFNRWpUMDBqd09PZ3Mv?=
 =?utf-8?B?dWRBZmhZWkdZZjNraTc0R2RnY3lsRCswVkVuUlZmT1VIdHJtWitGZ0R0dGxa?=
 =?utf-8?B?M3IxdU5MRFRXaVFpNnluNm8zMHB1TkZ0ajRtMkNua3R3OUxUU0lDb2FuOHhK?=
 =?utf-8?B?WFFZeldFWGRiSkdhZEQxMmcveE8wMHBPWnJHMnJ1OU1TNmhwN2h4aW9aYmtz?=
 =?utf-8?B?VWZjNksrWlZkdlM3YTVnbFFnV1hPMWF1ZmFZUHJlb2FEcVRQOVF1VlhTNm9H?=
 =?utf-8?B?RGVTNnRlU0kxWUVEVzIwandNb1ZMek5hY3dvb3ZyWTdjSEV1YkVadWNTZXY5?=
 =?utf-8?B?QlpKcGhhT1RoLyttNVJrQWViaTF4b1NIcEFGa2l0QnlaR1pxV0VPYzlGdzc1?=
 =?utf-8?B?MkhJSnRKOWdFaWFpOWdJTFd3eWdNZ201ZVdxU3dmeHh6N011QWtEVS8yUHoy?=
 =?utf-8?B?bEZDcW9qK1hoSlVXSmhBSFRTMlJNU1l2TVRzeElOWEtlUGtCdzcvdm1FMS9m?=
 =?utf-8?B?VVRUc0FMSlFvQkp2ekYzZFE4OXZlaXpERnJzS2cvMUxxaUMvUWExQlNtMmg1?=
 =?utf-8?B?bGhsOEZSdUtmS2Vxb1Fyb3g1MVh0SXF2Rlo3eG5xZTlqSnU3THYrWE5IMEZ6?=
 =?utf-8?B?N2VSS2JaaytFR2lGREN1VktEeWFGS1JmNVZhcnFOYkRubldwWVZkYStvb2Nh?=
 =?utf-8?B?cnU4bTY5WVFBRWR2VzZUaU0zRFpqUHZnQmFtYzJ0R04zYmZRMTlFQUpUWERh?=
 =?utf-8?B?bmNidVoyR0VrTFdKKzVZQ1JKZjRFbm1KNlFoNHk0TjQ5YVVnQXQzeExMVlRC?=
 =?utf-8?B?Sis0TkNDZGVTYnllZTZoL2l3MkVRd2UxODIxWGJ4bEh6cFRtRTNvY3Njak9v?=
 =?utf-8?B?ZmFiMVJwTFpubEpCb3VVSkRmdkkrYTgzcE9IK0JYb0xqc1hjYWptWnBCOWJE?=
 =?utf-8?B?VHFaUXU3ZlIzWEttWCtHcFBMZTVSck9RNTdJT04wN1ZLMXBzZnBXbFo2Mjc2?=
 =?utf-8?B?dWREbDVwZTBwcUdIMjFFRnBYZklVN1NaUXVyQWJkYWF1allVbDNyam5RUmoz?=
 =?utf-8?B?ODg0MUNGOUpDT2IxdG1ya2NxcFp0dkZ2YVRleE15bkFEdjFGeTRhc1E0dzd6?=
 =?utf-8?B?VUoxN294ZGJ1MzZESkJkTXRsZG9tcWxzTnpnUlUzQ0pocVp5ajRzVzJQWGFU?=
 =?utf-8?B?MmhGVHB6b0pEMGVFK0JtL3kxdlFFbnFTRUZUZWtUbEkyMGpKNTYyN2FLZm55?=
 =?utf-8?B?OGg1TUVwbkt5dDVhY1IrbjlEMVg5L1F6WjU4a0RXMzdVWmtJM1dkL2tRL0Fi?=
 =?utf-8?B?eXhmNTBGYnFoa3c2ZHFNMm5jd1FuVnE3K2I1MmV2V0ZQMmdsQk41My9HVis3?=
 =?utf-8?B?YklESy9FR003N0EveWJwVVZ4ek0yRWorVVltL21DNWlTakVibUtEUXFRNmxK?=
 =?utf-8?B?L1ZoNVZNY2lBUFhSbWkrQjBWMVhXSkhGSThDVTY3aXgwVEUzMDBIdzZNSEFh?=
 =?utf-8?B?NG1sTHBLSkJDMlNGTm02TlRYM1k1NU93R2ROWVNhWng0K1lCS0tXajNvVTdJ?=
 =?utf-8?B?bzFHZk1WZEJocHE0VjJlcHVsYVZKZ0tEeVBRcVRpZkxYRlcvbFVEK2lVcUNI?=
 =?utf-8?B?YjZjVzlBNDdkTXQ1dENrclhVUFhwZGFSeUE2SmJVY0VPVHBma3ZzeGFmcWpI?=
 =?utf-8?Q?2dX7jCmtEHdv9PXqsXOJuVshU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac052607-9357-4b95-04a8-08dd474c59e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 07:52:21.1179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpNYslLblA+jBeNACjCiOmg+UaTwWgxVXtrJ/62pRtTDOdkrLVn/ny9PxrTTpRRhLxySfeCx6uykNvW6HDJdRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8055
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

Hi Michal

On 2/7/2025 12:45 AM, Michal Wajdeczko wrote:
> 
> 
> On 06.02.2025 11:43, Riana Tauro wrote:
>> Add pmu support for per-function engine activity
>> stats.
> 
> PMU ?
> unneeded line wrap ?
Will fix this
> 
>>
>> per-function engine activity is enabled when sriov_numvfs
>> are set. If sriov_numvfs is set to 2, then the applicable function
>> values are
>>
>> 0 - PF engine activity
>> 1,2 - per-VF engine activity from PF
> 
> 0 - PF engine activity
> 1 - VF1 engine activity
> 2 - VF2 engine activity
Will add this
> 
> but maybe better to show full entries:
> 
> xe_0000_03_00.0/engine...ticks/ - PF activity
> xe_0000_03_00.1/engine...ticks/ - VF1 activity
> xe_0000_03_00.2/engine...ticks/ - VF2 activity

This is not the case since here PF is monitoring the engine activity of 
VF's. Not VF reporting the engine activity stats.
So the function id's are sent to PF to get engine activity stats
> 
> as 'function' term here matches 'PCI function'
> 
>>
>> This can be read from perf tool as shown below
>>
>> ./perf stat -e xe_<bdf>/engine-active-ticks,gt=0,engine_class=0,
>> 			 engine_instance=0,function=1/ -I 1000
>>
>> v2: fix documentation (Umesh)
>>      remove global for functions (Lucas, Michal)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pmu.c | 38 ++++++++++++++++++++++++++++++-------
>>   1 file changed, 31 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index a758fc517048..66cf2ece97ec 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_hw_engine.h"
>>   #include "xe_pm.h"
>>   #include "xe_pmu.h"
>> +#include "xe_sriov_pf_helpers.h"
>>   
>>   /**
>>    * DOC: Xe PMU (Performance Monitoring Unit)
>> @@ -32,9 +33,10 @@
>>    *	gt[60:63]		Selects gt for the event
>>    *	engine_class[20:27]	Selects engine-class for event
>>    *	engine_instance[12:19]	Selects the engine-instance for the event
>> + *	function[44:59]		Selects the function of the event (SRIOV enabled)
>>    *
>>    * For engine specific events (engine-*), gt, engine_class and engine_instance parameters must be
>> - * set as populated by DRM_XE_DEVICE_QUERY_ENGINES.
>> + * set as populated by DRM_XE_DEVICE_QUERY_ENGINES and function if SRIOV is enabled.
>>    *
>>    * For gt specific events (gt-*) gt parameter must be passed. All other parameters will be 0.
>>    *
>> @@ -49,6 +51,7 @@
>>    */
>>   
>>   #define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
>> +#define XE_PMU_EVENT_FUNCTION_MASK		GENMASK_ULL(59, 44)
>>   #define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
>>   #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
>>   #define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
>> @@ -58,6 +61,11 @@ static unsigned int config_to_event_id(u64 config)
>>   	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>>   }
>>   
>> +static unsigned int config_to_function_id(u64 config)
>> +{
>> +	return FIELD_GET(XE_PMU_EVENT_FUNCTION_MASK, config);
>> +}
>> +
>>   static unsigned int config_to_engine_class(u64 config)
>>   {
>>   	return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>> @@ -146,7 +154,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>   static bool event_param_valid(struct perf_event *event)
>>   {
>>   	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>> -	unsigned int engine_class, engine_instance;
>> +	unsigned int engine_class, engine_instance, function_id;
>>   	u64 config = event->attr.config;
>>   	struct xe_gt *gt;
>>   
>> @@ -154,18 +162,28 @@ static bool event_param_valid(struct perf_event *event)
>>   	if (!gt)
>>   		return false;
>>   
>> +	function_id = config_to_function_id(config);
>> +	if (function_id && !IS_SRIOV_PF(xe))
> 
> hmm, it rather should be:
> 
> 	if (function_id && IS_SRIOV_VF(xe))
This path is not hit for VF

The perf_pmu_register doesn't initialize for VF's

         if (IS_SRIOV_VF(xe))
                 return 0;

function id is applicable only when SRIOV is enabled and VF engine 
activity is requested from PF. Hence SRIOV_PF here and the check to
see if function_id is valid
> 
> but (see below)
> 
>> +		return false;
>> +
>>   	engine_class = config_to_engine_class(config);
>>   	engine_instance = config_to_engine_instance(config);
>>   
>>   	switch (config_to_event_id(config)) {
>>   	case XE_PMU_EVENT_GT_C6_RESIDENCY:
>> -		if (engine_class || engine_instance)
>> +		if (engine_class || engine_instance || function_id)
>>   			return false;
>>   		break;
>>   	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>   	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>   		if (!event_to_hwe(event))
>>   			return false;
>> +		/*
>> +		 * PF(0) and total vfs when SRIOV is enabled
>> +		 */
>> +		if (function_id > xe_sriov_pf_get_totalvfs(xe))
> 
> shouldn't we rely on checks from one place?
> 
will move it to one place
> likely xe_guc_engine_activity_xxx() will also have checks for
> index/function and may use ea->num_functions for that
event and params support is checked in pmu_event init.
There are additional checks while reading too but the init will return 
not supported if events/functions/parameters are not valid.

Thanks
Riana
> 
>> +			return false;
>> +
>>   		break;
>>   	}
>>   
>> @@ -233,18 +251,22 @@ static u64 read_engine_events(struct perf_event *event, u64 prev)
>>   	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>   	struct xe_pmu *pmu = &xe->pmu;
>>   	struct xe_hw_engine *hwe;
>> -	u64 val = 0;
>> +	unsigned int function_id;
>> +	u64 config, val = 0;
>>   
>>   	if (!pmu->fw_count)
>>   		return prev;
>>   
>> +	config = event->attr.config;
>> +	function_id = config_to_function_id(config);
>> +
>>   	hwe = event_to_hwe(event);
>>   	if (!hwe)
>>   		drm_warn(&xe->drm, "unknown pmu engine\n");
>> -	else if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>> -		val = xe_guc_engine_activity_active_ticks(hwe, 0);
>> +	else if (config_to_event_id(config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>> +		val = xe_guc_engine_activity_active_ticks(hwe, function_id);
>>   	else
>> -		val = xe_guc_engine_activity_total_ticks(hwe, 0);
>> +		val = xe_guc_engine_activity_total_ticks(hwe, function_id);
>>   
>>   	return val;
>>   }
>> @@ -347,6 +369,7 @@ static void xe_pmu_event_del(struct perf_event *event, int flags)
>>   }
>>   
>>   PMU_FORMAT_ATTR(gt,			"config:60-63");
>> +PMU_FORMAT_ATTR(function,		"config:44-59");
>>   PMU_FORMAT_ATTR(engine_class,		"config:20-27");
>>   PMU_FORMAT_ATTR(engine_instance,	"config:12-19");
>>   PMU_FORMAT_ATTR(event,			"config:0-11");
>> @@ -355,6 +378,7 @@ static struct attribute *pmu_format_attrs[] = {
>>   	&format_attr_event.attr,
>>   	&format_attr_engine_class.attr,
>>   	&format_attr_engine_instance.attr,
>> +	&format_attr_function.attr,
>>   	&format_attr_gt.attr,
>>   	NULL,
>>   };
> 

