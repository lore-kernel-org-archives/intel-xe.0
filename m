Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAC1CC6B1F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 09:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4C710FC29;
	Wed, 14 Oct 2026 09:16:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B28F10FC54
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791969368; x=1823505368;
 h=message-id:date:subject:from:to:references:in-reply-to:
 mime-version; bh=3/KcUooXwTCGx8x627tPWwUq07KePRXAP2JsTB8gV7k=;
 b=X84/nToz4NIWmi/x2jgRmV2wGYZJX0TmZunV6t0RZBaCBBe4eezvHAYK
 jkz03wQ8Gx1JpgllXlB1s9a6xEvgZOACju7xE0drmAb7QHdHhpFmkN1Yr
 W9xiOSkQNTnWWsnwA1+GgvyuRESwCzoZ9INlheVzBukmpPRZmghaaXeBz
 K8qcPM+Q4vUY/05HjNCb5Glt2IgCk1Kw58IBA2j/HfaisOMQM2SHGuAf3
 MlGCKefH5PfsplIlMdzeMoiKN+t7B9F/G9xRL+VcAIXqoiZAuLut8VLRF
 6XO36TPpc2AKa8IZqjkXp/zbnTz8VSdiDFv84/dYWqHJOM24Za7KpKi1z A==;
X-CSE-ConnectionGUID: E6fsTxICQweM5+VCYWX2fw==
X-CSE-MsgGUID: susDO+hURtaCrDTLQwe6wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="610503"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; d="scan'208,217";a="610503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:16:07 -0700
X-CSE-ConnectionGUID: Dsysvlw5Ts602+J1j3migQ==
X-CSE-MsgGUID: CR91zP+/RJ2ipHDDZ685XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; d="scan'208,217";a="1841994"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:16:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:16:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 02:16:06 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:16:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETh85Vs0Wu/bOfztOkoRp0uC+lGTkrzNDHSagKXq8V/zx3b6DbmfC03tJp78tRVhFO6qa2+UCks0uDA6hFr9mp4IWM1CYsxdUFysoZ25fDsLwPezUzhDdp2YXVUqgWX4azndAFklP0QRpbVkUO6M3l3p9I5pJVXoVIr1N0nfGfP2AOxIKkEpDRk+CwCb46JDDWQJLEik++LirFes/1RFzRH0bj3eY9Dripm33AunNMo+L6OWS4Lfmd7cm3BCgnE/e64KGBULBK+UwpdGzFo712ZrGthLP90zALAaTYoylF6mmz8d0sAJLry/HAUP9g9HpTmx/62ZxY1pudcTNpMS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0uScOdXPAFX+IiwlWC6iPKDn0uunViqxFwDFdht89Y=;
 b=PYW6YS5LFfPyssqny86jFbmpdqIU22xLvi5fvcd7dMUuAxwQ3LOOmRYzO/hsq6olWfmM8A31yRHPZPHb8x9finMuffXEnE5+ZI+hSwgg3iqFWeRKWQp8zrEUA0fXwZpqXHQ5B37kK/zlKiGnR5IfMpwvOMdprEJ2kPHThXX5gebLOkorR6zCJ5EJLCdP/VjST1z0tphVLzAYZCIf6P17YiDzvmW5sXJN+DXRpJmOjxRieEhJ1X18Ilv/7jBv8IUPN9KSS/CQJ0eTuBje37CGnA0gBon+riWV8ykLrUUmNzl2gA7v3vXK/KN2eeCPOfs9iKsYiWDXU40nAbVOWyGj6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by SAWPR11MB9897.namprd11.prod.outlook.com
 (2603:10b6:806:54a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Wed, 14 Oct
 2026 09:15:34 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 09:15:34 +0000
Content-Type: multipart/alternative;
 boundary="------------m06J59abNpSFD1OGnWpjvGDI"
Message-ID: <02053c3b-c2e7-46ce-875a-14fe2eb81956@intel.com>
Date: Wed, 14 Oct 2026 14:45:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/16] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
 <20261013184939.694945-2-karthik.poosa@intel.com>
 <sashiko-outbox-170371@kernel.org>
 <8c75a6c3-c95d-477f-a1b2-bc8f80aa768e@intel.com>
Content-Language: en-US
In-Reply-To: <8c75a6c3-c95d-477f-a1b2-bc8f80aa768e@intel.com>
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|SAWPR11MB9897:EE_
X-MS-Office365-Filtering-Correlation-Id: b885658b-f333-46d5-4f68-08df29d3b40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|8096899003|3023799007|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: s+S2il35ci7uf3m4DWij2gFfIL9uuUW/JJkFd38zu2US7j/0GuRFRLt97vVrTw+Ans5nfB8WLQ7eMJVp6szJwlw9UtJZLhvbqdHfW40QwL0xB7ieNZVXFcS4f4O9VB1YtUf+61+pf1m8/0QM1ewVXx0y7IdV3moAK8M7+HNHPczUMe4XLVPn8en8GR3ztYNTlqVFY/VFrqJdrAhlyf5c3GoBlIurKqmuYJ2MYqoBW4jEJVzAySTSirrvAeErRhLCPjQ/KeGMCuHs7ZGQXomPiKUoTtJ9w2puk/rENsFFZYnnRu0d+dGP/mYfHiSIVCFbNA2CKd2cAym3x80WFSmAcYuFkX0++om9j7hZ8zLJFyAc9Btkyo/LYn5lUiTeR5zn5ux/VlDWD1/RMJywUeouBJwi4tOb78jbHFgpcwzhzPdUt/xbufsl8l+VmCWKN9RVth4/9EUIBuPUpjmB9sQ/lEyqhfA4m5Ql/+r/BF6FvYPmXmXgyP66KBh6BIIVT6+bk+TASCxZMoajzcdlAiz31CcFrPBYhndBGLkt0AjPGITlP1ACPiPqndRFSXiwjEfhyH6bJj9Efxy4bc5imFh2ZjV/eW4lIlWMMT/Z7XK759QUBfv2LBjPZNbWg2rf6YXRiv3slQiXZis9TVJjGns7rUzv97Trane/cV+XfamFCHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH8PR11MB852307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(8096899003)(3023799007)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlVadVAyVHpPeDByUnM1eWJ0b3FxODUreDMrZHlLOGtnSHpXVklYS3NNUysx?=
 =?utf-8?B?VTlFa2o2bWZJRjUvWmhMbjNNZWpyRUdMd2x4ZzlUekZUYTBURkNSaFB3RFUx?=
 =?utf-8?B?dE5OK1N0MmdWOHYrbGhwZE9DV3JDUG1LZjR0N3I2Zk84ZHNZampDS3diR01F?=
 =?utf-8?B?WmN3NXFITEJEZ0libm9YVHRyY2dPT1c3WWFrNit3cE5iVW9sdnAyaFhHSFE0?=
 =?utf-8?B?dFVEcHRVMVQveHRGc1VJUlZHT0dZUHJ5NlhOMzFCODVHZlNYczBWTktmZFZN?=
 =?utf-8?B?c0RjY1lVUUdqeXlISEc4TjA0QmpMNDY0b2xwNnJIdzRadXgxbWdHcDlCTFpM?=
 =?utf-8?B?Z1ZIRVNncmxVRGF3UkNHTzd5cThSVmkvZGRhZVZuU0ltdERveVJiZ2lPeHps?=
 =?utf-8?B?azdWT29hTC9HWlgxL0lOUmpDS0JYZTJ4QVRmVU1RK3RKcVY4ekQ2ak8vczQr?=
 =?utf-8?B?YS9oZUltYzlSaWQxSk4ybjU1STIxM2lwNGg1TmRrdW9qY0Npb1ZOamxtMmFi?=
 =?utf-8?B?VTBvS3A5ZU4zVWZZUjdMaXRBNWhkdVo5RHkyOW1EeHQxcjZER05OejMrbU9B?=
 =?utf-8?B?NFFWaXBVVzNrL3dPdjd6QkFadVFSMEZKWVR3bHJmcmdhcmt4ZXVpL0hLeVBD?=
 =?utf-8?B?V3VaQUhVd0ZDMWJjQ3ZLMUZjRWRoR1VBWnJ5K0RaU1lkNk0xUjNBTHpodmdt?=
 =?utf-8?B?Y0hiUmJCTGh5NGUvRVNrSnN3V2kvalluUzlwcVVNaVpYTEtYNi9CVlBZcE5K?=
 =?utf-8?B?YUJmYjlaRUdQcVdycXYyckFiRlR2bnIrandUKzd3aUFkYlFIbVNyN3lJNzNU?=
 =?utf-8?B?STlKM0tBZTZBM2pnSks2M2NRaExWTHJ3SGVHL1dWc1RldU41T3o5OWVKTEV6?=
 =?utf-8?B?KzF3UWRMK0NzOW53NXBXZHhoeFNWTlBLckN4eWhGbjArNU9MeHpzOUZ0V0hl?=
 =?utf-8?B?ekk2dkxKLzVIckpOYXlxV2ZuOUFqL0o0TXJWakNjL045WEFGOWxHTU5sNzRs?=
 =?utf-8?B?djVjWVphQ2Q1SnlPQVZKS2RzU0NKQ21McUlaSVBDZ2ZnVjhHbTNaSlR2YTZt?=
 =?utf-8?B?T0lyMmE5cHZkSldmTXI5KzVIWUFFdkN4SEdkbFdlU0N4ZmxLeE5IQ25xZE4x?=
 =?utf-8?B?eUtMbVpGekg0OU9FMVYyYjdnaVlpWXg2WFc1K3NyMTBKNEI0MURvaWw5d0l4?=
 =?utf-8?B?dzdkQUZUY3BsaWQvMEJaVXVNUjlKTVA0THFkTTBnRWYrMHdWYzlvMFlnaUhT?=
 =?utf-8?B?c3dHNWZnM2xGeUo4ejZVRGthcDlVdUJFTTJtMmJKbm1TZEhoYWdoMStlOVJZ?=
 =?utf-8?B?a2EwQ3pQQUdoRVBpNUhvd1RkRWk1bURLMVBpaDAxOW9NQ0FRNkVPc0hWU3Bn?=
 =?utf-8?B?bXRFWjFRelhlYmNWK0F6UkVIRHEyU3lURTNSMVR0emZjSDNYSlpRTTA5WUIy?=
 =?utf-8?B?TkhHdWFxcktpT0gyMGJFYzVZVk5hVmo2TUZqZHZlOUlZNjhJYmlmSmlEQUwv?=
 =?utf-8?B?U2YzUEYxZ0JkcFlsaWhGQkpHZ1VLT0RyS3UzNEpLUC8veERRWXU5dmJUSmtu?=
 =?utf-8?B?OTNaUmpKMDJZWUtKMnpwWGM2L2xZc1JJeFFNNHZNRng0SWpQUVhGZkIxUndW?=
 =?utf-8?B?YzVkNVRoa3JrdzVGaG02WG0xRjFXUlA3MWxNNzBaenJoY0xrejN2a3pZRzVw?=
 =?utf-8?B?ZCszb0pOQUNpTjRQdjIzeVpOOExDVUxadGdXRk5pZHVodFNndWlFcXcwZUpj?=
 =?utf-8?B?Nmg4TVdqcjhMd0NDTmVUVUNEeTAzSmJEVW5KTW5rVWIvRUVreWtLZDMzTVE0?=
 =?utf-8?B?alNiSUhFaC9HcjFtRnM5ZlBkOVF6TXBCMFRmV1ozM0pwQmVoSGx3OGJwS2JL?=
 =?utf-8?B?V2J3b21kRlB1c2laQ2UvSy9Jb09GRHFVUmRJbWNXVWdpL1E3NEd3UDYrZ3Q4?=
 =?utf-8?B?Ym5CVlJWdjJGTkdSbEdFTFhiMjVrSzdJSGJVVGgrMVFTb3J6dE91QjY5Y1F2?=
 =?utf-8?B?Skd2eThTelNhdlcxSDY4Y29Wem9TSkk0MDloNzU4Qit6ZHg1SkIvSEZCeVJ6?=
 =?utf-8?B?SHVNNmRwMjEzNWN4bW44RGUyamRjdDJQa3gwN3RSWVZXVmlGNnpWUGVqckJi?=
 =?utf-8?B?aG5aWmlRUU9xRUR6c2I1aUdlc2pWK2w4emdOU3hDaE9PNUJYOFZiWDIycU5L?=
 =?utf-8?B?cjNRMFBXUkNOS2pCWUhIL3k0bnk3SERWZVpvZk9BUmMrOTRLQUhoaTN2Q0dB?=
 =?utf-8?B?Nm02a3F5S0xxcFQvb2JndkwyQjVVMTRheTViNlVRQmp1ZFlpMGduaVRiUTFj?=
 =?utf-8?B?WUlJODdVMzAzcVpucDdmZXd2N2w4ZUg5MUNGTTZrc0ZuUVV3VHlwQT09?=
X-Exchange-RoutingPolicyChecked: syYCA6Prf3rX5Gy6s7K+i7NCgzFZ36WBjSBFK/DEKBDXpdOSCcRhZe3U/FFjI6Mdl/+fEXU2IpurixOcgZ/hdSjxj+LO/wXerVAyJnhWzKtwvjHAlW7xPO+rVKii2Aj1ZrocdMZjCl/zAtijXtOFiVJvPtaFmdAXLf85RkF29v7XYlYEUWlv80lbOlpI563OTM+w3vc1cC9BIqhOHrGTm4y8kgjzxQWDCJAnSop1iGZ3GFL7zKhoxqTapGftxLZ6lh9rq+MXUwUB+s2LzckQPHLl2DLcEPPk0OtOO7BJA0IqUcAfVkkqeHoQcbw6FqL3R5DVuX1HhpNBVg7tGhZixw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b885658b-f333-46d5-4f68-08df29d3b40b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:15:34.8654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4tzKNHhiebH0mvFwssdVvkkB93UG6NGqPqiM5dpdABGaGdehU0qoV5cEstW8DGebOGgt/HlS0ZHjt1o66wjtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9897
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

--------------m06J59abNpSFD1OGnWpjvGDI
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 14-10-2026 10:28, Poosa, Karthik wrote:
>
> On 14-10-2026 00:33, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential 
>> issue(s) to consider:
>> - [High] drm/xe/hwmon: PCODE active configuration corruption due to 
>> power limit init short-circuit
>> -- 
>>
>> commit 96c45d5f8e540d8e962d44f94ea42a65f2c0cb61
>> Author: Karthik Poosa <karthik.poosa@intel.com>
>>
>> drm/xe/hwmon: Handle pcode read failures of 
>> xe_hwmon_pcode_rmw_power_limit
>>
>> This commit adds error handling for pcode read failures in
>> xe_hwmon_pcode_rmw_power_limit(). It propagates the error codes back to
>> callers, including an updated initialization sequence in
>> xe_hwmon_get_preregistration_info().
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 5edeac961ec33..0b46572bb3c88 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -232,9 +232,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const 
>>> struct xe_hwmon *hwmon, u32 attr
>>>                             READ_PSYSGPU_POWER_LIMIT :
>>>                             READ_PACKAGE_POWER_LIMIT,
>>> prepare_power_limit_param2(hwmon)), &val0, &val1);
>>> -    if (ret)
>>> -        drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, 
>>> val1 0x%08x, ret %d\n",
>>> +    if (ret) {
>>> +        drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, 
>>> val1 0x%08x, ret %d\n",
>>>               channel, val0, val1, ret);
>>> +        return ret;
>>> +    }
>>>         if (attr == PL1_HWMON_ATTR)
>>>           val0 = (val0 & ~clr) | set;
>> [ ... ]
>>> @@ -1510,23 +1518,29 @@ xe_hwmon_get_preregistration_info(struct 
>>> xe_hwmon *hwmon)
>>>                    "Failed to read power limits, check GPU firmware 
>>> !\n");
>>>           } else {
>>>               drm_info(&hwmon->xe->drm, "Using mailbox commands for 
>>> power limits\n");
>>> -            /* Write default limits to read from pcode from now on. */
>>> -            xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>>> -                               CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>>> - hwmon->pl1_on_boot[CHANNEL_CARD]);
>>> -            xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>>> -                               CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>>> - hwmon->pl1_on_boot[CHANNEL_PKG]);
>>> -            xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>>> -                               CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>>> - hwmon->pl2_on_boot[CHANNEL_CARD]);
>>> -            xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>>> -                               CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>>> - hwmon->pl2_on_boot[CHANNEL_PKG]);
>>> +
>>>               hwmon->scl_shift_power = PWR_UNIT;
>>>               hwmon->scl_shift_energy = ENERGY_UNIT;
>>>               hwmon->scl_shift_time = TIME_UNIT;
>>> -            hwmon->boot_power_limit_read = true;
>>> +
>>> +            /* Write default limits to read from pcode from now on. */
>>> +            if (xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>>> +                               CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>>> + hwmon->pl1_on_boot[CHANNEL_CARD]) ||
>>> +                xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>>> +                               CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>>> + hwmon->pl1_on_boot[CHANNEL_PKG]) ||
>>> +                xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>>> +                               CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>>> + hwmon->pl2_on_boot[CHANNEL_CARD]) ||
>>> +                xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>>> +                               CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>>> + hwmon->pl2_on_boot[CHANNEL_PKG])) {
>>> +                drm_warn(&hwmon->xe->drm,
>>> +                     "Failed to set default power limits !\n");
>>> +            } else {
>>> +                hwmon->boot_power_limit_read = true;
>>> +            }
>> [Severity: High]
>> Does this code inadvertently leave power limit sysfs files exposed with
>> boot_power_limit_read set to false when an error occurs?
>>
>> If any of the initializations fail, the logical OR short-circuits. 
>> This skips
>> the remaining initialization calls and leaves boot_power_limit_read 
>> as false,
>> but the driver continues loading.
>>
>> When userspace later writes to a power limit via 
>> xe_hwmon_power_max_write(), it
>> calls xe_hwmon_pcode_rmw_power_limit(). Because boot_power_limit_read 
>> is false,
>> the read phase fetches firmware defaults (READ_PL_FROM_FW) instead of 
>> active
>> PCODE limits.
>>
>> However, the write phase targets the active PCODE registers
>> (WRITE_PACKAGE_POWER_LIMIT). This asymmetrical read-modify-write 
>> silently
>> overwrites the active PCODE register (including sibling power limit 
>> enables and
>> time windows) with the firmware defaults, corrupting the active hardware
>> configuration.
> We shall not expose power limits hwmon sysfs node, if this write fails.
On further review, I’d like to revise my earlier comment. We don't need 
to hide the power limit sysfs attributes if the boot-time write fails.
We can warn during probe and keep using READ_PL_FROM_FW for that channel 
until a pcode write succeeds.

--------------m06J59abNpSFD1OGnWpjvGDI
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14-10-2026 10:28, Poosa, Karthik
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:8c75a6c3-c95d-477f-a1b2-bc8f80aa768e@intel.com">
      <br>
      On 14-10-2026 00:33, <a class="moz-txt-link-abbreviated" href="mailto:sashiko-bot@kernel.org">sashiko-bot@kernel.org</a> wrote:
      <br>
      <blockquote type="cite">Thank you for your contribution! Sashiko
        AI review found 1 potential issue(s) to consider:
        <br>
        - [High] drm/xe/hwmon: PCODE active configuration corruption due
        to power limit init short-circuit
        <br>
        --
        <br>
        <br>
        commit 96c45d5f8e540d8e962d44f94ea42a65f2c0cb61
        <br>
        Author: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
        <br>
        <br>
        drm/xe/hwmon: Handle pcode read failures of
        xe_hwmon_pcode_rmw_power_limit
        <br>
        <br>
        This commit adds error handling for pcode read failures in
        <br>
        xe_hwmon_pcode_rmw_power_limit(). It propagates the error codes
        back to
        <br>
        callers, including an updated initialization sequence in
        <br>
        xe_hwmon_get_preregistration_info().
        <br>
        <br>
        <blockquote type="cite">diff --git
          a/drivers/gpu/drm/xe/xe_hwmon.c
          b/drivers/gpu/drm/xe/xe_hwmon.c
          <br>
          index 5edeac961ec33..0b46572bb3c88 100644
          <br>
          --- a/drivers/gpu/drm/xe/xe_hwmon.c
          <br>
          +++ b/drivers/gpu/drm/xe/xe_hwmon.c
          <br>
          @@ -232,9 +232,11 @@ static int
          xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon,
          u32 attr
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; READ_PSYSGPU_POWER_LIMIT :
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; READ_PACKAGE_POWER_LIMIT,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          prepare_power_limit_param2(hwmon)), &amp;val0, &amp;val1);
          <br>
          -&nbsp;&nbsp;&nbsp; if (ret)
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;read failed ch %d
          val0 0x%08x, val1 0x%08x, ret %d\n&quot;,
          <br>
          +&nbsp;&nbsp;&nbsp; if (ret) {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_err(&amp;hwmon-&gt;xe-&gt;drm, &quot;read failed ch %d
          val0 0x%08x, val1 0x%08x, ret %d\n&quot;,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; channel, val0, val1, ret);
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
          <br>
          +&nbsp;&nbsp;&nbsp; }
          <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (attr == PL1_HWMON_ATTR)
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val0 = (val0 &amp; ~clr) | set;
          <br>
        </blockquote>
        [ ... ]
        <br>
        <blockquote type="cite">@@ -1510,23 +1518,29 @@
          xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Failed to read power limits, check GPU
          firmware !\n&quot;);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;hwmon-&gt;xe-&gt;drm, &quot;Using
          mailbox commands for power limits\n&quot;);
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Write default limits to read from pcode from
          now on. */
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_hwmon_pcode_rmw_power_limit(hwmon,
          PL1_HWMON_ATTR,
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHANNEL_CARD, PWR_LIM |
          PWR_LIM_TIME,
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          hwmon-&gt;pl1_on_boot[CHANNEL_CARD]);
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_hwmon_pcode_rmw_power_limit(hwmon,
          PL1_HWMON_ATTR,
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHANNEL_PKG, PWR_LIM |
          PWR_LIM_TIME,
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          hwmon-&gt;pl1_on_boot[CHANNEL_PKG]);
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_hwmon_pcode_rmw_power_limit(hwmon,
          PL2_HWMON_ATTR,
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHANNEL_CARD, PWR_LIM |
          PWR_LIM_TIME,
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          hwmon-&gt;pl2_on_boot[CHANNEL_CARD]);
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_hwmon_pcode_rmw_power_limit(hwmon,
          PL2_HWMON_ATTR,
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHANNEL_PKG, PWR_LIM |
          PWR_LIM_TIME,
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          hwmon-&gt;pl2_on_boot[CHANNEL_PKG]);
          <br>
          +
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hwmon-&gt;scl_shift_power = PWR_UNIT;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hwmon-&gt;scl_shift_energy = ENERGY_UNIT;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hwmon-&gt;scl_shift_time = TIME_UNIT;
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hwmon-&gt;boot_power_limit_read = true;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Write default limits to read from pcode from
          now on. */
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe_hwmon_pcode_rmw_power_limit(hwmon,
          PL1_HWMON_ATTR,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHANNEL_CARD, PWR_LIM |
          PWR_LIM_TIME,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          hwmon-&gt;pl1_on_boot[CHANNEL_CARD]) ||
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_hwmon_pcode_rmw_power_limit(hwmon,
          PL1_HWMON_ATTR,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHANNEL_PKG, PWR_LIM |
          PWR_LIM_TIME,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          hwmon-&gt;pl1_on_boot[CHANNEL_PKG]) ||
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_hwmon_pcode_rmw_power_limit(hwmon,
          PL2_HWMON_ATTR,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHANNEL_CARD, PWR_LIM |
          PWR_LIM_TIME,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          hwmon-&gt;pl2_on_boot[CHANNEL_CARD]) ||
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_hwmon_pcode_rmw_power_limit(hwmon,
          PL2_HWMON_ATTR,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CHANNEL_PKG, PWR_LIM |
          PWR_LIM_TIME,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          hwmon-&gt;pl2_on_boot[CHANNEL_PKG])) {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_warn(&amp;hwmon-&gt;xe-&gt;drm,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Failed to set default power limits
          !\n&quot;);
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hwmon-&gt;boot_power_limit_read = true;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
          <br>
        </blockquote>
        [Severity: High]
        <br>
        Does this code inadvertently leave power limit sysfs files
        exposed with
        <br>
        boot_power_limit_read set to false when an error occurs?
        <br>
        <br>
        If any of the initializations fail, the logical OR
        short-circuits. This skips
        <br>
        the remaining initialization calls and leaves
        boot_power_limit_read as false,
        <br>
        but the driver continues loading.
        <br>
        <br>
        When userspace later writes to a power limit via
        xe_hwmon_power_max_write(), it
        <br>
        calls xe_hwmon_pcode_rmw_power_limit(). Because
        boot_power_limit_read is false,
        <br>
        the read phase fetches firmware defaults (READ_PL_FROM_FW)
        instead of active
        <br>
        PCODE limits.
        <br>
        <br>
        However, the write phase targets the active PCODE registers
        <br>
        (WRITE_PACKAGE_POWER_LIMIT). This asymmetrical read-modify-write
        silently
        <br>
        overwrites the active PCODE register (including sibling power
        limit enables and
        <br>
        time windows) with the firmware defaults, corrupting the active
        hardware
        <br>
        configuration.
        <br>
      </blockquote>
      We shall not expose power limits hwmon sysfs node, if this write
      fails.
      <br>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">On
      further review, I’d like to revise my earlier comment. We don't
      need to hide the power limit sysfs attributes if the boot-time
      write fails.&nbsp;</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">We
      can warn during probe and keep using READ_PL_FROM_FW for that
      channel until a pcode write succeeds.</div>
    <br>
  </body>
</html>

--------------m06J59abNpSFD1OGnWpjvGDI--
