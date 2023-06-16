Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09746EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 21:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8527510E00D;
	Fri, 16 Jun 2023 21:49:40 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710C110E00D
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 21:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686952178; x=1718488178;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YqgNVprUAe4TdnXYAmyP+zR3EFnn6ba9EtztJqknKCA=;
 b=grvM+RlxntaiNw17KlJaqqzzxb7RYie1dnuPtKh889or3GHgRf9DTseY
 k4p6dhn92nBHE1JwukbcsJvL5PhuHEunEFO8bYeYeJuYKbOcXtSFIE5z4
 7H5cwgWIyR5TwbCR4Y27XWePZXDrsMO0ZHVFScnvE9w+aNT4zfF20Tzkz
 ujtaBh+1vGLPuDna04MzUKRbfzKXreSsv03gaviFVFT5suKnXn0idW5aG
 O/Ug4/4uMTS1Lwgv1EPCOW7hpM1RaI/AN+lKtVLRXIt4ZmI2rRV5EIN7m
 ZmspAAqEBQKDSqpQLQsxfg9VdJ/8/sTsjKB4AwEbwCSYGnoBkCFC/RztX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="362734629"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="362734629"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 14:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="959760624"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="959760624"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 16 Jun 2023 14:49:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 14:49:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 14:49:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 14:49:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DX4//eaR7PnFHyJfQAvGHf3NED1sTICiJfXjgNtFE1f52zJG6LzPwYQ7ULvXERL6vf7nhjhmSI/wOkZ1wJXttlTBDLzS2o1v2h6a8UPdubuoJv0g2/S/a78zgAsz3rgRAz5LWmcWqi3nw+mlqXBys6jJgknZtVYEcrbAo9zS1DUf8V2znBgyF00WBxqN4za2KWh9gyuO1d9qbu9libAVsyq/qQhV8WCTMQq87xGeLa/KbVMUUGs1sZnSu+t//3jXQJll3q8+q+hrQjRrGvvJDKs+SE0OclIuVDKckxlbYgDmj7WyQaXuHC6v0Y6OcbxtDODNNcBo6iDolh8+/VePkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqgNVprUAe4TdnXYAmyP+zR3EFnn6ba9EtztJqknKCA=;
 b=ENdy0JBoNL6RSo+xBZVx7nEMh0VvB1Bm+gdEFrXJmSqra0zbyhL20zcvGV5LUrbPoWp/+jFA6zWIsGh6vZdCIZX0hTB/Kl1yp5wRtsOR1CMEwNxmOru4lkS+J41TFFgMjB/gxINx0MHNldcay5wI0pgWcp0g1IWNahmek7qCuh6VqjsJsEyAFcmVOAgaD9BK5IEVfNLB2PgZ0W5LSb4S2H7MkVnvG2xbL2/l3hmjKzhCf6MtYuArlPFAqqvCqH0zM3X1C1onNrZgZrlAKisV2a8yw2bu2d1JCHpizoqNKrq3MNK74RDwtq4+qeCjJUZ5vYCeumikaa7yfQ3YtvmGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 16 Jun
 2023 21:49:34 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6500.025; Fri, 16 Jun 2023
 21:49:34 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Shankar, 
 Uma" <uma.shankar@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/display: Append dma_buf fences to
 framebuffer fences
Thread-Index: AQHZmLRORcclCI4Hd0OGuV4fBVnpBK+LwrKAgAHJs4CAAHsQAA==
Date: Fri, 16 Jun 2023 21:49:33 +0000
Message-ID: <81ad8833afb5ca95351276f90b7a6a9982e56190.camel@intel.com>
References: <20230606201959.94128-1-jose.souza@intel.com>
 <DM4PR11MB6360A0F1846E78E51FE0A2D0F45BA@DM4PR11MB6360.namprd11.prod.outlook.com>
 <ZIxxsWUVFvH7_OKr@intel.com>
In-Reply-To: <ZIxxsWUVFvH7_OKr@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB7313:EE_
x-ms-office365-filtering-correlation-id: b32e0e1a-9f51-4416-d9d7-08db6eb3926a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 21PNRA3sS+5iHRBlelGFr70T7gOV1YbqAsy465En2gFg7AjAUzHIeXAtos6FRGTa8kjby4+V+a1LOZykCecBfkFUmbUOmZwoKeQ37gg4Znp/1++xAeOP7O5ReKm8Zb2wggvC/m+Vd9eOYBB5mcjRsBW5Xakq3Kiq4bHA3zs8nRcPsI+OHEIiPnllO7gIKgD6JF3T7YBQ/TIONNbMQ4VXwBnTQ0v7YCkFBJoFABaMDNGIaGPu3qXEqWPGVqVrVq/e2ThM2Lhe0qI5sQ0aweY8hrM3XxnDntUSPl8bIAvLh719eCwPmq+ibcm0gIezb4jjvU/NMbTjcajEWa4Yu4dwod9xVP8hFvz5ZUTwyFCPsQs70kK/gyLYEgUTSTFsKj33aBQquMEOIBL2n/uEZNcRurDD4JuDMVah+iwYUA6EYKMuWGWjP2LNrYkC263u+6TQniRvJGD4w1AGAxY2X6HFpAHFg/LwvpMln+yb/K/kObETlF+4oyQUOcr1IxJXbYkgY6XeUTdW1dh0oQOvwJfkCVtXGa9Mv56J7tZEj0IaBzp0Zku9TzrtREHwXI5fvwYH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(5660300002)(66556008)(2906002)(66946007)(8676002)(64756008)(76116006)(8936002)(66446008)(91956017)(66476007)(110136005)(41300700001)(966005)(6486002)(71200400001)(4326008)(26005)(6506007)(6512007)(186003)(53546011)(316002)(6636002)(82960400001)(83380400001)(38100700002)(66574015)(2616005)(478600001)(86362001)(38070700005)(36756003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cy80aDdFTSsraWdQY0ZmdWtLaWJWNGxDWG01SlBlbmZMR0k3VDI4YTlFb0FX?=
 =?utf-8?B?TVRXanhiUlRPUnRJOFVobWZ0V1kxQ2ZwK2h2MW1hZ2UwSSttRnBoTWVSSU4y?=
 =?utf-8?B?YklzV0hkS0lDZzJPZjRCWFg5VXRydW9NM1JWTWI1c2p5RmIydGlEb0Vuck1z?=
 =?utf-8?B?d3lrTjU5U3BjcStoamRBZ09uMXJXeW5MbTFYWDEzdXdYSlhibnBNMFB0V3Ja?=
 =?utf-8?B?TUQ3SEVyVUhscG9DdGlndFZNWU40VnRJRk0rcEtsaGJ0YUptZHc1OGFjS1NG?=
 =?utf-8?B?ZnpJUHJ5NDREQVJLcGw1VklSa0tNcFp6UC9xK0ZSSXlGWERtWlp2TXVwZXFB?=
 =?utf-8?B?Yi8wL1puYTR1NWNFTktBcWxaSWc5UFNOczRLWk0vRE1qVFo4N2V5TGtjdUNo?=
 =?utf-8?B?NjNJZ2h5cC84a2dvSlQxQkZOVnVvWVh2d1J3aWtGQ3pZQkNUKzREZlBYZWZ5?=
 =?utf-8?B?V2pUR200SC95ZkoycDZ5Vi9pRUhSYjFPUzVLMm9aeVNndnZpbnBzcFBNRVVv?=
 =?utf-8?B?eTIzeERTc0FhZ0pnNnpwZDhOY2VFWVhweEdKeTRsQXgrY0VuWEM1TDdaMWpX?=
 =?utf-8?B?VGhYNysyT0FDS0R0M3ZkcVM0L2t2b25MekE1VzJGWVQwUXQ2N2FCZDNIcUMy?=
 =?utf-8?B?U0lFZ3htTm1TaHArMjJmT1lVeWI3QS9Nd1cyUENWa2hKSzJyK00vMDl4T1Zn?=
 =?utf-8?B?MlNQbndEZ2pPUFhWaU9scStUNy9BbDh2aGQxM2RNUXFnN0RwalR5UmdlQ0Vu?=
 =?utf-8?B?RUtzRWFoRTNVNWpmVFNVRFdhdlJIUTVoSkVhZEt0djR2YUxLVDA2dlNhYStM?=
 =?utf-8?B?UkozREhnK0dDWFJLV0hhaWF4Z0UxQTRUWk00YzVoMGhRVWZ4eVk4eTNaMnBn?=
 =?utf-8?B?aWRjNlZYeGlvZWZTampROVVqUHM5MUtvYWw0RTJhTXlTYzNtK25zbHdobnNQ?=
 =?utf-8?B?ZkVjamppcTZVZmQvRlViblpHSFJneVZHSkxDWko2S25EemNkd0V6LzFKck1h?=
 =?utf-8?B?a2JFeTZrZTZkdE41dU80TUpRVmFNL2VQb1lnQW1VMnBFWUJoVUN6bkE3SGVm?=
 =?utf-8?B?Z3l1MEI3YlM2Ly9VeXV1YzNOUjJjT2tGUWVlbnRSR2hpaEJRU2ZVT2R0VTFP?=
 =?utf-8?B?bzloMmtiRkFKVU1wL2N4cTBoMmMxSWIydU02TWF6MEk2R0J5MW5rN0FDY0lp?=
 =?utf-8?B?Vi95Tk83SnNwRjBwWTNBRVV5Ty9LQXFoUVVveHh2WmdZdndQbnlNcDFxS3VG?=
 =?utf-8?B?TTZjNFpFc0RGOWoyWTI1bE5rK29lT0o1UGtaSTNDcittU0xLT2l4ZWZHMHNZ?=
 =?utf-8?B?dmk2d3dndk11NnJ6TlFZalBtVmoxRFp5d3hkTkpjT3FRZUd5cHZhbEp2YmF4?=
 =?utf-8?B?VEJwdEE4UUFZYk04T1FwSkpXNUh4K0g1dUV0bnp6aEFiLzRZdk00cDJocFll?=
 =?utf-8?B?S1Zha2ZQbWRQclJtR1dSU0VBYm4yVFA0Z1JXcDNDbklpMDJVRDdRS0xBODEv?=
 =?utf-8?B?Rkt5OFY4NVozTWo4Q0VPMU5OTk9vV1RyUVFtOGVJSDFZYUQ2VTRKTVAxa253?=
 =?utf-8?B?dVpTRk9GK2RWbVc4MXp1TThoMXVZVGdkcE1QSHZtNmZucStseHQ1OGRmRnRa?=
 =?utf-8?B?dU8xeWZ3OU1rbVU1eGloYnZWZ1NKMUk3Y2lHeEpkbTZ6RjJtN2FWUU5WbTJu?=
 =?utf-8?B?dEVLeDFqK2tRVWM5SGFPb1dwc2E3NmRtT0lIcis5amJvM3RabUVoZnJIbjBk?=
 =?utf-8?B?WGZ1QzVFdE16ZFpSVUQvWGw0OGdVQ01YSHhidzRzSTdVUzVBZWpHcXdCdk1U?=
 =?utf-8?B?TFNLRnBIcDJGbk1HQ1ZCdWMraXl5czF0VEpUQndlL1RiY2VEZWY4VTJhVXZY?=
 =?utf-8?B?VFN2ak03b3l4T2VpUUJkVkZNNDYrdnF4RFJOZ3VVQTRUbmlaT2loVTlNeENJ?=
 =?utf-8?B?S0J1c25ZckU2cmZZazhML3pXeUVOTEJoYmU2cUZJQWVXelZ2MjlrZ0lBWTJj?=
 =?utf-8?B?MlY5SUtVMmhVYTFBNXkrTVc0QmpGWE1GMndSY2NJRjFiQkljQW4wN0FhOGR4?=
 =?utf-8?B?L0txaWxLcEQzZGRYR1hGWlR1ZGJONzR6b1pYeFJwRUEybzBLb1dKamFBaUhP?=
 =?utf-8?B?eWorK1J1YU5JckNnZW9Ndm91WEtzVFgwSnU2MG1rZkZSZ0dLZXBCdG43L09p?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75B75E8F81D6CA4993DFC1EF5089F775@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32e0e1a-9f51-4416-d9d7-08db6eb3926a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 21:49:33.7681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fq064W/rOFFCsQWsngUAPUxRdP3JxtKRWFHeU02YqJMkXjXT6taeeWDQgpYulBUUNcRiViEYXYEp1aQMh/XWdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Append dma_buf fences to
 framebuffer fences
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

T24gRnJpLCAyMDIzLTA2LTE2IGF0IDE3OjI5ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFRodSwgSnVuIDE1LCAyMDIzIGF0IDExOjEwOjU1QU0gKzAwMDAsIFNoYW5rYXIsIFVt
YSB3cm90ZToNCj4gPiANCj4gPiANCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5v
cmc+IE9uIEJlaGFsZiBPZiBKb3PDqSBSb2JlcnRvDQo+ID4gPiBkZSBTb3V6YQ0KPiA+ID4gU2Vu
dDogV2VkbmVzZGF5LCBKdW5lIDcsIDIwMjMgMTo1MCBBTQ0KPiA+ID4gVG86IGludGVsLXhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4gU3ViamVjdDogW0ludGVsLXhlXSBbUEFUQ0hdIGRy
bS94ZS9kaXNwbGF5OiBBcHBlbmQgZG1hX2J1ZiBmZW5jZXMgdG8gZnJhbWVidWZmZXINCj4gPiA+
IGZlbmNlcw0KPiA+ID4gDQo+ID4gPiBUaGlzIGlzIHJlcXVpcmVkIHRvIGNvbXBseSB3aXRoIEtN
UyBwYWdlIGZsaXAgcmVxdWlyZW1lbnRzLCBhbmQgaXQgaXMgdGhlIG9ubHkgd2F5IHRvDQo+ID4g
PiBzeW5jaHJvbml6ZSBmcmFtZWJ1ZmZlciBzY2Fub3V0cyBpbiBYZSBLTUQuDQo+ID4gPiANCj4g
PiA+IFVNRHMgYXJlIGV4cGVjdGVkIHRvIGF0dGFjaCBhIHN5bmNvYmogdGhhdCB3aWxsIGJlIHNp
Z25hbGVkIGF0IHRoZSBlbmQgb2YgdGhlIEdQVQ0KPiA+ID4gam9iIHRoYXQgaXMgcmVuZGVyaW5n
IGluIHRoZSBmcmFtZWJ1ZmZlci4NCj4gPiA+IFRoaXMgd2F5LCB0aGUgY29tcG9zaXRvciBjYW4g
c2VuZCBqb2JzIHRvIHRoZSBHUFUgdG8gcmVuZGVyIHRoZSBmcmFtZWJ1ZmZlciBhbmQNCj4gPiA+
IHdpdGhvdXQgaGF2aW5nIHRvIHdhaXQgZm9yIGl0IHRvIGNvbXBsZXRlLCBxdWV1ZSB0aGUgcGFn
ZSBmbGlwIGluIEtNUy4NCj4gPiA+IA0KPiA+ID4gVGhpcyBmaXhlcyBkaXNwbGF5IGdsaXRjaGVz
Lg0KPiA+IA0KPiA+IExvb2tzIEdvb2QgdG8gbWUuDQo+ID4gUmV2aWV3ZWQtYnk6IFVtYSBTaGFu
a2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+ID4gDQo+ID4gQFZpbGxlOiBDYW4geW91IGFs
c28gY2hlY2sgdGhpcyBvbmNlIGFuZCBjb25maXJtLg0KPiANCj4gTmVlZHMgYW4gYWN0dWFsIGV4
cGxhbmF0aW9uIHdoeSB0aGUgY3VycmVudCBjb2RlIGRvZXNuJ3Qgd29yay4NCg0KT3BzIG1pc3Nl
ZCB0aGlzIGJlZm9yZSBwdXNoaW5nIGl0Lg0KQnV0IGN1cnJlbnQgY29kZSBkb24ndCBhdHRhY2gg
ZG1hIGJ1ZiBmZW5jZXMgdG8gZHJtX3BsYW5lX3N0YXRlLT5mZW5jZS4NCg0KRHJpdmVycyB0aGF0
IGRvbid0IHNldCBwcmVwYXJlX2ZiKCkgaG9vayBoYXZlIGRybV9nZW1fcGxhbmVfaGVscGVyX3By
ZXBhcmVfZmIoKSBjYWxsZWQgYnkgZGVmYXVsdC4NCkJ1dCBpOTE1IGltcGxlbWVudHMgaXMgb3du
IHZlcnNpb24gb2YgcHJlcGFyZV9mYigpIHRvIHBpbiB0aGUgRkIsIGk5MTUgaWYtZGVmIGJsb2Nr
IGRvZXMgdGhlIHBpbm5pbmcgYW5kIGk5MTUgaW1wbGljdCBzeW5jaHJvbml6YXRpb24sIHdoaWxl
IFhlIGlmLWRlZg0KYmxvY2sgd2FzIG9ubHkgZG9pbmcgdGhlIHBpbm5pbmcuDQoNCkFnYWluIHNv
cnJ5IGZvciBwdXNoaW5nIHRoaXMgYmVmb3JlIG5vdGljZSB0aGF0IHlvdSBoYXZlIHJlcGxpZWQu
DQoNCj4gDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4gPiBVbWEgU2hhbmthcg0KPiA+IA0KPiA+ID4g
TGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2lzc3Vlcy84
OTIzDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNv
dXphQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMgfCAxMyArKysrKysrKysrKystDQo+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+IA0KPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWlj
X3BsYW5lLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9t
aWNfcGxhbmUuYw0KPiA+ID4gaW5kZXggYjc1NjU2MWYwOGJkMS4uYTNmMzBhMzE5ZTRjMCAxMDA2
NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWlj
X3BsYW5lLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YXRvbWljX3BsYW5lLmMNCj4gPiA+IEBAIC0zMiw2ICszMiw3IEBADQo+ID4gPiAgICovDQo+ID4g
PiANCj4gPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+DQo+ID4gPiArI2lu
Y2x1ZGUgPGRybS9kcm1fZ2VtX2F0b21pY19oZWxwZXIuaD4NCj4gPiA+ICAjaW5jbHVkZSA8ZHJt
L2RybV9ibGVuZC5oPg0KPiA+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPg0KPiA+ID4g
DQo+ID4gPiBAQCAtMTEyMCwxMCArMTEyMSwyMCBAQCBpbnRlbF9wcmVwYXJlX3BsYW5lX2ZiKHN0
cnVjdCBkcm1fcGxhbmUgKl9wbGFuZSwNCj4gPiA+IA0KPiA+ID4gIAlyZXR1cm4gcmV0Ow0KPiA+
ID4gICNlbHNlDQo+ID4gPiArCWludCByZXQ7DQo+ID4gPiArDQo+ID4gPiAgCWlmICghaW50ZWxf
ZmJfb2JqKG5ld19wbGFuZV9zdGF0ZS0+aHcuZmIpKQ0KPiA+ID4gIAkJcmV0dXJuIDA7DQo+ID4g
PiANCj4gPiA+IC0JcmV0dXJuIGludGVsX3BsYW5lX3Bpbl9mYihuZXdfcGxhbmVfc3RhdGUpOw0K
PiA+ID4gKwlyZXQgPSBpbnRlbF9wbGFuZV9waW5fZmIobmV3X3BsYW5lX3N0YXRlKTsNCj4gPiA+
ICsJaWYgKHJldCkNCj4gPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gPiArDQo+ID4gPiArCXJldCA9
IGRybV9nZW1fcGxhbmVfaGVscGVyX3ByZXBhcmVfZmIoX3BsYW5lLCBfbmV3X3BsYW5lX3N0YXRl
KTsNCj4gPiA+ICsJaWYgKHJldCkNCj4gPiA+ICsJCWludGVsX3BsYW5lX3VucGluX2ZiKG5ld19w
bGFuZV9zdGF0ZSk7DQo+ID4gPiArDQo+ID4gPiArCXJldHVybiByZXQ7DQo+ID4gPiAgI2VuZGlm
DQo+ID4gPiAgfQ0KPiA+ID4gDQo+ID4gPiAtLQ0KPiA+ID4gMi40MS4wDQo+ID4gDQo+IA0KDQo=
