Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13874C77B78
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 12:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97FD10E392;
	Thu,  4 May 2023 12:17:35 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0DC10E39B
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 12:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683202653; x=1714738653;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P8h5Mi0ZIdS9WO/a5h0i9mgQHP8bo2x0p/fnQyLIM5M=;
 b=HUDdo93m1GZMACUwJs7D3SMfp5+tLe8lekus9jc+dhtspuM0L5gBGn1/
 WDG7ok2tCpJiWYz2TleP0iJ3SQMvrD84QYHPaiuJM46s7BlOEOqpzo7GA
 dX268D/y87fYzhaKsPzivMit5b34xWwhJRydDVZLQtdj97kmrLapsnsCt
 48W+kw+4Is4wuCaLq/5K/czz5MI46gzus35+SrNgHMbUMRd69orZIeRr+
 jU9NpzcN4FnEQV2qmFOUBFb4RbKxGngHWmVQEBJ17UeSF62De8RVQ6XDu
 FEXiDyI5LVNGgpgFZcf5U3SdxJpidPJB+bje8mkJbXvlV7muinmK9lRyq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333293154"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="333293154"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 05:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="766553799"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="766553799"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 04 May 2023 05:17:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 05:17:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 05:17:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 05:17:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3Ps85chrlI7UgPn4VNqYM03lIVAUB6amGrEFnQ/qtwfid4H02B41Md/Mtn5SKaFRg4A0ymx18yaUkhYu6mAvJ8lzZ7HayFVj74uk4MWlGJoG8IQ+f0Z/Yj5Wi/8T0woAr8H7/C4vHmtDE32GIPtEhy1JUETNjZUEqY/M4m8KPbmolBKvG/XR4NsAoi6u+bkfQEIP7eZ0fjtRNPAk2B39uqVmWnsMsrGorYXFIj7B3s4dq14OQ9Yg0FCt84UTP+ZV4O1NXgxYE3RNk0zy5yDw7+yRT4db129tztyWvYR/8jtSIQc6F/obG1dFUVUWok7HQlzgyKC+1N8MweY0+e0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8h5Mi0ZIdS9WO/a5h0i9mgQHP8bo2x0p/fnQyLIM5M=;
 b=ItfKrscbpwIKRkrScvHALM41p7h+0tv2ZBk4XwKQfkDtF5WR0Y8qno6HO4yUmS7dd6glEgpvOCzQHP1Ja07IYwuyMJhXIBD/siGXMVOWVc1g0vb8WfuD1uKNpFce/gaLWunhqXm5hpci30Q0os4gr4OP9H7LIuO3DULldwmrFvvRTgASbuNuyaCJBFIhtSj6tA++uzg3A2v1jTsX7zjxPjvL0tD7lbBcmS1T+cPIJ+R2IodUtFBzmZxoGn2aB9CtW6ywezp2ORHUcQHHx4yavvZYq5GMvAeHY437P2ie5HB0XRI/nCeCS7egTT1roB6O6jKxNdlqoh5C1YZacktdFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7592.namprd11.prod.outlook.com (2603:10b6:806:343::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Thu, 4 May
 2023 12:17:28 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43%7]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 12:17:28 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 2/3] drm/xe: Register drm device prior to gt
 init
Thread-Index: AQHZfnm+AEARILNWmUCuzpkMA26g3K9KA/8AgAADUUA=
Date: Thu, 4 May 2023 12:17:28 +0000
Message-ID: <SJ1PR11MB6204E65B186D7DE33CF2D5C1816D9@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <20230504112020.300498-3-tejas.upadhyay@intel.com>
 <c523cab4-bb09-89b2-0020-1eae9912b768@intel.com>
In-Reply-To: <c523cab4-bb09-89b2-0020-1eae9912b768@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7592:EE_
x-ms-office365-filtering-correlation-id: 7b878fe7-1d7a-4072-8136-08db4c998740
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JdNRh712A8z6KIhJFye5tux02wHUuX1tLlgqIUV5rzshN6Zfm/g/3gxFOe/c9g2e9pNZMJpp2iDMajO15G7Uq4Jl1RKF9LebDTsyxnewhajrh/k+rcSUkoq55l2z/I5YKdZOvGgN1O2o7r573VAeCVhyoEhqQIz9rQ030KwQoESu1iJg36WFWdt3yHgntsFgG5kZze+YvM2G9AD37aRfyJ366lifxbd8p9H2PtEsP3H74RQwKNIQZTAgs1xQ1BXTC7aBKGCMhvBRBqGzkZqKN/uSUZlgYa33JhRIIAUEWzmLdf8EQILkGvY6w0R3nsRdyqIGPsdo8WnRCXs+sQCSsfTVGJ2ottPLCCYeRwfECyeYBl4mV1hF0vk7AZP5ibL/HeuDt61rary/aZnszg30/yx7imUBI21xu352Cnn7jjCeDMmdUYMzfBsGqXS8pPFnx78aWmRY1/FemwDQjpmc55thX8ALWv49B2DEw89/Cv7KKeFLwo79HBYJb2ipTzlRntmUkEMDlL+XOdJVcIpHhtZ/zozlJtzJdwrBQFbSEwfP8qrhVnnHWlgoBuydiGmYjLwqTRlIx2YRElbQXPToeYifQmOgr7Ar54p78TKkzNQsHMpnQNO5+1x3AHoCuo0u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(66556008)(107886003)(478600001)(83380400001)(186003)(66446008)(54906003)(4326008)(64756008)(66476007)(110136005)(9686003)(66946007)(7696005)(76116006)(53546011)(71200400001)(6506007)(316002)(8676002)(8936002)(5660300002)(52536014)(41300700001)(82960400001)(122000001)(38100700002)(38070700005)(55016003)(2906002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDNtZGNQNUhEUjl4WldlL2h1d3NMY1Z0bnk0SDN5WURLZlBrQ3dWZHNjcUov?=
 =?utf-8?B?a2QwVk5IaEZ4ai84cnRoTElVclJsMGJteWNFWHhoaDNhbkh6S2t3OGFxeTMr?=
 =?utf-8?B?eTErT3NXZWpPQ012ZXJZdG1zajhJSGtBV1h6WWp3ZzZncS9jc0I2VmtZbWMy?=
 =?utf-8?B?QTlYOTBnWWpuclNUK1V2Tzd1Nit1VDFXMmNPeS9xcjhZVlpUWDFseXYzV2Ft?=
 =?utf-8?B?RDBRMTdxTjBGRDVSNkdqQUpva05URTJhS2tVcXlpKzlRRWJSSjEvQ0l1MElD?=
 =?utf-8?B?VnFPSC9KWk5MRTBvQmd6TVpUVWkyRkxydVA4U0xFL0N3WGVobW9zWTgvbUVr?=
 =?utf-8?B?Rk9qZ3ZjNmM3UDV0bnl4aEt6SHBsdWU4QXFuMEdjQ3hGc0U2cUc1WDBkd0t5?=
 =?utf-8?B?aW1sU2tvTVpiblpZU2NVeHVWaGRJajBCQUg3NnR1ZmlwVzZHQVU2dGhhQVZt?=
 =?utf-8?B?ZHU0dE9hcFoxZ2d1MVgxb240N3NBQUw0Sm5oQ3ZRc2l4bDBLZ0xMNUhQdUZM?=
 =?utf-8?B?UExBS045MlV3T1dBTVBNWkE5Tzcwb1BZb0V0aURXYTdReUF4am13TEo4UEdU?=
 =?utf-8?B?L0Rqb3pqZ0pWTWl4R2dzR3pGdUxzV1BSbWwxY3V4WlpiYloxZU9JTXM4MEdv?=
 =?utf-8?B?R21wNU5ValREenFrSHV6V2VQNk8xTUkwNUFyY3hVNzI0RVNSYUk3QmlWRHN3?=
 =?utf-8?B?N0cycmw2M3ArM3lWcmV2dEh3d3lsckg4Z3FqMUNuaU9rYm1weDFEUGlnZkU0?=
 =?utf-8?B?WGsrZFlFY1JMWGJVYTIzSmZJNUVkazVJQmpQUUVnWFJKVE0vL0VtOEpreDBh?=
 =?utf-8?B?bzQvRjFGTGY3SzNyRkhMOXJ1UGMvUXN2SFI2S0xVZlRjYzlCeWczK0lLRVh4?=
 =?utf-8?B?SGNIRHprN2pCYTFlN0VvRG1GR3VjNnVRb3RXYzJoQVBWdkVzN2xZOE1YZ1M2?=
 =?utf-8?B?SmZtc1ZQK2xyQm1pU21vckNiN28zMDgxOXhwSmdVVDlydmxLdjZWYzgvbzJL?=
 =?utf-8?B?WGNhQ2Zuelo2R0p2dVZRR1VLZGNNMjc3ekYzK09Jb0tIcW83blQ5bnEzbEdB?=
 =?utf-8?B?bTZPZmFQaFJqS1BwVVlEcmt5T2xzNy9NV2piZ0pIV01BMzJhWEI0QU56TVp2?=
 =?utf-8?B?MmljcHRUMXN6TlNnMEZWTUw3c0l6YkpOOGlMY3dTZkxIVGlYOWRaWFk0akoy?=
 =?utf-8?B?Q2hGWnp1MVdYTk9VUk54UXJkRThJVlNIeFIwVmZueFgrN3E5ald1T2xJU2dY?=
 =?utf-8?B?QUhyMTRvQzNNYUs0Rm5NV00yOVN4ajJGa3JlallqTUJGU012RmppcUlnTnJP?=
 =?utf-8?B?N2ErNjRONFlhVnhmRVhGYldoM0l5cWhzWDNwb3hlYUdkZ2xMK1lQODc1VzA5?=
 =?utf-8?B?MmFpdXArYWFXazNybW10bE1wT2xYVkNqTU1iTTFCZGE2OWl5RlE0OERkbnJR?=
 =?utf-8?B?MmdGcHlWa2dUNjV6NzdiZkJWdU9EZm0wWXh6OGJuWUlUTXlUTmgvMXNzNGh3?=
 =?utf-8?B?S1p3aGx1SDNtNmFGK01jSFJzNnJZK0NRaDhBZE5ybmh0dlBkUXVYb1hHZWps?=
 =?utf-8?B?ZU12dWx5QSszSW0xSkJRdzNiWnZyckVBT0V0MHNzL1VUbk96bzhaRnIvY3k2?=
 =?utf-8?B?VndJR2FXUmFmcXJJbVJpaUorZnJyZWVLd0tXRkhGT2lUOE1jTGorMm1qZUsz?=
 =?utf-8?B?OHJaNkFodU95MWtmTTJxaDl3VjQ1SEFkeXl1YlE5MXpvNy8vN3IwcHZwS3ZN?=
 =?utf-8?B?dmRmZGE4WmFQZklrM0RnSW42aGhDb0l4cmljYXNjNEUxdGtWa251M01PNUgy?=
 =?utf-8?B?VzlwS2JNQW0zcm9TK0Z1RHMvTHV1K2NsODRuTzlvOUVRcmNab0sxWFJ3V2tC?=
 =?utf-8?B?NUlmU0hZOVJjcXJrYjNoaHpiaVMxbDFid20wWHB4ZStNTW45aC9xODFiU2Jw?=
 =?utf-8?B?UzAxWStvS1MyN0p1WGM5Q05YMTRHd2w5VjhEa2gxZkh1ZTc3RW9xUWNKalRz?=
 =?utf-8?B?K2dhWmtkWVdUMk1aSzlmYmYyN24wTE0vL0NmSi8zR0hsUzNrR3JiYy9LaGJJ?=
 =?utf-8?B?enAxSm01K0YvR2gzZkpIeVAzd1pURFZhVEMvRHJ2cjk4bmlBZThVVXp2N2g0?=
 =?utf-8?B?OEJLQjB1djVzMXh1Z2VXMWduVUxZMXF4Y1pZRXhlQVY4VDVvRmRGYVE1M25o?=
 =?utf-8?Q?Tq8qqCqfggAEPKwclyca6QtkYE29z2Hkd7ozHxXbscGb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b878fe7-1d7a-4072-8136-08db4c998740
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 12:17:28.5747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NrFkO4EJB1CrxsG+hSPXZCxRcdIX9eOxXxnj9KPQrCmV7EeNTVWlE0H9l/3JodKJj1kxuX/Ml5uCuNW6lPTJ8UTSqUWIexWejCXldyjo1X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7592
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Register drm device prior to gt
 init
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
Cc: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Siddiqui,
 Ayaz A" <ayaz.siddiqui@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWRkYW1zZXR0eSwgQXJh
dmluZCA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE1h
eSA0LCAyMDIzIDU6MzQgUE0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlA
aW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0
OiBSZTogW0ludGVsLXhlXSBbUEFUQ0ggMi8zXSBkcm0veGU6IFJlZ2lzdGVyIGRybSBkZXZpY2Ug
cHJpb3IgdG8gZ3QgaW5pdA0KPiANCj4gDQo+IA0KPiBPbiAwNC0wNS0yMDIzIDE2OjUwLCBUZWph
cyBVcGFkaHlheSB3cm90ZToNCj4gPiBHVCBpbml0IGNyZWF0ZXMgZmV3IHN5c2ZzIGVudHJpZXMg
dW5kZXIgL3N5cy9jbGFzcy9kcm0gYW5kIG1ha2VzIHVzZQ0KPiA+IG9mIGRybV9jbGFzcyBkZXZp
Y2UgdGh1cyBpdCBuZWVkcyBkcm0gZGV2aWNlIHRvIGJlIHJlZ2lzdGVyZWQgcHJpb3IgdG8NCj4g
PiBndCBpbml0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFz
LnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZS5jIHwgOCArKysrLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2UuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIGlu
ZGV4IDQ1ZDZlNWZmNDdmZC4uYzUzODA5MTRkYTE4DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZS5jDQo+ID4gQEAgLTMwMSw2ICszMDEsMTAgQEAgaW50IHhlX2RldmljZV9wcm9i
ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiAgCWlmIChlcnIpDQo+ID4gIAkJZ290byBlcnJf
aXJxX3NodXRkb3duOw0KPiA+DQo+ID4gKwllcnIgPSBkcm1fZGV2X3JlZ2lzdGVyKCZ4ZS0+ZHJt
LCAwKTsNCj4gSSBkbyBub3QgdGhpbmsgaXQgaXMgbmVjZXNzYXJ5IGFzIHdlIGFyZSBub3QgY3Jl
YXRpbmcgdGhlIGZpbGUgbm9kZSB1bmRlcg0KPiAvc3lzL2NsYXNzL2RybSBidXQgcmF0aGVyIHVu
ZGVyIC9zeXMvYnVzL3BjaS9kZXZpY2VzL0I6RDpGLw0KDQpJZiB3ZSBhcmUgbm90IGNyZWF0aW5n
IGZpbGUgdW5kZXIgL3N5cy9jbGFzcy9kcm0gdGhlbiB5b3UgYXJlIHJpZ2h0LiBTbyB0aGVuIHdo
YXQgc2hvdWxkIGJlIHJpZ2h0IGZvciBzeXNmcywgc2hvdWxkIGl0IGhhdmUgZ3QvZ3Q8Tj4gb3Ig
anVzdCBndDxOPj8NCg0KVGhhbmtzLA0KVGVqYXMgDQo+IA0KPiBUaGFua3MsDQo+IEFyYXZpbmQu
DQo+ID4gKwlpZiAoZXJyKQ0KPiA+ICsJCWdvdG8gZXJyX2lycV9zaHV0ZG93bjsNCj4gPiArDQo+
ID4gIAlmb3JfZWFjaF9ndChndCwgeGUsIGlkKSB7DQo+ID4gIAkJZXJyID0geGVfZ3RfaW5pdChn
dCk7DQo+ID4gIAkJaWYgKGVycikNCj4gPiBAQCAtMzExLDEwICszMTUsNiBAQCBpbnQgeGVfZGV2
aWNlX3Byb2JlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ICAJaWYgKGVycikNCj4gPiAgCQln
b3RvIGVycl9maW5pX2Rpc3BsYXk7DQo+ID4NCj4gPiAtCWVyciA9IGRybV9kZXZfcmVnaXN0ZXIo
JnhlLT5kcm0sIDApOw0KPiA+IC0JaWYgKGVycikNCj4gPiAtCQlnb3RvIGVycl9pcnFfc2h1dGRv
d247DQo+ID4gLQ0KPiA+ICAJeGVfZGlzcGxheV9yZWdpc3Rlcih4ZSk7DQo+ID4NCj4gPiAgCXhl
X2RlYnVnZnNfcmVnaXN0ZXIoeGUpOw0K
