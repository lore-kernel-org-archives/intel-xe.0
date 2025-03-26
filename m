Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CBCC36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 22:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E566710E06F;
	Wed, 26 Mar 2025 22:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUUfo/D5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D6010E06F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 22:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743026577; x=1774562577;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=giZw2EE3gtd/K3d1bULSygFEXaAHHcp4LY4/xg6P3gk=;
 b=eUUfo/D5vtrtjTzZ6lSf4jIvWW1yPFKhk/FhpJRxXfzwLyVdq0oZprjW
 DukzAdR1S0UyP9P46JukV38ox/AHYkNKTKEny7a4yvclng7XvjsIMBXju
 1W5UGfV5PiHscqZoyrevrUTA2/biRjnbnm8T+nKbgVH9Uhi97vom0j+oX
 mWoy+UppWCrKJfk+3E/0YjTY734gx9w4GJTJIGLbS4G3kjRlYDPhTvNty
 E7VuufVKQt29Uu4eyiKfyz4VfrzV5NS0upldov5Um1TL2tBT+WcVzw31A
 RN5IPBs4rqvlL7lSp8I2RfjCdyDeY2RIf88LFzgz0+ElJz3KdtkOnAnfe A==;
X-CSE-ConnectionGUID: ArejibbBSNyB1tkFx4Qc3Q==
X-CSE-MsgGUID: hpg9xKglTBipzP/z4zdjew==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44441369"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44441369"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 15:02:57 -0700
X-CSE-ConnectionGUID: 7i4MSHAnS6SI/KvpIrSD2Q==
X-CSE-MsgGUID: rE/Nn5PPSU+8kmbPGrqGuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="124868617"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2025 15:02:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 15:02:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 15:02:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 15:02:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bD0MdNJGlYPHUDQeUH/zQzal+qMkx4Nq1bAVj9vGx/Xv7nCHaIbj5pv9GbAkBIvjmDxdk/Ao1XJ1RiZbI+JfUCPSkmQybzrBMm6qociB/GyoVdP1auJ7qaAywH4eo1C7US+wFa/brW52DUrq7u5jVUVYVgBjnsMia5rL69CF+dMtcUjY4bpFGQuZqP6Ewwt7yPbfiwzopdshuWy1x6xir8LeXRhbBiP1MDIdGctCzNdZa3Xh1sdWfWPaXhWQt+Bs74MhRKJcOApMp5AEXe5/h1VYHiJ3PLmOQQOhOXSKNLWcMcu6dJAAmBjhS5aDBZh3ZMqj/CxiWGSFJ5A4TEFlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjVbubCoKXVQdkdlLJSpeZsc6sNGrgeBXhkezNhJ9ro=;
 b=yYWb00nMA8b7M/kAdMs57qAiGT9qeknMjOx9+QVEmCz6r9t6YXN29LvtjFsGfs+Id/2PPct6K2XEbUNd9jDDneZ6FPx8Sp7apIZYKljJqhDkCGq3VmsqgwRqXRNEcPpu0Haaxfw5xVeN6T0ae/nZbEkBzidsXESeMfqqyB9e9Ga244268NSS4eRAEGMrBFFgh+nxFbNaYqtK9x4yuIEYSsOPT4XM25sVPDWY3ZOFsV5QFym67TkL8LLnicQY5cnNHEZBDcyEwwuJIAgYOmNxlKaV6dH78DQQok9Z7uXcFyqpUKTsJP/wuBo5SnwL2d3IsPOHpgtRlCiH/nkruGDDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 22:02:51 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 22:02:51 +0000
Message-ID: <4a2d5282-eec6-412d-8b4f-2b9ee165bd6f@intel.com>
Date: Wed, 26 Mar 2025 15:02:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/pmu: Add GT frequency events
To: Lucas De Marchi <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
 <87jz8e9d3h.wl-ashutosh.dixit@intel.com>
 <b46fbbd0-ee96-4f00-9f6f-a00115feb32d@intel.com>
 <87jz8dhw0r.wl-ashutosh.dixit@intel.com>
 <33ebfe1d-5ac5-4985-8c8d-c1996e5a6d14@intel.com>
 <87h63gixq0.wl-ashutosh.dixit@intel.com>
 <269b993d-2a22-4080-8609-66650a60ad62@intel.com>
 <87frj0ivbh.wl-ashutosh.dixit@intel.com>
 <octnzulvdzokmojzeay2zywjaagity3sbsnry243ze3cwnbfx4@wxkgvlptg3el>
 <l7xh5er7uzfnkto2izx2j4ftvbzv5tutolqkms3dddo6tubpwv@j37n3pkkxudn>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <l7xh5er7uzfnkto2izx2j4ftvbzv5tutolqkms3dddo6tubpwv@j37n3pkkxudn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH8PR11MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f3eac1-1aac-4f9f-b66a-08dd6cb1f3c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXJwSmxsRUpaZkpCcmJrd0JBa1BGOXZYcU5IOXVZK3k4Y2J0dkw4RzFjanRr?=
 =?utf-8?B?MnQ5T1M2b0pHWUxXaEFLTmQ4aGllaWpmU2FQdExqcEZPM3dvRE9ITUl6OVgx?=
 =?utf-8?B?N2FpNStpcTBrUDhBZjVDTWVlMjBxcE1CL252VGhaQXBCUnM3NFNTd24yWFJm?=
 =?utf-8?B?eTNUVlZmVGpnZlg5cEw3RGRiZUN1b00zdkhSYmVxT0xka1F1TU94SC9nSmZo?=
 =?utf-8?B?VFoyMDBDM2J4djQwQ09JbUdHcStEcEdQc3ZlZjcrWkxjVU52cXF1Y2c3WG1o?=
 =?utf-8?B?VURocktRdDJzckF1RzVieUtWaXZuM2s5WmlXWjJORmQ4NjFZYlh1Yzc4TWI3?=
 =?utf-8?B?Yytwb0J0d1FGY3JXYkpMdVNRYjlYSENURkROMmx0OG56WEtCUXpmNk5MUTQ4?=
 =?utf-8?B?VDJzTU9JNkJpQjhFdnV6OXdMcnJmUXJuSXdVRGlicmw4QkcvTmxWUXY0WXFx?=
 =?utf-8?B?U1ZocUZoaUNZVzlSOS9lTTNaeGd6YjZyM3ZaaEIwd0FIN3ZFaVNPd2greGYz?=
 =?utf-8?B?aE9sMkFNQm0rMnU2R0lVMkpzTjBjcW50QWFPalRUUkw0QUNuSCtjT01reW9j?=
 =?utf-8?B?QVhLMzRCcGpIRTlBbTdLenhOWmZHb1VEWkk5by9IWVJYS2VKQVgvbFRqRjNq?=
 =?utf-8?B?QkJlTlJSckJqNVNGMldHVWlIV3NUMWFEb3BsR0VzeE4zc2VJVW5SQUNYTDFI?=
 =?utf-8?B?VUd2RDRWcW5tejNUT1djY0pjUHZ0WTFXdGVSUUxNVE1NUlNXK3AzMWM3alUy?=
 =?utf-8?B?eDlwU1hNdGNpZ0Z3SDJjMHgrblpkM25tSVZta2VqbHhkTnpCa2FBdy93Rm5H?=
 =?utf-8?B?VnlBZGxZb2JBY2JvZ09IYWFiSFBPVmtTb1F0cEFTVmNCK216WXRFc2NORlhK?=
 =?utf-8?B?M3M3bG1XVHIzZDl0bldoelIyWDZvY0sybStOOVJjRU5CUzlqbzBOcTAyY1lN?=
 =?utf-8?B?MGYvUFQ2MzZGa3htcUZhMXpRdytGc0xhbDMzdE1OQitsSkVrSENSYW5Tb1U2?=
 =?utf-8?B?dlNZeFVDQTlJMkE5dVRSZk0ycXlUejRoWkdvZllzTnhYdVFXZmhpOVdYenpJ?=
 =?utf-8?B?QmhLbzgxa3hTWVo1N3hFcDdtSmdXK0RNOTlKcEJMYnlCeHJtUWczV1pHSURH?=
 =?utf-8?B?S2I0TElDc0RxMko3dVVLbDk0WnI2dXpnR2R5MEFrMGRTVlgvNFVxVVhQMFRq?=
 =?utf-8?B?TGZvTWQ2WUREMmQ3QmxxOENoRmpkZnFnM2l3U21rSlB0YkVGUmFBQmpRTnV2?=
 =?utf-8?B?VWlrT0cySjZMTnJ2VjIrOWNwOUdKdW5sZWJYUGVyZTQzenZRODVVYUptdFlq?=
 =?utf-8?B?ZTVPelpuYjB0cEF2VUxOWE1sQTZHQWZPdThLcjRmZXU4ZVNDZlhWTnhYdjRL?=
 =?utf-8?B?T2poT0RCTzV4SVZzWDlISklFM2tVbXY4eXdmdm5qUHNjVE9FR2IwSm9UT2I4?=
 =?utf-8?B?SGdPT1NxSGllZzZaKzhrd2cxWnhLZkgwR0pYWE43SE1ETW0vZ3FuYnQ5ZmZz?=
 =?utf-8?B?Q0Y0Nm9YUEhWNXdMd0NhMjZHWXQwa2xjTmNnQ254OTFrOGxTYUlkdlNzMkRj?=
 =?utf-8?B?dTlIQ25pOFBINWtzWGxhQ1lqSnpFSytwYWxJSE92MXZqdDZ4akZJMHVvck4x?=
 =?utf-8?B?WEJUWVZiNWRJOTNSQUpiMHdkZEYyT3ZpY1l2b2p1VUwxSjk0TDd5UnBCVFdI?=
 =?utf-8?B?a0k4ZDBVbHhnL3ZDaXdJWGRrVGhXcCtHT05sdlhtalVZeHpwdE01dDN5MlhC?=
 =?utf-8?B?TVFqL3B5RDVlSkFpWHJTU015SEFkNXAyOUpSWUk0ODB3TXRUMWV2MUJ6aERT?=
 =?utf-8?B?N0V6T2M5VnFDbk1Wb2xqQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlR5N2UzTEc1Q2E4ODYwWTNJY1gxL2wrOU9tTGNQVS8yL20vc3p4S1hvbDNU?=
 =?utf-8?B?RFdva3pxdFFCZGtha3Y4MXQ3YW9oek9CZEo4RnJoUkpEbVdrbWVRS2ZtbHhy?=
 =?utf-8?B?a1ZWdmVjWGdRSmZPUjRleGUvOEJRNm1jdXlicHFEdnBCTHdmaGpsOEhtNHFl?=
 =?utf-8?B?QnJ5WFlSUWhYS3htMGdQNWdSWTZFK2pZaXc4b1VVOGFFZ05vUTZhdEJJVXM5?=
 =?utf-8?B?OVptTGw4eXl3YjdMK0Jrd3ZBUDJ1K2l4dkFZVDd1L3VyR1RONEl5NUcwUTlP?=
 =?utf-8?B?djRaRWVyQ3VObmhsVmNaNXRHMGdIYllRbDRTcTNBOHlwOVlOZ09Pby9McnJa?=
 =?utf-8?B?V29FcUgrTHZOaWF2dllVc1RORDNlTnRMM1hwTWdiUmJCbm8yVC8rSDJjM1R6?=
 =?utf-8?B?Y29OUDkxUGtpaGxUVnhwS1F2ckI5WERUZWxXcHBBc1VOc0dEOEQweWUxQkpE?=
 =?utf-8?B?QlhvelFoN1FBUTdIU3lZNy82bm5ieSs5WVVZNGM4TytRNW1pZjRjSXJaWEYx?=
 =?utf-8?B?aWJocEdWWHM3NzF0RHhVb2JHWGNscS9Wejgzd0kzclcxb2FkazMwZUswaUd4?=
 =?utf-8?B?NC9MQXBoUlBqYTA1aUljaGNpTDVjZ0tFTXdCZVFpZTFjVUhUYW9wWUN2RENl?=
 =?utf-8?B?RWM5Si9lSXFZRWNXU1VEb2wzVkxac2xLNWNjakRKTkxvTHhCUEpHNHFOcnUv?=
 =?utf-8?B?QUtYSmZPOGdYdEF3bEY5d2kwR1VsdHlycXlsMkZVTktSNndMVkl0Yk85SHdo?=
 =?utf-8?B?bEVLZmZPTm81d2VpQWdVOWt1bG5kT0d3Y0p6c1VJZC84eHhheFplUk1rR2Nv?=
 =?utf-8?B?c0hPTlZVYlVsamFKYXk2NlE2RnUxQzRpREEyVzUvc2J6Y1djUnhlTWlGM2pH?=
 =?utf-8?B?WHMrbW9uSjBLdDM2eFc1di9qVGx0bEJJZjhmOHJqbjRXbUdGRjRROVJUWWRv?=
 =?utf-8?B?WmNpWU9Na09wTmpLVnYzUEJrcWFmUG9ndmRVdVdUMVQybUtuSGJ0NHFHamV5?=
 =?utf-8?B?dFJnQmRLbmlxSWF6UmJCVXBrSk9RU1VtSUhKRFFGL0Z0WXMySDNGY1ExMDNo?=
 =?utf-8?B?eWZwbzlHWjYwZG1FQWVlcjExek95YzBiOHRXUkJuK29KOXVKVUp2OTYva25x?=
 =?utf-8?B?Z3ZPUCtPN251RUhkQnk3VWp1TnlUVXBQZXBpbWZKTlpoemdGRjRmVnptR1NE?=
 =?utf-8?B?Y3F2QWhvbkRXMzgyNzZEWTFsSmRMRkhEZlU4S3U0K0ozb3ZVT3VzYi9ibmFw?=
 =?utf-8?B?aW40TFFvUGY1UFh4UmhGa08vWHdJNmM1WFdtOWtqV2hJd3cyKzVtQitJQWQ0?=
 =?utf-8?B?YzR6YkJEaWtCWWhuOU52S3ZYWXFuUG5sYXIrQVhobEJWM2JTOExLNlo0czU5?=
 =?utf-8?B?UndTWTRwaUF1RzlMYlRwQ0tubU9Cd25FbWxaNHNCOVpTZ2hXTVZiamRmVC9n?=
 =?utf-8?B?bG5hN1A2NmtlckxJWnllbUM0akROeHllZTZMK3cxb1JnQTFJZ3MrUys3dGJl?=
 =?utf-8?B?YW5lQVIxa1NxK1FtZStLSFV3ZWdVY1JyL3NFamhFcC9XaDViTzBZWkJRQ0tI?=
 =?utf-8?B?N3pndkVZbVlLTkJabmU3RUNZQnFzSWllaDlwRUFvUm9BU0c3MHZaaVAwS1lY?=
 =?utf-8?B?SGhTTjJlenFUT0ozSlJYVUJ3SHovekhyVHpxbFFMYVZKQlJlL0VNNE1lZ24z?=
 =?utf-8?B?ZTRCejZxYTBuZUJuNmd5YUhwU3htODhocTJSdW1Ma1VRKy9zeGZoZUJlb3Bu?=
 =?utf-8?B?cVB6cU1Ra1JRTWNPMjR2aEVSSG1LZlp0MDdZUjdoWGxlVDQ1eVBXcjRtZGVD?=
 =?utf-8?B?MXB6Q3FvYm4yOC9NS01pdmt4TmU4TXlHVFRLekRUMjU2dC9HNzNlSTdaNloz?=
 =?utf-8?B?L2xoRkN1cnpHNVJ1cEQ1dmQ0dmxPeEw4bjJKb05CT2dQRnBjRm9ITUVpR2tv?=
 =?utf-8?B?Nm9vN2tyS0NFeUJRa3FTNGlHbVk3bDZiS1RJTmVNd3Y2WEwzN3JMM05sK2dz?=
 =?utf-8?B?QkRuNTQwOEZoOXNoVWtuZzd6b3VCRTV5dEZOdjlyeXJpcXhqWEd4T0xDUnk2?=
 =?utf-8?B?U3pET1U1dHVsZzg2dElVQ1lzU0JocGpjS1VGcG1pRDdyWXdIZm95S1FCaG5K?=
 =?utf-8?B?T0FIcWxkaVZ0dkQ3cXFNUkhxbzJCOVlYTWQzdHU2Ky9pbXY1bVFuaE5wVHpw?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f3eac1-1aac-4f9f-b66a-08dd6cb1f3c6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 22:02:51.3769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpXE6MQ9ienXTDoD+byV3AONLf6Rn6Nn7BeQyOcaMpzBrZ5SpoDyr5bogmZG6zsY8XN8LplCIyeOkW7hBlJEsextJ0vYmPm+g+riFMeDrqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
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


On 3/25/2025 9:14 PM, Lucas De Marchi wrote:
> On Tue, Mar 25, 2025 at 11:09:55PM -0500, Lucas De Marchi wrote:
>> On Tue, Mar 25, 2025 at 03:45:06PM -0700, Ashutosh Dixit wrote:
>>> On Tue, 25 Mar 2025 15:01:47 -0700, Belgaumkar, Vinay wrote:
>>>>
>>>>
>>>> On 3/25/2025 2:53 PM, Dixit, Ashutosh wrote:
>>>>> On Tue, 25 Mar 2025 13:33:43 -0700, Belgaumkar, Vinay wrote:
>>>>>> On 3/25/2025 10:15 AM, Dixit, Ashutosh wrote:
>>>>>>> On Mon, 24 Mar 2025 19:37:32 -0700, Belgaumkar, Vinay wrote:
>>>>>>> Hi Vinay,
>>>>>>>
>>>>>>>> On 3/24/2025 5:18 PM, Dixit, Ashutosh wrote:
>>>>>>>>> On Mon, 24 Mar 2025 16:24:02 -0700, Vinay Belgaumkar wrote:
>>>>>>>>>> @@ -266,11 +274,24 @@ static u64 __xe_pmu_event_read(struct 
>>>>>>>>>> perf_event *event)
>>>>>>>>>>     case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>>>>>>>>     case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>>>>>>>>         return read_engine_events(gt, event);
>>>>>>>>>> +    case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>>>>>>>>>> +        return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>>>>>>>>>> +    case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>>>>>>>>>> +        if (!xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, 
>>>>>>>>>> &cur_gt_freq))
>>>>>>>>> This is unconditionally taking the forcewake and waking the 
>>>>>>>>> card up just to
>>>>>>>>> get the sample. Do we really want to do that?
>>>>>>>>>
>>>>>>>>> So if we don't do that, both the actual and requested freq 
>>>>>>>>> will be 0 if gt
>>>>>>>>> is in C6.
>>>>>>>> For actual frequency, the register(0xc60) does not belong to 
>>>>>>>> any fw domain -
>>>>>>>>
>>>>>>>> GEN_FW_RANGE(0xc00, 0xfff, 0),
>>>>>>>>
>>>>>>>> HW will report 0 when GT is in C6.
>>>>>>> Yes, no issue about act_freq, see commit 22009b6dad66. I was 
>>>>>>> referring only
>>>>>>> to requested freq.
>>>>>>>
>>>>>>>> The requested freq register is a
>>>>>>>> shadowed register (0xa008), so that will not accrue fwake either.
>>>>>>>>
>>>>>>>> static const struct i915_range mtl_shadowed_regs[] = {
>>>>>>>>           { .start =   0x2030, .end =   0x2030 },
>>>>>>>>           { .start =   0x2510, .end =   0x2550 },
>>>>>>>>           { .start =   0xA008, .end =   0xA00C },
>>>>>>> So this still doesn't make sense because:
>>>>>>>
>>>>>>>     1. The fact is that xe_guc_pc_get_cur_freq() *is* taking 
>>>>>>> forcewake
>>>>>>>     2. And that is in accord with the following comment in 
>>>>>>> i915/intel_uncore.c
>>>>>>>
>>>>>>>        * Shadowing only applies to writes; forcewake
>>>>>>>        * must still be acquired when reading from registers in 
>>>>>>> these ranges.
>>>>>>>
>>>>>>> Also see intel_rps_read_punit_req() which is called from i915 PMU
>>>>>>> (frequency_sample()) and uses with_intel_runtime_pm_if_in_use(), 
>>>>>>> so we'd
>>>>>>> need to do use the equivalent in xe.
>>>>>> Hi Ashutosh,
>>>>>>
>>>>>>    As part of a previous decision, in the Xe PMU implementation, 
>>>>>> we are
>>>>>> doing a runtime_get() during pmu_init for all PMU sessions. So, 
>>>>>> device is
>>>>>> going to be awake anyways. In this case, it does not make sense 
>>>>>> to just
>>>>>> read the register without a fwake.
>>>>>
>>>>> Even if that is ok... Let us take a completely idle device. What 
>>>>> should the
>>>>> actual and requested freq's be for this case? Both should be zero, 
>>>>> correct?
>>>>> Now, what are we going to show if we are taking fwake? At least the
>>>>> requested freq will be non-zero? Is that ok? Or the requested freq 
>>>>> will
>>>>> show zero even if we take fwake? Thanks.
>>>>
>>>> If we take fwake before reading, requested frequency will not be 
>>>> zero even
>>>> if GT is idle. HW always retains the last requested frequency in that
>>>> register, never zeroes it like it does for actual_freq. So, showing 
>>>> the
>>>> non-zero value is the correct thing to do instead of artifically 
>>>> zeroing
>>>> it.
>>>
>>> So now, this I disagree with. For an idle device, hopefully in C6, 
>>> there
>>> should be no reason to request a non-zero freq. So the requested freq
>>> should show 0. As i915 does (using gt parked and unparked states and 
>>> using
>>> with_intel_runtime_pm_if_in_use()).
>>
>> wrt locking and interaction with runtime_pm and forcewake, the perf
>> implementation in i915 is completely broken. You can't take a runtime_pm
>> or forcewake when you are in an atomic context. And when you have a
>> raw_spin_lock taken like is the case with perf, you can't even look at
>> it (if it involves taking a spin_lock, which it does).
>>
>> perf is holding a raw_spin_lock at that time. The only reason why the
>> CI isn't on fire over there is because we are papering it over with this
>> commit in topic/core-for-CI:
>>
>> dc17a830ffb5 ("Revert "lockdep: Enable PROVE_RAW_LOCK_NESTING with 
>> PROVE_LOCKING."")
>>
>>>
>>> If we are already "doing a runtime_get() during pmu_init" (as mentioned
>>> above) we need to devise some other way of making this happen (maybe by
>>> looking at xe_force_wake_domain ref field?).
>>
>> you can't do that safely.
>
> which reminds me... Vinay can you test this patch directly on
> drm-xe-next? By code inspection it seems we are doing:
>
> __xe_pmu_event_read()
>   xe_guc_pc_get_cur_freq()
>     xe_force_wake_get()
>       spin_lock_irqsave(&fw->lock, flags);
>
> and that spin_lock can't be called at this point.

Hi Lucas,

Tried it on drm-xe-next, not seeing any deadlocks/warnings. Is that 
because CONFIG_PREEMPT is not set? Doesn't look like upstream config has 
it set either - 
https://gitlab.freedesktop.org/drm/xe/ci/-/blob/main/kernel/kconfig?ref_type=heads

Thanks,

Vinay.

>
> Lucas De Marchi
>
>>
>> Lucas De Marchi
>>
>>>
>>> Let us wait for a second opinion on this. Thanks.
