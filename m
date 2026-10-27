Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E0B606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aParMkM+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4485310F2D4;
	Tue, 27 Oct 2026 09:07:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7455210F2D4;
 Tue, 27 Oct 2026 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793092023; x=1824628023;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9s5MdMEfT1qtLArQQIubmhGTUE4zbjO5tUcFsJ+T+A8=;
 b=aParMkM+nIpOfhsj7l1qCxXXYNOX1I08bGrESNAJYDx9ZLXFLkjpFAt8
 n6Wssk5ieS+P2q6/dd1AVwfjqKCxf7CXzReE9KYh7lmrbwctYcknMNZ+N
 7xWLK9t1DgZ9TIKtK9e88GoSOKYa2mw7kZB6eS0GYHz36v6NBxWKjcui0
 zN85BLQUR5PpFsan66bMocLfnSYb1AuobEuxmvAuh419mTLWu9KC4jFwb
 k/ZlZj+hmmg9A3h4rzbN5eEM02Y8XF/C9h1Yu0ksagZ9STlmkfjro71Ma
 Hy4B0JHC0scGI7x1fb/gnIS2E6wDiKku6ZooR47h2hSY7VXnDxDZ0Ufza Q==;
X-CSE-ConnectionGUID: sYYdNFD8RkSeuPzkXQZcQw==
X-CSE-MsgGUID: F2uVQ7sFRH+QnJrEck152Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1802602"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1802602"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 02:07:02 -0700
X-CSE-ConnectionGUID: QYqqhyoXTO65gXjtOZUOug==
X-CSE-MsgGUID: 7UhtFuoWQUmpzOqIMV7Yhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4449894"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 02:07:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:07:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 02:07:01 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:07:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xixXaY0ACGKmWhXPvN2xX8X4QaxC3ciUQ7cUKQOOtRfuJQeixcMSU8UlYmwEE6wTv4jrYLQ65ml3a54BrCIoVDXqwTV+LDItj0fu19P5q4KtesUTw78pStaqrNhufOv6JlrMdpW8U8+Q2ktzWyiWTVxgekMjKfXx8fVZA5ZlIi8a2dcOPDvuDRMf+t3FQl5mSx4lDdXRDHAau17aGbpz+vex2d0ykXV8hcL6hnc4w4iyMZBtordPAqmNKASXGn9wack/EsoN2dEbpX7i98a4gb0WkZylTnTNcLOoZFqRh94a3Ma4mfEsQ/U6ZSLFe2oq6BkXEUCF8j6UbSBYq/V9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s5MdMEfT1qtLArQQIubmhGTUE4zbjO5tUcFsJ+T+A8=;
 b=iU/2RpuNSiRuRewkXxr6fG9HNgvQXo5sukz+J99ECMRndlSAgPpH/p0DD/35vg1mKJNmFaX55FyAAgm15ilEGAn7hIyXgEo1rm5OnTKj/n1wKFOw0jM+rO+G1J0SG+Bn9RIMdMzrIy2RDxtwgPgb/DSu+MVTCEeJ0gBfITvg1zEB2ubO+V8/NHTrTEoEgmOTmf7SSxcp71N48pXL13LVzvMyD/SmXNAPRa5ckt03Rh6M8KTl1ujrID0pgGe1sRy+IP4NcajkGrrTbUl4tSsMPyN7QBz8aK6x+GzWENhXQE4N/3/z9OrRsvWTjrrzwgjELRs0l0yi3Rhz+OP6h7Sa0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by DS6PR11MB9918.namprd11.prod.outlook.com (2603:10b6:8:464::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:06:59 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 09:06:58 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/i915/fbc: update the supported FP16 formats
Thread-Topic: [PATCH v2 1/3] drm/i915/fbc: update the supported FP16 formats
Thread-Index: AQHdZVoSN/tvspB+ZkG5P/Ub5UqaX7cP7vsAgAErLoA=
Date: Tue, 27 Oct 2026 09:06:58 +0000
Message-ID: <9d4f394e56e08def3c9b837291f4e09eb3a2f4b1.camel@intel.com>
References: <20261026145508.235851-1-vinod.govindapillai@intel.com>
 <at9ulGJlfF6ImWOl@intel.com>
In-Reply-To: <at9ulGJlfF6ImWOl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|DS6PR11MB9918:EE_
x-ms-office365-filtering-correlation-id: b768ebfd-be28-4af5-c152-08df3409a7ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10070799003|18002099003|22082099003|11063799006|56012099006|4143699003|261021121427099003|10067099003|261021123027099003|261022105027099003|261009223027099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info: QAf6DkDRlqL+ahcZjYohfmfinDTkqHVxyfXXmcB6DpGV7GR+ZM84vUONbWsqBGCmHI1heOvyQdqa7Hc0KjUY5gZdMaNOGwwux+d1+7KNqvwz2p/ZNs5BQJPuGfqADsAK4TLUb0QdRG6uwk3hxpJCcZh3Z5LdF2eiLLQCnkm+JTmd14SdQ7zw7ckA+YY3D+zyS4rKTbOYG3X08gAvP0h169wyMVDM4/6E8gF8uP+VXMoHNWTWoxKYNwVU2E3EM5jP1eI0cypamJdxVQPTN2EUbdgpZ4Af/sboLzkjjWquJ9sq1kpUUaFeO/h2zsnpl2IsL50HR6V3sBPvR8bt6PfmiXTx9E3Un06BF82rsI94RQkBtAHeQvAvyXj6D2mh2qGndtAyNSoLtBJ9R6U0KITSFh2PVaWyWMQSmzw7+prEzOU7xwsPjk0KVsT61xqmhTeAW6eN4oPxD9nzjKmj3FwbzDNKHzxb23HilNHQqPZWAZhp5vvtRO2W9gBvP9UO2qL2OJz/AX4T1M+i6wFGhpYoqMoMZShj/q9on/lsv3YcljwkzUhpq3acj5+Y5qjQKKkb834n8jiHCD9V6Zf88FhjLrqZIPrSSNdMg4Z7Y5jMi78GDnBDgae8P1SPu0zgt7xwkgejZPJ2tj6K/2Ya9ODLDibIPHkbCx7ztGvXfOm/oR2jVr7mzy1/yUfAV5GmYNQg4k2aQPIeIXYF8h/BysZkzB/J9h+p3b7+HYUXPn/k3YU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261021121427099003)(10067099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGFKKzczejJReXo0VFh6dllpWlRpM0NwTjdiUE5lUldxMFptdXRDdllEWUg5?=
 =?utf-8?B?dk1WelNMZVNKSzZzWWJXOXA3cUk2azJUZ0YvYXlLdnA2eTJsOGp0ajVjTkpI?=
 =?utf-8?B?MjI2M2ZNOWsvUkswdDF1L2NVcDhmVk9jei9zcFFxc1NyaTZQUGdodERTS3Zo?=
 =?utf-8?B?RnlSY2thWWgxck8rQjBjUGRabEFWcGZrb0ZxTlZOOVJEVlVIM2ExWHEyeVFp?=
 =?utf-8?B?NnJlbGM5RHZ2SEVnUWpxVmEzZjZLMXZGd3liSWZ5bjd5bUtGTVpyM0VTQk1h?=
 =?utf-8?B?RjVVdjIvOW1GRDJoNjRPYk90UjUyRUdqVTh4dHFSOUZ0V1RoQldIZkZ4azJl?=
 =?utf-8?B?TzRLOFIxWjJ4QUZLakZiMGNFbW1vdzRrY3FoT0t0NWVVeHZXem9nYU9pUng3?=
 =?utf-8?B?S0ZOamZuOGlTaDlYR2pUYkFCaVJjRjRiK2crS1RvVk0wcjFZbHZKUTJXUDYr?=
 =?utf-8?B?c1ZRbjNGZGJpMXNHcUQ2TUlzMHpEbnFjMUtmSzFJemdpNDZDOEI1ZlFrVjlE?=
 =?utf-8?B?Wnl3SjJOY1BndUM0MzJxaERyaWRkV2FiSzJ6b09wSWp1TU53QVVUSGM0cisz?=
 =?utf-8?B?bkVoS2NQcCtoeHIzRVZQOGt1L0h1bitGNGFueS9CTy9JbzNTV0FCWXdhSjI3?=
 =?utf-8?B?VENhUlorQnU5b054NHhiMkkvN0xhazdyblhNLyt4Q1o5MlZ3cWt3Vkp3UVBE?=
 =?utf-8?B?SGZQaUFoR2o3cFBFMVBBMkpTQ2NlSFBOZi9yOGdFTjNaQkg3MVhic1Jvelpy?=
 =?utf-8?B?eHdmL1FhTDlMWWtjYUhpUEtkRFBiWTJPd3ByWXBqOVFhM0REbE5VbWpYWTNr?=
 =?utf-8?B?aFNQMjNjQk03WjJOSGRzS25hTmQ0MzJkSWs4cUNldWM1bDFPMmtWNi85d3h5?=
 =?utf-8?B?aEo0ejVVbkJ3eGN4dFRKNmRPam9LbHJSeHJNeHlsZzRWSzBiVGFWZW01dkY1?=
 =?utf-8?B?YVN1NTNOS1dXdWJ0N084V1JhOGpabko4YldKUmtTdnVuaUdsWXp3Nk9LZVND?=
 =?utf-8?B?NUM0YW9RMEZKNzJrWXhOSXkxRnFmUzQ3SHduUEoycWV0b2xmVXpyUDVSMmFM?=
 =?utf-8?B?T3ZaZjV4V21ISFUyWkRqSWZFY09XSG4zQTNYN1FwOFhaNFE3ZjZoYXZOQndC?=
 =?utf-8?B?TThQQ285Nld0UzVVNC9HY2VkK29la0t3amt4bU5INTFNVkRZSkJnVkwxUm5w?=
 =?utf-8?B?cEtacnBRRjZJTk9PQ1YrZTB4SUtEU3dNTkN2b0lQV1RlSnRzdWo5RzN2Ly80?=
 =?utf-8?B?aFR4QWJKU3YwQ3hEQVhGM2FBd3hUV0xGRmhHOGxMeGZTeFJobzNNR2dWVEdD?=
 =?utf-8?B?bkpmYkFwUjlkQm9TK2IwRGZycGtUaVN4dGN1dlhwU1R0UVIrdFdWdi95RjFT?=
 =?utf-8?B?TFFocHluc1JvWUx3QityQWpxZ3djdnNoTkFOMHBJeXVQTjFCVkxET3hMYUFV?=
 =?utf-8?B?emZzWHlpWUNhcTlBcUNlK0JZRFJrVGZlYjFYNUZDODhpRXlRajJCWHgrWWo2?=
 =?utf-8?B?K1A5UFp0L1d0QkJpV3kzbUR0NWhCMmV6eFNjdjUrK2VVNjNpUDRqU2ZMV3Ex?=
 =?utf-8?B?RStHQ1IwTmhydDlBUStvN2NkUkNaM2FWNThINzFxV3FWSVRXQ0tvdEl0VHlw?=
 =?utf-8?B?a2I5L1dPbmU0SERCaGZ2elRFcTBWc0lNamtDVFJXTld0M01wdU01cjFJTlBx?=
 =?utf-8?B?NUhCdTRRNWdLZ0M4NWlaSFVZUVp2NWZpU3JHV1E1WmZXSWNUSXlHcGJmemJx?=
 =?utf-8?B?SmJiWW5JaThsY1dBTFVaVXlZektxdzVTbDZjaDU1dEt0amRUTk5LcmhZNlpQ?=
 =?utf-8?B?L0JhWnBReHB1Y1l6aEo1RGgyNy9Nc3JWVHhWZk5rMGhjVHRrcUZFckRpYlRH?=
 =?utf-8?B?UGtaOWxXdWh1Tis5azJiZXdvOGlmTnpDaVhjSS8wMVllSDc1TnlBc2JheWFS?=
 =?utf-8?B?WUFOYW5abWlQakJ1NWZlbU5sTjc4VGFaVmRpWFgycW0raldGak9ncnhwc2dG?=
 =?utf-8?B?RWo3SHZlYzQvSkZ4Szk4VTIweTBwVWRvdSt1WUZJejUvQi8wSFVVVVdtam90?=
 =?utf-8?B?L09lMVkvU0huVkdCRmRLVW53TWNsRURBV3JoYjNjYVUxeENVT1A1cC9IdXUy?=
 =?utf-8?B?bWhkOURmek1zN1RrZ3V3a21vUlBESTRKVE1kQXZJUDhKOWdtYWR3cWtVWGFr?=
 =?utf-8?B?d2ZvUWhCMWVRNHlrYTNaVUQ2cDF2L2xYWU03SDNJR1NVZ0xDV2duU2MwaDRo?=
 =?utf-8?B?TmFVQm91aXF1Z3hBaExRT2ZQTVo5VXJyUGVjZklMVytBSi94V21CRTFGcnlR?=
 =?utf-8?B?U1BCVHBuN3JBcGcyNm96VmQyQy8vNmt2NHU5Z2NBNXk3bFR2dS9SQkdCYnRI?=
 =?utf-8?Q?dfDlYfFZVtBtZIGcJAaqdJ8V0+I43r2VVNeQ0K51rtGki?=
x-ms-exchange-antispam-messagedata-1: ElKQCQBHYoJBCT6wFrw0vW9qvWOfA7jRV98=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCCC0D6BD345754095C2AEB6321DC5D3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: j6ULx68V25vKb/X81gfOZcbFM2zdt6tPvnFiIhaKsrA+uKJ9NGYdnCVzdnDXWrFqdH3S2hOHEH/wMqe8z+V4wbWijSGvZWdfV4vNGLUv07OzRcW7816mXRbeT9e+497bqYQVUMgKfqsQmBN4dMpF7E5A4mT2EFBEnuY2h7VE0P8v3x6fhTDQqqx2tAYkJ7Yctcma65FuxuQ00TQCysxxOnDbC0ktBzFK7oEYPW/+dQvSQo+tZpSyO2jPibiL0t335zX+oAecbLfxZeG3fw4mi/CcLpeIhYqnIBAlAjDSwg9BnzbAuSCZoZ/PBySgI17LMLAdNdSNbUID2jhiFCyPCg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b768ebfd-be28-4af5-c152-08df3409a7ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 09:06:58.6430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 02PDJb6HlYYm/payKsZBYVumXxLZqw3oUmV0d4PVAizgGstwd2hbk7/IX/lp8tMSpFPXH4nb9dMbXR/VZzbME03cftGCkE5o6yUlgxPYXZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9918
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCAyMDI2LTEwLTI2IGF0IDE3OjE1ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIE1vbiwgT2N0IDI2LCAyMDI2IGF0IDA0OjU1OjA2UE0gKzAyMDAsIFZpbm9kIEdvdmlu
ZGFwaWxsYWkgd3JvdGU6DQo+ID4gRkJDIGlzIHN1cHBvcnRlZCB3aXRoIEZQMTYgZm9ybWF0cyB3
aXRoIG9yIHdpdGhvdXQgYWxwaGEuIEF0IHRoZQ0KPiA+IHNhbWUgdGltZSBtb2RpZnkgdGhlIGZ1
bmN0aW9uIG5hbWUgZm9yIHRoZSBGUDE2IGZvcm1hdCBjaGVjayBhbmQNCj4gPiBzaW1wbGlmeSB0
aGUgRlAxNiBmb3JtYXQgY2hlY2sgY2FsbHMuDQo+ID4gDQo+ID4gQnNwZWM6IDY4OTA0DQo+ID4g
U2lnbmVkLW9mZi1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBp
bnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2ZiYy5jIHwgMjEgKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gPiAtDQo+ID4gwqAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiA+IGluZGV4IDU2OTRk
MjA3NzNmOC4uZGJiMTZhOWVjNjlkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2ZiYy5jDQo+ID4gQEAgLTExODAsMTQgKzExODAsMTUgQEAgc3RhdGljIGJv
b2wNCj4gPiBsbmxfZmJjX3BpeGVsX2Zvcm1hdF9pc192YWxpZChjb25zdCBzdHJ1Y3QgaW50ZWxf
cGxhbmVfc3RhdGUNCj4gPiAqcGxhbmVfDQo+ID4gwqAJfQ0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4g
LXN0YXRpYyBib29sDQo+ID4gLXhlM3BfbHBkX2ZiY19mcDE2X2Zvcm1hdF9pc192YWxpZChjb25z
dCBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUNCj4gPiAqcGxhbmVfc3RhdGUpDQo+ID4gK3N0YXRp
YyBib29sIGludGVsX2ZiY19pc19mcDE2X2Zvcm1hdChjb25zdCBzdHJ1Y3QNCj4gPiBpbnRlbF9w
bGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpDQo+ID4gwqB7DQo+ID4gwqAJY29uc3Qgc3RydWN0IGRy
bV9mcmFtZWJ1ZmZlciAqZmIgPSBwbGFuZV9zdGF0ZS0+aHcuZmI7DQo+ID4gwqANCj4gPiDCoAlz
d2l0Y2ggKGZiLT5mb3JtYXQtPmZvcm1hdCkgew0KPiA+IMKgCWNhc2UgRFJNX0ZPUk1BVF9BUkdC
MTYxNjE2MTZGOg0KPiA+ICsJY2FzZSBEUk1fRk9STUFUX1hSR0IxNjE2MTYxNkY6DQo+ID4gwqAJ
Y2FzZSBEUk1fRk9STUFUX0FCR1IxNjE2MTYxNkY6DQo+ID4gKwljYXNlIERSTV9GT1JNQVRfWEJH
UjE2MTYxNjE2RjoNCj4gPiDCoAkJcmV0dXJuIHRydWU7DQo+ID4gwqAJZGVmYXVsdDoNCj4gPiDC
oAkJcmV0dXJuIGZhbHNlOw0KPiA+IEBAIC0xMTk2LDI0ICsxMTk3LDE2IEBAIHhlM3BfbHBkX2Zi
Y19mcDE2X2Zvcm1hdF9pc192YWxpZChjb25zdA0KPiA+IHN0cnVjdCBpbnRlbF9wbGFuZV9zdGF0
ZSAqcGxhbmVfc3RhdGUpDQo+ID4gwqANCj4gPiDCoHN0YXRpYyBib29sIHhlM3BfbHBkX2ZiY19w
aXhlbF9mb3JtYXRfaXNfdmFsaWQoY29uc3Qgc3RydWN0DQo+ID4gaW50ZWxfcGxhbmVfc3RhdGUg
KnBsYW5lX3N0YXRlKQ0KPiA+IMKgew0KPiA+IC0JaWYgKGxubF9mYmNfcGl4ZWxfZm9ybWF0X2lz
X3ZhbGlkKHBsYW5lX3N0YXRlKSkNCj4gPiAtCQlyZXR1cm4gdHJ1ZTsNCj4gPiAtDQo+ID4gLQlp
ZiAoeGUzcF9scGRfZmJjX2ZwMTZfZm9ybWF0X2lzX3ZhbGlkKHBsYW5lX3N0YXRlKSkNCj4gPiAt
CQlyZXR1cm4gdHJ1ZTsNCj4gPiAtDQo+ID4gLQlyZXR1cm4gZmFsc2U7DQo+ID4gKwlyZXR1cm4g
bG5sX2ZiY19waXhlbF9mb3JtYXRfaXNfdmFsaWQocGxhbmVfc3RhdGUpIHx8DQo+ID4gKwnCoMKg
wqDCoMKgwqAgaW50ZWxfZmJjX2lzX2ZwMTZfZm9ybWF0KHBsYW5lX3N0YXRlKTsNCj4gDQo+IFRo
aXMgaXMgZ2V0dGluZyBzdXBlciBtZXNzeS4gV291bGQgYmUgbXVjaCBzaW1wbGVyIHRvIGp1c3Qg
bGlzdA0KPiB0aGUgYWN0dWFsIHN1cHBvcnRlZCBwaXhlbCBmb3JtYXRzIGhlcmUgaW5zdGVhZCBv
ZiB0cnlpbmcgdG8NCj4gdGhpcyBoYXJkIHRvIGZvbGxvdyBpbmhlcml0YW5jZSB0aGluZy4NCk9r
LiBJIHdpbGwgbGlzdCBhbGwgdGhlIGZvcm1hdHMgYXMgaXQgaXMuDQoNCkJ1dCBwaXhlbCBub3Jt
YWxpemVyIG5lZWQgdG8gYmUgZW5hYmxlZCBmb3IgZnAxNiBmb3JtYXRzLCBJIHRoaW5rLCBpdA0K
aXMgYmV0dGVyIHRvIGdyb3VwIHRob3NlIGFzIGEgc2VwYXJhdGUgcmV1c2FibGUgZnVuY3Rpb24u
IGFyZSB5b3Ugb2sNCndpdGggdGhhdD8NCg0KQlINClZpbm9kDQoNCj4gDQo+ID4gwqB9DQo+ID4g
wqANCj4gPiDCoGJvb2wgaW50ZWxfZmJjX25lZWRfcGl4ZWxfbm9ybWFsaXplcihjb25zdCBzdHJ1
Y3QNCj4gPiBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpDQo+ID4gwqB7DQo+ID4gwqAJ
c3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPQ0KPiA+IHRvX2ludGVsX2Rpc3BsYXkocGxh
bmVfc3RhdGUpOw0KPiA+IMKgDQo+ID4gLQlpZiAoSEFTX1BJWEVMX05PUk1BTElaRVIoZGlzcGxh
eSkgJiYNCj4gPiAtCcKgwqDCoCB4ZTNwX2xwZF9mYmNfZnAxNl9mb3JtYXRfaXNfdmFsaWQocGxh
bmVfc3RhdGUpKQ0KPiA+IC0JCXJldHVybiB0cnVlOw0KPiA+IC0NCj4gPiAtCXJldHVybiBmYWxz
ZTsNCj4gPiArCXJldHVybiBIQVNfUElYRUxfTk9STUFMSVpFUihkaXNwbGF5KSAmJg0KPiA+ICsJ
wqDCoMKgwqDCoMKgIGludGVsX2ZiY19pc19mcDE2X2Zvcm1hdChwbGFuZV9zdGF0ZSk7DQo+ID4g
wqB9DQo+ID4gwqANCj4gPiDCoHN0YXRpYyBib29sIHBpeGVsX2Zvcm1hdF9pc192YWxpZChjb25z
dCBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUNCj4gPiAqcGxhbmVfc3RhdGUpDQo+ID4gLS0gDQo+
ID4gMi40My4wDQo+IA0KDQo=
