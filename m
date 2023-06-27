Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F30EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 21:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1879E10E32A;
	Tue, 27 Jun 2023 21:24:21 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD30010E32A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 21:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687901059; x=1719437059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HPg/Zeb17nVoPNWM73okJdza1rX0diVjrSElejCzY/U=;
 b=c4GmeqJAvq1rtkOm+Jst+JeATFfRDbZlm2NpEXdffenl4fraYY/k/Eu+
 /LArHGk0tmYaTkSa92BMod/sGFbXaqY3vx6bt1Ap7C65j6jy3d0NI6gTY
 zMyvrpZrq+QMBfmREjm+ZTiqQ+LnRvIbMcDgIAd05Cz50dRbDwX/BJj8k
 oslrKSJpBT8gFX+kxnYMiZKDnY0q8bWWNltJ0uE2hpxWqBqGBGX7uAUpa
 V8oBDWUuXCXHSLmoKQs50ATUli4HRDI1S4PlASVbK/ysEYAk4J+bZI4pR
 0BwssBXo+NiRjPicL8lIhEYjBvAEibM67aERYm/yk5TWzL25lbNM1QkWv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="341268143"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="341268143"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 14:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="666850290"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="666850290"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 27 Jun 2023 14:24:16 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 14:24:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 14:24:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 14:24:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATLN3RArTk/XIokFVti9CVa9jZA9kkNhVDY4NMRfilKkRuPayXXwy7NR1qTHp8oGPVna19Tk5VOiw0LtzIy3zYEy2jIS5UryE8FyiYIlfktLu/mE7C0F9lCDI6GEjJ2RSS9/TE+B1JqOaYTafRFEFYayheR4J/FV8evTg9WeciH2BSh0WKq9aHyyb6EBEXNKfZVo5usTtW61sDhGDrwoK7NZv+QIioAtjI3ZJGAP8/yYMPoIg8qTXEuTVjhISC1Ud7JaKdczLrBCGyzqulYJaFESEJGbMM8ewT8HJakuDLoraj9W33rAICsCPduKFUc3CVrEoL3FduKJiaM/wZk5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPg/Zeb17nVoPNWM73okJdza1rX0diVjrSElejCzY/U=;
 b=QvPkNQlBpOxga5K4f726genaiGYT+MZalTRKsyi8CDuwHWPmNXpaSUOxY9KYSQpVvFC83dj+yufL1vWVRa3mlwjz1/IttH/r96o5OZrLDaKythkG0tBtquZ824Y7nx0h7UwUoj2HjKydksHqhElKGXBRdn2XKgw7GnqaPMu45HHlefCAoLY7WqpolbJqP087WAV2dfC0mFZ0kIEYYYDMO0fph6rcBHsubQPIRKhjo7rRwdD7+O0yIlwOY/utT3GyfgYH7owHDP/3mXHfV30In+nJWFVwtnUtWFii3LbwzMMuCmaVJPSNtP+nkDEEFCy7ggjw67z9VFGf8X6bgQYIoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by SJ2PR11MB8299.namprd11.prod.outlook.com (2603:10b6:a03:53f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Tue, 27 Jun
 2023 21:24:13 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::73e1:ee27:c348:6ee]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::73e1:ee27:c348:6ee%7]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 21:24:13 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/2 v2] drm/xe: fix bounds checking for 'len'
 in xe_engine_create_ioctl
Thread-Index: AQHZqHRXWj/Xl8eHr0ymLddM+pFIvK+fBREAgAAldQA=
Date: Tue, 27 Jun 2023 21:24:13 +0000
Message-ID: <48bbb481616bd10069fd9106e42e1060d5b3be72.camel@intel.com>
References: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
 <ysrqnzx3w76mckgtqhcv7dguf6wz6z3twknaur3cfm7ttbclq2@qhzxzpjam732>
In-Reply-To: <ysrqnzx3w76mckgtqhcv7dguf6wz6z3twknaur3cfm7ttbclq2@qhzxzpjam732>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|SJ2PR11MB8299:EE_
x-ms-office365-filtering-correlation-id: 980dba6c-e8b8-422d-8669-08db7754dac0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bdOKJIpjTZwRCyEBdKXPLESKO/mDFfSDOxThwM2FMHCROwtrdszfp6gTZrQfL1FPpnXly7yLcHC+N6bQxCz3sq4ivwAiNzE10bDUsoQ1WJqgT6DFv0BGTWtBqrZVOqX9z/2NH1bxVlouKheoh+KfNYL/+8PTgW35PLZJ6ul22M50Q7PYMzKIgwWupgLCr9xjfaqJ2tzJ8LaexB82IiQcbHCfznV9EUpgeD14iRGtjh2TF9NeP2FEqZfNA4Rg4CDfvIcaLJLGRenEunaLbrD5ASOF4oCoUjUbiy+zBR4Ew2Z/jGJNymlLGM23Ore5dNnJK5LDhEdayYzZ+mU2wKN8m1U+CxDL2tbXbCQZEzlBu6deugwY/0l1t6JyvzL8DrlsuP8boj+/iyax9EaxZqsc1Fr98/mp1c6wYgO5hVvSmV+LZA7LowgFNZk+uSm0HQfg2+TfdYIkLe9PGmncXaXklKMm6HEsnbh2yMI/F0PiJbipo0uNFWrVwoFnl+OcpXSn/1GYncMGO6b3+eQqzyAzg2PhbHOHNM5nK5j5XkO5Ouv+zYRs427cDaUKzdaPW/QYlfUd9Gq25iXIU21xLPw9LDxUANiwUdWpe+0TClJoxZs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(38070700005)(6512007)(2906002)(6486002)(82960400001)(2616005)(122000001)(71200400001)(83380400001)(38100700002)(6506007)(186003)(966005)(37006003)(86362001)(41300700001)(478600001)(36756003)(6636002)(316002)(66946007)(64756008)(76116006)(66476007)(66556008)(66446008)(4326008)(5660300002)(8676002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTB3Q3dQU1RQNm9Vd3N3cjI3ejBaa0tYN0NXVjFya25ORlRYdG03V2c2WllI?=
 =?utf-8?B?NS9ZYTZ0RTUvNlNuQzR4Vm1pSkppVjRZZU54Z0RWVXlSTmlXcnpKaXJqdGYz?=
 =?utf-8?B?RWY4c3Z3aGZ4SzNONEc4dUx2Qjg3ZnhYSHpRMHRRNGZvR2ZaSWxqczJvRW9N?=
 =?utf-8?B?WW9ya09RUDlJSS9PZmNNSnErNjhXNTVwZzlUWit5UDRUanFGK1cwZkMrcDlS?=
 =?utf-8?B?bEluNEl1djJFaDFPNTNuYTdBdjltdEJVbEFtczY3TzRBNXlCQS9TZTc4WlZ6?=
 =?utf-8?B?emNqaXFvSTQxTUlLcEdLU05vL0J2OGVKYm9nSWUzU1A4YzdRQnEvb242YXIv?=
 =?utf-8?B?bS90aWxNM2lBUWppZlBPa296YTAvNGI5ZFZXTU52eEZhUHAwRlkvZzZTVEIw?=
 =?utf-8?B?aUpkNVhkMnNXZVNYczVnSzNabkp4UEx0S0tGMDNRR2lsOXJmSW5xeXlrUTFu?=
 =?utf-8?B?amNjMTB1UVJzREhZdCtxS1lYOElPcmx2anIxaFRlM0hVZ2J0cDNyanIwV0pL?=
 =?utf-8?B?STJkNzZTVGJjTUR0WTZKRGNSTndwdmZkQzZZVXh3REt4dUo1ODEzQkRiNHds?=
 =?utf-8?B?cWlQUldjS3hhSHd2NVpWWWRIWmI0TzNTOC8zdWJ4TUx0VHFqZkIzMUhHQXNG?=
 =?utf-8?B?elJlcG5JaU10NGV5UmZiYzNwUlE2S2xpazJvL0ROVlJrcWQrZW9rdUdiQ3V4?=
 =?utf-8?B?OSsyY2NwcksxWHR4TlJ0Vi90MjZEd1NwbG5BUEFPb0xaTCtVZVNUK3N3aXZw?=
 =?utf-8?B?Y05sb0ZJTWxxNFJrN3BLS3FTaUY1UFY3dmYyWVB2UUhaZ04ydEhBZlBqT3o1?=
 =?utf-8?B?WEhkZ3J5cmVPQ2l6Y3hjR0RNV2VBU1ZkUkZVdXhKb0MrUkhHdW10UTI4K285?=
 =?utf-8?B?VUZQbk1Sd0pWV1JvWDB4SG9KTFYvWUtRdWRmTWFvSWZoeENmdHNWNEg4aS92?=
 =?utf-8?B?UXpZQW14UUR5T0VCNGlHZktlUWN4d2VxNENUTHp1NWw0dVdXVUswcHFLRWVV?=
 =?utf-8?B?VDEyYzlleDNlWXFuczZNQ0liRFcwbmgwRXJqL3JKc3lIbWZ6ME5MT2E2cFJW?=
 =?utf-8?B?eFBqOWlWWCtMN0pIM1FIZDZLd3EydkllU1hwRGpLeXhuR1AyaHhZU0p2N29a?=
 =?utf-8?B?YzJvbWJIdDNFcU9tZUxxUnMyNWlJVlUzWWFmdmd6T1pTKytSQUJWNkpHMG5L?=
 =?utf-8?B?cVVjTG50ZmN4cVhiWVNaOHRuK1FON0JGb1JKMXQwRDBhSmtiMFZQVkpvVkdR?=
 =?utf-8?B?cFlFbkVkS2lkSDRIbU1xMlladVI3UzAwRWsrdmJsb2dScy9mM2U4LzgzZEdS?=
 =?utf-8?B?L21iMlY2SlhhRWdJRUhxazFYMzBxYWNIc3Rpd1JFY012dHd0V21xYXRVY3lo?=
 =?utf-8?B?cFRKUUE5cFU0YVNhVzFQV1BCK0ozZjBaYmtIZTdjcndlSy9YZmsxQzByZ2g2?=
 =?utf-8?B?ZE5jZmdLRGY0NU10N2tMWkJDcUgvOVg0Z0c4cHVZeWhCZ244SmgxcVgyVmxZ?=
 =?utf-8?B?S1I0d3hITUV6SjNkclJVUThELzBpMDZoKzdXcW0zTUlMZmY5VitqdkFtYitt?=
 =?utf-8?B?NWl0aDBWd1NoS0ZoVGtTbVUxb3BNQ2k5bkxzYTl0WTZWczJVTEttU1RjVjRy?=
 =?utf-8?B?MnJ5WjVyQ05IK0JXcG5nWkp6eGxKY1o4dTdMb053TmQrN0I0Q3g2R1p2NGZa?=
 =?utf-8?B?dStHem5GVmtydjUrbXlSOWt1RklldHlEOW9oZjQ3d3dyQkRZaDZhQmMyZk5s?=
 =?utf-8?B?d0xKRGNRSFhjYVJmb3lVZjJjMkNRKzFGcCtXbFg5VCsyWEdiUnRhbDI5QlRp?=
 =?utf-8?B?UUZmd1Y2a0I1MEJMSjBlRXMrdWVMZElsQTFseHRuZGdoNTg0U01tczhBcEpC?=
 =?utf-8?B?VmthRHFRdldibFlvOXJJRmxITkVublZvdk1xeEhHZ3JobCtzN0NydzhicnNO?=
 =?utf-8?B?dDdrcW5DcmszZDQwZkhNSlFUUWl5MDVNMnYvVHBUdlFlZklGVThHSmlGWjdT?=
 =?utf-8?B?N2ZJaloxdU1BMWMxbmdFWlFiUGxmbzRpam41WVFyTzRpZnhMcnNRcmhOR3p2?=
 =?utf-8?B?OWd0SDFlN1I4dzVKeVJHeGxIK0lGWW1yV2pXamZNeG9ZOE80N2tlSkpWUDgr?=
 =?utf-8?B?L2wvdyt1OEdYZlkxRnZyb3EwVk9OSW5rVXRNTDhpTk9sTktSNnNUcVVjUEdq?=
 =?utf-8?B?KzJJZ3IrTGRhZGo1QUF3R3JHMVNtdVRwcDJnc050Z2VoUFd4dTE2eWl2Q2t1?=
 =?utf-8?B?S1crWVk5eFRvanZGKzA1bnNJeTB3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4842499B630B0B438D6470B1BE3A33F5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980dba6c-e8b8-422d-8669-08db7754dac0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 21:24:13.3913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SRH9xfp015HTC7KcYq2a8zTKZKVWpM3XLspSoJcVfWi6bbhvC0dFlZsrP7mldw6hATOX98xwJ5+55n1BgiJt4TTXBuzLmKT4tpXaxPq1qmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8299
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2 v2] drm/xe: fix bounds checking for 'len'
 in xe_engine_create_ioctl
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

T24gVHVlLCAyMDIzLTA2LTI3IGF0IDE2OjEwIC0wMzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIE1vbiwgSnVuIDI2LCAyMDIzIGF0IDAyOjIyOjIwUE0gLTA3MDAsIFBhdWxvIFphbm9u
aSB3cm90ZToNCj4gPiBUaGVyZSdzIHRoaXMgc2hhcmVkIG1hY2hpbmUgcnVubmluZyB4ZS5rbyBh
bmQgSSBvZnRlbiBsb2cgaW4gdG8gc2VlIG15DQo+ID4gdG11eCBjb3JydXB0ZWQgYnkgbWVzc2Fn
ZXMgc3VjaCBhczoNCj4gPiANCj4gPiAgICB1c2VyY29weTogS2VybmVsIG1lbW9yeSBvdmVyd3Jp
dGUgYXR0ZW1wdCBkZXRlY3RlZCB0byB3cmFwcGVkIGFkZHJlc3MgKG9mZnNldCAwLCBzaXplIDE4
NDQ2NjYwMTUxOTY1MTk4NzU0KSENCj4gPiANCj4gPiBJIGFsc28gc29tZXRpbWVzIHNlZToNCj4g
PiANCj4gPiAgICBrZXJuZWwgQlVHIGF0IG1tL3VzZXJjb3B5LmM6MTAyIQ0KPiA+IA0KPiA+IFNv
bWVvbmUgaXMgcnVubmluZyBhIHByb2dyYW0gdGhhdCdzIGRlZmluaXRlbHkgc3VibWl0dGluZyBy
YW5kb20NCj4gPiBudW1iZXJzIHRvIHRoaXMgaW9jdGwuIElmIHlvdSBwYXNzIHdpZHRoPTY1NTM1
IGFuZA0KPiA+IG51bV9wbGFjZW1lbnRzPTMyNzY5IHRoZW4geW91IGdldCBhIG5lZ2F0aXZlICds
ZW4nLCB3aGljaCBhdm9pZHMgdGhlDQo+ID4gRUlOVkFMIGNoZWNrLCBsZWFkaW5nIHRvIHRoZSBi
dWcuDQo+ID4gDQo+ID4gU3dpdGNoICdsZW4nIHRvIHUzMi4gSXQgaXMgdGhlIHJlc3VsdCBvZiB0
aGUgbXVsdGlwbGljYXRpb24gb2YgdHdvIHUxNg0KPiA+IG51bWJlcnMsIHNvIGl0IHdvbid0IGJl
IGFibGUgdG8gb3ZlcmZsb3cgYmFjayBpbnRvIHNtYWxsZXIgbnVtYmVycyBhcw0KPiA+IGFuIHUz
Mi4NCj4gPiANCj4gPiBWZXJ5IHNpbXBsZSByZXByb2R1Y2VyOg0KPiA+ICAgIGh0dHBzOi8vcGVv
cGxlLmZyZWVkZXNrdG9wLm9yZy9+cHphbm9uaS9lbmdpbmUtY3JlYXRlLWJ1Zy8NCj4gDQo+IHNp
bmNlIHRoaXMgd2lsbCBiZSBmb3JldmVyIGluIHRoZSBnaXQgbG9nLCBtYXliZSBpbnN0ZWFkIG9m
IGEgbGluayB0aGF0DQo+IG1heSB2YW5pc2gganVzdCBhZGQgc29tZXRoaW5nIGxpa2UgdGhpcyBp
biB0aGUgY29tbWl0IG1lc3NhZ2UgaXRzZWxmPw0KDQpXZWxsLCBteSBnaXQgbG9nIHJlZmVyZW5j
ZXMgdG8gcGVvcGxlLmZyZWVkZXNrdG9wLm9yZyBoYXZlIGxhc3RlZA0KbG9uZ2VyIHRoYW4gbXkg
Z2l0IGxvZyByZWZlcmVuY2VzIHRvIGJ1Z3ppbGxhLmZyZWVkZXNrdG9wLm9yZyA6KQ0KDQpUbyBi
ZSBmYWlyIHRoZSBidWdzIGFyZSBzbyBzaW1wbGUgdGhhdCB3ZSBjb3VsZCBhbHNvIGp1c3QgcmVt
b3ZlIHRoZQ0KbGlua3MsIHNvIEknbSBmaW5lIHdpdGggYW55IG9mIHRoZSAzIHBvc3NpYmxlIGFw
cHJvYWNoZXM6IChhKSBrZWVwIGl0DQphcy1pczsgKGIpIHBhc3RlIGNvZGUgYXMgeW91IHN1Z2dl
c3RlZCBvciAoYykgY29tcGxldGVseSByZW1vdmUgdGhlDQptZW50aW9uIHRvIHRoZSByZXByb2R1
Y2VyLg0KDQpJIGRvbid0IHRoaW5rIEkgaGF2ZSBwZXJtaXNzaW9uIHRvIG1lcmdlIHRoaXMsIHNv
IHdob2V2ZXIgZ2V0cyB0byBtZXJnZQ0KdGhpcyBjYW4gY2hvb3NlIHRoZSBhcHByb3ByaWF0ZSB3
YXkgdG8gbWVuZCB0aGUgY29tbWl0IG1lc3NhZ2VzLiBPciBkbw0KSSBuZWVkIHRvIHJlc2VuZCB0
aGUgc2VyaWVzIHRvIHRoZSBsaXN0Pw0KDQpUaGFua3MsDQpQYXVsbw0KDQo+IA0KPiAJZmRfID0g
Li4uOw0KPiAJdm1faWRfID0gLi4uOw0KPiAJaW5zdGFuY2UgPSAuLi47DQo+IAlzdHJ1Y3QgZHJt
X3hlX2VuZ2luZV9jcmVhdGUgZW5naW5lX2NyZWF0ZSA9IHsNCj4gCQkuZXh0ZW5zaW9ucyA9ICh1
aW50cHRyX3QpIG51bGxwdHIsDQo+IAkJLndpZHRoID0gNjU1MzUsDQo+IAkJLm51bV9wbGFjZW1l
bnRzID0gMzI3NjksDQo+IAkJLnZtX2lkID0gdm1faWRfLA0KPiAJCS5mbGFncyA9IDAsDQo+IAkJ
LmVuZ2luZV9pZCA9IDAsDQo+IAkJLmluc3RhbmNlcyA9ICh1aW50cHRyX3QpICZpbnN0YW5jZSwN
Cj4gCX07DQo+IAlyYyA9IGRybUlvY3RsKGZkXywgRFJNX0lPQ1RMX1hFX0VOR0lORV9DUkVBVEUs
ICZlbmdpbmVfY3JlYXRlKTsNCj4gCWFzc2VydChyYyA9PSAwKTsNCj4gDQo+ID4gDQo+ID4gdjI6
IE1ha2UgbGVuIHUzMiBpbnN0ZWFkIG9mIGNoZWNraW5nIGZvciA8PTAgKEpvc8OpKS4NCj4gPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGludGVsLmNv
bT4NCj4gDQo+IA0KPiBSZXZpZXdlZC1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNo
aUBpbnRlbC5jb20+DQo+IA0KPiBMdWNhcyBEZSBNYXJjaGkNCj4gDQo+ID4gLS0tDQo+ID4gZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jIHwgMiArLQ0KPiA+IDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZW5naW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZW5naW5l
LmMNCj4gPiBpbmRleCA2ZTZiMjkxM2Y3NjYuLjUzMGY1NWEzM2IwMyAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZW5naW5lLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZW5naW5lLmMNCj4gPiBAQCAtNTIyLDcgKzUyMiw3IEBAIGludCB4ZV9lbmdpbmVf
Y3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ID4gCXN0
cnVjdCB4ZV9lbmdpbmUgKmUgPSBOVUxMOw0KPiA+IAl1MzIgbG9naWNhbF9tYXNrOw0KPiA+IAl1
MzIgaWQ7DQo+ID4gLQlpbnQgbGVuOw0KPiA+ICsJdTMyIGxlbjsNCj4gPiAJaW50IGVycjsNCj4g
PiANCj4gPiAJaWYgKFhFX0lPQ1RMX0VSUih4ZSwgYXJncy0+ZmxhZ3MpIHx8DQo+ID4gLS0gDQo+
ID4gMi4zOS4yDQo+ID4gDQoNCg==
