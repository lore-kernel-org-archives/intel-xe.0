Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0140C7EE29
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784F410E11C;
	Tue,  6 Jun 2023 12:35:15 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC23D10E232
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686054913; x=1717590913;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rQ+R19hZdL7GrvOl9bB2kcpzjJjrEa15g+yX5im11vo=;
 b=W5tVWsCCqcQn+VxwCF5FwB1q4RfDn2J4IA/6KRsOqs4eI6aJwyANCWKz
 uGNkXHmQYG8C0p9MSLIesTzxLTxunqng1enrh74hrofLStiv0mIipm+Iq
 tEcFaTve8HqiB3KgU3bZ6XJ7BwHsWu7wu5ZVKDwoEkNL826d+tHqeQiCM
 pEE2iQfW4lHdz7BueIQ8yIasTsUCfkeme7pIpTX/EFqhyz+ng3c/pDzhg
 zKxsHm0lsGoEv1x7gYELb6lgCxENMqy2Fxv7ZPccqHPEfzAWZl5bMIW1/
 KH6WK+07CFckTfTQBJx/0aobgd9ITrtTUlZn4TCZHtI/ioc5HfoAS0v2z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336282710"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="336282710"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="659508036"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="659508036"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 06 Jun 2023 05:35:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 05:35:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 05:35:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 05:35:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJd+2wfRSTiJ2OuKK9ZhBf7+4IpwjBPsZxzY77SYGwYwH44TA1QuylBBBJ5sQb0e6i+g7mPFqeSxsIDvhDJYJ95oo6lUK+K4iROiyVoumRohL9MaSPGnzTjJgz4gXP4WFPNtazjttcXEO1BVjgsKopkF0PuX1URYmmL2HBprea3AGnntbuhiuQOWJ6lo0/X2cqYDea5KJJq++7GGOOhGWnybB5cetlfMhebyHcsnk4KMp+eAxyJrOvZohPLnWzX2vxAxSQ9BMa6fuKuWShtRUTN1G9qrlcM2v8ZmpXzPhiPFZCwNjvnDD7LMctXd1FK07DyrYB3Vo8IhmojBPlx2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQ+R19hZdL7GrvOl9bB2kcpzjJjrEa15g+yX5im11vo=;
 b=QQQJG7VJpDu9U102FxdrSMXBGinJZG1EsS/RcYHaGMGMwA2Lb7NKk6huFAdXlgIhdp6eTsKiBqgdVFy5AVE/SeGLw2I1/VuMXvkt6Br8MrYiNqxlY9q3KShkXu6ExKUFbprEkKsbZfzuSlQExfhCjO9X3B7LcVHFPI8Ic7wCVyuPnthBdqYqXEpYvXuCkHzMhCuKsC2KLRNRMRyu5hevTcDM9X1U7uOixSis6cHKW30kL/1tRT2ch6Ddx/2MgyH/SbV9+l0X0iczS7ZbqrYgRZeWLI2K5sQg4CrkDMj95FAjsNptsHu3ip4ag9XDASLfR27Pb52z88stfA3MQa3tGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB6018.namprd11.prod.outlook.com (2603:10b6:8:5e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 12:35:01 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 12:35:01 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/3] drm/xe: Add sysfs entry per tile
Thread-Index: AQHZmGcTOwlVWeacokSDj67i8CGR+699tFIAgAABLfA=
Date: Tue, 6 Jun 2023 12:35:01 +0000
Message-ID: <SJ1PR11MB6204C449EC6B8B49C70550D18152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-2-tejas.upadhyay@intel.com>
 <24b8fde2-7e34-5103-af5f-9600be348a66@intel.com>
In-Reply-To: <24b8fde2-7e34-5103-af5f-9600be348a66@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB6018:EE_
x-ms-office365-filtering-correlation-id: c01c3c61-15a4-44e5-a24c-08db668a723d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IYbIR/+NpgrY2OztJtHkQ+3KpxBkGb3COGcr2iDKbXOZRlWusKrK1B2BUf/92CnFrKTHcWkIfmRU7VC9tkUbFUSFijkkwHPrbRNLe907dPRuBC7ESsH8PPz3ZNv7ku4RJ9XAgc2ZZjlncaaY71PmK7SiiE4qlngGeQztv7tUef6nv/5bxCcQxXxIrz0NHW1Q31shig6f/aX7Q8BAlloy16UD9Qs5d378/nAC00sdgSARD9J72KCCSAo3ucnjHUpKc/EGet8887fmW0wW7UrX6aIIa8AhMrN93yhuG51mDOrhaZFA3V3zL8+kS6aPtT4R0jQLiBRZJF9DxWOqmU2uQMdR3+AgLKBryIpFsn766VRgtpb0ByEAAjj3rn+jLifsaAsPWI3+n6rJLaYSrx3lKFf4nCmi6sc75J4ibdtkNE1USXBof58OgrvM61/0qu1sJGxz8RZ17yTEZQoXlrukDUHpCM1eWcrNEHP7IcLdAWbf+sLkJJhbc4aEThmy6KkdcNMar+jbDRLkPGjz0L7V2PBIH0eTykgJNmIYTtezw+VS4OSBuzGk5nhrqq0DNcVSA6oKYcLhQQ9Ohm2O3ew7dMOnC6duBYjZ2BACYVOw6mcQd/vSNZ4V8jcRHJFEZQ3X
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199021)(2906002)(83380400001)(38070700005)(33656002)(86362001)(82960400001)(38100700002)(122000001)(55016003)(7696005)(41300700001)(52536014)(316002)(5660300002)(8936002)(8676002)(110136005)(478600001)(66556008)(64756008)(66446008)(71200400001)(66946007)(76116006)(66476007)(9686003)(66899021)(53546011)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckdNWFRkQ1ZZVzJRdUlVcEdvZ2hoYlN5U3NvYk95aEFWWTArLzhia3NjWFI5?=
 =?utf-8?B?dXRtMHZEcUlnYkRBbmw4TjNoejFJc0lCVU9kUEd2dFcyQk1lUmxueTE4N2FD?=
 =?utf-8?B?TUdZRE9HOEd3OVJFb1NwUnpMZDBiQ3VSQXhld3pMMUltbmpMalRONE1YZjV6?=
 =?utf-8?B?bUFlVU0vcGtpZWxmZEhiN2JvRTJ2U2t6TnhOaHg0aFVOU3lFV0s5MU9jTHZN?=
 =?utf-8?B?TXRYZzNPdkgvYjE1cjRuSUwyTVFVK0hqekNyUmZKeE9TQTgxbnRzT3M2QVlT?=
 =?utf-8?B?eTRQTWs4c3VDQndaSWpkVWxaTmc0b0FkRUpHUk13WHdOL0kxSXdxci84K0Jq?=
 =?utf-8?B?amp1a2lGKzF6dDh1R2ZJSzBFQW9HaTBUTEdwZEtPKzRMNStIZndtTFNjUUEx?=
 =?utf-8?B?M0JjVnk1ZzM0eld2MjVnY09USHZNRHgrcTZ5ZjRMQ0tPQy92UzJzYVQrbVR4?=
 =?utf-8?B?SFNMek91dUpTQUh5U05oN3l4aURpZFJXTEsrSjFLTmw0VmFoUjFYbzdUVXZQ?=
 =?utf-8?B?TlE1aHViSWVwcnlFVlRCUG9sdWprWG1TVDNpY1Z5WlFQNXp1RStHZ0VRR2hG?=
 =?utf-8?B?MXc4Mm1XdDZxYnk4ZUlpZWFJRmU5RnNFWGJOWU9yZUo5TEpLY05IclFhajZl?=
 =?utf-8?B?elBYa2R0N1VYMzQ5Sis2YmZUbllMeU5WOUp3enBhOWJVdDFqMnlpYXdHMC9U?=
 =?utf-8?B?RmhlT1JuSXdVeDJzdHFUbC9hZ3FwZzBQL041Wi9jZ3FQejN6NXFySnF4WXR5?=
 =?utf-8?B?TGtDcnN0QU1JU2Z6bEJCaXJxWUhDNVFkWXFsTEJIZERwL1ZLRENPNDBZMVdJ?=
 =?utf-8?B?b0o1LzhRUjF1RndzM3FRaWJ2djgxRmM1dlp5dXFHeG1Xb2ZBZkk0RUh1RG81?=
 =?utf-8?B?ZEV1Q0pieWdna2xHYk9ZL1RFajZjcHJGdWQzUUk1YXhBK0ZMWFgvRnRCb2p3?=
 =?utf-8?B?djZFQThOTlZRdFZXVlFpNDhPYVRVVElURFhBaDNWMmY5M0lnZVFYdHBVOEdS?=
 =?utf-8?B?NDlHaU1nWkZ4ZHg4SnpPbTZ3Qm5lZFM5L3BadXVWRGhnMXYzcXRHa3VLekls?=
 =?utf-8?B?TWkwVzVUUXUxY1hGV0RNY3hiSFRVRENLVU5jbXNIUzgzcUtpdHlORlVZQWNJ?=
 =?utf-8?B?ZG9uU0lWQVVOek5EN0ExcnRDUTdpTEtSWUlTdWNaRzU4ZDc1dUZoRHRTU2Uy?=
 =?utf-8?B?RU1mTzRqTFJjYlJLRTRwNVhQYjNYbjgrNEd4aVg2Rnd1bWZCSi95NEdDWTZv?=
 =?utf-8?B?bzBxdXh3SnQrU1B3bzl6ZjRWZmxNME15T0doYTJqbnE0RUpyTDB3ZW5pTXhE?=
 =?utf-8?B?TnN5MDBUa2hxRzhVRVJIeDV1WUprdnVvUUxsdGtIcWRXR0J1WW55YjU5ei9a?=
 =?utf-8?B?MzBCc2pEZTJITTdpcHE3U2RPNnVLNFUwcnZndnR1bU9RcXJ1RUVMa2MrTStn?=
 =?utf-8?B?dy9oN1RqQlpNU09Fd0lLdk5Lc0RJWHZkZVdhcTRtQ3JIZnNRb292WCs5YUZH?=
 =?utf-8?B?WjNVSUlhSWdiTUV5NkVHZ0F4Z29HRUxRUW94ZmU0VTNkRGJPTWZWNElPRUEx?=
 =?utf-8?B?cmkvR1Y3RHBFSldueXZ2Z1ZSbGp1VGh3alQzQUtuQXNjM3dkUGJ6b3BFNTJK?=
 =?utf-8?B?eG5lSE56K3ZCWTUrekVicWorRHV1T29ORWp5MDdaMkNlaUpoRzVxNUJpa0My?=
 =?utf-8?B?UTFpTmVQZjJnNW5jeXdLTktvdm5yb0ZXRU1XNlI4bnRkemI3TWJ5eHBZYmVM?=
 =?utf-8?B?NGJySVNuV2Q3K3NJaFlNY0cySXBRcTBCU2hOakg5UmI0OXg5ZnJiejU1M090?=
 =?utf-8?B?S1ZDMDJ0bTVXdExHNUFDb3ZKaDBPS1hPbVBrUFo1NUJmck9QQUdaSmNHM1Z2?=
 =?utf-8?B?VlJFeGRQQk8zUU1SZTVRbVNUQm1FSC82WnlHRVNQUXk5aFpmZWc4bDFmSlNQ?=
 =?utf-8?B?bm5FY0EwM3V3WlVlVmg0b3k4VGhUWnBXU1JnL3BOdEc1NlVZVlVVdmxwM1lX?=
 =?utf-8?B?SW8xYm1qVmRBWFh4TW1WZVY4U1BhVnhmRzVPaFlUWjU1bEVFSUF4SVBxcFR1?=
 =?utf-8?B?KzdySGwzK09ab1cxRjBObjlOU05HQzVBQXhHQXBaWlZPQjAwTFpNSjZXM01N?=
 =?utf-8?Q?yE6pnq8geMGEkPczTePIf4yV/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c01c3c61-15a4-44e5-a24c-08db668a723d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 12:35:01.0672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVeMG53+izk5qWjFT5f78F4J2NUcq/JH3SXM2l+v6OpuVGDtibKcim+fBhPJHihpA6ZgeRYwMM8V8eDKFLmPjVVUoL1NLjAxXFe9BcDDWXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6018
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Add sysfs entry per tile
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGF1cm8sIFJpYW5hIDxy
aWFuYS50YXVyb0BpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgNiwgMjAyMyA2OjAw
IFBNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT47IGlu
dGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtJbnRlbC14
ZV0gW1BBVENIIDEvM10gZHJtL3hlOiBBZGQgc3lzZnMgZW50cnkgcGVyIHRpbGUNCj4gDQo+IA0K
PiANCj4gT24gNi82LzIwMjMgNDo0MiBQTSwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4gV2Ug
aGF2ZSByZWNlbnRseSBpbnRyb2R1Y2VkIHRpbGUgZm9yIGVhY2ggZ3B1LCBzbyBsZXRzIGFkZCBz
eXNmcyBlbnRyeQ0KPiA+IHBlciB0aWxlIGZvciB1c2Vyc3BhY2UgdG8gcHJvdmlkZSByZXF1aXJl
ZCBpbmZvcm1hdGlvbiBzcGVjaWZpYyB0bw0KPiA+IHRpbGUuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0K
PiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlICAgICAgICAgICAgICB8ICAxICsNCj4g
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCAgICAgfCAgMyArKw0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYyAgICAgICAgICAgICB8ICAzICsrDQo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5oICAgICAgICAgICAgIHwgIDIgKw0KPiA+ICAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYyAgICAgICB8IDU4ICsrKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuaCAg
ICAgICB8IDE5ICsrKysrKysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNm
c190eXBlcy5oIHwgMjcgKysrKysrKysrKysNCj4gPiAgIDcgZmlsZXMgY2hhbmdlZCwgMTEzIGlu
c2VydGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfdGlsZV9zeXNmcy5jDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3RpbGVfc3lzZnMuaA0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV90aWxlX3N5c2ZzX3R5cGVzLmgNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4g
PiBpbmRleCBmMzRkNGJkZDUxMGIuLjQxYTZjMGQwZGVlNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFr
ZWZpbGUNCj4gPiBAQCAtOTgsNiArOTgsNyBAQCB4ZS15ICs9IHhlX2JiLm8gXA0KPiA+ICAgCXhl
X3N0ZXAubyBcDQo+ID4gICAJeGVfc3luYy5vIFwNCj4gPiAgIAl4ZV90aWxlLm8gXA0KPiA+ICsJ
eGVfdGlsZV9zeXNmcy5vIFwNCj4gPiAgIAl4ZV90cmFjZS5vIFwNCj4gPiAgIAl4ZV90dG1fc3lz
X21nci5vIFwNCj4gPiAgIAl4ZV90dG1fc3RvbGVuX21nci5vIFwNCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBpbmRleCAxN2I2YjFjYzVhZGIuLmRiNjFkYTRk
NjIxMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVz
LmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBA
QCAtMTUwLDYgKzE1MCw5IEBAIHN0cnVjdCB4ZV90aWxlIHsNCj4gPg0KPiA+ICAgCS8qKiBAbWln
cmF0ZTogTWlncmF0aW9uIGhlbHBlciBmb3IgdnJhbSBibGl0cyBhbmQgY2xlYXJpbmcgKi8NCj4g
PiAgIAlzdHJ1Y3QgeGVfbWlncmF0ZSAqbWlncmF0ZTsNCj4gPiArDQo+ID4gKwkvKiogQHN5c2Zz
OiBzeXNmcycga29iaiB1c2VkIGJ5IHhlX3RpbGVfc3lzZnMgKi8NCj4gPiArCXN0cnVjdCBrb2Jq
ZWN0ICpzeXNmczsNCj4gPiAgIH07DQo+ID4NCj4gPiAgIC8qKg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dGlsZS5jIGluZGV4IDY0MTRhYTgxMDM1NS4uYWM3MDQ4NmQwOWMzDQo+IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdGlsZS5jDQo+ID4gQEAgLTEwLDYgKzEwLDcgQEANCj4gPiAgICNpbmNsdWRlICJ4
ZV9taWdyYXRlLmgiDQo+ID4gICAjaW5jbHVkZSAieGVfc2EuaCINCj4gPiAgICNpbmNsdWRlICJ4
ZV90aWxlLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV90aWxlX3N5c2ZzLmgiDQo+ID4gICAjaW5jbHVk
ZSAieGVfdHRtX3ZyYW1fbWdyLmgiDQo+ID4NCj4gPiAgIC8qKg0KPiA+IEBAIC0xNDIsNiArMTQz
LDggQEAgaW50IHhlX3RpbGVfaW5pdF9ub2FsbG9jKHN0cnVjdCB4ZV90aWxlICp0aWxlKQ0KPiA+
ICAgCWlmIChJU19FUlIodGlsZS0+bWVtLmtlcm5lbF9iYl9wb29sKSkNCj4gPiAgIAkJZXJyID0g
UFRSX0VSUih0aWxlLT5tZW0ua2VybmVsX2JiX3Bvb2wpOw0KPiA+DQo+ID4gKwl4ZV90aWxlX3N5
c2ZzX2luaXQodGlsZSk7DQo+IEhpIFRlamFzDQo+IA0KPiB4ZV90aWxlX3N5c2ZzX2luaXQgcmV0
dXJucyBlcnJvciBvbiBmYWlsdXJlLiBFcnJvciBuZWVkcyB0byBiZSBoYW5kbGVkIGhlcmU/DQoN
CkkgZG9u4oCZdCB0aGluayBJIGhhdmUgYW55IGFjdGlvbiB0byBkbyBiYXNlZCBvbiBlcnJvciwg
Y2xlYW4gdXAgd2FzIGFscmVhZHkgZG9uZS4NCg0KVGhhbmtzLA0KVGVqYXMNCj4gDQo+IFRoYW5r
cw0KPiBSaWFuYQ0KPiA+ICsNCj4gPiAgIGVycl9tZW1fYWNjZXNzOg0KPiA+ICAgCXhlX2Rldmlj
ZV9tZW1fYWNjZXNzX3B1dCh0aWxlX3RvX3hlKHRpbGUpKTsNCj4gPiAgIAlyZXR1cm4gZXJyOw0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5oDQo+ID4gYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5oIGluZGV4IDMzYmY0MTI5MjE5NS4uNzgyYzQ3ZjhiZDQ1
DQo+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmgNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5oDQo+ID4gQEAgLTYsNiArNiw4IEBADQo+
ID4gICAjaWZuZGVmIF9YRV9USUxFX0hfDQo+ID4gICAjZGVmaW5lIF9YRV9USUxFX0hfDQo+ID4N
Cj4gPiArI2luY2x1ZGUgInhlX2RldmljZV90eXBlcy5oIg0KPiA+ICsNCj4gPiAgIHN0cnVjdCB4
ZV90aWxlOw0KPiA+DQo+ID4gICBpbnQgeGVfdGlsZV9hbGxvYyhzdHJ1Y3QgeGVfdGlsZSAqdGls
ZSk7IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uODIxYmQ0OWRlMjc3DQo+ID4gLS0t
IC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMN
Cj4gPiBAQCAtMCwwICsxLDU4IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBN
SVQNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IMKpIDIwMjMgSW50ZWwgQ29ycG9yYXRpb24g
ICovDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAieGVfdGlsZV9zeXNmcy5oIg0KPiA+ICsNCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L2tvYmplY3QuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3N5c2ZzLmg+
DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+DQo+ID4gKw0KPiA+ICsj
aW5jbHVkZSAieGVfdGlsZS5oIg0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgeGVfdGlsZV9zeXNm
c19rb2JqX3JlbGVhc2Uoc3RydWN0IGtvYmplY3QgKmtvYmopIHsNCj4gPiArCWtmcmVlKGtvYmop
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IGtvYmpfdHlwZSB4ZV90aWxlX3N5
c2ZzX2tvYmpfdHlwZSA9IHsNCj4gPiArCS5yZWxlYXNlID0geGVfdGlsZV9zeXNmc19rb2JqX3Jl
bGVhc2UsDQo+ID4gKwkuc3lzZnNfb3BzID0gJmtvYmpfc3lzZnNfb3BzLA0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiArc3RhdGljIHZvaWQgdGlsZV9zeXNmc19maW5pKHN0cnVjdCBkcm1fZGV2aWNlICpk
cm0sIHZvaWQgKmFyZykgew0KPiA+ICsJc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBhcmc7DQo+ID4g
Kw0KPiA+ICsJa29iamVjdF9wdXQodGlsZS0+c3lzZnMpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtp
bnQgeGVfdGlsZV9zeXNmc19pbml0KHN0cnVjdCB4ZV90aWxlICp0aWxlKSB7DQo+ID4gKwlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSB0aWxlX3RvX3hlKHRpbGUpLT5kcm0uZGV2Ow0KPiA+ICsJc3RydWN0
IGtvYmpfdGlsZSAqa2c7DQo+ID4gKwlpbnQgZXJyOw0KPiA+ICsNCj4gPiArCWtnID0ga3phbGxv
YyhzaXplb2YoKmtnKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIWtnKQ0KPiA+ICsJCXJldHVy
biAtRU5PTUVNOw0KPiA+ICsNCj4gPiArCWtvYmplY3RfaW5pdCgma2ctPmJhc2UsICZ4ZV90aWxl
X3N5c2ZzX2tvYmpfdHlwZSk7DQo+ID4gKwlrZy0+dGlsZSA9IHRpbGU7DQo+ID4gKw0KPiA+ICsJ
ZXJyID0ga29iamVjdF9hZGQoJmtnLT5iYXNlLCAmZGV2LT5rb2JqLCAidGlsZSVkIiwgdGlsZS0+
aWQpOw0KPiA+ICsJaWYgKGVycikgew0KPiA+ICsJCWtvYmplY3RfcHV0KCZrZy0+YmFzZSk7DQo+
ID4gKwkJcmV0dXJuIGVycjsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwl0aWxlLT5zeXNmcyA9ICZr
Zy0+YmFzZTsNCj4gPiArDQo+ID4gKwllcnIgPSBkcm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQoJnRp
bGVfdG9feGUodGlsZSktPmRybSwNCj4gdGlsZV9zeXNmc19maW5pLCB0aWxlKTsNCj4gPiArCWlm
IChlcnIpDQo+ID4gKwkJcmV0dXJuIGVycjsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiAr
fQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5oDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5oDQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU0YTJiYThiYTUzMw0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5oDQo+
ID4gQEAgLTAsMCArMSwxOSBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlU
ICovDQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCDCqSAyMDIzIEludGVsIENvcnBvcmF0aW9u
ICAqLw0KPiA+ICsNCj4gPiArI2lmbmRlZiBfWEVfVElMRV9TWVNGU19IXw0KPiA+ICsjZGVmaW5l
IF9YRV9USUxFX1NZU0ZTX0hfDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAieGVfdGlsZV9zeXNmc190
eXBlcy5oIg0KPiA+ICsNCj4gPiAraW50IHhlX3RpbGVfc3lzZnNfaW5pdChzdHJ1Y3QgeGVfdGls
ZSAqdGlsZSk7DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCB4ZV90aWxlICoNCj4g
PiAra29ial90b190aWxlKHN0cnVjdCBrb2JqZWN0ICprb2JqKQ0KPiA+ICt7DQo+ID4gKwlyZXR1
cm4gY29udGFpbmVyX29mKGtvYmosIHN0cnVjdCBrb2JqX3RpbGUsIGJhc2UpLT50aWxlOyB9DQo+
ID4gKw0KPiA+ICsjZW5kaWYgLyogX1hFX1RJTEVfU1lTRlNfSF8gKi8NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnNfdHlwZXMuaA0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnNfdHlwZXMuaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi43NTkwNmJhMTFhOWUNCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnNfdHlwZXMuaA0K
PiA+IEBAIC0wLDAgKzEsMjcgQEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1J
VCAqLw0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgwqkgMjAyMyBJbnRlbCBDb3Jwb3JhdGlv
biAgKi8NCj4gPiArDQo+ID4gKyNpZm5kZWYgX1hFX1RJTEVfU1lTRlNfVFlQRVNfSF8NCj4gPiAr
I2RlZmluZSBfWEVfVElMRV9TWVNGU19UWVBFU19IXw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGxp
bnV4L2tvYmplY3QuaD4NCj4gPiArDQo+ID4gK3N0cnVjdCB4ZV90aWxlOw0KPiA+ICsNCj4gPiAr
LyoqDQo+ID4gKyAqIHN0cnVjdCBrb2JqX3RpbGUgLSBBIHRpbGUncyBrb2JqZWN0IHN0cnVjdCB0
aGF0IGNvbm5lY3RzIHRoZQ0KPiA+ICtrb2JqZWN0DQo+ID4gKyAqIGFuZCB0aGUgVElMRQ0KPiA+
ICsgKg0KPiA+ICsgKiBXaGVuIGRlYWxpbmcgd2l0aCBtdWx0aXBsZSBUSUxFcywgdGhpcyBzdHJ1
Y3QgaGVscHMgdG8gdW5kZXJzdGFuZA0KPiA+ICt3aGljaA0KPiA+ICsgKiBUSUxFIG5lZWRzIHRv
IGJlIGFkZHJlc3NlZCBvbiBhIGdpdmVuIHN5c2ZzIGNhbGwuDQo+ID4gKyAqLw0KPiA+ICtzdHJ1
Y3Qga29ial90aWxlIHsNCj4gPiArCS8qKiBAYmFzZTogVGhlIGFjdHVhbCBrb2JqZWN0ICovDQo+
ID4gKwlzdHJ1Y3Qga29iamVjdCBiYXNlOw0KPiA+ICsJLyoqIEB0aWxlOiBBIHBvaW50ZXIgdG8g
dGhlIHRpbGUgaXRzZWxmICovDQo+ID4gKwlzdHJ1Y3QgeGVfdGlsZSAqdGlsZTsNCj4gPiArfTsN
Cj4gPiArDQo+ID4gKyNlbmRpZgkvKiBfWEVfVElMRV9TWVNGU19UWVBFU19IXyAqLw0K
