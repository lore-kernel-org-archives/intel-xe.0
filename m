Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803B7C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 22:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D26410E5DC;
	Tue, 31 Oct 2023 22:57:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A59A10E5DC
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 22:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698793052; x=1730329052;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=xhm3pSK/60uIYW77Y0JnEyMoZRGLpmYDKrNEFr0TCL4=;
 b=bqB/L750ugdt7RBiqokbs4NY/ifiFu4rm1lr3ARfO5YS/kdj/cmeSo01
 JeRTInlpKa8Sob5H4Q2ESGsCTLd0KSG4J8xuxGcZe+EuRQfjCL3heYQP3
 INY7B97Mt2SniiQNlkAqtFOCEoMsIxwCqFh1wQ/W6wJTnzWf2R94BEjfD
 GEwz6RotKrWiDhKFFHc4nxLU7WtV81BXtgdROQp1RhY7g8b7RVc6P4NEk
 Gd7n4/QPna41VAti3nygKO8LCCieEdndUh6DkDlz3vltSdClf76OZS51S
 8Waorxu8Ny5C5WanrBQnM1TlOG4qfBIkOxYqWADbHuRzZO7/HEjpeRyKa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="385570588"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="385570588"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 15:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1092161010"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="1092161010"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 15:57:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:57:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 15:57:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 15:57:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ER+wIZLmWMCUjSgYC84Q2aymBu7cDE3E8iPGbRrqzF/7ozh5FHOEz8fS+7sbp/Edhzm19I64D/NUYJui5beA9ETKO5tm5aZOfh1N267C4WkHP7zsn19cktYerPJqN98T0gkH8RfbbESABf1NLLwyN9YCLMysIhdX61BQPg+1oiS2QBxNJHWGIE7NEvHARlpkXn1AGvdtFQO/3GYV1y4w6Oxx7HRxxYP4fZ7mmHQkBI28Zj4jt28acj7t89pORRrVqqQ0T3QkMldteTATLm+Lwko1IFT0bHVpWpUgOaOpa8zamWH4zDTEcNG5aqQIyRPfs5yHkZcHyoAWs2KWjI5q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhm3pSK/60uIYW77Y0JnEyMoZRGLpmYDKrNEFr0TCL4=;
 b=VA5x8clYVEwqPmBHuldlV3mC7ItmfFurDOW9qCsX1MyLHO7zTnBFG8snP3vXTj6iYnXKBEWbEaCHVIXhAePdsUFzdIY639cE7UAycneTgckCF7MydxSY8BZfauw47UlfI1S9/lZiSeLdYNVjQKvE3cuaC1/kn2sCfG3n+3tW4iEfP9b+p51QxxGWwGc/bjnBJUJQqglcz1CigEjRcbg0pLQBK5nCO/DoLGtbcgQYuPgv4VM1gTVCvG0tfb/ukamKvqdyYqPayJ0krl24FYE2lBTZ2jzn0bYvuhG0s9l0O6oQctKj2vFem1YXbTPk50ukW+1WrWcG3Yn6rxdT+mHyQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB6687.namprd11.prod.outlook.com (2603:10b6:806:25a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Tue, 31 Oct
 2023 22:57:28 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f%7]) with mapi id 15.20.6954.019; Tue, 31 Oct 2023
 22:57:28 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>
Thread-Topic: [1/2] drm/xe: Fix dequeue of access counter work item
Thread-Index: AQHaDEzHUklXw7EcLEOxHEQV/0HiKbBkgqOA
Date: Tue, 31 Oct 2023 22:57:28 +0000
Message-ID: <45b535935d5939d9750f194e2c8e4fe1e7225ba7.camel@intel.com>
References: <20231031221510.29355-2-brian.welty@intel.com>
In-Reply-To: <20231031221510.29355-2-brian.welty@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB6687:EE_
x-ms-office365-filtering-correlation-id: 2745715b-1b9c-455c-2e23-08dbda64c1d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tH+x+AFZOmFLKgFkkhQj8jJzZXzi9zNFAOjvRe0Op+ALtoQ/qCLXdrcwWNRmXVASwQXLlT9Z/FamGLExb5TKWxdTvSIO/KEKIRNOQfE5cteYlwOwYEsZQJuJLIbK+IsDcXgAzPpUxqQWmXOCrRoVcxCbbMhTtstW3B8Jtzur3YaMucNj1hooetx+RpyOVzg3AIGnmSqjRwZeWKb0oDW7f6zB/elOCXC2cKcJoixPsomx4/W3Qp5CZiTXflYX/Mz8C5WoCuy9tAN6SeKECTz2pHuVrA+1/1+6NzTfQ4UT1IwvYGtEHt/KT8LM/RLBZRz3dXFgv2VDmVfvtyIgpiP5eAxSlr3ux8r9I70yXtf/xY/qSAweJ6mWE+VFAvtcbMq2zFHKxz2II+G+M9DZd54YlVIbO6CRq6m07Eo39YymCUwunpdm5FA5s49fCZdv9yzQSewqqB9hF5NTkz+wRVsw320VY+X9I4guqbYEACL9r66PULyienuCcX1bMOmJsAJ/P2jTCrIkoqBciG7Wvx7Q+54SkyZaAgs6VIsbrJWp0wrPvCfRW2+G+O5GVr6Ndz1zeLTXvmzJ2qaKVoBICqjMQtJRFefCNPNLeOjFfdTqRUrF7eDS4KJdo4Ulzlgbee82
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6512007)(36756003)(26005)(5660300002)(71200400001)(6506007)(2616005)(83380400001)(82960400001)(4001150100001)(8676002)(8936002)(316002)(66556008)(64756008)(66476007)(66446008)(122000001)(41300700001)(38070700009)(6636002)(66946007)(86362001)(478600001)(76116006)(110136005)(38100700002)(2906002)(6486002)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFdBQW1tUThMNVNObk1QSW1EczcxUUxYV1p5S2xwR2JrRzF0Z05LN2VvVitV?=
 =?utf-8?B?ZUQzbi8vVTQ2cFM2RFRPZXdwaXpzUnlrOTlIN2loSnV0TGRHR2hRbTYzTnM4?=
 =?utf-8?B?bXNFa3hIdmZjVURCd0lyZVpReStpZWw4a3crSHQrVkpkSkJXNjJuYlR1anFZ?=
 =?utf-8?B?TmxtMSsxekdtVUFiUlc2VldUbUZ2NTJTY3JURDJXVFFSaXVYKzJyRnBiMFNE?=
 =?utf-8?B?UmwvSUhSL3c0b2NPRWVYVk12aEFhYnpHbkMxMmNKTFlQaElXbEwwSzU1T1VK?=
 =?utf-8?B?WWw1d0VmbFpiR2I0Q01ycFdybm1ZTXEwQ3lXWGFoSWhNbEV2QW5jTUFCbkts?=
 =?utf-8?B?clpvcXhwZGJnSnUyaWgrKzkrMklDR1NVaEl5Ym9TYjdFMUh5TExGcnM0S2xp?=
 =?utf-8?B?WHdrWVlFcC9yMFkzU3h5Vm9FTUs2Q00zcGhjMHpucE1VZmdDM21aSUQzUFUz?=
 =?utf-8?B?dFZ0NUFLa2p5KzErTnd2QXlFM0c2YWVFMGwvM3N6c2FpTmxSdUx3R1NuUG5y?=
 =?utf-8?B?ZDlYS0tRb0ZWREJPNUZnd05WSUtQbGZWUzA1bllac21zNVRFekJGc0FFZ1NN?=
 =?utf-8?B?SmFaSUczN0NYUHZHZElHZVhqNEZNRXlEUkRTZ1ZNRGtNakwxMHFwdlpncXh5?=
 =?utf-8?B?T3YrWmo0VmdUTW1lVXA4MVJ0V2ZwSzh5VEJhN1NLSC9RWFZ1cTBaYXhldjFn?=
 =?utf-8?B?T2ZWKzRQYlZqWEV2SGlSOFFETk9SQmpKRGJ1d1pYRWgwbG5aVEsxYkQwWUg3?=
 =?utf-8?B?blRIa1NqUzBLMkRVNHIxc1BpZVJlRmFFcXBWK0gramtUVy9ON1Ewa0NyMlZD?=
 =?utf-8?B?V3RiVE43c3BPZnJTN0UxdjJxU3NlMUtQMkVQY1FnaGdWbHpDNUpZeXY5VkRG?=
 =?utf-8?B?T2QvSm1YMSt1VkVPRHJidytOV1pOYWRhS2dJMUtvR1Z3bFIzTGtpRHJjYURu?=
 =?utf-8?B?R0loNVlTblFYRnNKaUI3TkdvUUZ1c0xjb3BCWnFKb1cwUTVmZU4yTkpGZitz?=
 =?utf-8?B?RkRveGwxenpZaWdIM3VXK3BmVk9kOFI1VE9MaThLVm51b0JFUnRhK0NYSDRx?=
 =?utf-8?B?VnpFdk1mWGRTS2hyOUMwQkhnMU5BdHhKVXVTdGVpZUs3RW95WmhOQ2VKZ1kx?=
 =?utf-8?B?VWNCamMyK3ZmM2MxNVpwd2kraU1GQWFZd1UvcXZWZmEvWWhDYUEwa0lCa3pk?=
 =?utf-8?B?dU9TSDdENHJiQVNGOGFCT2t5dkR2UEZVb2FFdXY5TlQrV1RsWW1VdUlQQnRs?=
 =?utf-8?B?NkdmTVZxQ2NYUDJSQnZNRmk1UEYybVcxM210KzdvT1AwT0dGWEFMSGFnTXhs?=
 =?utf-8?B?bE5vaEYwVnRxNlZQdVV4bjhJeFRQbklDWEpjNmZ6cWlZbHNIeEF2STdWYjZj?=
 =?utf-8?B?alZCWUFqOVlydjR5SVVodElHdThrdWJqYU1LbE1xMGVVamsyRllrY1h3WUw4?=
 =?utf-8?B?TFFXSmFWc2NFNFVRSDh5YVltd0hBTmhmL2VwVEk1NU5pbGQwek95a1JSeWha?=
 =?utf-8?B?SkVnRm0rOTFhSUpYNU5TSDRXVW1ReG9kQnRKdVpBYkpZUUdSVTIwVVZUSlBC?=
 =?utf-8?B?THVhWXQrWXFCWlhucXZiV1RYTXdrbS9VZmV2eEJvNS8yNHRVRjYrYVVNQm81?=
 =?utf-8?B?bWFvSUs2NUpyVHVqZGVmWUk0bjdTZHErQzV5VTB3VjhhQjZDMmNqVU5qc2tD?=
 =?utf-8?B?ZWVtOXo0VTJWbXJ2b2E2a2QvTkZtSnBzZ253WDU2VlN1NjRTL2ZQM3ZleWJ4?=
 =?utf-8?B?K2xMdll5K09kT1F5KzBzbzErVTBJUnNkbWE2RFV2TlVkdDdRU1J5QUUvZ3lC?=
 =?utf-8?B?OWtHWDZWcy9ZdURJSUh6Y3VvNW5WM2Iwanpnd1RKelF3NHMvdmwvbXQvTzYx?=
 =?utf-8?B?c3FkN21UUkl4WUQ1YTdvbFRkbXRkTUJ4M0pCUFE4N0I3TGVQU3d2cmdZbS9M?=
 =?utf-8?B?MmVXTWpFQTMzSURPK094ODBTRU51R1Eyam5FUEQ1RHlNeEZrMVhkQW91anFV?=
 =?utf-8?B?SXphS014Y2s2SElhMlVSL3luUnBoY1lsdUVBdzAwOTNWVnovei9OK1AwUVFJ?=
 =?utf-8?B?U3BkYW10aFlzNVpXY3g5aEwwd1dJZTVRK2hEdUwrYjFuLzhiOWJJZG5EMCtj?=
 =?utf-8?B?YU1ybEFTSE1IcjhqdkxqLy9Ka0RpWk1FOVZVbVdrZ2IrbzJRVzU2THRqMHFz?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BE6ED3696ECCA488E008A85EB604B86@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2745715b-1b9c-455c-2e23-08dbda64c1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 22:57:28.6176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gtoCifcxUmoB23x7F+9DBp9JZfPYcSb606BxMnJ1z7bGrnkNEughsXfpaUo6EKxLqCO6XRUB6NyYwunwV59RavOr0ykYCK8n6sDc9+6NwOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6687
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [1/2] drm/xe: Fix dequeue of access counter work item
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

T24gVHVlLCAyMDIzLTEwLTMxIGF0IDE1OjE1IC0wNzAwLCBCcmlhbiBXZWx0eSB3cm90ZToKPiBU
aGUgYWNjZXNzIGNvdW50ZXJzIHdvcmtlciBmdW5jdGlvbiBpcyBmaXhlZCB0byBhZHZhbmNlIHRo
ZSBoZWFkCj4gcG9pbnRlcgo+IHdoZW4gZGVxdWV1aW5nIGZyb20gdGhlIGFjY19xdWV1ZS7CoCBU
aGlzIG5vdyBtYXRjaGVzIHRoZSBzaW1pbGFyCj4gbG9naWMgaW4KPiBnZXRfcGFnZWZhdWx0KCku
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQnJ1Y2UgQ2hhbmcgPHl1LmJydWNlLmNoYW5nQGludGVsLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBXZWx0eSA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPgoK
U2VlbXMgbGlrZSBhIHByZXR0eSBvYnZpb3VzIG1pc3MuLi4KClJldmlld2VkLWJ5OiBTdHVhcnQg
U3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYyB8IDcgKysrKystLQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfcGFnZWZhdWx0LmMKPiBpbmRleCAyZWMwZGI3YTRiMjkuLmFiNmRhZWJiZDc3YyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMKPiBAQCAtNTQyLDYgKzU0Miw4IEBAIHN0
YXRpYyBpbnQgaGFuZGxlX2FjYyhzdHJ1Y3QgeGVfZ3QgKmd0LCBzdHJ1Y3QKPiBhY2MgKmFjYykK
PiDCoAo+IMKgI2RlZmluZSBtYWtlX3U2NChoaV9fLCBsb3dfXynCoCAoKHU2NCkoaGlfXykgPDwg
MzIgfCAodTY0KShsb3dfXykpCj4gwqAKPiArI2RlZmluZSBBQ0NfTVNHX0xFTl9EV8KgwqDCoMKg
wqDCoMKgIDQKPiArCj4gwqBzdGF0aWMgaW50IGdldF9hY2Moc3RydWN0IGFjY19xdWV1ZSAqYWNj
X3F1ZXVlLCBzdHJ1Y3QgYWNjICphY2MpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoGNvbnN0IHN0
cnVjdCB4ZV9ndWNfYWNjX2Rlc2MgKmRlc2M7Cj4gQEAgLTU2Miw2ICs1NjQsOSBAQCBzdGF0aWMg
aW50IGdldF9hY2Moc3RydWN0IGFjY19xdWV1ZSAqYWNjX3F1ZXVlLAo+IHN0cnVjdCBhY2MgKmFj
YykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFjYy0+YWNjZXNzX3R5cGUgPSBG
SUVMRF9HRVQoQUNDX1RZUEUsIGRlc2MtPmR3MCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBhY2MtPnZhX3JhbmdlX2Jhc2UgPSBtYWtlX3U2NChkZXNjLT5kdzMgJgo+IEFDQ19W
SVJUVUFMX0FERFJfUkFOR0VfSEksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGRlc2MtPmR3MiAmCj4gQUNDX1ZJUlRVQUxfQUREUl9SQU5HRV9MTyk7Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhY2NfcXVldWUtPmhlYWQgPSAoYWNjX3F1ZXVlLT5oZWFk
ICsgQUNDX01TR19MRU5fRFcpCj4gJQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFDQ19RVUVVRV9OVU1fRFc7Cj4gwqDC
oMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXQgPSAtMTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IEBAIC01ODksOCArNTk0LDYgQEAgc3RhdGlj
IHZvaWQgYWNjX3F1ZXVlX3dvcmtfZnVuYyhzdHJ1Y3QKPiB3b3JrX3N0cnVjdCAqdykKPiDCoMKg
wqDCoMKgwqDCoMKgfQo+IMKgfQo+IMKgCj4gLSNkZWZpbmUgQUNDX01TR19MRU5fRFfCoDQKPiAt
Cj4gwqBzdGF0aWMgYm9vbCBhY2NfcXVldWVfZnVsbChzdHJ1Y3QgYWNjX3F1ZXVlICphY2NfcXVl
dWUpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoGxvY2tkZXBfYXNzZXJ0X2hlbGQoJmFjY19xdWV1
ZS0+bG9jayk7Cgo=
