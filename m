Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AC0C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 07:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E033710E4B9;
	Mon, 10 Feb 2025 07:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3BdBZFX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0544F10E4B9
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 07:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739172543; x=1770708543;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xZx8Fjzr/zEZZRYtPF4B9lagM7zvXdU+3bvT8Y/tbOA=;
 b=W3BdBZFXFCub5HtepVoP3Gj0D45EhVendNAkC+bbxL8Ew8n+zovNM9mi
 0/daJXmw5hLT8odX5G35dwmKR+S6qvSQDIsM18ro6PXKjY88TcfJ/ADuC
 1Yaxwz6AfgxsDgDvbrTbP4FBVaTD8uExjnbmnse1V8SY3oct10mWWQp7O
 SZIX7kJX226WP9V5V7s6aWnoZTUTN46iKlEJAhhU6nvJ/cjigtR80R3R/
 +H6m777zMr+MSTNdumwIwDjKcETKIc4zc6Nlg5XDt0u2K5hcLbmXQAuJK
 uEM7gIEL7h059SK6nzucYJ1rbQnVKFuCLtxWAM+ETHOv5wtkNb74hZQe7 w==;
X-CSE-ConnectionGUID: QGv+1q97TMuYJ4TRZgxBGQ==
X-CSE-MsgGUID: YvDIJRoaS9WwlCh1aj3Rvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="38940227"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="38940227"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 23:29:02 -0800
X-CSE-ConnectionGUID: uSHbKdQqRQ+bCZLN1/I2zg==
X-CSE-MsgGUID: 8rjcupJxSEuQ3v8FG1wt9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="112627806"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 23:29:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 23:29:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 23:29:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 23:28:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwfrqIgAZkaclM9JWwFNfcuAa+kYgjhtHLp2w2EsViJ6GAgZQmfel2YWL4i9EF9REux4iOTCb8jj2FlnLVuLMRjfgQJzIvpa8KFH4Rm+SwRdcsbX2w5WUYerzzovu5VzSeCGAC+gnusWwzA0M60dKLsr4O1fqpBOSKRCuoKscFtG0cT3vVMUo3lVZ13k+xPGtF+ZrqJsuvKoOw/QVBJO5yL+74aWkvohX/qKK0pw/6Ryry3QqgFpIS6T0/cZXVQJ9bnoX763xMsb9ZhdzuEgnWfzNuzwPTDDZ5Z4r84Xr3lfD+QwbkzZEcaOPkGwuZp44k0y4rIsUTORre3DNlFKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdTmTIkE99G22HMtPfxnkiFpQmL7Ff4tBACkCzrm0Rw=;
 b=e403suVTlpgtqUgb9Xe+qwCmyhjt4Z7peSXVFeXeR664pXdrV+fyUmxHXFEwxF8uwDzqcvxcx0U0hYZYeaaRLjNpYB6qQOEbRV7rQRpSQZVkMABTurIYgdRKSwQf1OcmuHFsCtuInW+huv0V/Ng6NE/zPrNoSMjNFpgG1fYhB/P335TBj6lqh09/UgEtxzD0xI6r0KHstEvMettsZPWxCY1iINLmzy/k1Zkk6rb6dNfuqd+NW087xtbj77QsGSrcmJmpYyrGW813/IwR1xIf8wh5AykBwgTRgFXME1m2H7sDsqeUOKuGCy385Z7163tENfV4X/NZk6LcPXi+ukvKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.16; Mon, 10 Feb 2025 07:28:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8422.010; Mon, 10 Feb 2025
 07:28:10 +0000
Message-ID: <cd7c9d27-0ebc-4338-9143-40fa58b96249@intel.com>
Date: Mon, 10 Feb 2025 12:58:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] drm/xe/guc: Expose engine activity only for
 supported GuC version
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, John Harrison <John.C.Harrison@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-4-riana.tauro@intel.com>
 <Z6Z9I0Ls5RUdgtFC@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z6Z9I0Ls5RUdgtFC@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 194bab0d-edef-4142-23c4-08dd49a47848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QW1idkdTQ1AvejRocmtJYW1jWGMyS3JFdXZWcWpVNUZYVnZjQ0g1dlgwdDdZ?=
 =?utf-8?B?WXoyUDJXZzNNY3V6VWNMWGVJQXV5TTh6ZlNDUXhJU0d4U004UWhheXJzZy9R?=
 =?utf-8?B?WjN2WjE2OU9ocFd6ZVFEdEExd0JzRnFtbkNMamtwdUc5SWJ4eHlBdmxZRVU2?=
 =?utf-8?B?ZVZ5WG1ZWDdPRDEwblV4alFXWlRBU2ZxZEhSdGJ1TGFvZ1FpRXlLTUtKWGYz?=
 =?utf-8?B?Y2RoMi9HQ3hQNStQcVZ0YU5HNWQvNDFucUhjUGowVnIrTU1sTjc4L09uQmI2?=
 =?utf-8?B?SjBRQ2U0N1pLQmF0ZDgrMXhyUFFZbTVxa2RFTDlkTW1aUHpqYTBZc2VIVVd6?=
 =?utf-8?B?bWJsWnJ6M0ZXVENQbjd0Um9ZRUxML3FDNUlRTEZXSUtJMkJaM3V5Z0EyanhJ?=
 =?utf-8?B?Z1lGeVVNZEdmZFFCNVYyQVFZSGY1RXVXOXhwelZMUkdmemJ4QmtKNkpEdHpT?=
 =?utf-8?B?bWk5RitwR3ZkUm14Y0w0am1HYTh1OEs3ZzRoTGZnOCtBK0JmYUwvRktZWEls?=
 =?utf-8?B?aEdYcXliZi9xcExrWjRHNWY2SnJnYVhjVXFHSUpaZmpkSCtFa3A5SFV2S0Vx?=
 =?utf-8?B?T2p3ZTV5ZUZldXBvNHJsR3UvY1NrVE9jUWp5eFczeDVBUWtITjVSNnVtNkIw?=
 =?utf-8?B?cVdYcjBtdlpVQUVHakZlUUhWVDl2V0w0Y2lmL1VrQ1JjbDJhaFlkaXV2dTRv?=
 =?utf-8?B?bHBUUUtzWE05Q3MrQ2s1WDAySzRhQ0lUZlVETEFHSjBaeGgwd3R5VWYyVlQy?=
 =?utf-8?B?Wml5ck1BV0NEajJ1eUVSajBWU1RWNk1oY1hxRWFDVE9RaStuUWNkTXFhSXU5?=
 =?utf-8?B?bTE1VS9wRzJJaEN1aFpqZXp2T1Fvc2JZUWljNDhiZHNiMHd5RndJNWlWaVhQ?=
 =?utf-8?B?aWNLL08zbHNMalZQTll0cVRTVHBwYTJCaXdmZVJkbFBpZ0FhUXgxSTRSajlX?=
 =?utf-8?B?eS9GeVBKOURJZEVRdnRNTGJzSmVScURoQ00rNS9xYU9uSnk4OFFPTnhYYWcw?=
 =?utf-8?B?L2lmeFVsTUxncURPSFNsa2xKTVhidFZpS0JIYi84Rkl3SUQxcG9qVGRBKzRR?=
 =?utf-8?B?TkJ4VlErRzdVcmk4UWE4MkxtZFY1VnM4VDVQNmVkd1FaSk5LOUk5ZG55TExO?=
 =?utf-8?B?N2QrK0c4SHd4RCsyR0c0UE1RTHpFeVdJbUtJSDFvK2RaK3RySXJueXNHZjdz?=
 =?utf-8?B?dVFmWUUrVU9PU0lRRXltUmRDRlNSaTQ2MEJvN1FBSXJtU3h3Zy8vTVd4cTl4?=
 =?utf-8?B?RENlTGV6VGJFejhvRDJKZE92aXh5WlB5YkRKN3FSMEd6VS9iTEY0cXVDRm1y?=
 =?utf-8?B?WGk0WDJ2dVlKL2RDOHg0b2lLbDBRYWE4dGlLanNRa1BZQW9DVnV5MHJBTWM0?=
 =?utf-8?B?KzdMKytGV3kyV0J2SFZMSUtRRzg3c3lZQzhkeVJkVEtpY0UzTVhSTG9LSWxS?=
 =?utf-8?B?SWZFYnN6TC82dGp1WGowVzZVZ0FnY3ZBWjBLZG1heTNBRUtGZjNYZ1hyUXE2?=
 =?utf-8?B?VnBXUHo5alhML1pUUTVBa0g3UnZ2S0p0T1RtVk44RkhEQXVZVEE0Mk5GSno2?=
 =?utf-8?B?ZFBLMlcydHJ3SUx2Um5rNUowVVFEbWJrVUVzcVhFL0xCRVRwRDBzL1k0REdo?=
 =?utf-8?B?enRaaGlQaDF4dUIyUzA4YU1TRTR6WjMyWGFlV3FPTlhIRkpMTHR4RFdyUU13?=
 =?utf-8?B?N3BsTjMwY2h4bXlocVlqeEhIUElWSkdLWk8xYnpOZEdmK05NWUplYW9nQTVX?=
 =?utf-8?B?d3lEL2gwd2E0VzJLcmZELzU3STRtL0tkbmd6REUwK05XVjJNWTdpRGhsMUNp?=
 =?utf-8?B?cUlMK0Fsc1BhY1R3cmo0TWRWTElSWlhvbVpUZGVPRmFiMWV5ZnNUbmRGbklS?=
 =?utf-8?Q?HcmKXMyMavH2s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUdOZk5KeXhJR28vd3BIM0gvU1dHNEFxUlBOUUdFemtwcHYvczVOWUR2WVVy?=
 =?utf-8?B?QU5HMkN2WnByam52WUQ4MWZsUHRranlPYVk0VWl3WWp0Vk01QjhMdklmNGh5?=
 =?utf-8?B?ZHVEVVFuT2RGK2gzdlNHdUJRSHFOUG8ySWVkTkRKa1pJblFwL3VtK0xTdGd1?=
 =?utf-8?B?NUVCTFFpTmZBcm1McnR4VXdReGc2SEVvOWVnNXN5dHdHME1XeDd5Vng2RjdB?=
 =?utf-8?B?NUdUY1VSZUh3Z0RnZmx0bjVMVjUyZGRYSHZIU1AwQ1VXeVM1ZFVDaGlZQ0lF?=
 =?utf-8?B?UGpzTm1rUzVGeENiRW84VXE5RzVvUmdOZldYYWt4V29vU1VuZ0owUmJCUWRl?=
 =?utf-8?B?MVlJVG1hemFiVmJSV1ozeEo2SDlYRHlSRWJMTjFTVWhoQmhqQ25PTnd5NFRP?=
 =?utf-8?B?WXc4ekZCdmlwQ3VhZXBrbi9pOEN5WWJhQ21yQzlFL0pKTkVFYms4MEpHRmJC?=
 =?utf-8?B?bHBYbzJXL2ttN01UNElTL1Q1U01UdFovOUtnWmt3NHVmaFRNUWJQNitzVzJn?=
 =?utf-8?B?c2pFeitiWWdPWUNjdVBxRktZeFJ2VjRYckl1c2dFazRZMmZFd1QzRmxKR3Vt?=
 =?utf-8?B?ZDN2d1RHMkVjYjhRd3lQRWFpdUpwR2hZR0dDQWYxSnRobWtUYnZNcHRzc2JR?=
 =?utf-8?B?VTB2RHhrTzU0WGpzSVBIbEk2SDh6ZlJsR0dRaktNOEwydmNzOThrUklac0Zp?=
 =?utf-8?B?bmxCVEZtYkEvZmpsQVMvZkhaanFhQUxsOTE3VEk0OVdIL2ZBV1NyOUVZTk9s?=
 =?utf-8?B?NlNXVHovWVRiWkpHcFBrZnU0d1VhYlZkMitzYWZUY3NxVDlJYTNSaVZqOWhE?=
 =?utf-8?B?RlBua2x4Z0xSejVzZkdpcld5endWdnJxOXBKRkYwUFUwd0hmQ0wycVAzdWFC?=
 =?utf-8?B?STQ3Y2ZTWW8wVmpxdTNkdm5naklCekhITVJnMGVDZE5rbEJkMW5SUVExY2pl?=
 =?utf-8?B?Nkpwdk4xckM0Z0p1T3JtdkJFWWRZRTlJOE9JYzBIcDRUUC9aWUpadzdGK1RE?=
 =?utf-8?B?KzA1VzQyQ2h5N2FLdXFrbWhsR1ByRktyalF2aUlYVUZRL3VmZlZkR2JzYkxs?=
 =?utf-8?B?VEtQM01VOHBSZTByS1Bhcmc4eStDalhLeHJsSFJKdXkyVElHSGt3SlJVUi9h?=
 =?utf-8?B?R0w3UGtGUmRWZHJaMFZyc2hpRHFGU1pHN2Yvd2ZPYS9TZlZjTEE3eHI3dk1v?=
 =?utf-8?B?RGxMWFcxMEl2K1RQenZoZmtLQU9WUENVNjl0QituTUxtYXJDb3hxalJ6WG5m?=
 =?utf-8?B?WXE1QlpveWI4UW4rV3NmNDRpV1lGUy90d254K0xzSHlyWUdScmlqUkFOVGlO?=
 =?utf-8?B?R290bVJBSXR6L2VsS1VrSVB1TEhOQUQvRXpsUGlrcGc4bkNzRXZPRjJmQldl?=
 =?utf-8?B?VGxJTHc3MzRJZFZGc1cyUVVMZ25TOG1VOHI5aDBNSnY3bGFPS0VZWVJla3hK?=
 =?utf-8?B?OWR0azFNTC9hblhqNHlwazlJTEJyVStUNDRVdnYyeXh2NWZpZGN6V0dSQndm?=
 =?utf-8?B?THAxQm5EckJkQmJLV0FpT2NTQ012K1g3b08zUldVamZmcWVKUTdWNEFyTXBF?=
 =?utf-8?B?aVErcmZDVmdPaU1GdXFPK1p2bWtRWEt5K2pkY2VaUHlOdEYyV0lEZ29oSERz?=
 =?utf-8?B?b054NStTNytiMzVvTDdXTjcreTVjcmIrMkhiZU5sZ1R5akR6dE0vNGJCVXor?=
 =?utf-8?B?K0RRVUlPMmR5c1RFdndxS0lER0JZRWt3ODlmS3ltS3UyNlF0dGlhV0hWTk1E?=
 =?utf-8?B?RWVwSkxIUEdmM2IyYWFLQjl4UUlHQnJkbU9SbVg2UXVDSUo2UXQvYzhhc2Uy?=
 =?utf-8?B?VjdIODZCYkNua3dmLzNBWFVzL0ZjZFAvQzNNeEJ1ZGQvWFlET0JnUzVKVUZS?=
 =?utf-8?B?N243STlSS3NGbExaL29ucldKMU45d041Q2svQUpianc0THVBYzltM2pzdUlj?=
 =?utf-8?B?anFFOFFUcGFFZUxLZitDOTBEbEZpcEVVU21xZW1ERmk1T2Q5VEtQNExndDVR?=
 =?utf-8?B?SDNCbDFqWE1RRFV1bm1LM3o5Um95ekFBeGRHMEg2M28rQTFTZjl3N1hnbVpm?=
 =?utf-8?B?cGQrWUF0N2hYL1dPalpNUVlEWWZkc05JSVpzR1U2Tlc3dVhFd1lPR0x3YUty?=
 =?utf-8?Q?0Z2pMOHBzlLYgfG2vQcUej64e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 194bab0d-edef-4142-23c4-08dd49a47848
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 07:28:10.1597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEgoXRYVSRt1azMhQ5381WteyLHSrXZPv7EGYSUNCET+o4ocHBwIRDlhW8Oxi87oJDvXN+t+vd1lnyJwEg4yHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8019
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

Hi Umesh

On 2/8/2025 3:07 AM, Umesh Nerlige Ramappa wrote:
> On Thu, Feb 06, 2025 at 04:13:52PM +0530, Riana Tauro wrote:
>> Engine activity is supported only on GuC submission version >= 1.14.1
>> Allow enabling/reading engine activity only on supported
>> GuC versions. Warn once if not supported.
>>
>> v2: use guc interface version (John)
>> v3: do not use drm_WARN (Umesh)
>> v4: use variable for supported and use gt logs
>>    use a friendlier log message (Michal)
>>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 42 +++++++++++++++++++
>> drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  1 +
>> .../gpu/drm/xe/xe_guc_engine_activity_types.h |  3 ++
>> 3 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/ 
>> gpu/drm/xe/xe_guc_engine_activity.c
>> index 9c08af273397..5d67fe38639a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -89,6 +89,22 @@ static int allocate_engine_activity_buffers(struct 
>> xe_guc *guc,
>>     return 0;
>> }
>>
>> +static bool engine_activity_supported(struct xe_guc *guc)
>> +{
>> +    struct xe_uc_fw_version *version = &guc- 
>> >fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +    /* engine activity stats is supported from GuC interface version 
>> (1.14.1) */
>> +    if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 14, 1))
>> +        return true;
>> +
>> +    xe_gt_warn(gt,
>> +           "engine activity stats unsupported in GuC interface v%u. 
>> %u.%u, v%u.%u.%u or newer required\n",
>> +           version->major, version->minor, version->patch, 1, 14, 1);
>> +
>> +    return false;
>> +}
>> +
>> static struct engine_activity *hw_engine_to_engine_activity(struct 
>> xe_hw_engine *hwe)
>> {
>>     struct xe_guc *guc = &hwe->gt->uc.guc;
>> @@ -250,6 +266,9 @@ u64 xe_guc_engine_activity_active_ticks(struct 
>> xe_hw_engine *hwe)
>> {
>>     struct xe_guc *guc =  &hwe->gt->uc.guc;
>>
>> +    if (!xe_guc_engine_activity_supported(guc))
>> +        return 0;
>> +
>>     return get_engine_active_ticks(guc, hwe);
>> }
>>
>> @@ -263,9 +282,27 @@ u64 xe_guc_engine_activity_total_ticks(struct 
>> xe_hw_engine *hwe)
>> {
>>     struct xe_guc *guc =  &hwe->gt->uc.guc;
>>
>> +    if (!xe_guc_engine_activity_supported(guc))
>> +        return 0;
>> +
>>     return get_engine_total_ticks(guc, hwe);
>> }
>>
>> +/**
>> + * xe_guc_engine_activity_supported - Check support for engine 
>> activity stats
>> + * @guc: The GuC object
>> + *
>> + * Engine activity stats is supported from GuC interface version 
>> (1.14.1)
>> + *
>> + * Return: true if engine activity stats supported, false otherwise
>> + */
>> +bool xe_guc_engine_activity_supported(struct xe_guc *guc)
>> +{
>> +    struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> +
>> +    return engine_activity->supported;
>> +}
>> +
>> /**
>>  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>>  * @guc: The GuC object
>> @@ -276,6 +313,9 @@ void xe_guc_engine_activity_enable_stats(struct 
>> xe_guc *guc)
>> {
>>     int ret;
>>
>> +    if (!xe_guc_engine_activity_supported(guc))
>> +        return;
>> +
>>     ret = enable_engine_activity_stats(guc);
>>     if (ret)
>>         xe_gt_err(guc_to_gt(guc), "failed to enable activity 
>> stats%d\n", ret);
>> @@ -302,6 +342,8 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
>>     struct xe_gt *gt = guc_to_gt(guc);
>>     int ret;
>>
>> +    engine_activity->supported = engine_activity_supported(guc);
>> +
> 
> Is xe_guc_engine_activity_init() called even on a VF? If not, then 
> initializing engine_activity->supported here may not be sufficient.

Will return in xe_guc_engine_activity_init before the initialization
of supported if its VF. So supported will not be set to 1 and will 
return false  for all the other calls

if (IS_SRIOV_VF(xe))
        return 0;

Thanks
Riana


> Thanks,
> Umesh
> 
>>     ret = allocate_engine_activity_group(guc);
>>     if (ret) {
>>         xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/ 
>> gpu/drm/xe/xe_guc_engine_activity.h
>> index c00f3da5513d..9d3ea3f67b6a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> @@ -12,6 +12,7 @@ struct xe_hw_engine;
>> struct xe_guc;
>>
>> int xe_guc_engine_activity_init(struct xe_guc *guc);
>> +bool xe_guc_engine_activity_supported(struct xe_guc *guc);
>> void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>> u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>> u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/ 
>> drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> index a2ab327d3eec..81002c83d65e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> @@ -79,6 +79,9 @@ struct xe_guc_engine_activity {
>>     /** @num_activity_group: number of activity groups */
>>     u32 num_activity_group;
>>
>> +    /** @supported: checks if engine activity is supported */
>> +    bool supported;
>> +
>>     /** @eag: holds the device level engine activity data */
>>     struct engine_activity_group *eag;
>>
>> -- 
>> 2.47.1
>>

