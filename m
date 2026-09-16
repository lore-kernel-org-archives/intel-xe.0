Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88397C982C9
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 21:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E1110E05F;
	Wed, 16 Sep 2026 21:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EoA80PFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D682010E05F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 21:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789594089; x=1821130089;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oeGK8fH/OTj7gF2z1H3YRmdEP8nk9geYf/KEiAZcc7I=;
 b=EoA80PFObXPSvCpA5XefPbKRAK0b+Uwt/veVjTDdnY4bJZFCaQuvMUvJ
 FehsEJp9a8OXwN3ZtCRQSwnFViuL+Fii5nVjfXsRHVInizCaMZXuAcxxi
 dH0BjcWXpKy0cSyLpN1ZAW0klEWadUSgqrPL4E3Yy30Dy0f8qzzs8umuy
 hsSdQ9YgkSkcL0yjfYV15zzmu8BlKJvxKk3BgZhHnRt1rqXx1WjuHfflX
 HeVOtZS905NRv60dcDVSICUQ5M5RMieaGtgAB/Ug1orKwBVYc0P62lyJ7
 5aUxp5CzHgGKH9S8Ud2tNty8o2VMVl6CWuUX8Ao/+f2cKIw0x0pxYrGJo A==;
X-CSE-ConnectionGUID: HQIYJXI7Ty2hLZ+GhCEUHw==
X-CSE-MsgGUID: Od35GBiPReWLvXvGeaANBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93856060"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93856060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:28:09 -0700
X-CSE-ConnectionGUID: d0rhicpcS9SpsFjNjO7QUQ==
X-CSE-MsgGUID: Zh6PDkPPTa+UOQ8mAkGVUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270172729"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:28:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 14:28:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 14:28:08 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 14:28:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6XgBB1GyfgyqYV2QC1EC6JkQ3oS7AP4x37DLiodnLl6aKVYawOlO5dkLGSjU9FB6hhw/y50j9MGsXZya0TRiYwqzNpSUZFCq+kn5iHeR0nDIm+9hrrKCOKyRs84Jd840Tu1+VtSWc1qh0ppjA2zCZjevH1RlJel8CgbAaZEa4sewfmxPQJDNofJtd8tlhTFraANsGAsKtPoXMiShIK29JyBQIbmQ903MzRXzXx0OPpU/uXaXtNZTs/cMXEbbPSDCuJuTZdJ23KONb8GK7mx8TlDsBLzOZSSZgHxF6vukahp5s6fnD+P8QjovdSdAwrUCGQw2EuEgx9YNsfyvUEdxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeGK8fH/OTj7gF2z1H3YRmdEP8nk9geYf/KEiAZcc7I=;
 b=Al4HRdyPcdbqVL2vi3FEkLxSI0oiufZPjLLeAAo5H96JbLmERnhCFFw8wPXRKoMULOKTmj52ccfanzl/dS95D8aHltdTqGczCf/1Vc16QOAvvJ3LYAsT9nCVW5MCjLVwsAJy4C9QdwvfdRRGyarPZ9Ru5EmjDfZ0iQ1UJHOTQ/VS3tpZmVNubIT4scf0yiuPW00vsZdpDN4j2nF6WNMq1Qr1RXi4w8Gbeg1rvopYMiNHD8K9tURhhNgPF0J/Btw3ssqJeHfLSXh5SroRXEUP605GF9zdmrECrgKngcHk1qrENWX0KnLrmFReEVShBV2fZGqc6ewkXBGO8bl/iYIetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by CH9PR11MB759243.namprd11.prod.outlook.com (2603:10b6:610:30f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 21:28:04 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 21:28:04 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Filipchuk, Julia" <julia.filipchuk@intel.com>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Souza,
 Jose" <jose.souza@intel.com>
Subject: Re: [PATCH v9 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Thread-Topic: [PATCH v9 2/2] drm/xe/guc: Compress GuC log and CTB dump with
 zstd
Thread-Index: AQHdRTp8HSIYxZJ8eES3dnnVYS9bzLbRuSiAgAAA5YA=
Date: Wed, 16 Sep 2026 21:28:04 +0000
Message-ID: <e16d3918c3283e4ef9948f2bd3be07837174a02a.camel@intel.com>
References: <20260915174840.531473-4-alan.previn.teres.alexis@intel.com>
 <20260915174840.531473-6-alan.previn.teres.alexis@intel.com>
 <3c1102ba-b2f6-460f-8312-72bac481efbe@intel.com>
In-Reply-To: <3c1102ba-b2f6-460f-8312-72bac481efbe@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|CH9PR11MB759243:EE_
x-ms-office365-filtering-correlation-id: 87a6856f-77d3-4468-c2bc-08df14396493
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: QO22Enqo+jcoAF9GVOCvuAHzkBEqz7HVW0CjvsXB++oDg9x9kvXKPLhq/RbieO2TfRAgV+yRzGAKnrLUiR6IXxIelJ4G1JPa/yzF69zH2y8dBcqqr8N9u5ooMGVlKaMVqaBHgb4cd8PhZC5I1lKFoVr1NtGunX8BwhGsKCtKiKSzZrV/gMd7ccn3zlOsGIzk/Lngh9SUYn1IIr4dbZmkKe0U2B6JkesEaX+Zw+N+lUn854IA4hjkZDRiJJ+mEE8anBtkatb4TwzeEwOZBH26zSVhNp1wjDI+3UbpqjREubekuwMXl2tA838vyjAdc1uTJZqvZ+a2F2XQ8iDCtZtyuGV6WeOcoDEQpgM2mLAs1WWOdNVVk4yFiSfM/Os/FV+jy/mpZep+SEDOfKzMUtP6H7lzgiTo+THpN6Qw7CjS05AQ+z12K+BwhQClzTlY5UNJHG5epSRoTovVXVGiM4BC0YNAnHkifZj3ZLmiRG763L7mVMCjPma8QO5IPIN0fVKsnOKJy12SEpskkOsnUhS0BHohZJnBYfIElPrH2FNfvQ1RqTnm+U+Wo6NDNvaVzKfmNk43sbqChmmzczsJFc/A5KOBs/cNrIbwAd4RopHJFFMekceRvfgH2dVzJ08WF0dhsWJe2ipsl7oXtK7SGcsiVeKCyTdt88mTM0ZbfwmFD4o2MgY1qu0B2XaU7rzwZgKTVEbP/T0bsoKl2g5saA+B1ZYWVkCbxRlTdC9WBKlkjBs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkRObXhGeXhGNmFNOE1jeDN2Ym1IdjlzdkZ2TWlvRnJQNkxCSWI5VG4yVE44?=
 =?utf-8?B?UlJQMkVON0FPNGRUQnVQVkRPMzF4dXZndmtTUEQxTVBlZTd6OXBFbHlzUzlv?=
 =?utf-8?B?RkZFVVloT0dDMDQrT0NLOVd1ZnRwdnRWdVYwWjNhdkVPOTlWYWZjc2pSTXZ3?=
 =?utf-8?B?WTVIZVNzOUw1Q0xaTVlrVGRoMlk3REpqNllMSHFsV3Y4dXdPNlUzSlMrWGtL?=
 =?utf-8?B?aDJiZUh3M3lyYktIZlFjUVdqUWUwYkNsNUtZaFE1OXJYUmlJdmZjOThGYUkv?=
 =?utf-8?B?eS8raXJVRW1CaGo5TWIwYjdDbHlnSTJ2Y2xOd1c2dzM3K1phU3cyWWtRVVJS?=
 =?utf-8?B?Zzl6azQzZ3NHdTh4d3N3S25Mc2hBQ2xiSTQ3VDN3cVFHVFd6TElwTk14UXd6?=
 =?utf-8?B?TW5qMmlDbVZTbmFCLzN3M2VWU0t3RFExUGx2c3BUNGZEbi9aTzk5UHd1Z0lh?=
 =?utf-8?B?eStHS0ppLzlsNG1LQmNZS0xDczQ3UlRWM0ljd0dRN2FKOHA3ZWdQL1hMZVB5?=
 =?utf-8?B?WnpYdzR0YXdWWVB1ekF2MCtYUktiaDNMekxzcEhRaDdVRlpvK1R6NjVEZ1k0?=
 =?utf-8?B?d1NaRHdXZFdBNFE0Mml2OGh1OVFPN1JvWksyZnJHbm5VeXdwZ3lERVRNczV2?=
 =?utf-8?B?eWcrSVd2YnJTblNFYmsvVkRzNVFRQ2lwUkQ5dmJndzFJSHhCeGlPZ1VuYTJG?=
 =?utf-8?B?TmZtQUJnV1RmeDRXQlZlTnRyR2tkWmEyd05YZ1RMY3ppZzcrckZFZmlJR0Rm?=
 =?utf-8?B?UHlKMEF2SU53RGtCTjRvTXRZTWREa2ZnOVY2WHlOTitCU3pZZUFQY3oyUElw?=
 =?utf-8?B?Y2YyZFkzOTc4MGdmaTlzd1FUSUVVaXJQYmJXRXNHNEQ0V09KeHFUSkYrUVpR?=
 =?utf-8?B?dlRWcWo4ZkpuVzlFNzVoeGpLL2l4cnFWTlBjK0ZMa1J3RXRLaHVyRGllZzBT?=
 =?utf-8?B?NW1MNGRPTThBS09YZlUra29hQklHeHRuTG4rUTJvMXpDcytXTTJTWWQyTlh1?=
 =?utf-8?B?VEpvSWhWaUN6SFAwV1pyYXJFdG5BaFZtOWxCaGVFWEYzVlpVNmhlRCtpLzVZ?=
 =?utf-8?B?WHBOdDV4cWF3WXR6SVlVczFQb1c4aWhRUkRLbHZXdGpRNTVERUg3NHcxMHA4?=
 =?utf-8?B?bkFZUVdQNE53QUZBVlJldWhrTk8yWTJkNnJMR3hYYUU0TVM4Q3ZJWjRsSldY?=
 =?utf-8?B?QWdUd1VZWnY5TkRwNUdQQkdNM2FsVUd5aWpRK1hNNmVDQjZqVVZvMEhGT0pw?=
 =?utf-8?B?a0N5SlBVczhPNVNnM29udE1tZ0VSQzNILzhIUjJveU1SWENOaktWZnphL0lZ?=
 =?utf-8?B?Y2NzU1lvbUY1a1VhVHJWME9OTXd2VmtGNHVBSWVNQzB4MXdlNTd0bmVJYnZK?=
 =?utf-8?B?Q2hPUUhTaTVJTzN2S1FZcXplVWZaM2NaMnhZd210d25reGhtM2lLVWRDMmJu?=
 =?utf-8?B?T2VWK0g5RGtyU0hBRG41WnRrZmI0S1ErSXJQazRRM09pREh1ZjZnazVydnFa?=
 =?utf-8?B?TTdpUUhWdkhaNmJ0TTBtV1h2d2ZYRS9tWTNXaVA5R0J0YkkxcVFDbFRxcWxm?=
 =?utf-8?B?NXZEUmhHbTluTTB0MCtJU3lvUXhDMFhXd0NMaE1zTHVsTmJmdVgvNW1hU3lv?=
 =?utf-8?B?cDI4VFdHRHNUdU9MWC8rcFdsTUR1bDQyUDk2ZCtaNDRXWStJZjJGaVl3WUxz?=
 =?utf-8?B?ekxQcnM3SmFOVUluTHFDV2NoR05aZUE5RlQ0ckI0VnJPdXoxODcwNmhJcmds?=
 =?utf-8?B?cmVwcnN0OEVoRzV3UkRRbU1zc1Nvdnk0S09MdEY1VzFiUVVKYlc5OU8wM2hG?=
 =?utf-8?B?dHgxOVliSWVUWEZ1R0dvZm1UWGJpS1hoRDdVL3MvRHNLMUJ4K1pLL2wyMkVX?=
 =?utf-8?B?ZDkxSy84MnhWQ2tjSWdTUjQ0NnlweSs5dWwyQ1dtSEJBUHY4b2dPRTA0dmtR?=
 =?utf-8?B?ZmYrR1p0VENKR3R3ZndJMVE0SHAvSi81eGtnaFMrNFlUUlZwTndPUHhMbEN6?=
 =?utf-8?B?dzNvTTMzSDgvb0tHRVZmR1FkUUhWRElGTVJUcTRUNGl2QXBYS04wcmREY1dC?=
 =?utf-8?B?V3VUVnJtaGhaSmRtcGZFMWQwdnorRXZjV01IL05BSWVwZldnWU9Makk1dnAx?=
 =?utf-8?B?SENnN1FtRko2ZGI1Z0Ixc2NlWjRQYXNtSHZqMkpnc0x2VWRPMUhmd0RrcFd0?=
 =?utf-8?B?S0ljejlXQlBJcFk5YTBzRFRyeVV2RElMcldtKzFxb0R4eHpNN083VldSTUNl?=
 =?utf-8?B?dTk3eWRmUjAzSWpXVTh4SEptQ2dicDVzcStxbmdGUjVxdnpYUXNuK09xb2ow?=
 =?utf-8?B?RGpQMmMrVmQyc1AxOFExWWJaSitkU3pWYnpBQzN2eStjZG5UUmZTUmppakFs?=
 =?utf-8?Q?JNhAem5n9jRHU2UcIqtubxrtvmP4UBnuzOU0H?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B68121D90B89B40BB8CE1C22DB16AFE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bVqoM4upGU+zi/tX32jvY30eoqZkjlsWLlOzqTtFl4xMN2lvyseYPn91u20e7G301EmvwwAJdgGORw0DuLUHI5GSCpByL6VWAFs/w1omtzVdGX1KUHrX+n/nULb90idPFXSHIpcl1CtPJY3SLL3rSy6s9mewuLGMNs976udzXJCm4dzpnvR9XNDCJxvbNUlyFY6lw5eCEBsEdNcL4Tziqtx04z+bJTTjZmU6L993my2Fve1Z4WfVP20ARFDY6AD0LA2usPEbroh5snf0r00hBGad6BpwI5qFFEoGeLQ4nze4P2U8KRP/3ireUJZ8lKcClYFI7IaXGynWpATj4r9RSg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a6856f-77d3-4468-c2bc-08df14396493
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 21:28:04.2661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ReoAy3sREHjzH6Rnyse0AsP8d3v1HnQmF1UXMv4BHLZTE/UxDBQLIBoB+2F3AhxkXmv83m9b2sa5jL0fGUP6AGDmm+c/M2AbIvsiNz7x4W+I9NrEwkAxxtIe8w0Qki7O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB759243
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

VGhhbmtzIEp1bGlhIC0gYnV0IFJvZHJpZ28gYW5kIFNoYXNpa28gYm90aCBwb2ludGVkIG91dCBp
c3N1ZSBpIHdpbGwgZml4IG9uIG5leHQgcmV2Lg0Kc3RheSB0dW5lZC4NCg0KdGhhbmtzIGV2ZXJ5
b25lIGZvciB5b3VyIHRpbWUgc3BlbnQgaW4gcmV2aWV3aW5nLg0KDQpPbiBXZWQsIDIwMjYtMDkt
MTYgYXQgMTQ6MjQgLTA3MDAsIEp1bGlhIEZpbGlwY2h1ayB3cm90ZToNCj4gQ2hhbmdlcyBsb29r
IGdvb2QgYXMgYmVmb3JlLiBXZW50IHRocm91Z2ggdGhlIGNvbXByZXNzaW9uIGxvZ2ljIGFuZCBj
YWxscyBhZ2Fpbg0KPiB0byBiZSBzdXJlLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEp1bGlhIEZpbGlw
Y2h1ayA8anVsaWEuZmlsaXBjaHVrQGludGVsLmNvbT4NCj4gDQo+IA0KDQo=
