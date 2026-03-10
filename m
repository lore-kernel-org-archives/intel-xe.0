Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A933DFD2D81
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 13:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABFB10E299;
	Tue, 10 Mar 2026 13:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ah8FQHbl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7C510E299
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 13:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773149395; x=1804685395;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+7RrmH+JHpNEDc+xYRZ6I1AArnAMPMBiTd8R+ShCDdM=;
 b=ah8FQHblg1Vnp3UYlVNr88UlI2hUZHj4vNZWDkUhby/nP8Dw6ySjUzxx
 HATC16flx+ZLM7LiEfsvinAgnBoypyqI2hi9Em1sqQb4TlOG3+P8WnkHI
 jURvwsBwhRe48JqyI8gMeyDU7csF5UR0O8FJuAM7LYnjlRau1UunHJ7IS
 J6hPQbKs6Fo6pbphd0mS44UvdjZ6CPXDgSV0b/9fyBH7nNCQUU6onKKzI
 NTiN9i1pqsR82UGboDYS490yhdBxji5ZnYkwZdaFDr6PHIBMDe3fmstIo
 f+fPCTvgdU/arCuZsSr06jkEXcHVrXGLdotRj7Ht1Gsh1cgEHwcsSoRCu w==;
X-CSE-ConnectionGUID: 7V0L8pRbSJy9cYHIyoiqlA==
X-CSE-MsgGUID: joUFnQNSSNmKKBZJCDbv1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74311600"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74311600"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 06:29:54 -0700
X-CSE-ConnectionGUID: tyiEsfYjTiitmFvA4MfeMg==
X-CSE-MsgGUID: +KvU2CEzRPypmvGtH3+iUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="220154864"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 06:29:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 06:29:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 06:29:53 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 06:29:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNvoFfTH70ljjjHzkITKy2CTHcR+fqAoguCNqpb3O09Dhxf+4JHoCWbNWIhr/gnFQBrJyhTZXO7nYelK2mmvZHxRFJWE2p5aHW8A59Ape0GX3WsKidRjD1t8nLwEkrckZ+nfmOJJw7BmJ3tBInwRnG05xAeYHUvgvJRY9UlJdzknpBeo5w3lHzceGdigq7q98fZmA7uUI9PS9q0/vQgH3x47PU+AOPSR9A0xFnPY0fBecaNsWQom4NYIxK+ssgSLVdKms5DSDA5fehS2O4uZoQ2IMcRnHA3AW4pDS32FeOb90y4yMDzvatyHIybqQu17WaSAZoIhtD2lnIAqAR+kqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJy7i4WS4cTVWUuJaWqjffzB1jsaBI5p8CmzafBpto0=;
 b=uP6MDs9cniBJAHnQGkjKHYoLSGGcUGfwV2Qs4EtbmUf1auc9a8KnMGn/LS91YC6lQA2NOsAwYzma1+BY1RuU34WxJn1W6oiIDSdra1t5AWW9t52h0Ij+z2p5OZDDiIXjvojiA2527/3PiKGBBr5PGq7Cac5yV1QUEbiXBzwfmQeUy3V8Izra5w8osMaW19ht+jqENk0uT22CiiGyAbLM/RsNIHgWwDy8PKU9B5j5pFXlLREWYxhZjlY5l3xLFTho7XT0sqhOG8umlPuHRE3EOdG6pcrMb6DnPhjYJzXEdVPdtD9t4Au0iZMbWybd670AQeSC7IeE4cxVAidslu2vgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by BL3PR11MB6337.namprd11.prod.outlook.com (2603:10b6:208:3b1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 13:29:48 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 13:29:48 +0000
Message-ID: <4d62f154-dd1f-4213-a5ff-87abf09c4ab9@intel.com>
Date: Tue, 10 Mar 2026 18:59:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] drm/xe/xe_ras: Handle Uncorrectable SoC Internal
 errors
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-23-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260302102155.4074630-23-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|BL3PR11MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea11943-e631-4822-ff05-08de7ea919a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|22082099002;
X-Microsoft-Antispam-Message-Info: cw2e0vFcbG9XIRe9N29DHovPraEegBWa2G2X3h3tX+Yxg3iu+PrMaOiZxs1IVyWyvglsdjIhKEVK/O7X29lsk34U2/QqLQjWmgEaA/Cg8LFePhLQiKW69RLHh//+Ls5eztqtJwf8zb4PdtnwLBswTxs2YW+V82WzsvgEVFjnKbFPDw7pZDkORyAnRiIvpVVsPImQq+f4N7JSjbR3RZFQkaw/EZ0nHVZl2jGn6dOrSACitZQ1OPHhNCzkYhtHVIerNH/+KNaRzYeOHmuMcNuVHAPqgG+/yDydEhxuomaLZ5+g5Yto9cMVr4rOntIzQ44eAHTRCcCYcaWwubeMLotY1muEnRven0oJ5VISCPj24dA1Q9SMYNCPeohMTGQY9DvFGXvh2WreGNHKWoUTe39BlzMyl5iRy1jSK6QU55JPWtY40pGaYELqjVMl/hJQKGTwr/rqnF1GTRhOngfnIewuZtNLHzoIXhY3c8YIbJWgrZPDnIDvztuVf03N8tbtUNWimw307paTZ+VCZIjc5owzZNUY4Smoqrwt5o3pPFrJRH13x9m54WWrWuieRGpKBhWhGHfEjzyPGD3sA2jvq/Y0WEzlFYVF6+uFaaOA0oAIeuUoj2lwHPg1RaNZSnlulwyU+6fLa68ik2ImOPVEt2jqHepO3cty8L07LYAqugJwvmTeQ8YuGLm+7j2QuWT0oySlvg+d2jn0NA9gtOr+6+brzgmTh5I/4Nc/kWkkq+K7SFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099002); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THkzNzNaYVpEMWp6SVd1UG1qNWR4YiszODJzS1lhckNiVGU4dnp2KzlFWmhx?=
 =?utf-8?B?a2dVMmN2QzZ1UEhLK2E0QmFKTlJlTzJtbk9LcWZadkNmbDNsNm5qN0x1ZHhi?=
 =?utf-8?B?M2pXc3h6QkZka2JDM2VsWW8xZ2NKOTZoM1lWcG0waGptdFpFMzU1K2ZVOWoy?=
 =?utf-8?B?bFg0MDdKRC9FZlRKbTJvUmZRbDFqbFMvRFZYT25ZNzRFeVFHU2FaSDVhc3ky?=
 =?utf-8?B?bFNyQS9YOVdvVDM4a1BjY09xWkE0WlhkcVR2WjlhQXZWMDVrbFA0VWVoSEhQ?=
 =?utf-8?B?ZWNjaTdSVHpJV09Jc3lVYU9PUmc3OVRJcHFMYUxnd1VwSnpjMWpBa3pMM1VI?=
 =?utf-8?B?VlhFSVlJekVjODAweFMxNnVGNWUzSHc5L2JweGhwZG05T1g5MlZDNGljOTBX?=
 =?utf-8?B?T3hUTW1vVENUY3BSZTE4bjRZZGhQTWp4ZllUQ1VkZnpPMi83VzRMMUJKQ2w4?=
 =?utf-8?B?SjM0Wm81TlUxVHZKclE3K1BOUitQQk1tK2V3Nzc2ZTFYaHpDanNhcG9iWDRq?=
 =?utf-8?B?MkF4cU03OXhPelE3NG4xQ3NjTWtXbms4aFJNbTVyaHdQWHpwV1hPWkpqd2JD?=
 =?utf-8?B?UlVoYWNOVWpQZHVsa3krQ2Z3WVg4R1RPVTkxQjMwei82UlFyRU4yMDF2eWdn?=
 =?utf-8?B?N0gvcWRaM0hUcGF6bEpvcE45NVo5d2VsWFB4dTUyOE96Z0hVNXZiMHU0eVVu?=
 =?utf-8?B?VGtqMXlwLzV2SGpmZkF4dXpSMXdjS0VMWmpwYXNCM296aEhkVW5ONGM4ZUZ6?=
 =?utf-8?B?VmRtMUlwTHkxZ0JVdFkxcndvU2NOZDFkaTJFaEJmSklhODhpL2RjMmhMNVoz?=
 =?utf-8?B?UE5aU0N5R1pzWnpLcWNWUjAxME54cGdWbFFQUDczWmUxam1HWGRnTWZOdzVN?=
 =?utf-8?B?TzdqcC9UWXhoOHpEWmI1OXozTGVhQ3dVV0VxdFdpZW15VWJNNFFVNUJxZzdS?=
 =?utf-8?B?NUhuYmNCNTdQYzFMRVh4UDRVNG9ieFZBOHdqQlZDYkdOcFE4a21rWDRIaERq?=
 =?utf-8?B?NXVYa0FKamJtZXR2cmxEVUEwUXpKT0Q4am1Nb2tmbnRCMU1JTnVwSTFJdisz?=
 =?utf-8?B?bERRV3hDWXJWUnJuc2ZnTEVmT2tlY0srS3p0MnhZOVpYK3VYam04RW5IRTcz?=
 =?utf-8?B?emF4d3FQZmp5TG03NU1zS25CZk5paCt1ai9ST2lnUVBsZUFybEM5RTdFVWNh?=
 =?utf-8?B?ejV1ZzFwZGY5WENmOExnMkpzNmcwSGI3TGNGcTdhZWVOMjdXY1gwb2s4Y2Fj?=
 =?utf-8?B?RWlSMGVsbWxWQ3I3aVVLKzhGVDQ4RVFvcGN2Ukw4YmNFbHBWWWI5ZFF2bi9u?=
 =?utf-8?B?OEdCWWVuUGt0aWtOY3FrbFJvYktDak85WVorOUE3S0xlTU1OQ2lsQUZzQjN5?=
 =?utf-8?B?ZG5qNTQ1aDNKRTVXWmxOeXVibXJGKzNnenNIVlZKU1NuaU1YVTVnRnQrOWgw?=
 =?utf-8?B?UitIWkZnVnk0K2VaQzVNMXc1bWZTVGxNS3VyVEVzVWRoUWVPN1E4THdncG5W?=
 =?utf-8?B?blNubWtvaThpTVhNSG9LbGxTeVZzanpDL0pCWDJtRFNaZmszejB1S3pwVi9F?=
 =?utf-8?B?MDlkOEVoemJCNDRxYjF5VmF4bmwvUzlzdW5na25iN2ZWMWNIUzYrdlhNTW5h?=
 =?utf-8?B?U3E5Yitibkd3ZHM3UGw4amJjcTVjbkp0WW1sNTgwaUV6Mk5FMG1YWmQwUFhv?=
 =?utf-8?B?elFHcE9xbG1vOU5seUNSZEhUSDcrcG01UkJzakR6cU9HVU4ya2orOWRSdVdz?=
 =?utf-8?B?cXdwSU5OK241dmNFNnR1WjdVMnRlNndlTnNwdkhlMzZtblJZUXFYcU1LVnBN?=
 =?utf-8?B?b0VHQjZEY2VMeVk3dDJwS0tCRERoZ3RwSWh0Q1BWRHYyeUtKWnhnZlBxeUZL?=
 =?utf-8?B?U0lHQVY5NE83MkZ4OFZ3OWRrdGd4VHdkcmhWbll4bEZiU2QrblJtY0Y0bmd5?=
 =?utf-8?B?VGk1SHZHdnFkODNMeVV2ZnNndE5MbGJ3d0l3Tkt6c3lZdGN0ZmZuU05Sb1pS?=
 =?utf-8?B?bzl6aHhONU1lQlNKY3IrbVNud1Judjl2ZlVhN0x5VVo2d2tnb1B3dDBUeHg0?=
 =?utf-8?B?WFI2MmN6VE1CZXpPNmxzRHZ5Tm5rd3QzdjRkS2lNRE5YZStSdXJUS0d4WE4w?=
 =?utf-8?B?amgzU05Ta2h0UEVrN2dGeUhHWFcyNGRlbk9NMzdDMHdoVXRQK0YrbTZKN1Jw?=
 =?utf-8?B?aUhRNjg5OTdxQ1MrVm5pR0hWWXV2ejdUeGVKQUhVUUMwNTVDQzQ2SmYvUzl3?=
 =?utf-8?B?TGtCZXI0MEZoNGlrUTJ2VkhSQU1zWUtzU3oyRVltWER6S2s2Z0ZZaUVmVDQ3?=
 =?utf-8?B?SW1nL0NlelFPbkkvRXFIZjZkeC9KYVRTbU9ON25VU0pmUFFyaXdrVFIrYUh4?=
 =?utf-8?Q?ViXDv/K+pbQYopVk=3D?=
X-Exchange-RoutingPolicyChecked: STzJgjNahWSscUBXFXP5nQpPefhztGZaUphVfhkCxlcfcakuBk5KdxjXbJ7ns86XsUPdKVamY/vIWXJul2xaDNL0JEhDEdltMGhNsVAgj4FFchE4zoBn9ytDUH8+1Tae9xfijyg9C9dgKbQy8Q0ZO4mLlIcbBUeY3y2tdYqpzw2N8NHmClWRNJ+6pah64BVbSwQfEAiXPYpPFGYWKX0pC9c9Dkxgzvi5omqz6dMadq8Rf/MyGKtv8Hzkc5tDPJPATm+PKqC7LKm+9zPv4Z5xXhc16UzIjN4wu/ZJDeERzuCRwGNOcEL4SDwyt5TGbqqUzORrCGPWVwMp1c+3aFuYOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea11943-e631-4822-ff05-08de7ea919a9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 13:29:48.2276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgcxwbNwgqwQLZ4zPXe4bcHZFDV+oIbbstJau//MHE1qQwUuKuDpAiI8x2ix8dRGoj9yirC3ny+LI0Sm0LQcaKyTsHAy+Vxpfga9XV0gnmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6337
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


On 02-03-2026 03:52 pm, Riana Tauro wrote:
> Some critical errors such as CSC firmware and Punit are reported under
> SoC Internal Errors.
>
> CSC errors are classified as hardware errors and firmware errors.
> Hardware errors can be recovered using a SBR whereas firmware errors
> are critical and require a firmware flash. On such errors, device will
> be wedged and runtime survivability mode will be enabed to notify
> userspace that a firmware flash is required.
>
> PUNIT uncorrectable errors can only be recovered through a cold reset.
> TODO: Wedge device and notify userspace that a cold reset is required.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 52 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 61c01a4bfadb..f35d77654c8f 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -7,6 +7,7 @@
>   #include "xe_printk.h"
>   #include "xe_ras.h"
>   #include "xe_ras_types.h"
> +#include "xe_survivability_mode.h"
>   #include "xe_sysctrl_mailbox.h"
>   #include "xe_sysctrl_mailbox_types.h"
>   
> @@ -102,6 +103,54 @@ static enum xe_ras_recovery_action handle_compute_errors(struct xe_device *xe,
>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   }
>   
> +static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *xe,
> +							      struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_soc_error *error_info = (struct xe_ras_soc_error *)arr->error_details;
> +	struct xe_ras_soc_error_source source = error_info->error_source;
> +	struct xe_ras_error_common common_info = arr->error_class.common;
> +	enum xe_ras_recovery_action action;
> +
> +	/* Default action */
> +	action = XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	log_ras_error(xe, &arr->error_class);
> +
> +	if (source.csc) {
> +		struct xe_ras_csc_error *csc_error = (struct xe_ras_csc_error *)error_info->additional_details;
> +
> +		/*
> +		 * CSC uncorrectable errors are classified as hardware errors and firmware errors.
> +		 * CSC firmware errors are critical errors that can be recovered only by firmware
> +		 * update via SPI driver. PCODE enables FDO mode and sets the bit in the capability
> +		 * register. On receiving this error, the driver enables runtime survivability mode
> +		 * which notifies userspace that a firmware update is required.
> +		 */
> +		if (csc_error->hec_uncorr_fw_err_dw0) {
> +			xe_err(xe, "[RAS]: CSC %s error detected: 0x%x\n",
> +			       severity_to_str(xe, common_info.severity),
> +			       csc_error->hec_uncorr_fw_err_dw0);
> +			xe_survivability_mode_runtime_enable(xe);
> +			action = XE_RAS_RECOVERY_ACTION_DISCONNECT;
> +		}
> +	}
> +
> +	if (source.soc) {
> +		struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error *)error_info->additional_details;
> +
> +		if (ieh_error->error_sources_ieh0.punit) {
> +			xe_err(xe, "[RAS]: PUNIT %s error detected: 0x%x\n",
> +			       severity_to_str(xe, common_info.severity),
> +			       ieh_error->error_sources_ieh0.punit);
> +			/** TODO: Add PUNIT error handling */
> +			action = XE_RAS_RECOVERY_ACTION_DISCONNECT;
> +		}
> +	}
> +

Use else if in source.soc, since source.csc and source.soc bits are set 
(even it's not happen), the same additional details are

cast two different structure type may cause undefined behavior.

Thanks

-/Mallesh

> +	/* For other SOC internal errors, request a reset as recovery mechanism */
> +	return action;
> +}
> +
>   static void xe_ras_prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
>   					   u32 cmd_mask, void *request, size_t request_len,
>   					   void *response, size_t response_len)
> @@ -180,6 +229,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			case XE_RAS_COMPONENT_CORE_COMPUTE:
>   				action = handle_compute_errors(xe, &arr);
>   				break;
> +			case XE_RAS_COMPONENT_SOC_INTERNAL:
> +				action = handle_soc_internal_errors(xe, &arr);
> +				break;
>   			default:
>   				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
>   				break;
