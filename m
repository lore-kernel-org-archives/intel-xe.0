Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A1AC7EE25
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 18:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D195910E0AE;
	Fri,  9 Jun 2023 18:36:31 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07A810E0AE
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686335790; x=1717871790;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=dfU/ntGWtml/xzri41jBilEcj8FZhl5Sgdh9SWZEqh8=;
 b=PvkwfHqxknXq0Tp/yet6SVLRCO/vnxlyv94XjeFvbRAlGnzI+3//NB8l
 HBK4dCQNRkP9TfSN5dNped5ZpMzpTcBuWD6QS2UA4N4s5ANaNYbKYpAvL
 IIpsrdvr7lObMOA8AqpF+iR43dlI5AZlLuKo6x6oWhPNWvL/U4eyIKCrz
 sFiV6StH7C3YXt5Kn/+GR8clyZPmJHcfuUT9a3b8d+Dd09OnYEsvhwqOu
 MUyIdrYvZwfAZER1EDCaNuzPrBioGF98kxMPygIzckm1n7d7DWS9NEXdN
 DHliVIiGRWmIFTEB2M+eBlCyYnUYH25cAw52PrXegsBhG1k35TSzoxd0B w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="347309149"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="347309149"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="687843041"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="687843041"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 09 Jun 2023 11:36:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 11:36:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 11:36:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 11:36:26 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 11:36:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahVmYcji4h/2FUaFngNXAOWWFvRAXnT5NW7byfAWWcL++OnN9hc6DGe3syQvNUY1Gc4p5YIZjaSG0Pg1XvaouHehhAMrp38RuBQh+Irdvu7+JzXIkLLN+8LjI3+B8vBWKBeD+5PryPV//DTYCKdidK6Q4tewgIzB4po3sOP48fcozBUGrOIxh4+i2bCv0FnQyOZhTEFEzT73v+hlaBRyjATba2Ft+csC6ds++66qdKFba0vTLUfaEcVuIesGtEhwgHMup2TCBmnZBzRekmHwmejR46GDkR0KASQ6kK0aWvEarHkECIGrnZEcGUrjRddQ5LlGkturu5LMwlQi0WU64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfU/ntGWtml/xzri41jBilEcj8FZhl5Sgdh9SWZEqh8=;
 b=QAqP3C7l/l0ghqza/m3X6KJPiMT/nryK0RKdpp8Ir7a6c6o8CH0a9l6JRWHZTgZM94d62LgbW87PX6z6d80eXLnK4PE0LybyjXlvN38UBQblBaDxDBRSiR6DsJTMPZ9zkpIMcojk2zvWM3cEObhrL23NFzalJqmNp3TBx5NGn3ZkFvl63ZGfDml7Np0M5Dq6krSEPuLdPHeONzuTbGpWXq/53U5SaEcoONwcDAzjd7BmWOLSTOLLv4T/qPpRh0VgtQAD7vcmPIcy1t642xIwj0yB5m7xNQmDezlgzd/uMILvnK4wdZ6zuz/SwvkvD5vkj7uAt8yi3w88g79FqHsYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SN7PR11MB6850.namprd11.prod.outlook.com (2603:10b6:806:2a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Fri, 9 Jun
 2023 18:36:26 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6455.034; Fri, 9 Jun 2023
 18:36:26 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/3] drm/xe: Handle unmapped userptr in
 analyze VM
Thread-Index: AQHZmv/t5zm2uKfq7UqEIil0YJSFYK+CzJKA
Date: Fri, 9 Jun 2023 18:36:26 +0000
Message-ID: <a4cebd962bf714b43ee92302ac8f95dca9988491.camel@intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
 <20230609182627.143150-2-matthew.brost@intel.com>
In-Reply-To: <20230609182627.143150-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SN7PR11MB6850:EE_
x-ms-office365-filtering-correlation-id: 9f2f27c0-8898-4dea-876d-08db69186eba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fGLYnKU/3wY2Op9ZHE+hurJ1p05j5nhM/rkuIX6ef/I/aoa+40WbibJKJzO/wMohkuEPeRPBcHGUY+UqWB0T84X8YAKmqebnOFimmFftsp2pO6sNUJ8rlI+MUzXzddSHHeznoWrQzVEixFY8o5sZ5KZaoN7v7KmKKf7dkmm+EVKGzVit1Y6RlfU2kffTSbdPOpQPQ1KO8kqEco+WjqezBLhkQHFym9UVw/PwsyYbQ9QNN0MpLKuGjPJhIOq77UDIPX3G9B4sxu+ODrvGu8vwTFCn2s/KQ7jist/PSSLKDk6s9kKb7ky++0B0YBXoBmzD/Mri8vObEoovnjmWy2sHCJpIQYHe64A020SfP+gV0jADru/YdnU/3h4SJ0EAXZErN6McK0yWH19HOr661BCj7cQPqYR75X8+itO+pddynx5tbMaWOcwyOwHIlci7cegaQ0sPa/F6da/1zQv07zaatzunGHMKXlWLnnDULH4UP8w/ohZfWhQFJU0N63JzX15eRbRnDTkIK6U5qkTLd8u/TJ/eODU0XaG89s3OQKykjDk73yABUPtrcnQXQnIrHaEDYbWyd1vYJ37uCI+9hPgWkjr7zwDcrSWLZZfQRzTuP5p3C8NAyXw3MkPK+nV0G4HD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199021)(4744005)(91956017)(8936002)(66476007)(8676002)(2906002)(76116006)(66946007)(66556008)(66446008)(64756008)(41300700001)(5660300002)(478600001)(6636002)(6486002)(110136005)(316002)(71200400001)(6506007)(26005)(186003)(6512007)(2616005)(122000001)(82960400001)(83380400001)(36756003)(38100700002)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STRwWFR1TDVZMjNLQ21Eb1NhNmJPQXFZK0dWYnJPSE45WUp1R0xQa3dTL1Q0?=
 =?utf-8?B?WG91ZCsycTJEb3FMVEN6WlVSYVVCZ0dTdjRLdDFjYXlHU1VSUXNxSGsxRWla?=
 =?utf-8?B?ZW5uSFRZZ0dtRXY1SGdyYlVWNXlQYWMyaDVoVzJVWjVlMHN3WllJTDhrTGZ5?=
 =?utf-8?B?MmxsekhyV3Q3OFpYR0lEUTUvcnVZcUpKNnRFaXpLRjE1SlVqQkhEOHRwVk5a?=
 =?utf-8?B?U2lUNmRqR21IaHlRQmVSTEovdFI0WVZLTDdkbVM2UldQQ3puNGxnWHkyZXFT?=
 =?utf-8?B?NldIWEx0NmMxU2l6RzV5eDNjRHZ1cVNBSkhzWS96OWNpR0tQSUppNWhjSW5P?=
 =?utf-8?B?RzlYdkNZY3JGR2hmN2UzeVdLbEhWckVZWHZwT0huRVQvTE1ubTQ4eGVRajJk?=
 =?utf-8?B?V1hlNDJkMFdMb3NzbVFRUkhXbGhRUVBzaHJOaTJpWkE0OXk4bHFJaC9iMzM3?=
 =?utf-8?B?RS8yU1EwR1NXY043Nlloa3BMV3NRUWUva2oyb2FmZFc3Vjd6TXY3V2dFNVYv?=
 =?utf-8?B?RW9CSlBLMkRqM3BodnFGZ1VYSXBsZ052MzhHd3J6NEFhblZtUVNJSzdSK0lm?=
 =?utf-8?B?d1BYOWhFMEd3bE1KMG9PekI1dndRSHVuQnoxa2Y2cjY2T25UU3hMNDdoVjZX?=
 =?utf-8?B?YzdnYzlZa3hYREpIbjhTMzRoelRQTnE5OEQ1bE1EM2RzN3A3NTFPQlZtbzhj?=
 =?utf-8?B?dERPbDE2WFVoVmgxWjlYNDliaXh5QjVwNlZCNCtibm91TjF2L3dLUnhxZnl3?=
 =?utf-8?B?SDBGTzE2TVh4WVd6T3VVdHZUckc0S3lGQktrZm93QmFEUDF3U2Zoa1N5MU9G?=
 =?utf-8?B?RXFpQjdhV0J0TkRZT2s4K3Uxc0RhWnhReUgxNWJnTEh6b2xZdGRlYUFTZFJK?=
 =?utf-8?B?b0dwM3lnaFZpTkExc21UbXBpaHgwRUw2bm1jZjFub21YU2VYOFplN3lJQkIy?=
 =?utf-8?B?MXlFNUF6UXpDMnNzKzhBUjZPV0IzZE5RaE9IbWhZOVc3dXd1cU1kNDBRMENz?=
 =?utf-8?B?bit5aGZ0L1dKQUNrTFZoTXkrSlF2YmlOak5aWmJ5QWJvdndMdXNLdTlhRk1r?=
 =?utf-8?B?UVUwZUQ5NzBVT0VqOGZYdyt4MmxDSTVFdlUwbHF4M2lhYjRORDZ2NW51ditk?=
 =?utf-8?B?MHFkaGhNZVN4ZEl0NjlBK2lBN0VSUDZOZ2lqaXBpbVFBTDVsNGxGQ1NYVGxs?=
 =?utf-8?B?YnpBRExpdEx3OXhYQTkxTStIMFdCTGFlQ3RxdTBSNVNpdzRvcU5Xd080NmR4?=
 =?utf-8?B?SWdkaHM3Sndtdm0rL0czNkVRRUlBWSt6OFNWYXBRTTNRanJ0M3crQUp0c2kz?=
 =?utf-8?B?NkFaYkEwZzFrQTVlazE1SmFGNXgvcmtaRTVkRkZHZnZSbVhmaUcwTW9SdGhD?=
 =?utf-8?B?ZnlrVExjSU1RTEgycGVCWFIxNVl5bmNrR3FieUN4bkJsN1FhNnhzN05Vem5x?=
 =?utf-8?B?YmhoMUE3SmFBekR3YThLWmQ1YXNoMkI5Zmp0NGQzNWp6UFFTdlFHQ29kS3Jz?=
 =?utf-8?B?UEM1RUZnTnRGenFqbnZhUGtJUU1qZVdVT09GaVV4SmE0dXdSTlMvM0NVVENi?=
 =?utf-8?B?ekcwR1U4M0h1U2l2S24zRjk3S2daRFZ6R3dZTXJ5dkpreWMxM3BpdmdyMGxJ?=
 =?utf-8?B?TzlHeCtsNWp5clVrckxJenpqbkFydmlSdmpWcHNab2hJdThhYmVWcGI1YnY0?=
 =?utf-8?B?dlFVTlhDQ0VpTlE5UkRWSFE1bXBKbkErdW1RMTZ4dFo3WkExdTA2ODUxSWRI?=
 =?utf-8?B?aDBhL3cwYm1VMllNaFJHamJtcDdVRzlLbTdWMmVQWTdCMWdkK0RVcktsSTlh?=
 =?utf-8?B?eHp6WFhCbjVhZklqU1RWTStEMUhaYVAyT0VKb0twV1RteE0yekxIT09TMkJO?=
 =?utf-8?B?ZWFRNmM1aW0zdEtMMVJUTW9MdXdGTzJ3cld5MzJDU2REZjl6N3gwMUhxODUv?=
 =?utf-8?B?c2FzK3UzWjZaTUJzdzUxNDY3SloxVFFyTk5iS1Iwb0JCSktqaWlBWTRETkVF?=
 =?utf-8?B?Q0liK1hTS0lCenhsMFJZWHQyZlNadjRvQndSUlJkNnlXekRZQy9EZGpnTSt4?=
 =?utf-8?B?aE1ZeGJvV2hQZFFyakpJWUh1MkthZVoxT3ErUkloSmU5dnh6cElGYzlQaUw5?=
 =?utf-8?Q?JP6s4g6vwV2ULBrnxE2rcFQB4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2455A2849831444FBED81795381F46B6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2f27c0-8898-4dea-876d-08db69186eba
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 18:36:26.0508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AEXpipfPPxd6gbj5B4x+mX52IFf5m5aALlWMas1VUrrRprCyLha8Q38z7Itmxnt2APmqK9gS66I0WDzySbnVNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6850
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Handle unmapped userptr in
 analyze VM
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

T24gRnJpLCAyMDIzLTA2LTA5IGF0IDExOjI2IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBBIGNvcm5lciBleGlzdHMgd2hlcmUgYSB1c2VycHRyIG1heSBoYXZlIG5vIG1hcHBpbmcgd2hl
biBhbmFseXplIFZNIGlzDQo+IGNhbGxlZCwgaGFuZGxlIHRoaXMgY2FzZS4NCg0KUmV2aWV3ZWQt
Ynk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyB8IDEwICsrKysrKystLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm0uYw0KPiBpbmRleCBkMWMzODBhZDdmNmIuLmU0MzExYzQ4Y2M1NCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3ZtLmMNCj4gQEAgLTM0NTMsOSArMzQ1MywxMyBAQCBpbnQgeGVfYW5hbHl6ZV92bShz
dHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIHN0cnVjdCB4ZV92bSAqdm0sIGludCBndF9pZCkNCj4gIAkJ
aWYgKGlzX3VzZXJwdHIpIHsNCj4gIAkJCXN0cnVjdCB4ZV9yZXNfY3Vyc29yIGN1cjsNCj4gIA0K
PiAtCQkJeGVfcmVzX2ZpcnN0X3NnKHZtYS0+dXNlcnB0ci5zZywgMCwgWEVfUEFHRV9TSVpFLA0K
PiAtCQkJCQkmY3VyKTsNCj4gLQkJCWFkZHIgPSB4ZV9yZXNfZG1hKCZjdXIpOw0KPiArCQkJaWYg
KHZtYS0+dXNlcnB0ci5zZykgew0KPiArCQkJCXhlX3Jlc19maXJzdF9zZyh2bWEtPnVzZXJwdHIu
c2csIDAsIFhFX1BBR0VfU0laRSwNCj4gKwkJCQkJCSZjdXIpOw0KPiArCQkJCWFkZHIgPSB4ZV9y
ZXNfZG1hKCZjdXIpOw0KPiArCQkJfSBlbHNlIHsNCj4gKwkJCQlhZGRyID0gMDsNCj4gKwkJCX0N
Cj4gIAkJfSBlbHNlIHsNCj4gIAkJCWFkZHIgPSBfX3hlX2JvX2FkZHIodm1hLT5ibywgMCwgWEVf
UEFHRV9TSVpFLCAmaXNfdnJhbSk7DQo+ICAJCX0NCg0K
