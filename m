Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22E6C001DF
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 19:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4829D10E0E8;
	Thu,  3 Aug 2023 19:53:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7172C10E0E8
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 19:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691092423; x=1722628423;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iySr8nkL4/giKJsM96ezs/GBnV9MeD3OAWw1SVw2EjQ=;
 b=GtOpZ1iM1AnyWYcEH4XNrWzrfYdlb22M2w61WbGK4+rvD25T59Vj0WZh
 gVne5o/XPmhrTg3p8cTvi988hXPNWdylBCMQH/RtZ0VDpiOOmi1Bc2TH2
 yWeF3aE0UZ/jYMSFqV8g38nWy5hqu9xlAPMwNY0lDww8FlHCn267zy4ek
 7rAPh5moQfGTAAUJeRQgLuopovsGLItJ4axZMr8gi5CIJoUvBz8RON8pc
 J3XBEXFXDl+IIdCsrAKoLugse/OS8J/rTsR2OqFYNZouTtIxcTRT/TKe2
 kOqJ+KrBEk1Ju/o+6ytgPX5+OA7HjyiJneIyjyQL+2h4JfAYaDTLVpjbr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="400941123"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="400941123"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 12:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="732928235"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="732928235"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 03 Aug 2023 12:53:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 12:53:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 12:53:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 12:53:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsiqcV/0i2GfUxdn0RpaH7NOlQwrM+dj59xxsle+8vv5mKEWeqK0IKzQhlHufeG/X7F8/aEu2snsfjY/sj5wNnTfF0f8EdZ8pJ6RafzPuPwyWgwNT8mtjoWXn8dkh++9sVzi6MS1wGxiha81H8pBC4Xv3yYlkfP4zUWq727KBHVKkajz5hR4+3gWHKxhKnib4PX/ib9PHuou0vBzaJyxiRDXVF8OsTfCsVTrnIw5jx5GCgxZ2XAoXsFsfn6Ih6dBVm101eUfn8z0sZFeuXkSZC8+1A8TnbRfHQd+zgEM4kDDjqL0frDE3BDNN3lhLN6K5UYSYnMxfbwVIcT4nsPVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iySr8nkL4/giKJsM96ezs/GBnV9MeD3OAWw1SVw2EjQ=;
 b=FrA/RPx6cCkgVZExGkSFJhysB/zsYHChfNrxC+xjdbfjDyYeopxwIQMpRWClNrObkSFY+Ai2P1P6ZgnboqBnIINKJPa7oBNXkUqqgrpiuWPlRkDQkyAZZLtefP7LevbaJ5aAFPg8Cov03vNuaozj46YtPSZWnMRmu7u6k4d/Ux2eF+GH/HWLSTtNUu3r1QabYgB5lYTlP+SEYwOqSImoMhU1zI3v92U1xdR0hWWAaCleUOmM1JvmilYpROv2+Wd1ZdhneJoKJeEwCxcrHOx9T2Ra1yaefdn8+BykbLxKjnV+qZ5o8Maa1Hc2XEnhJxrCFhYHDYmjq+bMpF2MW9Tb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH7PR11MB6553.namprd11.prod.outlook.com (2603:10b6:510:1a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 19:53:37 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99%3]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 19:53:37 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Implement HW workaround 14016763929
Thread-Index: AQHZxjutLuZIKIMbRU+KCX5qsQM4NK/Y79SAgAAJyZA=
Date: Thu, 3 Aug 2023 19:53:37 +0000
Message-ID: <SA1PR11MB6991205AEC4589D7D76C24CB9208A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20230803190149.2637666-1-oak.zeng@intel.com>
 <c5b2618cc31febf582651f3f2b7875405851ba09.camel@intel.com>
In-Reply-To: <c5b2618cc31febf582651f3f2b7875405851ba09.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH7PR11MB6553:EE_
x-ms-office365-filtering-correlation-id: 1b727958-589e-4466-cef2-08db945b53bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nEBXG8C7V5aJ5AoaPeeSFVWPTN/FqZfblMssLDMxAD2rJDAyKFgNL4EvOUHGYe+qCQYq2I5ZmyihQa+3+67uc6mFXc4prlLJq5Dvgn4CW3pvSektxH2jmMak3Els8qI+UxEiZCW5JWQ4V/wkLD2RT/ATQE1zq4NYOtl3byQCpuLam8w6S9JIjL4Z/XJzfH22zYnqzKr+LAwy0Sy5sDzqpdOk6EJw4C3Y27F4O7SZ94yQKktGaa2C79og51KaGGiSJiI3jyiakqZuBPRHWJDRZSMO+wc6mS4FmILdWr9DVdL6qbOFVh9jEMmf6CAhWif+yMlzZkufpgxQ/WOxgjSWI4GNCSmcqtpFRgRf4gZ5hEZza/d4VbotLklnqVZfb9WqjvInP/87bsuujiJTancbgO7Rbdp4gOde0HQ4x9n/ZBx6jaFaBZ6gEFe5bTPz00RNO8vsvnNQQWyKAUliCsNBqep1qI2pdZD2M5Edzofa9NVsHjjMIE2dLo+BpKEggHy404+1OSUXzqBYzeYQvGRPWyZ5C2pJiJXj+jlGK9v7WazpvC6mLRmSPKv6I1CH8NNGva+dsHqB2QM8K7UK31mCUSJfXOmtqRh0Cc2M8Gu+az8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(41300700001)(8936002)(8676002)(83380400001)(82960400001)(186003)(53546011)(6506007)(107886003)(26005)(38100700002)(86362001)(122000001)(38070700005)(316002)(71200400001)(478600001)(7696005)(9686003)(110136005)(966005)(54906003)(55016003)(33656002)(66556008)(66476007)(4326008)(64756008)(66446008)(76116006)(2906002)(5660300002)(66946007)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnIxbFEwVzIyWVlucWhiSmtpTGZWY3Y1aFJSWlpFRGo2TTY0a3ByTHpzODlZ?=
 =?utf-8?B?Y2F5d3YwNXR1TlNaTmZ6UmNJeGRjUDU3dFRwOGRxWGk0RjBXTHVIeVJ5Y2NQ?=
 =?utf-8?B?OUZ1VytHSXdaT0F5K0dONzkvblZMZm1uZmN4bkNBRkNyMStkQ0hvbjduNVlv?=
 =?utf-8?B?RlkrUXk0LzBEejQ2MlNlOUp5aTlXazBmeGxSWjljUXkvTTloaWNBeTQwZ2hF?=
 =?utf-8?B?TGZ2Y2ZPMm81S29MaE5TT3dGQ09wVVZyaXdjSjZjL2swMmlVS1Zid3d0UFN5?=
 =?utf-8?B?dkp2RmFHNTlPSlpLRTM0ejB6WW5aRGxpTjJpcWxJSWFaSjZ5c1hBM3pCcjFV?=
 =?utf-8?B?cW1VdkFsMEVLY3BOWDdwbTNsYmxPMVNSZ2Y0bTdFMzZjdGRoRmNtRi8rVVNZ?=
 =?utf-8?B?RDRKcDFWRnNXejJwVk12amg0T1hVaXdDekZiNCtkSjRoMzBMQWtNQk9TNTQz?=
 =?utf-8?B?QXh1R0FNSVd6UG9iUnFNN3QvbTFNU2N5Q1FzaWZKZitQUnM4TDNGWUpqanhz?=
 =?utf-8?B?aEdwTVE3WFcvWmdyck8rMUM3UXdmVnhNanBMYysyZXZnWi9tQ0toRDdEN3gv?=
 =?utf-8?B?L0Z4L0FNSi9qTE9JU2FFeHVkVnhEKzYxU0FmTTVXbnNaZEtIYWJ1RjM5SW84?=
 =?utf-8?B?SUgvWW5WS0I1S2ZTMzcwalZGQlM0MXBNa0pjV0dlL0JqQUJjcGdLOGhyUzdH?=
 =?utf-8?B?SUE0Qm9XNWkzV0dBSGpKenkzRzdFenNVQ2xUZ0RMdU9zRVF6V2JSR0xRZEpX?=
 =?utf-8?B?eXA1RVJIUzhmeU9FdWRkSXZSblkxZXVyamY1K1lPNVY3VUsxVkpvRVhSbHpY?=
 =?utf-8?B?NGNGOFpHYWdtSmdEeFpFK29EUncrclBvMFRGRXdyelZWOVhYaDN0UXdybTRR?=
 =?utf-8?B?TjV3MFV6aVBmUjZ1UkFqQ2ZSRHhKQ2NMVzNGeGNLbW1RYlhSNW1pUmc1QlVJ?=
 =?utf-8?B?R1NLREN6OFJ6ZFRVWEtzTWoxZVdKK2ZRUCtVaWh0Wkl5K1RpK0VQUThINjNn?=
 =?utf-8?B?QWxsTytwMHNyVlhqTzk0V1NHenFOVndpaFRhOVM2cDA0dzhMSjhNRkhIbFg4?=
 =?utf-8?B?dHV1QUVidjFGREFpTDNsd2NJMjkxM1F3bzNjRENRRHFFQm1TdlR1anZKMFlI?=
 =?utf-8?B?dkdlRFpTRTNkaUFVZWhWZHB3SGo0N1ZWQVowcmQ5WXc3aGttUy9wemJncmtS?=
 =?utf-8?B?cDRUczB6czIxdG1uWWlMeWZBUnpxRVV2eWprSFhlbC9kRHV4T2NNMEd6UUs5?=
 =?utf-8?B?K1JNWXRhQldKdzczbHo5OUdkL0NrNUIxZ3NrSHQ0WUZ3Mzc0My9NRFlMeVFN?=
 =?utf-8?B?OTR4T1BUMVRGSURFQktWYythUDhKK2xvNGc3UStDZzRQdUVWTDE5bWpkV0Ra?=
 =?utf-8?B?UnJHUUNyendrMkh1eVhPWlFTR1hyMW5KdFlUc3pYSXB6YUFhL3R4eEhKeDdW?=
 =?utf-8?B?QUFwekRJQ2I5ZGlmaVBWKzFabXBtRXNSTlBNYmpoNEIrUzY1c1ZWeTFpSVky?=
 =?utf-8?B?MmJsN1c2QXI1WS9nVldodmtkV3VqdUtxR2I0ajdtb2lCVTBqL1JSaS81YVYy?=
 =?utf-8?B?cXNtbldlWWNROEhFVUlCbzAzeXVORTE0L1NXWjNQSHd2NnI4QitRWnBFanV5?=
 =?utf-8?B?dElnbTdLbVErSDFzaTh6OEg5aGdNVTFWOHppOGVJVGxrWU1yOXJNL0w5N3FQ?=
 =?utf-8?B?NGZNdTZvUjltQjd6VUJrMjRQeHl2a2JNQlFzR2N2ZHBlcCtPRC9DUVM3cnoz?=
 =?utf-8?B?V3RFT2NiYW9kY0tpMzZTNndiUVU2Ym15WXVBUnZLbTZuZmNPamtpM0lHbFVl?=
 =?utf-8?B?UTA4R2J5UnBhc3piaVNCVHRTSVdzYmRpUzZVeFpjT0d0Ym5heERZQlphVkFw?=
 =?utf-8?B?REhxdUJ5LzlLNW03UnVyaDlWUTRQTzFzMnI2M2creWpmVnF3S1pCemE5bUpO?=
 =?utf-8?B?YjcyZWFGQU4zdVF5dTZCSGNYYVE0ZTJ3UkI3OXRYNG1oajhRc1hBOGxYMldM?=
 =?utf-8?B?WEpoVGFJK29LL3MvWG1RRDNORmJJRDFaSko2R1VJalBTSmZmSFYyVWNTdzIy?=
 =?utf-8?B?cFBvdGNhalgrdmpPQVlBSEl0Y05XVzNvREJmT0pmWjlmZlR5SjM1ZkwxNjY5?=
 =?utf-8?Q?uLnk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b727958-589e-4466-cef2-08db945b53bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 19:53:37.0466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y/iIZOJYjZYhYY2D8Sa5Htzs/e7T2AvsDPiBZCo6T4zRT2KzCCUAhgok/NE6S7H7oKS0D0gEMy9zx49m4tLdWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6553
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Implement HW workaround 14016763929
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNClRoYW5rcywNCk9haw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFNvdXphLCBKb3NlIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gU2VudDogQXVndXN0IDMsIDIw
MjMgMzoxMCBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaZW5nLCBP
YWsgPG9hay56ZW5nQGludGVsLmNvbT4NCj4gQ2M6IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcu
ZC5yb3BlckBpbnRlbC5jb20+OyBEZSBNYXJjaGksIEx1Y2FzDQo+IDxsdWNhcy5kZW1hcmNoaUBp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFtQQVRDSF0gZHJtL3hlOiBJbXBs
ZW1lbnQgSFcgd29ya2Fyb3VuZCAxNDAxNjc2MzkyOQ0KPiANCj4gT24gVGh1LCAyMDIzLTA4LTAz
IGF0IDE1OjAxIC0wNDAwLCBPYWsgWmVuZyB3cm90ZToNCj4gPiBUbyB3b3JrYXJvdW5kIGEgSFcg
YnVnIG9uIERHMiwgZHJpdmVyIGlzIHJlcXVpcmVkIHRvIG1hcCB0aGUgd2hvbGUNCj4gPiBwcGd0
dCB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgYmVmb3JlIEdQVSB3b3JrbG9hZCBzdWJtaXNzaW9uLiBU
aHVzDQo+ID4gc2V0IHRoZSBYRV9WTV9GTEFHX1NDUkFUQ0hfUEFHRSBmbGFnIGR1cmluZyB2bSBj
cmVhdGUgc28gdGhlIHdob2xlDQo+ID4gYWRkcmVzcyBzcGFjZSBpcyBtYXBwZWQgdG8gcG9pbnQg
dG8gc2NyYXRjaCBwYWdlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPG9hay56
ZW5nQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxl
ICAgICAgICB8IDIgKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgICAgICAgICB8
IDUgKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcyB8IDEgKw0K
PiA+ICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBiL2RyaXZlcnMv
Z3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+IGluZGV4IGU3OTYyNGFiMmNiMy4uZTZhMDVkMzVjOTMx
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+IEBAIC0zNyw3ICszNyw3IEBAIHF1aWV0
X2NtZF93YV9vb2IgPSBHRU4gICAgICQobm90ZGlyICQoZ2VuZXJhdGVkX29vYikpDQo+ID4gICQo
Z2VuZXJhdGVkX29vYikgJjogJChvYmopL3hlX2dlbl93YV9vb2INCj4gJChzcmN0cmVlKS8kKHNy
YykveGVfd2Ffb29iLnJ1bGVzDQo+ID4gIAkkKGNhbGwgY21kLHdhX29vYikNCj4gPg0KPiA+IC0k
KG9iaikveGVfZ3VjLm8gJChvYmopL3hlX3dhLm8gJChvYmopL3hlX3Jpbmdfb3BzLm86ICQoZ2Vu
ZXJhdGVkX29vYikNCj4gPiArJChvYmopL3hlX2d1Yy5vICQob2JqKS94ZV93YS5vICQob2JqKS94
ZV9yaW5nX29wcy5vICQob2JqKS94ZV92bS5vOg0KPiAkKGdlbmVyYXRlZF9vb2IpDQo+ID4NCj4g
PiAgIyBQbGVhc2Uga2VlcCB0aGVzZSBidWlsZCBsaXN0cyBzb3J0ZWQhDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uYw0KPiA+IGluZGV4IGNiMjhkYmMyYmRiYi4uYjA0NWJiMzQxYTVjIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmMNCj4gPiBAQCAtMjksNiArMjksOCBAQA0KPiA+ICAjaW5jbHVkZSAieGVf
cmVzX2N1cnNvci5oIg0KPiA+ICAjaW5jbHVkZSAieGVfc3luYy5oIg0KPiA+ICAjaW5jbHVkZSAi
eGVfdHJhY2UuaCINCj4gPiArI2luY2x1ZGUgImdlbmVyYXRlZC94ZV93YV9vb2IuaCINCj4gPiAr
I2luY2x1ZGUgInhlX3dhLmgiDQo+ID4NCj4gPiAgI2RlZmluZSBURVNUX1ZNX0FTWU5DX09QU19F
UlJPUg0KPiA+DQo+ID4gQEAgLTEyMzUsNiArMTIzNyw5IEBAIHN0cnVjdCB4ZV92bSAqeGVfdm1f
Y3JlYXRlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiB1MzIgZmxhZ3MpDQo+ID4NCj4gPiAgCUlO
SVRfTElTVF9IRUFEKCZ2bS0+ZXh0b2JqLmxpc3QpOw0KPiA+DQo+ID4gKwlpZiAoWEVfV0EoeGVf
cm9vdF9tbWlvX2d0KHhlKSwgMTQwMTY3NjM5MjkpKQ0KPiA+ICsJCWZsYWdzIHw9IFhFX1ZNX0ZM
QUdfU0NSQVRDSF9QQUdFOw0KPiANCj4gSXNuJ3QgRFJNX1hFX1ZNX0NSRUFURV9GQVVMVF9NT0RF
IGluY29tcGF0aWJsZSB3aXRoIFNDUkFUQ0hfUEFHRT8NCj4gV2hhdCBpZiB1c2VyLXNwYWNlIGFz
a3MgZm9yIGZhdWx0IG1vZGUgaW4gREcyPw0KDQpWZXJ5IGdvb2QgcG9pbnQuIFdoZW4gSSBmaXJz
dCBnZXQgdGhpcyByZXF1ZXN0ICh0byBpbXBsZW1lbnQgdGhpcyB3b3JrYXJvdW5kIHRoZSB3YXkg
YXMgc2hvd2VkIGluIHRoaXMgcGF0Y2gpLCBJIHRob3VnaHQgdGhpcyB3b3JrYXJvdW5kIGlzIGJl
dHRlciB0byBiZSBpbXBsZW1lbnRlZCBmcm9tIFVNRCwgc2luY2Uga21kIGFscmVhZHkgZXhwb3Nl
ZCB0aG9zZSBmbGFncyB0byB1c2VyIHNwYWNlLiBCdXQgdGhlcmUgd2VyZSBzb21lIG90aGVyIGV4
cGVydHMgaGFzIGRpc2N1c3NlZCwgc2VlIHRoZSBjb21tZW50IGhlcmU6IGh0dHBzOi8vamlyYS5k
ZXZ0b29scy5pbnRlbC5jb20vYnJvd3NlL1ZMSy00OTk5MT9mb2N1c2VkQ29tbWVudElkPTIxMDU1
NjA3JnBhZ2U9Y29tLmF0bGFzc2lhbi5qaXJhLnBsdWdpbi5zeXN0ZW0uaXNzdWV0YWJwYW5lbHM6
Y29tbWVudC10YWJwYW5lbCNjb21tZW50LTIxMDU1NjA3DQoNCkxldCBtZSBjb21tdW5pY2F0ZSBi
YWNrIHRvIHNlZSB3aGV0aGVyIHdlIGNhbiBpbXBsZW1lbnQgdGhpcyB3b3JrYXJvdW5kIGluIHVt
ZCBzbyB3ZSBkb24ndCBoYXZlIHN1Y2ggaW5jb21wYXRpYmxlIGNvbmZpZ3VyYXRpb24gYW5kIGFs
c28gbm90IHNpbGVudGx5IGNoYW5nZSB1c2VyJ3Mgc2V0dGluZy4NCg0KVGhhbmtzLA0KT2FrDQo+
IA0KPiANCj4gPiArDQo+ID4gIAlpZiAoIShmbGFncyAmIFhFX1ZNX0ZMQUdfTUlHUkFUSU9OKSkN
Cj4gPiAgCQl4ZV9kZXZpY2VfbWVtX2FjY2Vzc19nZXQoeGUpOw0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+ID4gaW5kZXggMTVjMjM4MTMzOThhLi42ZmM2OGM1OTJj
YTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gPiBAQCAtMTUs
MyArMTUsNCBAQA0KPiA+ICAxODAyMDc0NDEyNQlQTEFURk9STShQVkMpDQo+ID4gIDE1MDkzNzI4
MDQJUExBVEZPUk0oUFZDKSwgR1JBUEhJQ1NfU1RFUChBMCwgQzApDQo+ID4gIDE0MDk2MDA5MDcJ
R1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgxMjAwLCAxMjUwKQ0KPiA+ICsxNDAxNjc2MzkyOQlQTEFU
Rk9STShERzIpDQoNCg==
