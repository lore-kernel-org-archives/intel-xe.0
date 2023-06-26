Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5C9EB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 16:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F38010E0CD;
	Mon, 26 Jun 2023 16:42:44 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A83A10E0CD
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687797762; x=1719333762;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=muAXtdIWur9lzcIHgzuQZ/pKaE5FZqA/O6/HCaw6izg=;
 b=VDQ7Vaf8lBeVKsj6zgHGmGCm6+3G65nTlgqaNqlHII/Iq9urvzBZugyO
 7tdCNF6BIOUm9hq4UZbudFOpHosRq2dTOYgt/4sfErGJO1h84rNF+bZp4
 k3t10PZma+i1a2orFX7g9iQ09oLNKwGX0+BD80BL8hdgBslXdGq7xjI0e
 5lmH46v8zdN+Ob+ZVGnJgRHezVxdSFdVyKag16dvaOmDjOh7jKejzp3re
 xewi62KPvnd76DsgKh8uwbw0PfR4sa4BUufAAtZ6itXzYO/JeCRghVGVQ
 fTV5ev24mpvtvAN/JtIrFrLr31ln8pZzLv2RUAL8VXxsd1WuNGJVoksBC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="358819286"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="358819286"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 09:42:41 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="751178474"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="751178474"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 26 Jun 2023 09:42:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 09:42:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 26 Jun 2023 09:42:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 26 Jun 2023 09:42:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCDQq0suV07yHRyWi30DKrhKCLP21+SC8aDZjFW8kT6EvpZpaBpNqaM6OcMbTSAz1TTdIoPwE020uUiwflG27xHr2MWrBQ1Lb7Zm97c8Ism8jUknKl77riIPs/K8FupubC/C3SWNKJXdWPfrWmT8lM8rk4o+g+1XgJwoc9OZLcxyUdCUawQhztIyFqDFQJWZtgcLCQP8Zesetllmd7LRF3K+ME/lfdjnTU7Cf36fVZ3EAFd4er8U/yTSMXJM5tjrUTgldxha2098EJcMRcIQI/2hu4L8vv9keog/SiLvEqYdSQVNcnL41r42JbF+/BMpGjg4varGFlqAlNy3APGcdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muAXtdIWur9lzcIHgzuQZ/pKaE5FZqA/O6/HCaw6izg=;
 b=ZcZVfFZkVo66e+1AaHVIgwrPzYik6BCTS9otAELqosdmB8Evwz4Wg8E6D4QWcoBWBqDnhCbytXI3MznoQo2MZflPreTFJn+Vr8iDJq3PIbt1ZqlM1ysnSFufkOm1Q+9ZmpYBof+uIlcaCNQ0GJhZnQG6nneIuV/T3Ef0AxUkAb6XtHHKcwAHEmVeUdj3TWox5kqGOWtxNBc9tzog7EWYa4+ItnzJAMzmr6jucNiKUl52kzET6K7bKfS+R9LkUwWeqyZaPnUf13EsLDGhmobq5yGoy7jsDhT06+eIqSU/8bEBPXwKcqqTCEjcpxByQ0TT7aIdSHMoTtx2zFZ6IEHSIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Mon, 26 Jun
 2023 16:42:30 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 16:42:30 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v3] drm/xe/bo: Return object bo size on create
Thread-Index: AQHZqDx+gJ4ktpmZBU62FA4qAdJnQK+dSeuA
Date: Mon, 26 Jun 2023 16:42:30 +0000
Message-ID: <426b86c76994b91128060fb8739264864eaba04c.camel@intel.com>
References: <20230626144239.158345-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230626144239.158345-1-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB8316:EE_
x-ms-office365-filtering-correlation-id: e457635a-522b-4d8b-d3c8-08db76645559
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IOM25nhbFGv02/ckH9I76rRBAJ1N2+t7jjdWpJ5LPWPDhSlZEAVqB4gsOKGAqpi+q9WSctrJlpPZAn259js43AxP26vbi+ZfCHJVKL/XLQG67kNcCOVwNkZeLAqxATSbZ0/gfbz2uDBDszYYCiUppi4Sk5MHvtONmDP9gCaxj8fcpgd/Ovj5ylZ827mKeasLlSd8Nr2VRCcBRlWS9gTmiOtTDz1MqcGZM3Z18tLNH3lEb01DZ6uAoh3gmS/u0hxp3NCQlajPa2vbcqkdTrY09deUgFw/6cVABKLFZ0VArJkBn6MTt9ukZ8YV1tIQNOLXTS9DPkIpXTQ2MKl5N4iqvsYgZdqITWQlC9XkC3csW6SSzRv5A1aCg2Qij0GHSqwR5gwntZtEhgbYcr3sEMetHoJFc9TQjgRxWlQ4SZN3inq01ImFLTdHY8RMq9+tw1nDjIlE9XnJ1ardiEGyPGaNSlcbIH/pXdcSuyIBWQZ4z+hT1wVfNEiLTWPJi4GIQPctVIY8rYtyqV/ugFYnisHvwvoSTWp41kdPJl9iLyPi/WP6fGEFVgR09YV8ivMbAgUBVKKyft4ebCz9bkHAJ1bago0XklfzxHS7oWOYCMi01ejzKlW/oCHCFLTRkvVPswI0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(5660300002)(76116006)(66446008)(66946007)(64756008)(66476007)(66556008)(91956017)(478600001)(36756003)(316002)(8676002)(8936002)(4744005)(2906002)(38070700005)(110136005)(86362001)(41300700001)(6486002)(186003)(6512007)(6506007)(26005)(38100700002)(71200400001)(82960400001)(2616005)(83380400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2FDV2NuNW4vc3RReldRRFRHOHBNaXlnTTlQZTBHd1JsOUVycUwzNDMvd1ZN?=
 =?utf-8?B?bTNIbFl5YW1EV2JQWDBLM0lweW1nOEdLZjdiUHl0U2lWby90L2U5V2UvK1o5?=
 =?utf-8?B?UDhOYlR0Zlp1U0QvTzFXRWJvMTNOeFdwdVVOVGVLdXpFdk05QVRPQ2RxN0JJ?=
 =?utf-8?B?Smo2VEk5VnVWRWIyaTQwbFZZbVJNaTRlcFRVOUowUE5YcmxwSlREeHdSalB0?=
 =?utf-8?B?MmlCRzFPdTRoVVg2U3hZOWE2Wm9LSE96RGRoVnJxSDhSZXpVR3poTXVSaEdV?=
 =?utf-8?B?Z09wVFVRazNRMitkUUp4M0ZSMmQxNXRMeHVGZDkvQjFrMVFiYXNqY0hoaVhz?=
 =?utf-8?B?cTFSUUNVQWh4SjJLYlpuSDd3L3lpRDBxZEVRTGdONWZ3clloQ3psbno5NDd6?=
 =?utf-8?B?WUpLR3RUMFR1RHRweElCbC9uR2VUcXg3WXJZRzJNNjZRTmFQSUp6alplcG8w?=
 =?utf-8?B?N3ZRckltRTMzdEMwVktndFVHWFVoSmRRSVg1N2M2ZCtTOUtGb2p1dlhJYmI3?=
 =?utf-8?B?YWFVWE5zckNFcVFTUVEwa3M4c0N4bE02U3N3ditoRm9wbW4vR3p3NDJ4RExG?=
 =?utf-8?B?YmZ6MTBPRmI3R1crcmFLYldrY0dTYmlUd0ZHUUgrY2RTTC8reXZ3K0tFNENI?=
 =?utf-8?B?VlYybVFxNFZiMGpwZURCNnZqWW81R2FDRWdhZ3czRkRtbmVHUWw1NS8rTXE3?=
 =?utf-8?B?SGtrbG43R0cwSlhpMURZYUYzSWloZFcxSEpBUWN1bzQzblYzZ245OW95S2da?=
 =?utf-8?B?UWJHaXdRbG9GT0FZdmRoazhiOVhZdkhiWXZBMGg2ZThKRzVwejFXdGgxa1A5?=
 =?utf-8?B?Y3JiWTdubVBoWDVJOHNBVWNrc3hjYUVxcnNKb2dnU3BKVUhHSU1HalJZWjlZ?=
 =?utf-8?B?emxCZW9peGQ1elRvUEZZbWdZNEVDSE9Wb09nREJ0bDIxdVZXbkhxZkdqM3BN?=
 =?utf-8?B?SGQzOFJ2NE5SMGVJZzYzK05jajA4dVhPMG5VaHFJakZuWDRRSVdzWnR4T1Ru?=
 =?utf-8?B?UUpaTTZiOHBQeUpwaWdRWnhkUUFwbVZ3WnIxVXZSZHdDL05uZkpicU5zZXRB?=
 =?utf-8?B?c3lMbHZTUFI3bTBROFlrMjBGbXQ4VEVSZ1IxSXRWaUw3V0dLVm9oTmkyK01P?=
 =?utf-8?B?THlWcmw2c1NBRFVXWWpkTCtOdmJvb29UdHpNS05UMGxaNXMrOU94UW5lemxG?=
 =?utf-8?B?bWFkUGZIZzhiRmhiajcrc1ZkSm5tVE9TcG1aR2dDTWhlMWZKVDVQbEY5UHh0?=
 =?utf-8?B?R3pyRU5BWE1sWWZkRTdCKzl2aUVKNHNZYTVsNU5PMUdJZm9XZXVsa2dvVkcw?=
 =?utf-8?B?NWw4K3RKZlk0ZkxtbU83U0F4QnNTYmp6OUtUeDdJS0tsWGtrcDVsRWRMMHZo?=
 =?utf-8?B?ZDlrM1JCWHBYelhjckY4ZWFHWDVud1NHOVNWSFJrRHZYODdncmhGNWJtMmNZ?=
 =?utf-8?B?dnNUU1kxSnJjVjZUOEkvdllYL05oc3lUdEJ6WTIrVjhTdGQwV0E3dHFTbGFi?=
 =?utf-8?B?RjlZbGV0S0RDUVhtdHBWcXVoZ1ZqbklsdmRzNHdER3RtK0dGakdtbS9kSXJZ?=
 =?utf-8?B?aDUyUnZRNXUvZE5peUw5RzlqeEtuOWNTRGpuYnh2TXlSK2p4TXNJeG4wY3h4?=
 =?utf-8?B?Zy9nYy9TV0Rydkt6ZFRHRmRFRlc0YnVkUlhDbDFNTFpZQTlIbUYwNmhRdytS?=
 =?utf-8?B?MnpQMCtPaTZPaXgybUFvSlVBOFlwOXVUc2tna1JFbENHL2N2M1prUFNyQ25V?=
 =?utf-8?B?eCtzR29NN1Q3YjdmNmZHTStvbFMzcnRuUEtFNUx2ZnV1WThhOUFwR3hRNEFa?=
 =?utf-8?B?WThham1xbVF6REF1SW9sZysyRDdIMkxQRmo3SDUzVU1tUHBWOFI1T1JHeFE3?=
 =?utf-8?B?SVdBV052SFkzcDVTdlJlU0I4Z21DbFZ3UkZuRCtTNlZEdzdadjlWbExPQm1z?=
 =?utf-8?B?SExReUJlTG1WRUFVbXduOWw3TnhnWDU5V0lkQ2xRVkdjVWJkdnI1c01Ha3dp?=
 =?utf-8?B?UW54M2wrVWRjMS85VjdxcEQ5NGpYVExycHlBUndPcWZEZWhCcURlbzQ3d1F6?=
 =?utf-8?B?bEhjM0dKL2V2ZGhFdUJyQ01yT1FTUVUvU1lEcnRmdml3Z0poNGZnL3kyN3E5?=
 =?utf-8?B?N3UvUno5N0dHaFFwZWYySU9UL1VpUkN1TWEvTWNzeDRWOHUvTmd5T0NCaWlH?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <867256BEDBC75C4E8389AD2BBED7F4D8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e457635a-522b-4d8b-d3c8-08db76645559
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 16:42:30.3267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gPSFwie2CBR4NWvE+KhG1G7Rbx0jkaj9kctu1J8r4gl+1/iTlZ7km9rXhZNjTvKN7KaMM6R5fSex7G9ogV1DkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/bo: Return object bo size on create
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

T24gTW9uLCAyMDIzLTA2LTI2IGF0IDE2OjQyICswMjAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IERyaXZlciBtYXkgYWx0ZXIgYm8gc2l6ZSByZXF1ZXN0ZWQgYnkgdGhlIHVzZXIu
IFJldHVybiByZWFsIG9iamVjdA0KPiBzaXplIHRvIG1ha2UgdXNlcnNwYWNlIGF3YXJlIGhvdyB0
byBhcnJhbmdlIHZtIGJpbmRpbmdzLg0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpiaWdu
aWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBSZXZp
ZXdlZC1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhh
cHVyYUBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJy
b3N0QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyB8IDEg
Kw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0K
PiBpbmRleCA3MWExNGUxZjI1YmUuLjU1ZGJiMzc0YTc4NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMN
Cj4gQEAgLTE3NDQsNiArMTc0NCw3IEBAIGludCB4ZV9nZW1fY3JlYXRlX2lvY3RsKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAJCXJldHVybiBlcnI7DQo+ICANCj4gIAlh
cmdzLT5oYW5kbGUgPSBoYW5kbGU7DQo+ICsJYXJncy0+c2l6ZSA9IGJvLT5zaXplOw0KPiAgDQo+
ICAJcmV0dXJuIDA7DQo+ICB9DQoNCg==
