Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C703C606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J1cXKsA5;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=SajLZUJH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E78510E5B5;
	Tue, 24 Nov 2026 05:13:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB9010E5B5
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 05:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795497196; x=1827033196;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8U49SgFNcCeunOZCx0lDdc1Y9XXHlwYZcDYZuV2lPD0=;
 b=J1cXKsA5wkM4xI7cUNtTKvijtMQjlz9m+GkLHnfO25dRvKTMVCPWaTtI
 /TJ0U/Kpk70t1xYr92DKMNn2Sx97EEkJ8SvrStVEDXoj1zC3GWVBQuOav
 6okBV51WK3ngQg+bSRqX00+HtBFsh+34ZwvXVPjhJO/I4rD1ns2DDzLn7
 JZpxFoJ0sSxEsjv/o9cwCtjsXVGzjdT3RbF7hbP95s53KI2v56ulfoN+Y
 yOOpWewPTbwW3kxQBgHMVHg73tOKKv/s7HSyS/k8KaHK2eX2mACWSv2bi
 Qe1GxvaacJ2A1fHl4WhDxcSX7Hq6c8Xk1HxY8O7mTjk8Kd1f86K70ZKbd g==;
X-CSE-ConnectionGUID: ZFP2GElPQ3mEtmex8yVSJw==
X-CSE-MsgGUID: ph1TsC0HR2ClK47weqy6vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4209737"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4209737"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:13:16 -0800
X-CSE-ConnectionGUID: DoG7c8pWT+Clyqv0ALh5tw==
X-CSE-MsgGUID: OFKFnAdnQ1mOAv80YrsZaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11809515"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:13:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 21:13:15 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 21:13:15 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 21:13:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEGWzCuxUU8FTmel/WjS29sejvauTYH5oXZn2tnt2YmX1M6HLgvRTvdMFgMQUqFasVWzwZvtQITxpwtw+kYsA6FdNUm49+1gCuwhjhYp5W7Fx0CXQvRmbi7Wn5mJnpbKA88+Dg4Tg5OlPbW0Whw20+eQExx3jjKr0mAmJE6foIo42CGhTKlMqP8tOG30SOsMU/bzIOcCDYY5Jr1BylRpzpkPOJVRNKP4527Yadm9T6IOG3WX/fxUyRXrBuN8bAywrNwOiC9alAi56oX70lZQlJfHakJQchz4TxFiGMcVPwPEqtYF4KWPLggvuW7gTnpYUAKZBRt4XyrepXs6D4iacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgKkmYDTM6Iwmf9Gohr3/3atY1tAx85Ij82KUf4b6WQ=;
 b=jHwFCJTTKuMqRx/5YjQROksG+a+IZWB8fnez84Dru826Dcxpko86CjRDdUX3bhgcioaTe4aJya064ToSHtCKQJZ8RDjDZHNNWouBcy5uRmdmqbJXw/NMQ7+KSOdR+pkpFK5oEHH6OJ7wGsS2BrosdGk2hZzAW2eqlQITiLefwfBWKgiswpmuIN3BX0veFRZxKBShzcA+l9CSX69LmRJ8Xa44kw5qZurBZeMEOTD22S/O4j/U/4HcCkl5DaIZOGPNbXQfkKWBdMEygZdTbeztZW7hmfM+kDu6GhAP6oMw8YAioq4pCr/yJ0PqWZVzIgVDEZleFYh4rnaAmHhq9ncLfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgKkmYDTM6Iwmf9Gohr3/3atY1tAx85Ij82KUf4b6WQ=;
 b=SajLZUJHvJ2XgK+VX2L+6S/KTnVdizIlXeeeG+Cv5AiTvbvHS7jKg6djxQ4V2zsRxdNfVbwOrvunSFaRcApr12u5GWr9b6Hcz42kW43fdo9MLr8+jhB4XrYnG0k1B2DhhNYL4mEwJqXxnLGk9QGypYyqBw0IPPq8/PHBJ3VSoOs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by CY8PR11MB7826.namprd11.prod.outlook.com (2603:10b6:930:76::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 05:13:07 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 05:13:06 +0000
Message-ID: <fc93c3af-723b-4571-a9e8-c29eaadf283d@intel.com>
Date: Tue, 24 Nov 2026 10:42:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/cper: Add GUIDs for device IDs 6753-6756
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <aravind.iddamsetty@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20261123171241.526322-2-badal.nilawar@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261123171241.526322-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0072.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::12) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|CY8PR11MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: d428edd6-0cfa-4e34-ec38-08df49e99f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|11063799006|261021121427099003|56012099006|261022113327099003|261009223027099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RxDAQ5KAx0KSpxtGH4aKpz/DBpNgdNVwHHoibDeDi2J/MpdFIK0bCz7gT2vZMw/pAgdIxq/0Icf4MXZ+nJYYtBQKN68pLzhwb+IF17uozKP8IBZ0J33xEIBenGJO6yigVmp/Vz2KhDBMQr5PgLVzwvfqfs9wU1HeTOoUhesdvcTWQ5/GHB9u259Uj0K+oHyiNSYFHKxgdb6mLUj7wEptmXknsR0JuJTH2a5gfD9rK6It9DARaPW/N28nOtR4cSAS69exGt3xiI/AcclaxCsancggDn5eLcr7nKd0osSmrq76i7uV6Sb17+srHm+kh0Oz52q4B439pS7bL89J+JLP0juB22TphczQWpWfJIuZG4F0TamUxHalroZgNr2+3I7o9dJmhStv9WrwlGPpsX2zhn/z+MhnLk1BCq56qiCZ9+uV0BgBsXZ5lLLSfs4ofs4sW7Lc0rcA69qmsNREEmyChW7QNOSPN9cDWmhBZfcN02BS4bV015t+XqLyOwbbclLgjQC0qVSBR7zTwMo8a5mNooIH2KA7KsuXSlQzUrJbhH9cNCRe2g/YT/VlA5kyW7OAJRICWevZ+CFS8gVIKo3cwfkL/J17KC101OSdVCaL5svgGQqeKife7iYrFRpB0WdR76dcp6GoIokS8B9pfpoxt4TsEDKsJi3gKGcMjb1AuAI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(11063799006)(261021121427099003)(56012099006)(261022113327099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXl4eGN0ZFpVSW4zZ3BCOWRpTXg2M1l6NjZINUxzMUpYZFVjY3k5OXhTejZz?=
 =?utf-8?B?UWpTNFVZQkU0L29pcFF1VkMwTGFoZ1U0Q3JvNkhDbHRGZjVzMzIyNDExZ1dP?=
 =?utf-8?B?bklEdlArV3BjY0ZKelQxeGNZQmlSdnVXVWY0Qnh5VVZQSmpQYmRXMEdWRFkv?=
 =?utf-8?B?WEFuN1kwUVNsSEd1dFZHbk5UMFVzOXVnSVZkL3BYYy9UL0tkOTBxcDIrdWJZ?=
 =?utf-8?B?dHZ3Wm02bU5xOXhLekdYdE5JQ1dWUWwyWHRFT0NjenkrTStPQ2hTb1R1dzdu?=
 =?utf-8?B?UzZzTVV6UGgxZFUvbmFPY3Q1RWYrMWhlNTZ6bU9nOUNnbWFwUEZzalgvNjB2?=
 =?utf-8?B?MHRqc05FK256Z2MzZFQ5bmtpUS9raFVEd05HTEFuUkNrZTVYUUNpRVBnOGQr?=
 =?utf-8?B?aitJY0Y0SDFDWDZLL2ExclAxbFBDaUR5VFNpeXRPbkZJcCtVVGNGT0x5ZEJu?=
 =?utf-8?B?VEJLeU1MK1dGTDZyYUlQZ1JzMjVTelpkODBYSk45NXcyb3FxYTRXTGZIblpn?=
 =?utf-8?B?VUVTQkRHUU96cm4yV3N0VGEyR1NTZktteTRZcHRseU5MMkpvbnI4RTkvOVFq?=
 =?utf-8?B?Vk84OE84R3JFU095K3dlT29xdGltL0FoU0V4U0tnM1g2QTJVeWs1bEp5U3A3?=
 =?utf-8?B?bjFzQUVUMHlFNWtjZUEyeW80cmJWM0ZjSWI3VEFWRy9ZcFFDd3REYU5Ha0dO?=
 =?utf-8?B?TEZqZ0hXcFFhd1lpbGVZS2JERkdFTWU3SFIydjgzTUJ0dmUva0tCbWlCdGw1?=
 =?utf-8?B?U2xLOU9GZ01FdlZINkdGbmwvcjRTekgzZFZ3bWtnV2JSWGxwNWhsQWFkbFMv?=
 =?utf-8?B?a1ZDMEJSQTZXd0x4S2M5dHVQZFlzU3doTzErVFpySWNXNjNqMy9OVWdUbU9V?=
 =?utf-8?B?Z1ZkMUhVbFVlUW1QUitDaTBCWWZXakRyOEJpOFFnaUpQNXY1RmVaeHZlZThh?=
 =?utf-8?B?b1FGNkZGWkhZTW0zQmZYeit2Q2xzenlqVTBpempocEkvb0JTSGhTNnlTa1pw?=
 =?utf-8?B?QU9NQTNaK1hWWEVhNlNBUFBqVWVqazBSNGpLUUMvY3drZGtWbzJFS2dFNmpC?=
 =?utf-8?B?WXAxSGJjUnovdTArZ1RlQ1l2MjFSUWxRMjI0ZTIzbWlVdithQTBvcWJpVEJl?=
 =?utf-8?B?Z3hDZlZRYXFBZkxMWDI5NFBxMHZZOVJIK2tsd3haNW52QkFSejkweXZEd2Ux?=
 =?utf-8?B?cmtnRFRPT1htWVdvUC9yNEZueTk1M3V0SDFvT1VJa2cwWXhZVEtoTkp6WVVo?=
 =?utf-8?B?VndiaXJSNlltMGFaNVk4Z0RnQlN3VGQwK3FERjQ0QXFqYk1ORWI0THFDWnhO?=
 =?utf-8?B?M2tsaVdSTUtXbzNoU1h4TEk1Y2VIditIMXBuTmIvSkdRcmI5bG5LbktFNUgy?=
 =?utf-8?B?Y1RRaTU2SU12WEVDTlU4NWFNaUwrcUtCUE5tVUFZanJpakJJVDFoWW5UUXha?=
 =?utf-8?B?VW13dHBITGpLajNDakh1aTZhRzh5WHpEb2VSY1FSZFFSRkwyZnFYc09UanRS?=
 =?utf-8?B?NU1NSFR4OSt6bmh6NFZSbk5LSjFabllQVjUzbFF2STJKeGNlWEUxdFVnak9S?=
 =?utf-8?B?MjVMVFRKaDVXZWM0OS9tNHpycHFHUW1kbzVJZnYyUDc1cEhOWlhGSFNkM0Rn?=
 =?utf-8?B?R2pPZzllQXVmWUlkSUErUUpsTDZNcVZhOTNFekhyc0ZnRjN0ZjVKeGVFcElX?=
 =?utf-8?B?M05BWFcrUGFjZk1WL3dwbGZXL3l2WEhJUHpBMlBjdllTUnk2ZjEwclhPNzhP?=
 =?utf-8?B?b0YweDdsdHdRZUo0UlRHbzhvT21aQ1BVUGtLT2VaVzZ1TzJPUVR1TjNxRFM1?=
 =?utf-8?B?SkI0ckVhZXpoc2hhTGZ0VmFZTFlKbTUxQzNLODI3UGp1azdYdnBSSmhDelNs?=
 =?utf-8?B?b0hQNXpsTExlOGp6ZGhXUklTQzIxY0VxaU5rZ0ZzZHBzT3pNZW12ZkJwT3I2?=
 =?utf-8?B?TENUdVhEQk44Zy91L1REdFZoeWN2NkNrK05pb3lUb1k4c0t1NmcvSGdrejhz?=
 =?utf-8?B?R0dIdllOTzRucjIyWWd6ZUdJZGdKZlVMc2Q2M0NvQ0FpMzgySThrb0JtVHFw?=
 =?utf-8?B?dUdIbUFDYmJrVzNDOVhuVnZBNWpnWmg4UVhqS0xKczdXbFkvOG10ZHlSS25K?=
 =?utf-8?B?QzFBbWdYazBNNDVjZTNrVE15V0pIekVEVWlFd0x1YkVDUFRDaTBvVldpc25Z?=
 =?utf-8?B?eDZ6YkVOWStUT1dhY3IxQ1MvSjdJMXR0WUpqNGR0TUkwdG1OZ3FBSXBtWjN0?=
 =?utf-8?B?MWdaMnd4cElGeXA0NXpFdHlsa2UyRnBEVWNaNTJKejJCVDJxOU8vL2p1aGEr?=
 =?utf-8?B?SkcxdDM4ZEZOQU1lRW5uUUNwRmhxUy9GUzZxVGl5WGVSMEFHL1Z4T3V3bFAw?=
 =?utf-8?Q?uVw9qHVA2UqA0cIM=3D?=
X-Exchange-RoutingPolicyChecked: F2ewziLGIsGB6NFWYD3uRDmgD4vpWCcTp+xQ/L44U6ZK+yVY/kf8I6DPfm8eRTI9VA4v/2EzvK9UVom613oRHQ0f3iK+vRwGuBhcpUjZJMvjeBu8EXDh3WR5h41gNyBlPivq4Q78hd32SXNz2MAWQRBUw2CUEbjSd+IQhoyvJ7+FEXMyCqZ9HeN6CF/2V/TsK6UdTy5kXKR7iqIPadniVTEzhjNJXndvYEr3vaaii2kMDsEbzGS347ke4XhMF7bk/TvFRFgMLz/apIpkv89es+pe5w6Pqh+CI+nsZz43gJ4fv9EgBGrMimonC1kN4jrgSDK1tDdrpqjzaNWw7xChrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d428edd6-0cfa-4e34-ec38-08df49e99f43
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 05:13:06.1229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sB/UezYtHt62sxI6nHiV0LTj3omoyGuONXZWLMif1J+B5ARqki4OBKvAVbFMzgALQz2y44KClXgZZtHqHeVm/eRKUSWF3+3/Jmo8tHJ4Po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7826
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 23-11-2026 10:42 pm, Badal Nilawar wrote:
> Add the GUID mappings required for device IDs 0x6753 through 0x6756.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_cper.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 1b80b365fc73..64bbb149e4e3 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -48,6 +48,14 @@ static const struct xe_device_guid_entry xe_device_guids[] = {
>   			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
>   	{ 0x6752, GUID_INIT(0xb778ead8, 0x0009, 0x59a7,
>   			    0xa1, 0x3a, 0x78, 0xce, 0x4d, 0xdd, 0xae, 0xf5) },
> +	{ 0x6753, GUID_INIT(0x7fcd80a7, 0xca5a, 0x5d21,
> +			    0x97, 0x0f, 0xe7, 0x6a, 0xc0, 0x27, 0xbb, 0x76) },
> +	{ 0x6754, GUID_INIT(0xf87c6f75, 0x96c1, 0x5ce4,
> +			    0x86, 0x75, 0xc7, 0xaa, 0x04, 0xbc, 0xc6, 0xd8) },
> +	{ 0x6755, GUID_INIT(0x839514b4, 0xf269, 0x5e61,
> +			    0xba, 0x2f, 0x79, 0x08, 0xa7, 0x59, 0x06, 0x5f) },
> +	{ 0x6756, GUID_INIT(0x5003ffda, 0xab3f, 0x5ae1,
> +			    0xb3, 0xbd, 0x19, 0x60, 0x0e, 0x0d, 0x4c, 0xc2) },
>   };
>   
>   static const guid_t *lookup_device_guid(struct xe_device *xe)
