Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54A4C2FC04
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 00:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A28110E0C8;
	Thu, 17 Aug 2023 00:48:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3B610E030
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 00:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692233325; x=1723769325;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2mCfGEDGIEiLGsa1U28d7jaXr395cjBaptawV8AztGs=;
 b=SqHemtEenqaPJ3JfaRAy+C1E3GveXgzJJwFIApVgEAXAPjRmvKDRaSZw
 qi+0TKwD0YDAmS97B/xUwo9t9PC76vHH5Ca+VsHh4SObKfDLpvPNvf+ov
 cCv5AoZ0GlqsA4sm5K2jVFXDaWfYFd+NuWzCQ+3pk4CXeFqsflUglLz2v
 u0lHlWFq9AYAtN5W/4WDMuGxKRHTNM7TI1zPG9JHjuYkftpS5PPNIto/r
 lyzUdvC7YZSDc1gn4DJ5aqddiIn9jUtoeSMJYpa0xiUOx3ijZBzg/J/qW
 SIboOFKB7lkSr4INecDSPPx8sdaLx1U9E9/S5Nb1IMIFBvD9kD4riQC3v g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362831723"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="362831723"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 17:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="908205692"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="908205692"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 16 Aug 2023 17:48:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 17:48:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 17:48:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 17:48:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 17:48:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wn5/zrRpFQnwlcFLOzgbwYMmvfsCDIfK2kQz1/LFOlbqctVQRuGDU7Ja2cNxeWwS7vh4Rkr0f2S6rBQG+VXutgsdlJk9WvFgrqx+0D1mm+YsH9Gs3S44rupIHFoOyQSJr2cNVfxVCTzkZ6ubA2XTd2cTEOHP4HRH7QInqpOHycHh5l5h3W+rE9U+oKyDdioaJ5SemqYAFsKmUNvS2EdmBCqYJkD2HL+1uJeLvCmYjlswfZ44CPZHUGVigUn85PblyxidSe4uLaKUwLtUvH4MSWiIC5wyq/G3ymwr2vv+HCvvm5EPvLEuYvRfjecq1zc8mxWRyltzzpwvRKds7GGV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mCfGEDGIEiLGsa1U28d7jaXr395cjBaptawV8AztGs=;
 b=nM/MLaxM4Wb4xoG1NzSSz2/0lwz9SUC+1aQfqmTNN2e512uJqW9im++hJbesZ2l+hsDogAq+W5pvfgny2j5UhprzDX/ooNHVrrh/VioGLoICJciP7qj/XySm+p9mTtqROMDb5a+JUfCXL8AIiifQV6U4J4X+Qt4HR/P1FLXaXNV3yBM8bco0fnrJiHmZY/Ngl+e9hgg2qWXcJq74K+ZXlDPncGHTHQcRktWviEra5cdCLczgWbW1saBn1ZGEvcU8zb9oHXivfkDgyDG7XueszZTkLJ5eNlIdLSsfWpmkb3CHqJ5DlNxy5PLjO/irQgWDLLzHW2UEqjudZrFimSo6XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by DS0PR11MB8135.namprd11.prod.outlook.com (2603:10b6:8:155::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 00:48:42 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::aa27:94e3:591c:7b93]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::aa27:94e3:591c:7b93%4]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 00:48:42 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Add patch version on guc firmware init
Thread-Index: AQHZz9QbhO2H47KGokCeFidvK/QUjK/tZe+AgABAQNA=
Date: Thu, 17 Aug 2023 00:48:42 +0000
Message-ID: <SN6PR11MB2622115F88C78A2CEA8A2F538F1AA@SN6PR11MB2622.namprd11.prod.outlook.com>
References: <20230815235606.804366-1-zhanjun.dong@intel.com>
 <5bda2666-6354-c351-6b5e-4118c7397295@intel.com>
In-Reply-To: <5bda2666-6354-c351-6b5e-4118c7397295@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2622:EE_|DS0PR11MB8135:EE_
x-ms-office365-filtering-correlation-id: e7333d05-4f4c-483d-7f6b-08db9ebbb475
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A51veStFT+Z+fmxatOkDZaPQtQupUvyhuxd6+7WOnTw7P9pB2nb6Ix5xYtEpMnwNzMWCLY4SGsifnrJHASQhzxF04CP5nAA7d+XoQg3GCYRD8ntv/FcoN7qJkB0YRpcHRtF2jrwed98SqxyPZ0fmoPqnFSRL87zi65VimOiFE9DoKjGz9nafePOLKHdTED4L3UmQ2Bgvi1bcLnBhpH7UNneXBNGUAGhtS3OKtpcnIfTTBcXcaAr4Pttn1Nts9luYPYlIWjF2r/cTPWXNhT6JHE4g4IIYcREYeJLsEyKkmi1pKENVBtgGEh4kvDEx1hKNMyiImfVsGRsgzel5QWX+zB7x0HiJjTcGw6epquUQU739tc7bceeUBmtj9iZWBiuBPcBNoUwpX/6OZsykqou9NxPBnciNm1w7rxs8YMlnb7QTNbC4yH5FR0cGkBb38uTpYXuaspLnwAPba6dxJNZPB95gddvMQXZ7ILbOHyWIY2+aJfrOZlLCx/BeO1m3cXHpJqVEJG6riIx7hIr0rnRYEx3xfqfewSZM3i42/RydpxgKZRhlMYxhdS6gqxQDnce4G+OYLFq3wQrZ67X0wkFCYJuikFqfLBexdREXrMMjFmGjySu+Hj0/4dfK00zoL2IM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(186009)(451199024)(1800799009)(33656002)(86362001)(55016003)(83380400001)(8936002)(8676002)(5660300002)(2906002)(52536014)(41300700001)(26005)(53546011)(71200400001)(7696005)(6506007)(9686003)(122000001)(478600001)(316002)(66946007)(110136005)(66556008)(76116006)(66446008)(82960400001)(38100700002)(66476007)(38070700005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTR0dGNqbjVCU2tWSDBab0pJOCtlYUovYUcwU0xHQlJadEJaRHN3RzVFU0kz?=
 =?utf-8?B?cmlmbmpKek5NRDd5NWYwTi81MklZSUpDS0JkeHdIM3ZaOURrVUFobkU1TGdF?=
 =?utf-8?B?dmkzWXQxUElZVXNWemhibVl0S0xBNjJYSnE1bGh0bkpXekpYZ3BWT2lDTDRo?=
 =?utf-8?B?L0F4Z3J1R0J0SUd6N084bGs4M2RwaUZDZkZ2dDBlZjVjL0M0b1ZsUlBEVGhG?=
 =?utf-8?B?RnM1ZkFybXRxR3MzWUZsQUkySkl6ZFhaajlxb2hTeElId29ncWpEeVBsVm9G?=
 =?utf-8?B?cHI1cnlwSUNvUmVqOGowRGVrMCs4VldXak40TmdXSVRJdGFJRlFkV2FuZXd2?=
 =?utf-8?B?VVpNVU5PWFZJQXYxUnVqK3JuS0NOdG5uc2gzaWNUeFB1WTdEK2l3djdyeDRs?=
 =?utf-8?B?MnRVZUlKWUZMK213ci9tT05aSmFIUStBZTY4T2RSSUZkWlhaa2FxWlJOdzdm?=
 =?utf-8?B?Y1ZuTzBUQkpPWHlKVDUwV00yakpMQUxCeUtSMENVK3Q5Qk9UNmxqbHFrRkpY?=
 =?utf-8?B?ck9aTmVpSFVLY1dlQTlPVkdVa0NiZEVmZkxsMUxpTGw1TlFhcFR1ODdRV2Z0?=
 =?utf-8?B?OXg4QzJmTVBwZEFNN2tBUTFYeitnM25MRTFJR2lVL3c0bTA2VVlrbExWcXNr?=
 =?utf-8?B?VENGL1BoUDdZWnM1dXkwZEdjYzhhVVZydC9TMms1a1R2VXIxdzlyeXRjREJJ?=
 =?utf-8?B?VnB3UEhlVitYK2N2ejJSVHFBMnBJcjZIQy9aV2NQMTlRUzRJL0daWjE3TEpV?=
 =?utf-8?B?TWVINWxOamJVWXRFNGJkbTNQRHgxemdVNnRLZmxQMXRKcmxrMW1ocEhsZ2NB?=
 =?utf-8?B?SkQzR0xpNHlaZ3FVVXMwZUNaRnVyUnBhU09KWFc1K0h0d1RxMDFqbVhGSk42?=
 =?utf-8?B?V05mV1RMZW05Q3FuK2RyM1RuS2MyQk5McFdwL2U0S2Z5NjNiMUUxQ0JnbTlm?=
 =?utf-8?B?ZHdNVVVOSVZEWGVCcVByenhYYURTZ3M2Z2hMdG01SlJyUmgzU2V2MHd4clFn?=
 =?utf-8?B?eTI4VlRpN1U3RGtWb25NUGJ6L1d1SWsxZWEzM05uWU9IODNpc3kvTFFuSTJL?=
 =?utf-8?B?VmhxKzgxY20wV1ltSUp6cW84UC9aMGQvcWZOSVhuTEZ4bkFnQndZNE5vVmwz?=
 =?utf-8?B?TlR2U25vY3BMcXdwbGFINy9Zc010TjVGOXNKcTlqd0Juek93b2NKY05FK0d0?=
 =?utf-8?B?VHJYSEU2TzlkQ1hzNGtIbXQrS2R0MWxDeUQ1ZnlVRkxuZDJNZVFTOXpvMks0?=
 =?utf-8?B?OVpiSmc3dGVxcndCZWlSbUh6em56ZDRGakg0MGt3UTJzMm0vZXJES2Y1dmE1?=
 =?utf-8?B?MEpRMUhLSHprRWgyZy9BM0hMRXJhTXFaSU1MTm9WWHJudnB5S3pUYnFPbVZ4?=
 =?utf-8?B?RUJlSnJXSVFFeElLOWhEeHZOQ2tjZXRnM0dpcUdKNm9OUXhLLzl1UU5jN3lm?=
 =?utf-8?B?REhiMHNRL2lLNVlOLzNIKzNnaEJBVktzNnZVSEhBaEFVdDQvMWFwMDczdDdO?=
 =?utf-8?B?M3BEdGNKQ1pVQUQrd0V2N0w4bDdYZ0tNZVNlellVNlczcVY4b3pGSzBnUkFU?=
 =?utf-8?B?dG1hdnd3SlovVFUzQzg1Y1VvVnFYeDhWZUZXcHBsVkcrOHVKeTFpQUVCOGxD?=
 =?utf-8?B?THpSQndCakdxTjlGVXd2QkVxWW50VHFkTy9IZEVJUERvUTYvMERLUHNhc2ZT?=
 =?utf-8?B?T0xmMGZ6dE5WVjBvZG1ndVA4bFl6QjJRY3dEU3dpTGNweTQ3VzREM3U2cCtF?=
 =?utf-8?B?UE5QclBQU0RSakhJL3dyMW1waWU0T21MVHlJU1JtOG9uYUpHOXhEdTkzZHRv?=
 =?utf-8?B?eWdRalduV1daV3g5V1czdzlSaTdsVjlkYjQ5c0V3cllQSW0rNHJmK3RNcVJS?=
 =?utf-8?B?MFgzZFEybThERExkSno1UE1LTzVmd1B4Q3ZIU1FqVzJNcHNEM2wvc3JzeDVv?=
 =?utf-8?B?TnZEY1J6VDZOMU9uc1d4ejIvTjVuK0FKdUs1NldEc0NVbEc4R0xpV01VVUcw?=
 =?utf-8?B?T3I1ajVYa3VwamJTRWhOOStQOWNSa1J5UklSV1dOeGNOWnZLQnFRTFhYRHF3?=
 =?utf-8?B?cWlFb3hETGRHUjYvK3J6UXMzNnJOelpOeFppbmdtOHM4TVorQ1QvY2N2R1Ir?=
 =?utf-8?Q?N49jqnAlA5YOzYd7M5OGPv7WZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7333d05-4f4c-483d-7f6b-08db9ebbb475
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2023 00:48:42.6416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZX0rofI5tiM7xz2H8FQT+0l+RsYcBnJGIGYtIDAzCWOIgHtj6cgnlmnqOIrbl65Q2WA8tz6ZsfutKKAdhvPFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8135
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add patch version on guc firmware
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2VyYW9sbyBTcHVyaW8s
IERhbmllbGUgPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IFNlbnQ6IEF1Z3Vz
dCAxNiwgMjAyMyA0OjQ3IFBNDQo+IFRvOiBEb25nLCBaaGFuanVuIDx6aGFuanVuLmRvbmdAaW50
ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBb
SW50ZWwteGVdIFtQQVRDSF0gZHJtL3hlOiBBZGQgcGF0Y2ggdmVyc2lvbiBvbiBndWMgZmlybXdh
cmUgaW5pdA0KPiANCj4gDQo+IA0KPiBPbiA4LzE1LzIwMjMgNDo1NiBQTSwgWmhhbmp1biBEb25n
IHdyb3RlOg0KPiA+IEFkZCBwYXRjaCB2ZXJzaW9uIGluZm8gb24gR3VDIGZpcm13YXJlIGluaXQu
IFRoaXMgaXMgcmVxdWlyZWQgaW5mbyBmb3INCj4gPiBHdUMgbG9nIGRlY29kZXIuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERvbmcgPHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZncuYyAgICAgICB8IDcgKysr
KystLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VjX2Z3X3R5cGVzLmggfCAyICsrDQo+
ID4gICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZncuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV91Y19mdy5jDQo+ID4gaW5kZXggNmM5NWEzZTRjM2YyLi40MDhi
ODE2ZjllNDAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VjX2Z3LmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZncuYw0KPiA+IEBAIC00MDMsMTEg
KzQwMywxNCBAQCBpbnQgeGVfdWNfZndfaW5pdChzdHJ1Y3QgeGVfdWNfZncgKnVjX2Z3KQ0KPiA+
ICAgCQkJCQkgICBjc3MtPnN3X3ZlcnNpb24pOw0KPiA+ICAgCXVjX2Z3LT5taW5vcl92ZXJfZm91
bmQgPSBGSUVMRF9HRVQoQ1NTX1NXX1ZFUlNJT05fVUNfTUlOT1IsDQo+ID4gICAJCQkJCSAgIGNz
cy0+c3dfdmVyc2lvbik7DQo+ID4gKwl1Y19mdy0+cGF0Y2hfdmVyX2ZvdW5kID0gRklFTERfR0VU
KENTU19TV19WRVJTSU9OX1VDX1BBVENILA0KPiA+ICsJCQkJCSAgIGNzcy0+c3dfdmVyc2lvbik7
DQo+ID4NCj4gPiAtCWRybV9pbmZvKCZ4ZS0+ZHJtLCAiVXNpbmcgJXMgZmlybXdhcmUgKCV1LiV1
KSBmcm9tICVzXG4iLA0KPiA+ICsJZHJtX2luZm8oJnhlLT5kcm0sICJVc2luZyAlcyBmaXJtd2Fy
ZSAoJXUuJXUpIGZyb20gJXMNCj4gdmVyc2lvbiAldS4ldS4ldVxuIiwNCj4gPiAgIAkJIHhlX3Vj
X2Z3X3R5cGVfcmVwcih1Y19mdy0+dHlwZSksDQo+ID4gICAJCSB1Y19mdy0+bWFqb3JfdmVyX2Zv
dW5kLCB1Y19mdy0+bWlub3JfdmVyX2ZvdW5kLA0KPiA+IC0JCSB1Y19mdy0+cGF0aCk7DQo+ID4g
KwkJIHVjX2Z3LT5wYXRoLA0KPiA+ICsJCSB1Y19mdy0+bWFqb3JfdmVyX2ZvdW5kLCB1Y19mdy0+
bWlub3JfdmVyX2ZvdW5kLCB1Y19mdy0NCj4gPnBhdGNoX3Zlcl9mb3VuZCk7DQo+IA0KPiBXaHkg
bG9nIG1ham9yIGFuIG1pbm9yIHR3aWNlPyBjYW4ndCB5b3UganVzdCBhZGQgdGhlIHBhdGNoIG51
bWJlciB3aGVyZQ0KPiBtYWpvciBhbmQgbWlub3IgYXJlIGFscmVhZHkgbG9nZ2VkPw0KWWVzLCBp
dCBsb2cgdHdpY2UuIEknbSBub3Qgc3VyZSBpZiB0aGVyZSBhcmUgYW55IHRlc3QgY2FzZSBpcyBs
b29raW5nIGZvciB0aGUgZXhpc3RpbmcgZm9ybWF0IG9mOg0KVXNpbmcgJXMgZmlybXdhcmUgKCV1
LiV1KQ0KV2hpbGUgdGhlIGRlY29kZSBpcyBsb29raW5nIGZvciB0aGUgZm9ybWF0IG9mOg0KdmVy
c2lvbiAldS4ldS4ldQ0KU28gbG9nIGl0IHR3aWNlIHdpbGwgbWFrZSBib3RoIHNpZGUgaGFwcHku
DQoNCk9mIGNvdXJzZSwgaWYgbm8gdGVzdCBjYXNlIG9yIHRlc3Qgc2NyaXB0IGlzIGxvb2tpbmcg
Zm9yIHRoaXMgZm9ybWF0LCB3ZSBjb3VsZCBzaW1wbHkgc3dpdGNoIHRvIHR5cGljYWwgaTkxNSBG
VyB2ZXJzaW9uIHByaW50IGZvcm1hdCB0byBhdm9pZCBvdXRwdXQgdHdpY2UuDQoNCj4gQWxzbywg
ZG8gd2UgbmVlZCB0byB1cGRhdGUgeGVfdWNfZndfcHJpbnQgdG8gaW5jbHVkZSB0aGUgcGF0Y2gg
bnVtYmVyIGFzDQo+IHdlbGw/DQpGb3IgdGhpcyBsaW5lIHByaW50ZWQgaW4geGVfdWNfZndfcHJp
bnQ6DQpkcm1fcHJpbnRmKHAsICJcdHZlcnNpb246IHdhbnRlZCAldS4ldSwgZm91bmQgJXUuJXVc
biIsDQoJCSAgIHVjX2Z3LT5tYWpvcl92ZXJfd2FudGVkLCB1Y19mdy0+bWlub3JfdmVyX3dhbnRl
ZCwNCgkJICAgdWNfZnctPm1ham9yX3Zlcl9mb3VuZCwgdWNfZnctPm1pbm9yX3Zlcl9mb3VuZCk7
DQpBcyBsb25nIGFzIHdlIGhhdmUgdGhlIEZXIGJpbiBmaWxlbmFtZSBpcyB4eC55eSBhbmQgdGhl
IGFib3ZlIGZvcm1hdCBmb2xsb3dzIGJpbiBmaWxlbmFtZSBmb3JtYXQsIEkgdGhpbmsgdGhpcyBp
cyBmaW5lLg0KDQo+IA0KPiBEYW5pZWxlDQo+IA0KPiA+DQo+ID4gICAJZXJyID0gdWNfZndfY2hl
Y2tfdmVyc2lvbl9yZXF1aXJlbWVudHModWNfZncpOw0KPiA+ICAgCWlmIChlcnIpDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Y19md190eXBlcy5oDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3VjX2Z3X3R5cGVzLmgNCj4gPiBpbmRleCA4MzdmNDlhMjM0N2UuLjQ0
NGJmZjgzY2RiZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZndf
dHlwZXMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Y19md190eXBlcy5oDQo+
ID4gQEAgLTEwNiw2ICsxMDYsOCBAQCBzdHJ1Y3QgeGVfdWNfZncgew0KPiA+ICAgCXUxNiBtYWpv
cl92ZXJfZm91bmQ7DQo+ID4gICAJLyoqIEBtaW5vcl92ZXJfZm91bmQ6IG1ham9yIHZlcnNpb24g
Zm91bmQgaW4gZmlybXdhcmUgYmxvYiAqLw0KPiA+ICAgCXUxNiBtaW5vcl92ZXJfZm91bmQ7DQo+
ID4gKwkvKiogQHBhdGNoX3Zlcl9mb3VuZDogcGF0Y2ggdmVyc2lvbiBmb3VuZCBpbiBmaXJtd2Fy
ZSBibG9iICovDQo+ID4gKwl1MTYgcGF0Y2hfdmVyX2ZvdW5kOw0KPiA+DQo+ID4gICAJLyoqIEBy
c2Ffc2l6ZTogUlNBIHNpemUgKi8NCj4gPiAgIAl1MzIgcnNhX3NpemU7DQoNCg==
