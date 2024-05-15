Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2181C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 21:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610E510E1D6;
	Wed, 15 May 2024 21:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSQN0RDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D89610E1D6
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 21:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715809205; x=1747345205;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gPteQ39Ed1oPTjQFUhY5EthwhpQV2hEmbXW7AanJvHE=;
 b=WSQN0RDsCi47EBRlQZdpVZt9aud2aL3T2QZdw+dS3CZswwB/kA8zGmoc
 Oqti/0OFIKrrSDWEC9X2WgSHhHUUc6g5ytEOIiKuY4B4k/ObK3lI26RW5
 oZZQ6hkgm4wKbWprxFE2Y98HI8GVEEKirLmsA4Yfuw0pWWfV4L39mmNB1
 13Q+uTuqUzc2Q6jRyY61hrQB2F6tnaF+Vcvd5BOEvxCR71T8iEfSnLBCM
 wY52ybbWqPox+lHqXBWX+u2+blpaZ/6v0ovylT43JtMWc3gQnXRzmjAK2
 KgrVdTYWV5CldOm7Q29sbkSPJ0uXa0Yq6zoAROq6YUpjs1PyiN+UOTZg/ A==;
X-CSE-ConnectionGUID: pD9qnYEMRya/dDfgnFPNpw==
X-CSE-MsgGUID: K/QeXstSS3S1q30VYPDM3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="34399181"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="34399181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:40:04 -0700
X-CSE-ConnectionGUID: WL1EKlvgSQOsVWqFHiLPYA==
X-CSE-MsgGUID: aDKcE6bLSqWON5lZekyVuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="36075813"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 14:40:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 14:40:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 14:40:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 14:40:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 14:40:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3attacQ+39ncHEwSgmaa35kyaaFnWHnNlkmW9ImJLjeYhsxBExcmxvHb8H4qwuhD1U2a18c9cgoEwyRrLczv8VMjxpytpQcEU2urPLFkfM/K0rGEx7d8AC4KUCfSmFfzkFJ7gJZ+PJ7QZOrRKjFrZwWQ2aACO2n3ZJrymBYC1gznsapuETqDhO0xeNs3g8AP4Z/5A2TmE9DvkNHsqyd3Vo1L9Vb27GXpoAkDVmfVWxvlj26yUNe05kfxRL3zFLcdfCgHqVDZPwLT3CZ8JSUg2V3cRKP9We8mzWpBTaLaVpzHJZzFS78FPJHxnOjEX0zzz/LCRLs7obDgpjQyPG5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yd+E0E3eWUWJAXXH8NpYEO09Qf6q7PV9EtvQ3GxLj3o=;
 b=izb/zCviZCD0E7rd4JGX7cQrYFouOsCEe5grmtugH9VTzJTcT1g5JhhvfgzdXCrvIn1dlcFgAvrf2Jbzf2v9bMlW+NnZIdZ7L9srm57W8YiqHvlQ8LUZE6Ubpo23QGOCPNW6tXs8m5sAS6gXG8MunFaV8q0wGemL5NI5dABOTA4rQln0/y3n9n8uQo1jLLAyPAYwod7R308e17x7ciT7T7mn192B/Gycm3pQULnuHn9dT4Kkzh1eYIVHgzo56h9lslHg5p+Z7jturw7MLdFWNVy90gxjiWBpQRMtLK8iwxtrp5QNfXEiXj+tu6yz3bWaS2DNObm5nCm2rbLtv+zyeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN2PR11MB4648.namprd11.prod.outlook.com (2603:10b6:208:26f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 21:40:02 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694%4]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 21:40:02 +0000
Message-ID: <596513e0-8479-4666-9313-f8d78dc46fa5@intel.com>
Date: Wed, 15 May 2024 17:39:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] drm/xe/guc: Add capture size check in GuC log
 buffer
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
 <20240507014736.1057093-4-zhanjun.dong@intel.com>
 <1e1e4d700e6b3cb3f96871c529d1d94413cae468.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <1e1e4d700e6b3cb3f96871c529d1d94413cae468.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::33) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MN2PR11MB4648:EE_
X-MS-Office365-Filtering-Correlation-Id: da4d2af0-94f3-4753-9a51-08dc752793b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTV1QUkraTNMUldic1BXNVdyV3g0ZmM3T3JWYlEwekNXREtaelVRT0Myb1Qw?=
 =?utf-8?B?NFc3ZHVxZDBtYlBpcUFxQmZ2TGRncDJVZ0EvT0VjdTNrbjdiNHJrTkpHaGtE?=
 =?utf-8?B?azArWFEwWDNTVlJadFFYYjlrNWNwWTJJektFcEN4c1Z2OWtyQUd6Wk9XOXA5?=
 =?utf-8?B?K0Vib05yeThaaEV5RnlPKzZNR1pzNXl1Zml4L1V3SGt0UVRwRyt0MTdIQXZt?=
 =?utf-8?B?dlRlOVdOTHZsa3Q1NnFVVXdWdThERFNnV1RKZGg0RzVTbmZuWnB5WkRiRnha?=
 =?utf-8?B?VEMyR0dOb09mNG43QWdIbjRzMk90MjNEOW81aGphVzhoaWIvWmFVNzh3SWVt?=
 =?utf-8?B?MmhRWnVEcFhEQmpTY1BQTzN0WWU5QnU4alNkYWloeTF4bWxPZER5TER6dHMx?=
 =?utf-8?B?SGswa25vM3ZuTkIwYlBZSHF5dWdCVUM2ZXlzT1BjMGhIbWtpbUc3Y1NHWXJP?=
 =?utf-8?B?TWY0MXBkOG5JUzc4b1dZQWZDWE9CK1dJZklNWnVpcXUwdmhyaWZjWnlGeUZh?=
 =?utf-8?B?UExLSTdYOEp4STRPYlRYb1RORi96OFkwNUk1dHA1SkkrOUxkNDJYUllObGgx?=
 =?utf-8?B?M3NIVnNyTDlqMnk3V2V2Z3pOSEw1VmQvSVd0RnlzN0hKRy9QZGpHREhmeXJt?=
 =?utf-8?B?MWVQbjdFNkVrQm1MeFFlMFBYNU9FdTZGWUZPMWpQOEZ1ZnBkSG0vTjRDTXUz?=
 =?utf-8?B?dkdpUW9JOGVhcjNncWszSndPT0RDTXp1SXBpeUNabUNiOXFuN2lyWkdFRGNZ?=
 =?utf-8?B?bTg2UVBjME9SNUVDMnYyWmZRUDZLZUplWW5ubWY4NVV0QSt2aUc0UHRuVjNq?=
 =?utf-8?B?T1dVNDI3Y2ZOYUVkb2paVVBOV0NpSjY1a2E5ZG0vUmMyT2w2a2F6TC8rcU9Z?=
 =?utf-8?B?dzJNd0NjT25GZEh6elBDUVNHYjF1VjdjckNMa1JzZU1CemxEczdqUmRoR053?=
 =?utf-8?B?WGVxZzJrMGd0ZGVDUFlaejVtbmRheUM0djJFdzlkUW9yZm8zck4yaW5qY2Zu?=
 =?utf-8?B?RGl0SUtuVWUvN21vUElBTDhWR2RQbkc1YlpTVTVJSjZWUXpSa0FKWG5UT29a?=
 =?utf-8?B?VjhvQW1OYVRZWUdxdzdjZnNXUlRiT3NFMWdxZitrc2I1MlJIU3VvVk0yTlhU?=
 =?utf-8?B?YUNsbEpWNUhKUFhqMm1tN09sY0NTSEcySFpaQTkzV1lIbENFa2o1VzArQ1Va?=
 =?utf-8?B?ajVyR2cxOG9DQVVadmg0WEgyeTZ3c3pjd2oxMHJTa0dUN0Vnd1k4RW9PcGxG?=
 =?utf-8?B?Yy9BdkpVWnp3OURMWitzYXFJM1puamM1M1UzbUdlR09MOHh2YmlkVkVXdTVQ?=
 =?utf-8?B?SFc5ejk2QVNiclRRSUpCMUJkL0RIOHRVMVJTUFRkTkhKNklpSldvR3dDSVh5?=
 =?utf-8?B?NHhwVFhBek1MT2IwNTdYYWluWmVNWlE3VDRCa0U5SlhHd1NoWW1XeHZxaGlu?=
 =?utf-8?B?N3dlT2F6WXpZVzJpcDZYNGdmTmwzcXprSXlLb2dEVmtsQnZ0c2lzZVVqcHgx?=
 =?utf-8?B?SHNMMmFEcUxHeUUwQVNTRHN3RnF0Ti9mS2RIb2FEdUZWUVJRNjB4ZkcxTTBv?=
 =?utf-8?B?cjBsTW5Kb0YzRnJBaHlUYWdtNjJFdFNhcGhncU40Sitnb2JsN25HUmQyamhr?=
 =?utf-8?B?RHg0UTRzaVgxTnpnYmRPNkVJUE9CSUtmU1R0SVBIaE1aZnF0aFdTVjFtRXZ5?=
 =?utf-8?B?MWhLZUVIOHlGWVQ0b2ZPYzhHQ3VUenVzcVpBaVgxMmpwRlZmVlFiRFFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXJKK3BBWStmRjRUeGZ6QnpNU1U1K2w1N0lTRWZtckt5RHhKR1oyYmIrRjdP?=
 =?utf-8?B?SUVrVUU1czg2SHJtSlFGN0F4WFlBMFZhNXZFLzhRSjRjdUFnb2NJNHRBdTRW?=
 =?utf-8?B?RDNhMk1MVWswY1JyWmhhLy96K1VhWU9paGZvYWhNbjcxaCs3b3hvYnF4cTlM?=
 =?utf-8?B?TE1FVXUxSTIvT1BrNkU2OTh3WUU2RG5HUTc2bld0Q3U1VnlVSzBGdytzb25u?=
 =?utf-8?B?YXRqWnFiTWIxUUNESmhYY0ZWdEo3NW5IZEFEbjdGNnVIUTErN1JCRWVoR21v?=
 =?utf-8?B?bEtEQ0tMQnc4TWxZNWF3R1FsYkFyR1Z1Uk5ER3plV3hYTkFWTlhHT09uRnRl?=
 =?utf-8?B?Vnc1c05jQmhlMTQrQU5oQitzQTFRa3kxcDFHNm1vYlIzNDdLOWVML1lhdi9P?=
 =?utf-8?B?VElnR2NTOGJjTXJ6UXh6eC9MTmVuU21xQzJlUlM3UVFsdnRnSjZBa0FXRWpV?=
 =?utf-8?B?a3FsbzJVSUVqczVsNnpWb080QVY1QjFBRXJ3MU42R05sMk54T01nYnhTbm84?=
 =?utf-8?B?cjRZNUdSREpXbDBaZUh5Y29RNHdmS3NDQWNrRmdIdkNQaXlXMjIwWEh4ZkdO?=
 =?utf-8?B?ZTZqbkkwU21SSHVGaEFtMWFuRkZoOUxuaXd2aTAzYzc1SUgzdDZmekF1aC9t?=
 =?utf-8?B?NDBGREIrMG9SbkppaFNka1NpQWNsOWNWdVgraWVKaW5WOGRTeWNKWXVtZ2Yy?=
 =?utf-8?B?YjZFa25kMWZBY1Y5L1oxL1gyL3AxSWdPTUJ6WDJuL2VHOVdEQzlaZDMycmJS?=
 =?utf-8?B?eEkwc2s0VDd0aU1CR01JZU12WGtWaTBkSTJRVVdCTE51NmE4MW54WCtKZHJk?=
 =?utf-8?B?ZFpoSHB6OHUzb054SDFJWDY4ZGwzM1pmYUdtNEJCNWNDQWJ5bjRrblF4aE1X?=
 =?utf-8?B?NXUyaFp3bGpCWkdDL0g5ZmN0c1pQMHhpenN2bUk3TktSQ21qMTZ0clg1YW9R?=
 =?utf-8?B?UTI2VlU3RnNqY0RxVEZSd3lnWFpwL3YrbEZENEIyOEpHWGhScUF2VWQrODV6?=
 =?utf-8?B?QzVER2FlbVRralBGdUh0V2tMUzRURnpNRnU5bm9UYmFOMEVMQU1wUXcvU0s5?=
 =?utf-8?B?Q3ZRbHlKdURmVjY4dHFiaER1Q2l2R2RGWW1LNTdXUEdxY0pXVGZ0N3ZBbHZY?=
 =?utf-8?B?bDdaekhJV3M4enBIOEtCKytidXZLS3FCMW03NFpZRjJkK0t0cjkrWUR1NWN2?=
 =?utf-8?B?NW4vYnJZN2ltMGpKNi9rZWVuRHNFWlhYcGprZEx0TWhQWmFNK0RMcjF5Nys0?=
 =?utf-8?B?U2JoZnNNMzd0WnVMY2U2RS91djlodWlBamxCRFlwaEVxSTViSm9wSHZZVGpF?=
 =?utf-8?B?Wmd1cmpRRjRtdkp0N1pGcldUcFpmYmx4L3B5MGlHVTY4b1hhQVZXL0FsbVdX?=
 =?utf-8?B?alRiNzZIQnpXQlFsc0RrWGUyNHhHOTBBTXpkcXdTclZncVVPQUVOdWhnVUFn?=
 =?utf-8?B?T04wQ0ZoL1A4bVFXdVJ1bHJFUWZSVlQ5WkRkVE0rRnhCVEJyT3hDZ3FrTWNV?=
 =?utf-8?B?cm1KZmgxTjFoVDUvSWxBZ2Vxc1ZGNlF4UUJZcHkwN1V4Y1V1bkE5ZVcwODRh?=
 =?utf-8?B?OHdJM2Iwd1RHc01RLzVScUw2SE5EMnMvcGwvWFBSWDVKS1IrcEJ6dnBpcm5L?=
 =?utf-8?B?ZWpLRWM1U29XQ3M4WUtFV3pSRlBvWnlmLzhDSVd1NWNjUkJPN1Q0QUdYR09R?=
 =?utf-8?B?aHRVRHpKZ0lReVByNndPSHRJQ1RHaWxnOHVwNFo4L2h2YXBKemVNbURxelVX?=
 =?utf-8?B?R0FlcHlBQlZEUHIrTDVSWGtNRW1OZ0MxaDJHMkg1N0FKUXJLRWI1VzU1TExx?=
 =?utf-8?B?ZkRUdE9Zais2ajJ6bGZiYTdGalJrdjBNcW90a05xMTh1QVVDYkFwUDJZNVho?=
 =?utf-8?B?RU1uaER2ZE00QTlJbnVaRmpCTjdBY3lOczljb1l3dVdGdUtkVVp1VHYvZE1z?=
 =?utf-8?B?OEZQNmVUNjVXOGVGU1M1WVpINk02YXI5ZCtQWStBUFFrUGsxRlFlbUwxeHdR?=
 =?utf-8?B?MWVSZkxIN21SWHNScTc0MGMvR3Q3djlDUWh0eW5PSjJoZktzM3g0eTEzMnU1?=
 =?utf-8?B?ZFZyNXdLVjAyZ3NEb051UFRyMTcybWZtMmdEZVRQT2c4Umo4T3ZtbnN5eWhl?=
 =?utf-8?B?WDBDblNCczFjcUpOM1dGZFl4dFZUK0NybDFVMEwxT0wxNTBMZjlyZFcrVlhO?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da4d2af0-94f3-4753-9a51-08dc752793b4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 21:40:02.3890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9xM3mHQSV2Es/Ew0RgWtxzYgSco7g1RMiP+3Ya7vGMSg+6jdDbTi0UyKlcH7UOeVvYZVkrsdndBOfSN5vG4yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4648
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



On 2024-05-08 6:57 p.m., Teres Alexis, Alan Previn wrote:
> On Mon, 2024-05-06 at 18:47 -0700, Zhanjun Dong wrote:
>> The capture-nodes is included in GuC log buffer, add the size check
>> for capture region in the whole GuC log buffer.
>> Check the worst size of register capture aginst error capture region
>> size.
>>
> alan:snip
> 
>> +
>> +#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE      CRASH_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE      DEBUG_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE    CAPTURE_BUFFER_SIZE
>> +
> 
> nit: actually not sure why we need the define on the left, since the
> usage could just use the ones its sourced from on the right.
> 
> alan: as per offline conversation, we beilieve the default size needs t
> to larger to accomodate back to back worst case capture sizes.
> So as per offline, we need to increase that to at least 32K? (or 128K
> with spare)

CAPTURE_BUFFER_SIZE will be set to 1M, which is equal to the i915 setting.

Regards,
Zhanjun
