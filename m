Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E90F606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PyjHm0FU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4022010EE1E;
	Tue, 10 Nov 2026 06:29:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9158810E248;
 Tue, 10 Nov 2026 06:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794292184; x=1825828184;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=X1BR4gSD6LZcHP2m6Hm/f2zFM6C8qpA/Q8yWEP6V1/k=;
 b=PyjHm0FUvUdZ7U8BJLc+6ic2q4QcYy8EUhF2uiw1yf7LRZP4jlr27yi2
 Tg65sW8gPMJCHMNdjYTRXAU34RHwranoQrJVdb5LFjjCFlnwJ12oB4wHb
 Cpn45+b3tpKknYhj28J3qUJzDdvuyDvVvWEd/35Sbwuvg586/niGrBLnN
 hND0rHN3kA/HhpnCkbbhWzyOZiQtr0zKoFfpOliXa755n9hjCkOrHJk/U
 lRpRIBdhEMRuvLhI2cWymRPSVQzCkFZ2YXZOJwz7YFb70JamnpaQ4V0Gk
 CKqreJfXsHaxuICunmmN79yt1YmPPzsZxWaKeDkzeejc6LG7eeVhlpI69 g==;
X-CSE-ConnectionGUID: o3crvxUARiyzU3AVi/Edsw==
X-CSE-MsgGUID: fgL/xkhbSR6GHfggOrrx2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2897765"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2897765"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 22:29:43 -0800
X-CSE-ConnectionGUID: UrV5m4SCRhy+e6dLCC6fkg==
X-CSE-MsgGUID: j3HjkiWQSGqiTtksc2C/4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7932492"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 22:29:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 22:29:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 22:29:42 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 22:29:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxoWeehXDwQVJU0ItO4RJ6Aw0SXMk3IxXae1anen+WYZGXIAZf+JwlHRc/4yBk+JDbP1FIVgYVxj/wpGHA6LMhC1NmohjO3n+jfAg/2mkVM+9C1h89NnWz+YEH5Z/WyeE3r2mclo4JY0fMfKgtV6yOpPjV+Vv0yG7b6wh3qsjoi/57KvBeHNyQhEvT1dKuVIaQ+5Vz9FPGM7VGw0wo659Yh8b67UF/EZ2cBqDeaw3MTMawHAxTfKJnvjByrAjBUNLynlZStLspDz57OGBQ9+nz8AenuCoCGYWgR2SUFQLUYq1vDp0DMWG9UZ9gEa6oO+/Jef5ML1Jjj5TUXDHU1wGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1BR4gSD6LZcHP2m6Hm/f2zFM6C8qpA/Q8yWEP6V1/k=;
 b=H3ViGjqKee8z6yXsRAx/8tOSkJq09SXzgTrmLoQoaJ/7ylunItkkiZSfREDkI3ZGSds8X7wdByOwAdAzvIftbdk/21FSI9i7dN6yutHiNuD2AaVOu1o3NcPC6cLg18uiICZOmV3f3e91a8fsTP9iJuNA4iFY60lx1tr/wHawM+rDI00B1le1/r8ssLoQPlxTx3iIzg2npsS/2HVHWCEskHTeCkRbwylB1L38A/UqXCkaZEag94IKTpyUUBq4sZSLAc/jCShK9QnWmtMYDdYbaZL8Nx+TK+uZ6Q+02jJWSz0ohAnP9A335r/e9BRVOuBnUnBUFyA1abh2+JI5qriTIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SJ2PR11MB7576.namprd11.prod.outlook.com
 (2603:10b6:a03:4c9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 06:29:35 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 06:29:34 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: =?utf-8?B?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v1 2/2] drm/i915/psr: clean register macro's name from typo
Thread-Topic: [PATCH v1 2/2] drm/i915/psr: clean register macro's name from
 typo
Thread-Index: AQHdbLLhbP26flcyLk2li/i3frgwu7cm3+AwgAAALaA=
Date: Tue, 10 Nov 2026 06:29:34 +0000
Message-ID: <DS4PPFE901A304FC60900D006E7FFCD74FDE3722@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261104231812.1704129-1-michal.grzelak@linux.intel.com>
 <20261104231812.1704129-3-michal.grzelak@linux.intel.com>
 <DS4PPFE901A304FC4C5B1FA4B93526BB552E3722@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304FC4C5B1FA4B93526BB552E3722@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SJ2PR11MB7576:EE_
x-ms-office365-filtering-correlation-id: 9f7e9479-1d09-4ed5-f809-08df3ef3fc93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|38070700021|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|10067099003|261102123227099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: wwhOYobfgG0xoZWsfww4xmi2pT0NpW9IXAOHZUtABfKPRxYAmafGBMmbEObjVVOKyb2kaNAPhGHgLuPhGxTaF/KvD0YaL42D9NGdBrjH5rXXvQ5my6opQrqTGaatM1u4OX+J+ImC5/MWWBjqe/VCwp/kyNl/VbfAWFKkdgEDE9p53l8LruQlmJ5v2iI9MMvidb4MmAdUpgOtwWXE6/Im4DhXwRJ1t5x5sR+9x1DYvylN4Kc8DeLuYTG8s5VGruKBqpyp8y5E44iuqgFZToNFhVQApy8QKwyR88KCr66MXfR938seoK0VlV/LFIfySSf4idaVCesDUqhtrh3H0Lqf5H0hRO+E5Q2XhckikGF+r56lwnODsqEYM2/BUolqhJvWgQpWEV+vSEB8v4ADDO/EBPyLy/qwAGmB15Gz0k4slhxUU/h3RgTJHizBvYjepcil1hX3ApfNSGeDBcFfDsBOQprTcnlF/OsKkOTkqEgeSl+H4IoT5U91w3CC/X9FGV26PLnBsJ1c57/5nom+UACEfxE1eAgu0cT0zJdGMMOu6Xe8n73iFJYxQmx4J5LwZJOMM8ZzIQC0buvlS6gUrDD8+55HOPT0KIoj6lFWKJv3UF9UJkKaLx01x6Q0PRwUB8ifbrpwlGOLLg9D5cF4Dl+Vln26jR2NIVr2L598rMsHuRLW42AFZdhk1XWmN5wqHp7FpfoCjEEQ7XhkYZTvcZYfMIAu3anSwYyEogU5gfy/j+I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(10067099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmNpTDhrclhadGw1Z2FRRVZMSmdSYlorOUpDdldOdG1PLzh1dEN2ZUZ1TkhE?=
 =?utf-8?B?VzNHT1k5VHNFN3BFRmpkaUNMTEJNampYdE9rZnVBVmh0SC8rN3NHdmN1UDc2?=
 =?utf-8?B?eTZ6ZzFmVUtkZ0tzQnVES0xVTVFzM2Z5WU50bWpLRE5Oa3pZb1gwVE5jaW5K?=
 =?utf-8?B?OFJRZzNSejY4aFhZTGVHSWpWb2hCZlpDSG9aeG95WCtoditIQ3BIZ2s3VVpy?=
 =?utf-8?B?SUp4ZDFKQ08zM1o4RERGa1JMVzUxVTRBVDB6UDJTK2tuWEtEVnBIM2JwTHRu?=
 =?utf-8?B?UTh0a1pYbm1Cd1BVVVp5VEFwV0h3MTNBMDY5cWtuRVlDazJYK0VnRFVlYW5h?=
 =?utf-8?B?M2tITmRpMDF6LzlWemFFZDhvWHQ4Y05VVGhzSTZxMWdBMHFZbXBxaHNIcGNw?=
 =?utf-8?B?WWI0bkRBeWo3M0dkbE9Gdzd2ZFNIT01nUURaY1pQR0VOR05Ub3pvU0pmekIr?=
 =?utf-8?B?bUNxNS9VNDBPa1R5OWs4UjJTTTdDRGJic0g4dHFuRElIS0s0empvSGJHdEk2?=
 =?utf-8?B?ZHZhTEpxa3UvbGRSNjd0YkUwdE9lSFdHa0xzUmRxMXZ6UEtRVm1WTGFuYlRJ?=
 =?utf-8?B?a0tvNUV1aTcycXU0cFVlLzVVUGlNQkJnRGR3eG4vK21XemRUV3lvM2VKVHoy?=
 =?utf-8?B?N0dGM0Nmc09rOEhwc0t5N0lzaWhGOWxwRkIzaERXUGZKazg1ZmJSTDhqS3Ey?=
 =?utf-8?B?ZnFTLzRxNE5sT1VnTkxwTVNPdHRLbkExejRtT1BkTEVyeE40aXZ0bktPQUcx?=
 =?utf-8?B?MXR0bE0yL2J4WDN6RHNZdjV3OVhQN1dUdlAzTnNqMlA2MWhyUHBIY1M1L2or?=
 =?utf-8?B?UGZCSWZyazdsREsxVFZZWFY3SUNYUXhPeTB2K1l3Z0xLbmYzdUVIeGJQb0Fp?=
 =?utf-8?B?Slg2WW9MWUFXWGtNOW5SLzBYeEVKOXRPWHhibUI5QUg0YXEyTGNOU3pncjVL?=
 =?utf-8?B?YjlmU0MrS2hibWlKQ25qTE9jQisxRVpFV3hRV3pRR3ZzL1VoV2hkZ25IM05w?=
 =?utf-8?B?ZzZ1MkVLTXlIczBMMFpoaXhrMkZhbDFMZTF1c1VGZDRGMHdNRnBWdlRYZ00x?=
 =?utf-8?B?NmN1VDk0dTB3Qmx5MjF6WFI3Vk5vckVHNWdJOUhSSzlNVW13bUw0TXpic21M?=
 =?utf-8?B?VDY2QzR6YWc5M0x3WXZTWDFzckxYMkhobmx4MTVYYjBCczl0a3hvaGR2QmVn?=
 =?utf-8?B?cUVrU0RFTGo5cUNVbDVjYVYxYlpkZFczUG9LRVBleHlyL2ExaU5XaTRKT3lu?=
 =?utf-8?B?ejF6eEoyQnBFa1hvSFJsaWY0YXQ1L1c2WlFDVEJQa0FBdmMvc2I5US9UUC9W?=
 =?utf-8?B?UXJwd0plRHp1b2QwQ2ZZenJ6Ly9zbVZpd0ViTVV1SWNLYURVWWVHRWpFa1RN?=
 =?utf-8?B?Q1h0Z2hkT01rWllqaGlRMy9mUjlWVUV3NlhvZGp4eE11ZWEyYjZQZXA5bWlD?=
 =?utf-8?B?SHowSm9YRlg4ZlFGSnhQQ3NtL0Z1NzM3d08wMWJrU1FOYkU3Q1hpZzZGdVlG?=
 =?utf-8?B?MEExUWg4UmhUekMzanlMbWROVXN1dG9XQnlNNmpkaUVzTG1ZdEdUTm93Q0VB?=
 =?utf-8?B?SngvWkEvUHBPOGJ6c1JhcEtHQXF5TXN4R1JtV3ZxNXd2STRXZXl4SWZ1eHB4?=
 =?utf-8?B?RU5xZGw5cDdkbWt1QTNZTG5IK2xSLzQrZlhpYTYzWTd1NkRBU3krTFVEUE4v?=
 =?utf-8?B?ZGZhS2pkdGRvaXlYMGFSN0J5VFRPdExXYWhXaGxFNVZqSUhIUURoNHhDZ1Ev?=
 =?utf-8?B?ZEV0M3A5dEdreXZXM2ZnNDl0QkdYV1A0cWpUR1owRFU2SGtqZldLd2t5d1Ar?=
 =?utf-8?B?RmQ2QTQzTmlWVTNGbEI1QmZXZDJUdmRROVNZTXJoMmxTYzR5YWhDUndPZmdK?=
 =?utf-8?B?SlhVc1U5ZzNGd0FoU0h6eWdPK2Y3SXcvUEhLWlRWSkFwd0RBYlJOL0IxcGlN?=
 =?utf-8?B?MHhQVjE4UjRwZ0lsZHJGVFRPRkppN0FRV3g4QnEwQjF5MUsrNWxEb2UrMDdP?=
 =?utf-8?B?enJxOCtRR3E0WnpuR0FJU0RiNmVVL0FoanB0TWFOSVVuNytNeWNLbjFTdHRD?=
 =?utf-8?B?OG5oWkR0aHFSUUxkV3pGOVB5VEdQUGpaQzBWY3ltWkRnWlMxcWYyV2NxMkl4?=
 =?utf-8?B?RlNMVHdrTXdvTHN2VTJxOGpJclRwS2JNZU5pSUY3UmJzS0pPNE1JdXVvK1c4?=
 =?utf-8?B?QlFYRXNKYTkxRTYyMzM4UXFvU1B1bGh6V3FmcWJVY2lIR1dudkVTQW85VkFW?=
 =?utf-8?B?NDBBbGxVbEtNNjBYY3AvN0gwUEFMWXVVMGxJNW1ydy8zM1RFTTVaTlY5dEpJ?=
 =?utf-8?B?bTU5ZDU0dGVKdUE5SGFiZGZRbVpiNVNiaC9reVNSMGdva2hHYnhiQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yDjUxLI0NPgxtbKfDIO3pXv4uikHuyWy5kXboe9GkpWOiin5fRL3VIaUAi8karBpHTybr9wDQ3jZmEUKEkHcm+LA5vHEhOpiHUSen1iV9e2QjPo76md/2zH/EDFz33pnwe2tiV8YWm5MzlSSUEJYX5JMSco9IqyInkwzzPWHO6OnkpKot4SxDaM7n55QA6gZJBPWpjhs7AN45SV658Mak12nC1FFVU5QiPp6/luWY5uoHcR7gQRBenajPB5sygpVeS4mspQ6zkJ6HfimRO5CzHzQSMfIOyY73ZD+K6SgMBNuZiVovWxYu8k/DYvFmGb/8M5WVE/hCuj9CjkyKyLN+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7e9479-1d09-4ed5-f809-08df3ef3fc93
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 06:29:34.5229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7rkfA+SVaUbVR8w7Ir4y56hfwI5tXyodbR3F78khfEs+D8EgLsTZkLXE4e1t2kC9jeaYM+z40paTC6ReFrWmWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7576
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

PiBTdWJqZWN0OiBSRTogW1BBVENIIHYxIDIvMl0gZHJtL2k5MTUvcHNyOiBjbGVhbiByZWdpc3Rl
ciBtYWNybydzIG5hbWUgZnJvbQ0KPiB0eXBvDQo+IA0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2MSAy
LzJdIGRybS9pOTE1L3BzcjogY2xlYW4gcmVnaXN0ZXIgbWFjcm8ncyBuYW1lIGZyb20NCj4gPiB0
eXBvDQo+ID4NCj4gPiBBcHBseSBzL19DT05USU5VT1NfL19DT05USU5PVU9TXy8gZm9yIGJvdGgN
Cj4gPiBBRExQX1BTUjJfTUFOX1RSS19DVExfU0ZfQ09OVElOVU9TX0ZVTExfRlJBTUUgYW5kDQo+
ID4gUFNSMl9NQU5fVFJLX0NUTF9TRl9DT05USU5VT1NfRlVMTF9GUkFNRS4NCj4gPg0KPiA+IE5v
IGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBHcnpl
bGFrIDxtaWNoYWwuZ3J6ZWxha0BsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBMR1RNLA0KPiBSZXZp
ZXdlZC1ieTogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQo+IA0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jICAgICAg
fCA2ICsrKy0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzcl9y
ZWdzLmggfCA0ICsrLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9wc3IuYw0KPiA+IGluZGV4IDViZmFjNjQyODRlZjguLjVlMGNmMzRlMWE4MTkgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBAQCAt
MTA3NCw3ICsxMDc0LDcgQEAgc3RhdGljIHZvaWQgZGcyX2FjdGl2YXRlX3BhbmVsX3JlcGxheShz
dHJ1Y3QNCj4gPiBpbnRlbF9kcA0KPiA+ICppbnRlbF9kcCkNCj4gPg0KPiA+ICAJaW50ZWxfZGVf
cm13KGRpc3BsYXksDQo+ID4gIAkJICAgICBQU1IyX01BTl9UUktfQ1RMKGRpc3BsYXksIGludGVs
X2RwLT5wc3IudHJhbnNjb2RlciksDQo+ID4gLQkJICAgICAwLA0KPiA+IEFETFBfUFNSMl9NQU5f
VFJLX0NUTF9TRl9DT05USU5VT1NfRlVMTF9GUkFNRSk7DQo+ID4gKwkJICAgICAwLA0KPiA+IEFE
TFBfUFNSMl9NQU5fVFJLX0NUTF9TRl9DT05USU5PVU9TX0ZVTExfRlJBTUUpOw0KPiA+DQo+ID4g
IAlpbnRlbF9kZV9ybXcoZGlzcGxheSwgVFJBTlNfRFAyX0NUTChpbnRlbF9kcC0+cHNyLnRyYW5z
Y29kZXIpLA0KPiA+IGRwMl9jdGxfY2xlYXIsIGRwMl9jdGxfc2V0KTsgIH0gQEAgLTI2MTgsOCAr
MjYxOCw4IEBAIHN0YXRpYyB1MzINCj4gPiBtYW5fdHJrX2N0bF9wYXJ0aWFsX2ZyYW1lX2JpdF9n
ZXQoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpDQo+ID4gc3RhdGljIHUzMiBtYW5fdHJr
X2N0bF9jb250aW51b3VzX2Z1bGxfZnJhbWUoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkp
ICB7DQo+ID4gIAlyZXR1cm4gZGlzcGxheS0+cGxhdGZvcm0uYWxkZXJsYWtlX3AgfHwgRElTUExB
WV9WRVIoZGlzcGxheSkgPj0gMTQgPw0KPiA+IC0JICAgICAgIEFETFBfUFNSMl9NQU5fVFJLX0NU
TF9TRl9DT05USU5VT1NfRlVMTF9GUkFNRSA6DQo+ID4gLQkgICAgICAgUFNSMl9NQU5fVFJLX0NU
TF9TRl9DT05USU5VT1NfRlVMTF9GUkFNRTsNCj4gPiArCSAgICAgICBBRExQX1BTUjJfTUFOX1RS
S19DVExfU0ZfQ09OVElOT1VPU19GVUxMX0ZSQU1FIDoNCj4gPiArCSAgICAgICBQU1IyX01BTl9U
UktfQ1RMX1NGX0NPTlRJTk9VT1NfRlVMTF9GUkFNRTsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRp
YyB2b2lkIGludGVsX3Bzcl9mb3JjZV91cGRhdGUoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkg
ZGlmZg0KPiA+IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3Jf
cmVncy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzcl9yZWdz
LmgNCj4gPiBpbmRleCBhNTdiYzExMTI5MGQxLi41NmRmNGQyZjk3Mjg2IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyX3JlZ3MuaA0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyX3JlZ3MuaA0KPiA+IEBA
IC0yNDEsNyArMjQxLDcgQEANCj4gPiAgI2RlZmluZSAgUFNSMl9NQU5fVFJLX0NUTF9TVV9SRUdJ
T05fRU5EX0FERFJfTUFTSw0KPiA+IAlSRUdfR0VOTUFTSygyMCwgMTEpDQo+ID4gICNkZWZpbmUg
IFBTUjJfTUFOX1RSS19DVExfU1VfUkVHSU9OX0VORF9BRERSKHZhbCkNCj4gPiAJUkVHX0ZJRUxE
X1BSRVAoUFNSMl9NQU5fVFJLX0NUTF9TVV9SRUdJT05fRU5EX0FERFJfTUFTSw0KPiA+ICwgdmFs
KQ0KPiA+ICAjZGVmaW5lICBQU1IyX01BTl9UUktfQ1RMX1NGX1NJTkdMRV9GVUxMX0ZSQU1FDQo+
ID4gCVJFR19CSVQoMykNCj4gPiAtI2RlZmluZSAgUFNSMl9NQU5fVFJLX0NUTF9TRl9DT05USU5V
T1NfRlVMTF9GUkFNRQ0KPiA+IAlSRUdfQklUKDIpDQo+ID4gKyNkZWZpbmUgIFBTUjJfTUFOX1RS
S19DVExfU0ZfQ09OVElOT1VPU19GVUxMX0ZSQU1FDQo+ID4gCVJFR19CSVQoMikNCj4gPiAgI2Rl
ZmluZSAgUFNSMl9NQU5fVFJLX0NUTF9TRl9QQVJUSUFMX0ZSQU1FX1VQREFURQ0KPiA+IAlSRUdf
QklUKDEpDQo+ID4gICNkZWZpbmUgIEFETFBfUFNSMl9NQU5fVFJLX0NUTF9TVV9SRUdJT05fU1RB
UlRfQUREUl9NQVNLDQo+ID4gCVJFR19HRU5NQVNLKDI4LCAxNikNCj4gPiAgI2RlZmluZSAgQURM
UF9QU1IyX01BTl9UUktfQ1RMX1NVX1JFR0lPTl9TVEFSVF9BRERSKHZhbCkNCj4gPiAJUkVHX0ZJ
RUxEX1BSRVAoQURMUF9QU1IyX01BTl9UUktfQ1RMX1NVX1JFR0lPTl9TVEFSVF9BREQNCj4gPiBS
X01BU0ssIHZhbCkNCj4gPiBAQCAtMjQ5LDcgKzI0OSw3IEBADQo+ID4gICNkZWZpbmUgIEFETFBf
UFNSMl9NQU5fVFJLX0NUTF9TVV9SRUdJT05fRU5EX0FERFIodmFsKQ0KPiA+IAlSRUdfRklFTERf
UFJFUChBRExQX1BTUjJfTUFOX1RSS19DVExfU1VfUkVHSU9OX0VORF9BRERSDQo+ID4gX01BU0ss
IHZhbCkNCj4gPiAgI2RlZmluZSAgQURMUF9QU1IyX01BTl9UUktfQ1RMX1NGX1BBUlRJQUxfRlJB
TUVfVVBEQVRFDQo+ID4gCVJFR19CSVQoMzEpDQo+ID4gICNkZWZpbmUgIEFETFBfUFNSMl9NQU5f
VFJLX0NUTF9TRl9TSU5HTEVfRlVMTF9GUkFNRQ0KPiA+IAlSRUdfQklUKDE0KQ0KPiA+IC0jZGVm
aW5lICBBRExQX1BTUjJfTUFOX1RSS19DVExfU0ZfQ09OVElOVU9TX0ZVTExfRlJBTUUNCj4gPiAJ
UkVHX0JJVCgxMykNCj4gPiArI2RlZmluZSAgQURMUF9QU1IyX01BTl9UUktfQ1RMX1NGX0NPTlRJ
Tk9VT1NfRlVMTF9GUkFNRQ0KPiA+IAlSRUdfQklUKDEzKQ0KDQoqQ29udGludW91cw0K8J+YnQ0K
DQpXaXRoIHRoYXQgZml4ZWQgTEdUTQ0KUmV2aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFq
LmthbmRwYWxAaW50ZWwuY29tPg0KDQo+ID4NCj4gPiAgI2RlZmluZSBfTE5MX1NGRl9DVExfQQkJ
CQkweDYwOTE4DQo+ID4gICNkZWZpbmUgX0xOTF9TRkZfQ1RMX0IJCQkJMHg2MTkxOA0KPiA+IC0t
DQo+ID4gMi40NS4yDQoNCg==
