Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE84606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 06:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fKOEj6vN;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NiGLj0mX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D0110E17B;
	Mon, 23 Nov 2026 06:43:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9CA10E17B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 06:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795416205; x=1826952205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Igmh+rd3fdc+3vZBYxckOdqbfqCbpL3Fa6Uq8alUaow=;
 b=fKOEj6vNh5RZgt9jtorB8NDjHxKyRtN7Jp6Y/Bk9/f/t+L1rvYxLtjEh
 eYN73i/4HummtLZhu6UQ+vu7K7jkOt+t/HfJk9DYtfXzr2sgAOVc69IuW
 1ecVoCiZ1s/ZdoP1ishneGnRYoK7yqrlAODT9SUNh3C88crRc6DGlJmHX
 AWk+j73yfEOrUWvwCuuQO/5Kdjv5AtddyJSE5YT3UAfEttE9RlixlTEdm
 /ChdAdkrKY30MqmABAZsLHQyXywAZtaXyCgPCrLsuoWcLEEXR4S8341z2
 UeMMT7OlMapaKLhatQiYPjH4LdSMwv77vXn4NpbBPkmFJt023b7iGjmvd A==;
X-CSE-ConnectionGUID: hZ+G2KHqRJCRRo5nup8pDA==
X-CSE-MsgGUID: Yz4LVB6tQqGzB5sudqyFHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4109681"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4109681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:43:24 -0800
X-CSE-ConnectionGUID: 1dz1PdyrSB6oJiFTYzqc6g==
X-CSE-MsgGUID: mcJE/1jKQg68y9jlt4syGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11785157"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:43:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 22:43:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 22:43:23 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 22:43:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0X8LoVMf87Zq8fy46E2xXD1CVuLTWMkh4tkjeAiv++ZIs+6VdBE5jhVLJL4atK2DBcTtLFsSXYPnf6GCr1nOFcf24IybNWB/wo3dwzX+XI7lGCq43JpapSDZtVQJvWcm3jukITe8OvH30NojaEOEcJEVlLOYY5xiulMPUwD0Pi/8b0of2WGGgXgkFhqUXIWo+kMNGAWdPmaDQHTKyMTvU52wIHNjdVAv/fOLGmolD0EzroOEeFD0IPmf5jve/GEaQVYkIzBvsGZlUS4eGtN2VOfgLFyBigaDc+8CGpEphYKEtIDYBV/1YyhWYo86vnZNBLOt34GLs18hG4gN+Nw5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98wDcYBPmc35BB+qwaC0JOPBAszukXokOr3yBa0vCDE=;
 b=whRISB/Wtjf6EcP3E9XnLVFO7PlF8FxakYV4isSol4faFxkYs7+aaDn7zU+f9SszcH3hyht8X0fCwrkrx7mu1NnUnymCLZgKPWEyu/vwRvgfC09I8esUfuVnc0J/s2tmtMGsgq81ZKIXGaz/V+JGP0Xtl235rH+58wZd9jHSfixVQOv4Suatu2BYXW7V6sFAAm1KwgdDIHdZ/eNHo04tHxc8SJ909kgmWStPBIUhEE2aEkNXKoBRi+EPmtY2SyCA1PG880C7haoTXqEIuFUwZMiFhda340lQom6feX+r/GwQqngeCtfMCAQjJHdRoEWZiZIbsw5LuS6oZAtNbxnqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98wDcYBPmc35BB+qwaC0JOPBAszukXokOr3yBa0vCDE=;
 b=NiGLj0mXip55o2d5rYTqN43Bg/UKGhuQXwxtliugdo2ALJlupfczfhbpJPmUw+zm/YIGZnpmFOx0VrFVBglgnY0u2fhkRuHCrMTmhm8r7P2mr95oV/L/Epjwme2j/nE5FA7rD8omvUPgdqEXrFzAysxEHFiUyBLcb50sxWFpmFA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 06:43:09 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 06:43:09 +0000
Message-ID: <2a41b6cb-2c46-4606-bdfb-b4972fe9bc0e@intel.com>
Date: Mon, 23 Nov 2026 12:13:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/xe_ras: Skip gpu_health sysfs commands
 during reset or wedged
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <soham.purkait@intel.com>, <riana.tauro@intel.com>,
 <raag.jadav@intel.com>, <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20261119163913.1760721-1-ravi.kishore.koppuravuri@intel.com>
 <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
 <221bc3cf-1ebc-48e6-a09b-ccc78ab0a81c@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <221bc3cf-1ebc-48e6-a09b-ccc78ab0a81c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0321.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::19) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|CH3PR11MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: 2579c44e-ed9e-44a9-1258-08df492d0931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|261009223027099003|20046099003|261021121427099003|261026140227099003|261102123227099003|261022105027099003|261028144727099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: vL2AxhHsJaVmUJtLhO8ncV9gDq+1VbiaXeWza7Snjjka9DudlKyrPYdC3XA07PLUN4hLu4qCX1bADP+/GEOwRLaRPyJAFGJRJkfY4WyGQ3j/Z8zTuJACqX0qTuib4nCYmOQCdxK11gasVuH0K4BiT+lBKJmKdcb7Uanx0ZFqraHZZx3k+4LcX9NGM3M2zWgqpX9pTdELG8pC1sUnNUhpmT1Hzp2lhx/vNDaVerGQ/vcNBCIUlY6XcWynDwo0LQ06JLAiR4pN0lSDPLI/TuAQETP6vGxpeKV/gqzRtRXDaIfDWWlwpmJapR7fQPgOGxj6zLulPxHiVr3hMNKanHTBCCV6zbvmTczWdCnm+jcS2SRxtX/zwzWHcryAdH8YcSVqERvBlyskSpv0cIxvPkMvrXSTiQIJeOBwV8q43FeAme5yK58WHHHPGJyQ157z8o8bdzSSXGgYRV0a99xsXHoZEq10uprgyDQqi/aN0ZtLHSCabbsi+lS6iFXSzNrJU9wexcxFqwyVxuKh2KAHhIPwvg2F3RrqW2mk2KcC8bNl4GK87XlR8GXYtKi2/JCkNkr7LldFo2GQyV4fsgOKAdeTf+Iml0SYEcbUBj3pwLDj9YN7J4bXLsEcnrqv9QMM8BEyAKWI3DzUuhavArxAt43yk9bNfmM9Y6u3BSJ8CSltCTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(261009223027099003)(20046099003)(261021121427099003)(261026140227099003)(261102123227099003)(261022105027099003)(261028144727099003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3RHdXF0K3FlN1piQ21tNGZDWGJtQU9CeHVDNC9qcWJJSEFDUFIrYURIUWJV?=
 =?utf-8?B?d2xrdVN0SFJrSGo2UlExVWVDYUtlbm1lNjY1TW1NZWFqS2dKZk5UbUJXMGdn?=
 =?utf-8?B?T2hCb3duSGt6V3dXcmQvKzNLbkRmbldYOFZzNGNzNk9yb3h3WFNhUGFZOVNu?=
 =?utf-8?B?Y283TTl5aDVKNEhRT1lKWjJtV3RsMVVTY3QyNHZ3eHo2ckIzckNBZm5Oaksr?=
 =?utf-8?B?M2J3ZmdVZTh4SysxcGNEdmFvOC9uaEp1YUtVUURGMVhtWGUxcEVjaDVhNldQ?=
 =?utf-8?B?ZDNaRGlUMHJCZS9JZFlRejZaU0ZxTzBaZTFnVEdQOXBpTTV3R2U1Mm5makVu?=
 =?utf-8?B?aGUvakFqc3llaDNNc0owUkEyQjVnOEZZbkZ0bVlrVmR4a1NMYkVvSmIxZXpw?=
 =?utf-8?B?ZVN6OG1BUEpUZHBxRFVNR1BURWtDQzJTZ2JnWlErd2FWUWRpbi9YZXJCSXg5?=
 =?utf-8?B?VmptMDJZZEZsOExBdmF2dnUwSTRQZVlMVzFtZ2dlM1RkWWQ1cFlGSFJVSzFG?=
 =?utf-8?B?MzJHTU5DNG1XRG5nRkQ1Y1BBVGJEdmdvaC9od3Rya2Z5aURYQi9DdnZIbkx2?=
 =?utf-8?B?WjRDdm9jV0psR2xkOHpQcTlyUzFEWFdvQzlxOHJYR0hpVDNENjZzejBzSWs0?=
 =?utf-8?B?bXhTQ1cyeXF0RGxBZFhSVGxhV0NOSWhlRDk5aHVBSFRWT1UySGs5SExnZWdj?=
 =?utf-8?B?WXI5Rkh0ZTUyZnNFL1VHUkhyQ2tOWlJGL0hBb0oyckd1S3MvU3N3d2tmTmJ5?=
 =?utf-8?B?NTNFYllPUFNJNmRZdW1ZOWhSUUgrZ1IwZ1BIc2tqdHZDSGZZeExGUUwvd29S?=
 =?utf-8?B?eFNjOXdRcGY5d3hndmJHanRjTC9uOXBaRk1KeDJ6cDNQaktiKzNkV1VJVFV3?=
 =?utf-8?B?ak5jUW0zaGM1cU1Hak1JVW9tbVU0NVZ0SldHVVNQQjB5ZXQ2bHA2L21CdTNv?=
 =?utf-8?B?Q2JIWFNaU2lYclhET0JlbkJFbUFaV3JFYmlzTU9OaFRMSVdMNFFqczB4SVpL?=
 =?utf-8?B?Vmg5Ty9oVit1ZEIzTFpSS2ZiMG5lNy9YeUdJc0lCN1BOenczQkZydk1KNXZP?=
 =?utf-8?B?dVJJK2YrYUxQY2hPeUwyT3JQY0dLK3VVZUNlVEllTS9MU0NhZUFGQ0o0czdE?=
 =?utf-8?B?cnZTMDlZYXM5MkdIUm8rVHJzS29VNTE1UTVvMFJnMElCazNmWE42YTV6R0hL?=
 =?utf-8?B?WTJySENta3g4Vy8zRDdjTWlFMTNUNGR6NERSaGovemF2ZnlsTktoYW8xTG5S?=
 =?utf-8?B?RVZPS0VKaEszUlkzSW5mL09HUnpFTXNkWU1tc1NpZ0F0dkN4cFdTMU5ySWdV?=
 =?utf-8?B?ODBNZHhDUFNyNjB6ZG5nZFpab3BUMkF0K3lKNFdVR1ZjU3BUT3l3NDBRZW1s?=
 =?utf-8?B?QXNiNFNhVkhqVjlhOHo5UVBNYlhQdk5pT3JOS1NRSThXYzY0cTBiVE1lWllz?=
 =?utf-8?B?UEtqK2N6NWpiK1VqbkhURng4RkZoUDY3NERCRWxrSG5HSjZzMzVkRTg2THc0?=
 =?utf-8?B?czliRFRlbTJkdWVCMmordWR1V1Q1Y1ZjN2J5ZkpYTTMvVk1Rc0hoRHN6K0JM?=
 =?utf-8?B?RTF3bnRPeDZXOWRITHg2UW8yUUR3ZkFndHhWMktaREpyY1Y4cHlVYTVCbVlL?=
 =?utf-8?B?RjgwSHhlWXpmbGtIeUNsQzdhNVZOVFVBdG10ci84RVRDb2pFRmx6eTdnVlFR?=
 =?utf-8?B?Qm1kR05QcTF1a0pqZDBtbnhkWXlneGhlSDVJcGFkQjVwem9BTkRrMExrRXIr?=
 =?utf-8?B?N1IwdmhhZEU3V250SzRDWXc2NkRNNjIxU04zN1ArQlNVdjhJcVR1aFFZTU9W?=
 =?utf-8?B?SkRmYUJXaG5PVWhCMlpjcysrMEdDVTRDNzcxVzlJMmdZd1hGME5NMDBjaU1K?=
 =?utf-8?B?YUgrK1N6ZlZNNUFJNlRRb2pwcFdTQ0w0Zkdsa1E3U3djdUxXQi90V1RzOWxP?=
 =?utf-8?B?akxreXQxOG9wQVFSSGNRRHFjS2NvVzRBR2hFRHRSdVBZRDg4NUlVOW5Dcmds?=
 =?utf-8?B?RmhQbTFWLzFwRUVINjlITlRwNk5KWTNlVWc2VHlmTUt5cnlTcTlIVU1qQlI3?=
 =?utf-8?B?YzVRNE94a0E5SkE3VGJ6UCt0b3BrdDVwbnFXcU5GR0ZOeGZ5TU8zUERrMFht?=
 =?utf-8?B?T1I5UzYwK251bEg1WDhTVTkzR0U5aXB3RHJKVVRSZzdSbGhwOStCclNvSktB?=
 =?utf-8?B?UG1vZ3NpdGVGZVhVQlIwazlnUGNYNmNFRkNXZGdLUVF2anhPUUZiZlc0R1NQ?=
 =?utf-8?B?SWxOanJRWnhvN2RodTVOVW1NK1l2b2NzVXRzMW1BbmdoOUwycVVDT2t3dW92?=
 =?utf-8?B?S1RJMWc2TzJjQjdlWFppek95K2l3eTVMRldKTUhEditFUE45ZmxvczRzb1hI?=
 =?utf-8?Q?MKcHu9oi4+KYoQIDaEwcVSxS53DI9K5HwCPXX?=
X-Exchange-RoutingPolicyChecked: gm6+F3wBLlUIgw+VjUGitVOEH6hIrcJ9Q3G6F/s7AI9u3rkNsju/nOvLG3MVceHKGh2Lu3yWTxB8Q0UB432D6Ux/7txRFOFyNCwSFXKfVl2GRYzOFWMrc6a2zxRVbRPp9JCNl0aawjKb1RCoS1JHzWuuvhSlLfcyMiWSzVtjhnnuvw+IS3EbAzeE/P1mCfLbqjZLYxPxvAzsJvMd8nc6+nJp7tw1Xkj+JEVgEllQ1MqIdwEwLbK78Q/by71GF0eqBZthqMdl/pJFa0i5hln7qtAe29x8JOGTAF/Zy+pIu6W5Kwg/+uw07c5YQyzZ/15M3q5gG4x3D/b61yyT6wzBXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2579c44e-ed9e-44a9-1258-08df492d0931
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 06:43:08.9528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cNr5yid69+A0Ri9KwNglfqH4H19edXhPJbv5Sc7p7BJbpXZDBsO8Df7pwqwnwJxAjt9243Vgc3IimMyfUpe61SNIpCBSTcwcArFVldIa6lUUH8M9605p19/3Xt3e3wS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8496
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

Hi Mallesh,

On 21-11-2026 12:51, Mallesh, Koujalagi wrote:
>
> On 19-11-2026 10:09 pm, Ravi Kishore Koppuravuri wrote:
>> Accessing gpu_health sysfs attribute sends a command to the system
>> controller. Add a guard to verify and skip if the device is wedged or in
>> reset. It protects against touching the fw or device when it is not in
>> usable state.
> Are we really touching the firmware? IMO remove that statement.
Sure. will update
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 0fb891d00b36..47f6b91edd9c 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -1134,6 +1134,12 @@ static ssize_t gpu_health_show(struct device 
>> *dev, struct device_attribute *attr
>>       size_t rlen;
>>       int ret;
>>   +    if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {
>> +        xe_err(xe, "[RAS]: GPU is wedged or in reset\n");
>
> Is logging required here? if the device is already in a reset or 
> wedged state, wouldn't that
>
> condition have already been logged? right?
Will remove logging
>
>> +        return -ECANCELED;
>> +    }
>> +
>> +
>>       xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_GET_HEALTH,
>>                     &request, sizeof(request), &response, 
>> sizeof(response));
>>       guard(xe_pm_runtime)(xe);
>> @@ -1177,6 +1183,11 @@ static ssize_t gpu_health_store(struct device 
>> *dev, struct device_attribute *att
>>       if (state < 0)
>>           return -EINVAL;
>>   +    if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {
>> +        xe_err(xe, "[RAS]: GPU is wedged or in reset\n");
>
> ditto.
>
>
> Thanks,
>
> -/Mallesh
>
>> +        return -ECANCELED;
>> +    }
>> +
>>       request.health = state;
>>         xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_SET_HEALTH,
