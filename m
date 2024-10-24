Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C496FD0BB4A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 02:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB0510E249;
	Thu, 24 Oct 2024 02:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7q5m+lr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FCF10E249
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 02:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729735437; x=1761271437;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V7U1/0Tu9XAOG1Ua0nR1tDDhJHyd4skQjKRSxTt2lTg=;
 b=D7q5m+lrKpICWpn3ujpYx4NHwwmjhA1YUO5pGGkMqh4/v9xFHC8Pp8gB
 taoylzFwGxn+hALOYop8XT2vxUnr0jN/fJHc/SDwzDxuUTL3SO5DrMojH
 Wqj8VfH6vmpBKBXYSgNzpUmQIAXL91lTmcRb8F559NrdLVmUFl0Ljz+gl
 9jLYnZ7WbPYO+Yut2KKcH4uxFvS4WHOPXoDNziuAoxW0J8Lbr30hDyJW4
 qMJLOdzC7+FCEE0Rmj0C/UP2OyPQOU+4jROwBvBGs0Gm7ezcEYtwqFO29
 Y6mSUYc6y7ZGEmMz8xUz9l8ZjmljrG9XPSbGXAUNdnanUM8T13w7Bhdyq A==;
X-CSE-ConnectionGUID: bpKY8xkUTACgj7hOD/hJvQ==
X-CSE-MsgGUID: a4kL25pdR660+8gBVUPw3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="40742472"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="40742472"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 19:03:57 -0700
X-CSE-ConnectionGUID: rV9xksRHTWKi1J96jv5uNw==
X-CSE-MsgGUID: b/m14wHKS1+vDEEZcjUikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="111254437"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 19:02:23 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 19:02:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 19:02:22 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 19:02:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwLjs7iVOJ1Slmhvzx9p+OYS/Z/CBQEFgwzZhknwz1zTng+KpG0A5cjU+C+hYmzhvdC8KY11eYza4Q+AeEu3n/CxGk1iF4zucK7O7sApOqfALJ7ONOBeGrKNjU5AUHUci1Z7eF5aIqmQ4f1hBud8UbtRJJ/ClBxw6noklScXYd34GFYpkyIVtq7195P0yAML2vSxN8iUuK0BoaBgUCjPsOepk2biBPAmwjWMaK/AlyTHX6TJrHAMlja/dahwjidhEhFfgk3LFyD2NePj0aehmp8t4JemTDEibs9cC9RQCcNF6czbTmHEnT3WQ6JeydgTrv3CHktDr2fwrR7b1HIZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/+w8qmgQeYD+MD52dAbh3lDIeczcMtbvTwLX1vWoFk=;
 b=jSH/ltC4EBuFq0ux6WiD0Mjh/ADMDZRX1IqeRwIBbtilD8e7P8yTsNGd6DFtG+INkOTrDcMqLw2X0ReoIyrvhWU7G+mYltibPhqGGK2DjL3JlBbR2qSXdSlhIr6MJnle7zOh/2Q1zTRCw/cQ5Tz+K5Y16oWgffY3hrgL9+HakYBWdhHE16FWIY7dZgwxAFucHYhwjbnq5Wl0K95GdZe6/rvzpVI6iI1cRiOmRq0TaOICdisWOOmevR2nrP1MRvOPGtspfi8/GmcjnO584zmQsHUlZIvg/IcEQm1s4NUEjxZH4L5MplYk5ZeDcwoWDArnAp5OS79pF1o1BUl4Y6rFRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Thu, 24 Oct
 2024 02:02:20 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 02:02:20 +0000
Message-ID: <6e196751-c1bb-429c-a221-398d4dfbecf6@intel.com>
Date: Thu, 24 Oct 2024 07:32:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>, "John
 Harrison" <John.C.Harrison@Intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241023151343.3463640-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f15b79-3303-4132-42fe-08dcf3cfe482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1VkVG5yQnlTUmpHcENneWVVeTdkOFp6WVRRMVdjNVJhWnJaa1c0VlNINmhY?=
 =?utf-8?B?M2FxbjR3WHJiYi9IdCtyK04vS0EzTTZVSitTVmx1QmJtNGxXOWlBSEl4UkQ0?=
 =?utf-8?B?d0phekdaOGRVejczT2hVYzErSVJWRFBNcXh2UFRuNk9GMmVhYXRvWjFad2xU?=
 =?utf-8?B?bnhMdWNyTXcvY0puWjdOcGdIejVjdnRkZFdyLzFRTUtVMXl6S2Nub1lob2Vw?=
 =?utf-8?B?aEhrR2NFUkF6V1g0cVNlQmZwbXpFK0xWYjlYNEZCbVo3c0lSaFZFRWZEVnFy?=
 =?utf-8?B?MVZ1QU5Bdmo4enhKYnlndkpCczVpcTIyRFE2VzBOaENVRXRWMXBWWnJVeUdS?=
 =?utf-8?B?WmJFTE80NC9JWHlsdldEemdoVXh5d21RRXJmVythMVBOaUFaWHNhTGhDMmlM?=
 =?utf-8?B?Rmc1enpIQjFBYSt2WEFDVEJoeTAyQnlRcWJpMFRIdEVXK1BzYmJrZnIrdGNr?=
 =?utf-8?B?d0ZLRXRCQ01mbzlVWmhiYVM5RXZnVFJxT2Vmbk1hQWpSQ1lPMWZsZjBMcXdU?=
 =?utf-8?B?MzZnR2RvRk8vRFY0RjRQeXNCdTZFZjJzc1BnZTBNUzd0UndVNjJ3YnNtcmhM?=
 =?utf-8?B?anJQZEM1cFNaWGxJUXVsZjUwWTJwdG9SY1RIeW9UVDRHbmxHMTJCT2NucStk?=
 =?utf-8?B?NnB1ZzZnNmJ1emhUK0N1VTRTaGZMUlJTUXRiMEo1anMxODZocytOTitoVTBi?=
 =?utf-8?B?clUreXVYMXcyQ0cyOGJ4Z0FhWEJSMllNdEZ0YXVmWGhCUDE3cVdXS09zRU5l?=
 =?utf-8?B?N0RrUkZNRzI5bmJBVk9leWRGMDBON0M0bzBTRlNPbG02ZEFyb1pST3FQNGox?=
 =?utf-8?B?SlpCWmhjMWJQTUhUY3FsNWZkM3IwdGlLV0Vhb2Q3U3labUE5NkFpMVRxdzJa?=
 =?utf-8?B?SG5DSmhneFRZaEhUdEgrSFJEY1JucEYxUUdYN0pqNjlWSzhOakl3MDFOZzlJ?=
 =?utf-8?B?VWo0ZXpWQ0ZCS1JUUzVHN2o5WmdhYjVLbkFsTmoxOVByM09HWnU3ZUxMNllD?=
 =?utf-8?B?ek5BZmhlTHZSKzhLY1k2MGlJSUduNlcvM2xYTUt5cURoMU9PRFVvQms2L0Zv?=
 =?utf-8?B?RkppMk04Y3F5cC9VMHF5eXVRU1FBTU5EbVJ3VTZiVmhySGdIRzFpK1pjNEVK?=
 =?utf-8?B?QU9KZ0VZVEpzTUR0cFBKbU54aGlDK0Y0ZkV1Tm5zR1grYTJrM01WVkRhUGVp?=
 =?utf-8?B?MGJFUEU0N21PSWI5YVE1VE1CSklqODh4emc5a0VVY2U2SUd5dGVvdzIydWFB?=
 =?utf-8?B?dzVCbXlDTlFXcmVJMnZJaGNrVUY5TmlIYnh4RUdhbno4U0RKNjVIekJhWWZz?=
 =?utf-8?B?eklXWnRSOC9MZURmK0FQem1zNkIvcHlwaVYyRVFHMmR0Vlp6R2NXVHg5cGx0?=
 =?utf-8?B?cUJZSmpoQWMrOUJDR055R1hGRytWNHdUeDRienJIUUtGczBpcDg1T2EzaXo0?=
 =?utf-8?B?VlhpcHBDWVFjdzgyVEpYY2ZFMFN6QTV6YXZnakJiY3hIc2lOSkJhVDk5TWVw?=
 =?utf-8?B?NDZXdUwzd1lxNm9ISXpuTER1U3pCd3JoamF5MWdhaXlxNFdVN29aYnNLcGNH?=
 =?utf-8?B?Vk5TajRyUVkwRUh4THdxdit6MHFwdEE4OUphQ1k3YkdZL0tpSlRkbzkzQ1dk?=
 =?utf-8?B?TmVFV1dnUzZIVzhjTjlOZ0VkSEh1aUwxdE5tQThlRWwyK09yTFRKeWdWeTgv?=
 =?utf-8?B?TmJldkl4V3h6N1VCYmZrb2Q0akNERjZOMVN5UFVoSlBSNmROS0xYdmNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm5jN3NOT3V3UUVxbjYyaFNPaGt0ckx1OC9qYUtOVFNPdnp6dG1jdGZhQWNK?=
 =?utf-8?B?QXRQQUt0M09UcytDR1NqVzlYczBOTzNQbGROK1NqZmp0ckJhZkhpbVRHR3po?=
 =?utf-8?B?dUc2VGtRSWVqdldsRE5McVZzbUd2d1BQdWVySVVRVWNlYy9XdHFzNlNqRGhT?=
 =?utf-8?B?NzVIMnJpOXlqMnRKOGhYWXZGR2dRSzRvdFdBdkM4d2hncWora2wrSnI4MFVh?=
 =?utf-8?B?OG9uWkxDU2xNdGFVTitaTHZUazZTTDBCeFdwSEF1Q1A5YlNaTVEyRGNwNkJz?=
 =?utf-8?B?eWJDUlRWcm9kYWxvKzVWUVFQZjhueVphRlREVzRCWktCU21CTW5kV0w3bXUz?=
 =?utf-8?B?Tmh5eS9EY0ZiaEdCS3g4UnNLVHlrMXFveGl6MlhvNmxRNGJhNXl6Tlh5Z3lq?=
 =?utf-8?B?NjVuSzIzWFQ5dFpHMXpxL3Ird053QmJ2SlBVTWc1QnF5NG9RaWdzL2IyYlgx?=
 =?utf-8?B?RzdUTGtOOXczemFrOTBBb256dE0xTm1MUVd3WkROVlVKMDMyczMxM2ZhV1Zn?=
 =?utf-8?B?R0Y4VEJxVjV4SXpyMFFrcDM4U0ZOS2p6Y0pkNUtKdlg4bHFGN0xaYTJYc2Zq?=
 =?utf-8?B?Ly9YNWdtQ3VYK3Zzc2hlNlJsWVV1RzVrV2lSK0NLd0JLK3FtUUpUOTZYVUt2?=
 =?utf-8?B?V0loYk9hWVh5cENEMlQ4YVAxVXZIaTJuWWJZdGc3d1dJSnVYL0k1ZTlMcTk5?=
 =?utf-8?B?OHljRExKQjN1SmpFTUlyM3h2WkZKbWE4Sk51UjFtRGJXaHNkemxrK0hqMzA5?=
 =?utf-8?B?aDFpZlVoOHdkOVNMQ2VJQW5zUitLaGVzS1l0elBOVDRENm54b0pRa0h5NDB0?=
 =?utf-8?B?M0xjaHN1VjZTZFlqUWM2ay9QUFFFL2V2SUpmWWdaZ3lZWmI4cDY2OThYREdv?=
 =?utf-8?B?UVMwOUJSMHc3cGxjU0Z1RnZYL1VzMUNxV2syZnlna0l4Tk1Cb0w3T1Raamly?=
 =?utf-8?B?dTJRNmJPMUhIYWVLaTJCdkxueWkvRy9wbHRIM1o3dnA3S3FtR2dWQW9kZnBN?=
 =?utf-8?B?MDJUaFFqZWFka1FmZDVQQjVnT0twSHYyRGt0NkZTSmJvQUFYR2VQYjZCY0pB?=
 =?utf-8?B?RTdvclZSL01DZUZEekJ2Ykw0Tjd1T0FhSlBCU3pQRVRaam9Xc1JOTzlYMHZJ?=
 =?utf-8?B?S216Yzlhb1B3cHJoNUtBYThyd1VqQzBRRDBTdlpvaVd4OGZxOWhURkErZUww?=
 =?utf-8?B?dWpNWWc2MmNXd3dqejJ0aWs4dkpPTmtIeFVSODl6WGdOOTg0ZzRWeUNqQW01?=
 =?utf-8?B?a25VejJmREJManRQd3hQM3grenRFalpmcEMvNmpKM280V3pCQUMwL1dicmdr?=
 =?utf-8?B?blhKSzZMVUxHbmhzd0FqVVl5Q2x3dmJDaGwvS3F2YjdjS2toN09SZ1RRUEpy?=
 =?utf-8?B?MmFnSWZwclRBbGdrcWI2S1diSlFvM2piOTQrK2g5YTVFMCtMOHFTcjJ0eGtw?=
 =?utf-8?B?MTFoQ1RZRng0N09IeTlRR09tTDJoYy9GKzVXRk5kUEVIL25RYzQrMVdBbDgy?=
 =?utf-8?B?L3RJcHZpenVIczE0K0dmWVBwYVVLR210Z1RQNWkzRG1EM0djZWtnVTlGSURP?=
 =?utf-8?B?eC9qSzBxY3k0aHJYL3dVTnRIVzlWcEcra043UGVHdzNOREd6L2twcCtRQ3RO?=
 =?utf-8?B?b0JjdkVndU1Da0xMWTMyTm9HNkw3ZkVRQ1JvNjR6WTBZWkhxdkVGQW42VnNo?=
 =?utf-8?B?RFFOeFFQZUUwVjhHK0ZkdDFXL1Rlc0VxMkxLZ09YSndZYm5ZTkxIMmhCRk9D?=
 =?utf-8?B?UjRaT05aWDZVOFVLbmZLZEhnZzB1UFR3UUYxS1VhOENVd0FUK0I0KzhEbm1N?=
 =?utf-8?B?ak5MeVRCL0VUZStYb00xSkJLSktGaUZuZnlSL2tEbitHcnQ3cVdEbFM5QmFU?=
 =?utf-8?B?T0hqQXY4WFkxOVdiSkIrOVFsdkI0NTZJYnpKYlAyaCtWS3poSEsvSEdlNms3?=
 =?utf-8?B?aFFKVGFwQUMyYVdhYTZ1ZU03Q0ZLNXpNcm5IbzlNT3Q4NFZ6OVVDd1Bycldy?=
 =?utf-8?B?YTkxRFBIN2Z0cFhqZ01XRTNFYTFVTzhPT2JTWndVd3QyWXZHdnpjOHVYbEJq?=
 =?utf-8?B?UmE1bENoRC90Mko0Tm9UdFZiK2RySUxhOSt3bVdrYkUvR2dFUEwwNTlBa1gy?=
 =?utf-8?B?bFhqcTRQWTd6U2hlSGd1eWs1MTJKRnhkNzY5dERydjJBZlNFbWRxdzVldTgy?=
 =?utf-8?Q?wu+ccLFTNIi/3uXWhcYWlC4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f15b79-3303-4132-42fe-08dcf3cfe482
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:02:20.0209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWQCY9P/N1n6lIHWdpr98gynXecS4X7PK/KPt17BFgl0/T9HRm9AzJBac4eT3aohzOc3eM9ccDGdwzcbslxaglNZmgbQ33GyoZvYjCibcg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
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



On 23-10-2024 20:43, Nirmoy Das wrote:
> Flush the g2h worker explicitly if TLB timeout happens which is
> observed on LNL and that points recent scheduling issue with E-cores.
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is E core
> scheduling fix.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687


The issue is not only limited to LNL but is also observed on BMG and
DG2. As far as I know, other host CPUs are not eECORES, so the reason
for failure on BMG won’t be the same. In my opinion, we should limit
this workaround to LNL and continue debugging BMG to find the root
cause.

Probably it will be better to add platform check even on e51527233804.

On BMG and DG2:
https://patchwork.freedesktop.org/series/140267/ series from Matt might 
help solve this.

BR
Himal

> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 773de1f08db9..2c327dccbd74 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_gt_tlb_invalidation_fence *fence, *next;
>   
> +	/*
> +	 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
> +	 * in case of g2h response timeout")
> +	 *
> +	 * TODO: Drop this change once workqueue scheduling delay issue is
> +	 * fixed on LNL Hybrid CPU.
> +	 */
> +	flush_work(&gt->uc.guc.ct.g2h_worker);
> +
>   	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>   	list_for_each_entry_safe(fence, next,
>   				 &gt->tlb_invalidation.pending_fences, link) {

