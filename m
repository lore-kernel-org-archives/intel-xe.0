Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFCFC982C4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 15:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0417A10E82B;
	Wed, 16 Sep 2026 15:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhTV5WuH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9A010E8F1
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 15:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789571687; x=1821107687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=z8Xd17E/nsY4kKKYClrQij4JMFusI/Cf4G2+Bn00lI8=;
 b=bhTV5WuHnrA/jEJHjrAKVOZLLLCwNZGZ4iEmmbl1g1DogltHDQEQ0SNE
 XElFDFRAUQZ4t2A+p/7fIY7oazVqLPAk8uav3mjxCWugjD0lilGL0WE7I
 /fQkxOXNFTOWDLle8MrMyfuDdY9qgLbQRn4tJayJLYbFbIOfIzOLafb6Q
 Xr2Dj1JYF3OLEX8YbGvuowl3fFJjuaTcxHvT6VZaQIlCJ5lCndLnIh1sQ
 ZI+WFflSeuSjVWYVGWTIpyU2XuyI67QdHFzGgr3m2ur7VTQbtIHwmGo0M
 Yb2RWzN2NYOe6YRIE6xy9hx8MFsQph5v7hjOvzsOcW02ZxtEQMjCzCsQ2 g==;
X-CSE-ConnectionGUID: 4E5myNRuS8C1Sxi4hwRhiQ==
X-CSE-MsgGUID: XAwnsL8BQX+NPKrQjBnHwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89820005"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89820005"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:14:47 -0700
X-CSE-ConnectionGUID: QrUAnhqZR6GQwyZwdgb8FA==
X-CSE-MsgGUID: UpY/H6wbTzGpTAVS/GHb/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269665136"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:14:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:14:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 08:14:46 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:14:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAzHa3e88inm7G6S9vFKWpLJZlb9a5Bi8DeSa61RoCxAIPiVensL5Xix7JdUUYJn0k6PodTvTcp+GW7Q2I6wZkQmHakCIgTaUTcEty+0P57m1cEpjX6mx1ujKeX2U06lIDjDmby/oyRoMS87Wezbt8RHTe63Xs9ikbI3NMx2YN83fNgfCCJ9FuBe3xdNzFWMQevFJm2tGIS6Dk8Z96gEFFHP47WGleOzqP9GCaR81xijbKNszgVaBcGqQJj+gJ/Lv/znffko0hJyhZDveYqRf6CV2HDJ6H8Gou1TyBYVNQYYWn8lFhXWsKWpWjAHJvCBXLsWrGjNI6EOIbApqgsCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8Xd17E/nsY4kKKYClrQij4JMFusI/Cf4G2+Bn00lI8=;
 b=HpW3CGUiuZnYPuKLOKUo/1YXsa9gwk4n1Y9q7ZfI01rbaUsjU14Erxy7vFK8mAVCWKqpA/QiWuzTZahuOpgGdetZIeAV4+1/SSl4i2wJ8HKA5G2WzrEWJJ3SoEZ8qysSMZVqcJsHpRdTCj7klen7EnC7vUCXI7R4RWGT5VK0nntE/pKz3l4+08vdzB4H5YzcfBbUWvT3KiS0lRCQ4T6dNGCj4T5H5Nce20QGTA8d4sAWNheXgAoTXYBWuh4/I3Kh7AbNcBmkMjTF5vVf+blO6jo3mLJJh+IKhQQE1qYsM30R3vuhT7lPB3jfM2nZmpv/9kbyj44yzBN3sTmOMHSvyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from EA3PR11MB986640.namprd11.prod.outlook.com
 (2603:10b6:303:309::14) by DM4PR11MB6238.namprd11.prod.outlook.com
 (2603:10b6:8:a8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 15:14:41 +0000
Received: from EA3PR11MB986640.namprd11.prod.outlook.com
 ([fe80::3730:4166:198a:d33a]) by EA3PR11MB986640.namprd11.prod.outlook.com
 ([fe80::3730:4166:198a:d33a%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:14:41 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Dong,
 Zhanjun" <zhanjun.dong@intel.com>, 
 "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH v9 1/2] drm/xe: Remove extra newlines from LRC snapshot
 dump
Thread-Topic: [PATCH v9 1/2] drm/xe: Remove extra newlines from LRC snapshot
 dump
Thread-Index: AQHdRTp6/pxVJmChDU6hrfKvffuqnrbRUJSAgAABPwA=
Date: Wed, 16 Sep 2026 15:14:41 +0000
Message-ID: <919c928e509d4deb0a0d12fa5c7f27baeedb3e46.camel@intel.com>
References: <20260915174840.531473-4-alan.previn.teres.alexis@intel.com>
 <20260915174840.531473-5-alan.previn.teres.alexis@intel.com>
 <aqqxaYPw0O91VFAx@intel.com>
In-Reply-To: <aqqxaYPw0O91VFAx@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA3PR11MB986640:EE_|DM4PR11MB6238:EE_
x-ms-office365-filtering-correlation-id: 4704e017-2222-4858-bbb6-08df14053ba7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|6133799003|3023799007|10067099003|56012099006|18002099003|22082099003|11063799006|4143699003;
x-microsoft-antispam-message-info: n0fZC0AD8M15095nBMSrEK53qhkM1pgMniUabS096x0ZTuTjnq9BFilFqAaf+QCgpPGuL2Jrec0QPpbtcUgbRlC30q/m+oAeU1qtXO0v0Cb0SQOgptBFhrwOfnorPLG56ehwmp9nq2Kee5UAzYNddi7DQpL8gs81X/efxqM592WvrL0gmoIuOQO0r2A8qR/iIA47ya8jhCL4AGQ1vT5ZRbO+fdHuLp2YcLFWAjFqW1KsxSPmyJArMokX36qnlB8UjX463Dyv0kfrMUXhvQxYASGEuokexrWCD1i4h5oXRqu3DlN8eorgFqrlqitWIGRI3aqLX4ZkPWcpal66AFzrscncggQlVGksaTbJ8lFbpq4ncB5t+DejcscwzuvBExV3LeCH1nEnCyBOX/6k0FvdazehPnRuWmbDn9GxfBmnQZrejYkiW9uwBhvtdT2keg+JGLj2bub9wwo6nTzj2qnXr3jonktnS806Uepj98+eNeLdWxilABdDFUrSM7/n2bR0iy3CH3kwLFoKZpQCgeJzg4YgNW81j4FrP8wyqKojLJnEHAciiaHVOXbvTfWxvflnX1aJLjeDzyAamW2qNVyLwFGN+Uxiv+qLv6FRVkeHcKeLKtQlWDC4e3dqMMJaTFEjuGYnfgNn54OXjQf0p3T6FSYe1BXnWz5vlSy5yf/ENZw0VID+5gMapvewix56liRUV8IaGCZ2MNqDGo46RLLEoDo8n9wZabjB2rBLlqyS+nE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EA3PR11MB986640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTZiR0dTb0VScDJsZDNROGJFeTdhL3ZZVWg5ZlFET2U3TE1MRkhZVm56K1Ex?=
 =?utf-8?B?WXZUYm1hZE84VkdLall3d2Rud1pvYkFuaHUwZ2RiTU5FbjZ2TmJQK2Rpayt6?=
 =?utf-8?B?Z3ZEcGRrUzRVK2JPWEthV2d6d2dkR0FRa1ZzbzY3QjBEaFZtemNBaWxnam1T?=
 =?utf-8?B?SlJxQUNmN1l6QnVjKzhVTWJsL1A0eFp1SmlYRHJLeWNFQnNrSStHelJUeWRz?=
 =?utf-8?B?U1EzSmNtcE1ZeHJVTElzcWhoNSt5eGtpamRDRUtkeEhPUDZBVnMxWks4czZY?=
 =?utf-8?B?SVVHYzBWZmhBczVuc0ZxY29acEZEcWNyZnh3ME1ObU9Zc3pZU1FyVHdFYkpB?=
 =?utf-8?B?WGFsMkxhaHI5RDhTSVZvcjNqYy9BZFlrSThUK2p0L2Q3YWRBMjM1djExSHJD?=
 =?utf-8?B?S2VhaGtXMDVuZE56RmphRStOV1hYZDByRXBxYWFjVXJqS3lwT0lqa0g0eW9Q?=
 =?utf-8?B?bzlNMitkbjk4WHBwWUlrRk91RDlkUDBZRHVjdC9FSGJjcXJXdnVKemtrbmtp?=
 =?utf-8?B?a3ZzdHRmRXErTE91eFlDbjFzWUZyR1VFZ21GS1ZPSWRsaEtsTEFpY29Kbi9G?=
 =?utf-8?B?REhNWUhLWTV0S1NUVG4wOEFLVVV3S0xzSWorUGVHaHF2WVdUTXJQOUYrdGw2?=
 =?utf-8?B?VkMxV1FJYUF4MVZ2Yno3MUUxZ2llTWhtbDVhZTlMaS9URFZwTFhHVTQ2V0dB?=
 =?utf-8?B?V0hIeUFjTmdRcTdFb3hvUDFLM0tXelFpTFQ2RFdRdnlqMnFTL1RCaXpJVWxU?=
 =?utf-8?B?VjNIVnZmcWozUlRPK2Z3OU8xNEgrRFVNbWR6M3dkUlZOUGkyZkhFOFNDNHBt?=
 =?utf-8?B?SlNOaTJJakxBOGZsei8vSmNJUFNBODNNMXNnYUdoVU41bkZjVWIvRm5NVmcw?=
 =?utf-8?B?WkIzZDV1QkFSeHN2L2VWR25sam9uMWx0U0F0Z2dENzlXS0Z6WDdTbHE1cmY0?=
 =?utf-8?B?SE9UVXhiQXo1NUp1dnZHcFRwSDVWbWwxdjJMRUMwV2MvN0NpOFlDUUNtMG12?=
 =?utf-8?B?d2RUcW1XZ1N6bVMxYklWbVplSi9lNzJrME9TWWJQbWVJc3BtVDFiTHV5bUg1?=
 =?utf-8?B?NWdGaEVJTlhFL05YZVk4UFUyejZDVkR0QTJDVzV6a1JnUmdTenYzUmVWSTFr?=
 =?utf-8?B?SHpaUTJ3cGdySzE0L1VOeEhuWW1XbHhWUlJnQ3lKVWt5UW9WK0w3UThlQ1JZ?=
 =?utf-8?B?Y2tSMDRqQlVKWEtwb293QXBWYnp0Z1FFN2RIdm8vVXNaOGdrTVZSOHZSZXpk?=
 =?utf-8?B?L0w1aVJ6aG9HN3IzTHBCOUFybVdJTWpxT2JHcVF1WTRBc2JkUmxMNkJXdDlL?=
 =?utf-8?B?MEp0VzVMc2psSHZvSUE1dm10WXN1Z2hFeUk5MUp0d2ZVOTNtb05DaTJuaE5P?=
 =?utf-8?B?NjM1Q2l1cnNJWndxZGswUE5aeG9aZEZvK3d1WkhNaG4xb1owK0ZHZkZ1bm1J?=
 =?utf-8?B?OThrc09VK2hjY0FRTUg0Z1pvRGtYWCtPZ0R1TEpOaFY4N2V3dlFtYllzbW96?=
 =?utf-8?B?WnJ2MUIrYWNXeWpRNWN1K2ttanpZaW1TUmgrWWc3azN5bXNWV2F4Sk0zNXZX?=
 =?utf-8?B?SjNKRy9CbUFhbFgxSFhNMmtjVUx6WElGRHlKTFRna2NIVEdzc0xsSkw1empG?=
 =?utf-8?B?amtXaUpyVjdrQXF1V205NWFJQUNrMXlUdWZ0cjdqdGgvWHZiUUkwWDlvMG5Y?=
 =?utf-8?B?cy9EUEhzTy93RHVMdEpNR3p2ZnBXUlV0ajRadnpOZnBBVDBJWHkzeEN1NS9D?=
 =?utf-8?B?bE1pd0ZEWXdFUmNLZDZKTFNvc3VJMmh1WXBZMFVyc2cwbnRVNVZjd0xycTdC?=
 =?utf-8?B?b2JwZkxoaWppckoxWWhmVlhBU0N0QWJ4bWI5YUhkdjAvUW1qWFdJVVhsLzlP?=
 =?utf-8?B?dUJ4R1VjU1RUQ2JqcnBqdHBJTDVqOFg0a01hVG9uWGFWb2pEWEdPT2piOVQ4?=
 =?utf-8?B?K0ZBMWVVNG1QcGFNL2VYRGFwcXM3dThWaE1TeVNvSkhyMlJnanU2Tno1VGI3?=
 =?utf-8?B?U1B1YXdHdXhDcUE3RGgvMHJUQnFvWS9wSHRHazZPandTMUY0UExsT0JNSXdk?=
 =?utf-8?B?SjBRNEE2YUJab0kxUDJOVmUwUXQ2OG52bm5Lc1pLczJRSkVuZmV0WWo5Y0sz?=
 =?utf-8?B?MDZUV2UrMzRuU2dxaDlFVjh3bTJGdXVTRXhlbnUxOVZ0Z2xNK3lLeHZyU1cz?=
 =?utf-8?B?YS91SHZ0MHZUajhRMG5TcVVodzR0UTJzUmk0dXFqNERTdGdSSzVKL2wwMUdu?=
 =?utf-8?B?bnprZ2JSajdCRDA1aGFxV201WFJmNnMwcjFjMEFBaFdaZG5BZU1xeUllanhy?=
 =?utf-8?B?S256emtsd2FEWWRwTDRRU2ZtYkRPVXkxM1hmaThrR3VyQWtWSkhYdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <059FEDAEE5724F4D901E6FB00EDC88F9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DGhL6210bhy+H0phAUTYB6Fag8+r0/UD3PbS1EgkeIa4UiPcoHOF7GhSrs1+ilfC92TC1OQtNnsz5XviKt0RvH+XkMCsCk48clr/U7eB+nqMnkRzxQsV/+Dhd5PAMXfIeJuo7O91xpqlntQk1esMZzC+piZDf8NF1JXNaJRF//Cl+7UKyC2XPR46jCecLbyIW8ju9XZvY7oeyd8JmbGsgUlQX671jsFOlvvWNZ0NdLoReyZnCREzbk3GhVr12zHQAmS1/GrK//CmNd4mTi4M0ptbDwHBgP5Cskfla4NFqCMGw68+tvSGisyC6quaCl2lyYIxUrI/mWFC3IPdBi9bNA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA3PR11MB986640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4704e017-2222-4858-bbb6-08df14053ba7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 15:14:41.7691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3IkQvyu2SgJMdejwlWTsPfOVdGg0CthTMCPuG8Wb1PELzmYFRnpc+YyK3ssXOCPUWHQzsrKNDjHFcnJ1oQVpfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6238
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

T24gV2VkLCAyMDI2LTA5LTE2IGF0IDExOjEwIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFR1ZSwgU2VwIDE1LCAyMDI2IGF0IDEwOjQ4OjM5QU0gLTA3MDAsIEFsYW4gUHJldmluIHdy
b3RlOg0KPiA+IEZyb206IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4g
PiANCj4gPiBUaGUgTFJDIHNuYXBzaG90IHByaW50ZXIgYWRkcyBhbiBleHRyYSBuZXdsaW5lIGJl
Zm9yZSB0aGUgcmVwbGF5DQo+ID4gb2Zmc2V0IGFuZCByZXBsYXkgbGVuZ3RoIGxpbmVzLiBUaGlz
IGxlYXZlcyBibGFuayBsaW5lcyBpbiB0aGUNCj4gPiBIV0NUWCBzZWN0aW9uIG9mIHRoZSBkdW1w
Lg0KPiA+IA0KPiA+IFJlbW92ZSB0aGUgc3RyYXkgbmV3bGluZXMgc28gdGhlIHNuYXBzaG90IG91
dHB1dCByZW1haW5zIGNvbXBhY3QNCj4gPiBhbmQgY29uc2lzdGVudGx5IGZvcm1hdHRlZC4NCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERvbmcgPHpoYW5qdW4uZG9uZ0BpbnRlbC5j
b20+DQo+ID4gUmV2aWV3ZWQtYnk6IEp1bGlhIEZpbGlwY2h1ayA8anVsaWEuZmlsaXBjaHVrQGlu
dGVsLmNvbT4NCj4gDQo+IEFnYWluLCB5b3UgbmVlZCB0byBzaWduLW9mZiBhbnkgcGF0Y2ggdGhh
dCB5b3UgYXJlIGhhbmRsaW5nLi4uDQo+IGluIGFueSBraW5kIG9mIHRvdWNoLg0KPiBJZiB5b3Ug
YXJlIHNlbmRpbmcgdG8gYSBtYWlsaW5nIGxpc3Qgb3IgZ2l0IGNvbW1pdHRpbmcgdG8gYSBicmFu
Y2gNCj4geW91IG5lZWQNCj4gdG8gc2lnbiBpdCBvZmYuDQo+IA0KPiA+IC0tLQ0KPiA+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jIHwgNCArKy0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9s
cmMuYw0KPiA+IGluZGV4IGYxY2YxNDYzZjFiMi4uYTk5YzdlMDQ0YzRhIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9scmMuYw0KPiA+IEBAIC0yNjMzLDggKzI2MzMsOCBAQCB2b2lkIHhlX2xyY19zbmFw
c2hvdF9wcmludChzdHJ1Y3QNCj4gPiB4ZV9scmNfc25hcHNob3QgKnNuYXBzaG90LCBzdHJ1Y3Qg
ZHJtX3ByaW50ZXINCj4gPiDCoAl9DQo+ID4gwqANCj4gPiDCoAlkcm1fcHJpbnRmKHAsICJcblx0
W0hXQ1RYXS5sZW5ndGg6IDB4JWx4XG4iLCBzbmFwc2hvdC0NCj4gPiA+bHJjX3NpemUgLSBMUkNf
UFBIV1NQX1NJWkUpOw0KPiA+IC0JZHJtX3ByaW50ZihwLCAiXG5cdFtIV0NUWF0ucmVwbGF5X29m
ZnNldDogMHglbHhcbiIsDQo+ID4gc25hcHNob3QtPnJlcGxheV9vZmZzZXQpOw0KPiA+IC0JZHJt
X3ByaW50ZihwLCAiXG5cdFtIV0NUWF0ucmVwbGF5X2xlbmd0aDogMHglbHhcbiIsDQo+ID4gc25h
cHNob3QtPnJlcGxheV9zaXplKTsNCj4gPiArCWRybV9wcmludGYocCwgIlx0W0hXQ1RYXS5yZXBs
YXlfb2Zmc2V0OiAweCVseFxuIiwNCj4gPiBzbmFwc2hvdC0+cmVwbGF5X29mZnNldCk7DQo+ID4g
Kwlkcm1fcHJpbnRmKHAsICJcdFtIV0NUWF0ucmVwbGF5X2xlbmd0aDogMHglbHhcbiIsDQo+ID4g
c25hcHNob3QtPnJlcGxheV9zaXplKTsNCg0KDQpBY2tlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gPiDCoA0KPiA+IMKgCWRybV9wdXRzKHAs
ICJcdFtIV0NUWF0uZGF0YTogIik7DQo+ID4gwqAJZm9yICg7IGkgPCBzbmFwc2hvdC0+bHJjX3Np
emU7IGkgKz0gc2l6ZW9mKHUzMikpIHsNCj4gPiAtLSANCj4gPiAyLjQzLjANCj4gPiANCg==
