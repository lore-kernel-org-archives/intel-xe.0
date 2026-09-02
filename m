Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9587AC61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 09:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E98F10EAAB;
	Wed,  2 Sep 2026 09:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ick7272V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E6D10EAAB;
 Wed,  2 Sep 2026 09:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788341840; x=1819877840;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4aMV4bE7IpreCC2R2qlQlpk6Lusx7llhu5Pn2m2QVNw=;
 b=ick7272VNOdrJTEF4oSG/sesZ6MU4W0+iIomTc/XQeVG3lTOdAH72VBl
 jv1WSe5mrfyUnrtjez1jhqfSKoj81u6+YEVIrqECe1TYrdqoDPSCBWxLA
 9M7b5ZzJOsazMW9UPgh7v8ZbVtEQjcw/A7pomdR81npQd9nj85l5Zs0zH
 FeF8btMZAEcDsnRonOPv/TXuoMl0oMdEsM3unS4uvhUPvmYwtWFzi95bc
 6xeKKNEjtJdkXQ129RmGDvUWzjKN3Ui+EQLaG5o8YfS7NTU2mFqhk5eOv
 /03vgb3fh5LmfpqK4wrQ1Ge02Pqi7zj5zF/j+KwX4puT0l0hyyTomp5l7 Q==;
X-CSE-ConnectionGUID: NBiALENHT9Syfb+C7s9g4g==
X-CSE-MsgGUID: gasooChfTqSu0GxpfgXzMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="106314349"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="106314349"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:37:19 -0700
X-CSE-ConnectionGUID: hrCV32qmSPCQCITQImgBfA==
X-CSE-MsgGUID: Mx+ngRI4T1WqK1K/IBF9LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="266762959"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:37:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 02:37:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 02:37:18 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.12)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 02:37:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuVnNcOW/CHXKuhLtk80x/+5TdBnPuOBh522mGpewpC5RfbKzF3n4lvfAXVA2J3fX2JQ4T7WDOga8nWQDJCnfieTFN8DwYwwl7EyS/teX2x6gV5MaBu2e1sB1u2MPjPxw1MQeS8H9hLVWLoDV8k+mtZUXRrLvEJCnGxsCUXC91K8kSTtO/RTTDS/TFCgrSP/FUDAAQ0d1K/ROsBgcHrus9OhPrX8nWRC6xRaAmC5Ejz9LjASwsJOwThokHXyI/CKLj3qiXZ7IztS/csOijH0L1DXm9edD3RecW/ee4tIz3CcvT7G5LHks1hDgBR9FPjzF8MM/gYvJsjSVruFU71jPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aMV4bE7IpreCC2R2qlQlpk6Lusx7llhu5Pn2m2QVNw=;
 b=JOb1z29Shl1GXu4Rcg4IgiBP4K/Jf6Gpi2vw8ioMqkrqv0wTTla8ASxCCgGDdX4M4a7LdHLSqygRKQqsupVsymKvBqbWlB66CZf1vsg2RM+ECZ+3dS5Z9UPzRMfnaDEhwxEqEoDGdiA/b5hV77tDcgVApGy73owT8Kzo2aNj/t278v9OIyHwuAVgdQuZaeTAMGeboJ1d4k5eSey6DCOJ4IPliCXtKI/zHw1+o8wNN3P+k+DaGTpYXgW27Ehh5hMvoq+JnnTAr5vtXnH7qkTv6PE/8qo7T8tKrXlRI1/po+zm3fk/8b/C/BI0xpe4W26gNRYerPU0uqVTHelBbB9/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY8PR11MB7035.namprd11.prod.outlook.com (2603:10b6:930:51::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Wed, 2 Sep 2026 09:37:14 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 09:37:14 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 11/15] drm/i915/alpm: Enable MAC Transmitting LFPS for
 LT PHY
Thread-Topic: [PATCH v5 11/15] drm/i915/alpm: Enable MAC Transmitting LFPS for
 LT PHY
Thread-Index: AQHdNFm5UprmhLfim0ycjbUhaL8FN7a7FI8A
Date: Wed, 2 Sep 2026 09:37:14 +0000
Message-ID: <90d1f5e68b62613ffd8916c101579082a20cb236.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-12-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-12-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY8PR11MB7035:EE_
x-ms-office365-filtering-correlation-id: a55ad167-5ab1-4c0f-9a9b-08df08d5c546
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: T6fJWAyRaFKYCoLJ9iXHxGcs61/5kuDO8D8jsNANCFwjkaFYqoRJ1y1FUs5+eeOcojwBI/kj09ldmTR9tYJeD3Z7cwQkv/mhHLx4mFgtisvmG5j11zs4HUVUor+iVGFpu0H0+EtZ/foBjDoEn3uqFkYsT4WB5Axn/RBK80Uvn01KHXeKEupGsgoXtlUImVxkJnylWpqvBUA5S0CBQesvDGYmMK0fHQcgL44zcPm9D7FsEQLIrKIB0tpN0CaOwycUA/22nPYADZpUiIIpCJDebKtopQ0gnZdJiRr9/IGvvq7Ho3f8Ez1fjnMfxoCKLVtrbrxl13IjixvwKBFApmc0vGKeVC/ZDLqx+ZHDp9HWNen/gPq53L4ykwyH3N+nV9jjhE6F+TzOYXw6QfoCn3z9Rs3iNRi4wIWwxAExCc50/wVzAxmiBSIOFyjeUVWNCPg5zDLxg4OVrF7OMWB6QcLfN/pb6TRLAToLeCAfuxI1kSEaQVvzbJn24Ilx4fPwI95Ec/562AFZ0BxEFuTrygTUcQQYi0D2d1TFwD5UEMlq6bNcsJwSbaB4F14wpmCOhlhPPOoUaQRZOpa9HJxYUXyJcHKMzyIrIOP1hUTeON8a6Q04bQA6064TpZCCHBWIFviu3zstKFN1fh4JwQN1qJ5z6D0CT0wquRKpjVkC/RigVNM03d49FLllw4ULYainB73AAykRibsKFREjhGvbrkPNezOegUvj9Za6MA6bxNV81fA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zy9sMk1tWFpJNWhNN1NWUWVjM1RnS1gyYklHbmxSMUlFV0U2WkozSzRvZDQ5?=
 =?utf-8?B?S0UwbXVST3NZYjRPMmlnQmo1OXl6eHp2QWhMVnZHNVluMC9TR2lZLzdhTjBX?=
 =?utf-8?B?KzlXZEJpN0FXQ3YyVFBkMEMrMGxFOEY1eDVPc1RXOHlrUmxsTmpDaTM5N291?=
 =?utf-8?B?cFlhU3Z4RTNUc1Y4c0FZTFd4OENINnpkdTBXZElvclRjNFVFalUwQTJkbVNr?=
 =?utf-8?B?WjFXQ3NZOTkrS2VxcENIdFB3cU5ZOWlRZ1pVZVFlUXdCRU1uenZ3RE56T29H?=
 =?utf-8?B?eUdkcG5XUmJzSlphclYxVXVlelN1djNGMmxHNW1WWGRNaWdLZkJQcWJNYWZY?=
 =?utf-8?B?MEM3REJpY3FuV3BaSHcwTE5CTFliUTV5QnpScCtFUlMwalU3UVFDNThCQ1dm?=
 =?utf-8?B?WkovTFFBUWhEVlgwSkdsVWxZR0o5UFlobXpGeGEzSnhqWnI4cjlQYnI0QkZq?=
 =?utf-8?B?NlRYK3NCdFF6NldjbnRsNU5TbXg4R2Q3VkhoeTlKc2k3bktsVno3cEdsaW5o?=
 =?utf-8?B?bFJuSlpuT1Z1K1k5dVFYUWUxN1RycS82Nkd2S09GL1JYZkFPMUdGR0N1NUlD?=
 =?utf-8?B?dUQ0UGkya21WMEZsTlFUcXg2QXYyS1JhbXEvSjRjQjJMaGd6L2tTbUJHYmdw?=
 =?utf-8?B?S3d2RkpySHRwS0lQSXhyTGNJVjhOK2E3S2NzY1NYRkdUSmo3QnV1eTBMOGtX?=
 =?utf-8?B?cXBHODVyNWNVTzI4UjZsYlRTbndDL2oxOWhya0piTXk3ZzhjRjdOMkhxTkJm?=
 =?utf-8?B?c2pxbjZjVTVFcjFCd3N6U0ZVem5qWm92Wkt4M0xvcWwvaXdmUWs3RlhxMnRx?=
 =?utf-8?B?TEQrY1JzZWQrUTRUZm9RdHF1UGtodElqUWNMWHdjTnE4c3I3YjVKS01ub1J4?=
 =?utf-8?B?cHdUU0xqVVB1bmJ3S0tzeUJPOVJ0QmQvS3RWdG5DRTArVkMyakh6QTMwc0NJ?=
 =?utf-8?B?S0ZtVXBxZUhCWkw3K05RS2hSMFFTeVMyanN1aml0NDk2Z284elo1MXZJRTFT?=
 =?utf-8?B?azNrcEhNMThKQStrdkZRV1RjM0svMkxDbE5adE1TbFhCdGZLY0I2MVlodnY0?=
 =?utf-8?B?MExPRVNGZUtmaytrUk50ZjVyaXorSFJCalFXeW5MdU4zT1RoWFlNY0I2bHpS?=
 =?utf-8?B?QW9wandwNkdmdDZPRVpTbHZ3dE1hVWRxcy9ETVR0Y3NoVmhBR1NMTXBIVFFW?=
 =?utf-8?B?N2NER1E5dnVvUkRZUmJxNUcxWFhGbktuMk1BZWdSYmpRbFQ3K2o3SnVDR3ZN?=
 =?utf-8?B?UUs3YTlCNzZ5ZFd4N0tadUtmN2tGOGF4WnRINFBhZmdDVmRiTE82UkppYVZh?=
 =?utf-8?B?SVZsKzJ3N2lUaE5xbVRibWFRUFo2ZUV3bGZQMUtsUHZiMUcvanhDQ3kxc2Nu?=
 =?utf-8?B?dzY2MG9LbUpWTW9neXdReTVyUEZhcDdsTzQwWE5Pb1d4R3lsTFRlaStPZlVm?=
 =?utf-8?B?YjAzQkcvUVRZY2MxV1FoNlVqalNIR1Y0OGt4c1oxdEhaZDdkWkhsc3BiYnIx?=
 =?utf-8?B?SnU4MERwQUdkTDVYQ2FXQTgrRFZHNElrellhR1dHVndGYjJqSXMyT0dLcU1o?=
 =?utf-8?B?SlRvYkxuRHljdS90VzdweXBTR1NrRW9HUWVBRjlIYmtvWDBodE05K1NxbjB3?=
 =?utf-8?B?cUlia2YyTVZoM0Nmem82TDJnRXJKeThGaWRpTnBTNThGZlNsWGVwUk9kUGtY?=
 =?utf-8?B?ZWZLdGZ5a1BBZW5kZjBYN1Frd25qT2RnaFhkeDJmZFpNWW1Xc0FpMkZ2MWll?=
 =?utf-8?B?TVFrWmJFMDB6TmRRR3BGMTkwMmYzZFMyaEZnR2tkU3libzVaaTBPSDdWMms2?=
 =?utf-8?B?b0NRa0lVRkVDTDBVdERJRjQ3elFBZzI0ZmE0VmE3aDFoMUozWUZUVG16SEpD?=
 =?utf-8?B?WjlZZUJ2RktYeUZPaFVZN0syczRYNUFvRDFkVXZMMEUxWUtrbWx1MmM2VWpK?=
 =?utf-8?B?dWtCYjJMajJtZWdsZDc2L2FxUE81aW1mOThFd2NMZFBvTktZampmeUs2bVky?=
 =?utf-8?B?d2p2YkxNMFJ4VkNaVDhwbzdvOUZyc2hScWswNW1USlZJZXJlUGRRd3ZMbmRB?=
 =?utf-8?B?Z1hqZy9SZnpkRjFQbjFDUFNZWGs2c1hPVURsWmJBd3lrMUkyQk1sZ2VnTXZQ?=
 =?utf-8?B?RHhqUlZ5RjNxdDRXWlZzQlMxaW9MTHJEcFM3eFcvZTRMYUx0Nyttak9OMWYy?=
 =?utf-8?B?YTdnSjR3aXhKVngraWxoVlZXSElGTHNSczhtNXpib3Jac21qZGM3ejJUcmRU?=
 =?utf-8?B?Q2hTVElkVFFxdzBoTW9iR1ZIZm5hdW40MG9rMXZ4QVZLcGJvendhOXlrTGdw?=
 =?utf-8?B?T2xEUklIN3V0SFZzVW1XUU1Sc2o4ZVZPbVV1Ym9VQVJKOE13N3I4VWVUNnpM?=
 =?utf-8?Q?3jF2nS2wG+3JxHjg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F80ED585F8A63D4CB7550B6FD6B53623@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xB8T1mqWcKBdHLbS7RzbugGQ5N0EoAiqigot4kVmzBsh6V5yWM+0IbW30UFAe9lXl2qs/p5JEsb0PZoXzdYDAk5D34pgIyiqzdNJWnbIyUGR3tryJG3oipG0AsxaXRcltgIpFzUAlCuH6YMgXhKelKhSudZGAtm1+u4p/xrKtC5fW7BCUK73GGdg50WqB8deZZJCFZIOu+Wa+c6syEJDodA4PQTkOQHUuVImSbrwAp4797LMDD/gBXvgP6wkz96AQp/l4ZyFpoZBlkTuXXFx48Ixi+Y1xDDbMT2yD4lz9hffX7LhW7lzpmgU71cqOjwrHtFfFlxAKM7F/covZSYtHQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55ad167-5ab1-4c0f-9a9b-08df08d5c546
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 09:37:14.0486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jTcKDZB9Rq9RMQHHl4fQTiaZmwiqDO6sikal9zKZzFGoba+/YpLrAnALl3icToctUFo43BnYBN9KTx4sgQvahcV/EHX4KbfviuqtI3rB8Dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7035
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

T24gVHVlLCAyMDI2LTA4LTI1IGF0IDExOjE1ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBFbmFibGUgTUFDIHRvIHRyYW5zbWl0IExGUFMgdmlhIExUIFBIWSBkdXJpbmcgYXV4LWxlc3Mg
YWxwbS4NCj4gDQo+IHYyOg0KPiAtIENvcnJlY3QgY29tbWl0IGRlc2NyaXB0aW9uLiBbU3VyYWpd
DQo+IC0gUmVtb3ZlIGxvb3AgYXMgbm8gZGVwZW5kZW5jeSBvbiB0aGUgdHJhbnNtaXR0ZXIgTFRf
UEhZX0NNTl9DVEwwLg0KPiBbU3VyYWpdDQo+IHYzOiBDb3NtZXRpYyBjaGFuZ2VzLiBbU3VyYWpd
DQo+IA0KPiBDYzogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+
IFJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+
IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmPCoMKgwqDC
oMKgIHzCoCA1ICsrKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0
X3BoeS5jwqDCoCB8IDI3DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gwqBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0X3BoeS5owqDCoCB8wqAgMiArKw0KPiDCoC4uLi9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHlfcmVncy5owqAgfMKgIDMgKysrDQo+IMKgNCBm
aWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMNCj4gaW5kZXggOWIzYjUyNmU1
ZTU1Li41MjQ0MjE4MTMyYWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGRpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kZGkuYw0KPiBAQCAtMzc5Niw3ICszNzk2LDEwIEBAIHN0YXRpYyB2b2lkDQo+IG10bF9k
ZGlfcHJlcGFyZV9saW5rX3JldHJhaW4oc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gwqAJ
ICrCoMKgwqDCoCBpaS4gRW5hYmxlIE1BQyBUcmFuc21pdHMgTEZQUyBpbiB0aGUgIlBIWSBDb21t
b24NCj4gQ29udHJvbCAwIiBQSVBFDQo+IMKgCSAqwqDCoMKgwqDCoMKgwqDCoCByZWdpc3Rlcg0K
PiDCoAkgKi8NCg0KSSB0aGluayB5b3UgbmVlZCB0byB1cGRhdGUgY29tbWVudCBhYm92ZS4gT3Ro
ZXJ3aXNlIHBhdGNoIGxvb2tzIG9rLg0KDQpCUiwNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IC0JaW50
ZWxfbG5sX21hY190cmFuc21pdF9sZnBzKGVuY29kZXIsIGNydGNfc3RhdGUpOw0KPiArCWlmIChI
QVNfTFRfUEhZKGRpc3BsYXkpKQ0KPiArCQlpbnRlbF94ZTNwbHBkX21hY190cmFuc21pdF9sZnBz
KGVuY29kZXIsDQo+IGNydGNfc3RhdGUpOw0KPiArCWVsc2UNCj4gKwkJaW50ZWxfbG5sX21hY190
cmFuc21pdF9sZnBzKGVuY29kZXIsIGNydGNfc3RhdGUpOw0KPiDCoH0NCj4gwqANCj4gwqBzdGF0
aWMgdm9pZCBpbnRlbF9kZGlfcHJlcGFyZV9saW5rX3JldHJhaW4oc3RydWN0IGludGVsX2RwDQo+
ICppbnRlbF9kcCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfbHRfcGh5LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0
X3BoeS5jDQo+IGluZGV4IDg2NDkyNjUxYjAxZC4uNGZlMDEwZGYyMGJlIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0X3BoeS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmMNCj4gQEAgLTUsNiArNSw3
IEBADQo+IMKgDQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4NCj4gwqANCj4gKyNpbmNs
dWRlICJpbnRlbF9hbHBtLmgiDQo+IMKgI2luY2x1ZGUgImludGVsX2N4MF9waHkuaCINCj4gwqAj
aW5jbHVkZSAiaW50ZWxfY3gwX3BoeV9yZWdzLmgiDQo+IMKgI2luY2x1ZGUgImludGVsX2RkaS5o
Ig0KPiBAQCAtMjM1NywzICsyMzU4LDI5IEBAIHZvaWQgaW50ZWxfbHRfcGh5X3ZlcmlmeV9wbGxz
KHN0cnVjdA0KPiBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5KQ0KPiDCoAlpbnRlbF9sdF9waHlfcGxs
X3ZlcmlmeV90YWJsZXMoZGlzcGxheSwNCj4geGUzcGxwZF9sdF9lZHBfdGFibGVzKTsNCj4gwqAJ
aW50ZWxfbHRfcGh5X3BsbF92ZXJpZnlfdGFibGVzKGRpc3BsYXksDQo+IHhlM3BscGRfbHRfaGRt
aV90YWJsZXMpOw0KPiDCoH0NCj4gKw0KPiArLyoNCj4gKyAqIEFjY29yZGluZyB0byBIQVMgd2Ug
bmVlZCB0byBlbmFibGUgTUFDIFRyYW5zbWl0dGluZyBMRlBTIGluIHRoZQ0KPiAiUEhZIENvbW1v
bg0KPiArICogQ29udHJvbCAwIiBQSVBFIHJlZ2lzdGVyIGluIGNhc2Ugb2YgQVVYIExlc3MgQUxQ
TSBpcyBnb2luZyB0byBiZQ0KPiB1c2VkLiBUaGlzDQo+ICsgKiBmdW5jdGlvbiBpcyBkb2luZyB0
aGF0IGFuZCBpcyBjYWxsZWQgYnkgbGluayByZXRyYWluIHNlcXVlbmNlLg0KPiArICovDQo+ICt2
b2lkIGludGVsX3hlM3BscGRfbWFjX3RyYW5zbWl0X2xmcHMoc3RydWN0IGludGVsX2VuY29kZXIg
KmVuY29kZXIsDQo+ICsJCQkJwqDCoMKgwqAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUN
Cj4gKmNydGNfc3RhdGUpDQo+ICt7DQo+ICsJc3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9IGVu
Y190b19pbnRlbF9kcChlbmNvZGVyKTsNCj4gKwlzdHJ1Y3QgcmVmX3RyYWNrZXIgKndha2VyZWY7
DQo+ICsJdTggb3duZWRfbGFuZV9tYXNrOw0KPiArDQo+ICsJaWYgKCFpbnRlbF9hbHBtX2lzX2Fs
cG1fYXV4X2xlc3MoaW50ZWxfZHAsIGNydGNfc3RhdGUpKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4g
Kwl3YWtlcmVmID0gaW50ZWxfbHRfcGh5X3RyYW5zYWN0aW9uX2JlZ2luKGVuY29kZXIpOw0KPiAr
DQo+ICsJb3duZWRfbGFuZV9tYXNrID0gaW50ZWxfbHRfcGh5X2dldF9vd25lZF9sYW5lX21hc2so
ZW5jb2Rlcik7DQo+ICsNCj4gKwlpbnRlbF9sdF9waHlfcm13KGVuY29kZXIsIG93bmVkX2xhbmVf
bWFzaywgTFRfUEhZX0NNTl9DVExfMCwNCj4gKwkJCSBMVF9QSFlfQ01OX0xGUFNfRU5BQkxFLA0K
PiArCQkJIExUX1BIWV9DTU5fTEZQU19FTkFCTEUsDQo+IE1CX1dSSVRFX0NPTU1JVFRFRCk7DQo+
ICsNCj4gKwlpbnRlbF9sdF9waHlfdHJhbnNhY3Rpb25fZW5kKGVuY29kZXIsIHdha2VyZWYpOw0K
PiArfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9s
dF9waHkuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmgN
Cj4gaW5kZXggMTZkZTM5NDg0Nzc5Li5jNzZjOTdiOTA5NDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmgNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHkuaA0KPiBAQCAtNDksNSArNDksNyBAQCB2
b2lkIGludGVsX3hlM3BscGRfcGxsX2VuYWJsZShzdHJ1Y3QgaW50ZWxfZW5jb2Rlcg0KPiAqZW5j
b2RlciwNCj4gwqAJCQnCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBpbnRlbF9kcGxsX2h3X3N0YXRl
DQo+ICpkcGxsX2h3X3N0YXRlKTsNCj4gwqB2b2lkIGludGVsX3hlM3BscGRfcGxsX2Rpc2FibGUo
c3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIpOw0KPiDCoHZvaWQgaW50ZWxfbHRfcGh5X3Zl
cmlmeV9wbGxzKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5KTsNCj4gK3ZvaWQgaW50ZWxf
eGUzcGxwZF9tYWNfdHJhbnNtaXRfbGZwcyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwN
Cj4gKwkJCQnCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0Y19z
dGF0ZSk7DQo+IMKgDQo+IMKgI2VuZGlmIC8qIF9fSU5URUxfTFRfUEhZX0hfXyAqLw0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHlfcmVncy5o
DQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHlfcmVncy5oDQo+
IGluZGV4IGZmNmQ3ODI5ZGJiOS4uYjY0ZmY1N2UwYzA5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0X3BoeV9yZWdzLmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHlfcmVncy5oDQo+IEBAIC0zNSw2ICsz
NSw5IEBADQo+IMKgI2RlZmluZSBMVF9QSFlfVFhZX0NUTDEwX01BQyhpZHgpCV9NTUlPKExUX1BI
WV9UWFlfQ1RMMTAoaWR4KSkNCj4gwqAjZGVmaW5lwqAgTFRfUEhZX1RYX0xBTkVfRU5BQkxFCQlS
RUdfQklUOCgwKQ0KPiDCoA0KPiArI2RlZmluZSBMVF9QSFlfQ01OX0NUTF8wCQkoMHg4MDApDQo+
ICsjZGVmaW5lwqAgTFRfUEhZX0NNTl9MRlBTX0VOQUJMRQkJUkVHX0JJVDgoMSkNCj4gKw0KPiDC
oC8qIExUIFBoeSBWZW5kb3IgUmVnaXN0ZXIgKi8NCj4gwqAjZGVmaW5lIExUX1BIWV9WRFJfMF9D
T05GSUcJMHhDMDINCj4gwqAjZGVmaW5lwqAgTFRfUEhZX1ZEUl9EUF9QTExfRU5BQkxFCVJFR19C
SVQoNykNCg0K
