Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEE5C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 12:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97FD10E13D;
	Tue,  7 Nov 2023 12:18:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6CE10E514
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 12:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699359532; x=1730895532;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Pr/s6klY681xIAFXU5CsxAqDW/y+BEM+svoBRkTsYrY=;
 b=mk/TpiPcWgyjAgQBv5r451hVIT2djq3dw9IuLOxI3OX2QLxudRca//KW
 Nwz+zI8gzJXg2FAWEQA4mb2Lz7hVexZ3QRLQRyMmNxdKhGSxDw8NG4Dda
 CwsgSSbP4sUFEfK5A+C+6IFFakDPvw1oUzJNN6IMoq/5zctQISFb126yC
 i6MW3R+84NSBAippHeoSC53MviIRO16SckcISzNmNQWu3O7ztEMPWeRAi
 P7T9WVuWqfEt2HL9sIdEITPJhzfPl5dhI28qjIzkN0Y0VymClaQItpcZl
 yXuGR6j0TCtbruK2xX/v9S/Sz/yj003WUY89yks3PGrxsLJSj9e5QobSW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="393393352"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="393393352"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:18:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="1094153604"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="1094153604"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 04:18:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 04:18:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 04:18:50 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 04:18:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3FtBUivEzaFkUGfQRfS4WyewOxVEy2FbF75gWkGE7ZjQl5VIGaqKxQ4+fCXWPvuJn14kdpOO480rNcAdahrzziZKt9+JiOmnWcGMoGgHM6GoRRMVLTz6Cn824CxQQvjGv6UISdOJVWH4bMuQMOxR5NwcWlpzBw3Vq0g++ojTy6xgJzuAHkPyKbpQCmpXBr8ItWRe0d3iDI2RlRmA26TY0W9atYPgS1egw3lXfw7xQl3pLpU37hXsAJqd26jl0gA0qqWxYZ74U26WsPywYNzw/M+Nbco23v6a9GSTRG/6R0BqIXz+6uIl+79sGVxg7mzoj87TtWx1NtMIpRy+xlRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr/s6klY681xIAFXU5CsxAqDW/y+BEM+svoBRkTsYrY=;
 b=U2T6pUN4W1Zq+FGaViAsM7zPLK88CmqCpNYkFAWYlEXUfKnTAc4tPj1QeKzo0uhfsTwrEBA+x/Uw2K4TFjuwLiDzRsGGT5e32Oh5UqLmJ60bVrWYVcwDW6yFc1seS8Z+bUQFH7dXrd22R/UeuHBLvCO59BsvJCbIwt7laca0y602MpUINQNnawhhLG+d8H8jrtzM1phcioj6c8djLcsCck0RBa8LRK4oLXZzs2uE9A9nVismr7RH96WU6Ju4LSVv7Vpd7vjy6iYUm4yXUnvFchlgqXp4BTtWW75DB2I2rdSI9knfO44MR4rfQ6iJMlls1nYiwvEQi8eS+alH2/9cXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 BL1PR11MB5510.namprd11.prod.outlook.com (2603:10b6:208:31d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.29; Tue, 7 Nov 2023 12:18:48 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::484a:bab3:b06f:ddf7]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::484a:bab3:b06f:ddf7%6]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 12:18:46 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Sharabi, Ohad (Habana)" <osharabi@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: XE TTM review
Thread-Index: AdoNbMN1ycqf5eJuTEisawSjkIZlEwEB8mEA
Date: Tue, 7 Nov 2023 12:18:46 +0000
Message-ID: <acb9c428c15bf5c27eddf48c42ce9fe7862c6e6b.camel@intel.com>
References: <GV2PR02MB932509E7A09C434B56F70242D4A6A@GV2PR02MB9325.eurprd02.prod.outlook.com>
In-Reply-To: <GV2PR02MB932509E7A09C434B56F70242D4A6A@GV2PR02MB9325.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3114:EE_|BL1PR11MB5510:EE_
x-ms-office365-filtering-correlation-id: a4e3ed98-7641-4d26-3b99-08dbdf8bb0de
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0SwqJhvDARy00xOQeJ36GnrWD4SbJY0bq68HMUyrpgrU2wz/9kBbBaO4c9iHwcDDbH3ZM50TEIF8uDaD6kcIgIJOxpN2K/oceUYshwWyjeXpG3WmuziwKxC++wU3MPhmlD7//sycVNXyvCGwNBjZThY4CrjXVJEjXyk+3/IX6jn62GQbPuiKpAuUWy5/zWHJD7QNruJk5Te3KC5x4j+l9WRffzZ+RFkvL7fmhKRkgtjpsyclqhD9zVsKn/GkFZet8JoU+IiSdCtAAMY185des0GgcjKmxJB+VioqdapQikUjYC3Qz3+jREB0fgZGr7V+ss5GtjUkxUf9VsGZpHeFwJ9jJ32AGwhYKkQExshldFzBm4Pf8fN9W4y9sOyX4o3ahfdzLJQpU14aLxj56N7OLzQK5AdcnHwarzTAFJxoNdcNDRh7bUz6CDuO00XY5QoW4IMmg8jO07ZfJGt2y1EoC8Qdx86j8Sx4aGo+F9URAwQBqUFotGta3psTSUmVih3JANVgGXf3MB8Y5NND5R0wcaPZ0rITk3dpJ+bOhMhi8LqrY5O1/GTrp+9FUW6KguUx5gOlttlN4FXH1oAPnK81qIRil6lVKS6EbEbVqZwAixTWd/T/Mz+HJq/cp7u0mh3X
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6506007)(107886003)(26005)(2616005)(6512007)(38100700002)(71200400001)(38070700009)(83380400001)(86362001)(6486002)(3480700007)(36756003)(478600001)(66476007)(64756008)(66556008)(66446008)(66946007)(41300700001)(91956017)(110136005)(54906003)(76116006)(5660300002)(122000001)(316002)(2906002)(7116003)(82960400001)(8676002)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUNFWHhsNzA4Z1N3clpNUC9vc3JveHBHNS8rZStQNzNBd1loRjFWa3R3cDBm?=
 =?utf-8?B?U0VpU2ZHNGlXR3NHcG81U2s3Tk11d0RPN0dmZG1qL0o4RTB6NnpBWkRMY3RY?=
 =?utf-8?B?T3JhTzN6Qm4wRG1yalhvdmo2N1FaMEE5ZndzQzRGVElvZVlubVpQSVZROVRH?=
 =?utf-8?B?NzREYi9DcVFRN3pPUTVVZ0Q2M2w2S3FtWVJhNURyVVQrMCtBT1lUb1Z3djVz?=
 =?utf-8?B?TDBudUJPYUVmK2FxRlNSSDBFeHZuekV4cURYbUVUYzBBV1MwNUxCNWcxVW1P?=
 =?utf-8?B?K2txNVFNYVBEUmNWUG16ODRrdzZ3cFdFSmdIdTJZYjAveCs1TnF6WTlWeCtt?=
 =?utf-8?B?TzVnMzlISkI1Q1pjTDBZMjVtTUFybHo2UFVSN0ZEOE9NVlJlZisyaUE1eC9S?=
 =?utf-8?B?dWxmSDBGVVhMZkJPMFVUdE9pTmw5VE5iUnRFbk1KUURkQWZmZVhETDYzYStM?=
 =?utf-8?B?THZvbmJnMmRKUUF2bTBKUEhoaHZDQlRQYXdKOEZjZU4rWGhJRDFRVWdLaHAy?=
 =?utf-8?B?WFB2VGZBankzTU1xSkluWGlnZTd3N3U0UGVDM3cwWm8yMUNsOG4yMis1bGtI?=
 =?utf-8?B?NWNlVnk2Q2JhOTNLVyt1eHU2RGpiNWp3OUo1Qk1Ec3ZKWDhRK3dVR1VIVVRv?=
 =?utf-8?B?L25obUpmNWFwUkpVcGtkNmJ1TTlMWXZQaW10bkhLcU9yV1plS2l2dm5uQkRm?=
 =?utf-8?B?WW5VT09Tck13R1BKa21PK05XcmorOWNLMFVPOWNLMDZ1d2JMT0dwanVrVkZ4?=
 =?utf-8?B?YnNESFd0cFhUSktOYVdBeStKN1RWSk5ZVndjVWhiZUVxZkt1Q1ZYMiszd0ZI?=
 =?utf-8?B?THZLRDhyMDJ5dGkvcy9pWG14aUlWaGI3VVpVU1NYZkpyZjB4MkgrYlJrbXY2?=
 =?utf-8?B?ZTZpSTNjTTE5cE93WDFuTjY4WkRma3BLKzFUWlpTZ2NtNkdJdmVoWFdjT1lY?=
 =?utf-8?B?M3VsdDlLZjZVOHhWM2JzdzRuc3VOODR5cHRhc3MzNkhEL1dKOW5VVzdkY3hk?=
 =?utf-8?B?VmMxTXVrZWlFWHBrR2VyalB5OW9CeFR6MzZQWm8xQm9MTk9WeGJSZzRXNzMr?=
 =?utf-8?B?OUh4QXl6Qi9CcjhqVGVsSzEvSEpZdThvT29ad2dGZ0gvWmRVNnkyRlloa0VG?=
 =?utf-8?B?SVN0NytlbEJ5Uk42RWd4LzQrN0dtd1NMWVMxZXd6cUxiRHRDaEt0Q05xRVNV?=
 =?utf-8?B?U3IyT0FJM0YwUUtQazYwVy9iL1dOREpxQW1heDNNYjFuVTh4UmFhTmVjdzFS?=
 =?utf-8?B?a3kvSUlPRnZqL0J4akR5a0txcnBSUXlNUzlDakx1OW9UR1ljaDdiYUoybERI?=
 =?utf-8?B?bTlCdUNhc0lEcU5kcGh0UFN3SzhZUE9xNEdKN1FMNlFaeHFvaEdzV0kvT1I4?=
 =?utf-8?B?aTErVlJtaFc2bnZsTmtTRHl5SU5wNVM5SWs1cXYvWDhNMk4wQURXWjdodzNW?=
 =?utf-8?B?YUhndGRqVXdZS3pmNHVGWHNxOGtVTVpZZnFqOXhGTnA0V2s2SklvZXdtQ2x1?=
 =?utf-8?B?MTVpQkZKUDRoVWREcEY0ak8xSnQvaWFPa2h2SUJ0Zm52YzlWZlgzQVNqbEV4?=
 =?utf-8?B?ZHcvc0FFMUxoQnNPNTdieUVXMWhQV0lOcEZia0RDanVWejVGa3Z6WC9SWklj?=
 =?utf-8?B?SE5jYWNWN0dzRE1SY1JXRFVNRkR1dzBOeW9ldHZCV3lkQzU0MlVPUWR3NFRK?=
 =?utf-8?B?cTM4cXgydGtIZEtOWXdnWVNwQitYMnIrRHJpOGRjbW51d0c0S3NSanZaSFBj?=
 =?utf-8?B?ZlQ2b2VpVmlEUUxtczRXRU9qcWloU3F6bkg0enc0V1BWMUZibk1OOGlRSVIr?=
 =?utf-8?B?aHRBVm4vVy9HSkk3cmtDZjdUUDFTZURkY1Bxa1BFR0NncUpUWUJCNFBmN3Az?=
 =?utf-8?B?L0I2YTFVR0NGOG9sN0ljSUZVTjdpUHh0SzRJeGhzQ0VhanFSZGRjbEl5MndO?=
 =?utf-8?B?M29Oc2RpK3pzdFozRmRmeXJMZjB5MU1RRlErRE12QXZic0xIRzRwcGhPMzNr?=
 =?utf-8?B?RFpiMEZBRm9IVWFwSUYxSVBmeHpNaXRMMTNOL2MxYzQ4bnhkcG9rNTZzR0VO?=
 =?utf-8?B?NlhWUUdpYkZEUVV4ZFk3TU5qMUtxQU5MTGhKeXIxKzQ5RUVvZm9sWFl1R3ls?=
 =?utf-8?B?aUFTRFVxNVg2bkhEb1AwUjQ3TEhUVVZUT3BPVThlWVZvUEZKTWdHcFJNVzFn?=
 =?utf-8?Q?S6AO/FL1hLFxSjysEYua+8M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C49A96390E0901428E8593158D3D9B5B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e3ed98-7641-4d26-3b99-08dbdf8bb0de
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 12:18:46.3802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bkdnGbWijk6ydIrFLDuAdpQfo0GH2qOMVbv3MutCRIKekjQZAyo6tby4kTMh1D72X6J7wXPVYD3rHR86nt7X0rtCZKzm1pKB1Ge/ekXmMog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5510
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] XE TTM review
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Gabbay,
 Oded \(Habana\)" <ogabbay@habana.ai>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SGksIE9oYWQNCg0KT24gVGh1LCAyMDIzLTExLTAyIGF0IDEwOjAxICswMDAwLCBPaGFkIFNoYXJh
Ymkgd3JvdGU6DQo+IEhpLA0KPiDCoA0KPiBJIGRpZCB0aGUgVFRNLXJlbGF0ZWQgcmV2aWV3IGZv
ciB0aGUgdXBzdHJlYW1lZCBYRSBkcml2ZXIuDQo+IEJlbG93IEnigJlsbCBzdW1tYXJpemUgY29t
bWVudHMvcXVlc3Rpb25zIEkgaGFkLCBwbGVhc2Ugbm90ZSB0aGF0IHNvbWUNCj4gY29tbWVudHMg
YXJlIG9uIGNvZGUgbm90IGRpcmVjdGx5IHJlbGF0ZWQgYnV0IHdpdGhpbiB0aGUgc2FtZSBmbG93
IG9mDQo+IFRUTToNCj4gwqANCj4gwqDCoMKgMS4gSW50cnlfYWRkX3N5c3RlbSAob3IgdGhlIG90
aGVyIHZhcmlhbnRzKSwgSSBrbm93IHRoYXQgZm9yIG5vdw0KPiB3ZeKAmXJlIGdvb2QgcmVnYXJk
aW5nIHNwYWNlIGFsbG9jYXRlZCBpbiBwbGFjZXMsIGJ1dCBpc27igJl0IGl0IHdvcnRoIHRvDQo+
IGhhdmluZyBzb21lIGFzc2VydGlvbiBvbmMgKGluIGluZGV4KSB0byBhdm9pZCBvdXQtb2YtYm91
bmQgYWNjZXNzPw0KPiDCoMKgwqAyLiBNYXliZSByZW5hbWV4ZV9ib19nZXRfc2cgLT4geGVfYm9f
c2cgYXMgZ2V0IGltcGxpZWQgcmVmY291bnQ/DQo+IMKgwqDCoDMuIElueGVfYm9fbW92ZSB3ZSBo
YXZlIHRyYWNlX3ByaW50aywgc2hvdWxkbuKAmXQgd2UgYXZvaWQgc3VjaA0KPiBwcmludHMgaW4g
cHJvZHVjdGlvbj8NCj4gwqDCoMKgNC4gSW54ZV9ib19yZXN0b3JlX2tlcm5lbCwgaWYgdGhlIHJl
c3RvcmUgZmFpbHMsIGlzIGl0IE9LIHRvIGxlYXZlDQo+IEJPIGluIHRoZSBwcmVzZW50IGxpc3Q/
IElmIHNvLCBpcyBpdCBiZWNhdXNlIHRoZSByZXN1bWUgZmFpbHVyZSB3aWxsDQo+IGhhbmRsZSBp
dD8NCj4gwqDCoMKgNS4gSW5zdHJ1Y3QgeGVfYm8sIEkgZG9u4oCZdCB0aGluayBwcmVmZXJyZWRf
bWVtX3R5cGUgaXMgYmVpbmcgdXNlZC4NCj4gwqDCoMKgNi4gV2hlbiBpbml0aWFsaXppbmcgWEEg
ZmxhZ3MgdG94ZS0+dXNtLmFzaWRfdG9fdm0gaW4gdGhlIGZ1bmN0aW9uDQo+IHhlX2RldmljZV9j
cmVhdGUgeW91IGFyZSB1c2luZyB0aGVmbGFnIFhBX0ZMQUdTX0FMTE9DMS4gTGF0ZXIgdGhpcyBY
QQ0KPiBpcyB1c2VkIGZvciBjeWNsaWMgYWxsb2NhdGlvbi4gQnV0IHRoZSBEb2Mgc2F5cyB0aGF0
IGZvciBDeWMgYWxsb2MNCj4gb25lIHNob3VsZG7igJl0IHVzZSBBTExPQzEuIEFtIEkgbWlzc2lu
ZyBzb21ldGhpbmc/IElzIGl0IHN0aWxsIE9LIGluDQo+IHRoaXMgY2FzZT8NCj4gwqDCoMKgNy4g
QWxzbywgZm9yIHRoZSBzYW1lIFhBLCBpbiB0aGUgZnVuY3Rpb254ZV92bV9jcmVhdGVfaW9jdGws
IG5vdGUNCj4gdGhhdCwgYWNjb3JkaW5nIHRvIHRoZSBkb2N1bWVudGF0aW9uIHJldHVybiB2YWx1
ZSBvZiAxIGlzbuKAmXQgYQ0KPiBmYWlsdXJlIGJ1dCBtZXJlbHkgYW4gaW5kaWNhdGlvbiBvZiBh
IHdyYXAuIEFyZSB5b3UgcHJvaGliaXRpbmcgd3JhcA0KPiBvbiBwdXJwb3NlPw0KPiDCoMKgwqA4
LiBNaW5vciBvbmU6IGlueGVfZXhlY19pb2N0bCBjYW7igJl0IHdlIHVzZSBudW1fc3luY3MgYXMg
dGhlDQo+IGl0ZXJhdG9yIGluc3RlYWQgb2YgaT8NCj4gwqDCoMKgOS4gTG9va2luZyBhdHhlX3R0
bV92cmFtX21ncl9mcmVlX3NndCBpdCBzZWVtcyB0aGlzIGZ1bmN0aW9uIGhhcw0KPiBubyByZWxh
dGlvbiB3aXRoIFRUTS9tYW5hZ2VyLiBNYXliZSBpdCBiZWxvbmdzIGluIGFub3RoZXIgcGxhY2U/
DQo+IMKgwqAxMC4gSW54ZV92bV9jcmVhdGUsIHdoZW4gc2hpZnRpbmcgeGUtPmluZm8udmFfYml0
cywgd291bGRu4oCZdCBpdCBiZQ0KPiBiZXR0ZXIgdG8gdXNlQklUX1VMTD8gDQo+IMKgwqAxMS4g
SW54ZV92bWFfb3BfZXhlY3V0ZSwgbWF5YmUgZ2V0IHRoZSBWTUEgaW4gZWFjaCBjYXNlIGFuZCBj
YWxsDQo+IG9uY2UgdG8gX194ZV92bWFfb3BfZXhlY3V0ZT8NCj4gwqDCoDEyLiBJbnN0cnVjdCB4
ZV92bSwgbWF5YmUgYWRkIGRvYyB0byB0aGUgZmxhZ3MgKFhFX1ZNX0ZMQUdfNjRLIGV0Lg0KPiBh
bCk/DQo+IMKgwqAxMy4gU2lkZSBub3RlOiBJIGtub3cgdGhhdCBpdCBtYXkgbm90IGJlIHRoZSBz
Y29wZSBvZiB0aGUgcmV2aWV3LA0KPiBidXQgSSBjb3VsZG7igJl0IGlnbm9yZSB0aGUgZmFjdCB0
aGF0IHRoZSBYRSBjb2RlIGlzIHVzaW5nIGEgbG90IG9mDQo+IGludmVydGVkIGxvZ2ljIChlLmcu
LCBpZiAoIWNvbmQp4oCmIGVsc2UpLiANCj4gwqANCj4gUmVnYXJkcywNCj4gT2hhZA0KDQpJJ2xs
IHRha2UgYSBsb29rIGF0IHRoZXNlIGFuZCBnZXQgYmFjay4NCg0KL1Rob21hcw0KDQoNCg==
