Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3E4C7EE2E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 18:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1963A10E0AE;
	Fri,  9 Jun 2023 18:42:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1BA10E0AE
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 18:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686336145; x=1717872145;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=XkwPpoS+rv3RR0JEaJ37gmctbwSMmUok9F173beKT30=;
 b=l+HufGUwlieMlogaSQLUNwJdXGYJixy0dlnt/JWSAGt3hb5mi4ZyYbx/
 g9tDAuu9ExjZVGBeVUuCIgt3wUOxC2XKDO8jlRZmJ7QMq/m4rb68Hko8I
 bK8SiFrayGiX+XY6v7E5m/dxH2FxanNDJdbusWaAV5jbVTvvoZqNKkZlJ
 JZjMS1MGivjS+Es/l9bn5ZPdbCeeMdITvp7sJcHt2kDgkpMboEcCCJRrs
 IroN5fEbscn0EOfwV813cgAYcLN091jsprSXXE7rJszx5j8DKXn4Orxbf
 yPMTogew1kyZPBeDY6oPChLuUb0Qmw+4ERcZhWZOYAaEbruLBjMJe6ehz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="357664667"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="357664667"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="834737762"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="834737762"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 09 Jun 2023 11:42:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 11:42:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 11:42:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 11:42:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 11:42:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQ88Tcbp9OnlXeouR6HnrGv5KclgsQ8Ndhwal5lL71bj0OGpb/R++Z428wH5KatxIYKw1uytQH0/OG3FSehefGiMbSX8le2ftWCkFaKokfZke1Jiv+IEN1R5uE65lCE6+BZP4RuoX/mzHSBgRDY7HEdrqDuV/9NRJFqviVhFl0og0vyxwDmXhWohwr7j0kiAvHyOyHoCl1GF9N/CtXtui3tTUzi51aSRCx4YoNLOEm+Mw4QSJQ7vHakXqnhhw1m7aTXRzpJREq0WtBoR/5DkIpvZa2Xr450g6hiAdHICYxF7Bf0uCyPkQICpsCadwR/We7sZuWba9/WPOkHObTCIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkwPpoS+rv3RR0JEaJ37gmctbwSMmUok9F173beKT30=;
 b=mxSbhDV/GtLaHfoS7oUzcI99t3TXsOKU4Ge0xupfCQuG3j1xcaZill/tNK0IfRrQnh+V8m1/36kXn7FdzJ1onWtzbd5RitFRDCyIsSQxfFLEa2J668riRRIJiTt5QDht+ynyVsuvpm6UpWsVv6YLjrqJseUul5xrxzjKZ6duikykTf6yiRKCtlEPcFTMnV2t+kyWnZZnA/+EGa1cSGTqtwWuI337t4BkEbSQcz6Exk0qmt2PO1aTm9VGEE6QTUq6cNTe+um9iApzWa857PsmF2AbVGDHZ3L9/FC1rPqWW2rKJzp0H8S6VXr4c2m6HnBt810UNmQLvGtLu1ERHJnJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 18:42:23 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6455.034; Fri, 9 Jun 2023
 18:42:22 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/3] drm/xe: Ban a VM if rebind worker hits an
 error
Thread-Index: AQHZmv/w20xoPWp8e0OmDKZ0V6jHZ6+CzAsAgAACL4A=
Date: Fri, 9 Jun 2023 18:42:22 +0000
Message-ID: <8e0681eb3bc88ff8dda8ea9636e6a4a330fb623a.camel@intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
 <20230609182627.143150-3-matthew.brost@intel.com>
 <e2ca5771a74135ab434e812d19c0a897a78d2449.camel@intel.com>
In-Reply-To: <e2ca5771a74135ab434e812d19c0a897a78d2449.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA3PR11MB7435:EE_
x-ms-office365-filtering-correlation-id: 86573154-dd30-43d1-aacf-08db69194319
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ODOXGZCtgA6FpbyCc2R4+FiAKwxLEC/+yKxYvWQlmfbS47FJ6jrke47sljftB4tc3y5SCWgZl4vxTlOKeMoCuGyZRfgitL4ESNUVDjGJy2FXqdEOCOcYoA5avPOSpWHyVq0qjgQe5cLRCInULB1bvIzV9ga3C9oNDfQPhWmMYlhdl0ndQKasyyHtlE0+OXRB6X1rpyyIaYGQBh9KgEbd3jG1+GPp1zrsOAVAKAXIXTHTpwdxRcyhwQj+sozSKF3bPN/IyZTdGo+KCJZFHlDatKWO7MQhvadbk4GspZwqMxxpJhZXUbwQA4KNdPkQJm6oMyeWvwqZsL7KtO53ETiJIuL0NAO5DhfaXYI8Q7Fg/ypkue7HFStNma7+2gAGgvxi0uepRe2zNsF2EHLTTK4Mab747HpezNP9QXO+qTc2zZNGPNtRAmo6xIbpYXLmY65SYhL74JNsv+R/mfLkYw4l1lKyJYN1EKpCYfAJSq8xSE21rrHPtYTe5zJ8X7tzsi4FFyfTNgDWpcXDMg9Uts7xnPJcQXNMdSBaLkE7o5SlsFYuE3c9eu/17a5kCuQ8x/csXdoW/ulqqP/Z5WRCFrSLKKOF8eUf1HVIYc7Ga2K71egwUiLveLAx5IKTCNbQNC+f
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(6506007)(26005)(6512007)(36756003)(83380400001)(122000001)(86362001)(38070700005)(186003)(82960400001)(38100700002)(2616005)(316002)(41300700001)(110136005)(2906002)(91956017)(66446008)(6636002)(478600001)(66476007)(66946007)(8936002)(8676002)(64756008)(71200400001)(76116006)(6486002)(5660300002)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEo5aTBabllPZmNKRzFEWkthQkRHYmczZWRiZGJ5M3NNMjBqdm5jUjhlZUpk?=
 =?utf-8?B?SEdzVmd5RUV5UkhCaUorL1E2QUpPNmgrRFR2RElxbE1EbVhVVER1bmNtV0NH?=
 =?utf-8?B?bmJoTG1pR0M2MVZmbzFOanZRT2hxWUNpdTk1RXFEbjBnVERiUXNmU2lSNE5h?=
 =?utf-8?B?Z2NaQlBzNmYvYmIyMS93UzUxTE8waEZDVnY1TndBL1dwRXBvRGFOK1pkTVd5?=
 =?utf-8?B?UGhMeURjZWJqSnJZVHVTcU1BSUdkVm9Ga2lYRlZVWjM1bDcxUVdCWnoxaW9s?=
 =?utf-8?B?WUpNT3RHbnZFRXd3aVEvUFYvNHNnTmpuZmphVHpMWjBnQk8zTGlMcVVSZFhl?=
 =?utf-8?B?TG5PdXBtSzJzbjF5SEhtWGM1T1Ezd3FhWnQ3ZDYwOHNsTjhrSUliTU80anZs?=
 =?utf-8?B?a3pUVGYzQWRIWGNQMWhkY3lmZkNvQnBXcGh4Qlo4NG9xZmhuS01tbkNISzZX?=
 =?utf-8?B?SmF4RWtleHhPOWFuRjRyZ3R4TzlQQzlaQWNzVFBhTWs0anlkRFZHWDVoaTll?=
 =?utf-8?B?TW9DajBJSTNXZ3pRSlAralBWSUozRDVOMVBqN3oyVFRFT3I2aUQ0cGRudkhZ?=
 =?utf-8?B?Z0RuN2Fzc3JhcmswRnd5SngwZ0tQVTAxVThDS3JpZEo1TURXZC9sSVJRUHNS?=
 =?utf-8?B?dkhUdnI1dWhieFBOdGxZYjd0K3JmYmp3bElQWTRIWFYvQVdGV3VIbjRVaXJ6?=
 =?utf-8?B?NDN1Ni8vanNSWHhmWEtEWlorUU9tdnNnUDdGNThNVHVtKzRTMGV4ckRpc0p5?=
 =?utf-8?B?SlpWWWJyNHp3Q0pZTDFRMWo2cVgwY3QyM3JkMVFtWXJKM2Mvc0NkUTJwQTQ2?=
 =?utf-8?B?eW0vYXEzRUNEeW1vNzNZVzZjZThHM3d1eVcrNW5wZ0VYdzZEdUhEZE9Jdlg4?=
 =?utf-8?B?Qk9LVVprcGJOVUlWcU9OOVVIR2hlampGZks5QUFmSlNNMmRTdkxpSGJjYjVq?=
 =?utf-8?B?RUsveGpDOHZpZitLU2JzMVR6SmxXTzVtY0RlKzd5N2VDd0FBZVBGUjgrMGRj?=
 =?utf-8?B?d1owZThjd0plNllsaXF0d2hVdllyRHI4VW9ibnQxVWpoVHA4dFpzM2Y5b1lh?=
 =?utf-8?B?OTVIdnhIK3pxMjEzb1FOUXB6N1FIb0RRdFRMQjI2WFlJYzlqbExDOVd5QTVQ?=
 =?utf-8?B?NW1SdnV0N2NzOGRPbHBRT2NGRFpPUy81MkRlRjZlUkF4NjlMK3hvcDd5YTBk?=
 =?utf-8?B?WStYYUNUc3Z1TVJ6dHZxS043b09VL3phbzh5dVIyT2tHSTVYSXRhblc3UW1n?=
 =?utf-8?B?UVZseHovMHZuYmZHclpPdnh0Y2RIM2FDL014empsR3hrMTU0c2trT0pBZGYx?=
 =?utf-8?B?Mnc2bmZCUHM3OTB0ZkFTdkROT3F1V0F3ZVZSbHdBcWhQaGhBeWVJaDF0cm45?=
 =?utf-8?B?NHZaSGVGaTR4cTlOOVlFNmY0eTdHM1JZSWtCY2dxaWhxUFBMQWk5bkEybi91?=
 =?utf-8?B?V0FJQVFuczVvOVRNdlE0SVNSR3dzRXM5YUVSdkxwNDlBREVabElHOGNhenY4?=
 =?utf-8?B?emJ2UDc4dGRjbEhGdzU2WW5sYyt6dkh0aGdUMUtsMGN6NmpERWxCQi9ZTm04?=
 =?utf-8?B?NUVmOXQxSm9aV0pmLzd0UWZtVUU3RlVtaEcxSXFVVDBxQUdDMTVhWlE1R1JG?=
 =?utf-8?B?WERGdkhBQVEwUWh4Q0ZCZUV6RDlTTXJWSUIwUmRzSFBKbjNhSytjOUEwcVpG?=
 =?utf-8?B?dXRLTHh0S3MvWDYySGZ3NUIzZzY5Z2hHL2RySWMxRmFrR09jZ1AvcWtUb3Zu?=
 =?utf-8?B?REdpMng5RlV2UmlFZCt0R2czVllSb2dvSEZmK3QrK01GZ2x0V21kVlFFM2lh?=
 =?utf-8?B?aXQ0NUpWa2JhVFFoSi93ZVV3bFgxTUdybmNkTEszV3hrRy9DZGs4U1FSSWUv?=
 =?utf-8?B?Q1dnalB4YVNlemhYOFhzWE44bHpOdmpBOHp4M3BoWEJTWmVROE9iMVJmdktn?=
 =?utf-8?B?L250aXJVWTVoZzRGaHkzYnpsZ3EzN3c3ZitqMW45Rm9lTU1Lc1lZMSs1SjFZ?=
 =?utf-8?B?Sy9TNVJ3L2JhdnlBLzJ4eWx6TnNXQkh4cXUwbFVadkdTNmRxQUNvSVJ0dS9R?=
 =?utf-8?B?K1NQZHlLeDJ3b2NuMld2bHVsL0NWTmFzMit2SUhpV3BRWFI5NkpqYVYyaWpx?=
 =?utf-8?Q?+81kLb1f62o9pqCsNHSdVFXon?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD379925BE52C1489B76D1DD51310064@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86573154-dd30-43d1-aacf-08db69194319
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 18:42:22.3777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3DX8ALUWwxWuo9AzIvMrzN+O/WuoOp3MQUOcds56UP+c7ZpCAZZyWrDGRkpx7K/iEISt2qs9G3SyML4U+xAy4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7435
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Ban a VM if rebind worker hits
 an error
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

T24gRnJpLCAyMDIzLTA2LTA5IGF0IDE4OjM0ICswMDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
T24gRnJpLCAyMDIzLTA2LTA5IGF0IDExOjI2IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiA+IFdlIGNhbm5vdCByZWNvdmVyIGEgVk0gaWYgYSByZWJpbmQgd29ya2VyIGhpdHMgYW4gZXJy
b3IsIGJhbiB0aGUgVk0gaWYNCj4gPiBoYXBwZW5zIHRvIGVuc3VyZSB3ZSBkbyBub3QgYXR0ZW1w
dCB0byBwbGFjZSB0aGlzIFZNIG9uIHRoZSBoYXJkd2FyZQ0KPiA+IGFnYWluLg0KPiA+IA0KPiA+
IEEgZm9sbG93IHVwIHdpbGwgaW5mb3JtIHRoZSB1c2VyIGlmIHRoaXMgaGFwcGVucy4NCj4gPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNv
bT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jICAgICB8ICA1
ICsrKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMgICAgICAgfCAgMiArLQ0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2UuaCAgICAgIHwgIDUgKysrKysNCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgICAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysr
KysrKysrLS0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaCAgICAgICAgIHwgMTAg
KysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFkdmlzZS5jIHwgIDIg
Ky0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX3R5cGVzLmggICB8ICA1ICsrKy0tDQo+
ID4gIDcgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jDQo+ID4gaW5kZXggYjMwMzZjNGE4ZWMzLi5iMWY4
MDhjMDhkYzUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jDQo+ID4gQEAgLTU5Nyw2
ICs1OTcsMTEgQEAgaW50IHhlX2VuZ2luZV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSwNCj4gPiAgCQlpZiAoWEVfSU9DVExfRVJSKHhlLCAhdm0pKQ0KPiA+
ICAJCQlyZXR1cm4gLUVOT0VOVDsNCj4gPiAgDQo+ID4gKwkJaWYgKFhFX0lPQ1RMX0VSUih4ZSwg
eGVfdm1faXNfY2xvc2VkX29yX2Jhbm5lZCh2bSkpKSB7DQo+ID4gKwkJCXhlX3ZtX3B1dCh2bSk7
DQo+ID4gKwkJCXJldHVybiAtRU5PRU5UOw0KPiA+ICsJCX0NCj4gPiArDQo+ID4gIAkJZSA9IHhl
X2VuZ2luZV9jcmVhdGUoeGUsIHZtLCBsb2dpY2FsX21hc2ssDQo+ID4gIAkJCQkgICAgIGFyZ3Mt
PndpZHRoLCBod2UsIEVOR0lORV9GTEFHX1BFUlNJU1RFTlQpOw0KPiA+ICAJCXhlX3ZtX3B1dCh2
bSk7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jDQo+ID4gaW5kZXggZTQ0MDc2ZWUyZTExLi4yN2MxMTgx
MmQ3MzMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMNCj4gPiBAQCAtMjk0LDcgKzI5NCw3
IEBAIGludCB4ZV9leGVjX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEs
IHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4gPiAgCWlmIChlcnIpDQo+ID4gIAkJZ290byBlcnJf
dW5sb2NrX2xpc3Q7DQo+ID4gIA0KPiA+IC0JaWYgKHhlX3ZtX2lzX2Nsb3NlZChlbmdpbmUtPnZt
KSkgew0KPiA+ICsJaWYgKHhlX3ZtX2lzX2Nsb3NlZF9vcl9iYW5uZWQoZW5naW5lLT52bSkpIHsN
Cj4gPiAgCQlkcm1fd2FybigmeGUtPmRybSwgIlRyeWluZyB0byBzY2hlZHVsZSBhZnRlciB2bSBp
cyBjbG9zZWRcbiIpOw0KPiA+ICAJCWVyciA9IC1FSU87DQo+IA0KPiBXaGVuIGJhbm5lZCBpdCBz
aG91bGQgcmV0dXJuIEVDQU5DRUxFRCBsaWtlOg0KPiANCj4gaWYgKFhFX0lPQ1RMX0VSUih4ZSwg
ZW5naW5lLT5mbGFncyAmIEVOR0lORV9GTEFHX0JBTk5FRCkpIHsNCj4gCWVyciA9IC1FQ0FOQ0VM
RUQ7DQo+IAlnb3RvIGVycl9lbmdpbmU7DQo+IH0NCj4gDQo+IEFib3V0IGhvdyB0byBub3RpZnkg
VU1ELCBob3cgYWJvdXQgYWRkIGEgRFJNX0lPQ1RMX1hFX1ZNX0dFVF9QUk9QRVJUWT8NCg0KT24g
dG9wIG9mIHRoYXQsIHdlIHNob3VsZCBoYXZlIGV4ZWMgZG9jdW1lbnRhdGlvbiBzYXlpbmcgd2hh
dCBhcmUgdGhlIGVycm9yIGNhc2VzIGxpa2UgdGhpcyBvbmUgYW5kIGVuZ2luZSBiYW5uZWQuDQoN
Cj4gDQo+ID4gIAkJZ290byBlcnJfZW5naW5lX2VuZDsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3RyYWNlLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2UuaA0K
PiA+IGluZGV4IDJmOGViN2ViZTlhNy4uZWI4OWFjOTM0Mzk0IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3RyYWNlLmgNCj4gPiBAQCAtNDcyLDYgKzQ3MiwxMSBAQCBERUNMQVJFX0VWRU5UX0NMQVNT
KHhlX3ZtLA0KPiA+ICAJCQkgICAgICBfX2VudHJ5LT5hc2lkKQ0KPiA+ICApOw0KPiA+ICANCj4g
PiArREVGSU5FX0VWRU5UKHhlX3ZtLCB4ZV92bV9raWxsLA0KPiA+ICsJICAgICBUUF9QUk9UTyhz
dHJ1Y3QgeGVfdm0gKnZtKSwNCj4gPiArCSAgICAgVFBfQVJHUyh2bSkNCj4gPiArKTsNCj4gPiAr
DQo+ID4gIERFRklORV9FVkVOVCh4ZV92bSwgeGVfdm1fY3JlYXRlLA0KPiA+ICAJICAgICBUUF9Q
Uk9UTyhzdHJ1Y3QgeGVfdm0gKnZtKSwNCj4gPiAgCSAgICAgVFBfQVJHUyh2bSkNCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uYw0KPiA+IGluZGV4IGU0MzExYzQ4Y2M1NC4uMTk2NmE1ODNiNzYxIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmMNCj4gPiBAQCAtNTE0LDYgKzUxNCwyNCBAQCB2b2lkIHhlX3ZtX3VubG9j
a19kbWFfcmVzdihzdHJ1Y3QgeGVfdm0gKnZtLA0KPiA+ICANCj4gPiAgI2RlZmluZSBYRV9WTV9S
RUJJTkRfUkVUUllfVElNRU9VVF9NUyAxMDAwDQo+ID4gIA0KPiA+ICtzdGF0aWMgdm9pZCB4ZV92
bV9raWxsKHN0cnVjdCB4ZV92bSAqdm0pDQo+ID4gK3sNCj4gPiArCXN0cnVjdCB3d19hY3F1aXJl
X2N0eCB3dzsNCj4gPiArCXN0cnVjdCB4ZV9lbmdpbmUgKmU7DQo+ID4gKw0KPiA+ICsJbG9ja2Rl
cF9hc3NlcnRfaGVsZCgmdm0tPmxvY2spOw0KPiA+ICsNCj4gPiArCXhlX3ZtX2xvY2sodm0sICZ3
dywgMCwgZmFsc2UpOw0KPiA+ICsJdm0tPmZsYWdzIHw9IFhFX1ZNX0ZMQUdfQkFOTkVEOw0KPiA+
ICsJdHJhY2VfeGVfdm1fa2lsbCh2bSk7DQo+ID4gKw0KPiA+ICsJbGlzdF9mb3JfZWFjaF9lbnRy
eShlLCAmdm0tPnByZWVtcHQuZW5naW5lcywgY29tcHV0ZS5saW5rKQ0KPiA+ICsJCWUtPm9wcy0+
a2lsbChlKTsNCj4gPiArCXhlX3ZtX3VubG9jayh2bSwgJnd3KTsNCj4gPiArDQo+ID4gKwkvKiBU
T0RPOiBJbmZvcm0gdXNlciB0aGUgVk0gaXMgYmFubmVkICovDQo+ID4gK30NCj4gPiArDQo+ID4g
IHN0YXRpYyB2b2lkIHByZWVtcHRfcmViaW5kX3dvcmtfZnVuYyhzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
KncpDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCB4ZV92bSAqdm0gPSBjb250YWluZXJfb2Yodywgc3Ry
dWN0IHhlX3ZtLCBwcmVlbXB0LnJlYmluZF93b3JrKTsNCj4gPiBAQCAtNTMzLDcgKzU1MSw3IEBA
IHN0YXRpYyB2b2lkIHByZWVtcHRfcmViaW5kX3dvcmtfZnVuYyhzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
KncpDQo+ID4gIAlYRV9CVUdfT04oIXhlX3ZtX2luX2NvbXB1dGVfbW9kZSh2bSkpOw0KPiA+ICAJ
dHJhY2VfeGVfdm1fcmViaW5kX3dvcmtlcl9lbnRlcih2bSk7DQo+ID4gIA0KPiA+IC0JaWYgKHhl
X3ZtX2lzX2Nsb3NlZCh2bSkpIHsNCj4gPiArCWlmICh4ZV92bV9pc19jbG9zZWRfb3JfYmFubmVk
KHZtKSkgew0KPiA+ICAJCXRyYWNlX3hlX3ZtX3JlYmluZF93b3JrZXJfZXhpdCh2bSk7DQo+ID4g
IAkJcmV0dXJuOw0KPiA+ICAJfQ0KPiA+IEBAIC02NjIsMTEgKzY4MCwxMiBAQCBzdGF0aWMgdm9p
ZCBwcmVlbXB0X3JlYmluZF93b3JrX2Z1bmMoc3RydWN0IHdvcmtfc3RydWN0ICp3KQ0KPiA+ICAJ
CQlnb3RvIHJldHJ5Ow0KPiA+ICAJCX0NCj4gPiAgCX0NCj4gPiArCWlmIChlcnIpDQo+ID4gKwkJ
eGVfdm1fa2lsbCh2bSk7DQo+ID4gIAl1cF93cml0ZSgmdm0tPmxvY2spOw0KPiA+ICANCj4gPiAg
CWZyZWVfcHJlZW1wdF9mZW5jZXMoJnByZWVtcHRfZmVuY2VzKTsNCj4gPiAgDQo+ID4gLQlYRV9X
QVJOX09OKGVyciA8IDApOwkvKiBUT0RPOiBLaWxsIFZNIG9yIHB1dCBpbiBlcnJvciBzdGF0ZSAq
Lw0KPiA+ICAJdHJhY2VfeGVfdm1fcmViaW5kX3dvcmtlcl9leGl0KHZtKTsNCj4gPiAgfQ0KPiA+
ICANCj4gPiBAQCAtMTEyNyw3ICsxMTQ2LDcgQEAgeGVfdm1fZmluZF9vdmVybGFwcGluZ192bWEo
c3RydWN0IHhlX3ZtICp2bSwgY29uc3Qgc3RydWN0IHhlX3ZtYSAqdm1hKQ0KPiA+ICB7DQo+ID4g
IAlzdHJ1Y3QgcmJfbm9kZSAqbm9kZTsNCj4gPiAgDQo+ID4gLQlpZiAoeGVfdm1faXNfY2xvc2Vk
KHZtKSkNCj4gPiArCWlmICh4ZV92bV9pc19jbG9zZWRfb3JfYmFubmVkKHZtKSkNCj4gPiAgCQly
ZXR1cm4gTlVMTDsNCj4gPiAgDQo+ID4gIAlYRV9CVUdfT04odm1hLT5lbmQgPj0gdm0tPnNpemUp
Ow0KPiA+IEBAIC0zMDQ4LDcgKzMwNjcsNyBAQCBpbnQgeGVfdm1fYmluZF9pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpDQo+ID4g
IAkJZ290byBmcmVlX29ianM7DQo+ID4gIAl9DQo+ID4gIA0KPiA+IC0JaWYgKFhFX0lPQ1RMX0VS
Uih4ZSwgeGVfdm1faXNfY2xvc2VkKHZtKSkpIHsNCj4gPiArCWlmIChYRV9JT0NUTF9FUlIoeGUs
IHhlX3ZtX2lzX2Nsb3NlZF9vcl9iYW5uZWQodm0pKSkgew0KPiA+ICAJCWRybV9lcnIoZGV2LCAi
Vk0gY2xvc2VkIHdoaWxlIHdlIGJlZ2FuIGxvb2tpbmcgdXA/XG4iKTsNCj4gPiAgCQllcnIgPSAt
RU5PRU5UOw0KPiA+ICAJCWdvdG8gcHV0X3ZtOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5oDQo+ID4gaW5kZXgg
MzcyZjI2MTUzMjA5Li44NTgyMDdhMjAwMTcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaA0KPiA+
IEBAIC00OSw2ICs0OSwxNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgeGVfdm1faXNfY2xvc2VkKHN0
cnVjdCB4ZV92bSAqdm0pDQo+ID4gIAlyZXR1cm4gIXZtLT5zaXplOw0KPiA+ICB9DQo+ID4gIA0K
PiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgeGVfdm1faXNfYmFubmVkKHN0cnVjdCB4ZV92bSAqdm0p
DQo+ID4gK3sNCj4gPiArCXJldHVybiB2bS0+ZmxhZ3MgJiBYRV9WTV9GTEFHX0JBTk5FRDsNCj4g
PiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGlubGluZSBib29sIHhlX3ZtX2lzX2Nsb3NlZF9vcl9i
YW5uZWQoc3RydWN0IHhlX3ZtICp2bSkNCj4gPiArew0KPiA+ICsJcmV0dXJuIHhlX3ZtX2lzX2Ns
b3NlZCh2bSkgfHwgeGVfdm1faXNfYmFubmVkKHZtKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3Ry
dWN0IHhlX3ZtYSAqDQo+ID4gIHhlX3ZtX2ZpbmRfb3ZlcmxhcHBpbmdfdm1hKHN0cnVjdCB4ZV92
bSAqdm0sIGNvbnN0IHN0cnVjdCB4ZV92bWEgKnZtYSk7DQo+ID4gIA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFkdmlzZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3ZtX21hZHZpc2UuYw0KPiA+IGluZGV4IDBmNWVlZjMzNzAzNy4uNzY0NThmOGQ1N2YzIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2aXNlLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFkdmlzZS5jDQo+ID4gQEAgLTMxMyw3ICsz
MTMsNyBAQCBpbnQgeGVfdm1fbWFkdmlzZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLA0KPiA+ICAJaWYgKFhFX0lPQ1RMX0VSUih4ZSwgIXZtKSkNCj4gPiAgCQlyZXR1
cm4gLUVJTlZBTDsNCj4gPiAgDQo+ID4gLQlpZiAoWEVfSU9DVExfRVJSKHhlLCB4ZV92bV9pc19j
bG9zZWQodm0pKSkgew0KPiA+ICsJaWYgKFhFX0lPQ1RMX0VSUih4ZSwgeGVfdm1faXNfY2xvc2Vk
X29yX2Jhbm5lZCh2bSkpKSB7DQo+ID4gIAkJZXJyID0gLUVOT0VOVDsNCj4gPiAgCQlnb3RvIHB1
dF92bTsNCj4gPiAgCX0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
X3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fdHlwZXMuaA0KPiA+IGluZGV4IDc2
YWY2YWMwZmE4NC4uNTY2YjY3YWJlMWMzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bV90eXBlcy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX3R5
cGVzLmgNCj4gPiBAQCAtMTc4LDggKzE3OCw5IEBAIHN0cnVjdCB4ZV92bSB7DQo+ID4gICNkZWZp
bmUgWEVfVk1fRkxBR19NSUdSQVRJT04JCUJJVCgzKQ0KPiA+ICAjZGVmaW5lIFhFX1ZNX0ZMQUdf
U0NSQVRDSF9QQUdFCQlCSVQoNCkNCj4gPiAgI2RlZmluZSBYRV9WTV9GTEFHX0ZBVUxUX01PREUJ
CUJJVCg1KQ0KPiA+IC0jZGVmaW5lIFhFX1ZNX0ZMQUdfR1RfSUQoZmxhZ3MpCQkoKChmbGFncykg
Pj4gNikgJiAweDMpDQo+ID4gLSNkZWZpbmUgWEVfVk1fRkxBR19TRVRfVElMRV9JRCh0aWxlKQko
KHRpbGUpLT5pZCA8PCA2KQ0KPiA+ICsjZGVmaW5lIFhFX1ZNX0ZMQUdfQkFOTkVECQlCSVQoNikN
Cj4gPiArI2RlZmluZSBYRV9WTV9GTEFHX0dUX0lEKGZsYWdzKQkJKCgoZmxhZ3MpID4+IDcpICYg
MHgzKQ0KPiA+ICsjZGVmaW5lIFhFX1ZNX0ZMQUdfU0VUX1RJTEVfSUQodGlsZSkJKCh0aWxlKS0+
aWQgPDwgNykNCj4gPiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gIA0KPiA+ICAJLyoqIEBj
b21wb3NpdGVfZmVuY2VfY3R4OiBjb250ZXh0IGNvbXBvc2l0ZSBmZW5jZSAqLw0KPiANCg0K
