Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6FD606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 11:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E65tcYRf;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=YBGkgxjU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8175F10E727;
	Mon, 23 Nov 2026 11:51:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E4910E727;
 Mon, 23 Nov 2026 11:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795434668; x=1826970668;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=/ZVpDvbPVIA0xQoI7n7JAVo4e6VRQtO9/YP6d3PbRWg=;
 b=E65tcYRfGvW85qBeDPFuw5Jv21FfzLLbZ/m83rQMigRXEKEvFM0hvZYc
 o00eXb5l2ilFVZi7ZAe6hNvzimnsGCrQ/ALtWfibZAGh2z9xaDKC5y6Gk
 q+xxKhbi4fbxL5UgBZGqL+UcdhkEP2ndYGe95VbhO+UMGEbAdmuLrkq/b
 Lp9kaqaVNq4Ex8xPCOC+Vkvfxbpm47JmUahq8Rj7SYScXRZq+a6MjXN98
 EsTbxL9Q4o6IbHCNA+qOx0Hi0tYKJ5t2Aov3JlHsVM3qRkifL/WIWVkvn
 QnEoSvkN2IcClNyA2hRQmbnxV2US0xord1niH8QMwaH0E2WRcsnngaXlw Q==;
X-CSE-ConnectionGUID: iXOD+ZoITcWtUXF2xuaI3w==
X-CSE-MsgGUID: 2OK3u8MKRg+UqkXLIZ/GEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4086070"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4086070"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:51:07 -0800
X-CSE-ConnectionGUID: bHmiZ8niTOWfp1duKPMeug==
X-CSE-MsgGUID: OIjOK5OXQA+iJINn/Ldj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11828892"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:51:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 03:51:07 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 03:51:07 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 03:51:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K05RgfcZ/Dhjgri/BDE3y6u0fBn2jGUvRvcfY2U7JDbWFVgC4er5jB/gkh9FRfBh4Pm3QWcfbihRbXgOmF5YUmir85J+hbHrIZj1np6V2ucvIzvOZvO3Fo76y3X7ZT8CXj3OeuE3aBJ6NoIWcJMFY6e9MNapLGrPg814VriuTs46IF2zvNTHfCmAjqZTNxoqNg6eCl6SxF6CMhAgJVJ52dIXsJgDmruhBn3Oc59OstKN9NJzo5m1/I84oOmZ/mx8bbRsdrw+wkOn8y5UV3RO1R652PMDtz+kj4HZxh3sCcNL9gGxMCgGMOOCX5vQuEu5zjroZsyQxDsWhUXbivhd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZVpDvbPVIA0xQoI7n7JAVo4e6VRQtO9/YP6d3PbRWg=;
 b=KDoNqZdhIh9y9+EiI4wZokl2Y1Pe934m4CJmXkTj6D76lK3IXLPvHqD+Xu9jMN3N/cFXOsi6ZpEMJHD33PBvGzSZ3YVn5P7cmBR9llQp5/hi/DnW+04MTHkOdHSvPhSV3/V7WVT0Elm6e1g2StRvHRRrUh4kOU+EGeB4taGUd5CvlqeSOk/6TBKoXFuozRhJ/y7B03mrr5rITCwlTfSsgSB0OM3ve6LC5yVlWK/p2cdD71ap6y4jgPK59Od3WyfRuAGzBOslaZL82kZnUgCZxilCG9ckRRPGfwTolJNmjWHDpvXN7LiZi+dHoYTLr38EXCBurARNPIq1bbHcWgsMyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZVpDvbPVIA0xQoI7n7JAVo4e6VRQtO9/YP6d3PbRWg=;
 b=YBGkgxjUTnuaCxjb2517DdYn1ZL3EjrVpju3r7x6LN4U1nSBwVJ/w+zdb7KTzHzc0aX+VuBuApI7QRbJGSp3pmo/kPNb/1N5xJ3Tzv0A3DOuM6GzMUH6VBwq6qXESxUtyti6EBnByyh+eCtTHxZfIHXOgAmPd29CwSBdKZCcXpM=
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 LV0PR11MB340236.namprd11.prod.outlook.com (2603:10b6:408:3ee::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 11:51:04 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 11:51:04 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/psr: Check the transcoder for eDP Panel Replay
Thread-Topic: [PATCH] drm/i915/psr: Check the transcoder for eDP Panel Replay
Thread-Index: AQHdcpWF33zKxjjwPUG4Ek2BsT8Bw7c7nKgA
Date: Mon, 23 Nov 2026 11:51:03 +0000
Message-ID: <24748c56d82e05ca8275fe1278d0881ff383437a.camel@intel.com>
References: <20261112110345.571870-1-mika.kahola@intel.com>
In-Reply-To: <20261112110345.571870-1-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|LV0PR11MB340236:EE_
x-ms-office365-filtering-correlation-id: 1024bfd6-8b4a-4ac7-5ff9-08df49580d6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|38070700021|11063799006|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: kFXVv9Xt1yJGmf3TpsLwSgkYkzgH8HOPcBBmvH7odLWUOyv+iWQpkj67UoqIXYQxdFfdBw0QEyS1lo57KFV4NyMVqhbvYZUjhd7Av8lneMBOI/CAI5OD2xFFBXvNIPzPURAwdEyMC4Ynyt9tGExC5ITYTe/+M1mtzJoy00FLZr/zAi4aJ9k541aiJjXRRoNTKsI37wiebgQ1UqVbWmvvX4O259qkIX0AV/+BC58TBk/u/U7FPR3N2Z7Utbiet4DiDe+FyIc+QG0xa+veQswEEhsbBCIhuWEKKIJL4noe55S6LU39ArIiSdDxTNDL7sggGBJqU6rZoVT7hQzijyUwEXqNh1isIgGpFeKuOA5JwWcu2HoUshcYSlBZyDdotsHhn/GOpfUVTGRHOjfGHcz99pBfjEFgRC0JZbiub6L0ZpW2SulJ1VOVKABvcpbUdgV3HnwvquGmVuByCtTy0t7/Ox1oDx0ImV55ioqLgwXqHnFutdp6NcGJiO0a9CskSkmpNz7Wj0Gt3UORoMqMIU4+LA9oFrlDfdS3Hy5cplZ8GrNno5cKyUWGi2h0O5Pyh/uDmfnQI1zNXLMFz/PyxwK7oE7dAJyMRqoJ8CxW5y1YAYcf/EN8jjz+AV/5LAG2LIRJ580WUR13i3phCh6Oc4Bi+nyT2PjiePd0VQBE0AaugnUtrPwnRu2XIt2YzMQMehPbH4ehv4FUDlQ2/isHBJ8xnW3e2n7PANr72gyNJ3psGnE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(38070700021)(11063799006)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dm5xYlgrRjNReklQUGF3eUtqK1VmdG5NdklTWnZvQ25DZ2FtQjBCWlJaVjlO?=
 =?utf-8?B?cXR3b1UzYmo4LzBSVlJFR1N2cXVkWndvbWpJN3R6d21XdVNwMXBqWndwcElk?=
 =?utf-8?B?dmJvcXlFWU90Vzl5NmVlc3EyVVp5c1VVNEMvYnJYUzl0VE54WlVUVTlYQWpu?=
 =?utf-8?B?RXlNOGoveW9QUU15UnJJMTAvOFhBTWFQNTdjUERtTngrcWhia3lzNEh6MG5p?=
 =?utf-8?B?SlNRRWRiYTN4Qm4waDB1bEVBdHk3OVcxOFYwRVNaV2RWK04rTmN4b0VFbFBF?=
 =?utf-8?B?WWVwTlZSb0lWZGdOb3RPckJJZU1lM3BIMzE0MCtWY1o4bEtrZmxUUmNsdlQx?=
 =?utf-8?B?QTdRR2Y4L0I4VkZEOW9TVW5DbVhpd0ZiL043TXE0TWt2QUZidTUwcVZKRVNH?=
 =?utf-8?B?MXZOdzd1RHQyUU8yOTdJOVBJeVJQOW14cVdCNUFYSW1jWFZ4NnFZOWlDWVVE?=
 =?utf-8?B?SUtGZlVkTkFBUnM1MGtEdFJ0eHBUWVlpV3U4eGUrU1RhdUlKcjJ5eHJjQ1hq?=
 =?utf-8?B?UGd4WDUxZmNmS2JWQ1FOQVFpOTh2VHVTKytlZ0lkajA0NXYwUGNScVYxVWZv?=
 =?utf-8?B?QVpOMTRqUGlXYis2alVCd3ZFdk9tZm9ZMis0VS9RRWpMdVg0d256TDA4bzVL?=
 =?utf-8?B?U0QyaTUyNGExVk5LN2RYU1JFLzM3d1dMSVdYeEFHNUQvUFVGMzhsSURPdnc0?=
 =?utf-8?B?N0crYm1FSjdnbVUydEw1T29jbG1FSEsrTGkzZHdlbUQyQ0VRclVQOGF4RnRH?=
 =?utf-8?B?SloxbFhOalRmY3J2QUNRN1ZZTGplbklCczAzSnEyR2NPVGVEZkJ0VnpBVVN4?=
 =?utf-8?B?UU1QTXk2L2pQUUlXUlBCOGd0MnVWWmM1T0NFTXkwNVFFdEx0ODJETVIxckhp?=
 =?utf-8?B?U3lFb2ZHV1RJUVRKSFk0TSt3bXFxdjhtekxXVExKT2NUZmY4SEJTb0QyN2hF?=
 =?utf-8?B?S1VYb1pGQTFtajBWaTZvcnJPMmMvbnB4aGo1ZnB4UFhoaWhheHFmMlRaNVZR?=
 =?utf-8?B?Qk8wKzA3eGZlaUZvRW5WMjMyM29WNkxuM0VGcCtUOEM5QlB2c085NFpYVXQ2?=
 =?utf-8?B?RjBVUkdBTndWS0dXZkIraU10ZDRabFpIYVdDb0dOUTVYaWN1d3hBSGhvUU5r?=
 =?utf-8?B?cGRqQlB2cjJWQmhYWG5JMWFHYkFwVVZWeDNXUU01WUR1aGpNQTIwdVZndEkr?=
 =?utf-8?B?NUpNQ21kZm9jSG5CNG9Sa0cxQndESEFEWE5FbWhxLzhGZTA5UDcrM1NvYzZP?=
 =?utf-8?B?VUhDUWNiZ2l4NXZlR0loTDBkYlZSNkEwL0c2aHNhNUZiZFBmOVYrK2wyMzJS?=
 =?utf-8?B?c00wdWxTSCtZZXBZVmc3TTRqYjNjdWNITU1vWVFkZDVaemVNTEo4UXpmbVZv?=
 =?utf-8?B?MTVoRVZIS3V3MEVmazNrQXlrTWZ4aUJGZEpCWStkTWdMSTIxUUN4bEtVR1FH?=
 =?utf-8?B?Z2Fka0JJSHU0OUtDQVRiZER3Wjczb25QRTBadFFxOGdQUWZYRCtkc09vcUth?=
 =?utf-8?B?UjQ4ZWdqTTFXYm1JYlNLaEFLYXNxTUlxWHNUWFpWaFNDYU1qMkNNTThnSTk3?=
 =?utf-8?B?dzdmVGkrbzFZeHVvWnEzNFc2emlqWHAxNDJJb1dHNEVwNTlqbGEyb2NGV1VY?=
 =?utf-8?B?NzlDdnZyWG5MY1J1QmFMQVFoVURLQjltcWFRQXlQbjZLQmFlenJObnFKOExK?=
 =?utf-8?B?ZWFQVzY1VExpRkprUlg5bW1TVkxIRkVoMTdnM21GMjNxb05lRE00dmJscExv?=
 =?utf-8?B?ZitJS3hEU3FEbGpvbTlmUFc1ZWxabWtkY09XK1pTYUVOV3pSTE0vaTlIKzdY?=
 =?utf-8?B?UWgwRjFXSW02TUJDU2ZaNzMxMnQ4QVFUMzFST0p1Q2IwdDd1TGlpRUFOenpx?=
 =?utf-8?B?SzcvckluZlVGY016ZmRISVZ1Nk52bFVLSG1FR1FEVjUwbzFTQzY0Q0pkaUtJ?=
 =?utf-8?B?dEQ4QStrNGpjK0pvN25XeXJ3VXBEUUZZNjZGRHNrR1JlbUZoN1d4UHl6WDM5?=
 =?utf-8?B?NWdYb3lKYkhtN1FMYk1iUGhzTnZRSGxBbTRuV09lNEZyUGR4OHBleFIzemgr?=
 =?utf-8?B?QmZvQ2I3eTROSXV4SE5uRzI4dUNWZi9mRW5sbG5lcmEzWlQ3TW1Sa2c2WHhw?=
 =?utf-8?B?NENFN0Z1NndwcmxQaXdyV1ZKQ25HbUVkcUJvKys1alYvTXhvUUlaSmRSd3gw?=
 =?utf-8?B?R1RISDJjYzRZN3ZuMS9TUU5WdC9hRWVOQXBxOWc1MFBadjQzUjFFc2EwY04r?=
 =?utf-8?B?b1lJUzRqdyszTXhXK0xsM0JpcWRkZFE5QnE2algwV3V0M25XV2xTS1hYN1dq?=
 =?utf-8?B?cnY0eUdWdnQ0VmUrVzB6ZzJMVkVwR1FoK0JpdDFEL1NVOCtnbEZvRzVmWkJp?=
 =?utf-8?Q?/MOj5Tb6hRYfMvu8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8A13D40CF1D314BB1CC2AE31B7695C0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LkoKheaW3sSff/kkcVv3CAiof3efFqWUbrlZ/Kwu7WSF+MyFhwlaFETNml7qE7Q1tkgaxNtKvGoD8MWChZ4BRKMJvP1PFuh/Am9+k4kc6xLejoKgl7+ooAIHz/OsiRqe4kLVBzHtlDUQRB6jaNm9tkZDsgO78W5P3oYvtbsPZiWpyrQB37s0OOMbeJU3b1UWhaKqeaFYBdCyJS6UJ1Sa+iHQu+o9oSmo6HWbSgdFoXFbY0IdkglFNRIybgjwVC9s7CK644+rnBT0YjCHsCnXW9hZ5ocVYgZEnek6Xw5qAZ31VbF0Dd/EKzqH8aZWyAgiXtAuD8Msj42CcphuCLA36A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1024bfd6-8b4a-4ac7-5ff9-08df49580d6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 11:51:04.0196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /QnyrhzKZvB7BOL5bLgPeMYvQTcQNgMfZAE0d71dxVan//ImH4NPux9oXUXey88+yJVhpPrN0tFplS3h6p4oeybKhjXxdjoF4U08qL5F+Qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB340236
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

T24gVGh1LCAyMDI2LTExLTEyIGF0IDExOjAzICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
UFNSL1BSIGlzIHBlciB0cmFuc2NvZGVyIGFuZCBqb2luZWQgcGlwZXMgdXNlIHRoZSBwcmltYXJ5
J3MuIENoZWNraW5nDQo+IHRoZSBqb2luZWQgcGlwZSBtYXNrIHdyb25nbHkgcmVqZWN0cyBhIHBp
cGUgQiBwcmltYXJ5IGpvaW5lZCB0byBwaXBlDQo+IEMsDQo+IHNvIGNoZWNrIHRoZSB0cmFuc2Nv
ZGVyIGluc3RlYWQuIFVuam9pbmVkIHBpcGVzIGFyZSB1bmFmZmVjdGVkLg0KPiANCj4gRml4ZXM6
IDgyYTI3MzgwMmUyOSAoImRybS9pOTE1L3BzcjogQWxsb3cgUGFuZWwgUmVwbGF5IGFuZCBQU1Iy
IHdpdGgNCj4gam9pbmVyIikNCj4gU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhvbGEgPG1pa2Eua2Fo
b2xhQGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9n
YW5kZXJAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfcHNyLmMgfCA0ICsrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3Bzci5jDQo+IGluZGV4IGJkMTY1NjM2MDMyNC4uNDM4Y2IxNTAyYzI2IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gQEAgLTE3NTIsOCAr
MTc1Miw4IEBAIHN0YXRpYyBib29sIF9wYW5lbF9yZXBsYXlfY29tcHV0ZV9jb25maWcoc3RydWN0
DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsDQo+IMKgDQo+IMKgCS8qIFJlbWFpbmlu
ZyBjaGVja3MgYXJlIGZvciBlRFAgb25seSAqLw0KPiDCoA0KPiAtCS8qIEV2ZXJ5IGpvaW5lZCBw
aXBlIG5lZWRzIGl0cyBvd24gUFNSL1BhbmVsIFJlcGxheSByZWdpc3Rlcg0KPiBibG9jay4gKi8N
Cj4gLQlpZiAoaW50ZWxfY3J0Y19qb2luZWRfcGlwZV9tYXNrKGNydGNfc3RhdGUpICYgfihCSVQo
UElQRV9BKQ0KPiB8IEJJVChQSVBFX0IpKSkNCj4gKwkvKiBQU1IvUFIgaXMgcGVyIHRyYW5zY29k
ZXIsIGpvaW5lZCBwaXBlcyB1c2UgdGhlIHByaW1hcnkncy4NCj4gKi8NCj4gKwlpZiAoIXRyYW5z
Y29kZXJfaGFzX3BzcjIoZGlzcGxheSwgY3J0Y19zdGF0ZS0NCj4gPmNwdV90cmFuc2NvZGVyKSkN
Cj4gwqAJCXJldHVybiBmYWxzZTsNCj4gwqANCj4gwqAJLyogMTI4Yi8xMzJiIFBhbmVsIFJlcGxh
eSBpcyBub3Qgc3VwcG9ydGVkIG9uIGVEUCAqLw0K
