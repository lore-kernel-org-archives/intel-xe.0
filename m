Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5434B1077609
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 19:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1759910E731;
	Wed, 18 Mar 2026 19:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgFb0JXY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE1410E731
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 19:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773860987; x=1805396987;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MEa0+W+cY8SSZc+W0JRnKf9qp4NaG2nOHA6PPLVB9Aw=;
 b=RgFb0JXYGYIRHh/cupro6XlqYAfoCO/iKSlEwxYiN40SlZCrbfmW6Pn8
 DxDtOw4sV4CZUmbxNLWe2RBQ7IVKcwCj9GMyzdrxjRpSILaP+oHtGZDC9
 Uw3gPwhy2OKO78cdWu2fqEjLu692o9nz6PCqsk5H6XZLDFeU6g1v4PZe7
 rktO5e+xXr/Jvm4l2GOyJNhNuSU65SEUUYCNDAgMerrD6YXH2IA4J1SJ6
 u/p9XUJw13N8Lp8MHtg9Fv0ONk8YTMmEDF7x3s6HD1Ag4U6xC/KoqZkaV
 qx5t7Iuu1Fna9LbZNavOLSGGTfcC/LNEGIA2DMr7LJ7DtL5EArqNhYf7s A==;
X-CSE-ConnectionGUID: ClojfHmqRCqtz5OyFAil/w==
X-CSE-MsgGUID: 521avKZeT2i8A41IyRM+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92308476"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="92308476"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 12:09:46 -0700
X-CSE-ConnectionGUID: lWkwsyJUQ26SNnJdIvdLSw==
X-CSE-MsgGUID: DG2qaJBAQ4e0LqYY/TKk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="220146553"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 12:09:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 12:09:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 12:09:44 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 12:09:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxNmEkoEP56Y8dFfrPQKryYZL7aNc3pMI9Tp66dybIk5udD6sS6lsLRTU4c4am64H8/Zo/I9cDCX8+dkz211lbg7brHKxloReWstuItc9MVleUNhAUM9XUY1iGviAxUDI+4VkplpHX0WRsxSrEiAfgLt9hRV0xmhL8HKDlPl6Nbio8AAPxRYxF1z+4VAQhI15z095WnHSiFQqad0NnAamicKREwJyW4VBVV4A24IkTLfGRMOLIoWhUm7II14jT30mURc8jxxUiLK3TGFUKmQtO77BiLEwQ83augt/SRHghB8mK8jFFakl5AkZ5UR+i640aZLb1LA0LUGbRBuwyR/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEa0+W+cY8SSZc+W0JRnKf9qp4NaG2nOHA6PPLVB9Aw=;
 b=lLQIZZgitgDcMlIftyeWT4uMB0bMvOL79ccWJu5N+HYq8DFiMu/uO4l8bJqhdjnSd0YUeO4epwSgouu59ryCKPGKcQ4peAPan2GH20C23CWVufuq3eZo9VZGpVIzaHToqF9dmmeaJuq009ajWYQ+1HyHbzVgiyG/KI//BWVAyWaOwWWYGSCGJKI9Gmduw/nS6PnJaMzEVFcUF90HOFNZeKiy5OwRVHhkey3R49BKaW88jmbOKFXj6aIQTLK0KZwYdw5euAuPakQvSNx7B3RYuxVfQ6NLKs0/To4bFvhv/GlyM3uY77sXCpQ00BgvyL9Z05YK0o3CEjKC4+mcPlPcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DS7PR11MB6015.namprd11.prod.outlook.com (2603:10b6:8:74::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Wed, 18 Mar 2026 19:09:39 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 19:09:39 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH v22 09/12] drm/xe/display: Change write_dpt_remapped_tiled
 function signature
Thread-Topic: [PATCH v22 09/12] drm/xe/display: Change
 write_dpt_remapped_tiled function signature
Thread-Index: AQHctVnBGWccjhh3b0G6NPAIFrp8grW0qdsQ
Date: Wed, 18 Mar 2026 19:09:39 +0000
Message-ID: <DM4PR11MB636004852F380D5701FD587FF44EA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
 <20260316152929.1247-10-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260316152929.1247-10-tvrtko.ursulin@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DS7PR11MB6015:EE_
x-ms-office365-filtering-correlation-id: c9239f88-d40d-4dde-9877-08de8521e74d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: IqdGlm9mRybqr5qol8oDsfk2ZRqjZwdVv4ahYaIv+wLlUfutsPDGT5fbedGTbtjJMPsHouPd6wuXvobDXUMLPPAkoshCrCAa4NI8bODPeS/NwTnQQ8/2nSwI9hTOfzzqYXNn+FjdJjJEDXIT2Qav7KfvRf9YhUr5Xe1gjfjel8F/kvKVPjNuYleYJ+Aoc1Dnm6jzYI+QPa5lg9pHAOyY3lbjE4Sade6eAhJAYMNWeSxgqfdvWaCzcHV0Hpom0yeN0kKf1HmWy9YLcq/v9FD2njrrGtFXnKfXL2gNYUdeq6jSxhSq0EIcatNSmFE88LWBUVGTdLYd+32Zzx9TvCF5gI78N94ymjA0pZKV+a4IFe35Z3aOLiHtkji9xj7IvQp1qpa9wmyzcFh3XvAMd/fNS88k+AiAt8f7NE6ESidq7q3DluKp7hcEk27BS8AKxAromIHqcF6BKeKKc2Nlq8rjJz6kMoFr/dSWx/DPhLtreC0rCB94vMzbtTHJe7sNxktfOmcM7Dxzb2wl81QTxFztlY1gf6xqp45FvY2X3ufnLukjwOyEmnT0HM5hpKYQysaroKmkm09DXy5QVMkAv7ZUwNXT/9nI3FANrk+7R8d8pYCbFUVn598ijg1e7RjGvj+XIbRGBsE7PFTmT1BqFAx4M5jYEpz3Llq9qt/fRB8X3sxVv1PtLzkrBM5uVewoZ17zwTYOVEzlFxzFmmIVbm4hWuqlVM9zvGTuKq/MCvr5Vx7X8b3gF3p+JYeV76LLW6j1mUcuU7K+D1geT4aq9qLuzeQeUo8Ok685BNU+MesbhvM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dE1JMFNGY2dHa3lma2tLUXp5bm1WVkJhRWhqR0pGNmlhdDZteWVGWjkvd21q?=
 =?utf-8?B?cFgzZC9rcTdkWFV0UDlIVCtiSTVyVkhmZmFETVRsb0JJQ2ZzM1ZrUmEzdHdj?=
 =?utf-8?B?eEZLakFHWkg3TnMvdEVTWmFaUnVieGlwNks2ZFdOSmZwc040d29PenFpZlp3?=
 =?utf-8?B?MFN5UVdBSEhldDhyMlpISnR4U1B1ZWw3Syt6Y09mdGgwalZNdEFrQWx4TE9B?=
 =?utf-8?B?SUw4Yjc2NHdxVkZ2clErUU1sZDZoNU9zdjhEeHdFRlJGVGNGVjBVbXhOc1BU?=
 =?utf-8?B?ZWdhMS9ucDAwVkllaDFDT1d2VUFmNHd4cm1JK2JPOE43c3EyZU1UMFd4ZzNl?=
 =?utf-8?B?THlCZXY3ZWdEQkFLTHp6SG5LYmV3TEg1NXFiQVYxV21nR09OQXdHcTZLT0J3?=
 =?utf-8?B?QzNJb0ZnaGYrQ2hmbnNVQmErbVZrQlRvb0cyN3hCOFJOY2lSbVkzMEpTWUJG?=
 =?utf-8?B?T3Q1NVFWWU1zaW5XaWhxM0VYQkN2Zkk1MjZTRUcyemhTS1NpL0ViSGhhelgr?=
 =?utf-8?B?VEdxMlhUNWNXQmcvNmM5NGNFc0hhMXFYOEJya1JiL25KeFJXYzlhVlNBV1Jj?=
 =?utf-8?B?Zlh1ZGRxMWhvdTVHMHIxUDZRK1d3eWJWS3Q1WEw0NXU5Ny9EeWZ0VmdVZSsw?=
 =?utf-8?B?TWc3NDhyT1dxYXF2OVhDQ0oyS2QvSSs2am1mZXpQTUZKTGxwOW1YdmlUV0FT?=
 =?utf-8?B?TlR1NlZDb0JaZkpkaXJ1REFpVlNhdGlBYTliK2JXUGxISE9FbVFTdlFGWWp0?=
 =?utf-8?B?TGhGWmZsVHlLQkdsVnc5QUdHckRsaTNockRWckpjU2w3WkN1Vm5PMDd1QmEv?=
 =?utf-8?B?UkJ4aythZUo2RWg4TVhET3pXOFRzdTlaR1NSa1pEZDExWkxYMjB1RmhoUWJ1?=
 =?utf-8?B?Vm9OV1dDaGJpNnlSK2lKcFRkMWZMa1JOL200VFU0MU53TitYRlhTMzZoRXNM?=
 =?utf-8?B?a1BCZ3N4bHBSUkFCOHMyYWpKUlJzdkJaZFJWdm1GMXFXR1lnaXpXZzlvbWw3?=
 =?utf-8?B?cEFGN3QzdEJLaDVLd1FITlkxNnVVdHo3ckx6NzN6MGJvemNwejZ0ZlJNSTNh?=
 =?utf-8?B?bkx0QjYrM0ZaZ0F2QzlJbGxob1VsS1R2b2VXOTVzSDZmUmFBV0FkSWk4M2hu?=
 =?utf-8?B?ZWRBYWVJVndzcHdPWitLWjYvQitrWkUrNzA3dXZLV0lLWmxuN3ViNENEcjZD?=
 =?utf-8?B?VEtrQkxGK0ljcFRPL0FQNXdDQ2k2dkQ0djlhUFpLM25aUElzY2ZjWkhoQnNY?=
 =?utf-8?B?T3AwZ2R0UWV5eWREUG51dDdWQkdxTlEvVUp2dXdTeVZGRXFKSnNsM25nZlQr?=
 =?utf-8?B?ZzhwZDU3OG9Md2M4SXpGbW02ZUo5YjNLWUhaR01BR2oySkllempYUktSTHpv?=
 =?utf-8?B?TkZjTk1xS1NBU2kvVlpzV1dXZ2JSM2dmNDY0aVVYS2NTSWVWYXM0M3JQd2dm?=
 =?utf-8?B?ajEwaWJKSTNaYUFKSWpzb1VoN0NQV2d3OWtQV01vSjM1R1dLM0VKOHhrSjc5?=
 =?utf-8?B?eCtOZlFGZ3ZBek11NmVLNEEzdHFsMkJZYmdmMzZoV3llLzllS2o0RE1GOXFV?=
 =?utf-8?B?aVlLUi9nYzdqS0lvd3RFN3o1TDd5QlZNRWtpRWYybmJkZXdBeHNqbU56QXZr?=
 =?utf-8?B?Qk5nL1JZQlcyRDVlRTNwdVRzMHRjenFVQ1BWZGUrQ256SU9uajgyNWtRa2V0?=
 =?utf-8?B?OFNuNWhhU2R4VjJMZW44Z3BGMkFLcnFKUzlIWmJQdEZJVUFPejVFMzJORHNp?=
 =?utf-8?B?VzJKR2pIQXB2TFdOcmV1UHNCNVJlbTIySHY1NEF2TThZdk5ZeHdGc3R5TTNJ?=
 =?utf-8?B?bDNYYjBkem91Vmw0K0FMYzNseGZUK29tMDcxYnBKdWkyT1ljajFVeU56MjUw?=
 =?utf-8?B?ZzFNSW9LdUZrYUNUTC9aVnRBL0d2Uk1oL3ZlUmVTamZjdDYwenVPVVE2eTZP?=
 =?utf-8?B?a2dKdTVHQklMclpFcTM1bW1XYlR5Syt5NFppbnA3aE5yd2NXK0JVTnBtbnlJ?=
 =?utf-8?B?OVdQdGhWdTVsYUhhYTh6M2hlNFRQV1R6MjBWVVJTSHNUM1RzWXNMdnpTNGFt?=
 =?utf-8?B?RnRJRE14NGlPei9BdlNaQnlKRytveXFPZU9TOUdSRzFUZFFuNitUU0hKQmxJ?=
 =?utf-8?B?OVdleW0rVGN5R2UrL0o1S3FQNjlxNUFGNG5Rc2RQeTdBUjgxYXA4a3RzRjVZ?=
 =?utf-8?B?U0taUWFjcS9yQUlwU3RyeFRINzM2dDZDSUZibjBMS0Y4V1JZM2c1T0FnZHFu?=
 =?utf-8?B?Y2dWb1pBTXlHZmhPamZEWG5PK1Q3S1NBYkt5bFQ4cmpUcXRkY2dFZnE0ZFNS?=
 =?utf-8?B?WUFuRVNTRmRBVEpvSkZmNmprbjYwTnpQbnhWYk9rR0FzdGQyL2tPdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oRon4ofoQq7wQ2+UYe++pQuVypfdNHLJmyD5w6jzEp13gd27vvjJeqHJTnHBwSYT772KF8o5KtlWyozNtq4tuHWTAG6bd6szhI9mhA2R6LLViQ953ib9nBQcUMhpORf7W4S+ApzElPOiqYvHdMWkSfIvStz9x5bNuyYnIk4H2VPvBYi9+eds9Tt+t20s60XAa3UT25YfnCQJl89KmQfObD8zpcYssHHJwC6IYzfqqGQzmF7bbRsBBTPdPtvmtedP27LwIJ3+xoEao0hsQv1FdeX2FiZ2COyelW/xDYsxGbZVed4DwFoZAyEeIV6lqmRMXz1QHwGravf6TylsYECx+Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9239f88-d40d-4dde-9877-08de8521e74d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 19:09:39.3826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agYA80BKjTv6732a4SPx3iCiYBe+wguB8+jIC4pruY2dqlykELHFof2e1m0Z4/KeyYjRTJ+KCRlQ6c/dcrYMWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6015
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMTYsIDIw
MjYgODo1OSBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBr
ZXJuZWwtZGV2QGlnYWxpYS5jb207IFNoYW5rYXIsIFVtYSA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
PjsgVHZydGtvDQo+IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+OyBKdWhhLVBl
a2thIEhlaWtraWxhDQo+IDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPjsgUnVobCwgTWlj
aGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+Ow0KPiBWaXZpLCBSb2RyaWdvIDxyb2Ry
aWdvLnZpdmlAaW50ZWwuY29tPjsgVGhvbWFzIEhlbGxzdHLDtm0NCj4gPHRob21hcy5oZWxsc3Ry
b21AbGludXguaW50ZWwuY29tPjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyMiAwOS8xMl0gZHJtL3hl
L2Rpc3BsYXk6IENoYW5nZSB3cml0ZV9kcHRfcmVtYXBwZWRfdGlsZWQNCj4gZnVuY3Rpb24gc2ln
bmF0dXJlDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIHN1cHBvcnQgZm9yIHRoZSBh
dXhjY3MgcGxhbmUgbGV0cyBjaGFuZ2UgdGhlIGZ1bmN0aW9uDQo+IHNpZ25hdHVyZSBvZiB3cml0
ZV9kcHRfcmVtYXBwZWRfdGlsZWQoKS4gVGhpcyB3aWxsIGVuYWJsZSBhIHRpZGllciB3YXkgb2Yg
ZXh0ZW5kaW5nDQo+IGl0IHN1YnNlcXVlbnQgcGF0Y2hlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpZ2FsaWEuY29tPg0KPiBDYzogSnVoYS1Q
ZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gQ2M6IE1pY2hh
ZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPiBDYzogUm9kcmlnbyBWaXZp
IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21h
cy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUvZGlzcGxheS94ZV9mYl9waW4uYyB8IDU4ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPiBpbmRleCAzMzFm
M2MxZGE0NDQuLmZkMzcxNTcwOGM4YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkv
eGVfZmJfcGluLmMNCj4gQEAgLTQ5LDMzICs0OSw0NCBAQCB3cml0ZV9kcHRfcm90YXRlZChzdHJ1
Y3QgeGVfYm8gKmJvLCBzdHJ1Y3QgaW9zeXNfbWFwDQo+ICptYXAsIHUzMiAqZHB0X29mcywgdTMy
IGJvXw0KPiAgCSpkcHRfb2ZzID0gQUxJR04oKmRwdF9vZnMsIDQwOTYpOw0KPiAgfQ0KPiANCj4g
LXN0YXRpYyB2b2lkDQo+IC13cml0ZV9kcHRfcmVtYXBwZWRfdGlsZWQoc3RydWN0IHhlX2JvICpi
bywgc3RydWN0IGlvc3lzX21hcCAqbWFwLCB1MzINCj4gKmRwdF9vZnMsDQo+IC0JCQkgdTMyIGJv
X29mcywgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LCB1MzIgc3JjX3N0cmlkZSwNCj4gLQkJCSB1MzIg
ZHN0X3N0cmlkZSkNCj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQNCj4gK3dyaXRlX2RwdF9wYWRkaW5n
KHN0cnVjdCBpb3N5c19tYXAgKm1hcCwgdW5zaWduZWQgaW50IGRlc3QsIHVuc2lnbmVkDQo+ICtp
bnQgcGFkKSB7DQo+ICsJLyogVGhlIERFIGlnbm9yZXMgdGhlIFBURXMgZm9yIHRoZSBwYWRkaW5n
IHRpbGVzICovDQo+ICsJcmV0dXJuIGRlc3QgKyBwYWQgKiBzaXplb2YodTY0KTsNCj4gK30NCj4g
Kw0KPiArc3RhdGljIHVuc2lnbmVkIGludA0KPiArd3JpdGVfZHB0X3JlbWFwcGVkX3RpbGVkKHN0
cnVjdCB4ZV9ibyAqYm8sIHN0cnVjdCBpb3N5c19tYXAgKm1hcCwNCj4gKwkJCSB1bnNpZ25lZCBp
bnQgZGVzdCwNCj4gKwkJCSBjb25zdCBzdHJ1Y3QgaW50ZWxfcmVtYXBwZWRfcGxhbmVfaW5mbyAq
cGxhbmUpDQo+ICB7DQo+ICAJc3RydWN0IHhlX2RldmljZSAqeGUgPSB4ZV9ib19kZXZpY2UoYm8p
Ow0KPiAgCXN0cnVjdCB4ZV9nZ3R0ICpnZ3R0ID0geGVfZGV2aWNlX2dldF9yb290X3RpbGUoeGUp
LT5tZW0uZ2d0dDsNCj4gLQl1MzIgY29sdW1uLCByb3c7DQo+IC0JdTY0IHB0ZSA9IHhlX2dndHRf
ZW5jb2RlX3B0ZV9mbGFncyhnZ3R0LCBibywgeGUtDQo+ID5wYXQuaWR4W1hFX0NBQ0hFX05PTkVd
KTsNCj4gKwljb25zdCB1NjQgcHRlID0geGVfZ2d0dF9lbmNvZGVfcHRlX2ZsYWdzKGdndHQsIGJv
LA0KPiArCQkJCQkJIHhlLT5wYXQuaWR4W1hFX0NBQ0hFX05PTkVdKTsNCj4gKwl1bnNpZ25lZCBp
bnQgb2Zmc2V0LCBjb2x1bW4sIHJvdzsNCj4gDQo+IC0JZm9yIChyb3cgPSAwOyByb3cgPCBoZWln
aHQ7IHJvdysrKSB7DQo+IC0JCXUzMiBzcmNfaWR4ID0gc3JjX3N0cmlkZSAqIHJvdyArIGJvX29m
czsNCj4gKwlmb3IgKHJvdyA9IDA7IHJvdyA8IHBsYW5lLT5oZWlnaHQ7IHJvdysrKSB7DQo+ICsJ
CW9mZnNldCA9IChwbGFuZS0+b2Zmc2V0ICsgcGxhbmUtPnNyY19zdHJpZGUgKiByb3cpICoNCj4g
KwkJCSBYRV9QQUdFX1NJWkU7DQo+IA0KPiAtCQlmb3IgKGNvbHVtbiA9IDA7IGNvbHVtbiA8IHdp
ZHRoOyBjb2x1bW4rKykgew0KPiAtCQkJdTY0IGFkZHIgPSB4ZV9ib19hZGRyKGJvLCBzcmNfaWR4
ICogWEVfUEFHRV9TSVpFLA0KPiBYRV9QQUdFX1NJWkUpOw0KPiAtCQkJaW9zeXNfbWFwX3dyKG1h
cCwgKmRwdF9vZnMsIHU2NCwgcHRlIHwgYWRkcik7DQo+ICsJCWZvciAoY29sdW1uID0gMDsgY29s
dW1uIDwgcGxhbmUtPndpZHRoOyBjb2x1bW4rKykgew0KPiArCQkJdTY0IGFkZHIgPSB4ZV9ib19h
ZGRyKGJvLCBvZmZzZXQsIFhFX1BBR0VfU0laRSk7DQo+IA0KPiAtCQkJKmRwdF9vZnMgKz0gODsN
Cj4gLQkJCXNyY19pZHgrKzsNCj4gKwkJCWlvc3lzX21hcF93cihtYXAsIGRlc3QsIHU2NCwgYWRk
ciB8IHB0ZSk7DQo+ICsJCQlkZXN0ICs9IHNpemVvZih1NjQpOw0KPiArCQkJb2Zmc2V0ICs9IFhF
X1BBR0VfU0laRTsNCj4gIAkJfQ0KPiANCj4gLQkJLyogVGhlIERFIGlnbm9yZXMgdGhlIFBURXMg
Zm9yIHRoZSBwYWRkaW5nIHRpbGVzICovDQo+IC0JCSpkcHRfb2ZzICs9IChkc3Rfc3RyaWRlIC0g
d2lkdGgpICogODsNCj4gKwkJZGVzdCA9IHdyaXRlX2RwdF9wYWRkaW5nKG1hcCwgZGVzdCwNCj4g
KwkJCQkJIHBsYW5lLT5kc3Rfc3RyaWRlIC0gcGxhbmUtPndpZHRoKTsNCj4gIAl9DQo+IA0KPiAg
CS8qIEFsaWduIHRvIG5leHQgcGFnZSAqLw0KPiAtCSpkcHRfb2ZzID0gQUxJR04oKmRwdF9vZnMs
IDQwOTYpOw0KPiArCWRlc3QgPSBBTElHTihkZXN0LCBYRV9QQUdFX1NJWkUpOw0KPiArDQo+ICsJ
cmV0dXJuIGRlc3Q7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQNCj4gQEAgLTgzLDE1ICs5NCwx
NCBAQCB3cml0ZV9kcHRfcmVtYXBwZWQoc3RydWN0IHhlX2JvICpibywNCj4gIAkJICAgY29uc3Qg
c3RydWN0IGludGVsX3JlbWFwcGVkX2luZm8gKnJlbWFwX2luZm8sDQo+ICAJCSAgIHN0cnVjdCBp
b3N5c19tYXAgKm1hcCkNCj4gIHsNCj4gLQl1MzIgaSwgZHB0X29mcyA9IDA7DQo+ICsJdW5zaWdu
ZWQgaW50IGksIGRlc3QgPSAwOw0KPiANCj4gLQlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShy
ZW1hcF9pbmZvLT5wbGFuZSk7IGkrKykNCj4gLQkJd3JpdGVfZHB0X3JlbWFwcGVkX3RpbGVkKGJv
LCBtYXAsICZkcHRfb2ZzLA0KPiAtCQkJCSAgIHJlbWFwX2luZm8tPnBsYW5lW2ldLm9mZnNldCwN
Cj4gLQkJCQkgICByZW1hcF9pbmZvLT5wbGFuZVtpXS53aWR0aCwNCj4gLQkJCQkgICByZW1hcF9p
bmZvLT5wbGFuZVtpXS5oZWlnaHQsDQo+IC0JCQkJICAgcmVtYXBfaW5mby0+cGxhbmVbaV0uc3Jj
X3N0cmlkZSwNCj4gLQkJCQkgICByZW1hcF9pbmZvLT5wbGFuZVtpXS5kc3Rfc3RyaWRlKTsNCj4g
Kwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShyZW1hcF9pbmZvLT5wbGFuZSk7IGkrKykgew0K
PiArCQljb25zdCBzdHJ1Y3QgaW50ZWxfcmVtYXBwZWRfcGxhbmVfaW5mbyAqcGxhbmUgPQ0KPiAr
CQkJCSZyZW1hcF9pbmZvLT5wbGFuZVtpXTsNCj4gKw0KPiArCQl3cml0ZV9kcHRfcmVtYXBwZWRf
dGlsZWQoYm8sIG1hcCwgZGVzdCwgcGxhbmUpOw0KDQpXZSBzZWVtIHRvIGlnbm9yZSB0aGUgcmV0
dXJuIHZhbHVlIGhlcmUuIGRlc3Qgd2lsbCByZW1haW4gMC4NClBsZWFzZSBjaGVjay4NCg0KUmVn
YXJkcywNClVtYSBTaGFua2FyDQoNCj4gKwl9DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCBfX3hl
X3Bpbl9mYl92bWFfZHB0KGNvbnN0IHN0cnVjdCBpbnRlbF9mcmFtZWJ1ZmZlciAqZmIsDQo+IC0t
DQo+IDIuNTIuMA0KDQo=
