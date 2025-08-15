Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1913BCA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 20:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C459E10E99D;
	Fri, 15 Aug 2025 20:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isg70Pu6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48CD10E99D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 20:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755291581; x=1786827581;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iE2tmZJHAvVxUM0U4oE+7J8o96wdJKlHTvrOrvf1Pww=;
 b=isg70Pu6NkYuhoO4ormmszJeDE11lriswDyNFekkdA0Yaf0k5RUDaDgH
 r4UROcSmUjr1kBv7e66fx6aJEu9kNRIzsUsYWnNBDQ6BrE1PTXdW9/xzF
 3X5dkVqYRicYHd03PKW+34JlLFkyC9fjvjbu1vWrnMxHnA/9Q591io/S2
 xp6aUcrj/pZNZihJjxgXK723pfJgyU/ZVYuZesZYCmjy1bFJvT75ifCEO
 riBhPoMJNdMB8gYZ4a21J2qmAT72/4C7ohVIRqo4TCLyFNbcDAqiNnQvm
 O4aR4DaFJqrwKafnHWbMc2fgSz4ehDhAEu58zCaIYM5BzVm0zyEjLJzYg g==;
X-CSE-ConnectionGUID: w90oHibNRaOmXVkVSKK4uQ==
X-CSE-MsgGUID: cWj5uTaBSu+bDzyqxGieSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="60243349"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="60243349"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 13:59:40 -0700
X-CSE-ConnectionGUID: h1HJ2zlISnaiNGZmcnClZA==
X-CSE-MsgGUID: w9BLOZ6dQhGAbB+002j85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171218064"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 13:59:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 13:59:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 13:59:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.83)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 13:59:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCuQGmdXVVLitVMGyXR2uX59WkTgUankudk8U1wzXJQgztw+fHyGtPZzDffeIYJ14Dx8Z29YHb4iqvrEAkAWqyvbnKDcw0gG/dqwjmePPHk2w1vOR61SvGjEQBRSI8CQToeKhN4zniShLqsEpm6kTJ0qzAM8VWS82SwiUJau4H6Z4ciye523VZwhr8NBFs682pQ5dIBQig1rd7/fZ055Part/MaGIiomyOUOSwLdGFjgWPY+4Jpr+FLJ9L2wTeFggijOPTP58BhneRlekKvjakm4VGUfoh4147xtnDEbNXTKHwu7Sx1vqJfOJjQHaIE8HtyIYDOti/2trRioUipQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iE2tmZJHAvVxUM0U4oE+7J8o96wdJKlHTvrOrvf1Pww=;
 b=AYcuSd8sva4716Br+wPkO4UJee1vERgidG1Q1RRA6YrXEHtRDNDHuZjO0IPnyJ7yzQp7IyrNI8vfO1RoyCNc++jqv9t3HztVRb3a+Y0NFZpBY8C0GJC/SyV5FM74IUMxKc5tQufaUOlgzPh8SWaMHX8RD/6RwjZepu0kKws8CSDAdWeu7CxiChy1KrGOWXiEakyc6oTNb2I8WyyfvGrPp9NAje6BSUhkBaPuPJ39o+xrTLUYiibbABJ4KGertUSKok+Pvod6maMMsFqPbATJEtzRwSY+Ggx0xwVP/9VwfODDlaOenbdY3mngG/qm6uB6tVj8MHVceOUOuVlT4QKDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 20:59:37 +0000
Received: from PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::b6c3:37a3:83ff:3b75]) by PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::b6c3:37a3:83ff:3b75%3]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 20:59:37 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Stop the TLB fence timer on driver teardown
Thread-Topic: [PATCH 2/9] drm/xe: Stop the TLB fence timer on driver teardown
Thread-Index: AQHcDIs3JbvXFKypOkmekO4Jnztm0bRhFscAgAABaACAAxaAgIAABDAAgAADDYA=
Date: Fri, 15 Aug 2025 20:59:37 +0000
Message-ID: <5508d170a8c4a8fad393b56778d2a3b419ca6953.camel@intel.com>
References: <20250813194806.140500-1-stuart.summers@intel.com>
 <20250813194806.140500-3-stuart.summers@intel.com>
 <aJ0BWL5lxyIOjHvj@lstrano-desk.jf.intel.com>
 <aJ0ChtKtA9O8vcVv@lstrano-desk.jf.intel.com>
 <ea6baee7c2251d5c3c1a7f382ec7eb03fde78fb2.camel@intel.com>
 <aJ+dKGznmGTK9tRf@lstrano-desk.jf.intel.com>
In-Reply-To: <aJ+dKGznmGTK9tRf@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5577:EE_|PH7PR11MB6554:EE_
x-ms-office365-filtering-correlation-id: f37ec000-5210-4697-e152-08dddc3ea52d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NmJPeEpUM3pWcXZpMDQwTWNGcFk0Q1NZd005cGhPSGpmd3VHZGNFK3B4NWtj?=
 =?utf-8?B?WlU5T3l5NTJweVhTRXByRFU3MDNGcXdaNm5qZlA2elh1a25RZ0J5N1c1UTZF?=
 =?utf-8?B?Mmh6ZlV4VzZzVlgydkhsSEMxV0NTcDR3R1BiYXY2OG5DNHlUR05BZHVXU0t5?=
 =?utf-8?B?RXZzVU9BWTdZb21mYWhuWmUxdStCY1FRK1hyTWxvUkZZMzVwK05pazZaaFkz?=
 =?utf-8?B?bUJwbHF1Ymdia1hNRkxER3dOM2VqRGUzOTNha3ZLK24vRFVOYUd3ak1IR25y?=
 =?utf-8?B?OVdGQUV1cjZDdkFyek80YWRTdkk1a2p2dFFkRFVYNUVEa3ZkUmtOQTlUNVl3?=
 =?utf-8?B?T0JpZzlNREpBZEZvRGY1YjJHdHBxTWhyTXM2SEFOZ3RLbzlYUkNnb1lDUEpX?=
 =?utf-8?B?RVA5WnQwakd2QmdhdGFFRUN0TXlJeG5Fd1VyYmVmL254U0VKOHBOTmw3c3dI?=
 =?utf-8?B?a3I4djRyWkRRNTFFZm9JZThGL3F0N3duNzBBNHMrZERWV1RGVitjci9qMTNj?=
 =?utf-8?B?LzRmQlNZMkwzVUVmc01Qc28wLy81UmU1SFNIVWh4cm5CbXU1djJtdkxHTTgx?=
 =?utf-8?B?OUhISkM1K0YvbUxuWWU1ZFUyaWZQUHlsSTVHQ0NDZFZVNEY0ZXdhamgyRHNG?=
 =?utf-8?B?MzRGaE1QWjFDcVlMVUVoWXBtUTJ1WWYyQUVsUW1nVVF0RlRYdnVub1pBN2tW?=
 =?utf-8?B?UFJTcnpLOTZueVIxcEpzeUFmQnBzWDFWc2Y5QkdNbU5mU0gxc1k4ZmUyQnVX?=
 =?utf-8?B?TUlIdlVmdE5Wa0ppZ2xDdUFzcWhjZzJPeEtaVXFYdEFHUVZWWGpJM1E0Q2ZU?=
 =?utf-8?B?cTFSRUN0dEplbXAxQlBwOS9HWmFSKzdWQ1lCUFYrU2E2eVVES3lHbmxRcGFw?=
 =?utf-8?B?bFo5anFraVFDN2ZRZ3NiY1FsN3RBZmhpZWNvN0Z3YXplYXZ2enB6a1htNi92?=
 =?utf-8?B?b3FWYUhqMHhLdWFJNGRyY2FuTUxKbmMrWVpieEMrcWl1Zm1WN0NVSUQ0TXJr?=
 =?utf-8?B?R2RteExSQnFCc0JJMnZqR2h3QnJ5Wk55WmJtYWg0MnRMQzlYbEtXR1dLYm1n?=
 =?utf-8?B?U3hWcExmaVFYUWJSNjFtZzB5VzhlcVpoNHRsY0RLOUVXbFBNL0pTMDRTaHpK?=
 =?utf-8?B?ZUcxczgyS2RGNEFDMUx0U21YcUN4Zm8ybVYrK1h0bzRKMlRTNFA5ODM5aUhE?=
 =?utf-8?B?akJvY2FtUjJYTld6VnlsUXphUnRnOWY3LzVUTjZKRmhBZ1ZOMExXbFJpQ3ho?=
 =?utf-8?B?eTl5aDlBT20rYTZET2xCS0lpVXBqOTVtN0NGR3AvSTRlYzg3RVVYcXpqNVdR?=
 =?utf-8?B?M1Bub2lqWGxxSDNCUThHQ0E2ZGpMcjJCWjYwMUdabmQvNmJEV1lIQW45MnlN?=
 =?utf-8?B?V0lEaVE2YmNIQXBiNW5DKzI4ZWdJSi9EMWlVTXhYc0lvaEZPbUQ2Y1VDSU5s?=
 =?utf-8?B?MFU5eFpSMUhJUVlUMFJKb2h0bzcrOGgyUGt2VnllTEUzdFpIemZZNTlMRkVB?=
 =?utf-8?B?bzlsUldkOFVaYm1RRkRxNEpOOGtVc0VJeklHTkMwT2srQVRYOFVzSVpjSldm?=
 =?utf-8?B?eGVQbWJLaVJPQ3hUem52Tzc2bWtIN0lHVFBleXA4eDh1Z1M4Z2wzdkg2UnVx?=
 =?utf-8?B?M2hxVmRGMk5NRXVWT3dvZkNzeUFmaVl6cEgzZVlXR2ZGbjFKU01sTjk4M3F4?=
 =?utf-8?B?MUtyb2VoNmJyOVhKUmYwVFN6M2RSMXlGTnVyYU9PcWpSRmlwZ3RaUEgzQ0Ry?=
 =?utf-8?B?cy9CT0I0NDdEalZUUXpvb01VRnpHT2pvMTR3MzdnZU5aZkNLdlVJeEg4TktM?=
 =?utf-8?B?MnJsNXcyOWNnaEtaYjR3MXpqcW5uQXQ5eHkyNXZKdldDZ3BpZzRLVlpmdnMz?=
 =?utf-8?B?eTVLTWM1T2d1N2NIZlgrMzhialU0TThrTFhzZ3J1QXdGeWR6YVFHN0VmR1BZ?=
 =?utf-8?Q?WeLDDKmYQuc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5577.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elU3YWh6SU45WTUzaEp3dVFpTEE3WGFTeHlyYzh2V3ZhVDA5YlR5TXdUM2JL?=
 =?utf-8?B?Y25lWlQ1N2l0MnBtQ1o5Z0JaMm1Dc1NVRFdVdGJlYmpkSjdIUk1senZ4Vm0x?=
 =?utf-8?B?UU9FT1dTZks0bE1WY3VrYUFCbml4ZURlVHJObGhYT2VIaERtSHVrNzFTNXFY?=
 =?utf-8?B?UXpNeWtkeUlqbkVzVmVaR3JRT0VpMjNxY21tT0Z6VXVtSkZqVFRwQmJscTVs?=
 =?utf-8?B?VnB4OWJtOWt4M0pTc3VwQ3pCNzNWQTBYaXd4SG00VTFDaU1MV1RXL0xhbnk5?=
 =?utf-8?B?NVpvKzFIM0tINmhDTlpMVzR2VmJyUEdyQ29CQSs1RkZLVnd4c0JCbEt6aEln?=
 =?utf-8?B?TVI3R3ZhN0UwRGFYMWlqcDIxa0NzTEx4NXlldndDTUZYQ2xySUJkYlYyWFRy?=
 =?utf-8?B?R1lYMEhqWi8rVW9KYkQrRmhJNDJIRURFd3F4dHpVdTFpaXdhdEhZOEdDVXV0?=
 =?utf-8?B?VTdDaVRiOGwwaGRiMkZ1NUhhZHhmQkgwZlRSY0VaR0J0SVRNc0VwNTFodTVJ?=
 =?utf-8?B?UXkrZlVrUzNTZG1FTFAwUVI4MTVpY0ZqUkNOTzkwcFBJMkcxM2ZWa0lDTzdO?=
 =?utf-8?B?dW5YWnVOaDJaOWNmTkdZZ3c0TkRCUWEvU095QTFySy9HalNOejFOVUJkRjlT?=
 =?utf-8?B?SThpRHZWT09kamRlZ2syOHVwdEJnN0pCWHNpMmkwaGUzOUFCbmNxdXhiOS8r?=
 =?utf-8?B?bVUxZi9XWlZDNkZmWjdleG5iZXNldkhzZkk2Skh6Mm9ubHhwTUU1N2RVNHdX?=
 =?utf-8?B?MkJ1U3ZXSUY0TkNPejh6NEl2eVNtbVlCOEZSNDR4ZGRuMUEzYkl4YUFHN1ho?=
 =?utf-8?B?TlRueHd6VmVYU1lMeUdLMjJiVFhrWGg5cmF3ZmlBTUEzVGh0N3d6cmg4aGo1?=
 =?utf-8?B?NkRIc0dFb0ZlaWlEZVduZ0JUNklqY2hBRlEwZUtUMGovbGJrbnBPUTAvRzFi?=
 =?utf-8?B?V1IrdmpVMjVCZGZ2YWZjdmtLakhQbGpqelVLcjI0cUdjM2dIS2lmbyttMXAr?=
 =?utf-8?B?UERRTTdCRGZwK2Y2ZFNFTW9Ic1crbzhlZFRadk10elk4TTUvUEVZb2RCNE40?=
 =?utf-8?B?QUJaeFRmTEJ6RU5NL3dEbllyK0k1aTJNdUd3L2ZxbHM3QUwrdmhkQ0ZkS0ln?=
 =?utf-8?B?TmVDZ0s5aUh2a1lZb2d4NE9mRnRqbndkQk5JdlVPazIvZmVMQzlMMXVyd2tN?=
 =?utf-8?B?NDMvR1dDUStxOEFRZE1oN0VLRDFaNFlTaGVaY1BYU0dUays5RXFVY3BXeHZm?=
 =?utf-8?B?VWVudk1EMVJSL3p0cTFSaE5CMUdjZ1pQZGp4VE9VNEpTMWM2MkxqazZMZnVr?=
 =?utf-8?B?WWpwRGFKVWFndGRqakZLdlNQTW9zUHZwS3hhV0ZJZ1VteWxwcU91aEh1c0hH?=
 =?utf-8?B?aHZjUk0wWXY0dHJPSTJEaVN3cGY5Q0tNUUYyemJjbkVRUEpMb1BmRTBNZXBq?=
 =?utf-8?B?aE5Ba3cwTHFUWSt0OU5uUUxEQXdRVVRUS1NnNEhsa244UDhiL2pCYzhHOTBG?=
 =?utf-8?B?ZkJVSTl2eE5UTTQ5R3ZBbFlPUm1IRFk4QjM3MHhuM05UQmkxeVdkZkllSXQ3?=
 =?utf-8?B?Ukw5SDBzWWk0KzNSL0UvcnVMMHMzckhzYm9DV0EvTUNmOStYZEtqREszNVoy?=
 =?utf-8?B?YWJTSmRHQmh6OUdmVFVJSVRWMzNYdTlLdCsyaEo1Sjl3b3BERUhJMmhYTFNP?=
 =?utf-8?B?NnkyZEpLcGtiWWF0TDM4NnNMV2dWZFpFa1NzOG1sdmJudDJkZXp5U3YwU05F?=
 =?utf-8?B?NSsrRElUSC9POTJIU214bWt4RlpUV3QzNXU4QlR0N20ycmU4MlU3UGljS01L?=
 =?utf-8?B?VDFOQVVWQVM1cks1M0dMdlJWanhKcHhVbVoxQ0t1dHBqTENEUDh2ZTExcmVn?=
 =?utf-8?B?SHdxZEFwWUJYbDdOb0JJM0lJTzdzTXpteWdUdExPRlZPL3ZmZ1pmS2F2V2Rl?=
 =?utf-8?B?dHdib0NKK1doeG44Nk9KRERabFM4QUExanpXblJVd0lVQXlxcmQzREFQZkUx?=
 =?utf-8?B?VVh0L2Q1MjFSRUJGTHkxcVNBaFRMWW5nSTBxeXVPR2o2WXh4V09nTmlxUVNt?=
 =?utf-8?B?aTYxbzUvTUV2VkF3SWl0SFpGUTVRRjM3UmYvSFhLd0p3cHZSOU9BQ3ZwOXhs?=
 =?utf-8?B?TDd4QlF0bHFTVHRHZzQvZC94MGhPK01wcDVpYWFFRVk2N0JHbWdBenlYL3RX?=
 =?utf-8?B?VXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F24A17A4E04A6547A95FF0A42AD9D1D1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5577.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37ec000-5210-4697-e152-08dddc3ea52d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 20:59:37.3195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YqpIDNYOREn2wQaNRsGrZK1V2diRxPA5t0NXNpNb2ahQh4VlBGGjNNrexpqoRKh91kVML3A8VpQDqQbjlJmMQE27EBFveHxdD5FN/ADQt8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
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

T24gRnJpLCAyMDI1LTA4LTE1IGF0IDEzOjQ4IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBGcmksIEF1ZyAxNSwgMjAyNSBhdCAwMjozMzo0M1BNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDI1LTA4LTEzIGF0IDE0OjI0IC0wNzAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gT24gV2VkLCBBdWcgMTMsIDIwMjUgYXQgMDI6MTk6MjBQTSAt
MDcwMCwgTWF0dGhldyBCcm9zdCB3cm90ZToNCj4gPiA+ID4gT24gV2VkLCBBdWcgMTMsIDIwMjUg
YXQgMDc6NDc6NTlQTSArMDAwMCwgc3R1YXJ0c3VtbWVycyB3cm90ZToNCj4gPiA+ID4gPiBUaGVy
ZSBpcyBhIHNtYWxsIHdpbmRvdyBvZiB0aW1lIGR1cmluZyB0aGUgZHJpdmVyIHRlYXJkb3duDQo+
ID4gPiA+ID4gd2hlcmUNCj4gPiA+ID4gPiB0aGUgVExCIGludmFsaWRhdGlvbiBmZW5jZS0+Z3Qg
aXMgc2V0IHRvIE5VTEwgYnV0IGFuDQo+ID4gPiA+ID4gaW52YWxpZGF0aW9uDQo+ID4gPiA+ID4g
d29ya2VyIGlzIHN0aWxsIGFsaXZlLiBUaGlzIHdvbid0IGNhdXNlIGFuIGlzc3VlIGN1cnJlbnRs
eQ0KPiA+ID4gPiA+IGJlY2F1c2UNCj4gPiA+ID4gPiB0aGUgdGxiX2ludmFsaWRhdGlvbiBzdHJ1
Y3R1cmUgaXRzZWxmIGlzIHN0aWxsIHByZXNlbnQuDQo+ID4gPiA+ID4gSG93ZXZlcg0KPiA+ID4g
PiA+IGFzDQo+ID4gPiA+ID4gcGFydCBvZiBhIGZ1dHVyZSByZWZhY3Rvciwgd2UgYXJlIGxvb2tp
bmcgdG8gc3BsaXQgdGhhdA0KPiA+ID4gPiA+IHN0cnVjdHVyZQ0KPiA+ID4gPiA+IG91dC4gVG8g
YmUgc2FmZSwgZ28gYWhlYWQgYW5kIGNhbmNlbCBhbnkgb3V0c3RhbmRpbmcgVExCDQo+ID4gPiA+
ID4gaW52YWxpZGF0aW9uDQo+ID4gPiA+ID4gZmVuY2Ugd29ya2VyIHRocmVhZCBvbiBfZmluaSgp
IHNpbmNlIGF0IHRoYXQgdGltZSB3ZSBhcmUNCj4gPiA+ID4gPiBhbHJlYWR5DQo+ID4gPiA+ID4g
dGVhcmluZyBkb3duIHRoZSBkcml2ZXJ3b3JrZXIgdGhyZWFkIG9uIF9maW5pKCkgc2luY2UgYXQg
dGhhdA0KPiA+ID4gPiA+IHRpbWUgd2UNCj4gPiA+ID4gPiBhcmUgYWxyZWFkeSB0ZWFyaW5nIGRv
d24gdGhlIGRyaXZlciBhbmQgZG9uJ3QgbmVlZCB0bw0KPiA+ID4gPiA+IGNvbnRpbnVlDQo+ID4g
PiA+ID4gbW9uaXRvcmluZyB0aGlzLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IHN0dWFydHN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiA+ID4gPiAt
LS0NCj4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9u
LmMgfCAyICsrDQo+ID4gPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF90bGJfaW52YWxpZGF0aW9uLmMNCj4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF90bGJfaW52YWxpZGF0aW9uLmMNCj4gPiA+ID4gPiBpbmRleCA3NTg1NGI5NjNkNjYuLjA4ZTg4
MjQzM2IxMyAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
dGxiX2ludmFsaWRhdGlvbi5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X3RsYl9pbnZhbGlkYXRpb24uYw0KPiA+ID4gPiA+IEBAIC00NCw2ICs0NCw4IEBAIHN0YXRp
YyB2b2lkDQo+ID4gPiA+ID4geGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9mZW5jZV9maW5pKHN0cnVj
dA0KPiA+ID4gPiA+IHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fZmVuYw0KPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBpZiAoV0FSTl9PTl9PTkNFKCFmZW5jZS0+Z3QpKQ0KPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOw0KPiA+ID4gPiA+IMKgDQo+ID4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgY2FuY2VsX2RlbGF5ZWRfd29yaygmZmVuY2UtPmd0LQ0KPiA+ID4g
PiA+ID4gdGxiX2ludmFsaWRhdGlvbi5mZW5jZV90ZHIpOw0KPiA+ID4gPiANCj4gPiA+ID4gSSB0
aGluayBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMgaXMgd2hhdCB3ZSB3YW50IGhlcmUuDQo+ID4g
PiA+IA0KPiA+ID4gPiBNYXR0DQo+ID4gPiANCj4gPiA+IFdhaXQsIEkgd2FzIHRoaW5raW5nIHRo
aXMgd2FzIHRoZSBmaW5pIGhhbmRsZXIgY2FsbGVkIGZyb20gZHJtbS4NCj4gPiA+IA0KPiA+ID4g
V291bGQgaXQgd29yayBhZGQgZHJtbSBoYW5kbGVyIGZvciBkcml2ZXIgdGVhcmRvd24gdGhhdA0K
PiA+ID4gY2FsbHMgY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jIGFuZCBzaWduYWxzIGFueSBwZW5k
aW5nIFRMQg0KPiA+ID4gaW52YWxpZGF0aW9uDQo+ID4gPiBmZW5jZXM/DQo+ID4gDQo+ID4gT29w
cywgSSdtIGp1c3QgcmVhbGl6aW5nIEkgaGFkIG9ubHkgcmVwbGllZCB0byB5b3UgdGhlIG90aGVy
IGRheQ0KPiA+IGluc3RlYWQgb2YgYWRkaW5nIEZhcmFoIGFuZCB0aGUgaW50ZWwteGUgbGlzdC4u
Lg0KPiA+IA0KPiA+IEFueXdheSwgeWVzLCBJIGFncmVlIHdpdGggdGhlIGRybW0gcGllY2UuIEkn
bGwgaGF2ZSBzb21ldGhpbmcNCj4gPiB1cGRhdGVkDQo+ID4gaGVyZSBzaG9ydGx5LCBqdXN0IGZp
bmlzaGluZyB1cCBhIGxpdHRsZSB0ZXN0aW5nLg0KPiA+IA0KPiA+IEZvciB0aGUgc3luYyB2cyBu
byBzeW5jLCBJIGRpZCBzb21lIHRlc3RpbmcgYW5kIGl0IHNlZW1zIGxpa2Ugb24NCj4gPiB0ZWFy
ZG93biwgd2UncmUgaW4gYSByYWNlIGZvciBkb2luZyB0aGUgd29yayBjYW5jZWwgaGVyZSBhbmQg
dGhlDQo+ID4gYWN0dWFsDQo+ID4gdGVhcmRvd24gb2YgdGhlIHdvcmtlciBzdHJ1Y3R1cmUuIFNv
IGNhbGxpbmcgc3luYyBoYXMgYSBjaGFuY2Ugb2YNCj4gPiBoaXR0aW5nIHRoaXMgV0FSTl9PTjoN
Cj4gPiBzdGF0aWMgYm9vbCBfX2ZsdXNoX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrLCBi
b29sDQo+ID4gZnJvbV9jYW5jZWwpDQo+ID4gew0KPiA+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB3
cV9iYXJyaWVyIGJhcnI7DQo+ID4gDQo+ID4gwqDCoMKgwqDCoMKgwqAgaWYgKFdBUk5fT04oIXdx
X29ubGluZSkpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxz
ZTsNCj4gPiANCj4gPiDCoMKgwqDCoMKgwqDCoCBpZiAoV0FSTl9PTighd29yay0+ZnVuYykpDQo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4gPiANCj4g
PiBBbHNvLCBhdCB0aGlzIHRpbWUgd2UgZG9uJ3Qga25vdyB3aGV0aGVyIHRoZSBHdUMgaXMgZnVs
bHkgdG9ybiBkb3duDQo+ID4gYW5kDQo+IA0KPiBJZiB5b3UgYXJlIGF3YXJlIG9mIHRoaXMgc2Vy
aWVzIFsxXSwgd2Ugc2hvdWxkIGJlIHRlYXJpbmcgZG93biB0aGUNCg0KT2ggZ3JlYXQgSSB0aGlu
ayBJIGhhZCBtaXNzZWQgdGhpcyBvbmUuIEknbGwgZGVmaW5pdGVseSB0YWtlIGEgbG9vay4NCg0K
PiBHdUMNCj4gQ1RpcyB2ZXJ5IGVhcmx5IGluIHVuZHJpdmVyIGxvYWQgd2hpY2ggaGFzIGEgc2lk
ZSBhZmZlY3Qgb2YNCj4gaW1tZWRpYXRlbHkNCj4gc2lnbmFsaW5nIGFueSBUTEIgaW52YWxpZGF0
aW9uIGZlbmNlcy4gSSBuZWVkIHRvIGZ1bGx5IHJldmlldyB0aGlzDQo+IG9uZSwNCj4gYnV0IG15
IGluaXRpYWwgdGhvdWdodCBpcyB0aGlzIGlzIGNvcnJlY3QuDQo+IA0KPiBJZiBkcm1tIG9yIGRl
dm0gaGFuZGxlciBoZXJlIGlzIHJ1biBhZnRlciB0aGUgb25lIGFib3ZlIHdoaWNoIGNhbmNlbHMN
Cj4gdGhlIHdvcmtlciArIHNpZ25hbHMgYW55IG91dHN0YW5kaW5nIFRMQiBmZW5jZXMsIEkgdGhp
bmsgd2UnZCBiZQ0KPiBnb29kLg0KDQpZZWFoIHRoYXQncyB3aGF0IEkgd2FzIHRoaW5raW5nIGFu
ZCB3aGF0IHNlZW1zIHRvIGJlIGhhcHBlbmluZyBpbg0KdGVzdGluZy4NCg0KPiANCj4gWzFdIGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTUyODcwLw0KPiANCj4gPiBh
dCBsZWFzdCBJJ3ZlIGJlZW4gYWJsZSB0byBvYnNlcnZlIGluIHRlc3RpbmcgdGhhdCBhY3RpdmUN
Cj4gPiBpbnZhbGlkYXRpb24NCj4gPiByZXF1ZXN0cyB0byBHdUMgY2FuIHN0aWxsIGNvbWUgYmFj
ayBhcm91bmQgdGhlIHRpbWUgb2YgdGhpcyBjYW5jZWwNCj4gPiBkZWxheWVkIHdvcmsgY2FsbC4g
TWVhbmluZyBpZiB3ZSB0cnkgZG9pbmcgYW4gZWFybHkgc2lnbmFsIGhlcmUsIHdlDQo+ID4gY2Fu
DQo+ID4gcnVuIGludG8gaXNzdWVzIHdoZXJlIHRoZSB0cmFuc2FjdGlvbiBpcyBhbHJlYWR5IHNp
Z25hbGVkIGNhdXNpbmcNCj4gPiBoYW5ncw0KPiA+IG9uIGRyaXZlciB1bmxvYWQuIFNvIElNTyB3
ZSBzaG91bGQganVzdCBsZXQgdGhlIG5vcm1hbCBHdUMgdGVhcmRvd24NCj4gPiBhbmQNCj4gPiBU
TEIgaW52YWxpZGF0aW9uIHNpZ25hbGluZyBoYXBwZW4uIFRoZSBvbmx5IHRoaW5nIG1pc3Npbmcg
aXMgdG8NCj4gPiBjYW5jZWwNCj4gPiBhbnkgb25nb2luZyB0aW1lb3V0IGhhbmRsaW5nLCBiYXNp
Y2FsbHkuIFNvIHRoaXMgY2FuY2VsIHdvcmsgY2FsbA0KPiA+IGlzDQo+ID4ganVzdCBtYWtpbmcg
c3VyZSBpZiB3ZSBleGl0IHdoaWxlIHRoZSBDVCBjb21tdW5pY2F0aW9uIGlzIGhlbGQgdXANCj4g
PiAobGlrZQ0KPiA+IG9uIHRoZSBlcnJvciBpbmplY3Rpb24gY2FzZSBoZXJlKS4NCj4gPiANCj4g
PiBJJ2xsIGhhdmUgYSBsaXR0bGUgaW5saW5lIGRvY3VtZW50YXRpb24gaW4gdGhlIHVwY29taW5n
IGNvZGUgdXBkYXRlDQo+ID4gdG8NCj4gPiBkZXNjcmliZSB0aGF0Lg0KPiANCj4gWWVzLCBzb21l
IGRvY3VtZW50YXRpb24gd291bGQgYmUgZ29vZCBhcm91bmQgdGhlIHRlYXJkb3duIHNlcXVlbmNl
LA0KPiB0aW1lb3V0IHRyYWNraW5nLCBhbmQgd2hhdCBoYXBwZW5zIGlmIHRoZSBiYWNrZW5kIGlz
IGRpc2FibGVkLiBGZWVsDQo+IGZyZWUNCj4gdG8gdGFrZSBhIHBhc3MgYXQgdGhpcywgZG8gaXQg
aW4gZm9sbG93IHVwLCBvciBwaW5nIHRvIG1lIHRvIGhlbHANCj4gd3JpdGUNCj4gdGhpcyB1cC4N
Cg0KWWVhaCB0aGlzIGN1cnJlbnQgaXRlcmF0aW9uIGRvZXNuJ3QgZG8gYW55dGhpbmcgaW4gdGhl
IGV4ZWMgbGlzdCBjYXNlDQp3aGljaCBJIHdhcyBob3BpbmcgdG8gYWRkIHJpZ2h0IGFmdGVyLiBJ
J2xsIGxldCB5b3Uga25vdyBob3cgdGhhdA0KcHJvZ3Jlc3Nlcy4NCg0KQXMgZm9yIG1vcmUgZGV0
YWlsZWQgdGVhcmRvd24gZG9jdW1lbnRhdGlvbiwgdGhhdCB3b3VsZCBkZWZpbml0ZWx5IGJlDQpp
bnRlcmVzdGluZyBoZXJlLiBJIHdhc24ndCBwbGFubmluZyBvbiBkb2luZyBhbnl0aGluZyBleHRl
bnNpdmVseSBpbg0KdGhpcyBzZXJpZXMsIGJ1dCBJIGNhbiBsb29rIGFzIGEgZm9sbG93LXVwLg0K
DQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gTWF0dA0KPiANCj4gPiANCj4gPiBUaGFua3MsDQo+
ID4gU3R1YXJ0DQo+ID4gDQo+ID4gPiANCj4gPiA+IE1hdHQNCj4gPiA+IA0KPiA+ID4gPiANCj4g
PiA+ID4gPiArDQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX3BtX3J1bnRpbWVfcHV0KGd0
X3RvX3hlKGZlbmNlLT5ndCkpOw0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBmZW5jZS0+Z3Qg
PSBOVUxMOyAvKiBmaW5pKCkgc2hvdWxkIGJlIGNhbGxlZCBvbmNlICovDQo+ID4gPiA+ID4gwqB9
DQo+ID4gPiA+ID4gLS0gDQo+ID4gPiA+ID4gMi4zNC4xDQo+ID4gPiA+ID4gDQo+ID4gDQoNCg==
