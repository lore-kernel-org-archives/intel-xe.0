Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E59C5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 18:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F0010EC39;
	Tue, 18 Aug 2026 18:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kexlcwpj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE65B10EC39
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 18:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787078718; x=1818614718;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Wic/O9h6ab7V4+UNMB5u9XwImKZ2XFLyL8qTAMgAVE=;
 b=KexlcwpjodBVFpO60Fw6LfmlB+GgbtOAuaE51sJ5L/6yKmKdj52fscN5
 u/SgYRxkYEPz3VZ4xst4mwL8AOR3RJcxAEMNgJpcCM3/RnLQw2C6UEH1K
 iXLOpYXNbIKGFRlWz39eiLxGFGVV7gaYKheZNrQcgGGaB8fTlMug4nLOU
 Lz8nfokRi8GVfZ9H35P9Gz9FwCsp1Jh4ASlbneNuXWMNvqMygjJBlkFO4
 odYZWSQqC/DFCV+0GtnoIYatL4aKfqhzGGubCQBoAkPBH1/3csxrFOGJZ
 +QE9LXAxYiLbzPt9+CUU2BafFM+A+ZCmffCdR2T1iqFwjtd9G8jbyNeiM Q==;
X-CSE-ConnectionGUID: 28kB1vTtSbqs7UZ13BilRA==
X-CSE-MsgGUID: UIuwk7ToSyW3kkCJsxacbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98942713"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98942713"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:45:18 -0700
X-CSE-ConnectionGUID: qF0s6tNtTlmds+tvgTQ8aA==
X-CSE-MsgGUID: mXci0mqISbeMvbQW6jPd6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="267281610"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:45:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:45:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 11:45:16 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:45:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+Fwz0sqir9dlUvWiKGX0A1+D0Ym7DUNOf8aMFCgo1ufEke7j03OOpYGXn9ltQtNJXznPnZoJDD93AdVTpsqJkhrdkn6S7HaxsaQsTlsUngpYHY/lwfHfcIg3fN4AO8mbGb9A8b69Pb19exSS2FL3A4XVnwOzKEpaLxOhYYC/4iBUqSld5bySTgm4Vt0GUxcgX8TSa3V2lt/r/mzyvntm0vKx/jIiRBmSi69F1ozbWA4eveNqm/appb0qV5Ey3x6UkqCbl198qKr7czgTvmd2YmZBvd1w1qSiESddaSXU2/ylm8mQdaX98bkQb61v+e4f2Bv9jnfff0nvbZGyoiXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hhzEpnz/OeQLN3qxkpkqTBU8RKTFT/fpHIyhMKfVrw=;
 b=Kudo/om7f/j7kRyyULRW0iFfiXTl3kEsusCIktYUJBm5plxATsodH6Hyq1CWWFg4b/pokDyG0PdT65cDLe3OFk6/tOi9kNK83rFtzBaKTGVDufmtfS13bQ0K13PbRW9EIrqRI0+/tHXF24XZtRG1N2+7LJQ5Vd6VmRbKWsjDj4Mssh675fjNXGYH7L/8K2lWP4Dtla073UAb0gbzY/i/hU3aiqcQB8HAAjhHen3dcjktLj3H/2iPE8eFUO6p6D2yuHrcHbxOkme8yEFNSCqdVcn0mw8R4njx35Ukoc+5zTT8w1+tPyun6g8KP42yeKk15XgEo5enYAWkONHvnrLt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 18:45:12 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%6]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 18:45:12 +0000
Message-ID: <890923d9-f26f-41dd-9f5e-ca0e5716c533@intel.com>
Date: Wed, 19 Aug 2026 00:15:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, "Luse, Paul E" <paul.e.luse@intel.com>, "V,
 Mohamed Mansoor" <mohamed.mansoor.v@intel.com>, "Nasim, Kam"
 <kam.nasim@intel.com>
References: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
 <20260807145621.2938848-10-anoop.c.vijay@intel.com>
 <BN9PR11MB5242AF76995E0453ABF7878A95D12@BN9PR11MB5242.namprd11.prod.outlook.com>
 <anYovbHoP7LbRIuw@intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <anYovbHoP7LbRIuw@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0176.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::17) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aabec5d-5b0f-4052-2bc4-08defd58d61a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|3023799007|56012099006|10067099003|4143699003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UhuWYYbCwI+vFJ+WGse/grX9aDTUsWBJtQczZXH1UWlQt2Vm9rHr0ADXHLhCVmpEDsrM4v2psVlYa5WwuAqRKiRUKndB6ZOfm+Vah6m6QpKIhDjjCyhJQORq/ogaZdHaPlzAk+pAFNMrU6+9jdzxkId10sxNazVYMf06XM8RK1Af9tZLPMMzqlynFG4azDXdR5r3PgFfOHTikkJlXeGF4lyeCVrzZahHfAUu9TFvpN+0Gdl6siaqmzygNdPLrPuOOXM2+HZivgF4EtYXqOlmcNyaUTbDTEiDJSpa6Bi8cIpQuptZf1woWTQ1zUu0moj0+3oEzwSK/DV9Vncu3yFJwOfjpPTDvB5Kvw9uo4cxOt7fw1NsWNLt9VNglSKGDIk3nAUkHbiW72kX959qxoDqjUfQg2Jdd1xQBHpsYgM8aqdo4OklyxvEtWUOMQxZ8rr5qqzL6sk3Ixz4o69N7WpEICmgK1UEPUdXbVJGsk4JpUU1BUEB38GA2D4i/7F4wjzGBf198asjWS0Z3qVbyPPTEQCvTblanVQHrUChSb86kJ9onx6OMFx+hHjUoFXK0fiiebVz6gTqePTmE62VjeMiuwRQ3ZFBJUOLdsrwnSwrMsjfAxzYcj82FAh55neckbq71JqL8qV2vNt9PVm3rdMZN4ZQuOeYj5mTVOptcTdG/gY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2tXMXdjcmc2YTZ2TFNkU3VzdlpSOFZFSmc0a0lVc3pwbDFqZklKQ3A5QWd0?=
 =?utf-8?B?ck15UXEwVXNuV0d2SHIwRXg0elVpUnZ3azVhNFYvUC96Q2tBQnk3ZWkyWnVX?=
 =?utf-8?B?emlvc0o0SEhja0owc1l2S004RElSMGYwUGNvOUo4bE5yNWlTd2tDai94MFVK?=
 =?utf-8?B?bS9WKzF1UnBhVTdqTHNnR2JlczZJaEZrUXIxMWx2bzZjZ0Q5WnpuUUZaN0M2?=
 =?utf-8?B?TDhpTnhPQWpkNkI4a2E2amFKOUZxcHloTG9yTFBybVNhaDliZ0l4QnhuWExG?=
 =?utf-8?B?T1RlMjdCaDl4ejUyRkhCUGVOaGo0OHlGOGpNVW9uUnBDUmFLUUo1NklUNXR0?=
 =?utf-8?B?TEE3Sm1UNklSbjZ6VEZLOWVKa3ROMUlxaW1ZeGVrZHM5UGFPTFdhL3JVekdQ?=
 =?utf-8?B?KzdjTFFlQkdPTldBaW0wU01QQ2NSZ1NacWx5aHZCWjdsQ25POHFrQ2ZoVnpK?=
 =?utf-8?B?NmRtTEJGTkRjNnkwY2wvVWFqT3hpSkkvSWhQNFZXaTRHbk1zRE9LSjZIa2o4?=
 =?utf-8?B?R3pLVXZKeit6c3I4aU5ZWkRGR0R2YWZDMUxqNGhJV1FYUUVOSC9MVjFvME0v?=
 =?utf-8?B?T3FIMHJ1MnhUSUNJeFErb1lLU3psQ1pVTStveExubTFiaUExNFdvbi9PVUdz?=
 =?utf-8?B?Rytmb29aZXB6TUtDeThjdklpb2NVdnJBWmMwSHZwN25OSFU1Ri9ZN2pVTkVP?=
 =?utf-8?B?d3FLTklNZldNWUZGblV5QWdWQWI4aGJvZzJzNlhkemRWOHpyTTRnOXVQd0xO?=
 =?utf-8?B?SUxoRUVBczQ5d0FiM293NExtUFI5eUVXQ1dVZHoyNmtHRVJ1UVlUaWtsMzIv?=
 =?utf-8?B?eU5ZMXdKZ0MvbjRsUFZyS3RxbmJzTXZPTGlhQmxIOFE4RDVWUC9MWHpTZUpX?=
 =?utf-8?B?a1pJQ0Y0VXNsUmlrZVJCandXRW9BckVrdVFoUk1mMFRIS2xrcXNmSndwRTd0?=
 =?utf-8?B?dCtHQUoyVjhwdWI3b0txbmVGdWN3QWZxZFp2Sk0zYWJHWWFzT01IdVhsYXRh?=
 =?utf-8?B?Z3lnOEtVVG1oTHA2YmNQQTZoUVdzbmMwZjVnTGgyY2lUb25oN2FaWkZDWjVV?=
 =?utf-8?B?dkpTbkVHaER3U1Btb20xMkx3bEE1cXVFL2srSDJ0YlhIUG5aMndUeHdZWGRx?=
 =?utf-8?B?Y3BUVTR4cGFpdVpwQTVxMWtGOTJBZkh3WjJRYnZiRUg5ZnVqSnJvR0lwNE1h?=
 =?utf-8?B?aGJwTXI5bko0czM0WDBad0JtaU5QYnh4RHpYQ3prOFFSbTI2b25PaWFhNW45?=
 =?utf-8?B?TXFWSDE5OE91Y3k0cnIvYUFGYnRLMmpBR1h0ejczcitWbDlkTitWL0x3Ylg5?=
 =?utf-8?B?R3U1MDQ2ODAzN0owQWs1TGczWDZueThJbDRSUXFTbEZLUjZEcHRuVjJvK1dV?=
 =?utf-8?B?OFNTMzFibDlLQ1VKeHhIaEVZQXhHVXNCRG5yUWx0M1liZVVLeTY2aXRuUHor?=
 =?utf-8?B?OGFxNU5ZQ09vaHAycXdXcUJjbld5b3dpbmRFUGM1MmJOYVpYWFpaMyt3WlQ0?=
 =?utf-8?B?MC9VOVkxbjZvdGk1eWhDcWluaDJPcHVDZE54cW51Y0Z3c2RvTk40KzlCZzN2?=
 =?utf-8?B?cFkxdDVHcjI0UzZ5WWoyT3hBaTQwZFNUY0N3S1NwL2k0aDEyajVCUnZaZ0hJ?=
 =?utf-8?B?WVJIVGtZQnFSUHZNNG1nR0E1cHRoMTdkckdsdzM4Smh4WVp2aHVPT091NlBI?=
 =?utf-8?B?WUxVU2ZvbXFmWENIR3c1aWJaZWVLK1ZJdVhLMHVnUUtLRDNMcGYzY3Q3bkgy?=
 =?utf-8?B?OWJGNlQ2d2pYNXpsZGFaSnltTUFzTmIxN25ubnJBUTB2UHBZZmo3N0RSbmgr?=
 =?utf-8?B?WDlTQkN1MXlXWUNHdkpVcG56V1lVdWUyY0x0aThCTWlyWWdEanl4YnpqVVhK?=
 =?utf-8?B?bVF2VzFHcDczbVpXSkNDai9JUTdrSG5IbzRBZWxOU2J6b0d6ZkEwc1R1dFJr?=
 =?utf-8?B?eXVGVlJFTHNZVVluS3FvNERmZE0vdDBrRGh1NlF4dE0yeEY0L3luWng0WHVi?=
 =?utf-8?B?bUpGRFU4WEE3VWZ4N3FidSt1NGJVVzlnR2dvM0pMZ3E0aS85Z0d2UzZlWUtn?=
 =?utf-8?B?WXNTRDVHL1lVdGR3YUFUaEVqU3ZCRWVhQ1MyditiTG9qSzFwRGhqUlY1VnVE?=
 =?utf-8?B?dDF0R2NadWxhVDdveFBRRWVEMFdSb2JUdUw5Q2xEcjA2MmFsQUtyV1VXQ0d1?=
 =?utf-8?B?K0lLNi91cGpXd2xSOGxmcUhKNmY4RGF1YS9zeTFvWkI4T3l0Q0M1cks3eVFQ?=
 =?utf-8?B?c0UxQVVESlZ0NjJFc1dQSFplQ1pXTDZib0FzU1lJdFJaeExMYVhvWjlUMjFJ?=
 =?utf-8?B?cDl4ZzdaTzdBWFFkRWdUdW50WitCZ1dTb056dEtteG04RzVpMUNyeXpaMmov?=
 =?utf-8?Q?z/wSRMqZfQHsnRfo=3D?=
X-Exchange-RoutingPolicyChecked: asJLNJziz6m9tC7tSmRQWwvXALtxM4QWOH1ueBl57q1FU3PD/oz76JAUpfzeF/nttPQyg9OY5+JO0i4i/1UoCoxIybPqSinRNoodbh/glV7lsn8OlbeLnnv5Kb4TpRAtpP+ZfPtNEUqqR5Lr4eiBCgHuu5XNC7FYz2I/jqQYP5PLOiGoE8n0LD3SEfRlZiWDTTMF0w72LKQzRP4YVQRXwpDvn8hh/H/sYFQoRK6p4CPLvhRRaaTvmGlSx0F8lLK1QKfxTXdhK8cQxmtGUc5wsJbbhLGA/RPgy3Lr+crO8T3Nw4txuPEtB46Vu/8nynWZecgpCpPI2h7IN4IE8PNaGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aabec5d-5b0f-4052-2bc4-08defd58d61a
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 18:45:12.5881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kF53qKmcLhStSCuzBGanwCMH+N3GF/5SxN3GH04b8jJPyWvWKfkMooTteu467dR0cO2orWF0c6zXmzOobXYxqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
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


On 08-08-2026 00:19, Rodrigo Vivi wrote:
> On Fri, Aug 07, 2026 at 11:15:59AM -0400, Gupta, Anshuman wrote:
>>
>>> -----Original Message-----
>>> From: Vijay, Anoop C <anoop.c.vijay@intel.com>
>>> Sent: Friday, August 7, 2026 8:26 PM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Nilawar,
>>> Badal <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>>> Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Tauro, Riana
>>> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
>>> Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J
>>> <michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V,
>>> Mohamed Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam
>>> <kam.nasim@intel.com>; Vijay, Anoop C <anoop.c.vijay@intel.com>
>>> Subject: [PATCH v3 4/4] drm/xe/sysctrl: Add RAS error injection debugfs
>>> interface
>>>
>>> From: Anoop Vijay <anoop.c.vijay@intel.com>
>>>
>>> Add debugfs interface for exercising System Controller's RAS error injection
>>> command, used to validate RAS error detection and recovery paths.
>>>
>>> Command details:
>>> - Group ID: 0x02 (diag group)
>>> - Command ID: 0x7E (XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT)
>>> - Usage: echo "<ras_block_id> <ras_sub_block_id> <err_type> [params]" \
>>>               > /sys/kernel/debug/dri/0/sc/ras_error_inject
>>>           cat /sys/kernel/debug/dri/0/sc/ras_error_inject
>>>
>>> This command requires the diag application to have completed firmware
>>> boot and initialization (late-bind loaded); writes are rejected with -ENODEV
>>> until xe_sysctrl_is_diag_fw_ready() reports the diag firmware as ready.
>>>
>>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 123 ++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  31 +++++
>>>   drivers/gpu/drm/xe/xe_sysctrl_types.h         |   3 +
>>>   3 files changed, 157 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>>> b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>>> index 2144d9d43fba..7b8846d739cb 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>>> @@ -10,6 +10,7 @@
>>>   #include <linux/seq_file.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/string.h>
>>> +#include <linux/string_choices.h>
>>>   #include <linux/uaccess.h>
>>>
>>>   #include "xe_device.h"
>>> @@ -122,6 +123,124 @@ static const struct file_operations
>>> xe_sysctrl_loopback_fops = {
>>>   	.release = single_release,
>>>   };
>>>
>>> +static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file, const char
>>> __user *ubuf,
>>> +						 size_t len, loff_t *offp)
>>> +{
>>> +	char *kbuf __free(kfree) = NULL;
>>> +	struct seq_file *m = file->private_data;
>>> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
>>> +	struct xe_device *xe = sc_to_xe(entry->sc);
>>> +	struct xe_sysctrl_diag_ras_err_inj_req req = {};
>>> +	struct xe_sysctrl_mailbox_command cmd = {};
>>> +	u8 resp_hdr_only[sizeof(u32)];
>>> +	unsigned int nfields = 0;
>>> +	char *token, *tmp;
>>> +	unsigned long val;
>>> +	size_t out_len = 0;
>>> +
>>> +	if (!xe_sysctrl_is_diag_fw_ready(xe)) {
>>> +		xe_err(xe, "sysctrl: diag firmware not ready, cannot inject RAS
>>> error\n");
>> Wild thought,
>> How it would be register the debugfs only if  diag firmware is loaded ?
>> That way nobody will be having access to these debugfs ?
> I agree with this. It is better not even register the file if the
> firmware is not loaded. So it doesn't even appear in the filesystem.
Unlike oCode, diag firmware initialization is not driven by KMD and can 
complete asynchronously. We don't have a notification from SysCtrl when 
diag firmware app becomes ready.

Since xe_sysctrl_check_app_status() is a lightweight synchronous query 
that always reflects current firmware state, a possible middle ground 
would be to move the readiness check to .open() rather than .write(). 
This would cause both cat and echo to fail with -ENODEV until diag 
firmware is initialized.

The file would remain visible under sc/, but would be inaccessible until 
the firmware is ready.

Would that be an acceptable compromise, or would you still prefer the 
entry to remain hidden until diag firmware is loaded?
>> Thanks,
>> Anshuman.
>>
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	if (len == 0 || len >= PAGE_SIZE)
>>> +		return -EINVAL;
>>> +
>>> +	kbuf = kmalloc(len + 1, GFP_KERNEL);
>>> +	if (!kbuf)
>>> +		return -ENOMEM;
>>> +
>>> +	if (copy_from_user(kbuf, ubuf, len))
>>> +		return -EFAULT;
>>> +	kbuf[len] = '\0';
>>> +
>>> +	tmp = kbuf;
>>> +	while ((token = strsep(&tmp, " \t\n")) != NULL) {
>>> +		if (*token == '\0')
>>> +			continue;
>>> +
>>> +		if (kstrtoul(token, 0, &val))
>>> +			goto inval;
>>> +
>>> +		switch (nfields) {
>>> +		case 0:
>>> +			if (val > U16_MAX)
>>> +				goto inval;
>>> +			req.ras_block_id = val;
>>> +			break;
>>> +		case 1:
>>> +			if (val > U16_MAX)
>>> +				goto inval;
>>> +			req.ras_sub_block_id = val;
>>> +			break;
>>> +		case 2:
>>> +			if (val > U16_MAX)
>>> +				goto inval;
>>> +			req.err_type = val;
>>> +			break;
>>> +		case 3:
>>> +			if (val > U32_MAX)
>>> +				goto inval;
>>> +			req.params = val;
>>> +			break;
>>> +		default:
>>> +			xe_err(xe, "sysctrl: too many ras_error_inject
>>> arguments\n");
>>> +			return -EINVAL;
>>> +		}
>>> +		nfields++;
>>> +	}
>>> +
>>> +	if (nfields < 3) {
>>> +		xe_err(xe,
>>> +		       "sysctrl: usage: <ras_block_id> <ras_sub_block_id>
>>> <err_type> [params]\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
>>> +				  &req, sizeof(req), resp_hdr_only,
>>> +				  sizeof(resp_hdr_only));
>>> +
>>> +	guard(xe_pm_runtime)(xe);
>>> +	entry->status = xe_sysctrl_send_command(entry->sc, &cmd,
>>> &out_len);
>>> +
>>> +	return entry->status ? entry->status : len;
>>> +
>>> +inval:
>>> +	xe_err(xe, "sysctrl: invalid ras_error_inject token '%s'\n", token);
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int xe_sysctrl_ras_error_inject_show(struct seq_file *m, void
>>> +*data) {
>>> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
>>> +	struct xe_device *xe = sc_to_xe(entry->sc);
>>> +
>>> +	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry-
>>>> group, entry->command);
>>> +	seq_printf(m, "Diag firmware ready: %s\n",
>>> +		   str_yes_no(xe_sysctrl_is_diag_fw_ready(xe)));
>>> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ?
>>> +"FAILED" : "SUCCESS");
>>> +
>>> +	seq_puts(m, "\nUsage:\n");
>>> +	seq_puts(m, "  echo \"<ras_block_id> <ras_sub_block_id>
>>> <err_type> [params]\" > ras_error_inject\n");
>>> +	seq_puts(m, "  cat ras_error_inject\n");
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int xe_sysctrl_ras_error_inject_open(struct inode *inode, struct
>>> +file *file) {
>>> +	return single_open(file, xe_sysctrl_ras_error_inject_show,
>>> +inode->i_private); }
>>> +
>>> +static const struct file_operations xe_sysctrl_ras_error_inject_fops = {
>>> +	.owner = THIS_MODULE,
>>> +	.open = xe_sysctrl_ras_error_inject_open,
>>> +	.read = seq_read,
>>> +	.write = xe_sysctrl_ras_error_inject_write,
>>> +	.llseek = seq_lseek,
>>> +	.release = single_release,
>>> +};
>>> +
>>>   static void xe_sysctrl_register_entry(struct dentry *root, struct
>>> xe_sysctrl_debugfs_entry *entry,
>>>   				      struct xe_sysctrl *sc, const char *name,
>>>   				      u8 group, u8 command,
>>> @@ -154,4 +273,8 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl
>>> *sc, struct dentry *parent)
>>>   	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc,
>>> "loopback",
>>>   				  XE_SYSCTRL_GROUP_CORE,
>>> XE_SYSCTRL_CMD_LOOPBACK,
>>>   				  &xe_sysctrl_loopback_fops);
>>> +
>>> +	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc,
>>> "ras_error_inject",
>>> +				  XE_SYSCTRL_GROUP_DIAG,
>>> XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
>>> +				  &xe_sysctrl_ras_error_inject_fops);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> index ed80fe63e1c4..43ae0049b316 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> @@ -14,10 +14,12 @@
>>>    * enum xe_sysctrl_group - System Controller command groups
>>>    *
>>>    * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>>> + * @XE_SYSCTRL_GROUP_DIAG: Diag group
>>>    * @XE_SYSCTRL_GROUP_CORE: Core group
>>>    */
>>>   enum xe_sysctrl_group {
>>>   	XE_SYSCTRL_GROUP_GFSP			= 0x01,
>>> +	XE_SYSCTRL_GROUP_DIAG			= 0x02,
>>>   	XE_SYSCTRL_GROUP_CORE			= 0xFF,
>>>   };
>>>
>>> @@ -51,6 +53,35 @@ enum xe_sysctrl_core_cmd {
>>>   	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>>>   };
>>>
>>> +/**
>>> + * enum xe_sysctrl_diag_cmd - Commands supported by Diag group
>>> + *
>>> + * @XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT: RAS error injection  */
>>> enum
>>> +xe_sysctrl_diag_cmd {
>>> +	XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT		= 0x7E,
>>> +};
>>> +
>>> +/**
>>> + * struct xe_sysctrl_diag_ras_err_inj_req - DIAG_RAS_ERR_INJECT request
>>> +payload
>>> + *
>>> + * Request payload for XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT. The
>>> mailbox
>>> +layer
>>> + * prepends the application message header before sending.
>>> + *
>>> + * @ras_block_id: RAS block (subsystem) to inject the error into
>>> + * @ras_sub_block_id: RAS sub-block (IP) within @ras_block_id
>>> + * @err_type: Type of test error to inject
>>> + * @reserved: Must be zero
>>> + * @params: Optional injection parameters (default 0)  */ struct
>>> +xe_sysctrl_diag_ras_err_inj_req {
>>> +	u16 ras_block_id;
>>> +	u16 ras_sub_block_id;
>>> +	u16 err_type;
>>> +	u16 reserved;
>>> +	u32 params;
>>> +} __packed;
>>> +
>>>   /**
>>>    * struct xe_sysctrl_app_status_req - Get application status request
>>>    *
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h
>>> b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>>> index 53d82e61383a..3a97a10d1b7d 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>>> @@ -68,6 +68,9 @@ struct xe_sysctrl {
>>>
>>>   		/** @debugfs.loopback: Loopback test entry */
>>>   		struct xe_sysctrl_debugfs_entry loopback;
>>> +
>>> +		/** @debugfs.ras_error_inject: RAS error injection test entry
>>> */
>>> +		struct xe_sysctrl_debugfs_entry ras_error_inject;
>>>   	} debugfs;
>>>   };
>>>
>>> --
>>> 2.43.0
