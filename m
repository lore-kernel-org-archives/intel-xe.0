Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93461C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 14:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6C310E5B4;
	Tue, 11 Mar 2025 14:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAkBHtGW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A65D10E5B4
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 14:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741703716; x=1773239716;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OJ7W4u5M/0TqubD0jTJTUqUj+Sic2ORnBxawdMv3N28=;
 b=RAkBHtGW3Qw+D/jBLXGAei6ZZV5weXmKOYh+zmOwpvhj2JKj7HoFiJqs
 Wo9whNFr5NV7Kz0rmMVhov74qgjPwTUynuh/4JVgc3t98I4oNs676Z3Kh
 IklryMYiRQbYi74+H9s+hTKd8eB+WB733mbBNwb+2zwYIg9uiDj1/emTY
 +zHVaK5Yarzcwz9PQwUMtT14KqTBWTnxnxd5s8IbBMbo6nVT9jucG4y5F
 SbkXIuyTCI3+Ah18ZxzB9DckLvA2QV9U93SSH3eUlZVEBKlgRIZGpBJQu
 DcXHctKbTSvMmtQOS6FN/IN+fMOqMmoEcyDULmywfwrXC/49QcauRCvbP Q==;
X-CSE-ConnectionGUID: +12mx70ITVW4Fw7ksSHQCQ==
X-CSE-MsgGUID: mlHK/YHcQ8axkUDigybXyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="68108929"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="68108929"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 07:35:16 -0700
X-CSE-ConnectionGUID: b+PvY4GzTymyzGCdIwTCrQ==
X-CSE-MsgGUID: plM5CNcMQu2pcadnvznhNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="143533446"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 07:35:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 07:35:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 07:35:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 07:35:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Flbcto8AtATMRcogJG1voHrCMNinAr9zC1RYlFP9NoDb8RgOX5Cy6SCvC3uuUfKRXQMeH++aak+UpIIcOf2TnyIcAVx6lbGYpB3ZCgGCRw/rZKoU0gbzxaI0iDqXX9VKEN7G3Q8sPfDMe7vgDhljtM+e6nkhippQfKIY/fwK5OCMEeUgjH9Opuq4B0LxWceuW3a28JLuU2abdSV+k3dK+INW85x1pY/9Z2InMT7c1bMlskQ2/8FNNk9prY1vpheiRrJsEFPk3WBWGEibANwUkCG4gVEvLe96CwrbrxX0bFrfoVVUeRgYoOHTo9ygr4h4OkyzfA8DFf2OtwffaTMUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUKVHFcPGOBnHlVKsTbfcPdxGwl80frTbZNy/7pnq4Q=;
 b=UaOXPYxrmRBUxgr2wzpDSjiynpYtMVDoBYAijdSZEAuxqUra7urMYM007tPBA5kIeTqAkjftyARzXBveZ8ShSpLY8axMaLPZdnvF0Ac2x2Ii/pyAJ+UiP/LH7lbnz/jX5AUH20T+H0NnvABLcO0+ecfB671dCUPzvUIW8+xfviV4IwVAvAnAj7SXH+A3NuG2yv8qdvmNwp4DLIwIPZEwGDLYZUAbwH/6UJB5DwlWnZAYNycXzm8hwpZzhPJUOv6LQ2D5Iy9xsVVLL2GYnsRTr2yvqt7JZgQeP60C59H4436KSvymdtO22hnxdIylhByulQXDZb8TDbGsLmugI/dc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB8666.namprd11.prod.outlook.com (2603:10b6:8:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 14:34:50 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 14:34:50 +0000
Message-ID: <9eeda900-be06-4cba-9cb1-28285e6846c9@intel.com>
Date: Tue, 11 Mar 2025 20:04:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Prefer USEC_PER_SEC over MICRO
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250311140115.2042-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250311140115.2042-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB8666:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c49a032-eb2b-4a0e-1541-08dd60a9e13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0UrV3RqTXhJMU5HT050Nk9uUm5IZStpa252U2Y3MlVUb2p5MVgyZ0FUbWF6?=
 =?utf-8?B?MG5tTzROaEVDMlJUb2ZHTDkwZExVM1hRR1RUbzBxRVZNZUlHay85eGpNb3NB?=
 =?utf-8?B?MVhxWTZkYUc3ZTBHN0Qyc0poWWFibUk2a1VDTWNhRXNWcy9CcUxIKy9tcW5E?=
 =?utf-8?B?blAxR3FDMEU1VEV4Qzk5UDQyWEpvMXBsd0pjTzJySnZ0eUZnSUYwUFQ4N0Nx?=
 =?utf-8?B?TEZYYUgreVBjSUFrems3dkhuQmlMK21nMVl1ZmJGU2l6bHpmNldMUkMyd3U3?=
 =?utf-8?B?KzlrZVZHM0Q4QW8zZTBOelAxbUpYamdrbmhvYUhsWG1FTWlqWlNOK2hTcWh5?=
 =?utf-8?B?Yk8zTGlWVmFkdHpaWnlWNytIWUd0N3hhYmgyUzhjVmtTZ3F3bjlpZjNkRFhO?=
 =?utf-8?B?ZDNzRmRoR054T2Q4Rjh2NXRLeG54bzFaRHl3QkY3dTFYVlc2dW1lN2JCMlp0?=
 =?utf-8?B?WGpycFBSQ3V1eHlrRzRxSHZ5WFJDOXNOeVJRVFRLeklBZ3hZWlhsNkVuamkx?=
 =?utf-8?B?SUJBTXh2TU56WW1FeGRFckRGVVIvdVB3MGQyR0ozK2ZJYXg0SVlQTTRLU3Fp?=
 =?utf-8?B?YktDYXRDcHJITVpKNXZXTnAwTmp4MnNOMXNIV0FjOXpvZ05kcUpSL3NqZ0k1?=
 =?utf-8?B?cldZLzRNc3Fmdzg4WjlkdUZJRGhncHUwTmpZTmYrMWJvR1UyY2JJY0Iwdlcx?=
 =?utf-8?B?NE16UWJpdnowb2NVNGdNWGZqZlZxRzNKZWZOQ0JQeUpyUENkZEJ2aUVwL1ow?=
 =?utf-8?B?Z0RKV2FhTHJZRkQrSDd0cW9mUWIzUmNwc2ZRUzBvdXVVaVNTbGI0OTZsdDd3?=
 =?utf-8?B?SEZkN0dDOXdrYnoraFhXZjlzaWtGWEVkZ1ZXUzhGQnpVbE5pTVVNSTR1MFN3?=
 =?utf-8?B?emtFVjU4Y01lR2JQblVJT2tWOGl2bmhaWmhJYTBkU2l0Z2FZczhleEhLeXFw?=
 =?utf-8?B?QkljZ3hQYlp5bWwxcGpPTkE5aThwTVNBZVRhSU9TUDVVUGZJRFZ3cXoxUE40?=
 =?utf-8?B?QWVOQzRPbUx3R1FaNFovd1RKZnRwMzRVb2lBcGhYWGgvcWdaTjg1cnpONm5J?=
 =?utf-8?B?SWVrWUFsa24vSGdmNjFrMkx1aUJKeVp4aDV1ODJQODBPTTBBNjdyOURNczJD?=
 =?utf-8?B?aTBzSnBXUm5WV3BoMituZkd6ZU52U24wM1hGTURSUWFIVldhVzZPdjJjUnJn?=
 =?utf-8?B?cC9pRllNTkM5ck5TU3k4WVlWWVFtR2I0cXloWkUwUjN3c1g4YmpCenVZc2gv?=
 =?utf-8?B?ZTRzcWZqTUpYL0dnNW90VlpwZEhMNFBXVFduZG9ORG1nalB6SEhRR1Z3KzVC?=
 =?utf-8?B?YzUwN3g4emtnSkN4MCtUOWJxZmRRa3BybW5PdmE5K1UvSnZyajBIQUhZYVVn?=
 =?utf-8?B?b21yK0FiZ1Z3c2s0L0MzMEQ2RW4wQStRcEdiSnM1YmhGRldTdVJRMGRKckY4?=
 =?utf-8?B?TStYWDBPTWhyOTgybVdhYVFoQmVKYjhhenV6a21GM0oyT1ZKV2V3bGd1VExr?=
 =?utf-8?B?WlBJaW80NDFTdjhDS0xpTDhYN1VyL1F2UlBGLzEyY2ZlNTRyS093dTZFMmUv?=
 =?utf-8?B?ZnNpVlVHY3RtL1A5aXRVbUpKWXJ3N1V5bkU3bHpodkJVNnVVQmZDVDcwZjB2?=
 =?utf-8?B?OHN0Vk9aQ2VtZnJKSjRTWDJ3TGFWdVRFU1R1S0UwdSt0VFNCcUlFT1ZDRS9W?=
 =?utf-8?B?Q0NhejllTHN4OWZpOWRFbGgxVWczTHhJSm1hKzFyVVRvRldxWjNpRTNkTWRX?=
 =?utf-8?B?bkkzSVJzMzhQSjFEbzg2dUR1ZTRDMVBndERHY0Izb1lZTnZwUkk3elMrV0xm?=
 =?utf-8?B?L1hja0lPbnkxOFlHMjh5SHFwclhZd1R1UjllVjVSR2NzeWRqMmVBTzJjNVZo?=
 =?utf-8?Q?e6FzaZ5tsU0c3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z043a2hRVGt0Yi9aZ2ZQNmlTUFpnaFdEYnkzRE5rNG9Pb1hCcjhaVjc4NGZF?=
 =?utf-8?B?OVlZVFBiUUx0WVlLb1puMUtRem9Uai9HOUhiMEFzL1Yya2RVVnlwbHk2R3V5?=
 =?utf-8?B?YUN0Z0U5c0xtWm1CeHBiQ3NpUHlrRnUramhaR3FWY29IS3JkUWxKUS9VbVM2?=
 =?utf-8?B?Q0RjWjRGTHBjL1RKamF2VUtMQUVwT3JBTFEyZThhV1BYQjdIMDM2WFViNUk2?=
 =?utf-8?B?RDFaMUljbGNkZUlud3FpVE0yU2ZwRHp3TUM3VWFkWVBQSERTdUJzZ3RiUEdL?=
 =?utf-8?B?Qy9yVlJyVFJBVUVJOXV1ekErVGF0clRGU0lUM1F6NllxaHhZdmE4WHJkZ1FN?=
 =?utf-8?B?M1IvMnJNRTJPb2xVN1lRaXlDNTdXMFl0SXpRSko4MVdDQXBsYkZzd2s5cGlN?=
 =?utf-8?B?QXl0ZkFMVWVhRXplWWFXOWNxSi9HY1NOTHZZRTRDMzl2RVN0eDJqaGErOGwx?=
 =?utf-8?B?bnhGL0VuYmtUQ1lpbWhXbDVDTkFXVFNRblZxK0F5dUtZd2VDY0NhQXZFdnly?=
 =?utf-8?B?R1NmbDFhZXdWWnowMkM3eC9RZGxnZnV2cDM3NVUxRDE3dERiZ3kyZXN6Yk5m?=
 =?utf-8?B?NnBKZCtJZW1Nd00xQytZYWVTdWhQbXdtVHZLZWF1TkxpR0xNMmZJWitVS1Ru?=
 =?utf-8?B?Vko2TGQwZWk2UnQ5cEh5Q0VEeTd2U3B3VzlGWGFLMHhaUWNXNWN2aFJQMm1m?=
 =?utf-8?B?SU80RThhVE5YcTUwY05qZjZyWTE5L2RnbURtWUxLWjVVTW41RnhhWGxLWVBh?=
 =?utf-8?B?ZlJnWk8wZXBwQWJzcTltemw1MTVndjVRY3QwOFRLdVI1ZmhwR0YzaDdSTmNu?=
 =?utf-8?B?RWVNM2QrSXVzY3VYMUUxWE9EUm5ESEdtOExZQ1VwM3I1R1RaSGw0TWN4Z2tO?=
 =?utf-8?B?Sy9nSC8yemx2eEtqY0E1U0NPQTNCT0QwTkVHWjNUMkJpek1IWkJ1eklBV2Vn?=
 =?utf-8?B?UjJueENpZFVVakg4Wk9SaTZpYWFoYUZrZ09tTVQrY1JlK2FYR0NDSEk0cTJl?=
 =?utf-8?B?a214NW9XR1pGa01SRWpucVdqZEQ4Um9aN2ova01hRlNkKzBmM2xIYjJQd3R1?=
 =?utf-8?B?QXRCRUI4NzBJQVRtVXhWOGNYYldaZkdWWW5UaDFadzhNd1ZJZkZ4L3VDNUxp?=
 =?utf-8?B?NzlrZlY5MHRLb2VlWGJaMjVmazNHdnNjKzMrUUJaRGVWQTYxZDVkdWhuTVph?=
 =?utf-8?B?Z1FmbEU4RXFpaVF0UFBIRlRXR3ZDSzlxMC9Ca0E4eWpJSUdObnE0RFNwbmd2?=
 =?utf-8?B?Z0QzcktIUEJWa1hqZUlRenZybVdjSVhXNGlEOHJVYk1Md3FwTjF1djFsTmh5?=
 =?utf-8?B?czdaOEQxSlk1ZmNqLzVPZXo2MDVHUDhBSjF5bmFRZ2h5RHl1RStTSjNuWFBr?=
 =?utf-8?B?VlYrWjh5WXlxb0FkS2RkN083RHF0eVBpaURjMVh5dGlPaUU5czJOdlpjdG5D?=
 =?utf-8?B?c3pTTmN6ak55ZHJDdHBHUnc0WlpTdTM0czM3Z3NvT2NXUXdOeDdzRlB3Q0Qv?=
 =?utf-8?B?cWJDV3hmQ3UvbXMzWm9EckpxQk5oNFBWQ2hkTm5QQ2xOQkNqcG5lODZUUU16?=
 =?utf-8?B?RVBqdEc3ck0yOWtwclBmWnIwRENpVWJZNzBMd0I5QWlkU25LTm9ia25ZOUU5?=
 =?utf-8?B?OEozUHVFM0pmelppNmhPazBvL3RwWHdJSWZqM1V3ZkwwNlRCR0J5SmI0d0Ux?=
 =?utf-8?B?Rm90aUtlNmZLR0ZDdHpCZG0xVHZBc3IyUm9jRWdyNy9BcUQwNmFtbmdEZFQ3?=
 =?utf-8?B?bjR5REJoYjFObHZzbk1vejMwdlN4eWRwaDVPaGhUa3V0UU40WVlxcUQ1amE1?=
 =?utf-8?B?c2w1a2djakd6emZGUlA5SWxoaCtsZytMVVZkdFJndEdjQysvZ2dVRWNFM0ZN?=
 =?utf-8?B?WHlsc1RMMWl6SnFUYjNLb3dlRGlQSVd4UEZka05wWGoxbXZwQWRJOTEvVEpK?=
 =?utf-8?B?czdqbjU4bitiajhqTi9sWVNiVXJFRjU5VTdRU2pxR0ZKR0lsM0JWYkY5OUtH?=
 =?utf-8?B?cXFGZUVselpQQTVyN1ZGL0prTmw3amVuMmtiSkZGOHVySnpmamd2c3AzQWFm?=
 =?utf-8?B?cnYwVzJ0NHIzNzhJRW82ZUt2M3cxbFNFMWpXWDByUFZQWWVRanQ5RmtMbjRK?=
 =?utf-8?B?ZXpmVkp0TjJmN0ZUY3IrK3VweGlXUjB6QWVGOWJSQzhWWllZRGZiallaaUlh?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c49a032-eb2b-4a0e-1541-08dd60a9e13c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 14:34:50.3812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD0jY5zV3VppfE8bhQP0a7/T0p3/6qRfe1Q23vM4iEKvXa+/G+7wvVAQsIwywFfUdpp4RG4lFkmqk4uP/Igv581JvopTXRoT11kO4pJup38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8666
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



On 11-03-2025 19:31, Michal Wajdeczko wrote:
> It will be easier to understand the meaning of the flr_timeout
> value if the USEC_PER_SEC macro is used in the expression.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5d79b439dd62..7d32d5c6538f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -522,7 +522,7 @@ static bool xe_driver_flr_disabled(struct xe_device *xe)
>    */
>   static void __xe_driver_flr(struct xe_device *xe)
>   {
> -	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
> +	const unsigned int flr_timeout = 3 * USEC_PER_SEC; /* specs recommend a 3s wait */

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>   	int ret;
>   

