Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93A1C77B72
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 20:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF35C10E202;
	Fri, 14 Apr 2023 20:59:02 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2380410E202
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 20:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681505940; x=1713041940;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=VdIhJBD5uNoYLQblDnh4fzdzEv4UEd9xMPBT8RvJtk0=;
 b=J8ZiCCABWBKqo4X32PaE5Zm6QmDhUhnsRDHxMiTQNNYcss1XUvN2XkHF
 UcqOpo1CJigNBxEuTBpxFgHIKCgV3rSuTBecTcfSm40vDxGiPd7ddVQtw
 bF0A5hpnvwH2Y3d6P/nUqVre7IdCkxc/ZXcI1fPqANLBi/AL8XjGxIyM/
 T5mFmwG8L6kggjTbbxvxRmYxTWciItYYDCzlrRz9jm4bTBaCdwIpt//Qh
 xv6yxR9nl5y0HKoIAvE/T55lwf5STDOdOgB8O6IEIArjtU8HnUwfJl6f0
 XpHo00xXWq4Eowr9BT7+gtfDufYmrTBU9tlJSrGApRLAJdU6zwrgKDby3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="347295893"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="347295893"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 13:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="759238437"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="759238437"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 14 Apr 2023 13:58:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 13:58:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 13:58:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 13:58:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHlhlqVYEmgJIw+Cw/0IvRMSsnRMnZIu+aOKEhW9xWUoJkV16vapr8FlroVawOv4AWi2DMBUx6ePN0WyyH2fKdvYG6EU9K5c0ABs5lDjYF40HSUajrWt9Ifl3w4cEp8CMdmUuI3aBlgosHARCwfMcG6MjkEbQGv9PTmxpWuGbmrRDb5vI7PEUkWaGlFppQTiwIkVaVs6Yb+GU7Exj2EUdUbqBcmi5gkwqmG9wDXUUVHxwOCgdhBV1s9KE4Lqn37N4mBXpqk6kOHjqDPwkiOVdqBw7bh3vQRxac00HmMRCfwllexVm6VYgdEjF4YwLApN/Pia+vAxfMmA2rypk54MRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdIhJBD5uNoYLQblDnh4fzdzEv4UEd9xMPBT8RvJtk0=;
 b=Byc36bedqRz9V+5ti/fAETl2XQeUSu8hpYnnKwvK9MpKlx+INFiOssS1yUF86v0w1p5/vHWFpYc/tTw3rTWsxDaIpmrA7LzcWk9Aq3fNVoBRDEXN0gwpiNRbUsQ/gog7DgEfTV8Jzo5bPcqeI8zHZZEYxGBF4Qj3SxkfQfl8i79FgvZDxe9xJ2mShA56pH7R8w9eQjIHV+I10la4/ZgqtcJ18lRnx0FuqSDPkhX/MgrFiA3tnYgeT+TS2MMEQVbk7AyehjLm7ju3QK3ulXZ7RP+5cfpoDPOf6FiYYyEeuxIZgCbzXyCyrN8CZjGe2k7Q4L+PyB4uDiH1cCx9DyIhmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Fri, 14 Apr
 2023 20:58:55 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 20:58:54 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Atwood, Matthew S" <matthew.s.atwood@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/: add gt tuning for indirect state
Thread-Index: AQHZbwgeX6oYt/8wO0KSDlt2d97+O68rScSA
Date: Fri, 14 Apr 2023 20:58:54 +0000
Message-ID: <7bec69139c30e26f2d35e85a0a2ffb1e86f2d0f7.camel@intel.com>
References: <20230414193355.143875-1-matthew.s.atwood@intel.com>
In-Reply-To: <20230414193355.143875-1-matthew.s.atwood@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB7632:EE_
x-ms-office365-filtering-correlation-id: fd59bef6-bb9f-4843-56e2-08db3d2b0ef9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4/MaJMf2hTKlALxu1GyEkt8x8yyWNZ2NEjk0z7nq8Hq3S0o2T3MpHQnVK6QCGk43GTHL7u8kVK+FKrc9I6oN1k7339Fbt6FllZxwy7lfvzFGG4Lw+096BTp056J0FVxlLdVGULpjOkp3A1BwuODmPAg7peMYxCsxrxZXTeOooGUsUiUcoNA2V0EUaSHnOgnULQULHXm+y5cBID4RJ+iJcNZCFqTX5Uu42DIaOpF1Jm+0aHrJosmAlHSL4rJR8SZy/G5bLsmXPhc8Q42RNJVZFW1vZaoTrS+M7Iz3PIa9D8r1I9km7ppMSWwBmyp8OSR0kqzAvmxT2OVoJ0TLv0KH9jbBY9/kVHAQx/xi2l6DH5D3GEhb1Lnfzr0g2StPWpsefCt5WRnwtt9/9L/HlIitlhdVVbsqNrBqNJG6O9+yMX5Q3kY9PEVaX+SOpNwgs2Jzis0W3VmP50dWACyn21ysk/zo2XfsmM7ceS0b9m5GYabWIsIQp7IxoZyXql8hye7k+F21tKg43A0RMomqh1+A+RPM/Zy19L7um6638KrRtu21WscT5FwshzN8GeXYiaXW1qkw0JcUVSNOymYxeoTRo7cWEeX3eX+Gx3AmacKeau6rTPQiSZQFdSGLk458G3UH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(66556008)(478600001)(91956017)(66446008)(6636002)(66476007)(64756008)(66946007)(76116006)(316002)(41300700001)(6486002)(110136005)(86362001)(36756003)(2616005)(26005)(6512007)(71200400001)(6506007)(83380400001)(2906002)(8936002)(5660300002)(38070700005)(38100700002)(122000001)(82960400001)(8676002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1h1a09remRScWVNTW5xelFlblE1Y1YyVmlzdU1ScjdCNzAxY0N2bEJ1VzJ0?=
 =?utf-8?B?cnBGWFRuUW1weUYyeVpRR0E5ZEhtbGFGM1BMVGhtSDBWT1BJVFBtbE11NkUv?=
 =?utf-8?B?ZUV6c1JhWHlLYkRmTWpSb1ExR3R0cmFxdFp6alNvQ3dvb0I1Vzk2TGF6dUx1?=
 =?utf-8?B?MEFMUWdmcnkyQUR5cVNOOHkrbXpqd3p3aGFPKy9pdFhsQTh4cTBsclhvQyt3?=
 =?utf-8?B?d04xVkw3SGhyUmlCZElTV1FQbncrWXlXUkFaSW00UVI4c3dOTUR4dGp0eHYz?=
 =?utf-8?B?czBGUEZNWXkrZGd5Y1JRczIvMEkyUnB2bjVHcmVEWVZTaXp0MSs3NXhWejdY?=
 =?utf-8?B?ZVNQU2lDaDZaQWVNLzhKTTUycHNGZW1qb3J5OTd0T1ZUVHE2a1dNM2RRT2s0?=
 =?utf-8?B?SHhaUys5Ry80QmY3TE9zbkp2MEtLQnluVWpPMnJiSEFuV3cvbkVQZUtNM1RZ?=
 =?utf-8?B?Z2tlYStOQlJ3bmxDTFJMbFhybi9zVExLT25aVHo0UHpDMCsxRGQ0dml6ZDM2?=
 =?utf-8?B?QTZQQ1FHblVRdFFrUXJZSnJjTkhmcUxwODVpNmpFcXpmRTlOZTVTNDk3Rlho?=
 =?utf-8?B?QnM4MDJOVmdqRDhTcythMU5wVlNVeEVZYVRya21qcmZIS08vOHFRaVh2L2oy?=
 =?utf-8?B?OTAwRExUL0s4ZXc4Qzl1U0VIUjhKcjRGOXRIcXZiSUY2QnZ1MElpUm9tWlpC?=
 =?utf-8?B?Yi96OWIvcFMzS0piWHFnR04xbk9ORVA1S21OSDZ6ME1FNllSSlRBNjdma1I5?=
 =?utf-8?B?bERqTlpOOTVsTHFlTCtYdXJmbXUrbzk0V2J3a1gwUVh3RG5sc25OUmlQeFMz?=
 =?utf-8?B?V0FzblZrNFpMQmUvSmlVTWZzaTV3VFQ3eW9sc1lqVGxZanBaMVI2cXdoYThP?=
 =?utf-8?B?QXJBL3lkNFJRQjVJYWd2a1JnNVZXaDVjc1Q3K0hnZFhpWEZVZktXR1NHN28y?=
 =?utf-8?B?NlZZTDhvUDhNNHh5dmNFVHRXZm1aWHRDazk1KzhBbXREdXA0RzFpTDVVNW9P?=
 =?utf-8?B?cTVCWk5pYllycUtyTTJ4QlBQUGIyMGNPam5SRVdDRDB3OE1lTFowNWNETy9I?=
 =?utf-8?B?YjVuc3UybU5BSkZ0KzVvT2tDNzlCbU5tMnFINkRFQmp3S0hkc1hRaGViQlJ5?=
 =?utf-8?B?OTk5Q3Z4OG82SXNnZjkrY21SakFtalR4QURTUnBScEpqRENSdDYrVTlqUmw2?=
 =?utf-8?B?RURLS2VvUUVrQW5SVEwyTDg0bGZkVHhXZ3FSL2xUSU83SWRIV24wUXZRMk9F?=
 =?utf-8?B?cFA4SWdDQk5FbXA1TmwxWUtuRXUxanE5WEhsSlFXSEx3MmpWSmhvdjF1cThG?=
 =?utf-8?B?NmNFM0pobnZXOGdPOVZ3OEVMQ2IwS3UxK2Nrd1pWN0FvNktSRXJTUy9qRDZW?=
 =?utf-8?B?cDFZWlNFbG1VZllJS1FaVk1jeFJieXdpWHU2RTZHTWxmb04xdU9tNS8rcWdr?=
 =?utf-8?B?aXBrYWpnRU04YW1HWjBSUEUwQzVCYjZWeE9FKzM0RkhNaE5DQ2oyazhzWmI3?=
 =?utf-8?B?QWJWaTlTV0M2VlowTXAvektsL29CNkJnc1ZVbXZFekNFVVB1UDBOeHdGTFh1?=
 =?utf-8?B?NjFhaTZpd3puN3BkSTIzT1VhUkk3WUZQVjhtSThUQzcrOVlIUXpmZzZrZmJa?=
 =?utf-8?B?T0J5WDNmTU55RHNyVVN5WndpMXYvRHk5d0dwQ1NkMWhyd1ZqeVVMazFWZkVo?=
 =?utf-8?B?MmdFc0tBN0lHTitUUmh2Vk9PL2haUmZkT0ZFUEZyMUZSTTNIOFAxTEhucEth?=
 =?utf-8?B?QlRSQU4vcjl6djhpOE1UYnlSQkpGL3ZyYlB0WExJOHF2bytpR3pDOEVORnF6?=
 =?utf-8?B?YzFEcTI5Ym1QbjlUM05rYWZ1Skxnd21zNWRjTitXbjdqaWxSdjFLd0orNW9L?=
 =?utf-8?B?ejBCd0ljVFNZbXJyUk5YNFA1Tk5CTE9ubi9OTTFLZ25TQUlnc1hXOVdoNzBU?=
 =?utf-8?B?SHF3SFh3Z3RpM2JjZ25oOW1GbG9ybHlKRmlXanZGNkVtb2l4SGNoclN0SFFL?=
 =?utf-8?B?VEFKa3lIcDZEcktaUUdUR2V2L2RIUlpGL0E4bXpCZDVuczl4dEw2TUI0VUNa?=
 =?utf-8?B?NXltd29QSXpRbndBRis1SXpKUVRiSTR1L0Z5TWk2ZDE0V3dRREpvY1lDL3J2?=
 =?utf-8?Q?vfUVlBrOFrAc8HRBKwHsZvl5/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F17264AC8274F04F87414B63A58B3C2E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd59bef6-bb9f-4843-56e2-08db3d2b0ef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 20:58:54.6836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rdU83POR/on7vV1Cf2aHG0S7zIoHvPQLkHwVa7PiX7buLKveaJIxJ5KOLIW/kCmaX8VOMK0jrwIv8oOAZPQc4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/: add gt tuning for indirect state
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

T24gRnJpLCAyMDIzLTA0LTE0IGF0IDEyOjMzIC0wNzAwLCBNYXR0IEF0d29vZCB3cm90ZToNCj4g
Rm9yY2UgaW5kaXJlY3Qgc3RhdGUgc2FtcGxlciBkYXRhIHRvIG9ubHkgYmUgaW4gdGhlIGR5bmFt
aWMgc3RhdGUgcG9vbCwNCj4gd2hpY2ggaXMgbW9yZSBjb252aWVuZW50IGZvciBVTUQuIEJlaGF2
aW9yIGNoYW5nZSBtaXJyb3JzIHdpbmRvd3MNCj4gYmVoYXZpb3IuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBNYXR0IEF0d29vZCA8bWF0dGhldy5zLmF0d29vZEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oIHwgMSArDQo+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfdHVuaW5nLmMgICAgICAgfCA1ICsrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9y
ZWdzL3hlX2d0X3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2d0X3JlZ3MuaA0K
PiBpbmRleCBmMTc0NzU4ZDgzMDcuLmI3MzI0YWVkZTZiNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS9yZWdzL3hlX2d0X3JlZ3MuaA0KPiBAQCAtMjg2LDYgKzI4Niw3IEBADQo+ICAjZGVmaW5lICAg
RU5BQkxFX1NNQUxMUEwJCQlSRUdfQklUKDE1KQ0KPiAgI2RlZmluZSAgIFNDX0RJU0FCTEVfUE9X
RVJfT1BUSU1JWkFUSU9OX0VCQglSRUdfQklUKDkpDQo+ICAjZGVmaW5lICAgR0VOMTFfU0FNUExF
Ul9FTkFCTEVfSEVBRExFU1NfTVNHCVJFR19CSVQoNSkNCj4gKyNkZWZpbmUgICBJTkRJUkVDVF9T
VEFURV9CQVNFX0FERFJfT1ZFUlJJREUJUkVHX0JJVCgwKQ0KPiAgDQo+ICAjZGVmaW5lIEdFTjlf
SEFMRl9TTElDRV9DSElDS0VONwkJTUNSX1JFRygweGUxOTQpDQo+ICAjZGVmaW5lICAgREcyX0RJ
U0FCTEVfUk9VTkRfRU5BQkxFX0FMTE9XX0ZPUl9TU0xBCVJFR19CSVQoMTUpDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHVuaW5nLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdHVuaW5nLmMNCj4gaW5kZXggMjdjZjEzMzBmYWNkLi41YWJlZjQ1YTEwZmMgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dW5pbmcuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdHVuaW5nLmMNCj4gQEAgLTI2LDYgKzI2LDExIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgeGVfcnRwX2VudHJ5IGd0X3R1bmluZ3NbXSA9IHsNCj4gIAkgIFhFX1JUUF9SVUxFUyhQ
TEFURk9STShERzIpKSwNCj4gIAkgIFhFX1JUUF9BQ1RJT05TKFNFVChYRUhQX1NRQ00sIEVOXzMy
Ql9BQ0NFU1MpKQ0KPiAgCX0sDQo+ICsJeyBYRV9SVFBfTkFNRSgiVHVuaW5nOiBTZXQgSW5kaXJl
Y3QgU3RhdGUgT3ZlcnJpZGUiKSwNCj4gKwkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9O
X1JBTkdFKDEyMDAsIC0xKSksDQoNCmVuZCB2ZXJzaW9uIHNob3VsZCBiZSBYRV9SVFBfRU5EX1ZF
UlNJT05fVU5ERUZJTkVEDQoNCj4gKwkgIFhFX1JUUF9BQ1RJT05TKFNFVChHRU4xMF9TQU1QTEVS
X01PREUsIElORElSRUNUX1NUQVRFX0JBU0VfQUREUl9PVkVSUklERSwNCj4gKwkJCSAgICAgWEVf
UlRQX0FDVElPTl9GTEFHKE1BU0tFRF9SRUcpKSkNCj4gKwl9LA0KPiAgCXt9DQo+ICB9Ow0KPiAg
DQoNCg==
