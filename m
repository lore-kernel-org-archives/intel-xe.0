Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F269DEE14D3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 08:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB6F10E071;
	Thu,  7 Sep 2023 08:40:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9771C10E071
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Sep 2023 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694076032; x=1725612032;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e2es293v5mgyOk0VomVS29084OQ6bdRlb55cP+Pjg0E=;
 b=JI52xE8MldYJqRU0rCvaoGAXWjrvi0MWoQi/QJLECSnnAeupEZjI83Io
 rH6sjLYubNjbtDXj6euzX9FI6fklqPUvrbnnuXFda38v8vdnzag8fNzU1
 gM/kYqUxKSGqwv3CM++uESswZv63GCmOB9FNCyVDGEdw1X9BZo7OwtmaN
 9RI0j79+ct+uF4q56TjN8mu9+4eFWIlhUSqwJUGsHmMDBda6sYD5YGNDY
 DBp4S7JUnzvxBUEJIyR5Y6wkDJB88YCCVUMbAS6Hyb9EtYTqXoDWgaAg/
 bVo2tmLoOk74pB/F9w/yrLi2zDyOq9boWXTH1XzNgOut3WnQamT4kzVuk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408297662"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="408297662"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 01:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865547801"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="865547801"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 01:40:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 01:40:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 01:40:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 01:40:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiVSgs6oBApJ08Pp9+9i30WWB9OOwSrOQvXiRIb4L0ZCMM5i+3rWUxfkkfJyCSyWxJNE+xWGWIJRw1Pyip8bbP6BGono0b43tvtPf289w3vCDubx9eobPMvbWt4BSWuboldTEw1O8mt35JUUJKarenT1xlms9N4N14oujzoM9VEJr+z+gCdAmhaNTwRJVIgNbwXybLry/Kb49nW0dDxB/eUa++9iAdJdf+Z/z2mUSjvWxpB/26OYgQByA4r9v/S6nLUGOgIU111Y5nA+VJ01W9of+ZySGJbD2AXyudwpAgJAMft5DayRm16CKv3bNXX3jLyVuMECJr/UuYXJsdvvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2es293v5mgyOk0VomVS29084OQ6bdRlb55cP+Pjg0E=;
 b=iYCDGbTAY8MSSI8m8pcN7dIZ4EUQv3F6ylwBifRnGd6qvjyXGClajXPEU5Tsbi1ar9vc2ffzQVtO/+wVUVZiwflddjuEobMWplvdoI0yv7uSX1EBMbtcWT3VuTdy/8sBLIEp2fpBQ2zbk0zeZ+bHuT7GvkHAsGW2lQ+HSGddeBicEXW8qT4bJ4qksOSduNO0HScjGM/jXmUQY7rBqAaP0gQ1xqqmUihi55bR5CAjZ0vGvZE7q7miLwDPy6XGTyORNrU8ZYoXc0QsaftiuCUg9EyaWpglSWAh6jdkLYZ0dDjWD1cCrLfghlK3Kptpz5LdAnAhaslcQi01xvjZLpI2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH0PR11MB5692.namprd11.prod.outlook.com (2603:10b6:610:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 08:40:28 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6745.030; Thu, 7 Sep 2023
 08:40:28 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 5/7] drm/xe: Track page table memory usage for client
Thread-Index: AQHZ2+lSMyGRu2zVQkmLtOC+VmG3LbANmJEAgAF9aIA=
Date: Thu, 7 Sep 2023 08:40:27 +0000
Message-ID: <SJ1PR11MB62045A9A634838217E34D06F81EEA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-6-tejas.upadhyay@intel.com>
 <f42a5b92-63b1-4adb-bbc6-4d479dbb0d37@intel.com>
In-Reply-To: <f42a5b92-63b1-4adb-bbc6-4d479dbb0d37@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH0PR11MB5692:EE_
x-ms-office365-filtering-correlation-id: dd2593bd-a64e-4908-f836-08dbaf7e1671
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KTtoP48WhOD1ehWBMMfcUFAbpDtBcg8YALEjD05brmzyZOxwctQ2xL87cGt0EfRmWGnras1fsIGaLuK4d4zgZkVoP4z7qKwxGuigv11D1CYUbOC3h4C5xla2pShmo6SEGD6KP/XYUkAiy6VEO/o0WR/QW7b81Cx0Odc/FeinMadtrfxJVjwOoMiCiUhUhZzRNDhSGkH7Zusw9WPOvNNb0sKwm6Q97Jn305QV25bH8QeLntz6sx/NQevYZ/64DzAlGcpKD0qz1Ge/+3rmL25cAt9gT9eYZXj7RrI/a1N4kuiWL5rirGW/JMEL0knNpgOxFpMwWSeDO7EyGIkDF424MB+uP3oOz+NsybEgJAr4p86YU56Us18to38/i9Slyo7MAmgLw6VXX0TES2WYnMrPCAjYJUaizOZ6+VLVegjwepjr0+YMyg+zN45lG42K3JjP8cyZVGgV0E96/eNl67gRoeb23MOxHSHk7SnHofHsQNaX4ymAzsxgQzfi5RIDWpmIgv/IJDCTe/Q069x2l9g/nG43+vb5zQAHP30FC9ca3qfLafdHkRrsVY5JMnw+abDdVGAO9HB1NEfGDhmmOthdbVq0g4SpdT5WEPB7jXY7A5TFu11mnufWAY0G7HqRLOhh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199024)(186009)(1800799009)(8936002)(8676002)(478600001)(4326008)(66476007)(66946007)(66446008)(110136005)(66556008)(76116006)(5660300002)(55016003)(83380400001)(2906002)(71200400001)(41300700001)(33656002)(316002)(64756008)(52536014)(86362001)(6506007)(53546011)(7696005)(9686003)(82960400001)(122000001)(26005)(38100700002)(38070700005)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mm9mMHRzMTg3NFdWb2F5emE0ak5DQ09oVFlDN3pOV3ByYzRmVE43Ym1qNlVT?=
 =?utf-8?B?NDk2ZzYrZVg5UW5sNVdDOE5xS3dGSDlidWFhcmUyYmxBc0lrYjJPK0JPcUZD?=
 =?utf-8?B?SnVNaEtkVThLcmVRQUZaL0FieWJQeUcwcTBlSkQyZUduUyt3bjVMS3dRYzZw?=
 =?utf-8?B?bE0yTFRpSDR6N1I4UXRjeklJblp0RFhWaGhDMlFZclUxTm9TQW9JazJHSXVP?=
 =?utf-8?B?YXJ0OC9MZEExbWJuRHBDcDFiUEg4WE4xcFYwOUlzZnAwM3d6M2l4TitScmVI?=
 =?utf-8?B?OEQzOVRybWM2VlYxYjJ0V1JGL09zdmh4dnFnMmRscWNaWXdpQlBwK0o0Vml2?=
 =?utf-8?B?NHl0azJtY3laemljMklsWmdHRkpYamJVeS8vQ2xyNUdPWWZOMk9DSElnZmZa?=
 =?utf-8?B?SmFQUE5yWjQvQmh0UUsrM0sra1g0bFQ3WGRSUVhRTEh3TTJPbURsUGd5cGdo?=
 =?utf-8?B?b2hnZFVreG5DaXpmeWRWbW9kMnFDK3Y3SE1OMkFnUERncjdTbFNBdm9IU0FG?=
 =?utf-8?B?THlzYisvU2RtcHhsSU9UL2dya0lZbkgvODNzam9GaG9ibGlNdXlEUkkzeXFv?=
 =?utf-8?B?M1FUaFlsTVMxdTl2c0NBbmRsck1vQWFtT3NUTGlxUHVBY0VSZkVEZ2o2QStN?=
 =?utf-8?B?UitlUTJ2VzlCYzBCZ0xQcjF5aC9KZ0drSE50dGtmMmhUdll0SXluOFBWbDNF?=
 =?utf-8?B?dUl6MjZLM1NvNDQ4MWlKZjVIS3pxTytwYXlYQjByeVFZS01FVjFVdXRBeTc5?=
 =?utf-8?B?NEc0OG1JYTA0ZUxZSGNFZEI3ek5NcVVxZmVYUDZ0Y1Jxc1lodklYZXBuK2Jy?=
 =?utf-8?B?OHhLeUFLQTREbWx6Uks5TmhTcnZWbGoxWWxveHVxMm9tUnhqdnQ0UUlqWHRw?=
 =?utf-8?B?bGY4VTJDZi84aXRhcFBjSURNcmdjNXhpbk90Z3pOYXREazNJZEdwZzYxWWhP?=
 =?utf-8?B?UTU1bkFGc1RKMDcrRGI3Z2NPd1g4YVBNS1FuMFl2dGdDd1FnM2VUTmZqMWJL?=
 =?utf-8?B?TGZGaUtzdjlTdmI3bjhXSHJlODJvZjV1TERudk4wK3BUZ0dWcitxMlE0MGRl?=
 =?utf-8?B?d1c4RUFqT0NVbkpmR0tjZi9CZy9Na1QwWDI4U1E1NXdTM3NXOTVMMGJlSmpS?=
 =?utf-8?B?KzhGdlprajEyWGVTMWg2NW1mRlhzTVp2TE84WG1aRFdjSkZrTTJOVmlYbFpo?=
 =?utf-8?B?QWFteFI4eTN4MVJ4Ny96RWQ3d1dZWjl4MU9GOUxrRG1ScnJ2eUROOHpvQWxS?=
 =?utf-8?B?aHVEc1NBc3drRkVNNVhvUWN6ZndBMlNIa1dkdlFUbGdYTWxsTmx2Sm9Ib0dr?=
 =?utf-8?B?TFh2QXBOV08rRmFMcDY5MkFseXN1RzE3TGp2bkQ0eWFzQjMyTEQ2YUFjYkYr?=
 =?utf-8?B?bkdBYW9hbG1HL3I3RDZCQk5sZzZ2eVltN0I4MU4vT1FkN3o3U0REUG1lY0J1?=
 =?utf-8?B?WkgrNXZJaGNnL000eG5jT3h0OEowTDFvZFNYVTRhNHVYWTJVWm9EOU9lMytO?=
 =?utf-8?B?RzFtcXJWc1EveDd3YTF1TEhFVGltNWpvRVU1TEptbmhvVHJFQUFuRTBwcjFR?=
 =?utf-8?B?Q2lsMFRkZXpTdUZTaDdPdDJDMFo1ZFJCUzJ2UzNUbGxDSmZzdVFXT25SbldH?=
 =?utf-8?B?YTdSUVBBcU54TDJnM3Z2L2QzaWxtSU9mKzBiR00wbmlsQ0EraC9HbERkeE9p?=
 =?utf-8?B?WC9pT1l5WDkzdjVaNmxqMTVEb2xpY2ltMmF0ZkxsVzlyU0VhbnVlREYzYWl1?=
 =?utf-8?B?NER2bytZNGRyRWpkSFY5NkJ0aU95YU44OW0wSGNzSW1DekUveGc2bGR4V1pL?=
 =?utf-8?B?dS9zNGx4eXdzaDVQR3YyUUZoSzFjbksvanNYU1A0RUZLc0xtMkdxUXE2ckR6?=
 =?utf-8?B?bW1kMi9RaSt6b1REL1ovbDljZkhKMVlidzRsQStHZ0ltTFJpbExKdDlRTkVh?=
 =?utf-8?B?c0NWd3R3dCtNSEsxRGZTK1NoQ1ROajJlQlFjcVZTYkNJMjdYbUg2SGRCUnZn?=
 =?utf-8?B?aGRjZW9xckdUdXEzTEw2bGhGZGpPbFdvN0xmdGYvUG5NaXBRdnNQZVRBRXpI?=
 =?utf-8?B?V3d0MUl2bnlqSmpBNFE2ZWlqRzJZNnVIQWVmUW1EZzZxZlRJZkdtZVJMSkZD?=
 =?utf-8?Q?YaucjoCL6W+eSM0W8gkM9JmFT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2593bd-a64e-4908-f836-08dbaf7e1671
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 08:40:28.0030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Cf3XSvNgLZs6OmUbgja35Myt3VvsWriaO20+kXC36t6Ufm8AUFyP+JqlYS4VBOOfP3C3aKuy/es11w2OSRsDaWc8su/xaxnMCjKzPiTe54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5692
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/7] drm/xe: Track page table memory usage
 for client
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2hpbWlyYXksIEhpbWFs
IFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBTZXB0ZW1iZXIgNiwgMjAyMyAzOjI1IFBNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRl
amFzLnVwYWRoeWF5QGludGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gQ2M6IElkZGFtc2V0dHksIEFyYXZpbmQgPGFyYXZpbmQuaWRkYW1zZXR0eUBpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS83XSBkcm0veGU6IFRyYWNrIHBhZ2UgdGFibGUg
bWVtb3J5IHVzYWdlIGZvciBjbGllbnQNCj4gDQo+IA0KPiBPbiAzMS0wOC0yMDIzIDE0OjM1LCBU
ZWphcyBVcGFkaHlheSB3cm90ZToNCj4gPiBBY2NvdW50IHBhZ2UgdGFibGUgbWVtb3J5IHVzYWdl
IGluIHRoZSBvd25pbmcgY2xpZW50IG1lbW9yeSB1c2FnZQ0KPiA+IHN0YXRzLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jIHwgNCArKystDQo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyB8IDkgKysrKysrKystDQo+ID4gICAyIGZpbGVz
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcHQuYw0KPiA+IGluZGV4IDU3MDk1MThlMzE0Yi4uOGRmODMyNDFjNWZlIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3B0LmMNCj4gPiBAQCAtNyw2ICs3LDcgQEANCj4gPg0KPiA+ICAgI2luY2x1ZGUg
InhlX2JvLmgiDQo+ID4gICAjaW5jbHVkZSAieGVfZGV2aWNlLmgiDQo+ID4gKyNpbmNsdWRlICJ4
ZV9kcm1fY2xpZW50LmgiDQo+ID4gICAjaW5jbHVkZSAieGVfZ3QuaCINCj4gPiAgICNpbmNsdWRl
ICJ4ZV9ndF90bGJfaW52YWxpZGF0aW9uLmgiDQo+ID4gICAjaW5jbHVkZSAieGVfbWlncmF0ZS5o
Ig0KPiA+IEBAIC0xOTUsNyArMTk2LDggQEAgc3RydWN0IHhlX3B0ICp4ZV9wdF9jcmVhdGUoc3Ry
dWN0IHhlX3ZtICp2bSwgc3RydWN0DQo+IHhlX3RpbGUgKnRpbGUsDQo+ID4gICAJcHQtPmJvID0g
Ym87DQo+ID4gICAJcHQtPmxldmVsID0gbGV2ZWw7DQo+ID4gICAJcHQtPmJhc2UuZGlyID0gbGV2
ZWwgPyAmYXNfeGVfcHRfZGlyKHB0KS0+ZGlyIDogTlVMTDsNCj4gPiAtDQo+ID4gKwlpZiAodm0t
PnhlZikNCj4gPiArCQl4ZV9kcm1fY2xpZW50X2FkZF9ibyh2bS0+eGVmLT5jbGllbnQsIHB0LT5i
byk7DQo+ID4gICAJWEVfV0FSTl9PTihsZXZlbCA+IFhFX1ZNX01BWF9MRVZFTCk7DQo+ID4NCj4g
PiAgIAlyZXR1cm4gcHQ7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiBpbmRleCBmNWY4MzJjOGVkNDIu
Ljg0ZmIxMDY5ZmRiYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0u
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gQEAgLTE4LDYgKzE4
LDcgQEANCj4gPg0KPiA+ICAgI2luY2x1ZGUgInhlX2JvLmgiDQo+ID4gICAjaW5jbHVkZSAieGVf
ZGV2aWNlLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV9kcm1fY2xpZW50LmgiDQo+ID4gICAjaW5jbHVk
ZSAieGVfZXhlY19xdWV1ZS5oIg0KPiA+ICAgI2luY2x1ZGUgInhlX2d0LmgiDQo+ID4gICAjaW5j
bHVkZSAieGVfZ3RfcGFnZWZhdWx0LmgiDQo+ID4gQEAgLTE5ODAsNiArMTk4MSw3IEBAIGludCB4
ZV92bV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gdm9pZCAqZGF0YSwN
Cj4gPiAgIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHRvX3hlX2RldmljZShkZXYpOw0KPiA+ICAg
CXN0cnVjdCB4ZV9maWxlICp4ZWYgPSB0b194ZV9maWxlKGZpbGUpOw0KPiA+ICAgCXN0cnVjdCBk
cm1feGVfdm1fY3JlYXRlICphcmdzID0gZGF0YTsNCj4gPiArCXN0cnVjdCB4ZV90aWxlICp0aWxl
Ow0KPiA+ICAgCXN0cnVjdCB4ZV92bSAqdm07DQo+ID4gICAJdTMyIGlkLCBhc2lkOw0KPiA+ICAg
CWludCBlcnI7DQo+ID4gQEAgLTIwNTgsNyArMjA2MCwxMiBAQCBpbnQgeGVfdm1fY3JlYXRlX2lv
Y3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ID4gdm9pZCAqZGF0YSwNCj4gPg0KPiA+ICAg
CWFyZ3MtPnZtX2lkID0gaWQ7DQo+ID4gICAJdm0tPnhlZiA9IHhlZjsNCj4gPiAtDQo+ID4gKwkv
KiBSZWNvcmQgQk8gbWVtb3J5IGZvciBWTSBwYWdldGFibGUgY3JlYXRlIGFnaW5zdCBjbGllbnQg
Ki8NCj4gPiArCWZvcl9lYWNoX3RpbGUodGlsZSwgeGUsIGlkKSB7DQo+ID4gKwkJaWYgKCF2bS0+
cHRfcm9vdFtpZF0pDQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsJCXhlX2RybV9jbGllbnRfYWRk
X2JvKHZtLT54ZWYtPmNsaWVudCwgdm0tPnB0X3Jvb3RbaWRdLQ0KPiA+Ym8pOw0KPiANCj4gY2Fu
IGJlIGNoYW5nZWQgdG8NCj4gDQo+IGlmICh2bS0+cHRfcm9vdFtpZF0pDQo+IAl4ZV9kcm1fY2xp
ZW50X2FkZF9ibyh2bS0+eGVmLT5jbGllbnQsIHZtLT5wdF9yb290W2lkXS0+Ym8pOw0KPiANCg0K
U3VyZS4NCg0KPiBCUg0KPiBIaW1hbA0KPiANCj4gPiArCX0NCj4gPiAgICNpZiBJU19FTkFCTEVE
KENPTkZJR19EUk1fWEVfREVCVUdfTUVNKQ0KPiA+ICAgCS8qIFdhcm5pbmc6IFNlY3VyaXR5IGlz
c3VlIC0gbmV2ZXIgZW5hYmxlIGJ5IGRlZmF1bHQgKi8NCj4gPiAgIAlhcmdzLT5yZXNlcnZlZFsw
XSA9IHhlX2JvX21haW5fYWRkcih2bS0+cHRfcm9vdFswXS0+Ym8sDQo+ID4gWEVfUEFHRV9TSVpF
KTsNCg==
