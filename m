Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B971CA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 05:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D0310E582;
	Tue, 29 Sep 2026 05:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XuElyHIh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8600410ECEC
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 05:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790661545; x=1822197545;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xlZIAr0hM5r9Z+nE46hGmG6Bo82H/K1+gXh3MqQJu5s=;
 b=XuElyHIhNIo5Q0y2QO+/2zKdkOwT4U5t3ykYwgvG63qW3LsRHePYp64l
 EoJeFOZ5Qv6LRDxYQNCrI5MHT+8xAX6xT17gSFO8VWlxHhOnZq+yB3DNh
 yOcjxnWt78xROZK8X+nxnDC0QBAU99wybPF/gRfXWE78J9CHSViBmonOU
 8qo7a8+znZI222eqISUgZD4UgwoWUj1m6sBdl6locGuivjcPWgGeeCjhC
 i180YlVrhqHnEsbnHHmV1qLFs1sdvrfWQwOS8jZ2UwZE9EiY2JCNGGgrG
 ylg1pv1bcU0YSKhqjURx27kBuOj5XSeOraoFZJGyBWMAyK8uE60gfyN1U Q==;
X-CSE-ConnectionGUID: P58Ex/aDQlqrAn/rg4xdIw==
X-CSE-MsgGUID: yOplxox6SlWjaXIVEl2LPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="102743929"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="102743929"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:59:04 -0700
X-CSE-ConnectionGUID: 7ShA/f3YTQKux/SF9acJFQ==
X-CSE-MsgGUID: ilz7PoQ3QGOmG9CrWgIHSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="301555104"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:58:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:58:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 22:58:49 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:58:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcht7ossrvoGAm35m/+3LMbAHWgI9u59AiZMhkYXpDxhwRuQsAD/wA5S5ZxLlnGZ7dwP2650iDIaJtsEVS0Oj/QvF15liTh7VtQXXKHDdJbpf3WnLf7QU1gGvemOB6rrhTghrO1TRiSf9jzgpqT/9ZJksdBkwuluNOPIPqf2RNv99u2WYNw+LhnuaYMfwqdkihMSbIbbWLRcMOdav6Ue7mdaYFXS+NhYKwwQXC9fDJ9/H+4sEUW3fzaVjFa7UASNjAi8gCgML3Q/z8XfjY0QU1gZ6IYbwfC7V58uZweYYBm1Bcwcoz4A8+z41r0GyqtxhUI4p11jEE/GDTcRc9wiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZruigcAQI9a0VCV/RWbXAW0VMgGIVroXeQ6rz6KsuU=;
 b=MpwmksUbbTQhk///z5ykgUjJ5AmiytosENovsrd17z58tXEn4gBGzblv35L+D8reeD5fxrxaU0VVl8/xlQsF9v5oZkYQFGXIY1mWCqJmfSipVzamB0uzMeybvQyE09CidtpKZykQwoLnhQsNbWXq+x1ELhORDfBBSesR1vtgEeVywMA2Tl2aTWliyH6kEQBNjKyGCufeiOgekyJOghbnocgFODAqUVhpnD5s/mb/Rdt0Xg9FCIf3s+FE4nZpbcno3VvORABgMVDK2haJTp9Y1bSFLHJHBUxqFpsAACXYaPf9QjxuX2IJk4eObBD7vsIga+zdbxhcXmHRVdoSnOhAow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ5PPFF330187AB.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::860) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:58:46 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0451.014; Tue, 29 Sep 2026
 05:58:45 +0000
Message-ID: <e21f1eac-e651-4e2a-9d65-1b256ffb0733@intel.com>
Date: Tue, 29 Sep 2026 11:28:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] drm/xe/pat: Return error from
 xe_pat_init_early() on unknown platform
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-8-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260928092114.1610203-8-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0136.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ5PPFF330187AB:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f6f5e9-5eb8-435f-aadb-08df1deeb8ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|10067099003|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: ZcgmW4bwZvmy+kOshxfcgbVIN9wULK9q1Ogv3Kjw24YsfqqDZXR/sF5+WmycGIdf8t60Vt4ON3U5x42h8qt1PdcL3dU7zKPXPDY3dTDl7Gopy4M5HbXnjWf7uJ7WO+Ocz/iNJ60vlrmwtdwoHrHzp6TzwXYvnv2RFqyiGRDpsRERThYJUlKb98jRGV1Cyq0oNNR1/LP8fyGnIdsA7MxwkKpNx2x0ha+3t4z0sQMIBkX5VhGsmA26amZpAxbbao5GIXlkyvqTQJ9vQWlFShEGUIcUaNMA+1hukXEOtCAMukyLWx/5gy0AGKHWHLfZj9b6rmKg8dFillIQtGr2s/clDOY6/7GSvaq/9y5NkJ6DyLhDi5tJ3Mcc++/KtUaNPXXYukD6aX3lAYNptm+Z+L6RAUhmjxPGXCtR+z+koA7klHW1Fy+ukwZ86yNTVSyAP+gklp1P9jP+JedWa404ff8FGML08vbuA5Wa6HTvH5LAn39FoVuzheqE7Fff/RGlJKvRXriWjztVRTrer+yp9LOKibNtNeEjHupaKoA7KSyZvO/7DBhl4Qm8Tka6Fxw1NEBzCgHnsEup1KaJ2I42H86kIRe3XY8S1Zydhnbo8SIHVO3324IszgLKmNsrutdrm2vlTgjMLRnEDaXDF12hgVI7lRCYUYh+wTRCR0kxEO2z3kg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjFXQXJFWGRKYXlrTjF6QURwZWp5OFkwaVRZS0NzK3pJS1BqZHRwL0pkUTkx?=
 =?utf-8?B?Wi9oUDRCdGFUQ1R0TnRPZGUvbU1sbW12aFhmdHBMR0VLanB4ZTZvNC8xTUk0?=
 =?utf-8?B?MUtHa0pUenAvaVFSZkZCMTcvc1A3Slh2YUpmVDRtTlEvRlNRbFZTdktubzBP?=
 =?utf-8?B?dXRaWVdFWXdYeUs0Y25kWWpBZW9Xek1KRC9EQVU4SGlMNHRKeHJOOTJkb2gx?=
 =?utf-8?B?QzhodlpPVmtabmcvcHhGb2kzOUR5a3c0S1UyRGxvcTJoRHlRNEI3K01DYysy?=
 =?utf-8?B?VEh1MnBmaUE1MlZZSGsweXBQQzlDdlgyVCs2UzU1ZXk5Z1FZeUVRblg4RlVq?=
 =?utf-8?B?cXU3MzYzOWJZZi8rdUJkTE5YeDlKbG5JWU5WbjZzQWh5MVNqa1FVSWt3Mjc4?=
 =?utf-8?B?MFRDWjFhZ0NHVnBjcFI5VUgweDY0YVNydE5FcHhwcU5YRlAzUDAyRHZLbVFG?=
 =?utf-8?B?L2N6ZkZsU3RTWnJMa1A3cGlSSUJ3Qkhzc1dWemozV1hIWVFsL1JsaW1QL3NU?=
 =?utf-8?B?MHdOOEVOV0dndFc1cHcwNERWOGVsaGdPdEJzUTJxTElPZzhOVkloZFoyLzMx?=
 =?utf-8?B?bytiVDhOTXJObWIrNjZFVUFzaitNUE5WQ1h0cFk1bWdmcnYrUXg5RmdSU0J5?=
 =?utf-8?B?Mm12dndpYVY1RmRscHBxbzB2VXU0NGVqZEFLWDUxVFliTTgzTkdpT2lWcFVp?=
 =?utf-8?B?dVJYZis4a3lnYU5xSHJHUmR0ZU9kWmZZNko5RXNPRmxlZDVpZGxlQWxNWVRE?=
 =?utf-8?B?cUUvMUJocUdubjdMRE1zSkRRaExPLzN6M2RiM0pDTUZLTWtwZTRNWFh5Y0Zo?=
 =?utf-8?B?elBDWDNVRkIxRGE3NXVxOHpaNUNIZUlPa1kzL204SDJLRjFURHhWN2NlL0Nm?=
 =?utf-8?B?ZHZzQ0RObTV3eE9tQ0xiNmFXOXZpdjcwYzNXM0thNGZPRXNwVWd4dm9ZZ09U?=
 =?utf-8?B?ZC9mdEEvNTNUTlRlOVgyOHEzSHlJeU5BcGRmZ2lpeWg3TTBlOHRrRUE3SFo2?=
 =?utf-8?B?S1p0Rks1Z1BHaFIwMjlMZ1NYUk9MaU9FeVNPVEFia3l4NFlsR3lQK2dqOHJa?=
 =?utf-8?B?bjdzbWZsZzJDVkI4MW1SeUZZeVE0S3UzMElmQXQ5ZklzcmoyYzVvKzc4YlB2?=
 =?utf-8?B?K2NEaENIdHZadEYwTng3WHhSQmFEV0pET0IxYVl5SVZUMDFRQ3RhL0o0c2ti?=
 =?utf-8?B?Ulp4anVLSWNYK1NBZzN4OVlUZUNSUmdQR0k4MmlQdFpkU2dsQW9GMmJtQ05P?=
 =?utf-8?B?MnJrMHhoQjVQdDhTT1B0YVFsOVgzYnVQbGZURjVRbTNFLzBodjZORjlsSDhK?=
 =?utf-8?B?cGhDejJuZk5qRGZvSVRlYzI5TXFrZlZEZStNNGYrMmV1QWlLaTlqcVNudjdn?=
 =?utf-8?B?Ylc0Skk0T1RPMEc0SWs2Y0E1SmJTSTh6MVlOOFUzL2E0KzhSVnZKVmlHdDg3?=
 =?utf-8?B?TThjVzhuclZFWkcwdGxKdCtDbXQwdmdaekRhaVdMWjI0WThzUGJ6TjFGZGlk?=
 =?utf-8?B?cWN4R0FGM1hWQ0pzOElXRjJiS2pMcE1rUU1Kb3ZKelpTRWRkWVlCMFVzWi95?=
 =?utf-8?B?Y0l3YysrM05JVTI1UWtGemluOC9DL2FmMERKREYxSU82ME4vZ3JsWnRCdU1C?=
 =?utf-8?B?aHBEVDk4UFNVaEIvWGY2NFdhQWMyakd1ek1hNE1rMkp4YkpzOUJqM2FMWFpa?=
 =?utf-8?B?US85MFZjMzRLWTl5QWd3NVA2TW5Za0xyMlU2UWlyTTc4OXhZT1BlTnNXOXFT?=
 =?utf-8?B?bUMwSUxGMXBHcit5U1dUSkxUbnM1ZHBYbFRGd2l6K205MWF5SEk4Z1hKWmtM?=
 =?utf-8?B?SFluaHcydEI1UHV4SlprOG5HVDF5cFJFT1ZCWG1IVm5yUm84emZ4OHp0YzFs?=
 =?utf-8?B?eG9wQ29TRUxKd045Ni9OYjJEZ2psV29HTkF6dnk3Z09MRUxMd1FmRlB5cFFK?=
 =?utf-8?B?alNHQnQzK05yQXpkenRxb01WdmNUZUdaZjFqaTdnNWhKSXEzQTlxcUI2YUJn?=
 =?utf-8?B?QlNvV1VVVzI4SzdvZEFKNmR3bEh2a2UrSUpXWkFFRW1QdElvbkVpNENvYjVy?=
 =?utf-8?B?a2RJdDdUbjNLLzZmSFBlYlowemJCOHMrNjEvQ254Nmp0Mlh1REdsc1ZJWEI2?=
 =?utf-8?B?eCtyMVZyeEVnTDRGZ0tKekNCcW9LbGFQb3Vyek03MjBiSk4rNEpCMEIrZlc2?=
 =?utf-8?B?R2hnTTlYaWxlcTQ3bCtSdDNjNTYvMjBJa0cxQkwzczNQY0hDWEMyOCtUUG9D?=
 =?utf-8?B?aHRiTUcyS01ZYXh4VjE2RjdEWXdzaHNWYWVFbmtqUUJsUWlyRDBEWUlhclda?=
 =?utf-8?B?OVF5em9tS3F5ZHhqQzhaRU5ySlJmWDl2Y0FhSFpQMUt1Q2JNSklQYy9vdHl6?=
 =?utf-8?Q?VF7CoeGYIz/Vxh8o=3D?=
X-Exchange-RoutingPolicyChecked: fZT4isG3yGVbeVM1QveZctC2QoiH4/Hq7mV+fi6+N+NNz/M6rrdJ31D2m56icyM9cvemLuHGh0WdVhDOxifXiWClL4cbsdrVod1U2uyVcyrbNypVFtQlHACSAGVJ3ZS5QkDGgSqIvv6lxLdTgMlRM9MdhcDQI8Q2a/KZsL2IKmKQAQ8a/pYg+F02SAEkZJLPrr2pdldOCwzIpSCFBrKl05tNaCmA5CJsa4HwA5Ysc2HjP8UrYZ/K2YFSa0fayqrAY/bR+2cafzursrlYObOTGCftHpZNug9thd0RfCLGy8bAx3Epk/ATw+r7TESSHR2oZ8Wqax3c+DDR+bJ0xyDKLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f6f5e9-5eb8-435f-aadb-08df1deeb8ae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:58:45.1556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lQIgQnOilu3VivtA0Nws/7D7F3bcC4nxp8c4iZeZmR6m36rFJzIXZN0kU4Vriu2rcfqn4qsxsoNeJqxKkm/anJNAxSw2+FFozpWIn48WeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF330187AB
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


On 28-09-2026 02:51 pm, Dnyaneshwar Bhadane wrote:
> xe_pat_init_early() currently only logs an error when the platform's
> graphics version doesn't match any known PAT table, but continues
> probing with an uninitialized pat.ops. This can lead to a NULL
> pointer dereference later when pat.ops is used.
>
> Change xe_pat_init_early() to return an int and propagate -ENODATA
> to xe_device_probe() so the driver fails to load cleanly instead of
> continuing in a broken state.
>
> Fixes: 152d7f2db978 ("drm/xe/pat: Handle unicast vs MCR PAT registers")
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
>   - Update kernel-doc for xe_pat_init_early. (Michal)
> ---
> ---
>   drivers/gpu/drm/xe/xe_device.c |  4 +++-
>   drivers/gpu/drm/xe/xe_pat.c    | 13 ++++++++++++-
>   drivers/gpu/drm/xe/xe_pat.h    |  4 +++-
>   3 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 44975e7823be..327f018fe15e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -879,7 +879,9 @@ int xe_device_probe(struct xe_device *xe)
>   	int err;
>   	u8 id;
>   
> -	xe_pat_init_early(xe);
> +	err = xe_pat_init_early(xe);
> +	if (err)
> +		return err;
>   
>   	err = xe_sriov_init(xe);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index a5fe1beec652..519f7d5a2765 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -590,7 +590,13 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>   	.entry_dump = xe3p_xpc_pat_entry_dump,
>   };
>   
> -void xe_pat_init_early(struct xe_device *xe)
> +/**
> + * xe_pat_init_early() - Init early pat table operation.
> + * @xe: the &xe_device
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pat_init_early(struct xe_device *xe)
>   {
>   	xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
>   	xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
> @@ -686,14 +692,19 @@ void xe_pat_init_early(struct xe_device *xe)
>   		 * raise an error rather than trying to silently inherit the
>   		 * most recent platform's behavior.
>   		 */
> +
>   		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
>   			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> +		return -ENODATA;
> +
>   	}
>   
> +	xe_assert(xe, xe->pat.ops);
>   	xe_assert(xe, xe->pat.ops->dump);
>   	xe_assert(xe, xe->pat.ops->program_graphics);
>   	xe_assert(xe, MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
>   	xe_assert(xe, GRAPHICS_VER(xe) < 20 || xe->pat.ops->entry_dump);
> +	return 0;
>   }
>   
>   void xe_pat_init(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 7060f66e1d63..6398c3ab4805 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -42,8 +42,10 @@ struct xe_pat_table_entry {
>   /**
>    * xe_pat_init_early - SW initialization, setting up data based on device
>    * @xe: xe device
> + *
> + * Return: 0 on success or a negative error code on failure.
>    */
> -void xe_pat_init_early(struct xe_device *xe);
> +int xe_pat_init_early(struct xe_device *xe);
>   
>   /**
>    * xe_pat_init - Program HW PAT table
