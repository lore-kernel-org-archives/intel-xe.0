Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A7606A329
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PxKFEKBb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A6A10FFD7;
	Fri,  6 Nov 2026 13:19:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34BC10FFD7
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793971174; x=1825507174;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7fBAyYyGr7rIf09UattN7Ahw5q4TMV0yoQqugBKL1Nc=;
 b=PxKFEKBbkpPWkLjuDyZQzHIyPN6UmXo1aO2xqla4HJSwADTLpsPySZAC
 wfT0pFTaadD3DS1YV9Qdv5WQ+b7Uv/kJwtTZHcGHiGySSPUhXZyAac4q7
 1chDUFrk9canH+Ma4oX2KjNNb/WNCMLIrh52mK77j9ExdIXgvnGvHKGe9
 N8EOqQBbg7L7Qn3r+8uCvLboVKQg7+scjCjkkMXDHWkdGEEb6XqJpM9ws
 5YGBaxjcykwZXZIhwaLngMFZTAW8GrOh8cUWz8BIX9qmoNI2LCpdR9TRR
 4PyWXu9Zf/e6gpmHDSlWKlZJZ0bwwNZSLmJvJ9Av6JJKkCF1QCWZNwrMK w==;
X-CSE-ConnectionGUID: fscIAITMSeuu0wKsXTkk0Q==
X-CSE-MsgGUID: r6E8pAR1TpG+FVvsmBZErw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2776783"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2776783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:19:34 -0800
X-CSE-ConnectionGUID: 0bW4oaXVRnCb9GiN/svOlA==
X-CSE-MsgGUID: jnf4dDGPS/m1k5bnMOnDRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7633628"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:19:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 05:19:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 05:19:32 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 05:19:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKlzUiybZgcY1yPy3OySklNRcxLo3FmxeU7xTrHJ6bj9C0dzLrh6eD+U+XvJxLw8QhG/swsQVKf8IRUL3y9ZFES4OQUdOcuqfQHSaZ/DLYlqBcduthBEfg/ceJyq22mO8MH7SJfrhHn/nw01kZ4cbx962TUuWIoW991OqYUozsk2W8Ht99r0vAjYfInGmsc4A8ODYtJ62L1uaw2VWloP9QIzUzT9cMKFgroiWXYwszAgUkQhRV40Q/sTVPwhOhFazSzARP0/4X49VdZrX5dC2ySr/9/WHPPBO5Fi1zIpcJNnxLEoEgxOOdyJU+YsDKFeU1PWwBSIfud/JW3CJqF8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6hSB8PAMCdjQ0uJSx/Eh/EAHWJzVzsZwRHJpPioTz8=;
 b=m3shOOI+9sf4XGtaV7TU4ZCgF4zt4ei5XCSw8u3wgDM2OVo3sUUr9y3piyjWEKCP5Ei25g+fpGSahMfitHlxL2lbeiqnGeaZKea9BU6udoORzNAAnL0dSBf9B32AW0V8y8lna8XvHVkJkSw0Hc5VvxIvhGOehSOiloiuXDIvVqIyYH3ZB0UjOVcm8X/IJEg/k2nRbVoiAo3sYoM4/mog1/GpBXJdZ9GPHPMra5gsJL7Fy2E+BtF5gkJve8nc3fFBXmsGGPBfkTJmSq6/Y0ywd6fDVgx0aqkqxnyEUrH9UA3Ys0hzE5BbUJkH8gSiFANn7fNt+JE8+JVB48ZTKj5iMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.11; Fri, 6 Nov 2026 13:19:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 13:19:25 +0000
Message-ID: <4d56df62-62fc-4a9f-95eb-fcfaff8dc7b3@intel.com>
Date: Fri, 6 Nov 2026 18:49:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 08/10] drm/xe: Introduce temporary device wedging
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20261106073921.1512530-1-raag.jadav@intel.com>
 <20261106073921.1512530-9-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261106073921.1512530-9-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0239.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6c1806-9d91-497a-62ab-08df3c0893b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|10067099003|5023799004|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022075727099003|261022105027099003|261021121427099003|56012099006|4143699003|261009223027099003|261009221727099003|261009223327099003|261009221227099003|261009220027099003;
X-Microsoft-Antispam-Message-Info: OXgVIplqDMaHE4IkviWEtEkCy2wcpU54sABkvlTWVPtAxvzbZqgN0SKZO4bQ827DLabwWIRe6ekB8TegWHsC2MAKJ9CJyQaPYqmMxblwVTjZf48d863dsVG+1MFqlH7KiWsJuzP2LGm+uJffzoUcOgjh6fPzl40fIJw3ekYrCFCfmLlERBu/S2v5FARV+jtD8Nw+faQgWim/DiyuNaxojgYAXWruNesxV9F6qCse7Jm+22yXNYk4nfoVSHOyKEouHI+u2mSb9jTAeqY6hcUL466nmk64QmPg8Lpm10d97ghSWZNPXlUBhS2dxAsLvQIie6s2FoAAhUWTquqCmKrkP+alsKU6+yyrntvbJSUdyNX760L/OPnGWoamBknkGVhsyFj7C1xwOdVXc5VFozFkGhZ1lY7/9Oz4Gz51UEkfVuwzP1PoWN+brzeBkvKArd/vf30AD5EnvhT0vuaKtdgwr+MMkY1YObyc0HKHvTXCeAxuE9EPmxmTv/8No4omtxAwQUC8bQwEP+xuUNh7TI7mlNoaMUNzQIJUVMMggDg5tzonpDd4ODt4AaemjO0m40dBewdkAf+8A8OV1bwU4C+X0vzFPJWXYeJM13wLnOmKP5oCAh4Y9Jal03GAdvv8t9thNReuuIXWSPIJOWTGHpb/C0z30/BcFsp++i9gThmTAOw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(5023799004)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022075727099003)(261022105027099003)(261021121427099003)(56012099006)(4143699003)(261009223027099003)(261009221727099003)(261009223327099003)(261009221227099003)(261009220027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TERsVktDSVBmVUxub1ZTYkNrbFZPQW8vb2lCdy9XWHFQUEpReFFaTFFBSnhM?=
 =?utf-8?B?YWFGQXU1cTROSEY0SDNzbmVLOTI5QkNBNlM5Y0NOaG9ONTYxeTBnMEVsZzJH?=
 =?utf-8?B?ci9YQ3F5TEhGRnpQbFcxWU0ybVJ1T21NTU03cWFFL01IVnpHQmpDM1BKcnhW?=
 =?utf-8?B?MUxhVzRpOVRoZ255cmdIbUVvRlBTNWQ2cHlPeTIrWllLd2pXaXR3RVFZdzYy?=
 =?utf-8?B?L3AwRnA0R1FucFJhN002aURIZEp1NGo1dFBiZXNYSTEzMzEyVzhpRlE0ZEZT?=
 =?utf-8?B?WW1KdXBJNzhvenk1eFFjd3FlM3YvKzVRM3hTNERXVld0cTFXL2xONzIvaHFS?=
 =?utf-8?B?bElhaC9meFhjdVNucTJTNmpwWmNjbDVuODdaRTZSNG82ZTVCM3I2SThuamZt?=
 =?utf-8?B?alY3YlN5c3RWQWJBYTZSRExQdmpCQVdmZXRsSHFsRWNjUkZNdG5oTS9RMUdO?=
 =?utf-8?B?Mm8rdnB1UnY3SG5TTTNOd25kUk12SEtCN1p4NjNydEs5Q3pZZFBVZTFYUVpX?=
 =?utf-8?B?dTYxSWlOZExWUFJQSVp2UUlYL0NaS0hLRlFSclRBTjlCWUFKdVBCM2pTNTBS?=
 =?utf-8?B?MTQzOXRNKzNldEtDYUsxRHNQU1pvSVVEeE9oU2s4djJUOVo4SkxtZHZTMnhW?=
 =?utf-8?B?UUJQN0VUZkJkRTVERXg1YUVuNjArdmFVRjczcGorY0JOTys3eGpvRnBJY2RU?=
 =?utf-8?B?NmE5SzlldC9zajZBNEtQQjJpWXliOElPWWdNYy9EY1FWNWtXbG1Nd2pWQWg3?=
 =?utf-8?B?WURKQXFwN3E4MlJKTGh5UG9UTXpJdFVRamRLL2trSjRaejlZS3hDV0NFN0hp?=
 =?utf-8?B?bDlFdlNCai9mR2pDa3c5cXdaQThtR2s4NWhPV3VKdlo1Ym80STlLdTZxU0gx?=
 =?utf-8?B?Wk44bnZHUEtGSXM5Nlg2d2xUOHNoVk96YmlqUk0yQllHMXMvSTEzNHlKaGUx?=
 =?utf-8?B?VFFVME4wMnR4NHRMbWRJRmdvWlV3cHMwditKaUNoUWZyc0s1d1B5ekMzaGRW?=
 =?utf-8?B?bC9pTkwweWV2dTZqSVltM0gxeERGejVzZFZFNjhFeUNXTHBGeXFVMkczNHps?=
 =?utf-8?B?dmozK2ZDMmVuQzJXbEY5YWd0Q1psU1RwWjVKTHN3WjJHM0kvQXVtL3BScHRD?=
 =?utf-8?B?VkR4N2ZxSVo5NmxQdlJzRWhTSFVZSGVHZVA2UnIwSjBqbDc3QmxEVHZGZGpj?=
 =?utf-8?B?Y0I1amFjd0xxYmJBYUJEQzl4WlJ5bzBUUjdNQnZZZUVZamhUWCsxSE1Pc1cr?=
 =?utf-8?B?UmhuNWRmazltR1ZSTUZVV0VhanNJKzRHNVUyTTJKbXFVZHlBdEJFV3pOMVVl?=
 =?utf-8?B?bmZNNERGUkZhZFBpdU9DUnpHbWRFV2xqeXdlVVpzTEl5S3pRRlJjNWtINld5?=
 =?utf-8?B?QUZBRm4zZ0ZoWGZKeElzUit1ZE43bWE3SkpRWUJxdEM0NjF2aXdlRXlxWHVz?=
 =?utf-8?B?TXYzZGxnRXRBQ3E2N2dDWmlmM05kNDgzSmg2NjJDeTBWWTNBSmpGYXUwanFI?=
 =?utf-8?B?R2l3dzlsTTBKRkFJaGFsbG16RkIvVTRmQWZwenczZ095NEpXZGtLMjJSemU3?=
 =?utf-8?B?QUJ4NGRmbE5sdWFteEk0M29wdnJrd3Z5dGJ5emdLVFJlRisvc09rVWdsdndZ?=
 =?utf-8?B?aXV5MFRYUHpRNnhZSUtxOHl3MGZVQ3dvVXd5YnJJRWdlYUtqV3ZUb2h6cCty?=
 =?utf-8?B?MlJLd1RsRGhCVHpQZmlHV202S0IwbCtES2ptMmdYeFZNTlhOWSszOWc3ZE1h?=
 =?utf-8?B?WDZmWGY1ZE9MMW9rZktkOWlocWpZZEp2WG8zTnVSNzVER0JvWGNPd1R5VXd4?=
 =?utf-8?B?SWNUZi9LRUFrQ3hrZjlLRkJmdFNjaVAxaTFsRFY2cHlWcGFXNEpMNnhwSEdN?=
 =?utf-8?B?RjRremxsdTA3TE0zNERoaXhMeEJrTzgxY2MrZFRmeVBGRUhvdW5xdWRjdmk5?=
 =?utf-8?B?M3VxUkhRTFAwUS9lL2I4ZlN4eDl4QW5wWXM2WEMxd0ZWWHhQbCtmQ0kxK2d6?=
 =?utf-8?B?dXZCYy9kbkk4VkYyaElVYjhCRDVxbkIwT0NnbURHQ0lieEdZWWw5aVlpcHZ0?=
 =?utf-8?B?d0dMRis2UkZuaWd5bFE3UEN5RUYzTDROeTRnRzlxNkx5OHA3T2w0SFBEWXla?=
 =?utf-8?B?Ny8ydFlxSkF3akhsRzRvQnNTR25HSHE3S0FpK2pGSUozanZTSWhHOWNLelFX?=
 =?utf-8?B?WmlNcXAyakpPVEZ1eWd1S1FZTU5BSitjQ3FZNVN0TkltbDlJbDFVUzIyUHZQ?=
 =?utf-8?B?NEYxY3hFVlpJTlRtSTlad3AvdWdPV0dMaGZTMjh1bThHdmpyVW1BSnh4WU5q?=
 =?utf-8?B?QVBLUW1JYnZMSUNTZDM0eE1VWFFISHlzd3NxZVpOMGtVN21mTkEyZz09?=
X-Exchange-RoutingPolicyChecked: bZr1achcCcuOvTH4jX0asJ0+xYphi7RMH8+iQDVhDvTPR20n0JTd8TmSmqQtO4ScZTvPDejCLkJBr3FGTYPmhirUdCHKHVJ5V/b0Cj+HRd3pAUz7VDQbbvAOC948Wa1tb03LVrYHQ7Q5JAphtxpV46Uw5o2JCc2ANx0GDQj9Gulj+EqKHPBT1aPBcESNfu/WPS9goPnXL9f1R9V4nC0hgKrfbJGJmQHrixSzgzv2yaH/bG+JkUFPwoRcoMSuiYkgsallDMDbVCZNoKt0hNRREBiFKcPyvnvgnR1rW9AJ+cWvDVLgEU+cabHfXKSzOgRhy1kp19/2O961nUqjY+1LfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6c1806-9d91-497a-62ab-08df3c0893b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:19:25.0780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yvJDP0FE2LgMcjCAxIcDb3MzATJcGMWmlw1iZc+EWucio2aBVq7r/LguIM1wQ1iR8FNhILz7k9zGj0h3aRoMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6397
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


On 06-11-2026 13:08, Raag Jadav wrote:
> Currently, wedged state is serving a single usecase where the device is
> permanently declared wedged, but this doesn't allow any wedged state
> management for runtime usecases. In preparation of usecases which require
> to facilitate temporary device wedging, convert wedged.flag to wedged.ref
> which serves as a driver internal refcount for wedged state and blocks
> critical path execution during device lifetime. While at it, introduce
> wedged.perm which signifies permanent device wedging and operates
> independent of the refcount allowing relevant cleanup action on unwind
> path.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   v9: Redesign to prevent races (Sashiko)
> v10: Spell out temporary device wedging in subject (Lukasz)
> v11: Update GuC CT path to check against permanent wedging (Lukasz, Riana)
>       Put wedge reference only if device is wedged during resume() (Riana)
> v12: s/xe_wedge_not_recoverable/xe_wedged_permanent (Riana)
>       Refine documentation (Riana)
> v13: Prevent PM ref leak on slot reset failure (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c      |  6 ++--
>   drivers/gpu/drm/xe/xe_pci.c         |  2 ++
>   drivers/gpu/drm/xe/xe_pci_error.c   | 26 ++++++++--------
>   drivers/gpu/drm/xe/xe_wedge.c       | 48 ++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_wedge.h       | 13 +++++++-
>   drivers/gpu/drm/xe/xe_wedge_types.h | 13 ++++++--
>   6 files changed, 84 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 0a1b37fa0efb..5b43ca73f6dd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1162,7 +1162,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   	xe_gt_assert(gt, g2h_len || !num_g2h);
>   	lockdep_assert_held(&ct->lock);
>   
> -	if (xe_wedged(ct_to_xe(ct))) {
> +	if (xe_wedged_permanent(ct_to_xe(ct))) {
>   		ret = -ENOTRECOVERABLE;
>   		goto out;
>   	}
> @@ -1591,7 +1591,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	if (g2h_fence.fail) {
>   		if (g2h_fence.cancel) {
>   			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
> -			ret = xe_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
> +			ret = xe_wedged_permanent(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
>   			goto unlock;
>   		}
>   		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
> @@ -1936,7 +1936,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   	lockdep_assert_held(&ct->fast_lock);
>   
>   	/* Keep in sync with g2h_err_is_fatal() */
> -	if (xe_wedged(xe))
> +	if (xe_wedged_permanent(xe))
>   		return -ENOTRECOVERABLE;
>   
>   	if (ct->state == XE_GUC_CT_STATE_DISABLED)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3fa842c22a50..664d65149ff5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -39,6 +39,7 @@
>   #include "xe_survivability_mode.h"
>   #include "xe_tile.h"
>   #include "xe_tile_printk.h"
> +#include "xe_wedge.h"
>   
>   enum toggle_d3cold {
>   	D3COLD_DISABLE,
> @@ -1404,6 +1405,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>   	 */
>   	xe_assert(xe, !IS_SRIOV_VF(xe));
>   	xe_assert(xe, !pci_num_vf(pdev));
> +	xe_assert(xe, !xe_wedged(xe));
>   
>   	flags = memalloc_noreclaim_save();
>   	pme_enabled = xe->pme.capable && !xe->d3cold.allowed &&
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 03a9f295d077..be58fc9e22dc 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -22,13 +22,8 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>   	struct xe_gt *gt;
>   	u8 id;
>   
> -	/*
> -	 * Wedge the device to prevent userspace access but do not send the uevent.
> -	 * xe_wedge_fini() releases runtime pm if wedged flag is set, so acquire a runtime
> -	 * pm reference to avoid underflow.
> -	 */
> -	if (!atomic_xchg(&xe->wedged.flag, 1))
> -		xe_pm_runtime_get_noresume(xe);
> +	/* Wedge the device to prevent userspace access but do not send the uevent. */
> +	xe_wedge_get(xe);
>   
>   	xe_device_set_in_reset(xe);
>   
> @@ -42,10 +37,16 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>   
>   static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action)
>   {
> +	struct xe_device *xe = xe_any_to_xe(pdev);
> +
>   	switch (action) {
>   	case XE_RAS_RECOVERY_ACTION_RECOVERED:
>   		return PCI_ERS_RESULT_RECOVERED;
>   	case XE_RAS_RECOVERY_ACTION_RESET:
> +		/* We should not be doing such ugly hacks, reuse FLR callbacks and drop this. */
> +		if (atomic_xchg(&xe->wedged.perm, 1))
> +			return PCI_ERS_RESULT_DISCONNECT;
> +
>   		prepare_device_for_reset(pdev);
>   		return PCI_ERS_RESULT_NEED_RESET;
>   	case XE_RAS_RECOVERY_ACTION_DISCONNECT:
> @@ -72,6 +73,10 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   	case pci_channel_io_normal:
>   		return PCI_ERS_RESULT_CAN_RECOVER;
>   	case pci_channel_io_frozen:
> +		/* We should not be doing such ugly hacks, reuse FLR callbacks and drop this. */
> +		if (atomic_xchg(&xe->wedged.perm, 1))
> +			return PCI_ERS_RESULT_DISCONNECT;
> +
>   		prepare_device_for_reset(pdev);
>   		return PCI_ERS_RESULT_NEED_RESET;
>   	default:
> @@ -132,11 +137,6 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>   	if (pdev->driver->probe(pdev, ent))
>   		return PCI_ERS_RESULT_DISCONNECT;
>   
> -	xe = pdev_to_xe_device(pdev);
> -
> -	/* Wedge the device to prevent I/O operations till the resume callback */
> -	atomic_set(&xe->wedged.flag, 1);
> -
>   	return PCI_ERS_RESULT_RECOVERED;
>   }
>   
> @@ -145,8 +145,6 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   
>   	xe_info(xe, "PCI error: resume\n");
> -
> -	atomic_set(&xe->wedged.flag, 0);
>   }
>   
>   const struct pci_error_handlers xe_pci_error_handlers = {
> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index 2f35937c5e66..87cf28a2acfa 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_managed.h>
>   
> +#include "xe_assert.h"
>   #include "xe_defaults.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
> @@ -55,6 +56,43 @@
>    *   firmware and restore device to normal operation.
>    */
>   
> +/**
> + * xe_wedge_get() - Acquire wedge reference
> + * @xe: xe device instance
> + *
> + * Get runtime PM reference and block critical path execution.
> + *
> + * Use this for driver internal usecases which require temporarily blocking
> + * userspace access to the device during autonomous recovery, like PCIe FLR
> + * and bus reset. For everything else, use xe_wedge_declare().
> + */
> +void xe_wedge_get(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	/* We should not be runtime suspending as long as critical paths are blocked */
> +	xe_pm_runtime_get_noresume(xe);
> +
> +	ref = atomic_inc_return(&xe->wedged.ref);
> +	xe_assert(xe, ref > 0);
> +}
> +
> +/**
> + * xe_wedge_put() - Relinquish wedge reference
> + * @xe: xe device instance
> + *
> + * Restore critical path execution and put runtime PM reference.
> + */
> +void xe_wedge_put(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	ref = atomic_dec_return(&xe->wedged.ref);
> +	xe_assert(xe, ref >= 0);
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
>   static void wedge_work(struct work_struct *work)
>   {
>   	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> @@ -97,11 +135,11 @@ void xe_wedge_declare(struct xe_device *xe, unsigned long method)
>   		return;
>   	}
>   
> -	if (atomic_xchg(&xe->wedged.flag, 1))
> +	if (atomic_xchg(&xe->wedged.perm, 1))
>   		return;
>   
> +	xe_wedge_get(xe);
>   	xe->needs_flr_on_fini = true;
> -	xe_pm_runtime_get_noresume(xe);
>   
>   	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
>   	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> @@ -239,8 +277,10 @@ static void xe_wedge_fini(struct drm_device *drm, void *arg)
>   
>   	disable_work_sync(&xe->wedged.work);
>   
> -	if (atomic_read(&xe->wedged.flag))
> -		xe_pm_runtime_put(xe);
> +	if (xe_wedged_permanent(xe))
> +		xe_wedge_put(xe);
> +
> +	xe_assert(xe, !xe_wedged(xe));
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> index 3b5499dfc30d..f2cab855db35 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.h
> +++ b/drivers/gpu/drm/xe/xe_wedge.h
> @@ -14,11 +14,22 @@
>   
>   static inline bool xe_wedged(struct xe_device *xe)
>   {
> -	return atomic_read(&xe->wedged.flag);
> +	return atomic_read(&xe->wedged.ref);
> +}
> +
> +/*
> + * Do not abuse this. Prefer xe_wedged() where possible. Only use this
> + * as a last resort where xe_wedged() is problematic.
> + */
> +static inline bool xe_wedged_permanent(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged.perm);
>   }
>   
>   void xe_wedge_declare(struct xe_device *xe, unsigned long method);
>   int xe_wedge_init(struct xe_device *xe);
>   int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
> +void xe_wedge_get(struct xe_device *xe);
> +void xe_wedge_put(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
> index e472c5fcbd26..0ca9f30dbda0 100644
> --- a/drivers/gpu/drm/xe/xe_wedge_types.h
> +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
> @@ -29,8 +29,17 @@ enum xe_wedged_mode {
>    * struct xe_wedge - Struct to control Wedged States and mode
>    */
>   struct xe_wedge {
> -	/** @flag: Xe device faced a critical error and is now blocked. */
> -	atomic_t flag;
> +	/**
> +	 * @ref: Refcount for wedged device, blocks critical path execution. Used for
> +	 * driver internal usecases which require temporarily blocking userspace access
> +	 * to the device during autonomous recovery, like PCIe FLR and bus reset.
> +	 */
> +	atomic_t ref;
> +	/**
> +	 * @perm: Permanently wedged device, not recoverable. Only to be set when
> +	 * notifying userspace of wedged device through drm wedged uevent.
> +	 */
> +	atomic_t perm;
>   	/** @mode: Mode controlled by kernel parameter and debugfs */
>   	enum xe_wedged_mode mode;
>   	/** @method: Recovery method to be sent in the drm device wedged uevent */
