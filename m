Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C0606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P7UbQr/g;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=T3cs/AO3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CB110E99C;
	Thu, 26 Nov 2026 13:03:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014DA10E99C;
 Thu, 26 Nov 2026 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795698226; x=1827234226;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N1zRE6Q/5bhtOVc+sVASVX25GM85uArkfHRJjO9nFOg=;
 b=P7UbQr/g1K2q1jUX78weXA0o+22pfJPPtHEiG24T7NTl98h2p3FvLkEL
 MM8YAb5KkHeb+az70OnRaJUSD68lcm4e6MR2S4pogaDQny7zOl5Z//rzA
 Q7mF7gV1Z4o3QpxsZNEQywdLa1i4zb1f47snq9OInQpmODPsV/+Ih4Gl9
 MFI7wGTy9fQTsj2lHQIbt8XBXzCG15klZ2ff42OcJ0rKKsqXPADjg+suN
 Zf84Ffa7Pg+ghzQVlnilo/sCiWdDsXYuOtQX5PPTIzHrsc+2jgTSJ/nvd
 9LZWtAZhMSJkCOzwuM13pCmy58atdgx//f/Yq3j8Ls5vwb0QN2+bwIhgi g==;
X-CSE-ConnectionGUID: nwb5vYGPSeGxDymKZ3YxZw==
X-CSE-MsgGUID: Jktkd2ptT9iiDGAiSYCeBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4693659"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4693659"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:03:46 -0800
X-CSE-ConnectionGUID: n0ftL3JXRSWTgdhjx9NoCw==
X-CSE-MsgGUID: a8XuaFOiRlOHxNpLF0iWEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12588049"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:03:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:03:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 05:03:45 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:03:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtTsfnUZ8MhpZmKeE+lRVbNI3AWCI9h8CESg4Nl3c0IFtO3eoeGZGnwncF5baz/YDygx9/jU9wjKIsmHLP6XAy0CIL/4ZEco6+cLRw++H00r8BYRfcmsmKiefxq9XGKLv0zCRxBDfM3rg+Ta1cCYNl2AkCbaLaYJs3arCYhpbGTmQIWFdUti5erHPY2LXZO9Og5mtenVxCklEvbROJExsNGvIkMK9KopYzePhDA/GXBWp1NJ4Nnke8OrFU4ZJdxD7l3gj8WMSM+I2BI08o6MsYIIyDt2ViGQ6YHe9oTV1XZxq8lmpHeSVVMadC6TgS/llb3ECw8qnjwiXINqyGxUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/dtTEaucOfTLL7oD5nU1AFMYZ/PEpCbCg4OxNajYA8=;
 b=D9Pz1+pLCCSpQyy9swZpWCegyJe6M7a8WLcJc41wnlL0OvVsG+20kzwtQGPcGeRmxlgluNmaeFFCg7A/cN8gwi9YnVR6nxsD3eAABZxPzYDse6LGp8YtHbUM2IqS1Lchc6zslHs4yMVpgiVux8w9R0CHzY1fKcQHeJgpD3pvOPM/v1kCTS7+jKe9fVtyw8PFeaT+VD4L0ms24OSBUH2Z0ux+75afTrW4y8pMna22ZRYdXkSZZeaJreniZczqurzDm9YuXJfDWGvqo/iukLEUqxJNSuuq8p269yZfZXRd3XVnb9tDYrk5x2xyx83Yq7G6/NpGPXnnhDo7UhanBn5PKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/dtTEaucOfTLL7oD5nU1AFMYZ/PEpCbCg4OxNajYA8=;
 b=T3cs/AO3Amox2P/xmJ7LXmsTn+uXeDXlRYYJQS+Bc0HKWqDjULyV7Wxm+zMIqhEZ+I0kTYlXg8bazpw3qWVm9zEcMYnjNMOc3n5IgbeC4xW4yB3odwbzuhEPllAEfdp/wv3WiHP/ctETsg9L1+jZdkxu65VwWKq/ecIQjNbU1ko=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by SN7PR11MB6680.namprd11.prod.outlook.com
 (2603:10b6:806:268::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:03:42 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:03:42 +0000
Message-ID: <92100e5e-360c-4b52-ada0-67b9a21ae6b7@intel.com>
Date: Thu, 26 Nov 2026 18:33:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/i915/gmbus: remove and open-code
 intel_gmbus_is_adapter()
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
References: <cover.1795607055.git.jani.nikula@intel.com>
 <0aa2d44a353afa5b3f06893009ed7cf67f5c9521.1795607055.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <0aa2d44a353afa5b3f06893009ed7cf67f5c9521.1795607055.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0154.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::13) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|SN7PR11MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bbff6bc-bd2a-4fad-02bb-08df4bbdb222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|261009223027099003|22082099003|18002099003|10067099003|11063799006|261102123227099003|261022105027099003|261022113327099003|261022075727099003|261028144727099003|261026140227099003|56012099006|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: /Pcfn3kGB+0jeCC9Uk5qCpZM+ZTsWSNGh23EAdhjY/m5AoxWe1IyKTU2S3HOaZtyRH90L0KXVTlJhamup365fB08ps8U0DDwFGnaaKV7cMrW2GpRIqUocgvlQqNftJ5VgHTlVTaX1H9R9VdH+hPVgtU+K0CzZycc1xEzdH1hJSpa0PoWshyqMfs15jl9cd1iDQWqpMTdCF4Zarct+83FzAPcjxzJ2n68exIHxQP8PZu7uGJ2FLcg7a/6tmPakFTlEho05IVk7A9D835/BBQats7XYff4xvsW1ACwyZU1dGvcwEJxDjv42C+yE7gxdCVaylhDL/P86fbr1lTs1thazb5mz0uz4fjh+Mgew8ZFsPaUOtaSRF5RBuYHckjq4lnhU1nq0O2/b/4/4nG5aVzWCvES5ROJBTGuorCrkKn8eGx2V4G042MRgyCSQ/KjV94+8T7PNSaIQp0EyfwQgP0MyWMnONSTmBD/9NnFCzK54PF83HvLkatstHEDrV1cm9JDQtq3fZ40r+XA0/88EWiGSVh+nnPaJaZukrSCxVo2eBOx09eX8+RT8jq4x62qIWwbdcG45WtDm+Zh0dEq/ODQa5/O1QBYW1Fj5dvGrK++lIAWLHxTQ+fCgDDzbezDI/mAFlbeM64gpv/R23fNIzec6n8QKT2GMjOVoS8DMPQuhCQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(261009223027099003)(22082099003)(18002099003)(10067099003)(11063799006)(261102123227099003)(261022105027099003)(261022113327099003)(261022075727099003)(261028144727099003)(261026140227099003)(56012099006)(261021123027099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnpreXVMcHlodUllVXZOeUNNYStSOUZkQ3lGbGpEL3F2UjFHSmRLN012SlRl?=
 =?utf-8?B?cEVxV293S0pZL1ZpUkE4RWhaMHJkUWN6d3IreEkwV2ZvRnM3U1pZN2sxMkpB?=
 =?utf-8?B?cEcvVWJmMWlMMnhYVnNwcHA2UXRsclE1b3hQdVIxMWxwTXRyRTdBNWk2TXdk?=
 =?utf-8?B?eHp3MDN0R2c3L2t6QjdBT0RBbnpKU0xBblZjZlFjSDNGekY3V055T1hqT1Er?=
 =?utf-8?B?SnMzcU4xR3ZPMkdmcm43VldFek5QYTZ6cmRvdG42SFZPc1VNUVRGV3RybmJN?=
 =?utf-8?B?aDIzUXRCeG1Id3pTM0R5dmJoTUJ4aXZnOG9lOUVSK2JDS2xuN3J0ekowZmZh?=
 =?utf-8?B?VFp6V0pWRUtJNDR3UytGcTJ1dEs4YXFITGlsRWNVQkJJQi9BampHZGVFMVcy?=
 =?utf-8?B?Y1YvSEVpZ1B5TDFDUXJNcnQ3Y3FrRTZzZTR0azNzcWw1V29Bb0JjRXFGME92?=
 =?utf-8?B?WkU3M3FWd3BKelIxZThrNGJvOHhSTFptVkZpRVg5TXJ3Sm95UlZUd1dZYjg4?=
 =?utf-8?B?NzRQNDdZQ2cvS2M2cXVRZkVDT0tiYjVPQVowZjFFSlNnUmpYODAvb2UrVGRF?=
 =?utf-8?B?b0ZnQldUR2xJNmFFaGxJd1RVTmJTc2Z1dGhDRHV6bXFZaVdpZnJSRFFVWDJx?=
 =?utf-8?B?bXVoUGg3VWlvUTZEbFI3djhzRjZPUDljSklCK1RTL1VwaTIrdWFHUWhrMytk?=
 =?utf-8?B?OGsxdHhvdGlBTXNHbzBxT2FFZ0tLNDBHaGdaYXRkb3pmUW5CaVdUamhFQmlZ?=
 =?utf-8?B?Vmxld1lwMTB2ZFdvNXRoa1duMEFUNkdNUHBlTmVLRTRFZmYvVVB3Z2k4UFNp?=
 =?utf-8?B?TzdrdDZUbnFxSHlWRzZTVnVYcXQ1bUVsR2I5VzduOXVQN2VsSFJxNGJGd0VG?=
 =?utf-8?B?STd3VVdlZHZOL0gyU1V1Njd0NldFczRWbW90VHhoNnMyTkxXbmJFMVlaaHlt?=
 =?utf-8?B?YVh0TWtNTmxJSXpMQ1pod1U5YUtpMlA1L1g1Njh4SjY2V3RUeElTbXhibXFW?=
 =?utf-8?B?bWllNmo5Zi9vNS9NNGZ1czRJTGpmdERCRWdkSXdsaVJ6bFVRL3NCM3pQcGR6?=
 =?utf-8?B?Y2hNNUY2Tk5ITHRyZ003MDBES29nR01pZFhEUlo2dnphdkcwZ2RXdDVuNWFX?=
 =?utf-8?B?UTV2L0x1bGJFSWdOa1duemNNWUhMMHpPZGZFRG96OHNWbmh2SUVIZU45YUVw?=
 =?utf-8?B?VWV0RkdENGlveEpOUk9GWnhjanRLU2Yxek50VG5MTXE2bEQwc1RRRFlDMXhr?=
 =?utf-8?B?djJkUFh5MWRGQWJsWVRBOXdFK2tvYlpmL1lBZjdFeWREWmJyR2xqRVJQYVNW?=
 =?utf-8?B?dkdpMENLMzU4SFYzTjNtV3pFZ1JZbWI0NXRSWTMvN1RWM1VhcjQ2L3I2aE5N?=
 =?utf-8?B?RDhNVkZMYTBvSjY1dEdxeTNPdmZ4cFJoNzRnaXZiamNoNC9XYXhOTDhwY1Jn?=
 =?utf-8?B?c1p0d21jZGlpd2dqQmd5YjQ2eWRqejJFNnhFLzhGWXBKd3hETEVrQUZuN3NT?=
 =?utf-8?B?TjJKQTFYSHZMVm9VMkpjVU5VKzFXcnZ4UmhIM3BvcVYveVRLdlUwbzFDTzVD?=
 =?utf-8?B?K2tiOUZqc0Z0eW5uR1lJS21rVHdCUGtQM1VkWmVNNTJnU1owemFBMnJRaThw?=
 =?utf-8?B?Zk1oVTVNTkZpR3MxTjZxSzlLNERMTFlGSUJLWVJWNEtzRzVCbDFwV0JwbExq?=
 =?utf-8?B?aW16aWE2YnJEbmhtcWFNVXc4TkJqcVd5QWlUeTRkUUdHVkd6Y1VqMXZnTzNJ?=
 =?utf-8?B?bytuMnluTGlVMnA2R2dmdm1oTE8wbmJlRStlSmF1VTV5RmJCSElDeHkwdDZp?=
 =?utf-8?B?TXd0RDRGL0dna1djbkpFdDMrU3k5QWFxdUc5YnRKQXZqcE95RFR3UjZkM0hS?=
 =?utf-8?B?TFdIaFJMVEx5T29uWXcrcjJSWXRZQnBGYzYrQlAwMDA1OUcza2ExaWVDUDh0?=
 =?utf-8?B?eXByYmlRSjd0OWpHRy9zbU1Rd2JKTzZ0cWdEaWJHWXpoT01YeFBMZUNGWFk4?=
 =?utf-8?B?NkMyM1hRYmV6RmRraVVTVUFQZ2dsMHBTbTdYYnRkbWlta0lTU2FQdDdTY21r?=
 =?utf-8?B?K2g5djRXbGFoc1Q1Znk5QVlFUjFldVlwRllFWEoxODJIak9uWEZrY3kwNVp4?=
 =?utf-8?B?WEpmaitsZmVQTDJ2eTJQM25yR0d1OG1Wdzh1U2ZFYkRPc3dleGZzdnVoSEl4?=
 =?utf-8?B?Ym9saklIcGxDYXNJQmtTTGMxekhzaVloT0djelBzU25vOXpXc1ZKazFMTmgx?=
 =?utf-8?B?RC81RU1sQWRaNmprYVV3ai90bE9od1dEVEZ0aldpUE92VUQvL0orMXhaSWR2?=
 =?utf-8?B?ZlI0VHZqanVrZnUxeTErY0xhNEhQUW9xM1dwZzJuM0syelNkUEhmSVNLVDBm?=
 =?utf-8?Q?3WOzdxtZsHyUUndQ=3D?=
X-Exchange-RoutingPolicyChecked: V2CxIbPWmTOtsXf/znx8bC633PsxhBgrCHoZ6wJkaDdE5U/GlROd/rmyp5Lms5qved8GnqRZQuCEQzk2+Ei9fFy2b9CQJIL0iA/SM+6Kijkz6d68xzxNuoYM+Qfe5VXjYkGJ0qiVi+3RkDZsshTvBei7t1zhWgGpHZ0fRhLpT4D1pfoUVweMawu5eJv194LIM7dMJE63h/UE9UxgYPbUht32iXcMPhEUOISbpUBM4Id7/E7yWMenbXH7dtVoxFnwnMoP/3KFXNW1cWNizslK+U1bZAxOOmRce0nOOFKadf1bbAQO47He292RHX4czMP5fly2hsRFWjtwSX99Kx/q9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbff6bc-bd2a-4fad-02bb-08df4bbdb222
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:03:42.2220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMu77Wo2OuEal+A3Sr4neLkuA1f19dsWTZ8fjMREUShUkN8Sqtzc9rfPaUWee8vx99ga7aneoVNmBx5C15e83GkeAdUrnWlaHkGl8Wq5Z3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6680
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/25/2026 5:16 PM, Jani Nikula wrote:
> intel_gmbus_is_adapter() is a single-use function based around struct
> intel_connector, which isn't really a thing in the gmbus code, and
> shouldn't be encouraged further. With the slightly confusing naming,
> it's more of a distraction than helpful. Just open-code it, as it's only
> used in one place anyway.
>
> Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_gmbus.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index c8f79384260d..df25a8233345 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -891,13 +891,6 @@ static const struct i2c_algorithm gmbus_algorithm = {
>   	.functionality	= gmbus_func
>   };
>   
> -static bool intel_gmbus_is_adapter(struct intel_connector *connector)
> -{
> -	struct i2c_adapter *adapter = connector->base.ddc;
> -
> -	return adapter && adapter->algo == &gmbus_algorithm;
> -}
> -
>   static void gmbus_lock_bus(struct i2c_adapter *adapter,
>   			   unsigned int flags)
>   {
> @@ -1139,7 +1132,7 @@ void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
>   {
>   	struct i2c_adapter *adapter = connector->base.ddc;
>   
> -	if (intel_gmbus_is_adapter(connector))
> +	if (adapter && adapter->algo == &gmbus_algorithm)
>   		debugfs_create_file("intel_force_bit_banging", 0644,
>   				    connector->base.debugfs_entry, adapter,
>   				    &intel_force_bit_banging_fops);
