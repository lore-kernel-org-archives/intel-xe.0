Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0707CC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 09:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA0910E3F6;
	Wed, 12 Aug 2026 09:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGjyDku0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D317110E3F6
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786527654; x=1818063654;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YPC/x+9+Dl6l3U3SIeWOedhuRvZGO09uQkQjaoLQ9oo=;
 b=DGjyDku0QaWE/3NGeNOBVt8thI08EKm8gGHOko2CoIJTnbJVd7BFPIdz
 MJaPQjNdwwVmRmrR8UT9kDZTJQIAbBmHzPJEs1z4zzt9vFdX2HbCf6+xn
 dhBSp9UfRHypHTdYEY6Bh+VomFUUqq7Cai5jam5YDuaaeBiODz21Py/Me
 tzK365W1eiy/vQEFcqmf+2OLNlY2saP2QHKuCPl5FnPxBw7hrJKaTFVD8
 GPR5msrQzYinnCEUp337CqSv1U+bzgcqqo8/r62Vwte46CT6fCeAS/8Q1
 c+cC3YXH+RVs1oyuO2jt3GBQ54HII6Ci8kYCsp9jCpih9JoFC73N5b9O+ Q==;
X-CSE-ConnectionGUID: sl6z/RUfS5qOQTtbesHbxg==
X-CSE-MsgGUID: 7b1qOgc3SR2OtmNrSjd3zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90752042"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="90752042"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:40:53 -0700
X-CSE-ConnectionGUID: jf/TQI0MR82oDVN5OBRmDQ==
X-CSE-MsgGUID: d+8lFd8NQ52OJT+vuDmsRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="265593431"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:40:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:40:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 02:40:52 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7Ztc/f/QGp3upaKDUh74LHIGV2kkjkrIi8PRnThnpICBq0r9gco802lvLPftJnLRkGI5aeFvmskKPBihPSWJDDCQiieCFOKLC2meo44Ml8lvg7jHROMKDCoEwck4nUX7uLZ1NKE7AVdMoeTuQYpzk8jR++tN2pOHERSFt98fHXD7DMAYEwGbyqm8jToUM1CjrBz2EEDrbvXmZakU13XGjP7/JGeJdrqSuEmOb/iuJSHCGqXqREBSpHodrx9kOex6GX9aPWZZSzLc+D56nnQkYLYAZ+iInIr3zsUnvs5LS9TjI34fCJRNZd6cbMNcknlHvMbW9HGti9kP8e9J0MJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPC/x+9+Dl6l3U3SIeWOedhuRvZGO09uQkQjaoLQ9oo=;
 b=hHMnxLFVOjlMb6WulYrFLyQdZ4LaDd4bBxrT7qqNrEzJlbXfSSsz9+4WQuTEF6PLZgWEEGjDKFaKx+Ia2FKbFvI5tAoX7OhlNK0f5cFf5l4rNibwQYNApIHt2A/sSOuwHW0tC9dB2L/R0vEup1GDZVhw3cN66L37iaJi9xiRhhH8EADX2WJJezcBh1AIyALUhvPNOkagxhik/LrDegxarUUn/GS8SFFoKLVTUDBMEKqJYO35cRz9eEp8YT5d4CaLXzsRCKLsD8uQ5uUKhlP0wfGQJbygJKGhIwCGRb7JErB8ygbm2BTK6ei8s5lyo8EpUbMnVj5aHTYuF4TxZrot5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CY8PR11MB6841.namprd11.prod.outlook.com (2603:10b6:930:62::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 09:40:50 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 09:40:49 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V15 06/14] drm/xe: Guard teardown paths against purged BOs
Thread-Topic: [PATCH V15 06/14] drm/xe: Guard teardown paths against purged BOs
Thread-Index: AQHdKY6oUS+hdReu4Ey+bq0id42p87aZwPkAgABooNA=
Date: Wed, 12 Aug 2026 09:40:49 +0000
Message-ID: <DS0PR11MB871813DB5B8C0291088A343181DC2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-22-tejas.upadhyay@intel.com>
 <cfbbf77f-27d0-4489-984c-5a509ad85cbc@intel.com>
In-Reply-To: <cfbbf77f-27d0-4489-984c-5a509ad85cbc@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|CY8PR11MB6841:EE_
x-ms-office365-filtering-correlation-id: ed16845f-9431-4556-d915-08def855cb40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|11063799006|38070700021|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: vhIzfIaj8g0OTI5XosVKFyVygX4s63joIi5VeLCK6c6LXk67HBBG/kQajGQVVqiv20yY9W0r407ZPhhoHuvqgJvYpmeMb9eTcZ6n/GuyCh5CDEm1J5wz4M16IWomFci0KgRRzEt+UrRJ35dumrb5bEepTG4S2Jzazc4zjE9hATMOU+RrZXwU3HotWnym/P7q8DchT2tOr73UNrGpT/ThM+TrWEiWGlQYok+CivegqhNWgo8k54IbIfJoBstD8vwQzYyal/q0cb8NrC/bBqKJjY5LqraQaTj8u2J72vevfXcpuAiNtp36u8iirZ8IoxVieALAvrOCsqM1Z/6HhsHxGyOlPynLawlrZTMzWrgjgPnnk/4Pvn5239Xge7MOO4qZREs7zxGhWJYLISG3GGqCv7KDwQ0uVbz+N8+J2Wqku8ijh6einYoB8dPfdKb6D6CVfmshfR797X9kh+PEFSIamfft2jVC9LYgbXsD6uaw+uS/wPc2wQCbLWPHA++T8ZLffs7CJer8IZtAqecvuVS3v3nF+qdhQTvnUcA4s7Td9aJrbsdane+peV/sjY6DqE0N7RV5nBQYc+fPP+PRbwcUcP/7ojB7/zMsWyyKn+KmsWhs5RYWhHjtt9S1DZhgYZ0vJpy88DH8NSS55Z5nOugI1q51tkf76sdDoguJfaYBXqJ/XrV/jeVDTXiaZXaJH/vOZG6UqXxPd3B29sf/OfAgVxxl18tThDRV8mXFn0NJGnU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(38070700021)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU9xYUFpNDdrSk0vbCtsNjRnTWx5UVBTdGtQWW81QU9YNmk3c1pyaG81ZFEw?=
 =?utf-8?B?MG8xOXpxVzcwUUpSNWpLZlZTSjI1cE9nQ3pSTTZOZVhBckl0Y25xSkd4YUR4?=
 =?utf-8?B?eWJSdzNsVzlYWHZFOHdPeWRLckdsTlB0VzAxbTEvcW5mVzRmM211Y1hSWENM?=
 =?utf-8?B?ZEliTGI4MTN0UnZjaklZRDUwR2pYdWJjQmI2OTV1c0NRKzRtb1RSditmRnoz?=
 =?utf-8?B?RFM4THIveTF2d0UzS2xSeDRYRTV5KzRDaVdQeW9rMGtNQnlqdDdNcnM4a3RH?=
 =?utf-8?B?VXhGNzZYaUU2UVBGOU9hU2hkNlBSSDJZSWVaRjlQRHJBRW0xSVRKb3M2aTBq?=
 =?utf-8?B?bFp6UTV0VnphclZPR3BKa0ZPSWxrdDZDQTJrRXh6KzdUQTQ1bHNWRWd0QVRY?=
 =?utf-8?B?c3hXd3BFNzMzREszWVdmZHVUU3dwam1wQzNvU2l5MFQ5U3BORWFyOFlueVY2?=
 =?utf-8?B?OG1rbEM4WEVObTFSUStiSUVDRzhLdWhqTXFhRUIxbW1jWmlQYnA0ZG91Nk9K?=
 =?utf-8?B?NjFndXV6d1pYV09veUNuVGRuUXIvVVRjTVpSNjVhcU1nNFBRNVVPQkdrV09O?=
 =?utf-8?B?RmVOOEw2QlI2OWUvSTQ5NDFXZTVlUE1QaWJtNlExZ3VZUjIrZWRrU2FNaFlS?=
 =?utf-8?B?TVlDUDZGRkc0TVdoVXFHc2pxRStLcFQ1V3AvaE50djVLMWFya2xTUTFyNnJE?=
 =?utf-8?B?UXdhTnRpVnBhellURGRjbnNCZ04xeXRIbEJRVlZzK3hVM2hTMkhxaXVvNGFi?=
 =?utf-8?B?OGFHNkM3SFJoUnVnWVFLVE8yZVlVM0UzUC8xeDZEZERCSTArVUZFaHhad2tU?=
 =?utf-8?B?VDA1b3hXVGh2WlV0cmFQbXY2QTlId3l3Ylg5WUlmTGswK21OSkhyb0JXdHh2?=
 =?utf-8?B?cGF2eE00Qkh3dVRtZy9nVzNVWGVmTHptekIyTG1KdXI3UmF0RGdOeHhibmZk?=
 =?utf-8?B?MEFXZ2doNnozZUpXcjJvMGdDN1owclBrZE16OWEwRjVuTGpaSGFGWC9zdjFs?=
 =?utf-8?B?VUZ2cWZUVGk5Mkt2cWJoSG80Q3B0Vko1Z3FEVDd2dFZmZVZrU2JNeDhvMytP?=
 =?utf-8?B?Qm45QkdoalIvdTk4QkJtbTMvT1o2eDViOWdqOU01dGorRTNCTEE5a0cwL1RJ?=
 =?utf-8?B?Vkxud2RVdkZxQkhUc3FDV3prZGFlYXJkaHBHSXVnMjFYK1pDczdvUHlVbzk3?=
 =?utf-8?B?Y21MYXRDM3dzNWVJWnA1ZDYvempqTnNpT3NhWVhhU29JVmNkT1cxT0NWSWZR?=
 =?utf-8?B?cGtZL3ZWYnVUeE9zeGY4ZWZ6QlZaWmc5UnovbEwxK3RwLzBqUnJmaWxnR0RW?=
 =?utf-8?B?ajlQWE9aRTlmdW1IVlg1QVZUOXN3U2tmcDAzeHNNN1c1WFAwbFRFN2xMNHFu?=
 =?utf-8?B?UWVyeUZrY1MxRzE0V0NaeHl6WjFGOGxuei9nK2QxdzFLdXFwWVdrNUN4RVNM?=
 =?utf-8?B?azliaXBhbThQdk1wbzdFZHpZS1FlUi96YjEvbDhNcDNWVFZSZFlTMk5qMVQ5?=
 =?utf-8?B?NHhKbzJrbkdoWHh6dnc2TlhPaXpZMjRQV1ZGZnhtVEpKR3dBQjZienFpQkwy?=
 =?utf-8?B?d2psWUZaTHpFaUliUEhZa0NWTTFqR20vSXc2TGNmeHMxSUlVTTg3MUNpZHJm?=
 =?utf-8?B?WktWdng1ZjhSVTNwVlBKYVBqa09zakJsOGlyN0UxcFZqZUVrbEdQcTVRVDhi?=
 =?utf-8?B?cW1XTXN0eXNLUjVqUFJIVUpzc0FteXhjVW94ZW5sY09TclcvT3p2WURDZlU2?=
 =?utf-8?B?Mm44aWtkTG5laEo4R21mZ1JRbUV0alhqaUdFdHJENWdBMXV2QW9IbmN6MXBJ?=
 =?utf-8?B?Z1N6SDlKS1AxR0RKN3Y4dnlzTjFHV1YrN3czZElhRWIyaWRRN0xFVm16VVR6?=
 =?utf-8?B?QjBuVU95Y3Z1M3FXcVZFWkFTTHgrNDU0T05TSUhsaHY1b0Fad3JIT3pZcnpU?=
 =?utf-8?B?OHlQb0pSTGdlanZRdG5jUnRwNDFYM3JWSTFHRm5XNWEzZDB2WDI5NThvaFRo?=
 =?utf-8?B?U2JwaDB1ZUV5cDV6RXJzeElDeTN1bUJ5OGJlczJJRWI1U3oweEt0MU1nMmJP?=
 =?utf-8?B?dzluSDFoM3NEYmFmR0hpTUd1OHFYekZHNGRxTVF2cURVemtiY0piQTB6a2ZB?=
 =?utf-8?B?enU3MVdJVG5KTStjWHM5VHBad2tHeVUwcU02MGk3cVJxN1N0dG5nbkY4S2hk?=
 =?utf-8?B?czRObGx3VWpadWtkVkNzdi95QTI5SkkrVjAvOFBWaCtvNnIwUEwyMis4eTBH?=
 =?utf-8?B?WVRUSU42ZnNoMEdYY1ZlUlVyNkhjejM0cEJXOGNFajZyR1R3ZGJuN0VGMlFE?=
 =?utf-8?B?QjByS0luUGowT2d4L21sTm9iMm9tZURpSjBlODVxaVhNclZFVUlKZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: i4DJJAad1HfAdU3iBFhIcvi3I41iau1u/PVtHnZR0iSP0/xq6MB7AYJqKyMf9t9iRrFGdNDDlGuyP0Hb5jthPU9bXLCgBqhwpikpnZttUVzheYDibtvkRjazIg4sU6F+JY5ra86y0c0TJZULGRDx4DHHXQKnFA0WlsRVZm5RxavgfLTZIi97BcEoZ2Xj4aXLArlFS63dhNwYIryZRywfDYp+NpWw9i3ROhUMRzJCqEJhcaggywNHJ6OaxPB+LCs/nzVISyhsVZBMnpxtopykUhG4PmHeFkNI5VVLW2nzf7Unm9cv5eGNlR4zQizUX/UKTYdPqlREPJvqcJS/pzechA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed16845f-9431-4556-d915-08def855cb40
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 09:40:49.8748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVrD4m23uw9065TjVrbSsVQj1bSo4S41D4Fam/THKWhv+bCXyCEn1oRVCe4KZwDABIoGWqyk5ZLQ1GX/5EosGpVXL9hDEia6aabr7V7Nn4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6841
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2hpbWlyYXksIEhpbWFs
IFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU2VudDogMTIgQXVn
dXN0IDIwMjYgMDg6NTQNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50
ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIFYxNSAwNi8xNF0gZHJtL3hlOiBHdWFyZCB0ZWFyZG93biBwYXRocyBhZ2FpbnN0
DQo+IHB1cmdlZCBCT3MNCj4gDQo+IA0KPiANCj4gT24gMTEtMDgtMjAyNiAxODoxMCwgVGVqYXMg
VXBhZGh5YXkgd3JvdGU6DQo+ID4gVlJBTSBwYWdlIG9mZmxpbmluZyBjYW4gcHVyZ2UgQk9zIHRo
YXQgYXJlIHN0aWxsIHJlZmVyZW5jZWQgYnkgcGFnZQ0KPiA+IHRhYmxlcywgZXhlYyBxdWV1ZXMs
IGFuZCBETUEtYnVmIGV4cG9ydHMuIEFkZCB4ZV9ib19pc19wdXJnZWQoKSBndWFyZHMNCj4gPiBp
biB0aGUgdGVhcmRvd24gcGF0aHMgdG8gcHJldmVudCB1bnBpbm5pbmcgb3IgbWFwcGluZyBhbg0K
PiA+IGFscmVhZHktcHVyZ2VkIEJPOg0KPiA+DQo+ID4gLSB4ZV9ib191bnBpbl9tYXBfbm9fdm0o
KTogc2tpcCB1bnBpbiBpZiBwdXJnZWQNCj4gPiAtIHhlX2RtYV9idWZfbWFwKCk6IHJldHVybiAt
RU5PRU5UIGVhcmx5IGlmIHB1cmdlZA0KPiA+IC0geGVfZXhlY19xdWV1ZV91cGRhdGVfcnVuX3Rp
Y2tzKCk6IHNraXAgTFJDIHRpbWVzdGFtcCByZWFkIGlmIHB1cmdlZA0KPiA+IC0geGVfcHRfZGVz
dHJveSgpOiBza2lwIHVucGluIGlmIHB1cmdlZA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGVq
YXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oICAgICAgICAgfCAzICsrLQ0KPiA+ICAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RtYV9idWYuYyAgICB8IDMgKysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZXhlY19xdWV1ZS5jIHwgOCArKysrKystLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3B0LmMgICAgICAgICB8IDMgKystDQo+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2JvLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaA0KPiA+IGluZGV4
IGVlZGU2NzhhZDMwMy4uZGZjZDBlNTcwNzNiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9iby5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmgNCj4g
PiBAQCAtMzY0LDcgKzM2NCw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB4ZV9ib191bnBpbl9tYXBf
bm9fdm0oc3RydWN0DQo+IHhlX2JvICpibykNCj4gPiAgIHsNCj4gPiAgIAlpZiAobGlrZWx5KGJv
KSkgew0KPiA+ICAgCQl4ZV9ib19sb2NrKGJvLCBmYWxzZSk7DQo+ID4gLQkJeGVfYm9fdW5waW4o
Ym8pOw0KPiA+ICsJCWlmICgheGVfYm9faXNfcHVyZ2VkKGJvKSkNCj4gPiArCQkJeGVfYm9fdW5w
aW4oYm8pOw0KPiA+ICAgCQl4ZV9ib191bmxvY2soYm8pOw0KPiA+DQo+ID4gICAJCXhlX2JvX3B1
dChibyk7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kbWFfYnVmLmMN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kbWFfYnVmLmMgaW5kZXggYmYwNzI4ODM4ZWFk
Li41ZDlmMWNkMjRiN2YNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZG1hX2J1Zi5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RtYV9idWYuYw0K
PiA+IEBAIC0xMDQsNiArMTA0LDkgQEAgc3RhdGljIHN0cnVjdCBzZ190YWJsZSAqeGVfZG1hX2J1
Zl9tYXAoc3RydWN0DQo+IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLA0KPiA+ICAgCXN0cnVj
dCBzZ190YWJsZSAqc2d0Ow0KPiA+ICAgCWludCByID0gMDsNCj4gPg0KPiA+ICsJaWYgKHhlX2Jv
X2lzX3B1cmdlZChibykpDQo+ID4gKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7DQo+ID4gKw0K
PiA+ICAgCWlmICghYXR0YWNoLT5wZWVyMnBlZXIgJiYgIXhlX2JvX2Nhbl9taWdyYXRlKGJvLCBY
RV9QTF9UVCkpDQo+ID4gICAJCXJldHVybiBFUlJfUFRSKC1FT1BOT1RTVVBQKTsNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+ID4gaW5kZXggZDZjN2YzNDZmNDli
Li41NDMyNzEwYzFjZmIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4
ZWNfcXVldWUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMN
Cj4gPiBAQCAtMTU3NSw4ICsxNTc1LDEyIEBAIHZvaWQgeGVfZXhlY19xdWV1ZV91cGRhdGVfcnVu
X3RpY2tzKHN0cnVjdA0KPiB4ZV9leGVjX3F1ZXVlICpxKQ0KPiA+ICAgCSAqIGVycm9ycy4NCj4g
PiAgIAkgKi8NCj4gPiAgIAlscmMgPSBxLT5scmNbMF07DQo+ID4gLQluZXdfdHMgPSB4ZV9scmNf
dXBkYXRlX3RpbWVzdGFtcChscmMsICZvbGRfdHMpOw0KPiA+IC0JcS0+eGVmLT5ydW5fdGlja3Nb
cS0+Y2xhc3NdICs9IChuZXdfdHMgLSBvbGRfdHMpICogcS0+d2lkdGg7DQo+ID4gKwl4ZV9ib19s
b2NrKGxyYy0+Ym8sIGZhbHNlKTsNCj4gPiArCWlmICgheGVfYm9faXNfcHVyZ2VkKGxyYy0+Ym8p
KSB7DQo+ID4gKwkJbmV3X3RzID0geGVfbHJjX3VwZGF0ZV90aW1lc3RhbXAobHJjLCAmb2xkX3Rz
KTsNCj4gPiArCQlxLT54ZWYtPnJ1bl90aWNrc1txLT5jbGFzc10gKz0gKG5ld190cyAtIG9sZF90
cykgKiBxLT53aWR0aDsNCj4gPiArCX0NCj4gPiArCXhlX2JvX3VubG9jayhscmMtPmJvKTsNCj4g
Pg0KPiA+ICAgCWRybV9kZXZfZXhpdChpZHgpOw0KPiA+ICAgfQ0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+
ID4gaW5kZXggNWQ5OTBjMWMzNzQwLi5kYmYxYWEyNmEyMWIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cHQuYw0KPiA+IEBAIC0yMTIsNyArMjEyLDggQEAgdm9pZCB4ZV9wdF9kZXN0cm95KHN0cnVjdCB4
ZV9wdCAqcHQsIHUzMiBmbGFncywNCj4gc3RydWN0IGxsaXN0X2hlYWQgKmRlZmVycmVkKQ0KPiA+
ICAgCQlyZXR1cm47DQo+ID4NCj4gPiAgIAlYRV9XQVJOX09OKCFsaXN0X2VtcHR5KCZwdC0+Ym8t
PnR0bS5iYXNlLmdwdXZhLmxpc3QpKTsNCj4gDQo+IG5vIGRtYV9yZXN2IGxvY2sgPw0KDQpBY2ss
IGxvY2sgaXMgbmVlZGVkLiBXaWxsIHRha2UgY2FyZSBpbiBuZXh0IHJldi4NCg0KVGVqYXMNCj4g
DQo+ID4gLQl4ZV9ib191bnBpbihwdC0+Ym8pOw0KPiA+ICsJaWYgKCF4ZV9ib19pc19wdXJnZWQo
cHQtPmJvKSkNCj4gPiArCQl4ZV9ib191bnBpbihwdC0+Ym8pOw0KPiANCj4gPiAgIAl4ZV9ib19w
dXRfZGVmZXJyZWQocHQtPmJvLCBkZWZlcnJlZCk7DQo+ID4NCj4gPiAgIAlpZiAocHQtPmxldmVs
ID4gMCAmJiBwdC0+bnVtX2xpdmUpIHsNCg0K
