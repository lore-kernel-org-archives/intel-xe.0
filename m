Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E368FCD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 18:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76A610E0E4;
	Fri, 19 Jun 2026 18:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GThXpiBy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FA810E0E1
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 18:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781892259; x=1813428259;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9vG8BFGs9tOeVHz4tIpSBRmjrSKwo2raPodyPLbNhws=;
 b=GThXpiBy881wBHgfTz8eO3HmVq6moGW0Lp4xIoLtOUJusMyBiEbhgokb
 XkkI6/7Xrj+P1YTrZ0DjUWJkEE9aU/vX9xrhnJ/Tnr9SOwNlG6bcPiCm7
 9FtaZkDn4jL7L/rXCLyzruo+pVUJ/ShqkgSm/hALCHX7Sf5Xq56xX/4Ut
 hsqvEd98Vr/JLlYD5K5TCQRXe5E5Xj0GaFTNFNai7veEd6XJDgFOVn4Va
 H3489aFWKyfOBPAkZfxdPJ0RdJ6h2l14lT6P6U+2Q1OW/y205Mg2RNUcW
 CmGtv9eIv4nqvn0/e1AVLQkKDfwdCVUebV+Egg+ShGlivOQgiQiat9DCF A==;
X-CSE-ConnectionGUID: NQE4OL4CSrGWXsZGUbE63Q==
X-CSE-MsgGUID: 1yuH2lS3RDeaz4GBpgEdhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="108282961"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="108282961"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 11:04:19 -0700
X-CSE-ConnectionGUID: mYELoawkSDyFkrVNYrjWag==
X-CSE-MsgGUID: zhRv17ZFQrytGWLEYbhufA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 11:04:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 11:04:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 11:04:18 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 11:04:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSfwGNmvuvZBbZm+J3GyXgUjTMl8BdlC6Spmou3SRaOYADFfSGJ1U7FarMg0jUY6XeUBmFzw+UH+C16Jzv642tIxmkI7BnbByWHN1Y7jPf2NTlKV+26NX+2KLApYz2DQl7jcPnnLxvlhA5msuDuuQ7X6BD6AQ3/svk6FFYMBNqncBTC0YQFooE/FUJKy0TYEIw/BClDdhjnKIluAmmQzK0CoKnokXx6bRdVkDqc2xUy5o/IYWoKec8TWrJpPzMqt5cTUNiu4XUL4cWaQTy6Ue6d+oXZ6v/Czaorn++Z7peNaNG81dIKM6nu6FcOFWdmudNc1tqGnFjZfz/tAnTIvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSvPSGDC27zlFaEW56aPyEOoEUUCt1zojG3SPGy058o=;
 b=KHZzTHqLsedGE7W3X5kgmoIWYZVUgEFxQmSzN7YNk6STeBT7PHfDLS5ejp7Flkvb4d1aJzJyPIrgOPruqoOihg6bFYKcf4v+EDnS2bx0EkMWnTvtKyFbeP+fgJBZmS8Vw0uAZkHVpw9ZGdobF6DXVx1tMpusSZEXoaVCSYc8ti+Sz03KJ/7JekNpg4nTrhgKVKMVVWEub6N0eM4WIKk742nMzuLZHvYnvnXnBU3Ks+uFlYZhL2+6fm5arzGcCjhPVDg3z/m0a7yHwD8ziN5fCcwsJv00AwE7vZUa4kxjWQ2pGEv9SIZ0KRropeonnAhBXlnU3kbYXpS72/hcSrMn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 18:04:16 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 18:04:16 +0000
Message-ID: <a1bdb765-b831-42b3-ab14-fb934d443991@intel.com>
Date: Fri, 19 Jun 2026 23:34:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] drm/xe: Add graphics/media IPs and their step info to
 xe_probed_info
To: <intel-xe@lists.freedesktop.org>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-7-21e83e188e60@intel.com>
Content-Language: en-US
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-7-21e83e188e60@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To IA1PR11MB6266.namprd11.prod.outlook.com
 (2603:10b6:208:3e6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6266:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: ee24277d-7473-4890-fe25-08dece2d2d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info: g/ACzVtRY58IEaNPCz5YZKdmsfZipY/evpZP6WAC0ggpbL2+1UgRDx1vgNWfjwTvBmAkz8xYvltLFVuscXBi7EFreFQAcwMWQqxYjCtdKxaXywUt3qX7l7/EydN55rLfa7hI99V7FYrNe8gUktDCUlHfSkV7ma2R8xDLx7p+ONfhFHQRxBJ5sr+TWwf0qS8EWG9mRvSMgO5zGVEvGyHgcMY7HttDoLJeFTUQn5lPLx1SqicIphd0DZuzmTzI1MCY8M+iTL6XlWK92P0v9G7xwLHJHGO8nXuwWfDTACeHB6MblBIcNJLcx/vlfid9ahgAjCZECTg0pRAI5YW7SgPPRVsQdX0Y/pvb9ETShgd7Wn03+fJkpc8SsFtEN2xY45dEPfFOfJrnZz0h0CHsFwXaxOEa8DTiUD9nvzVddnaE8AmI0yn0bBfnXBfec5YwfbDOq2LwgnjO5CHlY4NCiwin2DScBXY762J3W9wcKdhGNzYyVSYEWLavCD43R0xzW8pD+lZdjLyDiHnhXiNROmQHY/mtmn/9zRxSTFy6P2y4j/h/dt/CjBS4rL/MnLm1E19EHlMqZj5XjY4tnHWVFyqDdNEza1QXAf+SOUCRiYMwF6JRqjNVvlToyB1EPt4YVz3OONQ38fObSu+5QYdluFUfAJTRKct1CtGCr+a8eWQL4Oo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTR4SnR2Vmg5bzFMS25MMUZJWXdlSlZmN3JBTVNGYUUzbExhekM4cFdyMnJp?=
 =?utf-8?B?RTd5QzcwbTNSZmMrMVVhVnZtVkhReGVDTDNHd1ZrWDBIem1aT3Yza0hQMWI5?=
 =?utf-8?B?K1BhcGJmUU9SOW9XU0IxOVBieXhhVUNDZndJckxGTWRocE1LdzRnU2U2N2hl?=
 =?utf-8?B?MW1ZM0xrREd2bVkyRVRndmpNWFIyZS9UQ094akNKU0xXb2trdEFyNy9xV3Rz?=
 =?utf-8?B?eE4vZG8wNi9JQTJKc2UvYmdHZlhGL2ZGamdCaWpYRmJXZVd3RXFrU2VtTklD?=
 =?utf-8?B?OENiSnFFZ1ZFeXNKQWhXbWR5STZ1NlJHa0JEUFMwZTVIVFVNWExLcGxmWHR6?=
 =?utf-8?B?MlpGeDVzOVMza01yNHBMVnFtUUZUajdPUTVlSmg5cVFJdGthUXFwbTliRUpv?=
 =?utf-8?B?T21BeklGMGZpT2FGVzhqd2FlZUNCM2UvVmxJL2hHMU5ZWmZDYkJ2M2lDbFBE?=
 =?utf-8?B?cGI2Ukk4ZDNRVTZZUWdHYkxXc3B5S0t0VDQwelZ6YTViTlFRTFhFSFZ4WS9I?=
 =?utf-8?B?aWNZY2NPVXpaZnlIS3F2bnB2bUl5ZjNIbG5NNzJWQU9hblA2dkdHZFZodXBp?=
 =?utf-8?B?dzZKWlJwbnhwN2xlRmhNQVFVYjlXczJiU2cvOUV1SGk2dkZET0RDcGVZVEhL?=
 =?utf-8?B?TTM3Tk1jZ2lxTlNpaERmcFZvcUd4WWlNb01QaHNJSmIwcm5ZZmU2NVRiMXRC?=
 =?utf-8?B?dGR1TnNlbmFleWxaZUg0eWNjTllRSXpQVnNGY0ZJdFMyaW1QbXdvdGhZSXhL?=
 =?utf-8?B?NkNyZ3Q3UFF1czgzNnZZTmxkeWhiYjVUbEVmZWZvbW4yK3NkUngwNXRTQys3?=
 =?utf-8?B?eWtCcVZrUUF2NUVIMnM4S3ZNeW5vajlPSFFvblhUM1E1elZ1VFk2ZWhsVFpN?=
 =?utf-8?B?U29ENkMza3QxVEhoM1dDenJUSHM1RzVnc1RSOThoY1VkMysyUjZvR2FKQ29V?=
 =?utf-8?B?c1IrNHl0WUFyc2Y2RVFyM1JUVDA5NktDcFlXdERlRG4wSVBveWYrMStpR1Iv?=
 =?utf-8?B?Z1FXOE9iMXAwUUpuRHZVSk1RWVhRNUdjaTN5d0N3SDNuSldwQVhsaU5xbUs5?=
 =?utf-8?B?bnFFZUowS1d5aGp2NkVtR3hVdTJnMlJCbXpjRFlqM0V4RVJmckk2ZWF5L01R?=
 =?utf-8?B?bEhJUkwwT2VhYWptd3Mwbm5rSmFid2hBblkraHZCci9mUm81M1IzUzFWdlIx?=
 =?utf-8?B?TnhkZEswejBCQ0xYL2RDT3dPQlA0VmJJZiszVU15Q09rTVZ0K1dPdzRCUzFU?=
 =?utf-8?B?SXRDRVVnbHk3Y2pQRGhvSytScjB2aCtSTkl5SmpSQVBCMFZGSkp5QXVjTktH?=
 =?utf-8?B?YVE1d1FzTXlHSVEzbDl5djcremQxYzlYTW03VGMxZ3BncEtFK2NXTHdkalBn?=
 =?utf-8?B?VkdrWmF4Yy9oZ29GblJ1Y0ZNeFJ4V0NCTXFINDIrUGZ1LzYxRzFFNzRrZDF3?=
 =?utf-8?B?QmhybHkxL08zVTRlRGg5MTFOVklLMVNjck5oeXdlYnFmNm9OUS9mOTF0NTgx?=
 =?utf-8?B?NWVLQkh6Q2lqTzVDTkJZQlQ4eURsY0Vzc0o0UmFhVTdaQmEraWREVTQwb3hM?=
 =?utf-8?B?LzhKTXZqUGROUzZwbzlRcDJURnVVbFV3emdocE01NjlaUTI1UU1HV0F3eDA5?=
 =?utf-8?B?RENDSWdyVzZmUFpyb05aQkd0VW5adEVxb1NFYm1Yd3BoclpYYTdTUzdkK1NE?=
 =?utf-8?B?a2FqK1pnUmVNSXU1VmxHSEo2cmRVOG1jWVBlVzI4eWFlRjlwWm5NT01PVlY0?=
 =?utf-8?B?bEJuL2dBWGx3dGRCRXluMnFBSVZ1ZmVpcVlsZkFZaVZrSTRDeDNHaTFJZEVT?=
 =?utf-8?B?K3ZvWVRWbVd2bzlRY0V5NlpEU1lTZG9jNWE5TEE5a2tUZjFzblhUTUNuZ3FO?=
 =?utf-8?B?Qy9ZSENWbkR1UHd4Zm1ETUlmL3BneXkrTWl2U3J3Q1hRTHBTTVRLNEt5ZjdQ?=
 =?utf-8?B?b2FGZUpWcWlMbEloQmFTUitPaFVuRDM4QUdiVnJ4QVhHdTE2VFk3QzVacngw?=
 =?utf-8?B?YlEvVi9URWdqVkJoRWdQWHdONWlPcTJlUWhPWWlHcEJQRTdTL1RKTmdrdDN3?=
 =?utf-8?B?QndYNVZmVlk2VmFYa3RWa3RYSzV1V2xCd3M2UlBtL1pOeHVTWnM1VFJVTVVl?=
 =?utf-8?B?R0R3WEh3VTV5RDI1MStGejQxME0wUEZLL2VHTDd3aG1RazJZOUpNazAyQjRC?=
 =?utf-8?B?VXVqN2JyY1hJVm9vRk84OVZNREhHZFVqZjdQYU1zY2gxT0pyT01qd2liVldK?=
 =?utf-8?B?c3RHNE0xT2puUHA0SElITk1RUWRraEdCUG1kcmx0V3VjQWlCcUJrNXFhcWxL?=
 =?utf-8?B?Q2t3NHZkYWZxSm8yRDJtUkdXRlROY0tBLzRMRU9WTGJ1aHRhbWFEOUVPVFBj?=
 =?utf-8?Q?zNcUybhKF3qBBawM=3D?=
X-Exchange-RoutingPolicyChecked: dD8oZC+QJyP3+TKFsIAAySY2U9Tky9WssfAx+n/5CB80MQ19V66PyCQwqSlXLyT+YMywUj+yU7/iCedYT7511J9fvFcag7c9uywv/zpbL/3oDHyV9Qo1oR+eZoOcbweON+h2PLurVYpx1/CkKkfBYAXPPBfEB69UJ0ukpE7SlhYlVqVOBCoe64RqMQBTus3UzWof1P63ATcVVzujmwiBWTnuNwKC8ek4Y1mVi5MN8NYM26QZmVGaumGJiDPll5ohHIJhypSVU6/JLQElBUVtAuuKuyEo/cNQjTh5zuCLYfEWT7BjwsUl1XVBsE3lCWnNhUdTg/qGctDKQIlKW1KVgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee24277d-7473-4890-fe25-08dece2d2d29
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 18:04:16.3112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi0Q/dfX0Oy3htZYQJ8qKMyuV3Af3jbIRR8WdNXGlG/QGZqORzQFMcwYdMYVtgu51LMx2xfpv5P+1mBhvtaVtgbYzY0Jy6r4BCdQvp21ob0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
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



On 10-Jun-26 1:47 AM, Gustavo Sousa wrote:
> On GMDID-based platforms, the driver needs to probe the hardware by
> reading GMDID registers in order to identify the
> graphics/media/display IPs that are present in the platform as well as
> their stepping values.
> 
> Currently, xe_info_init() has such a probing logic, but that task
> should be rather responsibility of xe_probe_info().  As such, move it
> to the latter.
> 
> For pre-GMDID platforms, the IPs are identified via PCI devid and
> revid fields, which is arguably also hardware dependent.  So do the
> same for those platforms.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


LGTM,
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

> ---
>   drivers/gpu/drm/xe/tests/xe_pci.c | 44 ++++++++++----------
>   drivers/gpu/drm/xe/xe_pci.c       | 88 ++++++++++++++++++++++++---------------
>   2 files changed, 77 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index a665d5dbc472..cd64b1d614c8 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -311,31 +311,35 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>   
> -static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
> -			   u32 *ver, u32 *revid)
> -{
> -	struct kunit *test = kunit_get_current_test();
> -	struct xe_pci_fake_data *data = test->priv;
> -
> -	if (type == GMDID_MEDIA) {
> -		*ver = data->media_verx100;
> -		*revid = xe_step_to_gmdid(data->step.media);
> -	} else {
> -		*ver = data->graphics_verx100;
> -		*revid = xe_step_to_gmdid(data->step.graphics);
> -	}
> -
> -	return 0;
> -}
> -
>   static void fake_xe_info_probe_tile_count(struct xe_device *xe)
>   {
>   	/* Nothing to do, just use the statically defined value. */
>   }
>   
>   static int fake_probe_info(struct xe_device *xe,
> +			   const struct xe_device_desc *desc,
> +			   struct xe_pci_fake_data *data,
>   			   struct xe_probed_info *probed_info)
>   {
> +	if (!data || desc->pre_gmdid_graphics_ip) {
> +		probed_info->graphics_ip = desc->pre_gmdid_graphics_ip;
> +		probed_info->media_ip = desc->pre_gmdid_media_ip;
> +	} else {
> +		probed_info->graphics_ip = find_graphics_ip(data->graphics_verx100);
> +
> +		if (data->media_verx100) {
> +			probed_info->media_ip = find_media_ip(data->media_verx100);
> +			xe_assert(xe, probed_info->media_ip);
> +		}
> +	}
> +
> +	xe_assert(xe, probed_info->graphics_ip);
> +	if (!probed_info->graphics_ip)
> +		return -ENODEV;
> +
> +	if (data)
> +		probed_info->step = data->step;
> +
>   	return 0;
>   }
>   
> @@ -377,20 +381,16 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>   	xe->sriov.__mode = data && data->sriov_mode ?
>   			   data->sriov_mode : XE_SRIOV_MODE_NONE;
>   
> -	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
>   	kunit_activate_static_stub(test, xe_info_probe_tile_count,
>   				   fake_xe_info_probe_tile_count);
>   
> -	err = fake_probe_info(xe, &probed_info);
> +	err = fake_probe_info(xe, desc, data, &probed_info);
>   	if (err)
>   		return err;
>   
>   	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
>   	xe_info_init(xe, desc, &probed_info);
>   
> -	if (data && !data->graphics_verx100)
> -		xe->info.step = data->step;
> -
>   	return 0;
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1c53a25442a9..388771ef6a52 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -600,8 +600,6 @@ static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u
>   	struct xe_reg gmdid_reg = GMD_ID;
>   	u32 val;
>   
> -	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
> -
>   	if (IS_SRIOV_VF(xe)) {
>   		/*
>   		 * To get the value of the GMDID register, VFs must obtain it
> @@ -731,6 +729,8 @@ struct xe_probed_info {
>   	u16 devid;
>   	u8 revid;
>   	struct xe_step_info step;
> +	const struct xe_ip *graphics_ip;
> +	const struct xe_ip *media_ip;
>   };
>   
>   /*
> @@ -924,12 +924,59 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>   	return gt;
>   }
>   
> +static int xe_probe_ips(struct xe_device *xe,
> +			const struct xe_device_desc *desc,
> +			struct xe_probed_info *probed_info)
> +{
> +	/*
> +	 * If this platform supports GMD_ID, we'll detect the proper IP
> +	 * descriptor to use from hardware registers.
> +	 * desc->pre_gmdid_graphics_ip will only ever be set at this point for
> +	 * platforms before GMD_ID. In that case the IP descriptions and
> +	 * versions are simply derived from that.
> +	 */
> +	if (desc->pre_gmdid_graphics_ip) {
> +		probed_info->graphics_ip = desc->pre_gmdid_graphics_ip;
> +		probed_info->media_ip = desc->pre_gmdid_media_ip;
> +		xe_step_pre_gmdid_get(xe, &probed_info->step);
> +	} else {
> +		int err;
> +		u32 graphics_revid, media_revid;
> +
> +		xe_assert(xe, !desc->pre_gmdid_media_ip);
> +
> +		err = handle_gmdid(xe, &probed_info->graphics_ip, &probed_info->media_ip,
> +				   &graphics_revid, &media_revid);
> +		if (err)
> +			return err;
> +
> +		xe_step_gmdid_get(xe, graphics_revid, media_revid, &probed_info->step);
> +	}
> +
> +	/*
> +	 * If we couldn't detect the graphics IP, that's considered a fatal
> +	 * error and we should abort driver load.  Failing to detect media
> +	 * IP is non-fatal; we'll just proceed without enabling media support.
> +	 */
> +	if (!probed_info->graphics_ip)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
>   /*
>    * Probe from the hardware the info required by xe_info_init().
>    */
>   static int xe_probe_info(struct xe_device *xe,
> +			 const struct xe_device_desc *desc,
>   			 struct xe_probed_info *probed_info)
>   {
> +	int err;
> +
> +	err = xe_probe_ips(xe, desc, probed_info);
> +	if (err)
> +		return err;
> +
>   	return 0;
>   }
>   
> @@ -943,44 +990,19 @@ static int xe_info_init(struct xe_device *xe,
>   			const struct xe_device_desc *desc,
>   			struct xe_probed_info *probed_info)
>   {
> -	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
>   	const struct xe_ip *graphics_ip;
>   	const struct xe_ip *media_ip;
>   	const struct xe_graphics_desc *graphics_desc;
>   	const struct xe_media_desc *media_desc;
>   	struct xe_tile *tile;
>   	struct xe_gt *gt;
> -	int ret;
>   	u8 id;
>   
> -	/*
> -	 * If this platform supports GMD_ID, we'll detect the proper IP
> -	 * descriptor to use from hardware registers.
> -	 * desc->pre_gmdid_graphics_ip will only ever be set at this point for
> -	 * platforms before GMD_ID. In that case the IP descriptions and
> -	 * versions are simply derived from that.
> -	 */
> -	if (desc->pre_gmdid_graphics_ip) {
> -		graphics_ip = desc->pre_gmdid_graphics_ip;
> -		media_ip = desc->pre_gmdid_media_ip;
> -		xe_step_pre_gmdid_get(xe, &xe->info.step);
> -	} else {
> -		xe_assert(xe, !desc->pre_gmdid_media_ip);
> -		ret = handle_gmdid(xe, &graphics_ip, &media_ip,
> -				   &graphics_gmdid_revid, &media_gmdid_revid);
> -		if (ret)
> -			return ret;
> -
> -		xe_step_gmdid_get(xe, graphics_gmdid_revid, media_gmdid_revid, &xe->info.step);
> -	}
> -
> -	/*
> -	 * If we couldn't detect the graphics IP, that's considered a fatal
> -	 * error and we should abort driver load.  Failing to detect media
> -	 * IP is non-fatal; we'll just proceed without enabling media support.
> -	 */
> -	if (!graphics_ip)
> -		return -ENODEV;
> +	graphics_ip = probed_info->graphics_ip;
> +	media_ip = probed_info->media_ip;
> +	xe->info.step.basedie = probed_info->step.basedie;
> +	xe->info.step.graphics = probed_info->step.graphics;
> +	xe->info.step.media = probed_info->step.media;
>   
>   	xe->info.graphics_verx100 = graphics_ip->verx100;
>   	xe->info.graphics_name = graphics_ip->name;
> @@ -1165,7 +1187,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (err)
>   		return err;
>   
> -	err = xe_probe_info(xe, &probed_info);
> +	err = xe_probe_info(xe, desc, &probed_info);
>   	if (err)
>   		return err;
>   
> 

