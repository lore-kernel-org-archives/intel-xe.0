Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC608C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 18:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7B410E0C4;
	Wed,  7 Jun 2023 18:44:47 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344C610E0C4
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 18:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686163485; x=1717699485;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=brD4E4HfNt99mvoaWgaqHRn3iuc/tEn0g3poJBnnyn0=;
 b=YlViiY9NfYOQRnfncOI2lNVuvPFQNuVMcTWRQvpkUdU0xBnH7JJ6DWX/
 qiZOsJ1S2tUPJ1P32BS+keNqsi7NqazKgMc4Wz6UmTOmlpN+0m4azRyBa
 2nUnQaqrZgmF4BnnKv7nNOFrNFLijcul4VlCyaY6A+zgjb2kre8r/A3q6
 j3kernSsqjIAQV1FB5JMPL/9SQjWWpFzHOGkG2GWVlDpiZVV05jS6o2PD
 DnirzBG8Zn17srQRxLwUHPWgtGSMZ646II9sje6L2KDqFO3mvrOkxarsc
 oIt8WEc0MC39vKX7b/+VetkjyejwB01gO/Up24WPcrqvmK14Jn5zG2PS4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337439507"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="337439507"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 11:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="703768461"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="703768461"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 07 Jun 2023 11:44:44 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 11:44:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 11:44:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 11:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXUqnaFxyoDLXcqz76j29i0ULfWiQq5Jwk46qOiyYsvpj21mk6bTjWZ61dr0irTwxelHY+mLgjNYJZZDHfqx4iPhh79Ylz4MRbsnrlptveLb1g7HAzspAjBMMLxlBoOAhgOV0vnTfCjNCuw+Y8ZAhk3fftnKNRJxlkrdGovx3akrXi99OWNl4XwAtub3z9vP9MYA5s3YdW8nbmMyJH15rrRaq6Tbmcm+iz8aQuffKpdsomY2J5+UWcCBex59iZAQtVsnP/Lyw8gpYnAAZHSxzwHlA9FCxB3YfMD1zTP6pg4nZpoXN5247/fkZS9EKTYjAtQAttjEpD3iin6GA4Xsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brD4E4HfNt99mvoaWgaqHRn3iuc/tEn0g3poJBnnyn0=;
 b=QcNLneorAkpu3jitNL9AEgvucwnoyTNy+MVjg6tUuboJOLljzqXpQ/zm6ca19Y01WxDglLc85KTbEGXu5Gu/G7p+l6uTbALIUKFnC6XMdSzlwyXlfo+fI3th+9wLbihSXZgCTUhnfuSuoxCkANwi815/0886lOlF3z6wLt2B02NzACR+VGtkvoVDCiAfqdHRWdZqG6YqffEaes0d5I3EfY09uus+Nyjy/Jdn0xllI156DeYUw5fdVn8p3OeiupnOMduuCvIVnWVXqzq+us8FyNXpMx+1+irqMG2o95N3etjCEQ1iohSQB/DLASkfJIa/KuFIhwhkss49YH1qLIst7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH0PR11MB5363.namprd11.prod.outlook.com (2603:10b6:610:ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 18:44:36 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6455.034; Wed, 7 Jun 2023
 18:44:36 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: Emit a render cache flush after
 each rcs/ccs batch
Thread-Index: AQHZmWg71TF+ynr3yEeymefGQiP7969/rWCA
Date: Wed, 7 Jun 2023 18:44:36 +0000
Message-ID: <698b579dad8fc87467c17a260b8c0eefbb243f3c.camel@intel.com>
References: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
 <20230607174729.54899-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230607174729.54899-3-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH0PR11MB5363:EE_
x-ms-office365-filtering-correlation-id: 871f163d-d0f7-47e7-9cf0-08db67873dfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pLylLe9iwNnxYr4x5OSKt03Qu2xgIokHsrel4BDvasbGb6BzGUIJ+0VIUGZicsoK1K1mfxB5bf9CF1Zl8Uy+dknmiRcsAeOy8aqJA3EN4LYFpeq/baIZCrDRRiPTL7OvsCI00cYpxl4VRErLGwZDFY44V7ZeHCyL+SPYF6Nk3xLYFSEJZI+wkPZOjgdarbFdiV2biLNZDegmRfrh7KD5bnNbJ7TigwxLy2fDNM+aT6pCrftHck25nMvbtlJd0VpEfa3fAusX1pn+A2W0k66ifwlUHV5tr5FnN5u+qNsdA3kQowoBJ1+6p8BnUzZcT+q0FMHPJzuhsBI1Hlvij0fYI5JXYgnlFJMLnQRPsilzHuNzm7MskTN1JFqGJRdDUKzwU3wpqs/PysMgq7PXbcVz3QdoFGgUuvqdE0yLH5fvdV8XEwW/RvCxbYrfAD8E+tTcgDAsIx6fyv8TvDkLnBMYmOz8/cE0kqKjgb1LonmdcwxuSy1xVayCIGM1KLHl30urDpcibK8Lj394csVtQ//X3IUuMk4VLIXTmpfN1qEUWBdceHQ70FNmKvE7Aka1PokBV72LpAUjIoXh9yfJlfERxSlFCSqPrMzEjNG4rBlczZhXOL1JpTqFYRnnyx3etIbO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199021)(316002)(41300700001)(38070700005)(478600001)(83380400001)(2906002)(66574015)(36756003)(76116006)(66476007)(91956017)(66946007)(8676002)(66446008)(66556008)(5660300002)(82960400001)(8936002)(86362001)(38100700002)(122000001)(64756008)(110136005)(6486002)(71200400001)(6512007)(186003)(2616005)(26005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3RYakNNYWVxN3BjQzBvWW9yejZ2YVZKVnhzOHlXblVMcEc5YU5pS042Zkxi?=
 =?utf-8?B?c3A1bGdrMytkT1RQTkJkajNrM2pMamVRYVN6bEo3QWE0VEljMmoxa0hRUytz?=
 =?utf-8?B?MGUwQUJ0MndBMGRPcmp6OThhdW00YjJEK1MwWkNmODEwNVAvU1Rmay9LNVh6?=
 =?utf-8?B?SjA5dlRDNjFtZ1lCVHBDZmJJZXJtOU91Q3VjekVWcEF3U3JnYlpET2EydEVq?=
 =?utf-8?B?SERZelNBTGRiZWJraWllSnZjdUpRbWZDMXcxcWQ1SzNWUDhkT3NaV0g1ZHlD?=
 =?utf-8?B?blEzbXl4dHZwd3E5OW02d1RuMHM3OU1YZ2k2aGZFNW1FcW1vQmJiZzZHalRW?=
 =?utf-8?B?alBoa2VicGN3V0lxaW1pOTBSNkRodE5RRXZZbXA1ZlRVUC8zdDhUM1BiNEht?=
 =?utf-8?B?MEJERURnSTNyYzRFMFlEVzIzM3VobDhPOHV6NlhJNllLY3QyZFN5ZGVmT3Vm?=
 =?utf-8?B?NzFRYTExczM1SjcxMWhXTzFLaGc4R3JpVXJaUE5mUE5FUmZFTzhqUjdIYVdY?=
 =?utf-8?B?T25LM3ZEQ2Fac250cVVOUk93NzRJR0d2QkYweENBMUZpQ1J4c1VEbFc1anMw?=
 =?utf-8?B?VS94Zi9CWXFENmJPck5qYzFXeE91OVFzdy9mZkFzd2IvcUwvR3MvdXRraEt0?=
 =?utf-8?B?RWFBQm1tNGlSMXh1T2hvMTA0MFBEbFQ4N3JwSS9kQlNYRHRiRXdqU2FRS2Nk?=
 =?utf-8?B?ZEl5TWs3T0dka1lpR2haeHJzODlpN1dYakk3WkRqZmNJR1VzQTU0MEJKUXVh?=
 =?utf-8?B?MzVYTW5MY1BlQ0hQRURMdEUxZHRKbVZtdHdoZ29LU284MU8rV05XMHJsRm5R?=
 =?utf-8?B?bWNVZFJNQ0huYkgxSnIxTFpsLzVIQVJ3V0tWY014OXFQbDJSU2laSHVLY0FW?=
 =?utf-8?B?UldqZmtUaC84SytMN1ZGb3lDZnRRNGRCRDJtOGFOL2k4enVzak5oK25ucVFB?=
 =?utf-8?B?cDA1YjJsL2JmbFJITU1vTklwbFZCRlhnbHJ4RzdTckxaTEF1NlB2dWc3dnNN?=
 =?utf-8?B?RU9tNnM1TVdhMlNnYWcxUng5cTlpTmdiM1FJRVc3RVUrdVloaU8wcEh2cWsw?=
 =?utf-8?B?SlVybmFzSnlJOEJhNjk1dlVJWFBicFVqOStQcnpHQXhlb2N5N2I3YjYxRkZw?=
 =?utf-8?B?d01sVGxSS1A1Qnl4K2dCK0pwbFkwMW9kbGR4eUpLbWE0em1IQSt3MHVJUm5p?=
 =?utf-8?B?elFLRFFYclVTNXd4QkliNWZPTlNVM0grODJvSDMrSVk2Y1FyeTN3SFNOVTQz?=
 =?utf-8?B?Y1pjSTQ2SjNKTC9MTm94TGdnR2dSa1pwUXd5cHQ2eVlhc3BsR09VTVk4SjZy?=
 =?utf-8?B?S0ExODhDNlJ0K0NqM2U0d3FueklmVkhSMUtMWkpTMjB2MmhDZ3AzUEp4dnpW?=
 =?utf-8?B?SERUYTNZMWNHUGVyV2V6V3diTnhNL2NNMXluMkZ0WWFJRThkemcvZ3pIS2Vo?=
 =?utf-8?B?TnpXeU1tQmloUjVDOVdHa0w4Q3lBTVFUSzRYSHc0Z2dqR1p0YVlvREtPTG5z?=
 =?utf-8?B?ZGpJQUt3RElOTHorVjFuUWdiUlJqemN2N1lpUnZrQTN3TmhOVm1ncHR2aUYx?=
 =?utf-8?B?UmdraE42OVgvbldLTXR4ZThteE5QVFZoT2NOK25WYlBBempjVmJtWW9ScVQx?=
 =?utf-8?B?MEFtYkFpN1gwZlp1bU5DNHhWSnk0N2JXZWpCOURta0hPRzBvK2JsL2l5eWJi?=
 =?utf-8?B?YS9lWktLblp4Z3ZSc1lpU2JmVXY0L21pbjZRR2RVYnlRdHFWSjlGSWlOS2l6?=
 =?utf-8?B?M1RxL28xYzErWWNkSGEwb2ZzSFBkaHpQOHdkWHh1NGl5OTBYdWxUeTcyY2RR?=
 =?utf-8?B?amtZTEh2b3RWQ0R4U2lrNGkxL2dZNVkwemUrZldaR1AvOUpHVkdOWDJZTzFZ?=
 =?utf-8?B?c05oM290SWpjUExLLzgxUnFiV0ZzbUxiQ3hlemhrVUVyZVhWNFV2TjZlQlJU?=
 =?utf-8?B?RFJGbEFuRGhQWHlZRlptd1hiVndKcEI4d0tNVmI5Qlc3b0hNRW9ZUEUvTkht?=
 =?utf-8?B?dDBoUytmTlc4MEJ1d1BjSGRKMmV5ZWhsZUVjcGM0SXhGWmkvdVhib0I0T2NW?=
 =?utf-8?B?b1pKcXpVRVJaeHF2UVkvS1VheUZEMHNuQUVOaFdrU1BqVW92MGV5VXBXODJD?=
 =?utf-8?Q?5HOOhS2yoHK+5iFbzJdMYUANr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A794B4D952B31499EFE0A178CC8E000@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871f163d-d0f7-47e7-9cf0-08db67873dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 18:44:36.1216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xlgqLxI7RfyA4JzKyPfM4KuyB4UG/OTx565qFhgVC7jIzXzzXx7GIPcOXHQDrGCGdZLiApU76fvvFEtlXiMmtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5363
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Emit a render cache flush after
 each rcs/ccs batch
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

T24gV2VkLCAyMDIzLTA2LTA3IGF0IDE5OjQ3ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gV2UgbmVlZCB0byBmbHVzaCByZW5kZXIgY2FjaGVzIGJlZm9yZSBmZW5jZSBzaWduYWxs
aW5nLCB3aGVyZSB3ZSBtaWdodA0KPiByZWxlYXNlIHRoZSBtZW1vcnkgZm9yIHJldXNlLiBXZSBj
YW4ndCByZWx5IG9uIHVzZXJzcGFjZSBkb2luZyB0aGlzLA0KPiBzbyBmbHVzaCByZW5kZXIgY2Fj
aGVzIGFmdGVyIHRoZSBiYXRjaCwgYnV0IGJlZm9yZSB1c2VyIGZlbmNlLSBhbmQNCj4gZG1hX2Zl
bmNlIHNpZ25hbGxpbmcuDQo+IA0KPiBDb3B5IHRoZSBjYWNoZSBmbHVzaCBmcm9tIGk5MTUsIGJ1
dCBvbWl0IFBJUEVfQ09OVFJPTF9GTFVTSF9MMywgc2luY2UgaXQNCj4gc2hvdWxkIGJlIGltcGxp
ZWQgYnkgdGhlIG90aGVyIGZsdXNoZXMuIEFsc28gb21pdA0KPiBQSVBFX0NPTlRST0xfVExCX0lO
VkFMSURBVEUgc2luY2UgdGhlcmUgc2hvdWxkIGJlIG5vIGFwcGFyZW50IG5lZWQgdG8NCj4gaW52
YWxpZGF0ZSBUTEIgYWZ0ZXIgYmF0Y2ggY29tcGxldGlvbi4NCg0KUmV2aWV3ZWQtYnk6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3B1X2NvbW1hbmRzLmgg
fCAgMyArKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMgICAgICAgICAgfCAz
NSArKysrKysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29v
Yi5ydWxlcyAgICAgICAgfCAgMSArDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ncHVfY29t
bWFuZHMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2dwdV9jb21tYW5kcy5oDQo+IGlu
ZGV4IGQyZDQxZjcxNzUyNS4uZGQzNDA4ZmQzZDMzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUvcmVncy94ZV9ncHVfY29tbWFuZHMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUvcmVncy94ZV9ncHVfY29tbWFuZHMuaA0KPiBAQCAtNjYsNiArNjYsOSBAQA0KPiAgI2RlZmlu
ZSAgIFBWQ19NU19NT0NTX0lOREVYX01BU0sJR0VOTUFTSyg2LCAxKQ0KPiAgDQo+ICAjZGVmaW5l
IEdGWF9PUF9QSVBFX0NPTlRST0wobGVuKQkoKDB4Mzw8MjkpfCgweDM8PDI3KXwoMHgyPDwyNCl8
KChsZW4pLTIpKQ0KPiArDQo+ICsjZGVmaW5lICAgUElQRV9DT05UUk9MMF9IRENfUElQRUxJTkVf
RkxVU0gJCVJFR19CSVQoOSkgIC8qIGdlbjEyICovDQo+ICsNCj4gICNkZWZpbmUgICBQSVBFX0NP
TlRST0xfQ09NTUFORF9DQUNIRV9JTlZBTElEQVRFCQkoMTw8MjkpDQo+ICAjZGVmaW5lICAgUElQ
RV9DT05UUk9MX1RJTEVfQ0FDSEVfRkxVU0gJCQkoMTw8MjgpDQo+ICAjZGVmaW5lICAgUElQRV9D
T05UUk9MX0FNRlNfRkxVU0gJCQkoMTw8MjUpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfcmluZ19vcHMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+
IGluZGV4IGMyMGZlNDFjMDcyOS4uOTE1MTFmNzJkOTcxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cmluZ19vcHMuYw0KPiBAQCAtNSw2ICs1LDcgQEANCj4gIA0KPiAgI2luY2x1ZGUgInhlX3Jpbmdf
b3BzLmgiDQo+ICANCj4gKyNpbmNsdWRlICJnZW5lcmF0ZWQveGVfd2Ffb29iLmgiDQo+ICAjaW5j
bHVkZSAicmVncy94ZV9ncHVfY29tbWFuZHMuaCINCj4gICNpbmNsdWRlICJyZWdzL3hlX2d0X3Jl
Z3MuaCINCj4gICNpbmNsdWRlICJyZWdzL3hlX2xyY19sYXlvdXQuaCINCj4gQEAgLTE2LDYgKzE3
LDcgQEANCj4gICNpbmNsdWRlICJ4ZV9zY2hlZF9qb2IuaCINCj4gICNpbmNsdWRlICJ4ZV92bV90
eXBlcy5oIg0KPiAgI2luY2x1ZGUgInhlX3ZtLmgiDQo+ICsjaW5jbHVkZSAieGVfd2EuaCINCj4g
IA0KPiAgLyoNCj4gICAqIDNELXJlbGF0ZWQgZmxhZ3MgdGhhdCBjYW4ndCBiZSBzZXQgb24gX2Vu
Z2luZXNfIHRoYXQgbGFjayBhY2Nlc3MgdG8gdGhlIDNEDQo+IEBAIC0xNDcsNiArMTQ5LDM3IEBA
IHN0YXRpYyBpbnQgZW1pdF9zdG9yZV9pbW1fcHBndHRfcG9zdGVkKHU2NCBhZGRyLCB1NjQgdmFs
dWUsDQo+ICAJcmV0dXJuIGk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBpbnQgZW1pdF9yZW5kZXJf
Y2FjaGVfZmx1c2goc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iLCB1MzIgKmR3LCBpbnQgaSkNCj4g
K3sNCj4gKwlzdHJ1Y3QgeGVfZ3QgKmd0ID0gam9iLT5lbmdpbmUtPmd0Ow0KPiArCWJvb2wgbGFj
a3NfcmVuZGVyID0gIShndC0+aW5mby5lbmdpbmVfbWFzayAmIFhFX0hXX0VOR0lORV9SQ1NfTUFT
Syk7DQo+ICsJdTMyIGZsYWdzOw0KPiArDQo+ICsJZmxhZ3MgPSAoUElQRV9DT05UUk9MX0NTX1NU
QUxMIHwNCj4gKwkJIFBJUEVfQ09OVFJPTF9USUxFX0NBQ0hFX0ZMVVNIIHwNCj4gKwkJIFBJUEVf
Q09OVFJPTF9SRU5ERVJfVEFSR0VUX0NBQ0hFX0ZMVVNIIHwNCj4gKwkJIFBJUEVfQ09OVFJPTF9E
RVBUSF9DQUNIRV9GTFVTSCB8DQo+ICsJCSBQSVBFX0NPTlRST0xfRENfRkxVU0hfRU5BQkxFIHwN
Cj4gKwkJIFBJUEVfQ09OVFJPTF9GTFVTSF9FTkFCTEUpOw0KPiArDQo+ICsJaWYgKFhFX1dBKGd0
LCAxNDA5NjAwOTA3KSkNCj4gKwkJZmxhZ3MgfD0gUElQRV9DT05UUk9MX0RFUFRIX1NUQUxMOw0K
PiArDQo+ICsJaWYgKGxhY2tzX3JlbmRlcikNCj4gKwkJZmxhZ3MgJj0gflBJUEVfQ09OVFJPTF8z
RF9BUkNIX0ZMQUdTOw0KPiArCWVsc2UgaWYgKGpvYi0+ZW5naW5lLT5jbGFzcyA9PSBYRV9FTkdJ
TkVfQ0xBU1NfQ09NUFVURSkNCj4gKwkJZmxhZ3MgJj0gflBJUEVfQ09OVFJPTF8zRF9FTkdJTkVf
RkxBR1M7DQo+ICsNCj4gKwlkd1tpKytdID0gR0ZYX09QX1BJUEVfQ09OVFJPTCg2KSB8IFBJUEVf
Q09OVFJPTDBfSERDX1BJUEVMSU5FX0ZMVVNIOw0KPiArCWR3W2krK10gPSBmbGFnczsNCj4gKwlk
d1tpKytdID0gMDsNCj4gKwlkd1tpKytdID0gMDsNCj4gKwlkd1tpKytdID0gMDsNCj4gKwlkd1tp
KytdID0gMDsNCj4gKw0KPiArCXJldHVybiBpOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgaW50IGVt
aXRfcGlwZV9pbW1fZ2d0dCh1MzIgYWRkciwgdTMyIHZhbHVlLCBib29sIHN0YWxsX29ubHksIHUz
MiAqZHcsDQo+ICAJCQkgICAgICBpbnQgaSkNCj4gIHsNCj4gQEAgLTI3OSw2ICszMTIsOCBAQCBz
dGF0aWMgdm9pZCBfX2VtaXRfam9iX2dlbjEyX3JlbmRlcl9jb21wdXRlKHN0cnVjdCB4ZV9zY2hl
ZF9qb2IgKmpvYiwNCj4gIA0KPiAgCWkgPSBlbWl0X2JiX3N0YXJ0KGJhdGNoX2FkZHIsIHBwZ3R0
X2ZsYWcsIGR3LCBpKTsNCj4gIA0KPiArCWkgPSBlbWl0X3JlbmRlcl9jYWNoZV9mbHVzaChqb2Is
IGR3LCBpKTsNCj4gKw0KPiAgCWlmIChqb2ItPnVzZXJfZmVuY2UudXNlZCkNCj4gIAkJaSA9IGVt
aXRfc3RvcmVfaW1tX3BwZ3R0X3Bvc3RlZChqb2ItPnVzZXJfZmVuY2UuYWRkciwNCj4gIAkJCQkJ
CWpvYi0+dXNlcl9mZW5jZS52YWx1ZSwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV93YV9vb2IucnVsZXMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+
IGluZGV4IDFlY2IxMDM5MGIyOC4uMTVjMjM4MTMzOThhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV93YV9vb2IucnVsZXMNCj4gQEAgLTE0LDMgKzE0LDQgQEANCj4gIAkJU1VCUExBVEZPUk0oREcy
LCBHMTIpDQo+ICAxODAyMDc0NDEyNQlQTEFURk9STShQVkMpDQo+ICAxNTA5MzcyODA0CVBMQVRG
T1JNKFBWQyksIEdSQVBISUNTX1NURVAoQTAsIEMwKQ0KPiArMTQwOTYwMDkwNwlHUkFQSElDU19W
RVJTSU9OX1JBTkdFKDEyMDAsIDEyNTApDQoNCg==
