Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1065606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GhKWsAQW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B7510ECDB;
	Mon,  2 Nov 2026 10:50:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5FA10E61A;
 Mon,  2 Nov 2026 10:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793616643; x=1825152643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y8mXd/siqLj0OqyAVYxnjqQJ5eiqetgZugEaA1tvUSI=;
 b=GhKWsAQWqdtFqUnQAP4jZeiFhjV8UZUrwTouGPzfC4MyujsorB3lSkxg
 1ANGDe8lR9/jLWOdqi7UZ0lZ+rDBxBEUB2dXn5bWkLeIk7JTEhMBw/DBO
 F2szErse9LBMlKpNvppBhNHlkoSBjUbfxs5gd4p0moAZsWQS9tX7FYuOb
 Kp5LBzFRs80ZlxtHtyj1O5DsECOXZmPv4ngLw2hZ9NQQqb7YMMJm5ZUXa
 ynB+wkKMcyRx/AwFy5Z8v5YDsJRoO4OOoI/U4Vtlb9c2DJcvqPyib9hcY
 eezWCjdSpAB3TwePGt7IKIBjwlaOwcfuWm0O3Rpu/D+b2Q7GOIkObH/FD A==;
X-CSE-ConnectionGUID: 0mvBr0FLTjepsCZcuRkaAw==
X-CSE-MsgGUID: uWrf3c8eTtSCbMpujfnMOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2336145"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2336145"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:50:43 -0800
X-CSE-ConnectionGUID: 3l2ERpp2TbSxVWx1U1wcQw==
X-CSE-MsgGUID: yxkOc63bQlOHNQJfSqHJuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5944469"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:50:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 02:50:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 02:50:42 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 02:50:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgEO+Ies2zafY3xc5gVAKSX9U6x3dCe1MFFDgPz0QdNLnCnH13kx0/YpTsQUDYlNLXNkbqFG9JYj0WyJOGm8RNZYiDztOZ83/dLwTQmY9SaNbiBXHHQD+gh4ASDO6EVd8TZfx1Kj2i/1UYEhYpM+isCNt5H1pJkVgrAbV3yJqpQWXEUomrcKbqKjl+qpfxx5HAGnQPmTm1cXWyEi2mEf6TtBYL6e8MtWMD9PhDIel4qHaxXTebD6CUhpRUWWy5PU26cwpYMCKXMGoF+SKwZxUX9OgmEnlOy9phoDK8RxC9l1YwyYCq8sFLsjryu0+GC4RGBWrUxRG740z++ilVdlSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8mXd/siqLj0OqyAVYxnjqQJ5eiqetgZugEaA1tvUSI=;
 b=Nfue9xVev1yEtkF0+2jkpisvH4Fpodr9LiUYewDzOEOt1+wqoc9BvmEKjSOcjO4CnocIyjTGdApNF1sLOqLc+7MhgJJ+m4gjNKqalwjcNUKYrRSTXqOL8idHNr0O4w9YWNtfALnQ8BiOH1CHv+/tMB6zx1CaOUaaiC+xo/eymox1DSpNaIeSNBn1r5vRTxMPb1CJnt1A7D5vse9wwlPymxTxIEmuN2bq1lY1Qjru7SgTV70auh6u/JhYR2b6sVLhw84vWonpJeyYJnkjgon1vd+wafgpVKE9wPvEjz9VV1QiHXmkFcgOKRc7GI7hZFhESDTJs43HiNuwsW5xm9iiEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by CO1PR11MB5106.namprd11.prod.outlook.com
 (2603:10b6:303:93::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:50:38 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:50:38 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 3/6] drm/i915/pps: Reset PPS state after TypeC port init
 on resume
Thread-Topic: [PATCH 3/6] drm/i915/pps: Reset PPS state after TypeC port init
 on resume
Thread-Index: AQHdZ5kGAlSI8Al1K0m6BUp3K4VUubcaoLUg
Date: Mon, 2 Nov 2026 10:50:38 +0000
Message-ID: <DS4PPF69154114FE648853CDC9169E1B744EF6A2@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261029113017.618286-1-imre.deak@intel.com>
 <20261029113017.618286-4-imre.deak@intel.com>
In-Reply-To: <20261029113017.618286-4-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|CO1PR11MB5106:EE_
x-ms-office365-filtering-correlation-id: eafa7923-ee58-46fb-db24-08df38cf218c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261021123027099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|261022075727099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: bC5j1JU5QTXgU/100+NgVVbnwUGGvzJ+/7JJTgnXKtWFVbi5wn+Y/YqQ5eOGJjbYipB6TH5GfHpZznqw4pk5cGsqWW3HVT2+/QXcPVAxEdV49al2hEOHujBsxIAg7WqEeYNcUkTp99oXy7+0FH3QUiXLexKap6pU9MXpgZm7V+dV9BJE38ccy0ajEN1x9JH8ppaIv6zsOtKy5IrSljYFkvFjVf+aU3dPbmZqhCHncWqHMY6lROcC/szIoJR78s2NPeYlqp6BMUi4qic8UWFR/eackWxAX4n5VF2L7HAzRxWrO/fzKHd/HkmSj50LJPk/ahXBgePOgBRT2bx2Dk04YbasMIG1BvmXCag2stMymoJYOz4QM7AME19aO/pmEKbk4ZBhGhQQoncvE5ZcOCVNnWrt8GNBI4k4Oy3myAposWFZqwvDQahGcJeYTOFwA8iBPhHTqDNIErV10qEzBs3RGolxRVG+10NWpNdLV8woYUvQ1G4nIiZ8sbgk9eTfZDgXUplKg3YsWDxxtO8LU6ff0Cvb9hFHyyP1wofyVuBJUHv4e6fa/SzOvh4B+mO2m4jzT6R1RUOSUtA7k6IBoP1AJbu7nyrUl12OH7fXaG6cKdVvYYTxiHEaPG4VE8+Aj+sKEmu4uuHYGNrktKrb5TUPQ0LmfWel3NJx+o5ZMomEsMX0Pb0CVOgKw9KbP9rtdukKhTUuYEbGZMl/8f89DYO0I73Rg/TdIf4YE6zN4Ldh91A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261021123027099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(261022075727099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUgzM3U0Ri9jd2RrbEZwTUpqYzl0djVxZEJtMnhyejJRcDNvaElURDJuSHEw?=
 =?utf-8?B?eHoyTjN1Q0pIRUdKNkI3cnY0UTN2MFB6YzkwUnJNNXhqNjZzVHhxVUdlV29r?=
 =?utf-8?B?V2EyejlsWTk5UWdzZzRhUGI5TXU2MldISDd6bWgyYmtZSEJMUzBEaDRXTmdI?=
 =?utf-8?B?KzRHM2M5UE95b1FlcVc5YzM1Ry9pRFZMWjB2bHVtemxoYUsxZVpqdTUwY2xW?=
 =?utf-8?B?VXVLdGtqcC9CNXlNTk5HWjhyQ3RHWlg2cEhBVzJnOTBPd243MVdGOWRTaDVP?=
 =?utf-8?B?UGpLSS9EUmNhaDF2QjNjSmRNeGFlT05LdzVOVzk4WmU3ZkdSdjBzVmdNNW82?=
 =?utf-8?B?U1NwQUNmeit0ODBLR0pORjlzY2IyQzNZL3R1TkRqVTV4cmduRDFabDIwWVBt?=
 =?utf-8?B?eHczdnpudkpycVZMeTNZSFUyampoZXZhTFBlNFpkZHpQNW9JVHhPak02R0JY?=
 =?utf-8?B?aE01MDNjZjNpOEUyQTErN0FBdHI2UUZkUjl3dmR2OE9wYWNkMXRTcUJTdGh0?=
 =?utf-8?B?Zll3MkZvNnZiaHg3MHU3U1l3eExPN0xTWlpWY09VdUVydW44YzZ0ejRUZk5Y?=
 =?utf-8?B?SERnc3NSUWEvMUN1K3ZZSE9CdFA2L3Njb2NZK0R5VENTb2tqd1FtcGdxUlhK?=
 =?utf-8?B?cTFwV1R3STAxWEI5WWh3U2hacmNxU2JUdk9mZUw3M0Vwd1ZTazZjd1VaZXcz?=
 =?utf-8?B?TnVCRHNETkJXNUhzOFdTSlhZZzMvUitzaDBGN2Y1RlBMcXFabWJscVBtc3J5?=
 =?utf-8?B?dzhrZ2tHTzF2aGFkaFRTT2NEcWdwL2NsK040dnZaMm9nZmg4dnY3NWVreE9Y?=
 =?utf-8?B?TGVBelA2clJhTTFyTWNzZ0dHcEJDSXFsVEQ1TzF0L0k5MndMWnV5dUIyMGgv?=
 =?utf-8?B?R2hMa3BvVm51WU8vSU1ST0V5MFpYUWpOeTMxS0Y1WDJMVlZ6bXFMdkluSkor?=
 =?utf-8?B?UW52MFZKaXd0Rm91UVRVK0hLaHB4ZURWR1VSUE9uVHlCZTJldjhqTVJHNDNO?=
 =?utf-8?B?NlFxMVdSS3lWQzZtOXRWSjdhRmpVK3pObS82WGZHdmpXbFhSN2hpb0wrV0Jz?=
 =?utf-8?B?RkxMUkJIK0lhc05HOXFTcXFYRUw3b3BEbXNqNVVoZkMrSDhkNmlGQWVxNFZ4?=
 =?utf-8?B?SFJBeEd2SkZOWXc0bXdacktGTU1FOW53dWFHdVpjSCtaZHE1ZmpsNWN3dmxD?=
 =?utf-8?B?YWpNUEg1ZXByS2JYZEtrZEUreVk0R1hEMGtVcDV1cXVlUDZNSC9WREF1dUQ4?=
 =?utf-8?B?QnhPYkgwMVdlQlRaZGRSVU5xOTg4Z3MvOUVrSDRzT1VUMml3ck5LajRaWCtT?=
 =?utf-8?B?STJIaGluc3BuYVovNHB4S2JBMzJ6dEdDNE9LK1JRbkJsQWdYam45M1h3d0dJ?=
 =?utf-8?B?WEVNMytwLytHZC9wRnJ2cVIvUEsyNWhwUWkwUXJ2THlnN0w1dDZvTU5vOGpv?=
 =?utf-8?B?cmxzZEJQZWpqeVlBbDN4anplZ1FZV1pRSFhrL0Q5S21oOEIrQXBYWitlZ3A5?=
 =?utf-8?B?bmJERE5XU2h1UnJ0aUdPbUFzOStPNU42dmUzdEllN2RQN1NJWDRPKzJ5amJo?=
 =?utf-8?B?N2NWMGJ0SGxXczUxRlh5MlVpUVlLR1BacWxuTVNhdjJQMVcxaWtqa2NNRkdp?=
 =?utf-8?B?V0k2NEhuSVJ4TnhOTGw1WDk1QS9yVU1ObjdIaERNdS9vNFpIeWxXbHQwZUFK?=
 =?utf-8?B?TG9nMW5USVR1NTFKR0NRNjlLbC81R3Rab2pYaGFzUEJRWGpzUmZDWjBEcWJy?=
 =?utf-8?B?Y2l6UXF6bXVIUDQ5Mnl3eDRmM1FtY1QvWWEwSFlIRCtBWDdnbmxxbU5rNkJX?=
 =?utf-8?B?cktkME8vQlF1RWhXZnBoa3lYMzU1eEQyd0Q3SlBWWWIzbEdIbG1VMjBoTlkr?=
 =?utf-8?B?eVp4THJwb0J2dSt5VGE3aEFmRFBaYUlvVjcyYjZET0h6RlBqeEJPdDl0aytR?=
 =?utf-8?B?S1RxdXR6U1FReEwyRm1Ma21KRXdqTVN6cW1ZTy9BeTlDVUZKMjRBQ3RQeEtB?=
 =?utf-8?B?WklXWWtBM29sbDU4L1VmNTZRNkZnOXI5eDRma2FTUHRDdTZiVGh3QmFuZUhZ?=
 =?utf-8?B?RzBabU1LblZJQjBYb2E0d3FySE5JUytNdUdFVSs4UDBBd1ZCYXdDbDNzckMr?=
 =?utf-8?B?aXRqczA5U0JuWTliS2FxZnhlYkJNTkZ3dkJkVnU0SXVnNVQ3S0VlcE8rWlNO?=
 =?utf-8?B?YU9qRWducUFiT0hQZS9aQlp4Nk82b1h1RUlJWExJV1pEcjRVZFdZc1ZHTnBw?=
 =?utf-8?B?VzFYdk1sNXJwWVZlQnArRi9ERmtXbmFxRHJVTDE2VkxBd2hxQVJoaktqcm9O?=
 =?utf-8?B?RDhzTjVhSmFTNU1rY2JONTZkSldvc0NQWkFvVFZrUEZ6dnZvV3lUdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eAFYAfoRoryo0dSFLM6ZDMecOcgqwBN1EGvAw1Bmj+7uEhtgWaWRzgHHO7beSNP3JLnRjG8mk29w96dJYwCi48MN5sjXZjpbWEtMHio5zPTgprtUe695OdxcsAtsBm2/mujENVPS4MFy/16pqrh5s5UjWOev7AiYeGL4LOBUyOMfm2vscanIGAPt3St/Yx5T7Bqmccc9P/8D/vTP17sy1/gocV+bKIWbQrLm5oxYgRMM1l8heFguKSJwQAJCSIv3QkgWT89ZsLDULdnEKgk8wIXLNk9qkdUQ7nP7SNwOBWc7feXNYGzPSSNSi2n+7bWSn/RncGc+rgU5gW+7JzBn6A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eafa7923-ee58-46fb-db24-08df38cf218c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 10:50:38.1871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o/mf8GlG2Qvtfmh5WMKPuPxurjT6LRc9CScJ5BrZSG1v9nzFMYt0UAj3moCuYYy8McmR7cgiCK/FI2BY3DU4IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEltcmUgRGVhaw0K
PiBTZW50OiBUaHVyc2RheSwgMjkgT2N0b2JlciAyMDI2IDEzLjMwDQo+IFRvOiBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW1BBVENIIDMvNl0gZHJtL2k5
MTUvcHBzOiBSZXNldCBQUFMgc3RhdGUgYWZ0ZXIgVHlwZUMgcG9ydCBpbml0IG9uIHJlc3VtZQ0K
PiANCj4gUmVzZXR0aW5nIHRoZSBQUFMgc3RhdGUgaW52b2x2ZXMgYWNxdWlyaW5nIGFuIEFVWCBw
b3dlciBkb21haW4NCj4gcmVmZXJlbmNlLiBPbiBUeXBlQyBwb3J0cywgdGhlIEFVWCBwb3dlciBk
b21haW4gZGVwZW5kcyBvbiB0aGUgVHlwZUMNCj4gbW9kZSBvZiB0aGUgcG9ydCB1c2luZyB0aGUg
UFBTLg0KPiANCj4gQW4gdXBjb21pbmcgY2hhbmdlIHdpbGwgc2V0IHRoZSBwb3J0L1BIWSB0eXBl
IHRvIFR5cGVDIGZvciBlRFAgcG9ydHMgb24NCj4gUFRMKyBwbGF0Zm9ybXMgd2l0aCBhbiBlRFAg
RERJIG1hcHBlZCB0byBhIFR5cGVDIFBIWS4gUHJlcGFyZSBmb3IgdGhpcyBieQ0KPiByZXNldHRp
bmcgdGhlIFBQUyBzdGF0ZSBvbiByZXN1bWUgb25seSBhZnRlciBpbml0aWFsaXppbmcgdGhlIHBv
cnQncw0KPiBUeXBlQyBtb2RlLg0KPiANCj4gQ0M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyA2
LjE0Kw0KPiBTaWduZWQtb2ZmLWJ5OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+DQoN
ClJldmlld2VkLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyB8IDQgKystLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0KPiBpbmRleCBhNDZhYjVk
M2Q3MGZjLi5kZGE5NTcwOWM3YzczIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGRpLmMNCj4gQEAgLTQ3MjMsMTAgKzQ3MjMsMTAgQEAgc3RhdGljIHZvaWQgaW50
ZWxfZGRpX2VuY29kZXJfcmVzZXQoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQ0KPiAgCWlu
dGVsX2RwLT5yZXNldF9saW5rX3BhcmFtcyA9IHRydWU7DQo+ICAJaW50ZWxfZHBfaW52YWxpZGF0
ZV9zb3VyY2Vfb3VpKGludGVsX2RwKTsNCj4gDQo+IC0JaW50ZWxfcHBzX2VuY29kZXJfcmVzZXQo
aW50ZWxfZHApOw0KPiAtDQo+ICAJaWYgKGludGVsX2VuY29kZXJfaXNfdGMoJmRpZ19wb3J0LT5i
YXNlKSkNCj4gIAkJaW50ZWxfdGNfcG9ydF9pbml0X21vZGUoZGlnX3BvcnQpOw0KPiArDQo+ICsJ
aW50ZWxfcHBzX2VuY29kZXJfcmVzZXQoaW50ZWxfZHApOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBp
bnQgaW50ZWxfZGRpX2VuY29kZXJfbGF0ZV9yZWdpc3RlcihzdHJ1Y3QgZHJtX2VuY29kZXIgKl9l
bmNvZGVyKQ0KPiAtLQ0KPiAyLjQ5LjENCg0K
