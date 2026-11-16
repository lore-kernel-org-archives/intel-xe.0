Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F896606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zk9XIxwT;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=U74D2Cj3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FE910EC48;
	Mon, 16 Nov 2026 08:51:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B356210EA64;
 Mon, 16 Nov 2026 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794819059; x=1826355059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KE5yomLWC6RAYG5ApYTtB0GZO7EFUekiI77FuL0AjVw=;
 b=Zk9XIxwT3ovUGCbiF+1SEO8bXNUKdh1t/P22f5XTUYMvqH/Av5/Iw4W4
 OXs1qKdbP8vAubEPCX1L1XkjhtMtue5f3Hq+8hu77dBIfkANs9Q/YLQ6E
 Aox2EwrEZuxyS52NHWtx2W6vdy5b4lBLRiyWkha62yxa76cKxgn3jcrdK
 k3bqv2xM9FY7HEIkdeXB4D3m2egZCBG+gX5qE7xH4XSayDe/3MLUIgkCU
 zH52wInggKyN5om0auDhjPUoPEDr5DWhTOv4dBlUsnw37Wz57xXxOteAZ
 TSip5RyNAwF1tcFo0KGGdm8JZqnydg1mfGBORoVueBupFI1iaC+7UEaoU g==;
X-CSE-ConnectionGUID: klLwirLrQJ6KfakTnnRC2w==
X-CSE-MsgGUID: nWHBdtjHRBOgIGQPPXD9+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3544246"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3544246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:50:58 -0800
X-CSE-ConnectionGUID: 6DgClakbR5azWwRhYU4biw==
X-CSE-MsgGUID: g8tUYxXhTBifoFEJVj+qyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9382217"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:50:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:50:57 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 00:50:57 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:50:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlXRFplq9MkmX4FFsBo+4rHUQvB4MLUMnCBg2EDjxgP9R6zYYm4eHg848jYJPPs4b1HayRJMcw3cOO6fweLZpxzwPh/OqJQPzM6xHjkB71ckpNl/P59ivqu6wr6KbtBEN/IFSCbZrNezwdy3CaAxVtKQLfjn6cjUTPFBd9FByyxocPhkIyAw/8cZ+R2SIpNNzTshdpGA/XDvd6Px77e+IJ9n4VSG2wUvsmPWknuBzQlrjA7FXtb5zrBiYbuje4EVzxshIx+eY6/oQezo51NkDKMxbJqlWnTXFrVJ4oHZK5D1qviYIFmQPs7+MTeMA+t7ULrq6LuWGP0Rqt9uydgNig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KE5yomLWC6RAYG5ApYTtB0GZO7EFUekiI77FuL0AjVw=;
 b=cmqCtArwRIiRb71IzH9ilXxryhR2T9ISOzBYuwtB8O8Gw40DUxLBZzv3E5H0Mr8IehTvMt531tEcU8Fkq0b6lXymExYUYmQ/IK9FFaK2SBVYmSj68WHv1CIoOYP1KU8Ks2h28dYmRE/asCJ58dV5u6v/greuRCJBwwJOB91/b7SFOE8hM3Gx8itcXmfsH43p3lu6CqdEKmIcrpkOMVOKBaqp0pO1Nn+PdEie8iEWA+mL4ZW3SqM5dOjqDyMRmwpT5Dd+ng8pOg8JEMTIgyVNIEyTMqe/6TZUhvYJfRnLaQ9hQTgCIwVYtpAz72xDcUD6VEMRx2kFL34H1xuicwferQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KE5yomLWC6RAYG5ApYTtB0GZO7EFUekiI77FuL0AjVw=;
 b=U74D2Cj3yW+XSofAy0HjeNKaXqR1p7tSYXjQn9gQr/DO0hrkBrTrRkWiWwdp5TwrVEtVWb69/HCUeQ+tTskf/Z7LVYwHTXRtqqAIOyNEUEtKBMW7+zvECY1SlpbE3M4cHIqwEXoi3m/7gvv5YOwRSiBYWgitzi5FFhUxmUS3Cdg=
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by DS4PPFCAADA7A6C.namprd11.prod.outlook.com (2603:10b6:f:fc02::4d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:49:55 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:49:54 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v4 2/7] drm/i915/display: Add the DP link layer symbol
 timing generator registers
Thread-Topic: [PATCH v4 2/7] drm/i915/display: Add the DP link layer symbol
 timing generator registers
Thread-Index: AQHdbAzUQ52UMfaLa0qeCsMXiQeY8bcvGvcAgAFbrtA=
Date: Mon, 16 Nov 2026 08:49:54 +0000
Message-ID: <SJ0PR11MB5039A5415DA589F38DBAF817BA7C2@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20261104-vlk-64036-dp-symbol-tg-v4-0-d06fe6c466a9@intel.com>
 <20261104-vlk-64036-dp-symbol-tg-v4-2-d06fe6c466a9@intel.com>
 <7b272ba2-4e82-4dbf-aa8a-12a9c44f277e@intel.com>
In-Reply-To: <7b272ba2-4e82-4dbf-aa8a-12a9c44f277e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5039:EE_|DS4PPFCAADA7A6C:EE_
x-ms-office365-filtering-correlation-id: dfdf82b0-0848-481b-2f63-08df43be9602
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003|261028144727099003|261026140227099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: T5sJicAnriVQ0DepAzINUKsxZJK2IhZnpNy7nbtFYoYntnp9lCYqSE6W6+ihE80coFI53EZx8EIpqN+HsJCSe/Uu8Rdpqpta1Ois4vK1mL+D0+P6dFLpagEE7Klrb0JZ1DeVqAY2ncRZoU+iUYDyBEYH5jU2Iv+p3WHShtK7UTpTU45koVBzlJhtqesg1hXrYC9cGGxaQxQb38r6F1+Q3lK5UdMYPdUK4u/+qFf5E6Q10C6tOL6f4IwPqNJJU5q7k+jleB7yO9B0abuLBbqdV+Q50SZ5mz/zoXkpYENmKw3OVBqswwnEdePvR8cA09X0/dljaCnWSGiDv+cgeYjDyqou4Iemij+UFr1xzZmoBXNa1s3u9skFpGnQlM9C9F0E/CQOaT9/G0R90q9iufmN4zV22JXQEilR1AY1ACJikzzG0Zqw3whV8x6qZ3snpf4xx4L5RKNiARCnPXYuTvVC1deAEt6D5W0Z0wJjMUvkEasiw8RvCanhPWWlEZoMyP55kwnTfpc8p9hUaiS2I9MJ/Ha7oVtx3TAsmjbQM/37XxtU9FbAEB/l1DzDpOZGOoA6WNzxHSANzl0/iuhuSrMagXbXYB/2NyTE+s0jcw2O56leBg5dIBEl+hQFy8TNAd/y1ti40L5BqljZpENc39m+T4YTU4UAorauL10i6wRxIbg05XEWcb0+CI2I1BW2Mbabery0pa9v2CL+Mj/BcdXB8g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003)(261028144727099003)(261026140227099003)(261022105027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlJwNHdIYXVzN3BuWlcwelNqeEE1cnVTaVVTbE1UYnlCYUZyM3dhcGdEVFlk?=
 =?utf-8?B?cDVsaXo3aTVGUWVRZ2VVMHF2TUR2cnR1RWF6NlQrMzFVNUdaU3MxSFBHMDhi?=
 =?utf-8?B?VnhUc2Z2a1JQTnJxUk1jdE1RYWE2UGJpckYvWVpkYVhZNms0VjBqTW5HWVlp?=
 =?utf-8?B?MnR0VXNaRm94Yll4cHlsRitFbEFVbW1WMUhDV2NXKys2azlMRk9LeklKK0Va?=
 =?utf-8?B?UG4wdHFjQ29yQy9kbTJVSmE2eWhGRFJjVVhpNGJpYlFROWo5TXZWWVJCalA0?=
 =?utf-8?B?YmhaU015OTJRdyt4ZklLVFZqekVzaXU2WFNlbVQ3NzFCdWx6V1hnSGl4V3Vu?=
 =?utf-8?B?cTJIVm9nVGNLdHVFbCtYeHRhODBkbUF0T0NvQngxbUVFbkg3aDFQMndwM2p4?=
 =?utf-8?B?OHcrUFB1SmRXZi9pQ200UndQN2taN3pnZG00OURVeG51cVBtRHE2clhkVXF5?=
 =?utf-8?B?Q3oyNngxdkN5U3F1QmR0L2JTRGgwZ1c1UGNFZUgyd3ErdXlGN2kzM1l4SmFS?=
 =?utf-8?B?VWJQcmVDUFBsUlZzSzM4RklOa3pNY3A2ZWlMd0gyL2Q1TTBKV3Ywc2xYRW1O?=
 =?utf-8?B?VC85d1l4d1I5RmdQWkE1V1pLLzBJa2ZzV0d3NVQwVWl5ai9nUk54WldERlZy?=
 =?utf-8?B?cll5VlFmczMybVVMSDE0aGRLZEJTNkdpc2lWeURVYmZiR081R0Q1M3lETmlL?=
 =?utf-8?B?S0tMZE5lWWFXVjVkbmQ4TUNPd28zWUgwbE50VUV6ZWJDR3ZLbHQrWkVDSmxT?=
 =?utf-8?B?SlUrc0w0NUNCd28rRWU0aUc2MnJpeTVxUWIvR2ZPWXcrampoTjNZWDc3UUd5?=
 =?utf-8?B?Q3M1M1pmdXdDbWhKcEhGeVFvYnhBaWJoM1VXK091UlBlNW00dFdOdUtJNmRk?=
 =?utf-8?B?SVIxakNMTVhFZjZ4NzVFejJTRjV2TGVTNUJmUXBHNDh4R2dhTmxwNVhlbVNt?=
 =?utf-8?B?NkViMVR0V2lIVWtMRmpCbFdtK3R1Mi85ZHdVNSswTks1K1J5Nm1sTjZCRXA5?=
 =?utf-8?B?TGRSOCszSXMzdC9hb0ozdFZudnhCTk5Pd3RYRHpuK0FUamljeXZPUEJjbUtN?=
 =?utf-8?B?SVFXK0pWTk9aRDdMc21WOVlMaXJFODR4MDJTVkZUMEpmeTVTVkZ4UVY2TE1y?=
 =?utf-8?B?NGRPK2hyWnhiNFlvcTZqWkFRcElPT0RjU1RTRDFJWlJjLytTdmdubVpYcGhv?=
 =?utf-8?B?NkJWSUZrc1J0T1BEMEdTenNrL1NFNlQrMXNwQnBNaE01OThVN29YVWRSSkpC?=
 =?utf-8?B?elpyMEtsdmkzRkIzb0NsSmZFemJ2R3NhdlN0QlpDNFo4YUZFY0RaQUdINHhL?=
 =?utf-8?B?M2I5L0NqWjdRM0Vvd3o3ckdjdzl4NmlhSE4yWmJjR01PZVZkdFZoMmVoYXRr?=
 =?utf-8?B?ZUwzRE1YZUdqejJVSW9KSUo4ZCtJczd6blgxL24wakE2dEdpQ1FselRSODZp?=
 =?utf-8?B?d0hudVplaHpEVUVaTnNzTjVkMGhaSmoxS2VGUEhadldhdlpFc0UzNTkyaUFn?=
 =?utf-8?B?NVZBYVhEdHA2Y2xaRUoraytnSVIvTWZydkt5cWdibExjUlYrYUcvb3hUZlR4?=
 =?utf-8?B?cUx3bitNdzY1eWJmVUtxWUxsazQ4RHZFcGtsd0o3QTJlcldWM1ZJbzJSamNt?=
 =?utf-8?B?QWpiWFp1VTRFamZ0WUZGN25uL3E5SHBGVm9QNFBDTkd2b0s1TTBjbEdHWTZM?=
 =?utf-8?B?VEpiZHBiVkd4T1QyM3BRdHdleWdvSHRkc09qM0piUVJnbmd6ek1ac3VpMnpq?=
 =?utf-8?B?QkkxdXEwTGtXZjJJYndiZ0E0NGpBeG1Vd0g2WVNJWjd4UDk5TjVoN0VrZTNT?=
 =?utf-8?B?Z1BnZjhvczdlZUJVcHUvMC8yc0NzOHo1L0VLalE1ZVRyQkZzNnZJdTIwdDNu?=
 =?utf-8?B?eDB5VXJSK0sycFIwTmFrYXVkM0tHSUJaWUJYM0FsYkMwVFBGdzBQeUs1czZP?=
 =?utf-8?B?clFUcDFYYm15TWt2TXRBWGJtc08xSEo1cnNveHJiWkpKK0ljekJtU1hDSXdX?=
 =?utf-8?B?bG13R0lEa2RDVHFJN2lnMTdsdXdGQ01rdW8wNkpZUkhvcmR2WVBaRWVySjU5?=
 =?utf-8?B?QWp1YTNiK3EyOWJhYW5SUkFrNDRpcEpvL3dxcDhzWDhPL1FEbGZJSnE4ZVBD?=
 =?utf-8?B?RFlrc3dwM1ltQytvTGoybjBkZXNYbjdVRkljaFk5V05sSElxTjc3UXRkYUJx?=
 =?utf-8?B?RGc1WmNUVXFqTEowdm82cytGRjQ5QWJNWTQvdTUrcHIwejBnZko1RWlUSkZQ?=
 =?utf-8?B?MEtBWlozcDhzcllUNFdXRDFmMldaeStZcDFFTEV3dHR3OTV5SjRxc2xDU2dj?=
 =?utf-8?B?Um5xT2t3Q2FJL0J4VDRxV0EyVERLejhpd1NIWTZKUk1HLzhKYkFjdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: W46du1mar3mhux0tvy8CAlu3VddluNAiWARPEbZXWH92ScaNme/vKuwGbo6OjQltnixLssywiUAfTT/WZnTeENXjTI7QZbdMEK2P0VpSXis4DPXlCUlcXD09E6LAa5Q2Y1ujwM9qcEbJxMWhPlAl6KNlpOkdOaCcA4dqvXvoi7MGh1fvUcSg10Q1wueqQTtnepk6bLiJ/sE2N/nJ8maHszMLPi+6YtodI19mYhwpF+ySi8oxvYR0hjJmbs5npAJRBe98disEojAR71YAMttwk5x+vF+hoQG4hmHxZLJPswT2CzvLFC6IWWL45E744UVQcoZ3zy00UQHupvsXoCTJ9w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdf82b0-0848-481b-2f63-08df43be9602
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:49:54.9208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qWg2KpMzfBM7AW+Va7qS9kHaZdRAS87NJFXgovkvPMze5bl57n+eUopDPOb/MrG5IPCY7Gas14cBDRvDy/+9Hw==
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJvcmFoLCBDaGFpdGFueWEg
S3VtYXIgPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+DQo+IFNlbnQ6IFN1bmRheSwg
Tm92ZW1iZXIgMTUsIDIwMjYgNTozNSBQTQ0KPiBUbzogTXVydGh5LCBBcnVuIFIgPGFydW4uci5t
dXJ0aHlAaW50ZWwuY29tPjsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAbGludXguaW50ZWwuY29tPjsgU2hhbmthciwgVW1hDQo+IDx1bWEuc2hhbmthckBpbnRlbC5j
b20+OyBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjQgMi83XSBkcm0vaTkxNS9kaXNwbGF5OiBBZGQgdGhlIERQIGxpbmsgbGF5
ZXIgc3ltYm9sDQo+IHRpbWluZyBnZW5lcmF0b3IgcmVnaXN0ZXJzDQo+IA0KPiANCj4gDQo+IE9u
IDExLzQvMjAyNiA4OjU0IEFNLCBBcnVuIFIgTXVydGh5IHdyb3RlOg0KPiA+IEFkZCB0aGUgZGVm
aW5pdGlvbnMgb2YgdGhlIHJlZ2lzdGVycyBvZiB0aGUgRFAgbGluayBsYXllciAoTEwpIHN5bWJv
bA0KPiA+IGJhc2VkIHRpbWluZyBnZW5lcmF0b3IuDQo+ID4NCj4gPiB2MzogY2hhbmdlIE1NSU8g
LT4gTU1JT19UUkFOUzIgKFN1cmFqKQ0KPiA+DQo+ID4gQnNwZWM6IDY4ODQ5LCA2ODkyMiwgNjk5
NjENCj4gDQo+IG5pdDogVGhlIHJlZ2lzdGVycyB0aGlzIHBhdGNoIGRlZmluZXMgYXJlIG9uIDc0
NjA2IChUUkFOU19MTFNZTV9IVE9UQUwpLA0KPiA3NDYwNyAoVFJBTlNfTExTWU1fQ0hVTktfU0la
RSksIDc0NjA5IChUUkFOU19MTFNZTV9IQUNUKSwNCj4gNzQ3NDcvNzQ3NDggKERQX0xMU1lNX0RB
VEFNL04pIGFuZCA3NjE2MC83NjE2MSAoX0VYVCkuDQo+IEFkZCB0aG9zZTsga2VlcCA2OTk2MSBm
b3IgVFJBTlNDT05GLg0KPiANCk9rIQ0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVy
dGh5DQotLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
