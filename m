Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEB8606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hU1yQOnJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EAB112763;
	Fri, 30 Oct 2026 11:27:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32B9112760;
 Fri, 30 Oct 2026 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793359673; x=1824895673;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nwqTla6v3uh487vtbomtOgNAJ4ZT4yXx4mA18L2/5Xg=;
 b=hU1yQOnJ7lEH32YdnNwRjaqo53rRofLFfn8aUML276uIuBDUgtWDR2F2
 jlx51qq9V2DW9NhiSwcJKaq2aoo0yojEx3D02JaIOf//5dsOovGqBSoiy
 pNlRY+2YXSKaeWPOPP5+nCtgqsGUIL6V8zsDrK2Olaapr99yXUwKobxhE
 q4uN7aryF0OkxTV0+02U/CRH8YauqiYMl5L+0mKf7dVbvFjjr9S8+PJJq
 2hcyxzXdBG4H91+Acx+Hazx/6v/P1vaIWbiQe3BxjhogkHDY+69SPBQLq
 ABCdtLXMUukYgSRdjd0uTVk8jSeI76AW31vgN6pM5jh5mAwPPNbKuGNxw Q==;
X-CSE-ConnectionGUID: Y71PMs8uTc6MW2K0D2Lv1Q==
X-CSE-MsgGUID: m//tFciPRD66y18c538dJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2021640"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2021640"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:27:52 -0700
X-CSE-ConnectionGUID: FeWzkWLtQZ607uj0ZNF0IA==
X-CSE-MsgGUID: mQ+dWCNQTxapz7xl62tyAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5736929"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:27:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 04:27:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 04:27:50 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 04:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldaXU/cPvr8zC+/3D75zsIrhnt5LjmmhDvu1nIi2nOE4rPnlx2jQaVhsNWWjCTs7gfm8sXhCn2mqPEzG3T+OA1U1HAVAYIrls91/pkY4HwxAQpFJgwsmU6fmP74w/50SMQfb4itm4562M3xMMXujxdmZMmfF89R9wNWA03/jTERNXw/W5a7B+aNTTdDIzSctlfjeecXDUrdtO2+LLB6NpxdPROmlY2dnYheV8BKPfSZiv+aFusk5R+lKsAZiYHubLzxEVkxSX8DQfouIxviLbMgc4ipzWKuxz3n0GhrXu0qgAINPdgoM9t0hKoSMtKW/TIwIDJsTs9sUcPK/azGdqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwqTla6v3uh487vtbomtOgNAJ4ZT4yXx4mA18L2/5Xg=;
 b=UfeEA13nbrg+s3Jf+ycq21FjZbLKeia4OdvVFfTjb8R1pTWobj6cMhAWpE7dZRWuq6Bu1I1g7cqmCSdx8/vlmvkPjMQIqZwS1i63aZeMc0bmIrxj7YCHdOKoxLHag504X3uqk3nJhO3wn8qQAdj9XwmWjOR0hVa6+ixZRdI+MDqj+jrpQxvEkbEuldVHAtGXQUzqRBT6dn6lcsi41Hbci2/YiUNo4N/PTU2Pk7iXB+29iPb+Kx2wBVDeVpbouCBqn4eqsIslf0FOyuw45inXYnTTeqcg7BXbcUvUVNElfYKHVHmIoI9HuVz+aDmUgUqpo7yS7c8UTPgAMyTG5U/jew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by CH3PR11MB566309.namprd11.prod.outlook.com
 (2603:10b6:610:34c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 11:27:49 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 11:27:48 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Coelho, Luciano" <luciano.coelho@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v2 1/3] drm/i915/display: don't write Send Busy back when
 toggling AUX power
Thread-Topic: [PATCH v2 1/3] drm/i915/display: don't write Send Busy back when
 toggling AUX power
Thread-Index: AQHdX92WYQRbJrCw50mUyEhwNRJfircWAucA
Date: Fri, 30 Oct 2026 11:27:48 +0000
Message-ID: <DS4PPF69154114FF5608D346DC3454101C6EF6D2@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261019150226.734375-1-luciano.coelho@intel.com>
 <20261019150226.734375-2-luciano.coelho@intel.com>
In-Reply-To: <20261019150226.734375-2-luciano.coelho@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|CH3PR11MB566309:EE_
x-ms-office365-filtering-correlation-id: a703934a-35e1-4db7-f68c-08df3678d3ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|10070799003|1800799024|6133799003|10067099003|18002099003|22082099003|56012099006|5023799004|11063799006|4143699003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|38070700021;
x-microsoft-antispam-message-info: imZNgacjHwxsGd33zN562/ydSY3ICgLndwEcUKAihBHRwddPlJUJxxVk/4x4dYq0AHtfLCCYvgwIgKHkMbB+0sIYPZe1ZOZLJpDYnjpalKyMiAW5KYAU5ohPS1Tvl06C8Mpn1MPrqvJA/t1q4oBN7g/h29mS31FOkMbSrx85s1uRcr4xmXDwbgpDvsXmI3S+mIlBmMZzLg2ZnfmO9s2g/84snkh/KGy5ab5S46tGDQITbCPgaiocKkWLMCrX80kCk9ShDv93c5zg+Q09GQlfazUxAM+OaO0BCYcY0RYeGBemHgW1nKCCWIiU9F0lrd8R38u3FaeX4fQkMSZE6VBSO9EK6o6+SlRiWbC+PZPH8N+9i5ntYA4nGp9V2oCNu7mBSDnkkEHpqwfId9euf7XGvBxWVZCTy5Z8MBFgQeEoYf4l94Cms7LLb2mabccSK1UEelhIrbVV+8ZkQzObojevisBuCOiWYSjPSJ9oAz2UMEK5i6qjVhUnboFdW1oSw+HKQEyqi0KY3GrcJdHa65TeTaYYK0gjIZGaasVtHnEuouQZejTpGNikPsET3XAQhWWk1rfWjeEcuMdPSv9NgFmnYb+WRgvzaM30HFn6yLhKYQsWTRTovfWJzrxSCTfLHm0NI34zo3cvIhdXefalyLAhn+E7A/3XI3VJPQ7LuVMx5KfaV1z5ofI/ojJPYeM4aSCNS7B+8I1FsMwWlAjRhlHZTUPmXfrViubtg/olObCDKvA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(10070799003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(4143699003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVNDU1hVYWc0ck00T25Ra0Z4eENiMHFqcWdUSSs0ZUVvNVJIckpCSGxNVStW?=
 =?utf-8?B?RzhNNWVzeU90TklCR2hVM1dRK2xtNXJLbHVFK0FDd04ycjJRMmtWUEd2eWpq?=
 =?utf-8?B?RjRPdDdUdmFwTDZ2bWpSQ3NiU3NBMUpLSHQ3MjY0b3E0dnhLNVI2OGdNb2J6?=
 =?utf-8?B?Q1NCeUFFSlV3THozS0pWYjJ3T08yTzRZQ203T05kYjArdGZOMVpTMWYvOEl5?=
 =?utf-8?B?cklEU1JCSlgyNTk1MzVMN3FqZmtCQ2NPRVMyNHpoc3pQMmF5TVFRU0pFajRL?=
 =?utf-8?B?QUxQK2pRMHlKUlpkbmkvUlV1enZxS0VhWDBCU2ROTEtsRTRJYVo3TWhyTVp4?=
 =?utf-8?B?ZmhiUmV3UjA3anJreVdsR3lwNm1XZWhRSHBYQmNwdzZJb3hOb1g1SFp0dllH?=
 =?utf-8?B?MVZiY0pGYW1XNmFHU096UkVmTnBUVVBuK2UrbElkSjFjY2lCT0h2WEpqM2hw?=
 =?utf-8?B?ZGZkcXJxOFZYcFZGb0JEQWpXS3BpNjN1S3ZCM0JqNno5dUx0MzBLaWtqcFRm?=
 =?utf-8?B?eVNCK0FmamJrMU50aWZrVytzYUZyaHFoQ3RRN1dYbUt2UmNYdEt6Q3JWb0xi?=
 =?utf-8?B?M2ZnRFRLekJaWW9sQnZpQ1dvSUVjKzNqTnYrcU9zcDFza3JqYWtuWHJyK2ZI?=
 =?utf-8?B?K3BWOE5vZkREMyt1L2NFajlkWU13cGEwMy9HblF0bkxiYmJob1I5Vzd6Vmwy?=
 =?utf-8?B?VDAySndIcUllYjJQRlNKNkpqVTVUTlNtZ1FYYU8zajMxbXJzbDVtb296dGFq?=
 =?utf-8?B?SHVKOWZUS3JzVmt0VW42aXVEYktsMlM5a1NqYmlGekNFM2NDaVZOR1ZjY2dM?=
 =?utf-8?B?ak16bVdQbTI5VlQyMEFiWWg0WW92V3NYNXJzcUx2R3NIOUJnTzNzanpXWElo?=
 =?utf-8?B?aXdoaWYrNWRCUVFHVHozMWFiVTlNUXNJd1dPNHlTNU9VVExLMjlRRi9SaDlu?=
 =?utf-8?B?aGtVOVJtdlg1aW5sVVRHNTBIN29oeFE2VU9sOW43MW1IVU1pQmdKM21WUjhN?=
 =?utf-8?B?L1crMGdkUlBYTkFVSWgvMUw1bG5hWVN4elovWTJkUnRwL0V6RUxNRmlmYXM1?=
 =?utf-8?B?a1pZY0xKREprQmFYT3crN09DcnpsYVdaVDg2QUl1ZkxHTmhkSXZiY0VlMXpR?=
 =?utf-8?B?L2lJYzNWb1RwYTdkR1FJVk0xSVRZKzhvNFg5b1ZBdmJSSjI2dEVmSWtUcWFR?=
 =?utf-8?B?SmJML2trTzh2ejNvdUtJYlRhRmlKdVl0ci9BcDdZLzliNE5ROE81MCtJdkM2?=
 =?utf-8?B?SFJreHYwQ3J6K2NYVWRFY1pBbUpNSU5KNnIyb1J3YnFIRXpvb1BGb3lSU2xP?=
 =?utf-8?B?ZzZvVDZQVDQ0K21SWlhETlN2ZElSR1N0YTJjRE5XME8vK29qQnU4TXN4YlJL?=
 =?utf-8?B?M09GV2R6S2p0RXk0OTdvOFdNSkt1NTIyM09hNTRpZWo0UzByOW5ONm1ZS1RY?=
 =?utf-8?B?M0ZtZVpOOGc3V1k0dUlTMjlRS3BaMytRcUlkQ2IrK3YrWnV2REZuNE0xUEhX?=
 =?utf-8?B?MVEyYUhKZk5VT1hmMG40T3ZKQ2ZKVFdYNlM1QWNrZjVDZFZack9kZ3plSXVn?=
 =?utf-8?B?bHVKK0JHUHYxaVFxeGc2ZVcrdjBySXUvZTZwT2xrZFMvTFFWaWhNZkZNS1Qz?=
 =?utf-8?B?Q2FiOExYZ1F3Y3FJaWJQbWI2VXR1cGNiRUNDd2oxSEtlV0VUZTRtUXp3Mzlp?=
 =?utf-8?B?MXRURDc0OXFVWHlES3pyMTA3RnlQTk1iVlczcWsrOUVlKzJvSkRyaGVsbG1T?=
 =?utf-8?B?WTBiUHVrK0V1SHhoYjNqbUpxekRWSzQ3aFJYRG9nSVZYSUZTeGpHbklwcktM?=
 =?utf-8?B?TDNGZDR0SFE3YjBLa01jVjA2dW84VDdQUlN6dEVaQnNWVkkrYnJrdEpiMVBy?=
 =?utf-8?B?MVRUbDZlUE9rMFlsa24xNmpNcVkxNS9KMlFjdkcxazVDOXlwYXJLUXBFQ2o0?=
 =?utf-8?B?RXhnQ21paVU2TGpGV05nMHMvc0xtSmFEdktyNFdhZHFPRUVRRzh1SUZhMzhm?=
 =?utf-8?B?OWoxcVc5WVNORENvdTRFUkh0NWxkakpsT1EzN1ZZenlWWGcvaGdiZk5KT1lu?=
 =?utf-8?B?V1QvcjJrMFpHVDMveHZmbTRMbmpjSzJ4dURKZmVURC9rdE5ueStwQ004M3cr?=
 =?utf-8?B?ZmZzczNWM0FKYnQ0VGNISkVIS2IvbXJTTzRPUS9mcFd1c2d6RS9MSXU5K045?=
 =?utf-8?B?azV3NlZtVHlJeXFzaStQTlhxMm5JM0UxNktxNkVFM2lEUFViRjZ3QzBvTUlF?=
 =?utf-8?B?citXWUJmZWFVc1l0T1J6Y2RHMXNVVTZncmloanRrVVB0VlAwenF4NVR3Zmtw?=
 =?utf-8?B?bURzV2xnOVZORG9vZWtmZ29wNXZ2L05BVnIvTFBJU00wWGdqVy9IQ2k1WVBH?=
 =?utf-8?Q?8v9qcY97bdaKmDNryp6ln8fJUcql5uq2W/3oJE0AXAyHy?=
x-ms-exchange-antispam-messagedata-1: 1cYK5o8eUCL/7w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UxBwqOwZBjiy7Ir+VRWzsDxbSGLefal7dvXjYUyjUAk9si6wJcd+H2EoHElTLpL4QJ2/zxWvWRwYtrvOITPzDQjVmb7RqxMAuf2i8p4VpObqZcpFPwaBfNiJVh3jANKQ5Fa0bjuqAX2IA3oChzj+962N+sKppnhQI4HzW9XPDAy4gbhNd3StimYOM7drtktdFNKnhKF56mxLPG5FYp7qVwWbvuM9kUZTccqbbTaJ3uTiEKUBgOYbqkkCNH4ceiFRJsGCOOh2hFs4tEnYlEXW9D/NQfH32pvH58hqAETCmKSlzmeGs5V99wCQtFMZn95x0OCeCsG8Q5O0Vgmb6ryPsQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a703934a-35e1-4db7-f68c-08df3678d3ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 11:27:48.7094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o7LIV4M6gSHwGqCsXR5ogYWBAV1JIOKd1BZ60ezAbLgAdLWEztre+0HXafvS/029PfDW7BLsG4gFY2E6n/Ci1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB566309
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBMdWNhIENvZWxobw0K
PiBTZW50OiBNb25kYXksIDE5IE9jdG9iZXIgMjAyNiAxNy41Mw0KPiBUbzogaW50ZWwtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20NCj4gU3ViamVjdDogW1BBVENIIHYyIDEvM10g
ZHJtL2k5MTUvZGlzcGxheTogZG9uJ3Qgd3JpdGUgU2VuZCBCdXN5IGJhY2sgd2hlbiB0b2dnbGlu
ZyBBVVggcG93ZXINCj4gDQo+IFRoZSBBVVggcG93ZXIgd2VsbHMgc2hhcmUgdGhlIEFVWCBlbmdp
bmUncyBjb250cm9sIHJlZ2lzdGVyLCBzbyB0aGUNCj4gcmVhZC1tb2RpZnktd3JpdGVzIHdlIGRv
IHRvIHRvZ2dsZSB0aGUgcG93ZXIgcmVxdWVzdCBhbmQgdGhlIFRCVCBJTw0KPiBiaXQgYWxzbyB3
cml0ZSBiYWNrIHdoYXRldmVyIGVsc2UgaXMgaW4gdGhlIHJlZ2lzdGVyLiAgSWYgYQ0KPiB0cmFu
c2FjdGlvbiBpcyBzdGlsbCBydW5uaW5nLCBTZW5kIEJ1c3kgcmVhZHMgYmFjayBhcyAxIGFuZCB3
ZSB3cml0ZQ0KPiBpdCBhZ2Fpbiwgd2hpY2ggdHJpZ2dlcnMgdGhlIHNhbWUgdHJhbnNhY3Rpb24g
YWdhaW4uDQo+IA0KPiBpbnRlbF9kcF9hdXhfeGZlcigpIGNhbiByZXR1cm4gd2l0aCB0aGUgZW5n
aW5lIHN0aWxsIGJ1c3ksIGVpdGhlciBmcm9tDQo+IHRoZSBwcmUtdHJhbnNhY3Rpb24gY2hlY2sg
b3IgZnJvbSB0aGUgIm5vdCBkb25lIiBwYXRoIGFmdGVyIGFsbCB0aGUNCj4gcmV0cmllcywgYW5k
IGl0IGRyb3BzIHRoZSBBVVggcG93ZXIgcmVmZXJlbmNlIHJpZ2h0IGFmdGVyLCB3aXRoIHRoZQ0K
PiBkZWZhdWx0IDEwMG1zIGRlbGF5LiAgU28gdGhlIGRlbGF5ZWQgcG93ZXIgd2VsbCBkaXNhYmxl
IGNhbiBydW4gd2hpbGUNCj4gdGhlIGVuZ2luZSBpcyBzdGlsbCBnb2luZy4NCj4gDQo+IE1hc2sg
U2VuZCBCdXN5IG91dCBvZiB0aGVzZSByZWFkLW1vZGlmeS13cml0ZXMgc28gd2UgbmV2ZXIgd3Jp
dGUgaXQNCj4gYmFjayBhcyAxLiAgV3JpdGluZyAwIGRvZXNuJ3Qgc3RhcnQgYSB0cmFuc2FjdGlv
biwgYW5kIHRoZSBiaXQgaXMgMA0KPiBhbnl3YXkgd2hlbiB0aGUgZW5naW5lIGlzIGlkbGUsIHNv
IG5vdGhpbmcgY2hhbmdlcyBpbiB0aGUgbm9ybWFsIGNhc2UuDQo+IA0KTml0cGljazogd2UgY291
bGQgYWRkIHRoZSBCU3BlYyBsaW5rL3JlZmVyZW5jZSBoZXJlIGFzIHBhdGNoICMyIGRvZXMuIA0K
DQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgQ29lbGhvIDxsdWNpYW5vLmNvZWxob0BpbnRlbC5jb20+
DQoNCg0KT3RoZXJ3aXNlIExHVE0sDQoNClJldmlld2VkLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5r
YWhvbGFAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV9wb3dlcl93ZWxsLmMgfCAxNyArKysrKysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyX3dlbGwu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlcl93ZWxs
LmMNCj4gaW5kZXggMjMzNDY1YTgzMDZlLi42NmJlODgyNjM4MWIgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlcl93ZWxsLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyX3dl
bGwuYw0KPiBAQCAtNjAwLDggKzYwMCwxMCBAQCBpY2xfdGNfcGh5X2F1eF9wb3dlcl93ZWxsX2Vu
YWJsZShzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwNCj4gDQo+ICAJaWNsX3RjX3BvcnRf
YXNzZXJ0X3JlZl9oZWxkKGRpc3BsYXksIHBvd2VyX3dlbGwsIGRpZ19wb3J0KTsNCj4gDQo+ICsJ
LyogZG9uJ3Qgd3JpdGUgU2VuZCBCdXN5IGJhY2sgYXMgMSwgc2VlIHhlbHBkcF9hdXhfcG93ZXJf
d2VsbF9lbmFibGUoKSAqLw0KPiAgCWludGVsX2RlX3JtdyhkaXNwbGF5LCBEUF9BVVhfQ0hfQ1RM
KGF1eF9jaCksDQo+IC0JCSAgICAgRFBfQVVYX0NIX0NUTF9UQlRfSU8sIGlzX3RidCA/IERQX0FV
WF9DSF9DVExfVEJUX0lPIDogMCk7DQo+ICsJCSAgICAgRFBfQVVYX0NIX0NUTF9UQlRfSU8gfCBE
UF9BVVhfQ0hfQ1RMX1NFTkRfQlVTWSwNCj4gKwkJICAgICBpc190YnQgPyBEUF9BVVhfQ0hfQ1RM
X1RCVF9JTyA6IDApOw0KPiANCj4gIAlpbnRlbF9kZV9ybXcoZGlzcGxheSwgcmVncy0+ZHJpdmVy
LA0KPiAgCQkgICAgIDAsDQo+IEBAIC0xOTM1LDggKzE5MzcsMTUgQEAgc3RhdGljIHZvaWQgeGVs
cGRwX2F1eF9wb3dlcl93ZWxsX2VuYWJsZShzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwN
Cj4gIAkJaWNsX3RjX3BvcnRfYXNzZXJ0X3JlZl9oZWxkKGRpc3BsYXksIHBvd2VyX3dlbGwsDQo+
ICAJCQkJCSAgICBhdXhfY2hfdG9fZGlnaXRhbF9wb3J0KGRpc3BsYXksIGF1eF9jaCkpOw0KPiAN
Cj4gKwkvKg0KPiArCSAqIFRoaXMgaXMgdGhlIHNhbWUgcmVnaXN0ZXIgdGhlIEFVWCBlbmdpbmUg
aXMgZHJpdmVuIHRocm91Z2gsIHNvDQo+ICsJICogbWFzayBTZW5kIEJ1c3kgb3V0IG9mIHRoZSBy
ZWFkLW1vZGlmeS13cml0ZS4gIE90aGVyd2lzZSwgaWYgYQ0KPiArCSAqIHRyYW5zYWN0aW9uIGlz
IHN0aWxsIGluIGZsaWdodCwgd2UnZCB3cml0ZSBTZW5kIEJ1c3kgYmFjayBhcyAxDQo+ICsJICog
YW5kIHRyaWdnZXIgdGhlIHRyYW5zYWN0aW9uIGFnYWluLg0KPiArCSAqLw0KPiAgCWludGVsX2Rl
X3JtdyhkaXNwbGF5LCBYRUxQRFBfRFBfQVVYX0NIX0NUTChkaXNwbGF5LCBhdXhfY2gpLA0KPiAt
CQkgICAgIFhFTFBEUF9EUF9BVVhfQ0hfQ1RMX1BPV0VSX1JFUVVFU1QsDQo+ICsJCSAgICAgWEVM
UERQX0RQX0FVWF9DSF9DVExfUE9XRVJfUkVRVUVTVCB8DQo+ICsJCSAgICAgRFBfQVVYX0NIX0NU
TF9TRU5EX0JVU1ksDQo+ICAJCSAgICAgWEVMUERQX0RQX0FVWF9DSF9DVExfUE9XRVJfUkVRVUVT
VCk7DQo+IA0KPiAgCWlmIChIQVNfTFRfUEhZKGRpc3BsYXkpKSB7DQo+IEBAIC0xOTYyLDggKzE5
NzEsMTAgQEAgc3RhdGljIHZvaWQgeGVscGRwX2F1eF9wb3dlcl93ZWxsX2Rpc2FibGUoc3RydWN0
IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksDQo+ICAJZW51bSBhdXhfY2ggYXV4X2NoID0gaTkxNV9w
b3dlcl93ZWxsX2luc3RhbmNlKHBvd2VyX3dlbGwpLT54ZWxwZHAuYXV4X2NoOw0KPiAgCWVudW0g
cGh5IHBoeSA9IGljbF9hdXhfcHdfdG9fcGh5KGRpc3BsYXksIHBvd2VyX3dlbGwpOw0KPiANCj4g
KwkvKiBkb24ndCB3cml0ZSBTZW5kIEJ1c3kgYmFjayBhcyAxLCBzZWUgdGhlIGVuYWJsZSBwYXRo
ICovDQo+ICAJaW50ZWxfZGVfcm13KGRpc3BsYXksIFhFTFBEUF9EUF9BVVhfQ0hfQ1RMKGRpc3Bs
YXksIGF1eF9jaCksDQo+IC0JCSAgICAgWEVMUERQX0RQX0FVWF9DSF9DVExfUE9XRVJfUkVRVUVT
VCwNCj4gKwkJICAgICBYRUxQRFBfRFBfQVVYX0NIX0NUTF9QT1dFUl9SRVFVRVNUIHwNCj4gKwkJ
ICAgICBEUF9BVVhfQ0hfQ1RMX1NFTkRfQlVTWSwNCj4gIAkJICAgICAwKTsNCj4gDQo+ICAJaWYg
KEhBU19MVF9QSFkoZGlzcGxheSkpIHsNCj4gLS0NCj4gMi41My4wDQoNCg==
