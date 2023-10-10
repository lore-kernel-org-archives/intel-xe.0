Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E45CD8CB6
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 19:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CC610E17C;
	Tue, 10 Oct 2023 19:50:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1218510E17C
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 19:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696967434; x=1728503434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bpqEIY6/y8mSuxXiVZGtk3zvMOYZgSDbmzNXaz0WmUg=;
 b=YzTmzOi/nxLKRZqnJ66ngLVWm/ww8/xI/OC18aWBxn0wb/+2mqvjSfD6
 U4J0fhIhtrMrQ2ovxtvAQ8M85JaIp5eXpNRYfw8oI/lfrL7xMgk9/f77Y
 lrJ7xaHCMQbs2mFhtMnM6SATYs8MeHtthA+obJ5+GN4O7SKFMeNmAZ67a
 XqSybLWvBgGIK26yxCUbHmZLKdoFV40CxafL8V0T/1KF4oTOZeSDZPfyW
 7/PKIYOdfaSRST9zFU6weTv65R0LOB7v+qOGLDhsLJeb0DhzeiLbZ+HGX
 wGj3/wWKVI4QYXVBuzdKQ355nHOKthxRF9vVXlRfLRF4gGe4NoaDHuNFN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="384351658"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="384351658"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 12:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="730230014"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="730230014"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 12:50:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 12:50:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 12:50:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 12:50:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 12:50:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eR/Kxl2OrVnqwzK0jHEnS8kuLIAenOaxj+UpqKSl4rZNVsb31o5tdM+rWNLzhx5AoqeaerM23HIGPAmJYyWduoLzWT2Ao/nd3HNqKPnSyI6FUDIiqr6fQvKn/q9D3+jLVg7Y1a4obK8X4KiHeITNFdys4/+1hGkQhP1BgvIFBdVMt8/P/7BN4UaNV2ecRXJljjX+tIg5ywA+9nGFC+hjCHX3exc1NADp+ZzfRygr+m+AVGQ+ig5HzKdSU+Kh5PpH/XS3cejfO87ggWcp0AlWgh/uzhG5raBwsCpBMbayMcAPKiv3pS59whKslujIEIPnj+S8zkIr8aDEZ7TVlp1bdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpqEIY6/y8mSuxXiVZGtk3zvMOYZgSDbmzNXaz0WmUg=;
 b=SeFCN11bdQJZX4f0YX4xIRaEm703+epVOeI/BQdAfE2u3xc0pg0wWcI0Lt7AKcQDaz+NFfT64ROrGeu3Ai1PqqHJgBpn+4bGjZd75RAdeiCRwm//ONbTlyNDNIRlF9ssuteQLwSnyfYqq+7kP/X+Ju1FbzcF6pktqQVwbxbp3dA75QEmQ9NAEqOdum7OOnYMKLcgjhJWFCVax2q7igyOY4ntZ1X6ZHEbGyIdN6tCr+khH2W2VoVC2sSPQLWLJYPybIyELTgRUruz5SaMdSiXS+FcHrsHnoBJiE+6BtOsATNXvl1sZueZ3871zO+q8cKltYg1GvNkpGTIrUUKRox4LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 19:50:29 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 19:50:29 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2] drm/xe: Set PTE_AE for smem alocation as
 well
Thread-Index: AQHZ95nHPOy1JUOGVEmi/LZ7Ug1zqLBDK3eAgABLXYA=
Date: Tue, 10 Oct 2023 19:50:29 +0000
Message-ID: <1442c93d5ad30376089e9c1abccc721745755d10.camel@intel.com>
References: <20231005143922.23206-1-jose.souza@intel.com>
 <kdm5bgzisakhr3v2nqtccz5dche3ujkumjd3wy2u5ry3v7tti6@vn6c7c4ey6wx>
In-Reply-To: <kdm5bgzisakhr3v2nqtccz5dche3ujkumjd3wy2u5ry3v7tti6@vn6c7c4ey6wx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CYYPR11MB8430:EE_
x-ms-office365-filtering-correlation-id: c598c8ad-3aae-441d-89fb-08dbc9ca2811
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D7nUuplQoIT8CMOpEk3sHwJ7iVKvyG+i8T1qzCbvVK7wl4fbOa0hrUXic0hVgZfN6wxpFmcP5wOfCM1ThkgCJz10MiDS+TVwLWkV3FXJ6kpvzQgFso8rjZiIicBev2R80xLADiDWbIxEKYIrBlK0ILUbGp27fP8bLWsbq5StlXT5+n/JQ1bApFZl3vfoTuoVyzU0j8x10aim9oRfL7bDW5vao2LBuNnM5tgmyXIVWRyg6PI1uLtnqyqkcLJZixQgObaixxiC0KR0HcUBgnUIjaA2u2/riGT6UYvRx6aunhtCsMple4t+UzAYACvgq4g24+VMqESvMrIzUjeAb7uhhOaX+qG54pvCQRwTOxc5Tza2orKB+9RgrDQIndOvujD3o08lVLL9FBpw5Gg+0KX9Ltw/U0zjseqaXCYoZjGxlBEkjiU+B32OkUb21KFeT/eMKgT+hrDAWkMsKnTkoXajVtuLIEQ82Vin6S8j1B0VeifcSgI1eydPlk55zP75992kcpoIfK4uZbcdKh8LLVqwQGLZ0H0rSE3TOqU8hMn2H18t9H8AOphJj9jpHs6WPtNM3zXYzRNhFuJI1U/zCEfYqSaxIkt8K67jeTF4CoFEs3g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66899024)(41300700001)(6512007)(91956017)(6636002)(66946007)(6506007)(2616005)(83380400001)(110136005)(64756008)(26005)(66556008)(66476007)(66446008)(316002)(76116006)(5660300002)(71200400001)(8676002)(2906002)(4001150100001)(478600001)(6486002)(8936002)(4326008)(36756003)(122000001)(38100700002)(38070700005)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YysvYzJ5cmk4TDVNaW1vTEZ6c1h3czltbVh2dTlXV041ZUM2M0JESU9nZUhL?=
 =?utf-8?B?ZnZackhJTUpNeHNSdk9ZbkwyNDB1anZONlBtT05oRmxuMy9GS3JpVzh5cXQ1?=
 =?utf-8?B?cDdua2ZqbndiK2dibUxwbWdEVThucEFKZm42aUpvbTJncXRWYU5XckRYbVg5?=
 =?utf-8?B?dTBpU3JFUk42aEtid0xDYkd6ZjI4bHZwZzBjUmNXS09WMUdEV0E2cUlzWkxu?=
 =?utf-8?B?Q3MxV3B6S3VaMzZSRm1CL1JmZmFFaE1BbWk1MFlaSHRqdkRWdEZQNUIya01j?=
 =?utf-8?B?K2tJMEZqZmY3UkZKVlVmWlU4S0VCdDA4dWFnUFo4cG85TzQ3dDNoZlhwVGlu?=
 =?utf-8?B?bStUaHhnT2g4Mk96ZjVHTFgzU0JJNVNtb0taZXhxd214akFsbnVIOUk1emtD?=
 =?utf-8?B?K2JQMFlwdWtZcVoraEQ5RE9PQzMzVTZWMEVRTUFGVDFDVFJqSGdMUUtXNC8v?=
 =?utf-8?B?b2VIQStiWUtVNWJ1a2MyTDNaQkxLcmxWRDZUcVdKNnVOMGhVdmRVWUJqT0Ru?=
 =?utf-8?B?VW1qbUhkQVpQd0VrRU1BcGthb2I3YWdTME1pajdFQ1JPY2hMb09ubWhTV2s0?=
 =?utf-8?B?WHk2V0xuMjg1RTQ5QklRbWlPVGtRN2gwckx0a0lUYmZkR0k0cjluT1UzZFNY?=
 =?utf-8?B?OUhiSFRVY2hDaE5kS3U2a3NFcGxYV3FyNENPYXRuRjZTcHA2Mi9NNkhpbGJo?=
 =?utf-8?B?Wkw1UmpWQytKajBNTnIwSHp1blJMeXh6elZmQk9sT1c2dGQvNEFLWERZbGc1?=
 =?utf-8?B?WXoxK0lxV2IwTG54c0VObEpaQ0w5SWRXaVpWVGV3dFdVYjVIUGlYdWNReW5h?=
 =?utf-8?B?RERiVEVmeHZCREkvYk5ublc3MkxmcnBLL0RRMmVWcUtVUVpXbnIrTm10U0hj?=
 =?utf-8?B?UDNFUXVDeXVScFUyYTdabWd5QUdvMy9MQ0lqZlFjanZzT2NFVERzZ1FVblhV?=
 =?utf-8?B?S0l5dDFhZG02YUVjcXl4UVU0c1dEcFBJcDZva1dEWS93cEdLVUpia2t3VGll?=
 =?utf-8?B?MHRpU0czN0xhMXM3bW81cms1VnFFdjVjT2FOdXpMSnZyUFdFbk9qU2x4SU5B?=
 =?utf-8?B?Rks3RW1NMUVDRGRjWFVUR3E3M1RGUi9iMVN3U1Z5U2swSkZwY2gxeFFlRlVD?=
 =?utf-8?B?MTRCOEpXVFh1YUZhWGR1NWFveEJqTU8xSWw4T1BtOEtyK3pYcXZPUXlsbEc2?=
 =?utf-8?B?THRXUVltZDBwYm10SSs5Ty9JeVhNWjhCeUZpdWp5SW9vUUR1a1lDS29IOVYy?=
 =?utf-8?B?TWpQYVM4K1hDNzg1SklIWmgxZ2NONEhBazF2NVJ5LzNwMC9GSFZMaFc5QU5G?=
 =?utf-8?B?ZlJvbVNveDBzd3Z6OWp0aEJ2c0lDY1FiekIxU0VEaUlURU1MaHNvY0FOMndU?=
 =?utf-8?B?N1VzRjlrSlQydytDSXVXT2YycU9mODNsRnBlK3BsdUIvU3pHM0tmTk1WaWxu?=
 =?utf-8?B?WUNSMzN1Ui9oVHIyMlRPdzQyay8zaVE1cjlzcFhZRE5oR2lYdE9RU0tLcUV0?=
 =?utf-8?B?ZC9tZlpsN1g5aXh6VzZKZWt2R1RUaGpFZWFLK29VK1NpdGUwc0RocEtzWVNY?=
 =?utf-8?B?ZnlJU1FHSXhZaFdtbE04MUtzZ0Q1V0IzYkxsaEFFRWdpL2N3ZU1BSzFCUXk1?=
 =?utf-8?B?dGpveXA0VUV4cm00eDMvWWpPWFVXbFRCTGZDQ2VaN1c3dE84VjZuUXZCajA1?=
 =?utf-8?B?c0RZWTRISS9Ka0Q5YXk3NWJ4aURhWlE3TTNPK2hUcFNrYkN3ZGJvNG9ZbG01?=
 =?utf-8?B?QUxZcUZ0QlZIcDZ5eVkwOEdIRGE1ZUdDUVJLakRPdkRCOUdCaTZDMTVPZ1pU?=
 =?utf-8?B?S3N3WDRwL1UveENpQWFSNUljRGR4KytXNVBhVDhpZE9EeEYrZytKRWR4Nlo1?=
 =?utf-8?B?THFSR1RmOXlzb0hrMCtYSVgvb20rS3VxdFQ1Z1ZKNGZiaEwwRHhtaVVwTkdo?=
 =?utf-8?B?R2hQTjFKUGZMR093UUFZbE4vekxFWHUzQjUrZVllbEtNU1lpck9hdHduZGZI?=
 =?utf-8?B?amxRN1NQUytqREJpQWtFUmFlcjQwWFg5TUxCK0pqM1RxUmxyS2V5d2x2NkVX?=
 =?utf-8?B?RDM4ZVFmZHVwWjVIYUhLN3FLQjVhUFA1d25QUURXRnE0Vm56RVlRRDJtTjBj?=
 =?utf-8?B?NlpzbGtPVURVbFFCOS96ZXBHRDNtZG04UHFDNml2Z080c0pqdjRmOEhYbTMr?=
 =?utf-8?B?dGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B7DB5D11A24DF4792B37A8F1A158597@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c598c8ad-3aae-441d-89fb-08dbc9ca2811
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 19:50:29.5871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dg8ao7SNNunOWe1tpuqFTO9C/aYamKRJ4x3VCdf7cnPzMkRMr1H3OaY1z76WJwZNUsFmPPytNq28EeQXLfv0Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Set PTE_AE for smem alocation as
 well
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEwLTEwIGF0IDEwOjIwIC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFRodSwgT2N0IDA1LCAyMDIzIGF0IDA3OjM5OjIxQU0gLTA3MDAsIEpvc2UgU291emEg
d3JvdGU6DQo+ID4gV2l0aG91dCB0aGlzIGlmIGEgYXRvbWljIG9wZXJhdGlvbiBpcyBleGVjdXRl
ZCBvdmVyIHNtZW0gaXQgY2F1c2VzDQo+ID4gZW5naW5lIG1lbW9yeSBjYXRhc3Ryb3BoaWMgZXJy
b3IuDQo+ID4gDQo+ID4gVGhpcyBmaXhlcyBhdCBsZWFzdCAzIGZhaWx1cmVzIGluIHBpZ2xpdCBz
YW5pdHkgYW5kIDIgZmFpbHVyZXMgaW4NCj4gPiBjcnVjaWJsZSBmb3IgTE5MLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPg0KPiA+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4N
Cj4gDQo+IA0KPiBSZXZpZXdlZC1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBp
bnRlbC5jb20+DQo+IA0KPiBCdXQgdGhlcmUncyB0aGUgcGVuZGluZyBkaXNjdXNzaW9uIHdpdGgg
TWF0dCBSb3BlciBvbiB3aGV0aGVyIHRoaXMgaXMNCj4gY29ycmVjdCBmb3IgZGlzY3JldGUuICBJ
dCdzIGRpZmZlcmVudCB0byBoYXZlIGFuIGludGVncmF0ZWQgcGxhdGZvcm0NCj4gZGVhbGluZyB3
aXRoIHN5c3RlbSBtZW1vcnkgYW5kIGEgZGlzY3JldGUgb25lIGRlYWxpbmcgd2l0aCBzeXN0ZW0N
Cj4gbWVtb3J5LiAgTGV0J3Mgd2FpdCB0aGF0IHNldHRsZSBiZWZvcmUgbWVyZ2luZy4NCg0KSSBo
YXZlIHRlc3RlZCB0aGlzIG9uIFBWQyBhbmQgeGVfZXhlY19mYXVsdF9tb2RlQGF0b21pYyogdGVz
dHMgZmFpbHMgd2l0aCB0aGlzIHBhdGNoLg0KQWxzbyBhZGRlZCBhIGRlYnVnIG1lc3NhZ2UgaW4g
cGZfcXVldWVfd29ya19mdW5jKCkgYW5kIHRoZXJlIGlzIG5vIG1vcmUgZmF1bHRzIG9mIHR5cGUg
MiB3aXRoIGl0LCB3aGlsZSB0aGVyZSBpcyBhIGZldyBhZnRlciBlYWNoDQp4ZV9leGVjX2ZhdWx0
X21vZGVAYXRvbWljKiB0ZXN0cyBleGVjdXRpb24gd2l0aG91dCB0aGlzIHBhdGNoLg0KDQpTbyB5
ZWFoIHdlIGNhbid0IGFkZCBQVEVfQUUgZm9yIHNtZW0gZm9yIGRpc2NyZXRlIEdQVXMuDQpJIGhh
dmUgYWRqdXN0ZWQgdGhlIHBhdGNoIGFuZCB3aWxsIGJlIHNlbmRpbmcgaXQgYWdhaW4uDQoNCg0K
PiANCj4gdGhhbmtzDQo+IEx1Y2FzIERlIE1hcmNoaQ0KPiANCj4gPiAtLS0NCj4gPiBkcml2ZXJz
L2dwdS9kcm0veGUveGVfcHQuYyB8IDcgKysrKy0tLQ0KPiA+IDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wdC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gPiBp
bmRleCA3MGE4YmQzNTU4YzJhLi40YmRmN2VkZDk0OGQ1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0
LmMNCj4gPiBAQCAtNjQ4LDEwICs2NDgsMTEgQEAgeGVfcHRfc3RhZ2VfYmluZChzdHJ1Y3QgeGVf
dGlsZSAqdGlsZSwgc3RydWN0IHhlX3ZtYSAqdm1hLA0KPiA+IAlzdHJ1Y3QgeGVfcHQgKnB0ID0g
eGVfdm1hX3ZtKHZtYSktPnB0X3Jvb3RbdGlsZS0+aWRdOw0KPiA+IAlpbnQgcmV0Ow0KPiA+IA0K
PiA+ICsJaWYgKHZtYSAmJiAodm1hLT5ncHV2YS5mbGFncyAmIFhFX1ZNQV9BVE9NSUNfUFRFX0JJ
VCkpDQo+ID4gKwkJeGVfd2Fsay5kZWZhdWx0X3B0ZSB8PSBYRV9VU01fUFBHVFRfUFRFX0FFOw0K
PiA+ICsNCj4gPiAJaWYgKGlzX2Rldm1lbSkgew0KPiA+IC0JCXhlX3dhbGsuZGVmYXVsdF9wdGUg
PSBYRV9QUEdUVF9QVEVfRE07DQo+ID4gLQkJaWYgKHZtYSAmJiB2bWEtPmdwdXZhLmZsYWdzICYg
WEVfVk1BX0FUT01JQ19QVEVfQklUKQ0KPiA+IC0JCQl4ZV93YWxrLmRlZmF1bHRfcHRlIHw9IFhF
X1VTTV9QUEdUVF9QVEVfQUU7DQo+ID4gKwkJeGVfd2Fsay5kZWZhdWx0X3B0ZSB8PSBYRV9QUEdU
VF9QVEVfRE07DQo+ID4gCQl4ZV93YWxrLmRtYV9vZmZzZXQgPSB2cmFtX3JlZ2lvbl9ncHVfb2Zm
c2V0KGJvLT50dG0ucmVzb3VyY2UpOw0KPiA+IAkJeGVfd2Fsay5jYWNoZSA9IFhFX0NBQ0hFX1dC
Ow0KPiA+IAl9IGVsc2Ugew0KPiA+IC0tIA0KPiA+IDIuNDIuMA0KPiA+IA0KDQo=
