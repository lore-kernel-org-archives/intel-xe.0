Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D6AC77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 06:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ABA10E1E3;
	Tue,  9 May 2023 06:28:14 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176AD10E1E3
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 06:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683613692; x=1715149692;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2PBGG38QZd6H3/yDU8gi0WqQKe16RrBsyHNp7pAK+Fk=;
 b=LGl5gWXGr/JMd/EC7IonRRFKCMd7kDnlvhGuNR79hLlBUoyvOqUJ+fym
 Oi5rrzz0MHfg2AV9gZfrFsb+iCX+xB2ogHJlC8+CKQuabtLBNlQztTbOc
 n7x4F0qkZpgI+IcvkHbktkhIM3i5X5dbJOKYb8a8ZDirq/OfBxTzTN/U5
 Q0dFXbws3ojB9tY6CIxepJR2U8ymTxtpedAwMDZTalqh0Pt1TLXYtj9rt
 w+jpwUx+whrhUKDMBw/zPjBxb5THvAlf1r8CnjaeVg7Xo5/s/X24Novqk
 VHhM48BtrBqv46vSlFU/4wo8I2JV+ezTo22eDCEn1CJHhDZAAORKpekDU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348650217"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="348650217"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 23:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729351730"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="729351730"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 08 May 2023 23:28:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 23:28:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 23:28:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 23:28:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 23:28:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9OlGT5OAsDQ0HayCfrfEo8NchozOqAjjtVHOOXpsSuTgnPZSKtdl463ppkTd2N+ja48efRzVqVDSgApW/9zrLARTbqQoAtAiY8VwhEVyyrH3ox56tAATaJBdenTKGor9by8Jhw+JZyeEHqLj7/uCKMAuKfxAFALHTKztnxjwSeoy7Dk9aVPblFl0oqaRa/73kqV2Z6xg2tllKKVbSqLDshbKq7p8aYqyTf3r4ehBBkm6bocPUplGR380WfgEW4eLj+TCOrFMGtxiHKCv/jpapD7xS4BVt6pIXJLs2sKjv/pDCgcUz390qazk9t3Rebi1i0fqIWxgoh/QCwn7Twmkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PBGG38QZd6H3/yDU8gi0WqQKe16RrBsyHNp7pAK+Fk=;
 b=Dm69YX0DGDDIuAo2JS+MqRMlM0RUH/VgHS/unzLoS96Pyyt+5aTEsVMcGu9DqLg3UiLlI3rvs46AkaFK7tqGW6vlNa5wqEuQWbZUYJpyBZLWC2KO38ArW/PkLVsT03HSjo60uKplibXY++A0Ig0VsvsKI1XioRZsBM4unlNcozokmpTYX+gxyCEkWBToA+DNja25Hp6K3mWfQMlQxl9zmWzHW6YaHEZl7ie/T1XTVb6Z7OwlgANNw8QBJ/efVzTWyck4YppQZxhzM4UrsI6IAuqf7MfikLGfNW2vnFJvfOWWh7Q6bka1Jx3rac5Jq4Vew2T7uZ5dqJTlGuwbaSM4NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB6791.namprd11.prod.outlook.com (2603:10b6:a03:484::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:28:08 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 06:28:08 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [RFC 1/1] drm/xe: Notify Userspace when engine/gt reset fails.
Thread-Index: AQHZgbNK9DFEPclFb025DU/5Y3RVxq9RZhUAgAAUq2A=
Date: Tue, 9 May 2023 06:28:07 +0000
Message-ID: <MW4PR11MB705692159947D102BB4E3F0BB3769@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230508134823.585186-1-himal.prasad.ghimiray@intel.com>
 <22d0494f-0db8-01b2-7611-8d43b2d79e2b@intel.com>
In-Reply-To: <22d0494f-0db8-01b2-7611-8d43b2d79e2b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SJ0PR11MB6791:EE_
x-ms-office365-filtering-correlation-id: 822ea5bb-6215-4304-8904-08db50568dc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LcAyXThhNx7ZUhUBPBfbtfPq2cK+o4JOVkE2SRhZqsGrYToP/43b6cdJ99dxVcZQ2B73hWuTt0DCT1jrFbj7wX9KvbN4wfvUckYz8mwckUlT6hTfHvMYQnanSo50+si5po2/B8+VwLH6iV6J61wGFcv64HxEuIB+1uix30FRL91zNCOWblTlQpuN+DYfzT2OHrmD5NSIjnheQLlTMnkHiHe0rRmVbfX3gV86Mwysqj4hU+exJFfqofwIOu+1FnqwrYKwlu7ruwLyQcTxojmZO5rq7KssZcg6BM2zy5p6q7eP5wIyNBSwnc0aTH34eTrBvoXUbggXX0/zyUPpD9vcfRtPOn8/nJ51CIIczbrz6TVqkfPy1oKcdyaw0IF/cWMZB5j75QKr6EQu35fBgX6HWLl31VHZfoHoQn/Rph1AMwp4axcWJ6vrefBlHl7DYr6RC1MWQDHBnZ59pD2/LH+7ezliUaDgl8gTnznlnSbV0Eot3deGcaasep6F86ExBTkwrdJOQSMQnxFCZbpV2bJgp/chKMqba1KdWKiXJ9nLIGfo2CH1fqE2gtUUOlIc22ph
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(38070700005)(6636002)(52536014)(316002)(5660300002)(41300700001)(38100700002)(82960400001)(66446008)(64756008)(86362001)(122000001)(71200400001)(53546011)(9686003)(66476007)(66556008)(66946007)(110136005)(6506007)(2906002)(76116006)(8936002)(8676002)(33656002)(186003)(7696005)(478600001)(966005)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzRCbi9CbGo1QTBwRFhoOUFOWlpGSkRPV3B5ZVVGaldYUkl3ZzFqeTJxQ3E3?=
 =?utf-8?B?NWViclA2OERVQy9HRUVQbC9tV2NEWllIUEttbFFTVU1FcTBqMGtTVis3MTYv?=
 =?utf-8?B?cUlGRndyeGVhUmMzVDY5YURYMk0wTWRxaW1vNmFvYmx5cUVpK1VQUkFPWXJT?=
 =?utf-8?B?aExOYWxsb1JiQjhZYU9RQ1doK2ZyYWViazRJTUFXNjQ3c0hCQVg0eXMwRlla?=
 =?utf-8?B?bkhwamdzNWdvU2RBQmxQcDB5eEQ3NGdIZFZFb2xlTkQrUDM0L09nMUgzTUQw?=
 =?utf-8?B?aXVHMjFLYWxJSXh6cytEb3FwODRGcWZyazR0NlRyNzRxMlo1cVlEYUIrZUhY?=
 =?utf-8?B?S0g5MWZ3dU1vWGFhQWVmSjNLTk9STUozczQra21yZWU0V0RwUlJvT3djUmZu?=
 =?utf-8?B?Qm9oTllybGdacGtBaDYwc0xsUjVXQjVtZVN3UEZHdWdKWkpIcTN4U1d1dWd3?=
 =?utf-8?B?UU50b3BKSWVFUzlMVWZNY09QUE5XdndLV05JSk5KOEZoVTUxdHVtY1pqWThj?=
 =?utf-8?B?RFVreFZldDFwN1FNbmFMcnowcE1oUXNJVWlocHQ5cHBYQXJ3WGRRVVJBL0tX?=
 =?utf-8?B?d2xkVXYvYk9Zb1drWUlITExNQndlWDNFMGpGTGw4V2pvOVhqekluMmRLUEN5?=
 =?utf-8?B?bW51aUt3ZlhwQWI5UGVPZU11dGdxd2lhb0tseTZFaEg1Tnh0ZTVwd1dpcFE2?=
 =?utf-8?B?bTFtVnNsb1JzbXp2UzZiQkpMU0hvL0RRVjFndFY4QUlLN1BKUFhGYndHT3JX?=
 =?utf-8?B?L01iL0srVThmc2ZCTmpKOGhaR1pBaWhqMkRwR2xRVUpVR3JFUGdvcHIyZVUw?=
 =?utf-8?B?WHFtQ1hzUzkxNExWUklRVVNYRkU5eHFCWHVhS1lkNytOaFNhT2h4aDNBQ1pM?=
 =?utf-8?B?ZFZPUEo1MzN0TGlSYUFJeFRHL3VKWHZsWXE2SG1UaUl4bWh1YkkzWTIzN2dy?=
 =?utf-8?B?RFh6NkFQNmxKWFNadWJGSzJOTlR3WEx0NlczQnZzSFVnUWlJT2dBY0lPbGFa?=
 =?utf-8?B?c25rM3o1ZlRKamxPTXU4a3NYVzdOUEZDVFFpV1YrSUs3a2thN3VqZkx5cUE0?=
 =?utf-8?B?dFVkQUE3UUhTMDgvcHpJL0Y5Yzg1aFBnOWdqWmJWR05CWElrUkFyZi8rUWhL?=
 =?utf-8?B?Z1ROSXp4NmRwS3pxM0dMdWZSbWZ6c2VCODBvMDZvV1o0K3Z0cXBGam1zRSta?=
 =?utf-8?B?aFFpRHZ5QVorSm5SMXJsS21ZRGNNQXhpNHdFWUNmbW41cnRoc01IVFRWdzBu?=
 =?utf-8?B?cWpGdXFYWDVQWlllbXJjQUN4Y3JoNVozcyt4b2tmcUFBUHkxdVZxSHBnbFdI?=
 =?utf-8?B?T3JEclBsL20zNXJYQ1ZzbXNIdUdicDlHRGhuMmVFM2lvSEtxejEyN252L1l2?=
 =?utf-8?B?cktsUis4TVp3Rno0d2NVT1BJNlo0aGlXZnJRMzhEalhzN3czWXlEMXE1S01Z?=
 =?utf-8?B?eCtnb044azhGWW1YMHNYSlMveU4vS3dFWWVoT3IrU0s5WjRISmJ3Tzl3QlhY?=
 =?utf-8?B?eHp4T09pNG93ZnBZdmVtS2JLTG1QVGRiNEM5RHZreXV1dTN6UTJBK3lFK1ll?=
 =?utf-8?B?T0RzRkVjdkRFbmRBR0k4NXFLSGlXb0lyZU53UThaU05GdVpXN0V6eGo4NWZY?=
 =?utf-8?B?WktJRzBWNjJyZ3JIb3ZoSlhRcGluR3M2MWJ6OXNMcWNlL1FHczIvelQ2MkVI?=
 =?utf-8?B?T3ZSc0NPRFU4a01heVFKVlBVaHBIZytYaFNrSVM1Sm1TZEN6SFNTRUE0cHkx?=
 =?utf-8?B?TTlzOUdXYUtjQ0xVZ25NMTdxam5pNi9oeVRuemVWMVVOQ1NaOWdKNTZ5ZUdC?=
 =?utf-8?B?c1dsZEdDWG5uZjB4MWtidkdZTm9lRkdhS3FPcHJEcXlhcDZ5SXExQ1BlWU1r?=
 =?utf-8?B?M3N5bEdhZlJ3QkdsTE5aZ3FvaUpuMmdJRTNJMS81aFFCN3VLcXpyWDVYekFF?=
 =?utf-8?B?djlTY3JjVENDOFVXZG03aHJOU3JLUlRwaUtVTys1K2h2VzA5WkszOCtIVTB3?=
 =?utf-8?B?ejRsU0Q2VW1UZUNyQ2tXQjhmRmFxU2Y0MHNYbVdmRmUvNVNNaWtBa1E1MEVp?=
 =?utf-8?B?bzFtUzF3b3EwbmJQRjNxM2RoTFhiOUh3YlRCYkFmZW14ZHRXb0dtd2U2OEdR?=
 =?utf-8?Q?5HzuFG9k7Z1ktbYBfDpyZAmLb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822ea5bb-6215-4304-8904-08db50568dc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 06:28:07.8307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pR5NgXk72kBgk8QeUl9kUw7PGXPy0eWzttWSYELxXv6H5OrGaAN4cQyRhfGQrAxbOIeMJU/nwZULbMjN2zOWQZ/QdBUPV68w187plHTVMrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6791
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 1/1] drm/xe: Notify Userspace when engine/gt
 reset fails.
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWRkYW1zZXR0eSwgQXJh
dmluZCA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNvbT4NCj4gU2VudDogMDkgTWF5IDIwMjMg
MTA6NDINCj4gVG86IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQgPGhpbWFsLnByYXNhZC5naGltaXJh
eUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBWaXZpLCBS
b2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1JGQyAxLzFd
IGRybS94ZTogTm90aWZ5IFVzZXJzcGFjZSB3aGVuIGVuZ2luZS9ndCByZXNldCBmYWlscy4NCj4g
DQo+IA0KPiANCj4gT24gMDgtMDUtMjAyMyAxOToxOCwgSGltYWwgUHJhc2FkIEdoaW1pcmF5IHdy
b3RlOg0KPiA+IFNlbmQgdWV2ZW50IGluIGNhc2Ugb2YgZW5naW5lIHJlc2V0IG9yIGd0IHJlc2V0
IGZhaWx1cmUuDQo+ID4gTDAgc3lzbWFuIHdvdWxkIGxpa2UgdG8gZ2VuZXJhdGUgZGV2aWNlIHJl
c2V0IG5lZWRlZCBldmVudCB3aGVuIGd0DQo+ID4gcmVzZXQgZmFpbHMNCj4gPiBodHRwczovL29u
ZS1hcGkuZ2l0bGFiLXBhZ2VzLmRldnRvb2xzLmludGVsLmNvbS9sZXZlbF96ZXJvL3N5c21hbi9h
cGkuDQo+ID4gaHRtbCNfQ1BQdjQ0MVpFU19FVkVOVF9UWVBFX0ZMQUdfREVWSUNFX1JFU0VUX1JF
UVVJUkVEDQo+IFRoaXMgY291bGQgcmF0aGVyIGJlIGFuIGludGltYXRpb24gdG8gdXNlcnBhY2Ug
bW9uaXRvcmluZyB0b29sIHRvIGRvIHRoZQ0KPiBkZXZpY2UgbGV2ZWwgcmVzZXQvcmVib290IHdo
ZW4gR1QgcmVzZXQgZmFpbHMuIHVkZXZhZG0gY2FuIGJlIHVzZWQgdG8NCj4gbW9uaXRvciB0aGUg
dWV2ZW50cy4NCkhtbS4gTWFrZXMgc2Vuc2UuIA0KPiANCj4gQHJvZHJpZ28sIHlvdXIgdGhvdWdo
dHM/DQo+IA0KPiANCj4gPg0KPiA+IENjOiBBcmF2aW5kIElkZGFtc2V0dHkgPGFyYXZpbmQuaWRk
YW1zZXR0eUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGltYWwgUHJhc2FkIEdoaW1p
cmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyAgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysrDQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuaCAgICAgICAgfCAxOCArKysrKysrKysrKysr
KysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyB8IDIzICsrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgICAg
ICAgfCAgOCArKysrKysrKw0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gaW5kZXggM2FmY2EzZGQ5NjU3Li4yYzNmZmExZGI3
NGUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+IEBAIC04LDYgKzgsNyBAQA0KPiA+ICAj
aW5jbHVkZSA8bGludXgvbWlubWF4Lmg+DQo+ID4NCj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fbWFu
YWdlZC5oPg0KPiA+ICsjaW5jbHVkZSA8ZHJtL3hlX2RybS5oPg0KPiA+DQo+ID4gICNpbmNsdWRl
ICJyZWdzL3hlX2d0X3JlZ3MuaCINCj4gPiAgI2luY2x1ZGUgInhlX2JiLmgiDQo+ID4gQEAgLTU5
MCw2ICs1OTEsMjAgQEAgc3RhdGljIGludCBkb19ndF9yZXN0YXJ0KHN0cnVjdCB4ZV9ndCAqZ3Qp
DQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIHhlX3VldmVu
dF9ndF9yZXNldF9mYWlsdXJlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1OCBpZCkgew0KPiA+ICsJ
Y2hhciAqcmVzZXRfZXZlbnRbNV07DQo+ID4gKw0KPiA+ICsJcmVzZXRfZXZlbnRbMF0gPSBYRV9S
RVNFVF9GQUlMRURfVUVWRU5UICI9MSI7DQo+ID4gKwlyZXNldF9ldmVudFsxXSA9ICJSRVNFVF9F
TkFCTEVEPTEiOw0KPiA+ICsJcmVzZXRfZXZlbnRbMl0gPSAiUkVTRVRfVU5JVD1ndCI7DQo+ID4g
KwlyZXNldF9ldmVudFszXSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiUkVTRVRfSUQ9JWQiLCBp
ZCk7DQo+ID4gKwlyZXNldF9ldmVudFs0XSA9IE5VTEw7DQo+ID4gKwlrb2JqZWN0X3VldmVudF9l
bnYoJnhlLT5kcm0ucHJpbWFyeS0+a2Rldi0+a29iaiwNCj4gS09CSl9DSEFOR0UsDQo+ID4gK3Jl
c2V0X2V2ZW50KTsNCj4gPiArDQo+ID4gKwlrZnJlZShyZXNldF9ldmVudFszXSk7DQo+ID4gK30N
Cj4gPiArDQo+ID4gIHN0YXRpYyBpbnQgZ3RfcmVzZXQoc3RydWN0IHhlX2d0ICpndCkgIHsNCj4g
PiAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3QpOyBAQCAtNjM5LDYgKzY1NCw5
IEBAIHN0YXRpYyBpbnQNCj4gPiBndF9yZXNldChzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+ICAJeGVf
ZGV2aWNlX21lbV9hY2Nlc3NfcHV0KGd0X3RvX3hlKGd0KSk7DQo+ID4gIAlkcm1fZXJyKCZ4ZS0+
ZHJtLCAiR1QgcmVzZXQgZmFpbGVkLCBlcnI9JWRcbiIsIGVycik7DQo+ID4NCj4gPiArCS8qIE5v
dGlmeSB1c2Vyc3BhY2UgYWJvdXQgZ3QgcmVzZXQgZmFpbHVyZSAqLw0KPiA+ICsJeGVfdWV2ZW50
X2d0X3Jlc2V0X2ZhaWx1cmUoeGUsIGd0LT5pbmZvLmlkKTsNCj4gPiArDQo+ID4gIAlyZXR1cm4g
ZXJyOw0KPiA+ICB9DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Yy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5oDQo+ID4gaW5kZXggNzRhNzQwNTFm
MzU0Li44NDVjNTdiOTU1NjIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Yy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5oDQo+ID4gQEAgLTU2
LDQgKzU2LDIyIEBAIHN0YXRpYyBpbmxpbmUgdTE2IHhlX2VuZ2luZV9jbGFzc190b19ndWNfY2xh
c3MoZW51bQ0KPiB4ZV9lbmdpbmVfY2xhc3MgY2xhc3MpDQo+ID4gIAl9DQo+ID4gIH0NCj4gPg0K
PiA+ICtzdGF0aWMgaW5saW5lIHUxNiB4ZV9ndWNfY2xhc3NfdG9fZW5naW5lX2NsYXNzKHU4IGd1
Y19jbGFzcykgew0KPiA+ICsJc3dpdGNoIChndWNfY2xhc3MpIHsNCj4gPiArCWNhc2UgR1VDX1JF
TkRFUl9DTEFTUzoNCj4gPiArCQlyZXR1cm4gWEVfRU5HSU5FX0NMQVNTX1JFTkRFUjsNCj4gPiAr
CWNhc2UgR1VDX1ZJREVPX0NMQVNTOg0KPiA+ICsJCXJldHVybiBYRV9FTkdJTkVfQ0xBU1NfVklE
RU9fREVDT0RFOw0KPiA+ICsJY2FzZSBHVUNfVklERU9FTkhBTkNFX0NMQVNTOg0KPiA+ICsJCXJl
dHVybiBYRV9FTkdJTkVfQ0xBU1NfVklERU9fRU5IQU5DRTsNCj4gPiArCWNhc2UgR1VDX0JMSVRU
RVJfQ0xBU1M6DQo+ID4gKwkJcmV0dXJuIFhFX0VOR0lORV9DTEFTU19DT1BZOw0KPiA+ICsJY2Fz
ZSBHVUNfQ09NUFVURV9DTEFTUzoNCj4gPiArCQlyZXR1cm4gWEVfRU5HSU5FX0NMQVNTX0NPTVBV
VEU7DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICsJCVhFX1dBUk5fT04oZ3VjX2NsYXNzKTsNCj4gPiAr
CQlyZXR1cm4gLTE7DQo+ID4gKwl9DQo+ID4gK30NCj4gPiAgI2VuZGlmDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiBpbmRleCBlODU3MDEzMDcwYjkuLjY2MzkwODU3
M2Q1YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+IEBAIC0x
Miw2ICsxMiw3IEBADQo+ID4gICNpbmNsdWRlIDxsaW51eC9kbWEtZmVuY2UtYXJyYXkuaD4NCj4g
Pg0KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+DQo+ID4gKyNpbmNsdWRlIDxkcm0v
eGVfZHJtLmg+DQo+ID4NCj4gPiAgI2luY2x1ZGUgInJlZ3MveGVfbHJjX2xheW91dC5oIg0KPiA+
ICAjaW5jbHVkZSAieGVfZGV2aWNlLmgiDQo+ID4gQEAgLTE1ODksOSArMTU5MCwyNSBAQCBpbnQN
Cj4geGVfZ3VjX2VuZ2luZV9tZW1vcnlfY2F0X2Vycm9yX2hhbmRsZXIoc3RydWN0IHhlX2d1YyAq
Z3VjLCB1MzIgKm1zZywNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGlj
IHZvaWQgeGVfdWV2ZW50X2VuZ2luZV9yZXNldF9mYWlsdXJlKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
LA0KPiA+ICtjb25zdCBjaGFyICpuYW1lKSB7DQo+ID4gKwljaGFyICpyZXNldF9ldmVudFs1XTsN
Cj4gPiArDQo+ID4gKwlyZXNldF9ldmVudFswXSA9IFhFX1JFU0VUX0ZBSUxFRF9VRVZFTlQgIj0x
IjsNCj4gPiArCXJlc2V0X2V2ZW50WzFdID0gIlJFU0VUX0VOQUJMRUQ9MSI7DQo+ID4gKwlyZXNl
dF9ldmVudFsyXSA9ICJSRVNFVF9VTklUPWVuZ2luZSI7DQo+ID4gKwlyZXNldF9ldmVudFszXSA9
IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiUkVTRVRfSUQ9JXMiLCBuYW1lKTsNCj4gPiArCXJlc2V0
X2V2ZW50WzRdID0gTlVMTDsNCj4gPiArCWtvYmplY3RfdWV2ZW50X2VudigmeGUtPmRybS5wcmlt
YXJ5LT5rZGV2LT5rb2JqLA0KPiBLT0JKX0NIQU5HRSwNCj4gPiArcmVzZXRfZXZlbnQpOw0KPiA+
ICsNCj4gPiArCWtmcmVlKHJlc2V0X2V2ZW50WzNdKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgaW50
IHhlX2d1Y19lbmdpbmVfcmVzZXRfZmFpbHVyZV9oYW5kbGVyKHN0cnVjdCB4ZV9ndWMgKmd1Yywg
dTMyICptc2csDQo+ID4gdTMyIGxlbikgIHsNCj4gPiAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0g
Z3VjX3RvX3hlKGd1Yyk7DQo+ID4gKwlzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2U7DQo+ID4gKwl1
MTYgZW5naW5lX2NsYXNzOw0KPiA+ICAJdTggZ3VjX2NsYXNzLCBpbnN0YW5jZTsNCj4gPiAgCXUz
MiByZWFzb247DQo+ID4NCj4gPiBAQCAtMTYwOCw2ICsxNjI1LDEyIEBAIGludCB4ZV9ndWNfZW5n
aW5lX3Jlc2V0X2ZhaWx1cmVfaGFuZGxlcihzdHJ1Y3QNCj4geGVfZ3VjICpndWMsIHUzMiAqbXNn
LCB1MzIgbGVuKQ0KPiA+ICAJZHJtX2VycigmeGUtPmRybSwgIkd1QyBlbmdpbmUgcmVzZXQgcmVx
dWVzdCBmYWlsZWQgb24gJWQ6JWQNCj4gYmVjYXVzZSAweCUwOFgiLA0KPiA+ICAJCWd1Y19jbGFz
cywgaW5zdGFuY2UsIHJlYXNvbik7DQo+ID4NCj4gPiArCWVuZ2luZV9jbGFzcyA9IHhlX2d1Y19j
bGFzc190b19lbmdpbmVfY2xhc3MoZ3VjX2NsYXNzKTsNCj4gPiArCWh3ZSA9IHhlX2d0X2h3X2Vu
Z2luZShndWNfdG9fZ3QoZ3VjKSwgZW5naW5lX2NsYXNzLCBpbnN0YW5jZSwNCj4gPiArZmFsc2Up
Ow0KPiANCj4gdGhpcyBjYW4gcmV0dXJuIE5VTEwsIHNvIGEgY2hlY2sgaXMgbmVlZGVkIGhlcmUu
DQpXaWxsIGFkZHJlc3MgaW4gbmV4dCBwYXRjaC4NCj4gDQo+IFRoYW5rcywNCj4gQXJhdmluZC4N
Cj4gPiArDQo+ID4gKwkvKiBOb3RpZnkgdXNlcnNwYWNlIGFib3V0IGVuZ2luZSByZXNldCBmYWls
dXJlICovDQo+ID4gKwl4ZV91ZXZlbnRfZW5naW5lX3Jlc2V0X2ZhaWx1cmUoeGUsIGh3ZS0+bmFt
ZSk7DQo+ID4gKw0KPiA+ICAJeGVfZ3RfcmVzZXRfYXN5bmMoZ3VjX3RvX2d0KGd1YykpOw0KPiA+
DQo+ID4gIAlyZXR1cm4gMDsNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9k
cm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiBpbmRleCBiMGI4MGFhZTNlZTgu
Ljc5ZWY1OTQ3YzE3MiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5o
DQo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+IEBAIC0zNiw2ICszNiwx
NCBAQCBleHRlcm4gIkMiIHsNCj4gPiAgICogc3ViamVjdCB0byBiYWNrd2FyZHMtY29tcGF0aWJp
bGl0eSBjb25zdHJhaW50cy4NCj4gPiAgICovDQo+ID4NCj4gPiArLyoNCj4gPiArICogVWV2ZW50
cyBnZW5lcmF0ZWQgYnkgeGUgb24gaXQncyBkZXZpY2Ugbm9kZS4NCj4gPiArICoNCj4gPiArICog
WEVfUkVTRVRfRkFJTEVEX1VFVkVOVCAtIEV2ZW50IGlzIGdlbmVyYXRlZCB3aGVuIGF0dGVtcHQg
dG8gcmVzZXQNCj4gZW5naW5lDQo+ID4gKyAqCW9yIGd0IGZhaWxzLiBUaGUgdmFsdWUgc3VwcGxp
ZWQgd2l0aCB0aGUgZXZlbnQgaXMgYWx3YXlzIDEuDQo+ID4gKyAqLw0KPiA+ICsjZGVmaW5lIFhF
X1JFU0VUX0ZBSUxFRF9VRVZFTlQgIlJFU0VUX0ZBSUxFRCINCj4gPiArDQo+ID4gIC8qKg0KPiA+
ICAgKiBzdHJ1Y3QgeGVfdXNlcl9leHRlbnNpb24gLSBCYXNlIGNsYXNzIGZvciBkZWZpbmluZyBh
IGNoYWluIG9mIGV4dGVuc2lvbnMNCj4gPiAgICoNCg==
