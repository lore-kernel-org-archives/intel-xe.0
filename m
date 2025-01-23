Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF94C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 18:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1957C10E2DA;
	Thu, 23 Jan 2025 18:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOHfsYFa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AF110E2DA
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 18:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737656811; x=1769192811;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=p/8I5+VRigoob74HTy4LCkRZeWZPKE4TVz9Hdzn0ZHU=;
 b=FOHfsYFalRfBIEVeasviviALnMQl7tnMpTlqZDP23ZXvuS8QXVaXsmu+
 /y8uLBFVuuWWK+zqu14t/ajCzv6/7NBY1fbb25A60WlnvrYuS8kmlRNbh
 y2/zsvmAcK7W5YHyO+IpJmeSnYsYTGqORbLndLV0f5FEV/Zahluv0kAOL
 XR6Ioj+ElYQGa1I1xl0ve/YlZRr5KLE/BkMsARaQlAksLrEZVk1Rb3Jvs
 ByO2NKvUmx6n699+Ko4PVSv8ZCz0TMyulZhQSv+mM4zxK0e3r2S13yuTO
 yVQ402ySx+EaM5H6dNUeBPvpCuQBH3YnkTFqRssM4kugyRIuVtCTHRPDc g==;
X-CSE-ConnectionGUID: Hva7tu9ORBiE3BP3wtxvWA==
X-CSE-MsgGUID: rsJix2ttSw2C0AE9ALdmbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38060986"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="38060986"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:26:26 -0800
X-CSE-ConnectionGUID: 6I0KHWJVQ2aBF9t9Ghtgrw==
X-CSE-MsgGUID: APlYGHO9TOyHLQNVsKTE3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107972487"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 10:24:57 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 10:24:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 10:24:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 10:24:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tH4LRHwF4jmtIw1Dd3DJ63ENVyrOzrqHNRNatbxxqlj3LoUbFd+igU3aWmLZVvPnUY6ABYvuoq29JTwwcECCFJgWW1OkO3ub1k31vW8u10O9Z9AMTtaQQzmpQCgHBh+8V6jvNBBKJMVUgsJ77P4mZplfO/rWhM0frvwz4ACSo3wQcQzuLaezSoUQDnaQmfTbZwJN12JUxC0Ybdugml6qhEYLZf/gIR3+cx9N5QuGYzPpn+PmMUcy/qecuQ/Q8/SyMlzM+jQoLZrYk0keBJMXsTqnttUIGaX5aZQyxsOOoqwHHrw6aEbs0QAtXub1TS9zV10c53elU7pHHcz1TkDXSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/8I5+VRigoob74HTy4LCkRZeWZPKE4TVz9Hdzn0ZHU=;
 b=FlqUzbDGvfhNTk6XApPAtgASGAPUtesntWoYmXOFeFl+cZzs2xvZ1sx7ODbW2ufl0gw2UzvfnSlyg4pL7KOGmOz6VGmYruAAMnhCQuJEV8AoZIuNpVeqJk6u+cYLo7wYm4EuQ5lD0iyo14lcqcxwEvDqR/3zryPJC7DrgSZi1tL/dw1IFfocL/UM7oRr3ogvuMxnzpRtb0KoeF/O3oaeDoxA+oOwzNFgJGP3n6gWHUMSS/Gu34OY75QTl7sDWZ5zVKNezEvjCZ8NmbpvDw0XrzVklYeXe/lEuVIWcu1pCnJFfE64fWBsH86uiqVEil9Zb5r5ttc3QKq1DHYanvuyJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB6145.namprd11.prod.outlook.com (2603:10b6:208:3ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Thu, 23 Jan
 2025 18:24:13 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 18:24:13 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Drop duplicated information about GT tile in
 devcoredump
Thread-Topic: [PATCH 3/3] drm/xe: Drop duplicated information about GT tile in
 devcoredump
Thread-Index: AQHbbcEqwvTX30vHV0akKUUxs8P7+rMkqsiAgAABswA=
Date: Thu, 23 Jan 2025 18:24:13 +0000
Message-ID: <124780756da7b9546d16158659a562408a23497e.camel@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
 <20250123180320.66198-4-jose.souza@intel.com>
 <09e5ad52-be12-4d39-9b64-ca75b4851307@intel.com>
In-Reply-To: <09e5ad52-be12-4d39-9b64-ca75b4851307@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB6145:EE_
x-ms-office365-filtering-correlation-id: 6268beaa-c4cc-46bd-23a4-08dd3bdb233d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MjdEekZDbUdkbS80bUJBNUZtNDlac2hEVm5IWGs1VFVTRWk0TEt2dVN0OTln?=
 =?utf-8?B?alFENVRvdEFOSnVqNXc1YU5IY0xNTE00NjdBRzl0Y3RUUTIzU1IvSGRhblRJ?=
 =?utf-8?B?RmRjOTNTM0ZEaS9HZjlhanZHTzRSUHd3TE85ZWkvc0g3dnJvbDNRcnUrVi9I?=
 =?utf-8?B?Y3l0LzJ0Q08wb0hiL21aeFJHYXFoMXY4STVYYmdlMGpYallqdXFJNHBEL1ph?=
 =?utf-8?B?S0hpclJ2eHNQK3htRnRIVHhrM3Z4RzhaTEJSN3BSM0dDMG9TK0ZQdW8yaHhI?=
 =?utf-8?B?eWpRb1R6aE1MSUIyYmJJT3RLVmRqYzJNSnRqWkVEYUpPRzBPdXNMT0dzYVFY?=
 =?utf-8?B?dlFxWDBtc0RsMU53V05uK01OcnhVR3pTQU1sd3N1Vm9RaHV0a01JdWhWZy82?=
 =?utf-8?B?ZW1jeUZEMDY1UmRXUzNraVMzQUNBa2dNaEFZTStUZms0ZW94czVHQjBWc3lN?=
 =?utf-8?B?MVNmMmNGQm52SFNhRzNaTnJ6T21mcWsyZDh6enFNMEJnNUQra1JNV3hCUFRs?=
 =?utf-8?B?QWtJNm9EYytWM2V4TzBRSDhsRmJ1RVVxUHFhTy9ZZHpZL2MwOTVhSXRacVBB?=
 =?utf-8?B?SzlWaWFPSkVKUk9raU8rTEQ1MnY2eFVmRzFiSDV4MWNHTi9NSTJxRzFUUGhW?=
 =?utf-8?B?TE5WdkpVc3hVZitSNVQ5azhMSWRScjlTZjBRQ2dEZSs5V0xGaUFYbVV1ZTYy?=
 =?utf-8?B?eEQ2ZVBIMGxiQmpyTXR0S1h0b05WTW1pZkl4eUE2NW9SUy9Vb2lTYk1sZkZW?=
 =?utf-8?B?WVVlU1g5WmhrN3JLZEJWbm5oNTV4QTdLRDJyVzg2eEJOc3IrQlFRNjdwMHA1?=
 =?utf-8?B?a3ZPc2VjS3FQTlc1L3ZmOXJaYXJJUjN1b2lXNFRGSjVZMmJmcEgvWm1qV2lx?=
 =?utf-8?B?c3loRjVNcFdPZFV1ZDkzUDRtbVEvT2VBc21GNkdTOXUzeEswbTlSVDYyV0N2?=
 =?utf-8?B?b2pkVVNSYVFCZEtPdHBPV2RMRVdTQXpTU3F2ZWZXcWNxaDhkN1dqNXcvVkRn?=
 =?utf-8?B?UHQ5Q2RzeU9TZENIT2JoTHpORVBVanhNTlRTU3dzVk56TEszQ2hVaFk1aHVI?=
 =?utf-8?B?OXQzUWtycWJ0M3NjampRVFZGNks5WHlSbDluaWhRalJzWnUzcE5ycTdjcUdN?=
 =?utf-8?B?NVRWQ1JPN0RMRVJvdzlOTGV1RzlFNTUrTU5iUUxtS3MxUThCaHlCdG9xS2Nj?=
 =?utf-8?B?VHJ6d0Q2MzBrUUdONDkvWFYvMmdJQWwvdGNOQVp1MTI3d0d6QU1HMnkyc1hr?=
 =?utf-8?B?RVQ4bC80WU5LcnA4THMram5YYW9MRzEzUzlVZjF6ejdOOStIdC9MT1M3eFNj?=
 =?utf-8?B?S2xNbkZRYnhSMDdYT2pJOFAwM3dzQm1yQWFteEE4S2JXL21sZEIrWmhJNGJZ?=
 =?utf-8?B?T1p2SWRQR2diSUJYeEppa05GN2Z6RVFGeTE2NmcyZzBseVM3UDFHYVk3eHp2?=
 =?utf-8?B?Yk4vaVNNUE11aUpXQWRScTAxaDFVWjFUMFZtazdhc1AwQ3hSd3BZSG1wbGgx?=
 =?utf-8?B?bjNpZmJDTWFJZk9BNU5HY2xTYWV0SkF0QVBQOVZVNWdVWlhwMjlhelRVOFVk?=
 =?utf-8?B?S2tNR1ZmY2h0NGYyejFtTUJOY0VaYTNBT09landkeXpxMTl3TEpLTFhIVHlO?=
 =?utf-8?B?YmNqQjFkejdjaUE5b1g2M21ZZ3ZDSXhLOTdkckdFYTJRTXZPekhrVUYvalJl?=
 =?utf-8?B?akRwbytLQTk2Y1RnNnF6RmZMempNeTFXNkpVb1FOYWpSbFhERnpocWk5YitP?=
 =?utf-8?B?RFJoWk9NNG4wc3Z0d25TVXhMV1hqWlNrL3hMdGMxcExvNjZ2SFE1NTcxY1ly?=
 =?utf-8?B?eE1LY0pZM3pWQllhSkc3TnVNeGhpZ2toaCtxZGR1blJOdjVYVUI1WXRuZnpJ?=
 =?utf-8?B?ZCsyRm1OdTBMUG1FbXA4aW4xck1aa09Uczk1ZmZPT005TkZBalRDekVNcFFO?=
 =?utf-8?Q?gwfXE9fkQd5uzAj7sDAH/JO98DjIgIsg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djNDdlFUK09DN3d6clYrNWRZbjBPVUR3UGNQcmV1Y2NwZ2VpL3VkQ2xpbUZa?=
 =?utf-8?B?S0gzZGlJZ0Fadkd5ZmhSMjNTbWpVVFA4ZHdweEloUTdQaHhJYXR2R2ZUQXpr?=
 =?utf-8?B?WXk0dFdwRFltWWVYdE9KTU4rMzFHVFIvTlRGU2VCREpQUEtQd1dVRENLTXlL?=
 =?utf-8?B?NlBzZytTc1REZ1NrQndobzFkSUQ4Nyt2UlBJeVh1YUhJMVpZTjJ3ajljTXV2?=
 =?utf-8?B?KzhzSC9VMGxRZlF6YjlVSWVMUjFMRU42T25qREhkc2tydVhFWS83V3pSSmxG?=
 =?utf-8?B?dndvMXczaG9SWnVsZm1YRVJBd3daY0ZIWXVJdmh5cGUwS0V4a05iTSs0eTE4?=
 =?utf-8?B?dmJsNFdVWWtKK2xLNkMybzE4VEgvYXFDYjR1MlNNN3BjelNxTlZQVkxWREsv?=
 =?utf-8?B?a0J4SXdjMW5Edy9WbFk5TUU2UDFLOFRCSTFEQXZ4eHlQOFZXck1DMjRKSFVL?=
 =?utf-8?B?Sk1tZ0RGWXBzeUFNN2pZd2RibzZCcStpUU5yZ0IwZWlxZmovd3Jrb3IvTGFO?=
 =?utf-8?B?bjZmeE1qNzJrcUZNbG5OaUtTN2dSaTAyeUpYbXVieWxFcTFKQ2pjeVVlOUJi?=
 =?utf-8?B?WnVZZ1FBeW9PdmduVGV6MXh6cGZuaUxMRjlBa0pkd1NRdXAvVVBNVFlQaVlY?=
 =?utf-8?B?bUhwVmhVN25XQ25CYTRORENoMlh2eUFaakM1bUkvY2d3KzZQaXl0RnNUbzNy?=
 =?utf-8?B?aHo1TmVJaG85ZWs0K2QvZDdxSHpqbmVCUG5zOFhHN3owblR6SHlhdEtaWHA4?=
 =?utf-8?B?THI2OW9MZytqa3dQVGVXK0EwV1RORWVwK0h2TWRlWkpldnQ3ejZUSTlTNFVJ?=
 =?utf-8?B?eUpoQ0NRZmpXQWhjaVVYSmQyT0hxVCtpQjBDaG94Q0MyeGNVRDNOS0RXam9D?=
 =?utf-8?B?aWszcW4wRmNEZVpLbWd4NVU4TFAyVm9mS01DZjMxbndma3JVRHJ4R2MxRTFr?=
 =?utf-8?B?R0EwQ0VRbVVJbmhXT2xPZ2pPY3Qyak95aEZJL3cxYmpibVBmODNpaTVWRnh2?=
 =?utf-8?B?TjlzVkhoN0J0WEdyZVRRQVgvT3BGekQ0ZlVvUG5HWitid0dmeUREWEtqTnFO?=
 =?utf-8?B?MDFUemJiNzA2RFVvbDR3R3E1aExQM0JDSkVxMnYySGxVTGRtLzVRb1hXOXpT?=
 =?utf-8?B?YzhZNjd0T0hPK3dzYS93QUJyd1pYdHNVenM2bVJYTGFycXdaN3p6TXZUTjhm?=
 =?utf-8?B?MUZVUG5MMlZ1ODlWTFNFTGFnbE5kRUNrVUhKQVZ5eHRKam81dThEb0t1YjNY?=
 =?utf-8?B?Zyt5R1VnbjhzTE91YUhHVlRsS1FVekVzbTh2OVAzaG0rZStxT0FaazYyOExU?=
 =?utf-8?B?b0c5NnpudER2NXQrc1lrRHpERVBLZzZyZmdJb0J4ZSs2NXdEazNkYlZhNlB1?=
 =?utf-8?B?SFVLZHRuUjN1bWh1VHJqRVdKZTQ3U1F3eTcxeXdCQjdVVWk5WkNWUVU4MllN?=
 =?utf-8?B?UkZZd0d1ZVRPOXdFeVJYZWZ6VnU5dXB2dTBOd2tjSStxd0pZZ3BrNVJ5NFNK?=
 =?utf-8?B?S3lrUDRuZmxVSHZVWUR0dUZBMGNiQVBQY3RRUjhhQklQKy9wVjd4QW8wcWRF?=
 =?utf-8?B?NWZEbWZYOC9JUGNJM3lrb0dvNXBnTGFrWXlqN2Vub3YyMnIvVjNtbzc2V3Ba?=
 =?utf-8?B?aUR3ajZDcFdGS1NZUWEvUmkvM2RqVGQvZ2hXLzNERVBMMmdUKzlmNENXRWlS?=
 =?utf-8?B?bjN5dTA2N3ZDTDJLVVRWT1pGeUdaTjFsSS9SV1VhNFg1R0taQk5lUDl4ZjF0?=
 =?utf-8?B?K1VDb0NlWFdBZ3R6Tm5TL3p4QmhCSTF1Z1RIdjFGSEx5MEU2b2tWQmpXS2Jp?=
 =?utf-8?B?Q3dSUW9OSStXaDEzZjFRcnl1bVIwMm5FUVNUOWJReHNWcnVHQWd2QjlFU0NQ?=
 =?utf-8?B?TkxuS2pxR0FsMzlYSDRKUlVDQ1ZMZlJJZmFvdUduckVseEtvVHdBRzNwRXM0?=
 =?utf-8?B?WHJHOHMyZTlIZHFiMEJEcHBoTThvdHVZdGk1RmhJbG5Fam85elNCVGpPMjBn?=
 =?utf-8?B?RUF1VGhqTVo1N3ljMVA5end0RlpxbS9mUGltUUNybFJDRHZQamVaS1pjejZI?=
 =?utf-8?B?RVcyc2hnMVI3NnZNZktGOHZNYnZGR0NSZ3EyMVFjSWdBaUpXRHNBVXZOU2h6?=
 =?utf-8?B?ZXpZSDJWR3JKdGlKRmFDb1VRTXgybFVCekUyNGpUUUdlTHJBTnZ6dExRTlV0?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7DDED3734DE5246A513006450B32AED@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6268beaa-c4cc-46bd-23a4-08dd3bdb233d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 18:24:13.1236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoOKCHJohgeV3Hkp9KWfUxnWKSholhkTGIyIw7Rp2rpBEpcgJsukXzwqgTCw+o354naFk9469pbUYFe2EIVGGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6145
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

T24gVGh1LCAyMDI1LTAxLTIzIGF0IDEwOjE4IC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAxLzIzLzIwMjUgMDk6NTksIEpvc8OpIFJvYmVydG8gZGUgU291emEgd3JvdGU6DQo+ID4g
VGhlIEdUIHRpbGUgaXMgYWxyZWFkeSBhdmFpbGFibGUgYnV0IHdhcyBhZGRlZCBhZ2FpbiBpbiBj
b21taXQNCj4gPiBjMjhmZDZjMzU4ZGIgKCJkcm0veGUvZGV2Y29yZWR1bXA6IEltcHJvdmUgc2Vj
dGlvbiBoZWFkaW5ncyBhbmQgYWRkIHRpbGUgaW5mbyIpLA0KPiA+IHNvIGhlcmUgZGVsZXRpbmcg
aXQuDQo+ID4gDQo+ID4gSGVyZSBhIGRldmNvcmVkdW1wIGV4YW1wbGUgd2l0aCB0aGUgZHVwbGlj
YXRlZCBpbmZvcm1hdGlvbjoNCj4gPiANCj4gPiAqKioqIFhlIERldmljZSBDb3JlZHVtcCAqKioq
DQo+ID4gUmVhc29uOiBUaW1lZG91dCBqb2IgLSBzZXFubz00Mjk0OTY3MTcwLCBscmNfc2Vxbm89
NDI5NDk2NzE3MCwgZ3VjX2lkPTEzLCBmbGFncz0weDANCj4gPiBrZXJuZWw6IDYuMTMuMC16ZWgt
eGUrDQo+ID4gbW9kdWxlOiB4ZQ0KPiA+IFNuYXBzaG90IHRpbWU6IDE3Mzc1NzM1MzAuMjQzNTIx
MzE5DQo+ID4gVXB0aW1lOiAyNTg4LjA0MTkzMDI4NA0KPiA+IFByb2Nlc3M6IGRlcXAtdmsgWzg4
NTBdDQo+ID4gUENJIElEOiAweDY0YTANCj4gPiBQQ0kgcmV2aXNpb246IDB4MDQNCj4gPiBHVCBp
ZDogMA0KPiA+IAlUaWxlOiAwDQo+ID4gCVR5cGU6IG1haW4NCj4gPiAJSVAgdmVyOiAyMC40LjQN
Cj4gPiAJQ1MgcmVmZXJlbmNlIGNsb2NrOiAxOTIwMDAwMA0KPiA+IEdUIGlkOiAxDQo+ID4gCVRp
bGU6IDANCj4gPiAJVHlwZTogbWVkaWENCj4gPiAJSVAgdmVyOiAyMC4wLjQNCj4gPiAJQ1MgcmVm
ZXJlbmNlIGNsb2NrOiAxOTIwMDAwMA0KPiBUaGlzIGlzIGFuIG92ZXJ2aWV3IG9mIGFsbCBHVHMv
dGlsZXMgaW4gdGhlIGRldmljZSB3aXRoaW4gdGhlIGdsb2JhbCANCj4gc2VjdGlvbi4NCj4gDQo+
ID4gDQo+ID4gKioqKiBHVCAjMCAqKioqDQo+IFRoaXMgaXMgYSBzZWN0aW9uIGhlYWRlciB0ZWxs
aW5nIHlvdSB0aGF0IGV2ZXJ5dGhpbmcgd2hpY2ggZm9sbG93cyBpcyANCj4gaW5zaWRlIEdUMC4N
Cj4gDQo+IEl0IGlzIG5vdCBkdXBsaWNhdGVkIGluZm9ybWF0aW9uLiBBbmQgaWYgeW91IHJlbW92
ZSBpdCB0aGVuIHlvdSBub3cgaGF2ZSANCj4gdGhlIGluZm9ybWF0aW9uIG9mIGFsbCBHVHMgYmFj
ayB0byBiYWNrIHdpdGggbm8gaW5kaWNhdGlvbiBvZiB3aGljaCBHVCANCj4gdGhleSBhY3R1YWxs
eSBiZWxvbmcgdG8uDQoNCkNhbid0IHlvdSBnZXQgdGhpcyBpbmZvcm1hdGlvbiBmcm9tIE5hbWUg
KyBjbGFzcyArIGluc3RhbmNlPyBpZiBub3QgdGhhdCBzaG91bGQgYmUgcGxhY2VkIGluIG9uZSBv
ZiB0aGUgc2VjdGlvbnMgYmVsb3cuDQoNClNvIHRoaXMgc2hvdWxkIGJlIHBsYWNlZCBpbiBvbmUg
b2YgdGhpcyBzZWN0aW9uczoNCg0KR3VDIElEOiAxMw0KCU5hbWU6IGNjczEzDQoJQ2xhc3M6IDUN
CglMb2dpY2FsIG1hc2s6IDB4MQ0KCVdpZHRoOiAxDQoJUmVmOiAyDQoJVGltZW91dDogNTAwMCAo
bXMpDQoJVGltZXNsaWNlOiAxMDAwICh1cykNCglQcmVlbXB0IHRpbWVvdXQ6IDY0MDAwMCAodXMp
DQoJSFcgQ29udGV4dCBEZXNjOiAweDAyNWUwMDAwDQoJSFcgUmluZyBhZGRyZXNzOiAweDAyNWRj
MDAwDQoJSFcgSW5kaXJlY3QgUmluZyBTdGF0ZTogMHgwMjVlMzAwMA0KCUxSQyBIZWFkOiAobWVt
b3J5KSAxNTINCglMUkMgVGFpbDogKGludGVybmFsKSAyOTYsIChtZW1vcnkpIDI5Ng0KCVJpbmcg
c3RhcnQ6IChtZW1vcnkpIDB4MDI1ZGMwMDANCglTdGFydCBzZXFubzogKG1lbW9yeSkgLTEyNg0K
CVNlcW5vOiAobWVtb3J5KSAtMTI3DQoJVGltZXN0YW1wOiAweDAwMDAwMzVlDQoJSm9iIFRpbWVz
dGFtcDogMHgwMDAwMDM1ZQ0KCVNjaGVkdWxlIFN0YXRlOiAweDQ0MQ0KCUZsYWdzOiAweDANCg0K
KioqKiBIVyBFbmdpbmVzICoqKioNCmNjczAgKHBoeXNpY2FsKSwgbG9naWNhbCBpbnN0YW5jZT0w
DQoJQ2FwdHVyZV9zb3VyY2U6IEd1Qw0KCUNvdmVyYWdlOiBmdWxsLWNhcHR1cmUNCglGb3JjZXdh
a2U6IGRvbWFpbiAweDIsIHJlZiAxDQoJUmVzZXJ2ZWQ6IG5vDQoJRk9SQ0VXQUtFX0dUOiAweDAw
MDEwMDAwDQoJUkNVX01PREU6IDB4MDAwMDAwMDENCglIV1NUQU06IDB4ZmZmZmZmZmYNCglSSU5H
X0hXU19QR0E6IDB4MDE4ZGIwMDANCglSSU5HX0hFQUQ6IDB4MDAwMDAwZWMNCglSSU5HX1RBSUw6
IDB4MDAwMDAxMjgNCglSSU5HX0NUTDogMHgwMDAwMzAwMQ0KCVJJTkdfTUlfTU9ERTogMHgwMDAw
MTAwMA0KCVJJTkdfTU9ERTogMHgwMDAwMDAwOA0KCVJJTkdfRVNSOiAweDAwMDAwMDAwDQoJUklO
R19FTVI6IDB4ZmZmZmZmZmYNCglSSU5HX0VJUjogMHgwMDAwMDAwMA0KCVJJTkdfSU1SOiAweDAw
MDAwMDAwDQoJSVBFSFI6IDB4N2EwMDBhMDQNCglSSU5HX0lOU1RET05FOiAweGZmZGVmZmZlDQoN
Cj4gDQo+IEpvaG4uDQo+IA0KPiANCj4gPiAJVGlsZTogMA0KPiA+IA0KPiA+ICoqKiogR3VDIExv
ZyAqKioqDQo+ID4gLi4uLg0KPiA+IA0KPiA+IENjOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFy
cmlzb25ASW50ZWwuY29tPg0KPiA+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hp
QGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxq
b3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZjb3JlZHVtcC5jIHwgMyAtLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9u
cygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29y
ZWR1bXAuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jDQo+ID4gaW5kZXgg
MWM4NmU2NDU2ZDYwZi4uMjk5Njk0NWZmZWUzOSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZjb3JlZHVtcC5jDQo+ID4gQEAgLTExMSw5ICsxMTEsNiBAQCBzdGF0aWMgc3NpemVfdCBf
X3hlX2RldmNvcmVkdW1wX3JlYWQoY2hhciAqYnVmZmVyLCBzaXplX3QgY291bnQsDQo+ID4gICAJ
ZHJtX3ByaW50ZigmcCwgIlByb2Nlc3M6ICVzIFslZF1cbiIsIHNzLT5wcm9jZXNzX25hbWUsIHNz
LT5waWQpOw0KPiA+ICAgCXhlX2RldmljZV9zbmFwc2hvdF9wcmludCh4ZSwgJnApOw0KPiA+ICAg
DQo+ID4gLQlkcm1fcHJpbnRmKCZwLCAiXG4qKioqIEdUICMlZCAqKioqXG4iLCBzcy0+Z3QtPmlu
Zm8uaWQpOw0KPiA+IC0JZHJtX3ByaW50ZigmcCwgIlx0VGlsZTogJWRcbiIsIHNzLT5ndC0+dGls
ZS0+aWQpOw0KPiA+IC0NCj4gPiAgIAlkcm1fcHV0cygmcCwgIlxuKioqKiBHdUMgTG9nICoqKipc
biIpOw0KPiA+ICAgCXhlX2d1Y19sb2dfc25hcHNob3RfcHJpbnQoc3MtPmd1Yy5sb2csICZwKTsN
Cj4gPiAgIAlkcm1fcHV0cygmcCwgIlxuKioqKiBHdUMgQ1QgKioqKlxuIik7DQo+IA0KDQo=
