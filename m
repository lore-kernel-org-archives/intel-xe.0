Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B79E606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NYRxJ11N;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=bVXnRJV8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213C110EC3A;
	Mon, 16 Nov 2026 08:51:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4BA10EB03;
 Mon, 16 Nov 2026 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794819060; x=1826355060;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NaH3Nmaxp2M/jowwqZuEXfVerpA1HZasw5h//BJD2J0=;
 b=NYRxJ11NHEKn2704WmJekDrN0m34uII5zRq1zYdeahd6SGGPbPVz6MBh
 LDwIaE//ATymD+ovHQVMAlH6l+3QleBrYBL3N9ZZiVH+itRBdU2YIwS4T
 MKKQcRdiR12HtdhBItGSY5AvuW6tnY/JaVIrOZIDaw6FSB7Lz+MJT9Spx
 y+r8InFhORWcPJBUd60Q4C+m9TdhLIptuFYt7yOGRK6BfTaWYYwRwzad5
 LMe4sY8Jn7Vd+rTrKG4UocztjP7CxDuUjdDgDqfVib4FL6pTY6TjMuSa9
 D1b/g+F7FUHqPc00f6vAVpbZrEAkzmKdDMw4NVCPYxVZZ6q4O5jj9fmLX w==;
X-CSE-ConnectionGUID: mBBdiA6CQt+C61WTP16cAw==
X-CSE-MsgGUID: 9xnAQdkIQoeX1+FtzHbaEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3576913"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3576913"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:51:00 -0800
X-CSE-ConnectionGUID: E8SVmGFhTPSQ+/4TI0CBAw==
X-CSE-MsgGUID: 81Nu9dQwQIKfZVmZWQDkuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9745302"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:50:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:50:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 00:50:58 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:50:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Irv7MpUCg/6L5Xzkm76G+aHmgd8LeA/AtPrYy76izeUJAAq98lqtskr6Ga6DxN7GxCiaHPnOEKw79A8Ep4GOF3h1iiU1VWaP/eKFfBkP5mUvv7RAjz64bI+q9RTCdxPhQ4ggE0IwAzaBrwO1BDk7mgzkpRAPGugGGL+tmevaEkR8lxHcGuvZueErf9vwmxke34fbiJOB8l11qR1R6mK0YBuiSMvUt7QlJx8yuZ0Mq0+KCnv4yzI/e6hwua6D5ORsTvmA22kUyq6oODOrAKmbzX1AMsRxp/jsazbtiu+Qecfl+ozv9FnDF4v/5A+rJlysaUiHG7GL9oJP6gd0RxPXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaH3Nmaxp2M/jowwqZuEXfVerpA1HZasw5h//BJD2J0=;
 b=eZbbTyksnq4bSz1dvpb5bUj+H/Qw1SJloclPHquIBH0GajrAYXySx4ZgKJtLLqORZgI3h7CwdRvkDcFd+7A7ZEr/wLVnuSRci9b6/EtDMGDuehFgR63ro5AwutjXGsQZS0+rRTKCT0hxmsWyo7eLPCZfPn6fBmQZKjZ1g/ZaYDFbuf6EToGfnDUDUlYfLMPf0YrENGVvtinl3MmMUhv63bHgN3khsJN7xDoqIORrKdnqcz0xTvuOwX5tbZi3Cnv3C/3d6sGSNHE8P7H98HDWSIlQiQqf/buAijaDxClFsOF2ffW2Hyuqfbn/0Y22ivyKed1p+fgad6OePdF1dKOaAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaH3Nmaxp2M/jowwqZuEXfVerpA1HZasw5h//BJD2J0=;
 b=bVXnRJV8ifZ4WrDXp0cDKHL2w1PxE7e+AAK1hA5z1osnrOHMwAnD3hqXAcuCNynIxTJRehtfuxcS94Os5GKybQbb9ku/Wz69N3zMtFBRtrgfWh+kHir9IQ/31qkBDs4PmvDEzx+vnxMBthsT9HfIfFBoWaBkk6zqujKzqH1Orfc=
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by DS4PPFCAADA7A6C.namprd11.prod.outlook.com (2603:10b6:f:fc02::4d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:50:31 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:50:30 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v4 4/7] drm/i915/display: Add HAS_DP_SYMBOL_TG()
Thread-Topic: [PATCH v4 4/7] drm/i915/display: Add HAS_DP_SYMBOL_TG()
Thread-Index: AQHdbAzY0qfLzuPrV0KdU+GyRHle07cvGyaAgAFbquA=
Date: Mon, 16 Nov 2026 08:50:30 +0000
Message-ID: <SJ0PR11MB5039806BD59DE2B45FBA5A62BA7C2@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20261104-vlk-64036-dp-symbol-tg-v4-0-d06fe6c466a9@intel.com>
 <20261104-vlk-64036-dp-symbol-tg-v4-4-d06fe6c466a9@intel.com>
 <d051aeb6-ab02-4252-bb1e-79f23100e677@intel.com>
In-Reply-To: <d051aeb6-ab02-4252-bb1e-79f23100e677@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5039:EE_|DS4PPFCAADA7A6C:EE_
x-ms-office365-filtering-correlation-id: 15ba0219-0fac-4ac2-0266-08df43beab75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|261009223027099003|11063799006|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: pGsS+agN1RFYdCjvCfJFau75ZNPkEL2/Fy6GHP4m1Sbf4ogAGippV2lCXr6spHnnEToWmQdSZ2ypzeCLDU3vCXWUDV/vyMMpV2fqY6OY0OcYe3qJK8loWrOmHmvjoDbfBjg0IDKr8aPJ3ua/IW5yUQ+dH7IpSIcFGIJyns1KoiS8a3DILN7dn2+alBqKbBDNMkvrhEAvbXn4hlEVVKSYWQM25fDzO1VuqLgVE7YUomSBxJDZKtKQ01j6O7xurWsUyFwqO7/YF9Qt7yDKlsFrXqjfLJdP//ZTU8KwP32ajDu4sDc5Un+Z0xBRKxbHQAjv67k1tnyLnQCUXpISt7mgJyTYP/KYT1Fpq1bdUIapN+Yo9MWvhwj05Oy9XYSnleHFRT3sQWdnD7WkXjX3vGH5ZPNCuDiUIlTUJeis05fk+xgHu90r5YU9Nth+IOpt2Rka4EWqo6vPFwFwC6Luy2N2en4LATTWBz8JIhXAF6oF/JGvWA6CBMVKt3NWYbLdgMYG5ytSD9u+IbfPuneis64HEVkkja4uBcz2KTimOoEaqajjR7zZFVCFUlkNOM6xK2tjTfLFv72IbbmlZedLBGlw3nPQyDn0taHb07sOpwhrEm7I7IMeeD50Dg3ADWwdwtiO0FRR4S+vOnrR+wlRsJk9C+v8srJwtjqyDqj5G/6GntTaJm05bYFNhINr1BlECgEL2HuY3odLN+aGmxGnNTFuuYJdZifI4OKfDyE2EhQU/Ek=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUhqOUNBMnFoenNVNVFHb1FqbzdxWHFXVmo4cFNHOU1ycFJPTFdiSmtQSE92?=
 =?utf-8?B?dDNBd1BvTWxKRWY0aDh5c0FKSWdnbHdNSnBWd1V0MVJRYzJxOXhpNnRKc2I3?=
 =?utf-8?B?K0wvT3E3VlpZVUJOV1c5eHJsUGE2SWFLVlBibEtMODNIdTRWc2Q1RFNMeGRk?=
 =?utf-8?B?Y1paMmVBVm5UaEl2QmxyT0M4ZVhjK1l4QVFwRXo4Y3hyT1ZYbTRKendWSkJP?=
 =?utf-8?B?czIvVU92Nlc3RnUvRFFWUlR0Smlta2I0elFsTFBqbEh3ZXhhSmZ4MVc2S0cy?=
 =?utf-8?B?Vm9zQ2dQeDhYVDFTRHdOMHgxc2R3emErWWpkaUkvSm9GZHVMa0pPOGxMWnZu?=
 =?utf-8?B?N3VyOElldXpMTEtxaFMyaHNOV1dGZkJtL283YmkwUHpkL3VPMUFEMDdZcWRB?=
 =?utf-8?B?eThZR2VJektocmoyM0JsMXJTSWh2TGh0cTBXVWRLayszOW85Smd2NlJxM3ZQ?=
 =?utf-8?B?bTZBbnE5emV5RUNmbjFrMjhVRGtZclkzcHdWTzNQSGpVM0o1azRpVmlJeXFK?=
 =?utf-8?B?M3pVRHZQdHU2bldnaFBCY0NXbHNxY0kzaTJUaXJIYXM1K0ZnKzZteDlRNzht?=
 =?utf-8?B?YWF1UEVTdzVYaWNMRTVmUFc4NzVmWEhaZ1ZwYTR4RnNqZVB6THNFUGNveEk0?=
 =?utf-8?B?cEhFekZRQXR3V2dzQlZrbWJSNTBlcGpnREtlREhaRnh5eU9TdFI0aUhkeG1l?=
 =?utf-8?B?eXlYaUpSWUNkT1E2MmlFYlcxYitYVWVjVVhwSGd4NG5ubG9mVWx5bGo4Ykt4?=
 =?utf-8?B?Zk5EdEtuMnVPcy84N3VzWjJIZjVxNEFvWGY4bkg0TFczL2tuMmswYWFmVy9t?=
 =?utf-8?B?MXF5NW5XRkw0Ukg1Mmd4NUcxNmJ3N1hIQ1ZIa0hBaDRxQnpkNnlvaUttNjdo?=
 =?utf-8?B?eFhlVnQ2MmJFekZYc0RRM2hmUUh4azFPRVV4aVBveUx6c0hGbFBpc1EwSkhF?=
 =?utf-8?B?V05sYkJSZ3QyWDZUdEU2cVowZVlBNzlXMERVUWh4OUVkL2VjTzlnZEp5MEhQ?=
 =?utf-8?B?WHI5enVKV09uTlAvR0tJbWk2T1VtZW43NEpud2s3dVlPUjBNR0ZOaG1GTCs1?=
 =?utf-8?B?MTQzOUJUNm40YnU4SEpVNjZoeGNjZ3k5dXAxZmluMGU2dlo1Yi92RGxqaE1W?=
 =?utf-8?B?UWZaMTM0N1plaUI4RFhsV2RsNENoc3VXQzNtZ1BHUDZVNUdjNXNsaXFqVmlk?=
 =?utf-8?B?d2NNcmxyU3JYRUFhRmhKNVowR3pXaEs4Nk01cjh5eCthU0NGTUQxV2Urb1kw?=
 =?utf-8?B?ajhCcXVSL3NaSWlNSGNOWUlKdmtwWUlLV2pGYnduT21odE5NMktJYlo0V0RZ?=
 =?utf-8?B?N3BBNitNejFXOHhCVTZYNlJVZkZ5dC9IbXp0U0JXcWNVbEEvaHgrZWQwcXFS?=
 =?utf-8?B?WTRFNGZDNnJReVVXa2NxbXZMOGRvY0plVEk4cGYyc1RDc1UzZEo0bTMvdkVL?=
 =?utf-8?B?Q21MenhQeE1WUU5sRVlMTUJjbC9yUlVWUHdydWIya1RxK0Npcm9uZUI2NVFT?=
 =?utf-8?B?ek5mUVJaV1FqSzRHbzNJWnNzL2tqSUlMOFplOFlNNXljVXpaZ0pQTXN2UGUv?=
 =?utf-8?B?WUR4UXA5cXlmQS9VYXFmMGVjelZBQkd4d0NJTDFXTEZ5bnFjMXAwMStjRHN1?=
 =?utf-8?B?S3lUWjkvaXloUzd2N3U1d1RkTXNwUCtEVytjaDdQdC8zMndRVHBVVlR2WEtI?=
 =?utf-8?B?ZkZOS1R0aEN5bDhwSWN3MzFXNkc3bnVwWFVFcGg3T1pKV0dYU2NCRENjbVc0?=
 =?utf-8?B?OUtrRC9rbmFNalUzUWZuTTlXcDhxOVRqMG5iVG9TRG9FcWhRN2gzanlEcTl4?=
 =?utf-8?B?cm9zcTU4dE9uTTlkT0VhQTYyb1RmdHg4RG54ZTZ0OE1ZZ2tyeG44MVhvUUVP?=
 =?utf-8?B?TG52Q1krV3ZWRExRNy91MXJLS3BiZXBXbHkxblFYcHFuZDFhS0lhdldWYlJH?=
 =?utf-8?B?djJzMUlDa3pRa1A3YTJzWE45MldweHNhSW03R2o5K0RKMzZhWmtrLzg3WjIr?=
 =?utf-8?B?UG0zVm9lRkxHRDEzNDNxV3hkKzdpWlh3d2FrcktSSjMrVGdFdUtUVktmdllm?=
 =?utf-8?B?ZEd4M2pxUWtoMnJRV1ovQ0YzdThLQ1p3cHAvaUdFblNwa3UrV0Nab092ZENW?=
 =?utf-8?B?VHdQRFN6U0lqMW4xNWMyaVR1azNqWnRIWSsvTVAreHhpSlJ3NzFTWVRQOHZK?=
 =?utf-8?B?SUk4T1VEZVhWbXI0S2ZnSzA2Y1FOd0xwSW5zWWJFdjREMlZ3L08yaG9RbXZm?=
 =?utf-8?B?dVJ5N2NxTjhQMmR3ekZzTFRaTzJaOHJVWGhFTTBJbE5UMEovbWRmNHo4K0VY?=
 =?utf-8?B?T0k4SElyeS8vSk5EUXBML09YS2FCalVlcTNKdDFETVFlVDdyTUh2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wjNgx0Epfl4YAzgO1rWrtpcnojznrTybG5ej11537Ks0gTA0EK3Lqfjp2dXOMQDnigmLKVAsV0KQh9yYJt42R6ArBW+KU6SnN8DTH1DU9b5VhI12Di04HjqBEAGKbv8DUO4mBJU3kBqhN6GmI6fNgWkTaEZNTvbusWDMcJ27P8noD2GVdURyCc8drMqpC6uGXQsM0+PHtFfSNF2t2LUEpV10TcSiRQ7Cx/rY9PDGO8CwdMoWmt1jOEYyllE4WKLOiaTt9XMEjjc6peh1u4hb7P8fa9vWJ2JU2MSQkwug3zjD7WH3qG2vZdkVLqNoCy6jihBsUuy8jZWfsqA+aeSV2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ba0219-0fac-4ac2-0266-08df43beab75
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:50:30.8744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzTwUQtForTdkZIUGIrDZbzxZE7d2Zhdgn1xzxGTrG7a01fA+Ot4K86lLBVvoPLTuIYuG6CjjHGrFqWlDgxXqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCAADA7A6C
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3JhaCwgQ2hhaXRhbnlhIEt1
bWFyIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPg0KPiBTZW50OiBTdW5kYXksIE5v
dmVtYmVyIDE1LCAyMDI2IDU6MzYgUE0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVy
dGh5QGludGVsLmNvbT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT47IFNoYW5rYXIsIFVtYQ0KPiA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
PjsgS2FuZHBhbCwgU3VyYWogPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY0IDQvN10gZHJtL2k5MTUvZGlzcGxheTogQWRkIEhBU19EUF9TWU1CT0xfVEco
KQ0KPiANCj4gDQo+IA0KPiBPbiAxMS80LzIwMjYgODo1NCBBTSwgQXJ1biBSIE11cnRoeSB3cm90
ZToNCj4gPiBBZGQgYSBtYWNybyBmb3IgdGhlIGRpc3BsYXkgdmVyc2lvbnMgd2l0aCB0aGUgRFAg
bGluayBsYXllciAoTEwpDQo+ID4gc3ltYm9sIGJhc2VkIHRpbWluZyBnZW5lcmF0b3IuDQo+ID4N
Cj4gPiBCc3BlYzogNjg5MjINCj4gPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVu
LnIubXVydGh5QGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogU3VyYWogS2FuZHBhbCA8c3Vy
YWoua2FuZHBhbEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGV2aWNlLmggfCAxICsNCj4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZXZpY2UuaA0KPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RldmljZS5oDQo+ID4gaW5kZXgNCj4gPg0K
PiA3MTIxZTdjZDk1MTI0ZjNkZjg4ZmEzOWY0MzA3ZGI0YTIwOWZlZWExLi45YzRjYWZkMTVjMTlj
MzliYzA0MDNhMDVjMw0KPiBiMg0KPiA+IGRhNThhZGNlMWFlZSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGV2aWNlLmgNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGV2aWNlLmgN
Cj4gPiBAQCAtMTY5LDYgKzE2OSw3IEBAIHN0cnVjdCBpbnRlbF9kaXNwbGF5X3BsYXRmb3JtcyB7
DQo+ID4gICAjZGVmaW5lIEhBU19ET1VCTEVfV0lERShfX2Rpc3BsYXkpCShESVNQTEFZX1ZFUihf
X2Rpc3BsYXkpIDwgNCkNCj4gPiAgICNkZWZpbmUgSEFTX0RQMjAoX19kaXNwbGF5KQkJKChfX2Rp
c3BsYXkpLT5wbGF0Zm9ybS5kZzIgfHwNCj4gRElTUExBWV9WRVIoX19kaXNwbGF5KSA+PSAxNCkN
Cj4gPiAgICNkZWZpbmUgSEFTX0RQVChfX2Rpc3BsYXkpCQkoRElTUExBWV9WRVIoX19kaXNwbGF5
KSA+PSAxMykNCj4gPiArI2RlZmluZSBIQVNfRFBfU1lNQk9MX1RHKF9fZGlzcGxheSkJKERJU1BM
QVlfVkVSKF9fZGlzcGxheSkgPj0NCj4gMzUpDQo+ID4gICAjZGVmaW5lIEhBU19EUF9NU1QoX19k
aXNwbGF5KQkJKERJU1BMQVlfSU5GTyhfX2Rpc3BsYXkpLQ0KPiA+aGFzX2RwX21zdCkNCj4gDQo+
IG5pdDogUGxlYXNlIG1vdmUgfEhBU19EUF9TWU1CT0xfVEd8IHRvIGZvbGxvdyB8SEFTX0RQX01T
VHwgdG8ga2VlcCB0aGUNCj4gfEhBU18qfCBsaXN0IGFscGhhYmV0aWNhbC4NCj4gDQpEb25lIQ0K
DQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0tLS0tLS0t
LQ0K
