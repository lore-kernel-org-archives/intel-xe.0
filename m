Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D7EEB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 11:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DDC10E0F3;
	Wed, 28 Jun 2023 11:05:47 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A021110E0F3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 11:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687950344; x=1719486344;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/oj97hcP8vFOqg66Z6wPRxtdbi8BHnlaFCvjnSznx/I=;
 b=P5YP7+bkh8dIbp4XF9gEm4P21tFwKfyJ+g+/QrwRfXWzMjYPJHz8sswD
 NsK0s94NtNWfYDfQYlyxT+W8VK9JDJaGC5vDhJMLQ9o7Ex99rFW6PGhAU
 qhoqUPFi4OUu+rpf6T03+Yrx7qmBqC9JnJtaLXuxzzYotxd1qiR1Ryomn
 t47qtcnjR1RNSq2OT6poB56hRWPCowqThvPPRH3H8TqM0TGSSyTbnecwi
 iLqGfGQkay345TnXZw0N6tO/0nBej102ge39hBRs2voVn4DXsVPU8s1Dq
 QNc1xuXuQCMTjR8ReiC54Qal9uTUNKFfkWjBMEUE4A9AdOwxnII5Bv/ug w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361856459"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="361856459"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 04:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="694223076"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="694223076"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 28 Jun 2023 04:05:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 04:05:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 04:05:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 04:05:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIyRnp150KMWuU5JQmu2wFSYwoYfMhmrUvHsipshe/gRaTt9tuwkkWv4+W0/LH28yydEBc9eO0SiG5atMPjskvXjK/noMH4cHQROqnds/SM1A+brRis6+CtAmQfvoTA8TwJCLuhMe4vVKr1FGQal6Agcc4EKVPhmvMYS5FxyZnuoPpd8wIEciUM30LVroArTbHmeexMJI+LlhA6CLefOpZdw/aKNgKkJLrudBrR3asKE2KNphZ1HGsm88X01JQOaoWhGw3eGvR60y95n/y79V15mPd2bU8lCnrczkFuAPJGnfdfI+KwUuyiOc2cJUn9Aq3yVqeyaUhobT1Vfi1YHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oj97hcP8vFOqg66Z6wPRxtdbi8BHnlaFCvjnSznx/I=;
 b=XFWrCUBlwwiZboOS8HT6gn3hyofuJsiBIL+zpg9qNR76eZH6vavqXCwUz5W/ueY58bFGjEOS4BFS7p5TW07IaX20XnZWi7ykuJ7294w3hkr3WmWY6OTJVUaBYV7B7d5uXvD2aAPGrLAhUJsaFBEM89RUiEcd1jkm59AbdhYGmaNjFmuJtcEFJ0yvbbL3aWKw/ktYBKQ/d1LGDjM0y67LVFiK9qy5Rz0JgGSJFmYP0hY8uT+AY0h7q5jh3yZwFlpWOLV8TLYUTkuem8Nu8Ar7juSON7EUlskw33ruRX4kXTiO2oI4xDTZduV+7eJXDd3NuElkQ7SUc6ldQ7Hs80h8xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 11:05:16 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::f0ec:1365:5146:2569]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::f0ec:1365:5146:2569%5]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 11:05:16 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: =?utf-8?B?W0ludGVsLXhlXSDinJcgQ0kuY2hlY2tzcGFyc2U6IHdhcm5pbmcgZm9yIHhl?=
 =?utf-8?Q?_&_i915_display_integration,_display_irqs?=
Thread-Index: AQHZqQ80QC5HRE5oQk6a7uI5wNK68q+gDrUA
Date: Wed, 28 Jun 2023 11:05:16 +0000
Message-ID: <56dbc1319cd4497ef88368539f7d0ee4d5da7185.camel@intel.com>
References: <20230627102223.260893-1-jani.nikula@intel.com>
 <168786504446.2457.9445918478693831865@emeril.freedesktop.org>
 <daevz6hon5xabm72wzyw3ztzihtdrveaxehe5bdgoo5qacd5dm@xfu24obyt4ev>
In-Reply-To: <daevz6hon5xabm72wzyw3ztzihtdrveaxehe5bdgoo5qacd5dm@xfu24obyt4ev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|IA1PR11MB6218:EE_
x-ms-office365-filtering-correlation-id: 79b430ad-9a7a-4d0a-5794-08db77c78db1
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oJ1ZaXp2lRxOMy5o5kYY3Xz9tPakLqIgwXU7W5/UK0gjuqX1zxMcmoz7GKI5rKRVsDAQKPY4lngMB7XnQ0zdSqCZUqdX3A6gkqo0YKVg1UKkRCQW4E/jB3KQsmASp4scllH38C//g0ykzDe0YQ82PJLSpYax9kgBGeURMuz/sd6GuWq/FJTswZ++7O1PA1Ajy4QFA56xwYjM1jFOFXTV+QDbvc/km8IgWS/Fjbi2CJ9+U9FItCDqeKL4yDJMbBSxQZd8Yndsp9tVkZQTg66jOawUDX01/Z492zVxVsHVKOg8WZzMcZdzqFxP4A2IAhy8Q7H5ATYNFu08xMEFxFTPxoJfs1IEW7Pe0cZFCXHoe9SpKgzQyEFb4gyAOE3WZpHljoME8IZhhxjWJvqxyRq/1eOyMmOdDNNBKKEdoJ7z/dnyLcL7rgX5wxKTSgS9j38YFnrk9BbuM6ErsmM7N9ijNFHYhuvt4pOpMMbOcwe2+IKL8MQ3ljsEQlH1LH7GNFIivHhSNeP9TdLLOMYq+E0t0jHyh1jyx8PDmHIunHfCqis8ooZyvS15C5OIL0LnOoUZQZE4IdgROYpjXEKGPaWIoCQ1z8NSe1ttK6PlF3MT9G+UcRINWt4QsqeZHkvGge3WY9/wDIqnlRrZPfN9e0BTAg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(66556008)(66946007)(66446008)(6636002)(316002)(64756008)(66476007)(76116006)(4326008)(38070700005)(478600001)(36756003)(8936002)(5660300002)(91956017)(86362001)(110136005)(41300700001)(6486002)(2906002)(966005)(186003)(6506007)(6512007)(38100700002)(82960400001)(26005)(83380400001)(122000001)(2616005)(107886003)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmlxZVdNQjN6L1pFUlZaK0FwNTk0R3V0RnpyTnUxNzZXODBoeFJtaStXMHMy?=
 =?utf-8?B?SWcya25HaGhoazVnVm10MWpSSXljY0FRVmUyWTF6ZFF6V0FJSVp6YkFxU2N4?=
 =?utf-8?B?R0dJSGh6R3pVNWsydEtNRGVaVXBVYm9POUdCaXNQWEJkbUNlRkdqdTVnbkVi?=
 =?utf-8?B?ckJKYVlyYTJjaDE1b21lQkY2UWs2bzRKZUNsVk1CVjhVMGU3cjd6K0FLUzlN?=
 =?utf-8?B?OFdYcm1vVDUxUUthdGxkZ1luV1ZHam5jZWtGZ3ZWK3FadElOZEpQdFRyNnpa?=
 =?utf-8?B?ZmlSUGxDSjY3MzJZZXh5OVUvcDUvNVdtRTZBM092Q0J6Qk9ndHVCaDlQakhj?=
 =?utf-8?B?QTlJdE1jNDhteWFrbkZzZVp3STdrWExsd29XakZmZitmYzJMcC9WbU85ZU16?=
 =?utf-8?B?QTltNnFqOXh4eWcrYTZFY0hPVTZWaUtBcWgySGNuUHVLSWhmbXhobnlBSmFQ?=
 =?utf-8?B?ampjSnhMY2I5ZHVoUksxejFVd3k0a3pvL3VNdjE2RTkzUWs1dXUzeGFYZ0ww?=
 =?utf-8?B?NWJSRzZJV2MxQzRrQ2ovbkhVeHV3QXA2bzdCWVBRUnp3dmZqV3NnS1NQWlNV?=
 =?utf-8?B?YWJyNkF2YjZEVCtuUE1WYUVEWkxZc3NzcW1zTERnbUZUZERBZzI2ekdGclZV?=
 =?utf-8?B?bjlGM3luWkthSysyWHI3NGUzeU1hRFVCeVh2ZkVwN2szNmFoUVRTOGZJeXB3?=
 =?utf-8?B?dlFSd2s2alVzMDJLQUJ0K20xdm5rZzVKK0krUnhMYVBlVWJWL05nM25WdTMv?=
 =?utf-8?B?SUF4TC9ZOEwydGFpS1dQOHlPelZyUjRuRXBHWndONTVBLzFJaEtsYm1VVG02?=
 =?utf-8?B?dHNNTnVEL3RTY0dXSElDV3JTOTA4NFNuQnBBYWlDcTZtNU8vKzNNeTU1S1lJ?=
 =?utf-8?B?Rm9DS2tCMFdHMFZoOStNNDVhVFo3YjNXZzNUaUc2aG1KM0FXMTZ2Wk5kQzVT?=
 =?utf-8?B?dTZobzJCeVhQdldxQms3eDlidEs5eGFvcXY0NGdQYXNyUEkvVmNmRnhpd3V3?=
 =?utf-8?B?dHZTT1pYVnF6R0FlSkJyNjlBQW5UdEtQVmZVOW53ZUI1N1M5SjNNV0N3Rk9s?=
 =?utf-8?B?ZWZpMVNVNVgxMGVVaC9oZFBma3ROYzlvc1dHVEk3Sms2N2hsKzU0VStnWGlq?=
 =?utf-8?B?YjBiN1RXc2toY1A1RVVFcTZtU0RNUDUva2hiaGwxR2VqREZaOVJNSGV6WDRv?=
 =?utf-8?B?aExDQ2xyRitHSGU3ODNSR2p6eXZMYXRYWEhHQUc1ckhsSmZqTzRDOGdmVGV0?=
 =?utf-8?B?bmxzTE03cWNTOGVzd1M0dkJVNnpialUxblp5Z1FMNWhCTjdReXo4UmUrK2Rt?=
 =?utf-8?B?VURvTzNBL3ZvNEhTaDlVUUNMMzVva3gxYlZjalozYWtSRkRoRnM0Wi9Eckx0?=
 =?utf-8?B?clBBdnZoT1EvbE5ZYTZSYTE3NWtHc0NiSHZsblZ4elkyK2Q4dVhCMU9FMUZu?=
 =?utf-8?B?QTYvRHJDeVc5aEE2OUpSbUtSdjNBa0F6cXlOUVNEUFUyeEg4Ni9CUGtORmVP?=
 =?utf-8?B?OCtlZGdsd0ZmSjZ5WmRLNWV3Yzk2Y0trUVh6SmJtK1hNdXVTaUdTcmRCQk8v?=
 =?utf-8?B?QWFIUDRZZFIwUGpoRllzZ0hqbXo3Mlg0YVhXa2FnSnhVdTVtV2tmcnRsVWNU?=
 =?utf-8?B?dituakNGR2tCeGVkemhOdSswaTZDKzlzdzdmazc4MEJOTUo1dEZWZUoxbW03?=
 =?utf-8?B?d1BHMWNnNFRSQlFLTnIrbWpxT2x5YlU5ZGttU3crUDBBLzIrU0RJWlJEanNI?=
 =?utf-8?B?dUM0ZzVoZzhMdGhrN0U3UjUvZytYTVZraU44Mi9HZnVmeUhiNmo1cm02aUpO?=
 =?utf-8?B?RjVRSkVlRzhyc2s1a3hKRUl0OWhBcVQ1b2lXenByTHZxNnpOdnNxeXM4VkNM?=
 =?utf-8?B?RHgyR1F6OWtoTExOaEd0eWt5UWgyN1JodDU1QXhzQStsaS9XcWlxM0s0Uktz?=
 =?utf-8?B?UmZZWGZjdTA2NVdLd3plR1RGdFNqTDdFOVNoblpSRnM3OGRITHJ6NWkrMklu?=
 =?utf-8?B?VUdrR0kyOHJZaUpUaXN4MVIxZDRudHhpVTQ0OTBxMndpdGdXTjY1SVdlUWZy?=
 =?utf-8?B?Y0dTTEMrWGgvMFhSYVNmdElYdTFiOTlqQ2FYWDltRlJlZlZQZHJ5bUJGcDJh?=
 =?utf-8?B?QkdJTDlURWluVU4xOWdBS0R2M0dhYlF0dDZWR242eHpyM1FmZFVHM1RML3Vi?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <460EEDBA63EBA74DA42EE1B8006043C9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b430ad-9a7a-4d0a-5794-08db77c78db1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 11:05:16.2041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYSt8OgRzteWFZS9x2590M2KAyV4i3X6Whet2vbcIVzl82ms8BfHSd+5ublU6HGSRD5dMr38pMYOLzLOJjKWSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6218
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_x?=
 =?utf-8?q?e_=26_i915_display_integration=2C_display_irqs?=
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA2LTI3IGF0IDEyOjUxIC0wMzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFR1ZSwgSnVuIDI3LCAyMDIzIGF0IDExOjI0OjA0QU0gLTAwMDAsIFBhdGNod29yayB3
cm90ZToNCj4gPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiA+IA0KPiA+IFNlcmllczogeGUgJiBp
OTE1IGRpc3BsYXkgaW50ZWdyYXRpb24sIGRpc3BsYXkgaXJxcw0KPiA+IFVSTCAgIDogaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMTk5MDkvDQo+ID4gU3RhdGUgOiB3
YXJuaW5nDQo+ID4gDQo+ID4gPT0gU3VtbWFyeSA9PQ0KPiA+IA0KPiA+ICsgdHJhcCBjbGVhbnVw
IEVYSVQNCj4gPiArIEtFUk5FTD0va2VybmVsDQo+ID4gKyBNVD0vcm9vdC9saW51eC9tYWludGFp
bmVyLXRvb2xzDQo+ID4gKyBnaXQgY2xvbmUgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9tYWludGFpbmVyLXRvb2xzIC9yb290L2xpbnV4L21haW50YWluZXItdG9vbHMNCj4gPiBD
bG9uaW5nIGludG8gJy9yb290L2xpbnV4L21haW50YWluZXItdG9vbHMnLi4uDQo+ID4gd2Fybmlu
ZzogcmVkaXJlY3RpbmcgdG8gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9tYWlu
dGFpbmVyLXRvb2xzLmdpdC8NCj4gDQo+IGlzIHRoZSB3YXJuaW5nIGJlY2F1c2Ugb2YgdGhpcyBy
ZWRpcmVjdD8NCg0KTm8sIGNoZWNrcGF0Y2gvY2hlY2tzcGFyc2Ugc3RhZ2VzIHJlcG9ydCBhIHdh
cm5pbmcgd2hlbiAiZGltIHNwYXJzZSIgb3INCiJkaW0gY2hlY2twYXRjaCIgcmV0dXJuIGNvZGUg
IT0gMC4NCg0KUnlzemFyZA0KDQo+IA0KPiBMdWNhcyBEZSBNYXJjaGkNCj4gDQo+ID4gKyBtYWtl
IC1DIC9yb290L2xpbnV4L21haW50YWluZXItdG9vbHMNCj4gPiBtYWtlOiBFbnRlcmluZyBkaXJl
Y3RvcnkgJy9yb290L2xpbnV4L21haW50YWluZXItdG9vbHMnDQo+ID4gY2MgLU8yIC1nIC1XZXh0
cmEgLW8gcmVtYXAtbG9nIHJlbWFwLWxvZy5jDQo+ID4gbWFrZTogTGVhdmluZyBkaXJlY3Rvcnkg
Jy9yb290L2xpbnV4L21haW50YWluZXItdG9vbHMnDQo+ID4gKyBjZCAva2VybmVsDQo+ID4gKyBn
aXQgY29uZmlnIC0tZ2xvYmFsIC0tYWRkIHNhZmUuZGlyZWN0b3J5IC9rZXJuZWwNCj4gPiArIC9y
b290L2xpbnV4L21haW50YWluZXItdG9vbHMvZGltIHNwYXJzZSAtLWZhc3QgZjEzNTU4MGI1Njcx
NThiMjMzNDlkYjU1NDQyNTk3MzBkZmI5MWU3OA0KPiA+IFNwYXJzZSB2ZXJzaW9uOiAwLjYuMSAo
VWJ1bnR1OiAwLjYuMS0yYnVpbGQxKQ0KPiA+IEZhc3QgbW9kZSB1c2VkLCBlYWNoIGNvbW1pdCB3
b24ndCBiZSBjaGVja2VkIHNlcGFyYXRlbHkuDQo+ID4gKyBjbGVhbnVwDQo+ID4gKysgc3RhdCAt
YyAldTolZyAva2VybmVsDQo+ID4gKyBjaG93biAtUiAxMDAzOjEwMDMgL2tlcm5lbA0KPiA+IA0K
PiA+IA0K
